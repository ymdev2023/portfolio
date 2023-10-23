import 'package:appoment/data/member.dart';
import 'package:appoment/library/kakaomap_webview_custom/kakao_latlng.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoMapController {
  final WebViewController _controller;

  KakaoMapController(this._controller);

  void setCenter({required double latitude, required double longitude}) async {
    await _controller.runJavascript(
        'map.setCenter(new kakao.maps.LatLng($latitude, $longitude));');
  }

  void setLevel({required int level, bool animate = false}) async {
    await _controller
        .runJavascript('map.setLevel($level, {animate: $animate});');
  }

  Future<int> getLevel() async {
    return int.parse(await _controller.runJavascriptReturningResult(
        _toFunction('var level = map.getLevel(); return level;')));
  }

  void panTo({required double latitude, required double longitude}) async {
    await _controller.runJavascript(
        'map.panTo(new kakao.maps.LatLng($latitude, $longitude));');
  }

  void addMarker(Marker marker) async {
    final imageOption = marker.imageUrl == null ? '' : 'image: markerImage';

    await _controller.runJavascript('''
      var imageSrc = '${marker.imageUrl}',    
      imageSize = new kakao.maps.Size(${marker.width}, ${marker.height}),
      imageOption = {offset: new kakao.maps.Point(27, 69), shape: "circle"};
      
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
      markerPosition = new kakao.maps.LatLng(${marker.latLng.lat}, ${marker.latLng.lng});

      var ${_getMarkerName(marker.id)} = new kakao.maps.Marker({
          position: markerPosition, 
          $imageOption 
      });
      
      ${_getMarkerName(marker.id)}.setMap(map);
      
      kakao.maps.event.addListener(${_getMarkerName(marker.id)}, 'click', function(){
        onTapMarker.postMessage(BigInt(${marker.id}).toString());

      });
    ''');
  }

  void updateMarkerPosition(String markerId, KakaoLatLng latLng) async {
    await _controller.runJavascript(
        '${_getMarkerName(markerId)}.setPosition(new kakao.maps.LatLng(${latLng.lat}, ${latLng.lng}));');
  }

  void registerClickEvent() async {
    await _controller.runJavascript('''
    kakao.maps.event.addListener(map, 'click', function(event) {
        const latlng = event.latLng;
        const json = {
          lat: latlng.getLat(),
		      lng: latlng.getLng(),
        };
		    onMapClicked.postMessage(JSON.stringify(json));
		  });
	  ''');
  }

  String _toFunction(String javascriptCode) {
    return '(function() { $javascriptCode })();';
  }

  String _getMarkerName(String markerId) => 'marker_$markerId';
}

class Marker {
  final String id;
  final KakaoLatLng latLng;
  final String? imageUrl;
  final int width;
  final int height;

  Marker({
    required this.id,
    required this.latLng,
    this.imageUrl,
    required this.width,
    required this.height,
  });

  Marker.from({
    required Member member,
    required double latitude,
    required double longitude,
  }) : this(
          id: member.id,
          latLng: KakaoLatLng(lat: latitude, lng: longitude),
          imageUrl: member.profileImageUrl,
          width: 48,
          height: 48,
        );
}

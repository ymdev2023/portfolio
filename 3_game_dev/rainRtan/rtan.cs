using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rtan : MonoBehaviour
{
    public float direction = 1.0f;
    public float toward = 1.0f;
    public float speed = 5.0f; // 수정된 속도 값 (초당 10.0f 거리를 이동하도록 설정)

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            toward *= -1;
            direction *= -1;
        }
        if (transform.position.x > 2.8f)
        {
            direction = -0.1f * speed; // direction 값 조정
            toward = -1.0f;
        }

        if (transform.position.x < -2.8f)
        {
            direction = 0.1f * speed; // direction 값 조정
            toward = 1.0f;
        }

        transform.localScale = new Vector3(toward, 1, 1);
        transform.position += new Vector3(direction * Time.deltaTime, 0, 0);
    }
}

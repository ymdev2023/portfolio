using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.Linq;

public class gameManager : MonoBehaviour
{
    public Text timeText;
    public GameObject endText;
    public GameObject card;
    float time;
    public static gameManager I;
    public GameObject firstCard;
    public GameObject secondCard;
    public AudioClip match;
    public AudioSource audioSource;
    void Awake()
    {
        I = this;
    }

    // Start is called before the first frame update
    void Start()
    {
        int[] rtans = { 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, };
        rtans = rtans.OrderBy(item => Random.Range(-1.0f, 1.0f)).ToArray();
        for (int i = 0; i<16; i++)
        {


            GameObject newCard =  Instantiate(card);
            newCard.transform.parent = GameObject.Find("cards").transform;

            float x = (i / 4) * 1.4f - 2.1f;
            float y = (i % 4) * 1.4f - 3.0f;
            newCard.transform.position = new Vector3(x, y, 0);

            string rtanName = "cat" + rtans[i].ToString();
            newCard.transform.Find("front").GetComponent<SpriteRenderer>().sprite = Resources.Load<Sprite>(rtanName);
        }
    }

    // Update is called once per frame
    void Update()
    {
        time += Time.deltaTime;
        timeText.text = time.ToString("N2");

        if(time > 29.9f)
        {
            Invoke("GameEnd", 0.1f);
        }
    }

    public void isMatched()
    {
        string firstCardImage = firstCard.transform.Find("front").GetComponent<SpriteRenderer>().sprite.name;
        string secondCardImage = secondCard.transform.Find("front").GetComponent<SpriteRenderer>().sprite.name;

        if (firstCardImage == secondCardImage)
        {
            audioSource.PlayOneShot(match);
            firstCard.GetComponent<card>().destroyCard();
            secondCard.GetComponent<card>().destroyCard();

            int cardsLeft = GameObject.Find("cards").transform.childCount;
            if (cardsLeft == 2)
            {
                Invoke("GameEnd", 1f);
            }
        }
        else
        {
            firstCard.GetComponent<card>().closeCard();
            secondCard.GetComponent<card>().closeCard();

        }
        firstCard = null;
        secondCard = null;
    }
    void GameEnd()
    {
        endText.SetActive(true);
        Time.timeScale = 0f;
    }
}

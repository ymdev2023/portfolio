using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rain : MonoBehaviour
{
    int type;
    float size;
    int score;

    // Start is called before the first frame update
    void Start()
    {
        float x = Random.Range(-2.7f, 2.7f);
        float y = Random.Range(3f, 5f);
        transform.position = new Vector3(x, y, 0);

        type = Random.Range(1, 5);

        if (type == 1)
        {
            size = 1.2f;
            score = 3;
            GetComponent<SpriteRenderer>().color = new Color(246 / 255f, 200 / 255f, 168 / 255f, 255 / 255f);
        }
        else if (type ==2)
        {
            size = 1.0f;
            score = 2;
            GetComponent<SpriteRenderer>().color = new Color(158 / 255f, 217 / 255f, 205 / 255f, 255 / 255f);
        }
        else if(type==3)
        {
            size = 0.8f;
            score = 1;
            GetComponent<SpriteRenderer>().color = new Color(213 / 255f, 196 / 255f, 224 / 255f, 255 / 255f);
        }
        else 
        {
            size = 0.8f;
            score = -5;
            GetComponent<SpriteRenderer>().color = new Color(61 / 255f, 68 / 255f, 67 / 255f, 255 / 255f);
        }
        transform.localScale = new Vector3(size, size, 0);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnCollisionEnter2D(Collision2D coll)

      
    {
        if(coll.gameObject.tag == "ground")
        {
            Destroy(gameObject);
        }

        if(coll.gameObject.tag == "rtan")
        {
            Destroy(gameObject);
            GameManager.I.addScore(score);
        }
    }
}

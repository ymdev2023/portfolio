using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    public GameObject rain;
    public GameObject panel;
    public static GameManager I;
    public Text scoreText;
    public Text timeText;
    int totalScore;
    float limit = 5f;

    void Awake()
    {
        I = this;
    }
    // Start is called before the first frame update
    void Start()
    {

        InvokeRepeating("makeRain", 0, 1f);
        initGame();
    }

    // Update is called once per frame
    void Update()
    {
        limit -= Time.deltaTime;
        if(limit <0)
        {
            Time.timeScale = 0.0f;
            panel.SetActive(true);
            limit = 0.0f;
            
                }
        timeText.text = limit.ToString("N2");
    }

    void makeRain()
    {
        Instantiate(rain);
    }

    public void addScore(int score)
    {
        totalScore += score;
        scoreText.text = totalScore.ToString();
    }

    public void retry()
    {
        SceneManager.LoadScene("MainScene");
    }

    void initGame()
    {
        Time.timeScale = 1.0f;
        totalScore = 0;
        limit = 30f;
    }
}

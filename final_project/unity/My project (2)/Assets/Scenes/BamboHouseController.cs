using System;
using UnityEngine;
using System.Globalization;

public class BamboHouseController : MonoBehaviour
{
    [SerializeField]
    private Vector3 rotateAmount;
    [SerializeField]
    private float zoomSpeed = 0.1f;

    // Start is called before the first frame update
    void Start()
    {
        rotateAmount = Vector3.zero;
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(rotateAmount * Time.deltaTime * 120);
    }

    // Method to set rotation and zoom speed called from Flutter
    public void SetSpeed(string message)
    {
        if (float.TryParse(message, NumberStyles.Any, CultureInfo.InvariantCulture, out float value))
        {
            rotateAmount = new Vector3(value, value, value);
            zoomSpeed = value * 0.1f; // Adjust zoom speed based on rotation speed
        }
        else
        {
            Debug.LogError("Failed to parse speed: " + message);
        }
    }

    // Method to zoom in
    public void ZoomIn()
    {
        transform.localScale += Vector3.one * zoomSpeed;
    }

    // Method to zoom out
    public void ZoomOut()
    {
        transform.localScale -= Vector3.one * zoomSpeed;
    }
}

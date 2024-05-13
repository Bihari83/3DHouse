using System;
using UnityEngine;
using System.Globalization;

public class BamboHouseController : MonoBehaviour
{
    [SerializeField]
    Vector3 rotateAmount;

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

    // Method to set rotation speed called from Flutter
    public void SetRotationSpeed(string message)
    {
        if (float.TryParse(message, NumberStyles.Any, CultureInfo.InvariantCulture, out float value))
        {
            rotateAmount = new Vector3(value, value, value);
        }
        else
        {
            Debug.LogError("Failed to parse rotation speed: " + message);
        }
    }
}

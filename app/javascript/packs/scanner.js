import * as ScanditSDK from "scandit-sdk";

ScanditSDK.configure("AWvBzgIkICbOHM7G6AAjOZo2+u5sIIwq2gA6kt4+q/3JdHPtYxfs5sYG3jeYWbvoMVoAgOMeQQclGBOa3HallhRINCJvVVgjCGXxS9BlWlcNCv3PBBgURSA4YEf5EvkpD83fkyNYvy4aZp/TKx0sn/+WPfhfOx2VUr31vm+kg/kiofQxc/tZqQndgFbMWtNxB/irS/SjF923s5dRZRAtfbXScTpozyw6VMb7e3xPqGoQM20kF88dn3uy5ZJtliKIlQJAx6h6Gf3k1RRE5qzRyHOKTWz6QDvGhfkyisFTGrP0LWb/MfcH4x9NexPApq5tlhBRMsbwPi3GLIUcwb55+DVqxONCDyngXfHDPzq/6mCMZWch4fmfHjoJQCyRIAV5+m5mj/ALdbv43ZNIs4GGKy9wW8Jvpc8sN9zdBljZx3cqKAiuEWWFaLSwYAvJV9ZMQpG7Juz8R0BZ6vRhHjrxh+RjgC26x5eIiN6jh/S5KF4TAaWtD+GEgt6H3GBzHwFT+7yyyJ+WXgGesItz8NfzXIQtbIYPW/6OsM10reQ7pBVle8GNZ8tOqGa4T96rc/Rfunr+CBKY9n/gjdjIBKlmgOHsOfS3uMXwrw4BIu/EsILTVqFFAnHD0qBwrzaa4MdVdJL76BlCvUKHBwcxMjk5DB8jlRfaalh+F/6r15XRNfFegsMXMexM77GPElIHYD1SoPdw89xgwR0z48LDRnJPbhVrLazlgAYiTJBONru/MX2WOR/lAF0fAt+tS6qzoU/64zykI9pHZRJUAzT/Jjw2a0/gHsrtIgPmDduQaifwSA==", {
  engineLocation: "https://cdn.jsdelivr.net/npm/scandit-sdk@5.x/build/",
})
  .then(() => {
    return ScanditSDK.BarcodePicker.create(document.getElementById("scandit-barcode-picker"), {
      // enable some common symbologies
      scanSettings: new ScanditSDK.ScanSettings({ enabledSymbologies: ["ean8", "ean13", "upca", "upce"] }),
    });
  })
  .then((barcodePicker) => {
    // barcodePicker is ready here, show a message every time a barcode is scanned
    barcodePicker.on("scan", (scanResult) => {
      alert(scanResult.barcodes[0].data);
    });
  });


  ScanditSDK.BarcodePicker.create(document.getElementById("scandit-barcode-picker"), {
    playSoundOnScan: true,
    vibrateOnScan: true,
  }).then(function (barcodePicker) {
    // barcodePicker is ready here to be used (rest of the tutorial code should go here)
    const scanSettings = new ScanditSDK.ScanSettings({
      enabledSymbologies: [ScanditSDK.Barcode.Symbology.EAN8, ScanditSDK.Barcode.Symbology.EAN13],
      codeDuplicateFilter: 1000, // Minimum delay between duplicate results
    });
    barcodePicker.applyScanSettings(scanSettings);

    barcodePicker.on("scan", (scanResult) => {
      alert(
        scanResult.barcodes.reduce((string, barcode) => {
          return string + `${ScanditSDK.Barcode.Symbology.toHumanizedName(barcode.symbology)}: ${barcode.data}\n`;
        }, "")
      );
    });
  });

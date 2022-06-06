import * as ScanditSDK from "scandit-sdk";



ScanditSDK.configure("AbBR+hEkM6NjGVMLViXUEBwD7BZcGhzMMkdSMH4NS1zgblpZQzH8/2YuvtsHRyyDWlXQtnBamXsGF9mRHzowEwMLEk4rbFRzJDsfk1F1x1z1MF901lHMydZocKePLV/P9i2m9fQ51GB4Q9UP4lxt2OtxZIgTVMg9uB76NsX6wMtdrWU8zsMMpzhZpLhin7lNNKQs1YAW1+wRbW7D4s1IiBlpDwRkk8O26OyAd05Q7JDucAz5Dt4NKUP7NtrpVeugRmC2IKTyZgSKd2ZFV8kz7gFhd926U4Fn2rxGiUuzXI1/1PaChsqlEtHW7Yj0dsmRt4Eh08rn5a3qjciyG8QdHXrIBwoJUZ9PC+AhyvOm+pYQLy15XEsEf2IkSkZG4hNTD8pA4V35i7zGrbrYF8cCLeUKt0vAB6bJguLftDWztTnDPImdNkLzGzbsfGteD3XemogzzVdANbXOrnb5H47sGcmCohr67cVND03J8S3YeKS18pj6pRVFd7NzSLVWvdJIZyqwhL7aZkrGB8HeQw9NjCQoKZQPv8Mqhsbu9drE7j0gEqGQQ4k+qD/45W6tqyK+AkYK3ZJ2tiQJhQ0MHKylULjDtIOiqFTX6MxnWNAMaZoAn9XpNvgz+CmTUNZNyZFg1ydjYaj0ZxEKaGyqNXtGxGYWmMq7x7l6TrLeRxZtPH5O/YQAlgCOc2WLASeDap/ILC/k/U4GkymdLokVqYSWiqvp2scgpL7lNGtktjoQiUNu454YNLFVbHpLmEPgx4B1TdQFgWKXeyErgcRQmwc2alxSMo8QDeaOVZ7EHbIe5KHtejpn4o+RRkzKQi/S02XN89lnDuoKWWo=", {
  engineLocation: "https://cdn.jsdelivr.net/npm/scandit-sdk/build",
}).then(() => {
  // ... ready to instantiate a BarcodePicker or Scanner here
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
      console.log(scanResult.barcodes[0].data);
      window.location.assign(`/products/new?scan=${scanResult.barcodes[0].data}`)
      // Rails.ajax({
      //   type: "GET",
      //   url: "/products/new",
      //   data: { scan: scanResult.barcodes[0].data }
      // })
      // const scanner = document.getElementById("scanner")
      // scanner.insertAdjacentHTML("beforeend", scanResult.barcodes[0].data)
    });

  });

});

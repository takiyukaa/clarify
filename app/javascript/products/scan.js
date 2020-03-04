ScanditSDK.BarcodePicker.create(document.getElementById("scandit-barcode-picker"), {
  playSoundOnScan: true,
  vibrateOnScan: true
}).then(function(barcodePicker) {
  // barcodePicker is ready here to be used (rest of the tutorial code should go here)
});

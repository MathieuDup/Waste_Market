import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    pourcentage: Number
  }

  connect() {
    this.initGauge()
  }

  initGauge() {
    let color
    if (this.pourcentageValue <= 25) {
      color = "#FF6363"
    } else if (this.pourcentageValue <= 50) {
      color =  "#00C897"
    } else {
      color = "#125B50"
    }

    let gaugeOptions = {
      hasNeedle: true,
      needleColor: 'gray',
      needleUpdateSpeed: 1000,
      arcColors: [color, 'lightgray'],
      arcDelimiters: [this.pourcentageValue],
      rangeLabel: ['0', '100'],
      centralLabel: `${this.pourcentageValue}%`,
      }

    GaugeChart.gaugeChart(this.element, 150, gaugeOptions).updateNeedle(this.pourcentageValue)

  }
}

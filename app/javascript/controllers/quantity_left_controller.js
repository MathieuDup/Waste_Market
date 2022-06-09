import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "quantity", "price" ]

  test() {
    const active = this.quantityTargets.find(target => target.checked === true)
  //  récupérer price du product data-value stimulus
    this.price = Number(this.element.dataset.price)
  //  calculer la décote du prix
    this.discountPrice = this.price * (parseInt(active.value, 10) / 100)
    // console.log(this.price)
    // console.log(this.price * (parseInt(active, 10) / 100))
    // console.log()
  //  insérer dans l'html de l'input price
    if (this.price > 0) {

      this.priceTargets.forEach(element => {
        element.value = Math.ceil(this.discountPrice)
      });
      // this.priceTarget.innerText = this.priceTarget.value
    }
}}

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "quantity", "price" ]

  test() {
  //  récupérer price du product data-value stimulus
    this.price = Number(this.element.dataset.price)
  //  calculer la décote du prix
    this.discountPrice = this.price * (this.quantityTarget.value / 100)
  //  insérer dans l'html de l'input price
    if (this.price > 0) {
      this.priceTarget.value = Math.ceil(this.discountPrice)
    }
}}

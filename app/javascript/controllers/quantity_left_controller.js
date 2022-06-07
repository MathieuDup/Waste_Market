import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "quantity", "price" ]

  test() {
    console.log(this.quantityTarget.value)
    //  récupérer price du product data-value stimulus
    this.price = Number(this.element.dataset.price)
    console.log(this.price)
  //  calculer la décote du prix
    this.discountPrice = this.price * (this.quantityTarget.value / 100)
  //  insérer dans l'html de l'input price
    this.priceTarget.value = this.discountPrice
  }

}

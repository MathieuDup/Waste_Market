import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { orderId: Number }
  static targets = ["popup"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "QrcodeChannel", id: this.orderIdValue },
      { received: data => this.popupTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribed to the qr code with the id ${this.orderIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the qr code")
    this.channel.unsubscribe()
  }

}

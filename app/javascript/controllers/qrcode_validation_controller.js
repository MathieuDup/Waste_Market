import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"
import Swal from 'sweetalert2'

export default class extends Controller {
  static values = { orderId: Number }
  static targets = ["popup"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "QrcodeChannel", id: this.orderIdValue },
      { received: (data) => {
          // this.popupTarget.insertAdjacentHTML("beforeend", data)
          let timerInterval
          Swal.fire({
            title: 'Congratulations!',
            html: 'Your product has been sold.',
            timer: 3000,
            timerProgressBar: true,
            didOpen: () => {
              Swal.showLoading()
              const b = Swal.getHtmlContainer().querySelector('b')
              timerInterval = setInterval(() => {
                b.textContent = Swal.getTimerLeft()
              }, 100)
            },
            willClose: () => {
              clearInterval(timerInterval)
            }
          }).then((result) => {
            /* Read more about handling dismissals below */
            if (result.dismiss === Swal.DismissReason.timer) {
              console.log('I was closed by the timer')
            }
          })
        }
      }
    )
    console.log(`Subscribed to the qr code with the id ${this.orderIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the qr code")
    this.channel.unsubscribe()
  }

}

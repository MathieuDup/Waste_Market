import { Controller } from "stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {

  static targets = ["swalform"]

  alert(event) {
    event.preventDefault();
    Swal.fire({
      icon: 'info',
      html: `<p>You're about to create a new product, are you sure ?</p>`,
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes!'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire('Congratulation', "You've just create your product !", 'success').then(() => { this.swalformTarget.submit() });
      }
    })
  }
}

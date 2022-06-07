import { Controller } from "stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {

  static targets = ["swalform"]

  alert(event) {
    event.preventDefault();
    Swal.fire({
      position: 'center',
      icon: 'success',
      title: 'Your product has been created',
      showConfirmButton: true

      //title: 'Are you sure?',
      //icon: 'success',
     // html: `<p>You're about to create a new product, are you sure ?</p>`,
      // showCancelButton: true,
      // confirmButtonColor: '#3085d6',
      // cancelButtonColor: '#d33',
      //confirmButtonText: 'Yes, create it!'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire('Congratulation', "You've just create your product !", 'success').then(() => { this.swalformTarget.submit() });
      }
    })
  }
}

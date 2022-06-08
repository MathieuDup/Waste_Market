import { Controller } from "stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {

  static targets = ["swalform"]

  alert(event) {
    event.preventDefault();
    Swal.fire({
      position: 'center',
      icon: 'success',
      title: window.location.href.includes("new") ? 'Your product has been created' : 'Your product has been edited',
      showConfirmButton: true

      //title: 'Are you sure?',
      //icon: 'success',
     // html: `<p>You're about to create a new product, are you sure ?</p>`,
      // showCancelButton: true,
      // confirmButtonColor: '#3085d6',
      // cancelButtonColor: '#d33',
      //confirmButtonText: 'Yes, create it!'
    }).then((result) => {
      if (result.isConfirmed && window.location.href.includes("new")) {
        Swal.fire('Congratulations', "You've just create your product !", 'success').then(() => { this.swalformTarget.submit() });
      } else if (result.isConfirmed && window.location.href.includes("edit")) {
        Swal.fire('Congratulations', "You've just edited your product !", 'success').then(() => { this.swalformTarget.submit() });
      }
    })
  }
}

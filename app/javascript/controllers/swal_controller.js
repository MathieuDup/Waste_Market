import { Controller } from "stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {

  static targets = ["swalform"]

  alert(event) {
    event.preventDefault();
    if (window.location.href.includes("new")) {
      Swal.fire('Congratulations', "You've just create your product !", 'success').then(() => { this.swalformTarget.submit() });
    } else if (window.location.href.includes("edit")) {
      Swal.fire('Congratulations', "You've just edited your product !", 'success').then(() => { this.swalformTarget.submit() });
    }
  }
}

import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["list", "bookmarks", "create", "destroy"]

  connect() {
    // console.log(this.bookmarksTarget)
    // console.log(this.buttonTarget)
  }

  destruction(event) {
    event.preventDefault()

    this.bookmarksTarget.classList.remove("fa-solid");
    this.bookmarksTarget.classList.add("fa-regular");

      fetch(this.destroyTarget.href, {
        method: "DELETE",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      }
      })
      .then(response => response.json())
      .then((data) => {
        this.listTarget.innerHTML = data;
      })
  }

  creation(event) {
    event.preventDefault()

    this.bookmarksTarget.classList.remove("fa-regular");
    this.bookmarksTarget.classList.add("fa-solid");

      fetch(this.createTarget.href, {
        method: "POST",
        headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
      })
        .then(response => response.json())
        .then((data) => {
          this.listTarget.innerHTML = data;
        })
  }
}

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

import { initSweetalert } from '../plugins/init_sweetalert';

//Button validate
initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "success"
});

//Button reject
initSweetalert('#sweet-alert-reject', {
  title: "A nice reject",
  text: "This is a great alert reject, isn't it?",
  icon: "success"
});

//Button cancel
initSweetalert('#sweet-alert-cancel', {
  title: "A nice cancel",
  text: "This is a alert cancel, isn't it?",
  icon: "success"
});

//Button delete
initSweetalert('#sweet-alert-delete', {
  title: "Are you sure?",
  text: "This action cannot be reversed",
  icon: "warning"
});

//Button order
initSweetalert('#sweet-alert-order', {
  title: "Are you sure?",
  text: "This is a alert order",
  icon: "success"
});

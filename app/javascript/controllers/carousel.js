import { Controller } from "@hotwired/stimulus"
import { bulmaCarousel } from "~/bulma-carousel/dist/js/bulma-carousel.js";

export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
  
    const carousels = bulmaCarousel.attach('.carousel', options);

    // To access to bulmaCarousel instance of an element
    const element = document.querySelector('#my-element');
    if (element && element.bulmaCarousel) {
      // bulmaCarousel instance is available as element.bulmaCarousel
    }
  }
}
import { Controller } from "@hotwired/stimulus"
import bulmaCarousel from "bulma-carousel";

export default class extends Controller {
  connect() {
    let options = {
      initialSlide: 0,
      slidesToShow: 3,
      slidesToScroll: 1,   
      loop: true, 
      navigationSwipe: true,
      effect: "translate"
    }
    const carousels = bulmaCarousel.attach('.carousel', options); 
    // To access to bulmaCarousel instance of an element
    // const element = document.querySelector('#my-element');
    
    // if (element && element.bulmaCarousel) {
    //   // bulmaCarousel instance is available as element.bulmaCarousel
    // }
  }
}
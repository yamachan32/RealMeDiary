function show_images() {
  $('.slider').slick({
    prevArrow: '<button class="slide-arrow prev-arrow"></button>',
    nextArrow: '<button class="slide-arrow next-arrow"></button>',
    dots: true,
  });
};

window.addEventListener('load', show_images);
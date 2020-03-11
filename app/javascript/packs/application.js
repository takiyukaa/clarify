import "bootstrap";

$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});

import { accordion } from '../components/accordion';
import { initSelect2 } from '../components/init_select2';

initSelect2();
accordion();

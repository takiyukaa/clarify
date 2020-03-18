import "bootstrap";
import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;
import 'owl.carousel';

$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});

import { accordion } from '../components/accordion';
import { initSelect2 } from '../components/init_select2';
import { initSelect3 } from '../components/init_select2';

initSelect2();
initSelect3();
accordion();

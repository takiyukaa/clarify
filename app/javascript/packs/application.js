import "bootstrap";

$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});



import { initSelect2 } from '../components/init_select2';

initSelect2();

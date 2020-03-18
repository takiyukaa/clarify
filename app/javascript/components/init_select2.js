import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    multiple: true
  });
};

const initSelect3 = () => {
  $('.select3').select2();
};


export { initSelect2 };
export { initSelect3 };

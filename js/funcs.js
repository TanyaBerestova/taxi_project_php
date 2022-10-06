$(document).ready(function($) {
  var list_target_id = 'list-target'; //first select list ID
  var list_select_id = 'list-select'; //second select list ID
  sels = document.getElementsByTagName('select');
  sels [0].id = list_select_id;
  sels [1].id = list_target_id;
});

function funcs() {
  var selectvalue = $('#list-select').val();
  $.ajax({url: 'php/get_cars.php?svalue='+selectvalue,
    success: function(output) {
      obj = JSON.parse(output);
      str = "";
      for (key in obj) {
        str = str + "<option value='" + key + "'>" + obj[key] +"</option>";
      }
      $('#list-target').html(str);
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(xhr.status + " "+ thrownError);
    }
  });
}
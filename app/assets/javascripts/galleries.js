$(document).ready(function(){
  $("#gallery_type").on("change", function(){
    if($(this).val() == "GalleryFolder"){
      $("#filebrowser").hide()
    }else{
      $("#filebrowser").show()
    }
  })

});

function updateSelectedItems(){
  var ids = []
    $.each($("input[type=checkbox]:checked"),function(c){
      ids.push($(this).attr('id').split("select_")[1])
    });
    if(ids.length > 0){
      $("#gallery_ids").val(ids)
      return true;
    }else{
      return false;
    }
}
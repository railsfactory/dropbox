$(document).ready(function(){
  $("#gallery_type").on("change", function(){
    if($(this).val() == "GalleryFolder"){
      $("#filebrowser").hide()
    }else{
      $("#filebrowser").show()
    }
  })

  $("#delete_galleries").click(function(){
    var ids = []
    $.each($("input[type=checkbox]:checked"),function(c){
      ids.push($(this).attr('id').split("select_")[1])
    });
    if(ids.length > 0){
      $.ajax({
        url: '/galleries/delete_items/' + ids,
        type: 'DELETE',
        success: function(result) {
           location.reload();
        }
      });
    }
  })
});
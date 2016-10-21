$(document).ready(function(){
  $("#gallery_type").on("change", function(){
    if($(this).val() == "GalleryFolder"){
      $("#filebrowser").hide()
    }else{
      $("#fileborwser").show()
    }
  })
});
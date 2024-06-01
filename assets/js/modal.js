export var Modal = {
   modal: function() {
      // Get the modal
      var modal = document.getElementById('imageModal');
      var vidModal = document.getElementById('videoModal');

      // Get the image and insert it inside the modal - use its "alt" text as a caption
      //var img = document.getElementById(id)
      var modalImg = document.getElementById("img01");
      var modalVid = document.getElementById("vid01");
      var modalVidSrc = document.getElementById("vid01src");
      var captionText = document.getElementById("caption");
      document.onclick = function(){
         var x = event.clientX, y = event.clientY,
         elem = document.elementFromPoint(x, y);
         // close (hide) the modal if user clicks anywhere
         // TODO: this isn't that good IMO, need to check how others do it
         if (modal.style.display != "none" || (vidModal.style.display != "none")) {
            modal.style.display = "none";
            vidModal.style.display = "none";
            modalVid.pause();
         }
         // Open image modal if user clicks on an image
         else if (elem.getAttribute('type') == "img") {
            modal.style.display = "block";
            modalImg.src = elem.getAttribute('full');
            captionText.innerHTML = elem.alt;
         }
         // Open video modal if user clicks on a video
         else if (elem.getAttribute('type') == "video") {
            vidModal.style.display = "block";
            modalVidSrc.setAttribute('src', elem.getAttribute('full'));
            captionText.innerHTML = elem.alt;
            // Need to load in order to change the source
            modalVid.load();
            modalVid.play();
         }
      }

      // Get the <span> element that closes the modal
      var span = document.getElementsByClassName("close")[0];

      // When the user clicks on <span> (x), close the modal
      span.onclick = function() {
        modal.style.display = "none";
      }
      // Close the Modal window on ESC
      // Mind that JS has both onkeydown and onkeypress
      //    onkeypress just doesn't have Escape in it...
      document.onkeydown = function() {
         // works for any key, doesn't work for ESC
         // modal.style.display = "none";
         if (event.keyCode == 27) {
            modal.style.display = "none";
         }
      }

      // TODO steal scroll events if modal is open
   }
}

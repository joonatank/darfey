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
         if (modal.style.display != "none" || (vidModal.style.display != "none")) {
            modal.style.display = "none";
            vidModal.style.display = "none";
            modalVid.pause();
         }
         else if (elem.getAttribute('type') == "img") {
            modal.style.display = "block";
            modalImg.src = elem.getAttribute('full');
            captionText.innerHTML = elem.alt;
         }
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
      /* Doesn't work
       * Should close the Modal window on ESC
      document.onkeypress = function(event) {
         if (event.key == "Escape") {
            modal.style.display = "none";
         }
      }
      */
   }
}

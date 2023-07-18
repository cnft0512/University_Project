(function($) {

   "use strict";

   var fullHeight = function() {

      $('.js-fullheight').css('height', $(window).height());
      $(window).resize(function(){
         $('.js-fullheight').css('height', $(window).height());
      });

   };
   fullHeight();

   $('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
  });
  
     $('#timeTableForListCollapse').hover(function () {
      $('#timeTableForList').toggleClass('active');
  });
  

})(jQuery);
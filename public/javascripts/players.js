/**
 * Created by .
 * User: niklasni
 * Date: 2011-03-09
 * Time: 00:04
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(
        function(){
           $("div#address_title").click(
                   function() {
                       $("div#address").slideUp("slow");
                       //alert("Clicked");
                   });
        }
 );

$(document).ready(
        function() {
            $("#date").datepicker({ firstDay: 1 });
            //$("#date").datepicker($.datepicker.regional['sv']);
            //$("#date").datepicker();
        }
        );
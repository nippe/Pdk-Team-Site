/**
 * Created by JetBrains RubyMine.
 * User: niklasni
 * Date: 2011-08-24
 * Time: 19:23
 * To change this template use File | Settings | File Templates.
 */


 // Gerneric hookup of collapsible regions
$(document).ready(
        function(){


        $('.collapsible-sub-header').click(
            function() {
                $(this).parent().children('.collapsible-region').toggle('slow');

                 if( $(this).attr('class').indexOf('collapse') >= 0 ) {
                    $(this).removeClass('collapse-arrow').addClass('expand-arrow');
                }
                else {
                    $(this).removeClass('expand-arrow').addClass('collapse-arrow');
                }
            }
        );
            
        }
);
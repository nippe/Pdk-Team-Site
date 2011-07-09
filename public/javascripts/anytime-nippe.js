/**
 * Created by JetBrains WebStorm.
 * User: niklasni
 * Date: 2011-07-06
 * Time: 23:54
 * To change this template use File | Settings | File Templates.
 */
//
//$("#date-field").AnyTime_picker(
//      {
//          format: "%H:%i",
//          labelTitle: "Hora",
//          labelHour: "Hora",
//          labelMinute: "Minuto"
//      }
//);

$(document).ready(
    function(){
        $('#date-field').AnyTime_picker(
            {
                format: "%Y-%m-%d %H:%i"
            }
        );
    }
);


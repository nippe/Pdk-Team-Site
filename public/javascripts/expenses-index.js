/**
 * Created by JetBrains RubyMine.
 * User: niklasni
 * Date: 2011-10-31
 * Time: 10:59
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(

    function() {
        $('.i-have-paid-button').click(
            function() {
                var debt_id = $(this).attr('id').split('-')[1];
                var url = '/debts/' + debt_id + '/paid.json';
                var currentLink = $(this);



                $.getJSON(
                    url,
                    function(json) {
                        currentLink.parent().parent().addClass('debt-paid');
                        currentLink.replaceWith('... väntar på godkännande');
                        //TODO: Highligt and remove link and write "waiting for approval"..
                    }
                );
            }
        )
    }
);


$(document).ready(
    function() {
        $('.collapsible-region ul li').not(':children ul').click(
            function() {
                $(this).children('ul').slideDown('slow');
            }
        );

    }
);


function set_element_to_has_paid(obj) {
    obj.parent().fadeOut('15000');
    obj.parent().replaceWith('<span class=\"debt-payment-status\">och har <span class=\"debt-paid-list\">betalt</span>.');
    obj.parent().toggle('slow');
}

$(document).ready(
    function() {
        $('.debt-approval-link').click(
            function() {
                var debt_id = $(this).attr('id').split('-')[2];
                var url = '/debts/' + debt_id + '/approve_payment';
                var parentElement = $(this);


                $.getJSON(
                    url,
                    function(json) {
                         set_element_to_has_paid(parentElement);
                    }
                );
            }
        );

    }
);


$(document).ready(
    function(){
        $('.debt-summary li :first').addClass('pointer-cursor');
    }
);



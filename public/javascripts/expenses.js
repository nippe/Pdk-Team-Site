/**
 * Created by JetBrains RubyMine.
 * User: niklasni
 * Date: 2011-09-23
 * Time: 09:07
 * To change this template use File | Settings | File Templates.
 */

function id_exists_in_array(user_id, ids) {
    for(var i = 0; i < ids.length; i++){
        if(ids[i] === user_id){
            return true;
        }
    }
    return false;
}



$(document).ready(

        function(){
            $('#add-to-shit-list').click(
                    function(){
                        var user_id = document.getElementById('debt').value;
                        var full_name = $('#debt option:selected').text();
                        if(document.getElementById('expense_debts_user_ids_').value.length == 0)
                        {
                            document.getElementById('expense_debts_user_ids_').value += user_id;
                        }
                        else
                        {
                            var ids = document.getElementById('expense_debts_user_ids_').value.split(',');
                            if(!id_exists_in_array(user_id, ids)){
                                document.getElementById('expense_debts_user_ids_').value += ',' + user_id;
                            }
                            else{
                                return;
                            }
                        }


                        $('#table-of-guiltys').append('\n'
                            + '<tr>'
                            + '<td>'
                            + full_name
                            + '</td>'
                            + '\n<td>'
                            + '<input id=\"debpt_part_' + user_id + '\" type=\"text\" style=\"width: 50px; text-align: right;\" class=\"debpt_part\"/> kr'
                            + '</td>'
                            + '\n<td>'
                            + 'X'
                            + '</td>'
                            + '</tr>'
                            + '');


                    }
            )
        }

);
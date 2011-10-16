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

function remove_id_from_value_string(user_id, ids_string) {
    var ids = ids_string.split(',');
    var return_string = '';
    for(var i = 0; i < ids.length; i++){
        if(ids[i] != user_id){
            return_string += ids[i] + ',';
        }
    }
    return return_string.substr(0, return_string.length - 1);
}

function delete_debtee(link_object) {
    var id_to_delete = link_object.id.split('_')[2];
    var ids = document.getElementById('expense_debts_user_ids_').value;
    $('#' + link_object.id).parent().parent().remove();
    document.getElementById('expense_debts_user_ids_').value = remove_id_from_value_string(id_to_delete, ids);
}



$(document).ready(

        function(){
            $('#add-to-shit-list').click(
                    function(){
                        var user_id = document.getElementById('expense_debtee').value;
                        var full_name = $('#expense_debtee option:selected').text();
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
                            + '<input type=\"text\" id=\"debpt_part_' + user_id + '\" '
                            + '     name=\"debpt_part_' + user_id + '\" value=\"\"'
                            + '     style=\"width: 50px; text-align: right;\" class=\"debpt_part\"/> kr'
                            + '</td>'
                            + '\n<td>'
                            + '<a href=\"#\" onclick="delete_debtee(this);" id=\"debt_delete_' + user_id + '\">X</a>'
                            + '</td>'
                            + '</tr>'
                            + '');


                    }
            )
        }

);

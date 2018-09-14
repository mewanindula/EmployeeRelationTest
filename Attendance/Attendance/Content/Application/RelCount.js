$(function () {
    $('.select2').select2();
});

function validateForm() {
    var result = true;

    $('span[data-valmsg-for="EmpId"]').text('');
    $('span[data-valmsg-for="RelTypeId"]').text('');

    var empId = $('#EmpId').val();
    var relTypeId = $('#RelTypeId').val();

    if (empId == 0) {
        $('span[data-valmsg-for="EmpId"]').text('Please Select Employee');
        result = false;
    }

    if (relTypeId == 0) {
        $('span[data-valmsg-for="RelTypeId"]').text('Please Select Relation Type');
        result = false;
    }

    return result;
}
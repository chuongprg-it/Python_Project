$(document).ready(function(){
    // handle AJAX option sell
    $('.select-brand').change(function() {
        idBrand = $(this).val()

        $.post('get_listCar/',{idBrand,'csrfmiddlewaretoken': $('input[name=csrfmiddlewaretoken]').val()},function(data,status){
            if(status == "success"){
                html = ``
                data.forEach(element => {
                    html += `<option value=${element.id}>${element.nameCar}</option>`
                });
                if(html == ``){
                    html = `<option value="" selected disabled>Chọn dòng xe</option>`
                }
                $('.select-car').html(html)
            }
        })
    })

    // slick slide
    $('.slick').slick({
        infinite: true,
        speed: 300,
        slidesToShow: 2,
    });
})
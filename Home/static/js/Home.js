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
        slidesToShow: 3,
        prevArrow:"<div class='slick-prev btn btn-primary'><i class='fa-solid fa-arrow-left'></i></div>",
        nextArrow:"<div class='slick-next btn btn-primary'><i class='fa-sharp fa-solid fa-arrow-right'></i></div>"
    });

    // handle search 
    $('.input-group .search').keypress(function (event) {
        let inputValue = $(this).val();
        if(event.which === 13 && inputValue != ''){
            $.post('search/',
                {
                    input: inputValue,
                    'csrfmiddlewaretoken': $('input[name=csrfmiddlewaretoken]').val()
                },
                function (data, status) {
                    if (status == "success") {
                        html = ``
                        if (typeof data == "object") {
                            data.forEach(element => {
                                html += `<a class="media row" href="/detailCar/${element.id}">
                                    <div class="media-left col-md-3">
                                      <img src="${element.image}" class="media-object" style="width:150px;height:100px">
                                    </div>
                                    <div class="col-md-9">
                                      <h3 class="media-heading">${element.nameCar}</h3>
                                      <p>Năm sản xuất : ${element.year}</p>
                                    </div>
                                  </a>
                                  <hr>`
                            })
                        }
                        else {
                            html = `<div>Không tìm thấy dữ liệu</div>`
                        }
                        $('.listCar').html(html)
                    }
                });
        }
    });
});
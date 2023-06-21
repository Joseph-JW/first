$(function() {
    tab1()
    tab2()
    search()
});

function tab1() {
    $("#tab1-btn>a").click(function() {
        var idx = $(this).index()
        // alert(idx) // 0, 1
        $("#tab1-contents>div").hide()
        $("#tab1-contents>div").eq(idx).show()
    })
}

function tab2() {
    $("#tab2-btn>a").click(function() {
        var idx = $(this).index()
        // alert(idx) // 0, 1
        $("#tab2-contents>div").hide()
        $("#tab2-contents>div").eq(idx).show()
    })
}

function search() {
    $(".tot-srh_btn").click(function() {
        let searchInput = $("#tot-srh_box").val();
        if(searchInput === "") {
            alert("검색어를 입력하세요.")
        } else{ 
            alert(searchInput)
        }
    });

    $(".go_lib_btn").click(function() {
        let selectedLib = $(".go_sch_lib").val();
        if (selectedLib) {
            window.open(selectedLib, "_blank");
        }
    });
      
    $(".go_site_btn").click(function() {
        let selectedSite = $(".go_sch_site").val();
        if (selectedSite) {
            window.open(selectedSite, "_blank");
        }
    });
}



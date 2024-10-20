<%-- 
    Document   : carousel
    Created on : Sep 29, 2024, 3:37:25 PM
    Author     : Quoc
--%>
<div class = "container">
    <div id="myCarousel" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">

            <div class="carousel-item active">
                <img src="resources/images/slide1.webp" class="d-block w-100" alt="...">
            </div>

            <div class="carousel-item">
                <img src="resources/images/slide2.webp" class="d-block w-100" alt="...">
            </div>

            <div class="carousel-item">
                <img src="resources/images/slide3.webp" class="d-block w-100" alt="...">
            </div>

            <div class="carousel-item">        
                <img src="resources/images/slide4.webp" class="d-block w-100" alt="...">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>


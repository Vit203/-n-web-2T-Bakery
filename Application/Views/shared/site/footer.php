<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-7">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a><img src="./public/site/img/home/logo/2t.png" alt="" style="width: 170px; height: 56px;"></a>
                    </div>
                    <p>ThemeMu comes with powerful theme options, which empowers you to quickly and easily build
                        incredible stores.</p>
                    <div class="footer__social">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-5">
                <div class="footer__widget">
                    <h5>Contact</h5>
                    <ul id="contact-list">
                        <li><span><i class="fas fa-map-marker-alt"></i>Address:</span><span>235 Hoang Quoc Viet, Ha Noi</span></li>
                        <li><span><i class="fas fa-phone-alt"></i>Phone:</span><span>0933257164</span></li>
                        <li><span><i class="far fa-envelope"></i>Email:</span><span>2tbakeryy@gmail.com</span></li>

                    </ul>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4">
                <div class="footer__widget">
                    <h5>Recent post</h5>
                    <ul id="recent-post-list">
                        <li>
                            <div><img src="./public/site/img/home/footer/ryebread.jpg" alt=""></div>
                            <div>
                                <p>Rye bread from VietNam</p>
                                <br>
                                <span>Apr 30, 2024</span>
                            </div>
                        </li>
                        <li>
                            <div><img src="./public/site/img/home/footer/sesamebread.png" alt=""></div>
                            <div>
                                <p>Premium sesame bread</p>
                                <br>
                                <span>May 3, 2024</span>
                            </div>
                        </li>


                    </ul>
                </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-4">
                <div class="footer__widget">
                    <h5>Photo on Instagram</h5>
                    <ul id="insta-list">
                        <li>
                            <div><img src="./public/site/img/home/footer/insta1.jpg" alt=""></div>

                        </li>
                        <li>
                            <div><img src="./public/site/img/home/footer/insta2.jpg" alt=""></div>

                        </li>
                        <li>
                            <div><img src="./public/site/img/home/footer/insta3.jpg" alt=""></div>

                        </li>
                        <li>
                            <div><img src="./public/site/img/home/footer/insta4.jpg" alt=""></div>

                        </li>
                        <li>
                            <div><img src="./public/site/img/home/footer/insta5.jpg" alt=""></div>

                        </li>
                        <li>
                            <div><img src="./public/site/img/home/footer/insta6.jpg" alt=""></div>

                        </li>


                        <!-- <li><a href="#">Orders Tracking</a></li> -->
                    </ul>
                </div>
            </div>

        </div>

        <hr>

        <div class="footer__newsletter">
            <ul>
                <li>
                    <div class="footer__newsletter__text">
                        <span>Enter your email below to get our</span><br>
                        <h5>Happy for u ~~</h5>
                    </div>
                </li>

                <li>
                    <form action="#">
                        <input type="text" placeholder="Enter your email">

                        <button type="submit" class="site-btn">Submit</button>

                    </form>
                </li>
            </ul>

        </div>



    </div>


    <div class="container-fluid">
        <div class="row copyright">
            <div class="col-md-12 p-0">
                <div class=" footer__copyright__text">
                    <p>Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script> All rights reserved | This
                        template is made by The One
                    </p>
                </div>
            </div>
        </div>
    </div>



</footer>
<!-- Footer Section End -->

</body>

<script src="./public/site/js/searchAjax.js" type="text/javascript"></script>
<script src="./public/site/js/cartAjax.js" type="text/javascript"></script>
<script src="./public/site/js/validate.js" type="text/javascript"></script>
<script src="./public/site/js/countdown.js" type="text/javascript"></script>

<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active-slide", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active-slide";
        setTimeout(showSlides, 5000); // Change image every 5 seconds
    }
</script>


</html>
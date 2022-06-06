<%@ include file="jsp/header.jsp" %> <%-- Content --%>
<div class="content home">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li
        data-target="#carouselExampleCaptions"
        data-slide-to="0"
        class="active"
      ></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="assets/banner2.jpg" class="d-block w-100" alt="..." />
        <div class="carousel-caption d-none d-md-block">
          <h5>First slide label</h5>
          <p>Some representative placeholder content for the first slide.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="assets/banner2.jpg" class="d-block w-100" alt="..." />
        <div class="carousel-caption d-none d-md-block">
          <h5>Second slide label</h5>
          <p>Some representative placeholder content for the second slide.</p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="assets/banner2.jpg" class="d-block w-100" alt="..." />
        <div class="carousel-caption d-none d-md-block">
          <h5>Third slide label</h5>
          <p>Some representative placeholder content for the third slide.</p>
        </div>
      </div>
    </div>
    <button
      class="carousel-control-prev"
      type="button"
      data-target="#carouselExampleCaptions"
      data-slide="prev"
    >
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </button>
    <button
      class="carousel-control-next"
      type="button"
      data-target="#carouselExampleCaptions"
      data-slide="next"
    >
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </button>
  </div>
  <section class="container about-us">
    <h1 class="text-title">About Us</h1>
    <p class="text-center">
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet quibusdam
      facere, quas inventore laborum est magni consectetur omnis, illo ipsa
      veniam cumque atque, reprehenderit harum explicabo perferendis.
      Temporibus, sit nulla.
    </p>
  </section>
  <section class="container product-category">
    <h1 class="text-title">Product Category</h1>
    <div class="category-wrapper">
      <div class="card category-item">
        <img src="assets/livingroom.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Living Room</div>
          <p class="card-text">Sofa, Living Table, TV Stand</p>
        </div>
      </div>
      <div class="card category-item">
        <img src="assets/kitchen.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Kitchen</div>
          <p class="card-text">Stove, Sink, Oven</p>
        </div>
      </div>
      <div class="card category-item">
        <img src="assets/bathroom.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Bath Room and Laundry</div>
          <p class="card-text">Bathtub, Shower, Sink, Wardrobe, Laundry</p>
        </div>
      </div>
      <div class="card category-item">
        <img src="assets/bedroom.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Bed Room</div>
          <p class="card-text">Bed, Bedside tables, Chest of drawers</p>
        </div>
      </div>
      <div class="card category-item">
        <img src="assets/tablechair.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Table and Chairs</div>
          <p class="card-text">Console Tables, Writing Desk, Stools</p>
        </div>
      </div>
      <div class="card category-item">
        <img src="assets/wardrobe.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Storage Case and Wardrobe</div>
          <p class="card-text">Bookcase, Storage Walls, Sideboards</p>
        </div>
      </div>
      <div class="card category-item">
        <img src="assets/homeappliance.jpg" class="card-img-top" alt="..." />
        <div class="card-body">
          <div class="item-title">Home Appliance</div>
          <p class="card-text">Water Dispencer, Electric Fan, Kettle</p>
        </div>
      </div>
    </div>
    <a class="product-list-link" href="<%=request.getContextPath()%>/jsp/productList.jsp">
      <button class="btn btn-primary">See All Product</button>
    </a>
  </section>
</div>
<%@ include file="html/footer.html" %>

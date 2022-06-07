<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/productDetail.css" />
    <title>Document</title>
  </head>
  <body>
    <div class="productDetail">
      <div class="productDetail__left">
        <img src="${param.img}" alt="" />
        <p>Rp. ${param.price}</p>
      </div>
      <div class="productDetail__right">
        <h2>${param.name}</h2>
        <p>${param.desc}</p>
      </div>
      <button class="productDetail__btn">Add to Cart</button>
      <form action="<%=request.getContextPath()%>/jsp/removeProductProcess.jsp" method="GET">
        <input type="hidden" name="id" value="${param.id}">
        <button class="productDetail__btn show" type="submit">Remove</button>
      </form>

      <div class="productDetail__qty">
        <input id="qty" class="qty" type="number" min="1" name="qty" value="1" />
        <input id="price" class="price" type="hidden" name="price" value="${param.price}" />
        <button id="btnSave" class="btnSave" type="button">Save</button>
      </div>
    </div>
  </body>
</html>

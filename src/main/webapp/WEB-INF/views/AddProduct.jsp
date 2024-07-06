<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Product</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  height: 100%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
}

.main_container {
  height: auto;
  width: 80%;
  background-color: #5f9ea0; /* cadetblue */
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 2em;
}

.table_container {
  width: 100%;
  background-color: #deb887; /* burlywood */
  padding: 1em;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 1.5em;
  overflow-x: auto;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #d2691e; /* chocolate */
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

td a {
  color: #5f9ea0;
  text-decoration: none;
}

td a:hover {
  text-decoration: underline;
}

.link_container {
  display: flex;
  width: 100%;
  justify-content: space-around;
  background-color: #d2691e; /* chocolate */
  margin: 1em 0;
  padding: 1em;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.link_container a {
  color: white;
  text-decoration: none;
  font-weight: bold;
}

.link_container a:hover {
  text-decoration: underline;
}

/* Additional styling for a cohesive look */
h1 {
  color: white;
  margin-bottom: 1em;
}

.form_container {
  width: 100%;
  background-color: #deb887; /* burlywood */
  padding: 2em;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

form {
  display: flex;
  flex-direction: column;
}

label {
  margin-bottom: 0.5em;
  color: #333;
}

input[type="text"], input[type="submit"] {
  padding: 0.5em;
  margin-bottom: 1em;
  border-radius: 5px;
  border: 1px solid #ccc;
}

input[type="submit"] {
  background-color: #5f9ea0; /* cadetblue */
  color: white;
  border: none;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #4f8e90;
}

</style>
</head>
<body>
    <div class="main_container">
        <h1>New Product</h1>
        <div class="form_container">
            <form action="addProduct" method="post" enctype="multipart/form-data">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName">
                <br><br>
                <label for="category">Category:</label>
                <input type="text" id="category" name="category">
                <br><br>
                <label for="price">Price:</label>
                <input type="text" id="price" name="price">
                <br><br>
                <label for="quantity">Quantity:</label>
                <input type="text" id="quantity" name="quantity">
                <br><br>
                <label for="productImage">Product Image:</label>
                <input type="file" id="productImage" name="productImage">
                <br><br>
                <input type="submit" value="Add Product">
            </form>
        </div>
    </div>
</body>
</html>

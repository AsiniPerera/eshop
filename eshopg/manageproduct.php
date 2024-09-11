<?php
require "connection.php";

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Product | eShop</title>

    <link rel="stylesheet" href="bootstrap.css" />
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />

    <link rel="icon" href="resource/logo.svg" />
</head>

<body style="background-color: #74EBD5; background-image: linear-gradient(90deg,#74EBD5 0%,#9FACE6 100%);">

    <div class="container-fluid">
        <div class="row">
            <div class="col-12 bg-light text-center">
                <label class="form-label text-primary fw-bold fs-1">Manage All Products</label>
            </div>

            <div class="col-12 mt-2">
                <div class="row">
                    <div class="offset-0 offset-lg-3 col-12 col-lg-6 mb-3">
                        <div class="row">
                            <div class="col-9">
                                <input type="text" class="form-control">
                            </div>
                            <div class="col-3 d-grid">
                                <button class="btn btn-warning">Search Product</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 mt-3 mb-3">
                <div class="row">
                    <div class="col-2 col-lg-1 bg-primary py-2 text-end">
                        <span class="fs-4 fw-bold text-white">#</span>
                    </div>
                    <div class="col-2 d-none d-lg-block bg-light py-2">
                        <span class="fs-4 fw-bold ">Product Image</span>
                    </div>
                    <div class="col-4 col-lg-1 bg-primary py-2">
                        <span class="fs-4 fw-bold text-white ">Title</span>
                    </div>
                    <div class="col-4 col-lg-3 d-lg-block bg-light py-2">
                        <span class="fs-4 fw-bold ">Price</span>
                    </div>
                    <div class="col-2 d-none d-lg-block bg-primary py-2">
                        <span class="fs-4 fw-bold ">qty</span>
                    </div>
                    <div class="col-2 d-none d-lg-block bg-light py-2">
                        <span class="fs-4 fw-bold ">Registered Date</span>
                    </div>
                    <div class="col-2 col-lg-1 bg-white"></div>
                </div>
            </div>
            <?php
            $query = "SELECT * FROM `product` ";
            $pageno;

            if (isset($_GET["page"])) {
                $pageno = $_GET["page"];
            } else {
                $pageno = 1;
            }

            $pro_rs = Database::search($query);
            $pro_num = $pro_rs->num_rows;

            $results_per_page = 100;
            $number_of_pages = ceil($pro_num / $results_per_page);

            $page_results = ($pageno - 1) * $results_per_page;
            $selected_rs =  Database::search($query . " LIMIT " . $results_per_page . " OFFSET " . $page_results . "");

            $selected_num = $selected_rs->num_rows;

            for ($x = 0; $x < $selected_num; $x++) {
                $selected_data = $selected_rs->fetch_assoc();

            ?>
                <div class="col-12 mt-3 mb-3">
                    <div class="row">
                        <div class="col-2 col-lg-1 bg-primary py-2 text-end">
                            <span class="fs-4 fw-bold text-white"><?php echo $x + 1; ?></span>
                        </div>
                        <div class="col-2 d-none d-lg-block bg-light py-2" onclick="viewproductmodel('<?php echo $selected_data['id']; ?>');">
                            <?php
                            $image_rs = Database::search("SELECT * FROM `images` WHERE `product_id` ='" . $selected_data["id"] . "'");

                            $image_data = $image_rs->fetch_assoc();
                            ?>
                            <img src="<?php echo $image_data["code"] ?>" style="height: 40px;margin-left: 80px;">
                        </div>
                        <div class="col-4 col-lg-1 bg-primary py-2">
                            <span class="fs-4 fw-bold text-white "><?php echo $selected_data["title"] ?></span>
                        </div>
                        <div class="col-4 col-lg-3 d-lg-block bg-light py-2">
                            <span class="fs-4 fw-bold ">Rs.<?php echo $selected_data["price"] ?>.00</span>
                        </div>
                        <div class="col-2 d-none d-lg-block bg-primary py-2">
                            <span class="fs-4 fw-bold "><?php echo $selected_data["qty"] ?></span>
                        </div>
                        <div class="col-2 d-none d-lg-block bg-light py-2">
                            <span class="fs-4 fw-bold "><?php echo $selected_data["datetime_added"] ?></span>
                        </div>
                        <div class="col-1 col-lg-1 bg-light py-2 d-grid">
                            <?php
                            if ($selected_data["status_id"] == 1) {
                            ?>
                                <button class="btn btn-danger" id="pb<?php echo $selected_data['id']; ?>" onclick="bockpro('<?php echo $selected_data['id']; ?>');">Block</button>
                            <?php
                            } else {
                            ?>
                                <button class="btn btn-success" id="pb<?php echo $selected_data['id']; ?>" onclick="bockpro('<?php echo $selected_data['id']; ?>');">Unblock</button>
                            <?php
                            }

                            ?>
                        </div>
                    </div>
                </div>

                <!-- modal 01 -->
                <div class="modal" tabindex="-1" id="viewproductmodel<?php echo $selected_data['id']; ?>">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title fw-bold text-success"><?php echo $selected_data["title"] ?></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="offset-4 col-4">
                                    <img src="<?php echo $image_data["code"] ?>" class="img-fluid" style="height: 150px;">
                                </div>
                                <div class="col-12">
                                    <span class="fs-5 fw-bold">Price :</span>&nbsp;
                                    <span class="fs-5">Rs. <?php echo $selected_data["price"] ?> .00</span><br>
                                    <span class="fs-5 fw-bold">Quantity :</span>&nbsp;
                                    <span class="fs-5"><?php echo $selected_data["qty"] ?> Product Left</span><br>
                                    <span class="fs-5 fw-bold">Seller :</span>&nbsp;
                                    <?php
                                    $sell_rs = Database::search("SELECT * FROM `user` WHERE `email` ='" . $selected_data["user_email"] . "'");
                                    $sell_data = $sell_rs->fetch_assoc();

                                    ?>
                                    <span class="fs-5"><?php echo $sell_data["fname"] . " " . $sell_data["lname"]; ?></span><br>
                                    <span class="fs-5 fw-bold">Description :</span>&nbsp;
                                    <span class="fs-5"><?php echo $selected_data["description"] ?></span><br>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- modal 01 -->



            <?php
            }
            ?>



            <div class="offset-2 offset-lg-3 col-8 col-lg-6 text-center mb-3">
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="<?php if ($pageno <= 1) {
                                                            echo ("#");
                                                        } else {
                                                            echo "?page="($pageno - 1);
                                                        } ?>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <?php

                        for ($x = 1; $x <= $number_of_pages; $x++) {
                            if ($x == $pageno) {
                        ?>
                                <li class="page-item active">
                                    <a class="page-link" href="<?php echo "?page=" . ($x) ?>);"><?php echo $x; ?></a>
                                </li>
                            <?php
                            } else {
                            ?>
                                <li class="page-item">
                                    <a class="page-link" href="<?php echo "?page=" . ($x) ?>);"><?php echo $x; ?></a>
                                </li>
                        <?php
                            }
                        }

                        ?>

                        <li class="page-item">
                            <a class="page-link" href="<?php if ($pageno >= $number_of_pages) {
                                                            echo ("#");
                                                        } else {
                                                            echo "?page="($pageno + 1);
                                                        } ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>

            <hr>
            <div class="col-12 text-center">
                <h3 class="text-black-50 fw-bold">Manage Categories</h3>
            </div>


            <div class="col-12 mb-3">
                <div class="row gap-1 justify-content-center">
                    <?php
                    $Category_rs = Database::search("SELECT * FROM `category`");
                    $Category_num = $Category_rs->num_rows;

                    for ($x = 0; $x < $Category_num; $x++) {
                        $Category_data = $Category_rs->fetch_assoc();
                    ?>
                        <div class="col-12 col-lg-3 border border-danger rounded" style="height: 75px;">
                            <div class="row">
                                <div class="col-8 mt-2 mb-2">
                                    <label class="form-label fw-bold fs-5 mt-1 ms-5"><?php echo $Category_data["name"] ?></label>
                                </div>
                                <div class="col-4 border-start border-secondary text-center mt-2 mb-2">
                                    <label class="form-label fs-4"><i class="bi bi-trash3-fill text-danger"></i></label>
                                </div>
                            </div>
                        </div>

                    <?php
                    }


                    ?>



                    <div class="col-12 col-lg-3 border border-success rounded" style="height: 75px;" onclick="addnewcatergory();">
                        <div class="row">
                            <div class="col-8 mt-2 mb-2" >
                                <label class="form-label fw-bold fs-5 mt-1 ms-5">Add new Category</label>
                            </div>
                            <div class="col-4 border-start border-secondary text-center mt-2 mb-2">
                                <label class="form-label fs-4"><i class="bi bi-plus-square-fill text-success"></i></label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- model 02 -->
            <div class="modal" tabindex="-1" id="addcatogerymodel">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add new category</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-12">
                                <label class="form-label">New category Name : </label>
                                <input type="text" class="form-control" id="n">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Enter Your Email : </label>
                                <input type="text" class="form-control" id="e">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="addcatogeryverificationmodel();">Save New Category</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- model 02 -->


            <!-- model 03 -->
            <div class="modal" tabindex="-1" id="addcatogeryverificationmodel">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Verification</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-12 mb-3 mt-3">
                                <label class="form-label">Enter Your Verification Code : </label>
                                <input type="text" class="form-control" id="txt">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="savecategory();">verify & Save</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- model 03 -->

        </div>
    </div>
    <script src="script.js"></script>
    <script src="bootstrap.bundle.js"></script>
</body>

</html>
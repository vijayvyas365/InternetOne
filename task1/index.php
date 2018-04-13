<?php
    include("includes/header.php");
?>
    <div class="container">
        <h1 style="padding-top: 80px;" class="my-4">Hierarchical 
            <small>JSON</small>
        </h1>
        <div class="row" >
            <div class="col-lg-12">
                <?php
                    $myfile = fopen("json_file/flattened.json", "r") or die("Unable to open file!");
                    $flat_json = fread($myfile, filesize("json_file/flattened.json"));

                    $validate_json = json_validate($flat_json);
                    $data = getHierarchicalArray($validate_json);

                    echo formatJson(json_encode($data));
                ?>
            </div>
        </div>
    </div>
    <div>&nbsp;</div>
        
<?php
    include("includes/footer.php");
?>
        

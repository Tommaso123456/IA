<?php
  
$user = 'root';
$password = 'Tommaso123'; 

$database = 'tommasodb'; 
  
$servername='localhost:3308';
$mysqli = new mysqli($servername, $user, 
                $password, $database);
  

if ($mysqli->connect_error) {   
    die('Connect Error (' . 
    $mysqli->connect_errno . ') '. 
    $mysqli->connect_error);
}
  
$sql = "SELECT * FROM users";
$result = $mysqli->query($sql);
$mysqli->close(); 
?>

<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <title>GFG User Details</title>
    <style>
        table {
            margin: 0 auto;
            font-size: large;
            border: 1px solid black;
        }
  
        h1 {
            text-align: center;
            color: #006600;
            font-size: xx-large;
            font-family: 'Gill Sans', 'Gill Sans MT', 
            ' Calibri', 'Trebuchet MS', 'sans-serif';
        }
  
        td {
            background-color: #E4F5D4;
            border: 1px solid black;
        }
  
        th,
        td {
            font-weight: bold;
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
  
        td {
            font-weight: lighter;
        }
    </style>
</head>
  
<body>
    <section>
        <h1>GeeksForGeeks</h1>
        <table>
            <tr>
                <th>UserID</th>
                <th>username</th>
                <th>Password</th>
            </tr>

            <?php   
                while($rows=$result->fetch_assoc())
                {
             ?>
            <tr>
                <td><?php echo $rows['UserID'];?></td>
                <td><?php echo $rows['Username'];?></td>
                <td><?php echo $rows['Password'];?></td>
            </tr>
            <?php
                }
             ?>
        </table>
    </section>
</body>
  
</html>

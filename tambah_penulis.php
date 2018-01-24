<?php
	$halaman = $_SERVER['PHP_SELF'];
	include("koneksi.php");

?>

<html>
<head>
<title>Sistem Informasi Perpus</title>
</head>

<body>
	<h3 align="center">TAMBAH DATA PENULIS</h3>

	<p><a href="penulis_view.php">Kembali</a></p>

	<?php
	$simpan = $_POST['simpan'];
	//jika ada variabel $simpan maka melakukan penyimpanan

	if($simpan){
		$kodepenulis = $_POST['kodepenulis'];
		$namapenulis = $_POST['namapenulis'];
		$alamatpenulis = $_POST['alamatpenulis'];
		$telppenulis = $_POST['telppenulis'];

		$q = "insert INTO tb_penulis(kodepenulis,namapenulis,alamatpenulis,telppenulis) VALUES('$kodepenulis','$namapenulis','$alamatpenulis','$telppenulis')";
		$rs = mysql_query($q, $connect_db);

		//jika berhasil maka tampilkan pesan
		if($rs){
			echo "Data berhasil dimasukkan";
		};
	};

	//setelah selesai menyimpan maka melakukan entry data kembali
	?>

	<form action="<?php echo $halaman; ?>" method="post">
		<table border="0" align="center">
			<tr>
				<td>KODE PENULIS</td>
				<td>:</td>
				<td><input name="kodepenulis" type="text" id="kodepenulis"></td>
			</tr>

			<tr>
				<td>NAMA PENULIS</td>
				<td>:</td>
				<td><input name="namapenulis" type="text" id="namapenulis" width="200"></td>
			</tr>

			<tr>
				<td>ALAMAT PENULIS</td>
				<td>:</td>
				<td><textarea name="alamatpenulis" cols="40" rows="5" id="alamatpenulis"></textarea></td>
			</tr>

			<tr>
				<td>No TELEPON</td>
				<td>:</td>
				<td><input name="telppenulis" type="name" id="telppenulis"></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="submit" name="simpan" value="SIMPAN"></td>
			</tr>
		</table>
	</form>
</body>
</html>



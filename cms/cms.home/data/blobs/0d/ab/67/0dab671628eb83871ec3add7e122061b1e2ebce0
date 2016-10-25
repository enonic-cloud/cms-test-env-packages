<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp '&#160;'>
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Users</title>
			</head>
			<body>
				<table border="0" cellpadding="0" cellspacing="2">
					<thead>
						<tr>
							<th>Firstname</th>
							<th>Surname</th>
							<th>Country</th>
							<th>Department</th>
							<th>E-mail</th>
							<th>Uid</th>
							<th>Company</th>
							<th>Sex</th>
						</tr>
					</thead>
					<tbody>
							<xsl:apply-templates select="/result/users/user"/>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="user">
		<tr>
			<td>
				<xsl:value-of select="firstname"/>
			</td>
			<td>
				<xsl:value-of select="lastname"/>
			</td>
			<td>
				<xsl:value-of select="country"/>
			</td>
			<td>
				<xsl:value-of select="department"/>
			</td>
			<td>
				<xsl:value-of select="email"/>
			</td>
			<td>
				<xsl:value-of select="uid"/>
			</td>
			<td>
				<xsl:value-of select="company"/>
			</td>
			<td>
				<xsl:value-of select="gender"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
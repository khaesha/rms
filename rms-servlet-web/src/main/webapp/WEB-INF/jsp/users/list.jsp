<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix = "rms" uri = "/WEB-INF/tags/link.tld"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">

  <title>RMS</title>
  <meta name="description" content="Index">
  <meta name="author" content="Mitrais">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
  <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
  <rms:link type="stylesheet" href="css/styles.css?v=1.0"/>

  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>
    <div class="mdl-layout mdl-js-layout mdl-color--grey-100 box-center">
    	<main class="mdl-layout__content">
        <div style="text-align: right; margin-bottom: 5px; padding: 5px;"><a href="form" class="mdl-button mdl-js-button mdl-button--icon" title="Add"><i class="material-icons">add</i></a></div>
    		<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
              <thead>
                <tr>
                  <th class="mdl-data-table__cell--non-numeric">User Name</th>
                  <th>Password</th>
                  <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items = "${users}" var="user">
                  <tr>
                    <td class="mdl-data-table__cell--non-numeric"><c:out value = "${user.userName}"/></td>
                    <td><c:out value = "${user.password}"/></td>
                    <td>
                      <a href="form?id=<c:out value="${user.id}" />" class="mdl-button mdl-js-button mdl-button--icon" title="Edit"><i class="material-icons">edit</i></a>
                      <a href="delete?id=<c:out value="${user.id}" />" class="mdl-button mdl-js-button mdl-button--icon" title="Delete"><i class="material-icons">delete</i></a>
                    </td>
                  </tr>
              </c:forEach>
              </tbody>
            </table>
    	</main>
    </div>
  <script src="js/scripts.js"></script>
</body>
</html>

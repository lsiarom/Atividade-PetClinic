<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>

<html lang="en">


<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>

    <h2> <fmt:message key="veterinarios"> </fmt:message></h2>

    <datatables:table id="vets" data="${vets.vetList}" cdn="true" row="vet" theme="bootstrap2" cssClass="table table-striped" paginate="false" info="false">
        <datatables:column title="Nome">
            <c:out value="${vet.firstName} ${vet.lastName}"></c:out>
        </datatables:column>
        <datatables:column title="Especialidades">
            <c:forEach var="Especialidades" items="${vet.specialties}">
                <c:out value="${specialty.name}"/>
            </c:forEach>
            <c:if test="${vet.nrOfSpecialties == 0}">none</c:if>
        </datatables:column>
    </datatables:table>
    
    <table class="table-buttons">
        <tr>
            <td>
                <a href="<spring:url value="/vets.xml" htmlEscape="true" />"><fmt:message key="verXML"> </fmt:message></a>
            </td>
            <td>
                <a href="<spring:url value="/vets.atom" htmlEscape="true" />"><fmt:message key="assinarAli"> </fmt:message></a>
            </td>
        </tr>
    </table>

    <jsp:include page="../fragments/footer.jsp"/>
</div>
</body>

</html>

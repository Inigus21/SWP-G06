<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="dao.CityDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.City" %>
<%@ page import="java.net.URLEncoder" %>
<jsp:include page="layout/header.jsp">
    <jsp:param name="active" value="cities"/>
</jsp:include>

<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12 d-flex justify-content-between align-items-center">
            <h1 class="h3"><i class="fas fa-city me-2"></i>City Management</h1>
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCityModal">
                <i class="fas fa-plus me-1"></i> Add New City
            </button>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-check-circle me-2"></i>${sessionScope.successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% session.removeAttribute("successMessage"); %>
            </c:if>
            
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% session.removeAttribute("errorMessage"); %>
            </c:if>
            
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">All Cities</h6>
                    <div class="d-flex">
                        <div class="input-group" style="width: 300px;">
                            <input type="text" id="searchInput" class="form-control" placeholder="Search cities...">
                            <button class="btn btn-primary" type="button" id="searchButton">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="citiesTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Used as Destination</th>
                                    <th>Used as Departure</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="city" items="${cities}">
                                    <tr>
                                        <td>${city.id}</td>
                                        <td>${city.name}</td>
                                        <td>${city.departureCount != null ? city.departureCount : 0} tours</td>
                                        <td>${city.destinationCount != null ? city.destinationCount : 0} trips</td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <button type="button" 
                                                        class="btn btn-warning btn-sm edit-city-btn" 
                                                        data-id="${city.id}" 
                                                        data-name="${city.name}"
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#editCityModal">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button type="button" 
                                                        class="btn btn-danger btn-sm" 
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#deleteCityModal${city.id}">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                            
                                            <!-- Delete Confirmation Modal -->
                                            <div class="modal fade" id="deleteCityModal${city.id}" tabindex="-1" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Confirm Delete</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Are you sure you want to delete the city <strong>${city.name}</strong>? 
                                                            This will affect all tours and trips using this city.
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                            <form action="${pageContext.request.contextPath}/admin/city" method="post">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="cityId" value="${city.id}">
                                                                <button type="submit" class="btn btn-danger">Delete</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <div class="d-flex justify-content-center mt-4">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:url var="prevUrl" value="/admin/city">
                                        <c:param name="page" value="${currentPage - 1}" />
                                        <c:if test="${not empty search}">
                                            <c:param name="search" value="${search}" />
                                        </c:if>
                                        <c:if test="${not empty param.region}">
                                            <c:param name="region" value="${param.region}" />
                                        </c:if>
                                        <c:if test="${not empty param.sort}">
                                            <c:param name="sort" value="${param.sort}" />
                                        </c:if>
                                    </c:url>
                                    
                                    <!-- Previous button -->
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="${prevUrl}" aria-label="Previous" ${currentPage == 1 ? 'tabindex="-1"' : ''}>
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    
                                    <!-- Page numbers -->
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <c:url var="pageUrl" value="/admin/city">
                                            <c:param name="page" value="${i}" />
                                            <c:if test="${not empty search}">
                                                <c:param name="search" value="${search}" />
                                            </c:if>
                                            <c:if test="${not empty param.region}">
                                                <c:param name="region" value="${param.region}" />
                                            </c:if>
                                            <c:if test="${not empty param.sort}">
                                                <c:param name="sort" value="${param.sort}" />
                                            </c:if>
                                        </c:url>
                                        
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <li class="page-item active"><span class="page-link">${i}</span></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    
                                    <c:url var="nextUrl" value="/admin/city">
                                        <c:param name="page" value="${currentPage + 1}" />
                                        <c:if test="${not empty search}">
                                            <c:param name="search" value="${search}" />
                                        </c:if>
                                        <c:if test="${not empty param.region}">
                                            <c:param name="region" value="${param.region}" />
                                        </c:if>
                                        <c:if test="${not empty param.sort}">
                                            <c:param name="sort" value="${param.sort}" />
                                        </c:if>
                                    </c:url>
                                    
                                    <!-- Next button -->
                                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                        <a class="page-link" href="${nextUrl}" aria-label="Next" ${currentPage == totalPages ? 'tabindex="-1"' : ''}>
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                    
                    <div class="text-center mt-3">
                        <c:set var="endItem" value="${currentPage * pageSize}" />
                        <c:if test="${endItem > totalCities}">
                            <c:set var="endItem" value="${totalCities}" />
                        </c:if>
                        <span class="text-muted">Showing ${(currentPage-1) * pageSize + 1} to ${endItem} of ${totalCities} cities</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add City Modal -->
<div class="modal fade" id="addCityModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New City</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/city" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="action" value="add">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="cityName" class="form-label">City Name</label>
                        <input type="text" class="form-control" id="cityName" name="cityName" required>
                        <div class="invalid-feedback">Please enter a city name.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Add City</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit City Modal -->
<div class="modal fade" id="editCityModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit City</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/city" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="cityId" id="editCityId">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="editCityName" class="form-label">City Name</label>
                        <input type="text" class="form-control" id="editCityName" name="cityName" required>
                        <div class="invalid-feedback">Please enter a city name.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize form validation
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
        
        // Initialize edit buttons
        document.querySelectorAll('.edit-city-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const cityId = this.getAttribute('data-id');
                const cityName = this.getAttribute('data-name');
                
                document.getElementById('editCityId').value = cityId;
                document.getElementById('editCityName').value = cityName;
            });
        });
        
        // Search functionality
        document.getElementById('searchButton').addEventListener('click', function() {
            applyFilters();
        });
        
        // Add enter key support for search
        document.getElementById('searchInput').addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                applyFilters();
            }
        });
        
        // Add change event listeners for filters
        document.getElementById('sortOrder').addEventListener('change', function() {
            applyFilters();
        });
        
        document.getElementById('regionFilter').addEventListener('change', function() {
            applyFilters();
        });
        
        function applyFilters() {
            const searchInput = document.getElementById('searchInput');
            const sortOrderElement = document.getElementById('sortOrder');
            const regionElement = document.getElementById('regionFilter');
            
            const searchText = searchInput ? searchInput.value.trim() : '';
            const sortOrder = sortOrderElement ? sortOrderElement.value : '';
            const region = regionElement ? regionElement.value : '';
            
            // Create a URL object
            const url = new URL("${pageContext.request.contextPath}/admin/city", window.location.origin);
            
            // Add parameters
            url.searchParams.append('page', 1);
            
            if (searchText) {
                url.searchParams.append('search', searchText);
            }
            
            if (sortOrder) {
                url.searchParams.append('sort', sortOrder);
            }
            
            if (region) {
                url.searchParams.append('region', region);
            }
            
            // Navigate to the URL
            window.location.href = url.toString();
        }
        
        // Initialize inputs with URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        
        const searchParam = urlParams.get('search');
        if (searchParam) {
            document.getElementById('searchInput').value = searchParam;
        }
        
        const sortParam = urlParams.get('sort');
        if (sortParam) {
            const sortSelect = document.getElementById('sortOrder');
            for (let i = 0; i < sortSelect.options.length; i++) {
                if (sortSelect.options[i].value === sortParam) {
                    sortSelect.selectedIndex = i;
                    break;
                }
            }
        }
        
        const regionParam = urlParams.get('region');
        if (regionParam) {
            const regionSelect = document.getElementById('regionFilter');
            for (let i = 0; i < regionSelect.options.length; i++) {
                if (regionSelect.options[i].value === regionParam) {
                    regionSelect.selectedIndex = i;
                    break;
                }
            }
        }
    });
</script>

<jsp:include page="layout/footer.jsp" /> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div
				class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
				<div class="offcanvas-md offcanvas-end bg-body-tertiary"
					tabindex="-1" id="sidebarMenu" aria-labelledby="sidebarMenuLabel">
					<div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3  px-2">
						<ul class="nav flex-column text-muted">
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2 active"
								aria-current="page" href="#"> <i class="bi bi-house-fill"></i>
									Dashboard
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="/DBP_Project/productController?action=managePurchase"> <i
									class="bi bi-file-earmark"></i> Orders
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="/DBP_Project/productController?action=manage"> <i
									class="bi bi-cart"></i> Products
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="/DBP_Project/productController?action=manageMember"> <i
									class="bi bi-people"></i> Customers
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-graph-up"></i> Reports
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-puzzle"></i> Integrations
							</a></li>
						</ul>

						<h6
							class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-body-secondary text-uppercase">
							<span>Saved reports</span> <a class="link-secondary" href="#"
								aria-label="Add a new report"> <i class="bi bi-plus-circle"></i>
							</a>
						</h6>
						<ul class="nav flex-column mb-auto">
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-file-earmark-text"></i> Current month
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-file-earmark-text"></i> Last quarter
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-file-earmark-text"></i> Social engagement
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-file-earmark-text"></i> Year-end sale
							</a></li>
						</ul>

						<hr class="my-3">

						<ul class="nav flex-column mb-auto">
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-gear-wide-connected"></i> Settings
							</a></li>
							<li class="nav-item"><a
								class="nav-link d-flex align-items-center gap-2" href="#"> <i
									class="bi bi-door-closed"></i> Sign out
							</a></li>
						</ul>
					</div>
				</div>
			</div>
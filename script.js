document.addEventListener("DOMContentLoaded", () => {
    const sidebar = document.getElementById("sidebar");
    const menuToggle = document.getElementById("menuToggle");

    if (!sidebar || !menuToggle) {
        return;
    }

    let overlay = document.querySelector(".sidebar-overlay");

    if (!overlay) {
        overlay = document.createElement("button");
        overlay.type = "button";
        overlay.className = "sidebar-overlay";
        overlay.setAttribute("aria-label", "Fechar menu");
        document.body.appendChild(overlay);
    }

    function closeMenu() {
        sidebar.classList.remove("is-open");
        overlay.classList.remove("is-visible");
        menuToggle.setAttribute("aria-expanded", "false");
    }

    function openMenu() {
        sidebar.classList.add("is-open");
        overlay.classList.add("is-visible");
        menuToggle.setAttribute("aria-expanded", "true");
    }

    menuToggle.addEventListener("click", () => {
        if (sidebar.classList.contains("is-open")) {
            closeMenu();
        } else {
            openMenu();
        }
    });

    overlay.addEventListener("click", closeMenu);

    document.addEventListener("keydown", (event) => {
        if (event.key === "Escape") {
            closeMenu();
        }
    });

    window.addEventListener("resize", () => {
        if (window.innerWidth > 768) {
            closeMenu();
        }
    });
});
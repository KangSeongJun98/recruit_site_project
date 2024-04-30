document.addEventListener("DOMContentLoaded", () => {
    const header = document.querySelector('.wrap_header'),
        gnb = document.getElementById('gnb'),
        lnb = document.getElementById('lnb');

    // gnb, lnb 메뉴 활성 (임시)
    function activeMenu(trg) {
        let pageUrl = location.href.split('/').pop().split('#')[0];

        trg.forEach(el => {
            if(el.getAttribute('href') === pageUrl) {
                el.closest('li').classList.add('on');
            }
        });
    }

    if(gnb) {
        const btnDrawer = document.getElementById('btn_drawer'),
            btnCloseDrawer = document.getElementById('btn_close_drawer');

        activeMenu(gnb.querySelectorAll('a'));

        // 모바일 용 버튼
        btnDrawer.addEventListener('click', () => {
            header.classList.add('expand');
        });
        btnCloseDrawer.addEventListener('click', () => {
            header.classList.remove('expand');
        });
    }

    if(lnb) {
        activeMenu(lnb.querySelectorAll('a'));
    }

    window.addEventListener('resize', function() {
        if(this.innerWidth > 1024) {
            header.classList.remove('expand');
        }
    });

    // tab
    const tabContainer = document.querySelector('#tab_code');

    function changeTab(trg) {
        const tabItem = tabContainer.querySelectorAll('li'),
            tabPanel = document.querySelectorAll('.apidoc .tabpanel'),
            targetTab = tabContainer.querySelector('[href="' + trg + '"]').parentNode;

        tabItem.forEach(item => {
            item.classList.remove('on');
        });
        targetTab.classList.add('on');

        tabPanel.forEach(panel => {
            panel.classList.remove('active');
        });
        document.querySelector(trg).classList.add('active');

        // setTimeout(() => {
        //     window.scrollTo(0, 0);
        // }, 1);
    }

    if(tabContainer) {
        const tabCode = tabContainer.querySelectorAll('.tab');

        tabCode.forEach(el => {
            el.addEventListener('click', e => {
                let current = e.target.getAttribute('href');

                changeTab(current);
                e.preventDefault();
            });
        });
    }

    // 페이지 이동 시 url에 탭 해시값 포함한 경우 해당 탭 활성
    if(location.hash && tabContainer) {
        changeTab(location.hash);
    }
});

const btnLogout = document.querySelector("#btnLogout");
            if (btnLogout) {
                btnLogout.onclick = () => {
                    document.querySelector("#formLogout").submit();
                }
            }
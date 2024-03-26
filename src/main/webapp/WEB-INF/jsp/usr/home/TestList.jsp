<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test List"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!doctype html>

<div class="top_bar top_bar_right">
	<div class="search_box">
	<form onsubmit="submitSearch(event)">
		<input type="text" placeholder="검색어를 입력하세요" name="search_query" autocomplete='off'>
		<button type="submit">검색</button>
		</form>
	</div>
	<button class="btn top_btn btn-ghost" onclick="toggleSearch()">검색🔍</button>
	<a href="../home/TestWrite">
		<button class="btn top_btn btn-ghost write">글쓰기🖊</button>
	</a>
	<a href="../home/TestProfile">
		<button class="btn top_btn btn-ghost">내 정보😀</button>
	</a>
</div>

  <div
    style="width: 1334px; height: 862px; position: absolute; left: 292px; top: 134px; opacity: 0.5; border-radius: 65px; background: #e2e2e2; box-shadow: 5px 5px 30px 3px rgba(0,0,0,0.25);"
  ></div>
  <div style="width: 1796px; height: 48px;">
    <p
      style="width: 82px; height: 48px; position: absolute; left: 75px; top: 25px; font-size: 36px; text-align: left; color: #787575;"
    >
      logo
    </p>
    <svg
      width="46"
      height="46"
      viewBox="0 0 46 46"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      style="width: 46px; height: 45.91px;"
      preserveAspectRatio="xMidYMid meet"
    >
      <path
        d="M39.6942 36.8978L33.1775 30.4134C35.2801 27.7402 36.4209 24.4391 36.4167 21.0407C36.4167 18.0142 35.5174 15.0556 33.8325 12.5391C32.1477 10.0227 29.753 8.06132 26.9512 6.90311C24.1494 5.74491 21.0663 5.44187 18.092 6.03232C15.1176 6.62277 12.3854 8.08018 10.241 10.2203C8.09663 12.3603 6.63627 15.087 6.04463 18.0553C5.45299 21.0237 5.75664 24.1005 6.91719 26.8967C8.07773 29.6928 10.043 32.0827 12.5646 33.7642C15.0862 35.4456 18.0507 36.3431 21.0833 36.3431C24.4886 36.3473 27.7964 35.2088 30.475 33.1105L36.9725 39.614C37.1507 39.7933 37.3627 39.9356 37.5962 40.0327C37.8298 40.1298 38.0803 40.1798 38.3333 40.1798C38.5864 40.1798 38.8369 40.1298 39.0704 40.0327C39.304 39.9356 39.516 39.7933 39.6942 39.614C39.8738 39.4362 40.0164 39.2246 40.1137 38.9915C40.211 38.7584 40.2611 38.5084 40.2611 38.2559C40.2611 38.0034 40.211 37.7534 40.1137 37.5203C40.0164 37.2872 39.8738 37.0756 39.6942 36.8978ZM9.58334 21.0407C9.58334 18.7708 10.2578 16.5519 11.5214 14.6645C12.7851 12.7772 14.5811 11.3062 16.6825 10.4375C18.7838 9.56886 21.0961 9.34158 23.3269 9.78441C25.5577 10.2272 27.6068 11.3203 29.2151 12.9254C30.8234 14.5304 31.9186 16.5754 32.3624 18.8017C32.8061 21.028 32.5784 23.3356 31.708 25.4327C30.8375 27.5298 29.3636 29.3222 27.4724 30.5833C25.5812 31.8444 23.3578 32.5175 21.0833 32.5175C18.0334 32.5175 15.1083 31.3083 12.9516 29.156C10.7949 27.0037 9.58334 24.0845 9.58334 21.0407Z"
        fill="#5E5E5E"
      ></path>
    </svg>
  </div>
  <div style="width: 143px; height: 32px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));">
    <p
      style="width: 121px; height: 32px; position: absolute; left: 888px; top: 153px; font-size: 25px; text-align: left; color: #5e5e5e;"
    >
      3월기록
    </p>
    <svg
      width="14"
      height="10"
      viewBox="0 0 14 10"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      style="position: absolute; left: 1016.5px; top: 161.5px;"
      preserveAspectRatio="none"
    >
      <path
        d="M1.20843 1.33672H12.7898L6.9991 8.6633L1.20843 1.33672ZM0.299262 2.21762L6.08993 9.54287C6.20326 9.68644 6.34302 9.80152 6.49983 9.88036C6.65664 9.95921 6.82687 10 6.9991 10C7.17132 10 7.34156 9.95921 7.49837 9.88036C7.65518 9.80152 7.79494 9.68644 7.90827 9.54287L13.6989 2.21762C14.3823 1.35276 13.8269 4.91521e-07 12.7898 4.91521e-07H1.20843C0.976316 -0.000219837 0.749064 0.0736372 0.553888 0.212727C0.358712 0.351818 0.203886 0.550245 0.107952 0.784246C0.012017 1.01825 -0.0209599 1.27791 0.0129701 1.53212C0.0469001 1.78634 0.146299 2.02434 0.299262 2.21762Z"
        fill="#5E5E5E"
      ></path>
    </svg>
  </div>
  <div style="width: 1283px; height: 765px;">
    <div
      style="width: 620px; height: 243px; position: absolute; left: 975.5px; top: 726.5px; opacity: 0.5; border-radius: 55px; background: #e2e2e2;"
    ></div>
    <div
      style="width: 620px; height: 243px; position: absolute; left: 966.5px; top: 465.5px; opacity: 0.5; border-radius: 55px; background: #e2e2e2;"
    ></div>
    <div
      style="width: 620px; height: 243px; position: absolute; left: 964.5px; top: 204.5px; opacity: 0.5; border-radius: 55px; background: #e2e2e2;"
    ></div>
    <div
      style="width: 620px; height: 243px; position: absolute; left: 323.5px; top: 726.5px; opacity: 0.5; border-radius: 55px; background: #e2e2e2;"
    ></div>
    <div
      style="width: 620px; height: 243px; position: absolute; left: 312.5px; top: 465.5px; opacity: 0.5; border-radius: 55px; background: #e2e2e2;"
    ></div>
    <div
      style="width: 620px; height: 243px; position: absolute; left: 312.5px; top: 205.5px; opacity: 0.5; border-radius: 55px; background: #e2e2e2;"
    ></div>
  </div>
  <div style="width: 524px; height: 169px;">
    <div
      style="width: 512px; height: 135px; position: absolute; left: 1035px; top: 787px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));"
    >
      <p
        style="width: 512px; height: 135px; position: absolute; left: 0px; top: 0px; font-size: 16px; text-align: center; color: #5e5e5e;"
      >
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
        Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur
        ridiculus mus.
      </p>
    </div>
    <p
      style="width: 63px; height: 32px; position: absolute; left: 1023px; top: 753px; font-size: 25px; text-align: left; color: #757575;"
    >
      25일
    </p>
  </div>
  <div style="width: 544px; height: 199px;">
    <div
      style="width: 338px; height: 135px; position: absolute; left: 1197px; top: 546px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));"
    >
      <p
        style="width: 338px; height: 135px; position: absolute; left: 0px; top: 0px; font-size: 16px; text-align: left; color: #5e5e5e;"
      >
        Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie
        d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent
        pas une seconde à du texte standard.
      </p>
    </div>
    <p
      style="width: 63px; height: 32px; position: absolute; left: 1023px; top: 492px; font-size: 25px; text-align: left; color: #757575;"
    >
      21일
    </p>
    <img
      src="unsplash:nnzkznywhau.png"
      style="width: 135px; height: 135px; position: absolute; left: 1013.5px; top: 545.5px; border-radius: 20px; object-fit: none;"
    />
    <div style="width: 304px; height: 57px;">
      <svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 1254px; top: 493px;"
        preserveAspectRatio="none"
      >
        <path
          d="M17.5001 3.28125C14.6341 3.28125 11.8855 4.41976 9.85893 6.44633C7.83236 8.47289 6.69385 11.2215 6.69385 14.0875V14.875C7.13135 20.7958 12.0459 25.5573 17.5001 31.7188C23.1949 25.2875 28.3063 20.4167 28.3063 14.0875C28.3063 11.2215 27.1678 8.47289 25.1413 6.44633C23.1147 4.41976 20.3661 3.28125 17.5001 3.28125ZM17.5001 8.89583C18.5287 8.89583 19.5341 9.20093 20.3892 9.77253C21.2444 10.3441 21.9107 11.1565 22.304 12.1069C22.6973 13.0573 22.7998 14.103 22.5986 15.1117C22.3974 16.1204 21.9015 17.0468 21.1737 17.7736C20.4459 18.5004 19.5189 18.995 18.5099 19.1947C17.5009 19.3945 16.4553 19.2905 15.5055 18.8959C14.5556 18.5013 13.7442 17.8338 13.1738 16.9779C12.6034 16.1219 12.2997 15.1161 12.3011 14.0875C12.3031 12.7099 12.8517 11.3894 13.8265 10.416C14.8012 9.44258 16.1225 8.89583 17.5001 8.89583Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path></svg
      ><svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 1323px; top: 493px;"
        preserveAspectRatio="none"
      >
        <path
          d="M17.5 8.05371C15.6318 8.05367 13.8056 8.60763 12.2522 9.64552C10.6989 10.6834 9.48815 12.1586 8.77322 13.8846C8.05829 15.6106 7.87123 17.5098 8.23571 19.3421C8.60019 21.1744 9.49983 22.8575 10.8209 24.1785C11.6964 25.0627 12.738 25.7653 13.8858 26.2457C15.0336 26.7262 16.2651 26.9751 17.5094 26.9782C18.7537 26.9813 19.9864 26.7385 21.1366 26.2638C22.2869 25.789 23.3319 25.0917 24.2118 24.2119C25.0917 23.332 25.7891 22.287 26.2639 21.1368C26.7387 19.9866 26.9816 18.7539 26.9785 17.5096C26.9755 16.2653 26.7266 15.0338 26.2462 13.8859C25.7658 12.7381 25.0634 11.6965 24.1792 10.8209C22.4009 9.0597 20.0028 8.06617 17.5 8.05371Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M14.3272 5.43237L17.521 1.823L20.6929 5.47394L25.6862 3.55477V8.68008L30.6956 9.21383L29.5041 14.3165L33.1769 17.4738L29.5296 20.529L30.6824 25.6507L25.6862 26.2953V31.312L20.6666 29.4402L17.5283 33.1772L14.2864 29.438L9.35505 31.3185V26.2997L4.299 25.642L5.51234 20.5334L1.82275 17.4687L5.53275 14.3406L4.35442 9.23206L9.34702 8.63268V3.60654L14.3272 5.43237Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path></svg
      ><svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 1394px; top: 493px;"
        preserveAspectRatio="none"
      >
        <path
          d="M30.5156 19.196C30.7574 17.3447 30.6012 15.4631 30.0577 13.677C29.5142 11.8908 28.5958 10.2412 27.3638 8.83836C26.1318 7.43549 24.6147 6.31168 22.9137 5.54198C21.2127 4.77229 19.367 4.37443 17.5 4.375C14.019 4.375 10.6806 5.75781 8.21922 8.21922C5.75781 10.6806 4.375 14.019 4.375 17.5C4.375 20.981 5.75781 24.3194 8.21922 26.7808C10.6806 29.2422 14.019 30.625 17.5 30.625M13.125 14.5833H13.1396M21.875 14.5833H21.8896"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M13.854 21.875C14.8136 22.8083 16.129 23.3333 17.4998 23.3333C18.8707 23.3333 20.1861 22.8083 21.1457 21.875M21.8748 27.7083L24.7915 30.625L30.6248 24.7917"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
      </svg>
      <div
        style="display: flex; justify-content: center; align-items: center; width: 93px; height: 57px; position: absolute; left: 1465px; top: 482px;"
      >
        <svg
          width="35"
          height="35"
          viewBox="0 0 35 35"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 35px; height: 35px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M18.5939 18.2409L30.9898 13.2826V21.5266C30.103 20.9599 29.0528 20.7045 28.0048 20.8006C26.9568 20.8967 25.9706 21.3389 25.2017 22.0574C24.4328 22.776 23.9248 23.73 23.758 24.7691C23.5912 25.8081 23.7749 26.8732 24.2803 27.7963C24.7857 28.7194 25.5839 29.4481 26.5491 29.8674C27.5143 30.2868 28.5917 30.3729 29.6113 30.1124C30.6309 29.8518 31.5348 29.2592 32.1805 28.4282C32.8261 27.5971 33.1768 26.5748 33.1772 25.5224V11.5866C33.1772 9.91969 33.1772 8.52261 33.0606 7.40844C33.0443 7.25493 33.0248 7.10178 33.0022 6.94907C32.8885 6.18782 32.6902 5.47907 32.3037 4.88552C32.0682 4.52075 31.7605 4.20807 31.3995 3.96678L31.3893 3.95948C30.3568 3.27407 29.1975 3.32219 28.0031 3.62698C26.8481 3.92157 25.416 4.52094 23.6602 5.25594L20.6064 6.53344C19.7825 6.87761 19.0854 7.17073 18.5385 7.47261C17.9552 7.79344 17.455 8.17261 17.0787 8.73844C16.7025 9.30428 16.545 9.9124 16.4735 10.5745C16.4064 11.1957 16.4064 11.9526 16.4064 12.8451V24.4418C15.5196 23.8751 14.4694 23.6197 13.4215 23.7158C12.3735 23.8119 11.3873 24.2541 10.6183 24.9726C9.84942 25.6912 9.34151 26.6452 9.17468 27.6843C9.00786 28.7233 9.19161 29.7884 9.69696 30.7115C10.2023 31.6346 11.0005 32.3633 11.9658 32.7826C12.931 33.202 14.0084 33.2882 15.028 33.0276C16.0476 32.767 16.9515 32.1744 17.5971 31.3434C18.2428 30.5123 18.5935 29.49 18.5939 28.4376V18.2409Z"
            fill="#5E5E5E"
          ></path>
          <path
            opacity="0.5"
            d="M11.3019 2.91675C11.3019 2.62667 11.1867 2.34847 10.9816 2.14335C10.7765 1.93823 10.4983 1.823 10.2082 1.823C9.9181 1.823 9.6399 1.93823 9.43478 2.14335C9.22966 2.34847 9.11443 2.62667 9.11443 2.91675V11.3167C8.22763 10.7501 7.17745 10.4947 6.12946 10.5908C5.08147 10.6869 4.09527 11.1291 3.32635 11.8476C2.55743 12.5661 2.04951 13.5202 1.88269 14.5592C1.71586 15.5983 1.89961 16.6634 2.40497 17.5865C2.91032 18.5096 3.70854 19.2383 4.67378 19.6576C5.63901 20.077 6.71636 20.1631 7.73598 19.9025C8.75559 19.6419 9.65948 19.0494 10.3051 18.2183C10.9508 17.3873 11.3015 16.365 11.3019 15.3126V7.29904C12.3213 8.03404 13.5332 8.3855 14.5832 8.3855C14.8733 8.3855 15.1515 8.27026 15.3566 8.06515C15.5617 7.86003 15.6769 7.58183 15.6769 7.29175C15.6769 7.00167 15.5617 6.72347 15.3566 6.51835C15.1515 6.31323 14.8733 6.198 14.5832 6.198C13.7904 6.17865 13.0268 5.89536 12.4132 5.393C11.7803 4.87237 11.3019 4.0805 11.3019 2.91675Z"
            fill="#5E5E5E"
          ></path></svg
        ><svg
          width="58"
          height="57"
          viewBox="0 0 58 57"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 58px; height: 57px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M12.0835 19H42.0835M12.0835 26.5H42.0835M12.0835 34H24.9406"
            stroke="#5E5E5E"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          ></path>
        </svg>
      </div>
    </div>
  </div>
  <div style="width: 533px; height: 201px;">
    <div
      style="width: 338px; height: 135px; position: absolute; left: 1195px; top: 284px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));"
    >
      <p
        style="width: 338px; height: 135px; position: absolute; left: 0px; top: 0px; font-size: 16px; text-align: left; color: #5e5e5e;"
      >
        체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한
        영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고
        도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다.
      </p>
    </div>
    <p
      style="width: 63px; height: 32px; position: absolute; left: 1021px; top: 229px; font-size: 25px; text-align: left; color: #757575;"
    >
      19일
    </p>
    <img
      src="unsplash:zcugjyqewe8.png"
      style="width: 135px; height: 135px; position: absolute; left: 1013.5px; top: 284.5px; border-radius: 20px; object-fit: none;"
    />
    <div style="width: 235px; height: 57px;">
      <svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 1312px; top: 230px;"
        preserveAspectRatio="none"
      >
        <path
          d="M17.5 8.05371C15.6318 8.05367 13.8056 8.60763 12.2522 9.64552C10.6989 10.6834 9.48815 12.1586 8.77322 13.8846C8.05829 15.6106 7.87123 17.5098 8.23571 19.3421C8.60019 21.1744 9.49983 22.8575 10.8209 24.1785C11.6964 25.0627 12.738 25.7653 13.8858 26.2457C15.0336 26.7262 16.2651 26.9751 17.5094 26.9782C18.7537 26.9813 19.9864 26.7385 21.1366 26.2638C22.2869 25.789 23.3319 25.0917 24.2118 24.2119C25.0917 23.332 25.7891 22.287 26.2639 21.1368C26.7387 19.9866 26.9816 18.7539 26.9785 17.5096C26.9755 16.2653 26.7266 15.0338 26.2462 13.8859C25.7658 12.7381 25.0634 11.6965 24.1792 10.8209C22.4009 9.0597 20.0028 8.06617 17.5 8.05371Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M14.3272 5.43237L17.521 1.823L20.6929 5.47394L25.6862 3.55477V8.68008L30.6956 9.21383L29.5041 14.3165L33.1769 17.4738L29.5296 20.529L30.6824 25.6507L25.6862 26.2953V31.312L20.6666 29.4402L17.5283 33.1772L14.2864 29.438L9.35505 31.3185V26.2997L4.299 25.642L5.51234 20.5334L1.82275 17.4687L5.53275 14.3406L4.35442 9.23206L9.34702 8.63268V3.60654L14.3272 5.43237Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path></svg
      ><svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 1383px; top: 230px;"
        preserveAspectRatio="none"
      >
        <path
          d="M30.5156 19.196C30.7574 17.3447 30.6012 15.4631 30.0577 13.677C29.5142 11.8908 28.5958 10.2412 27.3638 8.83836C26.1318 7.43549 24.6147 6.31168 22.9137 5.54198C21.2127 4.77229 19.367 4.37443 17.5 4.375C14.019 4.375 10.6806 5.75781 8.21922 8.21922C5.75781 10.6806 4.375 14.019 4.375 17.5C4.375 20.981 5.75781 24.3194 8.21922 26.7808C10.6806 29.2422 14.019 30.625 17.5 30.625M13.125 14.5833H13.1396M21.875 14.5833H21.8896"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M13.854 21.875C14.8136 22.8083 16.129 23.3333 17.4998 23.3333C18.8707 23.3333 20.1861 22.8083 21.1457 21.875M21.8748 27.7083L24.7915 30.625L30.6248 24.7917"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
      </svg>
      <div
        style="display: flex; justify-content: center; align-items: center; width: 93px; height: 57px; position: absolute; left: 1454px; top: 219px;"
      >
        <svg
          width="35"
          height="35"
          viewBox="0 0 35 35"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 35px; height: 35px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M18.5939 18.2409L30.9898 13.2826V21.5266C30.103 20.9599 29.0528 20.7045 28.0048 20.8006C26.9568 20.8967 25.9706 21.3389 25.2017 22.0574C24.4328 22.776 23.9248 23.73 23.758 24.7691C23.5912 25.8081 23.7749 26.8732 24.2803 27.7963C24.7857 28.7194 25.5839 29.4481 26.5491 29.8674C27.5143 30.2868 28.5917 30.3729 29.6113 30.1124C30.6309 29.8518 31.5348 29.2592 32.1805 28.4282C32.8261 27.5971 33.1768 26.5748 33.1772 25.5224V11.5866C33.1772 9.91969 33.1772 8.52261 33.0606 7.40844C33.0443 7.25493 33.0248 7.10178 33.0022 6.94907C32.8885 6.18782 32.6902 5.47907 32.3037 4.88552C32.0682 4.52075 31.7605 4.20807 31.3995 3.96678L31.3893 3.95948C30.3568 3.27407 29.1975 3.32219 28.0031 3.62698C26.8481 3.92157 25.416 4.52094 23.6602 5.25594L20.6064 6.53344C19.7825 6.87761 19.0854 7.17073 18.5385 7.47261C17.9552 7.79344 17.455 8.17261 17.0787 8.73844C16.7025 9.30428 16.545 9.9124 16.4735 10.5745C16.4064 11.1957 16.4064 11.9526 16.4064 12.8451V24.4418C15.5196 23.8751 14.4694 23.6197 13.4215 23.7158C12.3735 23.8119 11.3873 24.2541 10.6183 24.9726C9.84942 25.6912 9.34151 26.6452 9.17468 27.6843C9.00786 28.7233 9.19161 29.7884 9.69696 30.7115C10.2023 31.6346 11.0005 32.3633 11.9658 32.7826C12.931 33.202 14.0084 33.2882 15.028 33.0276C16.0476 32.767 16.9515 32.1744 17.5971 31.3434C18.2428 30.5123 18.5935 29.49 18.5939 28.4376V18.2409Z"
            fill="#5E5E5E"
          ></path>
          <path
            opacity="0.5"
            d="M11.3019 2.91675C11.3019 2.62667 11.1867 2.34847 10.9816 2.14335C10.7765 1.93823 10.4983 1.823 10.2082 1.823C9.9181 1.823 9.6399 1.93823 9.43478 2.14335C9.22966 2.34847 9.11443 2.62667 9.11443 2.91675V11.3167C8.22763 10.7501 7.17745 10.4947 6.12946 10.5908C5.08147 10.6869 4.09527 11.1291 3.32635 11.8476C2.55743 12.5661 2.04951 13.5202 1.88269 14.5592C1.71586 15.5983 1.89961 16.6634 2.40497 17.5865C2.91032 18.5096 3.70854 19.2383 4.67378 19.6576C5.63901 20.077 6.71636 20.1631 7.73598 19.9025C8.75559 19.6419 9.65948 19.0494 10.3051 18.2183C10.9508 17.3873 11.3015 16.365 11.3019 15.3126V7.29904C12.3213 8.03404 13.5332 8.3855 14.5832 8.3855C14.8733 8.3855 15.1515 8.27026 15.3566 8.06515C15.5617 7.86003 15.6769 7.58183 15.6769 7.29175C15.6769 7.00167 15.5617 6.72347 15.3566 6.51835C15.1515 6.31323 14.8733 6.198 14.5832 6.198C13.7904 6.17865 13.0268 5.89536 12.4132 5.393C11.7803 4.87237 11.3019 4.0805 11.3019 2.91675Z"
            fill="#5E5E5E"
          ></path></svg
        ><svg
          width="58"
          height="57"
          viewBox="0 0 58 57"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 58px; height: 57px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M12.0835 19H42.0835M12.0835 26.5H42.0835M12.0835 34H24.9406"
            stroke="#5E5E5E"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          ></path>
        </svg>
      </div>
    </div>
  </div>
  <div style="width: 544px; height: 203px;">
    <div
      style="width: 338px; height: 135px; position: absolute; left: 547px; top: 807px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));"
    >
      <p
        style="width: 338px; height: 135px; position: absolute; left: 0px; top: 0px; font-size: 16px; text-align: left; color: #5e5e5e;"
      >
        えんしてぃウィッシュはえんしてぃの最後のグループで、2024年2月21日にデビューしました。リーダーはシオンです。メンバーはシオンを含めて合計6人で、リク、ユウシ、ジェヒ、リョウ、サクヤで構成されています。韓国人はシオン、ジェヒの二人で、リク、ユウシ、リョウ、サクヤは日本人です。
      </p>
    </div>
    <p
      style="width: 63px; height: 32px; position: absolute; left: 380px; top: 753px; font-size: 25px; text-align: left; color: #757575;"
    >
      13일
    </p>
    <img
      src="unsplash:9xngoipxceo.png"
      style="width: 135px; height: 135px; position: absolute; left: 371.5px; top: 807.5px; border-radius: 20px; object-fit: none;"
    />
    <div style="width: 304px; height: 57px;">
      <svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 612px; top: 751px;"
        preserveAspectRatio="none"
      >
        <path
          d="M17.5001 3.28125C14.6341 3.28125 11.8855 4.41976 9.85893 6.44633C7.83236 8.47289 6.69385 11.2215 6.69385 14.0875V14.875C7.13135 20.7958 12.0459 25.5573 17.5001 31.7188C23.1949 25.2875 28.3063 20.4167 28.3063 14.0875C28.3063 11.2215 27.1678 8.47289 25.1413 6.44633C23.1147 4.41976 20.3661 3.28125 17.5001 3.28125ZM17.5001 8.89583C18.5287 8.89583 19.5341 9.20093 20.3892 9.77253C21.2444 10.3441 21.9107 11.1565 22.304 12.1069C22.6973 13.0573 22.7998 14.103 22.5986 15.1117C22.3974 16.1204 21.9015 17.0468 21.1737 17.7736C20.4459 18.5004 19.5189 18.995 18.5099 19.1947C17.5009 19.3945 16.4553 19.2905 15.5055 18.8959C14.5556 18.5013 13.7442 17.8338 13.1738 16.9779C12.6034 16.1219 12.2997 15.1161 12.3011 14.0875C12.3031 12.7099 12.8517 11.3894 13.8265 10.416C14.8012 9.44258 16.1225 8.89583 17.5001 8.89583Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path></svg
      ><svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 681px; top: 751px;"
        preserveAspectRatio="none"
      >
        <path
          d="M17.5 8.05371C15.6318 8.05367 13.8056 8.60763 12.2522 9.64552C10.6989 10.6834 9.48815 12.1586 8.77322 13.8846C8.05829 15.6106 7.87123 17.5098 8.23571 19.3421C8.60019 21.1744 9.49983 22.8575 10.8209 24.1785C11.6964 25.0627 12.738 25.7653 13.8858 26.2457C15.0336 26.7262 16.2651 26.9751 17.5094 26.9782C18.7537 26.9813 19.9864 26.7385 21.1366 26.2638C22.2869 25.789 23.3319 25.0917 24.2118 24.2119C25.0917 23.332 25.7891 22.287 26.2639 21.1368C26.7387 19.9866 26.9816 18.7539 26.9785 17.5096C26.9755 16.2653 26.7266 15.0338 26.2462 13.8859C25.7658 12.7381 25.0634 11.6965 24.1792 10.8209C22.4009 9.0597 20.0028 8.06617 17.5 8.05371Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M14.3275 5.43237L17.5212 1.823L20.6931 5.47394L25.6864 3.55477V8.68008L30.6958 9.21383L29.5044 14.3165L33.1772 17.4738L29.5299 20.529L30.6827 25.6507L25.6864 26.2953V31.312L20.6669 29.4402L17.5285 33.1772L14.2866 29.438L9.35529 31.3185V26.2997L4.29925 25.642L5.51258 20.5334L1.823 17.4687L5.533 14.3406L4.35466 9.23206L9.34727 8.63268V3.60654L14.3275 5.43237Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path></svg
      ><svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 752px; top: 751px;"
        preserveAspectRatio="none"
      >
        <path
          d="M30.5156 19.196C30.7574 17.3447 30.6012 15.4631 30.0577 13.677C29.5142 11.8908 28.5958 10.2412 27.3638 8.83836C26.1318 7.43549 24.6147 6.31168 22.9137 5.54198C21.2127 4.77229 19.367 4.37443 17.5 4.375C14.019 4.375 10.6806 5.75781 8.21922 8.21922C5.75781 10.6806 4.375 14.019 4.375 17.5C4.375 20.981 5.75781 24.3194 8.21922 26.7808C10.6806 29.2422 14.019 30.625 17.5 30.625M13.125 14.5833H13.1396M21.875 14.5833H21.8896"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M13.8542 21.875C14.8138 22.8083 16.1292 23.3333 17.5001 23.3333C18.8709 23.3333 20.1863 22.8083 21.1459 21.875M21.8751 27.7083L24.7917 30.625L30.6251 24.7917"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
      </svg>
      <div
        style="display: flex; justify-content: center; align-items: center; width: 93px; height: 57px; position: absolute; left: 823px; top: 740px;"
      >
        <svg
          width="35"
          height="35"
          viewBox="0 0 35 35"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 35px; height: 35px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M18.5937 18.2409L30.9895 13.2826V21.5266C30.1027 20.9599 29.0525 20.7045 28.0045 20.8006C26.9565 20.8967 25.9704 21.3389 25.2014 22.0574C24.4325 22.776 23.9246 23.73 23.7578 24.7691C23.5909 25.8081 23.7747 26.8732 24.2801 27.7963C24.7854 28.7194 25.5836 29.4481 26.5489 29.8674C27.5141 30.2868 28.5914 30.3729 29.6111 30.1124C30.6307 29.8518 31.5346 29.2592 32.1802 28.4282C32.8259 27.5971 33.1766 26.5748 33.177 25.5224V11.5866C33.177 9.91969 33.177 8.52261 33.0603 7.40844C33.044 7.25493 33.0246 7.10178 33.002 6.94907C32.8883 6.18782 32.6899 5.47907 32.3035 4.88552C32.068 4.52075 31.7603 4.20807 31.3993 3.96678L31.3891 3.95948C30.3566 3.27407 29.1972 3.32219 28.0028 3.62698C26.8478 3.92157 25.4158 4.52094 23.6599 5.25594L20.6062 6.53344C19.7822 6.87761 19.0851 7.17073 18.5383 7.47261C17.9549 7.79344 17.4547 8.17261 17.0785 8.73844C16.7022 9.30428 16.5447 9.9124 16.4733 10.5745C16.4062 11.1957 16.4062 11.9526 16.4062 12.8451V24.4418C15.5194 23.8751 14.4692 23.6197 13.4212 23.7158C12.3732 23.8119 11.387 24.2541 10.6181 24.9726C9.84917 25.6912 9.34126 26.6452 9.17444 27.6843C9.00761 28.7233 9.19136 29.7884 9.69672 30.7115C10.2021 31.6346 11.0003 32.3633 11.9655 32.7826C12.9308 33.202 14.0081 33.2882 15.0277 33.0276C16.0473 32.767 16.9512 32.1744 17.5969 31.3434C18.2425 30.5123 18.5932 29.49 18.5937 28.4376V18.2409Z"
            fill="#5E5E5E"
          ></path>
          <path
            opacity="0.5"
            d="M11.3022 2.91675C11.3022 2.62667 11.1869 2.34847 10.9818 2.14335C10.7767 1.93823 10.4985 1.823 10.2084 1.823C9.91834 1.823 9.64014 1.93823 9.43502 2.14335C9.22991 2.34847 9.11467 2.62667 9.11467 2.91675V11.3167C8.22787 10.7501 7.1777 10.4947 6.1297 10.5908C5.08171 10.6869 4.09552 11.1291 3.32659 11.8476C2.55767 12.5661 2.04976 13.5202 1.88293 14.5592C1.71611 15.5983 1.89986 16.6634 2.40521 17.5865C2.91057 18.5096 3.70879 19.2383 4.67402 19.6576C5.63926 20.077 6.7166 20.1631 7.73622 19.9025C8.75584 19.6419 9.65972 19.0494 10.3054 18.2183C10.951 17.3873 11.3017 16.365 11.3022 15.3126V7.29904C12.3215 8.03404 13.5334 8.3855 14.5834 8.3855C14.8735 8.3855 15.1517 8.27026 15.3568 8.06515C15.5619 7.86003 15.6772 7.58183 15.6772 7.29175C15.6772 7.00167 15.5619 6.72347 15.3568 6.51835C15.1517 6.31323 14.8735 6.198 14.5834 6.198C13.7907 6.17865 13.027 5.89536 12.4134 5.393C11.7805 4.87237 11.3022 4.0805 11.3022 2.91675Z"
            fill="#5E5E5E"
          ></path></svg
        ><svg
          width="58"
          height="57"
          viewBox="0 0 58 57"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 58px; height: 57px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M12.0833 19H42.0833M12.0833 26.5H42.0833M12.0833 34H24.9404"
            stroke="#5E5E5E"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          ></path>
        </svg>
      </div>
    </div>
  </div>
  <div style="width: 533px; height: 192px;">
    <div
      style="width: 512px; height: 135px; position: absolute; left: 372px; top: 539px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));"
    >
      <p
        style="width: 512px; height: 135px; position: absolute; left: 0px; top: 0px; font-size: 16px; text-align: center; color: #5e5e5e;"
      >
        국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다. 모든 국민은 사생활의
        비밀과 자유를 침해받지 아니한다. 국회는 선전포고, 국군의 외국에의 파견 또는 외국군대의
        대한민국 영역안에서의 주류에 대한 동의권을 가진다. 명령·규칙 또는 처분이 헌법이나 법률에
        위반되는 여부가 재판의 전제가 된 경우에는 대법원은 이를 최종적으로 심사할 권한을 가진다.
      </p>
    </div>
    <p
      style="width: 63px; height: 32px; position: absolute; left: 380px; top: 497px; font-size: 25px; text-align: left; color: #757575;"
    >
      06일
    </p>
    <div style="width: 235px; height: 57px;">
      <svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 670px; top: 493px;"
        preserveAspectRatio="none"
      >
        <path
          d="M17.5 8.05371C15.6318 8.05367 13.8056 8.60763 12.2522 9.64552C10.6989 10.6834 9.48815 12.1586 8.77322 13.8846C8.05829 15.6106 7.87123 17.5098 8.23571 19.3421C8.60019 21.1744 9.49983 22.8575 10.8209 24.1785C11.6964 25.0627 12.738 25.7653 13.8858 26.2457C15.0336 26.7262 16.2651 26.9751 17.5094 26.9782C18.7537 26.9813 19.9864 26.7385 21.1366 26.2638C22.2869 25.789 23.3319 25.0917 24.2118 24.2119C25.0917 23.332 25.7891 22.287 26.2639 21.1368C26.7387 19.9866 26.9816 18.7539 26.9785 17.5096C26.9755 16.2653 26.7266 15.0338 26.2462 13.8859C25.7658 12.7381 25.0634 11.6965 24.1792 10.8209C22.4009 9.0597 20.0028 8.06617 17.5 8.05371Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M14.3275 5.43237L17.5212 1.823L20.6931 5.47394L25.6864 3.55477V8.68008L30.6958 9.21383L29.5044 14.3165L33.1772 17.4738L29.5299 20.529L30.6827 25.6507L25.6864 26.2953V31.312L20.6669 29.4402L17.5285 33.1772L14.2866 29.438L9.35529 31.3185V26.2997L4.29925 25.642L5.51258 20.5334L1.823 17.4687L5.533 14.3406L4.35466 9.23206L9.34727 8.63268V3.60654L14.3275 5.43237Z"
          stroke="#5E5E5E"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path></svg
      ><svg
        width="35"
        height="35"
        viewBox="0 0 35 35"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        style="width: 35px; height: 35px; position: absolute; left: 741px; top: 493px;"
        preserveAspectRatio="none"
      >
        <path
          d="M30.5156 19.196C30.7574 17.3447 30.6012 15.4631 30.0577 13.677C29.5142 11.8908 28.5958 10.2412 27.3638 8.83836C26.1318 7.43549 24.6147 6.31168 22.9137 5.54198C21.2127 4.77229 19.367 4.37443 17.5 4.375C14.019 4.375 10.6806 5.75781 8.21922 8.21922C5.75781 10.6806 4.375 14.019 4.375 17.5C4.375 20.981 5.75781 24.3194 8.21922 26.7808C10.6806 29.2422 14.019 30.625 17.5 30.625M13.125 14.5833H13.1396M21.875 14.5833H21.8896"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
        <path
          d="M13.8542 21.875C14.8138 22.8083 16.1292 23.3333 17.5001 23.3333C18.8709 23.3333 20.1863 22.8083 21.1459 21.875M21.8751 27.7083L24.7917 30.625L30.6251 24.7917"
          stroke="#5E5E5E"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        ></path>
      </svg>
      <div
        style="display: flex; justify-content: center; align-items: center; width: 93px; height: 57px; position: absolute; left: 812px; top: 482px;"
      >
        <svg
          width="35"
          height="35"
          viewBox="0 0 35 35"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 35px; height: 35px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M18.5937 18.2409L30.9895 13.2826V21.5266C30.1027 20.9599 29.0525 20.7045 28.0045 20.8006C26.9565 20.8967 25.9704 21.3389 25.2014 22.0574C24.4325 22.776 23.9246 23.73 23.7578 24.7691C23.5909 25.8081 23.7747 26.8732 24.2801 27.7963C24.7854 28.7194 25.5836 29.4481 26.5489 29.8674C27.5141 30.2868 28.5914 30.3729 29.6111 30.1124C30.6307 29.8518 31.5346 29.2592 32.1802 28.4282C32.8259 27.5971 33.1766 26.5748 33.177 25.5224V11.5866C33.177 9.91969 33.177 8.52261 33.0603 7.40844C33.044 7.25493 33.0246 7.10178 33.002 6.94907C32.8883 6.18782 32.6899 5.47907 32.3035 4.88552C32.068 4.52075 31.7603 4.20807 31.3993 3.96678L31.3891 3.95948C30.3566 3.27407 29.1972 3.32219 28.0028 3.62698C26.8478 3.92157 25.4158 4.52094 23.6599 5.25594L20.6062 6.53344C19.7822 6.87761 19.0851 7.17073 18.5383 7.47261C17.9549 7.79344 17.4547 8.17261 17.0785 8.73844C16.7022 9.30428 16.5447 9.9124 16.4733 10.5745C16.4062 11.1957 16.4062 11.9526 16.4062 12.8451V24.4418C15.5194 23.8751 14.4692 23.6197 13.4212 23.7158C12.3732 23.8119 11.387 24.2541 10.6181 24.9726C9.84917 25.6912 9.34126 26.6452 9.17444 27.6843C9.00761 28.7233 9.19136 29.7884 9.69672 30.7115C10.2021 31.6346 11.0003 32.3633 11.9655 32.7826C12.9308 33.202 14.0081 33.2882 15.0277 33.0276C16.0473 32.767 16.9512 32.1744 17.5969 31.3434C18.2425 30.5123 18.5932 29.49 18.5937 28.4376V18.2409Z"
            fill="#5E5E5E"
          ></path>
          <path
            opacity="0.5"
            d="M11.3022 2.91675C11.3022 2.62667 11.1869 2.34847 10.9818 2.14335C10.7767 1.93823 10.4985 1.823 10.2084 1.823C9.91834 1.823 9.64014 1.93823 9.43502 2.14335C9.22991 2.34847 9.11467 2.62667 9.11467 2.91675V11.3167C8.22787 10.7501 7.1777 10.4947 6.1297 10.5908C5.08171 10.6869 4.09552 11.1291 3.32659 11.8476C2.55767 12.5661 2.04976 13.5202 1.88293 14.5592C1.71611 15.5983 1.89986 16.6634 2.40521 17.5865C2.91057 18.5096 3.70879 19.2383 4.67402 19.6576C5.63926 20.077 6.7166 20.1631 7.73622 19.9025C8.75584 19.6419 9.65972 19.0494 10.3054 18.2183C10.951 17.3873 11.3017 16.365 11.3022 15.3126V7.29904C12.3215 8.03404 13.5334 8.3855 14.5834 8.3855C14.8735 8.3855 15.1517 8.27026 15.3568 8.06515C15.5619 7.86003 15.6772 7.58183 15.6772 7.29175C15.6772 7.00167 15.5619 6.72347 15.3568 6.51835C15.1517 6.31323 14.8735 6.198 14.5834 6.198C13.7907 6.17865 13.027 5.89536 12.4134 5.393C11.7805 4.87237 11.3022 4.0805 11.3022 2.91675Z"
            fill="#5E5E5E"
          ></path></svg
        ><svg
          width="58"
          height="57"
          viewBox="0 0 58 57"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
          style="flex-grow: 0; flex-shrink: 0; width: 58px; height: 57px; position: relative;"
          preserveAspectRatio="none"
        >
          <path
            d="M12.0833 19H42.0833M12.0833 26.5H42.0833M12.0833 34H24.9404"
            stroke="#5E5E5E"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          ></path>
        </svg>
      </div>
    </div>
  </div>
  <div style="width: 514px; height: 189px;">
    <div
      style="width: 338px; height: 135px; position: absolute; left: 536px; top: 285px; filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));"
    >
      <p
        style="width: 338px; height: 135px; position: absolute; left: 0px; top: 0px; font-size: 16px; text-align: left; color: #5e5e5e;"
      >
        체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한
        영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고
        도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다.
      </p>
    </div>
    <p
      style="width: 63px; height: 32px; position: absolute; left: 372px; top: 231px; font-size: 25px; text-align: left; color: #757575;"
    >
      02일
    </p>
    <img
      src="unsplash:t2sai-aqipi.jpeg"
      style="width: 135px; height: 135px; position: absolute; left: 359.5px; top: 284.5px; border-radius: 20px; object-fit: cover;"
    />
  </div>
</div>

<style type="text/css">

body {
	color: #5e5e5e; /* 본문 텍스트 색상 */
	overflow: hidden; /* 스크롤 막기 */
	font-family: "Exo 2", "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
	margin: 0; /* 바깥 여백 설정 */
	padding: 0; /* 안쪽 여백 설정 */
	-webkit-touch-callout: none; /* iOS 길게 누르면 메뉴 뜨는 것 막기 */
	-webkit-user-select: none; /* 텍스트 선택 방지 */
	-khtml-user-select: none; /* 텍스트 선택 방지 (KHTML 엔진) */
	-moz-user-select: none; /* 텍스트 선택 방지 (Gecko 엔진) */
	-ms-user-select: none; /* 텍스트 선택 방지 (마이크로소프트 엔진) */
	user-select: none; /* 텍스트 선택 방지 */
	width: 100%; /* 너비 100% 설정 */
	height: 100%; /* 높이 100% 설정 */
	min-height: 100vh; /* 최소 높이 100% 설정 */
	position: relative; /* 상대 위치 설정 */
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	flex-wrap: wrap; /* Flexbox 줄 바꿈 */
	background-image:
		url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg");
	/* 배경 이미지 설정 */
	background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
	background-position: center; /* 배경 이미지 가운데 정렬 */
	background-size: cover; /* 배경 이미지를 컨테이너에 맞추어 표시 */
}

.top_btn {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	margin-top: 15.5px; /* 위쪽 여백 설정 */
	height: 30px; /* 높이 설정 */
	margin-right: 20px; /* 오른쪽 여백 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
}

.search_box {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-size: 17px;
	display: none;
	position: absolute; /* 절대 위치 설정 */
	margin-top: 22px; /* 위쪽 여백 설정 */
	margin-right: 350px;
	width: 285px;
	height: 35px;
	border-radius: 35px;
	padding-top: 5px;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
	opacity: 1;
	-webkit-animation: fadeIn 0.15s ease-out;
}
.fadeIn {
    -webkit-animation: fadeIn 0.15s ease-out;
    display: block;
}

.fadeOut {
    -webkit-animation: fadeOut 0.15s ease-out;
    display: block;
    -webkit-animation-fill-mode: forwards; /* 애니메이션이 끝나고 마지막 프레임을 유지 */
}
input {
    background-color: transparent; /* 검색창 배경색 투명하게 설정 */
}

.list_box {
    width: 620px;
    height: 243px;
    position: absolute;
    left: 975.5px;
    top: 726.5px;
    opacity: 0.5;
    border-radius: 55px;
    background: #e2e2e2;
}

/* 最初の<div>要素 */
.box {
  width: 1334px;
  height: 862px;
  position: absolute;
  left: 292px;
  top: 134px;
  opacity: 0.5;
  border-radius: 65px;
  background: #e2e2e2;
  box-shadow: 5px 5px 30px 3px rgba(0,0,0,0.25);
}

/* 二番目の<div>要素 */
.box2 {
  width: 1796px;
  height: 48px;
}
/* monthly */

box-sizing: border-box;

{
position: relative;
width: 1920px;
height: 1080px;

background: linear-gradient(0deg, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)),
  #ffffff;
border: 1px solid #000000;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

/* marjan-blan-ADfPdLBMeY8-unsplash 1 */
{
position: absolute;
width: 1958px;
height: 1306px;
left: calc(50% - 1958px / 2);
top: calc(50% - 1306px / 2);
background: url(marjan-blan-ADfPdLBMeY8-unsplash.jpg);
}

/* date background */
{
position: absolute;
width: 1334px;
height: 862px;
left: calc(50% - 1334px / 2);
top: calc(50% - 862px / 2 + 26px);
background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: 5px 5px 30px 3px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 65px;
}
/* top bar */
{
position: absolute;
width: 1796px;
height: 48px;
left: 75px;
top: 25px;
}

/* logo */
{
position: absolute;
width: 82px;
height: 48px;
left: 75px;
top: 25px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 36px;
line-height: 44px;

color: #787575;
}
/* 🦆 icon "search outline" */
{
position: absolute;
width: 46px;
height: 45.91px;
left: 1825px;
top: 26px;
}
/* Vector */
{
position: absolute;
left: 95.05%;
right: 2.55%;
top: 2.41%;
bottom: 93.34%;

background: #ffffff;
opacity: 0;
}
/* Vector */
{
position: absolute;
left: 95.35%;
right: 2.85%;
top: 2.94%;
bottom: 93.87%;

background: #5e5e5e;
{
/* title */
{
position: absolute;
width: 143px;
height: 32px;
left: 888px;
top: 153px;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
}
/* 3월기록 */
{
position: absolute;
width: 121px;
height: 32px;
left: 888px;
top: 153px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.4em;

color: #5e5e5e;
}
/* Vector */
{
position: absolute;
width: 14px;
height: 10px;
left: 1017px;
top: 162px;

background: #5e5e5e;
}
/* box7 */
{
position: absolute;
width: 1283px;
height: 765px;
left: 313px;
top: 205px;
}
/* write background */
{
position: absolute;
width: 620px;
height: 243px;
left: calc(50% - 620px / 2 + 326px);
top: calc(50% - 243px / 2 + 308.5px);

background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: inset 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 55px;
}
/* write background */
{
position: absolute;
width: 620px;
height: 243px;
left: calc(50% - 620px / 2 + 317px);
top: calc(50% - 243px / 2 + 47.5px);

background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: inset 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 55px;
}
/* write background */
{
position: absolute;
width: 620px;
height: 243px;
left: calc(50% - 620px / 2 + 315px);
top: calc(50% - 243px / 2 - 213.5px);

background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: inset 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 55px;
}
/* write background */
{
position: absolute;
width: 620px;
height: 243px;
left: calc(50% - 620px / 2 - 326px);
top: calc(50% - 243px / 2 + 308.5px);

background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: inset 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 55px;
}
/* write background */
{
position: absolute;
width: 620px;
height: 243px;
left: calc(50% - 620px / 2 - 337px);
top: calc(50% - 243px / 2 + 47.5px);

background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: inset 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 55px;
}
/* write background */
{
position: absolute;
width: 620px;
height: 243px;
left: calc(50% - 620px / 2 - 337px);
top: calc(50% - 243px / 2 - 212.5px);

background: #e2e2e2;
mix-blend-mode: normal;
opacity: 0.5;
box-shadow: inset 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
backdrop-filter: blur(30px);
/* Note: backdrop-filter has minimal browser support */
border-radius: 55px;
}
/* box6 */
{
position: absolute;
width: 524px;
height: 169px;
left: 1023px;
top: 753px;
}
/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. */
{
position: absolute;
width: 512px;
height: 135px;
left: calc(50% - 512px / 2 + 331px);
top: 787px;
overflow-y: scroll;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
}
/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. */
{
position: absolute;
left: 0%;
right: 0%;
top: 0%;
bottom: 0%;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 16px;
line-height: 19px;
display: flex;
align-items: center;
text-align: center;
letter-spacing: 0.15em;

color: #5e5e5e;
}
/* 25일 */
{
position: absolute;
width: 63px;
height: 32px;
left: 1023px;
top: 753px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}
/* box5 */
{
position: absolute;
width: 544px;
height: 199px;
left: 1014px;
top: 482px;
}
/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. */
{
position: absolute;
width: 338px;
height: 135px;
left: 1197px;
top: 546px;
overflow-y: scroll;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
}
/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. */

position: absolute;
left: 0%;
right: 0%;
top: 0%;
bottom: 0%;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 16px;
line-height: 19px;
display: flex;
align-items: center;
letter-spacing: 0.15em;

color: #5e5e5e;

/* 21일 */

position: absolute;
width: 63px;
height: 32px;
left: 1023px;
top: 492px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

/* unsplash:nnzkZNYWHaU */

position: absolute;
width: 135px;
height: 135px;
left: 1014px;
top: 546px;

background: url(.jpg);
border-radius: 20px;

/* box bar(4) */

position: absolute;
width: 304px;
height: 57px;
left: 1254px;
top: 482px;

/* arcticons:map */

position: absolute;
width: 35px;
height: 35px;
left: 1254px;
top: 493px;

/* Vector */

position: absolute;
left: 19.13%;
right: 19.12%;
top: 9.38%;
bottom: 9.38%;

border: 1px solid #5e5e5e;

/* arcticons:accuweather */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 + 380.5px);
top: calc(50% - 35px / 2 - 29.5px);

/* Vector */

position: absolute;
left: 23.01%;
right: 22.92%;
top: 23.01%;
bottom: 22.92%;

border: 1px solid #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 5.21%;
top: 5.21%;
bottom: 5.21%;

border: 1px solid #5e5e5e;

/* tabler:mood-check */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 + 451.5px);
top: calc(50% - 35px / 2 - 29.5px);

/* Group */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

/* Vector */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* Vector */

position: absolute;
left: 39.58%;
right: 12.5%;
top: 62.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* music title */

/* Auto layout */
display: flex;
flex-direction: row;
justify-content: center;
align-items: center;
padding: 0px;

position: absolute;
width: 93px;
height: 57px;
left: calc(50% - 93px / 2 + 551.5px);
top: calc(50% - 57px / 2 - 29.5px);

/* solar:music-notes-bold-duotone */

width: 35px;
height: 35px;

/* Inside auto layout */
flex: none;
order: 0;
flex-grow: 0;

/* Vector */

position: absolute;
left: 26.04%;
right: 5.21%;
top: 9.75%;
bottom: 5.21%;

background: #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 55.21%;
top: 5.21%;
bottom: 42.71%;

background: #5e5e5e;
opacity: 0.5;

/* majesticons:text-line */

width: 58px;
height: 57px;

/* Inside auto layout */
flex: none;
order: 1;
flex-grow: 0;

/* Vector */

position: absolute;
left: 20.83%;
right: 27.44%;
top: 33.33%;
bottom: 40.35%;

border: 2px solid #5e5e5e;

/* box4 */

position: absolute;
width: 533px;
height: 201px;
left: 1014px;
top: 219px;

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. */

position: absolute;
width: 338px;
height: 135px;
left: 1195px;
top: 284px;
overflow-y: scroll;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. */

position: absolute;
left: 0%;
right: 0%;
top: 0%;
bottom: 0%;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 16px;
line-height: 19px;
display: flex;
align-items: center;
letter-spacing: 0.15em;

color: #5e5e5e;

/* 19일 */

position: absolute;
width: 63px;
height: 32px;
left: 1021px;
top: 231px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

/* unsplash:zcUgjyqEwe8 */

position: absolute;
width: 135px;
height: 135px;
left: 1014px;
top: 285px;

background: url();
border-radius: 20px;

/* box bar(3) */

position: absolute;
width: 235px;
height: 57px;
left: 1312px;
top: 219px;

/* arcticons:accuweather */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 + 369.5px);
top: calc(50% - 35px / 2 - 292.5px);

/* Vector */

position: absolute;
left: 23.01%;
right: 22.92%;
top: 23.01%;
bottom: 22.92%;

border: 1px solid #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 5.21%;
top: 5.21%;
bottom: 5.21%;

border: 1px solid #5e5e5e;

/* tabler:mood-check */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 + 440.5px);
top: calc(50% - 35px / 2 - 292.5px);

/* Group */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

/* Vector */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* Vector */

position: absolute;
left: 39.58%;
right: 12.5%;
top: 62.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* music title */

/* Auto layout */
display: flex;
flex-direction: row;
justify-content: center;
align-items: center;
padding: 0px;

position: absolute;
width: 93px;
height: 57px;
left: calc(50% - 93px / 2 + 540.5px);
top: calc(50% - 57px / 2 - 292.5px);

/* solar:music-notes-bold-duotone */

width: 35px;
height: 35px;

/* Inside auto layout */
flex: none;
order: 0;
flex-grow: 0;

/* Vector */

position: absolute;
left: 26.04%;
right: 5.21%;
top: 9.75%;
bottom: 5.21%;

background: #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 55.21%;
top: 5.21%;
bottom: 42.71%;

background: #5e5e5e;
opacity: 0.5;

/* majesticons:text-line */

width: 58px;
height: 57px;

/* Inside auto layout */
flex: none;
order: 1;
flex-grow: 0;

/* Vector */

position: absolute;
left: 20.83%;
right: 27.44%;
top: 33.33%;
bottom: 40.35%;

border: 2px solid #5e5e5e;

/* box3 */

position: absolute;
width: 544px;
height: 203px;
left: 372px;
top: 740px;

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. */

position: absolute;
width: 338px;
height: 135px;
left: 547px;
top: 807px;
overflow-y: scroll;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. */

position: absolute;
left: 0%;
right: 0%;
top: 0%;
bottom: 0%;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 16px;
line-height: 19px;
display: flex;
align-items: center;
letter-spacing: 0.15em;

color: #5e5e5e;

/* 13일 */

position: absolute;
width: 63px;
height: 32px;
left: 380px;
top: 753px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

/* unsplash:9XngoIpxcEo */

position: absolute;
width: 135px;
height: 135px;
left: 372px;
top: 808px;

background: url(.jpg);
border-radius: 20px;

/* box bar(4) */

position: absolute;
width: 304px;
height: 57px;
left: 612px;
top: 740px;

/* arcticons:map */

position: absolute;
width: 35px;
height: 35px;
left: 612px;
top: 751px;

/* Vector */

position: absolute;
left: 19.13%;
right: 19.12%;
top: 9.38%;
bottom: 9.38%;

border: 1px solid #5e5e5e;

/* arcticons:accuweather */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 - 261.5px);
top: calc(50% - 35px / 2 + 228.5px);

/* Vector */

position: absolute;
left: 23.01%;
right: 22.92%;
top: 23.01%;
bottom: 22.92%;

border: 1px solid #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 5.21%;
top: 5.21%;
bottom: 5.21%;

border: 1px solid #5e5e5e;

/* tabler:mood-check */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 - 190.5px);
top: calc(50% - 35px / 2 + 228.5px);

/* Group */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

/* Vector */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* Vector */

position: absolute;
left: 39.58%;
right: 12.5%;
top: 62.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* music title */

/* Auto layout */
display: flex;
flex-direction: row;
justify-content: center;
align-items: center;
padding: 0px;

position: absolute;
width: 93px;
height: 57px;
left: calc(50% - 93px / 2 - 90.5px);
top: calc(50% - 57px / 2 + 228.5px);

/* solar:music-notes-bold-duotone */

width: 35px;
height: 35px;

/* Inside auto layout */
flex: none;
order: 0;
flex-grow: 0;

/* Vector */

position: absolute;
left: 26.04%;
right: 5.21%;
top: 9.75%;
bottom: 5.21%;

background: #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 55.21%;
top: 5.21%;
bottom: 42.71%;

background: #5e5e5e;
opacity: 0.5;

/* majesticons:text-line */

width: 58px;
height: 57px;

/* Inside auto layout */
flex: none;
order: 1;
flex-grow: 0;

/* Vector */

position: absolute;
left: 20.83%;
right: 27.44%;
top: 33.33%;
bottom: 40.35%;

border: 2px solid #5e5e5e;

/* box2 */

position: absolute;
width: 533px;
height: 192px;
left: 372px;
top: 482px;

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. */

position: absolute;
width: 512px;
height: 135px;
left: calc(50% - 512px / 2 - 332px);
top: 539px;
overflow-y: scroll;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. */

position: absolute;
left: 0%;
right: 0%;
top: 0%;
bottom: 0%;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 16px;
line-height: 19px;
display: flex;
align-items: center;
text-align: center;
letter-spacing: 0.15em;

color: #5e5e5e;

/* 06일 */

position: absolute;
width: 63px;
height: 32px;
left: 380px;
top: 497px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

/* box bar(3) */

position: absolute;
width: 235px;
height: 57px;
left: 670px;
top: 482px;

/* arcticons:accuweather */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 - 272.5px);
top: calc(50% - 35px / 2 - 29.5px);

/* Vector */

position: absolute;
left: 23.01%;
right: 22.92%;
top: 23.01%;
bottom: 22.92%;

border: 1px solid #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 5.21%;
top: 5.21%;
bottom: 5.21%;

border: 1px solid #5e5e5e;

/* tabler:mood-check */

position: absolute;
width: 35px;
height: 35px;
left: calc(50% - 35px / 2 - 201.5px);
top: calc(50% - 35px / 2 - 29.5px);

/* Group */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

/* Vector */

position: absolute;
left: 12.5%;
right: 12.5%;
top: 12.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* Vector */

position: absolute;
left: 39.58%;
right: 12.5%;
top: 62.5%;
bottom: 12.5%;

border: 2px solid #5e5e5e;

/* music title */

/* Auto layout */
display: flex;
flex-direction: row;
justify-content: center;
align-items: center;
padding: 0px;

position: absolute;
width: 93px;
height: 57px;
left: calc(50% - 93px / 2 - 101.5px);
top: calc(50% - 57px / 2 - 29.5px);

/* solar:music-notes-bold-duotone */

width: 35px;
height: 35px;

/* Inside auto layout */
flex: none;
order: 0;
flex-grow: 0;

/* Vector */

position: absolute;
left: 26.04%;
right: 5.21%;
top: 9.75%;
bottom: 5.21%;

background: #5e5e5e;

/* Vector */

position: absolute;
left: 5.21%;
right: 55.21%;
top: 5.21%;
bottom: 42.71%;

background: #5e5e5e;
opacity: 0.5;

/* majesticons:text-line */

width: 58px;
height: 57px;

/* Inside auto layout */
flex: none;
order: 1;
flex-grow: 0;

/* Vector */

position: absolute;
left: 20.83%;
right: 27.44%;
top: 33.33%;
bottom: 40.35%;

border: 2px solid #5e5e5e;

/* box1 */

position: absolute;
width: 514px;
height: 189px;
left: 360px;
top: 231px;

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. 헌법재판소의 장은 국회의 동의를 얻어 재판관중에서 대통령이 임명한다. 대법원장과 대법관이 아닌 법관의 임기는 10년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다. */

position: absolute;
width: 338px;
height: 135px;
left: 536px;
top: 285px;
overflow-y: scroll;

filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));

/* 체포·구속·압수 또는 수색을 할 때에는 적법한 절차에 따라 검사의 신청에 의하여 법관이 발부한 영장을 제시하여야 한다. 다만, 현행범인인 경우와 장기 3년 이상의 형에 해당하는 죄를 범하고 도피 또는 증거인멸의 염려가 있을 때에는 사후에 영장을 청구할 수 있다. */

position: absolute;
left: 0%;
right: 0%;
top: 0%;
bottom: 0%;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 16px;
line-height: 19px;
display: flex;
align-items: center;
letter-spacing: 0.15em;

color: #5e5e5e;

/* 02일 */

position: absolute;
width: 63px;
height: 32px;
left: 372px;
top: 231px;

font-family: "Inter";
font-style: normal;
font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

/* unsplash:t2Sai-AqIpI */

position: absolute;
width: 135px;
height: 135px;
left: 360px;
top: 285px;

background: url(.jpg);
border-radius: 20px;


@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
</style>
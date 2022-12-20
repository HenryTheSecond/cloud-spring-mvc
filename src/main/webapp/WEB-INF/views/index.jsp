<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Auto Resize Textarea | CodingNepal</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(#4671ea, #ac34e7);
  height: 100vh;
  position: relative;
  overflow: hidden;
}

.wrapper {
  width: 80%;
  background: #fff;
  border-radius: 5px;
  padding: 25px 25px 30px;
  box-shadow: 8px 8px 10px rgba(0, 0, 0, 0.06);
  position: relative;
  margin-top: 50px;
}
.wrapper h2 {
  color: black;
  font-size: 28px;
  text-align: center;
}
.form-translate .form-area {
  width: 100%;
  display: flex;
  flex-direction: column;
  text-align: center;
}

.textarea-1,
.textarea-2 {
  width: 100%;
  display: flex;
  flex-direction: column;
  margin-top: 20px;
}

.textarea-1 textarea,
.textarea-2 textarea {
  width: 100%;
  resize: none;
  height: 200px;
  outline: none;
  padding: 15px;
  font-size: 16px;
  max-height: 330px;
  caret-color: #4671ea;
  border: none;
  border-top: 1px solid #bfbfbf;
  border-bottom: 1px solid #bfbfbf;
}

.textarea-1 textarea {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-left: 1px solid #bfbfbf;
  border-right: 1px solid #bfbfbf;
}

.textarea-2 textarea {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-right: 1px solid #bfbfbf;
}

textarea::placeholder {
  color: #b3b3b3;
}

label {
  color: #b3b3b3;
}

textarea::-webkit-scrollbar {
  width: 0px;
}

.btn-submit {
  margin: 20px;
}

.btn-submit button {
  height: 50px;
  min-width: 100px;
  border-radius: 10px;
  border: none;
  background: linear-gradient(#4671ea, #ac34e7);
  font-weight: 600;
  font-size: 16px;
}

select#language {
  border: none;
  color: #b3b3b3;
  font-size: 16px;
  outline: none;
}

.form-translate,
.form-history {
  position: absolute;
  transition: all 2s;
}

.form-history .history-header {
  display: flex;
  border-bottom: 1px solid #cccc;
  padding: 20px 0;
}

.history-header .translated-word,
.history-header .translation-word {
  width: 50%;
  text-align: center;
}

.form-history .history-content {
  display: flex;
  flex-direction: column;
  max-height: 280px;
  padding: 10px 0;
  overflow: auto;
}

.history-content,
.word {
  display: flex;
  padding: 10px 0;
}

.word .translated-word,
.word .translation-word {
  width: 50%;
  text-align: center;
  word-break: break-word;
  padding: 10px;
}

.option {
  position: absolute;
  top: 50px;
  left: 50px;
  display: flex;
}

.change-type {
  width: 100px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}

.bg-active {
  position: absolute;
  width: 100px;
  left: 0;
  transition: 1s;
  background-color: white;
  height: 40px;
  z-index: -1;
  border-radius: 20px;
}

.translate .form-history {
  right: -100%;
  top: 50%;
  transform: translate(0, -50%);
  opacity: 0;
}

.history .form-translate {
  left: -100%;
  top: 50%;
  transform: translate(0, -50%);
  opacity: 0;
}

.translate .form-translate {
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  opacity: 1;
}

.history .form-history {
  right: 50%;
  top: 50%;
  transform: translate(50%, -50%);
  opacity: 1;
}

</style>
</head>
<body class="translate" id="body" >


	<div class="option">
		<div class="bg-active" id="bg-active"></div>
		<div class="change-type" id="translate">Translate</div>
		<div class="change-type" id="history">History</div>
	</div>


	<div class="wrapper form-translate">
		<h2>Translate</h2>
		<div style="display: flex">
			<div class="textarea-1">
			
				<div>
					<label>Lựa chọn ngôn ngữ:</label> <select name="languageSource"
						id="languageSource">
						<option value="vi">Tiếng việt</option>
						<option value="en" selected="true">Tiếng anh</option>
						<option value="zh">Tiếng Trung Quốc</option>
						<option value="ja">Tiếng Nhật</option>
					</select>
				</div>

				<textarea id="source" spellcheck="false"
					placeholder="Hãy nhập gì đó ..." required></textarea>
			</div>
			
			<div class="textarea-2">
				<div>
					<label>Lựa chọn ngôn ngữ:</label> <select name="languageDestination"
						id="languageDestination">
						<option value="vi" selected="true">Tiếng việt</option>
						<option value="en">Tiếng anh</option>
						<option value="zh">Tiếng Trung Quốc</option>
						<option value="ja">Tiếng Nhật</option>
					</select>
				</div>
				<textarea id="destination" spellcheck="false" placeholder="Bản dịch" readonly="readonly">Read-only</textarea>
			</div>
		</div>

		<div id = "submit" class="btn-submit">
			<button type="submit">Dịch</button>
		</div>
	</div>



	<div class="wrapper form-history">
		<h2>Translation history</h2>
		<div class="history-header">
			<div class="translated-word">
				<label>Từ dịch</label>
			</div>
			<div class="translation-word">
				<label>Nghĩa của từ</label>
			</div>
		</div>
		<div class="history-content" id="history-content">
			<div class="word">
				<div class="translated-word">family</div>
				<div class="translation-word">gia đình</div>
			</div>
			<div class="word">
				<div class="translated-word">history</div>
				<div class="translation-word">lịch sử</div>
			</div>
			<div class="word">
				<div class="translated-word">manhwa</div>
				<div class="translation-word">truyện tranh</div>
			</div>
			<div class="word">
				<div class="translated-word">family</div>
				<div class="translation-word">gia đình</div>
			</div>
			<div class="word">
				<div class="translated-word">history</div>
				<div class="translation-word">lịch sử</div>
			</div>
		</div>
	</div>

	<script>
    const textarea_1 = document.getElementById("languageSource");
    const textarea_2 = document.getElementById("languageDestination");
    textarea_1.addEventListener("keyup", e => {
      textarea_1.style.height = "200px";
      textarea_2.style.height = "200px";
      let scHeight = e.target.scrollHeight;
      textarea_1.style.height = `${scHeight}px`;
      textarea_2.style.height = `${scHeight}px`;
    });
  </script>

	<script src="jquery-3.5.1.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	    let options = document.querySelectorAll(".change-type");
	    let bgactive = document.getElementById("bg-active");
	    let body = document.getElementById("body");
	
	    options.forEach(val => {
	      val.addEventListener("click", function (event) {
	        if (this.id === "history") {
	        	fetch("/api/get-history", {
	        		method: "get",
	        		headers: {
			            "Content-Type": "application/json",
			            "Accept-Charset": "utf-8"
			        }
	        	}).then(function(res){
					return res.json()
				}).then(function(data){
					console.log(data[0])
					const historyContent = document.getElementById("history-content");
					historyContent.innerHTML = "";
					for(let i = 0; i < data.length; i++){
						console.log(data[i])
						historyContent.innerHTML += '<div class="word"> <div class="translated-word">' + data[i].content + '</div> <div class="translation-word">' + data[i].translatedContent + '</div> </div>'
					}
				}) 
	        	
	          body.classList.remove("translate");
	          body.classList.add("history");
	        } else {
	          body.classList.remove("history");
	          body.classList.add("translate");
	        }
	        bgactive.style.left = this.offsetLeft + "px"; 
	      })
	    })
		
	
	
	
		const submit = document.getElementById("submit")
		const selectLanguageSource = document.getElementById("languageSource")
		const selectLanguageDestination = document.getElementById("languageDestination")
		var languageSource = selectLanguageSource.value
		var languageDestination = selectLanguageDestination.value
		//selectLanguageSource.onchange = selectSourceChange
		
		submit.onclick = function(){
			fetch("/api/translate",{
				method : "post",
				body: JSON.stringify({
					"source": document.getElementById("source").value,
					"sourceLanguage": selectLanguageSource.value,
					"destinationLanguage": selectLanguageDestination.value
		        }),
		        headers: {
		            "Content-Type": "application/json",
		            "Accept-Charset": "utf-8"
		        }
			}).then(function(res){
				return res.json()
			}).then(function(data){
				document.getElementById("destination").value = data.destination
			})    		
		}
		
		function selectSourceChange(obj){
			if(obj.target.value == languageDestination){
				const tmp = obj.target.value
				obj.target.value = languageDestination
				languageDestination = tmp
				selectLanguageDestination.value = languageDestination
			}
			languageSource = obj.target.value
		}
	</script>
</body>
</html>
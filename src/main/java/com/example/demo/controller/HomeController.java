package com.example.demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.model.Source;
import com.example.demo.model.TranslateHistory;
import com.example.demo.repository.TranslateHistoryRepository;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Controller
public class HomeController {

  @Autowired
  private TranslateHistoryRepository translateHistoryRepository;

  @RequestMapping("home")
  public String index() {
    return "index";
  }

  @RequestMapping(value = "api/translate")
  @ResponseBody
  public Map<String, String> translate(@RequestBody Map<String, String> bodyRequest) throws IOException {
    Map<String, String> result = new HashMap<String, String>();

    OkHttpClient client = new OkHttpClient();
    MediaType mediaType = MediaType.parse("application/json");
    List<Source> listSource = new ArrayList();
    Source src = new Source(bodyRequest.get("source"));
    String from = bodyRequest.get("sourceLanguage");
    String to = bodyRequest.get("destinationLanguage");
    listSource.add(src);
    Gson gson = new Gson();
    okhttp3.RequestBody body = okhttp3.RequestBody.create(mediaType, gson.toJson(listSource));
    Request request = new Request.Builder()
        .url("https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&from=" + from.trim() + "&to="
            + to.trim())
        .post(body).addHeader("Ocp-Apim-Subscription-Key", "d11f37918a684dae81b975ce1ad0fb3f")
        .addHeader("Ocp-Apim-Subscription-Region", "southeastasia").addHeader("Content-type", "application/json")
        .build();
    Response response = client.newCall(request).execute();

    JsonParser parser = new JsonParser();
    JsonElement json = parser.parse(response.body().string());

    TranslateHistory history = new TranslateHistory();
    history.setContent(src.getText());
    history.setTranslatedContent(json.getAsJsonArray().get(0).getAsJsonObject().getAsJsonArray("translations").get(0)
        .getAsJsonObject().get("text").toString().replace("\"", ""));
    // history.setFromLanguage(from);
    // history.setToLanguage(to);
    translateHistoryRepository.save(history);
    // System.out.println(history.getContent());

    result.put("destination", json.getAsJsonArray().get(0).getAsJsonObject().getAsJsonArray("translations").get(0)
        .getAsJsonObject().get("text").toString().replace("\"", ""));
    return result;
  }

  @GetMapping("/api/get-history")
  @ResponseBody
  public List<TranslateHistory> getAllHistory() {
    List<TranslateHistory> result = translateHistoryRepository.findAll();
    Collections.sort(result, (t1, t2) -> {
      return t2.getId() > t1.getId() ? 1 : -1;
    });
    return result;
  }
}

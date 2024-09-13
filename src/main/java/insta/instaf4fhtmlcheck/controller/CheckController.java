package insta.instaf4fhtmlcheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class CheckController {

    @PostMapping("/check")
    public String check(@RequestParam String followersCode, @RequestParam String followingsCode, Model model) {
        // 주어진 문자열
        String input = followersCode;
        String userId = "<span class=\"_ap3a _aaco _aacw _aacx _aad7 _aade\" dir=\"auto\">(.*?)</span>";
        String userName = "<span class=\"x1lliihq x193iq5w x6ikm8r x10wlt62 xlyipyv xuxw1ft\">(.*?)</span>";

        Pattern pattern1 = Pattern.compile(userId);
        Pattern pattern2 = Pattern.compile(userName);
        Matcher matcher1 = pattern1.matcher(input);
        Matcher matcher2 = pattern1.matcher(input);


        List<String> followersList = new ArrayList<>();
        HashMap<String, String> followersMap = new HashMap<>();;
        while (matcher1.find()&&matcher2.find()) {
            followersList.add(matcher1.group(1));
            followersMap.put(matcher1.group(1), matcher2.group(1));
        }


        input = followingsCode;
        matcher1 = pattern1.matcher(input);
        matcher2 = pattern2.matcher(input);


        List<String> followingsList = new ArrayList<>();
        HashMap<String, String> followingsMap = new HashMap<>();;
        while (matcher1.find()&&matcher2.find()) {
            followingsList.add(matcher1.group(1));
            followingsMap.put(matcher1.group(1), matcher2.group(1));
        }

        List<String> dontFollowMeBack = new ArrayList<>();
        for (String following : followingsList) {
            if (!followersList.contains(following)) {
                dontFollowMeBack.add(following);
            }
        }

        List<String> iDontFollowBack = new ArrayList<>();
        for (String follower : followersList) {
            if (!followingsList.contains(follower)) {
                iDontFollowBack.add(follower);
            }
        }
        model.addAttribute("dontFollowMeBack",dontFollowMeBack);
        model.addAttribute("iDontFollowBack",iDontFollowBack);
        model.addAttribute("followersMap",followersMap);
        model.addAttribute("followingMap",followingsMap);
        System.out.println("확인완료!");
        return "result";
    }



}

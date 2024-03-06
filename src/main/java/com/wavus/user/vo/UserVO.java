package com.wavus.user.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
public class UserVO {
    private Long userId;
    private String username;
    private String email;
    private String password;
}

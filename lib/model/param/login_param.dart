class LoginParam {
    var client_id = "dd031b32d2f56c990b1425efe6c42ad847e7fe3ab46bf1299f05ecd856bdb7dd";
    var grant_type = "password";
    final String password;
    final String username;

    LoginParam({this.password, this.username});

    factory LoginParam.fromJson(Map<String, dynamic> json) {
        return LoginParam(
            password: json['password'],
            username: json['username'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['client_id'] = this.client_id;
        data['grant_type'] = this.grant_type;
        data['password'] = this.password;
        data['username'] = this.username;
        return data;
    }
}
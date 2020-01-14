class Authenticate {
    final String access_token;
    final int created_at;
    final int expires_in;
    final String refresh_token;
    final String scope;
    final String token_type;

    Authenticate({this.access_token, this.created_at, this.expires_in, this.refresh_token, this.scope, this.token_type});

    factory Authenticate.fromJson(Map<String, dynamic> json) {
        return Authenticate(
            access_token: json['access_token'],
            created_at: json['created_at'],
            expires_in: json['expires_in'],
            refresh_token: json['refresh_token'],
            scope: json['scope'],
            token_type: json['token_type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['access_token'] = this.access_token;
        data['created_at'] = this.created_at;
        data['expires_in'] = this.expires_in;
        data['refresh_token'] = this.refresh_token;
        data['scope'] = this.scope;
        data['token_type'] = this.token_type;
        return data;
    }
}
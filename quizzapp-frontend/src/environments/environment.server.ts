export const Environment = {
  production: true,
  apiUrl: 'https://servermarca.duckdns.org/beQuiz',
  siteUrl: 'https://servermarca.duckdns.org/quizzapp',
  getToken(): boolean | string {
    var json = sessionStorage.getItem('user');
    if (json) {
      var dataSessionStorage = JSON.parse(json);
      if (dataSessionStorage) {
        var token = dataSessionStorage['token'];
        return token;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  },
  getEmail(): boolean | string {
    var json = sessionStorage.getItem('user');
    if (json) {
      var dataSessionStorage = JSON.parse(json);
      if (dataSessionStorage) {
        var email = dataSessionStorage['email'];
        return email;
      }
      else {
        return false;
      }
    }
    else {
      return false;
    }
  },
  siteKey: '6LeQK_klAAAAAJAzQZu9tCgizwpTK_e2lSZ_urTZ'
};
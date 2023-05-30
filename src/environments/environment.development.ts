export const Environment = {
  production: false,
  apiUrl: 'http://localhost:8888',
  siteUrl: 'http://localhost:4200',
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
  siteKey: '6LeQK_klAAAAAJAzQZu9tCgizwpTK_e2lSZ_urTZ',
};
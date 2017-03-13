// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

body {
  background-color: #fafafa;
  font-family: proxima-nova, 'Helvetica Neue', Arial, Helvetica, sans-serif;
}

.navbar-brand {
  a {
    color: #125688;
  }
}

.navbar-default {
  background-color: #fff;
  height: 54px;
  .navbar-nav li a {
    color: #125688;
  }
}

.navbar-container {
  width: 640px;
  margin: 0 auto;
}

.posts-wrapper {
  padding-top: 40px;
  margin: 0 auto;
  max-width: 642px;
  width: 100%;
}

.post {
  background-color: #fff;
  border-color: #edeeee;
  border-style: solid;
  border-radius: 3px;
  border-width: 1px;
  margin-bottom: 60px;
}

.post-head {
  height: 64px;
  padding: 14px 20px;
  color: #125688;
  font-size: 15px;
  line-height: 18px;
  .thumbnail {}
  .name {
    display: block;
  }
}

.image {
  border-bottom: 1px solid #eeefef;
  border-top: 1px solid #eeefef;
}

.caption {
  padding: 24px 24px;
  font-size: 15px;
  line-height: 18px;

}

.form-wrapper {
  width: 60%;
  margin: 20px auto;
  background-color: #fff;
  padding: 40px;
  border: 1px solid #eeefef;
  border-radius: 3px;
}

.edit-links {
  margin-top: 20px;
  margin-bottom: 40px;
}

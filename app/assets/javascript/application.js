// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require jquery
//= require jquery_ujs

  function sayHello() {
    alert("Hello, world!");
  }
  
  document.addEventListener("DOMContentLoaded", function() {
    var button = document.getElementById("myButton");
    button.addEventListener("click", sayHello);
  });
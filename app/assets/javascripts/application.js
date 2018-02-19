// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

function drawBarChart1(){
  var data = google.visualization.arrayToDataTable([
    ['Questions', 'Count'],
    ["Answered", window.info_json["questions_answered"]],
    ["Unanswered", window.info_json["questions_remaining"]]
  ]);
  var options = {
    bars: 'vertical',
    colors: ['#dc7633']
  };
  var chart1 = new google.charts.Bar(document.getElementById('bar_graph1'));
  chart1.draw(data, google.charts.Bar.convertOptions(options));
}
function drawBarChart2(){
  var data = google.visualization.arrayToDataTable([
    ['Questions', 'Count'],
    ["Correct Answers", window.info_json["correct_answers"]],
    ["Incorrect Answers", window.info_json["incorrect_answers"]]
  ]);
  var options = {
    bars: 'vertical',
    colors:['#f5b041']
  };
  var chart2 = new google.charts.Bar(document.getElementById('bar_graph2'));
  chart2.draw(data, google.charts.Bar.convertOptions(options)); 
}
function drawPieChart1() {
  var data = google.visualization.arrayToDataTable([
    ['Questions', 'Count'],
    ["Answered", window.info_json["questions_answered"]],
    ["Unanswered", window.info_json["questions_remaining"]]
  ]);
  var options = {
    title: 'Quiz Summary',
    colors: ['green', 'red']
  };
  var chart = new google.visualization.PieChart(document.getElementById('piechart1'));
  chart.draw(data, options);
}
function drawPieChart2() {
  var data = google.visualization.arrayToDataTable([
    ['Questions', 'Count'],
    ["Correct Answers", window.info_json["correct_answers"]],
    ["Incorrect Answers", window.info_json["incorrect_answers"]]
  ]);
  var options = {
    title: 'Solved Quiz Summary',
    colors: ['green', 'red']
  };
  var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
  chart.draw(data, options);
}
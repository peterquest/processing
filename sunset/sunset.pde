size(600,430);
colorMode(HSB, 360,100,100);
noStroke();

for (int i=0; i<250; i++) {
 for (int j=0; j<600; j++) {  
  stroke(227, 100-(i/2.6), 98); //gradient for blue sky
  point(j,i);
 }
}

for (int i=250; i<410; i++) {
  for (int j=0; j<600; j++) {
    stroke(56-((i-250)/5.0), 0+(i-250), 95); //gradient for orange/yellow
   point(j,i);
  }
} 
noStroke();
fill(52, 58, 100);
arc(300,410, 100,60, PI,TWO_PI); //the sun!

//20 fancy mountains.
for (int i=0; i<20; i++) {
  fill(0);
  int space = int(random(20)); //add random spacing between mountains
  triangle(i*30-30+space, 410, (i*30)+space, 375, (i*30+30)+space, 410);
}  

rect(0,410, 600, 20); //just a little extra fill



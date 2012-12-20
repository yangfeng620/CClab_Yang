#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
	 ofEnableSmoothing();
	 ofSetFrameRate(30);

}

//--------------------------------------------------------------
void testApp::update(){

}

void testApp::draw(){
	ofBackground(0,0,0);

	ofSetColor(255,255,255);
    ofNoFill();
	float a = (mouseX / (float) ofGetWidth()) * 3800;
	theta =ofDegToRad(a);
	ofTranslate(ofGetWidth()/2, ofGetHeight()/1.1);
	ofLine(0,0,0,-120);
	ofTranslate(0,-120);
	branch(160);

}
void testApp::branch(float h){

	h*=0.66;
    if (h > 2) {
		ofPushMatrix();
		ofRotate(theta);
		ofLine(0, 0, 0, -h);
		ofTranslate(0,-h);
		branch(h);
		ofPopMatrix();

		ofPushMatrix();
		ofRotate(-theta);
		ofLine(0, 0, 0, -h);
		ofTranslate(0,-h);
		branch(h);
		ofPopMatrix();
 }
}
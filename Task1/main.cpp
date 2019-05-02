#include <iostream>
#include "functions.h"
//#define FILENAME "E:\\Desktop\\DigitalImageProcessing\\Task1\\photos\\2_100X99.bmp"
using namespace std;
int main(int argc, char** argv) {
	IMAGE_PROCESS Image;
	cout<<"Open an image and output the information."<<endl;
	Image.show_information();
	cout<<"Write to an image."<<endl;
	Image.write_to_file();
	return 0;
}

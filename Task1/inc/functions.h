#ifndef __FUNCTIONS_H_
#define __FUNCTIONS_H_
#include "Windows.h" 
using namespace std;
class IMAGE_PROCESS{
	private:
		WORD   	bfType; 
  		DWORD	bfSize; 
  		WORD	bfReserved1;
  		WORD	bfReserved2;
  		DWORD	bfOffBits;

		DWORD   biSize;   
		LONG	biWidth;  	
		LONG	biHeight;  
		WORD   	biPlanes;  
		WORD   	biBitCount;
		DWORD   biCompression;   
		DWORD   biSizeImage;  
		LONG	biXPelsPerMeter;  	
		LONG	biYPelsPerMeter;  
		DWORD   biClrUsed;
		DWORD   biClrImportant;
	
		BYTE  	rgbBlue;   
  		BYTE  	rgbGreen;	
  		BYTE  	rgbRed;		
  		BYTE  	rgbReserved;	
	
		unsigned char 	 *pBmpBuf;
		int lineByte;
		
	public:
		int read_from_file(void);
		const char* get_path(void);
		int show_information(void);
};

#endif

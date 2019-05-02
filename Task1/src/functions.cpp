#include <iostream>
#include "functions.h"
int IMAGE_PROCESS::read_from_file(void)
{   
	BITMAPFILEHEADER head_pre;
	BITMAPINFOHEADER head; 
	RGBQUAD			 *rgb;
	const char* FilePath = get_path();
	FILE *fp = fopen(FilePath,"rb");
	if(fp==0){
		cout<<"Can't find the photo"<<endl;
		return 1;
	} 
	
	//tagBITMAPFILEHEADER
	fread(&head_pre, sizeof(BITMAPFILEHEADER),1,fp);  
	bfType	  	= head_pre.bfType;
	bfSize	  	= head_pre.bfSize;
	bfReserved1	= head_pre.bfReserved1;
	bfReserved2	= head_pre.bfReserved2;
	bfOffBits	  	= head_pre.bfOffBits;
	//tagBITMAPINFOHEADER
  	fread(&head, sizeof(BITMAPINFOHEADER), 1,fp);
  	biBitCount	  = head.biBitCount; 
  	biClrImportant  = head.biClrImportant;
	biClrUsed		  = head.biClrUsed;
  	biCompression   = head.biCompression;
	biHeight 		  = head.biHeight;
	biPlanes 		  = head.biPlanes;
	biSize 		  = head.biSize;
	biSizeImage 	  = head.biSizeImage;
	biWidth 		  = head.biWidth;
	biXPelsPerMeter = head.biXPelsPerMeter;
	biYPelsPerMeter = head.biYPelsPerMeter;
	//tagRGBQUAD
	if(biBitCount==1){
		rgb = new RGBQUAD[2];
		fread(rgb, sizeof(RGBQUAD),2,fp);
		
	}else if (biBitCount==4)
	{
		rgb = new RGBQUAD[16];
		fread(rgb, sizeof(RGBQUAD),16,fp);
		
	}else if(biBitCount==8)
	{
		rgb = new RGBQUAD[256];
		fread(rgb, sizeof(RGBQUAD),256,fp);
		
	}else{
	
	} 
  	lineByte = ((biWidth * biBitCount+31)/8)/4*4; 
 	pBmpBuf = new unsigned char[lineByte * biHeight];  
  	fread(pBmpBuf,lineByte * biHeight,1,fp); 

	fclose(fp);  
	return 0;
}
const char* IMAGE_PROCESS::get_path(void)
{
	string path;
	char ppp;
	while (1) 
	{
		cout<<"Path:";
		cin>>path;
		size_t str = path.find_last_of("\\");
		cout<<"The file path is '"<<path.substr(0,str+1)<<endl;
		cout<<"The file name is '"<<path.substr(str+1)<<"'"<<endl;
		cout<<"Is that right?(y = yes , n = no) ";
		cin>>ppp;
		if(ppp=='y') 
		{
			return path.c_str();
			break; 
		}
		else cout<<"Sorry, please try again!"<<endl;
	}
	return NULL;
}
int IMAGE_PROCESS::show_information(void)
{	
	//tagBITMAPFILEHEADER
	if(read_from_file()) return 1; 
	cout<<"bfType = "<<bfType<<endl;
	cout<<"bfSize = "<<bfSize<<endl;
	cout<<"bfOffBits = "<<bfOffBits<<endl;
	//tagBITMAPINFOHEADER

	cout<<"biBitCount = "<<biBitCount;
	//tagRGBQUAD
	if(biBitCount==1){
		cout<<"and Palette is 2 bits"<<endl;
		
	}else if (biBitCount==4)
	{
		cout<<" and Palette is 16 bits"<<endl;
		
	}else if(biBitCount==8)
	{
		cout<<" and Palette is 256 bits"<<endl;
		
	}else{
		cout<<" and No Palette!"<<endl;
	} 
	cout<<"biClrImportant = "<<biClrImportant<<endl;
	cout<<"biClrUsed = "<<biClrUsed<<endl;
	cout<<"biCompression = "<<biCompression<<endl;
	cout<<"biHeight = "<<biHeight<<endl;
	cout<<"biWidth = "<<biWidth<<endl;
	cout<<"biPlanes = "<<biPlanes<<endl;
	cout<<"biSize = "<<biSize<<endl;
	cout<<"biSizeImage = "<<biSizeImage<<endl;
	cout<<"biXPelsPerMeter = "<<biXPelsPerMeter<<endl;
	cout<<"biYPelsPerMeter = "<<biYPelsPerMeter<<endl;
	cout<<"linebyte = "<<lineByte<<endl;
	return 0;
}


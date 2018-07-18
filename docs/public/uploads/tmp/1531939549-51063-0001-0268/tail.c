#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
int main (int argc,char* argv[]){
	char buff;
	int fd;
	char string[100]="==> ";
	char string1[7]=" <==\n";	
	for(int j=1;j<argc;j++)
{		if(*argv[j]=='-'){
			int write_result=0,read_result=0,close_result=0; 
			char*filename="tmp.txt";
			fd=open("tmp.txt",O_CREAT|O_WRONLY,S_IRWXU);
			while(read_result=read(STDIN_FILENO,&buff,1)>0){
				write_result=write(fd,&buff,1);
				if(write_result<0){
				//error write ;ne ba4ka
					char mes[100]="tail: error writing 'standart output': \0";
					write(STDERR_FILENO,mes,strlen(mes));
					perror("");
					continue;
				}
				if(read_result<0){
				char mes1[100]="tail: error reading '\0";
				char mes2[14]="'\0";
				strcat(mes1,filename);
				strcat(mes1,mes2);
				perror(mes1);
				continue;
				}
				close_result=close(fd);
				if(close_result<0)
					{
					char mes1[100]="tail: error reading '\0";
					char mes2[14]="'\0";
					strcat(mes1,filename);
					strcat(mes1,mes2);
					perror(mes1);
					continue;
				}
				}
		fd=open("tmp.txt", O_RDONLY);
		int l=-2;
		int i=0;
		off_t size=lseek(fd,0,SEEK_END);
		off_t current_position=0;
		int wr=0;
		
		for(i=0;i!=10;l--)
		{
			lseek(fd,l,SEEK_END);
			current_position=lseek(fd,0,SEEK_CUR);
			if(current_position==0)break;
			read(fd,&buff,1);
			if(buff=='\n')i++;

		}	
		if(i==10)current_position=lseek(fd,0,SEEK_CUR);
		for(;current_position<size;current_position++){
			read(fd,&buff,1);
			wr=write(STDOUT_FILENO,&buff,1);
		}
		close_result=close(fd);
		if(close_result==-1)
			{
			char mes1[100]="tail: error reading '\0";
			char mes2[14]="'\0";
			strcat(mes1,filename);
			strcat(mes1,mes2);
			perror(mes1);
			continue;
		}
				
			}
		else{
		fd=open(argv[j], O_RDONLY);//open file
		if(fd<0)//error opening
		{
			char mes1[100]="tail: cannnot open '\0";
			char mes2[14]="' for reading\0";
			strcat(mes1,argv[j]);
			strcat(mes1,mes2);
			perror(mes1);
			continue;
		}
		int read_result=read(fd,&buff,1);
		if(read_result<0)//error reading
		{
			char mes1[100]="tail: error reading '\0";
			char mes2[14]="'\0";
			strcat(mes1,argv[j]);
			strcat(mes1,mes2);
			perror(mes1);
			continue;
		}
		if(argc>2){
			if(j>1)write(STDOUT_FILENO,"\n",1);
			write(STDOUT_FILENO,string,4);//print ==> 
			write(STDOUT_FILENO,argv[j],strlen(argv[j]));//print name 
			write(STDOUT_FILENO,string1,5);//print <==
			
		}
		int l=-2;
		int i=0;
		off_t size=lseek(fd,0,SEEK_END);
		off_t current_position=0;
		int wr=0;
		
		for(i=0;i!=10;l--)
		{
			lseek(fd,l,SEEK_END);
			current_position=lseek(fd,0,SEEK_CUR);
			if(current_position==0)break;
			read(fd,&buff,1);
			if(buff=='\n')i++;

		}	
		if(i==10)current_position=lseek(fd,0,SEEK_CUR);
		for(;current_position<size;current_position++){
			read(fd,&buff,1);
			wr=write(STDOUT_FILENO,&buff,1);
			if(wr<0){
				//error write ;ne ba4ka
					char mes[100]="tail: error writing 'standart output': \0";
					write(STDERR_FILENO,mes,strlen(mes));
					perror("");
					continue;
				}
		}
		
		int close_result=close(fd);
		if(close_result==-1)
			{
			char mes1[100]="tail: error reading '\0";
			char mes2[14]="'\0";
			strcat(mes1,argv[j]);
			strcat(mes1,mes2);
			perror(mes1);
			continue;
		}
		}
		
	}
	return 0;
}

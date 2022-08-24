#import <Foundation/Foundation.h>
#import "WiFiProxy.h"
#include <stdio.h>

int main(int argc, char **argv, char **envp) {
	WiFiProxy *proxy = [WiFiProxy sharedInstance];

  if (argc < 4 && argc != 2) {
    fprintf(stderr, "proxytool (1|0) <host> <port>\n");

    return 1;
  }

	int proxyMode = 0;	//0: no proxy;1: https proxy
	if (argc >= 2) {
		proxyMode = atoi(argv[1]);
	}

  if (proxyMode == 0) {
    [proxy setProxy:@"" port:1 mode:proxyMode];
  } else {
    NSString *host = [NSString stringWithUTF8String:argv[2]];
    int port = atoi(argv[3]);
    
    [proxy setProxy:host port:port mode:proxyMode];
  }

	return 0;
}


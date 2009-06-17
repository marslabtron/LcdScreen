//
//  AppController.m
//  Copyright 2009 Ryan Morlok
//  http://softwareblog.morlok.net/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "AppController.h"
#import "MTILcdView.h"


@implementation AppController

- (void)awakeFromNib
{
	lcdView.litColor	= CGColorCreateGenericRGB(1.0, 0.0, 0.0, 1.0);
	lcdView.dimColor	= CGColorCreateGenericRGB(0.90625, 0.80, 0.80, 1.0);
	lcdView.text		= @"00:00:00";
	
	timer = [NSTimer scheduledTimerWithTimeInterval:0.25
											 target:self
										   selector:@selector(tick:)
										   userInfo:NULL
                                            repeats:YES];
	[self tick:timer];
}

- (void)tick:(NSTimer*)t
{
	NSDate *now = [NSDate date];
	NSString *timeString = [now descriptionWithCalendarFormat:@"%H:%M:%S" 
													 timeZone:nil 
													   locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
	[lcdView setText:timeString];
}

- (void) dealloc
{
	[timer invalidate];
	[super dealloc];
}
@end

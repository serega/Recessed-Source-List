//
//  JLNRecessedTableView.m
//  JLNRecessedTableView
//
//  Created by Joshua Nozzi on 7/22/11.
//  Copyright 2011 Joshua Nozzi. All rights reserved.
//
//	 This software is supplied to you by Joshua Nozzi in consideration 
//	 of your agreement to the following terms, and your use, installation, 
//	 modification or redistribution of this software constitutes 
//	 acceptance of these terms. If you do not agree with these terms, 
//	 please do not use, install, modify or redistribute this software.
//	 
//	 In consideration of your agreement to abide by the following terms, 
//	 and subject to these terms, Joshua Nozzi grants you a personal, 
//	 non-exclusive license, to use, reproduce, modify and redistribute 
//	 the software, with or without modifications, in source and/or binary 
//	 forms; provided that if you redistribute the software in its entirety 
//	 and without modifications, you must retain this notice and the 
//	 following text and disclaimers in all such redistributions of the 
//	 software, and that in all cases attribution of Joshua Nozzi as the 
//	 original author of the source code shall be included in all such 
//	 resulting software products or distributions. Neither the name, 
//	 trademarks, service marks or logos of Joshua Nozzi may be used to 
//	 endorse or promote products derived from the software without specific 
//	 prior written permission from Joshua Nozzi. Except as expressly stated 
//	 in this notice, no other rights or licenses, express or implied, are 
//	 granted by Joshua Nozzi herein, including but not limited to any patent 
//	 rights that may be infringed by your derivative works or by other works 
//	 in which the software may be incorporated.
//	 
//	 THIS SOFTWARE IS PROVIDED BY JOSHUA NOZZI ON AN "AS IS" BASIS. JOSHUA 
//	 NOZZI MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT 
//	 LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY 
//	 AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE SOFTWARE OR ITS USE 
//	 AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
//	 
//	 IN NO EVENT SHALL JOSHUA NOZZI BE LIABLE FOR ANY SPECIAL, INDIRECT, 
//	 INCIDENTAL OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
//	 PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
//	 PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE 
//	 USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE SOFTWARE, 
//	 HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING 
//	 NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF JOSHUA NOZZI HAS 
//	 BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//	


#import "JLNRecessedTableView.h"


@implementation JLNRecessedTableView


- (void)drawBackgroundInClipRect:(NSRect)clipRect
{
	
	// Super first
	[super drawBackgroundInClipRect:clipRect];
	
	// Figure out right edge of row, leaving enough room for a 4px gradient
	NSRect rightEdge = clipRect;
	rightEdge.size.width = 6.0;
	rightEdge.origin.x = NSMaxX([self bounds]) - 6.0;
	
	// Does the clip rect intersect enough of the right edge?
	if (NSIntersectsRect(clipRect, rightEdge))
	{
		
		// Create the gradient (89, 91, 93, 95)
		
        NSGradient *gradient = [[[NSGradient alloc] initWithColorsAndLocations:
                                [NSColor colorWithDeviceRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:1.0], 0.0,
                                [NSColor colorWithDeviceRed:228.0/255 green:228.0/255 blue:228.0/255 alpha:1.0], 0.1,
                                [NSColor colorWithDeviceRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0], 0.40,
                                [NSColor colorWithDeviceRed:248.0/255 green:248.0/255 blue:248.0/255 alpha:1.0], 0.8,
                                [NSColor colorWithDeviceRed:248.0/255 green:248.0/255 blue:248.0/255 alpha:1.0], 1.0,
                                nil] autorelease];

		
		// Set clip and draw the gradient
		[NSGraphicsContext saveGraphicsState];
		[[NSBezierPath bezierPathWithRect:clipRect] setClip];
		[gradient drawInRect:rightEdge angle:180];
		[NSGraphicsContext restoreGraphicsState];
		
	}
	
}


@end

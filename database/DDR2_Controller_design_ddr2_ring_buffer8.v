/////////////////////////////////////////////////////////////////////
// 
// Filename        : ddr2_ring_buffer.v
// Description     : DDR2 8 deep input ring buffer 
//                   Strobe filter and a delay line for strobe
// Author          : Rashed Bhatti
// Modified	       : Tzu-Ching Lin
/////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps


module ddr2_ring_buffer8(dout,listen,strobe,readPtr,din,reset);
   input listen;   // A cycle long pulse after which ring buffer would start paying attention towards the incoming strobe
   input strobe;   // After listen the ring buffer would capture 4 data at every edges of strobe
   input reset;
   input [15:0]  din;
   input [2:0] 	 readPtr; // Read pointer, the contol logic should provide the read pointer
   output [15:0] dout;
 
   reg [15:0] 	 dout;   
   reg [15:0] 	 r0, r1, r2, r3, r4, r5, r6, r7;
   reg 			 F0;
   wire 		 fStrobe, fStrobeBar;
   reg [2:0] 	 count;

// Delayline for strobe   
// --------------------
// To tell the sysnopsys not to remove the following delay cells 
// use the following line in constraint file
// set_dont_touch [ find cell DELAY*]
// get_attribute [ find cell DELAY*] dont_touch
    CLKBUF2 DELAY0 (.Y(dStrobe0), .A(strobe  ));
    CLKBUF2 DELAY1 (.Y(dStrobe1), .A(dStrobe0)); 
    CLKBUF2 DELAY2 (.Y(dStrobe2), .A(dStrobe1));
    CLKBUF2 DELAY3 (.Y(dStrobe3), .A(dStrobe2));
    CLKBUF2 DELAY4 (.Y(dStrobe),  .A(dStrobe3));

   							  
// strobe filter
// -------------   
//     strobe   XXXX___________/-----\_____/-----\_____/-----\_____/-----\______XXXXX
//	  
//     listen   _____/-----\______________________________________________________
//	  
//     F0       ______/----------------------------------------------------\________
//   
//     fStrobe  __________________/-----\_____/-----\_____/-----\_____/-----\________
//
//     count    -----0000000000000000000011111111111122222222222233333333333300000000



   always @ (posedge fStrobeBar or posedge listen or posedge reset)
	 begin
		if (reset)
		  begin			 
			 F0 <= 0;
			 count <= 0;
		  end
		else if (listen)
		  F0 <= 1;
		else
		  begin
			 if(count<3)
			   count<=count+1;
			 else if (count==3)
			   begin
				  count<=0;
				  F0<=0;
			   end
		  end // else: !if(listen)
	 end // always @ (posedge fStrobeBar or posedge listen or posedge reset)
   
   assign fStrobe = dStrobe & (listen | F0);
   assign fStrobeBar = ~fStrobe;


// Capture data at the edges
// -------------------------  
   always @(posedge fStrobe)
	 case (count)
	   0: r0 <= din;   
	   1: r2 <= din;
	   2: r4 <= din;
	   3: r6 <= din;
	 endcase // case(counter)
   always @(negedge fStrobe)
	 case (count)
	   0: r1 <= din;   
	   1: r3 <= din;
	   2: r5 <= din;
	   3: r7 <= din;
	 endcase // case(counter)


// Read data
// ---------
   always @ (r0 or r1 or r2 or r3 or r4 or r5 or r6 or r7  or readPtr)
	 begin
		case (readPtr) 
		  3'b000: dout <= r0;
		  3'b001: dout <= r1;
		  3'b010: dout <= r2;
		  3'b011: dout <= r3;
		  3'b100: dout <= r4;
		  3'b101: dout <= r5;
		  3'b110: dout <= r6;
		  3'b111: dout <= r7;
		  default: dout <= r0;
		endcase // case (readPtr)
	 end // always (r0 or r1 or r2 or r3 or r4 or readPtr)
   
   
endmodule // ddr2_ring_buffer8

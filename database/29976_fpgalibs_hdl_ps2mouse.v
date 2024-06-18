// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

// PS2 mouse controller.
// This module decodes the standard 3 byte packet of an PS/2 compatible 2 or 3 button mouse.
// The module also automatically handles power-up initailzation of the mouse.
module ps2mouse
#(
        parameter c_x_bits = 8,
        parameter c_y_bits = 8
)
(
	input 	clk,                    // bus clock
	input 	reset,                  // reset 
	input	ps2mdati,               // mouse PS/2 data
	input	ps2mclki,               // mouse PS/2 clk
	output	ps2mdato,               // mouse PS/2 data
	output	ps2mclko,               // mouse PS/2 clk
	output	reg [c_x_bits-1:0] xcount, // mouse Y counter
	output	reg [c_y_bits-1:0] ycount, // mouse X counter
	output	reg [2:0] btn           // {middle, right, left} mouse buttons
);

//local signals
reg	mclkout; 			// mouse clk out
wire	mdatout;			// mouse data out
reg	mdatb,mclkb,mclkc;		// input synchronization	

reg	[10:0] mreceive;		// mouse receive register	
reg	[11:0] msend;			// mouse send register
reg	[15:0] mtimer;			// mouse timer
reg	[2:0] mstate;			// mouse current state
reg	[2:0] mnext;			// mouse next state

initial
	mstate = 3'b000;

wire	mclkneg;				// negative edge of mouse clock strobe
reg	mrreset;				// mouse receive reset
wire	mrready;				// mouse receive ready;
reg	msreset;				// mosue send reset
wire	msready;				// mouse send ready;
reg	mtreset;				// mouse timer reset
wire	mtready;				// mouse timer ready	 
wire	mthalf;					// mouse timer somewhere halfway timeout
wire	mttest;
reg	[1:0] mpacket;				// mouse packet byte valid number

// bidirectional open collector IO buffers
//assign ps2mclk = (mclkout) ? 1'bz : 1'b0;
//assign ps2mdat = (mdatout) ? 1'bz : 1'b0;
assign ps2mclko=mclkout;
assign ps2mdato=mdatout;

// input synchronization of external signals
always @(posedge clk)
begin
	mdatb <= ps2mdati;
	mclkb <= ps2mclki;
	mclkc <= mclkb;
end						

// detect mouse clock negative edge
assign mclkneg = mclkc & (~mclkb);

// PS2 mouse input shifter
always @(posedge clk)
	if (mrreset)
		mreceive[10:0]<=11'b11111111111;
	else if (mclkneg)
		mreceive[10:0]<={mdatb,mreceive[10:1]};
assign mrready=~mreceive[0];

// PS2 mouse send shifter
always @(posedge clk)
	if (msreset)
		msend[11:0]<=12'b110111101000;
	else if (!msready && mclkneg)
		msend[11:0]<={1'b0,msend[11:1]};
assign msready=(msend[11:0]==12'b000000000001)?1:0;
assign mdatout=msend[0];

// PS2 mouse timer
always @(posedge clk)
	if (mtreset)
		mtimer[15:0]<=16'h0000;
	else
		mtimer[15:0]<=mtimer[15:0]+1;
assign mtready=(mtimer[15:0]==16'hffff)?1:0;
assign mthalf=mtimer[11];
//assign mttest=mtimer[13];
assign mttest=mtimer[14];

wire [c_x_bits-1:0] xinc;
wire [c_y_bits-1:0] yinc;
generate
  if(c_x_bits > 8)
    assign xinc = {{(c_x_bits-8){mreceive[8]}},mreceive[8:1]};
  else
    assign xinc = mreceive[c_x_bits:1];
  if(c_y_bits > 8)
    assign yinc = {{(c_y_bits-8){mreceive[8]}},mreceive[8:1]};
  else
    assign yinc = mreceive[c_y_bits:1];
endgenerate

// PS2 mouse packet decoding and handling
always @(posedge clk)
begin
	if (reset) // reset
	begin
		btn <= 3'b000;
		xcount <= 0;	
		ycount <= 0;
	end
	else if (mpacket==1) // buttons
		btn <= mreceive[3:1];
	else if (mpacket==2) // delta X movement
		xcount <= xcount + xinc;
	else if (mpacket==3) // delta Y movement
		ycount <= ycount - yinc;
end

//--------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------

// PS2 mouse state machine
always @(posedge clk)
	if (reset || mtready) // master reset OR timeout
		mstate<=0;
	else 
		mstate<=mnext;
always @(mstate or mthalf or msready or mrready or mreceive)
begin
	case(mstate)
		0: // initialize mouse phase 0, start timer
			begin
				mclkout=1;
				mrreset=0;
				mtreset=1;
				msreset=0;
				mpacket=0;
				mnext=1;
			end

		1: // initialize mouse phase 1, hold clk low and reset send logic
			begin
				mclkout=0;
				mrreset=0;
				mtreset=0;
				msreset=1;
				mpacket=0;
				if (mthalf) // clk was low long enough, go to next state
					mnext=2;
				else
					mnext=1;
			end

		2: // initialize mouse phase 2, send 'enable data reporting' command to mouse
			begin
				mclkout=1;
				mrreset=1;
				mtreset=0;
				msreset=0;
				mpacket=0;
				if (msready) // command set, go get 'ack' byte
					mnext=5;
				else
					mnext=2;
			end

		3: // get first packet byte
			begin
				mclkout=1;
				mtreset=1;
				msreset=0;
				if (mrready) // we got our first packet byte
				begin
					mpacket=1;
					mrreset=1;
					mnext=4;
 				end
				else // we are still waiting				
 				begin
					mpacket=0;
					mrreset=0;
					mnext=3;
				end
			end

		4: // get second packet byte
			begin
				mclkout=1;
				mtreset=0;
				msreset=0;
				if (mrready) // we got our second packet byte
				begin
					mpacket=2;
					mrreset=1;
					mnext=5;

				end
				else // we are still waiting				
 				begin
					mpacket=0;
					mrreset=0;
					mnext=4;
				end
			end

		5: // get third packet byte (or get 'ACK' byte..)
			begin
				mclkout=1;
				mtreset=1;
				msreset=0;
				if (mrready) // we got our third packet byte
				begin
					mpacket=3;
					mrreset=1;
					mnext=6;

				end
				else // we are still waiting				
 				begin
					mpacket=0;
					mrreset=0;
					mnext=5;
				end
			end
 
		6: // get Z packet byte if weel is aktive
			begin
				mclkout=1;
				mtreset=0;
				msreset=0;
				if (mrready||mttest) // we got our ford packet byte or timeout
				begin
					mpacket=0;
					mrreset=1;
					mnext=3;

				end
				else // we are still waiting				
 				begin
					mpacket=0;
					mrreset=0;
					mnext=6;
				end
			end
 
		default: // we should never come here
			begin
				mclkout=1'bx;
				mrreset=1'bx;
				mtreset=1'bx;
				msreset=1'bx;
				mpacket=2'bxx;
				mnext=0;
			end

	endcase
end

endmodule

// visualize ZX picture
//
// here we build picture and send it sometimes to C program

`ifndef NO_PIXER
module pixer
(
	input  wire clk,

	input  wire vsync,
	input  wire hsync,

	input  wire [1:0] red,
	input  wire [1:0] grn,
	input  wire [1:0] blu
);


	reg r_vsync;
	reg r_hsync;

	wire vbeg,hbeg;


	integer hcount;
	integer hperiod;
	integer hper1,hper2;

	integer vcount;
	integer vperiod;
	integer vper1,vper2;

	reg clr_vcnt;





	always @(posedge clk)
		r_vsync <= vsync;

	always @(posedge clk)
		r_hsync <= hsync;

	assign vbeg = ( (!r_vsync) && vsync );
	assign hbeg = ( (!r_hsync) && hsync );


	// get horizontal period
	always @(posedge clk)
	if( hbeg )
		hcount <= 0;
	else
		hcount <= hcount + 1;

	always @(posedge clk)
	if( hbeg )
	begin
		hper2 <= hper1;
		hper1 <= hcount+1;
	end


	initial hperiod=0;

	always @*
	if( hper2===hper1 )
		hperiod = hper2;




	// get vertical period
	initial clr_vcnt = 0;

	always @(posedge clk)
	begin
		if( vbeg )
			clr_vcnt=1;

		if( hbeg )
		begin
			if( clr_vcnt )
			begin
				clr_vcnt=0;

				vper2 <= vper1;
				vper1 <= vcount+1;
				vcount <= 0;
			end
			else
				vcount <= vcount+1;
		end
	end


	initial vperiod = 0;

	always @*
	if( vper1===vper2 )
		vperiod = vper2;


	// display periods
//	always @*
//		$display("h period is %d",hperiod);
//	always @*
//		$display("v period is %d",vperiod);



	always @(posedge clk)
	begin
		sndpix(hcount,vcount,{26'd0,red,grn,blu},hperiod,vperiod);
	end




	import "DPI-C" task sndpix
	(
		input int hcoord,
		input int vcoord,
		input int rrggbb,
		input int hperiod,
		input int vperiod
	);



endmodule
`endif


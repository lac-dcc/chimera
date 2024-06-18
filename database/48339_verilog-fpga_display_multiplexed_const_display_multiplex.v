// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230721

`default_nettype none
module DisplayMultiplex #(
	parameter CLOCK_HZ         = 10_000_000,
	parameter SWITCH_PERIOD_US = 1000
)(
	input  wire        Clock,
	input  wire        Reset,
	input  wire [31:0] Data_i,
	input  wire [ 7:0] DecimalPoints_i,
	output wire [ 7:0] Cathodes_o,
	output wire [ 7:0] Segments_o,
	output wire        SwitchCathode_o
);
	
	// Blank leading zeros
	wire [7:0] Visible;
	assign Visible[7] = |Data_i[31:28];
	assign Visible[6] = |Data_i[27:24] || Visible[7] ;
	assign Visible[5] = |Data_i[23:20] || Visible[6] ;
	assign Visible[4] = |Data_i[19:16] || Visible[5] ;
	assign Visible[3] = |Data_i[15:12] || Visible[4] ;
	assign Visible[2] = |Data_i[11: 8] || Visible[3] ;
	assign Visible[1] = |Data_i[ 7: 4] || Visible[2] ;
	assign Visible[0] = 1'b1;
	
	// Strobe signal to change active cathode and actually displayed digit
	StrobeGenerator #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(SWITCH_PERIOD_US)
	) StrobeGenerator0(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(1'b1),
		.Strobe_o(SwitchCathode_o)
	);
	
	// Change cathode
	reg [2:0] Selector;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) 
			Selector <= 0;
		else if(SwitchCathode_o) begin
			if(Selector == 7)
				Selector <= 0;
			else
				Selector <= Selector + 1'b1; 
		end
	end
	
	// Select one of cathodes
	assign Cathodes_o = (1'b1 << Selector);
	
	// Select data to be displayed
	wire [3:0] TempData = Data_i[(Selector*4+3)-:4];
	
	// Check if this digit has to be visible
	wire Enable = Visible[Selector];
	
	// Decimal point enable
	assign Segments_o[7] = DecimalPoints_i[Selector];

	// 7 segment decoder instance
	Decoder7seg #(
		.COMMON_CATHODE(1)
	) Decoder7seg0(
		.Enable_i(Enable),
		.Data_i(TempData),
		.Segments_o(Segments_o[6:0])
	);
	
endmodule
`default_nettype wire

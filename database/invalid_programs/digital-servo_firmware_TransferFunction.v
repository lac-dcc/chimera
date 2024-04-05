///////////////////////////////////////////////////////////////////////////////
// TransferFunction.v
//
// 10/30/12
// David Leibrandt
//
//	Module to generate modulation for transfer function measurement.
//
// cmd_addr_in = 16'h4000 --- Set modulation frequency to {cmd_data2_in, cmd_data1_in}
// cmd_addr_in = 16'h41?? --- Set modulation amplitude for channel ?? to cmd_data1_in[4:0]
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module TransferFunction(
	input	 wire					 clk_in,
	input  wire					 rst_in,
	
	input  wire 				 cmd_trig_in,
	input  wire 		[15:0] cmd_addr_in,
	input	 wire 		[15:0] cmd_data1_in,
	input	 wire 		[15:0] cmd_data2_in,
	
	output reg signed [15:0] sin_out,
	output reg signed [15:0] cos_out,
	
	output reg signed [23:0] mod0_out,
	output reg signed [23:0] mod1_out,
	output reg signed [23:0] mod2_out
);

// Latch the input commands
reg [31:0]	pinc_f;
reg [4:0]	rs0_f, rs1_f, rs2_f;

always @(posedge clk_in) begin
	if (rst_in) begin
		pinc_f <= 32'b0;
		rs0_f <= 5'b11111;
		rs1_f <= 5'b11111;
		rs2_f <= 5'b11111;
	end
	else begin
		if (cmd_trig_in & (cmd_addr_in[15:12] == 4'h4)) begin
			case (cmd_addr_in[11:0])
				12'h000:	begin
								pinc_f <= {cmd_data2_in, cmd_data1_in};
							end
				12'h100:	begin
								rs0_f <= cmd_data1_in[4:0];
							end
				12'h101:	begin
								rs1_f <= cmd_data1_in[4:0];
							end
				12'h102:	begin
								rs2_f <= cmd_data1_in[4:0];
							end
			endcase
		end
	end
end

// DDS
wire signed [23:0] MODsin, MODcos;
dds_pw32_ow24 transfer_dds_inst(
	.clk(clk_in),
	.pinc_in(pinc_f),
	.sine(MODsin),
	.cosine(MODcos)
);

always @(posedge clk_in) sin_out <= (MODsin >>> 8);
always @(posedge clk_in) cos_out <= (MODcos >>> 8);

// right shift
always @(posedge clk_in) mod0_out <= (MODsin >>> rs0_f);
always @(posedge clk_in) mod1_out <= (MODsin >>> rs1_f);
always @(posedge clk_in) mod2_out <= (MODsin >>> rs2_f);

endmodule
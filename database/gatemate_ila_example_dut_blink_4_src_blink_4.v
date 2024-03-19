`timescale 1ns / 1ps

module blink_4(
		input wire clk,
		// input wire rst,
		// output [24:0] ila_sample_dut,
		output wire [3:0] led
	);




	wire rst;
	CC_USR_RSTN usr_rstn_inst (
   	.USR_RSTN(rst) // reset signal to CPE array
);

reg [24:0] counter_1;
wire clk270_1, clk180_1, clk90_1, clk0_1, usr_ref_out_1;
wire usr_pll_lock_stdy_1, usr_pll_lock_1;

	CC_PLL #(
		.REF_CLK("10.0"),    // reference input in MHz
		.OUT_CLK("12.5"),   // pll output frequency in MHz
		.PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_1 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy_1), .USR_PLL_LOCKED(usr_pll_lock_1),
		.CLK270(clk270_1), .CLK180(clk180_1), .CLK90(clk90_1), .CLK0(clk0_1), .CLK_REF_OUT(usr_ref_out_1)
);

	assign led[0] = counter_1[24];

	always @(posedge clk0_1)
	begin
		if (!rst) begin
			counter_1 <= 0; 
		end else begin
			counter_1 <= counter_1 + 1'b1;
		end
	end

	// assign ila_sample_dut = counter;


	reg [24:0] counter_2;
wire clk270_2, clk180_2, clk90_2, clk0_2, usr_ref_out_2;
wire usr_pll_lock_stdy_2, usr_pll_lock_2;

	CC_PLL #(
		.REF_CLK("10.0"),    // reference input in MHz
		.OUT_CLK("25.0"),    // pll output frequency in MHz
		.PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_2 (
		.CLK_REF(clk), 
		.CLK_FEEDBACK(1'b0), 
		.USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), 
		.USR_PLL_LOCKED_STDY(usr_pll_lock_stdy_2), 
		.USR_PLL_LOCKED(usr_pll_lock_2),
		.CLK270(clk270_2), 
		.CLK180(clk180_2), 
		.CLK90(clk90_2), 
		.CLK0(clk0_2), 
		.CLK_REF_OUT(usr_ref_out_2)
	);

	assign led[1] = counter_2[24];

	always @(posedge clk0_2)
	begin
		if (!rst) begin
			counter_2 <= 0;
		end else begin
			counter_2 <= counter_2 + 1'b1;
		end
	end

	reg [24:0] counter_3;
wire clk270_3, clk180_3, clk90_3, clk0_3, usr_ref_out_3;
wire usr_pll_lock_stdy_3, usr_pll_lock_3;

	CC_PLL #(
		.REF_CLK("10.0"),    // reference input in MHz
		.OUT_CLK("50.0"),   // pll output frequency in MHz
		.PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst_3 (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy_3), .USR_PLL_LOCKED(usr_pll_lock_3),
		.CLK270(clk270_3), .CLK180(clk180_3), .CLK90(clk90_3), .CLK0(clk0_3), .CLK_REF_OUT(usr_ref_out_3)
	);

	assign led[2] = counter_3[24];

	always @(posedge clk0_3)
	begin
		if (!rst) begin
			counter_3 <= 0; 
		end else begin
			counter_3 <= counter_3 + 1'b1;
		end
	end

	reg [24:0] counter_4;
	wire clk270_4, clk180_4, clk90_4, clk0_4, usr_ref_out_4;
	wire usr_pll_lock_stdy_4, usr_pll_lock_4;
	
		CC_PLL #(
			.REF_CLK("10.0"),    // reference input in MHz
			.OUT_CLK("100.0"),   // pll output frequency in MHz
			.PERF_MD("ECONOMY"), // LOWPOWER, ECONOMY, SPEED
			.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
			.CI_FILTER_CONST(2), // optional CI filter constant
			.CP_FILTER_CONST(4)  // optional CP filter constant
		) pll_inst_4 (
			.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
			.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy_4), .USR_PLL_LOCKED(usr_pll_lock_4),
			.CLK270(clk270_4), .CLK180(clk180_4), .CLK90(clk90_4), .CLK0(clk0_4), .CLK_REF_OUT(usr_ref_out_4)
		);
	
		assign led[3] = counter_4[24];
	
		always @(posedge clk0_4)
		begin
			if (!rst) begin
				counter_4 <= 0; 
			end else begin
				counter_4 <= counter_4 + 1'b1;
			end
		end


endmodule

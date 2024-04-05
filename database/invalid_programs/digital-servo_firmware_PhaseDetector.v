///////////////////////////////////////////////////////////////////////////////
// PhaseDetector.v
//
// 11/10/11
// David Leibrandt
//
//	Phase detector module.
// Added capability to optionally use second (external) clock 2/10/14.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"
// `define DEBUG_PHASEDETECTOR_PLL

module PhaseDetector(
   input  wire											clk_in,
`ifndef DEBUG_PHASEDETECTOR_PLL
   input  wire											rst_in,
`endif
`ifdef DEBUG_PHASEDETECTOR_PLL
	input  wire				[63:0]					debug_in,
	output reg				[63:0]					debug_out,
`endif
   input  wire											ext_clk_10MHz_in,
	input  wire											use_ext_clk_in,
	input  wire				[31:0]					pinc_in,
	input  wire											on_in,
	input  wire signed	[34:0]					a1_in,
	input  wire signed	[34:0]					b0_in,
	input  wire signed	[15:0]					signal_in,
	output wire signed	[31:0]					I_out,
	output wire signed	[31:0]					Q_out,
   output reg  signed	[PHASE_OUT_SIZE-1:0]	phase_out
);

// Parameters
parameter PHASE_OUT_SIZE = 32;	// size of phase_out in bits

`ifdef DEBUG_PHASEDETECTOR_PLL
reg [31:0] UPDATE_PLL_EVERY;
reg [7:0] UPDATE_PLL_RS_I;
reg [7:0] UPDATE_PLL_RS_P;

always @(posedge clk_in) begin
	UPDATE_PLL_EVERY <= debug_in[31:0];
	UPDATE_PLL_RS_P <= debug_in[39:32];
	UPDATE_PLL_RS_I <= debug_in[47:40];
end

// Reset whenever there is a rst_in signal or we switch from internal to external clocking or debug_in says to reset
reg [3:0] rst_f1;
reg rst_f2, rst;
always @(posedge clk_in) begin
	rst_f1 <= {rst_f1[2:0], use_ext_clk_in}; // register
	rst_f2 <= (rst_f1[3] && (!rst_f1[2])) || (rst_f1[2] && (!rst_f1[3])); // edge detect
	rst <= rst_in || rst_f2 || debug_in[48];
end

`else
localparam UPDATE_PLL_EVERY = 32'd100;		// update every 1 us
localparam UPDATE_PLL_RS_P = 2;				// right shift the proportional term by 2
localparam UPDATE_PLL_RS_I = 16;				// right shift the integral term by 16

// Reset whenever there is a rst_in signal or we switch from internal to external clocking
reg [3:0] rst_f1;
reg rst_f2, rst;
always @(posedge clk_in) begin
	rst_f1 <= {rst_f1[2:0], use_ext_clk_in}; // register
	rst_f2 <= (rst_f1[3] && (!rst_f1[2])) || (rst_f1[2] && (!rst_f1[3])); // edge detect
	rst <= rst_in || rst_f2;
end
`endif

localparam PINC_10MHZ_MIN = 32'h19581062;
localparam PINC_10MHZ_0   = 32'h1999999A;
localparam PINC_10MHZ_MAX = 32'h19DB22D1;

// Phase lock divided internal clock to external clock
// clk_in is internal clock running at 100 MHz + epsilon
// ext_clock_10MHz_in is external clock running at 10 MHz
// Use division ratio to scale pinc_in, which sets the frequency of the LO for phase detection

// First, a variable clock frequency divider
// Multiplies 100 MHz internal clock frequency by pinc_10MHz/2^32 and spits out int_clk_10MHz
// If both clocks were perfect, pinc_10MHz would be 32'h1999999A
// Condition int_clk_10MHz to be high for one cycle
reg [31:0] clk_counter_f, pinc_10MHz;
reg int_clk_10MHz_f1;
reg [3:0] int_clk_10MHz_f2;
reg int_clk_10MHz_f3, int_clk_10MHz;

always @(posedge clk_in) begin
	clk_counter_f <= clk_counter_f + pinc_10MHz; // counter
	int_clk_10MHz_f1 <= clk_counter_f > (32'b1 << 31); // 50 % duty cycle
	int_clk_10MHz_f2 <= {int_clk_10MHz_f2[2:0], int_clk_10MHz_f1}; // register
	int_clk_10MHz_f3 <= int_clk_10MHz_f2[3] & (!int_clk_10MHz_f2[2]); // edge detect
	int_clk_10MHz <= int_clk_10MHz_f3; //register
end

// Second, a counter that increments with every click of int_clk_10MHz and decrements with every click of ext_clk_10MHz_in
reg signed [15:0] clk_difference_f;

always @(posedge clk_in or posedge rst) begin
	if (rst) begin
		clk_difference_f <= 16'b0;
	end
	else if (int_clk_10MHz && (!ext_clk_10MHz_in)) begin
		clk_difference_f <= clk_difference_f + 16'sb1;
	end
	else if (ext_clk_10MHz_in && (!int_clk_10MHz)) begin
		clk_difference_f <= clk_difference_f - 16'sb1;
	end
end

// Third, a phase locked loop that makes clk_difference_f = 0 by feeding back to pinc_10MHz
// Feedback is a simple PI with gain controlled by the update rate and the right shifts
// Note that the VCO above acts as an integrator, so an integrator loop filter by itself always oscillates
// Note that for int_clk_10MHz to change frequency by 1e-5 fractionally, pinc_10MHz changes by 429
// Limit pinc_10MHz range to +/- 1%

reg signed [31:0] pinc_10MHz_p;
reg [31:0] pinc_10MHz_i;
reg [31:0] PLL_clk_counter_f;

always @(posedge clk_in or posedge rst) begin
	if (rst) begin
		pinc_10MHz_i <= PINC_10MHZ_0;
		pinc_10MHz_p <= 32'sb0;
		PLL_clk_counter_f <= 32'b0;
	end
	else begin
		if (PLL_clk_counter_f == UPDATE_PLL_EVERY) begin
			PLL_clk_counter_f <= 32'b0;
			
			// Integral gain
			if ((clk_difference_f < 16'sb0) && (pinc_10MHz_i < PINC_10MHZ_MAX)) begin
				pinc_10MHz_i <= pinc_10MHz_i + ({$unsigned(-clk_difference_f), 16'b0} >> UPDATE_PLL_RS_I);
			end
			else if ((clk_difference_f > 16'sb0) && (pinc_10MHz_i > PINC_10MHZ_MIN)) begin
				pinc_10MHz_i <= pinc_10MHz_i - ({$unsigned(clk_difference_f), 16'b0} >> UPDATE_PLL_RS_I);
			end
		end
		else begin
			PLL_clk_counter_f <= PLL_clk_counter_f + 32'b1;
		end
		
		// Proportional gain
		pinc_10MHz_p <= -($signed({clk_difference_f, 16'b0}) >>> UPDATE_PLL_RS_P);

		// PI
		pinc_10MHz <= pinc_10MHz_p + pinc_10MHz_i;
	end
end

// Fourth, multiply pinc_10MHz by pinc_in to get the phase increment word for the LO DDS
reg [31:0] pinc_f1;
reg [63:0] pinc_f2;
reg [31:0] pinc;

always @(posedge clk_in) begin
	pinc_f1 <= use_ext_clk_in ? pinc_10MHz : PINC_10MHZ_0;
	pinc_f2 <= pinc_f1*pinc_in;
	pinc <= pinc_f2 >> 30;
end

// Finally, on to the phase detector
// LO DDS
wire signed [15:0] cos, sin;

dds_pw32_ow16 int_dds_inst(
	.clk(clk_in),
	.pinc_in(pinc),
	.cosine(cos),
	.sine(sin)
);

`ifdef DEBUG_PHASEDETECTOR_PLL
always @(posedge clk_in) debug_out <= {clk_difference_f[15:0], cos, pinc_10MHz};
`endif

// Mixers
reg signed [31:0] sigXcos, sigXsin;

always @(posedge clk_in) begin
	sigXcos <= signal_in*cos;
	sigXsin <= signal_in*sin;
end

// Low pass filters
LPfilter #(
	.SIGNAL_IN_SIZE(32),
	.SIGNAL_OUT_SIZE(32)
)
LP1(
	.clk_in(clk_in),
	.on_in(on_in),
	.a1_in(a1_in),
	.b0_in(b0_in),
	.signal_in(sigXcos),
	.signal_out(I_out)
);

LPfilter #(
	.SIGNAL_IN_SIZE(32),
	.SIGNAL_OUT_SIZE(32)
)
LP2(
	.clk_in(clk_in),
	.on_in(on_in),
	.a1_in(a1_in),
	.b0_in(b0_in),
	.signal_in(sigXsin),
	.signal_out(Q_out)
);

// I,Q -> phase (note that this has 19 clock cycles of latency, so it may be better to use I, Q data instead if possible)
reg  signed [15:0] phaseOld;
wire signed [15:0] phaseNew;

arctan arctan_inst(
	.clk(clk_in),
	.x_in({I_out[31], I_out}),
	.y_in({Q_out[31], Q_out}),
	.phase_out(phaseNew)
);

// Unwrap the phase
always @(posedge clk_in) begin
	if (rst) begin
		phase_out <= 0;
	end
	else begin
		phaseOld <= phaseNew;
		
		if ((phaseNew - phaseOld) > $signed(16'h2000))
			phase_out <= phase_out - $signed(16'h4000) + phaseNew - phaseOld;
		else if ((phaseNew - phaseOld) < $signed(16'hE000))
			phase_out <= phase_out + $signed(16'h4000) + phaseNew - phaseOld;
		else
			phase_out <= phase_out + phaseNew - phaseOld;
	end
end

endmodule

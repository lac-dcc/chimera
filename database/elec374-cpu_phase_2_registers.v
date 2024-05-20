// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module reg_32_bit (
	input wire clk,
	input wire clr,
	input wire enable,
	input wire [31:0] d,
	output reg [31:0] q
);

	// Initialize output to 0
	initial q = 0;

	// Register behavior
	always @ (posedge clk) begin
		if (clr)
			q <= 0;
		else if (enable)
			q <= d;
	end

endmodule

module c_sign_extended_reg (
	input wire clk,
	input wire clr,
	input wire [31:0] d,
	output reg [31:0] q
);

	// Initialize output to 0
	initial q = 0;

	// Register behavior
	always @ (posedge clk) begin
		q <= d;
	end

endmodule

module pc_reg (
	input wire clk,				// clock signal
	input wire en,				// write/enable signal
	input wire pc_increment,	// increment the pc
	input wire [31:0] d,	// 32-bit input to register (BusMuxOut)
	output reg [31:0] q	// 32-bit output from register (BusMuxIn_PC)
);

	// Initialize output to 0
	initial q = 0;

	// Register behavior
	always @ (posedge clk) begin
		if (pc_increment)
			q <= q + 1;
		else if (en)
			q = d;
	end

endmodule

module r0_reg (
    input wire clk,
    input wire clr,
    input wire enable,
    input wire ba_out,
    input wire [31:0] d,
    output wire [31:0] q
);

    wire [31:0] internal_q;

    // Instantiate the 32-bit register
    reg_32_bit r0_internal_reg (
        .clk(clk),
        .clr(clr),
        .enable(enable),
        .d(d),
        .q(internal_q)
    );

    assign q = internal_q & {32{~ba_out}};

endmodule

// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_341176884318437971(
    input  wire [7:0] io_in,
    output wire [7:0] io_out
);
/*
 * Local signals
 */
    // Used as a clock.
    wire clk;

    // Used as a synchronous reset.
    wire rst;

    // Indicates that the first nibble is registered.
    reg int_nibble_stored;

    // The registered first nibble.
    reg [3:0] int_first_nibble;

    // The resistered output.
    reg [7:0] int_out;

    // The multiplied 8-bit output.
    wire [7:0] int_mult_result;
/*
 * Logic
 */
    // Using io_in[0] as clk.
    assign clk = io_in[0];

    // Using io_in[1] as rst.
    assign rst = io_in[1];

    // Assign the 
    assign io_out = int_out;

    always @(posedge clk) begin
        if (rst) begin
            int_nibble_stored <= 1'b0;
            int_first_nibble  <= 4'd0;
            int_out           <= 8'd0;
        end else begin
            // If we havent latched in the first nibble,
            // then do so first.
            if (!int_nibble_stored) begin
                int_first_nibble  <= io_in[7:4];
                int_nibble_stored <= 1'b1;
            end else begin
                // Register the multiplier result.
                int_out <= int_mult_result;

                // Reset the nibble registered flag.
                int_nibble_stored <= 1'b0;

                // Reset the nibble data.
                int_first_nibble <= 4'd0;
            end
        end
    end

/*
 * Instances
 */
    Mult_Wallace4 inst_mul (
        .a(int_first_nibble),
        .b(io_in[7:4]),
        .o(int_mult_result)
    );
endmodule

// Unsigned 4x4-bit multiplier with
// Wallace tree reduction. Generated
// with my own tool.
module Mult_Wallace4 # (
    parameter N = 4
)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    output wire [2*N-1:0] o
);

    wire [N-1:0] ppts[N-1:0];

	assign ppts[0][0] = a[0] & b[0];
	assign ppts[0][1] = a[0] & b[1];
	assign ppts[0][2] = a[0] & b[2];
	assign ppts[0][3] = a[0] & b[3];
	assign ppts[1][0] = a[1] & b[0];
	assign ppts[1][1] = a[1] & b[1];
	assign ppts[1][2] = a[1] & b[2];
	assign ppts[1][3] = a[1] & b[3];
	assign ppts[2][0] = a[2] & b[0];
	assign ppts[2][1] = a[2] & b[1];
	assign ppts[2][2] = a[2] & b[2];
	assign ppts[2][3] = a[2] & b[3];
	assign ppts[3][0] = a[3] & b[0];
	assign ppts[3][1] = a[3] & b[1];
	assign ppts[3][2] = a[3] & b[2];
	assign ppts[3][3] = a[3] & b[3];

	wire [11:0] s;
	wire [11:0] cout;

	ha HA1 (.a(ppts[0][1]), .b(ppts[1][0]), .s(s[0]), .cout(cout[0]));
	fa FA2 (.a(ppts[0][2]), .b(ppts[1][1]), .cin(ppts[2][0]), .s(s[1]), .cout(cout[1]));
	fa FA3 (.a(ppts[0][3]), .b(ppts[1][2]), .cin(ppts[2][1]), .s(s[2]), .cout(cout[2]));
	ha HA4 (.a(ppts[1][3]), .b(ppts[2][2]), .s(s[3]), .cout(cout[3]));
	ha HA5 (.a(cout[0]), .b(s[1]), .s(s[4]), .cout(cout[4]));
	fa FA6 (.a(ppts[3][0]), .b(cout[1]), .cin(s[2]), .s(s[5]), .cout(cout[5]));
	fa FA7 (.a(ppts[3][1]), .b(cout[2]), .cin(s[3]), .s(s[6]), .cout(cout[6]));
	fa FA8 (.a(ppts[2][3]), .b(ppts[3][2]), .cin(cout[3]), .s(s[7]), .cout(cout[7]));
	ha HA9 (.a(cout[4]), .b(s[5]), .s(s[8]), .cout(cout[8]));
	fa FA10 (.a(cout[5]), .b(s[6]), .cin(cout[8]), .s(s[9]), .cout(cout[9]));
	fa FA11 (.a(cout[6]), .b(s[7]), .cin(cout[9]), .s(s[10]), .cout(cout[10]));
	fa FA12 (.a(ppts[3][3]), .b(cout[7]), .cin(cout[10]), .s(s[11]), .cout(cout[11]));

	assign o[7] = cout[11];
	assign o[6] = s[11];
	assign o[5] = s[10];
	assign o[4] = s[9];
	assign o[3] = s[8];
	assign o[2] = s[4];
	assign o[1] = s[0];
	assign o[0] = ppts[0][0];
endmodule

// Full adder
module fa (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire s,
    output wire cout
);

/*
 * Local signals
 */
    // wire int_a_xor_b;
    // wire int_a_and_b;
    // wire int_a_xor_b_and_cin;
/*
 * Logic
 */
 
    // Implement a full adder with individual gates.
    // assign int_a_xor_b         = a ^ b;
    // assign int_a_and_b         = a & b;
    // assign int_a_xor_b_and_cin = int_a_xor_b & cin;
    // assign s                   = int_a_xor_b ^ cin;
    // assign cout                = int_a_xor_b_and_cin | int_a_and_b;

    // Instantiate a full adder cell from the
    // standard cell library.
    // sky130_fd_sc_hd__fah inst_fa (
    //     .A   (a),
    //     .B   (b),
    //     .CI  (cin),
    //     .SUM (s),
    //     .COUT(cout)
    // );

    // Infer a full adder.
    assign {cout, s} = a + b + cin;
endmodule

// Half adder
module ha (
    input  wire a,
    input  wire b,
    output wire s,
    output wire cout
);

/*
 * Logic
 */

    // Implement a half adder with individual gates.
    // assign s    = a ^ b;
    // assign cout = a & b;

    // Instantiate a half adder cell from the
    // standard cell library.
    // sky130_fd_sc_hd__ha inst_ha (
    //     .A   (a),
    //     .B   (b),
    //     .SUM (s),
    //     .COUT(cout)
    // );

    // Infer a half adder.
    assign {cout, s} = a + b;
endmodule

// Carry save adder
module csa #(
    parameter NUM_BITS = 4
) (
    input  wire [NUM_BITS-1:0] a, // Input A
    input  wire [NUM_BITS-1:0] b, // Input B
    input  wire [NUM_BITS-1:0] c, // Input C
    output wire [NUM_BITS-1:0] p, // Output p (propagate)
    output wire [NUM_BITS-1:0] g  // Output g (generate)
);
    genvar i;

    generate
        for (i = 0; i < NUM_BITS; i = i + 1) begin
            fa fa_i (
                .a   (a[i]),
                .b   (b[i]),
                .cin (c[i]),
                .s   (p[i]),
                .cout(g[i])
            );
        end
    endgenerate
endmodule

// Ripple carry adder
module rca #(
    parameter NUM_BITS = 4
) (
    input  wire [NUM_BITS-1:0] a,
    input  wire [NUM_BITS-1:0] b,
    output wire [NUM_BITS-1:0] s,
    output wire                cout
);

/*
 * Local signals
 */
    // The carry out to carry in signals.
    wire [NUM_BITS:0] int_carry;

/*
 * Logic
 */
    genvar i;

    generate
        for (i = 0; i < NUM_BITS; i = i + 1) begin
            if (i == 0) begin
                // The first bits have no carry in,
                // so just generate a half adder.
                ha ha_0 (
                    .a   (a[i]),
                    .b   (b[i]),
                    .s   (s[i]),
                    .cout(int_carry[i])
                );
            end else begin
                fa fa_i (
                    .a   (a[i]),
                    .b   (b[i]),
                    .cin (int_carry[i-1]),
                    .s   (s[i]),
                    .cout(int_carry[i])
                );
            end
        end
    endgenerate

    assign cout = int_carry[NUM_BITS-1];
endmodule

// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module Permutation (
    // Inputs
    input           clk,
    input           rst,
    input   [4:0]   ctr,
    input   [319:0] S,
    input   [4:0]   rounds,
    input           start,

    // Outputs
    output  [319:0] out,
    output          done            // Done signal when counter = no. of rounds
);

    // Number of rounds * (Constants Addition Layer -> Substitution Layer -> Linear Diffusion Layer)

    // Splitting the input state into 5 registers
    reg [63:0] x0_q, x1_q, x2_q, x3_q, x4_q;
    wire [63:0] x0_d, x1_d, x2_d, x3_d, x4_d;

    // Done register
    reg Done;

    // Updating the registers with clock cycles
    always @(posedge clk) begin
        if(!rst)
            {x0_q, x1_q, x2_q, x3_q, x4_q, Done} <= 0;
        else begin
            if(start) begin
                if(ctr == 0)
                    {x0_q, x1_q, x2_q, x3_q, x4_q} <= S; 
                else begin
                    x0_q <= x0_d;
                    x1_q <= x1_d;
                    x2_q <= x2_d;
                    x3_q <= x3_d;
                    x4_q <= x4_d;
                end
            end
        end
        if(ctr == rounds)
            Done <= 1;
        else
            Done <= 0;
    end

    // Done signal
    assign done = Done;

    // Output
    assign out = {x0_q, x1_q, x2_q, x3_q, x4_q};

    // Constants Addition Layer
    wire [63:0] rc_out;
    ConstAddLayer u0(
        .x2(x2_q),
        .ctr(ctr),
        .out(rc_out),
        .rounds(rounds)
    );

    // Substituition Layer
    wire [63:0] sl0, sl1, sl2, sl3, sl4;
    SubLayer u1(
        .x0(x0_q), .x1(x1_q), .x2(rc_out), .x3(x3_q), .x4(x4_q),
        .sl0(sl0), .sl1(sl1), .sl2(sl2), .sl3(sl3), .sl4(sl4) 
    );

    // Linear Diffusion Layer
    LinearLayer u2(
        .X0(sl0), .X1(sl1), .X2(sl2), .X3(sl3), .X4(sl4),
        .Y0(x0_d), .Y1(x1_d), .Y2(x2_d), .Y3(x3_d), .Y4(x4_d) 
    );
    
endmodule
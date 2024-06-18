// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module select_encode_logic (
    input [31:0] ir,
    input gra, grb, grc, r_in, r_out, ba_out,
    output [15:0] r0_15in, r0_15out,
    output [4:0] op_code,
    output [31:0] c_sign_extended
);

    wire [3:0] A, B, C, E;
    wire [15:0] decoded_logic;

    assign A = {4{gra}} & ir[26:23];
    assign B = {4{grb}} & ir[22:19];
    assign C = {4{grc}} & ir[18:15];

    assign E = (A | B | C);

    decoder_4_16 dec_4_16(.in(E), .out(decoded_logic));

    assign r0_15in = {16{r_in}} & decoded_logic;
    assign r0_15out = {16{r_out | ba_out}} & decoded_logic;
    assign op_code = ir[31:27];
    assign c_sign_extended = {{13{ir[18]}}, ir[18:0]};

endmodule

module decoder_4_16 (
    input [3:0] in,
    output reg [15:0] out
);

always @(*) begin
    out = 16'b0;
    case (in)
        4'b0000: out = 16'b0000000000000001;
        4'b0001: out = 16'b0000000000000010;
        4'b0010: out = 16'b0000000000000100;
        4'b0011: out = 16'b0000000000001000;
        4'b0100: out = 16'b0000000000010000;
        4'b0101: out = 16'b0000000000100000;
        4'b0110: out = 16'b0000000001000000;
        4'b0111: out = 16'b0000000010000000;
        4'b1000: out = 16'b0000000100000000;
        4'b1001: out = 16'b0000001000000000;
        4'b1010: out = 16'b0000010000000000;
        4'b1011: out = 16'b0000100000000000;
        4'b1100: out = 16'b0001000000000000;
        4'b1101: out = 16'b0010000000000000;
        4'b1110: out = 16'b0100000000000000;
        4'b1111: out = 16'b1000000000000000;
        default: out = 16'b0; 
    endcase
end

endmodule
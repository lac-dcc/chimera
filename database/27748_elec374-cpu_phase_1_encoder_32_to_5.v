// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module encoder_32_to_5 (
    input wire [31:0] encoder_in,    // 32 bit input to be encoded to 5 bits
    output reg [4:0] encoder_out     // 5 bit output signal to bus_mux_32_to_1
);

always @ (*) begin
    case(encoder_in)
        // Convert the 32 bit input to a 5 bit output select signal for the bus_mux_32_to_1
        32'h000001  :   encoder_out <= 5'h01;   // r0               Binary input: 00000000000000000000000000000001  Binary output: 00001
        32'h000002  :   encoder_out <= 5'h02;   // r1               Binary input: 00000000000000000000000000000010  Binary output: 00010
        32'h000004  :   encoder_out <= 5'h03;   // r2               Binary input: 00000000000000000000000000000100  Binary output: 00011
        32'h000008  :   encoder_out <= 5'h04;   // r3               Binary input: 00000000000000000000000000001000  Binary output: 00100
        32'h000010  :   encoder_out <= 5'h05;   // r4               Binary input: 00000000000000000000000000010000  Binary output: 00101
        32'h000020  :   encoder_out <= 5'h06;   // r5               Binary input: 00000000000000000000000000100000  Binary output: 00110
        32'h000040  :   encoder_out <= 5'h07;   // r6               Binary input: 00000000000000000000000001000000  Binary output: 00111
        32'h000080  :   encoder_out <= 5'h08;   // r7               Binary input: 00000000000000000000000010000000  Binary output: 01000
        32'h000100  :   encoder_out <= 5'h09;   // r8               Binary input: 00000000000000000000000100000000  Binary output: 01001
        32'h000200  :   encoder_out <= 5'h0A;   // r9               Binary input: 00000000000000000000001000000000  Binary output: 01010
        32'h000400  :   encoder_out <= 5'h0B;   // r10              Binary input: 00000000000000000000010000000000  Binary output: 01011
        32'h000800  :   encoder_out <= 5'h0C;   // r11              Binary input: 00000000000000000000100000000000  Binary output: 01100
        32'h001000  :   encoder_out <= 5'h0D;   // r12              Binary input: 00000000000000000001000000000000  Binary output: 01101
        32'h002000  :   encoder_out <= 5'h0E;   // r13              Binary input: 00000000000000000010000000000000  Binary output: 01110
        32'h004000  :   encoder_out <= 5'h0F;   // r14              Binary input: 00000000000000000100000000000000  Binary output: 01111
        32'h008000  :   encoder_out <= 5'h10;   // r15              Binary input: 00000000000000001000000000000000  Binary output: 10000
        32'h010000  :   encoder_out <= 5'h11;   // hi               Binary input: 00000000000000010000000000000000  Binary output: 10001
        32'h020000  :   encoder_out <= 5'h12;   // lo               Binary input: 00000000000000100000000000000000  Binary output: 10010
        32'h040000  :   encoder_out <= 5'h13;   // zhi              Binary input: 00000000000001000000000000000000  Binary output: 10011
        32'h080000  :   encoder_out <= 5'h14;   // zlo              Binary input: 00000000000010000000000000000000  Binary output: 10100
        32'h100000  :   encoder_out <= 5'h15;   // pc               Binary input: 00000000000100000000000000000000  Binary output: 10101
        32'h200000  :   encoder_out <= 5'h16;   // mdr              Binary input: 00000000001000000000000000000000  Binary output: 10110
        32'h400000  :   encoder_out <= 5'h17;   // inport           Binary input: 00000000010000000000000000000000  Binary output: 10111
        32'h800000  :   encoder_out <= 5'h18;   // c_sign_extended  Binary input: 00000000100000000000000000000000  Binary output: 11000
        default     :   encoder_out <= 5'h00;   // select nothing   Binary input: invalid                           Binary output: 00000
    endcase    
end

endmodule
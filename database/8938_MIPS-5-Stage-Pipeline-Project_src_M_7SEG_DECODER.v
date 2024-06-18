// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_7SEG_DECODER(
    input[3:0] hex_num,
    output reg[6:0] segment
);
    always @(*) begin
        casex (hex_num)
            4'b0000: segment = 7'b100_0000;  //0 1 2 3 4 5 6
            4'b0001: segment = 7'b1111_001;  //one
            4'b0010: segment = 7'b010_0100;  //two
            4'b0011: segment = 7'b011_0000;  //three
            4'b0100: segment = 7'b001_1001;  //four
            4'b0101: segment = 7'b001_0010;  //five
            4'b0110: segment = 7'b000_0010;  //six
            4'b0111: segment = 7'b111_1000;  //seven
            4'b1000: segment = 7'b000_0000;  //eight
            4'b1001: segment = 7'b001_0000;  //nine
            4'b1010: segment = 7'b100_1000;  //A
            4'b1011: segment = 7'b000_0011;  //B
            4'b1100: segment = 7'b100_0110;  //C
            4'b1101: segment = 7'b010_0001;  //D
            4'b1110: segment = 7'b000_0110;  //E
            4'b1111: segment = 7'b000_1110;  //F
            default: segment = 7'b111_1111;  //Default
        endcase
    end
endmodule
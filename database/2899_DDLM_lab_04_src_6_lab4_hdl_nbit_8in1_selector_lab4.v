// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module bn_select_8_1_case
#(parameter DATA_WIDTH=8)
(
    input       [DATA_WIDTH-1:0] d0, 
    input       [DATA_WIDTH-1:0] d1,
    input       [DATA_WIDTH-1:0] d2,
    input       [DATA_WIDTH-1:0] d3,
    input       [DATA_WIDTH-1:0] d4, 
    input       [DATA_WIDTH-1:0] d5,
    input       [DATA_WIDTH-1:0] d6,
    input       [DATA_WIDTH-1:0] d7,
    input       [7:0] sel,
    output  reg [DATA_WIDTH-1:0] y
);
    
    always @(*)
        case (sel)
            8'b00000001: y=d0;
            8'b00000010: y=d1;
            8'b00000100: y=d2;
            8'b00001000: y=d3;
            8'b00010000: y=d4;
            8'b00100000: y=d5;
            8'b01000000: y=d6;
            8'b10000000: y=d7;
            default:     y={DATA_WIDTH{1'bx}};
        endcase
    
endmodule

module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    bn_select_8_1_case #(3) bn_select_8_1_case (.d0(SW[2:0]), .d1(SW[3:1]), .d2(SW[4:2]), 
                                                .d3(SW[5:3]), .d4(SW[6:4]), .d5(SW[7:5]), 
                                                .d6(SW[8:6]), .d7(SW[9:7]), .sel(SW[7:0]), .y(LEDR[2:0]));
    // if SW[7:0] == 8'b0_0000001..8'b0_1000000 LEDR[2:0] always will be 3'b001, SW[9:8] does not affect
    // if SW[7:0] == 8'b1_0000000 LEDR[0] = 1'b1, LEDR[2:1] = SW[9:8]. 
endmodule
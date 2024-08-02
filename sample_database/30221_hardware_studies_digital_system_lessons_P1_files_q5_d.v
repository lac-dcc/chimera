// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module LUT_4bit_1s (
    input wire [3:0] bits,
    output reg [2:0] count
);
    reg [2:0] data [15:0];
    
    initial begin
        data[0] = 3'd00;
        data[1] = 3'd01;
        data[2] = 3'd01;
        data[3] = 3'd02;
        data[4] = 3'd01;
        data[5] = 3'd02;
        data[6] = 3'd02;
        data[7] = 3'd03;
        data[8] = 3'd01;
        data[9] = 3'd02;
        data[10] = 3'd02;
        data[11] = 3'd03;
        data[12] = 3'd02;
        data[13] = 3'd03;
        data[14] = 3'd03;
        data[15] = 3'd04;
    end

    always @(bits) begin
        count = data[bits];
    end
endmodule

module LUT_12bit_1s(
    output reg [3:0] count,
    input wire [11:0] bits
);
    wire [2:0] Val0;
    wire [2:0] Val1;
    wire [2:0] Val2;
    LUT_4bit_1s lut0 (
        .bits(bits[3:0]),
        .count(Val0)
    );

    LUT_4bit_1s lut1 (
        .bits(bits[7:4]),
        .count(Val1)
    );

    LUT_4bit_1s lut2 (
        .bits(bits[11:8]),
        .count(Val2)
    );
    always @(Val0, Val1, Val2) begin
        count = Val0 + Val1 + Val2;
    end
endmodule

// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module encoder_BCD (
    input wire [9:0] keypad,
    input wire enablen,
    output reg [3:0] BCD
);
    initial begin
        BCD = 4'b1111;
    end

    always@(keypad or enablen) begin
        if (!enablen) begin
            case (keypad)
                10'b0000000001: BCD = 4'b0000;
                10'b0000000010: BCD = 4'b0001;
                10'b0000000100: BCD = 4'b0010;
                10'b0000001000: BCD = 4'b0011;
                10'b0000010000: BCD = 4'b0100;
                10'b0000100000: BCD = 4'b0101;
                10'b0001000000: BCD = 4'b0110;
                10'b0010000000: BCD = 4'b0111;
                10'b0100000000: BCD = 4'b1000;
                10'b1000000000: BCD = 4'b1001;
                default: BCD = 4'b1111;
            endcase
        end
    end

endmodule
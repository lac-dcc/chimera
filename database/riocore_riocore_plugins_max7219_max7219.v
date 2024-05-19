// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0

/* verilator lint_off WIDTH */

module max7219
    #(
        parameter DIVIDER = 22,
        parameter BRIGHTNESS = 8'h04,
     )
     (
         input clk,
         output reg mosi = 0,
         output reg sclk = 0,
         output reg sel = 1,
         input wire signed [23:0] value
     );
    parameter cmd = 8'd0;
    reg [7:0] state = 0;
    reg [7:0] data_pos = 0;
    reg [31:0] counter = 0;
    reg mclk = 0;
    reg next_clk = 0;

    reg [7:0] initcnt = 0;
    reg [15:0] cmddata = 0;

    localparam INIT_DECODEMODE_NONE = {8'h09, 8'h00};
    localparam INIT_INTENSE         = {8'h0a, BRIGHTNESS};
    localparam INIT_SCANLIMIT       = {8'h0b, 8'h07};
    localparam INIT_SD_NORMALOP     = {8'h0c, 8'h01};
    localparam INIT_DT_NORMALOP     = {8'h0f, 8'h01};

    reg [3:0] val = 0;
    reg [3:0] num = 3;
    wire [6:0] digit;
    reg [7:0] digit_pos = 0;
    wire [23:0] bcd;
    reg [23:0] numberAbs = 0;
    reg [3:0] prefix = 4'hb;

    bin2bcd bin2bcd1 (
        .bin (numberAbs),
        .bcd (bcd)
    );

    seven_segments sg0 (
        .clk(mclk),
        .binary(val),
        .display(digit)
    );

    wire [3:0] nums [0:7];
    assign nums[7] = 4'hb;
    assign nums[6] = prefix;
    assign nums[5] = int100000[3:0];
    assign nums[4] = int10000[3:0];
    assign nums[3] = int1000[3:0];
    assign nums[2] = int100[3:0];
    assign nums[1] = int10[3:0];
    assign nums[0] = int1[3:0];

    wire [7:0] int1;
    wire [7:0] int10;
    wire [7:0] int100;
    wire [7:0] int1000;
    wire [7:0] int10000;
    wire [7:0] int100000;
    assign int1 = 8'd48 + {4'd0, bcd[3:0]};
    assign int10 = 8'd48 + {4'd0, bcd[7:4]};
    assign int100 = 8'd48 + {4'd0, bcd[11:8]};
    assign int1000 = 8'd48 + {4'd0, bcd[15:12]};
    assign int10000 = 8'd48 + {4'd0, bcd[19:16]};
    assign int100000 = 8'd48 + {4'd0, bcd[23:20]};

    always @(posedge clk) begin

        if (value < 0) begin
            numberAbs <= -value;
            prefix <= 4'ha;
        end else begin
            numberAbs <= value;
            prefix <= 4'hb;
        end

        if (counter == 0) begin
            counter <= DIVIDER;
            mclk <= ~mclk;
        end else begin
            counter <= counter - 1;
        end
    end
    always @(posedge mclk) begin
        if (state == 0) begin
            sclk = 0;
            sel = 0;
            data_pos = 0;
            state = 1;
            next_clk = 0;
        end else if (state == 1) begin
            if (next_clk == 1) begin
                next_clk = 0;
                sclk = 1;
            end else if (data_pos < 16) begin
                sclk = 0;
                mosi = cmddata[15 - data_pos];
                next_clk = 1;
                data_pos = data_pos + 1;
            end else begin
                state = 2;
                mosi = 0;
                sclk = 0;
            end
        end else if (state == 2) begin
            sel = 1;
            state = state + 1;
            val <= nums[num];
        end else if (state == 3) begin


            case(initcnt)
                0: begin
                    cmddata <= INIT_DECODEMODE_NONE;
                    initcnt <= initcnt + 1;
                end
                1: begin
                    cmddata <= INIT_INTENSE;
                    initcnt <= initcnt + 1;
                end
                2: begin
                    cmddata <= INIT_SCANLIMIT;
                    initcnt <= initcnt + 1;
                end
                3: begin
                    cmddata <= INIT_SD_NORMALOP;
                    initcnt <= initcnt + 1;
                end

                4: begin
                    if (num < 8) begin
                        if (num == 2) begin
                            cmddata <= {num + 1, 1'd1, digit};
                        end else begin
                            cmddata <= {num + 1, 1'd0, digit};
                        end
                        num <= num + 1;
                    end else begin
                        num <= 0;
                    end
                
                end
            endcase



            state = 0;
        end
    end
endmodule


module seven_segments (
        input wire clk,
        input wire [3:0] binary,
        output reg [6:0] display
    );

    /*
            6

        1       5

            0

        2       4

            3
    */

    always @(binary) begin
        case (binary)
            4'h0: display = 7'b1111110;
            4'h1: display = 7'b0110000;
            4'h2: display = 7'b1101101;
            4'h3: display = 7'b1111001;
            4'h4: display = 7'b0110011;
            4'h5: display = 7'b1011011;
            4'h6: display = 7'b1011111;
            4'h7: display = 7'b1110000;
            4'h8: display = 7'b1111111;
            4'h9: display = 7'b1111011;

            4'ha: display = 7'b0000001;
            4'hb: display = 7'b0000000;
            4'hc: display = 7'b1001110;
            4'hd: display = 7'b0111101;
            4'he: display = 7'b1001111;
            4'hf: display = 7'b1000111;
            default: display = 7'b0000000;
        endcase
    end

endmodule



module bin2bcd(
        input [19:0] bin,
        output reg [23:0] bcd
    );
    integer i;
    always @(bin) begin
        bcd=0;
        for (i = 0; i < 20; i = i + 1) begin
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 4'd3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 4'd3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 4'd3;
            if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 4'd3;
            if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 4'd3;
            if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 4'd3;

            bcd = {bcd[22:0], bin[19 - i]};
        end
    end
endmodule


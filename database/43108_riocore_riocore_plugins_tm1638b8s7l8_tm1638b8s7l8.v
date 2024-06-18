// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module tm1638b8s7l8
    #(parameter DIVIDER = 1000)
    (
        input clk,
        output sw0,
        output sw1,
        output sw2,
        output sw3,
        output sw4,
        output sw5,
        output sw6,
        output sw7,

        input led0,
        input led1,
        input led2,
        input led3,
        input led4,
        input led5,
        input led6,
        input led7,

        input signed [23:0] number1,
        input [7:0] number2,

        output reg sel = 1,
        output reg sclk = 1,
        inout data
    );

    wire dataIn;
    reg dataOut = 0;
    reg isSending = 0;
    reg read_cmd = 0;

    reg [23:0] numberAbs = 0;

    assign data = isSending ? dataOut : 1'bz;
    assign dataIn = data;

    reg [31:0] counter = 0;
    reg mclk = 0;
    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= DIVIDER;
            mclk <= ~mclk;
        end else begin
            counter <= counter - 1;
        end
    end

    reg [7:0] cmd_size = 8;
    reg [7:0] cmd_cnt = 0;
    reg [23:0] cmd = 8'h8F;
    reg [7:0] state = 0;
    reg [7:0] data_pos = 0;


    reg [31:0] data_read = 0;
    reg [3:0] prefix = 4'hb;
    
    reg dot0 = 0;
    reg dot1 = 0;
    reg dot2 = 0;
    reg dot3 = 0;
    reg dot4 = 0;
    reg dot5 = 0;
    reg dot6 = 1;
    reg dot7 = 0;

    wire [7:0] leds;
    assign leds = {led7, led6, led5, led4, led3, led2, led1, led0};
    wire [7:0] dots;
    assign dots = {dot7, dot6, dot5, dot4, dot3, dot2, dot1, dot0};

    reg [31:0] switches = 0;
    assign sw7 = switches[3];
    assign sw6 = switches[11];
    assign sw5 = switches[19];
    assign sw4 = switches[27];
    assign sw3 = switches[7];
    assign sw2 = switches[15];
    assign sw1 = switches[23];
    assign sw0 = switches[31];


    reg [3:0] num = 3;
    wire [6:0] digit;

    reg [7:0] digit_pos = 0;

    seven_segments sg0 (
            .clk(clk),
            .binary(num),
            .display(digit)
    );

    wire [23:0] bcd;
    wire [23:0] bcd2;

    bin2bcd bin2bcd1 (
                .bin (numberAbs[15:0]),
                .bcd (bcd)
            );

    bin2bcd bin2bcd2 (
                .bin (number2),
                .bcd (bcd2)
            );


    wire [3:0] nums [0:7];
    assign nums[0] = int10b[3:0];
    assign nums[1] = int1b[3:0];
    assign nums[2] = prefix;
    assign nums[3] = int10000[3:0];
    assign nums[4] = int1000[3:0];
    assign nums[5] = int100[3:0];
    assign nums[6] = int10[3:0];
    assign nums[7] = int1[3:0];

    wire [7:0] int1b;
    wire [7:0] int10b;
    wire [7:0] int1;
    wire [7:0] int10;
    wire [7:0] int100;
    wire [7:0] int1000;
    wire [7:0] int10000;
    assign int1b = 8'd48 + {4'd0, bcd2[3:0]};
    assign int10b = 8'd48 + {4'd0, bcd2[7:4]};
    assign int1 = 8'd48 + {4'd0, bcd[3:0]};
    assign int10 = 8'd48 + {4'd0, bcd[7:4]};
    assign int100 = 8'd48 + {4'd0, bcd[11:8]};
    assign int1000 = 8'd48 + {4'd0, bcd[15:12]};
    assign int10000 = 8'd48 + {4'd0, bcd[19:16]};




    always @(posedge mclk) begin
    
        if (number1 < 0) begin
            numberAbs <= -number1;
            prefix <= 4'ha;
        end else begin
            numberAbs <= number1;
            prefix <= 4'hb;
        end
    
        num <= nums[digit_pos];
        if (state == 0) begin
            sclk <= 1;
            sel <= 0;
            dataOut <= 0;
            data_pos <= 0;
            state <= 1;

        end else if (state == 1) begin

            if (sclk == 1) begin
                sclk <= 0;

                if (isSending == 1) begin
                    dataOut <= cmd[data_pos];
                end
                if (isSending == 0) begin
                    data_read <= {data_read[30:0], dataIn};
                end


            end else if (data_pos < cmd_size) begin

                //if (isSending == 0) begin
                //    data_read <= {data_read[30:0], dataIn};
                //end

                if (read_cmd == 1 && data_pos == 8) begin
                    isSending <= 0;
                end
                data_pos <= data_pos + 8'd1;


                sclk <= 1;
            end else begin
            
                switches <= data_read;
            
                state <= state + 8'd1;
                sclk <= 1;
            end

        end else if (state == 2) begin
            sel <= 1;
            sclk <= 0;

            dataOut <= 0;
            isSending <= 1;

            state <= state + 8'd1;
        end else if (state == 3) begin
            sclk <= 1;
            data_pos <= 0;


            case (cmd_cnt)
                0: begin
                    cmd <= 8'h8F;
                    cmd_size <= 8'd8;
                    read_cmd <= 0;
                    cmd_cnt <= cmd_cnt + 8'd1;
                end
                1: begin
                    cmd <= 8'h40;
                    cmd_size <= 8'd8;
                    cmd_cnt <= cmd_cnt + 8'd1;
                    read_cmd <= 0;
                    digit_pos <= 0;
                end

                2: begin
                    if (digit_pos < 8) begin
                        cmd[16] <= leds[digit_pos];
                        cmd[15] <= dots[digit_pos];
                        cmd[14:8] <= digit;
                        cmd[7:0] <= 8'hc0 + (digit_pos<<1);
                        cmd_size <= 8'd24;
                        read_cmd <= 0;
                        digit_pos <= digit_pos + 1;
                    end else begin
                        cmd_cnt <= cmd_cnt + 8'd1;
                    end
                end

                3: begin
                    cmd <= 8'h42;
                    cmd_size <= 8'd40;
                    read_cmd <= 1;


                    cmd_cnt <= 0;
                end

            endcase

            state <= 0;
        end
    end



endmodule



module seven_segments (
        input wire clk,
        input wire [3:0] binary,
        output reg [6:0] display
    );

    always @(binary) begin
        case (binary)
            4'h0: display = 7'b0111111;
            4'h1: display = 7'b0000110;
            4'h2: display = 7'b1011011;
            4'h3: display = 7'b1001111;
            4'h4: display = 7'b1100110;
            4'h5: display = 7'b1101101;
            4'h6: display = 7'b1111101;
            4'h7: display = 7'b0000111;
            4'h8: display = 7'b1111111;
            4'h9: display = 7'b1101111;

            4'ha: display = 7'b1000000;
            4'hb: display = 7'b0000000;
            4'hc: display = 7'b0111001;
            4'hd: display = 7'b1011110;
            4'he: display = 7'b1111001;
            4'hf: display = 7'b1110001;
            default: display = 7'b1111001;
        endcase
    end

endmodule



module bin2bcd(
        input [15:0] bin,
        output reg [23:0] bcd
    );
    integer i;
    always @(bin) begin
        bcd=0;
        for (i = 0; i < 16; i = i + 1) begin
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 4'd3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 4'd3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 4'd3;
            if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 4'd3;
            if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 4'd3;
            if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 4'd3;

            bcd = {bcd[22:0], bin[15 - i]};
        end
    end
endmodule


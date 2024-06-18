// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module ds18b20
    #(parameter SPEED = 24)
     (
         input clk,
         inout one_wire,
         output reg signed [15:0] temperature
     );

    reg clk_1us;
    reg [31:0]counter;
    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= SPEED;
            clk_1us <= ~clk_1us;
        end else begin
            counter <= counter - 1;
        end
    end

    reg [19:0] cnt_1us;
    reg cnt_1us_clear;
    always @ (posedge clk_1us) begin
        if (cnt_1us_clear) begin
            cnt_1us <= 0;
        end else begin
            cnt_1us <= cnt_1us + 1'b1;
        end
    end

    parameter S00     = 5'h00;
    parameter S0      = 5'h01;
    parameter S1      = 5'h03;
    parameter S2      = 5'h02;
    parameter S3      = 5'h06;
    parameter S4      = 5'h07;
    parameter S5      = 5'h05;
    parameter S6      = 5'h04;
    parameter S7      = 5'h0C;
    parameter WRITE0  = 5'h0D;
    parameter WRITE1  = 5'h0F;
    parameter WRITE00 = 5'h0E;
    parameter WRITE01 = 5'h0A;
    parameter READ0   = 5'h0B;
    parameter READ1   = 5'h09;
    parameter READ2   = 5'h08;
    parameter READ3   = 5'h18;

    reg [4:0] state;
    reg [15:0] temperature_buf;
    reg [5:0] step;
    reg [3:0] bit_valid;
    reg one_wire_buf;

    assign one_wire = one_wire_buf;

    always @(posedge clk_1us) begin
        case (state)
            S00 : begin
                temperature_buf <= 16'h001F;
                state <= S0;
            end
            S0 :  begin
                cnt_1us_clear <= 1;
                one_wire_buf <= 0;
                state <= S1;
            end
            S1 :  begin
                cnt_1us_clear <= 0;
                if (cnt_1us == 500) begin
                    cnt_1us_clear <= 1;
                    one_wire_buf <= 1'bZ;
                    state <= S2;
                end
            end
            S2 :  begin
                cnt_1us_clear <= 0;
                if (cnt_1us == 100) begin
                    cnt_1us_clear <= 1;
                    state <= S3;
                end
            end
            S3 :  if (~one_wire) begin
                    state <= S4;
                end else if (one_wire) begin
                    state <= S0;
                end
            S4 :  begin
                cnt_1us_clear <= 0;
                if (cnt_1us == 400) begin
                    cnt_1us_clear <= 1;
                    state <= S5;
                end
            end
            S5 :  begin
                if (step == 0) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 1) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 2) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 3) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 4) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 5) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 6) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 7) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 8) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 9) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 10) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 11) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 12) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 13) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 14) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 15) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 16) begin
                    one_wire_buf <= 1'bZ;
                    step <= step + 1'b1;
                    state <= S6;
                end else if (step == 17) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 18) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 19) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 20) begin
                    step <= step + 1'b1;
                    state <= WRITE01;
                    one_wire_buf <= 0;
                end else if (step == 21) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 22) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 23) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 24) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 25) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step >= 26 && step <= 30) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 31) begin
                    step <= step + 1'b1;
                    state <= WRITE0;
                end else if (step == 32) begin
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= WRITE01;
                end else if (step == 33) begin
                    step <= step + 1'b1;
                    state <= S7;
                end
            end
            S6 :  begin
                cnt_1us_clear <= 0;
                if (cnt_1us == 750000 | one_wire) begin
                    cnt_1us_clear <= 1;
                    state <= S0;
                end
            end
            S7 :  begin
                if (step == 34) begin
                    bit_valid <= 0;
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= READ0;
                end else if (step >= 35 && step <= 49) begin
                    bit_valid <= bit_valid + 1'b1;
                    one_wire_buf <= 0;
                    step <= step + 1'b1;
                    state <= READ0;
                end else if (step == 50) begin
                    step <= 0;
                    state <= S0;

                    temperature <= temperature_buf;

                end
            end
            WRITE0 : begin
                cnt_1us_clear <= 0;
                one_wire_buf <= 0;
                if (cnt_1us == 80) begin
                    cnt_1us_clear <= 1;
                    one_wire_buf <= 1'bZ;
                    state <= WRITE00;
                end
            end
            WRITE00 : begin
                state <= S5;
            end
            WRITE01 : begin
                state <= WRITE1;
            end
            WRITE1 : begin
                cnt_1us_clear <= 0;
                one_wire_buf <= 1'bZ;
                if (cnt_1us == 80) begin
                    cnt_1us_clear <= 1;
                    state <= S5;
                end
            end
            READ0: begin
                state <= READ1;
            end
            READ1: begin
                cnt_1us_clear <= 0;
                one_wire_buf <= 1'bZ;
                if (cnt_1us == 10) begin
                    cnt_1us_clear <= 1;
                    state <= READ2;
                end
            end
            READ2: begin
                temperature_buf[bit_valid] <= one_wire;
                state <= READ3;
            end
            READ3: begin
                cnt_1us_clear <= 0;
                if (cnt_1us == 55) begin
                    cnt_1us_clear <= 1;
                    state <= S7;
                end
            end
            default: begin
                state <= S00;
            end
        endcase
    end
endmodule

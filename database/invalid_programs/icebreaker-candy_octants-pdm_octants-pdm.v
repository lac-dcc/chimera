`default_nettype none

`include "../include/led-pdm-gamma.v"

module top (
        input         CLK,
        input         BTN_N,
        output [15:0] LED_PANEL);

        led_main #(
            .FRAME_BITS(10),
            .DELAY(1)
        ) main (
            .CLK(CLK),
            .resetn_btn(BTN_N),
            .LED_PANEL(LED_PANEL));

endmodule

module painter24(
        input         clk,
        input         reset,
        input  [9:0] frame,
        input   [7:0] subframe,
        input   [5:0] x,
        input   [5:0] y,
        output [23:0] rgb24);

    // Calculate flyer position.
    wire [23:0] fast_frame;
    assign fast_frame = {frame, subframe};

    localparam FSPEED = 5; // 0 to 7 work.
    reg [5:0] flyer_x0, flyer_x1, flyer_y0, flyer_y1;
    always @(posedge clk) begin
        flyer_x0 <= fast_frame[FSPEED+:6];
        flyer_x1 <= fast_frame[FSPEED+:6] + 4;
        flyer_y0 <= fast_frame[FSPEED+6+:6];
        flyer_y1 <= fast_frame[FSPEED+6+:6] + 4;
    end

    wire in_flyer;
    assign in_flyer = 0 && flyer_x0 <= x && x < flyer_x1 &&
                      flyer_y0 <= y && y < flyer_y1;

    reg [2:0] schan, gchan;     // color channels that are solid, gradient.
    reg [4:0] sdist, gdist;
    always @(posedge clk) begin
        if (!y[5]) begin
            if (!x[5]) begin
                if (x > y) begin        // NNW octant
                    schan  <= 3'b000;
                    gchan  <= 3'b001;
                    sdist  <= 31 - y;
                    gdist  <= x - y;
                end
                else begin              // WNW octant
                    schan <= 3'b000;
                    gchan <= 3'b100;
                    sdist <= 31 - x;
                    gdist <= y - x;
                end
            end
            else begin
                if ((63 - x) > y) begin // NNE octant
                    schan <= 3'b001;
                    gchan <= 3'b010;
                    sdist <= 31 - y;
                    gdist <= x[4:0];
                end
                else begin              // ENE octant
                    schan <= 3'b011;
                    gchan <= 3'b001;
                    sdist <= x[4:0];
                    gdist <= 31 - y;
                end
            end
        end
        else begin
            if (x[5]) begin
                if (x > y) begin        // ESE octant
                    schan <= 3'b010;
                    gchan <= 3'b100;
                    sdist <= x[4:0];
                    gdist <= y[4:0];
                end
                else begin              // SSE octant
                    schan <= 3'b110;
                    gchan <= 3'b001;
                    sdist <= y[4:0];
                    gdist <= y - x;
                end
            end
            else begin
                if (x > (63 - y)) begin // SSW octant
                    schan <= 3'b101;
                    gchan <= 3'b010;
                    sdist <= y[4:0];
                    gdist <= x + y;
                end
                else begin              // WSW octant
                    schan <= 3'b100;
                    gchan <= 3'b001;
                    sdist <= 31 - x;
                    gdist <= y[4:0];
                end
            end
        end
    end

    wire [7:0] solid, grad;
    assign solid = {sdist[4:0], sdist[4:2]};
    assign grad  = {gdist[4:0], gdist[4:2]};
    // assign solid = {3'b0, sdist[4:0]};
    // assign grad  = {3'b0, gdist[4:0]};
    wire [7:0] red, green, blue;
    assign red   = in_flyer ? 0 : gchan[0] ? grad : (schan[0] ? solid : 0);
    assign green = in_flyer ? 0 : gchan[1] ? grad : (schan[1] ? solid : 0);
    assign blue  = in_flyer ? 0 : gchan[2] ? grad : (schan[2] ? solid : 0);

    assign rgb24 = {blue, green, red};

endmodule

// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module udpoti
    #(
         parameter RESOLUTION = 100,
         parameter DIVIDER = 100000
     )
     (
         input clk,
         input wire [31:0] value,
         output reg updown = 0,
         output reg increment = 0
     );

    reg ctrl_clk = 0;
    reg [31:0] counter;
    reg init = 0;
    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= DIVIDER;
            ctrl_clk <= ~ctrl_clk;
        end else begin
            counter <= counter - 1;
        end
    end

    reg [31:0] init_counter = RESOLUTION;
    reg [31:0] pos = 0;
    always @ (posedge ctrl_clk) begin
        if (init == 1) begin
            updown <= 0;
            if (init_counter > 0) begin
                if (increment == 0) begin
                    increment <= 1;
                end else begin
                    increment <= 0;
                    init_counter <= init_counter - 1;
                end
            end else begin
                init <= 0;
                pos <= 0;
            end
        end else begin
            if (value > pos) begin
                updown <= 1;
                if (increment == 0) begin
                    increment <= 1;
                end else begin
                    increment <= 0;
                    pos <= pos + 1;
                end
            end else if (value < pos) begin
                updown <= 0;
                if (increment == 0) begin
                    increment <= 1;
                end else begin
                    increment <= 0;
                    pos <= pos - 1;
                end
            end
        end
    end
endmodule


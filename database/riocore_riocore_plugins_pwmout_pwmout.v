// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module pwmout
    #(parameter DIVIDER = 255)
     (
         input clk,
         input signed [31:0] dty,
         input enable,
         output reg dir = 0,
         output pwm,
         output en
     );
    reg [31:0] dtyAbs = 32'd0;
    reg pulse = 0;
    assign en = enable;
    assign pwm = pulse;
    reg [31:0] counter = 0;
    always @ (posedge clk) begin
        if (dty > 0) begin
            dtyAbs <= dty;
            dir <= 1;
        end else begin
            dtyAbs <= -dty;
            dir <= 0;
        end
        if (dtyAbs != 0) begin
            counter <= counter + 1;
            if (counter == DIVIDER) begin
                if (enable) begin
                    pulse <= 1;
                end
                counter <= 0;
            end else if (counter == dtyAbs) begin
                pulse <= 0;
            end
        end else begin
            pulse <= 0;
        end
    end
endmodule

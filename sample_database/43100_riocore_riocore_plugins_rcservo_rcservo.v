// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module rcservo
    #(parameter DIVIDER = 255)
     (
         input clk,
         input signed [31:0] position,
         input enable,
         output pwm
     );
    reg [31:0] positionAbs = 32'd0;
    reg pulse = 0;
    assign pwm = pulse;
    reg [31:0] counter = 0;
    always @ (posedge clk) begin
        if (position > 0) begin
            positionAbs <= position;
        end else begin
            positionAbs <= -position;
        end
        if (positionAbs != 0) begin
            counter <= counter + 1;
            if (counter == DIVIDER) begin
                if (enable) begin
                    pulse <= 1;
                end
                counter <= 0;
            end else if (counter == positionAbs) begin
                pulse <= 0;
            end
        end else begin
            pulse <= 0;
        end
    end
endmodule

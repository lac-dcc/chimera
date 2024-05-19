// This program was cloned from: https://github.com/pmezydlo/BeagleWire
// License: GNU General Public License v2.0

module pwm (input                     rst,
            input                     en,
            input [COUNTER_WIDTH-1:0] period,
            input [COUNTER_WIDTH-1:0] duty_cycle,
            input                     polarity,
            input                     clk,
            output                    out,
           );

parameter COUNTER_WIDTH = 32;
reg out_pwm;
reg [COUNTER_WIDTH-1:0] count;

initial begin
    count <= 0;
end

assign out = (polarity == 1'b0) ? out_pwm : !out_pwm;

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        out_pwm <= 1'b0;
        count <= 0;
    end else begin
        if (en == 1'b0) begin
            out_pwm <= 1'b0;
        end else begin
            if (count < period) begin
                count <= count + 1'b1;
            end else begin
                count <= 0;
            end

            if (count < duty_cycle) begin
                out_pwm <= 1;
            end else begin
                out_pwm <= 0;
            end
        end
    end
end

endmodule

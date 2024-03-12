// 128-level breathing LED
// Author: Pepijn de Vos

module pwmled(
    input clk, 
    input rst_n, 
    output pwm_out
);

reg [15:0] counter;

wire [6:0] idx;
wire [6:0] level;
wire polarity;

assign polarity = counter[15];
assign idx = counter[6:0];
assign level = counter[15:8];
assign pwm_out = polarity ^ (idx > level);

always @(posedge clk)
begin
    if (!rst_n)
    begin
        counter <= 16'b0000000000000000;
    end
    else
    begin
        counter <= counter + 1'b1;
    end
end

endmodule

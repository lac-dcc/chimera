module pwm(
    input pwm_clk,
    input [7:0] duty,
    output reg PWM_PIN
    );

reg [7:0] count = 0;

always @(posedge pwm_clk)
begin
  count <= count + 1;
  PWM_PIN <= (count < duty);
end

endmodule

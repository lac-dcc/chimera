module pwm_tester(
    input CLK,
    input switch_up,
    input switch_dn,
    output PWM_PIN
    );

wire s_up, s_dn;
debouncer d1(.CLK (CLK), .switch_input (switch_up), .trans_up (s_up));
debouncer d2(.CLK (CLK), .switch_input (switch_dn), .trans_up (s_dn));

reg [7:0] duty = 0;
reg [6:0] prescaler = 0; // CLK freq / 128 / 256 = 1.5kHz
pwm p(.pwm_clk (prescaler[6]), .duty (duty), .PWM_PIN (PWM_PIN));

always @(posedge CLK)
begin
  prescaler <= prescaler + 1;
  if (s_up)
  begin
    duty <= duty + 5;
  end
  if (s_dn)
  begin
    duty <= duty - 5;
  end  
end

endmodule

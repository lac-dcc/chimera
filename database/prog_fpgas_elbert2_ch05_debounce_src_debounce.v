// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module debounce(
    input CLK,
    input switch_a,
    input switch_b,
    output reg led_a,
    output reg led_b,
    output reg led_c
    );

wire s_a_dn, s_b_up, s_a_state;
debouncer d1(.CLK (CLK), .switch_input (switch_a), .trans_dn (s_a_dn));
debouncer d2(.CLK (CLK), .switch_input (switch_b), .trans_up (s_b_up));
debouncer d3(.CLK (CLK), .switch_input (switch_a), .state (s_a_state));

always @(posedge CLK)
begin
  if (s_a_dn)
  begin
    led_a <= ~ led_a;
  end
  if (s_b_up)
  begin
    led_b <= ~ led_b;
  end
  led_c <= s_a_state;
end

endmodule

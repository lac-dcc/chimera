// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module servo_tester(
    input CLK,
    output CONTROL_PIN
    );

reg [24:0] prescaler;
reg [15:0] pulse_len = 500; // microseconds

servo #(32) p(.CLK (CLK), .pulse_len (pulse_len), .CONTROL_PIN (CONTROL_PIN));

always @(posedge CLK)
begin
  prescaler <= prescaler + 1;
  if (prescaler == 32000000) // 1Hz
  begin
    pulse_len <= pulse_len + 100;
    if (pulse_len == 2500)
    begin
      pulse_len <= 500;
    end		
  end  
end

endmodule

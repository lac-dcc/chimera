// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module servo(
    input CLK,
    input [15:0] pulse_len,  // microseconds
    output reg CONTROL_PIN
    );
	 
parameter CLK_F = 50; // CLK freq in MHz

reg [15:0] prescaler;
reg [15:0] count = 0;

always @(posedge CLK)
begin
  prescaler <= prescaler + 1;
  if (prescaler == CLK_F - 1) 
  begin
    prescaler <= 0;
    count <= count + 1;
    CONTROL_PIN <= (count < pulse_len);
	 if (count == 19999) // 20 milliseconds
    begin
        count <= 0;
    end
  end
end

endmodule

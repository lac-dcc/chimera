// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module alarm(
    input CLK,
    input enable,
    output reg BUZZER
    );

reg [25:0] count;

always @(posedge CLK) 
begin
  count <= count + 1;
  if ((count == 26'd11999) & enable) // 1kHz
  begin
    BUZZER <= ~ BUZZER;
    count <= 0;
  end
end

endmodule

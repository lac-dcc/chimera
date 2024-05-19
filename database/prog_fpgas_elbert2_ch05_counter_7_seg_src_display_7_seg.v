// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module display_7_seg(
    input CLK,
    input [3:0] units, tens, hundreds,
    output [7:0] SEG,
    output reg [2:0] DIGIT
    );
	 
reg [3:0] digit_data;
reg [1:0] digit_posn;
reg [23:0] prescaler;
	 
decoder_7_seg decoder(.CLK (CLK), .SEG	(SEG), .D (digit_data));   

always @(posedge CLK)
begin
  prescaler <= prescaler + 24'd1;
  if (prescaler == 24'd50000) // 1 kHz
  begin
    prescaler <= 0;
    digit_posn <= digit_posn + 2'd1;
    if (digit_posn == 0)
    begin
      digit_data <= units;
      DIGIT <= 4'b1110;
    end
    if (digit_posn == 2'd1)
    begin
      digit_data <= tens;
      DIGIT <= 4'b1101;
    end
    if (digit_posn == 2'd2)
    begin
      digit_data <= hundreds;
      DIGIT <= 4'b1011;
		digit_posn <= 0;
    end	
  end
end

endmodule

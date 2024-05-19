// This program was cloned from: https://github.com/simonmonk/prog_fpgas
// License: MIT License

module counter_7_seg(
    input CLK,
    input switch_up,
    input switch_clear,
    output [7:0] SEG,
    output [2:0] DIGIT
    );

wire s_up, s_clear;
debouncer d1(.CLK (CLK), .switch_input (switch_up), .trans_dn (s_up));
debouncer d2(.CLK (CLK), .switch_input (switch_clear), .trans_dn (s_clear));

reg [3:0] units, tens, hundreds;

display_7_seg display(.CLK (CLK), 
		.units (units), .tens (tens), .hundreds (hundreds),
		.SEG (SEG), .DIGIT (DIGIT));

always @(posedge CLK)
begin
  if (s_up)
  begin
	 units <= units + 1;
    if (units == 9) 
    begin
      units <= 0;
      tens <= tens + 1;
      if (tens == 9) 
      begin
        tens <= 0;
        hundreds <= hundreds + 1;
      end
    end		
  end
  if (s_clear)
  begin
    units <= 0;
    tens <= 0;
    hundreds <= 0;
  end
end

endmodule

// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module bin2bcd 
#(  parameter IN_WIDTH = 10,
              DIGITS   = 4
)
(
 input [IN_WIDTH - 1:0]      bin,
 output reg [DIGITS*4 - 1:0] bcd
);

integer i, j;
//BIN to BCD
always@*
begin
  bcd = 0;
  for (i=IN_WIDTH-1; i>=0; i=i-1) 
  begin  
    for (j=DIGITS-1; j >= 0; j = j - 1)
      if (bcd[4*j +: 4] >= 5) 
        bcd[4*j +: 4] = bcd[4*j +: 4] + 3;
    bcd = bcd << 1;
    bcd[0] = bin[i];
  end
end

endmodule

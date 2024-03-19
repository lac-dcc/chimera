module Counter(output reg [2:0] c, input reset, clk, en);
  
  always @(posedge clk)
  begin
    if(reset)
      c = 3'd0;
    else
    begin
      if(en == 1)
        c = c + 1;
      if(c == 3'd5)
        c = 0;
    end
  end
  
endmodule

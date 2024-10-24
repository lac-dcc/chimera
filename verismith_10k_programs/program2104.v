module top
#(parameter param11 = ((~^(((~(8'hbe)) || (8'ha0)) << (|((8'hb8) ? (8'hbf) : (8'ha6))))) >> (~&(^~((~^(8'hb9)) ? ((8'ha9) > (8'hb9)) : ((8'haf) | (8'hba)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire10, wire9, wire8, reg7, reg6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire1[(1'h1):(1'h0)], wire1};
      reg5 <= (~&(~|($unsigned(wire1[(1'h1):(1'h1)]) > $signed((wire2 ^ wire0)))));
      reg6 <= {reg4[(2'h3):(1'h1)]};
      reg7 <= $unsigned($signed(($signed((reg6 + (8'haf))) ?
          $signed((reg4 <= reg6)) : $unsigned({wire1}))));
    end
  assign wire8 = ((8'hbf) <<< $signed($signed(wire3[(5'h15):(2'h2)])));
  assign wire9 = $unsigned(wire0);
  assign wire10 = $signed($unsigned(reg5));
endmodule

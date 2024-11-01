module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      reg5 <= {((wire3[(4'hf):(3'h4)] ?
              wire2 : ({wire1,
                  (8'h9c)} <= reg4[(1'h0):(1'h0)])) ^~ reg4[(3'h5):(2'h3)]),
          wire1[(2'h2):(1'h0)]};
    end
  assign wire6 = $signed($unsigned((+$unsigned(((8'ha1) ? reg5 : wire0)))));
  assign wire7 = (+(&$unsigned(wire3)));
  assign wire8 = (~$unsigned($signed(reg5[(3'h5):(3'h5)])));
  assign wire9 = $unsigned($signed(($signed(wire3) ?
                     ((!reg4) ? reg5 : $signed(wire7)) : $signed((reg5 ?
                         wire1 : (8'h9f))))));
  assign wire10 = ($unsigned((($unsigned(reg4) ? wire9 : (~|wire7)) ?
                          (~reg4) : ($signed(wire2) >= $signed((8'ha0))))) ?
                      ((^(~|(8'hb6))) != (8'had)) : $signed((~&({wire6} * (^(8'ha7))))));
  assign wire11 = $unsigned((8'ha8));
endmodule

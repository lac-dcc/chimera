module top
#(parameter param9 = (^(~(&(^((8'ha5) << (8'hb3)))))), 
parameter param10 = {(({(8'h9f), (^param9)} ? ((-(8'ha0)) >>> (param9 ? (7'h40) : param9)) : param9) ^ (~&((param9 ? param9 : param9) == (param9 ? (8'h9e) : param9))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire8, wire7, wire4, reg6, reg5, (1'h0)};
  assign wire4 = (wire2 ? (~^$unsigned(wire2[(3'h4):(2'h2)])) : (8'hb7));
  always
    @(posedge clk) begin
      reg5 <= $signed(($signed((-(wire3 & wire0))) || wire4[(3'h4):(2'h2)]));
      reg6 <= ({$unsigned({$signed(wire1)})} ^ ($signed((~|reg5[(4'h8):(1'h1)])) ?
          wire0[(2'h2):(1'h1)] : $unsigned($signed(reg5))));
    end
  assign wire7 = (wire2[(4'hd):(3'h7)] <<< $signed($unsigned((wire0 ?
                     wire3 : $unsigned((8'h9c))))));
  assign wire8 = (^($signed((((8'h9f) != (8'hb4)) ?
                     $signed((8'hbb)) : reg6)) >> wire0));
endmodule

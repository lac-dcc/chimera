module top
#(parameter param9 = ((7'h44) <= ((((!(8'hba)) < ((8'hba) ? (8'hb4) : (8'hbc))) || (((8'hb2) <= (8'ha6)) == {(8'hbf), (8'ha4)})) ? (~&{((8'hbc) ? (8'haf) : (7'h43))}) : ((8'ha7) || (((8'hb0) ? (8'hac) : (8'ha0)) ? {(8'ha2), (8'h9c)} : ((8'ha9) ? (8'hb6) : (7'h44)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($signed(($unsigned((8'hb4)) - wire2)) <= (wire3 ?
                     $signed({wire3,
                         wire3}) : wire3[(3'h7):(1'h1)])) == $signed(({$signed((8'ha1)),
                         (wire2 ? (8'hbc) : (8'ha2))} ?
                     (wire1 ? (~^wire1) : (8'ha1)) : wire2[(1'h0):(1'h0)])));
  assign wire5 = ($signed(wire1) ? wire4 : wire4[(3'h7):(3'h5)]);
  assign wire6 = $unsigned(wire0[(2'h3):(1'h0)]);
  assign wire7 = $signed($signed({wire0[(2'h3):(1'h1)]}));
  assign wire8 = (|((((^~wire1) && $signed(wire3)) ?
                         wire5[(4'ha):(3'h4)] : ({wire1} ?
                             wire3[(2'h3):(1'h1)] : wire5[(4'he):(3'h4)])) ?
                     $unsigned({$signed(wire1)}) : $signed(wire7[(1'h0):(1'h0)])));
endmodule

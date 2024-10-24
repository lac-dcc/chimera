module top
#(parameter param8 = {{((((8'hb2) ? (8'hba) : (8'h9e)) ? (!(8'hb8)) : (^~(8'ha5))) << ({(8'hb9)} >= ((8'ha8) | (8'hbe))))}, {((((8'hb8) ? (8'hb2) : (8'hb2)) ? ((7'h44) >>> (7'h41)) : ((8'ha4) ^~ (7'h40))) ? (^((8'hb8) ? (8'haa) : (8'ha7))) : (-((8'hb9) ? (8'hac) : (8'hae)))), ((((8'ha9) <= (8'hb7)) ? (+(7'h43)) : (&(8'hb3))) >>> (((8'hb8) ? (8'haa) : (8'hb3)) >>> (~&(8'h9f))))}}, 
parameter param9 = (((!(param8 ? param8 : (~^param8))) ? param8 : param8) >= {(!param8)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3 ?
                     ({(wire3[(2'h2):(1'h1)] ? $signed(wire3) : (|wire2)),
                         wire3} > wire3) : (wire0 == wire3));
  assign wire5 = $unsigned(wire0);
  assign wire6 = (&({{$signed(wire1)}} >> (^((wire3 | (8'hbc)) << $signed(wire1)))));
  assign wire7 = ((+($signed({(8'ha8), wire2}) ?
                         $unsigned((&wire6)) : (~wire1[(4'h8):(2'h2)]))) ?
                     (($unsigned((~|wire2)) ?
                             $unsigned({wire0, wire3}) : $unsigned({wire3,
                                 wire4})) ?
                         wire5 : ((|$unsigned(wire0)) ?
                             wire5[(3'h4):(3'h4)] : $signed((wire2 >> wire3)))) : $signed($signed(({wire3,
                         wire3} ^ $signed(wire3)))));
endmodule

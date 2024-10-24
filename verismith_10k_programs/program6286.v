module top
#(parameter param11 = ({(((&(8'hb7)) ? (^~(8'hb7)) : (+(8'ha1))) ? (^(-(8'ha2))) : {((8'ha5) ? (8'hbe) : (8'had))})} ? (~&(~&(^~{(8'hb1)}))) : {{(((8'had) <<< (8'ha2)) ? ((8'haa) ? (8'hbe) : (8'ha2)) : (+(8'hbd))), ((!(8'hab)) ^ (8'ha7))}, {(((7'h42) ? (8'hb3) : (8'hba)) ? ((8'hb4) != (8'hba)) : ((8'ha8) - (8'haf)))}}), 
parameter param12 = ((!{(param11 ^ (param11 > param11))}) ? (((8'haf) ~^ (^~(^param11))) ? ((~&(param11 ? param11 : param11)) ? ((param11 > param11) ~^ ((8'h9f) ? param11 : param11)) : ((!param11) | (&param11))) : param11) : (~(8'hb3))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = $signed(($unsigned(($unsigned(wire3) | (8'hbc))) ?
                     wire1[(1'h0):(1'h0)] : {$signed($signed(wire2)), wire0}));
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned(wire1));
    end
  assign wire7 = ($signed($unsigned($unsigned((wire1 ? wire5 : wire0)))) ?
                     {wire1, wire3} : wire0[(1'h0):(1'h0)]);
  assign wire8 = reg6[(1'h0):(1'h0)];
  assign wire9 = (!(^~wire2[(4'hb):(1'h0)]));
  assign wire10 = $unsigned(wire1[(1'h0):(1'h0)]);
endmodule

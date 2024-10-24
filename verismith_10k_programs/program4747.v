module top
#(parameter param12 = (~&(((^(~&(8'hac))) ? (~^((7'h40) ? (7'h42) : (8'hb5))) : ((~&(8'hae)) << {(8'hbf)})) ? ((((8'hac) ? (8'hbc) : (7'h41)) > ((8'hb5) >> (8'hbe))) ? (~^{(8'h9d), (7'h42)}) : (8'ha1)) : (~^(~&((8'had) <= (8'ha8)))))), 
parameter param13 = ({((param12 ? {param12, param12} : (~^param12)) > param12), (param12 || (param12 ? (param12 ? param12 : param12) : (param12 ^~ param12)))} ? (({(param12 <<< param12)} ? param12 : {(param12 * (7'h41))}) ^ param12) : (param12 >> param12)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg11, reg10, reg9, reg8, (1'h0)};
  assign wire5 = (~(8'ha8));
  assign wire6 = $unsigned(wire3);
  assign wire7 = $unsigned($unsigned($signed({wire2})));
  always
    @(posedge clk) begin
      reg8 <= (~|((($unsigned(wire6) ? {(8'ha1), wire1} : (wire7 - wire2)) ?
          ((|(7'h43)) | $unsigned((7'h43))) : {wire4[(3'h7):(1'h0)],
              {wire7, wire1}}) != wire7));
      reg9 <= $signed(((~&wire2[(4'h8):(2'h2)]) ?
          ($unsigned($unsigned(wire4)) * $signed(wire3)) : $signed({wire5[(4'hd):(4'hb)],
              (~reg8)})));
      reg10 <= $signed($unsigned(($signed((wire3 + wire3)) + wire1)));
      if ((~|{{$unsigned((~wire2))}, $unsigned(wire2[(3'h4):(3'h4)])}))
        begin
          reg11 <= (+reg9);
        end
      else
        begin
          reg11 <= ((reg11 != reg10) & (reg11 + wire5));
        end
    end
endmodule

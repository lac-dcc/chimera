module top
#(parameter param12 = ((~|{(((8'ha8) ? (8'h9f) : (8'hb5)) ? ((8'hbe) ^~ (8'hb4)) : (!(8'hac))), (((8'hbd) >>> (8'haf)) || ((8'h9e) ? (8'hb3) : (8'ha6)))}) <= (!{(((8'ha7) ^~ (8'ha6)) * (8'hb2))})), 
parameter param13 = (({((param12 > param12) ? param12 : {param12})} >> (|((param12 ? param12 : param12) != (param12 >> param12)))) >= (((+param12) ~^ ((~^param12) && param12)) ? ((((8'hbd) <= param12) <<< param12) - ({param12, param12} >> (param12 || (8'hb6)))) : (~^{(param12 ? (8'ha8) : param12)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, wire4, reg11, reg10, reg9, reg8, (1'h0)};
  assign wire4 = (({($signed(wire0) != (+wire3))} ?
                     ((((8'ha5) ?
                         wire2 : wire2) + wire1[(4'h9):(1'h0)]) == {(wire0 ?
                             wire1 : wire0),
                         $signed(wire2)}) : $signed(wire2[(3'h7):(3'h5)])) + $signed(wire2));
  assign wire5 = (wire0[(2'h3):(2'h3)] ?
                     {($unsigned($unsigned(wire4)) >>> $signed(wire0))} : $unsigned($unsigned(((wire0 ?
                         wire4 : (8'had)) >= $signed(wire1)))));
  assign wire6 = (~|wire5);
  assign wire7 = $signed($signed({wire3[(1'h1):(1'h0)],
                     $signed((wire0 * wire5))}));
  always
    @(posedge clk) begin
      reg8 <= $signed(wire7);
      reg9 <= (($unsigned(wire7) == ((~(~|wire1)) ^~ {{wire1}})) || (({$signed(reg8),
              $signed(wire0)} ?
          $unsigned((wire1 - wire4)) : wire0[(3'h7):(3'h4)]) & $unsigned((wire3[(3'h6):(1'h1)] ?
          $unsigned(wire1) : wire3))));
      reg10 <= (reg9[(1'h0):(1'h0)] ?
          ((|($unsigned(wire5) ? wire1[(4'hd):(1'h0)] : {wire4, (8'ha2)})) ?
              ($signed((wire3 * reg8)) ?
                  $signed($signed((8'hba))) : (wire6 ?
                      $unsigned(wire2) : $unsigned(wire0))) : $signed($signed(wire0))) : $unsigned(({$signed(wire5),
                  $unsigned(wire4)} ?
              wire0[(2'h3):(1'h0)] : (-(wire2 ? wire5 : wire4)))));
      reg11 <= reg8[(2'h2):(1'h1)];
    end
endmodule

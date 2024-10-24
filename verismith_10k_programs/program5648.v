module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire18;
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire20,
                 wire18,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  module4 #() modinst19 (wire18, clk, wire0, wire2, wire1, wire3);
  assign wire20 = wire18;
  always
    @(posedge clk) begin
      reg21 <= (wire3[(2'h3):(2'h3)] ?
          $signed($unsigned(wire1[(3'h5):(3'h4)])) : (^~wire2));
      reg22 <= wire3[(4'he):(1'h0)];
      if ((8'hbe))
        begin
          reg23 <= (($unsigned(((^wire20) && ((8'haa) ? wire2 : wire2))) ?
              {$signed($unsigned(reg22)),
                  ((wire3 >= wire2) ?
                      reg22[(3'h5):(3'h5)] : (reg22 == wire3))} : wire0[(4'h8):(1'h1)]) > (+((|reg22[(3'h5):(1'h0)]) <= wire18[(3'h5):(3'h4)])));
          reg24 <= ((|$unsigned(($signed(reg23) << (reg21 ?
              wire18 : wire0)))) < (8'haa));
        end
      else
        begin
          reg23 <= {$signed(wire20[(4'hc):(4'ha)]),
              ((((^wire2) ? $signed((8'hb2)) : {reg22, wire3}) ?
                  ($signed((8'hb9)) ? (8'ha0) : $unsigned(wire20)) : ({reg24,
                      wire3} | (7'h43))) != $signed({$signed(wire0), reg23}))};
          if ($unsigned({$signed((~{wire2})), wire3[(5'h12):(3'h6)]}))
            begin
              reg24 <= wire20;
              reg25 <= reg23;
              reg26 <= (~&(!wire0));
            end
          else
            begin
              reg24 <= ($signed(((+(wire18 + reg22)) <= (|$unsigned((8'hb9))))) <<< $unsigned(reg25[(3'h5):(2'h3)]));
              reg25 <= {{wire1[(1'h0):(1'h0)], (~&reg26)}};
              reg26 <= (~(8'hb5));
              reg27 <= wire20[(2'h3):(2'h3)];
              reg28 <= ({$unsigned(($signed((7'h41)) & reg21[(4'h8):(4'h8)]))} != $signed(reg24));
            end
          reg29 <= (wire1 ^ $signed({wire3,
              $unsigned(((8'hac) ? wire18 : reg28))}));
          reg30 <= (+$signed($signed(((wire2 ? reg29 : wire1) ?
              (~|(8'hbe)) : $unsigned(reg25)))));
          reg31 <= (((^{reg30}) << wire20) <= reg23[(3'h4):(2'h2)]);
        end
      reg32 <= reg26[(3'h4):(1'h1)];
      reg33 <= (($signed(((reg28 ?
              wire2 : reg26) ^ (wire20 == wire1))) && wire2[(2'h2):(1'h0)]) ?
          wire0 : (({wire0,
                  reg24[(4'hb):(4'ha)]} != $signed((reg25 >= reg22))) ?
              reg22 : ($unsigned((~^wire20)) ?
                  wire1[(2'h3):(2'h3)] : (~&{(8'hac), reg30}))));
    end
  assign wire34 = (~&reg25);
  assign wire35 = (!wire1[(4'hd):(1'h1)]);
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = wire7;
  assign wire10 = wire7[(1'h0):(1'h0)];
  assign wire11 = $unsigned(({(!$unsigned(wire10))} <= {(wire5 ?
                          wire10[(4'hd):(2'h3)] : (wire9 * wire8))}));
  assign wire12 = $unsigned((-(&wire6)));
  assign wire13 = $signed(wire8[(3'h4):(1'h0)]);
  assign wire14 = (~$signed(wire13));
  assign wire15 = $signed((&wire9));
  assign wire16 = $unsigned($signed($signed($unsigned($unsigned(wire14)))));
  assign wire17 = $signed(((~|($signed(wire10) ?
                          $unsigned(wire6) : wire6[(3'h7):(3'h5)])) ?
                      (8'hb2) : (^$signed($signed(wire11)))));
endmodule

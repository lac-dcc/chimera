module top
#(parameter param29 = (^~((~^{((8'hb2) >= (8'ha2))}) ? {(((8'hb9) ? (8'hb4) : (8'hb9)) ? ((7'h42) ? (8'hae) : (7'h43)) : ((8'hb3) ? (8'h9c) : (8'hb7)))} : ((((8'hb0) ? (8'hb5) : (7'h44)) >> (+(8'hb9))) <= (((8'hab) >>> (8'h9e)) ? ((8'haa) ? (8'hb8) : (8'hac)) : {(8'ha9), (8'hb5)})))), 
parameter param30 = (((((~param29) || {param29}) ? (~|param29) : param29) <= (~&(8'ha4))) >>> ({((7'h42) >= {(8'hbe), (8'hb2)})} ? ((param29 * ((7'h40) ? param29 : param29)) ? {{param29}} : (((8'h9e) << param29) * {param29})) : (~^param29))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = {wire4};
  assign wire6 = ($signed((wire5[(4'hd):(4'hd)] <<< (8'ha2))) ?
                     $unsigned((-(wire4 || (wire0 ?
                         wire2 : wire2)))) : wire3[(1'h0):(1'h0)]);
  assign wire7 = (~&$unsigned(wire3[(3'h4):(3'h4)]));
  assign wire8 = $signed($unsigned((-((^~wire2) & (wire7 ? wire3 : wire7)))));
  assign wire9 = $unsigned(wire8);
  always
    @(posedge clk) begin
      reg10 <= (wire0[(3'h6):(2'h3)] ?
          ($unsigned(wire5[(3'h7):(1'h1)]) <<< ($signed(wire3) ?
              $signed((8'hb6)) : (wire7[(1'h1):(1'h0)] ?
                  ((8'ha4) ?
                      wire9 : (8'ha0)) : {wire7}))) : (wire1 != ((wire3[(2'h3):(1'h0)] - wire4[(1'h0):(1'h0)]) + {$unsigned(wire4),
              wire0[(3'h7):(3'h5)]})));
      if (wire4[(3'h5):(1'h1)])
        begin
          reg11 <= (wire6 && (wire1 >> (wire2 ? $signed((+reg10)) : wire2)));
          if ($signed({(~(wire8 < (wire3 || (8'h9e)))),
              (~&(wire7[(4'hc):(4'hc)] < $signed((8'hb6))))}))
            begin
              reg12 <= ((((wire5[(4'h9):(1'h1)] ?
                          $unsigned(wire2) : {wire2, wire8}) || ((-wire7) ?
                          (~wire7) : (wire6 * wire2))) ?
                      $signed({$unsigned(wire7),
                          wire0}) : {$unsigned($unsigned(wire3))}) ?
                  $unsigned(((&(^~wire5)) ?
                      $signed(wire9[(2'h3):(1'h0)]) : ($unsigned(wire4) | (wire0 ?
                          wire6 : wire6)))) : wire1[(4'hf):(4'ha)]);
              reg13 <= $unsigned(({($unsigned(reg10) > (wire1 ?
                          (8'ha1) : wire2)),
                      (wire4[(5'h10):(4'hd)] ?
                          $unsigned((8'hbd)) : (reg12 || (8'hb3)))} ?
                  wire4 : (wire9 + ($signed(wire3) ?
                      (reg10 ? reg11 : (8'hb0)) : wire4))));
              reg14 <= ({(($unsigned(wire3) ?
                              (~|wire2) : wire5[(3'h5):(1'h1)]) ?
                          {(wire0 + (8'ha3)), wire8} : wire1)} ?
                  wire0[(3'h7):(2'h2)] : wire8[(4'h9):(3'h6)]);
              reg15 <= wire9;
              reg16 <= $signed({(wire4[(3'h5):(3'h5)] >>> $unsigned($signed(wire0))),
                  (^~$unsigned({wire1, reg12}))});
            end
          else
            begin
              reg12 <= ((~^wire2[(2'h2):(2'h2)]) & (wire5 ?
                  (wire8[(4'hd):(4'hc)] >> ($signed(reg11) * (8'ha9))) : reg15[(2'h2):(1'h1)]));
              reg13 <= (-(((~^(wire5 <= wire8)) >> reg14) ?
                  $unsigned(($signed(wire4) ^~ $unsigned(wire0))) : reg16[(4'hd):(4'h9)]));
              reg14 <= (reg10 ?
                  {$signed(($signed(wire7) * (7'h43))),
                      (((wire5 & (8'ha5)) + (|wire2)) <= $signed(reg13[(4'hc):(3'h5)]))} : $signed($signed($unsigned($signed(reg16)))));
              reg15 <= $signed({reg11[(3'h5):(2'h3)]});
              reg16 <= {(~^($unsigned(wire2) >> (8'ha4))), wire7};
            end
        end
      else
        begin
          reg11 <= (^~$signed(($unsigned(wire8[(4'h8):(2'h3)]) ?
              $signed(reg10[(2'h2):(2'h2)]) : $unsigned($unsigned(reg15)))));
          if ($signed(((~wire2) + $unsigned(((wire6 & (7'h43)) ?
              reg15[(3'h5):(3'h4)] : wire3)))))
            begin
              reg12 <= (~&{(wire0 | wire1),
                  (($signed(wire2) ?
                      wire8[(3'h5):(3'h4)] : {reg10,
                          wire5}) >>> {$unsigned(wire5), wire8})});
              reg13 <= ($unsigned({(8'ha5), wire6}) > {($unsigned(((8'h9f) ?
                      wire4 : reg14)) | (wire7 && reg10[(1'h1):(1'h1)]))});
            end
          else
            begin
              reg12 <= ($unsigned((~|wire6[(3'h6):(1'h1)])) >= $signed((8'ha2)));
              reg13 <= reg13;
            end
          reg14 <= (!{reg11[(2'h3):(1'h0)]});
          reg15 <= $unsigned($signed($signed(((!wire4) ?
              reg13 : $unsigned(wire4)))));
        end
      if ((reg14[(3'h7):(3'h4)] != reg11[(3'h6):(3'h6)]))
        begin
          if ((+((7'h43) ?
              $unsigned($unsigned($unsigned(wire7))) : wire2[(1'h1):(1'h1)])))
            begin
              reg17 <= reg10;
              reg18 <= (~|wire6);
              reg19 <= ((|$unsigned(((reg13 ? reg10 : reg15) ?
                      wire8[(4'ha):(1'h0)] : reg13[(3'h5):(2'h2)]))) ?
                  wire7[(1'h0):(1'h0)] : (((-(reg14 ?
                      wire5 : wire9)) + $signed((&reg14))) & ($signed(wire0[(2'h3):(1'h0)]) ?
                      $unsigned((!wire6)) : (^~reg10[(2'h2):(1'h0)]))));
              reg20 <= reg13[(4'h8):(1'h0)];
            end
          else
            begin
              reg17 <= ($unsigned((~&{(^wire2)})) ?
                  reg13[(3'h6):(1'h0)] : $signed(reg13));
              reg18 <= ((($signed((!(8'hb9))) ?
                          ($signed(reg20) ?
                              wire7 : $signed((8'hb2))) : wire8[(4'hf):(4'hd)]) ?
                      $signed(reg12) : wire3) ?
                  ((reg20[(3'h7):(3'h5)] != ((wire6 ? reg20 : wire2) != (wire9 ?
                      wire2 : reg11))) << {(reg10[(1'h0):(1'h0)] ~^ $signed(wire0)),
                      (~reg16[(3'h5):(1'h0)])}) : (~|({$signed(wire1)} ~^ $signed($signed(reg15)))));
              reg19 <= (~|wire9);
              reg20 <= $signed((wire4 <<< (-(~^$unsigned(wire3)))));
            end
          reg21 <= (~(~&($signed((~|(8'hb9))) == wire5[(3'h4):(3'h4)])));
          reg22 <= wire4[(2'h2):(1'h0)];
        end
      else
        begin
          reg17 <= (wire0 << $unsigned(reg20));
        end
      reg23 <= reg16[(3'h5):(1'h0)];
    end
  assign wire24 = (wire4 * $signed(reg15[(3'h7):(1'h0)]));
  assign wire25 = reg14;
  assign wire26 = (~|reg20);
  assign wire27 = ((^~(~$unsigned(reg14))) ?
                      (wire2 * $unsigned($signed(wire5[(3'h7):(3'h7)]))) : reg17);
  assign wire28 = reg19[(1'h1):(1'h0)];
endmodule

module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire36;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 (1'h0)};
  module4 #() modinst37 (.wire7(wire1), .wire5((8'hb1)), .wire8(wire2), .y(wire36), .clk(clk), .wire9(wire3), .wire6(wire0));
  assign wire38 = $unsigned((~&$unsigned(wire3[(2'h2):(2'h2)])));
  assign wire39 = (~wire0[(3'h6):(3'h4)]);
  assign wire40 = (8'hb4);
  assign wire41 = (($unsigned((!wire2)) ?
                          ($signed((wire38 | wire38)) ?
                              $signed((&(8'haa))) : (wire40 >> $signed(wire1))) : wire1[(4'hd):(4'h9)]) ?
                      ($signed(wire36[(3'h4):(3'h4)]) ?
                          ((^(wire38 ? wire2 : wire2)) ?
                              wire38 : ($signed(wire36) << wire3[(4'ha):(3'h5)])) : ((wire3[(3'h6):(3'h4)] ?
                              wire36 : $signed(wire38)) ^ $unsigned((wire0 << wire3)))) : (8'h9e));
  assign wire42 = $signed((~$unsigned(((wire3 ? wire2 : wire3) ?
                      (wire2 ? wire41 : (8'haa)) : (wire2 ?
                          (8'hbe) : wire36)))));
  assign wire43 = (!wire0);
  assign wire44 = $unsigned($signed((!{$unsigned(wire2), (+wire40)})));
  assign wire45 = (wire2[(5'h10):(3'h6)] <= wire36[(3'h6):(3'h5)]);
  assign wire46 = ((|wire2) ?
                      (^~wire40[(4'hf):(3'h4)]) : ((~|{$unsigned(wire1),
                          (~&wire45)}) <<< (wire2 <= (~|$signed(wire43)))));
  assign wire47 = wire0[(2'h3):(2'h3)];
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire10;
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire21,
                 wire20,
                 wire14,
                 wire13,
                 wire12,
                 wire10,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg11,
                 (1'h0)};
  assign wire10 = $signed($unsigned(wire7[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg11 <= $signed({{$unsigned((wire6 ? wire10 : wire6)),
              wire6[(3'h4):(1'h1)]}});
    end
  assign wire12 = (+wire8);
  assign wire13 = (^wire8[(4'h8):(3'h4)]);
  assign wire14 = ($signed(wire8[(5'h12):(3'h6)]) ?
                      $signed({wire10[(3'h5):(3'h5)]}) : $unsigned(wire12));
  always
    @(posedge clk) begin
      if (wire8[(2'h3):(1'h0)])
        begin
          reg15 <= wire7;
          reg16 <= reg15;
          reg17 <= $signed((|reg11[(3'h5):(2'h2)]));
          reg18 <= {wire12, $signed((wire5 - (+reg15)))};
        end
      else
        begin
          if ((&$unsigned($signed({$unsigned(reg15), $unsigned((8'ha3))}))))
            begin
              reg15 <= (~&reg17[(4'hb):(4'hb)]);
              reg16 <= (|{wire7, {$signed((wire7 != wire12))}});
              reg17 <= $signed((($signed((~wire14)) + wire12[(4'hb):(3'h6)]) >>> $signed(reg16[(3'h7):(1'h1)])));
            end
          else
            begin
              reg15 <= $unsigned(((^$signed((wire7 ? wire13 : wire5))) ?
                  ((wire13 ?
                      $unsigned((8'h9c)) : (reg16 << reg17)) || wire6[(2'h2):(1'h1)]) : wire5));
            end
          reg18 <= ($unsigned(wire5) > $signed($signed(($unsigned(reg15) ?
              wire9 : $unsigned((8'haa))))));
        end
      reg19 <= (($signed($unsigned(((7'h40) ? wire13 : reg16))) ?
              ($unsigned((wire12 ?
                  (8'hb0) : wire8)) >> reg16[(4'h8):(3'h6)]) : (~|wire7[(2'h2):(1'h0)])) ?
          (({(wire7 ? reg16 : wire6)} ?
                  {reg15[(3'h4):(1'h0)], (~&(8'hbf))} : $signed({wire7,
                      wire9})) ?
              ((&wire6[(3'h5):(2'h2)]) ?
                  (wire14 != (wire13 ?
                      wire10 : wire13)) : wire6) : ($signed((wire7 | (8'hbc))) ^~ ((~wire6) ?
                  (reg11 == reg16) : (&wire13)))) : (|$signed($unsigned($signed(reg11)))));
    end
  assign wire20 = $unsigned(((7'h40) < wire5[(1'h1):(1'h0)]));
  assign wire21 = wire13;
  always
    @(posedge clk) begin
      reg22 <= reg18[(3'h4):(2'h3)];
      reg23 <= ({reg17} ?
          $unsigned(wire21) : {(~^{$unsigned(reg22)}),
              ($unsigned($signed(reg16)) && ($unsigned(reg22) ?
                  $unsigned(wire10) : {wire14, wire20}))});
      reg24 <= (~|$signed($signed(($signed((8'hbc)) << ((8'ha2) <<< reg18)))));
      reg25 <= {wire12};
      if (reg15)
        begin
          reg26 <= ((|(8'had)) >> (((reg19 && $unsigned(wire9)) ?
                  $signed($signed(reg18)) : $unsigned((reg25 == reg19))) ?
              $signed((((7'h40) < wire5) ?
                  (reg22 ?
                      (8'hb8) : reg22) : (~wire5))) : $signed((~^(-(8'h9d))))));
        end
      else
        begin
          reg26 <= ($signed(wire8) ?
              (~|(wire10 ?
                  (reg19 <= $signed(reg18)) : (|wire20))) : $signed((~&$unsigned((&wire9)))));
          reg27 <= $signed((+(((!(7'h43)) >>> reg17[(3'h5):(3'h4)]) ?
              ($unsigned(reg23) > $unsigned((8'hbf))) : {((8'hac) >= reg15),
                  $signed(reg23)})));
          reg28 <= reg15;
          reg29 <= $unsigned($unsigned({$unsigned((~wire10)),
              (~|$unsigned(reg22))}));
          reg30 <= ((((reg24 ? (reg17 ? reg26 : wire8) : (!reg29)) ?
                  reg29[(2'h3):(2'h2)] : reg16[(4'hc):(4'hb)]) == (&({reg19} ?
                  (wire6 ? reg16 : (8'hae)) : {reg19}))) ?
              reg18 : (!$signed($signed(wire12))));
        end
    end
  assign wire31 = (reg22[(4'h8):(1'h0)] || $signed(reg15));
  assign wire32 = {reg17};
  assign wire33 = (8'h9c);
  assign wire34 = reg27[(1'h1):(1'h0)];
  assign wire35 = $unsigned(reg15[(3'h6):(3'h5)]);
endmodule

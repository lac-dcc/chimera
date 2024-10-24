module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire89,
                 wire87,
                 wire14,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = wire3[(4'hb):(4'h9)];
  always
    @(posedge clk) begin
      reg6 <= $signed((~&$unsigned($unsigned((wire2 ? wire2 : wire5)))));
      reg7 <= wire2;
      if ($unsigned(wire0))
        begin
          reg8 <= wire1[(4'ha):(2'h2)];
          reg9 <= (wire2[(3'h6):(3'h6)] ?
              $unsigned((~^$signed(wire2[(2'h2):(1'h0)]))) : (~|(reg8 ?
                  $signed($signed(wire1)) : wire1[(3'h7):(1'h0)])));
          reg10 <= wire1[(1'h1):(1'h0)];
          reg11 <= (~|reg6);
        end
      else
        begin
          reg8 <= $signed((7'h41));
        end
      reg12 <= $signed((^~$unsigned(wire1)));
      reg13 <= reg7;
    end
  assign wire14 = (~$unsigned((&(&$signed(reg11)))));
  module15 #() modinst88 (wire87, clk, reg6, wire1, wire4, reg9, reg10);
  assign wire89 = (wire5 >>> {(({reg9, reg8} ?
                          $signed(reg7) : (~^wire87)) <<< (~|(reg12 ?
                          reg7 : reg12)))});
endmodule

module module15
#(parameter param85 = ((^((((8'hba) || (8'ha4)) ^ (~(8'hb3))) <= (((8'ha5) - (8'hae)) != ((8'hb4) >>> (8'haf))))) ? ({((~|(8'h9d)) < ((8'ha9) ? (8'hbb) : (8'hb5)))} < (8'ha9)) : (^(^{(^(8'had)), ((7'h40) ? (8'hac) : (8'hac))}))), 
parameter param86 = ((^~{((param85 != (8'hbf)) << param85), (&param85)}) ? param85 : {{((&(7'h43)) ? (+param85) : (-param85))}}))
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire70;
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  assign y = {wire21,
                 wire22,
                 wire70,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire21 = (^wire16);
  assign wire22 = wire19[(3'h7):(2'h2)];
  module23 #() modinst71 (.wire28(wire17), .clk(clk), .y(wire70), .wire24(wire18), .wire25(wire21), .wire26(wire22), .wire27(wire19));
  always
    @(posedge clk) begin
      if (wire70[(4'he):(2'h2)])
        begin
          if (((wire19 ?
              ((wire70[(4'hd):(1'h0)] << $signed((8'hba))) < ((wire17 <<< wire19) ?
                  (wire18 ? (8'ha1) : wire18) : (wire18 ?
                      wire16 : wire16))) : (((~&(8'ha3)) >> (wire22 ?
                      wire19 : wire21)) ?
                  ((!wire20) ?
                      ((8'hb2) <<< wire20) : (8'ha3)) : wire22[(4'hc):(4'hc)])) * $signed($signed(({wire20,
                  wire70} ?
              {wire19, wire70} : $signed(wire17))))))
            begin
              reg72 <= $signed(($unsigned(wire19) && $signed(wire16)));
            end
          else
            begin
              reg72 <= (wire17 | (!((-(wire70 - wire20)) && {wire20,
                  ((8'hb2) ? wire16 : (8'had))})));
              reg73 <= ($signed({wire19[(4'hc):(4'h8)]}) <<< {$unsigned(reg72[(3'h7):(2'h2)])});
              reg74 <= ((8'hb3) != {{wire17[(1'h1):(1'h1)]}});
              reg75 <= wire21;
              reg76 <= (reg75[(1'h0):(1'h0)] & (reg72 != (~|({reg75, reg72} ?
                  (wire19 < wire16) : (8'hba)))));
            end
          reg77 <= reg75;
          reg78 <= (wire16 ?
              ({($signed((7'h42)) > {(8'ha9), reg77}), wire16[(2'h2):(1'h0)]} ?
                  ($signed(wire70[(2'h3):(1'h1)]) | wire16) : (+(!(8'ha5)))) : {(^~((^~reg76) ?
                      (~reg72) : (wire21 ^ wire18)))});
        end
      else
        begin
          reg72 <= ({(^~$unsigned({reg77, wire70}))} ~^ {reg77});
          reg73 <= reg78;
          if (((!$unsigned(reg78[(3'h4):(2'h2)])) >= wire17))
            begin
              reg74 <= $signed(wire20);
            end
          else
            begin
              reg74 <= ($signed(reg78[(4'hb):(2'h3)]) == wire19[(4'hb):(2'h3)]);
            end
          reg75 <= $unsigned((($unsigned({reg78}) ?
                  $unsigned({wire20, wire70}) : $signed($signed(wire17))) ?
              $signed(((+(8'ha0)) ?
                  (wire19 ?
                      wire70 : reg74) : reg75[(4'hf):(3'h5)])) : ($unsigned(reg75[(4'hc):(4'ha)]) | (((8'ha2) ?
                  reg77 : (8'h9c)) << (wire22 <<< reg74)))));
          reg76 <= ($unsigned(reg77) || $signed($signed($unsigned((reg77 && wire16)))));
        end
      if ((^~(($unsigned((~^wire70)) <<< $unsigned({wire20})) ?
          (!$signed($signed(reg74))) : $unsigned(($unsigned(wire20) ?
              (^~wire21) : {wire20, reg73})))))
        begin
          reg79 <= ((((wire17 & reg72) ?
              ({wire70, reg72} ?
                  (reg73 ? reg73 : wire19) : (&wire16)) : (&(reg74 ?
                  reg78 : wire22))) <<< (|(-wire70[(3'h5):(3'h5)]))) & $signed((($signed(reg76) >>> (wire20 ?
              (8'hb9) : wire20)) >> wire70)));
          reg80 <= (8'haa);
          reg81 <= ((wire18[(1'h0):(1'h0)] < wire21[(4'hd):(4'hb)]) ?
              $unsigned((reg72 < reg77[(4'h8):(4'h8)])) : wire20);
          if ({$unsigned(wire20[(4'h9):(3'h7)]),
              $signed(($signed({(7'h44)}) ?
                  $unsigned((!reg81)) : reg81[(3'h6):(3'h5)]))})
            begin
              reg82 <= $signed({$unsigned((~|reg79[(1'h1):(1'h0)])),
                  wire18[(3'h7):(3'h4)]});
              reg83 <= reg82[(3'h5):(3'h4)];
            end
          else
            begin
              reg82 <= ($unsigned((~|{(8'hb4), $unsigned((8'hb5))})) ?
                  (reg74[(4'hb):(3'h5)] ?
                      $unsigned($signed((wire16 ? reg82 : reg82))) : (({reg78,
                              reg75} <= (reg79 ? (8'hb8) : (7'h42))) ?
                          reg83[(2'h2):(1'h1)] : (wire20 - $signed(wire19)))) : {$unsigned($unsigned($unsigned(reg83))),
                      reg82[(3'h6):(2'h2)]});
            end
          reg84 <= wire22;
        end
      else
        begin
          reg79 <= reg78;
        end
    end
endmodule

module module23
#(parameter param68 = {{(8'h9c), {(((7'h44) ~^ (8'hae)) ? ((8'ha9) | (8'ha9)) : {(8'ha2), (8'ha6)})}}, (8'had)}, 
parameter param69 = param68)
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire29 = $signed(wire27[(4'h9):(3'h7)]);
  assign wire30 = (wire29 ?
                      wire27 : $signed(($unsigned(wire27[(4'he):(4'h8)]) > $unsigned($unsigned(wire24)))));
  assign wire31 = $signed(wire25[(2'h3):(2'h2)]);
  assign wire32 = $signed(($signed(wire27) ^~ {$unsigned((^~(8'h9f))),
                      $unsigned(((8'hb4) | wire27))}));
  always
    @(posedge clk) begin
      reg33 <= $signed(({wire30} ?
          $signed((~&{wire30})) : $unsigned(((^wire24) ?
              (~wire24) : (&wire26)))));
      reg34 <= wire28[(2'h3):(1'h0)];
      reg35 <= $signed($unsigned(wire32[(3'h4):(3'h4)]));
      reg36 <= (8'h9d);
      if (reg36[(4'hb):(4'h8)])
        begin
          reg37 <= reg35;
          reg38 <= $signed($signed((^($unsigned(reg35) >= $unsigned(wire28)))));
        end
      else
        begin
          reg37 <= (($signed(wire32) || {{reg33, (wire27 - (8'hbf))},
                  $unsigned(wire31)}) ?
              $unsigned((wire24 >> (((8'had) - wire26) ?
                  reg33 : reg37[(2'h3):(1'h1)]))) : $signed(reg33[(4'hd):(4'hc)]));
          reg38 <= {$unsigned(({wire32[(3'h6):(3'h6)],
                  reg37[(2'h2):(1'h0)]} ^ wire29)),
              wire28[(2'h3):(2'h3)]};
          reg39 <= $unsigned({{wire27[(4'h9):(3'h5)],
                  ({wire30, wire24} >> wire32[(2'h2):(1'h1)])},
              (reg34[(2'h2):(1'h0)] ?
                  $unsigned($signed(wire26)) : ($signed(wire29) ?
                      $unsigned((8'ha6)) : (8'h9e)))});
        end
    end
  assign wire40 = (~(~^$unsigned((reg36[(2'h2):(1'h1)] ?
                      wire25[(2'h2):(2'h2)] : $unsigned(reg35)))));
  assign wire41 = (~$unsigned(((|(reg36 ? wire24 : reg37)) ?
                      reg38[(1'h1):(1'h0)] : (wire30[(3'h5):(2'h3)] ^ $unsigned(wire32)))));
  assign wire42 = $signed((($signed((wire26 * wire26)) ?
                      {$signed(wire30)} : wire25) * ($signed($unsigned(wire24)) ?
                      (8'hb5) : (reg39[(1'h1):(1'h1)] - $signed(wire31)))));
  assign wire43 = (+(^~$unsigned((^wire24[(3'h5):(1'h0)]))));
  assign wire44 = wire26;
  always
    @(posedge clk) begin
      reg45 <= reg37[(1'h1):(1'h1)];
      reg46 <= $signed($signed(wire24));
      if ((~^wire24))
        begin
          reg47 <= $signed(wire44[(3'h5):(2'h2)]);
          if ($signed(reg37[(3'h7):(2'h2)]))
            begin
              reg48 <= ($unsigned($signed(((~|reg39) >> $signed((8'hac))))) << {wire25[(2'h3):(2'h3)],
                  (wire44 ? $signed(reg33) : (-(-(8'ha8))))});
              reg49 <= $unsigned(reg46);
            end
          else
            begin
              reg48 <= wire24[(3'h4):(1'h1)];
              reg49 <= (8'ha3);
              reg50 <= ((((8'ha3) ?
                      (((8'hb5) <<< wire43) ?
                          reg47[(1'h0):(1'h0)] : (reg34 * (8'hb7))) : (~&(wire41 ?
                          reg33 : wire32))) ?
                  (reg45[(2'h2):(1'h0)] ?
                      (((8'ha0) ?
                          wire31 : wire29) == reg45) : $unsigned({reg47})) : $unsigned((wire28 ?
                      $unsigned(wire24) : $signed(wire41)))) >= $signed((|(&reg39[(4'hd):(3'h5)]))));
              reg51 <= ($signed(wire29[(2'h3):(1'h1)]) || (&(^~reg48)));
            end
        end
      else
        begin
          reg47 <= (-$signed(reg45));
          if ((8'ha7))
            begin
              reg48 <= $signed($unsigned($signed(wire41[(3'h7):(1'h0)])));
            end
          else
            begin
              reg48 <= $signed(reg36);
              reg49 <= ($signed((wire30 ?
                  ((~wire42) ~^ {reg48}) : reg45[(4'ha):(3'h7)])) >>> {(^~($signed(reg49) <= $signed(reg46)))});
              reg50 <= (~&((+($signed((8'ha0)) <<< (^wire24))) && wire28));
              reg51 <= ($unsigned(((&$signed(reg50)) ?
                      wire27[(4'hd):(4'hb)] : reg33)) ?
                  reg50[(3'h6):(3'h5)] : $signed(reg45));
            end
          reg52 <= $signed(((reg45[(1'h1):(1'h1)] == ((^reg51) >> wire40)) ?
              (reg51 << (reg33 != reg47[(1'h0):(1'h0)])) : $unsigned($unsigned((reg48 ?
                  wire27 : wire41)))));
          reg53 <= (^reg38);
        end
      reg54 <= {$unsigned(reg46[(4'h8):(3'h4)])};
      reg55 <= (-$unsigned($unsigned(($unsigned(wire40) ?
          (wire42 ? wire31 : wire24) : reg52[(1'h1):(1'h1)]))));
    end
  assign wire56 = (~^$unsigned(($unsigned({reg33, wire31}) ?
                      ((8'hb3) ?
                          {reg38} : reg50[(4'ha):(1'h1)]) : (|(8'hb0)))));
  assign wire57 = wire42[(1'h0):(1'h0)];
  assign wire58 = ($signed(($signed(wire42[(2'h2):(1'h1)]) + (-(reg39 ?
                          (8'haa) : wire32)))) ?
                      reg36 : $signed(reg55));
  assign wire59 = wire42[(4'hc):(1'h0)];
  assign wire60 = reg50[(4'hc):(2'h2)];
  assign wire61 = reg53[(3'h4):(2'h2)];
  assign wire62 = (-(~|(($signed((7'h44)) - (wire29 & wire40)) ?
                      reg50 : ((wire30 ? reg50 : wire28) & $unsigned(reg36)))));
  assign wire63 = wire42[(3'h6):(1'h0)];
  assign wire64 = ($unsigned($unsigned($unsigned(((8'hbc) ?
                      wire56 : wire56)))) ~^ {$signed({(wire29 == wire27)}),
                      (|$unsigned(wire56))});
  assign wire65 = {reg35[(3'h6):(2'h3)]};
  assign wire66 = wire40[(2'h3):(2'h2)];
  assign wire67 = (!(~(($signed(reg39) - {reg33}) ~^ $signed((~&wire28)))));
endmodule

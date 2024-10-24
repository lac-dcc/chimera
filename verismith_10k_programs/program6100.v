module top
#(parameter param104 = (|{((~&(8'hb9)) * (+((8'hbb) || (8'haf)))), (-(((7'h41) ? (8'haa) : (8'ha9)) ? (-(8'hae)) : (&(8'hab))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire71,
                 wire70,
                 wire68,
                 wire6,
                 wire5,
                 reg100,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
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
  assign wire5 = $signed(wire3);
  assign wire6 = $signed(wire5[(3'h5):(1'h0)]);
  module7 #() modinst69 (.clk(clk), .wire10(wire2), .wire8(wire3), .wire9(wire0), .wire11(wire4), .y(wire68));
  assign wire70 = {$unsigned(($signed(wire0[(3'h6):(3'h5)]) <= $signed(wire2)))};
  assign wire71 = (^~(!(wire2[(3'h6):(3'h5)] && wire1[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      if ($unsigned(((|$signed((wire71 ? wire70 : wire71))) ?
          ((wire70[(4'h8):(4'h8)] >= wire1[(3'h4):(3'h4)]) >>> $unsigned(((8'hac) > wire3))) : wire2[(1'h0):(1'h0)])))
        begin
          if ({$unsigned($signed(wire68)), wire70[(1'h1):(1'h1)]})
            begin
              reg72 <= (~|(~{$unsigned((wire3 ? wire2 : wire6)),
                  ($unsigned(wire6) ? (^wire2) : wire3)}));
            end
          else
            begin
              reg72 <= $unsigned(({{(wire71 ? wire70 : wire3), wire68}} ?
                  (!wire1[(4'h9):(1'h0)]) : wire68[(3'h4):(3'h4)]));
              reg73 <= wire70[(3'h7):(3'h4)];
              reg74 <= ({wire71, $unsigned($unsigned((wire3 << reg72)))} ?
                  (^~({$unsigned((8'haf))} < wire71)) : wire5);
              reg75 <= $signed(wire70[(3'h6):(2'h3)]);
              reg76 <= ((reg74 ~^ (((~^wire2) >= (wire0 ?
                      reg73 : wire0)) | wire1[(1'h1):(1'h0)])) ?
                  (+(((reg74 | (8'ha7)) * $signed(wire68)) << $unsigned((!(8'haa))))) : $unsigned($signed(((~&(8'h9f)) > (-wire71)))));
            end
          if (wire68[(2'h3):(2'h2)])
            begin
              reg77 <= ((wire4[(1'h0):(1'h0)] * reg75[(1'h1):(1'h1)]) ?
                  wire6[(5'h12):(4'hf)] : (8'hb7));
            end
          else
            begin
              reg77 <= reg73[(3'h4):(2'h3)];
              reg78 <= {(^~reg74)};
              reg79 <= $signed($unsigned(reg76[(4'hf):(4'hd)]));
            end
          reg80 <= $signed($unsigned(wire71[(1'h1):(1'h0)]));
          if (wire71[(2'h3):(1'h0)])
            begin
              reg81 <= (((~|(^~$unsigned(wire0))) ^ $signed(reg75[(1'h0):(1'h0)])) ?
                  wire0 : (wire70 ?
                      $unsigned(wire5[(3'h7):(3'h4)]) : $signed(((wire2 ?
                              wire71 : (7'h42)) ?
                          $signed(reg75) : $signed(reg72)))));
              reg82 <= reg73;
            end
          else
            begin
              reg81 <= wire1;
              reg82 <= ((reg74[(4'h9):(1'h0)] ?
                  wire71 : ($signed((reg78 ? reg78 : reg81)) ?
                      $unsigned((reg73 ? wire68 : reg73)) : ((wire68 ?
                          wire6 : wire2) || (^(8'ha6))))) >>> ({reg82[(1'h1):(1'h0)],
                      $unsigned(wire6[(2'h3):(2'h2)])} ?
                  (~^{{wire4},
                      (wire70 ? reg73 : reg72)}) : (+$signed((!wire68)))));
            end
        end
      else
        begin
          reg72 <= (reg80 ?
              ($unsigned($unsigned((reg73 ?
                  reg76 : wire0))) >= $signed(($unsigned((7'h43)) + (!reg76)))) : (((!(reg82 ?
                      wire0 : reg78)) ?
                  reg72[(4'hd):(4'hd)] : {$signed(wire70)}) <<< ((~|(^reg75)) * (^(reg78 ~^ wire71)))));
          reg73 <= $unsigned(wire71);
          reg74 <= $unsigned(({($signed(reg75) < ((7'h41) <= reg74))} ?
              $unsigned((+reg76[(4'hc):(4'ha)])) : $unsigned(reg74[(3'h7):(3'h6)])));
        end
      if (($unsigned((((-wire4) ? (8'hbd) : (&reg73)) ?
              reg82[(1'h1):(1'h1)] : reg79[(3'h7):(2'h2)])) ?
          wire2[(2'h3):(1'h1)] : (+$signed(wire1[(3'h7):(3'h5)]))))
        begin
          reg83 <= (8'hb5);
          reg84 <= {$signed(((reg80 || (wire1 ? reg73 : reg79)) ?
                  $signed(wire5[(2'h3):(2'h2)]) : wire68[(2'h3):(2'h2)])),
              {{((reg82 ? wire4 : (8'hbc)) ? $signed(reg81) : $signed(wire71)),
                      (8'hbd)},
                  $signed($signed((reg79 <<< wire70)))}};
          if (reg73)
            begin
              reg85 <= (~&reg78[(3'h6):(2'h3)]);
              reg86 <= (~|(($signed(reg83[(3'h4):(2'h2)]) ?
                  (8'had) : ((!reg85) && (wire3 != reg77))) > $signed($unsigned($signed(wire2)))));
              reg87 <= ($unsigned(($unsigned(reg79) ?
                      {$signed(reg73), (wire3 + reg86)} : $signed((reg85 ?
                          wire6 : reg76)))) ?
                  (-((8'ha5) == $signed((wire71 + reg83)))) : wire70[(2'h2):(1'h0)]);
            end
          else
            begin
              reg85 <= (wire3[(5'h13):(3'h5)] ?
                  (&($signed((reg78 << wire68)) | ((&(8'h9f)) ?
                      reg75[(1'h1):(1'h1)] : (reg72 ^~ reg85)))) : reg87[(2'h2):(2'h2)]);
              reg86 <= $signed(wire0);
              reg87 <= $unsigned(((reg83[(3'h4):(2'h2)] && (~&(reg81 + reg72))) << ((~^wire2) << reg84)));
              reg88 <= ((($unsigned(((7'h41) < reg78)) - reg87) + {($unsigned(reg74) <<< ((8'hb0) || wire1))}) - $unsigned(($signed((~&reg85)) - reg82[(1'h1):(1'h1)])));
            end
          reg89 <= (wire5 <= (~^$unsigned($signed((reg83 <<< reg81)))));
          reg90 <= $signed($signed({reg78[(3'h4):(1'h0)]}));
        end
      else
        begin
          reg83 <= reg86[(1'h0):(1'h0)];
          if ((wire6[(2'h2):(1'h1)] ?
              $signed(((((7'h41) * wire5) | (wire68 | (8'hb0))) * (wire71 == (reg73 == reg72)))) : ({$unsigned(wire2[(2'h3):(1'h0)]),
                      ($unsigned(wire70) ? reg85 : $unsigned(wire5))} ?
                  {({reg90, wire4} ?
                          (reg81 ? reg88 : wire5) : $signed((8'h9d))),
                      ((~&reg78) ?
                          reg84[(3'h4):(3'h4)] : (~&reg80))} : (!reg73))))
            begin
              reg84 <= {wire2,
                  ((~|reg77) == ($unsigned($unsigned(wire4)) ?
                      ((~(8'ha7)) ? wire5 : reg90) : (~wire5[(1'h1):(1'h1)])))};
              reg85 <= wire70;
              reg86 <= (((8'ha3) & wire0) ? reg84[(2'h2):(1'h0)] : reg82);
              reg87 <= reg80[(1'h1):(1'h0)];
            end
          else
            begin
              reg84 <= (-((^(~&$unsigned(reg73))) ?
                  $signed({$unsigned(wire3),
                      wire5[(4'hb):(2'h3)]}) : $signed(wire4)));
              reg85 <= $signed($signed(reg80));
              reg86 <= ($unsigned($unsigned((~$signed(reg75)))) ?
                  $signed($signed((reg73[(2'h3):(2'h2)] >> $unsigned(reg83)))) : reg89);
              reg87 <= $signed(((($unsigned((8'ha5)) & (wire3 <= wire68)) ?
                      ((wire1 >>> reg86) ?
                          (reg89 & wire70) : reg79[(4'hc):(3'h6)]) : {(reg77 ?
                              reg74 : reg75)}) ?
                  ((^reg89[(3'h7):(3'h6)]) ?
                      ($unsigned(reg72) ?
                          (8'hb2) : {reg90,
                              reg79}) : $signed($unsigned(reg87))) : $unsigned($unsigned(reg88[(2'h3):(1'h1)]))));
              reg88 <= $signed(wire1[(4'h8):(3'h7)]);
            end
        end
      reg91 <= reg77[(2'h3):(1'h1)];
      reg92 <= ((8'ha7) - reg72);
    end
  assign wire93 = reg87;
  assign wire94 = (-$unsigned(($signed(reg72) ?
                      (|((8'ha6) ? reg77 : reg72)) : (!wire2))));
  assign wire95 = ($signed((~^reg83)) && $signed(((-$signed(wire5)) * ($signed(reg89) ?
                      $unsigned(reg90) : (8'ha8)))));
  assign wire96 = (($signed(((~^reg75) > $signed(wire94))) ?
                          {$signed($unsigned(reg82))} : reg81) ?
                      (wire5 ?
                          $unsigned($signed((wire5 ^ (8'hbe)))) : $signed(reg87)) : ((^wire94[(5'h10):(3'h6)]) ?
                          ((wire93[(1'h1):(1'h1)] ?
                                  reg73[(3'h4):(1'h1)] : reg75[(1'h1):(1'h1)]) ?
                              ($unsigned(reg89) <<< reg79) : wire93[(2'h2):(1'h0)]) : reg85[(1'h0):(1'h0)]));
  assign wire97 = $unsigned($signed(wire94));
  assign wire98 = wire94[(2'h2):(1'h1)];
  assign wire99 = $unsigned((($unsigned((wire95 ? wire68 : reg90)) ?
                      {(~^wire97)} : $unsigned((wire4 ?
                          reg87 : reg83))) ~^ reg77[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg100 <= ($unsigned((^wire95)) ?
          ($unsigned((!$signed(reg89))) >= ((|$signed(reg72)) ?
              ($unsigned(wire70) != (8'hbb)) : $signed($signed(reg73)))) : wire99);
    end
  assign wire101 = $unsigned($signed($signed($unsigned((~^wire71)))));
  assign wire102 = wire1[(1'h1):(1'h1)];
  assign wire103 = ($unsigned((((reg87 ?
                           reg73 : reg80) + (reg78 >= reg81)) ^~ ((reg73 << reg83) >> ((8'h9e) >>> reg77)))) ?
                       $signed($unsigned((reg79[(3'h5):(1'h1)] ?
                           (reg88 - reg73) : (-reg89)))) : $signed(reg76[(4'h9):(1'h1)]));
endmodule

module module7
#(parameter param66 = ((((&{(8'ha2)}) ^ (((8'hb9) ? (8'haa) : (8'ha7)) >= (~&(8'h9d)))) ^ (|(((8'hb6) || (8'hbf)) ~^ ((8'hb6) <= (8'hbe))))) || {((((8'hb8) >> (7'h42)) ? ((8'hb7) ? (8'ha1) : (8'ha2)) : ((8'hb8) ? (8'h9e) : (8'ha0))) + (!((8'hbc) ? (8'hb0) : (8'hb9)))), {(((8'hbd) + (8'hab)) ? (~&(8'ha9)) : {(8'h9c)}), {(^(8'hb1)), (+(8'haa))}}}), 
parameter param67 = ({(7'h43)} ? {{param66, ((param66 && param66) < param66)}} : {(param66 - (!(8'ha3)))}))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire50;
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire65,
                 wire54,
                 wire53,
                 wire52,
                 wire17,
                 wire50,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire8)
        begin
          if (wire10[(2'h2):(1'h0)])
            begin
              reg12 <= $signed(((!{$unsigned(wire8), $unsigned((7'h44))}) ?
                  (^$signed($signed(wire9))) : wire10));
              reg13 <= (8'hb2);
            end
          else
            begin
              reg12 <= reg13[(1'h0):(1'h0)];
              reg13 <= wire8[(4'h8):(1'h1)];
              reg14 <= (wire9[(1'h1):(1'h0)] ?
                  wire8 : $unsigned(reg12[(3'h7):(1'h0)]));
            end
          reg15 <= ({$signed(wire11)} ?
              $unsigned((reg12[(4'hf):(4'h8)] ?
                  ((wire10 >= wire10) ?
                      (~^wire8) : (wire11 ?
                          reg14 : wire9)) : (8'h9e))) : (~wire10));
        end
      else
        begin
          reg12 <= $unsigned(reg14[(1'h1):(1'h1)]);
          reg13 <= wire8;
          reg14 <= wire8[(3'h6):(2'h3)];
        end
      reg16 <= {(|$unsigned($unsigned($unsigned(reg13))))};
    end
  assign wire17 = $signed((~|wire9));
  module18 #() modinst51 (.wire19(reg14), .wire22(reg13), .y(wire50), .wire21(wire17), .clk(clk), .wire20(wire8), .wire23(wire11));
  assign wire52 = ($unsigned(reg13[(2'h3):(1'h1)]) ?
                      ($signed(((~^wire10) <= wire50[(4'ha):(4'h9)])) ~^ wire11[(3'h5):(3'h5)]) : wire17);
  assign wire53 = (8'ha6);
  assign wire54 = (8'ha0);
  always
    @(posedge clk) begin
      reg55 <= wire53[(2'h2):(1'h1)];
      if ((|(wire54 | (wire10 ?
          {wire8} : ($signed((8'ha4)) > (wire17 ? reg12 : wire53))))))
        begin
          reg56 <= $signed((($signed($unsigned(reg13)) > (|$unsigned(wire53))) ?
              $signed($unsigned(reg55[(2'h2):(1'h1)])) : ($unsigned(wire52[(4'h9):(3'h5)]) ?
                  $unsigned($signed(reg14)) : (reg55 ?
                      reg16 : (wire17 + wire54)))));
          reg57 <= {wire11[(4'ha):(3'h7)]};
          reg58 <= $unsigned($signed(reg56[(4'ha):(3'h5)]));
          reg59 <= ($signed(reg58) ?
              (~&reg13[(4'h9):(3'h4)]) : $signed(($signed((7'h40)) - $unsigned($signed((8'haf))))));
          reg60 <= wire10;
        end
      else
        begin
          reg56 <= $signed($signed(reg13));
          if ($unsigned(($unsigned(({(8'h9c), reg60} << (wire11 ?
              (8'hbf) : wire9))) + ($unsigned((8'hac)) ?
              ((wire11 ^ reg13) | (!wire17)) : ((reg58 ? wire50 : wire10) ?
                  {wire9} : (reg14 ? reg59 : reg58))))))
            begin
              reg57 <= (wire52[(2'h3):(1'h0)] >> $signed((((wire9 ?
                      (8'hb5) : (8'ha1)) ?
                  (-reg59) : {reg15}) - $signed((wire8 > wire17)))));
              reg58 <= wire50[(4'h9):(1'h1)];
              reg59 <= $unsigned(reg13);
            end
          else
            begin
              reg57 <= $unsigned(wire50[(4'h8):(3'h6)]);
              reg58 <= $unsigned((^reg60[(4'ha):(3'h5)]));
              reg59 <= (7'h41);
              reg60 <= wire10;
            end
          reg61 <= ($unsigned($unsigned(((wire9 || wire9) << (^~reg15)))) ?
              reg55[(1'h1):(1'h1)] : (reg12[(3'h4):(1'h0)] ?
                  $unsigned($unsigned((~^reg59))) : $unsigned(reg13[(2'h2):(1'h0)])));
          reg62 <= {reg60};
          reg63 <= (reg60 ? reg13[(3'h6):(3'h5)] : wire10[(1'h0):(1'h0)]);
        end
      if (($unsigned(reg59[(3'h4):(1'h0)]) - reg57))
        begin
          reg64 <= wire53[(3'h5):(2'h3)];
        end
      else
        begin
          reg64 <= ($unsigned({$signed($unsigned(reg63)),
              (~reg60[(2'h3):(1'h1)])}) << ($unsigned(wire9[(1'h0):(1'h0)]) + reg14));
        end
    end
  assign wire65 = (^~((!wire53) ? $signed({wire8}) : wire11));
endmodule

module module18
#(parameter param48 = (^~(|(^{{(8'hac), (8'had)}, ((8'h9d) == (8'hb0))}))), 
parameter param49 = (~^((~&((param48 >>> param48) ? ((8'hb2) || (8'h9d)) : param48)) ? param48 : (~^((param48 < param48) == (param48 ? param48 : param48))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg47,
                 reg39,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= (wire19 ?
          $unsigned($unsigned($signed((wire20 == wire21)))) : (^~$signed(wire21)));
      if ($signed(wire22[(5'h10):(1'h0)]))
        begin
          reg25 <= {($signed((~^$signed(wire22))) ?
                  ($signed($unsigned((8'hbc))) ~^ wire21) : (+(wire23 && $unsigned(reg24)))),
              (|($unsigned($signed(wire23)) ?
                  ((wire23 > wire19) ^ (wire22 ? reg24 : wire23)) : ((wire21 ?
                      reg24 : (8'hae)) < wire22)))};
          reg26 <= (+$signed({({(8'hb1)} ? (8'h9d) : $signed(wire20))}));
        end
      else
        begin
          reg25 <= $unsigned({(reg24[(4'hf):(3'h6)] ? wire19 : reg25)});
          reg26 <= (reg24 ?
              (!($signed($signed(reg24)) ?
                  $unsigned((reg26 ?
                      reg24 : (8'hb1))) : reg26[(1'h0):(1'h0)])) : reg24[(3'h6):(1'h1)]);
          reg27 <= ($unsigned(wire23[(3'h5):(3'h5)]) ?
              ((+$signed({wire23, (8'h9c)})) > wire20) : (wire20 ^~ (7'h41)));
          reg28 <= (wire20[(4'hd):(4'h9)] ? {wire21} : wire23);
        end
    end
  assign wire29 = {$signed((^(7'h41)))};
  assign wire30 = (wire21[(1'h0):(1'h0)] <<< ($unsigned(($signed(wire19) ?
                      (reg24 ~^ (8'ha0)) : (~^wire29))) ^ $signed(((reg24 ?
                          reg28 : reg25) ?
                      (~^reg28) : reg27))));
  assign wire31 = reg24;
  assign wire32 = wire19[(1'h1):(1'h1)];
  assign wire33 = (reg25[(4'hc):(1'h1)] == (wire22 ?
                      (8'h9c) : ($signed({wire20}) ?
                          (wire21 ?
                              (reg26 && reg26) : $signed(reg27)) : $signed((reg27 + wire30)))));
  assign wire34 = (wire20 ?
                      ((8'ha7) || (|$unsigned((wire19 ?
                          wire19 : reg28)))) : {$unsigned(wire20)});
  assign wire35 = (~^reg24);
  assign wire36 = $unsigned((reg25[(3'h5):(1'h0)] < (+$signed(reg26))));
  assign wire37 = ({wire23} + {$unsigned({wire29[(4'he):(2'h3)],
                          (wire21 ? reg24 : wire35)})});
  assign wire38 = ((((7'h41) ?
                      (-$signed(wire32)) : $signed((~|reg26))) >>> (~|reg26)) == (wire22 > wire20[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg39 <= (wire34 ?
          (wire32[(3'h4):(2'h2)] - ({(~wire29)} ?
              {{reg27}, wire21} : $signed((-wire35)))) : wire33[(3'h4):(2'h2)]);
    end
  assign wire40 = ({reg39, $unsigned((&wire29))} ?
                      wire33[(3'h4):(2'h2)] : $unsigned(((8'ha2) * reg25)));
  assign wire41 = $signed($unsigned(reg27[(2'h2):(1'h0)]));
  assign wire42 = wire23;
  assign wire43 = $unsigned($signed($unsigned(wire35)));
  assign wire44 = (8'hb3);
  assign wire45 = ($signed($signed($signed($unsigned(reg26)))) ^~ $unsigned($signed(($signed(wire37) ^~ $unsigned(reg28)))));
  assign wire46 = $signed($signed((wire32[(4'ha):(1'h0)] ?
                      wire30[(5'h10):(3'h4)] : (&((8'hb5) <= wire23)))));
  always
    @(posedge clk) begin
      reg47 <= (({(!(wire45 > wire46))} ?
              $signed(wire41[(3'h6):(3'h6)]) : (~&wire33)) ?
          (wire21[(1'h0):(1'h0)] ?
              reg26[(1'h0):(1'h0)] : (!(+wire41[(3'h6):(2'h2)]))) : (reg39 ?
              reg26[(2'h2):(1'h0)] : $unsigned($unsigned(wire30[(3'h6):(3'h6)]))));
    end
endmodule

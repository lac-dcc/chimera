module top
#(parameter param139 = ((((((8'hbe) ? (7'h41) : (8'had)) || {(7'h42)}) ~^ (((8'hbe) == (8'had)) ? ((8'hbe) || (8'had)) : ((8'hb5) ^~ (8'hba)))) && ((((8'ha4) < (8'hb5)) >> {(8'hb7), (8'hb7)}) >= (|((8'hae) ? (8'ha2) : (8'h9e))))) ? (^~((((8'hb3) & (8'hb9)) >>> {(8'hb0)}) ? ((+(7'h41)) == ((8'hbf) ^ (8'haf))) : (((8'hb2) ? (8'ha7) : (7'h42)) ? (8'h9f) : (~^(8'hb1))))) : ({(^~((8'hb9) ~^ (8'hbb))), ((~|(8'hbc)) ? ((7'h43) ? (8'hae) : (7'h43)) : ((8'hb3) == (7'h41)))} ^ ((((8'hbd) ? (8'hae) : (7'h43)) ? (&(8'ha0)) : (&(8'hbd))) ? (8'haf) : (((8'had) != (8'hbf)) ? (~(7'h42)) : (~^(8'had)))))), 
parameter param140 = param139)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire137;
  wire [(4'he):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire118,
                 wire117,
                 wire115,
                 wire5,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire5 = wire4[(2'h2):(1'h1)];
  module6 #() modinst116 (.wire10(wire0), .clk(clk), .wire7(wire4), .wire9(wire3), .wire8(wire5), .y(wire115));
  assign wire117 = (-$unsigned(wire2));
  assign wire118 = $signed(($signed(wire5) ?
                       ($signed((wire1 * wire0)) ?
                           wire115 : wire5) : $unsigned($signed($signed(wire1)))));
  always
    @(posedge clk) begin
      reg119 <= (8'hb8);
      reg120 <= $unsigned(wire0[(4'hc):(4'hc)]);
      if ($unsigned(wire3[(5'h10):(3'h7)]))
        begin
          reg121 <= wire118;
          if ({($signed($signed((+reg120))) ~^ $unsigned(($unsigned(wire5) ?
                  $signed(wire115) : (+wire0)))),
              wire117})
            begin
              reg122 <= $signed(wire4[(4'h9):(4'h9)]);
              reg123 <= wire117[(4'h8):(1'h0)];
              reg124 <= (wire4 <<< {$unsigned(wire2)});
              reg125 <= ($unsigned(((wire5[(2'h2):(1'h1)] < {reg119,
                      wire3}) >>> $signed($signed(wire118)))) ?
                  wire1[(1'h1):(1'h0)] : wire117[(4'ha):(2'h3)]);
              reg126 <= $unsigned($unsigned($unsigned(reg125)));
            end
          else
            begin
              reg122 <= ((reg125[(4'hb):(4'hb)] - wire3[(4'hb):(4'ha)]) ?
                  wire117 : ($signed((reg121[(2'h2):(2'h2)] | $unsigned(wire4))) ?
                      (&$unsigned({wire2})) : (~$unsigned($signed(wire117)))));
              reg123 <= $signed($signed($signed($unsigned((^~wire3)))));
              reg124 <= {{reg122, wire1[(2'h3):(1'h0)]},
                  $unsigned((~&$signed((reg123 ? (8'hb5) : wire115))))};
            end
          reg127 <= (|(8'hb4));
          reg128 <= (~^reg121);
          reg129 <= $unsigned((~&(+$signed($signed(reg122)))));
        end
      else
        begin
          reg121 <= wire3[(4'he):(2'h2)];
          reg122 <= (reg126[(4'hb):(3'h5)] < reg120);
          reg123 <= (wire115[(2'h3):(1'h1)] ?
              reg124[(3'h4):(1'h1)] : $signed(((&wire115) >> reg129)));
          reg124 <= wire117[(5'h10):(2'h3)];
          reg125 <= $signed((~|$unsigned((^~(wire0 ? reg128 : reg129)))));
        end
      reg130 <= ($signed(reg127[(1'h0):(1'h0)]) && ($unsigned((~&wire0)) ?
          wire115[(1'h1):(1'h0)] : ((~&(wire4 ?
              reg123 : wire117)) ^~ wire118[(3'h6):(2'h2)])));
      reg131 <= (reg127 ?
          {(~(~|(+reg122)))} : ((&($unsigned(wire117) ?
                  {(8'ha0)} : (~&reg122))) ?
              reg120[(2'h3):(1'h1)] : $unsigned((&$unsigned(reg125)))));
    end
  always
    @(posedge clk) begin
      reg132 <= $signed({(~^$signed($unsigned((8'ha1)))),
          ($signed((!reg121)) ? reg122[(1'h1):(1'h1)] : (~|$signed(reg126)))});
      reg133 <= (~^wire117);
      reg134 <= (~(wire5 * $unsigned($signed((reg120 ? wire2 : wire2)))));
    end
  assign wire135 = $unsigned(wire1[(3'h7):(2'h3)]);
  assign wire136 = {$unsigned((((^wire0) <<< {reg132}) <<< $unsigned(reg131))),
                       $signed((&reg125[(3'h4):(1'h0)]))};
  assign wire137 = ((~|(~{reg121[(2'h2):(1'h0)]})) ?
                       reg129[(1'h1):(1'h0)] : reg132);
  assign wire138 = (~&wire2[(3'h5):(1'h0)]);
endmodule

module module6
#(parameter param113 = (+{{(((7'h42) <= (8'hb6)) ? {(8'ha5)} : ((8'ha4) ? (8'hac) : (8'hae))), (((8'hba) ? (8'hb7) : (8'hb9)) << ((8'ha7) ? (8'hbc) : (8'hae)))}, (7'h40)}), 
parameter param114 = param113)
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h296):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire98;
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  assign y = {wire112,
                 wire107,
                 wire100,
                 wire11,
                 wire12,
                 wire14,
                 wire49,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire98,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg13,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire11 = ((~&wire8[(2'h3):(1'h1)]) ~^ $unsigned(wire9[(1'h0):(1'h0)]));
  assign wire12 = wire10[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= (|wire11);
    end
  assign wire14 = {$unsigned((^reg13[(2'h2):(1'h1)]))};
  module15 #() modinst50 (.clk(clk), .wire20(wire11), .wire16(wire10), .y(wire49), .wire17(wire7), .wire18(wire14), .wire19(reg13));
  always
    @(posedge clk) begin
      if ($signed({wire11}))
        begin
          if (wire8)
            begin
              reg51 <= ({((wire11[(3'h7):(1'h0)] ?
                      (wire8 && wire11) : reg13) && (+wire10)),
                  ({wire9[(2'h3):(1'h1)], (wire49 ? wire7 : (8'hb7))} ?
                      $unsigned((wire9 ?
                          reg13 : wire11)) : (&wire11[(3'h5):(2'h2)]))} > (($signed((wire49 <= (7'h42))) ^ $unsigned($signed(wire49))) ?
                  ((~^(wire8 ? wire49 : reg13)) ?
                      wire9 : $signed((wire7 ? wire49 : wire11))) : wire49));
              reg52 <= (!(+$signed($signed($unsigned(wire49)))));
              reg53 <= ($unsigned($unsigned({wire10[(1'h0):(1'h0)]})) - (wire14 ?
                  ((8'ha9) ?
                      wire8 : ($unsigned(wire49) && (wire11 ?
                          (8'hae) : reg52))) : (&reg52)));
              reg54 <= ($unsigned((wire12[(3'h7):(3'h7)] && (wire49 ?
                      reg52[(4'h9):(3'h7)] : wire7))) ?
                  reg13 : ((+$unsigned(wire9)) ?
                      (((-wire14) == $unsigned((8'ha0))) <= (|$unsigned(reg52))) : (~(wire9[(1'h1):(1'h0)] + $unsigned(wire9)))));
              reg55 <= (reg53[(4'hf):(4'h9)] ?
                  (wire10[(3'h4):(1'h0)] << (&$signed((+reg51)))) : $signed($unsigned((-$signed((8'hb6))))));
            end
          else
            begin
              reg51 <= $signed((&$signed($unsigned({reg51, reg52}))));
              reg52 <= wire14[(3'h7):(1'h1)];
              reg53 <= reg52[(3'h7):(3'h7)];
            end
          if ({$signed(reg53[(4'ha):(3'h5)]), reg53[(3'h6):(1'h1)]})
            begin
              reg56 <= $unsigned(reg54);
              reg57 <= wire14[(4'h8):(1'h0)];
              reg58 <= reg55[(2'h2):(1'h0)];
            end
          else
            begin
              reg56 <= (^~(8'h9e));
              reg57 <= (~^(($unsigned($signed(wire8)) ?
                  $unsigned(((8'haa) ? wire8 : wire11)) : ((reg57 ?
                          wire9 : wire8) ?
                      (reg13 ? wire11 : reg54) : (reg13 < (8'hb2)))) ~^ wire9));
              reg58 <= (^~$unsigned($signed((!$signed(reg51)))));
              reg59 <= (~|$signed(reg54));
            end
          reg60 <= $signed(wire9[(2'h2):(1'h1)]);
          if ({((8'hb2) ?
                  ((8'hac) - $unsigned(((8'haf) ?
                      (8'hb8) : wire49))) : reg56[(4'ha):(1'h0)])})
            begin
              reg61 <= $signed(wire12[(3'h7):(2'h2)]);
            end
          else
            begin
              reg61 <= (((($unsigned((8'ha3)) < $unsigned(reg59)) || reg57[(1'h1):(1'h0)]) ~^ (^~(~reg60))) ?
                  (&(reg52 ?
                      $unsigned($signed((8'h9f))) : (&(~|wire8)))) : (wire7[(2'h3):(2'h3)] ?
                      $signed({(reg13 - wire8),
                          wire7[(3'h4):(1'h0)]}) : (($unsigned(reg61) << wire14) ?
                          ($signed(reg57) ^ wire10) : (~|$signed(wire12)))));
              reg62 <= reg51;
              reg63 <= $unsigned(reg55);
              reg64 <= $signed(((7'h42) & wire11[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg51 <= $unsigned((($signed((reg64 ? reg63 : reg64)) * (!wire7)) ?
              $signed(($signed(reg64) || reg53)) : ($signed(reg54) >>> {{reg55}})));
          if ((~^((-reg55) ? wire8 : reg52)))
            begin
              reg52 <= $signed((($signed((wire14 <<< wire8)) ?
                      wire7 : wire11[(4'hb):(4'h9)]) ?
                  (+{$signed(wire11), $unsigned(wire12)}) : (((~reg60) ?
                      (reg62 >> reg52) : (!reg53)) || ((reg13 ?
                      reg63 : (8'ha7)) > (~^wire14)))));
              reg53 <= $unsigned((^((~|((8'hab) ?
                  (8'hb8) : reg56)) == $unsigned({reg61, wire11}))));
              reg54 <= (+wire9[(2'h3):(1'h1)]);
            end
          else
            begin
              reg52 <= wire10;
              reg53 <= reg62[(3'h7):(2'h2)];
              reg54 <= (~|reg56);
            end
          reg55 <= (reg55[(3'h7):(1'h1)] != $unsigned((reg54 ?
              reg54[(4'ha):(3'h7)] : {$unsigned((8'ha6)), {reg13}})));
        end
      reg65 <= ({wire11} >>> (8'ha7));
      if ($signed(($unsigned($unsigned($unsigned(wire9))) >> {wire7,
          (|(wire49 << wire14))})))
        begin
          reg66 <= reg52[(5'h10):(3'h7)];
        end
      else
        begin
          reg66 <= (~((wire7[(3'h6):(3'h5)] && wire9) ?
              {((+reg13) << reg53),
                  (+wire7[(1'h0):(1'h0)])} : $unsigned(reg62[(4'h9):(3'h5)])));
          reg67 <= (reg58 <<< (((~&(^~reg65)) ?
                  {reg62[(2'h3):(1'h1)]} : ((reg52 ?
                      (8'hbf) : (8'hbc)) <<< $signed(reg56))) ?
              $signed($signed((reg13 > wire9))) : $signed($signed((reg61 ?
                  reg56 : reg51)))));
          if (wire49[(4'h8):(1'h0)])
            begin
              reg68 <= reg65;
            end
          else
            begin
              reg68 <= (7'h43);
              reg69 <= (^reg68);
              reg70 <= $signed($unsigned(($signed((reg57 < wire9)) != ($signed(reg67) ?
                  $signed(reg55) : reg68))));
              reg71 <= $unsigned(($signed($signed({wire10})) ?
                  ($unsigned(reg66[(4'hf):(4'hc)]) && wire9) : $unsigned(reg63)));
            end
          reg72 <= {reg69[(3'h7):(1'h0)]};
          reg73 <= reg59;
        end
      reg74 <= (reg55[(2'h2):(1'h1)] && $signed(reg69[(4'h8):(1'h0)]));
    end
  assign wire75 = reg68;
  assign wire76 = reg52[(4'hd):(4'hc)];
  assign wire77 = wire75;
  assign wire78 = reg61[(3'h4):(2'h3)];
  assign wire79 = $unsigned(((wire7 >> (~^reg68)) <= $unsigned((&{(8'h9f),
                      reg63}))));
  assign wire80 = wire8[(3'h7):(1'h1)];
  assign wire81 = ($signed((8'h9f)) ?
                      $unsigned($signed((8'ha6))) : wire80[(2'h2):(2'h2)]);
  assign wire82 = wire76;
  assign wire83 = {$signed((wire77 & $unsigned((reg59 ? reg73 : wire11)))),
                      reg72};
  module84 #() modinst99 (wire98, clk, reg63, reg74, wire10, reg65);
  assign wire100 = wire75[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      if ((reg63 ?
          (reg58[(1'h1):(1'h0)] ^~ {((~&wire11) & $unsigned(wire12))}) : wire11[(3'h6):(1'h1)]))
        begin
          reg101 <= (~reg71);
          reg102 <= {$unsigned(wire76[(2'h3):(2'h2)]),
              (((wire79 ? $unsigned(reg56) : (reg60 ? wire77 : wire11)) ?
                  reg64 : ({wire12} ?
                      reg67[(4'h9):(3'h5)] : {wire10})) * $signed((~^$unsigned(reg71))))};
          reg103 <= $unsigned($signed(reg56));
        end
      else
        begin
          reg101 <= {$unsigned((-((|(8'hbf)) ?
                  (+reg51) : reg52[(5'h13):(4'hc)]))),
              $signed(((reg65 >> reg58[(2'h2):(1'h0)]) ?
                  ($signed(wire77) ~^ $signed(reg57)) : (reg60[(2'h3):(1'h0)] ?
                      (8'ha5) : {reg70, wire8})))};
          reg102 <= wire76;
          if (reg69[(4'h8):(2'h3)])
            begin
              reg103 <= $signed({reg59});
              reg104 <= $unsigned($signed((~|$signed((reg68 ?
                  wire100 : (8'hb4))))));
            end
          else
            begin
              reg103 <= wire49;
              reg104 <= reg72;
            end
          reg105 <= (((~$signed((reg59 ?
              reg56 : reg56))) <= reg70) >>> (wire10[(4'hd):(3'h6)] ?
              (reg55 ?
                  (-reg66) : (((8'haa) ? reg104 : reg54) ?
                      (wire14 == wire78) : reg64)) : {reg72[(4'hc):(1'h0)],
                  $signed(reg54)}));
          reg106 <= {((~&wire11[(4'hb):(4'h9)]) == $unsigned(reg60[(2'h3):(2'h2)])),
              ($unsigned(reg71[(2'h3):(2'h3)]) != wire11)};
        end
    end
  assign wire107 = $signed(wire10);
  always
    @(posedge clk) begin
      reg108 <= $signed(($signed(reg70[(2'h2):(1'h0)]) ^ (($unsigned(reg64) ?
          (~|wire82) : ((8'hbd) || reg54)) >> {reg53})));
      reg109 <= $signed(($unsigned((!(reg52 ?
          reg68 : reg65))) ^~ ($signed(wire100) ?
          (-(8'hab)) : (~^(wire9 << wire76)))));
      reg110 <= ((reg51 << $signed(reg65[(3'h6):(1'h1)])) ?
          ((|(^~(reg54 ?
              (8'hb3) : wire8))) | $signed(($unsigned(reg53) * $unsigned(reg62)))) : (8'h9f));
      reg111 <= reg102[(3'h6):(3'h6)];
    end
  assign wire112 = {reg102};
endmodule

module module84
#(parameter param96 = (~|(((((7'h41) <<< (8'ha6)) + ((8'hb2) ? (8'ha0) : (8'hbc))) ? ((-(8'h9e)) == ((8'hb4) ? (8'ha7) : (8'had))) : {((8'hb1) + (8'hb7)), (^(8'h9e))}) == (+({(8'had), (8'h9f)} ? (~^(8'haf)) : ((8'ha0) ^~ (7'h42)))))), 
parameter param97 = (-{{{{(8'h9c)}, param96}}, ((param96 ^ (param96 >>> param96)) + param96)}))
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire88;
  input wire signed [(5'h10):(1'h0)] wire87;
  input wire [(4'hf):(1'h0)] wire86;
  input wire [(4'hd):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  assign y = {wire95, wire94, wire93, wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = {((~&wire87[(4'hb):(1'h0)]) ?
                          (!wire85[(3'h4):(3'h4)]) : wire87[(4'hb):(3'h4)]),
                      $signed((^~wire86[(4'he):(3'h4)]))};
  assign wire90 = $signed((^~wire89));
  assign wire91 = wire90[(1'h0):(1'h0)];
  assign wire92 = $unsigned($signed(wire89));
  assign wire93 = (8'hb2);
  assign wire94 = wire91[(5'h10):(4'h9)];
  assign wire95 = {($signed(((wire90 ? wire90 : wire94) + {wire90})) ?
                          {((wire88 ? wire85 : wire93) < $unsigned(wire87)),
                              wire93[(1'h0):(1'h0)]} : (+{(^wire92),
                              (!wire92)}))};
endmodule

module module15
#(parameter param47 = (((((~(8'h9e)) || ((8'h9f) ? (7'h40) : (7'h42))) ? (((8'ha0) ? (8'haf) : (8'hbd)) * (|(8'ha9))) : (((8'ha3) ? (8'hb5) : (8'hab)) << ((8'ha1) <<< (8'ha8)))) ? ((8'hac) ? ((^~(8'hbc)) ? ((8'hbb) | (7'h43)) : {(8'hae)}) : (+{(8'hb8)})) : (~((&(8'hb7)) ? (~&(8'hbc)) : (~^(8'hbe))))) + (8'hb1)), 
parameter param48 = ({param47} & ((+({(8'ha6), param47} + (param47 > param47))) ? param47 : param47)))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire21 = {$unsigned((8'h9e)),
                      ({$unsigned(wire19[(4'hd):(4'h8)]),
                          (~&(wire17 ?
                              wire19 : wire18))} ~^ $unsigned($signed($unsigned(wire19))))};
  assign wire22 = wire17;
  assign wire23 = wire21[(3'h5):(2'h3)];
  assign wire24 = wire21;
  assign wire25 = $unsigned(wire18);
  always
    @(posedge clk) begin
      reg26 <= ($signed({$signed((wire24 || wire18))}) + (7'h43));
      if ($unsigned($signed({{(8'hb6)}, $unsigned(wire23)})))
        begin
          reg27 <= ((((~&wire24[(2'h2):(1'h1)]) * {wire21[(3'h5):(1'h1)],
                  (wire17 ? wire23 : wire24)}) - (8'hb2)) ?
              $unsigned($signed(wire19[(4'h9):(3'h7)])) : $unsigned(((7'h43) ?
                  ((!reg26) ?
                      $unsigned(wire18) : wire23[(4'hd):(4'h9)]) : wire18)));
          if (reg27)
            begin
              reg28 <= wire25;
              reg29 <= {((~|{wire24}) ?
                      $unsigned((~^(reg26 > reg28))) : wire18),
                  ((((wire19 << wire24) << $unsigned(wire20)) ?
                      $unsigned((wire20 ?
                          wire25 : wire19)) : $signed(wire17)) >>> $signed($signed(wire24)))};
              reg30 <= (+($signed($signed((8'h9e))) > wire17));
              reg31 <= $unsigned((~^((((8'hab) <<< wire16) ?
                  $unsigned(wire25) : (^~wire20)) - (reg26[(1'h0):(1'h0)] >>> ((7'h41) && reg28)))));
            end
          else
            begin
              reg28 <= (-(-$unsigned((8'ha4))));
            end
        end
      else
        begin
          if ((($signed($unsigned($signed(wire23))) ?
              reg27 : ($signed($signed(wire19)) & wire17)) <= $signed($unsigned($unsigned(reg26)))))
            begin
              reg27 <= wire22;
              reg28 <= (((^$signed($signed(reg27))) ?
                  $signed($unsigned(((8'hb7) && wire19))) : $unsigned($unsigned(reg26[(2'h3):(1'h1)]))) ^~ (&{{{reg28},
                      $unsigned(wire20)},
                  reg26}));
              reg29 <= $signed({$unsigned($unsigned((reg31 <<< wire22)))});
              reg30 <= $unsigned(wire16);
            end
          else
            begin
              reg27 <= (~&(8'hb4));
              reg28 <= wire18;
              reg29 <= ($unsigned($unsigned({{reg31,
                      reg29}})) && (wire21[(1'h1):(1'h0)] <= ($unsigned((-wire17)) ?
                  wire23 : $signed($unsigned(reg29)))));
            end
          reg31 <= wire23[(3'h7):(3'h5)];
          reg32 <= {(wire16[(1'h0):(1'h0)] ^ ($signed({reg26}) ?
                  ($signed(reg27) ?
                      $unsigned(wire17) : $unsigned(wire24)) : (~reg26)))};
          reg33 <= (((((wire17 ? reg29 : reg29) ?
                  {reg26} : $signed(reg26)) == wire25[(4'h8):(1'h1)]) ?
              reg27 : wire17[(1'h1):(1'h1)]) <= $unsigned($signed({(wire23 >> wire20),
              (wire17 ? reg27 : wire18)})));
          if ((+$unsigned((wire24 ?
              $signed($unsigned(reg29)) : $signed(wire23)))))
            begin
              reg34 <= reg31;
              reg35 <= ($unsigned(wire24[(1'h1):(1'h1)]) <<< reg29);
              reg36 <= (~&$signed(reg32[(2'h3):(2'h3)]));
              reg37 <= (-(!{wire17[(2'h3):(2'h2)]}));
              reg38 <= (($signed(((7'h42) ? (&wire23) : $signed(reg26))) ?
                      (((reg29 ? (8'ha0) : reg31) ?
                              {wire24, wire19} : (^reg27)) ?
                          $signed((wire22 ^~ reg31)) : reg27[(3'h4):(3'h4)]) : (+{$signed((8'ha5))})) ?
                  reg34 : $unsigned(wire16));
            end
          else
            begin
              reg34 <= (reg30[(1'h1):(1'h0)] ?
                  $signed($signed($signed((-(8'hbf))))) : reg37[(1'h1):(1'h1)]);
            end
        end
      reg39 <= wire18;
    end
  assign wire40 = (|wire23[(4'h8):(4'h8)]);
  assign wire41 = $signed($signed((((^wire17) ?
                      reg28 : reg32[(4'h8):(3'h7)]) >>> ($unsigned(wire24) ?
                      (~^wire22) : (wire25 ^~ reg32)))));
  assign wire42 = reg26;
  assign wire43 = (~(reg36 ?
                      (~($unsigned(wire16) || (wire42 ~^ reg36))) : reg27));
  assign wire44 = reg27[(3'h5):(1'h0)];
  assign wire45 = (&reg37[(2'h2):(1'h0)]);
  assign wire46 = {wire17};
endmodule

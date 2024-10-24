module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire232;
  wire signed [(2'h3):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire74;
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire232,
                 wire76,
                 wire9,
                 wire11,
                 wire74,
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
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {(($unsigned(wire0[(4'h9):(2'h2)]) <= (^wire2[(1'h1):(1'h0)])) >= (8'hae)),
          (wire3[(2'h3):(2'h2)] * ($signed($signed(wire0)) >>> ((^~wire4) ?
              (wire1 >>> wire2) : $signed(wire0))))};
      reg6 <= (+wire4);
      reg7 <= $signed(({(~&$unsigned(reg6)),
          $signed((wire3 + wire1))} <= $unsigned((~$unsigned(wire4)))));
    end
  always
    @(posedge clk) begin
      if ((wire0 ?
          {(~{(reg6 ? wire1 : wire1),
                  wire0})} : (reg6[(5'h10):(4'hc)] ~^ ({$signed((8'ha0))} << ((8'ha7) != (wire0 > wire4))))))
        begin
          reg8 <= (~^$unsigned(((+$unsigned(wire1)) <<< (wire0[(5'h10):(4'ha)] <= wire3[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg8 <= ((7'h42) ? reg7 : wire1);
        end
    end
  assign wire9 = ((($unsigned(((8'ha7) >>> reg8)) ^~ ((reg6 ? reg6 : (8'hb4)) ?
                             (^~wire2) : {reg6, wire3})) ?
                         $signed(($unsigned(wire1) >> wire3[(1'h0):(1'h0)])) : $signed(wire0[(1'h1):(1'h1)])) ?
                     $unsigned(wire0) : $signed($unsigned($unsigned($signed(wire3)))));
  always
    @(posedge clk) begin
      reg10 <= $signed(($unsigned($signed(wire9[(3'h5):(3'h4)])) * reg8));
    end
  assign wire11 = $signed(wire1);
  always
    @(posedge clk) begin
      if (wire3[(2'h3):(1'h1)])
        begin
          if (reg6[(3'h4):(1'h0)])
            begin
              reg12 <= (^~wire9);
              reg13 <= (!reg10);
            end
          else
            begin
              reg12 <= $unsigned(reg6[(4'hd):(2'h2)]);
              reg13 <= $signed((8'haf));
              reg14 <= wire9;
              reg15 <= $signed($signed(reg10[(2'h2):(1'h0)]));
              reg16 <= reg10[(4'h9):(3'h4)];
            end
          reg17 <= wire9;
          if (reg13)
            begin
              reg18 <= reg17[(3'h6):(3'h6)];
              reg19 <= ({wire3[(1'h1):(1'h0)]} ?
                  wire2[(4'he):(4'hb)] : (((|$unsigned(reg14)) ?
                          {reg13} : (~(wire2 >> reg14))) ?
                      reg16[(3'h4):(2'h3)] : wire1[(3'h5):(3'h4)]));
              reg20 <= wire2[(4'ha):(3'h6)];
              reg21 <= reg13[(3'h4):(3'h4)];
            end
          else
            begin
              reg18 <= $unsigned($signed($unsigned({$unsigned(reg18), reg12})));
            end
          reg22 <= $signed($unsigned({$unsigned(wire11[(3'h4):(1'h0)]),
              wire2[(4'hb):(4'h8)]}));
          reg23 <= ($unsigned((((~&reg12) | $unsigned(wire11)) ?
              $unsigned((reg14 ? (8'ha9) : reg12)) : ((wire0 ? reg6 : wire3) ?
                  $signed(wire0) : reg22[(4'hc):(1'h1)]))) & reg18);
        end
      else
        begin
          if (((reg14[(3'h6):(1'h0)] ?
              reg22[(3'h4):(2'h2)] : reg14) ^ {(+$unsigned((^reg23))),
              $signed({(reg22 ? (7'h41) : reg20)})}))
            begin
              reg12 <= wire4;
            end
          else
            begin
              reg12 <= $signed((|wire9));
            end
          reg13 <= ($unsigned($signed(reg23[(4'h8):(4'h8)])) + (+reg21[(2'h2):(2'h2)]));
          if ({reg7, (+$unsigned({$unsigned(wire3), ((8'hb0) <= reg5)}))})
            begin
              reg14 <= ((($signed($signed(wire1)) ?
                          reg17 : ((wire4 < reg10) ? wire0 : (~wire1))) ?
                      (^~$unsigned($unsigned(wire1))) : wire11) ?
                  {{($signed(wire9) ?
                              (~|reg5) : $signed((8'haa)))}} : reg7[(4'h9):(1'h0)]);
              reg15 <= reg16;
              reg16 <= reg12;
              reg17 <= ($signed((reg7[(3'h5):(3'h4)] | (|{reg6,
                  reg12}))) != $unsigned((8'ha5)));
            end
          else
            begin
              reg14 <= wire4[(1'h1):(1'h0)];
            end
          reg18 <= reg21;
        end
    end
  module24 #() modinst75 (.wire27(wire0), .y(wire74), .wire25(reg6), .clk(clk), .wire28(reg14), .wire26(reg16));
  assign wire76 = (reg23[(1'h0):(1'h0)] | (8'hbf));
  module77 #() modinst233 (.wire81(reg23), .wire82(reg17), .clk(clk), .wire78(wire4), .y(wire232), .wire79(wire11), .wire80(reg15));
endmodule

module module77  (y, clk, wire78, wire79, wire80, wire81, wire82);
  output wire [(32'h24c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire78;
  input wire [(3'h4):(1'h0)] wire79;
  input wire signed [(3'h7):(1'h0)] wire80;
  input wire [(5'h12):(1'h0)] wire81;
  input wire signed [(4'ha):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire231;
  wire signed [(2'h3):(1'h0)] wire230;
  wire signed [(5'h11):(1'h0)] wire229;
  wire signed [(4'ha):(1'h0)] wire217;
  wire signed [(2'h3):(1'h0)] wire216;
  wire [(4'hb):(1'h0)] wire201;
  wire signed [(4'hd):(1'h0)] wire200;
  wire signed [(4'hb):(1'h0)] wire195;
  wire signed [(3'h4):(1'h0)] wire193;
  wire signed [(5'h15):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire120;
  reg signed [(4'hb):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg227 = (1'h0);
  reg [(4'h8):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg225 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg223 = (1'h0);
  reg [(5'h14):(1'h0)] reg222 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg220 = (1'h0);
  reg [(5'h13):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg214 = (1'h0);
  reg [(4'hf):(1'h0)] reg213 = (1'h0);
  reg [(3'h5):(1'h0)] reg212 = (1'h0);
  reg [(5'h11):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg208 = (1'h0);
  reg signed [(4'he):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg202 = (1'h0);
  reg [(2'h3):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg198 = (1'h0);
  reg [(4'hc):(1'h0)] reg197 = (1'h0);
  reg [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire217,
                 wire216,
                 wire201,
                 wire200,
                 wire195,
                 wire193,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire83,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire120,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire83 = {(^~wire82[(3'h5):(1'h0)]),
                      (($signed($unsigned(wire79)) ~^ $unsigned(wire81)) & (8'hbf))};
  always
    @(posedge clk) begin
      reg84 <= ($signed({$signed((wire78 == wire83)),
          {(wire79 ^ wire83),
              ((8'ha8) || wire81)}}) <<< (~^(~|($unsigned(wire83) >> wire80))));
      reg85 <= $unsigned((&$unsigned($unsigned(wire83[(2'h2):(2'h2)]))));
      reg86 <= (&$unsigned(wire79[(2'h3):(1'h0)]));
      reg87 <= reg84;
    end
  assign wire88 = wire82;
  assign wire89 = $signed((~&$unsigned(reg84[(3'h7):(2'h3)])));
  assign wire90 = ($signed($unsigned($signed({reg87}))) ?
                      wire83[(2'h2):(2'h2)] : wire83);
  assign wire91 = ((!(wire82 ?
                      $unsigned((reg87 >>> wire80)) : wire88[(4'h8):(3'h7)])) + $unsigned(wire80[(3'h4):(1'h1)]));
  module92 #() modinst121 (wire120, clk, reg85, wire90, wire82, wire78);
  assign wire122 = (~wire78);
  assign wire123 = {((wire82 >>> (-wire78)) != $unsigned(wire89)),
                       $unsigned({$signed(wire80)})};
  assign wire124 = {wire123};
  assign wire125 = (~^{wire83});
  module126 #() modinst194 (wire193, clk, wire120, wire83, wire89, wire123, reg87);
  assign wire195 = wire81[(4'hf):(3'h4)];
  always
    @(posedge clk) begin
      reg196 <= wire80;
      reg197 <= ($signed((wire90 & reg196[(4'ha):(1'h0)])) ?
          (~^(wire193[(1'h0):(1'h0)] && $signed((wire122 != wire124)))) : {(wire82 ~^ $signed(wire80))});
      reg198 <= ((~$unsigned(((wire91 << (8'ha8)) ?
              $unsigned(reg197) : wire123))) ?
          (8'hbe) : wire82[(4'h9):(3'h4)]);
      reg199 <= ((wire123 ?
          $signed(($signed(wire122) ?
              wire91[(3'h5):(2'h2)] : (wire91 || wire122))) : $signed({wire193[(1'h0):(1'h0)]})) >> wire195[(4'ha):(4'h8)]);
    end
  assign wire200 = (&$unsigned((wire82[(4'ha):(3'h5)] ?
                       $signed(wire79[(1'h0):(1'h0)]) : (~^(reg86 ?
                           reg86 : wire80)))));
  assign wire201 = {$unsigned({($signed(wire193) ?
                               $signed(wire193) : wire122[(4'h8):(3'h6)]),
                           $unsigned(wire120[(3'h7):(3'h4)])})};
  always
    @(posedge clk) begin
      reg202 <= wire82;
      reg203 <= $unsigned($unsigned(($signed(wire79) | (8'had))));
      if ($unsigned((~&wire195[(1'h1):(1'h0)])))
        begin
          reg204 <= $signed((reg85[(3'h5):(2'h3)] >>> wire90[(4'h9):(2'h2)]));
          if ({((^~{(^~reg203)}) ~^ wire200[(3'h4):(3'h4)]),
              wire123[(4'hb):(4'h9)]})
            begin
              reg205 <= ($signed(wire89[(1'h0):(1'h0)]) ?
                  ({(~^((8'h9c) ^ wire81)), $signed({wire91, reg86})} ?
                      {{$signed(wire83)}} : $signed({$signed(wire193)})) : $signed($signed(($unsigned(wire125) == $unsigned(reg86)))));
            end
          else
            begin
              reg205 <= ((wire81[(4'h9):(3'h5)] >>> (8'hb2)) > {{wire83[(4'h9):(2'h3)]}});
            end
          reg206 <= ((($unsigned((+reg203)) ?
                      wire123[(5'h12):(3'h7)] : $signed(wire90)) ?
                  (+wire89[(4'h8):(1'h1)]) : ((^~(~|wire79)) ?
                      (~|reg202) : ({wire125, wire82} ?
                          (reg204 - (8'ha4)) : wire90[(5'h14):(4'hb)]))) ?
              ({((wire79 - reg196) == (reg199 ? (8'hb1) : (8'hbe)))} ?
                  {reg196[(4'ha):(4'ha)]} : (~&$unsigned({reg86}))) : $signed({$signed($signed(reg202))}));
          if ((wire120[(4'hb):(4'hb)] ? reg206[(1'h0):(1'h0)] : (8'ha6)))
            begin
              reg207 <= (&reg87);
              reg208 <= {wire193[(1'h1):(1'h0)]};
              reg209 <= wire80;
              reg210 <= {{($unsigned(reg199) ?
                          $signed(wire81[(4'he):(4'ha)]) : $unsigned(reg85[(4'h9):(3'h6)])),
                      (((wire82 << wire200) ? (~&reg199) : $unsigned(wire83)) ?
                          $signed((wire122 ?
                              wire90 : reg203)) : ($unsigned(wire91) >= (reg85 != reg86)))}};
            end
          else
            begin
              reg207 <= $signed((~({$unsigned(reg207),
                  reg203[(3'h5):(2'h2)]} != (!(!wire82)))));
              reg208 <= $unsigned(reg84);
              reg209 <= (wire78 && $unsigned($unsigned({(reg85 ?
                      (8'hbc) : reg204),
                  (reg196 ? reg199 : reg204)})));
            end
          if (wire82[(4'h9):(1'h1)])
            begin
              reg211 <= (reg196[(2'h2):(1'h0)] ?
                  wire91[(1'h1):(1'h1)] : ((~^(8'hb8)) >>> wire80));
              reg212 <= $unsigned(reg86[(1'h0):(1'h0)]);
              reg213 <= reg207[(3'h7):(2'h3)];
              reg214 <= (~|((-(8'hb9)) < ((^~$signed(wire88)) & (~^wire89))));
            end
          else
            begin
              reg211 <= (~|(!$unsigned((-(8'hbe)))));
              reg212 <= wire80[(1'h0):(1'h0)];
              reg213 <= (+$unsigned(wire91[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg204 <= {wire80, $unsigned({$signed($signed((8'ha3)))})};
          reg205 <= wire193[(1'h0):(1'h0)];
          reg206 <= (^~reg198);
          reg207 <= (^wire90);
          if (reg196)
            begin
              reg208 <= reg208;
              reg209 <= reg209[(2'h3):(1'h0)];
              reg210 <= $signed((($signed({wire200, (8'h9c)}) << ((^wire195) ?
                  (reg202 <<< reg203) : reg211)) == $signed((wire90[(3'h7):(3'h6)] != (wire81 >>> reg86)))));
            end
          else
            begin
              reg208 <= (^~(((8'hb9) << ({reg209} ^ (reg211 ?
                  reg203 : reg87))) == $unsigned({{(8'hbe)}})));
              reg209 <= $unsigned(((reg85 ?
                      reg210[(4'ha):(2'h3)] : (&(reg196 - wire120))) ?
                  {reg199[(1'h1):(1'h0)],
                      $signed(wire120)} : reg86[(2'h3):(2'h3)]));
            end
        end
      reg215 <= wire123[(4'hb):(3'h6)];
    end
  assign wire216 = $signed($unsigned($signed($unsigned((~^reg198)))));
  assign wire217 = (|($unsigned((^~(|reg203))) ?
                       wire120[(1'h0):(1'h0)] : wire81[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg218 <= reg205;
      if (reg210)
        begin
          reg219 <= (^(^($unsigned(((8'h9f) ?
              wire201 : reg203)) < $unsigned(wire193[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg219 <= $unsigned(((wire83[(4'h8):(3'h5)] < wire216) <= $signed($unsigned(((8'ha6) ^~ reg85)))));
          reg220 <= {{{{(reg209 ? reg214 : reg198)}},
                  ((|(wire216 < reg207)) ?
                      ((wire200 ? reg211 : wire200) ?
                          {(8'hbe)} : (^wire83)) : (wire216[(2'h3):(2'h2)] ?
                          wire124[(4'hb):(4'hb)] : (wire82 ?
                              reg207 : wire83)))},
              ((reg196[(3'h5):(3'h4)] | (reg210 ?
                      (wire79 ? wire125 : reg215) : {(7'h40)})) ?
                  {((reg208 ? reg204 : reg212) ?
                          $unsigned(reg206) : $unsigned((8'ha7)))} : $unsigned((wire125 ?
                      reg211 : reg213[(3'h7):(3'h6)])))};
          reg221 <= {(+reg204[(3'h6):(2'h2)])};
          reg222 <= $signed((($signed({(7'h42)}) ^ {$signed(wire120)}) ?
              (!((wire122 >>> (8'hbe)) ^~ reg219[(3'h6):(3'h6)])) : $unsigned(wire193)));
          if ($unsigned($unsigned((wire90 >> reg212[(2'h2):(2'h2)]))))
            begin
              reg223 <= {reg196[(4'hb):(3'h4)],
                  ($signed((wire217 & $signed(reg206))) || (|(reg87 ?
                      (reg219 ? wire83 : reg211) : {reg213, reg207})))};
              reg224 <= $unsigned($signed((~reg214[(4'h8):(3'h7)])));
            end
          else
            begin
              reg223 <= (($unsigned(((reg196 ? reg212 : (8'ha0)) ?
                  $unsigned(reg197) : reg222)) == (wire81 ?
                  wire120 : reg220[(2'h3):(1'h0)])) * (reg205 + wire200[(3'h5):(2'h3)]));
              reg224 <= $signed($unsigned(({(wire200 ? reg220 : reg224),
                  reg220} != wire195)));
              reg225 <= $signed(reg223[(1'h0):(1'h0)]);
              reg226 <= (wire124 ?
                  $unsigned($signed((8'hb6))) : wire124[(4'ha):(1'h0)]);
              reg227 <= (8'haf);
            end
        end
      reg228 <= wire78[(3'h4):(2'h2)];
    end
  assign wire229 = reg214;
  assign wire230 = ($signed(reg212[(3'h5):(2'h3)]) | $unsigned((((8'had) == $signed((8'ha4))) * ({reg225} ?
                       wire82 : {reg206, (8'ha0)}))));
  assign wire231 = (reg215 << {$signed(($signed((8'hbd)) << (reg213 ?
                           reg214 : (8'hb6))))});
endmodule

module module24
#(parameter param72 = (~|(((((8'hb2) ? (8'hb9) : (8'hb6)) ? ((8'hb8) <<< (7'h43)) : (~&(8'haa))) ? (((8'hba) ? (8'hae) : (8'h9c)) ? (^(8'hb5)) : (&(8'h9d))) : (~^((8'ha2) & (8'ha8)))) >> ((-((8'hb8) < (8'ha7))) ? (^(~&(8'ha0))) : (((7'h41) ? (8'hbc) : (7'h42)) <= ((8'hb3) ? (8'hac) : (8'hab)))))), 
parameter param73 = {param72, param72})
(y, clk, wire25, wire26, wire27, wire28);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire70;
  assign y = {wire29, wire30, wire31, wire70, (1'h0)};
  assign wire29 = wire28;
  assign wire30 = $unsigned(wire25[(1'h0):(1'h0)]);
  assign wire31 = wire29[(3'h7):(2'h2)];
  module32 #() modinst71 (.wire34(wire29), .clk(clk), .wire36(wire31), .y(wire70), .wire35(wire26), .wire33(wire30), .wire37(wire28));
endmodule

module module32
#(parameter param68 = ((((|((8'ha7) ? (8'ha0) : (8'hb5))) || (|((8'hbe) & (8'h9d)))) ? (~&((-(8'ha9)) ^ {(8'hb5), (8'hb0)})) : ({((8'hac) + (8'ha7))} >>> ({(8'ha7), (8'hba)} ? ((8'ha2) & (8'hb7)) : (8'ha4)))) || {((|(^~(8'hb1))) > ((~&(8'hb7)) ^ {(8'h9c)})), (^~(((8'hb4) ? (8'ha4) : (8'hb2)) ? (|(8'hb9)) : (+(8'hb9))))}), 
parameter param69 = {(param68 <<< (8'hb9)), (((&(^param68)) || (((8'hb8) >>> param68) >>> (param68 ~^ param68))) >> param68)})
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
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
                 (1'h0)};
  assign wire38 = $unsigned($unsigned(wire36));
  assign wire39 = (!wire36[(4'he):(3'h5)]);
  assign wire40 = $unsigned(wire36[(4'hd):(3'h4)]);
  assign wire41 = {{wire37}, $unsigned($signed((8'h9f)))};
  assign wire42 = $unsigned($signed({$signed(wire36),
                      {$signed(wire38), wire36}}));
  assign wire43 = ((^wire35) ? (!(-wire36)) : (7'h43));
  assign wire44 = wire35;
  assign wire45 = wire38;
  always
    @(posedge clk) begin
      reg46 <= wire44[(4'h8):(3'h7)];
      reg47 <= wire42;
    end
  always
    @(posedge clk) begin
      reg48 <= wire38;
      reg49 <= $signed((+($unsigned($unsigned(wire40)) ?
          $signed(wire42) : {wire34, (wire45 >= wire37)})));
      reg50 <= (~&($signed($signed(wire41)) ?
          (|$signed($signed(reg46))) : wire44));
      if (($signed((~^$signed($signed((8'ha2))))) ~^ $signed(($signed($unsigned(wire34)) ?
          wire33[(4'hb):(4'h9)] : wire43))))
        begin
          reg51 <= ($signed({($signed(wire39) | (+wire41)),
              ((!wire35) ^ (+(8'h9c)))}) - {{$unsigned((^~(8'hb9)))},
              ($unsigned($signed(wire40)) ?
                  ($signed(wire40) ?
                      (reg49 >= wire44) : (wire37 || wire41)) : (+wire34[(1'h0):(1'h0)]))});
          reg52 <= $unsigned(($signed((~&(~&wire42))) ?
              (wire39[(4'ha):(4'h8)] ?
                  $unsigned($unsigned(wire42)) : $signed(wire45)) : reg50[(2'h3):(1'h1)]));
        end
      else
        begin
          reg51 <= reg50;
          reg52 <= reg51;
          if ((&(wire33 != {$signed($signed(wire41))})))
            begin
              reg53 <= $unsigned(wire33);
              reg54 <= (8'hb8);
              reg55 <= $unsigned((~&reg50[(2'h2):(1'h0)]));
              reg56 <= wire35[(2'h3):(2'h2)];
              reg57 <= wire40[(3'h4):(3'h4)];
            end
          else
            begin
              reg53 <= wire35;
              reg54 <= {($signed((+(reg46 ? wire41 : reg47))) ?
                      $signed(wire37) : $signed(wire39)),
                  reg51};
            end
          reg58 <= (|$signed((reg52[(3'h4):(3'h4)] | $signed($signed(wire33)))));
          if ((+reg52[(1'h0):(1'h0)]))
            begin
              reg59 <= wire40[(3'h6):(2'h2)];
              reg60 <= reg47;
              reg61 <= {$unsigned((wire37 & reg46))};
              reg62 <= reg55;
              reg63 <= (reg46 ? reg60 : $signed((^~(~^wire44[(3'h7):(3'h5)]))));
            end
          else
            begin
              reg59 <= ($unsigned((wire36 ?
                  ((wire37 ? wire45 : wire34) ?
                      (wire38 >= wire35) : (reg59 ?
                          reg61 : reg61)) : ($signed(wire38) <= (^reg60)))) != {(reg47 & {$signed(reg56)}),
                  (^~$unsigned((reg55 ? reg55 : (8'had))))});
              reg60 <= $unsigned($unsigned(($signed(wire38[(3'h5):(2'h3)]) >> ((reg59 >= reg59) ?
                  (wire37 - (8'hb6)) : $signed(reg56)))));
              reg61 <= (+wire33);
              reg62 <= $signed(($unsigned(({reg56} ?
                      wire45[(3'h5):(1'h0)] : (7'h41))) ?
                  $unsigned(((reg53 * reg63) != reg56)) : $unsigned(reg60)));
            end
        end
    end
  assign wire64 = {($unsigned(reg53[(2'h2):(2'h2)]) ~^ (-wire36))};
  assign wire65 = (^wire38[(1'h1):(1'h1)]);
  assign wire66 = wire39;
  assign wire67 = ($unsigned(((!(reg50 | (8'ha7))) || $signed({wire43,
                      reg57}))) ^ ($unsigned(reg62) ^~ {$signed($signed(wire65))}));
endmodule

module module126
#(parameter param192 = {({(((8'hae) ? (8'ha7) : (8'hb3)) <<< (^~(8'hb9)))} ^ (|(|{(8'ha6)})))})
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h2cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire131;
  input wire signed [(4'hb):(1'h0)] wire130;
  input wire signed [(3'h7):(1'h0)] wire129;
  input wire [(5'h15):(1'h0)] wire128;
  input wire signed [(5'h15):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire191;
  wire signed [(5'h13):(1'h0)] wire190;
  wire [(5'h11):(1'h0)] wire189;
  wire [(4'hb):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire187;
  wire signed [(4'hd):(1'h0)] wire163;
  wire [(3'h5):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  reg signed [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg [(5'h10):(1'h0)] reg180 = (1'h0);
  reg [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(4'h9):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg168 = (1'h0);
  reg [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg140 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire163,
                 wire162,
                 wire144,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire132 = {(|wire129),
                       ((wire130 == ((wire128 ? wire129 : wire130) ?
                           $unsigned(wire128) : $unsigned(wire131))) > (wire131 ?
                           wire128 : ((wire128 >>> wire131) * (-(8'hae)))))};
  assign wire133 = $signed((^~wire129[(3'h5):(1'h1)]));
  assign wire134 = $signed(((wire129 ^~ $unsigned((wire131 ?
                           wire130 : wire130))) ?
                       ((+(wire132 < (8'ha6))) >= ((wire131 ?
                           wire133 : wire131) == (wire133 ?
                           (8'haf) : wire128))) : {$unsigned({wire128}),
                           wire128}));
  assign wire135 = (~|wire134[(4'ha):(2'h2)]);
  assign wire136 = wire134;
  assign wire137 = (8'had);
  assign wire138 = (|$signed(wire130[(3'h6):(2'h3)]));
  assign wire139 = $signed(({wire131[(2'h3):(2'h3)]} + wire135));
  always
    @(posedge clk) begin
      if ({($unsigned($signed(((8'ha1) ?
              (8'hb5) : wire138))) ^~ wire133[(1'h0):(1'h0)]),
          $unsigned($signed($unsigned((wire139 ? wire135 : wire138))))})
        begin
          reg140 <= ($unsigned((8'h9f)) && $unsigned((wire138[(4'hf):(4'hf)] ?
              {wire132, wire130[(4'ha):(3'h5)]} : (^(wire132 ?
                  wire132 : wire129)))));
        end
      else
        begin
          if (wire138[(2'h3):(1'h0)])
            begin
              reg140 <= $unsigned($signed($signed($signed(wire127[(2'h3):(1'h0)]))));
              reg141 <= wire134;
              reg142 <= wire128[(2'h3):(2'h2)];
            end
          else
            begin
              reg140 <= $signed(wire128[(4'hc):(4'h8)]);
              reg141 <= wire134[(4'h9):(4'h8)];
            end
        end
      reg143 <= ({reg141[(5'h12):(4'hf)], (7'h43)} ?
          wire135 : wire136[(3'h6):(3'h5)]);
    end
  assign wire144 = $unsigned((!wire134[(4'hd):(3'h6)]));
  always
    @(posedge clk) begin
      if ($signed(wire129[(2'h2):(1'h0)]))
        begin
          reg145 <= (((wire137[(4'hf):(3'h5)] != wire131[(2'h3):(2'h3)]) * reg141) ?
              (((~&{(8'hb2)}) <<< $signed((reg141 * reg142))) <<< ($signed($signed(wire135)) ?
                  {((7'h43) > wire134)} : $signed($signed(reg140)))) : reg140[(4'h9):(1'h1)]);
        end
      else
        begin
          reg145 <= $unsigned((wire128[(5'h10):(3'h6)] ?
              wire138 : ((+$unsigned(wire127)) ?
                  ((wire127 ^ wire128) | reg140) : ((wire132 ~^ (8'h9d)) != $signed(wire128)))));
          reg146 <= $unsigned(reg140);
          reg147 <= ({($unsigned(wire136[(4'h9):(3'h7)]) << ((wire131 * wire134) ?
                  $unsigned(wire131) : $unsigned((8'hb2))))} ^ $unsigned(wire144[(4'h9):(4'h8)]));
        end
      reg148 <= $signed((~|(wire136[(4'ha):(1'h1)] ? (-(~wire133)) : reg141)));
      reg149 <= {reg148[(4'h8):(3'h4)]};
    end
  always
    @(posedge clk) begin
      reg150 <= $signed({$signed((wire128 ? reg147 : (8'hb5))),
          $unsigned(wire144)});
      if (($signed((reg146 ?
          (reg141 ?
              $unsigned(reg143) : $unsigned(wire134)) : wire129[(1'h0):(1'h0)])) <<< (($signed(reg141) ?
          (!$unsigned(wire128)) : (wire135[(3'h4):(2'h3)] >>> {(7'h41),
              (8'hb9)})) <<< wire144)))
        begin
          reg151 <= {{wire137, (!$unsigned($signed(reg146)))},
              wire133[(2'h2):(2'h2)]};
          reg152 <= $signed($signed(((wire139 >>> $unsigned((8'haa))) || (-$signed(wire133)))));
        end
      else
        begin
          reg151 <= (~(|$unsigned(wire139[(3'h4):(2'h2)])));
          if ((((((!wire135) << (reg146 != reg150)) << {(~|wire144),
                  reg140[(2'h3):(1'h0)]}) ^ reg141[(4'h9):(3'h4)]) ?
              (-$signed(reg147)) : ((~{((8'ha5) ^ wire131)}) ?
                  (((wire132 * reg142) | (~|wire130)) ?
                      (~|$unsigned((8'h9e))) : $unsigned($unsigned(reg152))) : $signed(($unsigned(wire134) ?
                      (reg148 ? wire133 : reg146) : (~^wire139))))))
            begin
              reg152 <= wire129;
            end
          else
            begin
              reg152 <= ($signed($signed(wire138[(3'h4):(2'h2)])) ?
                  (~^$signed((~|(reg147 == (8'haa))))) : $unsigned((((reg143 <<< wire134) ?
                          (reg151 <<< wire144) : $signed(wire133)) ?
                      $unsigned((reg151 ^~ wire127)) : (+reg151[(2'h3):(2'h3)]))));
              reg153 <= $unsigned({$signed(wire134),
                  (($signed(reg150) ? reg152 : wire127) ?
                      wire134[(3'h5):(1'h0)] : $unsigned(wire138[(3'h5):(3'h5)]))});
              reg154 <= (~$unsigned(reg152[(2'h3):(2'h2)]));
              reg155 <= (+((($unsigned(wire135) ? wire139 : (~reg151)) ?
                  (~|$unsigned(reg150)) : reg154) >> reg142));
            end
          reg156 <= wire135[(1'h1):(1'h0)];
          reg157 <= reg154;
        end
      if (reg155[(4'h9):(3'h4)])
        begin
          reg158 <= (wire134 >>> (|(wire131 ?
              $unsigned((reg145 - wire137)) : reg154[(1'h1):(1'h0)])));
          reg159 <= reg154;
          reg160 <= ($signed((^((^reg153) ?
              (reg146 >> wire130) : {wire130,
                  wire144}))) >>> (($unsigned((&wire135)) ?
                  (~$signed(wire131)) : $signed(wire133)) ?
              wire134[(4'hf):(2'h3)] : $unsigned(((wire128 <= wire132) ?
                  wire132[(2'h3):(2'h3)] : reg142))));
        end
      else
        begin
          reg158 <= (^$unsigned(({(reg154 ? reg143 : reg159)} >> wire130)));
          reg159 <= $signed((|reg147));
          reg160 <= $unsigned($unsigned((wire144 ?
              (|(~&wire139)) : wire134[(4'h8):(1'h0)])));
        end
      reg161 <= (^~$signed(($signed((^(8'h9c))) ?
          reg154 : (^~(reg151 ? (8'hb9) : reg150)))));
    end
  assign wire162 = reg143[(3'h5):(1'h1)];
  assign wire163 = $signed(($signed(wire132) < ($unsigned(reg153) <<< $unsigned($unsigned(reg160)))));
  always
    @(posedge clk) begin
      if ((reg140 ? reg156[(3'h6):(2'h2)] : $signed((8'ha6))))
        begin
          reg164 <= $unsigned({$unsigned(reg151[(1'h0):(1'h0)])});
          reg165 <= $signed(($signed($unsigned(wire127[(2'h3):(2'h3)])) || {($signed(wire131) >> (+reg153)),
              {$unsigned(wire163)}}));
          if ((reg146[(2'h2):(2'h2)] ?
              wire144 : ((reg147 ?
                  $unsigned((reg150 << reg156)) : $signed($signed((7'h42)))) > wire133[(3'h4):(2'h3)])))
            begin
              reg166 <= (~{$unsigned(wire137[(3'h6):(2'h3)])});
              reg167 <= $unsigned((reg149[(1'h1):(1'h1)] | {(wire144 != $unsigned(reg159)),
                  (wire129 ?
                      (wire162 ? reg149 : wire132) : (reg147 && (8'hb9)))}));
              reg168 <= {(reg164[(4'h9):(1'h0)] ?
                      reg143[(2'h2):(1'h0)] : (&((&(7'h43)) * wire128)))};
              reg169 <= (-wire133[(1'h1):(1'h0)]);
              reg170 <= $unsigned(wire163);
            end
          else
            begin
              reg166 <= ($unsigned($unsigned(reg159[(4'h8):(3'h6)])) > $signed($signed(((reg150 ?
                  wire137 : (8'hb8)) + (wire136 ? reg161 : reg158)))));
              reg167 <= reg143;
            end
        end
      else
        begin
          if ($unsigned(reg152))
            begin
              reg164 <= wire127[(5'h14):(2'h2)];
              reg165 <= $signed($signed(((7'h41) >>> $signed(wire162[(3'h5):(3'h5)]))));
              reg166 <= $unsigned(reg143);
              reg167 <= wire129[(2'h3):(2'h2)];
            end
          else
            begin
              reg164 <= $signed({reg167, (~$unsigned(wire133[(2'h2):(2'h2)]))});
              reg165 <= $unsigned((^~wire133));
              reg166 <= $signed({(wire136[(3'h5):(2'h3)] ?
                      reg150[(3'h7):(3'h7)] : reg170[(5'h12):(4'hc)])});
              reg167 <= {$unsigned(reg149)};
            end
          reg168 <= ((({(8'hbe), ((8'haa) ^ reg159)} == $signed((reg149 ?
              reg157 : reg157))) >>> ($unsigned(wire135[(2'h3):(2'h3)]) ?
              ((reg157 && reg147) <= {reg159}) : (~^reg155[(1'h1):(1'h0)]))) - wire137[(4'hf):(1'h0)]);
          reg169 <= (&$unsigned((reg159 ?
              (reg141[(1'h0):(1'h0)] == (wire137 ?
                  wire127 : reg167)) : ({reg150, (8'hae)} ?
                  $unsigned(reg157) : wire135[(2'h2):(1'h0)]))));
          if (reg142)
            begin
              reg170 <= wire132[(2'h3):(1'h1)];
            end
          else
            begin
              reg170 <= $unsigned(($signed((reg160[(3'h7):(3'h7)] == (wire133 ^ wire134))) >= ((reg143 ^~ (reg157 || wire133)) ?
                  wire162 : (reg151 & (reg165 ? reg161 : wire144)))));
              reg171 <= {reg149[(1'h0):(1'h0)],
                  (reg156[(4'hf):(4'hb)] ?
                      {$unsigned($unsigned(wire132)),
                          reg145} : ($signed(reg164) ^ (reg159[(4'hb):(4'ha)] ?
                          (^reg156) : wire162[(1'h1):(1'h0)])))};
              reg172 <= (reg167 ?
                  (reg149 > (&$signed((~wire127)))) : $signed((~&reg152[(1'h1):(1'h1)])));
              reg173 <= $unsigned($unsigned($signed((-((8'hb7) ?
                  reg154 : reg146)))));
            end
        end
      reg174 <= ((reg145 ?
          {reg161[(1'h0):(1'h0)], reg169} : (8'ha7)) + ($signed(reg173) ?
          $signed(wire134) : wire136));
      reg175 <= reg169;
      if ((~&(^~$unsigned(wire162))))
        begin
          reg176 <= (^~reg173[(2'h2):(2'h2)]);
          reg177 <= (reg147[(3'h6):(3'h4)] ?
              $signed($unsigned(wire132)) : reg150);
          reg178 <= {((+$signed((^~reg158))) > $signed((^~$signed(reg145))))};
        end
      else
        begin
          reg176 <= $unsigned(reg167[(5'h10):(4'he)]);
          if ($unsigned({$signed(wire130[(4'hb):(4'h8)])}))
            begin
              reg177 <= {$unsigned({$signed((^(8'h9f)))}),
                  $unsigned(reg167[(4'hc):(3'h4)])};
              reg178 <= $unsigned((~&{{$signed(reg177)}}));
            end
          else
            begin
              reg177 <= (~$unsigned(({(|reg141), (!(8'haf))} ?
                  reg141[(5'h13):(4'hb)] : (!(&reg160)))));
            end
          reg179 <= $unsigned(reg157[(1'h0):(1'h0)]);
          if ((($unsigned((^~(wire132 ? reg152 : reg174))) & $signed(((reg176 ?
                  reg143 : reg146) > (&reg164)))) ?
              $signed(reg174) : (~^{wire135[(2'h2):(1'h1)]})))
            begin
              reg180 <= ({(~((reg177 ^ wire135) >= (~|reg147))),
                      {wire163[(2'h3):(1'h1)]}} ?
                  $unsigned(wire144) : ({$unsigned(reg161),
                          ($signed(wire132) ~^ reg145[(3'h6):(3'h4)])} ?
                      $unsigned((+$unsigned(reg147))) : reg176));
              reg181 <= (reg160[(3'h7):(3'h7)] ?
                  (8'hb7) : reg158[(4'hc):(2'h3)]);
              reg182 <= $unsigned({reg146[(2'h2):(1'h0)],
                  reg154[(2'h2):(1'h1)]});
            end
          else
            begin
              reg180 <= ($signed($signed(wire137)) ?
                  reg171[(1'h0):(1'h0)] : ({wire162[(3'h4):(2'h3)]} ?
                      $signed({$unsigned(wire129)}) : {$unsigned(((8'hac) ?
                              reg165 : reg156))}));
              reg181 <= (reg161 ? wire129 : $signed(reg182));
              reg182 <= $unsigned(reg143);
              reg183 <= (^(wire163[(4'hc):(4'ha)] & ($signed(wire133[(3'h5):(2'h3)]) ?
                  (reg177[(1'h1):(1'h0)] ?
                      (~&reg181) : $signed(reg154)) : $signed(reg140))));
              reg184 <= reg161;
            end
          reg185 <= $signed($unsigned(reg179));
        end
      reg186 <= reg161[(1'h1):(1'h1)];
    end
  assign wire187 = ((reg151[(4'h8):(3'h6)] ?
                       (^(&reg186[(1'h1):(1'h0)])) : {reg148[(3'h5):(3'h5)],
                           $signed($unsigned(wire134))}) | wire144);
  assign wire188 = reg179[(1'h0):(1'h0)];
  assign wire189 = (((reg181 ?
                           $signed({(8'ha0), reg164}) : reg146[(4'hc):(4'hb)]) ?
                       $unsigned(reg185) : reg181) ^ ((|wire163[(2'h2):(2'h2)]) ?
                       (&$unsigned($signed(reg186))) : $signed(reg176[(1'h0):(1'h0)])));
  assign wire190 = wire136[(3'h6):(2'h2)];
  assign wire191 = reg183[(3'h6):(3'h5)];
endmodule

module module92
#(parameter param119 = ((~|(((~^(8'ha0)) >= ((8'h9f) ? (8'ha1) : (8'ha2))) ? ((&(8'ha3)) ? ((8'hbc) ? (8'hae) : (8'hbc)) : ((8'ha1) ? (8'hb9) : (8'hbc))) : {(~|(8'hbb)), (~^(8'ha9))})) ? (!{(((8'h9d) <= (8'ha0)) ? ((8'ha8) ? (8'hb7) : (8'had)) : {(8'haf)})}) : (((~&{(8'hbd)}) ~^ (8'hbb)) || ((((8'hac) * (8'hb9)) ? ((8'hb1) ? (8'hb2) : (8'ha9)) : (~|(7'h43))) ? ({(8'hba), (8'hbd)} <<< ((8'hb2) - (8'ha0))) : (((8'hbb) ? (8'ha2) : (8'hb0)) ? (-(8'ha0)) : ((8'had) - (8'ha4)))))))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire [(4'ha):(1'h0)] wire94;
  input wire signed [(4'h9):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg110,
                 reg109,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire97 = (wire95[(3'h5):(2'h2)] ^~ wire93);
  assign wire98 = $unsigned((|{wire94, (~^(wire93 != wire94))}));
  assign wire99 = ((^({(wire98 ? wire95 : wire97)} <<< ((wire93 ?
                      wire94 : wire95) ^~ wire98[(1'h0):(1'h0)]))) <= $signed(wire98));
  assign wire100 = wire96[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg101 <= wire98;
      reg102 <= (8'ha7);
    end
  assign wire103 = (!$unsigned($unsigned(wire93)));
  assign wire104 = ({$unsigned($signed((reg101 + wire95))),
                       (({wire95} ?
                           (wire100 ?
                               wire98 : wire93) : $signed(wire94)) >= ({reg101} ?
                           wire93 : (wire99 >> (8'hb6))))} ~^ (({reg102} ?
                       $unsigned(wire98[(1'h1):(1'h0)]) : (&$signed(wire98))) << wire99));
  assign wire105 = $signed((reg102 ? wire99 : (-wire103)));
  assign wire106 = ($unsigned(wire95[(4'h8):(1'h0)]) <= $unsigned($signed(wire95)));
  assign wire107 = (wire100 != wire100[(4'ha):(3'h7)]);
  assign wire108 = (-($unsigned(wire96[(1'h0):(1'h0)]) ?
                       (wire94[(4'h8):(3'h4)] > ((~|(8'hb0)) ?
                           wire95 : $signed(wire106))) : (~^({wire106,
                           wire93} ^ (wire99 ? wire99 : wire103)))));
  always
    @(posedge clk) begin
      reg109 <= {(wire95[(1'h0):(1'h0)] - (-$unsigned((^~(8'ha6)))))};
      reg110 <= (wire97[(2'h2):(1'h1)] ?
          wire105 : $signed($signed($signed({wire96}))));
    end
  assign wire111 = ((reg110 ?
                           (wire98[(3'h4):(2'h2)] ?
                               wire107 : (~(reg101 ?
                                   wire97 : wire103))) : $signed(reg101)) ?
                       {{$signed($unsigned(wire104))},
                           $unsigned(wire103[(4'ha):(4'h8)])} : $signed(((&(|reg110)) ?
                           ({wire107, (8'ha0)} ?
                               wire108[(1'h0):(1'h0)] : (wire106 ?
                                   wire97 : wire94)) : ({wire106} ?
                               (wire97 ? (7'h43) : wire104) : wire108))));
  assign wire112 = (~^wire95);
  assign wire113 = ((wire97 ?
                       ($unsigned($unsigned(wire107)) ?
                           {(wire111 ?
                                   reg102 : wire105)} : $unsigned(wire99[(4'h8):(2'h3)])) : ({$unsigned(wire99),
                           (reg102 ^~ wire111)} == $unsigned((wire111 & (8'hbd))))) && ((^~(wire105 ?
                       (~|reg101) : (wire100 ?
                           (8'hb7) : wire96))) << (+$signed($signed((8'had))))));
  assign wire114 = (wire111[(4'hf):(4'he)] ?
                       ($unsigned(($unsigned(wire94) - (reg101 <= wire97))) ?
                           (wire93[(3'h7):(1'h0)] >= (wire108 ?
                               wire96 : $unsigned(wire97))) : $signed({(reg102 ?
                                   wire93 : (8'h9d))})) : wire103);
  assign wire115 = wire106;
  assign wire116 = $unsigned(wire108);
  assign wire117 = (8'hb2);
  assign wire118 = (((wire94 > $unsigned((wire115 ? wire103 : wire116))) ?
                       ({(wire93 - wire95), (^~wire93)} ?
                           reg101 : (!reg110[(3'h6):(2'h2)])) : wire96) + wire103[(4'h9):(4'h8)]);
endmodule

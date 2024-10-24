module top
#(parameter param95 = (|(((^(+(8'hbe))) ? (((8'ha8) || (8'hb2)) && ((8'had) || (8'h9f))) : {(~^(7'h42)), {(7'h44)}}) ? (^(((8'ha2) ? (8'hb8) : (7'h41)) ^~ (8'h9f))) : ((-(8'hbf)) ? (!((8'h9f) * (8'ha6))) : {{(8'hb7), (8'haf)}}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire67;
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  assign y = {wire86,
                 wire71,
                 wire70,
                 wire69,
                 wire4,
                 wire5,
                 wire6,
                 wire67,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
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
  assign wire4 = ({wire1} ?
                     ($unsigned(($signed(wire0) < ((8'hba) ?
                         wire1 : (8'ha7)))) ~^ (8'hb5)) : wire3[(4'h9):(3'h4)]);
  assign wire5 = (7'h44);
  assign wire6 = $unsigned($unsigned($unsigned((-wire4[(4'hc):(4'hb)]))));
  module7 #() modinst68 (.wire9(wire3), .wire12(wire2), .y(wire67), .wire10(wire0), .wire8(wire4), .clk(clk), .wire11(wire6));
  assign wire69 = (wire3[(4'h8):(3'h4)] ?
                      wire2[(4'hb):(4'h9)] : (wire4 <<< ($unsigned((8'ha2)) & ($unsigned(wire6) ?
                          $unsigned((8'ha3)) : wire4[(1'h1):(1'h0)]))));
  assign wire70 = wire1[(5'h12):(1'h1)];
  assign wire71 = wire0;
  always
    @(posedge clk) begin
      if (((wire67[(4'h8):(3'h4)] ?
              wire70 : (wire5 ?
                  {(|wire70), (&wire67)} : wire71[(2'h2):(1'h0)])) ?
          wire70 : {$signed((&$unsigned(wire70)))}))
        begin
          if (($unsigned($signed(wire67[(4'h8):(4'h8)])) ?
              (~|(wire6 ?
                  ((wire67 < wire71) ?
                      (8'h9e) : (wire3 >>> wire69)) : ($unsigned((8'hbf)) << (8'had)))) : wire4))
            begin
              reg72 <= ($signed((wire3 ?
                      ((~wire5) < $unsigned((7'h42))) : ($unsigned(wire69) ?
                          wire2[(5'h10):(4'h8)] : $unsigned(wire69)))) ?
                  (($signed(wire5) + wire5[(3'h4):(1'h0)]) ?
                      wire4[(1'h1):(1'h0)] : $signed(wire6)) : $unsigned($signed(wire6[(3'h7):(1'h1)])));
              reg73 <= {(7'h40),
                  (((-wire3[(4'ha):(4'h8)]) ?
                      (wire67 ?
                          (reg72 < wire67) : wire0) : (7'h43)) && (wire3 >> wire71[(1'h0):(1'h0)]))};
              reg74 <= (8'hb7);
              reg75 <= (reg72[(3'h6):(1'h0)] ?
                  {(^(wire3 >> wire6[(3'h6):(1'h1)])),
                      wire1} : $unsigned($signed($signed($signed(wire4)))));
              reg76 <= reg72;
            end
          else
            begin
              reg72 <= wire2[(4'h8):(3'h7)];
            end
          reg77 <= $signed((~^(~wire2[(3'h5):(3'h4)])));
          reg78 <= (8'hb2);
        end
      else
        begin
          reg72 <= $unsigned((8'had));
        end
      reg79 <= (~|$signed(($signed(((8'hb3) * reg77)) ~^ wire69[(2'h2):(1'h1)])));
      reg80 <= ($signed((reg78[(2'h3):(2'h2)] < $signed((wire5 ?
          wire71 : wire71)))) <= $signed($unsigned((wire2 ?
          (reg77 + reg72) : (reg72 ~^ reg76)))));
      if (wire69[(1'h1):(1'h1)])
        begin
          reg81 <= wire1;
        end
      else
        begin
          if ({$unsigned(($unsigned((^wire4)) ? reg72[(3'h5):(1'h0)] : reg75))})
            begin
              reg81 <= reg81;
            end
          else
            begin
              reg81 <= wire3;
            end
          reg82 <= (^~(wire69[(2'h2):(1'h1)] && (~|($unsigned(wire71) ?
              (~^wire0) : (|wire69)))));
          reg83 <= $unsigned($unsigned($signed(wire69)));
          reg84 <= $signed(($signed(((!reg82) ~^ wire1[(5'h10):(4'ha)])) ?
              ({(wire70 ? wire3 : reg72), ((8'hae) ? reg78 : reg76)} ?
                  (wire70 - wire6[(3'h7):(3'h4)]) : wire1[(5'h13):(5'h11)]) : wire1));
          reg85 <= ((~|{(~&reg72[(1'h1):(1'h0)])}) ?
              ((|wire69[(2'h2):(1'h0)]) ?
                  $unsigned($signed(reg83)) : (~|$signed({wire1,
                      reg75}))) : ((-(-wire67[(4'ha):(4'h8)])) >> (wire3 != (|reg82[(2'h3):(1'h1)]))));
        end
    end
  assign wire86 = $signed($signed($unsigned((^~wire3[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      if (((wire70 ?
              (((reg75 ? wire0 : reg82) ?
                  $signed((8'haf)) : (8'hbb)) >= (|wire69[(2'h2):(1'h0)])) : (~$unsigned($unsigned(wire4)))) ?
          wire1[(3'h5):(2'h2)] : ({reg80} >= reg73[(3'h5):(2'h3)])))
        begin
          if (wire86)
            begin
              reg87 <= (reg75 ^~ wire69);
              reg88 <= wire71;
              reg89 <= reg75;
              reg90 <= $signed(reg78);
              reg91 <= ((-$unsigned(reg76)) == ((^~(reg87[(5'h14):(4'h8)] != reg78)) ?
                  wire67[(4'hb):(4'h9)] : {reg88[(2'h3):(2'h2)]}));
            end
          else
            begin
              reg87 <= {(((~(7'h40)) + (reg77 ? reg90 : $unsigned(reg91))) ?
                      (($unsigned(reg80) ?
                          reg74 : (wire71 == wire3)) < $unsigned($signed((8'ha1)))) : reg73[(3'h7):(3'h5)])};
            end
          reg92 <= reg91[(4'h8):(1'h1)];
        end
      else
        begin
          reg87 <= reg89[(2'h3):(1'h0)];
          reg88 <= $unsigned(($unsigned($signed(wire6)) != ($signed($signed(wire70)) < wire6)));
          reg89 <= {$signed($signed(($signed(wire1) << (reg77 ?
                  reg88 : reg83)))),
              (reg85[(4'h9):(1'h0)] ?
                  ($signed(reg89[(4'ha):(3'h7)]) ?
                      (|(reg85 != wire69)) : {$unsigned(wire69)}) : $signed(wire69))};
          reg90 <= (+{reg72});
          if (((-((reg78[(3'h7):(2'h2)] < (^~(8'hba))) ?
              wire86 : ((reg73 ? reg90 : reg76) ?
                  $unsigned(reg79) : (+reg87)))) | (-{(((7'h43) <= reg79) << $unsigned(wire0)),
              {(8'haa)}})))
            begin
              reg91 <= {$unsigned(($unsigned((reg72 >= reg81)) ?
                      (reg77[(4'hb):(4'ha)] ?
                          $signed(reg79) : (+reg78)) : {(~(8'haa)),
                          (reg89 - reg75)})),
                  $signed($unsigned($unsigned(reg90[(4'ha):(1'h1)])))};
              reg92 <= $signed({(reg75 != (~&{reg90, reg72})), $signed(wire2)});
              reg93 <= ({$signed(wire4[(3'h7):(1'h0)]),
                  $unsigned(reg90[(3'h5):(2'h2)])} >= $unsigned($signed($signed({(8'ha9),
                  reg79}))));
            end
          else
            begin
              reg91 <= $signed(((~^((reg88 | reg88) << $unsigned(reg87))) ~^ ({reg90[(2'h2):(1'h0)]} ^ ($unsigned(wire0) << $signed(wire4)))));
              reg92 <= $unsigned((((^~reg79[(3'h5):(3'h4)]) >>> reg88[(2'h2):(2'h2)]) ?
                  ($unsigned((reg87 & reg91)) ?
                      ((wire67 <<< reg77) ^ reg89) : wire71) : $signed(($unsigned(reg83) ?
                      $signed(reg75) : (~^wire86)))));
            end
        end
      reg94 <= ((+$unsigned({reg78,
          (wire86 ? (8'h9f) : reg82)})) * (~^$unsigned(reg80[(3'h6):(2'h2)])));
    end
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire61;
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire39,
                 wire26,
                 wire13,
                 wire41,
                 wire42,
                 wire43,
                 wire61,
                 reg25,
                 reg24,
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
                 (1'h0)};
  assign wire13 = ($unsigned((~((wire12 ? (8'ha1) : wire11) ?
                      (wire12 ?
                          wire11 : (8'ha2)) : wire8))) ^ wire12[(4'ha):(3'h7)]);
  always
    @(posedge clk) begin
      reg14 <= (7'h42);
      reg15 <= {wire13[(1'h1):(1'h0)], reg14};
      if ((wire12 ?
          {$unsigned(reg14)} : $unsigned(((!reg15[(3'h4):(2'h3)]) == ($signed(wire8) ?
              $signed(wire12) : wire13)))))
        begin
          reg16 <= wire10[(4'ha):(4'ha)];
          reg17 <= wire8[(5'h13):(3'h7)];
          if (wire9)
            begin
              reg18 <= wire9[(4'ha):(2'h3)];
              reg19 <= reg15;
              reg20 <= ({(&((wire8 >= reg17) ? wire11 : wire8))} ?
                  (((7'h41) ?
                      {(wire8 >> wire12),
                          ((8'hb2) || reg15)} : $unsigned((~^reg19))) < (reg19 ?
                      $signed(wire13) : ($unsigned((7'h43)) ?
                          ((7'h44) >>> wire12) : reg14[(3'h6):(2'h2)]))) : (reg16[(3'h4):(2'h3)] || (($unsigned(wire13) ?
                      wire13 : (reg17 ?
                          wire10 : reg16)) > wire13[(1'h0):(1'h0)])));
              reg21 <= $signed(wire11);
            end
          else
            begin
              reg18 <= $signed($signed(($signed((&(7'h40))) ?
                  $unsigned(reg16[(3'h6):(1'h0)]) : (^$unsigned(reg18)))));
              reg19 <= $unsigned((wire12[(1'h1):(1'h1)] ?
                  reg17[(3'h7):(1'h1)] : wire12));
              reg20 <= (-$signed((&$unsigned({(8'hb9)}))));
              reg21 <= (($unsigned(((reg14 ? reg15 : (8'hb4)) ?
                  $unsigned(reg18) : $unsigned(reg20))) >> wire13) <<< (wire12[(3'h4):(1'h1)] ?
                  wire9[(4'hb):(3'h7)] : ($unsigned($signed((8'hbc))) ?
                      {((8'ha4) | reg16)} : wire13)));
            end
        end
      else
        begin
          reg16 <= ($signed(((8'hb7) ?
              (wire8 >> {reg21}) : ((reg19 ? reg18 : wire13) ?
                  (wire10 ?
                      wire11 : (8'hb1)) : $signed(wire11)))) | $unsigned({(8'hb7),
              (wire10 & $unsigned(reg15))}));
          if ((~^wire12))
            begin
              reg17 <= $unsigned(((^{$signed(reg17)}) >> (^$signed((|reg16)))));
              reg18 <= $signed(($signed({$unsigned(reg18)}) <<< (reg16 ?
                  (~|{wire10, wire11}) : $signed($unsigned(wire12)))));
            end
          else
            begin
              reg17 <= $signed(wire8);
              reg18 <= reg14[(4'hc):(4'ha)];
              reg19 <= $unsigned(reg21);
            end
          reg20 <= (^{{(|wire12[(5'h11):(2'h2)]), (|(wire11 ~^ (7'h44)))},
              (~&$signed($signed(reg16)))});
          reg21 <= $unsigned((reg16 >= ($unsigned(wire13) >>> wire11)));
        end
      if (reg15)
        begin
          reg22 <= reg21;
          reg23 <= reg15[(2'h2):(2'h2)];
        end
      else
        begin
          reg22 <= (~&$signed(({reg15, wire11[(4'hc):(1'h0)]} ?
              ($signed(reg22) ?
                  reg17[(3'h6):(1'h1)] : $signed(wire13)) : ((|wire11) >>> (wire13 + wire9)))));
        end
      if (reg15)
        begin
          if (({reg22[(4'ha):(1'h1)],
                  (((^~wire13) & $unsigned(reg14)) ?
                      (~$signed(reg21)) : $unsigned({(8'hbb)}))} ?
              $signed($unsigned((~^(^wire8)))) : (reg16[(2'h2):(1'h1)] && {$unsigned((|wire11))})))
            begin
              reg24 <= wire8[(4'hc):(1'h1)];
              reg25 <= reg14[(4'ha):(1'h0)];
            end
          else
            begin
              reg24 <= ($unsigned((reg17 ?
                  ($signed((8'hb3)) ?
                      ((8'had) | reg25) : reg18[(3'h7):(2'h2)]) : wire13)) ^~ ($unsigned(($unsigned(reg15) > (wire10 <= reg23))) | {$signed(wire9[(4'hb):(2'h3)]),
                  ((reg22 ? wire10 : wire10) >= wire13[(2'h2):(1'h1)])}));
            end
        end
      else
        begin
          reg24 <= {$signed((!wire9[(4'hb):(1'h0)]))};
          reg25 <= {(+(({reg15, reg24} & ((8'ha0) >= reg25)) ?
                  (~(reg23 ? reg25 : reg19)) : (~&(-reg23)))),
              ($unsigned({$unsigned(reg15)}) ?
                  reg23[(5'h11):(4'h8)] : $unsigned(((reg20 <<< reg16) ?
                      $unsigned(reg19) : (+wire13))))};
        end
    end
  assign wire26 = reg15;
  module27 #() modinst40 (wire39, clk, wire9, reg23, reg19, reg15, reg21);
  assign wire41 = reg23[(3'h6):(3'h5)];
  assign wire42 = reg16[(2'h2):(1'h1)];
  assign wire43 = reg21[(3'h5):(1'h0)];
  module44 #() modinst62 (.y(wire61), .wire47(reg24), .wire49(reg14), .clk(clk), .wire48(reg18), .wire45(reg21), .wire46(wire8));
  assign wire63 = (wire9[(1'h0):(1'h0)] ?
                      ((((reg20 ? reg20 : reg18) ~^ (reg23 ^ (8'hb3))) ?
                          wire11[(1'h0):(1'h0)] : {wire11[(4'hb):(1'h0)],
                              reg18[(2'h3):(2'h2)]}) != $signed(({wire42} ?
                          {wire26,
                              reg14} : $signed(wire61)))) : ((+wire12) <<< $unsigned((8'hba))));
  assign wire64 = (&($unsigned((wire13[(3'h4):(1'h1)] != (^~reg21))) * $signed(wire12)));
  assign wire65 = (reg20 - wire63);
  assign wire66 = $signed($signed(wire11));
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire49;
  input wire [(4'hd):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire50 = $unsigned($unsigned({wire46, $unsigned($unsigned(wire48))}));
  assign wire51 = $signed(($signed($signed((~&wire48))) ?
                      ((!(8'hb2)) ?
                          $signed($unsigned(wire49)) : (wire47[(4'hb):(1'h0)] >= $signed(wire48))) : wire45[(2'h2):(1'h1)]));
  assign wire52 = $signed({(8'haf)});
  always
    @(posedge clk) begin
      if ((wire51[(4'h8):(3'h6)] == wire51[(2'h3):(2'h2)]))
        begin
          reg53 <= wire50[(3'h5):(1'h1)];
          reg54 <= (wire45[(4'h8):(1'h0)] && (~^$unsigned((^~{wire47,
              reg53}))));
        end
      else
        begin
          reg53 <= (^~((($signed(wire45) >= (8'hb6)) ?
                  $signed((wire48 >> reg53)) : {(~&(8'ha1)), (!wire46)}) ?
              (($unsigned(wire52) ? wire52[(3'h5):(2'h2)] : $signed(reg54)) ?
                  (-$unsigned((7'h40))) : wire49) : {$unsigned({reg53,
                      (8'ha1)})}));
        end
      reg55 <= wire45[(1'h1):(1'h0)];
    end
  assign wire56 = $signed((~|reg54[(1'h0):(1'h0)]));
  assign wire57 = (wire52[(3'h7):(3'h6)] <= wire48);
  assign wire58 = (reg54 && $signed({wire51[(3'h7):(3'h6)]}));
  assign wire59 = (~^($unsigned((^~wire51[(4'h8):(3'h6)])) <<< wire48));
  assign wire60 = ((~^wire51) ?
                      {wire57[(2'h3):(1'h0)],
                          $unsigned((^{reg55}))} : wire49[(2'h3):(2'h3)]);
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire33;
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  assign y = {wire38, wire37, wire36, wire35, wire33, reg34, (1'h0)};
  assign wire33 = (^~$signed($unsigned($signed((~|wire28)))));
  always
    @(posedge clk) begin
      reg34 <= wire31;
    end
  assign wire35 = wire28[(4'h9):(2'h3)];
  assign wire36 = wire32[(2'h2):(1'h0)];
  assign wire37 = $signed((~|(!(wire33 ?
                      $signed((8'hb4)) : (wire32 != wire33)))));
  assign wire38 = (^wire33);
endmodule

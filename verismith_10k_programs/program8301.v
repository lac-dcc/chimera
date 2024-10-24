module top
#(parameter param97 = ((^{(((7'h40) < (8'haa)) ? (~(8'ha9)) : ((8'haa) ? (8'hb9) : (8'hab))), {(|(8'hb6)), ((8'hb4) || (8'hbf))}}) >= (+(|(8'hbf)))), 
parameter param98 = {(((param97 ? param97 : param97) ? param97 : {(~param97)}) ? ((+{(8'ha7), param97}) ? {param97} : (8'hae)) : (((param97 ? (8'hbc) : param97) ? (param97 && param97) : {param97, (8'hb0)}) ? ((param97 ? param97 : param97) ? (param97 << param97) : (param97 <<< param97)) : ((~^param97) <<< (param97 ? param97 : param97))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire62;
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  assign y = {wire96,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg82,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  module5 #() modinst63 (wire62, clk, wire2, wire4, wire1, wire3, wire0);
  assign wire64 = (~$unsigned({$signed({(8'haf)})}));
  assign wire65 = (^(wire3 ? $signed(wire64) : (~$unsigned($signed(wire4)))));
  assign wire66 = ($unsigned((&((wire4 ?
                      wire65 : wire65) + $unsigned(wire3)))) ^ wire3);
  always
    @(posedge clk) begin
      reg67 <= (wire62[(3'h5):(1'h0)] ? $unsigned(wire0) : wire62);
      reg68 <= wire2[(3'h7):(3'h5)];
      reg69 <= $unsigned(wire0);
      reg70 <= (wire0[(4'h9):(4'h8)] ?
          $unsigned({wire1}) : (!wire64[(1'h1):(1'h1)]));
      if (wire64)
        begin
          if ({(-(($signed((8'hb2)) << reg70) ?
                  (wire1[(3'h5):(1'h1)] >= wire3[(3'h4):(1'h1)]) : reg69[(4'hf):(4'h8)]))})
            begin
              reg71 <= {((((reg70 > wire66) - $unsigned((7'h43))) ?
                      wire64[(2'h2):(1'h0)] : (8'hbf)) && ((((8'hb2) || wire0) ?
                          (reg69 ? reg67 : reg68) : $signed((8'ha0))) ?
                      (reg68[(1'h0):(1'h0)] && (+reg70)) : (^~(wire1 <<< reg69)))),
                  reg68[(2'h2):(2'h2)]};
              reg72 <= $unsigned(wire64[(2'h3):(2'h2)]);
              reg73 <= ((~&{(^~wire1[(1'h0):(1'h0)])}) ?
                  wire62 : ($signed(((^(8'hb7)) <<< $signed(reg68))) && ($signed((reg67 ?
                          reg67 : wire2)) ?
                      ({wire4} ?
                          $unsigned((8'hb8)) : $signed(wire3)) : $signed($unsigned(wire4)))));
              reg74 <= $unsigned(((wire4 ?
                  ((wire2 && wire4) ?
                      wire66 : reg70) : (!((8'haa) ^ reg68))) | wire62));
            end
          else
            begin
              reg71 <= $signed(wire65);
              reg72 <= wire2;
              reg73 <= $signed((~&$unsigned(wire66)));
              reg74 <= (wire64[(2'h2):(1'h1)] ?
                  wire65 : $unsigned($signed(reg72[(4'h8):(3'h4)])));
              reg75 <= wire62[(3'h7):(3'h4)];
            end
          reg76 <= reg68;
        end
      else
        begin
          reg71 <= $signed((reg73 ?
              {{(~|reg67)}} : (-(reg68 ?
                  reg68[(1'h0):(1'h0)] : $signed(wire1)))));
          reg72 <= ((reg72 ?
                  ((-reg68) ? reg70 : reg71) : ($signed({(7'h40), wire62}) ?
                      reg70 : $signed((7'h42)))) ?
              (($unsigned($signed(wire65)) ?
                  reg68 : wire64[(3'h4):(3'h4)]) ~^ $unsigned(($signed(reg75) ?
                  (|(8'haa)) : $unsigned(reg75)))) : $signed($unsigned((^~$signed(wire4)))));
          reg73 <= (~|$unsigned($signed((-{reg76, wire0}))));
          reg74 <= ((|((~(&wire2)) + (reg67[(2'h2):(2'h2)] - (wire64 ?
              wire62 : reg76)))) << {((~^wire62[(3'h6):(3'h4)]) ?
                  ((wire66 | wire65) | {reg69}) : $signed((wire66 == reg67))),
              $signed(((wire65 && reg67) >>> (reg74 ? wire3 : reg76)))});
          if ({reg73, wire62[(1'h1):(1'h1)]})
            begin
              reg75 <= reg75;
              reg76 <= ($signed((^(~&wire4[(4'h8):(3'h4)]))) ?
                  $signed((~|$signed($unsigned((8'had))))) : $signed((($signed(wire65) >= (reg71 ?
                      reg74 : (8'hbf))) & wire4[(5'h12):(4'ha)])));
              reg77 <= (8'hb3);
              reg78 <= reg77[(3'h6):(2'h2)];
            end
          else
            begin
              reg75 <= $unsigned(reg74);
              reg76 <= {wire65[(3'h4):(2'h2)], (~^wire66)};
              reg77 <= reg69[(4'h8):(3'h6)];
              reg78 <= wire0;
              reg79 <= {$unsigned((reg71[(4'ha):(4'h8)] < wire62[(4'h9):(3'h7)]))};
            end
        end
    end
  assign wire80 = (~reg76[(4'he):(2'h3)]);
  assign wire81 = ((8'ha6) ^~ ((reg70[(4'hf):(4'hf)] - $signed({wire65,
                          reg67})) ?
                      wire3[(4'h9):(3'h6)] : (($signed(reg74) - (wire0 >= wire80)) ?
                          (|reg79[(1'h0):(1'h0)]) : (wire2[(4'ha):(3'h6)] ^~ {wire80}))));
  always
    @(posedge clk) begin
      reg82 <= {wire1[(4'h9):(4'h9)]};
    end
  assign wire83 = reg82[(2'h2):(1'h0)];
  assign wire84 = $unsigned((^~$unsigned($unsigned((reg70 ?
                      (8'hba) : (8'haa))))));
  assign wire85 = ($signed($unsigned((wire66[(1'h0):(1'h0)] ^~ (wire2 ?
                          wire4 : (8'hb8))))) ?
                      $unsigned((reg79[(1'h1):(1'h1)] ?
                          (|$unsigned(reg69)) : reg78[(1'h0):(1'h0)])) : $signed($unsigned((~(wire2 && wire0)))));
  assign wire86 = $signed($signed(wire66[(1'h1):(1'h1)]));
  assign wire87 = wire3;
  always
    @(posedge clk) begin
      reg88 <= $unsigned($signed((wire0[(1'h1):(1'h1)] ? wire86 : {wire81})));
      if ((~&wire64[(1'h0):(1'h0)]))
        begin
          reg89 <= $signed(reg72[(4'hb):(1'h1)]);
        end
      else
        begin
          reg89 <= $unsigned($signed((8'hbd)));
        end
      reg90 <= (!(8'haf));
      if (wire4[(4'h9):(4'h9)])
        begin
          reg91 <= (reg77[(4'hd):(2'h3)] >>> ((((-wire65) ?
              reg70 : $signed(wire83)) >>> ($signed(reg73) || (reg73 & (7'h40)))) != $signed(($signed(wire84) * {reg90}))));
          reg92 <= $signed((($unsigned($unsigned(reg68)) ~^ (~|(wire86 << reg73))) && wire64));
          reg93 <= $unsigned($unsigned({{$unsigned(wire0), $unsigned(wire81)},
              ($signed(reg72) ? (~reg67) : {reg68})}));
          reg94 <= reg74;
        end
      else
        begin
          reg91 <= reg70[(1'h0):(1'h0)];
          reg92 <= {(reg71 ?
                  reg68[(2'h2):(1'h0)] : ($unsigned(wire3) >= {(8'hb7),
                      wire81[(3'h7):(3'h6)]})),
              (reg67 ?
                  (8'hbe) : (reg82[(4'h9):(4'h9)] ?
                      (reg72 ? (wire0 ? wire1 : (8'haf)) : reg94) : (reg76 ?
                          (reg79 >= wire4) : wire80)))};
          reg93 <= reg90[(4'hc):(3'h4)];
        end
      reg95 <= reg68;
    end
  assign wire96 = wire86[(1'h0):(1'h0)];
endmodule

module module5
#(parameter param60 = {((((~&(8'ha6)) ? ((8'hb8) || (8'h9f)) : ((8'hba) ? (7'h41) : (8'ha2))) ? {((8'hb3) ? (8'h9f) : (8'ha3))} : {(!(8'hb3))}) <= ((!((8'hb4) <<< (8'ha6))) ? (((8'hbd) == (8'h9f)) + (~&(8'hb5))) : (((8'haf) << (7'h43)) << (|(8'hbd)))))}, 
parameter param61 = (~^param60))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire57;
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire59,
                 wire11,
                 wire12,
                 wire13,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire57,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = ((~|(((wire7 ? wire10 : wire9) - {wire6}) >> (wire7 ?
                      wire9[(3'h5):(2'h3)] : wire9[(4'hb):(3'h6)]))) >>> (+$unsigned(wire10)));
  assign wire12 = (+wire7);
  assign wire13 = $unsigned($unsigned(wire6));
  always
    @(posedge clk) begin
      reg14 <= ($signed(($signed(wire11[(1'h0):(1'h0)]) ?
          (~wire11) : $unsigned($unsigned(wire9)))) | $signed((8'hbc)));
      if ($signed((wire7 ?
          ((-(wire8 ? (8'hbc) : wire8)) != {wire13[(1'h0):(1'h0)],
              $signed(wire7)}) : wire7[(2'h3):(2'h3)])))
        begin
          reg15 <= $signed(({wire6[(2'h2):(2'h2)]} ?
              (|wire7[(3'h7):(2'h3)]) : $signed(wire8[(1'h1):(1'h0)])));
          reg16 <= ((!($unsigned((wire8 ? reg15 : wire8)) ?
                  ($signed(reg14) ?
                      {wire6,
                          (8'haa)} : $signed(reg15)) : wire13[(2'h3):(2'h2)])) ?
              (wire6[(1'h0):(1'h0)] ^ (&$signed(wire10))) : wire7);
          reg17 <= $unsigned($signed(reg14[(4'hc):(3'h5)]));
        end
      else
        begin
          reg15 <= wire6[(4'h8):(1'h0)];
          reg16 <= ((wire9 ?
              wire12[(4'hb):(3'h6)] : $unsigned($signed(reg16[(4'hc):(3'h5)]))) << reg15[(1'h1):(1'h0)]);
          reg17 <= ((wire8[(1'h0):(1'h0)] ?
              (&({wire12,
                  reg17} == wire10)) : (8'hbe)) != (^~$unsigned($signed(wire11[(1'h1):(1'h0)]))));
          if ((8'had))
            begin
              reg18 <= wire9[(2'h2):(1'h1)];
              reg19 <= (8'ha5);
              reg20 <= $unsigned(($unsigned(((~&wire9) <<< (~&wire7))) >> ({$unsigned(wire6)} ^~ (~((8'hbd) ?
                  (8'haa) : wire12)))));
            end
          else
            begin
              reg18 <= wire6[(2'h3):(2'h3)];
              reg19 <= (wire7[(4'hb):(3'h4)] ?
                  $signed(reg20) : $unsigned($signed(((reg16 >= reg20) >>> wire12[(1'h0):(1'h0)]))));
              reg20 <= ((+(8'hab)) | ($signed(wire6[(2'h2):(2'h2)]) - ($signed((~|wire9)) ?
                  (reg16[(4'hd):(3'h6)] >> (8'hb7)) : {reg20[(2'h3):(1'h0)],
                      wire8[(1'h0):(1'h0)]})));
              reg21 <= $signed(((^$signed((8'ha1))) ?
                  ($signed(reg15) - $signed((~&reg15))) : (+(8'hb5))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg22 <= $signed(((!$unsigned(wire6)) * $unsigned($unsigned($unsigned(reg19)))));
      reg23 <= (+(reg18 ? ((&reg18) >> $signed($signed((8'ha5)))) : {wire12}));
      reg24 <= $signed((8'hb4));
      if (reg17[(3'h7):(3'h7)])
        begin
          reg25 <= (reg20 ?
              $unsigned($signed(wire8)) : ($signed($unsigned((^reg24))) ^ (|(~$signed(wire7)))));
          reg26 <= wire13;
          reg27 <= $signed(reg19[(3'h7):(1'h1)]);
          reg28 <= (($signed($signed(reg20)) ?
                  reg14[(2'h3):(2'h2)] : {(~^(^~reg17)),
                      {(wire9 ? wire11 : wire10)}}) ?
              ($signed($unsigned((+(8'hba)))) && (wire12[(3'h6):(2'h2)] ?
                  (8'hb6) : (!reg22))) : reg17[(4'he):(4'hb)]);
          reg29 <= ((~|$signed((reg16[(1'h1):(1'h0)] >= reg18[(4'h8):(2'h3)]))) - ({((wire6 && wire7) && (wire10 ?
                  reg21 : reg28)),
              reg25[(3'h5):(1'h0)]} >= (-(reg27 ~^ reg21))));
        end
      else
        begin
          reg25 <= $signed(((&$signed(wire9[(2'h3):(1'h0)])) ?
              (+reg18) : (+$unsigned($unsigned(reg22)))));
          reg26 <= $unsigned({reg23[(2'h2):(2'h2)]});
          reg27 <= (8'hbb);
        end
      reg30 <= {(8'hbd),
          (reg14[(4'hd):(1'h1)] - $unsigned(($unsigned((8'hb5)) ?
              {reg24, reg20} : reg14[(5'h15):(3'h6)])))};
    end
  assign wire31 = {(8'h9f)};
  assign wire32 = ($signed(wire12) ? reg20[(4'hc):(3'h7)] : reg14);
  assign wire33 = (reg14[(5'h12):(5'h10)] ?
                      $unsigned((reg20[(4'hc):(3'h6)] ?
                          $signed((~|wire9)) : $signed((reg24 ?
                              wire9 : reg19)))) : ((^~(~(wire10 <= reg25))) ?
                          (wire13[(2'h2):(1'h0)] >= reg19[(4'h8):(1'h1)]) : (((~wire6) ?
                              (reg27 > (8'hb4)) : $signed(wire6)) || reg15)));
  assign wire34 = ((~&wire9) - ((reg27 ? reg14[(5'h12):(4'hb)] : (~reg27)) ?
                      (($unsigned(wire11) ?
                          (reg28 + reg25) : (wire31 ?
                              wire11 : reg29)) <<< $signed($unsigned((7'h41)))) : $unsigned(((reg20 & wire12) ?
                          (&reg18) : (reg30 >>> reg19)))));
  assign wire35 = {($unsigned(($signed(wire9) ^~ (reg18 < reg26))) ?
                          $signed({$signed(reg22),
                              $signed(wire11)}) : {wire10[(2'h3):(1'h1)]}),
                      ((~^wire32) != (~|reg14[(4'hd):(3'h5)]))};
  assign wire36 = wire11[(3'h5):(1'h1)];
  assign wire37 = (~$unsigned(((8'had) ? reg22 : $signed($signed(reg17)))));
  assign wire38 = $unsigned(wire9[(3'h6):(3'h4)]);
  assign wire39 = reg30[(3'h7):(3'h5)];
  assign wire40 = reg27;
  assign wire41 = (~wire11);
  assign wire42 = reg24;
  module43 #() modinst58 (wire57, clk, reg24, reg17, reg26, wire35, reg16);
  assign wire59 = reg14[(3'h4):(2'h2)];
endmodule

module module43
#(parameter param55 = ({{{(!(8'ha1))}}, ((~{(8'ha2)}) >= (^((8'hbc) ? (7'h40) : (8'ha0))))} >>> ({(-(8'ha8)), ({(7'h41), (8'h9d)} ? ((8'haf) ? (8'haf) : (8'had)) : ((7'h42) ? (8'h9c) : (8'ha4)))} ~^ {(~((8'hac) ? (8'hbd) : (8'hb7)))})), 
parameter param56 = ({param55, (~^(param55 << {param55}))} ? (^{((param55 ? param55 : param55) ^~ {param55, param55}), ({param55} ? (param55 + param55) : (&param55))}) : ((param55 != ({param55} ? (|param55) : {param55, param55})) ? (((!param55) != (param55 ? param55 : param55)) ? (!((8'hb5) - param55)) : {(param55 - param55)}) : (((-param55) - (param55 ? (7'h43) : param55)) & (+(param55 ? param55 : param55))))))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire48;
  input wire signed [(5'h11):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire [(4'hd):(1'h0)] wire45;
  input wire [(3'h6):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  assign y = {wire54, wire53, wire52, wire51, wire50, wire49, (1'h0)};
  assign wire49 = (wire46 - wire45);
  assign wire50 = $unsigned(($signed(((wire45 & wire44) ?
                      {wire44} : (wire45 ? wire48 : wire44))) <<< wire47));
  assign wire51 = $signed($unsigned($unsigned(wire47)));
  assign wire52 = wire45;
  assign wire53 = ((^~($signed({(7'h42), wire45}) ?
                      {wire52,
                          (wire49 ? wire47 : wire51)} : ((wire49 ~^ wire44) ?
                          $signed(wire48) : (wire48 - (8'hbf))))) ^ $signed($unsigned(wire45[(4'ha):(4'h9)])));
  assign wire54 = wire46;
endmodule

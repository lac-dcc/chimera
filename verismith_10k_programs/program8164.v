module top
#(parameter param206 = {((8'h9c) ? (&(|{(7'h43)})) : ((!((8'ha7) ? (8'ha8) : (8'ha0))) | {{(8'hb6), (8'hb1)}, ((8'hbe) ? (8'h9e) : (8'hbd))}))}, 
parameter param207 = (param206 ? ((~((param206 * param206) ? (param206 ? param206 : param206) : param206)) & param206) : (param206 <= param206)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h24d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire204;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  assign y = {wire204,
                 wire48,
                 wire45,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg47,
                 reg46,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = (~|$unsigned(wire1));
  assign wire5 = (^(wire3[(4'hb):(4'ha)] ?
                     $signed(wire3[(2'h3):(2'h2)]) : {$unsigned($signed(wire0)),
                         wire4}));
  assign wire6 = (((wire1 ?
                         (wire2 > $unsigned(wire1)) : $signed(wire5[(3'h5):(1'h1)])) - $signed((!(wire0 ?
                         (8'hae) : (8'hb7))))) ?
                     wire3 : wire4);
  assign wire7 = wire2;
  assign wire8 = $unsigned((8'h9f));
  assign wire9 = wire6[(4'he):(3'h5)];
  assign wire10 = (8'hb6);
  assign wire11 = (wire8 ?
                      $signed(wire5) : ({((wire1 - wire0) ?
                              (wire10 ?
                                  (8'ha5) : wire2) : (~&wire7))} != (~^(^~$unsigned(wire8)))));
  always
    @(posedge clk) begin
      if (wire3[(4'h9):(3'h4)])
        begin
          reg12 <= $signed((~|wire5));
        end
      else
        begin
          reg12 <= $unsigned((|((^wire11[(4'ha):(1'h0)]) ?
              ((wire7 ? wire9 : wire11) ?
                  $unsigned(wire8) : wire5[(4'ha):(3'h5)]) : $unsigned(wire6[(4'h9):(1'h1)]))));
          reg13 <= $signed($unsigned($signed(wire10[(4'hc):(3'h4)])));
        end
      reg14 <= (+(wire9 ?
          (&wire8[(4'he):(2'h3)]) : ($unsigned($signed((8'hbe))) > $signed((!wire8)))));
      if ($signed($unsigned(wire11)))
        begin
          reg15 <= (wire5[(4'ha):(3'h4)] ?
              $unsigned({($unsigned(reg12) ? reg13 : wire7),
                  ((+(8'hb1)) ? (^wire6) : wire6)}) : {{$signed(wire10)},
                  (-((wire2 < reg12) ? {wire8} : $unsigned((8'haf))))});
          reg16 <= (($unsigned((&(~&reg13))) == (8'ha9)) ?
              ($unsigned(wire4[(4'h8):(1'h0)]) ?
                  reg12 : (^~wire5)) : $signed((~^{(wire6 ? reg12 : wire1),
                  wire4[(3'h7):(2'h2)]})));
        end
      else
        begin
          reg15 <= wire9[(4'ha):(3'h5)];
          if ({$signed($unsigned($unsigned({wire3}))), wire4})
            begin
              reg16 <= $signed(({({wire7, reg13} ?
                      wire2 : wire0[(2'h3):(2'h2)])} <<< $unsigned(($signed(reg14) ?
                  $signed(wire11) : reg13[(4'he):(4'he)]))));
            end
          else
            begin
              reg16 <= wire9[(4'hf):(4'ha)];
              reg17 <= (($unsigned(wire8[(4'ha):(1'h1)]) ?
                  reg16[(2'h3):(2'h2)] : (($signed(wire11) & (wire5 >> wire7)) >>> $signed(wire3[(4'h9):(3'h6)]))) ~^ (+((8'ha2) != (^~{wire3,
                  wire8}))));
            end
        end
      reg18 <= (~&wire2[(3'h6):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg19 <= (|{($unsigned((~wire4)) ?
              (reg16[(3'h7):(2'h2)] ?
                  $signed((8'hb6)) : (~wire10)) : $signed(reg14))});
      reg20 <= $signed((8'ha1));
      if ($unsigned((^$signed((wire5[(1'h1):(1'h0)] ?
          $signed(wire2) : (+wire11))))))
        begin
          reg21 <= $signed(wire2[(3'h7):(3'h4)]);
          if ((reg18 < ($signed(wire1[(4'he):(3'h6)]) & $signed((7'h41)))))
            begin
              reg22 <= wire10[(3'h7):(3'h6)];
              reg23 <= (~&wire4[(3'h4):(2'h3)]);
              reg24 <= (wire11[(4'h8):(1'h0)] ?
                  wire0[(4'ha):(3'h6)] : $signed($signed($unsigned(reg22))));
            end
          else
            begin
              reg22 <= (8'h9c);
              reg23 <= {reg12};
              reg24 <= {(&({$signed(reg23)} > ((reg16 ^ reg14) ?
                      reg18 : reg19))),
                  wire8[(2'h2):(1'h0)]};
              reg25 <= $unsigned((|((wire10 ?
                  (~|(8'hab)) : {wire0,
                      (8'ha1)}) ^~ $unsigned($signed(wire9)))));
            end
          reg26 <= reg20[(3'h7):(1'h1)];
          if ($signed(wire0[(3'h6):(3'h4)]))
            begin
              reg27 <= ((wire0 ?
                      (-((reg17 ? (8'haa) : wire6) ?
                          $unsigned(wire0) : reg26[(3'h6):(1'h1)])) : wire4) ?
                  wire9 : (-$unsigned(wire1[(5'h13):(5'h13)])));
              reg28 <= $unsigned($unsigned({(~reg13)}));
              reg29 <= $signed((((+(^reg22)) ?
                  {$unsigned((8'ha8))} : reg28[(1'h1):(1'h1)]) != wire4[(4'h9):(3'h4)]));
              reg30 <= {wire10[(4'h9):(3'h4)]};
              reg31 <= $unsigned(reg27[(3'h5):(3'h5)]);
            end
          else
            begin
              reg27 <= reg17[(5'h11):(2'h2)];
              reg28 <= $signed(({$unsigned(wire0)} ?
                  reg12[(4'he):(3'h6)] : $unsigned($signed((reg23 > reg20)))));
              reg29 <= ($signed($signed($unsigned($signed(reg27)))) >>> (($unsigned(wire11) ?
                  reg16[(3'h4):(3'h4)] : ($signed((8'h9f)) >= reg28[(1'h1):(1'h1)])) << $unsigned(wire8)));
              reg30 <= wire3[(4'h9):(4'h8)];
              reg31 <= ((^~reg16[(2'h2):(1'h0)]) != ($signed({(+reg23),
                  (reg12 ? wire7 : reg16)}) <<< ($signed($signed(reg20)) ?
                  $unsigned(reg20) : $signed((~wire7)))));
            end
        end
      else
        begin
          if (wire8)
            begin
              reg21 <= (((reg14 ? (7'h41) : reg22[(2'h3):(2'h3)]) ?
                      {((~^reg17) < $unsigned(reg26)),
                          {$unsigned((7'h42))}} : wire3) ?
                  ((reg17[(4'h9):(3'h6)] ?
                      $signed(reg27) : $signed((wire5 ?
                          reg30 : wire5))) == $signed((7'h41))) : ((~|reg23[(4'h8):(3'h5)]) && reg30));
              reg22 <= (8'h9e);
              reg23 <= {reg23};
              reg24 <= wire0;
              reg25 <= ($signed($unsigned(reg29[(3'h6):(2'h3)])) * (((^~((8'hba) & wire11)) ?
                  $signed((reg26 ^ wire6)) : $signed(wire11[(4'hf):(4'ha)])) < $signed({(reg27 ?
                      reg21 : reg25),
                  reg27})));
            end
          else
            begin
              reg21 <= wire5[(4'ha):(2'h3)];
              reg22 <= $signed((^reg31[(1'h0):(1'h0)]));
              reg23 <= (~&(~^wire9));
            end
        end
      reg32 <= reg23[(4'hc):(4'h9)];
      reg33 <= ((8'h9e) ~^ ((|$signed((reg26 * wire7))) ~^ ((reg27 ?
              $signed(reg29) : $signed(reg28)) ?
          (((8'hb4) ? reg25 : reg26) & $unsigned(reg16)) : reg13)));
    end
  always
    @(posedge clk) begin
      reg34 <= $unsigned(wire11[(3'h6):(3'h5)]);
      reg35 <= ((+reg33) ? wire7 : $unsigned((8'ha1)));
      if ((~((^$unsigned((~^wire3))) << {reg13[(1'h1):(1'h1)]})))
        begin
          reg36 <= $unsigned((^reg15[(5'h10):(3'h5)]));
        end
      else
        begin
          reg36 <= wire5[(3'h7):(2'h3)];
          reg37 <= ($signed(((~^(reg31 << reg29)) ?
                  (&$unsigned(wire0)) : reg19)) ?
              $signed($signed($unsigned($signed((8'hae))))) : ($unsigned($unsigned((reg12 >> wire8))) ?
                  reg33 : wire2[(3'h5):(1'h1)]));
          reg38 <= reg36[(4'hb):(3'h6)];
        end
      if ($signed(($signed(wire9) ?
          (((-wire11) ?
              $signed(reg29) : reg31) <<< $signed($signed(reg24))) : $signed(reg23[(4'hb):(2'h2)]))))
        begin
          if (((reg17[(3'h5):(1'h1)] >> {((reg21 >= wire0) || reg27)}) >= $signed((&$unsigned({reg20})))))
            begin
              reg39 <= ($unsigned(wire0[(1'h1):(1'h1)]) ?
                  $unsigned($signed($signed((~(8'h9c))))) : (^~$signed($signed($signed(reg16)))));
              reg40 <= $unsigned($unsigned($unsigned($unsigned({reg27,
                  reg36}))));
              reg41 <= (8'hb4);
              reg42 <= (!$signed($unsigned(($signed(wire5) < $unsigned(reg39)))));
              reg43 <= $signed($signed(($signed(wire5) | reg12[(1'h0):(1'h0)])));
            end
          else
            begin
              reg39 <= reg41[(1'h1):(1'h1)];
              reg40 <= ((+(&reg38[(4'hd):(3'h4)])) ~^ (($unsigned(wire7[(4'h8):(2'h2)]) ?
                  $unsigned((reg34 >> wire7)) : ($unsigned(reg37) == (reg16 >> reg19))) - reg21[(3'h4):(1'h1)]));
            end
        end
      else
        begin
          reg39 <= reg43[(1'h0):(1'h0)];
          reg40 <= $signed($signed($signed(reg23)));
          reg41 <= $signed(((7'h40) ?
              $unsigned(($signed(reg19) ? {wire8, wire8} : reg24)) : ({(reg31 ?
                          reg33 : reg22)} ?
                  $signed($unsigned(reg26)) : ((-reg18) == (&(7'h41))))));
          reg42 <= reg38[(4'h8):(3'h6)];
        end
      reg44 <= (-(~&$unsigned($unsigned($signed((8'had))))));
    end
  assign wire45 = reg38;
  always
    @(posedge clk) begin
      reg46 <= $signed(reg23[(4'hc):(3'h5)]);
      reg47 <= reg44;
    end
  assign wire48 = (wire1 ? wire4 : $unsigned((^$unsigned({reg12, (8'hba)}))));
  module49 #() modinst205 (wire204, clk, reg17, reg35, reg19, reg36);
endmodule

module module49
#(parameter param202 = (|(({((8'hb7) ? (8'h9f) : (8'ha0)), ((8'hbb) ? (8'hba) : (8'ha7))} ? (((8'h9d) ^ (8'h9c)) ? ((8'hbe) - (8'ha1)) : {(8'h9c), (8'ha3)}) : {(~(8'hbc)), {(8'hbb)}}) ? (~(~&((8'hbb) << (8'hb6)))) : ((^~((8'hbd) < (8'ha3))) > ((~(7'h43)) ? ((8'hb7) >= (8'hb0)) : ((8'hb9) ~^ (8'ha7)))))), 
parameter param203 = (|(param202 * (~((|param202) >>> param202)))))
(y, clk, wire50, wire51, wire52, wire53);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire51;
  input wire signed [(5'h11):(1'h0)] wire52;
  input wire [(5'h13):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire201;
  wire signed [(4'hb):(1'h0)] wire200;
  wire [(2'h3):(1'h0)] wire199;
  wire [(5'h13):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire197;
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire54,
                 wire83,
                 wire85,
                 wire141,
                 wire143,
                 wire160,
                 wire197,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 (1'h0)};
  assign wire54 = wire53;
  module55 #() modinst84 (.y(wire83), .wire57(wire53), .wire58(wire50), .clk(clk), .wire56(wire52), .wire59(wire54));
  assign wire85 = (8'hac);
  always
    @(posedge clk) begin
      reg86 <= ($unsigned(wire50) != ((~^((wire52 & (7'h43)) ?
              (wire52 ? wire52 : wire83) : wire85)) ?
          (8'ha3) : wire50[(4'h9):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg87 <= (|wire83[(2'h3):(1'h0)]);
      reg88 <= $signed(wire83);
      if ((wire85[(4'he):(3'h4)] ?
          $unsigned({reg88[(4'h8):(2'h3)]}) : {$signed(($unsigned((8'had)) ~^ wire50)),
              wire50}))
        begin
          if (($unsigned((~|(^$signed(wire54)))) ?
              wire53 : ($unsigned($signed({reg87})) ?
                  wire52[(5'h10):(4'he)] : (~&$unsigned($signed(wire54))))))
            begin
              reg89 <= wire52;
            end
          else
            begin
              reg89 <= reg86;
              reg90 <= (8'hb8);
              reg91 <= wire51[(1'h1):(1'h1)];
              reg92 <= reg89;
            end
          reg93 <= (+(~^wire53[(1'h1):(1'h0)]));
          reg94 <= $unsigned((($signed(reg88) >>> (~((8'hb2) ?
                  reg91 : (8'hbd)))) ?
              (~^reg90[(1'h0):(1'h0)]) : ($unsigned($signed((8'hbc))) ?
                  $signed((&(8'haf))) : reg88[(4'ha):(4'h8)])));
        end
      else
        begin
          reg89 <= wire52[(5'h11):(2'h3)];
          reg90 <= reg87[(2'h3):(1'h1)];
          if (wire54)
            begin
              reg91 <= (^~(^$unsigned((~((8'haf) ^ reg88)))));
              reg92 <= reg86;
            end
          else
            begin
              reg91 <= wire51[(1'h0):(1'h0)];
              reg92 <= wire50[(1'h1):(1'h1)];
            end
        end
      reg95 <= wire50;
    end
  module96 #() modinst142 (wire141, clk, wire85, reg92, reg86, wire51);
  assign wire143 = (($signed($signed($signed((8'ha4)))) ^ {$unsigned(reg93[(1'h0):(1'h0)])}) > {$signed(reg87[(1'h1):(1'h0)]),
                       (~^reg90[(5'h10):(5'h10)])});
  module144 #() modinst161 (wire160, clk, wire85, reg88, wire141, wire83, wire54);
  module162 #() modinst198 (wire197, clk, wire53, reg89, reg93, reg87, reg90);
  assign wire199 = $unsigned(wire143[(2'h2):(1'h0)]);
  assign wire200 = (8'hba);
  assign wire201 = ({(|$signed({wire199})),
                       {(8'hae), (!$unsigned(wire199))}} & $unsigned(wire83));
endmodule

module module162
#(parameter param196 = (!({(-((8'ha6) - (8'hab))), (8'ha0)} ~^ (~^{((8'hab) ? (8'h9f) : (8'hbe)), (~|(8'hab))}))))
(y, clk, wire167, wire166, wire165, wire164, wire163);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire167;
  input wire [(4'he):(1'h0)] wire166;
  input wire [(4'h9):(1'h0)] wire165;
  input wire [(2'h2):(1'h0)] wire164;
  input wire signed [(2'h3):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire195;
  wire [(3'h6):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire192;
  wire signed [(4'h9):(1'h0)] wire191;
  wire signed [(2'h2):(1'h0)] wire190;
  wire signed [(5'h14):(1'h0)] wire188;
  wire signed [(3'h6):(1'h0)] wire187;
  wire signed [(4'hc):(1'h0)] wire186;
  wire signed [(4'he):(1'h0)] wire185;
  wire signed [(3'h7):(1'h0)] wire184;
  wire [(4'ha):(1'h0)] wire183;
  wire [(4'hf):(1'h0)] wire182;
  wire signed [(2'h2):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire signed [(2'h3):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire170;
  wire [(4'h8):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire168;
  reg [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(4'hd):(1'h0)] reg189 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg177 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(5'h14):(1'h0)] reg172 = (1'h0);
  assign y = {wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 reg194,
                 reg189,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 (1'h0)};
  assign wire168 = (!($signed(wire164[(1'h0):(1'h0)]) ?
                       wire164[(1'h1):(1'h0)] : ((|$signed(wire167)) ?
                           $unsigned({wire167}) : $signed((wire166 >= wire167)))));
  assign wire169 = (8'hb4);
  assign wire170 = $unsigned(wire165);
  assign wire171 = $signed(($unsigned((wire167[(2'h3):(2'h2)] ?
                           (wire164 ? wire164 : wire166) : (-wire163))) ?
                       $unsigned((&wire164)) : {wire164}));
  always
    @(posedge clk) begin
      reg172 <= {(-((|$signed(wire170)) | (((8'haa) ? wire171 : (8'hb2)) ?
              $unsigned(wire171) : (~|wire166)))),
          wire168[(3'h4):(1'h1)]};
      if ($unsigned((($unsigned((-wire168)) ?
              ((wire165 ~^ wire166) ?
                  {wire165, wire165} : (reg172 != wire168)) : {(&wire168)}) ?
          wire164 : $unsigned((wire171[(2'h3):(2'h3)] ?
              $signed(wire168) : (wire169 ? (8'hae) : wire171))))))
        begin
          reg173 <= (~|wire167[(2'h2):(1'h0)]);
          reg174 <= (wire168 > $signed($unsigned({wire170[(1'h1):(1'h0)]})));
          reg175 <= wire166[(4'hb):(1'h1)];
          reg176 <= (wire171 ~^ $unsigned($unsigned({$unsigned((8'ha9))})));
        end
      else
        begin
          if ((|reg174[(3'h4):(3'h4)]))
            begin
              reg173 <= reg175[(1'h0):(1'h0)];
              reg174 <= ({$unsigned(((~reg173) ? (~&wire164) : (8'ha9))),
                      wire168[(3'h4):(2'h3)]} ?
                  $signed({$signed((wire167 ? wire170 : reg174))}) : wire171);
              reg175 <= {(-($unsigned(wire165) ?
                      ({wire168,
                          reg176} | $signed((8'ha3))) : ($signed(reg174) ?
                          $signed(reg176) : (reg172 ? (8'hbb) : wire170)))),
                  reg175[(2'h2):(1'h1)]};
            end
          else
            begin
              reg173 <= {(~|reg174[(3'h5):(2'h3)])};
              reg174 <= $unsigned(((^~(~&wire166)) ?
                  reg174[(5'h11):(4'hd)] : reg172[(3'h6):(3'h4)]));
              reg175 <= wire168[(2'h2):(1'h0)];
              reg176 <= ($unsigned((wire170 != wire164[(1'h1):(1'h0)])) ?
                  $unsigned((wire171 >>> wire165)) : wire163);
            end
        end
      reg177 <= reg175;
      reg178 <= (~&wire164);
    end
  assign wire179 = reg176[(2'h3):(2'h2)];
  assign wire180 = $signed(wire170);
  assign wire181 = ($unsigned({({(8'hb6)} ?
                               (wire170 && wire170) : (wire169 << reg178)),
                           $signed($signed(reg178))}) ?
                       $unsigned((^~((+wire180) ?
                           {reg172} : (wire169 ?
                               reg178 : reg172)))) : ($unsigned((^~$signed(wire167))) <<< $unsigned(reg176[(2'h3):(1'h0)])));
  assign wire182 = $signed((!wire166));
  assign wire183 = ((8'hab) ?
                       $signed(((wire166 ? wire163 : $unsigned(wire167)) ?
                           $signed($signed(wire171)) : $unsigned(reg172[(4'hb):(3'h6)]))) : $unsigned(((wire166[(4'hd):(4'h8)] ?
                               (wire180 ? wire166 : wire170) : wire168) ?
                           $signed($unsigned(reg177)) : reg174[(4'hf):(4'hc)])));
  assign wire184 = $signed(((^((wire170 <= wire182) ?
                           (wire167 || wire164) : (reg174 ?
                               wire170 : reg172))) ?
                       $unsigned($signed((wire163 ^ wire169))) : $signed(wire183)));
  assign wire185 = (((reg176 ?
                               {$unsigned(wire171),
                                   (wire180 ?
                                       (8'hbc) : wire165)} : $unsigned($unsigned(wire180))) ?
                           wire179 : (!(((8'hbf) || reg174) ?
                               (wire164 << reg178) : {(8'ha3), wire181}))) ?
                       reg173[(3'h6):(3'h5)] : ($unsigned($unsigned(reg177[(3'h6):(1'h0)])) | wire170));
  assign wire186 = $signed(wire185[(4'hd):(3'h5)]);
  assign wire187 = $unsigned((($unsigned((wire183 ?
                           wire168 : wire183)) && $signed(wire185)) ?
                       ($unsigned($signed(wire168)) ^ wire181) : {wire186,
                           ($signed(reg178) ?
                               $unsigned(wire170) : ((7'h43) ?
                                   (8'hae) : (8'ha1)))}));
  assign wire188 = (wire182 ?
                       reg174[(2'h2):(1'h1)] : (!(|reg177[(3'h6):(1'h0)])));
  always
    @(posedge clk) begin
      reg189 <= wire181[(1'h0):(1'h0)];
    end
  assign wire190 = (7'h44);
  assign wire191 = ($signed($unsigned(reg172[(4'hd):(4'hb)])) * $signed($signed(wire167)));
  assign wire192 = $signed($unsigned($unsigned(({wire183} ?
                       {(8'ha9), (8'hb8)} : wire180[(5'h11):(3'h4)]))));
  assign wire193 = ((wire186[(3'h4):(2'h3)] | wire165) >>> ($signed($signed(wire181[(1'h0):(1'h0)])) ?
                       $unsigned({wire166,
                           $unsigned(wire180)}) : reg177[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg194 <= $signed((-(!($signed((8'hb0)) ?
          (~^wire171) : $unsigned(wire167)))));
    end
  assign wire195 = $unsigned($unsigned($signed($signed((~|wire191)))));
endmodule

module module144
#(parameter param159 = ({(!(!(~(8'hba))))} ? ((^(8'ha9)) ? (8'ha9) : (((|(8'hbd)) - ((8'had) - (7'h44))) ? ((^(8'h9d)) ? ((8'haf) != (7'h40)) : (!(8'hb2))) : {(^(8'hb4))})) : (~(({(7'h44), (8'h9d)} ? (^~(8'hb1)) : (&(8'hbb))) > (!((8'hb2) ? (8'ha5) : (8'ha5)))))))
(y, clk, wire149, wire148, wire147, wire146, wire145);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire149;
  input wire signed [(4'hc):(1'h0)] wire148;
  input wire [(4'hc):(1'h0)] wire147;
  input wire [(3'h5):(1'h0)] wire146;
  input wire signed [(5'h13):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire151;
  wire [(3'h6):(1'h0)] wire150;
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire154,
                 wire153,
                 wire151,
                 wire150,
                 reg156,
                 reg155,
                 reg152,
                 (1'h0)};
  assign wire150 = wire145;
  assign wire151 = (&$signed($unsigned(((wire148 * (8'hb6)) ?
                       {wire150, wire147} : (^~wire145)))));
  always
    @(posedge clk) begin
      reg152 <= wire146[(1'h1):(1'h1)];
    end
  assign wire153 = wire147[(1'h0):(1'h0)];
  assign wire154 = $signed(($signed(wire149) ^~ wire145[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg155 <= {($unsigned(((~^(8'hbc)) && (^~wire149))) == $signed((^((7'h42) ?
              wire154 : reg152))))};
      reg156 <= wire147[(2'h3):(1'h1)];
    end
  assign wire157 = wire147;
  assign wire158 = $signed((-$signed($unsigned((reg156 <= (8'haa))))));
endmodule

module module96
#(parameter param140 = {(~|(~&{((8'hb9) ? (8'hb5) : (7'h41))})), (((((8'hba) ^ (8'h9e)) ? (7'h42) : ((8'hab) ? (8'hae) : (8'hbf))) ? (-((8'hb9) >= (8'h9e))) : (&(!(7'h44)))) ^ (((+(8'hbf)) ? ((8'ha3) ^ (8'hb9)) : ((8'hba) ? (8'hb1) : (8'hb8))) ? ((+(8'hb5)) >> (~^(7'h40))) : (+(!(8'ha0)))))})
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire99;
  input wire [(5'h11):(1'h0)] wire98;
  input wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(2'h3):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(3'h4):(1'h0)] reg111 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire124,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg136,
                 reg135,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire101 = $signed({($unsigned((wire100 ? (8'had) : wire100)) ?
                           $unsigned(wire97[(4'hb):(2'h3)]) : $signed((8'h9d))),
                       $signed((&wire98))});
  assign wire102 = {(8'hb6)};
  assign wire103 = ((~^((~^(wire100 ? wire100 : wire102)) > ((wire99 ?
                       wire101 : (8'hb8)) >= wire97[(4'hc):(1'h0)]))) ^~ wire97[(4'hd):(1'h0)]);
  assign wire104 = wire102[(1'h1):(1'h0)];
  assign wire105 = wire101;
  assign wire106 = (+{wire105,
                       (wire104 ?
                           wire99[(3'h4):(2'h2)] : $signed((wire104 ?
                               (8'h9d) : wire100)))});
  assign wire107 = wire100[(5'h10):(4'he)];
  assign wire108 = wire103;
  assign wire109 = wire106[(1'h1):(1'h1)];
  assign wire110 = wire101[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg111 <= (wire99 ?
          {wire103[(3'h7):(2'h3)],
              (wire104 ?
                  (wire97[(4'h9):(4'h9)] ?
                      (~|wire105) : (~&wire98)) : {wire105})} : wire97);
      if ($signed(wire99[(3'h7):(1'h0)]))
        begin
          reg112 <= ((wire109 ?
              (({reg111} & {wire110, wire103}) ?
                  $unsigned(wire104[(3'h4):(1'h0)]) : wire100) : (wire99[(4'hd):(1'h0)] ~^ wire102[(1'h1):(1'h0)])) ~^ ({(wire108 ?
                      $signed(wire101) : wire99[(4'hc):(3'h6)])} ?
              {$signed(wire100),
                  ($unsigned((8'haa)) ?
                      {(8'ha4), wire109} : $unsigned(reg111))} : (8'hbc)));
        end
      else
        begin
          reg112 <= (&(8'hb7));
          reg113 <= wire99;
          reg114 <= (((-reg112[(4'hd):(3'h6)]) == (wire108[(3'h5):(1'h1)] ?
                  wire109 : $signed($signed(wire104)))) ?
              $unsigned(((wire98 ? $signed(wire104) : (+(8'hab))) ?
                  ($unsigned((7'h44)) - $signed(reg112)) : $signed(reg112[(4'hb):(4'ha)]))) : $unsigned($signed($unsigned(wire103))));
          reg115 <= wire110;
          if ($unsigned(((8'hab) ?
              ((reg114[(3'h5):(1'h0)] ? $signed((8'ha8)) : reg113) ?
                  (wire106[(1'h1):(1'h0)] * (&wire97)) : $signed(wire109)) : $signed($unsigned((+wire105))))))
            begin
              reg116 <= (~({(wire100[(5'h11):(4'ha)] ?
                          (wire97 <<< reg114) : $signed(wire103)),
                      ($signed(reg115) <= (+wire106))} ?
                  wire97[(3'h6):(3'h4)] : reg115));
            end
          else
            begin
              reg116 <= ({$signed(((^(7'h44)) | (+(8'hb6)))),
                      (((wire108 >> wire106) >= (~^wire102)) != $signed((~wire97)))} ?
                  {$unsigned({(^wire107), (wire104 ~^ wire102)})} : wire105);
              reg117 <= ($signed(((&wire106[(2'h3):(2'h3)]) ?
                      $signed((wire110 - reg112)) : ((wire109 >> wire107) != $unsigned((7'h43))))) ?
                  reg112[(4'ha):(1'h1)] : $signed((&($unsigned((8'ha1)) ?
                      (+wire105) : (+(8'haa))))));
            end
        end
      if ((^~((~(wire103 ? {wire98} : ((8'ha1) ? wire102 : wire98))) ?
          reg111 : wire98)))
        begin
          reg118 <= $signed($unsigned($unsigned({(!reg115),
              $signed((8'hb2))})));
          reg119 <= (8'ha2);
          reg120 <= wire103[(4'h8):(2'h2)];
          reg121 <= reg111;
        end
      else
        begin
          reg118 <= $unsigned($unsigned((({wire97, wire106} > wire109) ?
              reg117 : $signed($signed(reg114)))));
          reg119 <= $unsigned(wire100);
          reg120 <= (wire97[(1'h0):(1'h0)] ?
              (|reg113[(3'h6):(3'h5)]) : (wire108 || $signed(((reg118 ?
                      reg113 : wire110) ?
                  $signed((8'hb3)) : reg113))));
          reg121 <= (~&(wire103 << ({$signed(wire100)} ?
              (wire104 >>> (~reg121)) : $signed($signed(wire99)))));
        end
      reg122 <= ($signed($unsigned($signed((reg113 ? wire97 : wire97)))) ?
          $unsigned({{(~reg121), reg118},
              (+$unsigned(reg116))}) : (((8'had) ^~ ((8'haf) ?
                  (wire102 << wire98) : (^~wire97))) ?
              $unsigned($unsigned($unsigned((8'ha0)))) : $signed((reg118 ?
                  $unsigned(reg115) : $unsigned(reg116)))));
      reg123 <= ($signed((((reg122 ?
              wire104 : wire108) * (~|reg114)) == wire99[(1'h0):(1'h0)])) ?
          $unsigned(reg121) : {reg113});
    end
  assign wire124 = (&((((reg112 < reg121) ?
                       {reg119,
                           wire109} : wire102[(1'h0):(1'h0)]) & $unsigned(wire108)) * (^~({(8'hb3)} ?
                       $unsigned(wire101) : $unsigned((8'h9f))))));
  always
    @(posedge clk) begin
      reg125 <= $unsigned($signed(wire101));
      if (reg116[(4'ha):(4'h9)])
        begin
          reg126 <= reg118;
          reg127 <= $signed(reg111);
          reg128 <= (8'ha4);
          reg129 <= $unsigned(reg113[(4'ha):(2'h3)]);
          if (((wire105[(1'h0):(1'h0)] ? wire98 : (8'hbf)) ?
              (wire109[(3'h7):(3'h4)] - $signed($signed($unsigned(reg125)))) : (|(^((wire108 ?
                  reg119 : wire107) ^~ wire110)))))
            begin
              reg130 <= reg115[(3'h7):(3'h7)];
              reg131 <= ($signed((($unsigned((8'hb1)) << (reg116 << reg115)) * $unsigned($signed((8'haa))))) ?
                  ($unsigned({(8'haa), $unsigned(reg113)}) ?
                      reg121 : ((~&(^~wire108)) <= ($unsigned(reg114) > reg119))) : ($signed($signed($unsigned(reg119))) != (&((wire107 ?
                          wire124 : reg120) ?
                      $signed(wire103) : (reg130 ? wire103 : (8'ha6))))));
              reg132 <= (~^reg123);
              reg133 <= (((reg111 ?
                          $signed($unsigned(wire107)) : reg119[(2'h2):(1'h1)]) ?
                      $unsigned($unsigned((+(8'hba)))) : (&$unsigned((wire110 > (8'hac))))) ?
                  reg121 : $signed($unsigned({$unsigned(wire99)})));
              reg134 <= ($signed(($unsigned((&reg119)) ?
                  wire107[(3'h6):(2'h3)] : $unsigned(reg128[(1'h0):(1'h0)]))) & (($unsigned($signed(wire105)) ?
                      (8'ha7) : (~|$signed((8'ha2)))) ?
                  ((|$unsigned(wire108)) ?
                      $unsigned(wire108[(3'h4):(1'h0)]) : {$signed(reg123)}) : wire100));
            end
          else
            begin
              reg130 <= (|wire110[(1'h1):(1'h1)]);
              reg131 <= reg134;
            end
        end
      else
        begin
          reg126 <= reg115;
          reg127 <= ($signed($unsigned((reg134[(2'h3):(2'h2)] ?
                  $unsigned(wire101) : (reg128 ? reg131 : wire104)))) ?
              $signed((8'ha2)) : $unsigned(reg130[(1'h1):(1'h0)]));
        end
      reg135 <= (~{$unsigned($signed({(8'ha6)})), reg112});
      reg136 <= reg115;
    end
  assign wire137 = reg129;
  assign wire138 = wire97[(2'h2):(1'h0)];
  assign wire139 = ($signed((wire124 ?
                           (reg134[(1'h0):(1'h0)] <= {(8'hba),
                               reg111}) : {(reg112 ? wire107 : (7'h41))})) ?
                       reg135 : $signed($signed({wire97,
                           reg120[(2'h2):(2'h2)]})));
endmodule

module module55
#(parameter param81 = {(({((8'haa) | (7'h40))} & ((~&(8'ha0)) | ((8'hb2) ? (7'h40) : (8'h9e)))) < (&{((8'ha9) & (8'hb4)), (^~(8'hbb))}))}, 
parameter param82 = param81)
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire59;
  input wire signed [(3'h5):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire60 = (^~$unsigned(($signed({wire57, wire57}) ?
                      (|wire56) : (+((8'hb3) == wire58)))));
  assign wire61 = (((|($unsigned(wire58) || (wire58 >= wire57))) ^~ (8'h9e)) ?
                      (wire56[(5'h10):(4'hd)] - wire59[(3'h6):(3'h6)]) : (wire57 ?
                          wire56[(2'h3):(2'h3)] : ($unsigned(wire56) ?
                              $unsigned((+wire60)) : $unsigned(wire58))));
  assign wire62 = wire59;
  always
    @(posedge clk) begin
      reg63 <= wire62[(4'hb):(3'h7)];
      reg64 <= wire58[(2'h2):(1'h0)];
      reg65 <= $signed((^~{wire58[(1'h1):(1'h0)],
          ($signed(wire59) < wire57[(3'h6):(2'h2)])}));
      reg66 <= {(^wire57[(4'ha):(4'h9)])};
      reg67 <= $signed({(~&$unsigned((wire57 ? reg65 : (8'had))))});
    end
  assign wire68 = (&{(~^wire57[(3'h4):(3'h4)]), reg64[(1'h0):(1'h0)]});
  assign wire69 = reg65;
  assign wire70 = (($signed(wire60[(4'hc):(3'h7)]) ?
                      (wire60[(4'h9):(2'h2)] << wire56[(4'hc):(4'hb)]) : ($signed((!wire59)) ?
                          $unsigned($unsigned(wire69)) : $unsigned(wire57))) != $unsigned(reg65[(3'h7):(3'h7)]));
  assign wire71 = wire59[(3'h7):(3'h7)];
  assign wire72 = $unsigned(((($signed(reg65) ?
                      (~&reg67) : wire69) | $unsigned((~^wire62))) - {$unsigned({(8'had)}),
                      (^~(wire69 ~^ (8'hb9)))}));
  assign wire73 = (wire59 & wire68);
  assign wire74 = wire72[(4'hf):(4'ha)];
  assign wire75 = wire61;
  assign wire76 = ((~^$unsigned($unsigned($unsigned(wire70)))) == ((wire73 ?
                          {(8'ha2)} : (8'ha3)) ?
                      wire69[(2'h2):(2'h2)] : reg67));
  assign wire77 = $unsigned((+wire70));
  assign wire78 = (~^$signed({wire70}));
  assign wire79 = ($signed($unsigned((wire58[(1'h0):(1'h0)] == $signed(wire70)))) <= wire69);
  assign wire80 = $unsigned(wire79);
endmodule

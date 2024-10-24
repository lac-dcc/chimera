module top
#(parameter param267 = (~|(((~^((8'hb7) || (8'hb8))) << ((~^(8'ha6)) ? (|(8'hb0)) : (8'ha5))) ? ({{(8'hb7)}} != (((8'hb3) ? (8'ha4) : (8'hb0)) ? ((8'hbe) >>> (8'hae)) : ((8'h9d) || (8'hae)))) : ({(!(7'h40)), ((8'hba) ? (8'ha5) : (7'h42))} + ((-(8'h9f)) == ((8'h9f) || (8'h9f)))))), 
parameter param268 = (((((param267 ? param267 : param267) ? (~&(8'hbd)) : (+param267)) ? param267 : ((param267 != param267) - param267)) ~^ ({param267} ? ({param267, param267} ~^ param267) : (param267 ~^ param267))) - (&((^~(param267 ? param267 : param267)) ? (^~(param267 + param267)) : param267))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire266;
  wire [(4'hd):(1'h0)] wire265;
  wire [(4'h8):(1'h0)] wire263;
  wire [(3'h7):(1'h0)] wire262;
  wire signed [(3'h4):(1'h0)] wire261;
  wire [(5'h10):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire259;
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire263,
                 wire262,
                 wire261,
                 wire70,
                 wire5,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire81,
                 wire82,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire259,
                 reg4,
                 reg6,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire0 - wire1[(3'h6):(3'h4)]);
    end
  assign wire5 = $unsigned((wire3[(3'h5):(1'h1)] ~^ {(~&(wire3 ?
                         (8'ha5) : reg4))}));
  always
    @(posedge clk) begin
      reg6 <= (^~$unsigned(($unsigned((^wire2)) ~^ (~^(wire0 ?
          wire5 : wire3)))));
    end
  module7 #() modinst71 (.wire11(wire3), .wire12(wire1), .clk(clk), .y(wire70), .wire9(wire2), .wire10(wire0), .wire8(wire5));
  assign wire72 = $unsigned($signed(reg4[(2'h2):(2'h2)]));
  assign wire73 = ((((reg4 || (wire2 ? wire1 : wire1)) << $unsigned({reg6})) ?
                          $unsigned($signed($unsigned(wire2))) : (-$signed((wire70 != (8'ha5))))) ?
                      reg6 : (wire1 ^ $unsigned((wire70 ?
                          $unsigned(wire0) : (wire70 ? (7'h40) : wire70)))));
  assign wire74 = wire0[(4'he):(3'h6)];
  assign wire75 = wire2;
  always
    @(posedge clk) begin
      reg76 <= ((!$unsigned($unsigned({(8'ha2), wire1}))) >> $signed((({wire1,
              wire1} ?
          $unsigned(wire3) : reg6[(4'hd):(4'hc)]) >>> (wire5 && (wire73 >> reg4)))));
      reg77 <= (($signed((~&$signed(reg4))) ? wire3[(5'h13):(4'h9)] : wire0) ?
          wire70[(1'h1):(1'h1)] : (+$unsigned($unsigned((^~wire2)))));
      reg78 <= reg6[(4'hc):(4'hb)];
      reg79 <= $signed({($signed((wire70 >>> (8'hb0))) + $signed(wire1))});
      reg80 <= ({wire75[(5'h11):(4'h8)]} * (~|wire73));
    end
  assign wire81 = $unsigned((~|(|wire5)));
  assign wire82 = wire0;
  always
    @(posedge clk) begin
      reg83 <= (reg80 ?
          (~^((wire0[(5'h11):(4'hc)] ?
                  (wire3 ^ reg77) : wire70[(2'h2):(1'h1)]) ?
              (+(reg80 ?
                  (8'hb1) : wire70)) : $unsigned({reg4}))) : (!$unsigned(wire2)));
      reg84 <= ((wire0 || wire5[(4'hc):(2'h2)]) ?
          $unsigned(wire73) : $unsigned(wire75[(4'he):(3'h4)]));
      reg85 <= $unsigned($signed({($signed(wire74) - $signed(reg84)), reg80}));
      reg86 <= (^wire2);
    end
  assign wire87 = $unsigned($signed((($signed(reg77) >>> reg84[(3'h7):(1'h0)]) && $unsigned($signed(wire2)))));
  assign wire88 = (-reg80[(2'h3):(2'h2)]);
  assign wire89 = wire82;
  assign wire90 = (^(|$unsigned(wire2)));
  assign wire91 = (~|(&((wire87 + (reg79 ? wire87 : (8'hb1))) ?
                      (~^(wire73 ? reg78 : wire72)) : wire75[(4'hf):(2'h3)])));
  module92 #() modinst260 (.wire93(wire87), .y(wire259), .clk(clk), .wire95(wire73), .wire97(reg6), .wire96(wire5), .wire94(reg84));
  assign wire261 = ((reg80[(4'hb):(2'h3)] ?
                       (reg80 ?
                           $signed((reg78 >> wire81)) : wire88[(4'ha):(4'h8)]) : {wire73,
                           ((wire87 + wire74) & reg86)}) << ((reg4 < (+wire5)) ?
                       wire74 : (-((&reg76) ?
                           ((7'h44) ? (8'ha9) : reg86) : wire91))));
  assign wire262 = ((~|(-(wire87[(4'hf):(3'h7)] <<< wire75[(4'h9):(2'h2)]))) >= {$unsigned(wire90),
                       (^reg86)});
  module192 #() modinst264 (wire263, clk, reg83, reg4, reg86, wire70, wire261);
  assign wire265 = ($unsigned(wire2) ?
                       $unsigned($unsigned($signed(wire261))) : $signed($unsigned($unsigned(wire261[(1'h1):(1'h1)]))));
  assign wire266 = (~|{(+wire262), {{$unsigned(wire70), (wire91 || wire74)}}});
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire97;
  input wire signed [(5'h12):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(5'h11):(1'h0)] wire94;
  input wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire258;
  wire signed [(5'h13):(1'h0)] wire257;
  wire signed [(4'h9):(1'h0)] wire256;
  wire signed [(5'h13):(1'h0)] wire255;
  wire signed [(2'h3):(1'h0)] wire254;
  wire signed [(3'h7):(1'h0)] wire234;
  wire [(3'h5):(1'h0)] wire233;
  wire signed [(4'h9):(1'h0)] wire232;
  wire signed [(5'h11):(1'h0)] wire231;
  wire signed [(4'hc):(1'h0)] wire230;
  wire [(2'h2):(1'h0)] wire229;
  wire signed [(4'hf):(1'h0)] wire228;
  wire [(4'he):(1'h0)] wire227;
  wire [(3'h4):(1'h0)] wire190;
  wire signed [(5'h11):(1'h0)] wire147;
  wire signed [(4'hc):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire225;
  reg [(2'h3):(1'h0)] reg253 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg251 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg250 = (1'h0);
  reg [(3'h6):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg248 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg246 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg245 = (1'h0);
  reg [(5'h15):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg243 = (1'h0);
  reg [(3'h7):(1'h0)] reg242 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg241 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg240 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg239 = (1'h0);
  reg [(5'h13):(1'h0)] reg238 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg236 = (1'h0);
  reg [(5'h15):(1'h0)] reg235 = (1'h0);
  assign y = {wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire190,
                 wire147,
                 wire145,
                 wire100,
                 wire99,
                 wire98,
                 wire225,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 (1'h0)};
  assign wire98 = (($unsigned($unsigned((wire94 ? wire95 : wire96))) ?
                          {({wire94} * (|wire93))} : {(8'hab)}) ?
                      ({$signed($signed(wire97))} ?
                          wire94 : wire95[(4'ha):(3'h5)]) : wire95[(4'hb):(2'h3)]);
  assign wire99 = (wire94 ?
                      $signed({($unsigned(wire97) ? wire93 : (8'hbc)),
                          wire95[(4'hf):(4'hb)]}) : (&wire93));
  assign wire100 = $signed(({wire94, {(wire99 >> wire93)}} << wire99));
  module101 #() modinst146 (wire145, clk, wire100, wire99, wire93, wire94);
  assign wire147 = ((({wire94[(4'hd):(2'h2)], wire94[(4'hf):(3'h5)]} ?
                       (~&wire99[(2'h3):(2'h2)]) : wire97[(4'h8):(3'h7)]) < ((&wire95) | (8'ha4))) < ($signed($unsigned($unsigned(wire100))) ?
                       (~^(8'had)) : ((&wire98) ?
                           $unsigned({wire97}) : wire96)));
  module148 #() modinst191 (wire190, clk, wire98, wire95, wire145, wire147, wire100);
  module192 #() modinst226 (.wire193(wire147), .wire195(wire97), .wire196(wire93), .y(wire225), .wire194(wire94), .clk(clk), .wire197(wire95));
  assign wire227 = ((~|wire190[(2'h2):(1'h0)]) ?
                       wire98 : (!(!(~&(wire147 ~^ wire93)))));
  assign wire228 = $signed($unsigned((wire225 <= wire95)));
  assign wire229 = ($unsigned((&$signed(wire99[(2'h3):(1'h0)]))) ?
                       ($signed(($signed(wire228) + (^wire225))) && (|{((7'h44) ?
                               (8'hb4) : (8'h9c))})) : (~|$unsigned({$unsigned(wire228),
                           wire147})));
  assign wire230 = wire100[(3'h4):(2'h3)];
  assign wire231 = wire94[(4'hc):(3'h6)];
  assign wire232 = wire228;
  assign wire233 = (~^{wire229,
                       $unsigned(($signed(wire230) << wire99[(2'h2):(1'h0)]))});
  assign wire234 = $unsigned((~^wire232));
  always
    @(posedge clk) begin
      if (((-(($unsigned(wire96) ?
              {wire99,
                  wire94} : (~^(8'hac))) == $unsigned((wire99 - wire234)))) ?
          $unsigned({wire93}) : (^~(wire225[(3'h5):(1'h0)] ~^ wire98))))
        begin
          if ((wire147 >>> ($unsigned((~^wire234[(3'h7):(1'h1)])) ?
              (^~wire97[(1'h1):(1'h1)]) : wire233[(3'h5):(2'h2)])))
            begin
              reg235 <= wire227;
              reg236 <= wire228;
              reg237 <= wire99;
            end
          else
            begin
              reg235 <= (8'hbf);
              reg236 <= reg236;
              reg237 <= $signed(($unsigned($signed(wire229[(1'h0):(1'h0)])) < (!wire96)));
              reg238 <= wire147[(3'h7):(3'h7)];
              reg239 <= $unsigned($unsigned(((-{wire96, (8'h9f)}) ?
                  (~$signed(wire95)) : $unsigned($signed((7'h41))))));
            end
          reg240 <= (-wire97[(3'h5):(3'h4)]);
          reg241 <= wire95;
        end
      else
        begin
          if ((+wire97[(4'hf):(2'h2)]))
            begin
              reg235 <= {$unsigned(($unsigned(wire98[(4'h9):(1'h1)]) ^~ ({wire99,
                      wire230} || $signed(reg235)))),
                  wire190};
              reg236 <= wire97[(2'h3):(2'h3)];
              reg237 <= ($signed(wire233[(3'h5):(2'h3)]) ?
                  wire234[(2'h3):(2'h3)] : wire234);
              reg238 <= wire94;
              reg239 <= (^~(($unsigned((reg235 < reg238)) ?
                  wire94 : ($unsigned(wire229) ?
                      (wire232 >> wire147) : reg235[(2'h2):(1'h1)])) > $unsigned(((wire94 ?
                  reg240 : reg241) >> reg241[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg235 <= $unsigned($signed((reg239 ?
                  {{wire145}, reg239} : (reg239 ?
                      $unsigned(wire145) : $signed(wire100)))));
            end
          reg240 <= $signed(wire227[(3'h7):(3'h5)]);
          reg241 <= $unsigned((~&reg235));
        end
      if ((~&$unsigned(wire96)))
        begin
          reg242 <= $signed((wire145 != $unsigned((|(wire228 ?
              wire95 : wire231)))));
          if (reg242)
            begin
              reg243 <= (~$unsigned((wire232[(2'h2):(2'h2)] && $unsigned({wire97,
                  wire96}))));
              reg244 <= {(-reg238)};
              reg245 <= (reg237 ~^ $unsigned($signed({wire94})));
            end
          else
            begin
              reg243 <= reg235;
              reg244 <= ($unsigned($signed(reg240)) > (reg236[(3'h7):(1'h0)] ?
                  ((wire145 ? $signed(wire96) : reg240) ?
                      $signed(reg235) : (~^$unsigned(wire228))) : (|(~|{wire147,
                      wire97}))));
              reg245 <= reg241[(3'h5):(2'h3)];
            end
          reg246 <= (~|(((~^wire94) ^ {$signed(wire97)}) ?
              ((-wire97[(4'ha):(2'h3)]) ?
                  ((reg236 <= wire231) - wire227[(3'h6):(3'h5)]) : $signed((wire230 ?
                      wire147 : wire99))) : wire100));
          reg247 <= (~&(((^$unsigned((8'had))) < (^(^reg237))) + (-$unsigned($unsigned((7'h41))))));
          if ($signed((^~({$unsigned(reg236)} ?
              ({wire94} != wire225[(4'hd):(3'h4)]) : wire229[(1'h0):(1'h0)]))))
            begin
              reg248 <= {$signed(((wire227[(4'he):(3'h7)] << $unsigned(wire145)) ?
                      reg240 : ($signed(wire99) >> {wire230, reg237})))};
              reg249 <= (wire93[(5'h11):(3'h6)] ?
                  $unsigned(({(^reg241), (wire94 * (8'hb5))} ?
                      wire145 : {reg241})) : ($signed(reg239[(1'h1):(1'h1)]) ?
                      $unsigned({(|(7'h43))}) : ((7'h43) & $signed(wire228[(4'he):(2'h3)]))));
            end
          else
            begin
              reg248 <= (~|$unsigned($unsigned(wire227[(1'h1):(1'h0)])));
              reg249 <= reg236;
              reg250 <= (&$signed($signed((~&$unsigned(wire229)))));
            end
        end
      else
        begin
          reg242 <= wire190[(1'h1):(1'h0)];
        end
      reg251 <= wire97;
      reg252 <= (($unsigned((-(^reg250))) ? $unsigned((8'hbd)) : reg251) ?
          (({(~&wire145)} >>> $signed((reg239 > wire99))) | wire234) : $signed(($signed((~&reg238)) >= (~$unsigned(wire229)))));
      reg253 <= $unsigned(((wire229 ?
              (wire100 << (wire94 ? (8'hb3) : reg246)) : {{(8'hbe), reg241}}) ?
          {$unsigned($signed((7'h42)))} : (8'hbb)));
    end
  assign wire254 = reg239[(2'h3):(2'h3)];
  assign wire255 = wire233[(3'h4):(3'h4)];
  assign wire256 = ($unsigned($unsigned({(~reg242)})) ?
                       reg250 : ($signed(({(8'hb0), reg245} ?
                               wire233[(3'h5):(1'h1)] : (wire95 <= reg237))) ?
                           wire254 : ($unsigned((~reg243)) ?
                               $unsigned(wire232) : $unsigned($unsigned(reg249)))));
  assign wire257 = (((~wire233) ^ $signed($unsigned((wire147 >> reg245)))) <= wire94[(1'h0):(1'h0)]);
  assign wire258 = {(($unsigned((wire232 + (8'hbd))) ?
                           (&(wire232 ?
                               wire232 : (8'haa))) : (reg237[(2'h3):(1'h1)] ?
                               wire100[(4'hf):(3'h6)] : reg235)) > wire228)};
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire45;
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  assign y = {wire69,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire27,
                 wire45,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~&wire10))
        begin
          reg13 <= ((wire9 ?
                  ({{wire9}} ?
                      $unsigned(wire8[(2'h2):(1'h1)]) : ((wire8 ?
                              wire12 : wire9) ?
                          wire8 : (&wire11))) : ((wire8[(4'hd):(3'h7)] ?
                          (^~wire10) : (wire8 ~^ wire12)) ?
                      $signed(wire9[(5'h14):(4'h9)]) : (wire8 ?
                          {wire11} : wire10))) ?
              (~&$signed(($unsigned(wire10) || $unsigned(wire12)))) : $unsigned(wire8));
          reg14 <= $signed(wire11[(4'hb):(3'h4)]);
        end
      else
        begin
          reg13 <= ((~$unsigned((^~$signed((8'ha0))))) ?
              $unsigned(wire9) : (wire11[(4'h8):(3'h4)] ?
                  wire8 : ($signed({wire10}) ?
                      $unsigned($unsigned(wire12)) : $unsigned(reg14))));
          if (wire10[(3'h5):(2'h3)])
            begin
              reg14 <= reg13;
              reg15 <= (wire11 ?
                  {($signed((wire8 ?
                          wire11 : wire8)) | ($signed(wire11) >= reg13[(2'h2):(1'h1)])),
                      $signed((+(~wire11)))} : $unsigned(({((8'hb7) ?
                          wire12 : reg13),
                      $unsigned((8'hb3))} ~^ wire12)));
              reg16 <= $signed(wire10);
              reg17 <= (wire10[(3'h5):(2'h3)] ?
                  $unsigned(({(reg13 ? wire10 : wire12)} ?
                      (8'hb0) : ($unsigned(reg15) ~^ $unsigned((8'ha6))))) : (wire11[(4'ha):(4'h9)] || ($unsigned((wire8 + reg13)) | $signed((wire8 ?
                      wire11 : wire8)))));
              reg18 <= ((8'ha9) && ((wire12 ?
                      (8'hbb) : (~&(reg15 ? wire11 : (8'hb0)))) ?
                  wire12 : $signed(wire9[(4'hc):(2'h3)])));
            end
          else
            begin
              reg14 <= ($unsigned((+$signed((wire8 ?
                  wire11 : wire12)))) > reg13[(2'h2):(1'h0)]);
              reg15 <= (wire9[(4'ha):(4'h9)] ?
                  ($unsigned((reg18 ?
                          $unsigned(reg15) : (reg17 ? reg18 : wire8))) ?
                      $signed((~&$unsigned(reg16))) : ((~(|wire8)) ?
                          (wire11[(2'h2):(2'h2)] | wire8) : ({wire10, reg18} ?
                              (8'h9d) : ((8'ha5) == wire11)))) : $signed(reg18[(3'h6):(3'h4)]));
              reg16 <= $signed({(~wire9), (!(~^reg17[(2'h2):(1'h0)]))});
              reg17 <= ({$unsigned($signed((wire12 ?
                      wire11 : reg17)))} ^ (~^(wire11 < (reg15[(4'h9):(3'h6)] + $signed((8'hb4))))));
            end
          reg19 <= $signed($signed((-$signed(((8'hb2) ? wire10 : (8'ha2))))));
          reg20 <= (+$unsigned((reg18[(3'h4):(1'h1)] ?
              reg17 : $signed({reg18, wire11}))));
        end
      reg21 <= $unsigned($signed((reg13[(2'h3):(1'h0)] ?
          (+((8'hb5) | reg19)) : ((reg13 <= wire10) <= $unsigned(wire12)))));
      if (((($signed($unsigned(wire10)) ?
                  ((-wire9) ? $unsigned(reg18) : (~^(8'hbd))) : {(|reg19)}) ?
              $signed(($unsigned(reg18) ?
                  (wire11 ?
                      reg13 : reg21) : (wire12 > (8'hb4)))) : $signed($signed(wire9[(4'hd):(2'h3)]))) ?
          ($signed($signed(wire10[(1'h1):(1'h0)])) > $unsigned($signed(wire11))) : $signed(wire12[(4'h8):(3'h6)])))
        begin
          reg22 <= $signed(reg20[(3'h6):(3'h6)]);
          reg23 <= {((-((wire8 ^ wire9) ?
                  reg13 : $signed(reg18))) - (reg17 <= reg19[(3'h4):(1'h0)]))};
          reg24 <= reg23[(4'hb):(1'h1)];
          reg25 <= reg19;
        end
      else
        begin
          reg22 <= ({$signed((8'hb7))} <<< reg20[(3'h4):(3'h4)]);
          reg23 <= reg21[(1'h1):(1'h0)];
          reg24 <= ({reg14[(1'h1):(1'h1)],
                  ($signed((reg25 + reg23)) > {((8'hb6) || reg17),
                      (reg15 ? reg18 : wire11)})} ?
              (~^((reg16[(4'ha):(4'h9)] ? (reg16 + reg14) : $signed(reg23)) ?
                  $unsigned(((8'h9e) ?
                      reg20 : (8'h9d))) : wire9[(4'he):(4'hd)])) : ((&reg15[(1'h1):(1'h0)]) ?
                  $signed(((wire12 ?
                      reg25 : reg14) >>> $signed(reg20))) : $unsigned(reg17)));
          if (wire9[(5'h12):(5'h10)])
            begin
              reg25 <= (wire9[(1'h0):(1'h0)] ?
                  ((+$unsigned({reg15})) ?
                      reg25 : $unsigned(($signed((8'h9d)) ~^ (wire12 ?
                          reg24 : reg24)))) : (8'hbc));
            end
          else
            begin
              reg25 <= reg15;
            end
        end
      reg26 <= (reg25[(5'h11):(3'h7)] ?
          ($unsigned(reg17[(2'h2):(1'h0)]) && (($unsigned((7'h42)) ?
                  wire10 : $signed(reg25)) ?
              wire11[(3'h5):(1'h1)] : reg15)) : $unsigned(reg16));
    end
  assign wire27 = (8'h9d);
  module28 #() modinst46 (.y(wire45), .wire30(reg19), .wire31(reg25), .wire32(wire9), .wire29(reg22), .clk(clk));
  always
    @(posedge clk) begin
      reg47 <= (~({($unsigned(wire8) == wire11[(1'h1):(1'h0)])} ?
          {({(8'hac)} ~^ wire12)} : reg22[(3'h4):(1'h1)]));
      reg48 <= $unsigned((((-$unsigned(reg23)) && reg47[(3'h7):(3'h4)]) <= ($unsigned({reg26,
          reg16}) ^~ {reg26})));
      reg49 <= reg14[(1'h0):(1'h0)];
      reg50 <= (^$signed(wire8));
      reg51 <= (~|reg26[(4'h9):(3'h7)]);
    end
  assign wire52 = reg26;
  assign wire53 = ($signed($signed(reg17[(2'h3):(2'h2)])) ?
                      (&((~|$signed((8'ha9))) <<< {(reg21 == reg14),
                          reg17[(3'h4):(1'h1)]})) : ((8'hbc) ?
                          (reg20 ?
                              wire45[(4'hb):(3'h4)] : ((8'hb2) ?
                                  (wire9 ? reg24 : reg20) : {reg47})) : reg49));
  assign wire54 = $signed(reg14);
  assign wire55 = (((8'ha2) != (reg24[(3'h5):(2'h2)] > wire9[(5'h15):(1'h0)])) ?
                      {{(&$unsigned(wire52)),
                              ((+reg26) ^~ $unsigned(reg15))}} : (|$unsigned((|$unsigned(reg15)))));
  always
    @(posedge clk) begin
      if ($signed($signed(wire10[(2'h3):(2'h3)])))
        begin
          reg56 <= $unsigned($unsigned($signed(reg47[(4'hc):(3'h5)])));
        end
      else
        begin
          if ((wire45 ? $signed((+$signed(reg13))) : (^reg47)))
            begin
              reg56 <= (~|wire53);
            end
          else
            begin
              reg56 <= ((reg14[(2'h2):(1'h0)] > (8'ha4)) ?
                  $unsigned(reg26[(2'h2):(2'h2)]) : {($unsigned($unsigned(reg26)) ?
                          ({reg18, reg47} ?
                              $signed(reg21) : $unsigned(wire8)) : $signed({wire11,
                              (8'haf)}))});
            end
          reg57 <= reg17;
          reg58 <= $signed((wire9[(3'h6):(3'h4)] >>> ((~|{(7'h42), wire9}) ?
              wire55[(3'h4):(3'h4)] : (reg51 ?
                  (^~wire12) : reg22[(2'h2):(1'h1)]))));
          reg59 <= $unsigned({$signed($unsigned(wire11[(5'h10):(3'h6)])),
              $unsigned((reg19[(3'h4):(1'h0)] ?
                  reg21 : wire27[(5'h11):(4'he)]))});
          reg60 <= $signed(({$unsigned((^~reg56)),
              reg50} || $signed($signed($signed(wire55)))));
        end
      if ({$unsigned($signed((reg20[(2'h3):(1'h0)] && (8'ha8))))})
        begin
          if ((~reg26))
            begin
              reg61 <= $signed(wire45);
            end
          else
            begin
              reg61 <= $unsigned(((8'ha3) ?
                  (^reg51) : (-((reg20 ^ reg48) - (reg18 ? wire8 : (8'haf))))));
              reg62 <= reg25;
            end
          reg63 <= $signed({(+{$signed(reg58)})});
          if (reg56[(4'h9):(4'h8)])
            begin
              reg64 <= (reg50 ~^ (7'h43));
              reg65 <= wire54[(4'hb):(4'h8)];
              reg66 <= wire54[(5'h13):(4'ha)];
              reg67 <= $signed({(($signed(reg22) || reg49[(3'h6):(1'h0)]) >>> wire8[(2'h2):(2'h2)]),
                  $signed({(~|wire53)})});
            end
          else
            begin
              reg64 <= ({$signed(($unsigned(reg14) & {(8'haf)})),
                      (~(|$unsigned(wire45)))} ?
                  (reg24[(3'h5):(3'h5)] && $unsigned((!(wire53 >>> reg17)))) : $unsigned($signed(reg67[(3'h4):(2'h3)])));
              reg65 <= reg66;
            end
        end
      else
        begin
          reg61 <= $signed(($unsigned(($signed(reg17) ?
                  (~wire54) : (!(8'hba)))) ?
              reg63[(3'h5):(1'h1)] : reg56[(2'h3):(1'h0)]));
          reg62 <= (!(~^$unsigned(wire12[(2'h2):(2'h2)])));
          if ((^$unsigned(reg60[(4'h8):(1'h1)])))
            begin
              reg63 <= (reg66[(1'h1):(1'h1)] & {((^$unsigned(reg67)) ?
                      {(reg18 ? reg62 : wire55)} : $unsigned((|reg64))),
                  (((wire11 ?
                      reg18 : wire12) < reg17[(1'h1):(1'h0)]) >>> reg22)});
              reg64 <= (((~&$unsigned((reg59 ? reg22 : reg25))) ?
                      {$unsigned($signed(reg67)),
                          ((wire54 || reg24) <<< reg66)} : reg66) ?
                  reg22[(4'hd):(4'hb)] : wire11);
              reg65 <= $signed((reg61 ? $unsigned(reg22) : {$unsigned(reg26)}));
              reg66 <= ((+(!(8'h9f))) >>> (((((8'h9f) ?
                          reg59 : reg21) != (~^reg18)) ?
                      $signed(reg20) : reg21[(3'h6):(3'h6)]) ?
                  (~^$unsigned((reg66 >>> reg61))) : (($unsigned((8'h9f)) > reg50[(1'h1):(1'h0)]) ?
                      (reg24 == $signed(reg59)) : (+reg24[(1'h1):(1'h1)]))));
              reg67 <= (|$unsigned(($signed({reg63}) ?
                  ((wire52 ? reg62 : (7'h44)) ?
                      (reg50 ?
                          (8'h9f) : reg16) : $unsigned(reg20)) : $signed(((8'haf) >>> wire27)))));
            end
          else
            begin
              reg63 <= reg62[(4'h8):(2'h2)];
              reg64 <= (({(^~(wire12 ?
                      (8'ha9) : (8'hbb)))} || $signed(reg64[(4'hc):(4'hc)])) <= $unsigned($signed((wire52 ?
                  (8'haa) : (7'h40)))));
              reg65 <= wire45;
            end
          reg68 <= ($unsigned(wire54) ?
              {((+((7'h43) == (8'hac))) ?
                      wire45 : reg58[(2'h3):(1'h0)])} : $signed(reg25[(2'h2):(2'h2)]));
        end
    end
  assign wire69 = $unsigned(wire55[(2'h3):(1'h0)]);
endmodule

module module28
#(parameter param44 = {(~(~|(8'ha6))), {{(&((8'hbd) >= (8'ha0))), ({(8'hb2)} ? ((8'hb8) ? (8'hb6) : (8'h9e)) : ((8'hab) >>> (8'ha8)))}, ((((8'h9d) >> (8'hba)) << ((8'ha2) ? (7'h41) : (8'haa))) + (8'hb9))}})
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = $signed(wire29[(4'hb):(3'h4)]);
  assign wire34 = wire32;
  assign wire35 = (^wire29);
  assign wire36 = wire30;
  assign wire37 = $unsigned(wire33[(5'h11):(4'he)]);
  assign wire38 = ($unsigned(wire36) * {(wire33[(3'h4):(1'h1)] == wire35)});
  assign wire39 = ((8'hac) << (-(wire38[(3'h6):(3'h4)] >>> wire30)));
  assign wire40 = $signed(((&$unsigned((-wire39))) ^~ ({$signed(wire36)} ?
                      {$unsigned(wire31)} : wire38[(3'h7):(3'h7)])));
  assign wire41 = {wire33,
                      (((+{wire35, wire33}) <= $signed(wire30)) ?
                          (wire37 ?
                              wire38[(1'h1):(1'h1)] : $signed($unsigned(wire38))) : $signed((+(wire36 ~^ wire33))))};
  assign wire42 = ($unsigned($signed(wire40)) & $unsigned($unsigned(((wire36 ?
                      wire39 : wire32) > $unsigned(wire41)))));
  assign wire43 = (!(~|wire31[(1'h0):(1'h0)]));
endmodule

module module192
#(parameter param224 = {(~(~^(((8'had) & (8'hb3)) >>> {(8'hb7), (8'hb1)}))), ((|(~&((8'ha3) ? (8'haa) : (8'ha5)))) ? (((7'h44) ? (-(8'ha8)) : ((8'ha1) ? (8'haa) : (8'ha7))) ? (8'hba) : {((8'ha7) ? (8'hb7) : (7'h41)), ((7'h44) ? (8'ha9) : (8'ha3))}) : ((+{(8'hb2), (8'h9e)}) < (~^((7'h44) ? (8'hba) : (8'ha6)))))})
(y, clk, wire197, wire196, wire195, wire194, wire193);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire197;
  input wire [(3'h4):(1'h0)] wire196;
  input wire signed [(4'hb):(1'h0)] wire195;
  input wire signed [(5'h10):(1'h0)] wire194;
  input wire [(3'h4):(1'h0)] wire193;
  wire signed [(5'h11):(1'h0)] wire223;
  wire [(2'h3):(1'h0)] wire222;
  wire [(4'h8):(1'h0)] wire217;
  wire [(5'h15):(1'h0)] wire216;
  wire signed [(5'h10):(1'h0)] wire215;
  reg signed [(4'he):(1'h0)] reg221 = (1'h0);
  reg [(2'h2):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg219 = (1'h0);
  reg [(4'h8):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg214 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(3'h7):(1'h0)] reg206 = (1'h0);
  reg [(3'h6):(1'h0)] reg205 = (1'h0);
  reg [(4'h8):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg203 = (1'h0);
  reg [(3'h5):(1'h0)] reg202 = (1'h0);
  reg [(4'hc):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg198 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire217,
                 wire216,
                 wire215,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
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
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg198 <= {{{$signed(((8'ha1) ? wire197 : wire195))}}};
      reg199 <= ($unsigned($unsigned($signed($signed(wire197)))) ^ $unsigned(wire193));
      reg200 <= {wire195,
          (((7'h40) ? wire195[(3'h5):(3'h4)] : (!$signed(wire195))) ?
              (|$unsigned((8'ha6))) : $signed((~{reg198})))};
      reg201 <= (reg199[(1'h1):(1'h1)] ?
          wire197 : $unsigned(wire195[(4'hb):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg202 <= $signed(reg200);
      if (((7'h42) ?
          (^~wire194[(4'hd):(3'h5)]) : ({$unsigned(reg202[(3'h5):(3'h4)]),
                  (~^(~|reg201))} ?
              reg200 : $signed((|wire194[(3'h7):(3'h7)])))))
        begin
          reg203 <= wire193[(2'h3):(2'h2)];
          if (wire194)
            begin
              reg204 <= ({(8'hb2)} ?
                  $unsigned(((-$unsigned((8'hae))) != (^~reg201[(4'ha):(3'h4)]))) : reg199[(3'h5):(2'h2)]);
              reg205 <= (reg203 - (($unsigned((+reg201)) ^~ $signed((-wire197))) ?
                  ($signed($signed(reg198)) & {((8'ha7) ?
                          reg204 : reg203)}) : wire196));
            end
          else
            begin
              reg204 <= {reg202, wire196};
              reg205 <= (~|$signed((reg205 ?
                  $unsigned($signed(reg198)) : $unsigned((reg200 ?
                      reg199 : (8'hbc))))));
              reg206 <= wire193;
              reg207 <= $unsigned(wire197[(2'h2):(2'h2)]);
              reg208 <= wire193[(1'h1):(1'h1)];
            end
          reg209 <= (((!$signed({reg199})) ?
              reg204[(2'h2):(2'h2)] : wire195) - reg204[(3'h5):(3'h4)]);
        end
      else
        begin
          reg203 <= wire195[(3'h7):(1'h0)];
          if ($signed(({wire196, reg202} ?
              $signed($signed(reg209)) : (|(&{wire196})))))
            begin
              reg204 <= $signed($unsigned((^~wire197)));
              reg205 <= wire195;
              reg206 <= (8'ha0);
              reg207 <= ({(~(8'ha0)),
                  $signed($signed((reg198 * reg202)))} >= (($unsigned((reg200 != wire194)) ?
                  reg209 : {reg208[(4'hf):(3'h7)]}) << wire197[(2'h2):(1'h1)]));
              reg208 <= reg204[(2'h2):(1'h1)];
            end
          else
            begin
              reg204 <= (^~(&($unsigned(reg198) ?
                  ((&wire196) ?
                      reg208[(4'he):(4'hb)] : wire197[(2'h2):(2'h2)]) : {(!reg199),
                      (-(7'h42))})));
            end
          if (($signed($signed(({reg202} ?
                  $unsigned(reg204) : (wire193 ? wire194 : reg199)))) ?
              $unsigned((~|{$signed((8'had)),
                  $unsigned(reg198)})) : (~$signed($signed({reg209})))))
            begin
              reg209 <= (&$unsigned((|((^~wire195) ?
                  wire196 : {reg201, reg209}))));
              reg210 <= (($unsigned(reg207[(3'h4):(2'h2)]) ?
                  $unsigned($unsigned({reg200})) : (~&(^reg208[(1'h1):(1'h1)]))) - reg209);
              reg211 <= (8'hb0);
            end
          else
            begin
              reg209 <= reg209[(4'hd):(4'hc)];
              reg210 <= (~&((reg207 <= $unsigned(reg203)) >> $signed(reg200)));
            end
          reg212 <= (|reg205);
          reg213 <= $signed($unsigned($signed($unsigned($signed(reg212)))));
        end
      reg214 <= (+{($signed($unsigned(reg204)) ?
              reg209[(3'h7):(3'h6)] : (~^(wire196 > (8'ha1)))),
          ((((8'ha9) ? reg199 : reg202) ?
                  $signed(reg204) : (reg210 ? wire194 : (8'ha1))) ?
              (|wire194) : $unsigned($signed((8'haa))))});
    end
  assign wire215 = $unsigned((reg209[(4'hb):(3'h7)] ?
                       $signed((reg207[(3'h5):(2'h3)] << reg200)) : $unsigned((^$signed(reg198)))));
  assign wire216 = reg207;
  assign wire217 = $unsigned($unsigned((($signed((8'ha5)) ?
                           (|wire193) : {reg214, reg214}) ?
                       reg206 : $signed((reg212 ? reg204 : reg214)))));
  always
    @(posedge clk) begin
      if ((^~reg201))
        begin
          reg218 <= {$unsigned((wire194[(4'hf):(3'h4)] || ($signed(reg204) ?
                  $signed(reg200) : $signed(wire193)))),
              $signed(({{reg201, (8'hb4)},
                  (wire216 ? reg198 : reg208)} ^ $signed((reg214 < reg211))))};
          if ({{$signed($unsigned((reg206 ? (8'hb2) : reg207))),
                  wire217[(1'h1):(1'h1)]},
              reg210})
            begin
              reg219 <= $unsigned(({(|$signed(wire194)),
                  reg204[(3'h7):(3'h7)]} - $signed(((~^wire193) ?
                  reg199[(4'hb):(1'h0)] : $signed((8'hab))))));
            end
          else
            begin
              reg219 <= (^$unsigned(reg211));
            end
          reg220 <= $signed((~&(reg204 ?
              (8'hb7) : (reg214[(4'hc):(4'ha)] + wire193))));
        end
      else
        begin
          reg218 <= ((8'hb4) ?
              (^($unsigned({reg218, wire216}) ?
                  (wire197 * ((8'hb1) ?
                      reg209 : reg214)) : wire196[(1'h1):(1'h1)])) : reg206);
          reg219 <= (~$signed(reg211));
          reg220 <= ({(8'hb5)} ?
              wire196[(2'h2):(2'h2)] : ($unsigned($unsigned((~^wire215))) && ((^$unsigned(reg204)) ~^ $signed(((7'h41) ?
                  wire216 : wire216)))));
        end
      reg221 <= $unsigned($signed(({reg209[(4'ha):(1'h0)],
          wire215[(3'h7):(3'h7)]} != reg210)));
    end
  assign wire222 = $unsigned(reg202[(3'h4):(3'h4)]);
  assign wire223 = (reg214[(2'h2):(2'h2)] ?
                       (8'ha8) : $signed(((reg201 ~^ (^~wire195)) >= $signed(reg213[(3'h4):(1'h0)]))));
endmodule

module module148
#(parameter param189 = (|(7'h42)))
(y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire153;
  input wire [(2'h2):(1'h0)] wire152;
  input wire signed [(4'hc):(1'h0)] wire151;
  input wire [(5'h10):(1'h0)] wire150;
  input wire [(5'h13):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire181;
  wire [(3'h5):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire [(3'h7):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(2'h2):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(5'h15):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire182,
                 wire181,
                 wire180,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 reg184,
                 reg183,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire150)
        begin
          if (wire153)
            begin
              reg154 <= (wire153 ?
                  $signed((wire149[(3'h6):(3'h4)] ?
                      $signed({wire152,
                          wire153}) : ((!(8'hbb)) || $signed(wire149)))) : wire151);
              reg155 <= wire153;
              reg156 <= wire153[(4'hd):(2'h3)];
              reg157 <= {((wire150[(4'ha):(4'ha)] ?
                          ({reg154} | wire151[(1'h0):(1'h0)]) : {(^wire151),
                              (wire151 < wire149)}) ?
                      $signed(wire153) : (~|reg156[(4'h9):(1'h0)]))};
            end
          else
            begin
              reg154 <= reg154[(3'h5):(2'h2)];
              reg155 <= wire153[(1'h1):(1'h1)];
              reg156 <= ($unsigned({(~^(~|reg154))}) - (((|((8'ha6) >>> reg156)) <= (^~wire151)) ?
                  reg155 : $signed($signed(reg156))));
              reg157 <= reg155[(2'h2):(2'h2)];
              reg158 <= (-wire149);
            end
          if (((^~wire153) ?
              $signed(($signed($signed(wire153)) ?
                  (~|reg156) : $unsigned(reg157))) : reg157[(3'h5):(3'h4)]))
            begin
              reg159 <= wire150;
            end
          else
            begin
              reg159 <= (~&reg158);
              reg160 <= reg157[(4'hd):(2'h3)];
            end
        end
      else
        begin
          reg154 <= ($signed(((^~(wire150 < wire152)) ?
                  $signed((wire149 ?
                      (8'ha4) : reg157)) : (~|$signed(reg157)))) ?
              (((~{reg154, wire149}) ?
                      $unsigned($unsigned(reg158)) : ((~^reg159) ^~ (reg158 ?
                          wire153 : wire153))) ?
                  (wire149 ?
                      $signed(reg155) : $unsigned(reg157[(1'h1):(1'h0)])) : {wire149[(4'hd):(3'h5)]}) : reg160[(4'he):(2'h3)]);
          if ($signed($signed($unsigned($signed($unsigned(reg156))))))
            begin
              reg155 <= wire151;
              reg156 <= reg160[(5'h15):(4'hb)];
              reg157 <= $signed({((^{reg155, (8'hb6)}) ?
                      $unsigned($signed((8'ha4))) : reg159[(5'h10):(4'h8)]),
                  $signed(((wire153 <= (7'h40)) >= $unsigned(wire153)))});
            end
          else
            begin
              reg155 <= wire150[(4'ha):(2'h2)];
              reg156 <= wire149[(1'h1):(1'h0)];
              reg157 <= (reg155[(1'h0):(1'h0)] + (($signed($unsigned(wire150)) > $signed((wire150 >> reg155))) ~^ (($signed((8'hac)) ?
                      (~|wire152) : {reg159, (8'hba)}) ?
                  reg158[(1'h0):(1'h0)] : wire149[(3'h7):(1'h1)])));
            end
          if ((reg156 && (wire150[(2'h2):(1'h0)] - $unsigned((8'hb2)))))
            begin
              reg158 <= $signed((|(!reg157)));
            end
          else
            begin
              reg158 <= (8'ha0);
              reg159 <= reg159;
              reg160 <= ($signed((((^~(8'h9d)) ?
                      (wire149 ? (8'hbe) : reg154) : ((8'ha7) ^ (8'hbc))) ?
                  reg154[(2'h2):(1'h0)] : (~^(reg159 ?
                      reg155 : wire153)))) ~^ $unsigned((reg156 ?
                  (reg159 ? $unsigned(wire151) : reg156) : ((^~wire152) ?
                      wire151 : wire153[(5'h11):(2'h3)]))));
              reg161 <= reg154;
              reg162 <= (&$unsigned($unsigned(({reg154,
                  reg161} <= (reg157 ^~ reg154)))));
            end
        end
      reg163 <= $unsigned((reg162[(2'h2):(1'h0)] ?
          reg157[(4'hd):(4'ha)] : $signed((+$signed(wire150)))));
    end
  assign wire164 = ($unsigned((((reg154 | reg161) >> (reg158 ?
                           reg157 : wire150)) ?
                       $unsigned($signed(reg162)) : wire151[(4'h9):(1'h0)])) << (-((((8'hbd) <<< wire152) * (reg159 ?
                           wire151 : reg158)) ?
                       $signed((8'hb7)) : reg158)));
  assign wire165 = (-($unsigned(wire152) >>> reg154));
  assign wire166 = {$signed(reg160[(2'h3):(2'h2)]), (|$unsigned(reg162))};
  assign wire167 = $unsigned({reg157});
  assign wire168 = wire153;
  assign wire169 = reg162[(1'h1):(1'h0)];
  assign wire170 = $unsigned(wire152);
  assign wire171 = reg158[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      if ($unsigned(wire169))
        begin
          reg172 <= (~&{(8'hb3)});
          reg173 <= ((wire152 ?
              (((8'hab) << (~|reg156)) ?
                  reg155[(3'h4):(2'h2)] : reg154) : {$unsigned((reg156 <<< reg156))}) + $unsigned($signed((|{wire165,
              reg159}))));
          reg174 <= (~|((!((reg172 != reg155) >>> (~^wire164))) ^~ ((wire151 ?
              wire151[(3'h7):(3'h5)] : $signed(reg172)) | $unsigned($signed(reg159)))));
        end
      else
        begin
          if (($signed($unsigned((wire165 ? wire168 : (^reg161)))) >> reg162))
            begin
              reg172 <= (wire151[(4'hc):(3'h6)] ?
                  $unsigned((+reg156)) : ((reg162 >= $unsigned(reg155[(1'h1):(1'h1)])) ?
                      ($unsigned((reg157 | wire152)) ?
                          ((^(8'haa)) <<< $unsigned(wire166)) : {reg156[(2'h3):(2'h3)],
                              {reg155,
                                  reg173}}) : (wire164 >> ($unsigned(wire169) & (&wire170)))));
              reg173 <= (reg154[(3'h5):(2'h3)] ?
                  (($signed((^~reg158)) >>> {$signed(wire165),
                          $signed(reg163)}) ?
                      ((wire166[(1'h0):(1'h0)] ^ (+reg157)) ?
                          (reg173[(4'hb):(2'h3)] * (reg159 ?
                              reg163 : reg159)) : $unsigned($unsigned((8'hb7)))) : {$unsigned($signed((8'haf)))}) : $signed($signed({wire165[(2'h2):(1'h1)],
                      reg174[(3'h6):(2'h3)]})));
            end
          else
            begin
              reg172 <= $unsigned((~&(((wire167 ? reg172 : (8'haf)) ?
                      $signed(wire165) : reg173[(1'h0):(1'h0)]) ?
                  (~&$unsigned(reg159)) : reg172)));
              reg173 <= $unsigned((reg154[(3'h6):(2'h3)] ?
                  wire151 : reg158[(4'hf):(3'h5)]));
            end
          if ((~(8'hb1)))
            begin
              reg174 <= ((wire166[(2'h2):(2'h2)] && reg172[(1'h0):(1'h0)]) ?
                  (((+(wire168 * reg156)) ?
                      (&(wire165 ?
                          reg154 : reg160)) : (~|{reg157})) <<< reg174) : (reg156 ?
                      $unsigned($signed($signed((8'hb0)))) : reg155[(1'h1):(1'h1)]));
              reg175 <= $signed({{reg158, $unsigned($unsigned(wire152))}});
            end
          else
            begin
              reg174 <= (-reg163[(1'h1):(1'h0)]);
              reg175 <= ($signed(((reg154 ?
                      (-wire166) : $unsigned(reg160)) <= (reg173 ?
                      (reg159 ? wire165 : reg155) : $signed((8'hba))))) ?
                  ($unsigned((^reg159)) - (wire151 ?
                      ({reg159, reg163} | (-reg163)) : {reg174,
                          $signed(wire151)})) : ({$unsigned(((7'h42) ?
                              wire170 : reg175))} ?
                      (wire164 << ((reg162 ?
                          reg155 : reg159) && (^~(8'hbb)))) : $signed(wire170)));
              reg176 <= (^~reg158);
            end
          if ((8'ha2))
            begin
              reg177 <= (+reg161[(3'h5):(2'h2)]);
            end
          else
            begin
              reg177 <= reg160;
              reg178 <= wire152[(2'h2):(1'h1)];
              reg179 <= wire152[(2'h2):(2'h2)];
            end
        end
    end
  assign wire180 = ((+(|((!reg155) ?
                       $signed((8'h9d)) : $signed(wire151)))) != $unsigned($unsigned((^~$unsigned((8'had))))));
  assign wire181 = ($signed({(~reg161)}) <= $signed(({reg157[(4'hc):(1'h1)],
                       reg176[(4'hb):(4'h8)]} ~^ (reg174[(2'h2):(2'h2)] >> (|wire149)))));
  assign wire182 = ($unsigned(($unsigned({(8'hb5), (7'h43)}) + ((~&reg174) ?
                           (+(7'h40)) : (wire151 ? reg162 : reg175)))) ?
                       (~&(($unsigned(reg176) ?
                           (8'hb3) : {reg156,
                               reg176}) ^ $signed((reg179 && wire167)))) : ($unsigned(wire165) || reg175));
  always
    @(posedge clk) begin
      reg183 <= (^((^~$unsigned(wire164[(4'hb):(4'hb)])) ?
          (({reg175} << reg161) ?
              wire164 : ((^reg163) ?
                  (~|reg174) : wire164[(3'h5):(2'h3)])) : {(~|(^(8'hbd))),
              (wire164[(3'h7):(2'h2)] ?
                  $signed(reg155) : reg177[(4'h9):(3'h4)])}));
      reg184 <= wire181[(4'he):(1'h1)];
    end
  assign wire185 = ($unsigned(reg183) ?
                       wire152[(2'h2):(2'h2)] : {(((^~wire164) ?
                                   (~|wire165) : {reg163, reg174}) ?
                               (~|(reg158 > wire153)) : $unsigned((wire181 - reg161))),
                           (&wire170)});
  assign wire186 = (~&(wire166[(2'h2):(1'h1)] >> {$unsigned((reg159 ?
                           wire167 : wire153))}));
  assign wire187 = (~(reg156 && ((((7'h41) ? wire168 : reg157) ?
                           reg159 : $signed((8'hbf))) ?
                       (reg156[(4'hd):(2'h3)] << reg159[(3'h5):(2'h2)]) : $unsigned($unsigned(wire181)))));
  assign wire188 = {(reg156 <<< $unsigned(((reg174 ?
                           (8'hbc) : wire169) >>> $unsigned(reg160))))};
endmodule

module module101
#(parameter param144 = {(|((~|(8'ha3)) ? ({(8'ha2)} && ((7'h44) ? (8'hae) : (8'hb8))) : ((7'h40) ^ ((8'hba) ? (8'hb7) : (8'ha7))))), ((({(8'h9f)} ? ((8'ha2) ? (8'ha7) : (8'ha5)) : (~|(8'hb7))) ? {(+(7'h44)), (~(8'hb9))} : ((~(8'hb9)) ? ((8'hbb) ? (7'h41) : (8'hb5)) : {(8'h9e)})) + ((((8'hb5) ? (8'ha9) : (7'h43)) + (8'ha8)) >> ((^~(8'hbf)) != ((8'ha7) ? (8'h9f) : (8'ha1)))))})
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire105;
  input wire [(2'h2):(1'h0)] wire104;
  input wire [(2'h3):(1'h0)] wire103;
  input wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire141;
  wire signed [(4'ha):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire [(5'h15):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(3'h6):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 reg143,
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
                 reg118,
                 reg117,
                 reg116,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg106 <= wire104;
      if (wire104)
        begin
          reg107 <= ($unsigned((+({wire103,
              wire102} ^~ $unsigned(wire104)))) && ($signed($unsigned($signed(wire105))) * {$signed((wire103 ?
                  wire104 : wire103)),
              (~^(&wire102))}));
          reg108 <= ($signed($unsigned({(wire105 ? reg107 : wire105)})) ?
              $unsigned($unsigned((wire105[(1'h0):(1'h0)] ?
                  wire103 : $unsigned(wire104)))) : ($signed(((wire105 ?
                      reg107 : reg106) ?
                  $unsigned(wire102) : ((8'hbd) ?
                      wire104 : wire102))) < {((reg106 <= reg106) ?
                      (wire103 <<< wire102) : (wire103 ? (7'h43) : reg107)),
                  {(7'h43), wire103}}));
        end
      else
        begin
          reg107 <= (((!({reg108} - $signed(reg106))) >> ((8'hbd) ?
              $signed($signed(reg107)) : $signed(wire103))) < ($signed({(reg106 ^ (8'ha9)),
                  wire105[(2'h2):(1'h1)]}) ?
              wire102[(3'h6):(3'h4)] : $unsigned(reg108)));
        end
      reg109 <= $unsigned({reg106,
          ((8'hb1) ?
              ($signed(reg108) ?
                  (wire105 ?
                      wire104 : reg108) : $unsigned(wire104)) : $signed(wire103[(2'h3):(1'h1)]))});
      reg110 <= reg107[(5'h12):(4'hc)];
      reg111 <= (reg109[(2'h2):(2'h2)] ?
          ($signed(wire105[(1'h0):(1'h0)]) | {$unsigned((~reg109))}) : reg107);
    end
  assign wire112 = reg109[(5'h10):(4'he)];
  assign wire113 = ($unsigned(({$signed(wire112)} ^~ $signed((wire104 ?
                           reg109 : reg111)))) ?
                       $signed($signed(((|reg106) ?
                           wire104 : (^~reg107)))) : $signed(wire104[(2'h2):(2'h2)]));
  assign wire114 = (^~$unsigned((8'hba)));
  assign wire115 = reg111;
  always
    @(posedge clk) begin
      if (((+wire112[(1'h1):(1'h0)]) ^~ $signed($unsigned(({wire104,
          reg109} >> $unsigned(reg107))))))
        begin
          reg116 <= $signed(wire105[(1'h1):(1'h0)]);
          reg117 <= $signed((&((((8'ha7) != reg107) ?
                  (reg110 ? reg107 : (8'had)) : (reg116 ? wire102 : wire112)) ?
              {{reg109}} : {(wire113 != reg108)})));
          if (wire113)
            begin
              reg118 <= ({{$unsigned(wire114)}, $unsigned(reg108)} ?
                  {reg111, reg111[(2'h3):(2'h2)]} : ((~^($signed(wire105) ?
                      (wire103 ? wire112 : reg111) : (reg117 ?
                          reg110 : wire102))) >= wire112));
              reg119 <= $unsigned(((|$signed((reg111 ^ wire113))) ?
                  reg118[(4'ha):(4'ha)] : (((reg107 - wire114) ?
                          reg116[(5'h10):(3'h6)] : $signed(wire112)) ?
                      ((~reg111) <<< (8'hb5)) : {$signed(wire115),
                          $unsigned(reg108)})));
              reg120 <= (^~(^~{($signed((7'h40)) ? (8'hac) : $unsigned(reg106)),
                  $signed($signed(reg107))}));
              reg121 <= reg108;
            end
          else
            begin
              reg118 <= (^($signed(wire102) > reg111[(3'h6):(3'h6)]));
              reg119 <= $unsigned(($unsigned(reg109[(5'h10):(4'h9)]) && (&wire113)));
            end
          reg122 <= {($unsigned($signed(wire103[(1'h1):(1'h0)])) != $signed($unsigned((reg120 >>> (8'h9f))))),
              {reg118}};
        end
      else
        begin
          reg116 <= wire112;
        end
      if ((8'hb9))
        begin
          reg123 <= (|$signed(wire114[(3'h7):(3'h5)]));
          reg124 <= (&(((~$signed(wire102)) << ($signed(wire115) & $signed(wire103))) ?
              $signed((((8'ha4) ~^ (8'hb2)) ?
                  $signed((8'hb9)) : {(8'hac),
                      reg123})) : (($unsigned(wire113) | reg110[(4'hc):(4'hb)]) ?
                  (reg116[(4'hd):(4'h8)] && $signed((8'hbe))) : reg120[(3'h6):(2'h3)])));
          reg125 <= ({$signed(((wire104 - wire104) ?
                  $unsigned(reg108) : {reg124}))} >>> wire113[(1'h0):(1'h0)]);
          if ({$unsigned(reg121[(1'h0):(1'h0)]),
              {$signed(reg111[(3'h6):(2'h2)]),
                  $signed((-(wire113 || reg118)))}})
            begin
              reg126 <= $signed((!$signed($unsigned((reg117 ?
                  (8'hb6) : reg123)))));
            end
          else
            begin
              reg126 <= $unsigned(reg108);
              reg127 <= $signed({$unsigned($unsigned($unsigned(reg118)))});
              reg128 <= $unsigned((^~$signed({(|wire114)})));
              reg129 <= $unsigned((($signed((^~wire112)) <= (reg121[(3'h5):(1'h0)] ?
                      {reg127, reg123} : (wire105 ? reg122 : reg123))) ?
                  ({(reg121 ? wire103 : reg122),
                      (wire102 ? wire113 : reg123)} & $unsigned((reg106 ?
                      reg121 : reg119))) : $signed($unsigned({reg124,
                      reg110}))));
              reg130 <= $unsigned((!wire102[(3'h4):(2'h2)]));
            end
        end
      else
        begin
          reg123 <= (reg120[(3'h6):(3'h6)] ?
              $unsigned($unsigned(($signed(reg106) ?
                  {reg117, reg123} : (~wire102)))) : ($unsigned((8'haf)) ?
                  ($signed($unsigned(reg116)) ?
                      {{reg121}} : wire104[(1'h0):(1'h0)]) : {$unsigned((+reg110)),
                      $signed((^reg117))}));
          reg124 <= reg117[(1'h1):(1'h1)];
          reg125 <= $signed((~(($unsigned(reg127) - reg128[(3'h5):(3'h5)]) ^~ $unsigned((^wire114)))));
          reg126 <= reg121;
        end
      reg131 <= reg129;
      reg132 <= (wire104 >> {reg129[(1'h1):(1'h1)]});
      reg133 <= $signed(reg127[(1'h1):(1'h1)]);
    end
  assign wire134 = (8'hbb);
  assign wire135 = ($unsigned(({wire105, reg124} ?
                           (~(reg131 <<< reg130)) : reg121)) ?
                       reg130[(3'h4):(2'h2)] : reg123);
  assign wire136 = {(!$unsigned(reg127[(1'h0):(1'h0)])),
                       ((reg121 ^ (+(wire104 <= reg117))) ?
                           $unsigned(reg106) : (-wire135[(4'hd):(4'hd)]))};
  assign wire137 = (((-{(reg117 ? reg117 : (8'hb6)),
                           (reg111 ? reg130 : wire115)}) <= (reg125 ?
                           reg130 : ({reg110} ?
                               $signed(reg133) : (reg120 > reg127)))) ?
                       reg110[(4'hd):(4'h9)] : $signed((^~reg126[(3'h4):(1'h1)])));
  assign wire138 = (~&({($unsigned(reg118) ?
                               $unsigned(reg117) : reg129[(1'h1):(1'h0)])} ?
                       $unsigned(reg130) : $unsigned({reg123[(3'h5):(3'h4)],
                           $unsigned(reg133)})));
  assign wire139 = (($signed(wire104[(2'h2):(1'h1)]) ?
                       ($unsigned($signed(reg125)) ?
                           reg129[(1'h1):(1'h0)] : {wire104[(1'h1):(1'h0)]}) : reg128[(3'h5):(2'h3)]) - reg107);
  assign wire140 = $unsigned({((|reg117) ?
                           (reg107[(4'hf):(4'hd)] ?
                               (~&(8'ha5)) : reg133[(2'h2):(1'h1)]) : (reg107[(4'ha):(4'ha)] ^~ (+reg128))),
                       $signed((~reg130))});
  assign wire141 = $signed({$unsigned((reg108 == reg120))});
  assign wire142 = $unsigned($unsigned((((^(8'hba)) ?
                           reg126[(4'h8):(3'h4)] : (reg128 ?
                               wire137 : reg131)) ?
                       ({reg111} - reg106) : $unsigned($unsigned(reg120)))));
  always
    @(posedge clk) begin
      reg143 <= {reg122};
    end
endmodule

module top
#(parameter param273 = (^~(8'hba)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire272;
  wire signed [(5'h11):(1'h0)] wire271;
  wire signed [(5'h15):(1'h0)] wire270;
  wire signed [(4'hf):(1'h0)] wire269;
  wire [(4'h9):(1'h0)] wire268;
  wire [(3'h5):(1'h0)] wire267;
  wire signed [(2'h2):(1'h0)] wire266;
  wire [(5'h15):(1'h0)] wire256;
  wire [(5'h14):(1'h0)] wire255;
  wire signed [(5'h14):(1'h0)] wire254;
  wire [(5'h15):(1'h0)] wire252;
  wire [(5'h14):(1'h0)] wire247;
  wire [(5'h10):(1'h0)] wire246;
  wire signed [(3'h7):(1'h0)] wire245;
  wire signed [(5'h15):(1'h0)] wire244;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire242;
  reg [(4'hb):(1'h0)] reg265 = (1'h0);
  reg [(2'h2):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg263 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg262 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg261 = (1'h0);
  reg [(5'h15):(1'h0)] reg260 = (1'h0);
  reg [(4'hc):(1'h0)] reg259 = (1'h0);
  reg [(3'h7):(1'h0)] reg258 = (1'h0);
  reg [(5'h10):(1'h0)] reg251 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg249 = (1'h0);
  reg [(4'he):(1'h0)] reg248 = (1'h0);
  assign y = {wire272,
                 wire271,
                 wire270,
                 wire269,
                 wire268,
                 wire267,
                 wire266,
                 wire256,
                 wire255,
                 wire254,
                 wire252,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire97,
                 wire7,
                 wire6,
                 wire5,
                 wire99,
                 wire242,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 (1'h0)};
  assign wire5 = (($unsigned(wire1[(2'h2):(1'h0)]) ?
                         $unsigned((8'hb0)) : ((~(!wire4)) ?
                             (~(!wire0)) : $signed(wire3))) ?
                     (!({$unsigned(wire4), wire2[(4'h8):(3'h7)]} ?
                         wire2[(3'h5):(2'h2)] : $signed(wire0[(1'h1):(1'h1)]))) : (wire0[(3'h4):(2'h3)] >= (~wire2[(3'h7):(3'h6)])));
  assign wire6 = {(wire4[(4'h9):(1'h1)] > (|($unsigned(wire4) << $signed((8'hac)))))};
  assign wire7 = (~|wire3[(2'h2):(1'h0)]);
  module8 #() modinst98 (.wire12(wire5), .wire10(wire3), .wire13(wire0), .wire11(wire2), .wire9(wire7), .clk(clk), .y(wire97));
  assign wire99 = $unsigned(($signed($signed($signed(wire6))) ?
                      (wire0[(5'h11):(4'ha)] ?
                          (~(wire3 ~^ wire1)) : wire0) : ((!(8'hbb)) * $unsigned({wire0,
                          wire6}))));
  module100 #() modinst243 (.wire102(wire2), .wire105(wire3), .wire103(wire6), .wire101(wire99), .clk(clk), .wire104(wire97), .y(wire242));
  assign wire244 = wire97;
  assign wire245 = $unsigned(($unsigned(((+(8'ha6)) ?
                           (7'h43) : wire7[(3'h7):(3'h5)])) ?
                       wire6 : {wire242[(3'h6):(1'h0)]}));
  assign wire246 = $unsigned($unsigned(wire99));
  assign wire247 = $unsigned(wire97);
  always
    @(posedge clk) begin
      reg248 <= $signed(wire242[(4'h8):(2'h3)]);
      reg249 <= ({wire244,
              (({reg248} ?
                  $signed(wire6) : $signed((8'ha8))) == reg248[(3'h7):(3'h4)])} ?
          wire5[(1'h0):(1'h0)] : $signed((!wire7[(5'h10):(1'h1)])));
      reg250 <= (!wire247);
      reg251 <= $signed(((~|$unsigned((^reg250))) | wire5[(1'h0):(1'h0)]));
    end
  module8 #() modinst253 (wire252, clk, wire99, wire3, reg251, wire247, wire242);
  assign wire254 = (wire246 ^ $signed(($signed((~&wire247)) ?
                       (wire252[(1'h1):(1'h0)] <= (reg251 << wire7)) : (~^(wire246 ?
                           reg249 : (8'had))))));
  assign wire255 = ($signed($signed($unsigned(reg250[(1'h0):(1'h0)]))) ?
                       $signed(wire246) : $unsigned(reg251));
  module188 #() modinst257 (.wire193(reg249), .y(wire256), .wire190(wire242), .wire192(wire0), .clk(clk), .wire189(wire6), .wire191(wire252));
  always
    @(posedge clk) begin
      if (wire242[(2'h3):(1'h1)])
        begin
          if ((+(+$unsigned((~^(~&wire246))))))
            begin
              reg258 <= (($unsigned(((!(8'hae)) != {(7'h40)})) ?
                      ((^~wire97[(4'h9):(3'h5)]) ?
                          $signed($unsigned(wire1)) : ((wire5 ?
                              (7'h41) : wire3) << (&(8'hbc)))) : {(^~(-wire6)),
                          wire255[(5'h12):(1'h0)]}) ?
                  {wire245[(3'h6):(3'h5)]} : $unsigned(reg248[(3'h4):(3'h4)]));
              reg259 <= {($signed((~|$unsigned(reg250))) << (wire3 ?
                      wire255 : ({reg250, wire246} <= wire246)))};
            end
          else
            begin
              reg258 <= (reg258 <<< wire247[(5'h14):(5'h11)]);
              reg259 <= (~|(((!(8'hb0)) ^ ((&wire255) ?
                      (reg258 || wire6) : reg259)) ?
                  reg250 : (((7'h40) ?
                      (wire3 ^~ wire1) : wire247) >= wire6[(4'hf):(2'h2)])));
            end
          reg260 <= $signed(reg250);
          if (reg258)
            begin
              reg261 <= {(+$signed((wire247[(4'he):(3'h6)] >>> wire246)))};
              reg262 <= wire6[(3'h6):(3'h5)];
              reg263 <= $signed({(reg249 <= ($signed(reg260) + $unsigned(reg251))),
                  $unsigned($signed(wire4[(1'h1):(1'h1)]))});
              reg264 <= wire245[(3'h4):(2'h3)];
            end
          else
            begin
              reg261 <= reg249;
              reg262 <= $signed((-((-reg262[(1'h1):(1'h0)]) ?
                  $signed($signed(wire6)) : wire245[(1'h0):(1'h0)])));
              reg263 <= $signed((^(~$signed({(8'h9e)}))));
            end
          reg265 <= (wire244 ?
              {$unsigned(($unsigned(reg263) || (wire245 ?
                      wire0 : wire6)))} : ((|(8'hba)) ~^ ((((8'hb9) ?
                  wire242 : wire6) ^~ $signed((8'hbb))) >>> ((wire2 ?
                      (7'h44) : wire3) ?
                  reg260[(4'hc):(4'h9)] : (~&wire244)))));
        end
      else
        begin
          reg258 <= wire246[(3'h6):(2'h3)];
        end
    end
  assign wire266 = $unsigned(wire99[(4'hc):(4'h9)]);
  assign wire267 = (((~|reg248) ?
                           $signed(reg260) : ({{reg251, wire2},
                                   $signed(reg263)} ?
                               {(wire6 - reg250)} : ($signed(wire3) ?
                                   (wire245 ?
                                       wire255 : wire97) : (wire246 > (8'hb9))))) ?
                       (reg259[(2'h3):(1'h0)] ?
                           wire244 : wire244[(5'h12):(5'h10)]) : $unsigned($signed((reg251[(3'h6):(2'h3)] ?
                           (&reg264) : $signed(reg259)))));
  assign wire268 = reg260[(5'h15):(4'hc)];
  assign wire269 = ($unsigned(wire4[(4'ha):(2'h3)]) ?
                       $signed((8'hb5)) : (&$unsigned((-wire268[(3'h4):(2'h2)]))));
  assign wire270 = wire268;
  assign wire271 = (8'haf);
  assign wire272 = reg250[(2'h2):(2'h2)];
endmodule

module module100
#(parameter param241 = (^((^~((|(8'hbf)) << (^(7'h44)))) ? {(^(8'hb5)), (((8'hb6) && (8'ha0)) ? {(7'h42), (8'hb2)} : (8'ha5))} : (((|(8'ha7)) ? ((8'ha6) ? (8'h9d) : (8'h9e)) : {(7'h42)}) ? (((8'h9d) <<< (8'hb1)) & ((8'hbc) & (8'ha1))) : (&((8'hbb) && (8'ha0)))))))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire105;
  input wire signed [(4'he):(1'h0)] wire104;
  input wire signed [(5'h15):(1'h0)] wire103;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire [(5'h14):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire240;
  wire signed [(3'h4):(1'h0)] wire239;
  wire signed [(5'h12):(1'h0)] wire238;
  wire [(3'h5):(1'h0)] wire234;
  wire [(3'h6):(1'h0)] wire211;
  wire signed [(5'h15):(1'h0)] wire181;
  wire [(4'he):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire [(5'h11):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire184;
  wire signed [(5'h14):(1'h0)] wire186;
  wire signed [(2'h3):(1'h0)] wire187;
  wire [(3'h4):(1'h0)] wire209;
  wire signed [(5'h13):(1'h0)] wire236;
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire238,
                 wire234,
                 wire211,
                 wire181,
                 wire166,
                 wire165,
                 wire164,
                 wire132,
                 wire134,
                 wire135,
                 wire162,
                 wire183,
                 wire184,
                 wire186,
                 wire187,
                 wire209,
                 wire236,
                 reg185,
                 (1'h0)};
  module106 #() modinst133 (.clk(clk), .wire110(wire105), .wire108(wire101), .wire109(wire104), .wire111(wire102), .y(wire132), .wire107(wire103));
  assign wire134 = $unsigned($signed({(!(wire101 ? wire132 : wire102))}));
  assign wire135 = $unsigned((8'ha8));
  module136 #() modinst163 (wire162, clk, wire104, wire101, wire135, wire132, wire102);
  assign wire164 = $signed($signed($unsigned(($unsigned(wire101) * wire104[(3'h4):(1'h0)]))));
  assign wire165 = wire135[(3'h6):(3'h5)];
  assign wire166 = wire135[(4'hb):(4'hb)];
  module167 #() modinst182 (wire181, clk, wire104, wire162, wire134, wire135, wire166);
  assign wire183 = ({{wire162[(2'h2):(1'h1)],
                           wire103}} && $signed($signed(((wire164 > wire165) == ((8'ha8) ?
                       wire101 : wire166)))));
  assign wire184 = (((8'hab) ?
                           $unsigned(wire134[(3'h6):(2'h2)]) : {$signed($signed(wire162))}) ?
                       {wire181[(4'hb):(4'h9)]} : $unsigned(wire102[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg185 <= wire181;
    end
  assign wire186 = wire164;
  assign wire187 = wire162;
  module188 #() modinst210 (wire209, clk, wire183, wire105, wire184, wire181, wire164);
  assign wire211 = (8'hb0);
  module212 #() modinst235 (wire234, clk, wire134, wire184, wire211, wire165, wire132);
  module167 #() modinst237 (wire236, clk, wire132, wire181, wire102, wire164, wire103);
  assign wire238 = ((wire187 << ((wire162[(5'h12):(2'h2)] ?
                           wire165 : ((8'ha0) ?
                               wire166 : wire132)) <<< ((^wire184) ?
                           (^~wire101) : (wire164 ~^ (8'h9f))))) ?
                       wire132 : $signed(wire132));
  assign wire239 = $signed(wire101);
  assign wire240 = wire134;
endmodule

module module8
#(parameter param96 = (7'h40))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  assign y = {wire84,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire15,
                 wire14,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire14 = ($signed((((wire13 ? (7'h40) : wire13) ? wire11 : (+wire13)) ?
                      (~&wire12[(2'h2):(2'h2)]) : ($unsigned(wire9) && (&(8'hbf))))) * ($unsigned($unsigned(((7'h40) * wire12))) <<< $unsigned(wire9)));
  assign wire15 = $signed((^~(^(wire12[(2'h3):(2'h2)] + (wire9 ?
                      wire14 : wire10)))));
  module16 #() modinst58 (.wire19(wire14), .clk(clk), .wire17(wire13), .wire20(wire10), .y(wire57), .wire18(wire9));
  assign wire59 = (({$unsigned({wire9, wire10})} ?
                      (((wire13 ? wire13 : wire11) ?
                          (wire10 ?
                              wire13 : wire14) : $unsigned(wire15)) ~^ ($unsigned(wire15) - ((8'ha7) ?
                          wire10 : (7'h43)))) : (-($unsigned((8'had)) >> $unsigned(wire14)))) && wire11[(4'hc):(4'hc)]);
  assign wire60 = (~^$unsigned(($unsigned((^(8'h9e))) ?
                      ($unsigned(wire13) ?
                          $signed((8'hb2)) : (wire57 * wire14)) : wire11[(3'h4):(3'h4)])));
  assign wire61 = (wire12 ?
                      $unsigned($signed(((~|wire9) ?
                          (8'ha4) : wire9))) : (^$signed({$unsigned(wire11)})));
  module62 #() modinst74 (.y(wire73), .wire63(wire11), .wire64(wire10), .clk(clk), .wire66(wire61), .wire65(wire15));
  assign wire75 = wire10;
  assign wire76 = {wire59, (8'hac)};
  assign wire77 = $signed(wire12[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg78 <= $signed(($unsigned((wire15 ?
          wire59 : (wire77 ? wire76 : wire61))) * (+(wire77 + wire12))));
      if ($signed(wire57[(3'h5):(1'h1)]))
        begin
          reg79 <= wire73;
        end
      else
        begin
          if ({(^(^~$unsigned($unsigned(wire59)))), wire57})
            begin
              reg79 <= ((-({(-(8'hb6)), (~&wire61)} ?
                      $signed((wire10 != wire77)) : wire13)) ?
                  (8'ha0) : wire76);
            end
          else
            begin
              reg79 <= ((~&$unsigned((wire11[(4'he):(3'h7)] > wire76))) ?
                  ((wire14 ? wire14 : $unsigned({wire77})) ?
                      wire57[(2'h2):(1'h0)] : (^~(((8'h9c) ~^ wire9) ^ (wire77 <<< wire57)))) : (&reg79));
            end
          reg80 <= ($unsigned(wire13[(5'h13):(3'h7)]) ?
              (~|(~^$signed(wire75))) : wire61[(4'hc):(3'h5)]);
          reg81 <= wire60;
          reg82 <= wire14[(4'h9):(3'h6)];
        end
      reg83 <= (wire57[(1'h0):(1'h0)] ~^ wire57);
    end
  assign wire84 = wire13;
  always
    @(posedge clk) begin
      reg85 <= $unsigned($signed($unsigned(wire76[(1'h0):(1'h0)])));
      if ($unsigned(wire9[(1'h1):(1'h1)]))
        begin
          reg86 <= wire60;
          reg87 <= $unsigned((+$signed((~&$signed(wire77)))));
        end
      else
        begin
          reg86 <= wire73;
          reg87 <= $signed($signed((wire15 ?
              ((wire13 >>> (8'hb4)) ?
                  $unsigned(wire57) : (!wire75)) : wire59[(1'h1):(1'h0)])));
          reg88 <= (((wire75 ?
                  ((reg85 << reg80) ?
                      (~wire73) : (wire14 ?
                          wire14 : reg83)) : reg85[(2'h3):(2'h3)]) ~^ $signed($unsigned((8'hbc)))) ?
              wire59 : ($signed($unsigned($signed(reg83))) ?
                  wire11[(4'hd):(1'h1)] : $unsigned($signed(((8'haf) == reg79)))));
          if ((+$unsigned($signed((((8'hba) ? wire10 : reg88) ?
              wire61 : ((8'ha5) < wire12))))))
            begin
              reg89 <= wire14[(1'h1):(1'h0)];
            end
          else
            begin
              reg89 <= $signed((($signed(reg85[(4'hd):(4'h8)]) ?
                      $signed($signed(wire15)) : reg87) ?
                  (((wire60 ? reg78 : wire9) == wire60) ?
                      (~wire13[(1'h1):(1'h1)]) : (-(8'hb2))) : {reg83,
                      (|(8'h9c))}));
              reg90 <= ((reg83 ?
                  (!((reg85 != reg81) >> wire11[(2'h2):(2'h2)])) : (($signed(wire12) ?
                          $signed((8'ha6)) : wire73) ?
                      {(wire84 ?
                              reg85 : wire9)} : (~wire13))) * wire15[(4'he):(3'h7)]);
            end
          reg91 <= {wire10[(4'hb):(1'h0)],
              $signed(((^~$unsigned(reg88)) ?
                  $signed($unsigned((7'h43))) : reg83))};
        end
      if ((reg85[(4'h9):(2'h2)] ^~ (|$unsigned((8'hbe)))))
        begin
          reg92 <= (+($unsigned($unsigned(reg89)) >> wire73[(2'h3):(1'h1)]));
        end
      else
        begin
          reg92 <= $unsigned(reg80);
          reg93 <= ((reg82[(4'ha):(3'h4)] ?
                  $signed($signed((reg91 != wire15))) : (~$signed($unsigned(wire61)))) ?
              $unsigned((~(^$unsigned(wire60)))) : ($signed((~&$signed(wire12))) + (^(8'hae))));
        end
      reg94 <= wire73;
      reg95 <= (-(8'hac));
    end
endmodule

module module62
#(parameter param71 = ({((((8'ha6) ? (7'h44) : (7'h41)) > {(7'h44)}) ? (-{(8'ha2), (8'hbe)}) : ((~&(7'h40)) >>> ((8'h9f) ^~ (8'hbf))))} << (7'h40)), 
parameter param72 = (+param71))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h20):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire66;
  input wire [(2'h2):(1'h0)] wire65;
  input wire signed [(2'h2):(1'h0)] wire64;
  input wire [(3'h7):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  assign y = {wire70, wire69, wire68, wire67, (1'h0)};
  assign wire67 = {$signed($unsigned($signed(wire64))), wire63};
  assign wire68 = {(~((8'hba) >> $unsigned(wire65[(1'h1):(1'h1)]))),
                      ((~&(wire65 ? $unsigned(wire66) : $signed((8'ha2)))) ?
                          wire64[(1'h1):(1'h1)] : wire64[(1'h1):(1'h0)])};
  assign wire69 = {(|$signed(wire67[(2'h2):(1'h1)])),
                      (^~wire66[(4'hb):(1'h1)])};
  assign wire70 = (((($unsigned(wire63) ?
                      (wire69 ?
                          wire63 : (8'hbb)) : {wire67}) >>> $unsigned((8'had))) ~^ wire63[(3'h6):(3'h5)]) & wire65[(1'h0):(1'h0)]);
endmodule

module module16
#(parameter param56 = ((8'hb4) != (({((8'ha0) || (8'hbe)), ((8'ha8) ? (8'hae) : (8'hb2))} - ({(8'hb5), (8'ha9)} << {(8'h9e)})) ? {(|((8'hab) ? (8'ha6) : (8'ha6)))} : ((((8'ha5) ? (8'ha2) : (8'ha4)) >= ((8'h9c) < (8'hba))) >>> {{(8'ha5)}, ((8'h9e) ? (7'h40) : (8'ha2))}))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg44,
                 reg43,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire21 = (wire19 * wire17);
  assign wire22 = (-$unsigned(wire18[(1'h0):(1'h0)]));
  assign wire23 = (wire17 | $unsigned(wire19[(2'h3):(2'h2)]));
  assign wire24 = {(wire19[(3'h4):(1'h1)] == {(8'ha6), {(+wire20)}})};
  assign wire25 = ({($unsigned((wire20 >= wire19)) != wire22[(1'h0):(1'h0)]),
                          wire24} ?
                      wire18 : (~|$signed($signed($signed(wire17)))));
  assign wire26 = (wire18 || (($unsigned(wire23) >= (~^{wire20, (7'h41)})) ?
                      (((~|wire20) * $signed(wire23)) <= $unsigned((wire24 ?
                          wire20 : wire25))) : (wire23 << ({wire21} << (wire24 ?
                          wire23 : (8'hb4))))));
  assign wire27 = (wire22 ~^ wire23);
  assign wire28 = wire17;
  assign wire29 = wire23;
  assign wire30 = (8'hae);
  always
    @(posedge clk) begin
      reg31 <= ($signed($unsigned({$signed((8'hac)),
          ((8'h9c) ? wire21 : wire23)})) > {wire26,
          $signed($unsigned({(7'h44)}))});
      reg32 <= wire28[(2'h3):(1'h0)];
      reg33 <= reg32;
    end
  assign wire34 = (8'hb1);
  assign wire35 = wire19[(1'h0):(1'h0)];
  assign wire36 = ($signed(wire19[(3'h5):(1'h1)]) || $unsigned($unsigned($signed(wire22))));
  assign wire37 = (((~^wire26) | $unsigned(((8'hb4) ?
                      (wire19 ?
                          wire26 : wire17) : (~|wire18)))) <<< ((8'hbf) ^ $signed(wire36)));
  assign wire38 = {$signed(wire18[(1'h1):(1'h0)])};
  assign wire39 = (wire21 ?
                      $signed(($signed($signed(wire29)) <= $unsigned($unsigned(wire36)))) : $unsigned((!wire29[(4'h8):(2'h3)])));
  assign wire40 = wire19[(1'h1):(1'h1)];
  assign wire41 = (wire30[(1'h0):(1'h0)] ?
                      (-$signed({(8'hb3),
                          wire21})) : {(|(~^$unsigned(wire30)))});
  assign wire42 = (!$unsigned(wire34[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg43 <= wire38[(4'hf):(2'h3)];
      reg44 <= wire42;
      if ($signed(wire20[(4'h9):(3'h6)]))
        begin
          if ($signed((8'ha6)))
            begin
              reg45 <= $unsigned((&wire24));
              reg46 <= wire17;
              reg47 <= (($signed((|((8'hae) == wire35))) << wire30) != ($signed($unsigned($unsigned(wire36))) ?
                  wire25[(5'h10):(4'he)] : reg32));
              reg48 <= wire28;
            end
          else
            begin
              reg45 <= $unsigned(reg33[(2'h2):(1'h1)]);
              reg46 <= $unsigned($signed(($signed($unsigned(wire42)) ^ (^(reg43 >= wire35)))));
              reg47 <= $signed((-($signed($signed(wire38)) ?
                  $signed((wire24 && reg48)) : ((wire35 ? reg32 : (8'hba)) ?
                      wire18 : $signed(wire34)))));
              reg48 <= {(reg45[(3'h4):(3'h4)] * wire36[(3'h4):(3'h4)])};
            end
          reg49 <= (8'ha9);
          if (wire36[(4'h8):(3'h6)])
            begin
              reg50 <= ((~|$signed(reg43)) && $unsigned((({reg44, wire27} ?
                  $unsigned(wire29) : (reg32 ? wire38 : wire41)) * (~|(wire21 ?
                  wire28 : wire38)))));
            end
          else
            begin
              reg50 <= ($unsigned($signed(wire39[(1'h1):(1'h1)])) & ((^((wire39 ?
                  (8'hbe) : wire19) && (~|wire40))) ^~ wire25));
              reg51 <= ((~$unsigned({$signed(wire21)})) + (|{(8'hbb),
                  ({(7'h42), reg49} ? $unsigned(wire21) : {wire22})}));
              reg52 <= wire39[(4'hb):(3'h4)];
              reg53 <= $signed($unsigned($unsigned({(reg48 ?
                      reg49 : (7'h42))})));
              reg54 <= (((^(~^{wire42, (8'hbb)})) ^~ (~^(reg43 ?
                  (wire22 << wire27) : (wire18 ~^ wire37)))) || $unsigned((($unsigned(wire38) != wire26) >= $signed((|wire42)))));
            end
        end
      else
        begin
          reg45 <= {wire35, $unsigned($signed($signed($unsigned(wire23))))};
          reg46 <= wire28[(3'h4):(1'h0)];
        end
      reg55 <= wire25;
    end
endmodule

module module212
#(parameter param232 = (&({(~&((8'hb0) > (8'hb3))), ((8'ha3) > ((8'hbc) ? (8'ha1) : (8'h9c)))} ? (~&(-((8'h9d) >>> (8'ha5)))) : ((8'hac) + (((8'ha7) || (8'hb6)) ? ((8'hb3) ? (8'had) : (8'hb8)) : ((8'h9c) == (8'ha6)))))), 
parameter param233 = (((((param232 ? param232 : param232) ? {param232} : (param232 != param232)) > ((param232 ? param232 : param232) ? (param232 | param232) : ((8'hb3) >> (8'hb0)))) != param232) ? param232 : param232))
(y, clk, wire217, wire216, wire215, wire214, wire213);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire217;
  input wire [(2'h2):(1'h0)] wire216;
  input wire [(3'h6):(1'h0)] wire215;
  input wire [(4'ha):(1'h0)] wire214;
  input wire [(5'h15):(1'h0)] wire213;
  wire signed [(5'h15):(1'h0)] wire231;
  wire [(5'h10):(1'h0)] wire230;
  wire signed [(4'ha):(1'h0)] wire229;
  wire signed [(5'h13):(1'h0)] wire228;
  wire signed [(2'h2):(1'h0)] wire227;
  wire signed [(2'h3):(1'h0)] wire226;
  wire [(5'h15):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire219;
  wire [(5'h10):(1'h0)] wire218;
  reg [(3'h6):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg224 = (1'h0);
  reg [(5'h11):(1'h0)] reg223 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(4'hc):(1'h0)] reg221 = (1'h0);
  assign y = {wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire220,
                 wire219,
                 wire218,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 (1'h0)};
  assign wire218 = $unsigned($unsigned(wire214));
  assign wire219 = wire217[(3'h4):(2'h2)];
  assign wire220 = $signed((~($signed(wire215) ?
                       wire217[(1'h0):(1'h0)] : ({wire215} ?
                           $signed((8'hb4)) : $signed(wire215)))));
  always
    @(posedge clk) begin
      reg221 <= ((~^(wire217[(1'h1):(1'h0)] || $unsigned($signed(wire215)))) <<< wire215);
      reg222 <= (wire218 + (wire217 ?
          ($signed((~&reg221)) ?
              $unsigned((wire213 ?
                  wire219 : wire217)) : $signed((8'hac))) : $signed(wire217[(1'h0):(1'h0)])));
      reg223 <= {reg222, wire219[(4'he):(4'h9)]};
      reg224 <= wire217[(1'h1):(1'h0)];
      reg225 <= $signed((~(reg223 ?
          $unsigned($unsigned(reg223)) : (wire213[(5'h13):(2'h3)] ?
              reg223[(4'hd):(1'h0)] : $unsigned(wire215)))));
    end
  assign wire226 = (8'hb0);
  assign wire227 = (~$signed(wire218[(4'hf):(3'h6)]));
  assign wire228 = $unsigned((!(wire214[(4'ha):(4'ha)] & reg224)));
  assign wire229 = (!reg225);
  assign wire230 = wire214[(1'h0):(1'h0)];
  assign wire231 = $signed(wire216[(1'h1):(1'h1)]);
endmodule

module module188
#(parameter param208 = ((((^~{(8'hb1)}) ? (((8'haa) ? (7'h40) : (7'h43)) > {(8'ha7)}) : (!((8'hbd) <= (8'h9c)))) ? (^(~&((8'ha3) ? (8'hb7) : (8'ha1)))) : ((((8'hb6) < (8'hab)) ? ((8'hb1) << (8'hbb)) : (+(8'hb7))) >= {((8'haa) ? (8'hbf) : (8'had)), ((8'hb2) ? (8'hbc) : (8'hba))})) * ((((+(8'hac)) ? (!(8'hb1)) : (~(8'hbe))) ? (((8'hb8) >= (8'hb5)) & (8'had)) : (8'hb4)) ? (|({(8'h9e)} && (|(8'hae)))) : (((~|(8'hab)) == ((8'ha5) ^ (8'hbf))) ? (|((8'h9c) ? (8'hbd) : (8'hbe))) : (((8'h9d) ? (8'hb3) : (7'h42)) ? (&(8'h9d)) : ((8'hbb) ^~ (8'hb6)))))))
(y, clk, wire193, wire192, wire191, wire190, wire189);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire193;
  input wire [(5'h13):(1'h0)] wire192;
  input wire [(5'h15):(1'h0)] wire191;
  input wire [(4'hf):(1'h0)] wire190;
  input wire [(4'he):(1'h0)] wire189;
  wire [(4'hd):(1'h0)] wire207;
  wire [(4'hf):(1'h0)] wire206;
  wire signed [(4'ha):(1'h0)] wire205;
  wire signed [(5'h10):(1'h0)] wire204;
  wire signed [(4'h9):(1'h0)] wire201;
  wire [(4'hd):(1'h0)] wire200;
  wire [(4'hc):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(4'hc):(1'h0)] wire197;
  wire [(5'h13):(1'h0)] wire196;
  wire signed [(4'h9):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire194;
  reg signed [(3'h5):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg202 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 reg203,
                 reg202,
                 (1'h0)};
  assign wire194 = ({(((~wire190) << (wire189 ?
                               wire191 : wire189)) & (wire189 | (^(8'ha2))))} ?
                       $unsigned($unsigned({$unsigned(wire191)})) : ({{((8'hb7) | (8'ha1))}} ?
                           wire192[(4'h8):(1'h0)] : $signed($signed($unsigned(wire193)))));
  assign wire195 = ((8'hb2) ?
                       $unsigned(($signed((wire193 ?
                           wire191 : (8'hbd))) * wire189)) : wire193);
  assign wire196 = (($unsigned((8'ha1)) ?
                       wire194[(4'hb):(1'h0)] : {wire193,
                           ((wire194 && (8'ha6)) ?
                               wire190[(4'hd):(4'hc)] : {wire192})}) | {({(7'h41),
                               (^~wire190)} ?
                           wire194[(4'h9):(2'h3)] : ((wire192 ?
                                   wire193 : wire189) ?
                               wire191 : (|wire192)))});
  assign wire197 = ($unsigned(wire194) ?
                       $signed($signed((^~wire192[(1'h1):(1'h0)]))) : $signed((8'hac)));
  assign wire198 = {($unsigned(((wire190 * wire197) ?
                           wire193[(2'h2):(1'h0)] : $unsigned(wire196))) - (~|$signed((-wire194))))};
  assign wire199 = (({{(wire192 ?
                                   wire197 : wire197)}} <= $signed(wire196[(4'hb):(3'h5)])) ?
                       wire193 : (({$signed((8'ha1)), (wire193 > wire197)} ?
                           {wire192[(3'h4):(3'h4)],
                               wire190[(2'h3):(1'h0)]} : $signed((~^wire190))) * wire189[(4'hb):(4'hb)]));
  assign wire200 = $unsigned(({$unsigned({wire199, (8'hb7)}), wire194} ?
                       wire197[(2'h2):(2'h2)] : ({(wire199 ?
                                   wire197 : wire199)} ?
                           (7'h42) : $signed(wire192))));
  assign wire201 = $signed((~^(wire197 ?
                       {$signed(wire199)} : ($unsigned(wire198) ?
                           $unsigned(wire196) : wire199[(4'h8):(2'h2)]))));
  always
    @(posedge clk) begin
      reg202 <= {(($signed((wire200 || wire194)) <= wire193[(2'h2):(1'h0)]) ?
              $unsigned(($signed((8'hb8)) != ((8'h9f) ?
                  (8'ha3) : wire195))) : $unsigned($signed((+wire201))))};
      reg203 <= ($signed((wire198 ?
          ((wire199 >> wire194) != $signed(wire197)) : wire195[(2'h2):(2'h2)])) <= (|{wire198}));
    end
  assign wire204 = (8'ha6);
  assign wire205 = (7'h43);
  assign wire206 = $unsigned($unsigned((($signed(wire189) | $unsigned((7'h42))) - (8'hb0))));
  assign wire207 = $unsigned($unsigned((~|wire201)));
endmodule

module module167
#(parameter param180 = ((+(|(8'hae))) ? (^~((((8'hbe) ~^ (8'hb5)) ? {(8'hac), (8'ha1)} : (~^(8'had))) ? (((8'had) ? (7'h40) : (7'h40)) && ((8'hbf) ^ (8'hb2))) : ((!(8'hab)) >= {(8'hb3)}))) : (((((8'haa) ? (8'haa) : (8'haa)) ? (~^(7'h40)) : (8'hb4)) >= ((^~(8'ha2)) * (8'hb7))) ? {({(8'ha0), (8'hba)} * ((8'hba) ? (8'h9f) : (8'ha3))), (((8'haf) ? (8'hb8) : (8'hbd)) ? ((8'ha9) >>> (8'hb6)) : ((8'hb1) ? (8'hbd) : (8'hbb)))} : ((^(|(8'hbc))) ? (!((8'hac) ^~ (8'hbe))) : (~(-(8'hbc)))))))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire172;
  input wire signed [(4'h8):(1'h0)] wire171;
  input wire signed [(2'h2):(1'h0)] wire170;
  input wire signed [(5'h11):(1'h0)] wire169;
  input wire [(2'h2):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire177;
  wire [(4'h9):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire175;
  wire [(3'h7):(1'h0)] wire174;
  wire [(4'h9):(1'h0)] wire173;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 (1'h0)};
  assign wire173 = wire168;
  assign wire174 = $signed(wire170);
  assign wire175 = {wire172, wire168};
  assign wire176 = wire170[(2'h2):(1'h1)];
  assign wire177 = ({({{wire176}} ? {wire175[(3'h6):(3'h4)]} : wire168)} ?
                       (8'hb2) : (wire173[(3'h7):(1'h1)] ?
                           (^~wire174[(3'h5):(3'h4)]) : (((~(8'hb8)) ?
                                   wire171[(4'h8):(3'h5)] : (~wire173)) ?
                               $unsigned(wire171) : $signed((wire169 ?
                                   wire170 : wire171)))));
  assign wire178 = (&$unsigned($signed((~$unsigned(wire168)))));
  assign wire179 = (wire173[(1'h0):(1'h0)] ^ (|(wire177 && wire170)));
endmodule

module module136
#(parameter param161 = ({(((~|(8'ha0)) ? ((8'ha5) < (8'ha3)) : (8'hb8)) ? (!(+(8'hbd))) : ({(8'ha3), (8'ha8)} == ((8'ha6) * (8'ha2))))} ? (({(!(8'hae))} + (~((8'ha2) ? (8'hb7) : (7'h42)))) <= {(((8'hb8) ? (8'ha9) : (8'hb6)) ? (8'hb0) : (-(8'ha6)))}) : ((((~&(8'hb9)) >> (+(8'hb4))) ? ((&(8'ha3)) < (~&(8'hb8))) : (((8'hb8) ? (8'ha9) : (8'hbf)) >>> (^(8'hb5)))) ? (7'h43) : (~&(((8'ha9) ? (8'hb6) : (8'ha3)) <<< ((8'h9f) != (8'hbf)))))))
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire141;
  input wire signed [(2'h3):(1'h0)] wire140;
  input wire [(2'h3):(1'h0)] wire139;
  input wire [(5'h10):(1'h0)] wire138;
  input wire signed [(5'h12):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire signed [(4'h9):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire155;
  wire signed [(3'h7):(1'h0)] wire154;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire149;
  wire signed [(5'h10):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  reg [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire146,
                 wire144,
                 wire143,
                 wire142,
                 reg148,
                 reg145,
                 (1'h0)};
  assign wire142 = wire141;
  assign wire143 = wire139[(1'h0):(1'h0)];
  assign wire144 = wire139[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg145 <= (8'hb1);
    end
  assign wire146 = {wire139[(2'h2):(1'h0)]};
  assign wire147 = (~((wire141[(2'h2):(1'h1)] ?
                           {$signed(wire137)} : (wire137[(2'h2):(1'h0)] ?
                               {wire146} : wire146[(3'h5):(3'h5)])) ?
                       $signed((|(~|wire144))) : (~|{$unsigned(wire144),
                           (wire141 ? (7'h42) : (8'ha2))})));
  always
    @(posedge clk) begin
      reg148 <= (wire137 * wire147[(3'h4):(1'h1)]);
    end
  assign wire149 = wire147;
  assign wire150 = $signed((!$signed(wire138[(3'h5):(2'h2)])));
  assign wire151 = $unsigned(($unsigned((|$signed((8'hb3)))) ?
                       wire143 : {((wire139 ?
                               reg145 : wire137) ^~ wire150[(3'h6):(3'h5)]),
                           $unsigned(wire139)}));
  assign wire152 = (((~&(~&(wire146 ? wire149 : wire140))) ?
                       (8'hb7) : (~&$unsigned($signed(reg145)))) - ((~&reg148[(1'h1):(1'h1)]) | $signed({{(8'h9c)},
                       wire140})));
  assign wire153 = {((wire137 ~^ (+(!wire137))) <<< (!{{(8'ha4), wire143}})),
                       {(~$signed((wire138 ? reg145 : wire138)))}};
  assign wire154 = wire143[(3'h4):(3'h4)];
  assign wire155 = (~&wire154[(2'h3):(1'h1)]);
  assign wire156 = $unsigned($signed((8'ha7)));
  assign wire157 = wire147;
  assign wire158 = (wire152 ?
                       wire157[(3'h6):(2'h2)] : $signed(((+(wire150 ?
                               wire142 : (8'h9d))) ?
                           (~|(^wire142)) : {(wire141 ? wire156 : wire151)})));
  assign wire159 = ((!(reg148[(4'hc):(4'h8)] ?
                           wire150[(1'h0):(1'h0)] : $unsigned((reg145 ~^ wire147)))) ?
                       $unsigned((((wire141 ? wire143 : (7'h43)) ?
                           wire158 : $unsigned(wire152)) <<< ($signed(wire139) > (wire154 ^~ reg148)))) : wire137);
  assign wire160 = wire156;
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire111;
  input wire signed [(5'h11):(1'h0)] wire110;
  input wire [(3'h6):(1'h0)] wire109;
  input wire signed [(5'h14):(1'h0)] wire108;
  input wire [(5'h15):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire113;
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire113,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg112,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg112 <= ($unsigned(($signed({wire110}) ?
          $unsigned((wire110 ? wire110 : wire108)) : (^~(7'h44)))) - ({wire109,
              (8'hb6)} ?
          ($unsigned({wire108, wire111}) || ({wire110, wire110} ?
              $signed(wire110) : {(8'ha9)})) : wire111[(4'he):(2'h2)]));
    end
  assign wire113 = (($unsigned(wire110) < ((~|(wire107 | wire111)) ?
                       wire111 : ({wire110} ?
                           {wire107} : wire109[(1'h1):(1'h1)]))) & $signed((^$signed({wire111}))));
  always
    @(posedge clk) begin
      reg114 <= (~&($unsigned((^$unsigned(wire107))) ?
          $signed(($signed((7'h44)) ?
              wire108[(4'h8):(1'h0)] : {wire107})) : $unsigned(wire110[(3'h4):(2'h3)])));
      reg115 <= ((~(((reg112 >>> (8'hb5)) ? $unsigned(wire110) : {wire113}) ?
              (((8'hb2) ? reg114 : wire109) ?
                  {(7'h40)} : $unsigned(wire109)) : (8'ha4))) ?
          ($signed((wire111 ?
                  (wire107 ? wire108 : reg114) : (reg112 ~^ (8'hb0)))) ?
              $signed({(-reg114), $signed((8'ha8))}) : {wire113[(1'h1):(1'h0)],
                  ((wire109 && wire107) && (~wire110))}) : (reg112 | (wire111[(3'h7):(1'h0)] >> $unsigned((wire107 <<< wire107)))));
      if ((wire109 << $signed($signed($unsigned($signed(reg112))))))
        begin
          reg116 <= wire109[(2'h2):(2'h2)];
        end
      else
        begin
          reg116 <= reg112;
          if ((~&$signed((|({reg116} ?
              ((8'h9d) ? reg115 : reg116) : $signed((8'h9c)))))))
            begin
              reg117 <= ($unsigned($unsigned(wire107[(4'hd):(4'h9)])) ?
                  ((~|reg115[(1'h0):(1'h0)]) ?
                      wire109 : $unsigned(reg112[(2'h2):(1'h0)])) : ($signed($signed((reg114 != wire107))) << (~^reg116[(2'h2):(1'h1)])));
            end
          else
            begin
              reg117 <= ((&({wire109,
                  wire110[(4'hd):(4'hb)]} & ($signed((8'hb0)) ^~ $unsigned(reg116)))) >> reg112);
              reg118 <= $signed(wire110[(4'h8):(3'h4)]);
            end
        end
      reg119 <= ((wire108[(4'hd):(4'ha)] ?
          (^~{(8'hb1), $signed(wire107)}) : (-($signed(wire111) ?
              $unsigned(wire110) : (wire109 ^~ wire110)))) ~^ {(((wire109 == wire110) + $unsigned(wire111)) >> (reg114[(1'h1):(1'h0)] != $unsigned((8'ha1)))),
          wire109[(3'h5):(2'h2)]});
    end
  assign wire120 = reg115;
  assign wire121 = (~|reg116[(3'h4):(2'h2)]);
  assign wire122 = $unsigned(wire111[(4'hc):(2'h3)]);
  assign wire123 = (|(&wire107[(5'h13):(1'h1)]));
  assign wire124 = wire120;
  assign wire125 = (-wire121);
  assign wire126 = wire124;
  assign wire127 = {$signed(({$signed(wire111)} - (~$unsigned(wire120)))),
                       (($signed($signed(wire107)) << wire107) ~^ (|wire120[(1'h0):(1'h0)]))};
  assign wire128 = (wire124[(3'h4):(1'h0)] ?
                       wire124 : $signed((({wire113, reg115} ?
                               wire113[(2'h2):(1'h1)] : $unsigned((7'h42))) ?
                           $unsigned((-wire127)) : ($signed(wire109) >= $signed(reg119)))));
  assign wire129 = $signed(((((~^reg118) ?
                           (^~wire126) : (reg117 & wire120)) ^ ($unsigned(reg112) + (8'ha0))) ?
                       {reg119[(2'h3):(2'h3)]} : (reg119[(5'h11):(4'h9)] ?
                           (wire120 | reg112[(3'h4):(1'h0)]) : ($signed(wire125) ^ (wire111 >> wire107)))));
  assign wire130 = reg119[(3'h7):(1'h1)];
  assign wire131 = (8'hb2);
endmodule

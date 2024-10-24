module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire228;
  wire signed [(5'h15):(1'h0)] wire227;
  wire signed [(5'h14):(1'h0)] wire225;
  wire [(4'hd):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire41;
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire228,
                 wire227,
                 wire225,
                 wire161,
                 wire43,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire21,
                 wire22,
                 wire27,
                 wire28,
                 wire41,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire2;
  assign wire6 = ({(wire3 >= ((^wire3) ?
                             (wire1 ? (8'ha2) : (8'ha9)) : (&wire1))),
                         $signed($unsigned($unsigned((8'ha1))))} ?
                     (~^wire2) : (~^wire4));
  assign wire7 = (({wire4[(3'h7):(2'h3)],
                     ($signed((7'h42)) > {wire6,
                         wire5})} >> (wire2 || (wire6[(4'ha):(1'h1)] ?
                     (+wire4) : $unsigned((8'hbb))))) & wire0);
  assign wire8 = ($unsigned((8'hac)) ?
                     wire6 : (($signed((wire7 < wire0)) ?
                         $unsigned({wire3}) : wire4[(2'h2):(1'h0)]) || (wire7[(2'h3):(2'h2)] ?
                         wire2[(4'hb):(4'h9)] : wire0[(4'hf):(4'hd)])));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(((wire1[(4'ha):(3'h5)] ?
              $signed(wire7) : $signed(wire1)) ?
          wire6[(4'hc):(3'h7)] : $signed($signed(wire1))))))
        begin
          reg9 <= (wire2[(4'h9):(4'h9)] <= wire7);
        end
      else
        begin
          reg9 <= (~|reg9[(3'h5):(1'h1)]);
          reg10 <= wire0;
          reg11 <= $unsigned({((~(&wire8)) ?
                  wire2[(1'h0):(1'h0)] : $unsigned((^wire3))),
              (wire3 ? $signed(reg9) : reg10[(4'ha):(3'h4)])});
          reg12 <= $unsigned(wire7);
          if ($signed((({(~&wire3)} >= ($signed(wire4) > $signed(wire0))) <<< wire8)))
            begin
              reg13 <= $unsigned((reg10[(3'h6):(3'h6)] == wire3));
            end
          else
            begin
              reg13 <= (~|reg11[(1'h1):(1'h1)]);
            end
        end
      reg14 <= $unsigned({$unsigned(((reg12 << (8'h9c)) ~^ $signed((8'ha1))))});
    end
  assign wire15 = ($unsigned($signed($signed(((8'h9e) ?
                      wire4 : (7'h42))))) ^~ (~&wire8));
  assign wire16 = wire6[(4'hc):(3'h7)];
  assign wire17 = (((~|(&(~^(8'hb3)))) ?
                          ((|$signed(wire3)) ~^ reg14[(1'h0):(1'h0)]) : ((+reg12) << {$unsigned((8'hac))})) ?
                      $signed(($unsigned((wire4 ? (8'haa) : (8'hac))) ?
                          $signed(wire2) : ((wire16 ?
                              wire4 : wire1) == (wire6 > wire6)))) : wire1);
  assign wire18 = $signed($signed(({$signed(wire3),
                      (wire6 ? (7'h43) : reg14)} || (&wire8))));
  assign wire19 = {$unsigned(wire8[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg20 <= ($signed(wire17) ?
          $unsigned(reg12[(5'h10):(1'h1)]) : $unsigned($unsigned($unsigned((wire4 < (8'hb4))))));
    end
  assign wire21 = wire2[(4'h9):(3'h6)];
  assign wire22 = (8'ha2);
  always
    @(posedge clk) begin
      reg23 <= ((($unsigned((wire15 < wire15)) ?
                  reg14 : ((+wire5) ? $signed(reg12) : wire0[(4'hb):(1'h0)])) ?
              wire5 : (^~$unsigned((reg12 ? reg9 : wire3)))) ?
          $signed($unsigned(wire2)) : $unsigned($unsigned((reg14[(2'h2):(2'h2)] > (~&reg20)))));
      reg24 <= (((wire2[(4'h8):(3'h6)] && ((!wire7) || $unsigned(wire2))) || reg23[(2'h3):(2'h3)]) <= reg23);
      reg25 <= $unsigned(reg11);
      reg26 <= (^~wire3[(3'h6):(3'h4)]);
    end
  assign wire27 = (~^(8'ha8));
  assign wire28 = $unsigned(($unsigned(($signed((8'hb7)) ?
                      $signed(reg24) : wire5)) > $unsigned(({wire7} ?
                      (~&(8'ha8)) : (wire16 ~^ (8'haa))))));
  module29 #() modinst42 (wire41, clk, wire19, reg24, wire27, wire6, reg20);
  assign wire43 = $signed(wire21[(3'h6):(3'h6)]);
  module44 #() modinst162 (.y(wire161), .clk(clk), .wire46(wire43), .wire48(wire27), .wire45(wire0), .wire47(wire3));
  module163 #() modinst226 (wire225, clk, reg14, wire6, reg26, wire0);
  assign wire227 = (~|($unsigned(wire43) ?
                       wire41[(3'h4):(2'h3)] : $unsigned($signed((wire2 ?
                           wire17 : reg13)))));
  assign wire228 = ((!(8'ha8)) >= $signed($unsigned(reg11)));
endmodule

module module163
#(parameter param223 = {(~(^~(~^(-(8'haa)))))}, 
parameter param224 = ({{(|(8'ha9))}} ? ((~^((param223 << (8'had)) * {param223, (8'hb9)})) ? (~^(param223 ? (param223 && param223) : param223)) : param223) : (param223 ? param223 : ((~|{param223}) ? param223 : param223))))
(y, clk, wire164, wire165, wire166, wire167);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire164;
  input wire [(3'h7):(1'h0)] wire165;
  input wire signed [(5'h11):(1'h0)] wire166;
  input wire signed [(5'h12):(1'h0)] wire167;
  wire [(5'h11):(1'h0)] wire222;
  wire [(4'ha):(1'h0)] wire221;
  wire signed [(5'h10):(1'h0)] wire220;
  wire signed [(4'hc):(1'h0)] wire219;
  wire signed [(4'hc):(1'h0)] wire217;
  wire [(3'h4):(1'h0)] wire200;
  wire [(5'h15):(1'h0)] wire199;
  wire [(3'h5):(1'h0)] wire198;
  wire signed [(4'h9):(1'h0)] wire197;
  wire [(4'hb):(1'h0)] wire196;
  wire [(3'h6):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire186;
  wire [(4'he):(1'h0)] wire185;
  wire [(5'h11):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire169;
  wire [(5'h15):(1'h0)] wire183;
  reg signed [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(5'h14):(1'h0)] reg188 = (1'h0);
  reg [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(3'h6):(1'h0)] reg190 = (1'h0);
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg194 = (1'h0);
  assign y = {wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire217,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire186,
                 wire185,
                 wire168,
                 wire169,
                 wire183,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 (1'h0)};
  assign wire168 = wire167[(2'h2):(1'h1)];
  assign wire169 = ((((wire165 | {wire167, wire168}) ?
                       (8'h9c) : ((~&wire166) ?
                           $unsigned(wire167) : wire167)) <<< wire165) || ($signed(($unsigned(wire167) ?
                           wire168 : (+wire166))) ?
                       (!($signed((7'h40)) ^~ (7'h43))) : $signed(((wire166 ?
                           wire168 : wire165) ^ (^~wire166)))));
  module170 #() modinst184 (.wire172(wire168), .wire173(wire166), .wire175(wire167), .y(wire183), .wire171(wire165), .clk(clk), .wire174(wire164));
  assign wire185 = ((wire168 ?
                           wire164 : ($unsigned((wire183 ^~ wire165)) ?
                               (^(wire183 << wire167)) : $signed((8'hb9)))) ?
                       {{wire168},
                           $unsigned({wire169[(1'h0):(1'h0)],
                               $signed((8'hac))})} : {wire169[(1'h0):(1'h0)]});
  assign wire186 = wire167[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg187 <= $unsigned({$signed(wire185),
          $signed(((wire168 ? wire166 : (7'h43)) & $unsigned(wire164)))});
      if ((wire183[(3'h5):(1'h0)] ?
          $signed(reg187) : $signed({(~|(~&wire169))})))
        begin
          if (wire168[(2'h3):(2'h3)])
            begin
              reg188 <= wire168;
              reg189 <= reg188;
            end
          else
            begin
              reg188 <= wire169[(2'h2):(2'h2)];
            end
          reg190 <= {$signed($unsigned((8'hbf)))};
          reg191 <= $unsigned($signed((wire168 ^~ wire168[(4'hc):(3'h7)])));
        end
      else
        begin
          reg188 <= wire168[(4'hd):(1'h1)];
          reg189 <= reg191;
          reg190 <= $signed($signed($unsigned({(~wire183)})));
        end
      reg192 <= ($unsigned(reg190) ? reg188 : wire183);
      reg193 <= $unsigned((&{(!$unsigned(wire164)),
          (wire169 ? (reg190 <<< wire164) : $signed(reg191))}));
      reg194 <= ({(~reg191),
              $signed(({wire168, wire164} & (reg187 ? (8'hba) : (8'hbd))))} ?
          $signed($unsigned(reg188[(1'h1):(1'h0)])) : (+$signed(reg188)));
    end
  assign wire195 = ((wire185[(2'h2):(2'h2)] <= reg192[(5'h15):(1'h0)]) ?
                       (~&$unsigned(({reg192, wire165} <= {wire183,
                           reg188}))) : reg193);
  assign wire196 = $signed((&(~((reg190 ? wire169 : reg194) ?
                       $signed(wire164) : (wire166 ? (8'hbe) : reg189)))));
  assign wire197 = (reg190[(1'h1):(1'h1)] >= ((((reg187 < (8'ha0)) & $signed((8'hba))) || wire167) ^ $unsigned((wire168[(5'h10):(1'h1)] ?
                       reg191 : wire165))));
  assign wire198 = wire166;
  assign wire199 = (wire165[(3'h5):(1'h0)] ^ wire195);
  assign wire200 = ({($signed($unsigned(wire166)) ?
                           wire169 : ((reg194 ? wire165 : reg194) ?
                               wire168[(3'h4):(3'h4)] : (wire166 ^ wire195)))} || {(~|{reg187,
                           $signed((8'ha3))})});
  module201 #() modinst218 (.clk(clk), .wire205(wire166), .wire204(reg191), .wire202(wire164), .wire206(wire167), .y(wire217), .wire203(wire183));
  assign wire219 = $signed((-$signed(wire200)));
  assign wire220 = (^~reg192);
  assign wire221 = (8'hb2);
  assign wire222 = $signed(wire168);
endmodule

module module44
#(parameter param160 = ((8'ha5) && {(^~(-(8'ha7)))}))
(y, clk, wire45, wire46, wire47, wire48);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire158;
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  assign y = {wire49,
                 wire50,
                 wire51,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire158,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire49 = {(&{(wire47[(3'h5):(1'h0)] <= (^~wire46))})};
  assign wire50 = (^~(+{wire48[(2'h3):(1'h0)]}));
  assign wire51 = (^~$unsigned(wire50));
  always
    @(posedge clk) begin
      if (((^~(wire50[(4'h9):(4'h9)] && wire45[(4'h8):(1'h1)])) ?
          wire51[(4'h9):(2'h2)] : (((|(!(8'hbf))) ?
                  $signed($unsigned(wire46)) : (8'ha8)) ?
              $unsigned($unsigned($signed(wire51))) : ($signed(wire47[(3'h4):(1'h1)]) ?
                  {$unsigned(wire49)} : $signed((wire50 ? (8'hb5) : wire47))))))
        begin
          reg52 <= wire50;
          reg53 <= (^((~wire49[(2'h3):(1'h0)]) ?
              $signed($signed({(7'h43)})) : ($signed($unsigned((8'ha2))) ?
                  reg52 : ($unsigned(wire49) > (wire47 ? wire50 : (8'hb2))))));
          reg54 <= wire45;
        end
      else
        begin
          if ($signed($signed($unsigned($unsigned(reg54)))))
            begin
              reg52 <= (reg53 >>> wire47[(3'h6):(3'h5)]);
            end
          else
            begin
              reg52 <= (7'h40);
            end
          reg53 <= (wire50 < {(reg53 ?
                  $signed(((7'h42) ? wire51 : (8'hb8))) : $unsigned({(8'ha6),
                      wire48}))});
          reg54 <= wire51[(4'h9):(4'h8)];
        end
      reg55 <= $signed(($signed((reg53[(1'h0):(1'h0)] | {reg54,
          wire51})) <= {($unsigned((8'hb0)) ?
              (reg54 != (8'h9f)) : (reg52 >>> wire45)),
          $unsigned((reg53 < reg53))}));
    end
  assign wire56 = (($unsigned(((reg52 || reg53) ?
                          wire47[(4'h9):(3'h7)] : (wire48 | reg52))) && (reg54 ?
                          (wire45 ?
                              wire49[(1'h1):(1'h1)] : $unsigned(reg52)) : (&wire50[(4'hb):(3'h5)]))) ?
                      {((~^((7'h42) != reg53)) + $signed((wire48 <= reg52)))} : reg54);
  assign wire57 = (^(((!(reg53 > wire46)) & (~^(+wire56))) ?
                      {($signed(wire49) ^~ wire48[(3'h4):(1'h1)])} : reg52));
  assign wire58 = ($unsigned($unsigned($unsigned((!reg55)))) ?
                      (reg55[(5'h14):(4'he)] ?
                          (wire46[(2'h2):(1'h0)] ?
                              (wire50 <<< $signed(reg53)) : (wire51 ?
                                  reg55 : (reg52 ?
                                      reg55 : (8'ha0)))) : wire45[(5'h13):(5'h12)]) : {(reg53[(1'h0):(1'h0)] && {reg54})});
  assign wire59 = ({(^~(~(wire48 != wire45))), $signed(reg53)} ?
                      $signed(($unsigned(wire45) ?
                          (wire50 ?
                              $unsigned(wire51) : (wire45 & wire51)) : reg53)) : (+(wire58[(3'h5):(2'h2)] != $unsigned((8'ha2)))));
  assign wire60 = ({(!reg54), wire48} ? $unsigned(wire48) : wire59);
  assign wire61 = (8'hb2);
  assign wire62 = (^~((~wire51[(4'hf):(4'hd)]) ^ {$unsigned(wire46[(2'h2):(1'h1)]),
                      $unsigned(reg55[(3'h4):(2'h2)])}));
  assign wire63 = wire47;
  assign wire64 = $unsigned(($unsigned($signed((&wire46))) + wire59[(3'h5):(2'h2)]));
  assign wire65 = ((reg52 ?
                          $unsigned(wire57[(3'h5):(2'h2)]) : {{wire60[(3'h7):(1'h1)],
                                  (wire46 ? wire60 : (8'hb0))},
                              (wire50 != (8'hb9))}) ?
                      (wire50 || ((~|reg54[(2'h2):(1'h0)]) > (^~wire48))) : $signed((-{reg55})));
  assign wire66 = wire45[(2'h3):(2'h3)];
  assign wire67 = $unsigned(($signed($signed($unsigned(wire49))) && $unsigned((^$signed(wire61)))));
  assign wire68 = wire59;
  assign wire69 = $unsigned(wire56[(3'h4):(1'h0)]);
  module70 #() modinst159 (.y(wire158), .wire74(wire61), .wire73(wire58), .wire72(wire47), .clk(clk), .wire71(wire59), .wire75(wire69));
endmodule

module module29
#(parameter param40 = ((((+(~|(8'hb9))) ? {((8'hbe) ? (8'hb1) : (7'h40)), ((8'hac) ? (8'hb7) : (8'ha0))} : (7'h41)) ? (|(((7'h40) ? (8'h9e) : (8'haa)) ? ((8'hb8) ? (8'hb7) : (8'hb0)) : (8'hba))) : ((^~(8'hbb)) * {((8'ha3) ~^ (8'haa)), ((8'haf) ? (8'ha9) : (8'ha2))})) ? (((!((8'ha6) * (7'h43))) ? (^((8'hb6) ? (8'h9e) : (8'hb3))) : {{(8'ha4)}, (8'h9d)}) != ((~&((8'hba) ? (8'hb3) : (8'ha5))) ? (~|{(8'hb9)}) : ((+(7'h42)) ^~ ((8'hac) ? (8'hbf) : (8'hab))))) : (((^(!(8'hbb))) ? (!((8'h9c) <= (7'h44))) : ({(7'h41), (8'hb2)} - (7'h42))) ? (~(((8'hb1) ? (8'hb8) : (8'hb5)) == (|(8'ha9)))) : {(((8'hb7) ? (8'had) : (8'hb8)) >> (8'hbb)), (~|((8'hb1) ? (8'haa) : (8'hb8)))})))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(3'h4):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire39, wire38, wire37, reg36, reg35, (1'h0)};
  always
    @(posedge clk) begin
      reg35 <= ((^($unsigned((&wire31)) ?
              wire30[(2'h2):(1'h0)] : $signed((^(8'hb6))))) ?
          wire34[(4'h8):(1'h1)] : ($unsigned(wire32[(1'h0):(1'h0)]) == $unsigned((wire30 <= (-(8'had))))));
      reg36 <= wire31;
    end
  assign wire37 = $signed($unsigned((-wire32[(3'h4):(1'h1)])));
  assign wire38 = reg35;
  assign wire39 = $unsigned($signed((!$signed($unsigned(wire33)))));
endmodule

module module70
#(parameter param157 = ((((((7'h40) ? (8'haf) : (8'hbf)) ? ((8'hb5) < (8'hbf)) : (-(8'hb3))) ? (((8'hb8) > (8'ha2)) ~^ ((8'hb6) >= (7'h42))) : (-((8'h9c) ? (8'h9f) : (8'hac)))) ? ((-{(8'ha5)}) != {(8'ha1)}) : ({(~&(7'h41)), (8'ha3)} ? {(~|(8'h9e))} : ((8'hbb) | ((8'hba) ? (8'hbc) : (8'ha1))))) || ((+(((8'h9c) == (7'h42)) ? (^~(8'haa)) : (8'ha0))) ? {({(8'haf)} ? (8'hb7) : (~(7'h40))), (((8'hb8) * (8'ha9)) ? ((8'ha4) << (8'hb6)) : (|(8'hb3)))} : (&(((8'hac) <= (8'haf)) ^~ (~(8'hba)))))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h3a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire75;
  input wire [(5'h14):(1'h0)] wire74;
  input wire [(5'h13):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  input wire signed [(3'h4):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire156;
  wire [(2'h2):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire143;
  wire [(3'h5):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(3'h4):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire76;
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(2'h2):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire143,
                 wire136,
                 wire135,
                 wire134,
                 wire76,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = ((wire74[(4'ha):(3'h7)] >>> (+(|{wire73,
                      wire71}))) == $unsigned(wire71));
  always
    @(posedge clk) begin
      reg77 <= (+(wire74 * (!wire74)));
      reg78 <= ($unsigned($unsigned(($unsigned(wire72) ?
              (wire71 ? wire75 : wire71) : wire74))) ?
          wire75 : wire76[(3'h7):(3'h5)]);
      reg79 <= reg78[(2'h2):(2'h2)];
      if ($signed($unsigned(wire71[(1'h1):(1'h0)])))
        begin
          if ((-((|$signed($unsigned(reg79))) && ($unsigned($unsigned((8'ha9))) || $unsigned(reg78)))))
            begin
              reg80 <= reg77[(3'h4):(3'h4)];
              reg81 <= $signed({(~|wire75[(3'h7):(2'h3)])});
              reg82 <= $signed({wire71[(3'h4):(3'h4)]});
              reg83 <= (($unsigned(wire75) - $unsigned(wire74[(3'h4):(2'h3)])) ?
                  $unsigned(((wire73[(2'h3):(2'h2)] ?
                      reg81[(3'h7):(3'h5)] : wire76) || (((7'h42) | wire75) ^~ reg79))) : (({{reg80},
                      {reg77, wire75}} >= ({wire72, wire72} ?
                      (wire75 - wire72) : $unsigned(reg80))) << (|($unsigned(wire75) << $unsigned(reg79)))));
              reg84 <= {wire71, $unsigned($unsigned(wire74))};
            end
          else
            begin
              reg80 <= $signed($unsigned({((wire74 ?
                      reg81 : reg80) > (wire72 && reg81))}));
            end
          reg85 <= {($signed($signed($signed(reg84))) ?
                  (^~{reg84[(3'h4):(1'h1)],
                      wire74[(5'h14):(3'h7)]}) : $unsigned(((+wire72) * (wire74 ?
                      reg77 : wire73))))};
          reg86 <= {((|$unsigned(wire75[(1'h0):(1'h0)])) - reg82)};
          reg87 <= $signed((8'hae));
          reg88 <= $signed($unsigned(reg78[(1'h0):(1'h0)]));
        end
      else
        begin
          reg80 <= $unsigned(wire75[(1'h1):(1'h1)]);
          if ((($signed(wire73) ? {$unsigned(reg88)} : wire75[(4'h8):(3'h4)]) ?
              reg78[(2'h2):(1'h1)] : $unsigned(wire72[(4'hf):(4'hb)])))
            begin
              reg81 <= (reg86[(1'h0):(1'h0)] ? reg87 : reg83[(4'h8):(3'h7)]);
            end
          else
            begin
              reg81 <= (!reg82[(2'h2):(2'h2)]);
              reg82 <= {reg82[(4'hc):(4'h9)],
                  $signed({$unsigned($signed(wire74))})};
              reg83 <= (|(($signed((reg78 && reg83)) ?
                  $unsigned(reg77) : (~^(reg87 + wire74))) > (+(reg86[(2'h2):(1'h1)] > $signed((8'h9d))))));
              reg84 <= (-$signed((8'hbb)));
              reg85 <= reg83[(4'hb):(3'h5)];
            end
          reg86 <= $unsigned((~^$signed(reg82[(4'h9):(3'h7)])));
        end
    end
  always
    @(posedge clk) begin
      if (reg84)
        begin
          reg89 <= $unsigned(reg83[(2'h2):(1'h0)]);
          reg90 <= ($signed(reg77) ?
              reg89 : (reg80 ?
                  (8'ha6) : $unsigned(($unsigned((8'hbf)) ?
                      (reg89 ? reg81 : reg84) : reg83))));
        end
      else
        begin
          if ((^((wire71[(3'h4):(2'h3)] << reg90[(1'h1):(1'h1)]) && (|reg80))))
            begin
              reg89 <= (8'hab);
              reg90 <= $unsigned($unsigned((~|(~$unsigned(reg79)))));
            end
          else
            begin
              reg89 <= (~wire76);
              reg90 <= (reg80 ?
                  (-(&wire71)) : (((reg84 + (wire76 == reg80)) == $signed($signed(wire71))) ?
                      {(wire76 >>> (wire73 & reg84)),
                          (((8'had) ?
                              reg81 : reg84) <<< reg84[(1'h0):(1'h0)])} : wire75));
              reg91 <= {$unsigned(reg80),
                  $unsigned($unsigned({(|reg81), (^~reg83)}))};
              reg92 <= {wire72, reg81[(4'h9):(3'h4)]};
            end
          reg93 <= $signed(reg88);
          reg94 <= reg89;
          if ({reg83[(1'h0):(1'h0)],
              $unsigned($signed(((reg77 >>> reg88) >> (reg84 ?
                  reg94 : reg86))))})
            begin
              reg95 <= $signed({(8'hae), $unsigned(wire75[(3'h5):(1'h0)])});
              reg96 <= $signed(($signed((reg95 ?
                      $signed(reg82) : $unsigned(reg93))) ?
                  (reg89[(4'hc):(2'h2)] < (&(reg94 ?
                      reg90 : reg86))) : $signed(reg92)));
              reg97 <= $unsigned(reg87);
              reg98 <= (~^(-$signed((^{reg95}))));
              reg99 <= ($unsigned($unsigned((reg95 ?
                  $signed(reg83) : $signed(reg78)))) <<< reg90[(3'h7):(3'h6)]);
            end
          else
            begin
              reg95 <= ($signed($unsigned((~$unsigned(reg80)))) ?
                  (&{{reg81[(1'h0):(1'h0)]},
                      reg82[(3'h5):(2'h3)]}) : (wire72[(3'h4):(1'h1)] ?
                      {{(~reg82)}} : (|$signed(reg78[(1'h0):(1'h0)]))));
              reg96 <= $unsigned(reg93[(3'h5):(1'h1)]);
              reg97 <= reg97[(2'h2):(1'h0)];
              reg98 <= reg96;
            end
        end
      if (wire75)
        begin
          reg100 <= reg82[(1'h1):(1'h1)];
          if ($signed({{(wire72[(5'h11):(3'h5)] ? reg98 : $signed(reg83))}}))
            begin
              reg101 <= $signed(($signed(reg96) ?
                  reg100[(4'h9):(3'h6)] : $signed($unsigned($signed(reg78)))));
              reg102 <= $unsigned((reg91[(4'ha):(3'h6)] - (|(&wire75))));
              reg103 <= (reg95 <<< reg100);
              reg104 <= (reg78 > $unsigned((^reg98)));
            end
          else
            begin
              reg101 <= reg94;
              reg102 <= (-({reg87[(3'h5):(1'h1)]} > reg96));
              reg103 <= ((^~$unsigned($signed((8'hae)))) + reg86[(1'h1):(1'h1)]);
            end
          reg105 <= (+reg79);
          reg106 <= (^((8'hb7) == {(reg93[(4'hb):(3'h7)] ?
                  (reg80 ? reg105 : reg84) : (reg95 ? reg86 : reg101)),
              reg100}));
        end
      else
        begin
          reg100 <= wire76[(3'h6):(1'h0)];
          reg101 <= $unsigned((~^{($signed(wire76) ?
                  {reg83, reg97} : $unsigned(wire73)),
              (8'ha5)}));
          if (reg105[(3'h5):(2'h2)])
            begin
              reg102 <= reg77[(3'h6):(3'h6)];
              reg103 <= $unsigned($signed($unsigned($signed(reg87))));
            end
          else
            begin
              reg102 <= {(reg85 ?
                      (reg90 ^ ($signed(reg78) ?
                          {reg89,
                              reg88} : $signed((8'hb0)))) : ($unsigned((reg97 >= (8'hbb))) - (reg98 | (reg100 ?
                          reg83 : wire71))))};
              reg103 <= (8'hbf);
              reg104 <= wire73[(2'h2):(1'h1)];
              reg105 <= reg85[(3'h6):(2'h2)];
              reg106 <= ($signed(reg87) * $unsigned(($unsigned($unsigned(reg84)) ?
                  wire75 : (8'ha4))));
            end
          reg107 <= $signed($unsigned(((~{reg81}) == (reg87[(4'hc):(3'h7)] >> reg79))));
        end
      if (reg97)
        begin
          reg108 <= $unsigned((8'h9f));
          reg109 <= $unsigned((({(reg94 < reg107)} ?
              {$unsigned(reg88),
                  {reg93}} : $signed((~|reg78))) * ((~|(~&(8'ha5))) ?
              $signed((+reg81)) : $unsigned((reg81 ? reg97 : (8'hb9))))));
          reg110 <= (reg84[(3'h4):(2'h2)] ?
              $unsigned(((reg107[(3'h5):(1'h0)] ? $signed(reg89) : wire71) ?
                  {(8'h9f),
                      (~|reg79)} : reg84[(1'h1):(1'h0)])) : $signed({reg92,
                  ((reg106 ? reg102 : reg104) * $signed(wire71))}));
          reg111 <= ({($signed((wire71 & reg96)) == reg93),
                  ($signed((reg109 * reg98)) ?
                      (reg103[(2'h3):(1'h1)] ?
                          reg110[(3'h5):(1'h1)] : reg86) : ($signed((8'hbb)) ^ $unsigned(reg82)))} ?
              wire76 : (reg88 >= ({(reg107 ? reg90 : reg96),
                  $signed(reg87)} >= ($unsigned(reg96) ~^ reg96[(2'h2):(2'h2)]))));
          reg112 <= reg107[(2'h3):(1'h0)];
        end
      else
        begin
          reg108 <= (~&(8'ha8));
          reg109 <= $unsigned($unsigned((~&reg95)));
          reg110 <= reg110[(4'hf):(4'ha)];
          if ((~|reg79))
            begin
              reg111 <= reg101[(1'h0):(1'h0)];
              reg112 <= (reg98 != $unsigned(reg112[(2'h2):(2'h2)]));
            end
          else
            begin
              reg111 <= ((!{($unsigned(reg79) ? reg81[(1'h0):(1'h0)] : reg106),
                      reg112}) ?
                  wire74[(4'h8):(1'h0)] : $signed(reg83[(2'h2):(1'h0)]));
              reg112 <= reg110[(4'hb):(2'h3)];
              reg113 <= ((|(reg107[(3'h7):(3'h4)] ?
                  $unsigned($signed(reg80)) : (reg79[(4'hd):(2'h3)] <<< reg93[(5'h12):(1'h1)]))) > (8'ha9));
            end
          if ((&reg85))
            begin
              reg114 <= (!reg112);
              reg115 <= reg77[(2'h2):(1'h0)];
              reg116 <= {(reg79[(4'ha):(4'ha)] ?
                      $unsigned(((&(8'hb4)) ?
                          (reg81 * reg88) : ((8'hb4) ?
                              reg91 : reg109))) : (($signed(reg89) ?
                              $unsigned(reg109) : (reg114 != reg94)) ?
                          (reg111 ? {(8'haf), wire71} : {reg86}) : reg103))};
              reg117 <= ((|reg77) > reg77[(1'h1):(1'h1)]);
            end
          else
            begin
              reg114 <= (((((reg102 ?
                      reg113 : reg99) & (reg88 ^ reg80)) < {reg85[(2'h3):(1'h0)],
                      (~&wire73)}) ?
                  (~reg94[(3'h4):(1'h0)]) : reg77) >>> (reg111[(1'h1):(1'h0)] ?
                  reg78 : ((reg84 + $signed(reg111)) ?
                      $unsigned(reg112) : $unsigned((reg86 ?
                          wire74 : (8'hb2))))));
              reg115 <= (~^$signed(($signed(reg91) ?
                  ((reg102 ?
                      wire72 : reg84) & (reg79 & reg100)) : $signed((8'ha6)))));
              reg116 <= {$unsigned($signed(reg109[(4'h9):(4'h9)]))};
              reg117 <= $unsigned((({wire75[(3'h7):(3'h6)]} * (reg92[(1'h0):(1'h0)] ^~ (reg99 <= reg114))) ?
                  $signed((((8'hb1) ~^ reg103) ?
                      $unsigned(reg116) : (~|(8'h9e)))) : reg93));
              reg118 <= ($unsigned($signed(reg115[(5'h13):(3'h5)])) & (8'ha8));
            end
        end
      if ($signed(({$unsigned((reg86 ? reg103 : reg106))} + $unsigned(reg90))))
        begin
          if ($unsigned({(reg110[(3'h7):(1'h1)] << reg95)}))
            begin
              reg119 <= ((8'ha2) || $signed($unsigned(((reg82 ?
                  reg91 : reg107) + $signed((8'hb7))))));
            end
          else
            begin
              reg119 <= reg97;
              reg120 <= ($signed($signed((8'hb5))) ?
                  (($signed((8'hba)) ?
                          ((~(8'ha3)) == reg108) : $unsigned({reg98,
                              (8'h9e)})) ?
                      reg115[(5'h15):(4'h8)] : reg92[(1'h0):(1'h0)]) : reg92[(2'h2):(1'h1)]);
              reg121 <= reg79;
              reg122 <= {wire74};
              reg123 <= {$unsigned(($signed((reg82 ? reg92 : reg114)) ?
                      {{reg114, reg118},
                          ((8'ha9) < wire71)} : $unsigned($signed(reg82))))};
            end
          reg124 <= ((($signed((reg110 ?
                  reg80 : (8'had))) | reg120[(2'h2):(1'h0)]) ?
              (((~reg95) >= (reg111 >> reg99)) ?
                  $signed(reg107) : (reg114[(2'h2):(1'h0)] ?
                      wire76[(4'hc):(2'h3)] : $unsigned(reg118))) : $signed(((reg88 ?
                      reg123 : wire74) ?
                  reg106[(4'hc):(2'h2)] : ((8'had) ?
                      reg88 : wire76)))) > (reg80[(4'hc):(4'ha)] ~^ (((reg108 >= reg92) * (reg79 ?
                  reg82 : reg78)) ?
              ((~reg88) + (reg91 << (8'ha2))) : {reg110, $unsigned(reg104)})));
          if (reg105)
            begin
              reg125 <= (reg80[(2'h3):(2'h2)] ?
                  $signed(({(^reg120), wire73} ?
                      ({reg122, reg120} ?
                          (^~reg105) : $signed(reg89)) : {$unsigned(reg79),
                          reg123[(3'h6):(1'h1)]})) : (|{((reg117 >>> reg86) ?
                          {reg104} : $unsigned(reg116))}));
              reg126 <= reg112[(1'h1):(1'h0)];
            end
          else
            begin
              reg125 <= ((&((~|$signed(reg89)) ?
                      (~|((8'hb0) ? reg119 : reg118)) : reg85[(3'h5):(3'h5)])) ?
                  reg112[(1'h0):(1'h0)] : reg113);
              reg126 <= reg85[(3'h5):(3'h5)];
              reg127 <= reg100[(2'h3):(1'h1)];
              reg128 <= (~&reg103[(3'h7):(1'h0)]);
              reg129 <= $signed($signed(reg116[(1'h1):(1'h1)]));
            end
          reg130 <= (~(((^~$unsigned(reg126)) ?
              reg111 : reg121) + (-wire74[(1'h0):(1'h0)])));
          if (((~(reg112 ?
              reg121[(1'h1):(1'h1)] : $unsigned($signed(reg124)))) < (&(!$unsigned((reg90 ?
              wire75 : reg94))))))
            begin
              reg131 <= (reg117 < {reg115[(3'h6):(1'h1)], $signed((8'hbb))});
            end
          else
            begin
              reg131 <= $unsigned((+reg112[(1'h0):(1'h0)]));
              reg132 <= reg81;
              reg133 <= (reg97 ?
                  {$signed($signed($unsigned((8'ha4))))} : (~|$unsigned($unsigned((~|wire73)))));
            end
        end
      else
        begin
          reg119 <= ($unsigned(wire76[(2'h2):(1'h0)]) != reg116);
          if ({reg114[(3'h5):(1'h0)]})
            begin
              reg120 <= reg120;
              reg121 <= $unsigned($unsigned($signed((reg93 * reg124[(4'h9):(1'h0)]))));
              reg122 <= (~^reg94[(3'h4):(3'h4)]);
              reg123 <= (reg99 ?
                  $signed((8'ha0)) : ((|(~&$unsigned((8'hbd)))) ~^ (reg113 ?
                      (8'haa) : reg127[(2'h2):(1'h0)])));
              reg124 <= reg88;
            end
          else
            begin
              reg120 <= reg79[(1'h1):(1'h0)];
              reg121 <= $signed((reg129[(2'h3):(2'h3)] <<< (((~^reg106) ^~ reg81[(1'h0):(1'h0)]) != ($signed(wire71) ?
                  $signed(reg90) : {(7'h44)}))));
              reg122 <= $signed(reg89);
              reg123 <= (8'hbf);
            end
          reg125 <= ((^{($signed(reg108) ?
                      (reg115 ? reg84 : reg131) : reg91)}) ?
              $signed({$unsigned((8'hab))}) : $unsigned((($unsigned((8'hae)) >>> (~|reg79)) - (8'hab))));
        end
    end
  assign wire134 = $signed((^$unsigned(wire74)));
  assign wire135 = (^~$signed(reg125[(3'h6):(3'h6)]));
  assign wire136 = reg126;
  always
    @(posedge clk) begin
      reg137 <= reg112[(1'h0):(1'h0)];
      reg138 <= wire135;
      if (wire74[(3'h5):(1'h0)])
        begin
          reg139 <= reg103[(1'h1):(1'h1)];
          reg140 <= $unsigned((reg114 ? (~$unsigned((~|reg105))) : reg102));
        end
      else
        begin
          reg139 <= ($signed((({reg83} ?
                      $signed(reg126) : reg133[(4'h8):(3'h4)]) ?
                  reg114 : ((reg89 == reg118) ?
                      (reg97 ? reg113 : reg95) : reg98[(3'h7):(2'h3)]))) ?
              reg137 : (~&$signed((~&$unsigned(reg96)))));
        end
      reg141 <= $signed((-(~^$unsigned((reg131 && wire72)))));
      reg142 <= ($signed(wire135[(3'h7):(2'h2)]) || $signed(($unsigned({reg130,
          reg120}) >= (((8'h9c) >>> reg138) ? (reg85 & (8'h9f)) : reg87))));
    end
  assign wire143 = {({{reg130}} ?
                           reg106[(3'h7):(3'h5)] : (~|$unsigned((reg110 && reg105))))};
  always
    @(posedge clk) begin
      reg144 <= reg116;
      reg145 <= (&$unsigned((reg121[(3'h4):(3'h4)] ?
          ({reg107} >= reg83) : ((wire136 ?
              wire73 : reg86) <<< (reg111 ~^ reg89)))));
      if ((-((+$unsigned(reg145)) ?
          $unsigned($signed(reg144[(4'ha):(4'h9)])) : $signed({$unsigned((8'hbe)),
              reg129[(3'h4):(1'h0)]}))))
        begin
          reg146 <= ({$unsigned((8'hb1)), reg125[(4'h8):(3'h4)]} ?
              $signed(reg110[(1'h0):(1'h0)]) : (^~{$unsigned($unsigned((8'ha0)))}));
        end
      else
        begin
          reg146 <= reg101[(3'h6):(3'h4)];
          reg147 <= (($signed($unsigned((wire143 || reg95))) ?
              $unsigned($signed((wire74 != reg109))) : $unsigned(((8'had) ?
                  (reg141 << (8'hb4)) : reg93))) >>> $signed($unsigned(reg106)));
          if ((~&(&$signed((~reg117)))))
            begin
              reg148 <= ($unsigned((((reg121 ? (7'h44) : reg109) ?
                      $unsigned(reg97) : (reg78 ^~ reg127)) + $unsigned(reg83[(3'h4):(3'h4)]))) ?
                  $unsigned(reg129[(3'h4):(2'h2)]) : reg100[(4'h9):(3'h5)]);
              reg149 <= $signed(reg100[(1'h1):(1'h1)]);
              reg150 <= (~&$signed($unsigned(((reg120 < wire76) ^~ reg144[(5'h10):(5'h10)]))));
              reg151 <= (~^reg130[(3'h4):(1'h1)]);
              reg152 <= $signed((~^(reg96[(4'h8):(2'h2)] ?
                  ((8'ha5) == reg115) : (!{wire75, (8'hae)}))));
            end
          else
            begin
              reg148 <= reg122;
            end
        end
      reg153 <= (((&reg90[(1'h0):(1'h0)]) ?
          ($signed(reg84[(1'h1):(1'h1)]) - $unsigned(reg150[(1'h1):(1'h0)])) : $unsigned($unsigned({wire71}))) + reg104[(2'h3):(2'h3)]);
    end
  assign wire154 = wire73;
  assign wire155 = $unsigned((~&($signed((reg147 ^~ wire73)) ?
                       $signed((reg103 ^ reg89)) : (reg126 << reg86[(2'h2):(2'h2)]))));
  assign wire156 = ($unsigned($unsigned($unsigned($signed(reg110)))) ?
                       reg129 : $unsigned(reg138[(4'hb):(4'h9)]));
endmodule

module module201
#(parameter param215 = {((~|((+(8'hbd)) ? ((8'h9f) <<< (8'ha8)) : (-(8'ha0)))) == (((~|(8'h9f)) ^ ((8'ha7) ? (8'h9f) : (8'h9c))) | (((8'hb6) ? (8'ha4) : (8'ha1)) ^~ ((8'hae) <<< (8'hbb)))))}, 
parameter param216 = ((|((param215 ? {param215, param215} : (param215 ? param215 : param215)) ? param215 : {(&param215), (param215 ? param215 : param215)})) ^~ (+param215)))
(y, clk, wire206, wire205, wire204, wire203, wire202);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire206;
  input wire signed [(2'h2):(1'h0)] wire205;
  input wire signed [(4'hf):(1'h0)] wire204;
  input wire [(4'hc):(1'h0)] wire203;
  input wire signed [(4'h8):(1'h0)] wire202;
  wire signed [(2'h3):(1'h0)] wire211;
  wire [(3'h7):(1'h0)] wire210;
  wire [(5'h12):(1'h0)] wire209;
  wire signed [(4'hd):(1'h0)] wire208;
  wire [(4'hf):(1'h0)] wire207;
  reg [(3'h7):(1'h0)] reg214 = (1'h0);
  reg [(4'hf):(1'h0)] reg213 = (1'h0);
  reg [(4'hb):(1'h0)] reg212 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 reg214,
                 reg213,
                 reg212,
                 (1'h0)};
  assign wire207 = wire206[(3'h5):(3'h5)];
  assign wire208 = (~^(~^wire205));
  assign wire209 = wire205[(1'h0):(1'h0)];
  assign wire210 = (wire207[(1'h1):(1'h1)] * {wire205, wire205[(1'h0):(1'h0)]});
  assign wire211 = wire208[(4'hc):(3'h5)];
  always
    @(posedge clk) begin
      reg212 <= $signed({((~(&wire209)) ?
              wire207 : $signed(wire204[(4'he):(2'h3)])),
          {$unsigned((wire211 || wire211))}});
      reg213 <= (!(-wire210[(3'h6):(3'h6)]));
      reg214 <= $signed($unsigned(wire205));
    end
endmodule

module module170  (y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire175;
  input wire signed [(4'he):(1'h0)] wire174;
  input wire [(5'h11):(1'h0)] wire173;
  input wire [(4'hb):(1'h0)] wire172;
  input wire signed [(2'h2):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire182;
  wire signed [(3'h5):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire180;
  wire [(3'h4):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire178;
  wire [(5'h12):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire176;
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 (1'h0)};
  assign wire176 = wire175;
  assign wire177 = ($unsigned(wire176) ?
                       {((~|(wire171 ? wire171 : (7'h40))) ?
                               $unsigned($signed(wire174)) : wire171),
                           {(-$unsigned(wire176))}} : (8'ha8));
  assign wire178 = (((8'haa) ^~ wire175[(5'h11):(4'hb)]) ?
                       (((wire174 ?
                           $signed(wire172) : {(8'hb1),
                               wire176}) != $signed($signed(wire177))) < $signed(($signed(wire177) << $unsigned((8'hae))))) : wire176[(1'h0):(1'h0)]);
  assign wire179 = (^(wire177 ? (!wire172) : (8'h9e)));
  assign wire180 = (!wire174);
  assign wire181 = $signed({wire173,
                       (((^~(8'hbe)) ? wire176 : wire174) ?
                           (wire180 ?
                               wire177 : {(8'hac)}) : ((wire176 | (8'ha7)) != wire179[(2'h2):(2'h2)]))});
  assign wire182 = (((8'ha1) ?
                           (wire174[(1'h1):(1'h1)] ?
                               (+wire178[(1'h1):(1'h0)]) : ((wire181 - (8'ha4)) - wire181[(1'h0):(1'h0)])) : wire180) ?
                       wire174[(4'ha):(3'h6)] : (({(wire177 ?
                                   wire171 : wire181),
                               $unsigned((8'ha6))} ?
                           $unsigned(wire173[(4'h9):(3'h5)]) : $signed(wire178[(1'h1):(1'h1)])) - wire179));
endmodule

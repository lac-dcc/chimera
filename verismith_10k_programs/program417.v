module top
#(parameter param118 = ((|(^~(((8'h9d) ? (8'h9f) : (8'hb4)) ^~ ((8'h9c) ~^ (8'hb6))))) > ((~^(((8'hbf) - (8'ha4)) ? (8'hab) : (~^(8'ha2)))) ? ((((8'h9c) >= (8'hba)) ? (|(7'h44)) : (8'ha8)) ? (~&(~^(7'h43))) : {(^(8'ha8))}) : ((~|((8'hb2) ? (8'hac) : (8'h9d))) ^~ {{(8'ha6)}}))), 
parameter param119 = param118)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire signed [(4'he):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire112;
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire89,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 wire6,
                 wire5,
                 wire91,
                 wire112,
                 (1'h0)};
  assign wire5 = ({wire1[(1'h0):(1'h0)]} ?
                     $unsigned((~^wire2[(3'h4):(1'h1)])) : wire2[(3'h7):(2'h3)]);
  assign wire6 = ($unsigned((~$unsigned((-(8'hbd))))) ?
                     {wire5, {(+$unsigned(wire2))}} : wire5);
  module7 #() modinst39 (wire38, clk, wire5, wire6, wire0, wire2);
  assign wire40 = ((8'had) || ($unsigned((8'h9c)) <<< (((~|(8'hae)) + ((8'hba) >> wire4)) & (wire6[(5'h10):(4'he)] ?
                      $unsigned(wire38) : (-wire4)))));
  assign wire41 = $signed((($unsigned(wire6[(4'ha):(1'h1)]) >>> (((8'hb0) <= wire38) ?
                          (wire4 ? wire4 : wire3) : wire2)) ?
                      wire3 : (wire6[(2'h3):(1'h1)] ?
                          wire6[(4'h8):(2'h3)] : (wire2 ?
                              {wire5, (8'hba)} : (wire40 + (8'ha0))))));
  assign wire42 = {$signed((~wire4[(5'h13):(2'h3)])),
                      $unsigned(((^(!wire5)) ?
                          {(wire5 ? wire3 : wire2)} : {$unsigned(wire5),
                              wire41[(1'h1):(1'h1)]}))};
  assign wire43 = wire2[(4'hb):(4'ha)];
  assign wire44 = (($unsigned({$signed((8'hb9)),
                      $signed(wire2)}) ^ (|wire42)) && wire1[(2'h3):(1'h1)]);
  module45 #() modinst90 (wire89, clk, wire44, wire4, wire1, wire43, wire40);
  assign wire91 = $signed(((($signed(wire0) ^ $signed(wire3)) ?
                          ($unsigned(wire1) >>> (8'hb8)) : wire0) ?
                      (((wire44 ~^ wire40) | ((7'h40) ?
                          wire89 : (8'ha7))) == $unsigned(((8'hb2) << wire3))) : $unsigned({{wire44},
                          $unsigned((8'hb2))})));
  module92 #() modinst113 (.y(wire112), .wire97(wire3), .wire95(wire4), .wire94(wire5), .wire93(wire91), .wire96(wire44), .clk(clk));
  assign wire114 = ($signed(((~&$unsigned(wire5)) + (&wire44[(4'h9):(3'h6)]))) * (($unsigned($signed((8'ha9))) ?
                           wire91 : ($unsigned(wire5) << (~^(8'hac)))) ?
                       (&($signed(wire3) ?
                           (wire43 ?
                               wire0 : wire2) : (^~wire5))) : (+(7'h41))));
  assign wire115 = (~^wire42);
  assign wire116 = {wire3, (!wire89[(2'h3):(2'h2)])};
  assign wire117 = wire116;
endmodule

module module92
#(parameter param110 = ({((8'ha9) ? ((+(8'ha8)) << (-(8'ha1))) : (((8'hb2) ? (8'haa) : (8'hb3)) << {(8'hb4)})), (((&(8'h9e)) ^ ((8'ha0) >= (8'h9d))) <<< (((8'hb7) ? (8'hb3) : (7'h43)) ? ((8'ha4) ? (8'hbc) : (8'had)) : (~|(8'h9e))))} ? ((-(((7'h41) != (8'h9c)) ? (~&(8'hb1)) : {(8'hb9), (8'had)})) + (((^(8'ha6)) ? (~(7'h43)) : ((8'hbe) ? (8'ha3) : (8'hb8))) != {(^~(7'h43))})) : (((((8'h9e) ~^ (8'h9e)) ^ ((8'had) >>> (8'ha8))) ? (~&(|(8'ha6))) : (+{(8'hbb), (8'ha5)})) <<< {(^(!(8'hbb))), (-((8'hb5) ? (7'h40) : (8'ha2)))})), 
parameter param111 = (({((param110 ^~ (8'h9c)) ? {param110} : {param110})} || ((^(param110 ? (8'ha9) : param110)) ? ((~|param110) < ((8'h9c) ? param110 : param110)) : param110)) ? {(!((param110 ^~ (8'ha8)) || (param110 ? param110 : (8'ha2))))} : ((((param110 - param110) > (&param110)) >> ({param110} ? (param110 ? param110 : param110) : (-param110))) ? param110 : (+{(&param110)}))))
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire97;
  input wire [(4'h8):(1'h0)] wire96;
  input wire [(4'ha):(1'h0)] wire95;
  input wire signed [(3'h4):(1'h0)] wire94;
  input wire [(5'h11):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire98 = {wire94[(3'h4):(1'h0)]};
  assign wire99 = wire94[(2'h2):(1'h0)];
  assign wire100 = $unsigned({(((~&wire94) >= wire99[(2'h2):(1'h1)]) >>> wire94[(2'h2):(1'h1)]),
                       (|$unsigned(wire93[(3'h6):(1'h0)]))});
  assign wire101 = $unsigned(wire100[(4'ha):(2'h3)]);
  assign wire102 = $unsigned(wire93);
  assign wire103 = $unsigned(wire97[(4'hf):(4'hd)]);
  assign wire104 = $unsigned($signed(wire98[(4'h9):(2'h3)]));
  assign wire105 = wire95;
  assign wire106 = (+$signed(({{wire105, wire98},
                       {wire100, wire96}} < wire102[(4'h8):(3'h7)])));
  always
    @(posedge clk) begin
      reg107 <= {wire104[(1'h0):(1'h0)]};
      reg108 <= wire104[(1'h1):(1'h0)];
      reg109 <= ((+(8'hb5)) ?
          (wire101[(5'h12):(4'hf)] == (~$signed($unsigned(wire97)))) : reg107);
    end
endmodule

module module45
#(parameter param88 = (((({(8'hb5)} ? ((8'haf) ? (8'hbd) : (8'hba)) : (8'hb0)) ? ({(8'ha1)} >= {(8'h9c), (7'h40)}) : ({(8'hae)} ? ((8'h9e) ? (7'h42) : (8'hba)) : (-(8'h9e)))) | ({(|(8'hbc)), ((8'ha9) ? (8'hb2) : (8'ha9))} ? {((7'h41) ? (8'hb6) : (8'haf)), (+(8'ha7))} : {((8'hb4) >= (7'h40)), ((8'hae) ? (8'hbd) : (8'ha2))})) <= ((!(8'hb8)) ? ((-((8'ha0) ? (8'ha1) : (8'ha9))) ~^ (8'haa)) : {({(8'hbf)} ? ((7'h42) ? (8'ha4) : (8'ha9)) : (|(7'h42)))})))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  assign y = {wire87, wire86, wire84, wire54, wire53, wire52, wire51, (1'h0)};
  assign wire51 = wire48;
  assign wire52 = wire47;
  assign wire53 = (^~(wire47 ?
                      wire48[(2'h3):(2'h3)] : {(((7'h44) ? wire46 : wire50) ?
                              $unsigned(wire46) : (+wire49))}));
  assign wire54 = ($signed((~&wire52[(2'h2):(1'h0)])) & $signed(wire48));
  module55 #() modinst85 (.clk(clk), .wire57(wire51), .wire56(wire54), .y(wire84), .wire58(wire53), .wire59(wire48));
  assign wire86 = (((~^(((8'hbd) <= wire48) + (wire48 << wire54))) & ($signed(wire84[(4'h8):(1'h0)]) ?
                          ($unsigned(wire49) ?
                              wire49[(2'h2):(1'h0)] : $unsigned(wire48)) : (^$unsigned(wire51)))) ?
                      wire46[(2'h2):(1'h0)] : $signed({$signed((wire46 ^~ wire48)),
                          wire46[(3'h4):(2'h2)]}));
  assign wire87 = $unsigned(((~^((^~wire86) && {wire84})) ^ {$unsigned(wire51),
                      (!wire48[(2'h2):(2'h2)])}));
endmodule

module module7
#(parameter param37 = (({(((8'hb9) >= (8'ha6)) ? ((7'h42) < (8'h9d)) : {(8'hb0), (8'hb0)}), (-(~&(8'h9e)))} && {{{(7'h43)}}, (((8'haf) ? (7'h42) : (8'hac)) ^ {(8'hb3)})}) ? (|(~|(-{(8'ha6), (7'h41)}))) : ((({(8'hb5), (8'h9f)} ^~ (-(8'hbb))) ? {{(8'h9d)}} : (((8'hbb) ? (8'hae) : (8'hb8)) ? ((8'hb2) ? (8'ha8) : (8'haf)) : ((8'hb6) ~^ (8'hbd)))) ? (~^(((8'hbe) * (8'hb6)) <<< {(8'h9e)})) : (-(~|((8'ha0) || (7'h44)))))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  assign y = {wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg35,
                 reg34,
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
  always
    @(posedge clk) begin
      reg12 <= (((($unsigned(wire8) != {wire9}) ?
              (wire11[(4'h9):(3'h4)] >>> (wire8 ?
                  wire11 : wire8)) : (-(&wire10))) ?
          wire9 : (({wire10, wire8} + (&wire9)) < (~&wire8))) == wire8);
      reg13 <= {$unsigned((wire9 >> (~&(~&wire8))))};
      reg14 <= $signed((wire10[(3'h4):(2'h2)] >>> (~{wire8[(1'h1):(1'h1)],
          (+wire9)})));
      if ((~^$unsigned({$signed((|wire11)),
          ((reg12 ? reg12 : reg13) ? $signed((8'had)) : (~&reg13))})))
        begin
          reg15 <= wire10;
          reg16 <= reg12[(1'h0):(1'h0)];
          if (wire10[(1'h0):(1'h0)])
            begin
              reg17 <= ($signed($signed($unsigned(reg16))) + $signed($unsigned((reg13 ?
                  (&reg16) : $signed(wire9)))));
            end
          else
            begin
              reg17 <= ($unsigned($unsigned(((reg15 ? reg13 : wire8) ?
                      {wire8} : reg14[(3'h7):(1'h1)]))) ?
                  $signed($unsigned((|reg17[(3'h6):(1'h1)]))) : wire9);
            end
          reg18 <= ((~^reg16[(3'h4):(3'h4)]) + (!reg15[(3'h5):(2'h2)]));
        end
      else
        begin
          if ($signed(reg14[(3'h7):(3'h7)]))
            begin
              reg15 <= $signed(((^$signed(((8'hb8) ? reg17 : wire10))) ?
                  wire9[(2'h2):(2'h2)] : $unsigned((^~(-reg13)))));
              reg16 <= $unsigned($unsigned($unsigned($signed($unsigned(reg18)))));
              reg17 <= reg14;
            end
          else
            begin
              reg15 <= {((!$signed((wire8 ? wire8 : (7'h42)))) ?
                      reg17[(3'h4):(1'h0)] : ($signed((reg16 ?
                          wire11 : reg17)) > $signed((reg17 < (8'hbb)))))};
              reg16 <= wire11[(4'hb):(1'h0)];
            end
          if ((^(~^((!(reg16 ? wire10 : wire10)) ?
              (8'ha9) : (^~$unsigned(wire9))))))
            begin
              reg18 <= ((8'ha4) ? (-$signed(reg12)) : wire11[(4'h8):(3'h7)]);
              reg19 <= (~&reg18);
              reg20 <= ($signed(({$signed(wire11),
                  (reg15 ?
                      reg17 : reg13)} ^~ wire11[(3'h4):(3'h4)])) ^~ reg13[(3'h7):(2'h3)]);
            end
          else
            begin
              reg18 <= $unsigned((!wire8));
              reg19 <= reg13[(3'h4):(2'h3)];
              reg20 <= (wire10[(1'h1):(1'h0)] <= (wire10 ?
                  ((8'haf) ?
                      reg19[(5'h10):(4'hb)] : ($unsigned(reg14) > (8'hb4))) : ($signed($signed(reg16)) * reg14[(1'h1):(1'h0)])));
            end
          reg21 <= {$signed($signed($unsigned($signed(reg12))))};
        end
    end
  assign wire22 = (reg16 ?
                      (~^((!(reg16 ? reg13 : reg19)) ?
                          reg19[(5'h13):(5'h11)] : (|$signed((8'hbb))))) : $signed((wire9 ?
                          (^(reg20 < reg13)) : $unsigned($unsigned(reg15)))));
  assign wire23 = (wire8[(3'h7):(3'h5)] ?
                      $unsigned($signed($signed($signed(wire9)))) : {(^{(reg14 >> wire22),
                              (reg21 * reg15)})});
  assign wire24 = wire23;
  assign wire25 = ($unsigned($signed($signed(wire24))) ?
                      $signed((((wire24 << wire23) ?
                          reg14 : $signed(reg18)) || (~|(^~wire23)))) : (wire23[(3'h6):(2'h3)] ?
                          $signed(wire10[(1'h0):(1'h0)]) : (!reg13[(1'h0):(1'h0)])));
  assign wire26 = (wire10[(1'h1):(1'h0)] ?
                      $unsigned((($signed((8'haf)) << (reg20 ? reg19 : wire9)) ?
                          $unsigned($unsigned(reg18)) : $signed(reg15))) : {$unsigned(reg17[(4'h9):(4'h8)])});
  assign wire27 = $signed($signed(((reg12 ? (reg21 ? reg19 : reg19) : (7'h44)) ?
                      ({wire23, (8'ha2)} ?
                          wire24[(3'h6):(2'h3)] : $signed(wire23)) : $unsigned((reg20 << reg20)))));
  assign wire28 = reg21;
  assign wire29 = ($signed((wire28[(5'h10):(5'h10)] ?
                          $signed((~wire22)) : {{reg13}, (!wire9)})) ?
                      (~$unsigned(reg12)) : (reg15[(3'h4):(1'h0)] >>> wire28));
  assign wire30 = reg16;
  assign wire31 = (-$unsigned(($unsigned($unsigned(wire28)) ?
                      $signed($unsigned(reg20)) : {((8'h9e) ?
                              wire11 : wire8)})));
  assign wire32 = wire22[(1'h0):(1'h0)];
  assign wire33 = $unsigned($unsigned($signed(((wire10 ? reg14 : reg18) ?
                      wire11[(4'ha):(3'h7)] : $signed(reg18)))));
  always
    @(posedge clk) begin
      reg34 <= (wire27[(2'h3):(2'h2)] ?
          wire22 : (~^(+(wire9[(1'h1):(1'h0)] ?
              (^reg14) : $unsigned(wire33)))));
      reg35 <= {(&$signed((wire33[(1'h0):(1'h0)] ?
              ((8'haa) ? reg19 : (8'ha4)) : (^~reg34)))),
          $signed(reg21[(4'hf):(4'hb)])};
    end
  assign wire36 = (8'hb1);
endmodule

module module55
#(parameter param82 = ((+((((8'hac) | (8'hb8)) ? ((8'hbc) ? (7'h43) : (8'h9f)) : ((8'hab) & (8'ha4))) ? (&((7'h44) ? (8'h9d) : (8'h9e))) : (~|(^(8'ha0))))) - ((^~(((8'ha6) ? (7'h43) : (7'h40)) ? {(8'ha3), (7'h44)} : (|(8'hb6)))) ^~ {{((8'had) - (8'hb5))}})), 
parameter param83 = (param82 && ((((param82 ? param82 : param82) ~^ (param82 ? param82 : (8'hb8))) ? param82 : {(param82 + param82)}) > param82)))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  input wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(4'h8):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire68,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
                 reg67,
                 (1'h0)};
  assign wire60 = (8'hb1);
  assign wire61 = (wire57[(2'h2):(1'h1)] > $signed((wire60[(4'h9):(3'h5)] ?
                      $signed((~^wire56)) : wire58)));
  assign wire62 = wire56[(1'h1):(1'h0)];
  assign wire63 = (8'haf);
  assign wire64 = $unsigned(wire56);
  assign wire65 = (wire56 >>> {((~(wire59 ? wire57 : wire60)) == wire62)});
  assign wire66 = $signed({{$unsigned(wire60),
                          ({wire62} ? (wire62 ? wire57 : (8'ha9)) : wire58)}});
  always
    @(posedge clk) begin
      reg67 <= $signed((wire56[(1'h0):(1'h0)] ?
          (wire56 ?
              ($signed((8'ha9)) | {(8'hbb),
                  wire60}) : $unsigned({wire61})) : wire60[(4'h8):(1'h0)]));
    end
  assign wire68 = (^$unsigned((^$signed(wire65[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if (((((8'hab) ?
          (&((8'haa) ?
              wire57 : wire63)) : reg67) + ((wire68 >> wire59[(1'h1):(1'h1)]) ?
          $unsigned((wire65 != wire57)) : $signed((wire68 < wire57)))) != wire68))
        begin
          reg69 <= wire57;
          reg70 <= (^~(wire56 ?
              ((~(^(8'hb9))) == $unsigned(wire60)) : (8'hb9)));
          reg71 <= wire57;
          reg72 <= $signed(reg69[(2'h2):(2'h2)]);
          reg73 <= $unsigned(($unsigned({reg71}) < reg71[(3'h5):(2'h2)]));
        end
      else
        begin
          if ((wire63 ?
              $unsigned(((reg73 + wire66) < (8'h9c))) : ($signed(({reg71} * (wire64 << wire64))) != (^~({wire63} != (wire68 >>> reg70))))))
            begin
              reg69 <= (|$unsigned((wire62[(4'ha):(4'h9)] ?
                  ((wire68 <= wire57) ? reg73 : wire66) : (|reg72))));
              reg70 <= ((((~^(+wire65)) & {(8'hb6)}) && wire59) - $unsigned($signed(($unsigned(wire60) ?
                  {wire57} : reg67[(1'h0):(1'h0)]))));
              reg71 <= ((((~|(reg72 ? wire68 : wire59)) ?
                      ($signed(wire63) ?
                          wire56 : wire62[(2'h3):(2'h3)]) : reg72) >= ((~&((8'hb8) ~^ reg67)) ?
                      $unsigned(((8'hbf) ? wire56 : wire66)) : ((reg69 ?
                          wire68 : reg73) - $unsigned(wire60)))) ?
                  {((!reg70[(4'hb):(1'h1)]) ?
                          wire60[(2'h3):(1'h0)] : {(reg71 ?
                                  wire60 : wire57)})} : wire68[(5'h14):(3'h6)]);
              reg72 <= $signed((reg72 ?
                  wire62 : ($signed((^~wire57)) ?
                      (wire64 ?
                          (reg73 >> wire64) : reg73) : {(wire62 && (8'ha3))})));
              reg73 <= wire65;
            end
          else
            begin
              reg69 <= reg69[(2'h2):(2'h2)];
              reg70 <= $unsigned(($unsigned({wire68}) || wire65));
              reg71 <= wire65[(3'h5):(1'h0)];
              reg72 <= ($unsigned(reg70[(4'he):(1'h1)]) ^~ (^~(^~(reg71 == $unsigned(reg73)))));
            end
          reg74 <= $unsigned(wire66);
          if ((8'hb3))
            begin
              reg75 <= wire56[(1'h0):(1'h0)];
              reg76 <= $signed({{wire63},
                  $unsigned($signed(reg72[(3'h6):(3'h6)]))});
              reg77 <= reg69[(1'h0):(1'h0)];
              reg78 <= reg70[(1'h1):(1'h0)];
              reg79 <= $signed(reg67[(2'h3):(2'h2)]);
            end
          else
            begin
              reg75 <= $unsigned(reg76[(1'h0):(1'h0)]);
              reg76 <= reg76[(2'h3):(2'h3)];
              reg77 <= {$unsigned(wire64)};
            end
        end
    end
  assign wire80 = wire62;
  assign wire81 = $unsigned({$unsigned($signed({reg73, (8'ha9)}))});
endmodule

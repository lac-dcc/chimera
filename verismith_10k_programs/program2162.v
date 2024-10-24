module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire173;
  wire signed [(3'h4):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire170;
  wire signed [(2'h2):(1'h0)] wire169;
  wire [(4'h8):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire142;
  wire signed [(5'h11):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire166;
  wire signed [(5'h11):(1'h0)] wire167;
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire139,
                 wire5,
                 wire4,
                 wire141,
                 wire142,
                 wire143,
                 wire144,
                 wire145,
                 wire165,
                 wire166,
                 wire167,
                 reg164,
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
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire4 = {($signed(({wire3} <<< $signed(wire2))) >> ({wire1} ?
                         (&(wire2 << (8'hb1))) : wire2[(3'h5):(1'h0)])),
                     $unsigned(wire1[(3'h7):(1'h0)])};
  assign wire5 = {{$unsigned({(^~wire4), (wire0 ? wire3 : (8'h9d))}),
                         wire0[(2'h2):(1'h0)]},
                     wire3[(4'hd):(2'h2)]};
  module6 #() modinst140 (.wire9(wire2), .wire10(wire4), .clk(clk), .wire7(wire5), .y(wire139), .wire8(wire3), .wire11(wire1));
  assign wire141 = {$unsigned({(!$unsigned(wire1))})};
  assign wire142 = $unsigned($unsigned(((~wire4) ?
                       $unsigned({wire2, wire139}) : (~^(^(8'hbf))))));
  assign wire143 = $unsigned(wire5);
  assign wire144 = $signed(($unsigned($signed($unsigned(wire141))) + ($signed(wire5[(5'h13):(4'hd)]) & (!wire142[(4'ha):(3'h6)]))));
  assign wire145 = wire143;
  always
    @(posedge clk) begin
      reg146 <= {(8'hb7)};
      if ({$unsigned((8'hbe))})
        begin
          if (wire1[(4'h9):(3'h4)])
            begin
              reg147 <= $signed((|$signed((wire142[(3'h4):(2'h2)] ?
                  (wire144 ? wire142 : wire144) : wire3[(4'he):(4'hd)]))));
              reg148 <= reg146;
              reg149 <= $unsigned((!$unsigned(wire4[(4'hd):(3'h5)])));
              reg150 <= ($unsigned(($unsigned($unsigned(wire139)) ?
                      reg148[(3'h4):(1'h1)] : $signed({reg149, wire2}))) ?
                  wire142 : {(8'hbe)});
            end
          else
            begin
              reg147 <= wire142[(4'hd):(4'hd)];
              reg148 <= $unsigned(wire144);
              reg149 <= wire139[(2'h2):(2'h2)];
            end
          reg151 <= (8'hb4);
        end
      else
        begin
          reg147 <= $unsigned(($signed(reg151[(2'h2):(1'h1)]) ?
              wire145 : wire145));
          if (wire142[(4'hd):(4'h9)])
            begin
              reg148 <= $unsigned((8'hba));
              reg149 <= ($signed($unsigned((~|$signed(reg151)))) | $unsigned(($signed(wire143) ?
                  {$unsigned(wire143)} : ((^~reg149) ?
                      (wire141 ? wire144 : wire0) : (~&(8'hb8))))));
            end
          else
            begin
              reg148 <= $unsigned($unsigned((|(&(reg146 ? reg147 : wire139)))));
              reg149 <= wire139[(3'h7):(3'h5)];
              reg150 <= (&wire142[(1'h1):(1'h1)]);
              reg151 <= (reg151[(1'h1):(1'h0)] ^ $unsigned(reg146));
              reg152 <= ($unsigned(wire141) >>> ($unsigned(reg149[(2'h3):(2'h3)]) ?
                  wire0[(4'hf):(3'h5)] : (|(^{wire5}))));
            end
        end
      if (reg152)
        begin
          reg153 <= (-wire0);
          reg154 <= wire141[(4'hd):(1'h0)];
          reg155 <= {reg149[(3'h5):(3'h4)], wire5};
          reg156 <= (!(^(8'hae)));
        end
      else
        begin
          if ({wire3,
              ((wire144[(1'h1):(1'h0)] >> $unsigned($unsigned(wire2))) == reg146[(3'h6):(3'h5)])})
            begin
              reg153 <= $signed(reg153[(4'h9):(2'h3)]);
              reg154 <= ((^(((reg148 - wire143) ?
                      (reg151 ?
                          wire142 : wire145) : wire4[(3'h4):(1'h1)]) | reg151)) ?
                  {($signed((reg147 ? reg153 : (8'haa))) ?
                          ((reg150 > wire144) && wire139[(2'h3):(2'h3)]) : ($signed(wire3) ?
                              (~^reg155) : wire139[(1'h0):(1'h0)]))} : wire1[(3'h6):(3'h5)]);
              reg155 <= (8'ha2);
              reg156 <= wire141[(1'h0):(1'h0)];
              reg157 <= (~|(^(($unsigned(reg155) ?
                      {wire142} : (wire142 ? wire144 : reg151)) ?
                  (7'h41) : $unsigned($signed(reg152)))));
            end
          else
            begin
              reg153 <= $signed((reg156[(3'h6):(3'h6)] < ($signed(wire143[(3'h4):(3'h4)]) ?
                  (wire143 & (reg152 ? wire3 : reg153)) : (+(wire145 ?
                      reg149 : wire0)))));
              reg154 <= $unsigned($unsigned($signed({$signed(wire144)})));
            end
          if ($signed(((^~(wire142 ^ wire141[(4'hc):(3'h4)])) ?
              $unsigned({((8'hb3) >= reg155)}) : (wire142[(4'hf):(4'h9)] < ({(8'haf)} ~^ ((7'h41) ?
                  wire141 : wire139))))))
            begin
              reg158 <= (8'ha6);
              reg159 <= wire143;
              reg160 <= (7'h44);
              reg161 <= ((wire2[(5'h11):(1'h1)] ?
                  wire142[(4'hb):(1'h1)] : ({(reg153 ?
                          (8'hb6) : reg146)} << ($signed(wire5) ?
                      (reg156 >= wire4) : wire141))) + (!wire5));
            end
          else
            begin
              reg158 <= reg150;
              reg159 <= (~&$unsigned((~|$unsigned((wire143 ?
                  reg154 : (8'ha5))))));
            end
          reg162 <= reg157;
          reg163 <= (reg151 << (&reg148));
          reg164 <= (({((~^reg161) != reg146[(2'h2):(1'h1)])} ?
              wire2[(5'h11):(4'hb)] : wire5[(4'he):(1'h0)]) < (((~&$signed(reg148)) <= (+$unsigned(reg156))) ?
              (wire5[(3'h4):(1'h0)] ?
                  ((8'ha1) ?
                      $signed(reg160) : $unsigned(reg159)) : (^$signed((8'hb6)))) : {reg146[(3'h5):(2'h2)]}));
        end
    end
  assign wire165 = reg146;
  assign wire166 = $signed(({wire4} - reg156));
  module86 #() modinst168 (wire167, clk, reg148, reg149, wire2, reg151, reg163);
  assign wire169 = (~&$unsigned((&(~^(~&reg151)))));
  assign wire170 = wire139;
  assign wire171 = wire1[(1'h0):(1'h0)];
  assign wire172 = ((wire144[(1'h0):(1'h0)] - (((reg160 || (8'hb6)) ?
                               $signed(wire141) : $signed(reg162)) ?
                           reg149[(2'h3):(1'h0)] : $unsigned({wire2}))) ?
                       (reg148[(4'hd):(4'hb)] >> wire142) : {((!(wire142 ?
                                   (7'h40) : reg147)) ?
                               reg161[(3'h5):(3'h4)] : wire141)});
  assign wire173 = ($unsigned($signed((reg157 ?
                       (wire139 ? wire169 : (8'hbd)) : wire172))) > {{(8'h9e),
                           (^(reg164 | reg153))},
                       (~&wire142)});
  assign wire174 = $signed(((!(^$signed((7'h44)))) ~^ wire0[(5'h11):(1'h0)]));
endmodule

module module6
#(parameter param137 = {((!((~|(8'hb1)) << ((8'ha8) ? (8'hb2) : (8'ha5)))) >= {(!(-(7'h43))), (+((8'haa) + (8'hbe)))}), ((8'h9c) >>> ((((8'hba) ? (8'hb5) : (8'ha9)) ? ((8'had) <= (8'hb3)) : ((7'h43) ? (8'hbe) : (8'hb2))) < (((8'ha6) >>> (8'ha0)) < (-(8'hb7)))))}, 
parameter param138 = ((-{param137}) ? (~^({{param137}, (param137 ^ param137)} - (param137 ? param137 : (+param137)))) : {(({param137, param137} <<< ((8'ha9) * param137)) | (param137 * param137)), ({param137} ? (~&(!(8'h9e))) : (^~param137))}))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire135;
  wire [(3'h4):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire130;
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire107,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire12,
                 wire25,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire50,
                 wire80,
                 wire130,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire12 = wire8;
  module13 #() modinst26 (wire25, clk, wire7, wire11, wire12, wire9);
  assign wire27 = wire25[(2'h3):(1'h1)];
  assign wire28 = $unsigned(wire27);
  assign wire29 = wire8;
  assign wire30 = wire29[(1'h0):(1'h0)];
  module31 #() modinst51 (wire50, clk, wire29, wire12, wire11, wire9);
  module52 #() modinst81 (.wire55(wire30), .wire57(wire9), .wire56(wire11), .y(wire80), .clk(clk), .wire54(wire25), .wire53(wire7));
  assign wire82 = (~(wire80 ?
                      ($unsigned($signed((8'ha7))) ?
                          ((wire50 ? wire7 : wire50) ?
                              $unsigned(wire25) : wire80[(3'h5):(3'h4)]) : wire7[(3'h6):(3'h6)]) : wire25[(2'h3):(1'h1)]));
  assign wire83 = (wire7 ?
                      $unsigned((wire11 ~^ {wire12[(4'he):(3'h4)],
                          {wire29, wire10}})) : (^~wire9));
  assign wire84 = ((^wire82[(4'ha):(4'ha)]) - $signed(wire12));
  assign wire85 = {$signed((|{$unsigned((8'hbd))}))};
  module86 #() modinst108 (wire107, clk, wire29, wire82, wire10, wire12, wire30);
  module109 #() modinst131 (.clk(clk), .wire110(wire11), .wire114(wire12), .wire113(wire82), .wire111(wire80), .wire112(wire84), .y(wire130));
  always
    @(posedge clk) begin
      reg132 <= $unsigned((wire8[(5'h12):(3'h5)] ?
          $signed($signed({wire85, wire107})) : {$signed($signed(wire83))}));
      reg133 <= wire29;
      reg134 <= wire10;
    end
  assign wire135 = $unsigned((+(^~wire12[(5'h12):(5'h11)])));
  assign wire136 = wire130[(3'h6):(3'h4)];
endmodule

module module109
#(parameter param128 = ({{(+((8'hb0) ? (8'ha2) : (8'hb5))), (((8'hb5) ? (8'hb8) : (8'ha0)) != ((8'h9d) + (8'hbd)))}, (~(8'ha1))} <<< (~^((^((7'h41) <<< (8'hbd))) ~^ ((&(7'h40)) ? ((8'hbb) * (8'hb9)) : ((8'hbf) >>> (8'ha2)))))), 
parameter param129 = param128)
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire114;
  input wire [(4'hb):(1'h0)] wire113;
  input wire signed [(3'h7):(1'h0)] wire112;
  input wire signed [(4'hd):(1'h0)] wire111;
  input wire [(3'h7):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire115;
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 (1'h0)};
  assign wire115 = {$unsigned(wire114),
                       (wire114 ? $unsigned(wire112) : {wire110})};
  assign wire116 = wire111;
  assign wire117 = wire116;
  assign wire118 = (+({($signed(wire113) + (7'h44))} ?
                       $unsigned((wire114 ?
                           (|wire116) : (wire113 ?
                               wire111 : wire116))) : (8'ha3)));
  assign wire119 = (+wire112);
  assign wire120 = (wire117[(3'h4):(1'h1)] >> $unsigned((|(~|(wire115 == wire110)))));
  assign wire121 = (^~(wire119[(3'h5):(1'h0)] == $signed(wire111)));
  assign wire122 = (+(^wire112[(2'h2):(1'h0)]));
  assign wire123 = ((!wire113[(4'ha):(2'h3)]) ?
                       wire115[(4'h9):(3'h4)] : (~|$signed({(~|(8'hb4)),
                           (wire117 ? wire120 : wire120)})));
  assign wire124 = (!wire116[(2'h2):(1'h0)]);
  assign wire125 = $unsigned({{wire120[(4'hc):(4'h8)]},
                       $signed((|(wire117 > wire114)))});
  assign wire126 = $signed(wire123[(2'h3):(1'h0)]);
  assign wire127 = ({$signed({{wire125}}), wire116[(2'h2):(1'h1)]} ?
                       wire113[(4'h8):(1'h0)] : {wire119[(1'h0):(1'h0)],
                           wire124[(4'hb):(4'hb)]});
endmodule

module module86
#(parameter param105 = (~|({(((8'haa) >>> (8'hb6)) ? (^~(8'hbd)) : ((8'h9d) ? (8'hb3) : (8'hba)))} != (|(&((8'hb6) <= (8'ha6)))))), 
parameter param106 = (({param105, (&param105)} && (~^{(param105 ? param105 : (8'haa))})) >= (({param105} ? ((param105 || param105) >= param105) : {param105}) - param105)))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire91;
  input wire [(4'hb):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire [(2'h2):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 (1'h0)};
  assign wire92 = $unsigned($unsigned({(~^(wire88 <= wire89)),
                      $signed((wire90 ? wire89 : wire91))}));
  assign wire93 = $signed((wire91[(4'he):(4'ha)] ~^ $unsigned(wire89)));
  assign wire94 = wire92[(4'hf):(4'h9)];
  assign wire95 = (($signed(((wire88 ? wire94 : wire88) ?
                          $unsigned(wire88) : wire87)) >> wire94[(4'h8):(3'h4)]) ?
                      wire90[(4'hb):(2'h3)] : {wire93});
  assign wire96 = $signed($unsigned((wire87[(4'h8):(2'h3)] ?
                      $unsigned((wire91 ? (8'hbd) : wire88)) : wire88)));
  assign wire97 = $signed(($signed(wire89[(2'h3):(2'h2)]) ^ wire88[(2'h2):(1'h0)]));
  assign wire98 = $signed(((!wire94[(2'h3):(1'h0)]) ~^ $unsigned({(wire96 ^~ (8'ha2))})));
  assign wire99 = wire90[(2'h3):(1'h0)];
  assign wire100 = ($unsigned($unsigned(($unsigned(wire90) ?
                           (^wire92) : wire97))) ?
                       wire96 : $unsigned((-((8'ha1) == {wire91, wire97}))));
  assign wire101 = $unsigned((wire90 >>> wire92));
  assign wire102 = $unsigned(wire92[(1'h1):(1'h1)]);
  assign wire103 = (~(((-wire97[(3'h6):(2'h2)]) ^~ wire91[(4'h9):(3'h5)]) ?
                       wire101 : {wire100[(3'h6):(3'h5)]}));
  assign wire104 = $unsigned(($signed({(&wire88),
                       wire102[(3'h4):(1'h1)]}) << wire89));
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire57;
  input wire signed [(4'hd):(1'h0)] wire56;
  input wire [(3'h6):(1'h0)] wire55;
  input wire [(4'hb):(1'h0)] wire54;
  input wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= (~^($unsigned($signed(wire54[(3'h5):(2'h2)])) ?
          {($signed(wire53) ? $signed(wire54) : $unsigned((8'h9d))),
              ((wire54 ? (8'hb7) : wire54) < wire54[(4'hb):(4'h9)])} : wire56));
    end
  assign wire59 = wire53;
  assign wire60 = ((^wire59[(4'hc):(2'h2)]) >= wire59[(4'he):(4'hd)]);
  assign wire61 = (|$unsigned((wire57[(3'h5):(2'h2)] ?
                      $unsigned(wire54) : $unsigned(wire54[(2'h3):(2'h3)]))));
  assign wire62 = wire59[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg63 <= $unsigned(($signed($signed($unsigned(wire55))) ?
          ((wire60 ?
              (-wire53) : (~wire54)) >= ($unsigned(wire59) && (wire62 && wire59))) : wire57));
      if ($signed($signed({$signed($unsigned(reg63)), ((^reg58) ^~ reg63)})))
        begin
          if (wire62[(3'h6):(1'h0)])
            begin
              reg64 <= reg63[(3'h6):(2'h2)];
              reg65 <= (!($signed({wire61, $signed(wire55)}) ?
                  {((8'ha3) ?
                          wire56[(3'h7):(2'h3)] : (reg58 > wire56))} : $signed({(|wire60),
                      (&reg63)})));
            end
          else
            begin
              reg64 <= (8'ha9);
              reg65 <= $signed($unsigned($signed((^~(wire62 ?
                  (8'hb1) : reg65)))));
              reg66 <= {wire54, reg64};
              reg67 <= wire60;
            end
          reg68 <= (((((wire62 >> reg58) >> ((8'hb5) ? wire61 : wire56)) ?
              $signed((wire57 <= (8'hab))) : {reg66[(2'h3):(2'h2)]}) <= wire56) > (reg65 ^ (8'hbb)));
          reg69 <= (^wire60);
          if ($unsigned($signed((!((~&reg67) >>> $signed(wire55))))))
            begin
              reg70 <= $unsigned((-$signed((8'hb2))));
              reg71 <= $signed($unsigned((&$signed((-(7'h41))))));
              reg72 <= $signed($signed((7'h42)));
            end
          else
            begin
              reg70 <= (reg68[(3'h7):(3'h6)] ?
                  $signed((~|((reg71 | reg68) >>> (reg68 ?
                      reg63 : wire61)))) : $unsigned($signed((!(reg72 ?
                      reg67 : wire61)))));
              reg71 <= $unsigned({wire62[(3'h5):(3'h4)], wire53});
            end
        end
      else
        begin
          if ($unsigned($signed(reg72)))
            begin
              reg64 <= wire60[(4'he):(2'h2)];
              reg65 <= $unsigned($unsigned({reg58,
                  (reg67 ? $unsigned(wire60) : $signed(reg64))}));
            end
          else
            begin
              reg64 <= {$signed((((|wire60) | reg69) ?
                      (reg68[(4'hf):(4'ha)] ?
                          (!reg58) : $unsigned(reg69)) : (((8'ha9) > reg66) < $unsigned((8'had))))),
                  ($signed(wire60) ^~ (!wire57[(3'h6):(2'h2)]))};
              reg65 <= wire59;
            end
        end
    end
  assign wire73 = $unsigned((^~wire54));
  assign wire74 = $signed(reg67[(2'h2):(1'h1)]);
  assign wire75 = wire62;
  assign wire76 = $unsigned(wire74[(3'h7):(3'h7)]);
  assign wire77 = reg64[(4'h8):(3'h5)];
  assign wire78 = {{$unsigned(wire74)}, wire73[(1'h0):(1'h0)]};
  assign wire79 = (^~((((reg66 >> (8'h9d)) ?
                      $signed(wire78) : (~^wire60)) != (~^wire60)) <<< wire59));
endmodule

module module31
#(parameter param49 = (8'hbf))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire43,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire36 = (~^$signed((wire33 ? wire32 : wire33[(2'h2):(2'h2)])));
  assign wire37 = $unsigned((wire32[(4'ha):(4'h9)] <<< ((((8'hb5) == wire36) > wire35[(4'h8):(1'h1)]) ?
                      ((8'hab) < {wire35}) : (wire33 << (8'hb4)))));
  assign wire38 = ($unsigned((!(~|(+wire32)))) + $unsigned(wire34[(3'h5):(2'h2)]));
  assign wire39 = $unsigned(((wire37 && wire37[(4'ha):(3'h7)]) ^~ ((wire37[(4'h9):(3'h6)] * $unsigned(wire33)) ?
                      wire38[(3'h7):(2'h2)] : wire33)));
  always
    @(posedge clk) begin
      reg40 <= (wire33[(3'h5):(2'h2)] ?
          wire39[(4'ha):(4'h8)] : $signed($unsigned($signed((wire33 ^ wire33)))));
      reg41 <= $unsigned(reg40);
      reg42 <= wire37[(4'h8):(2'h3)];
    end
  assign wire43 = $signed((~^(({(8'ha1)} ~^ (^wire32)) <<< $signed($unsigned(wire39)))));
  always
    @(posedge clk) begin
      reg44 <= $unsigned(($unsigned({wire39[(3'h7):(1'h0)],
              $unsigned(wire35)}) ?
          $signed(wire37) : wire32[(4'hb):(4'ha)]));
      reg45 <= $signed((8'hae));
    end
  assign wire46 = (!$signed((~|wire35[(3'h6):(3'h5)])));
  assign wire47 = {(wire32[(1'h1):(1'h0)] ?
                          $signed($unsigned((wire34 ?
                              reg45 : wire35))) : $unsigned($signed($signed(wire32))))};
  assign wire48 = wire39[(4'he):(3'h7)];
endmodule

module module13
#(parameter param24 = ((!((((8'hb8) >> (8'ha2)) >>> ((8'had) > (8'ha7))) ? (((8'ha9) ? (8'ha1) : (8'hab)) ~^ ((8'hb1) ? (8'ha4) : (8'ha1))) : (((8'hb3) ? (8'hac) : (8'hac)) ? ((8'hae) <<< (8'had)) : ((8'ha7) ~^ (8'hb3))))) ? ((~&((!(7'h44)) ^~ (^(8'hb6)))) ? (+{((8'hbf) ? (8'hb0) : (8'hb2))}) : ((((8'hb7) <<< (8'hba)) ? ((8'hbe) | (8'hb4)) : ((8'ha1) - (8'hbb))) ? {(!(8'hae))} : (~^{(8'ha1)}))) : (+({(^(8'hb0)), (~^(8'hb4))} ? (~&((8'hb4) < (8'h9d))) : ((^~(8'ha5)) - (7'h41))))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  assign y = {wire19, wire18, reg23, reg22, reg21, reg20, (1'h0)};
  assign wire18 = wire17;
  assign wire19 = wire18;
  always
    @(posedge clk) begin
      reg20 <= (7'h42);
      reg21 <= ((!((8'had) & wire18[(2'h3):(2'h2)])) ?
          (~&wire14[(4'hf):(4'hc)]) : ($signed($unsigned($signed(wire17))) & ((wire15 != wire19[(4'hb):(4'h9)]) != {(wire19 ?
                  wire16 : reg20)})));
    end
  always
    @(posedge clk) begin
      reg22 <= ($signed($unsigned((+(~^wire14)))) == $unsigned({((wire19 ?
                  wire19 : wire17) ?
              (~&wire16) : wire14),
          ((^~wire14) ? $signed((8'hba)) : wire19[(4'h9):(1'h1)])}));
      reg23 <= reg20[(4'h8):(4'h8)];
    end
endmodule

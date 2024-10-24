module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire250;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire163;
  wire signed [(4'h8):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire167;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(4'h9):(1'h0)] wire248;
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  assign y = {wire250,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire161,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire170,
                 wire248,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg168,
                 reg169,
                 (1'h0)};
  assign wire4 = ((|$signed(((wire0 ? wire3 : wire3) ?
                     (-(8'ha0)) : $unsigned(wire3)))) <= (!wire2));
  assign wire5 = wire3;
  assign wire6 = ((^$signed(((!wire2) == (~&wire0)))) != (~&wire4[(1'h0):(1'h0)]));
  assign wire7 = $signed((~|{($unsigned(wire3) ?
                         (wire6 <<< wire4) : (wire4 * (8'hbe))),
                     wire3[(4'he):(3'h4)]}));
  assign wire8 = $unsigned({wire7[(4'he):(3'h6)]});
  assign wire9 = ((~|((wire0[(2'h3):(1'h1)] <<< (wire3 ? wire8 : wire1)) ?
                     $signed(wire4[(4'h9):(2'h2)]) : ($unsigned(wire2) ?
                         $unsigned(wire6) : wire5[(3'h5):(1'h1)]))) != wire0);
  always
    @(posedge clk) begin
      reg10 <= {wire0};
      reg11 <= ($unsigned($unsigned($signed(wire6[(3'h4):(3'h4)]))) ^~ $signed(((reg10[(2'h3):(2'h3)] ^ $unsigned(wire4)) ?
          reg10 : ($signed(wire8) ? (~wire9) : (wire1 ? (8'haf) : wire6)))));
      reg12 <= $unsigned(wire2);
      reg13 <= $signed(({((wire1 ? wire0 : wire6) ~^ $signed(wire9)),
              $unsigned($signed(wire8))} ?
          $signed(wire8[(2'h3):(2'h2)]) : $unsigned(((|wire8) ?
              reg12[(3'h5):(2'h3)] : wire0[(4'he):(4'hc)]))));
      if (reg11[(3'h4):(2'h2)])
        begin
          reg14 <= wire9;
          reg15 <= reg14[(2'h3):(1'h0)];
        end
      else
        begin
          reg14 <= wire5[(1'h0):(1'h0)];
          reg15 <= (reg10[(3'h4):(2'h2)] ?
              reg12 : (reg14[(4'hc):(4'h8)] ^~ $unsigned(reg12[(2'h2):(1'h1)])));
        end
    end
  assign wire16 = $unsigned((~^((7'h42) ?
                      $unsigned($unsigned(reg14)) : $unsigned(reg11[(4'hb):(4'ha)]))));
  assign wire17 = (~(~|wire1[(3'h6):(1'h0)]));
  assign wire18 = ((+wire4[(2'h2):(1'h0)]) ?
                      {($signed((~|(8'hb3))) ?
                              (+(wire3 >> reg15)) : ((wire3 ? (8'haf) : wire1) ?
                                  $signed(wire0) : (wire6 ? wire9 : wire7))),
                          $signed(((reg10 || (8'hab)) != $unsigned(reg10)))} : $signed({(~^(wire6 + wire9))}));
  assign wire19 = (^~$signed(wire16[(3'h4):(1'h1)]));
  module20 #() modinst162 (wire161, clk, wire17, wire19, reg10, reg14);
  assign wire163 = reg12;
  assign wire164 = ((+$unsigned((~&(8'hac)))) - ({$unsigned((wire4 * reg13))} ~^ $unsigned((~^$unsigned(reg15)))));
  assign wire165 = (!wire7[(4'hd):(4'h8)]);
  assign wire166 = (|$unsigned((8'ha9)));
  assign wire167 = wire17[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      reg168 <= (8'hab);
      reg169 <= wire165[(1'h1):(1'h1)];
    end
  assign wire170 = wire9;
  module171 #() modinst249 (.wire174(reg11), .wire173(wire170), .y(wire248), .wire175(wire167), .wire172(wire161), .clk(clk));
  assign wire250 = ({$signed(((^~(7'h42)) ~^ ((8'hb4) <<< wire9)))} <<< ($signed(reg168) ?
                       $unsigned(((wire0 == wire16) <= (8'hb6))) : (+$unsigned((wire166 ?
                           wire248 : wire4)))));
endmodule

module module171
#(parameter param247 = ((8'hb8) ? (((8'hb1) ? (((8'ha9) ? (8'h9d) : (8'ha7)) ? ((8'hb3) ^~ (8'h9d)) : ((8'hbf) && (8'hb2))) : ({(8'hba), (8'haa)} << (|(8'had)))) == ((((8'hb6) ? (8'ha6) : (8'ha7)) ? ((8'h9f) > (8'hb6)) : (+(7'h43))) ? (~&{(8'hb8)}) : ((-(8'hbc)) ? (^(8'haf)) : {(7'h43)}))) : (^{((~|(8'hab)) < {(8'hb8)})})))
(y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire175;
  input wire [(5'h14):(1'h0)] wire174;
  input wire signed [(3'h4):(1'h0)] wire173;
  input wire signed [(5'h11):(1'h0)] wire172;
  wire signed [(4'hd):(1'h0)] wire246;
  wire [(5'h12):(1'h0)] wire244;
  wire signed [(5'h15):(1'h0)] wire176;
  reg [(2'h3):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg190 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(4'he):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg187 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg185 = (1'h0);
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  assign y = {wire246,
                 wire244,
                 wire176,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
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
                 (1'h0)};
  assign wire176 = {(^~($signed(wire174) ?
                           (&wire172[(2'h3):(2'h2)]) : (|{(8'ha7)}))),
                       (!(wire174 ^ $unsigned((wire174 ? wire175 : wire172))))};
  always
    @(posedge clk) begin
      reg177 <= wire174;
      reg178 <= wire176[(3'h4):(3'h4)];
      reg179 <= $unsigned((wire175 > (+({(8'ha0)} ^ wire176))));
      reg180 <= $unsigned(($signed($unsigned((-(8'hb0)))) ?
          (7'h44) : (((~|wire174) + {wire176}) << wire172[(3'h5):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg181 <= wire172;
      reg182 <= (wire172[(2'h2):(2'h2)] ?
          ($unsigned(((wire175 >>> (8'hbc)) + wire175)) & $signed($signed((+reg177)))) : $signed((($unsigned(wire172) != $signed((8'hbb))) ?
              {reg177} : $unsigned($unsigned(wire175)))));
      reg183 <= ($unsigned({(+(reg178 ?
              reg178 : reg178))}) ~^ ((^~$signed((&reg178))) ?
          $unsigned(({reg177, reg180} * $unsigned(reg178))) : wire176));
      if ((&{((~&wire172[(4'ha):(3'h6)]) ?
              ((~reg181) ?
                  $signed(reg179) : reg177[(3'h7):(2'h2)]) : (~^wire173[(1'h1):(1'h0)]))}))
        begin
          reg184 <= $signed($signed($unsigned($unsigned((!reg178)))));
          if ($unsigned({($unsigned(((7'h42) ? wire173 : (8'hb9))) ?
                  ($unsigned(wire172) <= $signed(reg177)) : reg180[(3'h6):(3'h6)])}))
            begin
              reg185 <= $unsigned($unsigned($signed((~^(wire175 ?
                  (8'hae) : reg178)))));
              reg186 <= (((!$unsigned(wire172)) >> reg177[(3'h6):(3'h6)]) - (reg177 == (~^(reg183 >>> (reg183 >= reg181)))));
              reg187 <= reg182[(4'hc):(1'h0)];
              reg188 <= (~reg179);
              reg189 <= ($unsigned(({(~^wire173)} ?
                  ((~&reg178) == (|reg183)) : (reg178[(1'h0):(1'h0)] & $signed(wire174)))) == $signed((-(reg180[(1'h1):(1'h0)] ?
                  reg188[(1'h1):(1'h0)] : {reg178, wire173}))));
            end
          else
            begin
              reg185 <= reg189;
              reg186 <= (~|(reg187[(3'h6):(3'h6)] ?
                  (((wire173 ? reg178 : reg187) ? wire173 : (8'ha7)) ?
                      (|{reg184, reg184}) : reg182) : {$unsigned(wire172)}));
              reg187 <= (8'ha1);
            end
          reg190 <= $signed($signed(wire174[(2'h2):(1'h0)]));
        end
      else
        begin
          reg184 <= reg178;
          reg185 <= {(!wire176[(2'h3):(1'h1)])};
          reg186 <= reg182;
          reg187 <= (~&{$signed($signed((reg186 < reg183))),
              ($unsigned((reg189 >>> reg184)) ?
                  wire174[(2'h2):(2'h2)] : (~^reg177[(1'h0):(1'h0)]))});
          reg188 <= reg190[(1'h1):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg191 <= (reg179 >= (reg177 - $signed((^~$unsigned(reg180)))));
    end
  module192 #() modinst245 (wire244, clk, reg180, reg183, wire175, wire172);
  assign wire246 = ($unsigned($unsigned((~^{reg183, (8'hb0)}))) ?
                       {$signed($signed((reg188 * reg187)))} : {$signed(($unsigned(reg180) <<< (8'ha6)))});
endmodule

module module20
#(parameter param159 = {(&((((8'hb5) ^~ (8'h9c)) ? ((8'haf) <<< (8'ha4)) : (8'ha6)) ^ ((^~(8'ha9)) << ((8'ha3) ? (8'had) : (8'ha5))))), (-{(((7'h42) ? (8'h9d) : (8'hb8)) << ((8'h9f) || (8'hb6)))})}, 
parameter param160 = (param159 ? param159 : ((~&((-param159) ? (param159 >> (8'hb0)) : (param159 ? param159 : param159))) - param159)))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire157;
  wire signed [(5'h15):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire152;
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire87,
                 wire25,
                 wire89,
                 wire90,
                 wire121,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire152,
                 (1'h0)};
  assign wire25 = (~(8'hb4));
  module26 #() modinst88 (.wire31(wire22), .wire27(wire23), .wire30(wire24), .wire29(wire25), .wire28(wire21), .y(wire87), .clk(clk));
  assign wire89 = $unsigned(($unsigned((~&wire23[(3'h5):(1'h1)])) ^~ $unsigned($unsigned((~wire24)))));
  assign wire90 = (wire24 | $signed($unsigned($signed({wire22, wire24}))));
  module91 #() modinst122 (.wire93(wire23), .clk(clk), .wire95(wire25), .y(wire121), .wire94(wire21), .wire92(wire90));
  assign wire123 = wire25[(5'h12):(4'hc)];
  assign wire124 = (~^$unsigned(wire24[(2'h2):(1'h1)]));
  assign wire125 = $signed(wire24);
  assign wire126 = {(8'ha4)};
  assign wire127 = ((wire124[(1'h0):(1'h0)] ?
                       ($signed($signed(wire89)) * wire22[(4'h9):(3'h5)]) : $signed((+wire121))) << (((+(wire126 <<< wire23)) ?
                       ((wire87 ? (8'ha8) : wire123) == ((8'hb3) ?
                           wire21 : wire121)) : (&(-wire25))) && ($signed(((7'h41) ?
                           wire89 : (8'hae))) ?
                       $signed((wire23 ?
                           wire123 : wire89)) : $signed($unsigned(wire22)))));
  assign wire128 = (&$signed($signed($signed($unsigned((8'ha2))))));
  assign wire129 = wire128[(5'h10):(4'hf)];
  assign wire130 = wire123;
  assign wire131 = {wire89};
  assign wire132 = $unsigned(wire129);
  assign wire133 = {$signed(wire126),
                       ($signed({$signed(wire23)}) ?
                           wire123[(3'h6):(3'h6)] : $unsigned((wire130[(1'h0):(1'h0)] ?
                               $unsigned(wire126) : $signed((8'ha2)))))};
  module134 #() modinst153 (.wire135(wire22), .wire138(wire127), .wire139(wire121), .y(wire152), .wire136(wire133), .wire137(wire126), .clk(clk));
  assign wire154 = wire90[(3'h5):(2'h3)];
  assign wire155 = ($unsigned(({((8'ha3) ? wire126 : wire131)} ?
                       wire21[(3'h6):(1'h0)] : ({(8'h9d),
                           (8'hab)} ^ wire24))) ^ (&wire125[(3'h7):(3'h6)]));
  assign wire156 = (~wire127[(4'hb):(1'h1)]);
  assign wire157 = wire90;
  assign wire158 = wire132[(2'h3):(1'h0)];
endmodule

module module134
#(parameter param151 = (-(((-((8'h9d) <<< (8'had))) ? ((+(8'hbe)) - ((8'h9d) != (8'ha3))) : {(8'ha8)}) ? ((((7'h40) ? (8'haa) : (8'hb2)) >>> (^~(8'hbd))) ? (~|((8'haf) ? (8'ha9) : (8'hb3))) : (((7'h44) ~^ (8'hb7)) ^~ (~|(8'ha6)))) : (&{((7'h40) >>> (8'hb3)), ((8'h9e) ? (8'h9e) : (8'ha7))}))))
(y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire139;
  input wire [(5'h14):(1'h0)] wire138;
  input wire signed [(3'h5):(1'h0)] wire137;
  input wire signed [(4'h8):(1'h0)] wire136;
  input wire signed [(4'hd):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire140 = $signed((8'ha8));
  assign wire141 = (|wire135[(1'h0):(1'h0)]);
  assign wire142 = $unsigned(wire136[(3'h4):(2'h2)]);
  assign wire143 = {{wire137, wire140}};
  assign wire144 = wire136[(3'h7):(3'h7)];
  assign wire145 = $unsigned(wire139);
  assign wire146 = (~&((~wire143) <<< (8'haa)));
  always
    @(posedge clk) begin
      reg147 <= $unsigned((((8'hbb) <= ((wire137 - wire136) + {wire135,
              wire138})) ?
          $unsigned(wire142[(1'h0):(1'h0)]) : $signed((wire145[(4'hb):(4'h8)] ?
              {wire146} : (wire146 ? wire146 : wire136)))));
      reg148 <= (($signed($unsigned(wire140[(3'h4):(1'h1)])) || {wire135,
          wire146}) && ($unsigned((~^$signed((8'ha8)))) ?
          reg147[(4'hb):(3'h6)] : wire146[(5'h12):(2'h3)]));
      reg149 <= (wire139 ?
          $unsigned({$signed($signed((8'hb4))),
              $signed((-wire136))}) : wire143[(2'h3):(1'h1)]);
      reg150 <= $unsigned(((+({wire140} >>> wire143)) || (((~&wire137) >= (reg149 ?
              wire146 : reg149)) ?
          wire138 : reg148[(1'h0):(1'h0)])));
    end
endmodule

module module91
#(parameter param119 = {(^(~({(8'hbf), (8'hb0)} ? (8'ha3) : (&(7'h40))))), (((^{(8'h9d), (8'ha1)}) ? (((8'hba) | (7'h43)) ? ((8'haf) >>> (7'h44)) : (8'ha8)) : (~^((8'hac) - (8'hb2)))) <<< {{((8'hab) ? (8'ha5) : (8'hae))}})}, 
parameter param120 = ({(|(7'h40)), {param119, param119}} <<< ((~|(((8'h9e) <= param119) + param119)) ? (((param119 >> param119) ~^ (param119 <<< param119)) ? param119 : param119) : {(8'haa), param119})))
(y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire95;
  input wire [(3'h6):(1'h0)] wire94;
  input wire [(5'h10):(1'h0)] wire93;
  input wire [(4'hd):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(5'h11):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
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
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 (1'h0)};
  assign wire96 = wire95[(2'h2):(1'h0)];
  assign wire97 = $signed(((&(wire93 && (wire92 ? wire93 : wire94))) ?
                      {$unsigned($signed(wire94)),
                          (~&$unsigned(wire94))} : (((|wire95) >> (wire94 ?
                              wire96 : wire93)) ?
                          $unsigned({wire92,
                              wire95}) : $signed(wire92[(3'h5):(2'h2)]))));
  assign wire98 = (~|(~^wire93));
  assign wire99 = wire92;
  assign wire100 = $unsigned((wire96 >> (wire98[(1'h0):(1'h0)] ?
                       {{wire96},
                           wire93} : ($signed(wire97) >> wire98[(4'hb):(2'h2)]))));
  assign wire101 = (~&(^{(~(+(8'ha9)))}));
  assign wire102 = ($signed($unsigned(({wire95} ?
                           (wire100 <= wire100) : $unsigned(wire93)))) ?
                       (|(wire100 ^ wire99[(1'h0):(1'h0)])) : (wire94 != ((8'hab) | (&(~^wire100)))));
  assign wire103 = wire97[(3'h5):(2'h3)];
  assign wire104 = (~(wire96[(4'h9):(2'h3)] < $unsigned((wire93 ?
                       wire94[(1'h0):(1'h0)] : {wire95}))));
  assign wire105 = ($unsigned($unsigned(wire99)) == (8'hb3));
  assign wire106 = ((((+(^~(8'ha8))) << {(wire99 ? wire92 : (8'ha7)),
                       wire97[(3'h6):(1'h0)]}) >= (8'ha7)) | ($signed(((wire102 << wire94) ?
                           (wire102 * wire100) : (wire97 <= wire104))) ?
                       $signed($signed($signed(wire93))) : ($unsigned($signed(wire97)) ?
                           wire92 : (8'hb1))));
  assign wire107 = (+wire101);
  assign wire108 = wire102;
  assign wire109 = $signed((|wire102[(3'h6):(2'h2)]));
  assign wire110 = (($unsigned((wire105 ? wire100[(3'h4):(1'h1)] : wire93)) ?
                           $unsigned(((~|wire96) == (wire93 ^~ (8'ha6)))) : (((wire105 >>> wire96) > (wire104 ?
                                   wire101 : wire109)) ?
                               ($unsigned(wire93) && {(8'hac),
                                   wire106}) : {wire102})) ?
                       $unsigned($unsigned(((~|wire92) > wire94))) : (~&$signed(({wire94} >= wire109))));
  assign wire111 = $unsigned((-((wire102[(3'h5):(3'h4)] ?
                           (+wire101) : $unsigned(wire93)) ?
                       $signed(((8'h9f) != wire92)) : $unsigned((wire109 ?
                           wire98 : wire110)))));
  assign wire112 = $signed((8'ha5));
  assign wire113 = (($unsigned((+(wire101 ? wire98 : (8'hb4)))) ?
                       wire100[(2'h3):(1'h0)] : ((wire96[(4'hd):(4'hd)] ?
                           {(8'haf)} : wire95) > $unsigned($unsigned(wire105)))) < (^~(wire99[(4'h8):(1'h1)] ?
                       wire106 : wire96[(3'h6):(1'h0)])));
  assign wire114 = wire106;
  assign wire115 = (wire95[(1'h0):(1'h0)] >>> wire105[(2'h2):(1'h1)]);
  assign wire116 = (~|$unsigned(wire98));
  assign wire117 = wire102;
  assign wire118 = wire92[(2'h2):(1'h1)];
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h2b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire32;
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire32,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg45,
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
                 (1'h0)};
  assign wire32 = (~|wire30[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg33 <= {(-({$unsigned((8'ha5))} ?
              $unsigned({wire28, wire27}) : wire29)),
          $signed((wire30[(2'h2):(1'h0)] ?
              (!(wire31 ? wire27 : wire32)) : (+$signed(wire32))))};
      if (wire27)
        begin
          reg34 <= (&{(8'h9e)});
          if (((~wire32[(3'h6):(1'h1)]) - (reg34[(1'h0):(1'h0)] >> wire29)))
            begin
              reg35 <= wire30[(2'h2):(1'h0)];
              reg36 <= {(wire32 >>> wire27),
                  (wire27 ? wire32 : $unsigned(wire32))};
              reg37 <= (|reg33);
              reg38 <= ((~&$unsigned(((reg36 & (8'hbc)) ?
                      (reg34 ? (8'hbd) : reg35) : wire27[(4'h8):(2'h3)]))) ?
                  (~&{(+wire28[(1'h0):(1'h0)])}) : $signed(($unsigned($unsigned(reg37)) ?
                      reg34[(2'h3):(2'h3)] : wire27[(1'h1):(1'h0)])));
            end
          else
            begin
              reg35 <= $unsigned((!reg34[(1'h1):(1'h0)]));
              reg36 <= wire28;
            end
        end
      else
        begin
          if ((&((8'hb2) || $unsigned((8'had)))))
            begin
              reg34 <= {wire29};
              reg35 <= $signed(reg35[(3'h6):(2'h3)]);
              reg36 <= ($signed(reg37[(4'h8):(3'h5)]) ?
                  ((reg33 <<< wire27[(2'h3):(2'h3)]) <= ((reg34[(1'h0):(1'h0)] && (|reg36)) ~^ $unsigned((^~wire32)))) : $unsigned((~reg33[(1'h0):(1'h0)])));
              reg37 <= $unsigned({{{(reg36 >>> reg38), wire29}},
                  wire31[(2'h3):(2'h3)]});
              reg38 <= $signed((+$signed($unsigned($unsigned(wire30)))));
            end
          else
            begin
              reg34 <= reg37;
              reg35 <= wire27[(1'h0):(1'h0)];
              reg36 <= {$signed(wire27),
                  $signed((((reg34 ? reg33 : reg33) ?
                          $unsigned((8'hbc)) : $signed(wire29)) ?
                      reg38[(2'h3):(1'h0)] : reg35))};
              reg37 <= (~&$signed({((^reg33) == (~reg37)), wire28}));
            end
          reg39 <= (|$unsigned(({$unsigned((8'h9c)),
                  ((7'h40) ? reg38 : wire31)} ?
              reg36 : (~$unsigned(reg35)))));
          if (($unsigned($unsigned(wire28[(2'h3):(1'h1)])) ?
              (^wire31) : (&(((wire27 ~^ wire28) - $unsigned(wire29)) ?
                  {(reg38 == (8'haa))} : $unsigned($unsigned(reg38))))))
            begin
              reg40 <= ((~|((~&reg37) ?
                  (((8'had) ? reg35 : reg36) ?
                      (wire31 ?
                          reg39 : (8'hb8)) : wire28) : (|(-reg36)))) << (~&{{wire28[(2'h3):(1'h0)],
                      $signed(wire31)}}));
              reg41 <= $unsigned(wire32);
              reg42 <= {(($signed(reg33[(3'h4):(3'h4)]) ?
                          reg38[(1'h1):(1'h0)] : (-(reg38 << reg33))) ?
                      {{reg36, (~&(8'ha5))}} : ((^~{reg37}) ?
                          reg33 : (reg38 ? {reg33} : $unsigned(wire29)))),
                  $signed($signed(((8'ha4) <<< (~^reg38))))};
              reg43 <= $unsigned(reg35[(3'h6):(1'h0)]);
            end
          else
            begin
              reg40 <= ($signed({{{(7'h41)}}, (~$unsigned(reg34))}) ?
                  {({$signed(wire30), wire31} & wire30),
                      {(|$signed(reg40))}} : $signed($unsigned((^~wire31))));
              reg41 <= $unsigned((8'hbb));
              reg42 <= (reg40[(4'hb):(4'hb)] & reg42);
              reg43 <= reg34;
            end
          reg44 <= ((reg39 ?
                  ({(~reg36)} || $unsigned($unsigned(reg37))) : (reg39 ?
                      reg33 : wire32)) ?
              reg39 : (|((7'h43) ?
                  ({reg37} ?
                      (+reg33) : $signed(reg37)) : $signed($unsigned((8'ha7))))));
          reg45 <= ($unsigned((((8'hbd) != $signed(wire30)) * $unsigned($unsigned(reg39)))) >= {(8'h9d),
              ($signed(((8'h9d) ? reg44 : reg36)) != (7'h41))});
        end
    end
  assign wire46 = $signed(($unsigned((~^(reg45 ?
                      (8'ha3) : wire28))) <= wire29[(4'h9):(2'h2)]));
  assign wire47 = ($unsigned((|{$signed((8'hb2))})) < (~^((-$unsigned(wire31)) >= (8'hab))));
  assign wire48 = reg37;
  assign wire49 = ((((wire28 ? $unsigned(wire29) : reg40) ?
                      {(-reg38)} : ($signed(reg44) ?
                          (reg44 ? reg39 : wire27) : {wire28,
                              wire46})) || $unsigned($unsigned((wire47 ?
                      (8'hbf) : reg33)))) << $signed($signed((!$unsigned(reg37)))));
  always
    @(posedge clk) begin
      if (($unsigned((&$unsigned($signed(reg39)))) ?
          (+$signed(reg41[(2'h2):(1'h0)])) : (((8'hb4) >> {{(8'ha9), reg33},
                  (wire28 << wire48)}) ?
              {$unsigned((reg38 ? reg40 : reg38))} : (reg45 ?
                  ($signed(reg39) ? (~^reg36) : reg37) : ((7'h42) ?
                      (^reg40) : (reg43 ? wire28 : reg41))))))
        begin
          if (reg41[(2'h2):(1'h0)])
            begin
              reg50 <= $signed(wire30[(2'h2):(1'h0)]);
            end
          else
            begin
              reg50 <= $signed((8'hbc));
              reg51 <= wire30[(2'h2):(1'h0)];
              reg52 <= $signed((|$unsigned($signed((~|wire49)))));
              reg53 <= wire32[(4'hd):(4'ha)];
            end
          reg54 <= (7'h44);
          reg55 <= ($unsigned((-($unsigned(wire28) * ((8'hbe) ?
                  wire28 : reg52)))) ?
              $signed($signed(($unsigned(reg40) ?
                  (-reg34) : (~&reg38)))) : reg51);
          reg56 <= ({$unsigned({$unsigned(wire49), (reg43 > reg41)}),
              reg52[(4'hd):(4'h9)]} == (8'haa));
        end
      else
        begin
          if (wire30[(1'h0):(1'h0)])
            begin
              reg50 <= $unsigned(((((reg56 ? wire30 : reg54) < wire47) ?
                      ($signed(reg53) >>> {(8'haf),
                          reg53}) : reg52[(3'h6):(3'h6)]) ?
                  $signed((^~wire30)) : (~|reg56)));
            end
          else
            begin
              reg50 <= (wire46[(1'h1):(1'h1)] ?
                  $unsigned(wire29[(4'h9):(3'h4)]) : (7'h44));
              reg51 <= $signed(({$signed({wire47}),
                  reg34[(3'h4):(1'h0)]} & ($unsigned($unsigned(reg40)) ?
                  ($signed(reg41) << $unsigned(reg50)) : ($unsigned(reg42) ?
                      $signed(reg34) : wire48[(4'he):(4'h8)]))));
              reg52 <= {reg36[(2'h3):(2'h3)],
                  (($signed(reg50) > $signed((wire48 ?
                      wire27 : (8'hb3)))) <= (({reg56} <<< $unsigned(reg40)) ?
                      ({wire48, reg33} ^~ (reg38 <<< wire29)) : ((^reg52) ?
                          (~(8'hba)) : {reg50, wire30})))};
              reg53 <= wire32[(4'ha):(4'h9)];
            end
          reg54 <= (({$signed($unsigned(wire48))} < $unsigned((~^$unsigned((8'had))))) ?
              $signed(reg34) : $signed((reg52 != reg33[(1'h0):(1'h0)])));
          reg55 <= {$unsigned($signed(reg44)),
              (reg40[(1'h1):(1'h0)] == $signed(reg35[(3'h6):(2'h3)]))};
        end
      if (reg39[(2'h2):(2'h2)])
        begin
          reg57 <= (8'hac);
          if (({$signed(wire28[(1'h1):(1'h1)]),
                  $signed(((reg33 ? reg39 : reg55) > ((7'h41) ?
                      reg52 : reg44)))} ?
              $unsigned(((~|(wire30 ~^ wire46)) ?
                  $signed((reg51 ?
                      wire27 : wire48)) : $signed((reg41 != reg36)))) : $unsigned((~^($signed(wire48) ?
                  ((8'h9e) ? (7'h40) : wire29) : (wire48 ? wire27 : reg39))))))
            begin
              reg58 <= (!reg54[(1'h0):(1'h0)]);
              reg59 <= reg34[(1'h0):(1'h0)];
              reg60 <= reg55;
            end
          else
            begin
              reg58 <= (~($signed($signed((^(8'ha0)))) <<< ({(reg36 << reg37),
                  (8'ha0)} | {reg57})));
              reg59 <= (|$signed($unsigned(wire29)));
              reg60 <= reg58[(1'h1):(1'h0)];
              reg61 <= ({wire46, $unsigned($unsigned(reg39[(1'h1):(1'h0)]))} ?
                  wire32 : reg58);
              reg62 <= (wire47[(3'h6):(3'h6)] && reg60);
            end
          reg63 <= reg44[(1'h0):(1'h0)];
          if ($unsigned(($unsigned(reg58[(3'h4):(3'h4)]) | reg62)))
            begin
              reg64 <= $unsigned({{(|(^wire29)), {(reg63 >= wire46)}}});
              reg65 <= ({(((reg38 ? wire27 : reg59) ?
                          $unsigned(wire47) : wire47[(4'h8):(1'h1)]) ?
                      $unsigned((reg35 >> reg43)) : (reg61 ?
                          $signed(reg57) : (reg56 ^~ reg59))),
                  ((!(wire47 ?
                      reg60 : reg64)) ^~ $signed(wire31[(2'h2):(1'h0)]))} + reg52[(3'h4):(1'h0)]);
              reg66 <= $signed((reg45 != {$unsigned((reg50 ? reg51 : (8'hbd))),
                  $unsigned($signed(reg51))}));
            end
          else
            begin
              reg64 <= reg57;
              reg65 <= ((~&($unsigned(reg39[(3'h4):(1'h0)]) ?
                      reg66[(3'h7):(3'h7)] : $unsigned((reg52 || (8'hb2))))) ?
                  ((reg66 >> $unsigned((wire29 ~^ (8'hac)))) ^ (~&(reg59 ?
                      $signed(reg34) : $unsigned(wire28)))) : ($unsigned($signed((~^reg66))) ~^ reg34));
            end
        end
      else
        begin
          reg57 <= $unsigned((~^reg34));
          reg58 <= $signed(($unsigned(reg38) ? wire49 : (7'h41)));
          reg59 <= $unsigned($signed((&reg65[(2'h3):(1'h0)])));
          reg60 <= $signed(wire30[(2'h2):(1'h1)]);
        end
      reg67 <= ((&(8'hac)) ?
          $unsigned(reg34[(1'h1):(1'h0)]) : (^~($signed($unsigned(wire32)) >>> $signed($unsigned(reg55)))));
      reg68 <= ($unsigned(($signed((wire31 ? reg51 : reg41)) ?
              $signed(reg50) : reg45)) ?
          ({$signed({(8'ha2)}),
              ($unsigned(reg41) ?
                  (wire47 <<< reg52) : wire29[(4'h9):(3'h5)])} ^~ $unsigned(((wire28 == (8'hb6)) ?
              ((7'h41) ? reg66 : wire49) : reg34))) : (~$unsigned(((wire46 ?
                  reg39 : reg43) ?
              (reg54 ? reg54 : reg57) : ((8'hb8) != wire46)))));
    end
  always
    @(posedge clk) begin
      if (((reg51[(3'h7):(3'h6)] ?
          (+(wire48 ?
              reg61 : reg64)) : reg63[(5'h12):(3'h4)]) | (((|(reg45 || reg44)) * reg33[(1'h1):(1'h1)]) || ((reg60[(4'hf):(4'hb)] > reg67[(3'h4):(3'h4)]) ?
          $signed($signed(reg59)) : (8'hba)))))
        begin
          reg69 <= (8'had);
          if ($signed((~^{{(&reg59), (8'hb7)},
              (wire49[(4'he):(1'h0)] == (7'h40))})))
            begin
              reg70 <= $unsigned($unsigned((reg54 ?
                  reg55 : ($unsigned(wire46) ?
                      (reg43 ? reg34 : (7'h44)) : (reg45 ? reg35 : reg43)))));
              reg71 <= ($unsigned($unsigned((8'hbb))) || $unsigned($signed(($unsigned(reg39) <= (reg55 ?
                  reg63 : reg59)))));
              reg72 <= (8'hab);
              reg73 <= (reg50 ^~ (((8'ha5) || ((~|reg69) ?
                  (reg53 ?
                      wire47 : reg51) : reg68[(4'h9):(3'h6)])) == reg50[(4'ha):(3'h4)]));
            end
          else
            begin
              reg70 <= ($unsigned(reg34[(3'h4):(3'h4)]) ?
                  $unsigned(reg43[(4'hb):(4'h8)]) : (8'hac));
              reg71 <= reg38;
              reg72 <= $signed((({$signed((8'hb6))} <= $signed((reg71 ?
                      reg73 : (8'hba)))) ?
                  reg40 : (reg72[(2'h2):(1'h1)] >>> (((8'hb2) ?
                          wire30 : reg44) ?
                      {reg52} : (reg40 ? reg54 : reg40)))));
            end
          reg74 <= $signed($unsigned(((+(reg73 ? reg55 : reg66)) ^~ reg61)));
          reg75 <= {$unsigned((&wire47))};
        end
      else
        begin
          if ($unsigned(wire31[(2'h2):(1'h0)]))
            begin
              reg69 <= ({reg40} ?
                  (reg36 && ($unsigned((~^reg52)) != $unsigned((reg66 ?
                      reg55 : reg42)))) : reg69);
              reg70 <= (reg71[(1'h1):(1'h0)] + {($unsigned($unsigned(reg39)) ?
                      (^(reg44 - reg43)) : ((reg62 ? reg39 : (8'ha8)) ?
                          reg61[(1'h1):(1'h1)] : (reg35 || reg60)))});
              reg71 <= $unsigned(reg50[(4'hf):(4'ha)]);
              reg72 <= reg45[(4'h9):(3'h4)];
              reg73 <= ($unsigned(($unsigned({reg42}) >> {reg42})) >> wire48[(4'he):(3'h5)]);
            end
          else
            begin
              reg69 <= (((+reg71) ?
                      wire28 : (((-reg65) >> reg59) ^ ((reg37 ?
                          reg68 : reg75) == {reg42}))) ?
                  (($unsigned(reg39[(3'h4):(1'h1)]) + {reg68}) ?
                      {(reg56 >> wire31[(1'h1):(1'h1)]),
                          ($signed(reg34) ?
                              (reg54 ?
                                  reg54 : wire30) : reg61[(1'h0):(1'h0)])} : reg68) : $signed(reg70));
              reg70 <= ($signed((reg36 >>> reg62)) <<< reg51[(4'ha):(4'h9)]);
            end
        end
      reg76 <= {(8'hb8)};
      reg77 <= wire49[(4'h9):(3'h7)];
      reg78 <= $signed($unsigned({$signed(((8'hbc) ? reg43 : (7'h42)))}));
      reg79 <= reg59;
    end
  assign wire80 = ($unsigned(reg62) ?
                      ({$unsigned((|reg71))} ~^ ($signed((reg77 != (8'hb6))) ?
                          reg45 : (wire28 != $unsigned((8'hbb))))) : $signed((reg40 - {reg33[(2'h2):(1'h1)]})));
  assign wire81 = reg61[(3'h6):(3'h5)];
  assign wire82 = (-reg42[(4'h9):(2'h3)]);
  assign wire83 = ({(8'ha8), wire30} ?
                      (wire32[(4'ha):(2'h2)] ?
                          $signed({(reg45 ?
                                  wire29 : wire48)}) : wire49) : $unsigned($unsigned(($signed(reg78) ?
                          {reg63, reg79} : $unsigned(wire80)))));
  assign wire84 = (-{$signed(reg50)});
  assign wire85 = ($signed(reg39) ?
                      $signed($signed(($unsigned(reg75) ?
                          (reg52 ?
                              wire81 : reg39) : {reg44}))) : ({(&(&wire81)),
                              (&(reg58 >= (8'h9e)))} ?
                          ($signed((^~reg74)) + $signed((!wire28))) : (reg69 <<< reg79)));
  assign wire86 = (reg65 <<< (^~$signed(((reg42 ?
                      reg39 : wire30) < (reg61 < (8'ha7))))));
endmodule

module module192  (y, clk, wire196, wire195, wire194, wire193);
  output wire [(32'h25a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire196;
  input wire signed [(4'ha):(1'h0)] wire195;
  input wire [(4'hd):(1'h0)] wire194;
  input wire signed [(5'h11):(1'h0)] wire193;
  wire [(4'h9):(1'h0)] wire243;
  wire [(4'hc):(1'h0)] wire240;
  wire [(4'hf):(1'h0)] wire239;
  wire [(5'h12):(1'h0)] wire238;
  wire [(2'h3):(1'h0)] wire237;
  wire [(4'hf):(1'h0)] wire218;
  wire [(4'ha):(1'h0)] wire198;
  wire signed [(3'h4):(1'h0)] wire197;
  reg [(4'hd):(1'h0)] reg242 = (1'h0);
  reg [(3'h4):(1'h0)] reg241 = (1'h0);
  reg [(5'h13):(1'h0)] reg236 = (1'h0);
  reg [(4'he):(1'h0)] reg235 = (1'h0);
  reg [(3'h7):(1'h0)] reg234 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg232 = (1'h0);
  reg [(4'hd):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg230 = (1'h0);
  reg [(5'h14):(1'h0)] reg229 = (1'h0);
  reg [(4'hf):(1'h0)] reg228 = (1'h0);
  reg [(5'h11):(1'h0)] reg227 = (1'h0);
  reg [(3'h7):(1'h0)] reg226 = (1'h0);
  reg [(5'h12):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg224 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg223 = (1'h0);
  reg [(4'hd):(1'h0)] reg222 = (1'h0);
  reg [(2'h2):(1'h0)] reg221 = (1'h0);
  reg [(5'h10):(1'h0)] reg220 = (1'h0);
  reg signed [(4'he):(1'h0)] reg219 = (1'h0);
  reg [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg214 = (1'h0);
  reg [(4'hd):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg212 = (1'h0);
  reg [(5'h11):(1'h0)] reg211 = (1'h0);
  reg [(5'h12):(1'h0)] reg210 = (1'h0);
  reg [(5'h15):(1'h0)] reg209 = (1'h0);
  reg [(2'h3):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(5'h11):(1'h0)] reg206 = (1'h0);
  reg [(4'he):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg204 = (1'h0);
  reg [(5'h10):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  assign y = {wire243,
                 wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire218,
                 wire198,
                 wire197,
                 reg242,
                 reg241,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
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
                 reg217,
                 reg216,
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
                 reg201,
                 reg200,
                 reg199,
                 (1'h0)};
  assign wire197 = wire195[(4'ha):(3'h5)];
  assign wire198 = ($unsigned(wire197[(1'h1):(1'h0)]) || $signed($signed((-((8'ha7) ?
                       wire193 : wire197)))));
  always
    @(posedge clk) begin
      if (wire193)
        begin
          reg199 <= (wire194 >= {wire193[(4'h8):(3'h5)],
              $unsigned($unsigned($unsigned(wire197)))});
        end
      else
        begin
          reg199 <= wire195;
          if (reg199)
            begin
              reg200 <= $signed(wire196[(1'h0):(1'h0)]);
              reg201 <= reg199[(4'ha):(3'h7)];
              reg202 <= $unsigned((~^(($signed(wire197) ?
                  (wire195 ? wire194 : wire197) : wire196) | (8'hac))));
            end
          else
            begin
              reg200 <= $signed($signed(((!reg199[(2'h2):(1'h1)]) ?
                  wire193[(5'h10):(1'h0)] : ($unsigned(wire197) >>> reg199[(4'hb):(3'h6)]))));
              reg201 <= (-({(~$unsigned(wire193))} ?
                  reg201 : {{(wire198 ? (8'had) : reg201)}}));
              reg202 <= wire193[(3'h7):(1'h0)];
              reg203 <= $signed($signed((8'ha2)));
            end
          reg204 <= $signed((8'hbf));
        end
    end
  always
    @(posedge clk) begin
      if (wire196)
        begin
          reg205 <= $unsigned(($signed($signed(reg202)) ?
              $signed(wire197[(2'h3):(1'h1)]) : ((^(wire195 > (8'hac))) ?
                  ((~^(8'hb3)) ?
                      (reg202 ?
                          reg200 : (8'haf)) : reg204[(2'h3):(1'h0)]) : $unsigned($unsigned(wire197)))));
          reg206 <= $signed((~|$unsigned((~&(reg200 ^ reg204)))));
          reg207 <= $signed(reg199[(4'hc):(4'h9)]);
        end
      else
        begin
          reg205 <= (~^(^$unsigned({(wire195 ? reg205 : wire196),
              (reg200 > wire198)})));
        end
      if ((&(reg201[(5'h14):(4'h8)] ?
          (8'ha2) : (reg206[(3'h6):(2'h2)] ^ (reg202[(2'h2):(1'h1)] ?
              $unsigned(reg206) : $unsigned(reg204))))))
        begin
          reg208 <= (|wire198);
          reg209 <= (-{$signed($unsigned((reg208 >= reg205))), reg201});
        end
      else
        begin
          reg208 <= $signed($signed(reg204[(3'h5):(3'h5)]));
          if ($signed(((~&($unsigned(wire194) ?
                  (reg204 ? wire194 : wire196) : wire195)) ?
              reg206 : $signed($unsigned(reg203)))))
            begin
              reg209 <= $unsigned($unsigned((&(^~wire194[(3'h5):(2'h3)]))));
              reg210 <= wire196;
              reg211 <= reg204;
              reg212 <= reg209[(4'h9):(2'h3)];
              reg213 <= wire193[(3'h5):(3'h4)];
            end
          else
            begin
              reg209 <= ($signed($unsigned($signed(((7'h42) & (8'hb8))))) ?
                  (-wire196) : $signed((reg206 ?
                      $unsigned($signed(reg199)) : ((&reg201) ?
                          reg208[(1'h1):(1'h1)] : {(8'h9f), reg208}))));
            end
          reg214 <= {reg202[(2'h3):(2'h2)]};
        end
      reg215 <= ((wire194 >>> $signed((~^{wire197, wire197}))) ?
          ((+reg203[(4'hc):(4'ha)]) + (((8'ha1) + $unsigned(reg210)) ?
              (~((8'hb3) ~^ (8'ha3))) : ((^wire195) >> wire197[(1'h1):(1'h0)]))) : (8'haf));
      reg216 <= $signed(reg213);
      reg217 <= {(((+{reg204, reg214}) ?
                  $signed(wire198[(2'h2):(2'h2)]) : $unsigned(reg202)) ?
              reg211 : $signed($signed((-reg211)))),
          reg206};
    end
  assign wire218 = $signed($unsigned((|($unsigned(reg206) ?
                       (8'had) : (reg201 ? reg206 : (8'h9f))))));
  always
    @(posedge clk) begin
      if (reg215)
        begin
          if ((reg210 + (^reg202)))
            begin
              reg219 <= (-reg204);
              reg220 <= ($signed($signed(reg201)) - reg217);
              reg221 <= (8'ha8);
            end
          else
            begin
              reg219 <= $unsigned(($unsigned((8'hb0)) ?
                  (^~$signed((~|reg216))) : reg204));
              reg220 <= reg211[(5'h10):(3'h4)];
              reg221 <= (-(reg210 >>> $signed((!(reg207 + reg219)))));
              reg222 <= reg205;
            end
          reg223 <= (-(|($unsigned((!reg203)) >= {wire218, reg203})));
        end
      else
        begin
          reg219 <= (reg208[(2'h3):(2'h3)] ? wire193[(3'h5):(2'h3)] : reg200);
          reg220 <= (^~($signed(((|reg211) || (reg203 ? wire195 : reg214))) ?
              $signed(wire197) : reg203));
          if ((!$unsigned(((+$signed(reg206)) - reg203))))
            begin
              reg221 <= ($unsigned((~&$unsigned(reg221[(1'h0):(1'h0)]))) * reg205[(4'he):(2'h3)]);
            end
          else
            begin
              reg221 <= wire197;
              reg222 <= $unsigned({{$unsigned($unsigned(reg223))}});
              reg223 <= (^$signed({reg204[(3'h5):(1'h1)]}));
              reg224 <= wire196[(3'h4):(1'h1)];
            end
          if (((~&($unsigned((!reg215)) != ({(8'hb1), reg209} ?
              (reg203 ? (8'ha0) : reg211) : (8'ha0)))) != (reg207 ?
              {(8'haf), wire197} : (~|$unsigned({reg207, reg220})))))
            begin
              reg225 <= $signed(($unsigned(reg208) ?
                  ((reg219[(4'he):(3'h6)] ?
                      {wire195} : ((8'hbe) ?
                          wire193 : wire218)) * (reg216[(4'h8):(3'h6)] ?
                      (reg221 | reg221) : (wire196 ?
                          (8'hb9) : (8'haf)))) : reg203));
              reg226 <= reg225;
              reg227 <= $signed({{$unsigned($unsigned(reg217)),
                      $signed(wire197)},
                  (~|({(8'hb0)} | (reg200 ^~ reg206)))});
            end
          else
            begin
              reg225 <= reg215;
              reg226 <= $signed($signed({(~|{reg206}), reg208[(1'h1):(1'h0)]}));
              reg227 <= {reg209[(5'h10):(3'h4)]};
            end
        end
      reg228 <= (&reg226);
      if ((~|(^~($unsigned((wire194 ^~ (8'hae))) ?
          reg219[(4'h9):(3'h7)] : reg219))))
        begin
          reg229 <= reg208[(1'h1):(1'h0)];
        end
      else
        begin
          reg229 <= {reg208[(1'h0):(1'h0)],
              (~&((~|reg210[(2'h2):(1'h0)]) + (+(wire218 ^~ reg214))))};
          reg230 <= $unsigned($unsigned({reg216[(4'h9):(2'h3)],
              reg227[(4'hb):(4'h8)]}));
          reg231 <= $unsigned((!$signed((reg208[(2'h3):(2'h3)] ^ (-(8'hbe))))));
          reg232 <= reg231[(4'h8):(3'h4)];
          if ({$signed(reg207), $unsigned((~^reg229))})
            begin
              reg233 <= (^$signed((reg231[(1'h1):(1'h1)] << ($unsigned(reg232) ?
                  (reg212 == reg204) : reg228))));
              reg234 <= ((8'h9f) ?
                  $unsigned($unsigned(reg232)) : reg206[(4'hf):(4'hf)]);
              reg235 <= ({(reg215 < wire198[(4'h8):(3'h5)]),
                  $signed(reg199)} >>> {(reg227 ?
                      (!reg215) : reg217[(4'h8):(1'h1)])});
              reg236 <= $signed(reg220);
            end
          else
            begin
              reg233 <= wire218[(4'hc):(3'h5)];
            end
        end
    end
  assign wire237 = (8'h9c);
  assign wire238 = wire197[(3'h4):(3'h4)];
  assign wire239 = reg209[(3'h4):(1'h1)];
  assign wire240 = (~&$unsigned($signed({reg216})));
  always
    @(posedge clk) begin
      reg241 <= (($signed(reg225) + (($unsigned(reg224) ?
              (&reg202) : (-reg215)) == reg235)) ?
          $signed((|$signed($signed((7'h42))))) : {reg199});
      reg242 <= (wire240[(3'h5):(1'h1)] ?
          (reg241 ?
              $signed(reg241[(2'h3):(2'h2)]) : $unsigned($signed(((7'h42) >= reg204)))) : reg225[(4'he):(2'h2)]);
    end
  assign wire243 = (~^($unsigned((^~reg217[(4'hb):(4'h9)])) ?
                       (($signed(reg233) ?
                               $signed(reg236) : (reg231 ~^ reg205)) ?
                           $unsigned(wire194) : reg208) : ({(!reg230),
                               (~&reg242)} ?
                           wire193[(4'he):(1'h0)] : {(reg202 ?
                                   reg224 : wire218),
                               ((8'hbe) < reg236)})));
endmodule

module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire176;
  wire signed [(5'h12):(1'h0)] wire174;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire179;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire181;
  reg signed [(5'h12):(1'h0)] reg194 = (1'h0);
  reg [(4'h8):(1'h0)] reg193 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(5'h13):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg187 = (1'h0);
  reg [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(2'h3):(1'h0)] reg185 = (1'h0);
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  assign y = {wire183,
                 wire177,
                 wire176,
                 wire174,
                 wire5,
                 wire179,
                 wire180,
                 wire181,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire5 = ((wire0 ?
                         ({$signed((8'hab))} == wire2[(1'h0):(1'h0)]) : wire4[(1'h1):(1'h1)]) ?
                     (+($signed(wire0[(1'h0):(1'h0)]) ?
                         wire3 : (~wire3[(4'hd):(4'ha)]))) : $unsigned({$signed({wire1,
                             wire4}),
                         ((wire1 ~^ wire0) ?
                             (wire2 ? wire2 : wire0) : (8'ha3))}));
  module6 #() modinst175 (wire174, clk, wire1, wire5, wire0, wire3);
  assign wire176 = $unsigned((((wire174[(5'h12):(3'h6)] ~^ (wire3 ?
                               wire3 : wire2)) ?
                           wire0[(2'h3):(1'h1)] : ((8'h9d) ?
                               wire1[(4'ha):(3'h7)] : {wire174, wire174})) ?
                       (8'hac) : ($unsigned({wire2}) ?
                           wire2[(3'h4):(2'h2)] : wire4[(4'hb):(4'h8)])));
  module148 #() modinst178 (.clk(clk), .wire151(wire174), .y(wire177), .wire153(wire0), .wire149(wire176), .wire152(wire5), .wire150(wire1));
  assign wire179 = $unsigned($unsigned((wire0 * (~(wire4 <= wire177)))));
  assign wire180 = wire5[(5'h15):(4'h9)];
  module12 #() modinst182 (.wire14(wire180), .clk(clk), .wire16(wire1), .wire13(wire177), .y(wire181), .wire17(wire179), .wire15(wire2));
  assign wire183 = wire4;
  always
    @(posedge clk) begin
      reg184 <= ($signed(($signed(wire180) ?
              {wire183[(3'h6):(3'h4)]} : $unsigned((wire179 != wire176)))) ?
          $signed($signed(wire4[(3'h4):(1'h1)])) : wire174);
      reg185 <= wire177[(1'h0):(1'h0)];
      reg186 <= $signed(({(8'haf)} ?
          {((wire4 * (8'h9d)) > $signed(wire0)),
              wire3} : (($unsigned(wire4) >> wire180) ?
              wire179[(3'h7):(2'h2)] : (~^(~^reg185)))));
      if ((~wire174[(1'h1):(1'h1)]))
        begin
          reg187 <= (~^(8'hb4));
          reg188 <= ((8'ha9) >= (wire176 - ({$unsigned(wire0),
              wire0[(2'h2):(1'h0)]} & $unsigned(wire0[(4'hd):(4'hc)]))));
          reg189 <= (8'ha4);
          reg190 <= wire0;
        end
      else
        begin
          reg187 <= $unsigned((~((!(reg189 ? wire2 : (8'hba))) ?
              ((reg189 >= wire179) <<< $unsigned(wire174)) : $signed($unsigned(wire0)))));
          reg188 <= (wire181 ?
              $unsigned((~|(wire174 || (~^wire183)))) : (wire177[(3'h5):(1'h0)] ?
                  ($unsigned($unsigned(wire3)) ?
                      $signed(wire176[(3'h4):(2'h2)]) : (~(wire0 ?
                          (8'hb3) : wire0))) : ((reg185[(2'h2):(2'h2)] < (reg185 ?
                          (8'ha9) : reg189)) ?
                      (wire183 ?
                          (reg187 + (8'haf)) : $signed(wire174)) : $signed(wire0[(4'hb):(2'h2)]))));
          reg189 <= wire3;
          if ($unsigned((((~^(reg190 ? (8'ha3) : reg189)) <<< ((wire1 ?
                  wire5 : wire5) ?
              $signed(reg188) : (+(8'ha5)))) ~^ {reg185[(1'h0):(1'h0)],
              (-(reg185 >>> wire174))})))
            begin
              reg190 <= ({(8'ha4),
                      ($signed($signed(reg189)) ?
                          wire180 : wire183[(3'h7):(3'h4)])} ?
                  ((wire5[(4'hd):(4'hb)] ?
                          $signed($signed(reg189)) : reg189[(4'hb):(4'ha)]) ?
                      $unsigned((wire2 ?
                          $signed((8'h9c)) : (8'hbe))) : {$signed($unsigned((7'h40))),
                          reg186}) : $unsigned({$unsigned((wire176 < reg185)),
                      wire4[(3'h6):(1'h1)]}));
              reg191 <= (reg184[(4'hc):(4'hb)] >>> reg190);
              reg192 <= (|(&(8'hbb)));
              reg193 <= wire176;
              reg194 <= reg187[(3'h5):(1'h0)];
            end
          else
            begin
              reg190 <= $unsigned(reg191[(5'h12):(3'h4)]);
              reg191 <= (&(reg188 && reg192[(1'h0):(1'h0)]));
              reg192 <= $signed(($signed(($signed(wire183) ?
                      $unsigned(reg184) : {wire177})) ?
                  ($unsigned((8'hb3)) - $unsigned(reg192[(1'h1):(1'h1)])) : ($signed(reg190[(3'h7):(2'h3)]) >> ($unsigned((8'ha9)) ^ (+wire0)))));
              reg193 <= ((reg187[(4'hc):(2'h2)] ?
                      ($signed((8'hb9)) ?
                          (8'ha7) : $signed((reg192 ?
                              wire4 : reg189))) : (wire2 >>> wire183)) ?
                  ($unsigned(reg185[(1'h1):(1'h1)]) == (!$signed((wire181 ~^ (8'hbe))))) : reg192[(1'h0):(1'h0)]);
            end
        end
    end
endmodule

module module6
#(parameter param173 = (((-{((8'hb8) ? (8'h9f) : (8'haa))}) && {(-(^(7'h41)))}) - ({{((8'hb0) | (8'h9c))}, (~|((8'haa) ? (8'hb9) : (7'h42)))} ? ((((8'hbd) == (8'hbb)) | (-(8'ha5))) > (~|((8'hb8) << (8'hb3)))) : {{(~^(8'hb1)), (&(8'ha6))}})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h293):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(5'h14):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire146;
  wire [(4'hc):(1'h0)] wire145;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire141;
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire160,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire72,
                 wire42,
                 wire91,
                 wire141,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg11,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed((($unsigned(wire7[(2'h3):(2'h2)]) ?
          $unsigned($signed(wire9)) : (~|$signed(wire10))) == (~^{(wire8 <<< wire9),
          $signed(wire7)})));
    end
  module12 #() modinst43 (wire42, clk, wire9, wire7, wire8, reg11, wire10);
  module44 #() modinst73 (wire72, clk, wire8, wire42, reg11, wire9);
  always
    @(posedge clk) begin
      reg74 <= $unsigned(wire7);
      reg75 <= (|$unsigned($unsigned($unsigned((wire7 ? wire8 : (8'hb0))))));
      reg76 <= wire10[(3'h5):(2'h2)];
      reg77 <= (8'hb8);
      reg78 <= ((~&wire7[(1'h0):(1'h0)]) ?
          wire10 : $unsigned(wire7[(3'h4):(3'h4)]));
    end
  module79 #() modinst92 (.wire83(reg75), .y(wire91), .wire82(wire7), .wire80(wire9), .wire81(reg77), .clk(clk));
  always
    @(posedge clk) begin
      if ($signed(reg78))
        begin
          reg93 <= {$signed($unsigned((|(~^wire10))))};
          reg94 <= wire9;
          reg95 <= wire91;
          reg96 <= ((|{wire9}) ?
              ($signed(($unsigned(wire8) ?
                  (8'haa) : $unsigned(wire9))) >>> $unsigned($signed($unsigned(reg75)))) : ({((reg75 ?
                              reg11 : wire72) ?
                          reg95 : wire91[(2'h3):(2'h2)])} ?
                  $signed(reg76[(3'h4):(1'h1)]) : wire7));
        end
      else
        begin
          if (($unsigned($signed((reg75 ?
                  (reg95 ? wire8 : reg77) : {(8'hb6), wire42}))) ?
              (&({wire72[(4'hb):(2'h3)]} | ((wire8 ^ reg95) <= $unsigned(reg95)))) : (reg96[(3'h7):(2'h2)] ?
                  (reg93[(3'h7):(1'h1)] ?
                      reg95[(4'hb):(1'h1)] : ((!reg75) > (reg11 << (8'hac)))) : $signed($signed((reg74 < wire8))))))
            begin
              reg93 <= reg76;
              reg94 <= (^~($unsigned({reg76, wire42[(4'he):(3'h7)]}) + wire91));
              reg95 <= $signed(((~^(&(~^reg96))) & reg77));
            end
          else
            begin
              reg93 <= ($unsigned((8'ha0)) ?
                  reg93[(4'h8):(4'h8)] : ((~&$unsigned(wire9)) ?
                      ($unsigned(wire8[(4'ha):(3'h6)]) >>> wire10[(3'h5):(1'h0)]) : {(+$signed(wire8))}));
              reg94 <= $unsigned($unsigned((~&$signed($unsigned(wire10)))));
              reg95 <= wire10[(4'h9):(2'h2)];
              reg96 <= (~&{reg74[(3'h6):(1'h1)]});
              reg97 <= (!reg11[(3'h5):(2'h3)]);
            end
          if ({wire9})
            begin
              reg98 <= reg78[(4'hd):(4'h9)];
              reg99 <= wire7[(2'h3):(2'h2)];
            end
          else
            begin
              reg98 <= (reg99 ? wire9 : wire9[(3'h4):(2'h3)]);
              reg99 <= (wire42 > reg77);
              reg100 <= reg76;
              reg101 <= (~&($signed(wire10) * $signed((wire42[(5'h13):(5'h11)] ?
                  {wire91} : (^(8'ha1))))));
            end
        end
      if (reg78[(1'h0):(1'h0)])
        begin
          reg102 <= wire7;
          reg103 <= reg97[(4'hb):(2'h3)];
          reg104 <= reg101;
        end
      else
        begin
          reg102 <= (&((~^((~reg103) ? (!wire9) : $unsigned(reg104))) ?
              (((~|wire91) ? (reg95 ? reg75 : reg94) : $signed((8'h9e))) ?
                  wire7 : wire91) : ($signed($signed((8'hbe))) ?
                  wire42 : $signed(((8'hba) && wire7)))));
          reg103 <= ((!($signed(reg103[(2'h3):(1'h1)]) ?
                  $signed({reg94}) : ($unsigned(wire10) ^ (wire10 == reg94)))) ?
              reg93[(3'h6):(3'h4)] : ((8'hbd) == $unsigned(reg93[(3'h6):(2'h3)])));
          reg104 <= reg102;
          if (((8'ha9) ?
              $unsigned(($unsigned({wire42, reg103}) ?
                  reg98 : $signed((wire10 ~^ (8'h9e))))) : $unsigned((~^reg78))))
            begin
              reg105 <= reg94[(3'h7):(3'h4)];
              reg106 <= ((reg97[(3'h4):(1'h1)] ?
                  (~&((!reg76) ~^ reg104[(3'h7):(3'h5)])) : (reg95[(5'h10):(4'h8)] ?
                      ($signed(reg105) ?
                          reg104 : $signed(reg95)) : $unsigned((wire42 ?
                          reg96 : reg104)))) ^~ $unsigned({$unsigned((reg99 & wire72))}));
              reg107 <= ({($signed(reg11) ?
                          reg96[(3'h6):(1'h0)] : (+(wire10 ^~ reg75))),
                      $unsigned((~reg105[(2'h3):(2'h3)]))} ?
                  reg100 : reg94[(3'h7):(3'h5)]);
              reg108 <= (-((|reg98[(3'h7):(3'h4)]) < reg76));
              reg109 <= ((reg100 ~^ $signed(reg100[(4'hc):(3'h6)])) || $unsigned($unsigned(({wire91} | $signed(reg77)))));
            end
          else
            begin
              reg105 <= $unsigned((|reg99[(1'h1):(1'h0)]));
              reg106 <= $signed((~&reg98));
              reg107 <= (8'h9c);
              reg108 <= (wire72[(3'h5):(1'h0)] ?
                  ($unsigned((reg108[(3'h4):(1'h0)] || (8'hab))) ?
                      wire9[(4'h8):(3'h7)] : (({reg95} ~^ {reg101,
                          reg106}) < $unsigned($signed(reg99)))) : {(reg74[(2'h2):(1'h0)] ?
                          (-$signed(reg75)) : (~|reg76[(2'h2):(2'h2)])),
                      reg93});
              reg109 <= {((reg94[(1'h0):(1'h0)] ?
                      {(wire91 ? reg94 : reg74),
                          reg96} : wire8) ^ ($unsigned(((8'hb1) + reg99)) ?
                      reg76 : $signed((reg11 ? reg96 : wire42)))),
                  $unsigned($signed(reg93[(5'h12):(5'h12)]))};
            end
        end
      if ((reg106[(1'h1):(1'h1)] ?
          reg103[(3'h4):(2'h3)] : wire10[(4'ha):(2'h3)]))
        begin
          reg110 <= {$signed($signed(((reg99 == (7'h44)) ^~ $signed(wire91)))),
              (~^$unsigned(($signed(wire8) ?
                  (reg95 || reg75) : $unsigned(reg76))))};
          reg111 <= ($unsigned(((~reg74[(5'h13):(2'h2)]) ^ {(wire10 ^~ reg100),
                  $unsigned(reg101)})) ?
              $unsigned((~$unsigned({wire91, reg107}))) : (8'hae));
        end
      else
        begin
          reg110 <= $unsigned($signed({reg96}));
          reg111 <= wire91;
        end
    end
  module112 #() modinst142 (.y(wire141), .wire113(reg93), .wire115(wire72), .wire116(reg100), .wire117(reg98), .clk(clk), .wire114(reg74));
  assign wire143 = $signed({(|$unsigned((&wire72)))});
  assign wire144 = $signed($signed(($unsigned((~|reg97)) ?
                       (8'hb6) : ($unsigned(reg106) ?
                           (reg100 * reg101) : (!reg77)))));
  assign wire145 = ((^~(!{{reg107},
                       (wire143 ? reg111 : wire7)})) || $signed((+{(8'hb8),
                       (reg96 ? reg111 : (8'hac))})));
  assign wire146 = wire10;
  assign wire147 = reg102;
  module148 #() modinst161 (wire160, clk, wire9, reg99, wire144, reg75, reg105);
  assign wire162 = (reg95[(4'h8):(3'h4)] ?
                       ((((7'h42) ?
                               (&reg102) : $signed(reg105)) << {(~^wire144),
                               wire42}) ?
                           (!wire7[(1'h0):(1'h0)]) : {$unsigned({wire9,
                                   (8'hb8)}),
                               ($unsigned(reg104) ?
                                   reg106[(1'h0):(1'h0)] : (wire91 * reg102))}) : $signed(wire147[(5'h10):(4'ha)]));
  assign wire163 = (!wire7);
  assign wire164 = $signed($unsigned($signed(wire9)));
  assign wire165 = $unsigned(($signed((-wire42[(1'h1):(1'h1)])) ?
                       reg100[(5'h10):(2'h3)] : reg100));
  module44 #() modinst167 (.wire48(wire10), .wire45(wire145), .clk(clk), .y(wire166), .wire46(reg74), .wire47(reg76));
  always
    @(posedge clk) begin
      reg168 <= wire165;
      if (($unsigned((^~{wire164})) ?
          (~&(~&(~^reg75[(1'h1):(1'h0)]))) : (wire10 ?
              (wire91 < $signed(reg168)) : $unsigned($unsigned(reg107)))))
        begin
          reg169 <= (7'h40);
        end
      else
        begin
          reg169 <= $signed(((wire143[(3'h4):(1'h1)] ?
              reg110 : ($signed(reg108) ?
                  (reg99 ?
                      wire8 : reg109) : reg96[(3'h6):(2'h2)])) << (((~^(8'haa)) << (^reg93)) >>> wire145[(4'hb):(1'h0)])));
          reg170 <= (^~reg94[(3'h4):(2'h3)]);
          reg171 <= {{((-(wire166 ?
                      reg104 : reg75)) <<< ({(8'h9d)} <<< reg76))},
              ({reg95, $signed($unsigned(reg109))} ?
                  (^$signed({reg105, wire162})) : wire162)};
          reg172 <= wire166[(3'h4):(1'h1)];
        end
    end
endmodule

module module148  (y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire153;
  input wire signed [(3'h6):(1'h0)] wire152;
  input wire [(3'h7):(1'h0)] wire151;
  input wire signed [(4'hd):(1'h0)] wire150;
  input wire [(5'h15):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire signed [(4'h9):(1'h0)] wire154;
  assign y = {wire159, wire158, wire157, wire156, wire155, wire154, (1'h0)};
  assign wire154 = {((8'hb9) ?
                           ($signed(wire150[(3'h4):(1'h1)]) ^ (|$unsigned(wire152))) : (((^~wire152) != wire149) ?
                               ((wire152 ?
                                   wire153 : wire149) || wire153) : wire150[(3'h7):(3'h5)]))};
  assign wire155 = wire152;
  assign wire156 = $signed($unsigned((~wire154[(4'h8):(3'h4)])));
  assign wire157 = (^(^{{$signed((8'hb4)), ((7'h44) ? (8'hb4) : wire156)},
                       ($unsigned(wire152) ?
                           wire154[(3'h5):(2'h3)] : $signed(wire153))}));
  assign wire158 = ((~^$unsigned($unsigned($unsigned(wire154)))) | $unsigned((8'hb7)));
  assign wire159 = wire149[(4'hb):(4'hb)];
endmodule

module module112
#(parameter param140 = ((~|(8'hb5)) ? {((&(+(8'h9e))) >= {((8'hbf) && (8'hb9))})} : (7'h42)))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire117;
  input wire [(4'h8):(1'h0)] wire116;
  input wire signed [(4'ha):(1'h0)] wire115;
  input wire signed [(4'hf):(1'h0)] wire114;
  input wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire120,
                 wire119,
                 wire118,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire118 = wire117[(1'h1):(1'h0)];
  assign wire119 = $signed($unsigned((wire113[(3'h7):(3'h4)] ?
                       (~|wire114) : $signed((wire118 ? (8'hbd) : wire116)))));
  assign wire120 = $unsigned($signed($signed((((8'hab) < (7'h42)) >> $unsigned(wire119)))));
  always
    @(posedge clk) begin
      reg121 <= (wire116 & wire119[(2'h3):(2'h2)]);
      reg122 <= ((8'ha4) | wire119[(2'h2):(1'h0)]);
      reg123 <= wire119[(1'h1):(1'h1)];
    end
  assign wire124 = $signed((-(wire116[(3'h4):(1'h0)] ~^ {(~(8'hbf))})));
  assign wire125 = {reg121, wire124[(3'h4):(1'h0)]};
  assign wire126 = wire114[(1'h1):(1'h1)];
  assign wire127 = wire114[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (($signed(({$signed(reg123), (wire125 + wire117)} ?
          reg122[(2'h3):(2'h2)] : wire118[(1'h0):(1'h0)])) > $signed((~|(reg121 ~^ {wire113,
          wire117})))))
        begin
          if ($unsigned($unsigned(reg123[(4'ha):(2'h3)])))
            begin
              reg128 <= (-(8'hae));
              reg129 <= $signed((wire113 ?
                  (!wire117[(1'h0):(1'h0)]) : wire113[(3'h4):(2'h3)]));
              reg130 <= $unsigned(wire124);
              reg131 <= wire126;
              reg132 <= (((~^wire114) & $signed($signed(reg128[(1'h1):(1'h1)]))) ?
                  $signed((8'h9d)) : $unsigned({$signed(((8'hb8) ?
                          wire116 : wire117))}));
            end
          else
            begin
              reg128 <= $unsigned($signed(wire119[(3'h5):(1'h0)]));
            end
          reg133 <= (&{($unsigned(wire119) ?
                  (|wire120) : reg121[(3'h7):(3'h4)]),
              wire120[(4'h9):(1'h0)]});
          reg134 <= $signed(wire113[(3'h5):(3'h4)]);
        end
      else
        begin
          reg128 <= (8'hb9);
          reg129 <= $signed(wire119);
          reg130 <= reg122;
          reg131 <= ((wire116 == {$signed($signed(wire113)),
              (-$signed(reg133))}) ^ $unsigned(($signed(wire117) & wire113[(4'hb):(3'h5)])));
          reg132 <= (~&reg131[(4'ha):(4'h8)]);
        end
      reg135 <= $unsigned((reg133[(2'h2):(1'h1)] ?
          ($unsigned(wire115) ?
              $unsigned((wire125 ?
                  reg131 : wire126)) : wire113) : $signed(wire114[(4'hc):(3'h7)])));
      reg136 <= (^$signed($unsigned({reg128, (wire127 ^~ (8'hbe))})));
      reg137 <= ((wire115[(4'ha):(3'h4)] ?
          ({reg133[(1'h0):(1'h0)]} - wire125) : wire126[(4'hc):(4'h9)]) + ($unsigned($unsigned($signed(wire118))) > wire115[(4'h9):(2'h2)]));
    end
  assign wire138 = $unsigned((~wire124[(3'h5):(1'h1)]));
  assign wire139 = (^~reg137[(1'h1):(1'h1)]);
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire83;
  input wire [(5'h10):(1'h0)] wire82;
  input wire [(3'h7):(1'h0)] wire81;
  input wire [(4'hf):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  assign y = {wire90, wire89, wire88, wire87, wire86, wire85, wire84, (1'h0)};
  assign wire84 = wire82[(5'h10):(4'h8)];
  assign wire85 = ($signed((8'hbf)) ?
                      $unsigned((wire82[(4'hd):(3'h5)] ?
                          wire84 : wire81)) : $unsigned($unsigned((wire83 ?
                          wire81 : (~^wire84)))));
  assign wire86 = (~|(~^wire81[(3'h5):(3'h5)]));
  assign wire87 = {wire86[(4'hd):(3'h6)]};
  assign wire88 = wire85[(5'h14):(5'h11)];
  assign wire89 = $signed(wire81);
  assign wire90 = $signed((~^(8'ha0)));
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire48;
  input wire [(5'h15):(1'h0)] wire47;
  input wire signed [(4'hb):(1'h0)] wire46;
  input wire [(4'hc):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire49;
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire49 = {$unsigned($signed((^~wire45[(4'ha):(3'h6)]))),
                      $signed($signed($signed(wire46[(1'h1):(1'h1)])))};
  assign wire50 = $signed(((wire49[(1'h0):(1'h0)] ^~ $signed($signed(wire48))) ~^ (~^{(^~wire45)})));
  assign wire51 = wire48;
  assign wire52 = wire46;
  assign wire53 = (wire48[(1'h1):(1'h1)] || $signed(wire52[(4'hf):(2'h2)]));
  assign wire54 = wire45;
  assign wire55 = wire46[(4'hb):(1'h1)];
  assign wire56 = wire48[(1'h1):(1'h1)];
  assign wire57 = ((((8'hb5) > $unsigned((~^(8'hac)))) < $unsigned({wire45[(4'hb):(1'h1)]})) <<< (8'ha5));
  always
    @(posedge clk) begin
      if ((+(^(((wire48 ~^ wire55) ?
              (wire47 ? wire47 : (8'hac)) : (wire55 ? wire48 : wire46)) ?
          wire47[(5'h10):(3'h4)] : (^~{(8'ha3), wire56})))))
        begin
          reg58 <= wire55;
        end
      else
        begin
          reg58 <= $unsigned(({wire55,
                  (wire50 ? $signed((8'h9d)) : wire52[(4'h8):(2'h2)])} ?
              ({$unsigned(wire54)} ~^ wire55) : (+(~((7'h40) ?
                  reg58 : wire53)))));
          reg59 <= {(($unsigned((^~wire53)) ?
                      ($signed(reg58) ?
                          (reg58 + (8'haa)) : {wire53}) : (wire56 ?
                          (8'hab) : $unsigned(wire53))) ?
                  $signed((|{(8'hb9),
                      wire47})) : $unsigned(wire49[(1'h0):(1'h0)])),
              $unsigned(wire57[(2'h2):(1'h0)])};
          reg60 <= wire47;
        end
      reg61 <= wire47;
      reg62 <= $signed({wire56[(2'h3):(1'h0)]});
    end
  assign wire63 = $unsigned((wire52[(3'h4):(2'h2)] ?
                      wire53[(1'h0):(1'h0)] : $unsigned((~|reg58))));
  assign wire64 = wire51[(2'h2):(1'h1)];
  assign wire65 = $unsigned((wire45[(3'h4):(1'h1)] ?
                      ($signed(reg62) ?
                          ((~wire45) > reg58[(2'h3):(2'h2)]) : $signed($signed(wire52))) : $signed($unsigned((~^wire53)))));
  assign wire66 = {$signed(reg58), reg59};
  assign wire67 = $unsigned(((reg58[(3'h7):(3'h5)] ?
                      ((^~wire56) && $signed(wire65)) : {((8'h9e) ?
                              wire57 : reg61)}) ~^ {$unsigned($signed(wire57)),
                      ((wire50 ? wire47 : wire55) && (reg58 > wire63))}));
  assign wire68 = $unsigned(wire65[(1'h1):(1'h0)]);
  assign wire69 = {{$unsigned(wire57[(2'h3):(2'h2)]), (|(8'h9e))},
                      (~|$unsigned($signed(((8'h9d) + reg59))))};
  assign wire70 = (8'ha2);
  assign wire71 = wire66[(3'h4):(1'h0)];
endmodule

module module12
#(parameter param40 = (~&(+{(((7'h41) == (8'ha1)) ? ((8'hbe) && (8'had)) : ((8'hb8) ? (8'hba) : (8'h9e)))})), 
parameter param41 = (~(8'hab)))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
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
                 (1'h0)};
  assign wire18 = $unsigned(wire17[(2'h2):(1'h0)]);
  assign wire19 = $unsigned($signed((~|(^~((8'ha1) <<< (8'hb4))))));
  assign wire20 = $signed(wire15[(3'h6):(3'h6)]);
  assign wire21 = (!$signed(((~&(^~wire19)) >>> wire13[(3'h4):(1'h0)])));
  assign wire22 = $signed((wire21 ?
                      $unsigned({wire17}) : (wire15[(4'h8):(4'h8)] ?
                          wire21[(1'h0):(1'h0)] : (8'hb6))));
  assign wire23 = $signed($unsigned({($signed(wire21) ?
                          ((8'ha4) <<< wire22) : $signed((7'h44))),
                      (((8'hb7) ? wire21 : (8'hbf)) ?
                          wire16[(4'h9):(2'h2)] : wire22[(1'h0):(1'h0)])}));
  assign wire24 = (-(wire18[(3'h6):(3'h5)] <= ((+(~&wire14)) ?
                      $unsigned($unsigned(wire15)) : (!$signed(wire16)))));
  assign wire25 = (&$unsigned({((wire22 && wire13) ?
                          (wire18 ? wire23 : wire14) : (wire13 ?
                              wire22 : wire13))}));
  assign wire26 = wire25[(4'hc):(3'h4)];
  assign wire27 = (8'ha1);
  always
    @(posedge clk) begin
      reg28 <= wire21;
      if (((|wire19) & {($signed($signed(wire22)) <= (^(~&wire17)))}))
        begin
          if (({(($signed(wire17) && $signed(wire16)) * $unsigned(wire14[(3'h4):(2'h3)]))} >>> $signed($signed(($signed(wire22) ?
              (wire24 ? wire23 : (8'hb7)) : wire21)))))
            begin
              reg29 <= wire19[(2'h3):(1'h0)];
              reg30 <= {{((-wire16) > $unsigned(wire15))}};
            end
          else
            begin
              reg29 <= $unsigned(((^(|$unsigned(wire15))) ?
                  (8'hb6) : (~wire22)));
              reg30 <= $signed((wire18 ?
                  wire24[(1'h1):(1'h0)] : ((wire27[(3'h4):(2'h2)] || $unsigned(reg29)) ?
                      ({reg28} ? (|wire23) : ((8'hb2) - wire24)) : wire25)));
              reg31 <= $signed(($signed(wire20[(2'h2):(1'h0)]) ?
                  $signed((^~$unsigned(wire23))) : wire24[(3'h4):(1'h1)]));
              reg32 <= $unsigned({(((wire25 ? wire18 : wire26) >= (wire17 ?
                      reg30 : wire26)) <= (~{wire20, wire14}))});
            end
          reg33 <= (wire27[(2'h3):(1'h1)] ?
              wire26 : (+((-((8'ha3) ? wire15 : reg30)) ?
                  reg30 : (^wire22[(1'h0):(1'h0)]))));
          reg34 <= $signed(($unsigned(($unsigned(wire19) + (wire17 ~^ reg32))) * (+$signed((reg32 ?
              reg33 : wire22)))));
          reg35 <= $unsigned($signed($unsigned(reg31[(3'h6):(3'h6)])));
        end
      else
        begin
          if ($signed((($unsigned((-wire15)) != wire21[(1'h0):(1'h0)]) ?
              (8'ha0) : (&(wire25[(1'h1):(1'h0)] - {(7'h40), reg29})))))
            begin
              reg29 <= $signed((|(($signed(wire23) != $unsigned(wire24)) & ((~^reg28) <<< (reg30 ?
                  wire26 : wire20)))));
              reg30 <= wire19[(3'h5):(2'h2)];
              reg31 <= wire21[(1'h1):(1'h0)];
              reg32 <= (+$unsigned($signed(reg33)));
              reg33 <= wire13[(2'h2):(1'h1)];
            end
          else
            begin
              reg29 <= wire17;
            end
          if ($signed($signed({(~|$signed((8'ha8)))})))
            begin
              reg34 <= {($signed(((wire27 != wire18) ?
                      (reg31 && (8'haf)) : wire19)) ^~ ($signed($signed(wire22)) * ($unsigned(wire21) ?
                      {wire26} : $unsigned((8'had))))),
                  wire16[(3'h6):(1'h0)]};
              reg35 <= (~&reg28[(4'hd):(3'h4)]);
              reg36 <= ((((|wire15) ? reg34 : $signed($unsigned(reg32))) ?
                  (reg31 ?
                      (~&(^wire17)) : reg29[(4'hb):(4'h9)]) : (($signed(wire24) ?
                          $signed(wire24) : (reg35 ^~ (8'hb9))) ?
                      $unsigned(wire21) : ($unsigned(wire14) + {reg30,
                          wire14}))) ~^ (+($signed({wire26, reg29}) ?
                  (7'h40) : reg31)));
              reg37 <= wire27;
            end
          else
            begin
              reg34 <= (7'h41);
              reg35 <= (($unsigned(reg37) >> (({reg29} ?
                      wire27 : (wire13 >>> reg34)) != {$signed(wire13)})) ?
                  wire18 : {(((&wire24) | wire18) && $unsigned((reg31 > wire22))),
                      wire23[(2'h3):(1'h0)]});
              reg36 <= wire18[(3'h4):(1'h0)];
            end
          reg38 <= wire15[(4'hf):(3'h4)];
          reg39 <= reg36;
        end
    end
endmodule

module top
#(parameter param186 = ({(((-(8'ha6)) >> (|(8'hab))) * {((7'h44) ? (8'h9c) : (8'hb7))})} ? (((-{(8'hbf), (8'ha8)}) ? ((~|(8'hbb)) ^ ((8'hb0) ? (8'h9f) : (8'hae))) : (!((8'hb3) | (8'hb3)))) ? {(~|((8'h9c) << (8'haa)))} : (((+(8'hb2)) ? {(8'hba), (8'hbf)} : {(8'hab)}) || (!{(8'hb7), (8'h9e)}))) : (8'ha4)), 
parameter param187 = param186)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire185;
  wire [(5'h11):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  wire [(5'h15):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire157;
  wire signed [(4'hd):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire153;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire169;
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(4'he):(1'h0)] reg182 = (1'h0);
  reg [(3'h5):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(2'h3):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  assign y = {wire185,
                 wire172,
                 wire171,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire168,
                 wire169,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 (1'h0)};
  module4 #() modinst154 (wire153, clk, wire1, wire2, wire0, wire3);
  assign wire155 = ((!(8'ha5)) ?
                       $signed({wire1[(4'hc):(3'h6)]}) : $signed((wire1 ?
                           ($signed(wire1) ^ $unsigned((8'hb7))) : ($unsigned(wire3) ?
                               {(8'hbc), wire1} : ((8'haf) ? wire1 : wire0)))));
  assign wire156 = $unsigned(($signed((^$unsigned(wire153))) < $signed($signed((wire153 & (8'hbb))))));
  assign wire157 = (8'hb0);
  assign wire158 = wire2;
  module13 #() modinst160 (.y(wire159), .wire16(wire158), .wire17(wire2), .wire14(wire155), .clk(clk), .wire15(wire1));
  module4 #() modinst162 (.wire8(wire156), .clk(clk), .wire6(wire0), .y(wire161), .wire5(wire155), .wire7(wire153));
  assign wire163 = (|wire0[(3'h6):(3'h5)]);
  assign wire164 = (((($signed(wire3) ? $unsigned(wire163) : (~^wire156)) ?
                       $unsigned((~&wire157)) : wire163) >> (~^$unsigned($unsigned(wire157)))) && $unsigned(((wire157 ?
                       $unsigned(wire2) : (&wire163)) <<< ((~&(7'h42)) ?
                       (&wire161) : $signed(wire163)))));
  assign wire165 = (~^(wire156[(1'h1):(1'h1)] ? wire161 : wire155));
  module140 #() modinst167 (wire166, clk, wire165, wire163, wire155, wire153, wire2);
  assign wire168 = (((((wire1 ?
                               wire165 : (7'h44)) != wire165[(3'h7):(1'h0)]) >> $unsigned($unsigned(wire156))) ?
                           $signed($signed((wire2 <= wire3))) : (+(wire2[(4'hd):(4'hd)] ?
                               wire165 : (^~(8'ha0))))) ?
                       wire157 : $signed((^~wire153[(5'h10):(1'h1)])));
  module140 #() modinst170 (.wire144(wire158), .clk(clk), .wire141(wire155), .wire145(wire3), .wire143(wire166), .wire142(wire2), .y(wire169));
  assign wire171 = $unsigned(wire157);
  module103 #() modinst173 (wire172, clk, wire169, wire166, wire3, wire158);
  always
    @(posedge clk) begin
      if ((wire155[(5'h10):(4'h9)] ~^ (({$unsigned(wire159)} ?
              {wire158[(3'h6):(2'h3)]} : (&(8'hb7))) ?
          $unsigned(wire168[(3'h7):(2'h2)]) : $unsigned(($signed(wire166) ?
              $unsigned(wire157) : (~wire155))))))
        begin
          reg174 <= ($unsigned((wire164[(1'h0):(1'h0)] ?
              wire156 : wire165[(1'h1):(1'h1)])) > ((8'hb0) <= wire165[(3'h6):(1'h0)]));
          reg175 <= ((-wire169[(4'hd):(4'hd)]) ?
              ((!$unsigned((wire172 <<< wire156))) ?
                  {(-$signed(wire163))} : {((~&wire165) << wire169[(3'h4):(2'h3)]),
                      wire159[(1'h0):(1'h0)]}) : $signed((~|$signed({wire171,
                  wire156}))));
          reg176 <= (|(^~(wire163[(5'h13):(3'h5)] ?
              {(reg175 ? wire163 : (8'h9c))} : $unsigned($signed((8'hbe))))));
        end
      else
        begin
          reg174 <= (reg176 <= {((wire157 ?
                      wire156[(2'h3):(1'h1)] : (reg175 <<< wire166)) ?
                  wire156 : wire3[(2'h3):(2'h2)]),
              ((^$unsigned(reg176)) | (+(wire164 != wire168)))});
          reg175 <= (wire2 != $unsigned((wire3 ?
              $unsigned(wire169[(3'h6):(3'h4)]) : (|(~|wire2)))));
        end
      reg177 <= ($unsigned(wire2[(3'h4):(1'h1)]) >= $signed((8'ha2)));
      if (wire164[(2'h2):(1'h1)])
        begin
          reg178 <= ((|(^(wire0[(3'h6):(3'h5)] >>> wire1[(4'hf):(2'h2)]))) ?
              ((reg175 ^~ (8'hb8)) ?
                  (wire2[(4'ha):(3'h7)] ?
                      (&(+(8'hb1))) : (!$signed(wire166))) : {wire159,
                      wire155[(5'h14):(5'h13)]}) : ((~|wire1[(2'h3):(2'h2)]) ?
                  ((wire161[(5'h11):(4'h9)] ?
                      (8'ha8) : (wire171 ?
                          wire155 : (8'hb0))) << $unsigned((wire3 ^ (8'hbc)))) : ((-(wire166 ?
                          wire1 : wire161)) ?
                      ((wire3 == wire157) ?
                          $unsigned(wire169) : $unsigned((8'hbb))) : reg174[(4'h9):(3'h7)])));
          reg179 <= $unsigned($unsigned($signed(wire153[(3'h4):(2'h3)])));
          reg180 <= ((&($signed((8'ha4)) <<< wire161[(5'h10):(4'hc)])) ?
              wire159[(5'h11):(4'h9)] : $unsigned((~($unsigned(reg179) << (wire155 ?
                  reg174 : (8'had))))));
          reg181 <= reg175;
          reg182 <= (8'hb7);
        end
      else
        begin
          if ((8'ha2))
            begin
              reg178 <= (reg182 + wire153);
              reg179 <= $signed(((^{(wire168 ? wire169 : wire2),
                  $unsigned(wire3)}) + ((reg177[(3'h4):(1'h1)] ?
                      wire0 : $signed(wire156)) ?
                  $signed($signed(wire163)) : $signed(reg179[(1'h0):(1'h0)]))));
              reg180 <= $signed({(wire165 ?
                      reg174[(1'h1):(1'h1)] : (wire157[(4'hb):(4'h9)] >> $signed(reg174)))});
            end
          else
            begin
              reg178 <= (7'h40);
              reg179 <= {$signed(((wire156 ?
                      wire161[(3'h7):(3'h7)] : reg177) ^ wire163)),
                  $signed(($signed((~&(8'h9d))) ~^ $unsigned(reg177[(5'h10):(3'h4)])))};
            end
          if ({($unsigned((+$signed((8'had)))) << $unsigned($signed(((8'hbd) ?
                  reg181 : wire2))))})
            begin
              reg181 <= (({((7'h42) ? $signed((8'hb1)) : (reg176 ~^ reg181)),
                  wire157[(3'h7):(3'h5)]} ~^ $signed($signed((~^(8'hac))))) && ($unsigned(($unsigned(wire161) ?
                      (-reg177) : (wire159 ? (8'hba) : reg175))) ?
                  (((wire165 ? reg180 : wire171) ?
                      $unsigned(wire168) : (wire159 <<< reg178)) && {(wire165 ?
                          reg176 : wire161),
                      (reg182 ^~ wire171)}) : (((~^wire2) ?
                      reg175[(4'he):(4'ha)] : $unsigned(wire172)) <= {(|wire155),
                      (~&reg181)})));
            end
          else
            begin
              reg181 <= reg174;
            end
          if (($signed(wire159[(4'h8):(3'h5)]) ?
              wire0 : (wire171 ?
                  ($signed($signed((8'hbf))) ?
                      ((reg180 ?
                          wire157 : wire1) ^~ reg177[(5'h12):(4'hf)]) : $signed($unsigned(reg176))) : wire169[(2'h2):(1'h0)])))
            begin
              reg182 <= wire172[(4'h8):(2'h2)];
            end
          else
            begin
              reg182 <= (($signed(wire155) ?
                  $unsigned(wire161[(1'h0):(1'h0)]) : $signed($signed(wire159))) >= (wire169[(4'hc):(3'h4)] ?
                  ((8'haa) ?
                      ({reg182,
                          (7'h41)} == (7'h42)) : $unsigned(reg180[(1'h1):(1'h1)])) : wire168));
              reg183 <= (+$unsigned(reg182));
              reg184 <= (^~((($unsigned(wire172) ?
                  (^(8'had)) : (wire158 >>> wire172)) || wire163) == reg176[(1'h0):(1'h0)]));
            end
        end
    end
  assign wire185 = (-(~wire164[(4'ha):(1'h0)]));
endmodule

module module4
#(parameter param152 = ((((((8'h9f) ? (8'hb6) : (8'hb3)) || {(8'hb4), (8'hba)}) <<< (^~((8'hac) ? (8'had) : (8'had)))) == ((((8'h9c) ? (8'hab) : (8'hb3)) | {(8'hb6)}) > (((8'h9f) || (8'h9c)) >>> {(8'hbf)}))) || (+{(8'hbc), {((7'h42) | (7'h41)), (+(8'h9e))}})))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire150;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(5'h12):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire98;
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  assign y = {wire150,
                 wire139,
                 wire138,
                 wire137,
                 wire132,
                 wire73,
                 wire10,
                 wire9,
                 wire98,
                 reg12,
                 reg11,
                 reg100,
                 reg101,
                 reg102,
                 reg134,
                 reg135,
                 reg136,
                 (1'h0)};
  assign wire9 = $unsigned((8'ha0));
  assign wire10 = $signed($unsigned(((~|(wire7 ? wire6 : wire6)) ?
                      $signed((wire8 ? wire8 : wire7)) : wire7)));
  always
    @(posedge clk) begin
      reg11 <= {{($signed($unsigned(wire9)) ?
                  ($signed((8'ha8)) ?
                      {(8'hb8), wire9} : (wire5 && (8'ha8))) : wire5)},
          $unsigned(($unsigned(wire7[(4'he):(1'h0)]) ?
              (-(wire5 ? wire8 : wire7)) : wire6))};
      reg12 <= $unsigned({reg11});
    end
  module13 #() modinst74 (.clk(clk), .wire17(wire9), .wire15(wire5), .wire16(reg11), .y(wire73), .wire14(wire8));
  module75 #() modinst99 (.wire78(wire73), .wire76(wire7), .wire79(wire8), .clk(clk), .wire77(wire6), .y(wire98), .wire80(wire9));
  always
    @(posedge clk) begin
      reg100 <= (~^{$signed($unsigned(wire6))});
      reg101 <= $signed((((-$unsigned(wire98)) ?
          (^~(|reg100)) : $signed($unsigned(reg12))) <= {(&(|reg12)), reg100}));
      reg102 <= wire7;
    end
  module103 #() modinst133 (.y(wire132), .wire106(wire9), .wire104(wire98), .wire107(wire5), .clk(clk), .wire105(wire10));
  always
    @(posedge clk) begin
      reg134 <= reg12[(2'h3):(2'h3)];
      reg135 <= wire98;
      reg136 <= $signed($signed($signed(reg101[(5'h11):(5'h11)])));
    end
  assign wire137 = {{(!(~&(reg101 ? reg11 : wire5)))},
                       $signed(($signed(reg134) ?
                           ((|reg101) && (-wire9)) : (&$unsigned(wire10))))};
  assign wire138 = (wire132 ?
                       $signed($signed((((8'hb4) ?
                           wire8 : wire137) >> (~|wire7)))) : (wire137 ?
                           $signed(reg135) : $signed(reg100[(4'ha):(3'h7)])));
  assign wire139 = $signed(((~&wire73[(3'h4):(2'h2)]) ~^ {(~&$signed(reg135))}));
  module140 #() modinst151 (.wire143(wire73), .clk(clk), .wire141(wire98), .wire145(wire10), .wire144(reg12), .y(wire150), .wire142(wire5));
endmodule

module module140  (y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire145;
  input wire signed [(5'h13):(1'h0)] wire144;
  input wire signed [(5'h15):(1'h0)] wire143;
  input wire signed [(4'hc):(1'h0)] wire142;
  input wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire148;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  assign y = {wire149, wire148, wire147, wire146, (1'h0)};
  assign wire146 = wire142[(3'h6):(1'h0)];
  assign wire147 = {$signed(wire146[(3'h7):(1'h1)])};
  assign wire148 = (+(((~$unsigned((8'haa))) && (~{wire147, wire145})) ?
                       $unsigned((wire141 <= $unsigned(wire147))) : (wire143 <= {wire144})));
  assign wire149 = ((((-wire144[(2'h3):(1'h1)]) ?
                           (~&(wire142 ?
                               wire144 : wire147)) : wire144[(4'hb):(3'h7)]) ?
                       wire146[(3'h6):(3'h4)] : {(|$unsigned(wire144))}) ~^ ((((wire141 ?
                               wire144 : (8'ha1)) == ((8'hb9) ~^ wire148)) ?
                           (^$signed(wire148)) : ((!wire145) + (wire144 ?
                               (8'hae) : wire148))) ?
                       $unsigned(wire144[(4'h9):(1'h0)]) : $signed((8'h9c))));
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire107;
  input wire [(4'ha):(1'h0)] wire106;
  input wire signed [(4'he):(1'h0)] wire105;
  input wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(2'h2):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire108;
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire111,
                 wire110,
                 wire108,
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
                 reg109,
                 (1'h0)};
  assign wire108 = (wire104 >> (~^{(8'h9f), (~^$unsigned(wire106))}));
  always
    @(posedge clk) begin
      reg109 <= (~wire107);
    end
  assign wire110 = wire104[(2'h3):(2'h2)];
  assign wire111 = wire110[(5'h15):(4'he)];
  always
    @(posedge clk) begin
      reg112 <= wire106;
      reg113 <= (8'hbe);
      if ($unsigned(((($signed(reg112) == $signed(wire107)) ?
              (reg109[(2'h2):(1'h0)] ?
                  $signed(wire106) : (wire106 << wire110)) : {$unsigned(wire107),
                  wire107[(4'he):(4'ha)]}) ?
          (((^~(8'ha5)) ?
              ((7'h41) * reg113) : (^wire107)) | (~wire110)) : {{((8'hbb) < reg109),
                  (wire110 || (8'ha3))},
              (!(!wire104))})))
        begin
          reg114 <= (^(((~|{wire107}) ?
              (reg112 ?
                  wire106[(4'ha):(2'h2)] : {wire111}) : wire105[(4'hb):(3'h5)]) || $signed($signed($signed(reg112)))));
          if (((&((|$signed((8'ha3))) ?
              $signed({reg113, reg113}) : ((+reg109) - {reg109,
                  (8'hb4)}))) ~^ {{((&wire110) ?
                      reg112[(2'h2):(1'h1)] : (~wire105)),
                  (&reg109)}}))
            begin
              reg115 <= {(&(|$unsigned((wire107 & wire104)))),
                  $unsigned(($signed(wire110[(4'h9):(4'h9)]) ?
                      {reg112} : ($signed(wire111) * {wire108})))};
            end
          else
            begin
              reg115 <= reg114;
              reg116 <= $unsigned((8'ha3));
              reg117 <= reg113[(2'h3):(2'h2)];
              reg118 <= $signed(($unsigned($signed(wire111)) ~^ (-($unsigned(wire110) ?
                  reg109[(2'h3):(2'h3)] : $signed(reg109)))));
            end
          reg119 <= (wire108[(4'hc):(1'h0)] ~^ $signed($unsigned((reg115[(5'h10):(3'h5)] ?
              reg116[(4'hf):(4'hd)] : $signed(reg116)))));
          reg120 <= wire110[(4'hb):(3'h6)];
          reg121 <= ((wire107[(1'h1):(1'h0)] ?
                  (((~^wire105) <<< reg114) ?
                      $unsigned((-reg112)) : $unsigned(reg113[(5'h12):(4'hb)])) : (((^~reg112) ?
                          $unsigned(wire111) : (^(8'hbc))) ?
                      ((8'hae) ?
                          wire108 : reg117[(2'h2):(1'h0)]) : $signed(wire107))) ?
              ((7'h41) ?
                  {($signed(wire106) * reg115),
                      $signed(((8'hb1) ?
                          wire105 : wire107))} : reg109[(1'h1):(1'h0)]) : reg114);
        end
      else
        begin
          reg114 <= ({({(reg116 ? (8'ha8) : wire106),
                  $unsigned(wire111)} < reg113)} <<< wire108[(4'hd):(3'h5)]);
        end
      reg122 <= reg115;
      reg123 <= (wire111 && $signed((~^(-(wire106 && (8'ha0))))));
    end
  assign wire124 = (reg116[(2'h3):(1'h1)] ?
                       $signed(reg116[(5'h11):(5'h10)]) : wire111[(5'h12):(3'h7)]);
  assign wire125 = {((wire105[(4'hc):(3'h5)] * wire110[(2'h2):(1'h0)]) + (&reg121[(3'h7):(1'h1)]))};
  assign wire126 = (8'h9e);
  assign wire127 = reg118;
  assign wire128 = reg116[(3'h5):(3'h4)];
  assign wire129 = wire110[(5'h13):(3'h5)];
  assign wire130 = (~^(~(reg118[(1'h1):(1'h0)] ?
                       {reg113, reg113} : ((reg118 >= reg109) ?
                           wire107[(1'h1):(1'h0)] : $signed(wire111)))));
  assign wire131 = reg114;
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire80;
  input wire signed [(2'h3):(1'h0)] wire79;
  input wire signed [(4'hb):(1'h0)] wire78;
  input wire signed [(5'h12):(1'h0)] wire77;
  input wire [(3'h4):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(4'hf):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  reg [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire83,
                 wire82,
                 wire81,
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
                 (1'h0)};
  assign wire81 = (~({(&(wire77 | wire78))} ^ ($signed(wire80) >>> $signed($signed(wire80)))));
  assign wire82 = ($signed($signed(wire77)) ?
                      $unsigned((wire76 && ((-(8'hb7)) >> $signed((8'had))))) : wire81);
  assign wire83 = $unsigned($unsigned((^~wire78[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      if ($signed({$unsigned((+wire77[(4'he):(3'h5)]))}))
        begin
          if ($unsigned($unsigned(wire76[(2'h2):(2'h2)])))
            begin
              reg84 <= {(+wire83[(1'h0):(1'h0)])};
              reg85 <= {($signed(wire83[(2'h3):(1'h0)]) >= (8'hb6)),
                  {(wire78 & reg84), $signed((^{wire80, (8'hab)}))}};
            end
          else
            begin
              reg84 <= $signed(wire82);
              reg85 <= reg85[(1'h0):(1'h0)];
            end
          reg86 <= $unsigned(wire76);
        end
      else
        begin
          reg84 <= reg85;
        end
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned(($signed(reg84) || wire78)))))
        begin
          reg87 <= $unsigned((~|(^~reg86)));
          if ((^{{$signed((reg87 + reg86)),
                  ($unsigned(reg87) ? (^reg84) : wire76)}}))
            begin
              reg88 <= $unsigned({(wire80 == (((8'ha8) < reg84) ?
                      reg85 : (reg85 ? wire78 : reg87))),
                  $unsigned((wire81[(4'h9):(3'h5)] ?
                      ((8'h9e) ? wire82 : wire82) : reg87[(3'h5):(2'h2)]))});
              reg89 <= (wire80[(1'h1):(1'h0)] ^ wire83);
            end
          else
            begin
              reg88 <= (+(wire76 >= ($signed($unsigned(wire82)) ?
                  (^~$signed((8'hb2))) : $signed($signed(wire76)))));
              reg89 <= wire83;
              reg90 <= wire81;
            end
          reg91 <= (wire76[(1'h0):(1'h0)] ?
              ($signed($unsigned((~reg88))) ?
                  wire77 : (+((wire80 == reg84) ~^ (wire80 ?
                      wire81 : reg84)))) : {$unsigned($signed($signed(wire83))),
                  $signed((~|wire81[(2'h2):(1'h0)]))});
          reg92 <= reg91;
        end
      else
        begin
          reg87 <= wire83;
          if ($unsigned(((^reg88[(4'ha):(3'h5)]) ?
              $signed(reg89[(3'h4):(1'h0)]) : (~|$unsigned({reg88, reg85})))))
            begin
              reg88 <= reg87;
              reg89 <= (8'ha5);
            end
          else
            begin
              reg88 <= ({$unsigned(wire78), wire82[(3'h4):(1'h1)]} ?
                  wire79[(2'h3):(2'h3)] : reg89[(4'hf):(1'h0)]);
              reg89 <= $signed((reg85[(1'h0):(1'h0)] - $unsigned($signed((~^wire83)))));
              reg90 <= $unsigned({$unsigned(wire78[(1'h1):(1'h0)])});
              reg91 <= (~^$signed(wire79[(2'h2):(1'h0)]));
              reg92 <= ((&{reg87}) ?
                  (wire77 && (&wire82[(3'h6):(2'h2)])) : ($signed(reg84[(3'h7):(3'h5)]) ?
                      (~|{$unsigned(reg86),
                          {(8'hbc)}}) : reg86[(4'ha):(4'h9)]));
            end
        end
      reg93 <= wire76[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg94 <= wire83;
    end
  assign wire95 = {wire77};
  assign wire96 = $unsigned($signed(wire76));
  assign wire97 = (|$unsigned({$unsigned($signed(wire78))}));
endmodule

module module13
#(parameter param71 = (((((~(8'hba)) ? (-(7'h44)) : ((8'hbe) ^ (8'hb5))) ~^ (^((8'hac) - (8'haf)))) ? (+(+((8'h9d) ? (8'hab) : (8'hb8)))) : ((^~(-(8'h9f))) >= (((7'h42) ? (8'hba) : (7'h40)) ? ((8'ha1) ? (7'h44) : (8'hbe)) : ((8'hb7) >= (8'hb9))))) ? (((+((8'hb7) || (8'haa))) ? ((^~(8'hb6)) ? ((8'hb3) <= (8'hbb)) : ((8'hb1) >= (8'ha4))) : (|(^~(8'ha0)))) * (~|({(8'hba)} && ((8'hb4) && (8'ha7))))) : (((~|((8'ha6) ^~ (8'hbc))) >> {((8'ha0) ? (8'hb6) : (8'hae))}) ? ((~|((7'h43) <<< (8'had))) << ({(7'h42)} ? (-(8'h9f)) : (8'ha3))) : ((8'hab) ? (~((8'hb1) ? (7'h40) : (7'h40))) : (((8'ha7) ? (8'hb6) : (7'h41)) & (+(8'ha6)))))), 
parameter param72 = (((((param71 ? param71 : param71) ? (param71 >> (8'hac)) : (param71 && param71)) <= ({param71} | param71)) ? (8'hbf) : param71) ^ (+(~({param71, param71} ? (param71 <<< (8'had)) : (-param71))))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire44,
                 wire43,
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
                 wire20,
                 wire19,
                 wire18,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 (1'h0)};
  assign wire18 = $unsigned((($signed(wire14[(3'h6):(3'h5)]) ^ wire17) ?
                      wire16[(4'h8):(3'h4)] : $signed(wire15[(1'h0):(1'h0)])));
  assign wire19 = (!$unsigned($signed(wire16[(5'h10):(3'h4)])));
  assign wire20 = {(~^wire17[(2'h2):(2'h2)])};
  assign wire21 = ({$signed((^~$unsigned(wire16))),
                      $signed({(wire16 ? (8'hbd) : wire16),
                          wire19})} ^ wire17[(2'h2):(2'h2)]);
  assign wire22 = (+{$unsigned((&(wire15 ^ (8'ha5))))});
  assign wire23 = (!wire21);
  assign wire24 = (~&(wire14[(3'h5):(3'h5)] <<< (((wire15 ?
                          wire21 : wire19) || wire21[(5'h13):(1'h0)]) ?
                      (^~$signed(wire15)) : (wire16[(3'h7):(3'h4)] ?
                          wire16 : (wire18 ? (8'hb1) : wire14)))));
  assign wire25 = (8'hbe);
  assign wire26 = ((wire15 ? wire21 : $unsigned($signed({wire16, wire22}))) ?
                      ($unsigned($unsigned((|wire15))) <= (wire20[(2'h3):(2'h3)] + (7'h42))) : (wire16 ?
                          (~^(wire19 ?
                              (~&wire16) : $signed(wire22))) : $signed($unsigned($signed(wire16)))));
  assign wire27 = (&wire20);
  assign wire28 = ((((~&$unsigned((8'hac))) & $unsigned(wire14)) > $signed(wire22)) ?
                      wire23[(3'h7):(3'h5)] : $unsigned(wire23));
  assign wire29 = ($signed((~|$signed($unsigned(wire19)))) * (wire19[(3'h6):(2'h3)] ?
                      (^(((8'hbe) ~^ (8'ha0)) <<< wire23[(3'h4):(1'h1)])) : (~|(wire20[(1'h0):(1'h0)] ?
                          $signed(wire27) : {(8'h9f)}))));
  assign wire30 = $signed($signed($unsigned((wire21 ?
                      (8'ha1) : ((8'ha7) | wire18)))));
  always
    @(posedge clk) begin
      reg31 <= (^wire15[(4'hb):(4'hb)]);
      if ((((+($signed(wire24) ?
              wire29 : wire28[(5'h11):(2'h2)])) * $signed((wire14 ?
              {wire24, wire15} : $signed(wire26)))) ?
          $signed(($signed($unsigned(wire18)) ~^ wire17[(3'h6):(1'h0)])) : wire26[(2'h2):(1'h0)]))
        begin
          reg32 <= ($unsigned(wire20[(2'h3):(1'h0)]) ?
              $unsigned((wire27[(3'h5):(2'h3)] ?
                  wire23[(2'h2):(1'h1)] : (~^(wire23 > wire19)))) : {$unsigned((+$signed(wire15))),
                  wire28[(1'h1):(1'h1)]});
          reg33 <= $signed($unsigned(($unsigned(wire25) + (wire19[(5'h11):(4'ha)] ?
              (wire26 ? reg32 : wire15) : (wire15 ? (8'hb5) : wire26)))));
          reg34 <= (~^(8'hb9));
          reg35 <= $unsigned(wire22);
        end
      else
        begin
          reg32 <= wire23[(3'h5):(3'h5)];
        end
      if (wire28[(1'h1):(1'h0)])
        begin
          reg36 <= ($signed(((~^(^~wire14)) ?
              ((7'h42) >>> $signed(wire18)) : ((^wire24) ?
                  (reg31 && (8'hb6)) : ((8'ha7) ?
                      wire23 : wire30)))) ~^ wire29[(3'h4):(1'h1)]);
          if ($signed((reg36[(3'h7):(3'h6)] == wire28[(5'h10):(3'h6)])))
            begin
              reg37 <= $signed(($unsigned($unsigned((|reg34))) > wire27[(3'h7):(1'h1)]));
            end
          else
            begin
              reg37 <= (reg35 ~^ (($signed((7'h44)) ?
                      (8'hb6) : {reg37[(3'h4):(1'h1)]}) ?
                  reg33[(4'h8):(4'h8)] : (reg37 ?
                      $unsigned((reg31 ? reg33 : (8'ha6))) : {(^~wire22),
                          (!reg34)})));
              reg38 <= {((wire30 ^ wire22) ?
                      $unsigned(($signed(wire26) ?
                          (8'hb7) : (reg34 < (8'haa)))) : (reg32[(3'h7):(2'h3)] ^~ $unsigned((8'ha0)))),
                  $unsigned((reg31[(2'h2):(1'h0)] != ($unsigned(reg33) < wire26)))};
            end
          reg39 <= (8'ha8);
          reg40 <= reg36;
          reg41 <= ((reg40[(1'h0):(1'h0)] != wire26) ?
              reg33[(1'h1):(1'h1)] : (~^($signed(reg32[(3'h6):(3'h6)]) + $signed((wire28 || wire25)))));
        end
      else
        begin
          reg36 <= ((7'h40) ~^ $signed((^~(~reg33[(4'ha):(3'h5)]))));
          if ($signed((+{{$unsigned(reg32), (wire14 >>> wire27)}})))
            begin
              reg37 <= ({$unsigned($unsigned(((8'hbf) > reg38))),
                  $signed(wire14)} <= (|wire17));
              reg38 <= ($signed(wire23[(4'ha):(1'h1)]) ^ $signed((+wire19[(5'h12):(4'hc)])));
              reg39 <= ({{$signed((^reg36))},
                  (-$unsigned(wire25[(3'h6):(3'h5)]))} || $signed((-{(~&reg36)})));
            end
          else
            begin
              reg37 <= (reg34[(5'h12):(5'h12)] ^~ ($signed($unsigned({wire17})) == ($signed((reg31 >= (8'hba))) ?
                  $signed((8'hb8)) : ((reg38 * reg36) + $signed((8'hbc))))));
              reg38 <= wire27;
              reg39 <= ((^~wire17) > wire18[(2'h2):(2'h2)]);
            end
          reg40 <= {(~|$signed(wire30)), wire26};
        end
      reg42 <= (^~$signed(wire29));
    end
  assign wire43 = reg38;
  assign wire44 = $unsigned((^(8'ha0)));
  always
    @(posedge clk) begin
      reg45 <= ((~|((|{wire14, wire29}) ?
          (8'hbd) : wire16[(3'h4):(1'h0)])) <<< $signed(($unsigned(reg39) | (~^(wire16 ?
          wire14 : wire27)))));
      reg46 <= $signed($signed($unsigned($unsigned((~wire18)))));
      reg47 <= $signed($unsigned(wire19));
    end
  always
    @(posedge clk) begin
      reg48 <= ((7'h40) ?
          wire18[(1'h0):(1'h0)] : (^~(wire15[(2'h2):(2'h2)] - $unsigned((|(8'hac))))));
      reg49 <= (8'h9d);
      reg50 <= $unsigned((reg41[(3'h4):(2'h2)] < wire23));
      reg51 <= wire16[(4'h9):(4'h8)];
      reg52 <= {reg38[(4'hb):(4'h9)]};
    end
  assign wire53 = {reg40[(1'h0):(1'h0)]};
  assign wire54 = $signed(($signed(reg40) ?
                      (reg35 ?
                          $signed($unsigned(reg48)) : {wire19[(5'h12):(5'h10)]}) : $signed((wire23[(3'h6):(3'h4)] == {wire27}))));
  always
    @(posedge clk) begin
      reg55 <= wire16[(1'h1):(1'h1)];
      if ($signed($unsigned((~^(~(reg33 + (8'ha2)))))))
        begin
          reg56 <= reg38[(4'hb):(4'h8)];
          reg57 <= {({$unsigned({reg48, wire44}),
                      $signed(reg45[(4'h9):(1'h0)])} ?
                  ((^~(wire27 + reg56)) ?
                      (|reg32) : ((^wire54) ~^ $signed((8'ha7)))) : wire24)};
          reg58 <= $unsigned((((8'hb0) ^ $signed({reg48})) ?
              $signed((&$unsigned(reg37))) : (~^reg55)));
          if ((wire28[(4'hb):(3'h5)] | ($unsigned(($signed(wire15) ?
              (^~reg45) : (~&wire24))) << (((reg32 < wire28) * (reg51 & wire23)) ?
              reg52 : ((8'had) || (wire26 ? wire22 : (8'ha2)))))))
            begin
              reg59 <= (|(((~$unsigned(wire26)) ?
                  $signed(wire53[(3'h7):(2'h2)]) : (~^$unsigned(reg55))) <<< {($unsigned(reg51) ^ {(8'ha2)}),
                  $unsigned(((7'h41) ? reg51 : reg52))}));
              reg60 <= $unsigned((reg37[(2'h3):(1'h1)] ?
                  $signed(reg42) : $unsigned((8'ha9))));
              reg61 <= wire30[(3'h5):(1'h1)];
            end
          else
            begin
              reg59 <= wire43;
              reg60 <= (+(wire27 ?
                  $unsigned($unsigned(wire24)) : {reg40[(3'h6):(1'h0)],
                      (~&(wire24 * wire53))}));
              reg61 <= reg50;
              reg62 <= $signed($unsigned(reg49));
              reg63 <= reg50[(3'h5):(1'h0)];
            end
          if ((wire53[(4'hc):(2'h2)] ?
              ((((~(7'h44)) | wire17) != reg46) << {{(reg52 ?
                          wire44 : reg42)}}) : (8'h9e)))
            begin
              reg64 <= reg52;
              reg65 <= reg31;
              reg66 <= (reg45 <= ((wire15 ?
                  $unsigned($unsigned(reg47)) : $unsigned($unsigned(reg51))) > (!$unsigned(((8'hbe) ?
                  reg38 : wire25)))));
            end
          else
            begin
              reg64 <= {reg65[(2'h3):(1'h1)], (7'h40)};
              reg65 <= $signed(wire19[(1'h0):(1'h0)]);
              reg66 <= ($unsigned((!wire30)) >> ($unsigned($signed((8'h9e))) ^~ wire16[(5'h11):(5'h10)]));
              reg67 <= wire17[(5'h11):(4'hd)];
              reg68 <= $signed(wire20);
            end
        end
      else
        begin
          reg56 <= (~&wire26);
          if ($signed(wire20))
            begin
              reg57 <= ((-((~&(wire18 ? reg40 : reg40)) ?
                      $unsigned((wire16 ?
                          wire53 : wire29)) : $signed((~^(8'ha7))))) ?
                  $unsigned(reg47[(4'h9):(3'h4)]) : ((($unsigned((8'hab)) >= $signed((8'h9e))) ?
                          ($signed(reg33) ?
                              {reg58, reg37} : $signed(reg55)) : wire18) ?
                      reg52 : (~&($signed(wire16) ?
                          reg33 : (wire29 * reg47)))));
            end
          else
            begin
              reg57 <= ((reg51 == (~|reg37[(3'h6):(3'h6)])) ?
                  reg49[(2'h2):(1'h1)] : (+$signed($unsigned(reg51[(1'h0):(1'h0)]))));
              reg58 <= reg32[(3'h5):(1'h1)];
              reg59 <= (($signed($signed(reg38)) ~^ ((+$unsigned(wire28)) ?
                      ({reg36} ^ reg46) : wire28[(5'h13):(4'hd)])) ?
                  reg40 : $unsigned((^~wire30)));
              reg60 <= $signed(reg34);
            end
          if ($signed($unsigned($signed(((reg46 * wire15) | (reg47 <<< wire15))))))
            begin
              reg61 <= (~((8'ha4) > wire19));
            end
          else
            begin
              reg61 <= reg34[(3'h6):(3'h4)];
              reg62 <= reg64;
              reg63 <= {reg49[(4'ha):(3'h5)]};
            end
          reg64 <= ({wire44} ^ wire23);
        end
      if (($unsigned(reg42) | (+(~&wire30[(3'h7):(3'h7)]))))
        begin
          reg69 <= $unsigned($signed(((7'h40) ?
              $signed($unsigned(reg41)) : reg34)));
        end
      else
        begin
          reg69 <= ($unsigned({(wire29[(1'h1):(1'h1)] && (~&(8'hbf))),
              reg57[(4'h8):(3'h7)]}) ^~ wire17);
        end
      reg70 <= (wire17[(4'hc):(2'h3)] ?
          reg66 : ($unsigned((!$signed((8'hb8)))) != ($signed((wire28 ?
                  reg40 : wire18)) ?
              reg58[(2'h2):(1'h1)] : ((!reg60) ?
                  wire18[(1'h0):(1'h0)] : ((8'h9e) || reg66)))));
    end
endmodule

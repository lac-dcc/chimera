module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire185;
  wire signed [(2'h2):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire177;
  wire signed [(5'h10):(1'h0)] wire176;
  wire [(2'h3):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire173;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire45;
  reg [(3'h5):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(4'ha):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(4'ha):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  assign y = {wire185,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire173,
                 wire48,
                 wire47,
                 wire45,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  module4 #() modinst46 (wire45, clk, wire0, wire1, wire2, wire3);
  assign wire47 = ((8'ha1) ? (^~$unsigned(wire2)) : wire3);
  assign wire48 = ((8'hbf) ?
                      (wire45 - wire47[(1'h0):(1'h0)]) : $unsigned($unsigned((wire45[(3'h6):(2'h2)] ?
                          wire45 : wire45))));
  module49 #() modinst174 (wire173, clk, wire1, wire47, wire2, wire0);
  assign wire175 = wire0[(1'h0):(1'h0)];
  assign wire176 = wire1[(1'h1):(1'h0)];
  assign wire177 = $signed(wire48[(1'h0):(1'h0)]);
  assign wire178 = wire45[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ((-(~|{wire3[(4'h9):(4'h9)], (&$unsigned((8'h9d)))})))
        begin
          reg179 <= $signed(wire176);
        end
      else
        begin
          if (wire3)
            begin
              reg179 <= $signed(reg179[(2'h3):(1'h0)]);
            end
          else
            begin
              reg179 <= (~&wire173);
              reg180 <= wire3;
              reg181 <= $signed((8'haf));
              reg182 <= ($unsigned($unsigned($unsigned((reg181 ?
                      (8'ha0) : wire3)))) ?
                  wire176 : (!{(^(wire177 ~^ (8'ha1)))}));
              reg183 <= (!$signed((~^((reg179 ?
                  (8'hb6) : wire175) || (^~wire178)))));
            end
          reg184 <= ($unsigned(($unsigned($unsigned(wire0)) == $signed((wire177 ?
              wire176 : reg182)))) > (~(8'hab)));
        end
    end
  assign wire185 = (~|((reg181 ? reg180 : (wire3[(3'h5):(1'h0)] ^~ reg181)) ?
                       (((wire178 ? (8'haf) : reg179) ?
                           (wire47 ?
                               (7'h40) : (8'h9d)) : (+(8'ha8))) >= ($unsigned(reg181) ?
                           {reg181} : reg180)) : (~wire47)));
endmodule

module module49  (y, clk, wire50, wire51, wire52, wire53);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire50;
  input wire [(5'h10):(1'h0)] wire51;
  input wire signed [(5'h13):(1'h0)] wire52;
  input wire signed [(4'hb):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire172;
  wire [(4'hb):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire170;
  wire signed [(4'hf):(1'h0)] wire168;
  wire signed [(4'hc):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire166;
  wire signed [(4'hb):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire161;
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire108,
                 wire110,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire161,
                 reg169,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  module54 #() modinst109 (wire108, clk, wire51, wire53, wire50, wire52);
  assign wire110 = (($unsigned(wire53[(3'h7):(3'h7)]) ~^ (($unsigned((8'hae)) + wire51) >= (wire51[(4'hd):(3'h5)] && (~^wire51)))) & (wire52[(4'ha):(4'h8)] ?
                       wire108 : (wire53 & wire108)));
  always
    @(posedge clk) begin
      reg111 <= wire53[(3'h4):(1'h0)];
      reg112 <= wire52;
      if ({($unsigned($unsigned(wire51)) >>> ((((8'hae) ? wire110 : wire53) ?
                  $unsigned(wire53) : {wire50}) ?
              wire51[(1'h1):(1'h0)] : {wire52})),
          wire110[(4'hb):(3'h5)]})
        begin
          reg113 <= $signed({(((reg111 >> wire52) ^~ (~wire53)) ?
                  ($unsigned(wire50) >> wire52) : wire110[(2'h3):(2'h3)]),
              $signed(wire50)});
          reg114 <= $signed(wire52[(4'ha):(4'h8)]);
          reg115 <= (~|reg114[(3'h4):(2'h2)]);
        end
      else
        begin
          reg113 <= $signed(($signed(wire50) ?
              $unsigned($signed(reg111[(2'h3):(1'h1)])) : reg111[(3'h4):(1'h1)]));
          reg114 <= wire50;
          reg115 <= reg111;
          reg116 <= $unsigned($unsigned(($signed($unsigned((8'hb6))) && $signed(reg111[(2'h3):(2'h3)]))));
        end
    end
  assign wire117 = reg116[(2'h2):(2'h2)];
  assign wire118 = (^wire50[(3'h7):(2'h2)]);
  assign wire119 = wire53[(2'h2):(1'h0)];
  assign wire120 = $signed(wire119);
  assign wire121 = ((-$unsigned($unsigned((-wire118)))) <<< {(reg112 ?
                           $unsigned(((8'hb7) < wire52)) : $signed(((8'hb7) ?
                               (8'haa) : wire51)))});
  module122 #() modinst162 (wire161, clk, wire118, wire120, reg112, reg111, wire110);
  assign wire163 = {reg115, (&$signed((~&reg116[(3'h4):(1'h0)])))};
  assign wire164 = reg112[(1'h1):(1'h0)];
  assign wire165 = {{wire164[(2'h2):(2'h2)], (~&$signed((~^wire120)))}};
  assign wire166 = wire118[(4'hb):(4'hb)];
  assign wire167 = (($signed(reg114) ?
                           reg114[(4'h9):(3'h7)] : $unsigned({$unsigned(reg115),
                               (wire119 ? wire165 : reg114)})) ?
                       ($signed($unsigned(wire164[(2'h2):(2'h2)])) | $unsigned(wire166[(1'h1):(1'h0)])) : $signed({wire110}));
  assign wire168 = ($signed((wire163[(3'h4):(1'h0)] ?
                           $signed((wire110 ? wire167 : wire167)) : reg112)) ?
                       $unsigned($signed($signed($signed(wire53)))) : wire110);
  always
    @(posedge clk) begin
      reg169 <= $unsigned(($unsigned({wire168[(4'hf):(3'h4)],
              $signed(reg114)}) ?
          $unsigned((~&$unsigned(wire167))) : (reg115 | (~|{reg112, reg116}))));
    end
  assign wire170 = $signed(((^(&wire164[(2'h2):(1'h1)])) ?
                       reg169 : wire163[(1'h0):(1'h0)]));
  assign wire171 = ((($signed((-wire165)) ?
                               $signed((wire52 ?
                                   reg116 : wire52)) : $signed($signed(reg115))) ?
                           (8'hb2) : $signed($signed((wire50 ~^ reg116)))) ?
                       (~{(8'hba), (~^wire118)}) : (|$unsigned(wire110)));
  assign wire172 = (($signed($unsigned($signed(wire167))) ?
                       {(reg114 ~^ wire117),
                           $signed(reg115[(5'h15):(2'h2)])} : {wire171[(1'h0):(1'h0)],
                           $unsigned(wire161)}) | reg114[(4'hf):(4'h8)]);
endmodule

module module4
#(parameter param43 = ((((^((8'ha3) < (7'h41))) ? (-((8'hbd) ? (8'hb4) : (7'h40))) : ((7'h42) * (^(8'ha2)))) ? ((&(8'ha0)) ? (~&(8'hac)) : ({(8'hb0)} ? ((8'hb1) ? (8'ha8) : (8'hb0)) : ((8'h9c) >= (7'h43)))) : {(((8'h9f) < (8'hb7)) + ((8'ha8) ? (8'ha5) : (8'haf)))}) << ((~&(((8'hb1) <= (8'hb4)) ? ((8'hba) ? (8'had) : (8'haf)) : (~&(8'ha3)))) <= (!((&(8'hb1)) << (^~(8'hbe)))))), 
parameter param44 = ({param43, ((param43 & param43) > ((param43 >= param43) - (param43 ? (8'hb8) : (8'ha3))))} ? (((~|(!param43)) ? ((param43 < param43) ? (param43 ? param43 : param43) : (param43 ? param43 : param43)) : ((+param43) >> ((8'ha6) <<< (8'hb8)))) ? (((param43 ? param43 : param43) ? (param43 ? param43 : param43) : param43) - (param43 ? param43 : (&param43))) : (&{((8'hbd) || param43)})) : (-(7'h42))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire5;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire41;
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire9,
                 wire10,
                 wire15,
                 wire41,
                 reg16,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire9 = wire6[(4'h9):(1'h1)];
  assign wire10 = wire5[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if ((($unsigned(wire7) ?
              $unsigned((&(wire7 ? wire8 : wire10))) : wire7[(1'h1):(1'h1)]) ?
          wire10 : wire8))
        begin
          reg11 <= wire10;
        end
      else
        begin
          if ((8'h9f))
            begin
              reg11 <= (reg11 ?
                  wire5 : {($signed(((8'had) | wire5)) >> $unsigned(wire10)),
                      $signed((^wire8))});
              reg12 <= wire5;
            end
          else
            begin
              reg11 <= $unsigned((~(~&$unsigned((-reg11)))));
              reg12 <= $signed($unsigned($signed($unsigned(wire5))));
            end
          reg13 <= wire8[(4'h9):(4'h8)];
          reg14 <= ((&(reg12[(3'h4):(1'h0)] ?
              reg13 : reg13)) * ({$unsigned((wire5 ? (8'hb8) : reg13)),
              (((8'ha2) >> reg11) ?
                  (wire5 ^ (8'hb7)) : $signed(wire7))} <= {($unsigned(wire8) ?
                  reg11 : $signed(wire5))}));
        end
    end
  assign wire15 = $unsigned(wire5[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg16 <= (wire9 && wire9[(4'hb):(4'h9)]);
    end
  module17 #() modinst42 (.wire21(wire8), .wire18(wire15), .clk(clk), .wire19(reg13), .wire22(wire10), .y(wire41), .wire20(reg12));
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg40,
                 reg39,
                 reg38,
                 reg34,
                 reg27,
                 (1'h0)};
  assign wire23 = ($signed({wire22[(1'h0):(1'h0)]}) != wire21);
  assign wire24 = (&(wire22 + {$signed(wire18)}));
  assign wire25 = wire23;
  assign wire26 = $signed(wire23);
  always
    @(posedge clk) begin
      reg27 <= ($signed(wire26[(1'h1):(1'h0)]) & (!((wire23[(5'h11):(4'hc)] ?
              $signed((8'hac)) : wire19) ?
          wire23 : wire19)));
    end
  assign wire28 = wire22;
  assign wire29 = wire26;
  assign wire30 = (8'hbc);
  assign wire31 = wire30;
  assign wire32 = wire19;
  assign wire33 = ($signed($unsigned((-$signed((8'hb6))))) ?
                      (+$unsigned(($unsigned(reg27) > ((8'hb9) ^~ wire18)))) : wire20);
  always
    @(posedge clk) begin
      reg34 <= wire33;
    end
  assign wire35 = wire22[(1'h0):(1'h0)];
  assign wire36 = wire19[(4'h9):(2'h3)];
  assign wire37 = (wire31 ? (|(&(~&wire36[(1'h0):(1'h0)]))) : wire21);
  always
    @(posedge clk) begin
      reg38 <= ((~|($unsigned($signed(wire26)) + $signed($unsigned((8'hb4))))) | $unsigned($unsigned($signed(wire28[(2'h2):(2'h2)]))));
      reg39 <= $unsigned({wire32[(4'h9):(2'h2)]});
      reg40 <= (wire24[(3'h4):(1'h0)] > $unsigned($unsigned(((wire28 ?
              wire37 : wire28) ?
          wire18 : wire26[(2'h2):(1'h0)]))));
    end
endmodule

module module122
#(parameter param160 = (({(&((7'h41) ^~ (8'ha1)))} ? (7'h44) : ((((8'hb9) ? (8'hb2) : (8'hac)) ? ((8'had) ? (8'hba) : (8'hb7)) : (~|(7'h40))) ? (~((8'hbe) ? (8'hb4) : (8'ha8))) : ((8'hae) ? ((8'hb8) ? (8'hbd) : (8'hbf)) : ((8'ha6) > (8'hb4))))) ^ ((|(((7'h40) ? (8'hbf) : (8'haf)) <= ((8'hae) <= (7'h41)))) ? (~&(!((8'hab) < (8'haa)))) : ((((8'hbe) ? (8'hbe) : (7'h41)) ^~ (&(8'haa))) | (-((8'hb1) * (7'h44)))))))
(y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire127;
  input wire signed [(5'h12):(1'h0)] wire126;
  input wire [(2'h3):(1'h0)] wire125;
  input wire signed [(5'h12):(1'h0)] wire124;
  input wire [(3'h7):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire158;
  wire signed [(5'h14):(1'h0)] wire157;
  wire signed [(3'h7):(1'h0)] wire156;
  wire signed [(5'h14):(1'h0)] wire155;
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(4'he):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 reg154,
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
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg128 <= $unsigned((-$signed(({wire123} - $unsigned(wire125)))));
      if ($unsigned(wire125[(1'h1):(1'h0)]))
        begin
          reg129 <= ($unsigned(wire123[(2'h3):(1'h1)]) != $unsigned($signed(((~&(8'ha0)) ?
              (^wire125) : (wire124 ? wire127 : (8'hb6))))));
        end
      else
        begin
          if ($unsigned(wire123))
            begin
              reg129 <= $signed(wire123[(2'h3):(2'h2)]);
              reg130 <= (~$signed(reg128));
            end
          else
            begin
              reg129 <= wire126[(3'h5):(2'h3)];
              reg130 <= reg130[(1'h0):(1'h0)];
            end
          reg131 <= reg128[(3'h6):(1'h1)];
          reg132 <= wire127[(3'h6):(3'h4)];
          reg133 <= reg129[(4'hb):(1'h0)];
        end
      if ($signed($signed($signed($unsigned((8'hbd))))))
        begin
          if ((($signed(((&wire124) < $signed(reg132))) ?
              ((reg133 >> (reg128 <<< reg132)) != ((7'h44) ?
                  (~reg128) : reg132)) : {reg129[(3'h5):(2'h2)]}) ^~ reg132))
            begin
              reg134 <= wire127[(3'h6):(1'h1)];
              reg135 <= reg131;
              reg136 <= ((reg129[(3'h5):(1'h1)] > ((~^(reg130 && wire125)) >> (8'hac))) ?
                  wire124 : reg129);
              reg137 <= (~^(!(reg136 ^ wire124[(2'h3):(2'h3)])));
              reg138 <= (|(reg130 ?
                  {reg129, $signed(wire125)} : $unsigned((+reg128))));
            end
          else
            begin
              reg134 <= wire126;
              reg135 <= (~^reg132);
            end
          if ((~^reg128[(3'h6):(3'h6)]))
            begin
              reg139 <= reg135[(5'h13):(4'hc)];
              reg140 <= wire127;
              reg141 <= {{(~&(^$unsigned(reg128)))}};
              reg142 <= ($unsigned(reg132[(1'h0):(1'h0)]) ?
                  wire123 : (+(~&($signed((8'ha0)) ?
                      (!(8'h9e)) : (wire124 ? reg130 : reg134)))));
              reg143 <= $signed({(-(reg130 ?
                      ((8'ha5) == wire123) : $signed(reg136))),
                  wire126});
            end
          else
            begin
              reg139 <= (reg140 ?
                  (reg136[(5'h12):(5'h11)] >> $signed({(reg129 ?
                          reg137 : (8'hb2))})) : ((~$unsigned(((8'hbe) ?
                      (7'h42) : wire126))) & reg143));
              reg140 <= reg143;
            end
          reg144 <= (~(((~^$unsigned((8'hba))) ?
              reg143 : $signed(reg137)) ^~ reg138));
          reg145 <= reg135;
          reg146 <= ((^({{reg134}} ?
              $signed(reg133[(4'h9):(4'h8)]) : ($signed(reg132) > reg141))) << reg133[(1'h0):(1'h0)]);
        end
      else
        begin
          reg134 <= (7'h40);
        end
      reg147 <= reg138[(1'h0):(1'h0)];
      reg148 <= (reg144[(3'h4):(1'h0)] != $unsigned(($signed((reg133 <= reg145)) ?
          (((8'hb6) ? reg136 : reg143) ?
              {wire126,
                  reg131} : (wire125 ~^ reg138)) : $unsigned((reg140 | reg136)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned((|(^~({reg129, wire125} - reg136[(1'h0):(1'h0)])))))
        begin
          reg149 <= (^((~|{{reg134, reg130}}) <<< $unsigned({{reg133},
              reg141})));
          reg150 <= ($signed((-((reg129 ?
                  wire123 : reg131) <<< $unsigned(reg138)))) ?
              $signed($signed((~&(reg147 ?
                  (7'h43) : reg134)))) : {(-((^reg130) == (wire123 ?
                      reg143 : (8'ha4)))),
                  (reg146[(1'h0):(1'h0)] ?
                      ({wire124,
                          reg144} == $signed((8'h9d))) : ($signed(reg129) ?
                          ((7'h44) << (8'had)) : (~^reg139)))});
          reg151 <= (!reg137[(3'h4):(2'h3)]);
          reg152 <= ((reg128 ?
                  ($signed(wire126[(5'h12):(4'hb)]) ~^ $signed((+reg148))) : (reg141[(1'h0):(1'h0)] >>> $signed((~|reg149)))) ?
              (~$unsigned({(~^wire124)})) : ((~(reg143 ?
                      reg149[(2'h2):(1'h1)] : wire127[(3'h7):(2'h3)])) ?
                  (+reg142) : ($unsigned((reg148 ^~ reg130)) ?
                      {$unsigned((8'h9e))} : (|$unsigned(wire125)))));
          reg153 <= (reg150[(4'hc):(4'hc)] ?
              (8'ha2) : $unsigned(reg152[(4'hd):(4'hc)]));
        end
      else
        begin
          reg149 <= $unsigned(($unsigned((^$signed(reg153))) ?
              (+reg139) : {reg143[(4'ha):(2'h3)]}));
          reg150 <= (8'hba);
          reg151 <= ((^(((&reg143) ? $signed((8'hb9)) : reg145[(3'h6):(2'h3)]) ?
                  reg144 : $unsigned(reg130))) ?
              $unsigned(reg151) : (!$signed(reg135)));
        end
      reg154 <= $signed(($unsigned($unsigned((reg144 ?
          reg138 : wire123))) <<< ($signed(((8'ha2) || (8'ha7))) < (^~$unsigned(reg128)))));
    end
  assign wire155 = reg140[(4'hd):(3'h6)];
  assign wire156 = (+{$unsigned((~|(reg151 * reg140)))});
  assign wire157 = (8'hbd);
  assign wire158 = $unsigned((!$unsigned(reg131)));
  assign wire159 = $signed((~$unsigned($unsigned((+reg140)))));
endmodule

module module54
#(parameter param107 = ({(+(~|((8'h9d) + (8'hb0)))), (8'hb6)} ? (8'hab) : ((({(8'hbd), (8'ha1)} ^ (^~(8'hb9))) ? (8'hb2) : (((8'ha3) ? (8'hb2) : (8'hbb)) < (^~(8'hb0)))) ? (&(~((8'hbf) ? (8'hb2) : (8'hb7)))) : (&({(8'hbf)} ? (-(8'ha1)) : {(8'hae)})))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h229):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire [(3'h7):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire [(4'hb):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire61;
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  assign y = {wire106,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire74,
                 wire73,
                 wire63,
                 wire61,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg62,
                 reg60,
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= ({(~^$signed((wire58 ?
              wire58 : wire56)))} ^~ (~^(!wire57[(2'h2):(1'h0)])));
      reg60 <= {wire55, (!$unsigned(($unsigned(wire57) >> {reg59})))};
    end
  assign wire61 = (wire57[(1'h0):(1'h0)] || ((($unsigned(reg60) <= (8'ha8)) ?
                      $signed($unsigned(wire57)) : {reg60}) <<< wire58));
  always
    @(posedge clk) begin
      reg62 <= wire55;
    end
  assign wire63 = {({($signed(wire55) && reg60[(3'h6):(3'h6)])} ?
                          ((~^wire61) ?
                              (((8'hbb) <= wire55) ?
                                  $signed(wire61) : wire61) : (reg59[(1'h0):(1'h0)] && reg60)) : $signed(reg62[(3'h7):(2'h2)]))};
  always
    @(posedge clk) begin
      if ({wire56, wire56[(4'ha):(4'h9)]})
        begin
          reg64 <= reg62[(4'h8):(3'h7)];
          reg65 <= ($signed((&wire58[(4'hd):(3'h7)])) ?
              $signed((({wire56} ? $unsigned(wire58) : wire55) ?
                  (-wire63) : wire58)) : ($signed((wire56[(3'h4):(2'h2)] ?
                      wire55 : {wire63})) ?
                  $unsigned(((-(8'hbc)) * (~wire55))) : $signed(wire63[(1'h1):(1'h0)])));
          reg66 <= wire63[(2'h2):(1'h1)];
          if ($unsigned(reg60[(2'h2):(1'h1)]))
            begin
              reg67 <= (reg59 ?
                  {(^wire57[(3'h6):(3'h5)]),
                      $unsigned(($signed(reg66) ?
                          $signed(wire61) : reg59))} : (!($signed((wire55 != reg66)) == (8'hbb))));
              reg68 <= ((wire57[(3'h7):(3'h6)] <= $unsigned(wire57)) ^~ (((8'hbc) ?
                      $signed($unsigned(wire57)) : wire63) ?
                  ({reg64[(2'h2):(1'h0)]} ?
                      ({wire55} < reg59[(1'h1):(1'h1)]) : reg64[(4'ha):(1'h0)]) : ($signed($unsigned(reg67)) ?
                      (~(wire55 && reg60)) : $signed((&reg66)))));
            end
          else
            begin
              reg67 <= {{($signed(wire61[(3'h7):(3'h4)]) ?
                          ($unsigned(wire61) || {reg65, (8'h9f)}) : (!(reg59 ?
                              reg65 : wire57)))}};
            end
          reg69 <= ($unsigned($unsigned(reg66[(4'ha):(2'h3)])) || (^reg59[(1'h0):(1'h0)]));
        end
      else
        begin
          if (((!$unsigned(((^(8'hb0)) ? (-reg68) : (&reg67)))) ?
              $unsigned(reg69[(5'h11):(4'hf)]) : ((8'hae) > wire58[(4'hf):(3'h5)])))
            begin
              reg64 <= (~^reg62[(4'hd):(4'h8)]);
              reg65 <= reg64[(4'hd):(4'hc)];
            end
          else
            begin
              reg64 <= {{reg67}, (-reg60)};
            end
          reg66 <= (~|((~|wire63) ?
              (-reg68[(4'hc):(1'h1)]) : ($unsigned((reg62 ?
                  reg62 : (8'hae))) ^ $signed(wire63))));
          if ($unsigned($signed($signed(wire63[(2'h2):(1'h0)]))))
            begin
              reg67 <= wire63;
              reg68 <= $unsigned(((wire63[(2'h3):(2'h3)] * reg64) >> reg66));
              reg69 <= wire56;
              reg70 <= $unsigned($signed(reg64[(4'hf):(4'ha)]));
              reg71 <= wire56[(3'h4):(2'h2)];
            end
          else
            begin
              reg67 <= $unsigned((reg66[(1'h0):(1'h0)] + $unsigned((wire57[(2'h2):(1'h1)] ^~ reg66[(2'h3):(2'h3)]))));
            end
          reg72 <= ((~&reg60) < reg62[(1'h0):(1'h0)]);
        end
    end
  assign wire73 = $unsigned(((($signed(reg59) ?
                      reg65[(3'h6):(3'h6)] : wire61) << ($unsigned(reg64) ?
                      (-reg64) : (wire63 ?
                          (8'hbb) : (8'hb6)))) ^~ (wire56 * $signed($unsigned((8'h9c))))));
  assign wire74 = (wire56[(4'h9):(2'h3)] + wire55);
  always
    @(posedge clk) begin
      reg75 <= $signed(((|({reg70} ^ ((8'hbf) <= (7'h44)))) + {wire63[(2'h3):(2'h2)]}));
      reg76 <= reg66[(3'h5):(2'h3)];
      reg77 <= ($unsigned(wire74) >= (|(8'hbe)));
      reg78 <= ($signed(wire56[(4'h8):(3'h5)]) ?
          wire57 : (^((reg75[(3'h6):(2'h3)] ?
              $signed(reg62) : wire56[(4'h8):(1'h0)]) < $unsigned((^wire63)))));
    end
  assign wire79 = ((|$signed((8'ha6))) ?
                      (reg76 << wire73) : ($unsigned(reg76[(4'h8):(4'h8)]) >> $signed((!(reg70 ?
                          reg64 : reg71)))));
  assign wire80 = {(($unsigned((reg77 >>> wire55)) | ($signed((8'hae)) ?
                              $signed(reg76) : ((8'ha0) < wire74))) ?
                          {((8'hb5) ^ ((8'ha2) ?
                                  reg66 : reg70))} : (-wire55[(1'h1):(1'h0)]))};
  assign wire81 = (^$signed((8'hb1)));
  assign wire82 = wire63[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg83 <= (&{((~^{wire80, reg67}) ?
              ($signed((8'h9c)) > $signed(reg72)) : $signed($unsigned(reg76))),
          reg64[(5'h10):(3'h5)]});
      if (reg76[(4'h8):(2'h2)])
        begin
          reg84 <= $unsigned((wire57[(3'h4):(1'h0)] | {($signed(reg64) == reg59)}));
        end
      else
        begin
          reg84 <= {$unsigned($unsigned(((reg76 ?
                  reg84 : reg78) ^~ $signed(reg70))))};
          reg85 <= reg69[(4'he):(4'he)];
          reg86 <= reg65[(1'h0):(1'h0)];
          if ((~(&(~^($signed(reg64) ?
              $unsigned((8'hac)) : reg72[(2'h2):(1'h1)])))))
            begin
              reg87 <= reg67[(3'h4):(3'h4)];
              reg88 <= (wire63 ?
                  {((reg86 ? {wire74} : (wire61 ? reg68 : reg87)) ?
                          (reg84[(1'h0):(1'h0)] ?
                              (^(8'hab)) : reg83[(3'h4):(3'h4)]) : ((reg78 * wire63) ?
                              $signed(wire61) : (|wire61)))} : wire79);
            end
          else
            begin
              reg87 <= wire61;
              reg88 <= reg86[(5'h13):(4'hf)];
            end
          reg89 <= (wire73 - reg69);
        end
      if (reg89)
        begin
          reg90 <= reg60;
          reg91 <= $unsigned(reg85[(3'h4):(2'h3)]);
          reg92 <= $signed($unsigned(wire81[(1'h1):(1'h1)]));
        end
      else
        begin
          reg90 <= $unsigned(reg67[(4'h8):(2'h2)]);
          reg91 <= $unsigned($unsigned({({wire82, reg92} <= $unsigned(reg64)),
              $signed($signed(reg85))}));
        end
      reg93 <= reg87[(4'he):(3'h6)];
    end
  always
    @(posedge clk) begin
      if (((|$signed(reg90[(2'h2):(1'h0)])) ?
          (($signed(reg62) ?
              (((8'hbc) <= wire57) <<< reg84[(2'h3):(1'h0)]) : $unsigned($signed(wire73))) ^~ (8'ha1)) : (reg86[(4'hd):(4'h8)] <= $unsigned(((~|reg89) ?
              (~|wire55) : {wire55, reg83})))))
        begin
          reg94 <= reg72;
        end
      else
        begin
          reg94 <= ($signed(reg75) ?
              ((~((reg71 ? (8'hbf) : reg72) ?
                      (wire79 ? (8'hba) : wire81) : reg83)) ?
                  $unsigned(($signed(reg86) ^~ wire58[(3'h4):(2'h3)])) : {(wire79[(3'h6):(3'h6)] * ((8'hb4) ?
                          wire74 : reg87)),
                      ($unsigned(reg72) ?
                          (!reg69) : (reg68 ? reg85 : wire79))}) : (+reg66));
          reg95 <= ($unsigned(($signed($signed(reg86)) ?
              wire80[(1'h0):(1'h0)] : (8'hbb))) & reg62[(2'h2):(1'h0)]);
          if ($signed(((wire82 || $unsigned({wire74, wire56})) ^ (wire57 ?
              (reg92 ? reg92[(1'h0):(1'h0)] : $signed((8'h9d))) : (!{reg76,
                  reg84})))))
            begin
              reg96 <= $signed($signed($signed($signed(reg62))));
              reg97 <= (^~(^($signed($signed(reg62)) ?
                  $signed((reg89 ?
                      reg66 : reg68)) : $unsigned($signed(reg72)))));
              reg98 <= $unsigned(reg97[(4'h9):(4'h8)]);
              reg99 <= reg59[(3'h6):(3'h4)];
            end
          else
            begin
              reg96 <= (((&{reg62[(1'h1):(1'h1)], reg99[(3'h5):(2'h2)]}) ?
                  reg65[(2'h2):(1'h0)] : $unsigned($signed(reg85))) >>> (~((~|wire55) ?
                  (reg87[(3'h5):(1'h1)] + $signed(reg59)) : ((reg93 ?
                          reg70 : reg84) ?
                      $signed((8'hb5)) : $signed(reg92)))));
            end
          reg100 <= $signed((+(^(^reg84[(5'h10):(3'h7)]))));
          if ($unsigned({reg67[(2'h3):(2'h3)], $signed(wire57)}))
            begin
              reg101 <= wire55[(3'h4):(1'h0)];
            end
          else
            begin
              reg101 <= {{((+{reg94, reg84}) * reg67),
                      ($unsigned((!wire55)) + ($signed(wire73) ^~ (reg86 ?
                          wire57 : (8'hb6))))},
                  (reg66[(4'h9):(4'h9)] || reg97[(1'h0):(1'h0)])};
              reg102 <= $signed((($signed($signed(wire61)) - (!reg100[(2'h2):(1'h0)])) == $signed(wire74)));
            end
        end
      reg103 <= $signed((^($unsigned(wire55[(3'h4):(1'h1)]) ^~ ((~&reg77) ?
          reg102 : {reg76, reg90}))));
      reg104 <= (reg95 ?
          (-(~&$signed((reg71 ?
              reg64 : (8'had))))) : $unsigned((reg75[(2'h3):(1'h1)] ^~ reg85)));
      reg105 <= $signed((((8'hb0) << $signed(reg71[(4'hb):(3'h6)])) ?
          (8'hb5) : ({wire79, (~(8'hb4))} < ((wire57 ^ reg59) ?
              reg69 : $unsigned(reg59)))));
    end
  assign wire106 = {((reg91 ?
                               $signed((reg77 ^~ wire58)) : $signed($signed(reg69))) ?
                           reg98[(1'h0):(1'h0)] : $signed(((reg59 ?
                               reg90 : (8'ha8)) & (^wire57))))};
endmodule

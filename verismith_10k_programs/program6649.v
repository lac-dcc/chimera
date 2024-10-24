module top
#(parameter param174 = ((((8'hb2) << {((8'hb3) ? (8'ha0) : (8'hb4))}) ? (-((~^(8'hb1)) ~^ {(8'hbb), (8'ha7)})) : (({(7'h41)} ? {(8'had), (8'hb1)} : (&(8'hbd))) ? {((8'hb1) + (8'hbc))} : (&((8'ha0) == (8'ha8))))) ^ ({(((8'hae) ? (8'ha6) : (8'hb8)) ? ((8'hb4) | (8'h9c)) : ((8'hb6) | (8'hae))), (((8'hb8) >= (8'h9d)) ~^ ((8'hbf) <<< (8'hae)))} ^ {((^~(8'h9e)) == ((8'hab) ? (8'h9e) : (8'hbf)))})), 
parameter param175 = param174)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire171;
  wire signed [(3'h5):(1'h0)] wire170;
  wire [(2'h2):(1'h0)] wire169;
  wire [(4'ha):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire167;
  wire [(5'h11):(1'h0)] wire166;
  wire [(4'h9):(1'h0)] wire165;
  wire [(2'h3):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire163;
  wire [(4'h8):(1'h0)] wire162;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire105;
  wire [(4'ha):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire160;
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire12,
                 wire100,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire120,
                 wire160,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg107,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
      if (($signed((~|((wire2 <<< wire1) ^~ ((8'hbd) << wire0)))) < {{wire0},
          ($unsigned(wire1[(3'h7):(3'h5)]) != wire3[(2'h2):(1'h0)])}))
        begin
          reg5 <= wire3[(4'h8):(3'h4)];
        end
      else
        begin
          reg5 <= reg4;
          if ($signed((8'h9c)))
            begin
              reg6 <= $signed(reg4);
              reg7 <= {reg5[(2'h3):(2'h3)]};
              reg8 <= (!wire1);
            end
          else
            begin
              reg6 <= (reg8[(1'h0):(1'h0)] ?
                  wire0 : ((-$unsigned((reg7 + wire0))) ?
                      {(8'ha7)} : {$signed(wire3)}));
              reg7 <= (reg7[(2'h2):(1'h1)] ~^ (!{(&{wire0, reg4})}));
              reg8 <= (((($signed(reg7) & wire2[(4'h9):(4'h9)]) ?
                          {$signed(wire2)} : (reg5[(2'h2):(2'h2)] ~^ wire1)) ?
                      $unsigned($signed($signed(reg7))) : $signed(((reg5 ?
                              (8'hbc) : wire0) ?
                          $signed(wire3) : $unsigned(reg7)))) ?
                  $unsigned($signed(($unsigned(wire3) ?
                      (wire0 | wire0) : reg8[(4'h8):(2'h2)]))) : reg5[(3'h5):(2'h3)]);
            end
          reg9 <= reg6[(5'h13):(4'he)];
          reg10 <= $unsigned($signed((((reg9 ? wire0 : wire3) ?
              (8'hbf) : reg6[(5'h12):(4'hb)]) ^~ $signed(((8'ha6) > wire2)))));
        end
      reg11 <= (reg4 ?
          ((^$signed(((8'hbe) || reg10))) ?
              $unsigned($unsigned((reg8 ? reg5 : reg5))) : {$signed({(7'h42),
                      (8'ha5)}),
                  $unsigned($unsigned(reg4))}) : (-(-(wire2 > $unsigned(wire1)))));
    end
  assign wire12 = ($unsigned(reg6) ?
                      (~^(~&reg5)) : {$signed(reg6[(4'hf):(4'hd)]),
                          $signed((^wire3))});
  module13 #() modinst101 (.wire14(reg11), .wire16(wire1), .clk(clk), .y(wire100), .wire15(wire12), .wire17(reg9), .wire18(reg4));
  assign wire102 = wire100[(1'h0):(1'h0)];
  assign wire103 = ($unsigned(wire2[(2'h3):(2'h3)]) == {reg8[(1'h1):(1'h0)],
                       (~^$unsigned($signed((7'h42))))});
  assign wire104 = $signed($unsigned((~|$unsigned($unsigned((8'h9e))))));
  assign wire105 = (+((|reg6) >>> {(^$unsigned(wire0))}));
  assign wire106 = {($signed(($signed(wire0) <<< ((8'hbf) > reg4))) ?
                           wire105[(4'hf):(3'h5)] : ((|(wire102 ?
                                   reg9 : wire102)) ?
                               wire100[(3'h6):(3'h6)] : (reg6 ?
                                   (wire2 ? (8'haf) : wire100) : ((8'hb3) ?
                                       reg5 : wire12))))};
  always
    @(posedge clk) begin
      reg107 <= (($signed(reg9[(4'hf):(3'h5)]) && (|reg11)) * (reg4[(4'hc):(1'h0)] && $signed((wire106 ^~ (wire1 ?
          reg11 : (8'haf))))));
    end
  module108 #() modinst121 (.wire112(wire106), .clk(clk), .wire111(reg10), .wire109(wire100), .y(wire120), .wire110(reg9));
  module122 #() modinst161 (wire160, clk, reg9, wire3, reg5, reg4);
  assign wire162 = $signed((($unsigned({wire2, wire100}) ?
                       wire102 : ((~^wire102) >> (^~(7'h40)))) == ((^~(wire105 <= wire3)) ?
                       $unsigned((wire102 == reg4)) : reg8)));
  assign wire163 = (|($signed((wire3[(3'h4):(3'h4)] ?
                           $unsigned(reg7) : wire2[(3'h4):(2'h2)])) ?
                       $signed($unsigned(reg10)) : $unsigned(({reg5,
                           (8'hac)} | (wire3 <= wire160)))));
  assign wire164 = $unsigned($unsigned(({reg5[(4'hb):(2'h3)]} ?
                       ((wire102 >> wire104) | (wire104 * wire106)) : $signed(wire12))));
  assign wire165 = $unsigned((((!{wire1}) > (~^$signed(wire162))) ?
                       wire120[(1'h0):(1'h0)] : $signed((((8'hae) <= reg6) >>> $signed(reg11)))));
  assign wire166 = $unsigned(wire162[(4'h8):(4'h8)]);
  assign wire167 = wire3;
  assign wire168 = $signed((wire106[(3'h5):(1'h0)] ?
                       $signed($unsigned(reg6[(5'h10):(4'hc)])) : $unsigned(($unsigned(wire103) && wire120))));
  assign wire169 = $unsigned(wire162);
  assign wire170 = (&$unsigned((^$unsigned($unsigned(wire167)))));
  assign wire171 = (+wire2[(4'hb):(2'h3)]);
  assign wire172 = reg8;
  assign wire173 = ($signed((!wire12)) ? wire1 : (^wire160));
endmodule

module module122
#(parameter param158 = ({((~&{(8'ha9)}) <<< (~((8'hb6) ? (8'hb7) : (8'hbf))))} * {((((8'ha7) ? (8'hba) : (8'h9e)) >= ((8'hbc) ? (8'hb2) : (8'hba))) ? (8'hba) : (((8'hb6) ? (8'h9d) : (8'ha7)) ? ((8'hb4) && (8'h9d)) : (~&(8'h9f))))}), 
parameter param159 = ((-(param158 ? param158 : ((~(8'hb2)) <<< (!param158)))) ? ((param158 ? param158 : param158) != (~^((param158 ? param158 : param158) & (-param158)))) : param158))
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire126;
  input wire signed [(4'he):(1'h0)] wire125;
  input wire signed [(5'h11):(1'h0)] wire124;
  input wire signed [(2'h3):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire156;
  wire [(4'he):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(4'he):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire151;
  wire [(2'h2):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
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
                 (1'h0)};
  assign wire127 = {$unsigned(($unsigned($signed(wire124)) | $unsigned(wire125[(4'hd):(1'h1)])))};
  assign wire128 = (+(wire123[(1'h1):(1'h0)] - wire127[(1'h0):(1'h0)]));
  assign wire129 = wire124[(4'hb):(1'h1)];
  assign wire130 = {wire127,
                       $unsigned({$unsigned(wire124),
                           ((|wire125) ? wire129 : $signed(wire127))})};
  always
    @(posedge clk) begin
      reg131 <= (wire130 << (wire129[(4'h8):(3'h6)] ?
          wire130[(2'h3):(1'h0)] : ((((8'ha8) ? (8'had) : wire127) ?
              $unsigned(wire126) : wire128) | ((wire127 & wire127) & (+wire129)))));
      if ($unsigned($signed((((8'h9e) >> wire124[(3'h4):(2'h3)]) > $unsigned((|wire126))))))
        begin
          reg132 <= wire126[(4'h9):(2'h3)];
          reg133 <= $signed((+({{wire125},
              (~^wire127)} >>> $signed($signed((8'ha5))))));
        end
      else
        begin
          reg132 <= wire127[(1'h1):(1'h0)];
          if ((($unsigned($unsigned((+wire123))) == reg132) ?
              wire129 : ($unsigned($unsigned((reg131 ?
                  (7'h41) : (8'hb1)))) < $unsigned((((8'ha6) < wire126) ?
                  {reg131, (8'h9d)} : (wire123 && wire124))))))
            begin
              reg133 <= ($unsigned({wire126[(4'h8):(2'h2)],
                  (wire123[(1'h1):(1'h0)] || (~^wire126))}) - ($unsigned(((~wire128) >>> (wire124 ?
                      (8'h9c) : reg133))) ?
                  wire127 : wire123[(2'h2):(2'h2)]));
              reg134 <= wire130[(4'hf):(4'hd)];
              reg135 <= $unsigned((+$unsigned(wire127)));
              reg136 <= $unsigned((~|((^~wire130[(3'h4):(1'h0)]) ?
                  {reg133[(4'h9):(2'h3)]} : $unsigned($signed(reg134)))));
              reg137 <= reg135[(3'h7):(3'h5)];
            end
          else
            begin
              reg133 <= (reg134[(1'h1):(1'h1)] ?
                  ((|$signed(reg132)) * wire127[(3'h7):(3'h7)]) : wire126);
            end
          reg138 <= $unsigned(((^{((8'had) ?
                  (8'hbb) : reg135)}) && {$signed(wire128),
              {(-wire124), {wire129, reg137}}}));
        end
      reg139 <= (~$unsigned({($signed(reg132) ^ $unsigned(reg131))}));
    end
  always
    @(posedge clk) begin
      reg140 <= ((((-reg135) ?
          ((wire127 ? wire126 : wire128) ?
              wire128 : {wire129,
                  reg136}) : wire130[(4'hb):(1'h1)]) < (^reg138[(1'h0):(1'h0)])) >> wire129[(3'h4):(1'h0)]);
      reg141 <= reg131;
      if ((^~(^~$unsigned((~^(~^wire123))))))
        begin
          reg142 <= $unsigned($signed(($signed((8'hbd)) < $unsigned(wire130))));
          reg143 <= reg132;
        end
      else
        begin
          reg142 <= $unsigned((8'ha7));
          reg143 <= (-{(+wire126),
              (wire129[(3'h5):(2'h3)] ?
                  wire129 : ((wire123 && reg137) != (reg143 <= reg132)))});
        end
      reg144 <= ($signed((reg136[(1'h0):(1'h0)] ^~ reg132[(2'h3):(2'h3)])) > (wire127[(3'h4):(1'h0)] ~^ reg133));
    end
  always
    @(posedge clk) begin
      reg145 <= (reg134 ?
          (^{((reg133 ? reg138 : reg135) + ((8'hbc) >= wire123)),
              (~&(reg131 && (8'hae)))}) : $unsigned(reg141[(1'h1):(1'h0)]));
      reg146 <= (((~^(^$signed(wire126))) == wire130[(4'hd):(4'hc)]) >>> reg140);
      reg147 <= $signed($unsigned({$signed((reg137 ~^ wire130)),
          $unsigned((~reg140))}));
      reg148 <= (-wire129[(1'h0):(1'h0)]);
      reg149 <= $unsigned($signed($unsigned($unsigned((~&wire130)))));
    end
  assign wire150 = (reg143 ? wire130 : $signed((^~$signed((8'ha9)))));
  assign wire151 = $signed($signed(wire128[(1'h0):(1'h0)]));
  assign wire152 = {$unsigned((&((wire127 ? reg134 : reg145) ?
                           reg149[(3'h7):(3'h7)] : wire123)))};
  assign wire153 = (reg146 >>> reg134[(2'h3):(1'h1)]);
  assign wire154 = {({reg131} ? $unsigned(wire150) : reg132),
                       (reg132[(3'h6):(1'h0)] ?
                           (($unsigned(reg135) != (~^reg136)) ?
                               $unsigned($signed(reg135)) : $unsigned(reg140)) : $unsigned(($signed(wire128) ?
                               {(8'ha3), wire151} : (reg134 ?
                                   reg144 : reg147))))};
  assign wire155 = ($signed($unsigned((^~(wire124 ?
                       reg136 : wire154)))) <= (reg149 - ((((7'h41) || reg145) ?
                           $unsigned((8'hbf)) : {wire150, reg143}) ?
                       (wire127[(4'hb):(4'h8)] ?
                           $unsigned((8'hbf)) : $signed(reg132)) : {(wire125 ?
                               reg133 : wire151),
                           (reg148 ? reg140 : (7'h44))})));
  assign wire156 = (~&(^~reg140[(2'h3):(1'h0)]));
  assign wire157 = {reg143,
                       (($unsigned((-wire125)) ?
                           wire130 : ($unsigned(reg143) << $unsigned(reg148))) >= ({(wire128 ?
                               reg139 : wire153),
                           reg146[(3'h7):(1'h0)]} >>> $unsigned((wire127 ?
                           reg143 : wire154))))};
endmodule

module module108
#(parameter param118 = (((({(8'hb4)} ? ((8'haa) ? (8'hb2) : (8'hbb)) : (+(8'ha8))) < ((|(8'hab)) <<< (~(8'hac)))) ? (((8'hbf) ? ((8'hae) ? (8'hbd) : (8'hab)) : ((7'h40) ? (8'hb4) : (8'ha6))) ? ((!(8'ha6)) >>> ((8'hbe) || (8'hbc))) : (((8'hb1) <<< (8'ha4)) < (-(7'h41)))) : (!{((8'ha5) + (7'h42)), ((8'ha1) ? (7'h41) : (8'ha2))})) ? ({{{(8'haf)}, {(8'ha7)}}} < ((((8'ha0) ? (8'hb3) : (8'ha6)) ? ((8'ha8) || (8'hb5)) : ((8'ha9) ? (8'ha6) : (8'ha1))) != (!(8'h9f)))) : (((-((8'hb6) > (8'hbf))) ? (&(~(7'h43))) : ((&(8'hb9)) & ((8'hb1) ? (8'hab) : (8'hb4)))) ~^ (~(((8'hb5) ? (8'h9c) : (8'hbb)) ? ((8'hb1) ? (8'haf) : (8'hb4)) : {(8'hbc)})))), 
parameter param119 = {(|param118), (((~param118) ? (param118 ? (param118 ? param118 : (8'hab)) : (8'hbd)) : ((8'ha4) ? (param118 ? param118 : param118) : (|param118))) ? param118 : (7'h44))})
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire112;
  input wire [(3'h7):(1'h0)] wire111;
  input wire signed [(4'he):(1'h0)] wire110;
  input wire [(4'hd):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  assign y = {wire117, wire116, wire115, wire114, wire113, (1'h0)};
  assign wire113 = wire110;
  assign wire114 = (|(-wire109));
  assign wire115 = {$signed(({(wire109 ?
                               wire112 : wire111)} >>> (~&(wire111 != wire113))))};
  assign wire116 = wire113;
  assign wire117 = {$unsigned($unsigned(wire115[(4'he):(4'he)])),
                       $unsigned(($unsigned((+wire109)) ?
                           $unsigned((wire111 ?
                               wire110 : wire114)) : wire116[(2'h3):(2'h3)]))};
endmodule

module module13
#(parameter param99 = ((((8'ha0) ^~ (8'ha7)) ? ((&(+(8'hb1))) || (8'ha5)) : (~((!(8'ha4)) ? ((8'ha8) ? (8'hb9) : (8'h9d)) : ((8'hb1) ? (8'hb8) : (8'h9e))))) << (~&((&{(7'h44)}) >= (((8'h9d) ? (8'h9d) : (8'ha8)) ? ((8'ha9) ^~ (8'ha6)) : (^(7'h44)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire98,
                 wire88,
                 wire86,
                 wire44,
                 wire38,
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
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire19 = $signed(wire15);
  assign wire20 = (+(+wire19));
  assign wire21 = wire16[(3'h6):(3'h6)];
  assign wire22 = (~^wire16);
  assign wire23 = wire17;
  assign wire24 = {($unsigned({{wire14, wire17},
                          {wire17}}) <= $signed($signed(wire15[(5'h11):(4'ha)])))};
  assign wire25 = ({(^((|wire15) ?
                          wire17 : $unsigned(wire22)))} & $signed(wire17));
  assign wire26 = $signed(($unsigned($unsigned((wire25 ?
                      (7'h44) : wire18))) - {({wire18} >= $signed((8'hb6)))}));
  assign wire27 = (((((-wire19) ? (wire14 ^ wire16) : $signed(wire19)) ?
                              ($signed(wire15) ?
                                  $signed(wire22) : wire21[(2'h2):(2'h2)]) : $unsigned(wire18[(3'h4):(3'h4)])) ?
                          wire15 : ($unsigned((wire15 ? wire25 : (8'hb1))) ?
                              $signed((&wire26)) : (8'ha6))) ?
                      $unsigned((^~(8'hbf))) : (wire16[(3'h7):(2'h3)] ?
                          (!(wire14[(4'ha):(2'h2)] ~^ (wire14 ?
                              wire22 : (8'ha7)))) : {wire19}));
  assign wire28 = ($unsigned(wire23[(4'hf):(4'h9)]) ?
                      $unsigned($signed($signed($unsigned(wire17)))) : $signed($signed((&(wire18 ?
                          wire17 : (8'h9c))))));
  assign wire29 = (~^(|($signed(wire24) > wire26)));
  always
    @(posedge clk) begin
      reg30 <= $signed((8'hb9));
      if ((&(~|(|(wire23 && {wire23})))))
        begin
          reg31 <= (wire24[(2'h3):(1'h0)] ?
              (wire16 * (^(wire15[(4'hb):(2'h2)] ?
                  wire28[(2'h2):(2'h2)] : (!wire14)))) : wire14);
          reg32 <= (&$signed(wire15));
          reg33 <= (!$signed((wire19[(1'h0):(1'h0)] ?
              $signed(reg30[(3'h5):(1'h0)]) : $unsigned({wire29}))));
        end
      else
        begin
          reg31 <= ($unsigned($signed(wire29)) < (~$signed(($unsigned(reg32) ?
              $signed(wire16) : reg33[(3'h7):(3'h5)]))));
          reg32 <= wire20[(3'h4):(2'h2)];
          if ({reg32[(3'h7):(3'h7)],
              $signed({($signed((8'ha4)) ?
                      (wire27 ? wire17 : wire17) : wire28)})})
            begin
              reg33 <= wire28;
              reg34 <= ((wire26 ?
                      $signed((wire29[(2'h3):(2'h2)] ?
                          {wire24,
                              wire19} : wire21[(1'h0):(1'h0)])) : (wire15[(4'ha):(4'ha)] + (-wire23))) ?
                  (!({(wire28 ? (8'haf) : wire27)} ?
                      (^$signed(wire22)) : $unsigned(wire14))) : $signed({$signed((~wire18))}));
              reg35 <= ((reg33 ?
                  ({(reg33 ? (8'ha7) : reg30), $signed(wire15)} ?
                      $unsigned((^~wire23)) : (~&(!reg30))) : wire14) <<< reg30[(4'hc):(4'ha)]);
              reg36 <= (~^reg35);
              reg37 <= (+reg34[(4'hc):(4'ha)]);
            end
          else
            begin
              reg33 <= (-((wire20[(1'h1):(1'h0)] ?
                      {(wire20 == (8'haf))} : reg35[(3'h4):(2'h3)]) ?
                  wire15[(4'hb):(3'h4)] : wire14[(1'h1):(1'h1)]));
              reg34 <= (^((wire25 ?
                      ((~&reg30) ? $unsigned(wire29) : (8'hbe)) : ({wire17,
                          wire20} == (reg35 ? wire26 : (8'hbd)))) ?
                  (|reg33[(4'h8):(3'h4)]) : $signed(($unsigned(wire19) ?
                      $unsigned((8'h9e)) : (^~reg30)))));
            end
        end
    end
  assign wire38 = $unsigned(wire26);
  always
    @(posedge clk) begin
      reg39 <= {$signed(reg31[(2'h3):(2'h3)])};
      reg40 <= (+reg36[(2'h2):(2'h2)]);
      reg41 <= (~^(wire28[(1'h0):(1'h0)] ? (+wire24) : wire27));
      reg42 <= (&($unsigned((^~(^~reg32))) ?
          ((((7'h41) ?
              wire22 : wire23) ^~ (~|wire16)) ~^ $unsigned((wire19 != reg39))) : (reg40[(3'h5):(3'h5)] | {((8'hb8) != wire21)})));
      reg43 <= reg40[(1'h1):(1'h0)];
    end
  assign wire44 = {(-$signed($unsigned(((8'hbe) ^~ wire14)))), (&reg41)};
  module45 #() modinst87 (.wire46(wire14), .clk(clk), .wire49(reg31), .y(wire86), .wire47(wire17), .wire48(reg36));
  assign wire88 = {(wire20 ?
                          (~&(wire19 ? (~|reg33) : (reg31 * wire15))) : wire26),
                      (wire20 ?
                          {((wire16 ? wire19 : reg43) ^ (reg42 ?
                                  reg43 : (8'hb8)))} : reg41)};
  always
    @(posedge clk) begin
      reg89 <= wire20[(2'h3):(2'h2)];
      if (((^~$unsigned(wire25)) ?
          (~^({(wire22 - wire27),
              (|wire44)} != (~&((8'ha8) > wire26)))) : $unsigned((8'ha9))))
        begin
          reg90 <= wire88[(2'h2):(1'h0)];
          reg91 <= ((wire23 ?
              $signed($signed($signed(reg37))) : ($signed($signed(reg37)) ?
                  $signed({reg40,
                      wire20}) : $signed($unsigned(reg40)))) == ((&{(reg39 ?
                  wire27 : reg37),
              (!wire21)}) == reg40));
          reg92 <= ((|reg34) ? reg42 : wire22[(4'h9):(4'h8)]);
        end
      else
        begin
          if ((^~wire86[(4'h8):(3'h7)]))
            begin
              reg90 <= $signed(wire44[(2'h2):(2'h2)]);
              reg91 <= wire23;
              reg92 <= (^~($unsigned((wire23 != (!wire14))) << reg39));
              reg93 <= $signed($unsigned(($signed($unsigned(reg35)) <<< ($unsigned((7'h42)) <<< reg89))));
              reg94 <= wire86;
            end
          else
            begin
              reg90 <= (8'hab);
            end
          reg95 <= (($signed($unsigned(reg41[(2'h2):(1'h0)])) != (8'hb4)) ?
              (~^{$signed((^~reg89)),
                  $unsigned(((7'h43) ?
                      wire19 : (8'hae)))}) : ((wire28 + $signed({reg39})) ~^ reg35[(3'h6):(1'h1)]));
        end
      reg96 <= (($unsigned((^(wire29 != wire26))) & (~|{wire86[(4'hf):(3'h5)],
          (8'h9e)})) == ((8'hbd) >>> wire23[(4'h9):(2'h2)]));
      reg97 <= (!$signed(((~&reg33) && $signed(((8'hb3) >> wire17)))));
    end
  assign wire98 = $signed(wire23);
endmodule

module module45  (y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire49;
  input wire [(2'h2):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire50;
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  assign y = {wire85,
                 wire56,
                 wire55,
                 wire50,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = (&((~((wire48 >>> wire49) >>> $signed(wire48))) ?
                      $signed(((wire48 <= wire46) > {wire48,
                          wire47})) : (8'hb3)));
  always
    @(posedge clk) begin
      reg51 <= ($unsigned((({(8'haa), (8'hb3)} ? (~wire48) : wire48) ?
              wire50[(3'h6):(1'h1)] : wire50)) ?
          (wire48 ?
              wire49[(1'h1):(1'h1)] : $signed((8'hba))) : $signed((+wire49[(1'h0):(1'h0)])));
      reg52 <= ($signed((~|(-(~(8'ha2))))) ?
          reg51[(2'h2):(2'h2)] : (wire46 >> ($unsigned($signed(wire49)) ?
              (wire50[(3'h5):(3'h4)] - {wire50}) : wire50[(3'h6):(2'h2)])));
      reg53 <= {$unsigned(reg51)};
      reg54 <= wire47;
    end
  assign wire55 = (wire50 ?
                      ($signed(reg54[(2'h2):(2'h2)]) ?
                          $unsigned((wire46[(1'h1):(1'h1)] ?
                              (reg52 ?
                                  reg54 : wire48) : reg54[(5'h12):(4'h8)])) : {wire50,
                              wire50}) : $unsigned($signed((&$unsigned(wire49)))));
  assign wire56 = wire47;
  always
    @(posedge clk) begin
      reg57 <= (8'hbc);
      if ((reg53 - (^~reg52[(1'h1):(1'h0)])))
        begin
          reg58 <= ($signed(wire55) & (^$unsigned($unsigned(reg51))));
          if ($unsigned(reg53))
            begin
              reg59 <= reg54[(2'h3):(2'h3)];
              reg60 <= ({(((reg57 << wire50) ? wire47[(2'h2):(1'h1)] : wire56) ?
                          (~|{wire48, wire50}) : wire46[(1'h1):(1'h1)])} ?
                  (reg58 >= $signed((wire55 <<< $signed(wire47)))) : (8'hbb));
              reg61 <= $unsigned((wire56[(3'h6):(3'h4)] ?
                  ($signed((!reg53)) ^ ({(8'hbc)} ?
                      (~|reg54) : $signed(wire50))) : wire46));
              reg62 <= $unsigned($unsigned({wire48[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg59 <= (~&wire49[(2'h3):(1'h0)]);
              reg60 <= reg53;
              reg61 <= ($unsigned($unsigned({$signed(reg59),
                  (wire48 || reg60)})) & reg51[(2'h2):(1'h0)]);
              reg62 <= ($unsigned(reg51[(4'h8):(3'h5)]) ?
                  $signed($unsigned(({wire48,
                      wire49} ^ reg57))) : wire56[(4'h8):(3'h7)]);
            end
          reg63 <= ($unsigned(($signed(((8'hbc) ^~ reg59)) ?
                  wire49[(3'h4):(3'h4)] : reg54[(5'h11):(4'h8)])) ?
              reg62[(2'h3):(2'h3)] : $signed(wire46));
        end
      else
        begin
          reg58 <= reg53[(4'hc):(4'hc)];
          reg59 <= (~|$unsigned(reg59));
          if ((!(((~^{(8'ha0)}) ?
              ((wire55 && wire46) ? $signed(reg54) : (~&reg57)) : {{wire56},
                  wire56[(3'h5):(2'h3)]}) <= ((^(~^reg60)) <<< $unsigned(reg53[(4'hc):(3'h7)])))))
            begin
              reg60 <= (wire55[(2'h3):(2'h2)] ?
                  wire56 : $signed((wire49[(1'h0):(1'h0)] ?
                      (wire46[(2'h3):(1'h1)] ?
                          (&wire47) : $signed(reg54)) : reg59[(4'hd):(4'hc)])));
              reg61 <= (^~$signed(((reg62[(3'h4):(2'h3)] >= wire48[(1'h1):(1'h0)]) + ({wire50} >>> ((8'ha8) && (7'h43))))));
              reg62 <= (~(reg61 ?
                  (reg53 ?
                      $unsigned((reg62 > reg58)) : ((reg62 << reg52) ?
                          wire49[(1'h1):(1'h1)] : {wire47})) : ({(reg58 ?
                          wire56 : (8'hbb)),
                      (~^wire46)} != $signed(reg57))));
              reg63 <= ($unsigned(wire50) != (wire49[(2'h3):(1'h0)] ?
                  reg51 : $signed(((reg63 ? wire56 : reg52) ?
                      (reg62 == reg60) : $signed(reg58)))));
            end
          else
            begin
              reg60 <= $signed(reg58[(3'h6):(1'h1)]);
              reg61 <= reg51;
              reg62 <= wire46;
              reg63 <= $unsigned((^(~|$signed($unsigned(reg52)))));
              reg64 <= $unsigned(reg61);
            end
          if ($signed($unsigned((&(8'hb2)))))
            begin
              reg65 <= $unsigned((&($signed($signed(reg51)) ?
                  (reg63[(4'h8):(3'h6)] ?
                      $signed(reg60) : $signed(reg52)) : (wire49 <<< $unsigned(wire49)))));
              reg66 <= {(reg60 ? reg58[(3'h7):(3'h7)] : reg61[(5'h10):(2'h3)]),
                  wire55};
              reg67 <= ($signed(reg57) < $signed($unsigned($signed(reg62[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg65 <= $signed(reg61);
              reg66 <= ($unsigned((reg51 > (~&((8'ha1) ?
                  reg58 : wire46)))) <= (^{$unsigned((&(8'hbc))),
                  (reg61[(5'h11):(4'hb)] >>> {reg67})}));
              reg67 <= $unsigned($unsigned(((reg65[(5'h12):(3'h7)] != (~&wire49)) ?
                  $unsigned((wire48 <= reg54)) : (&$signed(reg67)))));
              reg68 <= $signed((~&wire47));
            end
        end
      if ($signed($unsigned($signed(((wire46 << wire47) ?
          (wire55 << reg66) : (^reg63))))))
        begin
          reg69 <= (7'h43);
          reg70 <= (($signed(reg68[(3'h4):(1'h1)]) == $unsigned((((8'hbd) ?
                  reg53 : reg60) ^~ $signed(reg66)))) ?
              $signed((({(8'ha0), reg64} ?
                  (reg59 ?
                      reg67 : reg51) : {wire48}) > (8'hb5))) : $signed((wire56 ?
                  {(reg67 >= reg51),
                      (reg65 ? reg60 : (8'hb7))} : (~&(wire55 != (8'ha9))))));
          reg71 <= $signed(({(8'hab), $signed((reg69 ? reg61 : reg64))} ?
              (reg66[(2'h2):(2'h2)] && $signed(reg63)) : $signed(($unsigned(reg70) ?
                  wire50[(2'h3):(1'h1)] : (reg53 >>> reg58)))));
          reg72 <= ((wire48 >> (((-reg51) ~^ (~|reg58)) ?
              $signed((wire46 ?
                  reg68 : reg69)) : $signed(reg53[(4'hd):(1'h1)]))) + (wire49 ?
              ({(8'ha5),
                  $unsigned(reg52)} & $signed($unsigned(reg53))) : reg51));
        end
      else
        begin
          reg69 <= (({(reg66[(1'h0):(1'h0)] & $unsigned(reg72))} ?
              $signed(reg52[(3'h4):(2'h2)]) : (~reg61)) ~^ reg63[(3'h7):(3'h5)]);
          reg70 <= (+$unsigned(reg70));
          if (reg59[(4'hb):(2'h3)])
            begin
              reg71 <= $unsigned($unsigned(reg68));
              reg72 <= $unsigned(reg62[(2'h2):(1'h1)]);
              reg73 <= (!(($signed((reg61 ^~ wire50)) ?
                  (((8'had) | reg51) ? reg59 : reg63) : reg53) & reg71));
              reg74 <= (+(reg72[(1'h0):(1'h0)] ~^ reg66[(2'h3):(2'h2)]));
            end
          else
            begin
              reg71 <= ((reg60 && (-(^~reg72))) ?
                  reg59 : (reg66 < reg58[(2'h3):(1'h0)]));
            end
          if ((((!(wire48 + (reg57 ? reg68 : wire48))) ?
              (reg68 < reg53) : (reg57 > ((~reg51) ?
                  $signed(reg61) : reg71[(1'h0):(1'h0)]))) >= (({(~|reg70),
                  {wire56, reg67}} >> $signed(reg64[(3'h4):(2'h2)])) ?
              (wire46 ? {{(8'ha7), reg52}} : (-$signed(reg70))) : wire49)))
            begin
              reg75 <= (!{$unsigned(((^~reg67) ?
                      (reg65 >>> reg73) : $signed(reg57))),
                  (reg53 ? wire46 : $unsigned(reg60[(5'h12):(4'hf)]))});
              reg76 <= {$signed((8'hbc)), wire50[(5'h12):(4'hd)]};
            end
          else
            begin
              reg75 <= (|$signed((!$signed($signed(reg68)))));
              reg76 <= $unsigned(($signed($signed(wire56[(3'h5):(3'h4)])) | reg70));
              reg77 <= $signed({reg75[(1'h0):(1'h0)], reg58});
              reg78 <= (7'h41);
            end
        end
      if ((wire47 << $unsigned((&(~&$unsigned((8'ha3)))))))
        begin
          if (($unsigned(($signed(reg62[(3'h5):(1'h0)]) ?
                  (7'h44) : $unsigned((!wire46)))) ?
              (($signed((^~wire50)) ?
                  (reg52[(1'h0):(1'h0)] >= (!reg62)) : $unsigned($signed(wire48))) >> reg78) : (!{wire46[(4'ha):(1'h1)]})))
            begin
              reg79 <= (reg78[(1'h1):(1'h1)] <= $signed($signed(($unsigned(reg58) << (^~reg66)))));
            end
          else
            begin
              reg79 <= (reg53 <<< (~&$unsigned(reg64)));
              reg80 <= (8'hab);
              reg81 <= $unsigned(reg57[(1'h0):(1'h0)]);
            end
          reg82 <= $unsigned((^(reg57 <= ($signed(reg81) ^ (wire55 + wire50)))));
          reg83 <= reg71;
        end
      else
        begin
          reg79 <= ((~^reg51[(1'h1):(1'h1)]) ?
              $signed((reg77[(2'h3):(1'h1)] ?
                  $signed((reg77 ?
                      reg52 : reg58)) : $signed(reg52[(2'h2):(1'h1)]))) : (((((8'hb0) ?
                          wire49 : reg72) ?
                      $signed(wire46) : $unsigned(reg78)) ?
                  ($signed(reg66) ? (reg73 ? reg61 : reg77) : reg65) : ((reg79 ?
                          reg79 : reg71) ?
                      (reg65 || reg74) : wire55[(1'h0):(1'h0)])) | $signed($signed((&reg54)))));
          reg80 <= ({($signed($unsigned(wire56)) ?
                      $signed(reg67) : $signed($signed((8'hb6))))} ?
              $signed(reg52) : $unsigned(($unsigned((!reg60)) ?
                  $signed($unsigned(reg58)) : (~|(reg57 <<< reg83)))));
          reg81 <= wire49;
          reg82 <= ($signed($unsigned(((|reg63) ?
                  reg54[(4'hf):(4'h9)] : (reg79 ? reg81 : reg62)))) ?
              wire56[(3'h5):(1'h1)] : (|$unsigned($unsigned($unsigned(wire46)))));
          reg83 <= reg70[(3'h4):(2'h3)];
        end
      reg84 <= $signed(reg80);
    end
  assign wire85 = $unsigned({reg81, (~^{$unsigned(reg76)})});
endmodule

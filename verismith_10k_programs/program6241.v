module top
#(parameter param171 = ((~^(8'ha8)) ? (({(8'ha3), {(7'h41)}} | {((7'h40) ? (8'h9c) : (8'ha2))}) ? (^~((~|(8'ha5)) ? {(7'h42), (8'ha7)} : ((8'h9f) ^~ (8'hb6)))) : {(8'hac), (~^(|(8'hb4)))}) : ((((|(8'ha3)) | ((8'hbc) > (8'hb9))) <= ({(7'h41), (7'h41)} ? ((8'had) ? (8'had) : (8'h9d)) : {(8'ha3), (7'h40)})) ? (({(8'hb3)} * ((8'ha6) ? (7'h40) : (8'ha8))) ? (((8'ha2) ? (8'hb7) : (8'hba)) ? ((7'h40) ? (8'ha6) : (8'haf)) : {(8'h9c)}) : (+((8'hb7) ^ (8'ha7)))) : (((7'h44) < ((8'hab) | (8'hab))) << (((8'hbc) << (8'ha2)) ? {(8'hbe)} : ((8'h9c) ? (8'ha4) : (8'ha0)))))), 
parameter param172 = param171)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire170;
  wire signed [(4'hb):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(2'h3):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire166;
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire162,
                 wire160,
                 wire106,
                 wire102,
                 wire5,
                 wire4,
                 wire164,
                 wire165,
                 wire166,
                 reg104,
                 reg105,
                 reg107,
                 reg108,
                 (1'h0)};
  assign wire4 = {(wire0 != $unsigned($unsigned((-wire1))))};
  assign wire5 = ((^~$signed(($unsigned(wire1) ?
                         wire4[(4'hc):(4'h8)] : wire1))) ?
                     $signed((~|wire2[(3'h6):(2'h3)])) : wire0);
  module6 #() modinst103 (wire102, clk, wire5, wire0, wire4, wire2);
  always
    @(posedge clk) begin
      reg104 <= $signed(({($signed(wire5) <<< $unsigned(wire2))} ?
          $signed(wire0[(4'hd):(1'h0)]) : ((wire0[(4'hf):(4'h8)] ?
              $unsigned(wire2) : $signed(wire2)) >> $signed(wire0[(3'h6):(3'h6)]))));
      reg105 <= (~$signed(wire2[(4'h9):(3'h6)]));
    end
  assign wire106 = (~|(reg105[(4'hf):(4'hd)] != ((~^(~(8'hbe))) ?
                       $signed(wire1) : (wire0 ?
                           ((8'ha3) != reg104) : reg104[(2'h2):(1'h0)]))));
  always
    @(posedge clk) begin
      reg107 <= $signed(($signed({wire106, $unsigned(wire102)}) ?
          (((^wire106) ? ((8'hac) ? wire0 : wire102) : (wire3 && wire106)) ?
              $signed((wire1 || wire4)) : wire0) : wire1));
      reg108 <= $unsigned((&$signed($unsigned(reg105))));
    end
  module109 #() modinst161 (wire160, clk, reg105, wire3, wire1, reg107, reg108);
  module109 #() modinst163 (.y(wire162), .wire112(reg107), .wire113(wire3), .clk(clk), .wire111(reg105), .wire110(wire160), .wire114(wire102));
  assign wire164 = (((wire2[(1'h0):(1'h0)] - (~^wire106)) ?
                       ((wire0 ?
                           {(7'h40),
                               wire0} : $unsigned(wire106)) >> $signed((^wire5))) : wire5) <<< reg107);
  assign wire165 = wire106;
  module15 #() modinst167 (wire166, clk, wire3, wire5, reg104, wire102, reg105);
  assign wire168 = (reg105[(1'h0):(1'h0)] << $unsigned(wire166[(1'h0):(1'h0)]));
  assign wire169 = (^{{reg105[(4'ha):(1'h1)]},
                       $unsigned({(!(8'ha5)), wire102[(4'h8):(3'h4)]})});
  assign wire170 = (wire164 ?
                       $signed($signed($unsigned((reg104 <<< reg108)))) : (&(reg105 <= (^wire2))));
endmodule

module module109
#(parameter param158 = {((+((^(8'hbf)) ? (~|(8'ha8)) : (^~(8'hb2)))) ? (((8'hae) + ((8'ha9) ? (8'had) : (7'h44))) >= ({(8'hbd)} ^~ ((8'ha8) & (8'hb2)))) : (~&{((8'hbd) + (8'hb6))})), (((((8'hbd) < (8'ha0)) ? ((8'hbe) && (8'ha9)) : ((8'haf) ? (8'hbc) : (7'h40))) ? (((8'hb9) <<< (8'ha3)) != (&(8'hb6))) : (^~(&(8'hb3)))) ? ((((7'h44) >>> (8'hab)) ? ((7'h40) ? (8'h9e) : (8'hae)) : (~(8'hb7))) ? (7'h44) : ({(8'hb3)} ? {(8'hb7), (8'hb6)} : ((8'hac) >= (8'hb2)))) : ((~|{(8'hb9)}) ? ((~^(8'hbf)) ? ((7'h41) - (8'h9c)) : {(8'hbf), (7'h44)}) : {((7'h42) || (8'hbb)), ((8'ha2) ? (8'hb5) : (7'h41))}))}, 
parameter param159 = (((8'hbf) ? (&((7'h42) && param158)) : ((+{param158}) <<< ((param158 ? param158 : param158) ? (param158 ? (7'h42) : param158) : (param158 <= param158)))) ? param158 : (7'h40)))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire114;
  input wire signed [(4'h9):(1'h0)] wire113;
  input wire [(4'hd):(1'h0)] wire112;
  input wire signed [(4'hd):(1'h0)] wire111;
  input wire [(2'h3):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire156;
  wire [(2'h2):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire [(4'hb):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(2'h3):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire141;
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((|$unsigned((~{(wire110 ? wire112 : wire110), (^~wire113)}))))
        begin
          if ($signed(((wire110 || ($unsigned(wire113) ?
                  (8'hbc) : (wire111 != wire111))) ?
              ((wire110[(1'h1):(1'h0)] ?
                      wire111[(4'hc):(3'h4)] : {wire111, wire114}) ?
                  $signed(wire112) : wire113) : wire113)))
            begin
              reg115 <= ($unsigned((|wire112)) ^ wire112);
            end
          else
            begin
              reg115 <= wire111;
            end
          if (wire114[(1'h0):(1'h0)])
            begin
              reg116 <= $unsigned($signed((8'haa)));
            end
          else
            begin
              reg116 <= (((wire112 ?
                          $signed(reg115[(3'h4):(2'h3)]) : {wire114}) ?
                      (~{reg116,
                          $signed(reg116)}) : $signed((wire113[(3'h6):(1'h1)] ?
                          $signed((8'ha4)) : reg115[(4'h9):(1'h0)]))) ?
                  (&(^((wire111 ? wire114 : wire110) ?
                      $signed((8'hac)) : $unsigned(wire114)))) : (^~$unsigned(reg116)));
              reg117 <= ($unsigned(wire112[(1'h0):(1'h0)]) + reg115[(3'h6):(2'h3)]);
              reg118 <= ((~$unsigned((+((8'ha1) ?
                  wire113 : wire111)))) << ($signed({reg116,
                  (wire112 ?
                      (8'had) : wire111)}) | (~$signed(wire113[(3'h4):(1'h1)]))));
              reg119 <= $unsigned((-reg117));
              reg120 <= $signed((-$signed((8'hab))));
            end
          reg121 <= (+$unsigned((~|(^(~|reg119)))));
        end
      else
        begin
          reg115 <= $unsigned((+$unsigned($unsigned((&reg116)))));
          if (wire110)
            begin
              reg116 <= ($unsigned({$signed($signed(wire111)),
                      ((reg121 >= wire110) ?
                          $unsigned(wire111) : wire111[(3'h4):(2'h3)])}) ?
                  ((((reg118 ?
                          reg117 : wire111) == $unsigned(reg119)) <= (reg115[(2'h2):(2'h2)] ?
                          $signed(reg119) : (reg121 <<< wire114))) ?
                      (((!reg118) && (~reg115)) ?
                          $signed(reg116) : (~|$unsigned((8'hb5)))) : (^~wire111[(4'h9):(1'h0)])) : reg120);
              reg117 <= ((($unsigned((wire113 & reg118)) ?
                          (^(&reg119)) : $signed(reg118)) ?
                      reg121[(2'h2):(1'h1)] : ((reg119[(3'h5):(2'h2)] << $unsigned((8'hbe))) & ({wire110,
                          (8'hae)} < $signed(reg115)))) ?
                  (reg115 == wire113[(2'h2):(1'h1)]) : $unsigned($unsigned({(~|reg117),
                      (reg115 ? reg120 : reg119)})));
              reg118 <= reg121[(2'h2):(2'h2)];
              reg119 <= (reg120[(5'h10):(4'hc)] ?
                  $signed(($signed((~^(8'haf))) - reg118)) : {wire112[(1'h0):(1'h0)]});
            end
          else
            begin
              reg116 <= (-wire112);
              reg117 <= ((8'hba) ^ wire110[(1'h0):(1'h0)]);
              reg118 <= ($unsigned((($signed((8'ha5)) & $unsigned(wire110)) ?
                  $signed({wire114}) : (8'ha2))) >> ($unsigned(($signed(wire111) ?
                  (+reg120) : (+(7'h42)))) | (($signed(wire114) ^~ (8'hab)) == reg119)));
              reg119 <= (((8'hb9) ?
                      reg117 : {(reg116 ? (8'haf) : wire112[(3'h4):(1'h1)])}) ?
                  ((wire110[(1'h0):(1'h0)] ?
                      wire111[(1'h1):(1'h0)] : reg121) >> $unsigned(reg120[(2'h3):(1'h0)])) : {$unsigned((wire114[(1'h0):(1'h0)] && $signed(reg118)))});
              reg120 <= wire111[(4'ha):(4'h8)];
            end
          reg121 <= $signed($unsigned((($signed(reg115) ?
              (wire114 ?
                  reg116 : wire111) : {wire113}) << wire111[(4'h8):(1'h0)])));
          if ((reg117[(3'h6):(3'h4)] ? (~reg115) : reg118[(1'h1):(1'h1)]))
            begin
              reg122 <= reg121;
              reg123 <= {(wire111 == wire110)};
            end
          else
            begin
              reg122 <= ($unsigned((wire113[(1'h0):(1'h0)] ?
                  ($unsigned((8'hbb)) - (reg118 ?
                      reg122 : reg122)) : $signed(wire110))) ^~ reg122[(4'h9):(2'h2)]);
              reg123 <= ($signed(((~wire111) ^~ {reg120[(1'h1):(1'h1)]})) << $unsigned(wire112[(4'h8):(3'h7)]));
              reg124 <= reg121[(1'h1):(1'h1)];
              reg125 <= $unsigned((-reg119));
              reg126 <= (($signed((((8'hb8) <<< reg125) ~^ (reg120 ?
                  wire112 : wire110))) ^~ reg116) > reg120);
            end
        end
      reg127 <= ((&((-$unsigned(wire110)) << {$signed(reg123)})) - $signed((~^reg124)));
      if ($signed((~($signed(reg115) ?
          ({reg121, reg117} ? reg126 : {(8'ha7), reg124}) : ((reg123 ?
              wire110 : reg117) * ((8'h9e) - (8'hb4)))))))
        begin
          reg128 <= {$unsigned($unsigned(((reg119 ?
                  reg125 : reg122) > (wire112 ~^ reg125))))};
        end
      else
        begin
          reg128 <= ($unsigned(reg126) ?
              {reg121,
                  $unsigned($unsigned((-reg117)))} : $unsigned((((|reg117) ?
                  wire110[(2'h3):(2'h3)] : $unsigned(reg127)) == ((~^wire111) ?
                  $unsigned(reg117) : $unsigned((8'hb7))))));
          reg129 <= $unsigned(wire114);
          if (reg115)
            begin
              reg130 <= reg119;
              reg131 <= $unsigned(($signed(wire110) ?
                  reg125 : $unsigned({(8'h9f)})));
              reg132 <= $unsigned($signed($signed($signed($signed(reg119)))));
              reg133 <= reg117;
            end
          else
            begin
              reg130 <= $signed(reg116[(3'h5):(2'h2)]);
              reg131 <= {(~&wire113[(2'h3):(1'h1)]),
                  ((&reg123) && ($unsigned($signed(reg121)) - reg133))};
              reg132 <= $unsigned(reg122);
            end
        end
      if (reg121[(1'h1):(1'h0)])
        begin
          reg134 <= (|($unsigned(reg117[(5'h15):(2'h2)]) && $unsigned(reg123[(1'h0):(1'h0)])));
        end
      else
        begin
          reg134 <= reg131;
          reg135 <= reg131[(1'h1):(1'h0)];
          reg136 <= reg119[(3'h7):(1'h1)];
        end
      if (reg117[(2'h3):(2'h3)])
        begin
          reg137 <= (reg129[(1'h0):(1'h0)] ?
              (+(-(~reg125))) : ({$unsigned((~^reg118))} < ((^{(8'ha4),
                  reg126}) ^~ ((^reg118) ? {wire113, reg132} : (!reg117)))));
          reg138 <= {(~&{((reg118 * reg134) + ((7'h40) ? reg128 : wire110)),
                  {(reg122 >= reg119), reg122}}),
              {reg115[(3'h5):(1'h1)],
                  ((~|$unsigned(reg133)) - (reg130[(3'h6):(3'h6)] - reg119[(4'h9):(2'h3)]))}};
        end
      else
        begin
          reg137 <= reg137;
          reg138 <= (^~reg133[(4'hf):(3'h7)]);
          reg139 <= (|reg115);
          reg140 <= (reg139[(4'hf):(1'h1)] >> (~&$signed(reg122)));
        end
    end
  assign wire141 = $unsigned(($unsigned((-(^reg128))) ?
                       reg136[(4'h9):(2'h3)] : ($unsigned($signed(reg116)) ?
                           $unsigned((^~reg131)) : $unsigned((-wire114)))));
  assign wire142 = ($unsigned($unsigned((&(&reg120)))) ?
                       $unsigned(reg139[(4'h8):(4'h8)]) : (^~$unsigned(reg129)));
  assign wire143 = reg115[(3'h6):(1'h1)];
  assign wire144 = {reg136[(2'h3):(2'h2)]};
  assign wire145 = $signed({(~&{reg134[(1'h1):(1'h1)], reg119}),
                       (reg125[(2'h3):(2'h2)] | (+(^reg115)))});
  assign wire146 = ((reg140[(4'h9):(3'h5)] ?
                       {((|wire145) ?
                               reg134[(1'h1):(1'h0)] : $unsigned(reg122)),
                           ({reg123, wire114} ?
                               $unsigned(reg121) : $signed(reg119))} : wire114[(1'h1):(1'h0)]) >= ((+reg137) ?
                       $signed($unsigned((-reg128))) : (&$signed(reg132[(4'hd):(4'ha)]))));
  assign wire147 = {wire146,
                       ($signed($unsigned($unsigned(wire111))) ?
                           {$unsigned($unsigned(reg135)),
                               ((^~reg125) ?
                                   reg123[(3'h5):(1'h1)] : (8'hb7))} : (^~reg137))};
  assign wire148 = $signed((-$signed(reg131)));
  assign wire149 = (($signed((~&(reg118 ? reg134 : wire142))) && ({(8'ha2),
                       $signed(reg135)} == reg121)) || wire148[(4'h9):(1'h1)]);
  assign wire150 = wire110[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ((($signed((|reg137[(1'h0):(1'h0)])) ?
              ($unsigned({wire143,
                  (8'hb8)}) & $signed((wire113 && reg118))) : ($unsigned((~&wire111)) ?
                  reg118[(5'h13):(4'h8)] : $signed({reg119}))) ?
          (wire112 || reg138) : ($signed($unsigned(((8'ha2) ?
              reg122 : wire150))) << (|$unsigned((~wire147))))))
        begin
          reg151 <= wire111[(2'h2):(1'h0)];
        end
      else
        begin
          reg151 <= wire142;
          reg152 <= (reg151 >> $unsigned($unsigned((^wire112[(3'h5):(2'h2)]))));
          reg153 <= $signed(((wire150 & reg139) ?
              ($signed((wire150 && wire145)) ^~ $signed(reg131[(4'h8):(3'h7)])) : {wire111[(1'h0):(1'h0)],
                  ((wire143 >>> reg151) & wire142[(4'h9):(1'h1)])}));
          reg154 <= ($unsigned(reg131) ?
              ((^~((reg123 || reg119) ?
                      (reg130 ? wire141 : (7'h44)) : wire111[(2'h2):(1'h1)])) ?
                  ((8'hb4) ?
                      $unsigned($unsigned(reg120)) : $unsigned($signed(wire148))) : reg132[(4'h9):(4'h8)]) : {reg139[(4'hc):(3'h6)]});
          reg155 <= reg152[(2'h2):(1'h1)];
        end
    end
  assign wire156 = ((((8'haf) >> ((8'ha7) <<< (reg137 ?
                       wire148 : reg129))) << (~^(!{(7'h42),
                       wire141}))) >>> {($signed((8'ha3)) >> $signed($unsigned(reg131))),
                       $unsigned(reg122[(4'h9):(3'h6)])});
  assign wire157 = reg136;
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire95;
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire59,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire67,
                 wire79,
                 wire95,
                 reg97,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire11 = wire7;
  assign wire12 = $unsigned($unsigned(((8'hbb) - (-(wire7 <<< wire11)))));
  assign wire13 = (~&((wire12[(3'h6):(1'h1)] ?
                      (wire9 ^~ $unsigned(wire11)) : (~^$signed(wire8))) && wire8[(2'h2):(1'h1)]));
  assign wire14 = wire8[(1'h0):(1'h0)];
  module15 #() modinst60 (wire59, clk, wire7, wire11, wire8, wire12, wire14);
  assign wire61 = ($unsigned((({wire7, wire14} >> {wire12}) ?
                      $unsigned($unsigned((8'ha0))) : $unsigned((wire7 ?
                          wire12 : (8'hb0))))) << ((+({wire11} | ((8'hb7) | wire13))) ~^ ($unsigned($signed(wire59)) ?
                      ((^(8'haa)) ?
                          (wire7 && (8'hab)) : wire13) : wire8[(1'h1):(1'h1)])));
  assign wire62 = {{{$signed((wire7 < wire61))},
                          (((-wire8) ?
                              wire14[(4'h8):(3'h5)] : (~&wire8)) + (&(!(8'h9f))))},
                      $unsigned({wire7[(4'h8):(3'h5)], wire14})};
  assign wire63 = (($unsigned(wire62) ?
                      $signed(wire7[(4'h9):(1'h0)]) : (wire12 ?
                          wire14[(5'h12):(4'he)] : (+(~^wire8)))) > wire62);
  assign wire64 = $signed((~^($unsigned(wire8[(1'h1):(1'h1)]) || ((!(8'h9f)) ?
                      wire62 : $signed(wire61)))));
  always
    @(posedge clk) begin
      reg65 <= wire13;
      reg66 <= $signed($unsigned($unsigned(((+(8'hae)) ?
          (wire14 > wire12) : (7'h44)))));
    end
  assign wire67 = $signed(wire9);
  module68 #() modinst80 (wire79, clk, wire12, wire67, wire64, wire13);
  module81 #() modinst96 (wire95, clk, reg65, wire63, wire79, wire9);
  always
    @(posedge clk) begin
      reg97 <= ($unsigned(($unsigned(wire61[(1'h0):(1'h0)]) ?
              ($signed(wire9) ?
                  $signed(reg66) : wire7[(4'h9):(3'h6)]) : $unsigned({reg65}))) ?
          wire67 : wire59[(5'h10):(4'h8)]);
    end
  assign wire98 = $unsigned(wire13[(3'h7):(2'h2)]);
  assign wire99 = (wire63[(1'h1):(1'h1)] * wire95[(4'h9):(3'h5)]);
  assign wire100 = wire8[(4'h9):(4'h8)];
  assign wire101 = $unsigned((wire100 ?
                       $unsigned(wire14) : $signed($unsigned((8'haf)))));
endmodule

module module81
#(parameter param94 = {(~^{{{(8'hb1), (8'ha1)}}, (!((8'hb2) ? (8'hbe) : (8'ha4)))}), (((^~((8'hbf) >> (8'hb6))) <= (&{(8'hb3), (8'h9c)})) - ((|(|(8'hbd))) ? ((8'hba) ? (^(8'h9d)) : (~&(7'h40))) : (&{(8'ha1)})))})
(y, clk, wire85, wire84, wire83, wire82);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire signed [(2'h3):(1'h0)] wire83;
  input wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 (1'h0)};
  assign wire86 = wire82;
  assign wire87 = (^~(&wire85[(1'h1):(1'h0)]));
  assign wire88 = wire83[(2'h2):(1'h0)];
  assign wire89 = $unsigned((((^$signed(wire82)) ?
                          $signed((wire88 ?
                              wire87 : (8'ha7))) : (!$signed(wire82))) ?
                      (|(^wire86[(3'h4):(1'h1)])) : $signed(wire83[(1'h1):(1'h1)])));
  assign wire90 = wire85;
  assign wire91 = $unsigned($unsigned(wire90));
  assign wire92 = $unsigned((~&($signed((wire90 - wire90)) ?
                      (wire86[(2'h2):(1'h1)] <<< wire91) : $unsigned(((8'ha8) ?
                          wire85 : wire85)))));
  assign wire93 = wire88;
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire72;
  input wire [(5'h10):(1'h0)] wire71;
  input wire [(5'h11):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  assign y = {wire78, wire77, wire76, wire75, wire74, wire73, (1'h0)};
  assign wire73 = ((!$unsigned(($signed(wire70) && wire69))) ~^ (wire72[(4'hf):(4'ha)] << $signed((-wire72[(4'ha):(4'h9)]))));
  assign wire74 = (((^$signed(((8'h9c) ?
                          (8'hbb) : (8'ha6)))) && (~&wire70[(1'h0):(1'h0)])) ?
                      {{((wire69 + wire69) + wire71[(3'h6):(3'h5)]),
                              ((wire73 ? wire70 : wire70) ?
                                  (&wire73) : wire73)}} : ($unsigned($signed((wire72 * wire73))) + ((-wire71) ?
                          wire69[(3'h4):(1'h1)] : (!((8'hbd) ?
                              wire70 : wire69)))));
  assign wire75 = $signed($unsigned((-(wire73 ?
                      wire72[(4'he):(3'h6)] : (~&(8'ha7))))));
  assign wire76 = $unsigned($unsigned((~&(wire69 ? wire70 : wire69))));
  assign wire77 = (&((&wire73[(2'h2):(1'h0)]) ?
                      wire76 : ($signed((wire71 ?
                          wire69 : wire76)) || {wire72[(5'h10):(4'h8)],
                          (^wire74)})));
  assign wire78 = wire77;
endmodule

module module15
#(parameter param57 = ((~(^~(~{(8'ha8), (8'h9d)}))) >>> (({((8'hb8) ~^ (8'ha4)), ((8'h9d) ~^ (8'ha2))} ? (&((8'ha6) * (8'hbf))) : (8'hbc)) ? (~{((8'hbb) >= (8'hab)), ((8'haa) >>> (8'hb0))}) : ((((8'hb3) ? (8'ha2) : (8'h9f)) <= (&(8'ha1))) ? (-((7'h44) ^~ (7'h44))) : {((7'h40) ? (8'hb2) : (8'ha1))}))), 
parameter param58 = (({(|(~^param57)), param57} ? ((param57 ? (param57 < param57) : (param57 ? (7'h41) : param57)) < (((8'ha2) ? param57 : param57) ? (param57 && (7'h42)) : param57)) : {param57, ((param57 ^ param57) <= param57)}) > (((^~param57) ? {param57} : (+(^param57))) ^ param57)))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 reg56,
                 reg55,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((-(((^wire18) - $unsigned(wire20)) ?
          wire18[(2'h2):(1'h0)] : wire16[(3'h5):(3'h5)]))))
        begin
          reg21 <= ({((~wire17) >>> $signed(wire20[(1'h0):(1'h0)])),
                  (((wire18 ?
                      (8'haa) : wire19) - wire17) ^~ (wire16[(3'h5):(2'h2)] ?
                      (wire18 ? wire16 : wire17) : (wire18 ?
                          wire20 : wire20)))} ?
              ((($signed(wire16) ? {wire17, (7'h44)} : $unsigned(wire16)) ?
                  ((wire19 ?
                      (8'hbc) : wire16) >= wire19) : wire16) ~^ $unsigned(wire19[(4'ha):(2'h3)])) : wire20);
          reg22 <= ({((~|wire17[(1'h0):(1'h0)]) - wire17)} >> (^~$signed(wire20)));
          reg23 <= $unsigned($signed(wire18));
          reg24 <= ($unsigned((~&reg23)) > $signed($unsigned({(&reg23),
              wire16[(4'h9):(2'h2)]})));
        end
      else
        begin
          reg21 <= wire18;
          reg22 <= $unsigned(($signed(wire17[(1'h1):(1'h1)]) ?
              $unsigned({(8'h9c), reg21}) : $unsigned((~|(wire16 ?
                  reg21 : wire18)))));
          if ((reg24[(2'h3):(1'h1)] <= (($unsigned({reg22}) ?
                  (wire19[(1'h0):(1'h0)] >> (8'hab)) : wire18[(3'h5):(1'h0)]) ?
              $unsigned($unsigned(((8'ha4) ?
                  (8'ha4) : reg23))) : ((~$unsigned(wire18)) - ($unsigned(wire17) <= ((8'hb0) ?
                  reg24 : reg21))))))
            begin
              reg23 <= $unsigned(($unsigned(((reg23 ?
                  wire19 : (8'hb4)) - $signed(reg24))) == (-reg21[(3'h6):(3'h6)])));
              reg24 <= (~|(!reg23[(4'ha):(1'h0)]));
              reg25 <= $unsigned((((!wire18) ?
                      (^(reg21 ^ wire20)) : ((reg23 <<< wire17) >> {wire19})) ?
                  $unsigned(reg21) : ((~((8'hbe) ? wire20 : wire17)) ?
                      reg24 : $unsigned((reg23 ? reg24 : reg24)))));
              reg26 <= (wire20 && {{reg21},
                  (((wire17 * wire17) >>> {reg25,
                      reg24}) == wire17[(1'h1):(1'h0)])});
            end
          else
            begin
              reg23 <= wire20[(1'h1):(1'h1)];
              reg24 <= {((-((~^(8'ha0)) >= $unsigned(reg22))) < $signed((wire20[(3'h5):(1'h0)] > (!reg25))))};
              reg25 <= $unsigned(reg25);
            end
          reg27 <= $signed(($signed({(~&wire20), $unsigned(reg23)}) ?
              reg21[(1'h1):(1'h1)] : $unsigned(($signed(wire16) ?
                  (~wire16) : $signed(reg21)))));
          if (((8'ha9) ?
              reg23 : ($unsigned($signed((reg22 < wire20))) ?
                  wire16 : $signed(reg27[(2'h3):(1'h0)]))))
            begin
              reg28 <= reg27;
              reg29 <= $signed(wire16[(4'hb):(4'hb)]);
              reg30 <= reg21;
              reg31 <= (wire16 >>> ($unsigned({((8'hb2) <= reg28),
                      reg21[(3'h4):(2'h3)]}) ?
                  $signed(((+reg26) << (!wire16))) : $signed($unsigned((reg29 ?
                      (8'h9d) : reg27)))));
            end
          else
            begin
              reg28 <= $unsigned({{$unsigned($signed(reg31))}});
              reg29 <= wire17[(2'h2):(2'h2)];
              reg30 <= {wire17[(2'h2):(1'h0)]};
            end
        end
      if ($signed(reg24))
        begin
          reg32 <= reg31[(2'h2):(1'h0)];
          if ({(|$signed(wire20))})
            begin
              reg33 <= wire18[(4'ha):(4'h8)];
              reg34 <= ((|reg25[(3'h5):(2'h3)]) ?
                  (^(((!reg24) ?
                      $unsigned(wire19) : (reg25 == reg27)) <<< (reg31 ?
                      (reg22 + wire19) : reg23[(3'h6):(2'h3)]))) : ((((wire20 ?
                              (8'hae) : wire20) * $unsigned(reg30)) ?
                          $signed(reg27) : (!(wire20 << reg31))) ?
                      ($signed((wire16 << (8'ha7))) <<< $unsigned(((8'h9c) ?
                          (8'ha0) : (8'h9e)))) : ($unsigned($unsigned(wire16)) <<< $signed((~|reg27)))));
              reg35 <= ((^~reg28[(3'h6):(3'h5)]) != $signed(reg26[(3'h6):(3'h4)]));
              reg36 <= reg35[(5'h10):(5'h10)];
              reg37 <= reg31[(2'h2):(1'h1)];
            end
          else
            begin
              reg33 <= wire20;
              reg34 <= $unsigned({{(reg30[(1'h1):(1'h1)] ?
                          ((8'hb5) ? reg29 : wire16) : reg36),
                      $unsigned($unsigned(reg33))}});
              reg35 <= (~|({$unsigned($unsigned(wire16)),
                  (reg31[(3'h7):(1'h0)] * reg36[(4'hd):(4'h9)])} || wire20[(2'h2):(1'h1)]));
              reg36 <= {(^~reg27)};
            end
          if (reg34[(3'h7):(2'h2)])
            begin
              reg38 <= {$unsigned(wire17), reg21};
            end
          else
            begin
              reg38 <= ((wire16 > {$unsigned(((8'ha6) ? reg37 : reg31)),
                  (wire19 & reg36)}) | reg24[(4'ha):(1'h0)]);
            end
          reg39 <= $unsigned(reg35);
        end
      else
        begin
          reg32 <= ((reg36 < (^~reg35)) ?
              (reg35 ?
                  $signed(reg24) : {(wire17 ?
                          $unsigned(wire17) : {wire17, (8'ha0)}),
                      wire20}) : reg36[(2'h2):(1'h0)]);
          reg33 <= $signed((~&(~(((8'ha2) ? reg27 : (7'h43)) ?
              $unsigned(reg21) : ((8'hb7) ? reg28 : reg21)))));
          reg34 <= $unsigned(((~(8'hb2)) <= {((reg23 ? wire16 : reg24) ?
                  reg36[(3'h5):(3'h4)] : {reg23, reg28}),
              {$signed((8'h9c))}}));
          if (({$signed({reg36[(4'ha):(3'h7)], ((8'h9d) << reg23)})} && wire16))
            begin
              reg35 <= reg22;
              reg36 <= $unsigned({{reg35[(5'h15):(4'h9)],
                      {(reg38 ^~ reg39), $signed(reg26)}}});
              reg37 <= wire20[(1'h0):(1'h0)];
              reg38 <= $unsigned($unsigned(((reg38[(3'h7):(3'h6)] <= $signed(reg31)) <<< $unsigned($unsigned(reg29)))));
            end
          else
            begin
              reg35 <= $unsigned($signed($signed(reg26)));
              reg36 <= reg23[(5'h11):(4'h8)];
              reg37 <= $unsigned((|{$unsigned($signed(reg38))}));
              reg38 <= (~|(!reg34[(3'h5):(3'h5)]));
              reg39 <= $signed((((wire16 ?
                      reg23[(3'h4):(2'h2)] : {wire19, reg24}) ?
                  (reg38[(4'h8):(1'h1)] ? (|reg31) : (|reg33)) : ((~|reg39) ?
                      (reg38 ? reg21 : (8'hb9)) : $signed(reg28))) ^ wire20));
            end
          reg40 <= (reg22 ?
              (reg23 ? reg24 : {reg25}) : $signed((+reg21[(4'hd):(3'h5)])));
        end
      reg41 <= (reg36[(2'h3):(1'h1)] ?
          $unsigned($signed($unsigned($signed(reg36)))) : $signed($signed(reg38)));
    end
  always
    @(posedge clk) begin
      if ((&$signed($unsigned($signed(reg21[(4'hd):(4'hc)])))))
        begin
          reg42 <= reg31;
          reg43 <= $signed(wire18[(4'hb):(4'h9)]);
        end
      else
        begin
          reg42 <= reg29[(4'hc):(4'h9)];
          reg43 <= {$unsigned(reg21)};
        end
      reg44 <= reg32[(3'h4):(2'h2)];
      if ($unsigned($unsigned((({reg41} & ((8'ha6) ?
          wire16 : reg28)) == reg33))))
        begin
          reg45 <= (+((8'hbc) ?
              reg32 : (reg37 ?
                  (+reg38[(4'hb):(3'h4)]) : $unsigned(((8'h9d) >= reg21)))));
          reg46 <= ($unsigned(reg31) <<< $signed(($unsigned({reg21, reg37}) ?
              $signed($signed((8'hb6))) : {$unsigned(reg33)})));
          if ($unsigned(((^$signed(reg41)) == $unsigned($unsigned((reg29 < reg21))))))
            begin
              reg47 <= {wire20,
                  ($unsigned((8'hbe)) ?
                      $signed((7'h40)) : $unsigned(reg33[(3'h7):(3'h6)]))};
              reg48 <= (($unsigned({(^reg41)}) ?
                      $unsigned({(reg31 ?
                              reg38 : reg45)}) : {(((8'hbf) >= reg35) + $signed(reg31)),
                          $unsigned((~^reg43))}) ?
                  $signed((~^$signed({wire18}))) : $unsigned(($unsigned(wire18) ?
                      $unsigned(((8'hb4) ?
                          reg32 : reg30)) : $unsigned((reg25 >> reg43)))));
              reg49 <= $unsigned((+($signed({(8'ha0)}) == reg40[(4'h9):(1'h1)])));
              reg50 <= (~^{(8'hbc), $unsigned(reg25)});
            end
          else
            begin
              reg47 <= reg34;
              reg48 <= (|((reg26 ?
                      $signed({reg23}) : $unsigned($signed(reg43))) ?
                  (reg27 < reg30[(2'h2):(1'h0)]) : $signed($unsigned(reg29[(4'hf):(4'hc)]))));
              reg49 <= $unsigned(reg34[(4'h9):(2'h2)]);
              reg50 <= reg22[(4'hd):(2'h3)];
              reg51 <= (((!reg39[(4'h8):(1'h0)]) ?
                  $signed($signed(wire19)) : wire19[(4'hc):(3'h6)]) << (-$signed($unsigned(reg47))));
            end
        end
      else
        begin
          reg45 <= (^~(((+reg39) ?
              $signed(((8'had) ? reg36 : wire18)) : {reg38[(4'hb):(3'h4)],
                  reg24}) >= (7'h43)));
          reg46 <= (reg40 ?
              reg47 : $signed((($unsigned(reg38) ?
                      (reg34 ? reg34 : reg43) : (8'haa)) ?
                  $unsigned($signed((8'h9f))) : $signed(reg47[(4'h9):(4'h8)]))));
          if (((8'ha6) ?
              ((~&reg37[(2'h3):(2'h3)]) ?
                  $unsigned($signed(reg32[(4'he):(3'h5)])) : $unsigned((reg28[(3'h5):(2'h2)] > $unsigned((8'hbc))))) : ({{$signed(reg23)},
                      $signed((reg32 >>> reg28))} ?
                  $unsigned($signed($unsigned(reg32))) : {((8'h9d) | $unsigned(reg30))})))
            begin
              reg47 <= (~(7'h41));
              reg48 <= $signed(reg33);
              reg49 <= $unsigned(reg25);
              reg50 <= reg38[(4'hd):(3'h4)];
            end
          else
            begin
              reg47 <= reg23[(4'hb):(2'h3)];
              reg48 <= reg22;
              reg49 <= {reg22, $signed($unsigned(reg41[(1'h1):(1'h0)]))};
            end
          reg51 <= ((reg25 << reg49[(1'h0):(1'h0)]) <= ($unsigned($signed($unsigned(reg39))) && $signed($unsigned({reg51}))));
        end
    end
  assign wire52 = reg33[(1'h0):(1'h0)];
  assign wire53 = $signed((~^(~^$unsigned(((8'hb4) << wire19)))));
  assign wire54 = reg47[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      if (((wire17 != $unsigned({(^reg42), reg51})) ?
          wire19 : (reg23 ?
              {(~|(reg25 ? reg34 : reg44)),
                  ((reg50 ?
                      reg35 : reg47) ~^ $unsigned((8'had)))} : ((~&reg42[(2'h3):(1'h0)]) > ((~&reg32) >>> ((8'hbb) ?
                  reg32 : (8'ha5)))))))
        begin
          reg55 <= $signed({$signed(reg35), reg45[(1'h0):(1'h0)]});
        end
      else
        begin
          reg55 <= {reg46,
              (wire53[(2'h2):(1'h0)] >> (~&($unsigned(reg49) ?
                  (|(8'hb5)) : $unsigned(reg46))))};
          reg56 <= reg41[(1'h0):(1'h0)];
        end
    end
endmodule

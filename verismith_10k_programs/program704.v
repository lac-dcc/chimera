module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire163;
  wire signed [(4'h8):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire156;
  wire signed [(4'h8):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire154;
  reg signed [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire159,
                 wire158,
                 wire156,
                 wire4,
                 wire6,
                 wire7,
                 wire8,
                 wire154,
                 reg161,
                 reg160,
                 reg5,
                 (1'h0)};
  assign wire4 = $signed(($unsigned($signed($unsigned(wire3))) == $signed(wire1[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg5 <= {(~(wire3[(2'h3):(2'h3)] ?
              $unsigned(wire4[(1'h0):(1'h0)]) : wire4))};
    end
  assign wire6 = $signed($signed((($unsigned((7'h44)) ?
                     {wire0,
                         wire1} : (8'haf)) != $unsigned(wire0[(4'he):(4'hb)]))));
  assign wire7 = {(!reg5), $signed(reg5)};
  assign wire8 = (($signed($signed((wire6 != (8'hab)))) & wire1) ?
                     (|(^~$signed((wire4 ?
                         reg5 : wire6)))) : $signed(((~|(wire3 >> wire3)) >= ($signed(wire7) ?
                         {wire7, wire7} : {(8'h9e), (8'ha4)}))));
  module9 #() modinst155 (wire154, clk, wire3, wire7, wire0, wire8, wire6);
  module49 #() modinst157 (wire156, clk, wire2, wire0, wire1, wire7);
  assign wire158 = (+$signed(wire156[(3'h4):(2'h3)]));
  assign wire159 = $signed(($signed(wire1) - $signed($signed((wire8 ?
                       wire7 : wire2)))));
  always
    @(posedge clk) begin
      reg160 <= $signed($signed($signed($signed((~wire156)))));
      reg161 <= (^((wire1[(2'h2):(2'h2)] < (reg160[(4'h9):(3'h4)] ?
              $unsigned(wire3) : wire8)) ?
          (wire8 ?
              ({wire156, wire156} ?
                  $unsigned(wire154) : (wire8 - wire2)) : wire8[(4'hd):(2'h2)]) : $unsigned((^$signed(wire4)))));
    end
  assign wire162 = wire7;
  assign wire163 = wire159;
  assign wire164 = (($unsigned((wire4[(3'h7):(3'h4)] | (wire156 ?
                               wire156 : (8'hb3)))) ?
                           wire8[(3'h7):(3'h5)] : $unsigned(wire156)) ?
                       (|wire156) : wire0);
endmodule

module module9
#(parameter param153 = (&(8'had)))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire150;
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  assign y = {wire152, wire106, wire79, wire47, wire77, wire150, reg15, (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= {(((~((8'h9e) >> wire11)) ?
              (wire11[(2'h2):(2'h2)] ?
                  wire14[(1'h1):(1'h0)] : (~wire11)) : (^~$signed(wire12))) || ($unsigned((7'h44)) ?
              wire12[(4'ha):(3'h4)] : wire12)),
          $unsigned(wire10)};
    end
  module16 #() modinst48 (wire47, clk, wire13, wire11, wire14, wire12);
  module49 #() modinst78 (.clk(clk), .wire53(reg15), .y(wire77), .wire51(wire14), .wire50(wire12), .wire52(wire11));
  assign wire79 = $unsigned($unsigned((~|wire12)));
  module80 #() modinst107 (.clk(clk), .y(wire106), .wire83(wire77), .wire81(wire14), .wire84(reg15), .wire82(wire12));
  module108 #() modinst151 (wire150, clk, wire13, wire77, wire79, wire47, wire14);
  assign wire152 = (^(8'haf));
endmodule

module module108
#(parameter param149 = ({{(&((8'hbd) ^~ (8'hb7))), (~(7'h40))}} ? (({{(7'h42), (8'h9d)}} | (+((8'haa) == (8'h9d)))) == ((~^{(8'hb2)}) <<< (((8'ha5) && (8'haf)) ? ((8'ha0) + (8'h9f)) : ((8'ha4) >> (8'hb8))))) : ((((8'ha5) | ((8'hab) >>> (8'hb9))) || {((8'hab) != (8'hbd))}) >= {(((8'ha6) ? (8'h9f) : (8'hbb)) + ((8'hb6) ? (8'h9c) : (8'ha4)))})))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire113;
  input wire [(5'h10):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  input wire signed [(3'h5):(1'h0)] wire110;
  input wire signed [(4'he):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire145;
  wire [(3'h4):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire138,
                 wire120,
                 wire119,
                 wire118,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
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
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg114 <= wire112;
      reg115 <= (wire112 ?
          ($unsigned($signed((~reg114))) ?
              ((wire110 != (wire112 ? wire109 : (7'h43))) ?
                  $signed({wire109,
                      (8'hb9)}) : $signed($signed(wire110))) : $unsigned($signed({wire111,
                  (8'ha7)}))) : $signed(wire110[(1'h0):(1'h0)]));
      reg116 <= {$unsigned($unsigned(wire112))};
      reg117 <= $signed((~|$unsigned(((reg116 ^ (8'hb9)) ?
          reg114[(3'h5):(2'h3)] : (!reg116)))));
    end
  assign wire118 = wire112[(3'h6):(2'h3)];
  assign wire119 = $unsigned((wire118[(3'h5):(3'h4)] ?
                       $signed((~(reg116 || wire110))) : ((~((8'hae) ?
                           wire110 : wire118)) >>> (^((8'ha9) >>> wire109)))));
  assign wire120 = ($unsigned($unsigned($signed(reg114))) * (8'ha6));
  always
    @(posedge clk) begin
      reg121 <= $signed(reg116[(4'h9):(4'h8)]);
      if ((((8'h9c) ?
              ($signed(((8'hb2) ? wire120 : (8'hab))) ?
                  reg116 : reg114) : ((8'hab) ?
                  ($unsigned(reg115) ?
                      (|wire118) : (~^(7'h44))) : (|wire113[(1'h1):(1'h1)]))) ?
          $signed(reg117[(5'h12):(5'h11)]) : {(((wire111 ?
                  wire111 : wire113) * (!wire113)) & wire118[(5'h13):(4'hb)]),
              (~^(-{(8'hac)}))}))
        begin
          if ((^wire113[(2'h2):(1'h1)]))
            begin
              reg122 <= {$unsigned({{{reg117, wire119},
                          (reg116 ? reg117 : wire119)},
                      (^(wire119 | wire111))}),
                  $signed((!reg116[(1'h1):(1'h0)]))};
              reg123 <= $signed((8'hb1));
            end
          else
            begin
              reg122 <= wire112;
              reg123 <= ($signed((^~$signed($unsigned(reg115)))) >= ({$signed((wire119 ?
                      wire110 : wire119))} == reg115[(1'h1):(1'h1)]));
              reg124 <= wire113[(2'h2):(1'h0)];
              reg125 <= $signed($unsigned($signed($signed((reg121 >>> reg115)))));
              reg126 <= ((+$unsigned($unsigned((wire118 ?
                      (8'ha4) : wire110)))) ?
                  (($signed(wire112) || $signed((reg122 ? reg122 : wire109))) ?
                      $unsigned($signed((^reg116))) : {(^reg117[(4'ha):(3'h7)])}) : reg124[(3'h5):(2'h3)]);
            end
          reg127 <= ((&reg126[(1'h1):(1'h0)]) || $signed(reg124[(3'h4):(2'h3)]));
          reg128 <= ((+((reg121 || ((8'ha0) ? reg126 : (8'hbb))) ?
              ((reg124 << (8'hb1)) ?
                  wire113[(1'h1):(1'h1)] : ((7'h43) != (8'hb7))) : reg117)) * (wire110 - (-(!reg124))));
        end
      else
        begin
          reg122 <= (^~{reg122[(4'hd):(4'h8)]});
          if ((^~reg115))
            begin
              reg123 <= (~((~|reg115) >>> (~&(7'h43))));
              reg124 <= (wire118 ?
                  ($signed(wire113[(1'h0):(1'h0)]) != (((-reg124) ~^ (~(8'had))) <<< ((^~reg125) ?
                      wire109 : $unsigned(reg127)))) : $unsigned(reg123[(4'h9):(1'h1)]));
              reg125 <= $signed((wire118 & reg124[(1'h0):(1'h0)]));
            end
          else
            begin
              reg123 <= reg127[(4'ha):(4'h9)];
              reg124 <= $unsigned($signed(wire111));
              reg125 <= ((~&(|((wire119 ?
                  wire113 : reg116) ~^ $signed(reg121)))) - (((^$signed((8'ha4))) || (|(+reg116))) ?
                  $unsigned($unsigned($unsigned((8'ha3)))) : $unsigned($unsigned(((8'h9f) ?
                      reg123 : (8'hac))))));
              reg126 <= ({$unsigned((~^(!(7'h42))))} ?
                  reg127 : (($unsigned((reg126 ? wire119 : wire109)) ?
                      (reg121[(2'h2):(1'h1)] ?
                          (~wire113) : (reg128 ?
                              reg122 : reg126)) : reg115[(1'h0):(1'h0)]) >>> (~|(!(reg128 ?
                      (8'hb7) : reg125)))));
            end
          reg127 <= reg128;
          reg128 <= (~&$signed(wire119));
          reg129 <= reg124[(2'h2):(1'h1)];
        end
      if ((~((^$unsigned((~^reg124))) ?
          (((~&reg128) ?
              $unsigned(wire109) : $unsigned(reg116)) != $unsigned(reg114)) : {(~&$unsigned(reg115))})))
        begin
          reg130 <= (!(wire118[(4'hf):(3'h7)] | ($signed($signed(reg116)) ?
              (reg114[(2'h2):(1'h1)] | $signed(reg124)) : (-$unsigned((8'h9f))))));
          if ((&(reg121 ?
              $signed({((8'haa) ~^ wire111),
                  {wire111, reg117}}) : ((~(reg125 | reg124)) >> {((8'haf) ?
                      reg129 : wire119),
                  reg123[(2'h3):(1'h0)]}))))
            begin
              reg131 <= ((~^($unsigned(reg115) * $unsigned((&(8'h9d))))) ?
                  $unsigned((wire111 ?
                      ((reg129 <= (8'h9f)) & $signed(wire118)) : reg121[(4'hc):(3'h4)])) : ({$unsigned(reg126),
                          $unsigned($unsigned(wire110))} ?
                      $signed(wire109[(3'h4):(1'h0)]) : $signed(reg127)));
              reg132 <= ($signed((reg127[(4'hd):(1'h0)] & $unsigned($signed(wire109)))) ?
                  wire110[(2'h2):(1'h0)] : reg124);
              reg133 <= reg114;
              reg134 <= (7'h40);
              reg135 <= {$unsigned($signed(wire118[(4'hf):(3'h4)])), reg122};
            end
          else
            begin
              reg131 <= $unsigned(((^(~&$signed((8'haa)))) == reg115[(3'h5):(2'h2)]));
              reg132 <= $unsigned((-($signed(wire109[(1'h1):(1'h1)]) <= $unsigned($signed(reg121)))));
            end
          reg136 <= (~^(+$unsigned(((|reg114) + {(8'hbd)}))));
          reg137 <= (reg116 != (!$unsigned({(&reg128)})));
        end
      else
        begin
          reg130 <= ((reg129[(3'h6):(3'h4)] ? reg129 : reg126) < reg130);
          if ($signed((reg114[(1'h0):(1'h0)] ?
              $signed(reg121) : $unsigned($signed((reg122 ?
                  reg129 : reg135))))))
            begin
              reg131 <= $unsigned((($signed((wire111 ?
                  reg137 : wire113)) ~^ $unsigned((wire120 ?
                  wire119 : reg130))) && {$signed(reg128)}));
            end
          else
            begin
              reg131 <= (wire110[(3'h4):(3'h4)] <= ((&(|$unsigned(wire109))) && reg117));
              reg132 <= (~|$unsigned((wire112[(2'h2):(1'h0)] & $signed({reg117,
                  wire118}))));
            end
          if ($signed($signed($unsigned({{(8'ha4)}}))))
            begin
              reg133 <= wire109[(4'hb):(3'h7)];
              reg134 <= $signed($signed(reg129));
              reg135 <= reg121;
            end
          else
            begin
              reg133 <= $unsigned(reg131[(1'h0):(1'h0)]);
              reg134 <= $unsigned($unsigned((((reg130 ?
                  reg130 : wire112) > (wire120 <= (7'h40))) << (~|(reg134 ?
                  wire120 : reg129)))));
            end
        end
    end
  assign wire138 = reg137;
  always
    @(posedge clk) begin
      reg139 <= $signed(reg129[(5'h15):(5'h13)]);
      reg140 <= {(~^reg125[(1'h0):(1'h0)]), reg125[(1'h0):(1'h0)]};
      reg141 <= (!$unsigned(($unsigned(reg122) ?
          ($signed(reg131) == $unsigned(reg123)) : reg131[(4'hd):(4'hc)])));
      reg142 <= $signed(wire113);
    end
  assign wire143 = {reg127[(4'h8):(3'h5)],
                       ($signed({(reg127 + wire138)}) ?
                           (((reg121 ? reg124 : reg134) ?
                                   reg137 : $signed(reg126)) ?
                               ($unsigned(wire112) ?
                                   $unsigned(reg133) : reg125[(1'h1):(1'h0)]) : reg141) : reg121[(2'h3):(2'h3)])};
  assign wire144 = (({(~&(~&(7'h43))), (+{(7'h44), reg141})} ?
                       {{(wire109 ? reg139 : reg137),
                               $signed(reg123)}} : ({$signed((7'h44)),
                           $signed(reg133)} - ($signed((8'ha0)) < (~&reg114)))) >> $unsigned((~&$signed((reg140 ?
                       reg129 : reg128)))));
  assign wire145 = $unsigned($signed(reg134[(3'h7):(3'h7)]));
  assign wire146 = $signed(($signed(($signed(wire138) ?
                           wire143[(2'h3):(2'h3)] : $unsigned(wire143))) ?
                       {wire110,
                           $signed(reg134[(4'hd):(4'h9)])} : ($unsigned(reg141) & ((reg114 ?
                           reg127 : wire113) <<< reg141))));
  assign wire147 = ((~|$signed(((wire143 + (7'h42)) ?
                           (wire110 ? reg139 : reg130) : $unsigned(wire120)))) ?
                       wire144[(2'h2):(1'h0)] : reg135[(1'h1):(1'h0)]);
  assign wire148 = {((((wire145 ^~ (8'ha6)) ?
                           reg116[(2'h2):(2'h2)] : $unsigned(reg128)) - $unsigned((&(8'ha9)))) * (!((wire112 ?
                           reg122 : reg133) == {wire120, reg123})))};
endmodule

module module80  (y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire84;
  input wire [(2'h2):(1'h0)] wire83;
  input wire [(5'h10):(1'h0)] wire82;
  input wire [(5'h13):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire99,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg102,
                 reg101,
                 reg100,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= $unsigned($signed((wire81[(4'he):(3'h7)] >>> $signed(wire83[(1'h0):(1'h0)]))));
      reg86 <= wire81[(4'he):(4'ha)];
      reg87 <= ({{(wire84[(3'h6):(1'h1)] >>> {wire83, reg86})},
              ((~&$signed((8'hba))) ?
                  (8'ha8) : {(wire82 < wire81), {wire81, reg86}})} ?
          $signed($unsigned(wire83[(1'h0):(1'h0)])) : ($unsigned(wire81[(4'h9):(3'h5)]) ?
              wire83 : $signed((8'ha6))));
    end
  assign wire88 = ((wire81 == wire84) < ((!$signed((wire84 ?
                      (8'hb7) : wire83))) == ($signed($unsigned(wire81)) < (reg85 ^ $signed(wire84)))));
  assign wire89 = reg85;
  assign wire90 = $unsigned(reg87[(4'hc):(4'h9)]);
  assign wire91 = wire82[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      if (wire90)
        begin
          reg92 <= reg86;
          if (((^$signed($unsigned(((8'hb9) ? wire90 : wire91)))) ?
              (^{wire90, (-$unsigned(wire91))}) : $unsigned((^~({wire88,
                      wire89} ?
                  {wire89, wire83} : $unsigned(reg86))))))
            begin
              reg93 <= (~^$signed(wire81));
              reg94 <= reg85[(4'ha):(4'h9)];
              reg95 <= $signed($unsigned((($unsigned(reg93) >>> $signed(wire90)) ~^ ((wire83 | wire91) ?
                  (wire91 && wire84) : $signed(wire81)))));
              reg96 <= (((&((reg94 ? wire82 : reg92) ^~ $unsigned(wire89))) ?
                      $signed((~(reg87 & reg85))) : (($unsigned((8'ha2)) >= (-wire90)) > wire89[(1'h0):(1'h0)])) ?
                  ($unsigned(wire91[(4'h8):(3'h4)]) ~^ (wire81 ?
                      {(wire88 << reg86),
                          (|wire84)} : (^(reg85 && wire84)))) : $signed(wire84));
            end
          else
            begin
              reg93 <= $unsigned($unsigned(wire81[(4'h9):(3'h7)]));
              reg94 <= ((({wire81[(1'h1):(1'h0)]} ?
                          {$signed(wire84), wire90} : (|$unsigned((7'h44)))) ?
                      (wire89[(4'ha):(3'h4)] ?
                          (!{(8'hbc)}) : reg86) : $unsigned(($signed(reg87) ?
                          $signed(wire84) : $signed(reg92)))) ?
                  (-$unsigned(((+wire91) ~^ (reg94 || wire81)))) : $signed(reg86[(3'h7):(3'h7)]));
              reg95 <= (^~wire91[(3'h5):(1'h0)]);
              reg96 <= $signed({$signed(reg87[(2'h2):(1'h0)]),
                  wire91[(4'hc):(4'hb)]});
              reg97 <= reg96;
            end
          reg98 <= ((((8'h9e) ?
              (wire90[(4'h9):(4'h8)] || (wire84 ?
                  reg92 : wire90)) : reg95[(3'h6):(3'h4)]) > reg96) + $signed((^($signed(wire81) ~^ wire82[(4'he):(4'hd)]))));
        end
      else
        begin
          reg92 <= wire83;
        end
    end
  assign wire99 = ((~(reg86 * ((+wire88) ?
                          $signed(wire89) : wire91[(3'h6):(3'h4)]))) ?
                      $signed((!({wire82, wire88} ?
                          (reg98 > wire89) : (wire91 ^~ wire90)))) : $signed($signed((wire91 && $unsigned(reg98)))));
  always
    @(posedge clk) begin
      reg100 <= (($unsigned($unsigned((~reg97))) ?
              ($unsigned((!(8'haf))) ?
                  ($signed(wire84) >> reg92) : (8'hbc)) : wire99) ?
          (((reg85[(2'h2):(1'h1)] > (reg85 << reg93)) >>> ((wire82 == wire82) ?
              {wire82,
                  wire90} : reg85)) != (wire83 != ((8'hbb) << {wire99}))) : ($unsigned({(wire81 ?
                      wire82 : wire91),
                  $signed(reg85)}) ?
              wire84 : $unsigned($signed($signed(reg92)))));
      reg101 <= {$unsigned({(8'h9f)})};
      reg102 <= reg97[(3'h5):(2'h2)];
    end
  assign wire103 = $signed(reg93[(3'h4):(2'h3)]);
  assign wire104 = (8'hbb);
  assign wire105 = (wire81[(4'hd):(3'h6)] ?
                       $signed(wire99) : ((!$signed($unsigned(wire81))) <= (8'had)));
endmodule

module module49
#(parameter param76 = (8'hab))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire53;
  input wire signed [(4'hb):(1'h0)] wire52;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg72,
                 reg65,
                 (1'h0)};
  assign wire54 = (&({wire53, wire51[(3'h6):(2'h2)]} ?
                      $signed(($signed(wire50) * (wire50 ?
                          wire50 : wire51))) : (~(((8'had) >>> wire52) ?
                          (wire50 ? wire51 : wire50) : $unsigned(wire51)))));
  assign wire55 = $signed((wire52[(4'h8):(2'h2)] ?
                      (~|wire51[(4'hf):(2'h2)]) : $unsigned($signed(wire54[(2'h3):(1'h1)]))));
  assign wire56 = wire51[(5'h13):(5'h11)];
  assign wire57 = wire52[(4'h9):(4'h8)];
  assign wire58 = (wire50[(4'ha):(1'h1)] <<< wire57[(5'h10):(5'h10)]);
  assign wire59 = ((wire55[(1'h1):(1'h0)] ^~ wire54[(4'hc):(4'hc)]) ?
                      (&(wire51[(5'h13):(4'h8)] ?
                          (-{wire56}) : $unsigned($unsigned(wire51)))) : (wire57 ?
                          (($unsigned(wire50) ?
                              (wire53 ?
                                  wire55 : wire50) : (-wire57)) >= (-wire52[(4'ha):(4'h9)])) : $signed($unsigned((8'ha0)))));
  assign wire60 = ($signed({{{wire55}},
                      (^wire50)}) == ({wire56[(4'ha):(3'h5)]} & {($signed(wire54) <<< $unsigned(wire50))}));
  assign wire61 = $unsigned(wire57);
  assign wire62 = wire52[(3'h7):(2'h2)];
  assign wire63 = $signed((((!wire55[(1'h1):(1'h0)]) != (~&wire52)) ?
                      ($signed(((8'hac) >>> wire57)) & wire62) : $unsigned(($unsigned((7'h40)) != $signed(wire55)))));
  assign wire64 = $unsigned(wire59);
  always
    @(posedge clk) begin
      reg65 <= wire59;
    end
  assign wire66 = (&$signed((^~$unsigned((wire60 ? wire51 : (8'ha5))))));
  assign wire67 = $signed($unsigned(wire57));
  assign wire68 = $unsigned((wire52 >> wire53[(4'h8):(3'h5)]));
  assign wire69 = ($signed(((wire63[(4'hc):(2'h2)] + wire53[(5'h11):(1'h0)]) ?
                          ($unsigned(wire63) ?
                              (&wire52) : wire62) : $unsigned(wire68))) ?
                      $unsigned((~&wire68[(4'hd):(4'h9)])) : $unsigned((&(~&$unsigned(wire63)))));
  assign wire70 = wire63[(4'h8):(2'h3)];
  assign wire71 = (~|(|$unsigned((^~$signed((8'hbc))))));
  always
    @(posedge clk) begin
      reg72 <= wire69;
    end
  assign wire73 = wire71;
  assign wire74 = (wire54[(4'hc):(4'hb)] ?
                      $signed($signed({(reg72 ? wire59 : (8'hba)),
                          {wire71,
                              (8'ha8)}})) : (-$unsigned(wire58[(1'h0):(1'h0)])));
  assign wire75 = ($signed((~(~wire59[(3'h6):(3'h4)]))) ?
                      wire53 : $signed({wire56[(4'ha):(3'h5)]}));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire23,
                 wire22,
                 wire21,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 (1'h0)};
  assign wire21 = (($unsigned(((wire20 ?
                      wire17 : wire17) | ((7'h44) && wire18))) | $signed((-wire18[(1'h0):(1'h0)]))) | (!$unsigned(((^wire18) << (wire20 ?
                      wire18 : wire18)))));
  assign wire22 = $unsigned($unsigned($signed((&wire18))));
  assign wire23 = $signed((-wire19));
  always
    @(posedge clk) begin
      if ((wire23 ?
          $signed((~&wire21[(4'ha):(3'h6)])) : (!wire20[(4'hc):(1'h1)])))
        begin
          reg24 <= ((((^~wire17) > ($unsigned((8'haf)) <<< (8'hb1))) ?
                  $signed((wire19 || $unsigned(wire21))) : ((8'hb4) ?
                      ($unsigned(wire20) ?
                          (wire17 ^~ wire22) : ((8'haf) ^~ wire22)) : ((wire17 != wire20) + $signed((8'hab))))) ?
              (^(wire17[(2'h2):(2'h2)] ?
                  (wire23[(1'h0):(1'h0)] != wire23[(2'h2):(1'h0)]) : $signed((wire19 < wire21)))) : $signed({{(-wire20)}}));
        end
      else
        begin
          reg24 <= $signed($signed($unsigned(wire18[(2'h2):(1'h1)])));
          reg25 <= (~^wire17);
          reg26 <= {wire22[(1'h0):(1'h0)], {$unsigned({reg24[(4'he):(4'ha)]})}};
          if ((8'hb0))
            begin
              reg27 <= wire23[(1'h1):(1'h0)];
              reg28 <= $unsigned(((^~$unsigned({(7'h42), (8'ha3)})) ^ (7'h44)));
              reg29 <= $unsigned(reg24);
              reg30 <= (({wire18[(5'h13):(3'h4)],
                      wire23[(2'h3):(1'h1)]} == ($unsigned((reg28 ?
                          wire19 : wire22)) ?
                      $unsigned(wire18[(4'h8):(3'h7)]) : ((~^wire23) <<< (wire17 ?
                          reg26 : reg26)))) ?
                  $signed((~^({(8'hb4), reg27} ?
                      reg28[(1'h1):(1'h0)] : (wire17 ?
                          reg25 : wire21)))) : {{(reg26 ^ $signed((8'hb8)))}});
              reg31 <= $signed($signed(wire21[(4'hb):(3'h6)]));
            end
          else
            begin
              reg27 <= reg24;
              reg28 <= $signed($signed(({(wire21 ? reg24 : reg29)} ?
                  wire20[(3'h5):(3'h5)] : ($signed(reg29) ?
                      wire20[(4'hc):(4'hb)] : (~|reg24)))));
              reg29 <= wire21;
              reg30 <= ((~^$unsigned((reg28 && wire22[(5'h10):(5'h10)]))) && $unsigned((($unsigned(reg28) >>> reg30[(3'h4):(1'h1)]) ?
                  ($signed(wire22) <<< reg30[(1'h1):(1'h1)]) : (reg27[(2'h3):(1'h1)] ?
                      $signed(wire18) : $unsigned(wire22)))));
            end
        end
      reg32 <= ($unsigned((~^(~|wire17[(3'h6):(1'h1)]))) * reg28[(1'h0):(1'h0)]);
      reg33 <= reg32[(4'h9):(4'h8)];
      if ((~^(reg31 + $unsigned(wire20[(4'ha):(1'h0)]))))
        begin
          reg34 <= reg33[(3'h6):(2'h2)];
          reg35 <= (^~reg33);
        end
      else
        begin
          if ($signed(reg30[(2'h2):(1'h0)]))
            begin
              reg34 <= ({wire19} > ((reg33 | wire20[(4'h8):(3'h6)]) ^ (reg33 ?
                  reg26 : wire17)));
              reg35 <= (-((reg25 >= $unsigned((wire23 ~^ wire23))) ^~ ($signed((8'hbb)) ?
                  (((8'ha5) ? reg26 : reg30) && {reg32,
                      (8'ha8)}) : (~^(~^(8'hbe))))));
            end
          else
            begin
              reg34 <= (~|reg35[(1'h1):(1'h0)]);
              reg35 <= (|{$unsigned(($unsigned(wire18) != $signed(wire18)))});
            end
          reg36 <= $signed(($signed($signed((reg25 >> reg28))) >= $signed((wire18[(5'h11):(4'hc)] ?
              ((7'h41) && reg34) : (&wire21)))));
        end
      reg37 <= ((&(-reg24[(4'hc):(1'h0)])) ?
          $signed(((8'ha5) >> (~^{reg25,
              reg27}))) : ($signed((wire22[(4'hd):(3'h5)] >> wire17)) ?
              (((wire18 && wire17) ?
                  (reg29 ?
                      reg27 : wire22) : reg29[(3'h4):(2'h3)]) >= (reg31[(4'he):(3'h4)] ?
                  (reg24 ? reg33 : reg31) : (8'ha1))) : wire18));
    end
  assign wire38 = reg28;
  assign wire39 = $unsigned(reg24[(5'h10):(3'h7)]);
  assign wire40 = {$signed(wire38), wire17};
  assign wire41 = (8'had);
  always
    @(posedge clk) begin
      reg42 <= (+wire18);
      reg43 <= (reg34[(3'h6):(2'h2)] ? reg34[(4'hf):(3'h6)] : (-(~reg26)));
      if (reg35)
        begin
          reg44 <= ($signed($signed($signed((wire40 ?
              reg25 : reg27)))) >>> reg42[(1'h0):(1'h0)]);
          reg45 <= $unsigned((~^$unsigned(($signed(reg37) << ((8'ha0) <= reg37)))));
          reg46 <= reg28[(4'h8):(3'h6)];
        end
      else
        begin
          reg44 <= reg44;
          reg45 <= (reg46[(2'h3):(1'h0)] ?
              (^(($unsigned(reg35) > (wire17 ?
                  reg36 : (8'hbd))) <= ($unsigned(reg44) ?
                  reg45 : $unsigned(wire23)))) : ($signed((~(-reg44))) && wire39));
        end
    end
endmodule

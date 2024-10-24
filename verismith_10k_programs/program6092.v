module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire171;
  assign y = {wire175, wire174, wire173, wire5, wire171, (1'h0)};
  assign wire5 = (wire4 ? wire0 : $unsigned(wire0));
  module6 #() modinst172 (.clk(clk), .wire8(wire1), .wire7(wire2), .wire10(wire0), .y(wire171), .wire11(wire5), .wire9(wire4));
  assign wire173 = $signed((wire4 ?
                       ($signed((+(8'hb2))) ?
                           $signed((~&wire171)) : $signed({wire1})) : wire2[(3'h4):(1'h1)]));
  assign wire174 = (wire3 + $unsigned(({(~^wire2), $unsigned(wire4)} - wire3)));
  assign wire175 = wire171;
endmodule

module module6
#(parameter param170 = ((+((((8'ha5) ? (7'h41) : (8'hb5)) | ((7'h41) ? (8'hae) : (8'h9d))) ^~ ({(8'hbf), (8'ha3)} & {(8'ha6)}))) ? (((((8'hb5) ? (8'ha4) : (8'haa)) ~^ (&(8'h9f))) >= ({(8'ha1), (8'hba)} >= (-(7'h41)))) ? (8'ha7) : ({(!(8'ha1)), (~(8'hb3))} ? {((8'haf) >>> (8'hb5)), (8'hbf)} : (~(!(8'hb6))))) : ((~&(((8'haa) ? (8'h9d) : (8'h9d)) > ((8'hb0) && (8'haa)))) ~^ ((((7'h43) ? (8'hb8) : (8'h9f)) ? ((8'hb5) >= (8'hb5)) : (~&(8'hb5))) ? (((8'hbe) > (8'ha3)) ? ((8'ha3) - (8'hae)) : (~(8'hbf))) : {((8'hb6) ? (8'ha5) : (8'hb8))}))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire169;
  wire [(4'hd):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire157;
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire159,
                 wire63,
                 wire30,
                 wire13,
                 wire12,
                 wire65,
                 wire66,
                 wire82,
                 wire84,
                 wire85,
                 wire86,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire157,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire12 = (({wire11[(4'he):(4'ha)],
                      wire10[(3'h6):(1'h1)]} ~^ $unsigned(((-wire10) == wire9[(3'h5):(3'h5)]))) || (($unsigned((wire8 <= wire7)) > (wire7 >> $unsigned(wire7))) ?
                      wire10[(4'hf):(4'h8)] : (&($unsigned(wire9) != $signed(wire9)))));
  assign wire13 = ($signed($unsigned((wire11[(2'h3):(1'h1)] ?
                          (&wire12) : wire9))) ?
                      wire8 : wire9[(3'h7):(3'h6)]);
  module14 #() modinst31 (wire30, clk, wire7, wire12, wire11, wire8);
  module32 #() modinst64 (wire63, clk, wire13, wire12, wire9, wire7, wire8);
  assign wire65 = wire10;
  assign wire66 = (wire7 ? (8'ha3) : wire30);
  module67 #() modinst83 (wire82, clk, wire65, wire13, wire11, wire30);
  assign wire84 = (wire8[(4'hd):(4'hb)] != {wire13});
  assign wire85 = $unsigned({(~^$signed(wire8))});
  assign wire86 = wire82[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg87 <= wire11[(4'ha):(1'h1)];
      reg88 <= (wire63 ?
          (~|(((~&(8'h9e)) ? {wire84} : (wire9 ? wire84 : wire82)) || {(wire30 ?
                  wire82 : wire11)})) : $unsigned(wire12));
      reg89 <= wire30;
      reg90 <= {{((wire11 & $signed(wire84)) <<< $signed(reg87))}};
    end
  assign wire91 = (~wire10);
  assign wire92 = ((wire13[(4'ha):(1'h1)] <= wire13[(4'hf):(1'h1)]) <= (^wire7));
  assign wire93 = wire30;
  assign wire94 = $signed(wire8[(4'he):(3'h7)]);
  assign wire95 = ((($unsigned((~wire91)) ?
                          (wire65 ?
                              {reg88} : {reg88, wire86}) : wire93) ~^ {reg87}) ?
                      (~(((wire63 ? wire11 : wire86) ?
                          (!wire10) : $signed(wire65)) == ((8'hb5) ?
                          wire66 : reg87))) : ($signed(wire84) ?
                          $signed($unsigned({(8'hbd)})) : wire65[(5'h13):(3'h4)]));
  module96 #() modinst158 (wire157, clk, wire7, wire8, wire84, wire92, wire85);
  assign wire159 = (((wire30 <= ($unsigned(wire13) - (wire63 << wire92))) ?
                       $unsigned((~$unsigned(wire8))) : wire91[(3'h6):(3'h4)]) > reg88[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg160 <= ({wire11[(5'h15):(4'hd)]} ?
          wire157 : ((wire85[(4'hb):(2'h3)] == wire86[(3'h5):(1'h1)]) >>> wire82[(3'h6):(1'h1)]));
      reg161 <= (wire84 * $signed(wire92));
      reg162 <= $unsigned((|{$unsigned((+wire92))}));
      if ($signed(wire92))
        begin
          reg163 <= wire84[(4'ha):(1'h1)];
        end
      else
        begin
          if (({(+reg90)} ?
              ({((+wire92) ? (~|reg90) : $signed(reg163))} ?
                  $unsigned((+$signed(wire9))) : $signed((&(~&wire86)))) : wire66[(4'ha):(4'ha)]))
            begin
              reg163 <= $unsigned((wire94 ?
                  wire66 : $unsigned(((8'hbd) >= wire10))));
              reg164 <= ($signed($signed($unsigned({wire65, (7'h44)}))) ?
                  {(($unsigned(reg90) || (+wire30)) <<< wire8),
                      (!((|wire86) & wire12[(4'ha):(4'h8)]))} : $unsigned((^~(~&{wire93,
                      reg88}))));
            end
          else
            begin
              reg163 <= $signed($signed(wire63[(3'h5):(2'h3)]));
              reg164 <= (8'hb7);
              reg165 <= {wire7};
            end
          reg166 <= reg163[(4'hd):(1'h1)];
          reg167 <= {(7'h44)};
        end
    end
  assign wire168 = $unsigned((~|$unsigned($unsigned((wire10 >> reg87)))));
  assign wire169 = (($signed((-wire82)) ?
                           ($signed((wire168 ^~ reg167)) <<< $signed(((8'hb3) ?
                               wire8 : wire65))) : $signed((!(reg90 == reg88)))) ?
                       (^~({(~|wire8)} >> $signed((^~wire86)))) : wire10);
endmodule

module module96
#(parameter param155 = {({(((8'h9f) ? (8'haf) : (7'h40)) ? ((8'hbb) ? (8'hbe) : (8'had)) : (~|(8'hab)))} ? (~(^~{(8'hac), (8'hac)})) : {(8'haf)})}, 
parameter param156 = param155)
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h2d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire [(4'hd):(1'h0)] wire99;
  input wire [(4'hc):(1'h0)] wire98;
  input wire [(5'h10):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  assign y = {wire154,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg112,
                 reg111,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg102 <= $signed(((wire98 ^~ wire99) ?
          ((^~wire101[(2'h2):(1'h0)]) ?
              $signed((+wire98)) : (wire98[(3'h6):(1'h0)] ^~ (wire99 & wire99))) : {$signed(wire100[(2'h2):(2'h2)]),
              wire100}));
      reg103 <= $signed((reg102[(4'hd):(4'hd)] ?
          {reg102[(2'h3):(2'h2)],
              (~$signed(wire101))} : ($signed((wire101 > reg102)) ?
              reg102 : (|(wire101 && wire100)))));
      reg104 <= (~^(wire97 ? $unsigned(wire99) : wire97));
    end
  assign wire105 = ($unsigned({$unsigned($unsigned((8'h9f)))}) ?
                       $signed((+($unsigned((8'hb0)) ?
                           {reg104} : (+wire99)))) : reg104);
  assign wire106 = $signed((~|($unsigned(wire99[(4'hd):(4'h8)]) ?
                       ($signed(reg103) - (reg104 >>> wire100)) : {((8'hb0) ?
                               (8'hb1) : wire105)})));
  assign wire107 = reg103;
  assign wire108 = ($unsigned((8'ha3)) ?
                       {(-$signed({wire99, wire101}))} : reg102);
  assign wire109 = reg104[(4'he):(2'h3)];
  assign wire110 = (&wire98);
  always
    @(posedge clk) begin
      reg111 <= ($unsigned({wire109[(2'h2):(1'h1)]}) ?
          wire100 : wire109[(3'h4):(2'h3)]);
      reg112 <= (^$unsigned(wire107));
    end
  assign wire113 = $unsigned($unsigned(wire110));
  assign wire114 = wire101[(3'h7):(3'h6)];
  assign wire115 = (($unsigned(($unsigned(wire101) ?
                           (wire113 == reg104) : wire107)) ?
                       {$unsigned((^~(8'h9d))),
                           $signed(((8'h9f) ?
                               (7'h43) : reg111))} : (wire110[(2'h3):(2'h3)] && $unsigned(reg102[(3'h6):(1'h0)]))) * reg102[(4'h9):(3'h6)]);
  assign wire116 = wire105[(5'h11):(5'h10)];
  always
    @(posedge clk) begin
      reg117 <= (wire98 + $signed(wire115));
      if (($signed((~^((-reg112) >> (wire115 ?
          wire99 : reg112)))) == (~&(!$signed({(8'hb3)})))))
        begin
          reg118 <= (~&(($unsigned(wire110[(2'h2):(2'h2)]) >> $signed((wire105 ~^ wire101))) ?
              $signed(wire97[(3'h7):(2'h2)]) : {({reg104, (8'hbb)} ?
                      $unsigned(reg104) : (~&reg102))}));
          reg119 <= ((~&wire100[(1'h0):(1'h0)]) | (~&(~|{(wire98 >>> wire109)})));
          reg120 <= wire106[(1'h0):(1'h0)];
          reg121 <= (&{(8'ha1), ((~^wire98) ^ (8'hbc))});
          reg122 <= reg117;
        end
      else
        begin
          reg118 <= (wire114 ?
              wire115[(3'h4):(3'h4)] : {(+$signed((wire98 >> wire100))),
                  ((^(wire105 ? wire116 : wire113)) ?
                      {wire108} : $signed((~&reg118)))});
        end
      reg123 <= $signed((wire105[(4'hc):(4'ha)] ?
          (+(^~((8'hb8) | reg102))) : $unsigned($signed($unsigned(wire106)))));
    end
  assign wire124 = {(~^({((8'hb6) >>> wire100),
                           wire97[(5'h10):(3'h6)]} > {$signed(wire98)})),
                       reg104[(5'h12):(1'h0)]};
  assign wire125 = $unsigned(reg104);
  assign wire126 = ((($unsigned({reg102}) ?
                       $signed((~|wire99)) : reg123) <<< ((!$unsigned(reg117)) || {(reg103 + reg119)})) || (7'h44));
  assign wire127 = (|$unsigned((~|$unsigned((wire114 ? reg111 : wire100)))));
  assign wire128 = $unsigned(($signed($unsigned(wire114[(5'h10):(4'hd)])) ?
                       ((wire113 ? (~^wire110) : wire108) ?
                           $unsigned($signed(reg111)) : (~|(wire127 ?
                               wire105 : wire124))) : ($unsigned((~|reg117)) ?
                           wire106 : reg120)));
  assign wire129 = reg102[(3'h6):(3'h4)];
  assign wire130 = (wire97[(4'h9):(3'h6)] ?
                       (7'h41) : (~|({(8'haa)} ?
                           ($signed((8'hbc)) ?
                               (&(8'ha4)) : wire128) : wire125)));
  assign wire131 = ((wire99 < (~&$signed((8'hae)))) >> wire129[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg132 <= ({reg122, $unsigned(wire110)} & (~(~^reg119)));
      if ((wire115[(3'h5):(3'h5)] & wire116[(5'h11):(4'h9)]))
        begin
          if ($unsigned(reg117[(1'h1):(1'h1)]))
            begin
              reg133 <= $unsigned(wire100[(4'h8):(3'h7)]);
              reg134 <= ({wire127, (|(8'hab))} ?
                  (((wire109 * (|reg111)) ~^ (&(~wire101))) >> ($unsigned(reg111[(1'h1):(1'h0)]) ?
                      (~&(8'hb9)) : (!((8'h9c) - reg117)))) : ((wire128 ?
                      $signed((|wire124)) : $unsigned($signed((8'ha8)))) - (!((wire97 == wire100) >= wire106[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg133 <= $unsigned($signed((~wire115[(4'hc):(4'h9)])));
              reg134 <= ((wire115 ?
                  $signed($unsigned((reg102 ?
                      (8'hbd) : reg132))) : ((~|{(8'ha8), wire125}) ?
                      reg117[(1'h1):(1'h1)] : $signed(wire130[(3'h6):(3'h6)]))) ^ (wire114[(4'h9):(4'h8)] + {$unsigned(wire124),
                  ($signed(reg117) * {reg120})}));
              reg135 <= $unsigned({((~&{(8'hbe)}) ?
                      reg118[(4'hb):(4'hb)] : $unsigned(wire109[(3'h6):(3'h5)])),
                  (&$unsigned((^~reg132)))});
              reg136 <= reg102;
              reg137 <= ({$unsigned((reg104[(4'he):(3'h6)] ?
                      reg120[(2'h3):(1'h0)] : $unsigned(reg119))),
                  (($unsigned(wire113) ?
                      (wire127 + wire101) : wire101[(5'h12):(1'h0)]) && $unsigned(wire125[(4'hc):(4'hb)]))} >= (reg120 ?
                  (-reg117[(1'h1):(1'h0)]) : reg104[(3'h4):(2'h3)]));
            end
          reg138 <= $unsigned(reg112[(4'hd):(4'h8)]);
          if (((^~wire106) ? wire116[(5'h14):(2'h2)] : wire127))
            begin
              reg139 <= wire128;
              reg140 <= reg137;
              reg141 <= $unsigned((|(~^(^(!wire98)))));
              reg142 <= reg136[(1'h0):(1'h0)];
            end
          else
            begin
              reg139 <= (+$unsigned({$signed(wire97)}));
              reg140 <= reg134;
            end
        end
      else
        begin
          if (($unsigned($unsigned($signed((reg123 ?
              wire99 : reg140)))) ^ $unsigned(((^~$unsigned(wire127)) << $signed(((8'hbc) ?
              reg141 : wire106))))))
            begin
              reg133 <= reg118[(2'h3):(2'h3)];
              reg134 <= $unsigned(wire105[(3'h6):(2'h2)]);
              reg135 <= (^~wire105);
              reg136 <= $signed($signed((~&({(8'hb8)} >= $signed((8'h9e))))));
              reg137 <= wire109;
            end
          else
            begin
              reg133 <= {reg123[(1'h1):(1'h1)]};
              reg134 <= (~|(wire129 >>> {(8'ha9)}));
              reg135 <= $signed(wire130);
            end
          reg138 <= wire99;
          reg139 <= wire114[(4'hc):(2'h3)];
          if (wire114[(2'h3):(2'h3)])
            begin
              reg140 <= ($unsigned(((&(reg103 << wire101)) ?
                  ((reg112 ?
                      reg141 : reg134) * (wire114 <= reg118)) : $signed(((8'hbb) << reg142)))) >> reg133[(1'h1):(1'h0)]);
              reg141 <= wire113[(4'hb):(4'hb)];
            end
          else
            begin
              reg140 <= wire130;
              reg141 <= (!reg118);
            end
          reg142 <= {(~&(!$unsigned($unsigned(reg103)))),
              $signed((~|$unsigned($signed(reg140))))};
        end
      if (((~^$unsigned((!$unsigned((8'h9f))))) & (($unsigned((8'hb2)) ?
              {$unsigned(reg122), {reg103}} : reg140[(5'h13):(4'hf)]) ?
          wire101 : $unsigned({(^reg122)}))))
        begin
          if ($signed($unsigned({((reg142 ? wire131 : wire110) ?
                  $unsigned(wire100) : $unsigned((8'hbe)))})))
            begin
              reg143 <= wire99;
              reg144 <= $unsigned($signed(wire107));
              reg145 <= wire105;
              reg146 <= (&wire98[(3'h6):(2'h3)]);
            end
          else
            begin
              reg143 <= (reg138 <<< reg138);
              reg144 <= $unsigned(($unsigned((!$signed(reg119))) ?
                  $unsigned(((wire125 ? reg120 : reg134) ?
                      $signed(wire124) : (&wire124))) : (-(reg133[(4'hc):(1'h1)] ?
                      (reg112 ? reg146 : (8'ha9)) : $unsigned(wire101)))));
            end
          reg147 <= {((!$signed((&wire101))) ?
                  {(^~(!(8'had))), reg122[(4'ha):(2'h2)]} : wire126)};
          if ((8'hbd))
            begin
              reg148 <= (^(reg141[(1'h1):(1'h1)] - {(reg112[(3'h4):(2'h3)] ?
                      $unsigned(reg104) : {wire126, wire97}),
                  $signed((~|wire130))}));
            end
          else
            begin
              reg148 <= (($signed(wire106) * $signed((&(reg134 != reg136)))) - $unsigned((~&($unsigned(wire113) < (reg134 * wire105)))));
              reg149 <= reg145[(4'ha):(4'ha)];
              reg150 <= $unsigned(wire126[(4'h9):(2'h2)]);
              reg151 <= (((((reg112 ?
                      wire106 : reg136) >= $unsigned(wire126)) ^ (~(!(8'hbe)))) >>> {(~(^reg137))}) ?
                  $signed($signed(((-(8'hbe)) < $unsigned(reg119)))) : (reg133[(3'h4):(2'h3)] >> {reg120[(4'h8):(1'h0)],
                      {$signed(wire128)}}));
            end
          reg152 <= reg148[(4'hf):(2'h3)];
        end
      else
        begin
          reg143 <= $unsigned($signed(((~^wire131) ?
              $unsigned($signed((8'hac))) : $signed(wire124))));
          reg144 <= $unsigned($signed((^~wire98[(3'h7):(3'h6)])));
        end
      reg153 <= reg118;
    end
  assign wire154 = reg104[(2'h3):(1'h1)];
endmodule

module module67
#(parameter param80 = {((((-(8'ha5)) ? {(8'h9c), (8'h9c)} : ((8'hb2) && (8'h9f))) ? {((8'ha4) | (8'h9e)), (^(8'ha0))} : ((~^(8'hac)) ^ ((8'ha8) - (8'ha5)))) ? ((((7'h41) + (8'ha0)) + (!(8'ha9))) <<< {(8'ha5)}) : (+{(8'ha0)}))}, 
parameter param81 = (param80 < param80))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire70;
  input wire signed [(5'h15):(1'h0)] wire69;
  input wire signed [(4'hd):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 (1'h0)};
  assign wire72 = (~^($signed({wire69[(5'h13):(4'h9)]}) - ($signed(wire68) < ((wire69 + wire71) >= (+wire70)))));
  assign wire73 = $signed($signed(wire70));
  assign wire74 = wire71[(1'h0):(1'h0)];
  assign wire75 = (wire71 ? wire70 : $unsigned(wire69));
  assign wire76 = wire75;
  assign wire77 = $signed($signed($unsigned(wire74[(1'h1):(1'h1)])));
  assign wire78 = $unsigned($unsigned($signed((8'hb2))));
  assign wire79 = ($signed($unsigned($signed($signed(wire68)))) < $signed(wire77[(2'h2):(1'h0)]));
endmodule

module module32
#(parameter param61 = (((^~(~(-(8'hbb)))) ? (^~({(8'haa)} ? ((8'ha7) ? (8'haa) : (8'hb0)) : (-(8'hb5)))) : ((!((8'ha2) ? (7'h42) : (8'ha2))) ^~ (^(8'hb6)))) >>> ({(^~{(8'hbc), (8'hbb)})} + ((((8'ha7) ? (7'h42) : (8'hae)) ? ((8'hac) && (8'hb0)) : (~(8'h9e))) ^~ (8'ha6)))), 
parameter param62 = ({param61, ((~|((8'hb2) ? param61 : param61)) ? (~&(param61 - param61)) : (~(param61 ? param61 : (8'ha9))))} <= (~&param61)))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  input wire [(2'h3):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire44,
                 wire43,
                 wire42,
                 wire39,
                 wire38,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire38 = wire36;
  assign wire39 = wire38[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= wire35;
      reg41 <= ((($signed((wire33 + wire35)) < $signed($unsigned(wire38))) ?
          wire37[(1'h0):(1'h0)] : $signed((8'ha3))) && ((&reg40) ?
          ((|$unsigned((8'had))) ?
              $unsigned(wire34[(5'h13):(1'h1)]) : (~&((8'h9f) && wire37))) : wire33[(4'ha):(4'ha)]));
    end
  assign wire42 = {wire39[(1'h0):(1'h0)],
                      ((-(wire33[(3'h7):(3'h7)] * wire39[(2'h3):(1'h0)])) >> (+reg40))};
  assign wire43 = reg41[(2'h3):(2'h3)];
  assign wire44 = $unsigned(wire34[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      reg45 <= (($unsigned(wire43[(2'h3):(2'h2)]) ?
              $unsigned($signed({wire36})) : (({wire34, reg40} <<< (^~wire38)) ?
                  ((wire42 ? wire42 : wire39) ^~ wire35) : wire38)) ?
          ({{wire37, wire35[(1'h0):(1'h0)]}} ?
              $unsigned(wire33) : (~^(~wire34))) : ((!$unsigned(wire35[(2'h3):(1'h1)])) ?
              (!$unsigned($signed(wire39))) : ({(~wire42),
                  (wire35 - (8'ha2))} << ((&wire37) ?
                  (wire36 ? reg40 : wire34) : wire35[(1'h0):(1'h0)]))));
      if ({(((-(wire35 << (8'hb1))) ?
              wire38 : (~&(wire36 ?
                  wire33 : wire36))) * $signed((&$signed(reg40))))})
        begin
          reg46 <= $unsigned((8'hab));
          reg47 <= (wire37 == ((~wire33[(1'h0):(1'h0)]) ?
              (+$unsigned($signed(wire37))) : reg41));
          reg48 <= (^~$unsigned((+((wire44 ? wire33 : (8'hb9)) ?
              $signed((7'h40)) : (-wire37)))));
        end
      else
        begin
          reg46 <= $signed($signed(wire36[(3'h6):(3'h6)]));
          reg47 <= ((reg41 <= ($unsigned(reg40[(2'h2):(1'h0)]) ?
                  $unsigned((|wire42)) : (~&$unsigned(reg45)))) ?
              ($unsigned(wire43) ?
                  $unsigned(wire42) : (+{(reg48 == wire33), reg48})) : (wire34 ?
                  reg41[(1'h0):(1'h0)] : wire33[(3'h7):(3'h5)]));
          reg48 <= (reg48 >= wire44[(3'h4):(1'h1)]);
          if (((+wire43[(1'h0):(1'h0)]) >= $signed($unsigned($unsigned(((8'ha1) | wire37))))))
            begin
              reg49 <= (|wire42);
              reg50 <= (wire43 ?
                  ((reg47 ?
                      {(wire35 ?
                              (7'h41) : reg41)} : (~wire39)) > (8'h9f)) : (($signed(wire44) ?
                          (reg41 ?
                              wire43[(1'h1):(1'h1)] : reg46[(4'h9):(1'h0)]) : $unsigned($unsigned((7'h41)))) ?
                      ($signed(((8'hbb) | wire42)) == ((wire38 ^ wire34) ?
                          $signed(reg41) : $signed(reg48))) : reg45[(5'h10):(2'h2)]));
              reg51 <= ($unsigned($signed($unsigned(reg45))) ?
                  $unsigned($unsigned({$signed(wire39)})) : $unsigned((~&(^~{reg45,
                      wire34}))));
            end
          else
            begin
              reg49 <= (!($signed($signed((+wire35))) ^~ $signed(wire42)));
              reg50 <= wire35[(1'h0):(1'h0)];
              reg51 <= (8'hbe);
            end
        end
      if ($unsigned((($unsigned(wire43[(1'h1):(1'h0)]) | (8'ha6)) ?
          ((8'ha4) ?
              (+(wire37 - wire33)) : $unsigned($unsigned(reg49))) : (&reg49[(5'h11):(3'h4)]))))
        begin
          reg52 <= $unsigned(($signed((-((8'had) ? reg40 : reg51))) ?
              ((reg48[(4'hb):(4'ha)] ?
                      wire33[(4'hb):(4'hb)] : (reg40 || reg48)) ?
                  $unsigned(wire33[(2'h3):(2'h2)]) : reg40[(4'hc):(4'ha)]) : $unsigned((((8'hb1) ?
                  reg50 : wire35) < ((8'ha9) == (8'ha6))))));
          reg53 <= $signed($unsigned(((~&$signed(wire35)) ?
              wire34 : $signed((reg50 ? wire34 : reg52)))));
        end
      else
        begin
          if ((~|{reg47}))
            begin
              reg52 <= wire34;
              reg53 <= wire34[(3'h4):(1'h0)];
              reg54 <= ((-{reg46}) && $unsigned($signed(wire42[(3'h5):(2'h3)])));
              reg55 <= $signed($unsigned((8'ha2)));
            end
          else
            begin
              reg52 <= (~|wire37[(1'h0):(1'h0)]);
            end
          reg56 <= (~($unsigned($unsigned((^(7'h40)))) & $unsigned(((wire33 <<< reg41) ?
              wire34[(5'h12):(4'hc)] : $signed(wire37)))));
        end
      reg57 <= (^reg53[(3'h4):(3'h4)]);
      reg58 <= (~((!(~^{reg53})) ?
          reg48 : $signed((((8'hb3) ? reg52 : wire43) ?
              (reg52 ? (8'ha8) : reg40) : wire37))));
    end
  assign wire59 = ($signed(wire42[(3'h4):(1'h1)]) ?
                      (($unsigned(reg45) ?
                              ((wire43 ?
                                  reg52 : reg56) & (7'h42)) : $signed(wire42[(2'h2):(1'h1)])) ?
                          ($signed($unsigned(reg54)) << $unsigned((reg40 << wire35))) : {(&$unsigned(wire42)),
                              $unsigned(wire44)}) : $unsigned((((reg46 ?
                              wire44 : reg52) ?
                          wire33[(2'h3):(2'h3)] : (reg51 ?
                              wire36 : reg57)) >> ((&(7'h41)) > reg58[(5'h11):(4'hc)]))));
  assign wire60 = wire36;
endmodule

module module14
#(parameter param29 = (^~(8'h9d)))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = $unsigned((~&(8'hbb)));
  assign wire20 = wire15;
  assign wire21 = wire20;
  assign wire22 = $unsigned((~|((wire20[(2'h2):(1'h0)] ?
                          $unsigned(wire15) : $unsigned(wire19)) ?
                      wire16[(2'h2):(2'h2)] : wire15)));
  assign wire23 = (~&((((wire21 ? wire22 : wire15) ?
                      (wire21 ?
                          wire19 : wire19) : (wire16 ^ (8'h9f))) | $signed((~(8'hb3)))) >= {(^((8'ha3) | wire16))}));
  assign wire24 = $signed(wire20);
  assign wire25 = $unsigned((^$unsigned(((wire20 != wire15) ?
                      (~^wire21) : wire18))));
  assign wire26 = wire21;
  assign wire27 = {($signed(($signed(wire17) || $unsigned(wire25))) ?
                          (wire24 + ($unsigned(wire26) < (wire17 << wire24))) : $unsigned((~&$signed(wire19)))),
                      $signed((^~(((8'hb5) ? wire19 : wire20) == (~^wire17))))};
  assign wire28 = (8'ha9);
endmodule

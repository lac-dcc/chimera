module top
#(parameter param177 = (7'h43), 
parameter param178 = {(-((~{param177, param177}) & ((param177 >>> param177) * (param177 == param177))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire176;
  wire [(3'h6):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire158;
  wire [(5'h12):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire24;
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(4'ha):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  assign y = {wire176,
                 wire174,
                 wire158,
                 wire27,
                 wire26,
                 wire5,
                 wire6,
                 wire24,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned((8'ha7)));
  assign wire6 = wire0;
  module7 #() modinst25 (wire24, clk, wire2, wire1, wire3, wire5, wire0);
  assign wire26 = ((!$unsigned(wire5)) ?
                      wire1[(4'hf):(4'he)] : $signed((~&((wire4 ?
                          wire3 : (8'hae)) >> wire4[(3'h4):(2'h3)]))));
  assign wire27 = wire2[(3'h7):(3'h7)];
  module28 #() modinst159 (.wire32(wire4), .clk(clk), .wire29(wire24), .wire31(wire1), .wire30(wire2), .y(wire158));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg160 <= (~&wire26[(1'h1):(1'h0)]);
          if ((wire4[(4'hc):(3'h5)] ? (wire24 < wire5) : wire4[(5'h10):(3'h4)]))
            begin
              reg161 <= wire4[(4'h9):(3'h5)];
              reg162 <= wire24;
              reg163 <= (^~($unsigned($signed(reg162[(2'h3):(1'h1)])) && {$unsigned($unsigned(reg161)),
                  {(wire27 ^~ wire4)}}));
              reg164 <= wire4;
              reg165 <= wire5[(4'hc):(1'h0)];
            end
          else
            begin
              reg161 <= wire3;
              reg162 <= ({wire0} || $signed(((8'ha8) ?
                  $signed((&reg161)) : wire26)));
              reg163 <= wire3[(3'h7):(3'h5)];
              reg164 <= $signed((wire0[(4'he):(3'h5)] ^ $unsigned($signed($unsigned(wire1)))));
            end
          reg166 <= {(($unsigned((^reg164)) | $signed($signed(reg165))) ?
                  {(wire27[(4'hf):(4'h9)] ? (8'haf) : (wire0 & wire6)),
                      (~&reg160[(1'h0):(1'h0)])} : $unsigned($signed((|reg164))))};
        end
      else
        begin
          if (wire3)
            begin
              reg160 <= wire5;
              reg161 <= wire4[(3'h6):(2'h2)];
              reg162 <= (&$signed((|{(~&wire5), (~&reg162)})));
              reg163 <= reg165[(3'h6):(3'h6)];
              reg164 <= (((wire4[(4'h9):(1'h0)] <<< ($unsigned((8'h9c)) ?
                          $signed(wire1) : ((8'hb9) || reg161))) ?
                      (7'h42) : wire1) ?
                  wire6 : (~&reg163[(1'h0):(1'h0)]));
            end
          else
            begin
              reg160 <= {wire5};
            end
          if ($signed((wire0 ?
              reg165[(3'h5):(2'h2)] : $unsigned(($signed(reg164) ?
                  (8'ha6) : (wire4 ? wire27 : wire6))))))
            begin
              reg165 <= {(8'hb4), $signed((&$unsigned($unsigned(wire27))))};
            end
          else
            begin
              reg165 <= ($signed($unsigned(($unsigned(wire1) && (reg165 <<< wire0)))) ?
                  ((7'h40) * wire158[(1'h1):(1'h0)]) : $unsigned(wire5[(4'hf):(4'hf)]));
            end
          if ($signed((reg162 ?
              reg161 : (wire2[(3'h4):(1'h1)] ^ ((wire6 + wire24) >> (8'h9f))))))
            begin
              reg166 <= wire3;
              reg167 <= wire6;
              reg168 <= $signed(((8'ha4) ?
                  $unsigned(wire158[(1'h0):(1'h0)]) : ((wire5 ?
                      wire158 : reg165[(5'h14):(4'ha)]) | (+reg167[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg166 <= (wire3 ? reg165[(4'h8):(4'h8)] : reg160);
              reg167 <= {reg162};
              reg168 <= (((($signed(wire6) ? {reg165} : {(7'h44)}) ?
                          wire158 : reg162) ?
                      $signed(((8'hb7) ?
                          reg164[(3'h6):(1'h1)] : $unsigned(reg165))) : $signed(((&reg167) ~^ $unsigned((7'h42))))) ?
                  reg163 : {wire24[(4'he):(4'hc)],
                      (((wire6 ? wire4 : (8'hb2)) ?
                          $unsigned(reg168) : (reg164 <= wire6)) <<< (-(reg163 == wire158)))});
            end
          reg169 <= reg166;
          if ($signed({(^~(reg169[(3'h6):(3'h6)] ?
                  (&wire26) : (wire4 ? reg161 : wire5)))}))
            begin
              reg170 <= reg160[(3'h4):(1'h0)];
              reg171 <= $unsigned($unsigned(wire0[(3'h5):(1'h1)]));
              reg172 <= $signed($signed($signed($unsigned((wire2 >>> wire2)))));
              reg173 <= reg169[(3'h4):(1'h1)];
            end
          else
            begin
              reg170 <= $signed((((~(reg162 ? wire4 : wire158)) ?
                  $signed(reg172) : (7'h41)) | reg170[(5'h15):(1'h1)]));
              reg171 <= $unsigned($signed($unsigned(({reg173, reg168} ?
                  (wire26 ? wire1 : reg166) : (-reg168)))));
            end
        end
    end
  module96 #() modinst175 (.wire99(reg173), .wire100(reg162), .y(wire174), .wire97(reg163), .clk(clk), .wire98(reg170));
  assign wire176 = $signed((+$unsigned(reg172[(4'hd):(4'hd)])));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire [(5'h11):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire153;
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire58,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire93,
                 wire95,
                 wire153,
                 reg60,
                 (1'h0)};
  assign wire33 = wire32[(1'h1):(1'h0)];
  assign wire34 = ((~wire32) ? (~^$unsigned((7'h44))) : (8'h9f));
  assign wire35 = ({(wire31 ?
                          wire31[(4'he):(1'h1)] : (~|$unsigned((8'ha7))))} >> ($signed((|wire30)) ?
                      (((&wire31) * ((8'ha4) ? (8'hb8) : wire30)) ?
                          ({wire32} + $unsigned((8'hb5))) : {wire30,
                              (!wire33)}) : $signed($unsigned(wire33))));
  assign wire36 = $signed($signed(wire34));
  assign wire37 = ((!{wire36[(3'h5):(1'h0)]}) <= ((8'ha0) ?
                      (|(~&wire29)) : (^~(8'hb5))));
  assign wire38 = $unsigned($unsigned(wire33));
  assign wire39 = wire32;
  module40 #() modinst59 (wire58, clk, wire29, wire33, wire36, wire37, wire38);
  always
    @(posedge clk) begin
      reg60 <= (+wire39);
    end
  module61 #() modinst94 (.wire62(wire32), .clk(clk), .wire64(wire36), .y(wire93), .wire65(wire30), .wire63(wire37));
  assign wire95 = wire34;
  module96 #() modinst154 (wire153, clk, wire37, reg60, wire33, wire39);
  assign wire155 = wire31;
  assign wire156 = $unsigned((-(wire30[(1'h0):(1'h0)] ?
                       (~wire58[(1'h1):(1'h0)]) : $signed((-wire37)))));
  assign wire157 = $signed($signed(wire30));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire14,
                 wire13,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = wire9[(5'h15):(4'h9)];
  assign wire14 = $signed((({(^wire9), ((7'h41) ? (8'ha8) : wire10)} ?
                          ((~&wire12) <<< (!(8'hbb))) : ($signed(wire12) ?
                              $unsigned(wire13) : (!wire12))) ?
                      $signed((~&$unsigned(wire12))) : $signed($signed((wire12 >= wire8)))));
  always
    @(posedge clk) begin
      reg15 <= (~|$unsigned(wire14));
      reg16 <= $signed({(+($unsigned(wire11) ?
              $unsigned(wire11) : (reg15 > wire14))),
          ($unsigned((wire8 ? (8'had) : wire10)) >>> ((wire9 >>> wire13) ?
              (reg15 ~^ wire13) : (wire10 ? reg15 : (8'hbf))))});
      reg17 <= ((&wire13[(1'h1):(1'h0)]) ~^ wire12);
      reg18 <= wire8;
      reg19 <= {{reg16[(1'h1):(1'h0)]},
          (-($signed(wire12) ?
              wire8[(2'h3):(2'h3)] : (wire12[(4'hc):(3'h6)] << (8'ha2))))};
    end
  assign wire20 = wire12[(5'h10):(1'h1)];
  assign wire21 = wire9[(3'h6):(2'h3)];
  assign wire22 = (wire8 == ((^~wire11[(4'h9):(3'h4)]) ^~ ($unsigned((reg18 ?
                      (8'ha9) : wire9)) < (wire20[(3'h5):(3'h4)] ?
                      {reg18, reg19} : $unsigned(reg17)))));
  assign wire23 = {wire22[(4'h8):(3'h5)]};
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h256):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire100;
  input wire [(5'h15):(1'h0)] wire99;
  input wire signed [(5'h13):(1'h0)] wire98;
  input wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(2'h3):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire133,
                 wire132,
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
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire101 = ((^~{wire100[(1'h1):(1'h0)]}) ?
                       (wire99[(4'hb):(4'h9)] <<< ($unsigned((8'h9e)) ?
                           wire100 : $signed($signed(wire100)))) : $signed((wire98[(4'h9):(3'h6)] ?
                           wire99[(1'h1):(1'h0)] : (((8'hb5) ?
                               wire97 : wire98) - {wire98, wire98}))));
  assign wire102 = {(8'ha8)};
  assign wire103 = ($signed(wire99) >= ($signed($signed($unsigned(wire101))) ?
                       wire99[(3'h6):(2'h3)] : (~&(|$unsigned((8'ha9))))));
  assign wire104 = ((~&(^~wire97[(1'h0):(1'h0)])) ?
                       wire99 : wire99[(5'h15):(4'he)]);
  assign wire105 = wire97[(4'h8):(3'h7)];
  assign wire106 = $signed((^~(~wire105[(1'h1):(1'h1)])));
  assign wire107 = wire105[(1'h1):(1'h1)];
  assign wire108 = $signed(wire107);
  assign wire109 = $signed(((~($unsigned(wire103) >> $signed(wire97))) ?
                       $unsigned(wire101[(2'h3):(1'h1)]) : $signed(wire107[(1'h0):(1'h0)])));
  assign wire110 = wire103[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg111 <= $unsigned($unsigned((($unsigned(wire105) ?
          $unsigned((8'hab)) : ((7'h40) << wire105)) << wire102[(1'h1):(1'h1)])));
      reg112 <= $unsigned(wire108[(2'h3):(2'h2)]);
      if ({$unsigned(wire104[(2'h2):(2'h2)]), wire105})
        begin
          if ($unsigned((~$unsigned(({wire103} ? wire109 : wire97)))))
            begin
              reg113 <= $unsigned($unsigned(wire102));
            end
          else
            begin
              reg113 <= (^~(((wire106 >= (wire106 <<< wire105)) ?
                  (8'haa) : {wire103}) - $unsigned(((wire101 * wire97) ?
                  (reg113 || (8'hb2)) : wire110))));
              reg114 <= wire107[(2'h3):(1'h0)];
              reg115 <= (8'hb3);
            end
          reg116 <= wire100[(2'h3):(1'h1)];
          reg117 <= (^~$signed(($signed((wire105 == wire110)) << ((wire98 << reg115) ?
              (-wire109) : wire109[(3'h6):(2'h3)]))));
        end
      else
        begin
          if (((wire103[(4'hb):(3'h6)] ?
              ((~(wire99 ?
                  wire98 : wire105)) <= $unsigned(wire99[(3'h7):(3'h7)])) : {((wire109 >> (8'hba)) >> $unsigned(wire101)),
                  ($unsigned((8'hbc)) <= (wire101 > (8'ha4)))}) << reg116[(5'h12):(4'hc)]))
            begin
              reg113 <= ((($signed((|wire102)) & $signed(reg113[(3'h6):(1'h1)])) ?
                  ((reg117[(3'h7):(1'h1)] ?
                      $unsigned(reg115) : $unsigned(wire99)) ~^ ($unsigned(wire110) * $signed(wire109))) : ($unsigned($signed(wire107)) != wire107[(2'h2):(1'h1)])) == $signed((wire110[(3'h5):(3'h4)] ?
                  wire100 : (~^(reg115 != wire107)))));
              reg114 <= wire110;
              reg115 <= (wire105[(1'h0):(1'h0)] + $unsigned($signed(reg117)));
              reg116 <= reg113[(1'h1):(1'h0)];
            end
          else
            begin
              reg113 <= $unsigned($signed(($signed(wire98) ?
                  ((reg117 ~^ wire103) ?
                      (|wire99) : reg114) : (reg114[(1'h1):(1'h0)] >> (^(8'hba))))));
              reg114 <= $unsigned(wire109);
              reg115 <= (~|((~(wire110 != wire99[(5'h11):(4'hc)])) <= reg111));
              reg116 <= $unsigned(((~&$signed($signed((8'hb2)))) ?
                  (~^(wire97[(3'h6):(2'h3)] ?
                      wire97[(3'h6):(1'h0)] : $unsigned((7'h41)))) : wire100[(4'hc):(3'h5)]));
              reg117 <= $unsigned(wire105[(1'h1):(1'h1)]);
            end
          reg118 <= $unsigned($unsigned((((wire97 ? wire104 : wire107) ?
              reg113[(4'ha):(2'h3)] : (~reg114)) ^ (wire105 || (8'ha4)))));
          reg119 <= wire109;
        end
      if ((^~($signed($signed($signed(wire107))) <<< reg114)))
        begin
          reg120 <= wire105;
          reg121 <= ($unsigned($signed($signed((!wire107)))) ?
              $unsigned((($unsigned(wire103) ?
                      (reg112 | (8'ha3)) : reg113[(1'h1):(1'h0)]) ?
                  reg116 : $signed((~reg118)))) : wire105);
          reg122 <= (~&($unsigned(wire105) ?
              $unsigned(wire102[(2'h2):(1'h1)]) : reg114[(3'h7):(3'h7)]));
        end
      else
        begin
          reg120 <= ((+{(~^wire100[(4'ha):(4'ha)])}) >> (^$signed(((wire98 - reg118) ^~ (wire104 ?
              wire97 : wire105)))));
          reg121 <= {$unsigned(reg115[(4'hf):(4'ha)]), wire99[(5'h14):(2'h2)]};
          if ($signed((~$signed(((reg111 & reg117) + wire110[(2'h3):(2'h3)])))))
            begin
              reg122 <= wire106;
              reg123 <= reg120;
              reg124 <= (wire97[(1'h1):(1'h0)] <= $signed((~$signed(wire109))));
              reg125 <= wire106;
              reg126 <= (wire106 ? reg111 : reg121[(5'h11):(4'hd)]);
            end
          else
            begin
              reg122 <= $signed(reg111);
              reg123 <= {reg123[(2'h3):(2'h3)]};
              reg124 <= (~wire107);
            end
          if ({($unsigned($signed({wire98})) >= (wire109 ?
                  $signed(reg114[(4'hb):(3'h5)]) : {((8'ha8) ?
                          wire99 : wire103)}))})
            begin
              reg127 <= $unsigned(($unsigned((((8'hb1) ?
                  reg117 : reg117) >>> wire103)) ~^ $signed((&reg112))));
              reg128 <= $unsigned(reg112);
              reg129 <= $unsigned($signed({(~^(wire99 ? wire104 : wire103))}));
              reg130 <= $unsigned((7'h42));
              reg131 <= reg130;
            end
          else
            begin
              reg127 <= (~^((+(&((8'hbb) ^~ reg119))) - (^{reg125, reg117})));
            end
        end
    end
  assign wire132 = {$unsigned(($unsigned((~&wire98)) ?
                           reg127[(3'h4):(2'h3)] : $signed(reg124)))};
  assign wire133 = (~&$signed(($unsigned($unsigned((7'h40))) >>> $signed(wire100))));
  always
    @(posedge clk) begin
      if ((reg128[(1'h1):(1'h1)] >= $signed(((((8'hac) ? reg125 : wire133) ?
              (reg127 - wire103) : (7'h40)) ?
          wire106 : (-reg121)))))
        begin
          if ($unsigned(reg121))
            begin
              reg134 <= (8'hb4);
            end
          else
            begin
              reg134 <= ($signed($unsigned(((~reg111) ?
                  (|wire98) : (wire98 & reg117)))) <= (((reg113[(2'h3):(2'h3)] == reg114) ?
                  ({reg123} ?
                      (&wire102) : (!wire102)) : $signed(wire101)) && (wire99 * $signed((reg112 ?
                  reg127 : (8'hac))))));
              reg135 <= reg128;
              reg136 <= (-$signed($signed($unsigned({wire101, reg128}))));
              reg137 <= reg134;
              reg138 <= $unsigned($unsigned(({$signed(reg135)} >> (~|wire102[(1'h1):(1'h0)]))));
            end
          if (((~^$unsigned((|(wire101 ? (8'hb1) : reg122)))) | reg118))
            begin
              reg139 <= wire107[(1'h0):(1'h0)];
              reg140 <= (-($unsigned($signed((reg122 ?
                  reg135 : (8'ha3)))) <<< $unsigned(reg112[(2'h3):(2'h3)])));
            end
          else
            begin
              reg139 <= ($unsigned(reg139[(2'h2):(1'h1)]) ?
                  ((((wire99 ? wire110 : wire108) ^ (reg112 ?
                          reg120 : (8'haa))) ~^ (reg137[(1'h0):(1'h0)] >> wire106)) ?
                      (~|$signed($unsigned(reg137))) : (~&wire104[(3'h4):(1'h0)])) : ((((reg138 | reg135) ?
                      {reg127,
                          reg126} : reg140[(3'h5):(2'h3)]) != $unsigned(wire109[(4'hd):(4'hc)])) || (wire104[(4'h8):(3'h4)] ?
                      reg119[(4'h8):(4'h8)] : ($signed(reg128) ?
                          wire105[(1'h0):(1'h0)] : $signed(wire104)))));
              reg140 <= (-$signed($signed($unsigned($unsigned((7'h40))))));
              reg141 <= $signed((((~|$unsigned((8'ha6))) ?
                      ((reg119 ?
                          wire133 : reg125) ^ (^wire109)) : $signed(wire104[(4'h8):(4'h8)])) ?
                  (^~wire97[(4'h9):(4'h8)]) : (8'ha6)));
              reg142 <= wire102;
            end
          if (reg123)
            begin
              reg143 <= $unsigned((~|$signed({$signed(reg119),
                  $signed(reg117)})));
            end
          else
            begin
              reg143 <= reg131[(4'hf):(1'h0)];
              reg144 <= (~^$signed(wire106[(2'h2):(1'h1)]));
            end
          reg145 <= ($signed(wire104[(1'h1):(1'h0)]) < reg125);
          reg146 <= $signed(wire100[(4'hb):(4'h9)]);
        end
      else
        begin
          reg134 <= {({(^(~|reg146)),
                  $unsigned($unsigned((8'ha6)))} | $signed(wire109)),
              $signed((reg129[(2'h3):(1'h0)] << (^$signed(reg138))))};
          reg135 <= ($unsigned($signed({$unsigned(wire132)})) * $unsigned(reg125));
          reg136 <= reg126;
        end
      reg147 <= ({reg129} ? reg123[(3'h4):(2'h2)] : $signed(reg130));
      reg148 <= $signed(((($unsigned(wire106) >= (!wire106)) ?
              reg112 : $signed((reg131 | reg143))) ?
          reg123[(3'h5):(3'h4)] : (^~$unsigned(wire106))));
      reg149 <= reg122[(4'h9):(1'h0)];
    end
  assign wire150 = $unsigned({(~^reg116)});
  assign wire151 = ((8'ha0) <<< ((-wire100[(4'ha):(4'ha)]) <<< wire132));
  assign wire152 = {$unsigned((reg123[(3'h4):(1'h1)] ?
                           (~(~|wire107)) : (~^(+reg121)))),
                       $unsigned((~$unsigned((reg120 ? wire99 : wire101))))};
endmodule

module module61
#(parameter param92 = (((~&(((8'h9f) ? (8'hac) : (8'hb1)) ~^ ((8'haa) ? (8'haa) : (8'hb6)))) >>> ((&((8'ha1) ? (7'h43) : (8'haa))) << (|(^~(8'h9c))))) <= (&(((8'hbd) ? (~^(8'hbe)) : (~|(8'ha3))) - {(+(8'hb4)), (-(8'ha7))}))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire65;
  input wire signed [(4'hf):(1'h0)] wire64;
  input wire signed [(4'hd):(1'h0)] wire63;
  input wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg87,
                 reg86,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire66 = (wire63[(4'hb):(3'h7)] != (~&wire65));
  assign wire67 = (wire66[(3'h7):(2'h3)] ?
                      (wire63[(4'hd):(1'h1)] ?
                          (wire65[(2'h2):(2'h2)] > wire66) : {$unsigned((!wire62))}) : ($unsigned((7'h42)) ?
                          wire66[(3'h7):(1'h0)] : wire62[(1'h1):(1'h0)]));
  assign wire68 = wire62[(2'h2):(2'h2)];
  assign wire69 = wire63[(4'hd):(4'h8)];
  assign wire70 = wire68[(1'h0):(1'h0)];
  assign wire71 = {wire68, $signed($signed((~|wire67[(3'h7):(3'h5)])))};
  assign wire72 = wire63[(4'hd):(3'h4)];
  assign wire73 = (^~$unsigned(wire63));
  assign wire74 = (~&{(wire63 - $unsigned((wire71 <<< (8'haa)))),
                      (wire72[(1'h0):(1'h0)] - wire65)});
  assign wire75 = wire71[(2'h3):(1'h0)];
  assign wire76 = $signed($signed(($unsigned((&wire70)) < $unsigned($signed(wire69)))));
  assign wire77 = $signed(wire69);
  assign wire78 = (~^((!$unsigned((wire73 ^~ wire67))) ~^ $unsigned((wire75 ?
                      wire65 : (wire70 == wire70)))));
  always
    @(posedge clk) begin
      reg79 <= {($unsigned((wire78 >= wire66)) <<< (~^(~&wire72)))};
      reg80 <= $unsigned($signed(($unsigned((~|(8'hbb))) ?
          ((+wire78) && {(8'h9e)}) : $signed(((8'hbe) & wire76)))));
      reg81 <= $signed((($unsigned((&wire75)) < ({wire70} ?
          {wire69} : wire65)) + $signed((wire64 ? $signed(reg80) : wire74))));
      reg82 <= wire69;
    end
  assign wire83 = wire71[(2'h3):(1'h0)];
  assign wire84 = reg81[(1'h1):(1'h0)];
  assign wire85 = $unsigned((wire75[(4'hb):(3'h6)] >> (((wire62 ?
                      wire62 : wire62) - $unsigned(wire70)) * wire64[(4'hb):(4'h9)])));
  always
    @(posedge clk) begin
      reg86 <= (|(7'h44));
      reg87 <= $unsigned(((((wire73 >>> wire75) ? (7'h43) : reg86) ?
          $signed((wire65 || wire74)) : $signed($unsigned(reg82))) != {$unsigned($signed(wire64))}));
    end
  assign wire88 = $signed(($unsigned(reg87) ?
                      (($unsigned(reg79) ? (|(8'ha6)) : reg82) ?
                          wire67 : (+(~(8'hb8)))) : {($unsigned(wire84) == $unsigned(wire71)),
                          reg86}));
  assign wire89 = ({{wire64[(4'h9):(3'h4)]}} ?
                      ((+(~^$signed(wire71))) ?
                          {((reg81 == wire83) >>> {(8'hb4), (8'h9d)}),
                              reg80[(1'h0):(1'h0)]} : (~|((wire73 ?
                              reg79 : reg82) <<< $unsigned((8'ha3))))) : ({reg81,
                          wire75[(4'he):(2'h2)]} ^ (wire75[(1'h0):(1'h0)] <= (~&$unsigned(reg86)))));
  assign wire90 = ({$unsigned(wire72[(1'h1):(1'h0)])} ?
                      ((($unsigned(wire71) >= wire64) == ($unsigned(wire88) > (reg87 ?
                              wire66 : reg81))) ?
                          reg82[(1'h1):(1'h1)] : $unsigned($signed(wire77[(3'h5):(3'h4)]))) : wire84[(3'h4):(1'h1)]);
  assign wire91 = reg80;
endmodule

module module40
#(parameter param56 = ((((((8'ha6) ? (8'hae) : (8'hb5)) >>> (!(8'ha3))) ? ({(8'haa), (7'h40)} ? {(8'ha7)} : ((8'hbe) ~^ (8'hae))) : (!((8'hb1) ? (8'hbb) : (8'h9c)))) ? (|((!(8'ha0)) <<< ((8'hb3) >>> (7'h42)))) : ((~|{(8'hb7)}) ? (&(|(7'h42))) : ((-(7'h42)) != (~(8'hb7))))) + ((((|(8'h9d)) ? ((8'hbf) ? (8'hbd) : (8'hb3)) : ((8'had) ? (8'ha8) : (8'hbe))) == ((8'hb5) ? {(8'haf)} : (~|(8'ha9)))) ? ((-((7'h41) && (8'h9f))) ? {(-(8'hb1))} : ((~^(8'had)) ? ((8'ha1) ? (7'h40) : (7'h40)) : (^(8'ha6)))) : (((-(8'hb9)) - {(8'ha7)}) <<< (&((7'h40) ? (8'hb7) : (8'hbf)))))), 
parameter param57 = ((^(param56 >= ((8'ha9) ? (param56 <= (8'hbd)) : (param56 ? param56 : param56)))) & ((-(((8'hb2) <= param56) ? {param56, param56} : {param56, param56})) ? (|(~|(|param56))) : (^~((param56 ? param56 : param56) ? (param56 ? param56 : param56) : param56)))))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  input wire signed [(4'hf):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 (1'h0)};
  assign wire46 = wire41[(2'h2):(1'h1)];
  assign wire47 = ($unsigned($signed(wire42)) && $signed($unsigned(wire43[(3'h7):(1'h1)])));
  assign wire48 = (8'hb9);
  assign wire49 = (wire48 ? (wire44 + wire46) : wire41[(1'h1):(1'h1)]);
  assign wire50 = $unsigned(wire47);
  assign wire51 = $signed(wire41[(1'h1):(1'h0)]);
  assign wire52 = wire45;
  assign wire53 = $signed(((^~($signed(wire46) ?
                          {wire51} : (wire50 + wire41))) ?
                      wire45 : $unsigned($unsigned(wire46[(4'hd):(4'h9)]))));
  assign wire54 = $signed(wire51);
  assign wire55 = wire45;
endmodule

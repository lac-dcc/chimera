module top
#(parameter param175 = ((((~|(|(8'h9c))) ? {((8'haa) ? (8'ha2) : (8'ha1))} : (&((8'haf) >= (7'h40)))) ~^ {{{(8'haf), (8'hb3)}, ((8'hb9) ? (8'hb8) : (8'ha6))}}) ? (&(+(((8'hbb) != (8'hb9)) ? (~|(8'hbd)) : (8'ha9)))) : (^~(&{((8'hbc) > (8'ha7))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire169;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire171;
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  assign y = {wire174, wire169, wire5, wire6, wire167, wire171, reg173, (1'h0)};
  assign wire5 = wire4;
  assign wire6 = $signed($signed({($signed(wire2) <<< $unsigned(wire2)),
                     ($unsigned(wire0) <= $unsigned(wire2))}));
  module7 #() modinst168 (.clk(clk), .wire10(wire5), .y(wire167), .wire9(wire4), .wire12(wire0), .wire8(wire2), .wire11(wire1));
  module48 #() modinst170 (wire169, clk, wire3, wire6, wire0, wire1, wire2);
  module13 #() modinst172 (wire171, clk, wire0, wire169, wire5, wire6, wire3);
  always
    @(posedge clk) begin
      reg173 <= {(|$unsigned(wire4))};
    end
  assign wire174 = wire6;
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(4'hd):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(4'h9):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire162;
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire138,
                 wire33,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire45,
                 wire46,
                 wire47,
                 wire89,
                 wire140,
                 wire141,
                 wire162,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  module13 #() modinst34 (wire33, clk, wire11, wire12, wire10, wire9, wire8);
  assign wire35 = $unsigned($signed({(^~(wire12 ? wire12 : wire33)),
                      wire8[(3'h7):(2'h2)]}));
  assign wire36 = (wire12 ?
                      $unsigned((((wire11 << wire35) | (8'ha8)) != {((8'ha7) << wire11),
                          (+wire12)})) : $signed(wire33[(1'h1):(1'h1)]));
  assign wire37 = wire10[(1'h1):(1'h0)];
  assign wire38 = $signed($signed((-wire8)));
  assign wire39 = ({{(&$unsigned(wire36))}} | (&(!($unsigned((8'h9c)) || $signed(wire38)))));
  assign wire40 = wire8[(2'h3):(1'h0)];
  assign wire41 = (&wire38);
  always
    @(posedge clk) begin
      reg42 <= $signed(($unsigned(wire9) ?
          $unsigned((~|wire41[(5'h11):(4'hf)])) : $unsigned((!$signed(wire38)))));
      reg43 <= $unsigned(wire35);
      reg44 <= $signed($signed((($signed(wire41) << wire41) ?
          {$unsigned(wire41), (wire37 > wire41)} : wire11[(3'h7):(1'h1)])));
    end
  assign wire45 = wire10;
  assign wire46 = ((+{(((8'hae) ? wire10 : wire33) ^ $signed(wire37)),
                          ($signed(wire8) <= wire39)}) ?
                      (~reg43[(2'h3):(1'h0)]) : ((^wire38) >= $unsigned((wire35 ?
                          wire33[(2'h3):(1'h1)] : (+wire41)))));
  assign wire47 = {$unsigned((wire40[(3'h4):(2'h2)] ?
                          $signed($signed(wire11)) : $unsigned($unsigned((8'ha8)))))};
  module48 #() modinst90 (wire89, clk, wire40, wire36, reg42, reg44, wire47);
  module91 #() modinst139 (.clk(clk), .wire94(wire33), .wire95(wire47), .y(wire138), .wire96(wire8), .wire93(wire39), .wire92(wire41));
  assign wire140 = wire138;
  assign wire141 = ((~$signed($unsigned($signed(wire140)))) ^~ wire36);
  always
    @(posedge clk) begin
      reg142 <= wire45[(1'h0):(1'h0)];
      reg143 <= $unsigned(((8'hb5) < $signed((wire39 ?
          {reg42, (7'h44)} : (wire40 < (8'haf))))));
      reg144 <= $unsigned((|$unsigned(wire33[(2'h2):(1'h0)])));
      if ($signed({$unsigned($signed($unsigned(wire89))),
          wire37[(4'ha):(3'h7)]}))
        begin
          reg145 <= ($unsigned(wire12[(3'h5):(3'h4)]) >>> (wire8[(3'h6):(1'h1)] ?
              $signed((wire89 & $unsigned(wire10))) : wire9[(3'h6):(3'h5)]));
        end
      else
        begin
          reg145 <= wire39[(3'h4):(1'h0)];
        end
      reg146 <= wire38[(4'h9):(3'h7)];
    end
  module147 #() modinst163 (.wire148(wire11), .wire151(wire33), .wire149(wire12), .clk(clk), .wire150(wire9), .wire152(wire10), .y(wire162));
  assign wire164 = (&($signed((reg44[(2'h3):(2'h3)] ?
                       (reg142 >= wire10) : wire47)) >>> (^~((wire39 ?
                           (8'ha9) : wire89) ?
                       wire36[(1'h0):(1'h0)] : $unsigned(reg143)))));
  assign wire165 = $unsigned($unsigned({($signed(reg42) == (wire35 ?
                           reg43 : (8'hbc)))}));
  assign wire166 = (!(wire41 ?
                       {(^~(wire46 ? reg145 : wire164)),
                           reg143} : $unsigned((^~{wire36, wire39}))));
endmodule

module module147
#(parameter param160 = ({(&{{(8'haf), (8'h9e)}}), (((|(8'hbe)) ? ((8'ha0) * (8'h9f)) : (8'hba)) <<< {(~(7'h42))})} - (((((8'had) << (8'ha4)) ? (8'hb6) : (~&(8'hbd))) >>> {((8'h9c) ? (8'hba) : (8'hbb))}) ? (&({(8'ha6)} & ((8'had) <<< (8'h9f)))) : ((((7'h40) ^ (7'h40)) - {(8'hb6), (8'ha4)}) ? (~|{(8'hbd), (8'hba)}) : {((8'hae) >>> (8'hab))}))), 
parameter param161 = (!param160))
(y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire152;
  input wire [(4'h9):(1'h0)] wire151;
  input wire signed [(5'h15):(1'h0)] wire150;
  input wire [(4'hb):(1'h0)] wire149;
  input wire [(4'he):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire153;
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  assign y = {wire159,
                 wire155,
                 wire154,
                 wire153,
                 reg158,
                 reg157,
                 reg156,
                 (1'h0)};
  assign wire153 = {wire149[(3'h4):(2'h3)], wire148[(3'h7):(3'h4)]};
  assign wire154 = wire150;
  assign wire155 = {wire149[(3'h7):(3'h6)],
                       ({((wire154 | wire153) ?
                               (wire154 ?
                                   wire154 : wire148) : $signed(wire149))} && (({wire150,
                               wire148} <<< (wire153 << wire150)) ?
                           {$signed(wire150), wire152} : wire152))};
  always
    @(posedge clk) begin
      reg156 <= (wire150 - $signed($signed((wire148[(3'h4):(2'h3)] ?
          {wire152} : wire149[(3'h7):(3'h4)]))));
      reg157 <= wire148[(4'ha):(4'ha)];
      reg158 <= wire150[(2'h3):(2'h3)];
    end
  assign wire159 = (wire151 ^~ $unsigned((wire150 ?
                       {((8'hba) - (7'h40))} : wire151[(2'h2):(1'h1)])));
endmodule

module module91
#(parameter param137 = ({((8'hb2) ? (~&((8'ha9) ? (8'haa) : (8'ha8))) : ((^(8'hbb)) ? ((8'hbd) >> (8'hb3)) : (~^(8'hbf))))} << ({({(8'h9f), (8'hba)} ? {(8'hb6)} : ((8'haf) && (8'hb9)))} ? ((8'hbf) << ({(8'hb8), (8'hbd)} <<< {(8'hbd)})) : (((-(8'hb8)) != ((8'hbc) ? (8'hb8) : (8'h9e))) ? {((8'ha4) ? (8'ha0) : (8'ha7)), ((8'hba) << (8'hb6))} : (((7'h43) | (8'hb1)) <<< ((8'hbd) <= (8'hbf)))))))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire96;
  input wire signed [(5'h11):(1'h0)] wire95;
  input wire signed [(3'h4):(1'h0)] wire94;
  input wire signed [(4'h9):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(4'h8):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  assign y = {wire136,
                 wire119,
                 wire118,
                 wire117,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire103,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
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
                 reg116,
                 reg115,
                 reg105,
                 reg104,
                 reg102,
                 (1'h0)};
  assign wire97 = (8'ha0);
  assign wire98 = (wire97[(1'h0):(1'h0)] <= (8'hb5));
  assign wire99 = wire95[(4'h8):(2'h3)];
  assign wire100 = (wire99[(3'h7):(2'h3)] <= $signed($signed($signed($unsigned((8'hb1))))));
  assign wire101 = $signed($unsigned((wire93[(3'h7):(3'h5)] & $signed({wire98}))));
  always
    @(posedge clk) begin
      reg102 <= wire100;
    end
  assign wire103 = $signed((&((~&(^~(8'hba))) - wire101[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg104 <= (($unsigned(wire101[(4'h8):(3'h6)]) ?
          {{(wire92 ? wire95 : (7'h42)),
                  (8'hbc)}} : wire100) <= (($unsigned(wire93[(3'h4):(2'h3)]) ^~ {$unsigned(wire93),
          (-wire101)}) <<< wire103));
      reg105 <= wire96[(2'h3):(1'h1)];
    end
  assign wire106 = $unsigned($unsigned(wire94[(1'h1):(1'h1)]));
  assign wire107 = reg105[(4'hc):(3'h5)];
  assign wire108 = wire101[(1'h1):(1'h0)];
  assign wire109 = reg102[(4'h9):(2'h2)];
  assign wire110 = wire94;
  assign wire111 = wire108;
  assign wire112 = (wire110 ? wire109[(3'h4):(1'h1)] : wire110);
  assign wire113 = wire99;
  assign wire114 = ($unsigned(wire97[(2'h3):(1'h0)]) ^~ {(^(wire96 ?
                           {wire111} : (wire101 || wire103)))});
  always
    @(posedge clk) begin
      reg115 <= ((~&{(wire95 != $unsigned(wire100))}) ?
          (^~(^((wire114 * (8'ha8)) * (wire98 ?
              wire95 : wire99)))) : $unsigned($signed(((reg102 ?
                  wire108 : wire101) ?
              $unsigned(wire95) : {wire109}))));
      reg116 <= wire113[(1'h0):(1'h0)];
    end
  assign wire117 = (reg102 <= (reg104[(3'h7):(3'h5)] * (($unsigned(wire107) ~^ $unsigned(wire112)) ?
                       $signed((-wire114)) : reg104)));
  assign wire118 = {wire96,
                       ($unsigned(((^wire94) ^ wire93)) ~^ {(&(wire107 ~^ wire113)),
                           (wire99 <= (wire114 && wire108))})};
  assign wire119 = $unsigned(wire112[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg120 <= ($signed(({(!reg105),
              (wire94 ? wire101 : (8'ha6))} < (~$signed(reg105)))) ?
          wire107[(5'h14):(5'h14)] : $signed($signed((|(wire100 ?
              wire109 : wire112)))));
      reg121 <= (-reg120);
      if (wire114[(1'h1):(1'h1)])
        begin
          if (wire119)
            begin
              reg122 <= ($signed($signed(((&(8'hb5)) + (wire100 ?
                  wire101 : wire108)))) >= (wire109 ^ $signed((~&(wire101 << wire98)))));
              reg123 <= ((8'hb1) ?
                  (((8'hbb) ^ reg121) ?
                      wire100 : reg116[(4'ha):(4'h8)]) : (wire119 ?
                      wire110[(2'h2):(2'h2)] : $signed(reg121)));
              reg124 <= (8'ha1);
              reg125 <= (!wire108);
            end
          else
            begin
              reg122 <= reg104[(4'h9):(4'h9)];
              reg123 <= (!wire98[(3'h4):(3'h4)]);
              reg124 <= reg125[(2'h2):(2'h2)];
              reg125 <= $signed((~|(wire113 ?
                  ((+reg121) ?
                      $signed(wire93) : (wire113 - wire111)) : wire95[(4'he):(1'h1)])));
              reg126 <= ((7'h42) ?
                  wire96 : $unsigned((-(~&(wire96 ? reg121 : reg102)))));
            end
          reg127 <= reg123[(5'h10):(3'h5)];
        end
      else
        begin
          if ((+$signed(wire109[(4'h9):(4'h9)])))
            begin
              reg122 <= (~&((wire117[(4'h8):(1'h1)] * wire112) & (~|(~^(!(8'hba))))));
            end
          else
            begin
              reg122 <= (~^reg120);
            end
          if (($unsigned((((8'ha7) << {reg115}) ? {(+reg123)} : {(!reg104)})) ?
              $signed(((~((8'hbf) ? wire107 : wire109)) ?
                  $unsigned(wire94[(1'h0):(1'h0)]) : $signed(((8'haa) != reg104)))) : $unsigned((|(-wire112)))))
            begin
              reg123 <= wire111;
              reg124 <= ((^reg124) - (~$unsigned(reg126)));
              reg125 <= ((|((|wire96[(2'h2):(1'h0)]) ?
                      {$signed((8'ha0)),
                          (wire109 ?
                              reg121 : wire111)} : ($unsigned(wire94) + wire119[(3'h6):(2'h3)]))) ?
                  reg125[(2'h2):(2'h2)] : $signed((8'hb0)));
              reg126 <= wire106;
            end
          else
            begin
              reg123 <= wire97[(2'h2):(1'h0)];
              reg124 <= reg123[(1'h0):(1'h0)];
              reg125 <= (~^($signed($signed($signed(reg121))) + (~&((~reg125) ?
                  $signed(wire118) : $unsigned((7'h43))))));
              reg126 <= {$unsigned(((-$unsigned(wire95)) >> {(!wire111),
                      wire111})),
                  wire100};
              reg127 <= {{$signed((~|{reg127}))},
                  ({{(wire107 ? reg123 : reg126)},
                      $unsigned(wire110)} >= (wire94 >= $unsigned(((8'haa) ?
                      reg124 : reg102))))};
            end
          if ($unsigned(reg125))
            begin
              reg128 <= reg124[(2'h3):(1'h1)];
            end
          else
            begin
              reg128 <= reg121;
              reg129 <= wire118;
              reg130 <= $unsigned((~^$signed($signed($signed(reg124)))));
            end
        end
      reg131 <= reg130;
      if (((~|$signed({(reg105 ^~ wire93),
          (^~wire100)})) >>> (wire117 - (^~{((8'ha8) * reg120)}))))
        begin
          if (wire97)
            begin
              reg132 <= wire111;
              reg133 <= (+(~^(($unsigned(wire98) & (~|reg120)) >>> $signed($unsigned((8'hbb))))));
              reg134 <= ($signed(reg127[(1'h1):(1'h0)]) && reg131);
            end
          else
            begin
              reg132 <= ((8'hab) ?
                  (wire108[(3'h5):(3'h4)] <<< $unsigned(($unsigned(wire119) ?
                      $unsigned(wire100) : ((8'hbf) | reg127)))) : wire113);
              reg133 <= (~&$signed(($signed((~&wire113)) ?
                  (7'h42) : $unsigned($signed(reg132)))));
              reg134 <= $unsigned($unsigned($unsigned(reg129[(2'h2):(1'h0)])));
            end
          reg135 <= $unsigned((reg123[(4'hc):(4'hb)] ?
              (8'hbc) : ((wire109 ?
                  ((8'haa) || wire118) : (reg102 - reg132)) | $unsigned(wire112[(2'h3):(2'h2)]))));
        end
      else
        begin
          reg132 <= (~^reg134[(2'h3):(1'h0)]);
        end
    end
  assign wire136 = wire117[(5'h12):(4'hd)];
endmodule

module module48
#(parameter param87 = ((((+((8'hba) ? (8'hb0) : (8'hb6))) < (((7'h44) | (8'ha6)) ? ((8'ha5) == (8'h9d)) : {(8'h9f)})) ^ ({{(7'h44), (8'ha4)}} ? ((~^(8'h9c)) ^~ ((8'hbe) & (8'ha3))) : ((+(8'had)) ? ((8'h9f) ? (8'ha3) : (7'h44)) : (!(8'ha2))))) ? (|(|((+(8'hb1)) ? (-(8'hb6)) : {(7'h44)}))) : {({((8'ha2) - (8'hab))} <<< ((~(8'ha1)) ? ((8'ha3) ? (8'hb4) : (7'h41)) : {(8'hb3)})), (~&(^((7'h43) ? (8'hb2) : (8'hb8))))}), 
parameter param88 = {param87})
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire53;
  input wire [(5'h11):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire [(5'h10):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire78,
                 wire77,
                 wire76,
                 wire65,
                 wire55,
                 wire54,
                 reg81,
                 reg80,
                 reg79,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire54 = ($signed(wire51[(5'h11):(4'hb)]) ?
                      $signed((wire52 || wire52)) : wire52);
  assign wire55 = ($unsigned(wire49[(4'hf):(4'hf)]) && wire52[(4'h8):(1'h1)]);
  always
    @(posedge clk) begin
      reg56 <= $signed($signed($signed({(wire53 ? wire54 : (8'hbb)),
          $signed(wire54)})));
      if (wire53[(1'h0):(1'h0)])
        begin
          reg57 <= $signed($unsigned(($unsigned($signed(wire54)) != ($unsigned(wire51) != $unsigned(wire54)))));
          if ($signed((reg57 < (($signed((8'hbc)) <= (reg57 ? reg57 : wire49)) ?
              $unsigned(wire50) : {wire50}))))
            begin
              reg58 <= wire54;
              reg59 <= (((wire50[(3'h4):(2'h3)] ?
                          $signed($signed(wire51)) : $signed(reg58)) ?
                      ($unsigned(wire54[(1'h1):(1'h1)]) && $unsigned((&(8'ha7)))) : ((((8'hb3) ?
                                  wire51 : reg56) ?
                              reg58 : (reg58 ? wire52 : reg56)) ?
                          ((wire49 <= wire49) << wire52) : $unsigned((~|wire52)))) ?
                  reg56[(3'h6):(3'h4)] : wire51[(4'ha):(3'h5)]);
              reg60 <= wire52[(4'h8):(3'h5)];
              reg61 <= ($signed((&{(wire55 ? wire49 : wire55),
                  $signed(wire54)})) != ((wire52[(4'he):(3'h4)] ?
                  (&$signed(wire53)) : reg57[(4'ha):(2'h2)]) <= $signed(($unsigned(reg57) ?
                  wire54[(1'h0):(1'h0)] : wire51))));
              reg62 <= reg59;
            end
          else
            begin
              reg58 <= ({$signed((~^(&(7'h44)))),
                      (|((wire55 ? wire50 : wire52) ?
                          (8'h9d) : $unsigned(wire54)))} ?
                  reg60[(4'ha):(4'ha)] : wire52[(1'h1):(1'h0)]);
              reg59 <= (reg59 >>> (-($signed(wire55) ?
                  $unsigned(wire51[(4'hb):(4'h8)]) : $unsigned((wire49 ?
                      reg62 : reg57)))));
              reg60 <= wire50;
              reg61 <= reg60[(4'h8):(1'h0)];
            end
          reg63 <= (^~(~^wire55[(2'h2):(1'h1)]));
        end
      else
        begin
          reg57 <= reg59;
          reg58 <= (wire52[(4'h8):(4'h8)] >= ($unsigned(reg58[(1'h0):(1'h0)]) ?
              $signed($unsigned(wire50[(3'h6):(3'h4)])) : reg63));
          reg59 <= (~{($signed((|reg57)) ?
                  (~^$unsigned((8'h9d))) : $unsigned((^reg63))),
              (reg57[(4'h9):(4'h9)] ?
                  ($signed(wire50) && wire53[(2'h2):(2'h2)]) : (((8'ha9) ^~ wire53) >>> (^~reg62)))});
          reg60 <= (wire52 || wire51);
        end
      reg64 <= {wire52[(4'he):(4'h9)]};
    end
  assign wire65 = (|$signed((8'ha1)));
  always
    @(posedge clk) begin
      if (reg57)
        begin
          reg66 <= (^~(+reg58));
          reg67 <= wire65;
        end
      else
        begin
          reg66 <= $unsigned(wire65);
          reg67 <= $signed({$signed(($unsigned(reg56) || {reg62}))});
          if ((~&(($unsigned({(8'hb9)}) ?
                  (reg64 ? (reg62 | reg59) : $unsigned(reg66)) : {{reg56},
                      (wire54 ^~ wire52)}) ?
              $signed({(reg57 ? reg63 : wire53),
                  $signed(wire51)}) : $unsigned(reg66))))
            begin
              reg68 <= $unsigned((~^{reg62}));
              reg69 <= {($unsigned({(wire52 ? wire51 : wire53)}) ?
                      reg68 : ($signed($signed(reg57)) || wire51[(1'h0):(1'h0)])),
                  {{((reg57 ? wire49 : (8'h9f)) ? $signed(reg56) : reg64),
                          wire55},
                      (((reg67 == wire49) ^ ((8'ha2) > reg66)) ?
                          $unsigned({reg68,
                              wire55}) : (wire49 || $signed(reg66)))}};
              reg70 <= reg66[(3'h4):(2'h3)];
              reg71 <= $signed({wire49, reg66});
              reg72 <= wire65[(4'hf):(4'ha)];
            end
          else
            begin
              reg68 <= reg66[(3'h6):(1'h1)];
              reg69 <= $signed(reg59);
              reg70 <= (8'hbd);
            end
        end
      reg73 <= ((&(^~((wire53 ^~ wire54) >>> {reg68, reg66}))) && reg58);
      reg74 <= $signed($signed((~&wire55[(3'h7):(3'h6)])));
      reg75 <= (&reg56);
    end
  assign wire76 = (&((~&$signed((wire50 != reg62))) ?
                      ((7'h43) ?
                          $signed((reg62 <<< reg69)) : (reg56[(2'h2):(1'h1)] == (~reg73))) : reg74));
  assign wire77 = ($signed(((|$unsigned(wire52)) ~^ $signed((reg60 ?
                      wire52 : reg56)))) & $signed(reg67[(4'he):(2'h3)]));
  assign wire78 = (-($signed(reg74[(4'h9):(1'h0)]) >> (|(~|$signed(reg72)))));
  always
    @(posedge clk) begin
      reg79 <= reg57;
      reg80 <= ((reg72 && wire65[(4'he):(4'hc)]) ?
          (reg69 ? $signed(reg69) : (^~reg72)) : wire54[(2'h3):(1'h1)]);
      reg81 <= $unsigned(wire53);
    end
  assign wire82 = reg64;
  assign wire83 = (+({$signed(wire50[(3'h6):(2'h2)]),
                          $unsigned($signed(wire50))} ?
                      ((reg56[(4'ha):(4'h8)] ?
                              wire54[(2'h3):(1'h1)] : $unsigned(reg61)) ?
                          (+(wire54 >> reg61)) : wire50[(2'h3):(1'h0)]) : reg70));
  assign wire84 = (!reg56);
  assign wire85 = reg72;
  assign wire86 = $signed($unsigned($signed(reg73)));
endmodule

module module13
#(parameter param32 = {((~{((8'hb5) ? (8'ha5) : (8'hbc)), ((7'h41) ? (8'hb3) : (7'h42))}) ? ((((8'ha1) || (8'h9d)) ? (^~(8'h9d)) : {(8'hb2), (8'hb3)}) - (((8'ha9) ? (8'ha4) : (8'hb9)) ? ((8'ha1) >= (8'ha3)) : ((8'ha8) ? (8'hbb) : (8'hb7)))) : (8'hbc)), (|((((8'had) ? (8'h9c) : (8'hab)) ? (+(8'hba)) : (8'hb5)) > ((^(8'h9f)) * ((8'haf) ^ (8'had)))))})
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg24,
                 (1'h0)};
  assign wire19 = $signed($signed((wire17 && $signed((wire15 != wire14)))));
  assign wire20 = $signed(wire19);
  assign wire21 = (!wire20);
  assign wire22 = (~^(&{wire15,
                      ($signed(wire15) ? $signed(wire19) : (^~wire18))}));
  assign wire23 = $unsigned(wire21[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg24 <= wire18[(4'he):(3'h4)];
    end
  assign wire25 = (($signed(($signed(wire16) ?
                          wire14[(4'hd):(4'hd)] : (wire20 ? wire22 : reg24))) ?
                      ($unsigned($signed(wire22)) ^ wire17) : wire15) ~^ ($unsigned(reg24[(3'h7):(1'h0)]) ?
                      (((wire20 != wire14) ? (~&wire14) : wire17) ?
                          $unsigned($signed((7'h42))) : wire23) : (!($unsigned((8'hbe)) ?
                          $unsigned(reg24) : wire17[(2'h2):(2'h2)]))));
  assign wire26 = $unsigned($signed($signed(($unsigned(wire20) || wire25))));
  assign wire27 = wire21;
  assign wire28 = {(^~(($unsigned(wire25) <<< $signed(wire23)) < (&$unsigned((7'h41))))),
                      $unsigned(reg24[(4'h9):(4'h8)])};
  assign wire29 = (wire19[(4'hc):(2'h2)] ?
                      $signed(wire23[(1'h1):(1'h1)]) : {(((~^wire23) ?
                              wire25[(4'hb):(1'h0)] : (~&wire26)) > ($signed(wire18) != wire17))});
  assign wire30 = $unsigned(wire29[(3'h4):(2'h2)]);
  assign wire31 = (&($signed(wire20[(3'h6):(3'h4)]) > $signed(wire17[(3'h5):(2'h2)])));
endmodule

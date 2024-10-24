module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire155,
                 wire27,
                 wire26,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (~|wire2);
  always
    @(posedge clk) begin
      reg5 <= $unsigned(((+$unsigned($unsigned(wire0))) ?
          $signed({(wire2 | wire2),
              (wire4 ? (8'hb0) : wire2)}) : $unsigned(wire4[(1'h1):(1'h0)])));
      reg6 <= (((wire1 ?
              wire1[(4'h8):(1'h1)] : $signed((~^(8'hbf)))) - $signed($signed((-wire4)))) ?
          wire2 : $unsigned(reg5[(1'h0):(1'h0)]));
      reg7 <= (~{((|{reg6}) || ((^wire2) ? (~^wire4) : wire3[(2'h2):(2'h2)])),
          $signed((!$unsigned(wire3)))});
      reg8 <= ((-$unsigned({(reg7 ? (8'haf) : wire4)})) ?
          (wire3 >> ((8'hb1) ?
              $signed((wire3 >= wire0)) : $signed($signed(reg7)))) : ($signed(reg6[(3'h5):(2'h3)]) & $unsigned(((8'ha5) ?
              $unsigned((8'ha1)) : {wire3, reg5}))));
      reg9 <= (~&({$unsigned((wire2 ^~ wire1))} ^ ($signed($unsigned(wire4)) ?
          wire1[(4'ha):(2'h3)] : reg8)));
    end
  assign wire10 = $signed(wire1);
  assign wire11 = (-((^wire4[(3'h5):(2'h3)]) & $signed((^~$unsigned(wire2)))));
  assign wire12 = (reg5 | ({((^wire2) - {wire11, reg8})} || wire2));
  assign wire13 = (8'ha8);
  assign wire14 = $signed(wire11);
  assign wire15 = (+((~&$unsigned($unsigned(reg9))) == (wire0 >= reg8[(1'h1):(1'h0)])));
  assign wire16 = (8'ha5);
  assign wire17 = reg9[(4'hb):(4'h9)];
  always
    @(posedge clk) begin
      reg18 <= $signed($unsigned(wire4));
      if ((reg7 ?
          (($unsigned((wire0 ? wire4 : wire10)) | (^~$signed(reg5))) ?
              wire14 : wire3[(2'h3):(1'h0)]) : $unsigned($signed($signed(wire12[(2'h3):(2'h2)])))))
        begin
          reg19 <= (~&($unsigned((~|$signed(reg6))) ^ $signed(($unsigned(wire12) ?
              {reg9, reg7} : (reg9 ^ (8'hac))))));
          reg20 <= (|({(~^$unsigned(wire0))} == (!wire17[(2'h2):(1'h1)])));
          if ($signed(wire13[(4'h8):(2'h3)]))
            begin
              reg21 <= wire0[(5'h10):(4'hc)];
              reg22 <= ($unsigned(reg7[(2'h2):(1'h1)]) ?
                  (($unsigned($unsigned(wire15)) ?
                          $signed(((8'ha8) ?
                              wire17 : wire13)) : $unsigned($unsigned(wire17))) ?
                      wire12[(1'h1):(1'h1)] : (wire15[(5'h15):(5'h11)] == wire11)) : (^$unsigned({(8'had)})));
            end
          else
            begin
              reg21 <= (~($signed($unsigned(wire10)) == (|({wire3} >> (wire4 * wire16)))));
              reg22 <= $unsigned(($unsigned((&wire4)) | (+wire10[(4'hf):(4'h8)])));
            end
          reg23 <= reg19[(1'h1):(1'h1)];
          reg24 <= (-wire11[(4'hd):(4'hb)]);
        end
      else
        begin
          reg19 <= ($unsigned($unsigned(((8'ha9) ?
                  $signed(reg7) : wire13[(1'h1):(1'h0)]))) ?
              (+{$unsigned((wire11 ? wire10 : wire16)),
                  (&(&reg5))}) : $signed((^~(&(wire4 ? (8'ha5) : (8'ha0))))));
        end
      reg25 <= reg21;
    end
  assign wire26 = $signed($unsigned(reg21[(3'h5):(3'h4)]));
  assign wire27 = reg8;
  module28 #() modinst156 (wire155, clk, wire4, wire27, reg25, reg24);
endmodule

module module28
#(parameter param154 = ((8'ha5) ? (((((8'ha3) ? (8'hbe) : (8'h9d)) > (~^(8'hbb))) <= (((8'ha2) ? (8'hb6) : (8'hb4)) ? (~^(8'ha1)) : ((8'hbe) ? (8'hac) : (8'hac)))) ? (^~{((8'hba) ? (8'ha5) : (8'ha2))}) : {(((8'hbd) * (8'hbe)) ? (-(8'ha4)) : (!(7'h43))), (((8'ha0) ? (8'hbb) : (8'hae)) == (!(8'ha6)))}) : ((8'hb4) ? (!(-(&(8'ha4)))) : {(((8'hb9) ? (8'ha4) : (8'hb2)) ? ((8'haa) ? (8'hbb) : (8'hb3)) : (^~(8'hbf))), (-(^~(8'hbf)))})))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire153;
  wire signed [(4'hc):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire138,
                 wire136,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire33 = {((8'ha9) ^~ ($signed(wire31[(1'h0):(1'h0)]) ?
                          (~&{(7'h44)}) : ((wire30 ? wire30 : (7'h40)) ?
                              wire32[(2'h2):(1'h1)] : ((8'haf) ?
                                  (8'hb0) : wire32))))};
  assign wire34 = (~^($signed((^wire32)) ^ $signed((|$unsigned(wire29)))));
  assign wire35 = $signed($signed(wire32[(1'h1):(1'h1)]));
  assign wire36 = $unsigned(wire32);
  assign wire37 = $signed({wire32, $unsigned($unsigned($signed(wire29)))});
  assign wire38 = (($unsigned(wire33[(1'h1):(1'h1)]) ?
                      (((wire32 <= wire37) > $signed(wire29)) > (wire36[(3'h6):(1'h0)] ?
                          wire30 : (&wire32))) : ($signed((^~wire35)) ?
                          (-$unsigned(wire37)) : (|$signed(wire30)))) <= wire34[(1'h1):(1'h0)]);
  assign wire39 = wire29;
  assign wire40 = wire39;
  module41 #() modinst81 (wire80, clk, wire37, wire36, wire33, wire34);
  assign wire82 = $signed(((wire30 ?
                          (^wire37[(4'hf):(4'ha)]) : (+{(8'ha7), wire29})) ?
                      $signed(((wire32 | wire32) ?
                          (wire34 ?
                              wire39 : (8'hb2)) : (~|wire29))) : $signed({$signed(wire40)})));
  assign wire83 = $signed(({$unsigned(wire29[(3'h4):(1'h1)])} >> wire39));
  assign wire84 = wire32[(3'h4):(2'h3)];
  assign wire85 = ((~|($unsigned($signed(wire37)) ?
                          (^(wire84 >> wire80)) : $signed($unsigned(wire83)))) ?
                      $unsigned($unsigned(wire83[(3'h6):(3'h4)])) : wire35);
  always
    @(posedge clk) begin
      reg86 <= $signed(wire35);
      reg87 <= $signed((+(~^wire29)));
    end
  assign wire88 = wire35;
  assign wire89 = (^((^((&(8'ha1)) ? $signed(wire88) : $signed(wire80))) ?
                      ($unsigned($signed(wire84)) ?
                          wire84 : (~|wire29[(3'h7):(2'h3)])) : (({wire38,
                              (8'h9c)} - (-wire38)) ?
                          wire33 : (8'h9e))));
  assign wire90 = ((!$unsigned(({wire38,
                      wire37} ~^ $signed(wire88)))) >>> ((wire80[(4'hc):(2'h3)] >= $unsigned((wire31 != wire84))) ?
                      (^{(wire89 ? wire88 : wire89),
                          $unsigned((8'hac))}) : wire38));
  always
    @(posedge clk) begin
      reg91 <= {$signed((~^{wire39, $unsigned(wire85)}))};
      reg92 <= wire36;
      reg93 <= $unsigned((8'ha4));
      reg94 <= wire85;
    end
  module95 #() modinst137 (.y(wire136), .wire98(wire35), .wire97(wire88), .clk(clk), .wire96(wire82), .wire99(wire37));
  assign wire138 = wire32[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ((+(8'hb3)))
        begin
          reg139 <= (-wire138);
          reg140 <= {$unsigned(((reg94[(1'h1):(1'h0)] ?
                  $unsigned(wire88) : $unsigned(wire89)) < (&((8'ha0) ?
                  reg92 : reg92))))};
          reg141 <= $unsigned(((((wire31 ? wire31 : wire33) ?
                      (wire82 > wire39) : $signed(reg92)) ?
                  (!(wire85 != wire82)) : $unsigned($signed(reg94))) ?
              (&(!(wire80 >= wire83))) : (reg139 ? wire34 : (^~(-wire83)))));
        end
      else
        begin
          reg139 <= (-reg86);
        end
      if ({wire39[(3'h5):(1'h0)], (|wire31[(2'h2):(1'h0)])})
        begin
          reg142 <= (&wire40);
          reg143 <= $unsigned(wire84[(4'hb):(4'h9)]);
          reg144 <= reg87;
        end
      else
        begin
          reg142 <= wire36;
          reg143 <= wire35[(1'h0):(1'h0)];
          if (reg92)
            begin
              reg144 <= (8'ha7);
              reg145 <= reg87;
              reg146 <= (reg86[(3'h4):(1'h0)] >> wire38[(3'h4):(2'h2)]);
              reg147 <= ($signed((wire40[(2'h3):(1'h0)] ?
                      wire36[(3'h7):(3'h6)] : wire30[(3'h7):(3'h5)])) ?
                  $signed(wire85) : $signed($unsigned((~&{(8'hbf), wire80}))));
              reg148 <= $signed((($unsigned($unsigned(reg146)) ?
                  {{wire40},
                      wire40[(4'h8):(1'h0)]} : (~^$signed((8'hbb)))) <= wire35));
            end
          else
            begin
              reg144 <= reg139;
              reg145 <= $signed(reg148[(3'h6):(3'h5)]);
            end
          if (((+wire90[(3'h6):(2'h3)]) ?
              $unsigned($unsigned(((~|(8'hab)) ~^ reg94))) : $signed($unsigned(((!wire89) << $signed(reg94))))))
            begin
              reg149 <= wire36[(4'hc):(4'hc)];
              reg150 <= $unsigned($signed(reg146[(1'h1):(1'h1)]));
            end
          else
            begin
              reg149 <= ($unsigned($signed((^~wire82[(3'h6):(2'h2)]))) * wire35[(2'h3):(1'h1)]);
            end
          reg151 <= (^~{((wire88 ? (wire80 > reg146) : $signed(wire39)) ?
                  reg94 : (((8'h9c) ? reg142 : wire85) | (8'hb9)))});
        end
    end
  assign wire152 = $unsigned($unsigned(wire89[(1'h0):(1'h0)]));
  assign wire153 = {wire29};
endmodule

module module95
#(parameter param135 = ({{({(8'hb5), (8'ha6)} >>> ((8'had) <<< (8'hb6)))}, {(8'h9e), (((8'hb0) ? (7'h44) : (8'hb2)) ^ ((8'had) ? (8'hba) : (8'hb0)))}} || ((({(8'ha6), (8'hb8)} - {(8'hbe), (8'hb2)}) >>> ((8'hb9) + ((8'ha4) ? (7'h44) : (8'hb2)))) * (({(8'h9f)} ? (^~(8'hb4)) : (~|(8'hb2))) ? (~^{(8'hb0), (8'hb2)}) : (((8'h9c) ? (8'hbc) : (8'ha7)) << ((8'hba) != (8'hb9)))))))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire99;
  input wire [(3'h7):(1'h0)] wire98;
  input wire signed [(4'ha):(1'h0)] wire97;
  input wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire [(4'h8):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire119,
                 wire118,
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
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire100 = ($unsigned(($signed((7'h43)) ?
                       wire98 : (7'h43))) << wire96[(1'h1):(1'h0)]);
  assign wire101 = wire98;
  assign wire102 = wire98;
  assign wire103 = wire97[(4'h9):(3'h6)];
  assign wire104 = wire98[(3'h4):(3'h4)];
  assign wire105 = $unsigned((~&$signed($unsigned(wire98[(3'h7):(3'h5)]))));
  assign wire106 = wire96[(3'h5):(2'h2)];
  assign wire107 = (wire103 ? wire101 : wire103[(4'h9):(1'h1)]);
  assign wire108 = (^~$signed(((wire107 ?
                       (^wire105) : $signed((8'hb3))) ^ $signed((&(8'haa))))));
  assign wire109 = ((wire108 ?
                       wire101 : $signed((|(wire104 ?
                           wire98 : wire98)))) + (8'hb9));
  assign wire110 = $signed($unsigned(wire101));
  always
    @(posedge clk) begin
      reg111 <= (wire104[(4'hd):(1'h0)] == wire110[(4'h8):(3'h7)]);
      if (wire101)
        begin
          reg112 <= ((8'hb4) ?
              $signed((((|wire98) ?
                  wire109[(4'h9):(3'h4)] : wire108[(3'h4):(2'h3)]) ^~ {(~|reg111)})) : wire103);
          reg113 <= {{(!((wire98 < wire97) ^ $signed(wire110))),
                  ($signed($unsigned(wire110)) ?
                      ($signed((8'haf)) ?
                          $unsigned(reg111) : {(8'hab)}) : wire96[(2'h2):(1'h1)])}};
          if ($signed((~(wire106[(2'h2):(1'h1)] <= wire106[(4'h9):(3'h7)]))))
            begin
              reg114 <= (~|(((8'hb7) ?
                  ({wire97} ?
                      $unsigned(wire104) : (wire99 > wire97)) : reg113[(4'hc):(4'hb)]) && (&(8'hb5))));
            end
          else
            begin
              reg114 <= (wire102 ?
                  $signed((wire98[(1'h0):(1'h0)] + ({wire100} || (8'hb3)))) : (-$signed((~&(reg114 ?
                      wire96 : wire96)))));
              reg115 <= {(wire100[(3'h5):(3'h4)] >= ({(~|wire99)} << wire99[(3'h4):(2'h3)]))};
            end
        end
      else
        begin
          if ((!$signed($signed(wire101[(3'h4):(3'h4)]))))
            begin
              reg112 <= wire101[(3'h4):(3'h4)];
              reg113 <= wire100[(1'h0):(1'h0)];
            end
          else
            begin
              reg112 <= reg113[(5'h14):(5'h11)];
              reg113 <= wire108;
              reg114 <= $signed(reg112);
              reg115 <= wire102[(3'h7):(2'h3)];
            end
          reg116 <= wire102[(2'h3):(2'h3)];
          reg117 <= wire107[(4'h8):(3'h7)];
        end
    end
  assign wire118 = $unsigned(reg111);
  assign wire119 = (wire97[(2'h2):(1'h1)] ? wire104 : reg111);
  always
    @(posedge clk) begin
      if (wire99)
        begin
          reg120 <= ($signed(reg113[(3'h7):(3'h4)]) ?
              ((&(((8'hbb) <<< wire110) ?
                  {wire108,
                      wire105} : $unsigned(wire108))) & wire99) : (wire108[(2'h3):(1'h1)] ?
                  $unsigned($unsigned(wire97)) : $signed($unsigned((wire103 || wire106)))));
          reg121 <= wire98[(2'h2):(1'h1)];
          reg122 <= $signed({(8'hb8), wire97});
          if (wire108)
            begin
              reg123 <= $unsigned(($unsigned($signed((wire100 ?
                  wire97 : wire103))) << reg116[(4'h8):(2'h2)]));
              reg124 <= (reg120[(3'h6):(1'h1)] >= ($signed((^~(^~reg114))) != reg111[(2'h2):(1'h0)]));
              reg125 <= {wire98[(2'h2):(2'h2)],
                  (wire119[(4'he):(1'h0)] == (($signed(wire97) ?
                          reg120[(3'h7):(1'h0)] : {wire102}) ?
                      (&$unsigned(wire109)) : ($unsigned(reg120) == wire101[(1'h1):(1'h0)])))};
              reg126 <= $signed($unsigned({wire97}));
            end
          else
            begin
              reg123 <= (wire118 || (reg121 ?
                  (wire107 ? (^~$signed(wire101)) : reg122) : wire97));
              reg124 <= $unsigned((wire109[(3'h7):(3'h6)] ?
                  wire100 : reg122[(2'h2):(2'h2)]));
              reg125 <= ((!$unsigned($signed((wire97 ?
                  reg124 : reg124)))) <<< wire102[(4'h9):(3'h6)]);
              reg126 <= (((8'ha1) ?
                      $unsigned((((8'ha7) ?
                          reg124 : wire100) - $signed(wire97))) : wire96) ?
                  reg123 : wire100);
            end
          if ($signed(wire110))
            begin
              reg127 <= (|$signed(wire99));
              reg128 <= wire100;
            end
          else
            begin
              reg127 <= $signed($signed(((&(-reg127)) ?
                  wire106 : wire99[(1'h0):(1'h0)])));
              reg128 <= $unsigned($signed(($signed((!wire108)) ~^ reg116[(3'h4):(1'h1)])));
              reg129 <= reg124[(3'h5):(2'h3)];
              reg130 <= {((reg111 < ((wire108 ? wire98 : wire96) ?
                      (^reg111) : (&wire96))) < reg126[(4'ha):(3'h5)])};
            end
        end
      else
        begin
          reg120 <= wire100;
        end
      reg131 <= ({reg127} ? wire98 : $unsigned(wire109));
    end
  assign wire132 = {(!(reg111[(4'hd):(4'ha)] & (^$signed(reg116)))), (8'had)};
  assign wire133 = reg112;
  assign wire134 = wire102[(3'h5):(3'h5)];
endmodule

module module41
#(parameter param78 = (~&(~|(((+(8'h9d)) + ((8'hb8) ? (8'hbb) : (7'h40))) ? (+(~(8'hb2))) : (8'hbd)))), 
parameter param79 = (((~^((param78 ~^ param78) <= param78)) ? (((param78 | param78) ? (^param78) : param78) ? {(&param78)} : (^(param78 <= (8'had)))) : (((param78 * param78) ? {param78} : param78) || ((|param78) ? (~|param78) : (^~param78)))) ? param78 : (+(param78 ? (param78 ? param78 : (~|param78)) : (8'ha5)))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire45;
  input wire [(5'h15):(1'h0)] wire44;
  input wire [(3'h6):(1'h0)] wire43;
  input wire signed [(4'h8):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
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
                 (1'h0)};
  assign wire46 = wire45[(1'h1):(1'h1)];
  assign wire47 = $unsigned(wire42);
  assign wire48 = $unsigned(wire42);
  assign wire49 = (wire42[(2'h2):(1'h0)] ? (wire42 && (&wire42)) : wire48);
  assign wire50 = {{(-$signed(wire49[(4'ha):(1'h0)]))}};
  assign wire51 = wire49;
  assign wire52 = (wire46[(4'he):(2'h2)] ^~ wire46);
  assign wire53 = $unsigned(wire42[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      if (wire44)
        begin
          reg54 <= (+((~^((wire43 ^~ wire44) || $signed(wire49))) ?
              $signed({(&(8'ha4))}) : (|$unsigned((wire50 ?
                  wire51 : wire42)))));
          if ({wire42,
              $signed((wire49[(3'h7):(2'h3)] ?
                  (wire51[(4'ha):(4'h8)] ?
                      (wire42 >>> wire53) : wire49) : {(&wire43),
                      wire45[(3'h6):(3'h4)]}))})
            begin
              reg55 <= ($unsigned($signed(wire44[(4'he):(3'h4)])) ?
                  ($signed(wire50[(4'hc):(1'h0)]) ?
                      (wire46[(3'h7):(3'h7)] ?
                          $unsigned(wire52) : $unsigned((wire42 | wire42))) : (~|(wire49[(4'hc):(4'h9)] ^~ (wire47 ?
                          wire50 : wire45)))) : wire45);
              reg56 <= (8'hbb);
              reg57 <= $signed((($signed(wire52) ^~ (~&wire51)) ?
                  ($signed({wire44}) ?
                      $unsigned((wire46 | wire51)) : $signed(reg56[(3'h4):(3'h4)])) : (-(wire51 ?
                      (wire44 || wire49) : $signed(reg56)))));
            end
          else
            begin
              reg55 <= $unsigned((^wire53[(3'h4):(2'h3)]));
            end
          reg58 <= wire51;
        end
      else
        begin
          if ({{wire50[(5'h10):(3'h5)]},
              $unsigned($signed((^(wire50 <= wire44))))})
            begin
              reg54 <= $signed((wire45[(1'h0):(1'h0)] == (8'ha5)));
              reg55 <= ({((~^wire45) ?
                          reg55[(3'h7):(3'h6)] : (wire43[(1'h1):(1'h1)] ?
                              reg58[(3'h5):(2'h2)] : $signed(reg55)))} ?
                  $signed((wire46[(3'h4):(1'h0)] ?
                      (~^$unsigned(wire51)) : (~&(~wire53)))) : ((((wire46 <= wire51) << (reg56 >= (8'hac))) & ($unsigned(wire53) ?
                          $unsigned(reg55) : $unsigned(wire46))) ?
                      (~&$signed((^~wire49))) : $unsigned({wire51[(5'h11):(3'h6)]})));
              reg56 <= $unsigned(((-wire46) ?
                  ($signed((wire49 << wire48)) ?
                      (reg57[(2'h3):(1'h1)] != $unsigned(wire53)) : ({wire42,
                              wire45} ?
                          ((8'hba) ~^ wire46) : (wire44 ?
                              (7'h43) : wire53))) : (wire48 > ((wire51 ?
                          wire48 : wire48) ?
                      (wire46 ? reg58 : reg54) : (wire51 ^~ wire42)))));
              reg57 <= wire51[(5'h10):(4'h9)];
              reg58 <= (!$signed($unsigned($unsigned($unsigned((8'haf))))));
            end
          else
            begin
              reg54 <= $signed($unsigned($unsigned(wire53)));
              reg55 <= ((~^{wire52, wire52}) <<< wire42);
              reg56 <= (~&($unsigned($signed(reg58)) ^~ (|reg55)));
              reg57 <= ($unsigned((~^((^wire48) ?
                  {wire52} : {wire43, wire45}))) << reg54);
              reg58 <= $signed({{wire45},
                  {($signed(wire50) ? wire47[(4'hf):(1'h0)] : (-wire52))}});
            end
        end
      if (({($unsigned({wire50, (8'h9c)}) * (reg55 ?
              $unsigned(reg56) : wire43))} <<< {(wire50 - wire49[(4'hb):(2'h3)]),
          wire45[(2'h3):(2'h2)]}))
        begin
          reg59 <= (((($signed(wire42) ? $unsigned(wire49) : (&wire50)) ?
              $signed((reg55 ? wire47 : wire53)) : ((reg54 ?
                  wire45 : wire47) & (wire52 ?
                  wire50 : wire52))) ^ $unsigned(($signed(wire50) >> (+(8'haf))))) & ((~^(~|(reg55 ?
                  wire50 : reg56))) ?
              (^~$signed(reg55[(4'h9):(1'h1)])) : {(wire53 ^ {wire46, wire52}),
                  reg58[(4'h8):(3'h4)]}));
        end
      else
        begin
          if (reg56)
            begin
              reg59 <= $signed(wire46);
              reg60 <= ($signed(({((8'had) ? reg58 : wire47),
                  $signed(wire53)} || {$signed(wire53),
                  {reg55}})) ^~ $signed($signed($unsigned((reg56 <= wire52)))));
              reg61 <= ((+$signed(wire49[(2'h2):(1'h0)])) - ((wire52 != ({reg60,
                  wire53} ~^ $unsigned(wire50))) ^ {{(wire45 && reg58),
                      (wire42 << wire46)},
                  (~^reg60[(3'h7):(3'h6)])}));
              reg62 <= wire44[(4'hd):(3'h5)];
            end
          else
            begin
              reg59 <= (($unsigned(wire43) ?
                      ($signed((~&wire51)) ?
                          $signed(wire42[(1'h0):(1'h0)]) : (^~(reg58 ?
                              (8'hbf) : wire44))) : reg54) ?
                  $signed(reg62) : (~reg57));
              reg60 <= reg60;
              reg61 <= (reg58 ?
                  $signed($unsigned($unsigned((wire44 && (8'hbb))))) : wire52[(2'h3):(2'h3)]);
            end
          reg63 <= {(7'h43)};
          if ((reg56 ?
              reg63 : {((~^{wire43, reg55}) ?
                      (wire53 ?
                          $signed(wire52) : (wire49 & wire49)) : $unsigned((reg62 & (8'hb3)))),
                  (8'hbd)}))
            begin
              reg64 <= (~$unsigned(wire49[(3'h7):(1'h1)]));
              reg65 <= {reg55[(3'h7):(3'h4)]};
            end
          else
            begin
              reg64 <= wire42[(3'h4):(1'h1)];
            end
        end
      reg66 <= (~{(^~reg57)});
      reg67 <= wire53;
      if ($unsigned($unsigned(reg63)))
        begin
          reg68 <= wire48;
        end
      else
        begin
          if (reg58)
            begin
              reg68 <= (+$signed($signed((reg61 - reg59[(1'h1):(1'h0)]))));
              reg69 <= reg66;
              reg70 <= $signed({$signed(wire53),
                  $unsigned($unsigned(reg59[(4'hd):(3'h6)]))});
              reg71 <= $signed(wire49[(4'hf):(4'hd)]);
            end
          else
            begin
              reg68 <= $unsigned((|wire50[(1'h0):(1'h0)]));
              reg69 <= ($unsigned((wire53 != (~&(~&reg57)))) <<< $signed((8'hb5)));
              reg70 <= $unsigned(((((reg67 ? reg61 : wire53) ?
                      wire51 : $signed(reg62)) <= reg56[(4'h9):(2'h2)]) ?
                  {$unsigned($signed(wire49))} : (+(8'hb4))));
              reg71 <= reg59;
              reg72 <= {(($unsigned($signed(reg55)) < (~|(wire50 >>> reg70))) ?
                      (($unsigned(wire52) || (reg55 < reg71)) ?
                          $signed($signed(reg62)) : reg69[(4'hb):(2'h3)]) : (8'had))};
            end
          if ($unsigned(({reg64} ?
              $signed($signed($signed(wire43))) : ($signed(reg64) ?
                  {(reg57 ? wire42 : wire52), $unsigned(wire47)} : wire52))))
            begin
              reg73 <= $unsigned(((reg66 <<< wire46[(2'h3):(2'h3)]) - ({wire43} + {(reg72 ?
                      wire44 : reg59)})));
              reg74 <= reg54;
              reg75 <= $signed($unsigned({(|wire44[(4'ha):(1'h0)])}));
              reg76 <= (wire49 ^ wire51);
              reg77 <= (~{$signed(((wire46 ? reg62 : wire47) ?
                      reg56 : (8'hb3)))});
            end
          else
            begin
              reg73 <= (8'hb7);
              reg74 <= $signed((+$unsigned((+reg73[(2'h3):(2'h2)]))));
              reg75 <= ($unsigned(reg65) != reg77);
              reg76 <= (($signed(wire45) ^ $signed((^wire53))) ?
                  $signed(reg71) : ((8'hab) != reg63[(1'h1):(1'h0)]));
            end
        end
    end
endmodule

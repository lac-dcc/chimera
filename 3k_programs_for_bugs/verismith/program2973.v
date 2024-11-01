module top
#(parameter param201 = ((({((8'ha0) >> (8'hab))} * (8'hb3)) ? ({{(8'hbf), (8'ha0)}, {(8'had), (8'hac)}} || (~&((8'hbf) ? (8'hbd) : (8'hb6)))) : ((~&(8'ha3)) ? (8'hae) : (((8'hbc) && (8'ha0)) >>> (~^(8'hb7))))) ? (~&((((8'hbf) + (8'hb8)) ? (~^(8'hb7)) : {(8'hae), (8'hba)}) <= (((8'hbb) ~^ (8'hbd)) > ((8'hbb) && (8'hba))))) : (-((^~{(8'ha8), (7'h44)}) ~^ (&((7'h44) < (7'h41)))))), 
parameter param202 = ((+(((param201 ? (8'hbc) : param201) ? param201 : {(8'h9d), param201}) ? ((param201 ? (8'ha1) : param201) & (~|(8'hb6))) : param201)) + {param201, param201}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire192;
  wire [(5'h15):(1'h0)] wire194;
  wire [(5'h14):(1'h0)] wire195;
  wire [(2'h3):(1'h0)] wire199;
  reg [(4'hf):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg198 = (1'h0);
  assign y = {wire5,
                 wire149,
                 wire151,
                 wire152,
                 wire192,
                 wire194,
                 wire195,
                 wire199,
                 reg196,
                 reg197,
                 reg198,
                 (1'h0)};
  assign wire5 = {wire4,
                     ($signed(($unsigned(wire3) ? wire1 : (8'ha1))) ?
                         (^wire1) : wire2)};
  module6 #() modinst150 (.wire9(wire5), .wire8(wire3), .clk(clk), .wire7(wire0), .y(wire149), .wire10(wire2));
  assign wire151 = wire1[(1'h1):(1'h0)];
  assign wire152 = (~^(+wire149));
  module153 #() modinst193 (.wire154(wire149), .y(wire192), .wire157(wire151), .clk(clk), .wire156(wire0), .wire155(wire152));
  assign wire194 = {wire192[(4'hf):(3'h7)]};
  assign wire195 = (~^wire5);
  always
    @(posedge clk) begin
      reg196 <= ({$unsigned(($signed(wire0) ?
              (~|(8'had)) : $unsigned(wire192))),
          $unsigned(((^wire151) << $unsigned(wire151)))} | $unsigned($signed(wire3)));
      reg197 <= $signed((|wire149));
      reg198 <= (^{$unsigned(wire152[(5'h11):(4'hb)])});
    end
  module6 #() modinst200 (wire199, clk, wire195, wire1, wire152, reg196);
endmodule

module module153
#(parameter param190 = (~^(((^(^~(8'ha1))) | (~^(^~(8'hb1)))) * ((~|{(8'hb3), (8'hbb)}) ? (!((8'hb0) == (8'ha5))) : (~(-(8'hab)))))), 
parameter param191 = {(((~|param190) ? ((param190 ? param190 : param190) == (param190 ? param190 : param190)) : {(!(8'hae))}) == ({(~^(8'ha0))} ? ((param190 ? (8'hbf) : (7'h43)) ^~ param190) : ((8'ha6) >= param190)))})
(y, clk, wire154, wire155, wire156, wire157);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire154;
  input wire [(5'h11):(1'h0)] wire155;
  input wire signed [(4'hc):(1'h0)] wire156;
  input wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire189;
  wire [(4'h9):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire170;
  wire [(3'h7):(1'h0)] wire171;
  wire signed [(4'hf):(1'h0)] wire172;
  wire [(4'h8):(1'h0)] wire187;
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(3'h5):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  assign y = {wire189,
                 wire158,
                 wire159,
                 wire169,
                 wire170,
                 wire171,
                 wire172,
                 wire187,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 (1'h0)};
  assign wire158 = $unsigned((($unsigned({wire155}) ?
                       {(wire156 ?
                               wire156 : wire157)} : wire154) > (~^wire154)));
  assign wire159 = wire158[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if (wire156[(1'h1):(1'h0)])
        begin
          if (wire155)
            begin
              reg160 <= {(~&$signed((+{wire154, wire157}))),
                  ($signed((wire159 ^ wire155)) ?
                      $signed(wire158) : $signed((!(wire156 ?
                          wire157 : wire156))))};
            end
          else
            begin
              reg160 <= (-(((^~{wire154, (8'ha5)}) ?
                      $unsigned({wire158}) : ((wire154 ? wire157 : wire154) ?
                          wire156[(1'h1):(1'h1)] : (wire156 ?
                              wire159 : reg160))) ?
                  (8'ha8) : (wire159[(4'hc):(1'h1)] ?
                      {wire156,
                          wire155[(2'h2):(1'h1)]} : {(wire154 != wire159)})));
              reg161 <= (~&$signed(wire159));
              reg162 <= ($unsigned({(wire156 ? $signed(wire155) : (~wire159)),
                      ((8'ha2) + (wire154 ? wire157 : wire157))}) ?
                  ($unsigned((8'hb8)) ?
                      wire154[(2'h2):(2'h2)] : ($signed((wire155 ?
                              wire155 : (7'h40))) ?
                          wire155[(2'h2):(2'h2)] : $signed(wire156))) : $signed((wire158 ?
                      {{wire157}} : (wire159[(4'hf):(3'h7)] & {wire154,
                          wire157}))));
              reg163 <= ($signed(reg162) ?
                  wire155 : ((^~reg161[(2'h3):(1'h1)]) ?
                      (^~wire155[(2'h3):(1'h1)]) : (~^(8'hbc))));
            end
          reg164 <= ((wire156 > wire156) - ({reg163[(3'h6):(2'h2)], (8'haf)} ?
              ((wire156 && {reg160,
                  (8'hb2)}) << ((reg163 || wire159) - $unsigned(wire158))) : (7'h43)));
          reg165 <= reg163;
          reg166 <= (&reg160);
          reg167 <= $signed($signed($unsigned(($unsigned((8'hb9)) ?
              $unsigned((8'h9e)) : (wire155 ^~ wire155)))));
        end
      else
        begin
          reg160 <= ($signed(((|(|wire159)) ?
              ((wire159 & reg164) ?
                  $signed(wire157) : ((8'hb9) <<< (8'hb7))) : reg164[(2'h2):(2'h2)])) ~^ ({reg164} ?
              reg164[(2'h2):(1'h1)] : ((&(reg163 ?
                  reg161 : wire159)) <= $signed((&reg166)))));
          if (wire158)
            begin
              reg161 <= (!(reg166 * (-wire158)));
            end
          else
            begin
              reg161 <= ((wire158 - wire156) == (^$signed((~wire156[(1'h1):(1'h1)]))));
            end
          reg162 <= (((((7'h43) >= (reg166 ~^ wire155)) ?
                      ((~wire157) ?
                          (wire156 ?
                              wire154 : wire158) : reg167) : (~|(reg166 <<< reg163))) ?
                  $signed(reg165) : $signed((~&$unsigned((8'hb3))))) ?
              ({wire155, (~(^wire159))} ?
                  reg160 : (|(reg167[(2'h3):(2'h2)] == (~|wire158)))) : ((wire155 << (~&$signed(wire158))) || (reg161 ~^ (+wire155[(1'h1):(1'h1)]))));
          reg163 <= $unsigned($unsigned($signed($unsigned((~&wire154)))));
          reg164 <= reg164;
        end
      reg168 <= (($signed((reg160[(4'h9):(2'h3)] ^ $unsigned(wire156))) ?
          reg165[(2'h3):(1'h1)] : $signed($unsigned((wire157 ?
              wire154 : wire154)))) + (+(~^$signed((8'h9c)))));
    end
  assign wire169 = (wire158 ?
                       {((~&reg162[(5'h10):(5'h10)]) - ((wire159 ?
                                   reg162 : (8'ha7)) ?
                               $signed(wire159) : ((8'hac) * wire154)))} : (~^$signed($unsigned($unsigned((8'ha8))))));
  assign wire170 = {({((~&wire155) <<< (reg163 ? reg163 : wire157))} ?
                           wire159[(3'h6):(1'h1)] : {({reg166, reg161} ?
                                   (reg161 ?
                                       reg160 : reg168) : $unsigned(wire156))}),
                       (wire169 >>> ((~$signed(wire159)) ?
                           (+(wire157 * wire155)) : reg162[(4'h8):(2'h3)]))};
  assign wire171 = (((reg161 ?
                       (!reg164) : (!reg164)) ~^ reg167[(2'h3):(2'h3)]) ~^ {wire159});
  assign wire172 = (reg161 ? reg165 : reg162[(4'h8):(3'h7)]);
  module173 #() modinst188 (.wire177(reg162), .clk(clk), .wire176(reg161), .wire174(wire155), .wire175(reg165), .y(wire187));
  assign wire189 = wire156;
endmodule

module module6
#(parameter param148 = {({(((8'hb9) ? (8'hb0) : (8'ha0)) | ((7'h41) ? (8'haa) : (8'hb8)))} | (((~(8'ha9)) ? {(8'ha0)} : {(8'had)}) ? ((|(8'had)) ? {(7'h41), (8'hb3)} : ((8'ha9) ? (8'hbe) : (8'hb2))) : {{(8'ha7)}, ((8'h9e) || (8'hb3))}))})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(4'h8):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire79;
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire84,
                 wire83,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire44,
                 wire79,
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
                 reg86,
                 reg85,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire11 = $unsigned({(wire9 ^ (~wire7[(4'hc):(3'h7)]))});
  assign wire12 = {(8'ha2)};
  assign wire13 = wire9;
  assign wire14 = wire9[(4'hb):(3'h6)];
  assign wire15 = (wire9 ~^ wire14);
  assign wire16 = ((~|(wire15[(3'h5):(3'h5)] | (wire12[(3'h5):(2'h3)] ?
                          (wire14 ? wire9 : wire15) : wire14))) ?
                      $unsigned(((-$signed(wire10)) ?
                          {wire7[(4'hd):(4'hc)]} : {(wire15 & wire8)})) : (wire12 ?
                          $unsigned((|{(8'hb0)})) : (~^wire7)));
  assign wire17 = (~&($unsigned(wire8[(3'h4):(2'h2)]) ~^ (wire12[(1'h0):(1'h0)] * (8'hb0))));
  module18 #() modinst45 (.wire20(wire12), .wire22(wire14), .y(wire44), .clk(clk), .wire21(wire11), .wire19(wire8));
  module46 #() modinst80 (wire79, clk, wire44, wire13, wire16, wire11, wire8);
  always
    @(posedge clk) begin
      reg81 <= wire16;
      reg82 <= $unsigned($signed(wire7));
    end
  assign wire83 = wire16;
  assign wire84 = $unsigned({wire79, wire79[(4'hd):(3'h7)]});
  always
    @(posedge clk) begin
      reg85 <= {{(|(wire16[(3'h6):(3'h5)] + $signed(wire7)))},
          ((~|($unsigned(wire10) ? $signed(wire79) : $unsigned(wire7))) ?
              $signed($unsigned((+wire44))) : $unsigned($unsigned($unsigned(wire79))))};
      reg86 <= wire16[(4'ha):(1'h1)];
    end
  module87 #() modinst132 (wire131, clk, wire12, wire83, wire13, wire10);
  assign wire133 = $unsigned((8'ha0));
  assign wire134 = $signed((~|{((wire17 >= reg85) == (8'hac))}));
  assign wire135 = (((&$signed({(8'hb4)})) ?
                           reg81[(1'h0):(1'h0)] : {{(~|wire84),
                                   $signed(reg85)}}) ?
                       ($unsigned(($unsigned(wire15) >> wire9[(1'h0):(1'h0)])) | ((^(wire83 ?
                               reg81 : reg81)) ?
                           (8'hba) : $unsigned((wire8 & wire14)))) : {(8'ha2),
                           reg82[(4'he):(3'h6)]});
  always
    @(posedge clk) begin
      reg136 <= $signed($unsigned((+($unsigned(wire10) ?
          (^wire8) : $signed(wire84)))));
    end
  always
    @(posedge clk) begin
      if (reg136[(3'h4):(3'h4)])
        begin
          if (($signed(wire13[(1'h0):(1'h0)]) ?
              ($unsigned(((wire15 ?
                  (8'ha4) : (8'hb7)) || reg81)) < wire131) : $unsigned($unsigned((^~{wire8,
                  wire134})))))
            begin
              reg137 <= reg85;
              reg138 <= (~|(((wire15[(3'h6):(3'h4)] > ((8'hb3) == (8'haa))) ?
                      reg82[(4'hd):(2'h3)] : reg136[(5'h12):(1'h0)]) ?
                  $unsigned({(reg136 ? reg86 : wire83),
                      wire16[(2'h2):(1'h0)]}) : ((-$signed(wire44)) && $signed(((8'hab) ?
                      wire79 : wire14)))));
              reg139 <= {{(+{(~&reg81)})}};
              reg140 <= reg136;
            end
          else
            begin
              reg137 <= $signed(({({wire14, wire131} ?
                      (wire44 > reg137) : wire83)} ~^ $unsigned($unsigned(reg138[(5'h10):(4'hc)]))));
              reg138 <= wire12[(5'h11):(4'hf)];
              reg139 <= {$unsigned({((reg136 ?
                          wire135 : wire16) <<< (+(8'hb0))),
                      $unsigned((8'h9f))})};
              reg140 <= $signed((~|(+$signed($unsigned(wire9)))));
            end
          if ((&reg82[(4'he):(3'h4)]))
            begin
              reg141 <= ($unsigned(({{wire11,
                          wire133}} == $unsigned((8'hb2)))) ?
                  $signed(wire131[(4'he):(1'h0)]) : ((((~|wire9) ~^ wire131) << wire10[(4'h9):(3'h4)]) - (($unsigned(reg81) ^~ (wire10 << reg139)) == $signed((+wire84)))));
              reg142 <= (-wire14);
              reg143 <= $unsigned($signed((~(^~(&reg139)))));
              reg144 <= wire10[(3'h4):(3'h4)];
            end
          else
            begin
              reg141 <= wire133;
            end
        end
      else
        begin
          reg137 <= ((~^($unsigned((8'ha5)) ? wire135 : (8'hac))) ~^ reg82);
          reg138 <= (wire17[(3'h5):(2'h3)] ?
              (~($unsigned((wire84 ~^ wire135)) | {wire11,
                  (~|wire84)})) : $unsigned(wire12));
          reg139 <= (~((-(&(wire11 ?
              wire131 : (8'hbb)))) ^ reg142[(4'h9):(2'h3)]));
          reg140 <= (wire10 && wire12);
          reg141 <= $unsigned(($signed((((8'hba) == wire17) > (8'hbd))) || ((8'ha7) + wire8[(5'h12):(5'h12)])));
        end
      reg145 <= (($unsigned((!(wire44 ? (7'h41) : wire79))) > wire11) ?
          (!wire11[(4'hc):(2'h3)]) : wire11);
      reg146 <= (wire135[(3'h4):(3'h4)] ? wire131 : (8'ha7));
      reg147 <= (~|(($unsigned(wire7[(2'h3):(2'h2)]) ?
          (wire44 > (wire14 - (7'h42))) : {$unsigned(wire44)}) >= wire131));
    end
endmodule

module module87
#(parameter param129 = ({(^({(7'h44), (8'hb5)} + {(8'hba)})), (((8'h9e) ? (^(8'hb8)) : ((8'haa) ? (8'hb7) : (8'ha5))) ? {(~&(8'ha2)), (|(8'hbe))} : ({(8'haa)} < (~(8'ha5))))} >> {((-(^(7'h43))) ? (~|(+(8'hb0))) : (((8'ha8) ? (8'hb9) : (8'hbd)) ? ((8'h9f) ? (7'h43) : (8'ha6)) : ((8'hb0) ? (8'hb8) : (8'ha6))))}), 
parameter param130 = {(!(-((param129 == param129) ? (param129 ? param129 : param129) : (param129 + param129)))), (~|{(param129 > {param129, param129}), ((param129 ? (8'h9c) : param129) ^~ (8'hb6))})})
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire91;
  input wire [(3'h5):(1'h0)] wire90;
  input wire signed [(2'h2):(1'h0)] wire89;
  input wire [(4'hb):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire128;
  wire [(2'h3):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg92 <= (~&(+(($unsigned(wire88) == {wire88}) ~^ wire88[(4'ha):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg93 <= $unsigned(wire89);
      reg94 <= ((($unsigned($unsigned(wire90)) ?
              ((reg92 ? reg92 : wire89) <<< wire90[(1'h0):(1'h0)]) : {(wire89 ?
                      wire90 : (8'ha0))}) ?
          reg92[(1'h1):(1'h1)] : (^~wire88[(4'h8):(2'h3)])) ^ $signed($signed($unsigned(wire90[(1'h1):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      if (($unsigned(reg94) && (wire89[(2'h2):(1'h0)] ?
          $unsigned(wire89) : (~|(wire88[(2'h2):(1'h1)] && ((8'had) ?
              wire89 : reg93))))))
        begin
          reg95 <= $unsigned(reg94);
          reg96 <= reg92[(2'h2):(2'h2)];
          if ((wire88[(2'h2):(1'h0)] >= $unsigned({wire88,
              reg94[(2'h2):(2'h2)]})))
            begin
              reg97 <= reg94;
              reg98 <= (!{((reg95[(1'h0):(1'h0)] ?
                      (~|reg96) : $unsigned(wire88)) <<< ({wire91} ?
                      (~^(8'hb9)) : (~reg96))),
                  ((reg94 | reg92[(2'h2):(2'h2)]) > $signed({wire89}))});
            end
          else
            begin
              reg97 <= {((($signed(wire88) > (reg97 ~^ (8'had))) ?
                      reg96 : (!$unsigned((8'hb6)))) >= reg93),
                  wire91[(1'h1):(1'h1)]};
            end
        end
      else
        begin
          reg95 <= (($signed((+((8'h9e) ?
              (8'hac) : (8'hbc)))) != (($signed(wire89) ?
              $signed(reg94) : $signed(reg96)) << ((8'hab) & wire89))) <= wire90);
          if ($unsigned(wire88[(4'h8):(1'h0)]))
            begin
              reg96 <= ((|((&$unsigned(reg95)) >> (^~(reg92 - reg95)))) + (8'h9c));
              reg97 <= wire89;
              reg98 <= (^wire88[(1'h0):(1'h0)]);
              reg99 <= ((reg97 * {$signed((!reg96))}) == (~|(($unsigned((8'haa)) | (reg93 ?
                      wire90 : wire91)) ?
                  $signed((wire90 ?
                      wire88 : wire88)) : (wire89[(1'h0):(1'h0)] * reg95))));
              reg100 <= {reg98[(2'h3):(1'h0)],
                  {reg95[(2'h2):(2'h2)], reg93[(4'h9):(3'h5)]}};
            end
          else
            begin
              reg96 <= $unsigned($unsigned(wire91));
              reg97 <= {reg92[(2'h2):(1'h1)]};
              reg98 <= (~reg92[(2'h2):(2'h2)]);
              reg99 <= reg95[(3'h4):(1'h0)];
              reg100 <= $unsigned($unsigned(({(~^(8'h9c)),
                  (reg98 + wire90)} * (wire88 ?
                  reg92 : reg93[(4'hb):(3'h4)]))));
            end
          reg101 <= $signed(reg92[(1'h0):(1'h0)]);
        end
      reg102 <= reg92;
    end
  assign wire103 = (($unsigned((wire90 <= (8'ha6))) ?
                       ({(-(8'hb4))} > (8'hb8)) : ((~(!reg102)) ?
                           reg101 : $unsigned($signed(reg93)))) >= (~&(~^(8'ha9))));
  assign wire104 = wire89;
  assign wire105 = $unsigned(reg98);
  assign wire106 = ((($unsigned((reg100 == reg101)) & wire89[(1'h1):(1'h0)]) ?
                           $signed((|reg99[(1'h1):(1'h1)])) : {$signed((wire105 ?
                                   wire88 : wire90)),
                               {(reg95 ? (8'hac) : (8'hb6)),
                                   wire88[(2'h3):(1'h1)]}}) ?
                       wire91 : $unsigned($unsigned($signed($unsigned(reg94)))));
  always
    @(posedge clk) begin
      if ({{(8'h9c)},
          $signed((-($unsigned(wire104) ? (8'ha7) : $signed(reg95))))})
        begin
          if (reg99[(4'h8):(2'h3)])
            begin
              reg107 <= (~^wire91);
              reg108 <= ($unsigned((!(!(^~reg93)))) >= (~^$signed(((wire91 ?
                  (8'ha6) : reg98) > (~&wire103)))));
              reg109 <= $signed($unsigned($signed(wire91[(2'h2):(1'h0)])));
            end
          else
            begin
              reg107 <= (($signed(($signed(reg101) ? (~&reg99) : (&wire105))) ?
                  $signed((~&$unsigned((8'ha0)))) : $signed($unsigned($unsigned((8'ha4))))) <<< $signed({$signed($unsigned(reg101))}));
              reg108 <= wire103;
              reg109 <= $unsigned(reg98[(3'h5):(2'h2)]);
            end
          reg110 <= (^((reg94 ? reg98 : $unsigned($unsigned((8'hb5)))) ?
              reg101 : (8'hbb)));
          reg111 <= {$unsigned(reg93), reg96};
          if ((wire105 ?
              ((((8'hab) + $unsigned(wire90)) ?
                      (-(reg96 ? reg99 : reg109)) : (&(^reg110))) ?
                  reg93[(4'hb):(3'h5)] : ((&$unsigned((8'hb8))) > ($unsigned((8'ha3)) + (wire104 ?
                      reg108 : reg95)))) : $signed(reg107)))
            begin
              reg112 <= wire104;
              reg113 <= {((~((8'h9f) != $signed(reg98))) << (&($unsigned((8'haa)) == $signed((8'hab))))),
                  wire88[(2'h2):(1'h1)]};
              reg114 <= reg101;
              reg115 <= $unsigned(reg98);
              reg116 <= (reg114[(4'hd):(4'hc)] ?
                  $unsigned($unsigned($signed($unsigned(wire105)))) : $signed($signed(reg92)));
            end
          else
            begin
              reg112 <= (-reg113);
              reg113 <= (&wire89[(1'h0):(1'h0)]);
              reg114 <= (reg92[(1'h0):(1'h0)] - (((wire104[(1'h1):(1'h1)] + $unsigned((7'h43))) == ($unsigned(wire105) ?
                      (reg100 | wire89) : $unsigned((8'h9f)))) ?
                  $signed((((8'h9c) > reg107) ?
                      reg98[(4'ha):(1'h1)] : ((8'hab) ^~ reg97))) : ($unsigned((~reg98)) && $signed($signed(reg100)))));
              reg115 <= ({(reg102 ?
                          $unsigned((-wire106)) : $unsigned(reg112[(5'h10):(4'hf)]))} ?
                  reg109 : wire106);
              reg116 <= (wire105 ?
                  reg116[(3'h5):(3'h5)] : wire104[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg107 <= (wire89[(1'h1):(1'h1)] ?
              ($unsigned(reg97) ^ (wire103[(4'h8):(1'h0)] <= reg101[(4'h8):(3'h6)])) : $signed(reg113));
          reg108 <= reg112;
        end
      reg117 <= {(&$unsigned(($signed(reg94) >>> (8'hb7)))),
          ((wire90 ? (+(reg97 > (8'hbd))) : {(wire88 != wire91)}) ?
              {reg96[(3'h5):(2'h2)],
                  $signed($signed(reg101))} : (+$unsigned((~wire90))))};
      if (reg113[(3'h4):(1'h1)])
        begin
          reg118 <= $unsigned((reg117 ?
              wire91 : ((-reg117[(4'hd):(4'ha)]) > $signed(wire106[(1'h0):(1'h0)]))));
          if ($signed(wire104))
            begin
              reg119 <= {(~|((~^wire89) ?
                      (^((8'hae) + (7'h41))) : (^$unsigned(reg118)))),
                  ($signed($signed((reg100 ? reg95 : wire90))) ?
                      ((!reg97) ?
                          ((~&reg95) > reg101[(4'h8):(2'h3)]) : (reg94[(5'h10):(3'h6)] >>> (8'ha1))) : (~$signed((-(8'h9c)))))};
              reg120 <= (!(($signed($unsigned(reg96)) ?
                      $signed({(7'h41)}) : (~^(reg98 >= reg109))) ?
                  reg109[(1'h1):(1'h0)] : (~((reg96 != (8'h9c)) ?
                      wire103[(4'he):(4'hd)] : $signed(reg112)))));
              reg121 <= (&$unsigned($signed((^~(~(8'ha3))))));
            end
          else
            begin
              reg119 <= reg93;
              reg120 <= (8'h9f);
              reg121 <= $unsigned((+(~&$unsigned(reg96))));
              reg122 <= ($unsigned((($signed(reg108) ?
                  (reg113 ^~ reg100) : (reg111 ?
                      reg115 : (8'ha7))) << $signed($signed(wire90)))) ^ $unsigned($signed(reg111[(1'h1):(1'h0)])));
            end
          reg123 <= wire88[(4'h8):(3'h4)];
          reg124 <= (8'hba);
        end
      else
        begin
          reg118 <= reg116;
          reg119 <= reg117;
        end
    end
  assign wire125 = ($signed({(8'hbc),
                       $signed(reg123)}) != (~^{$signed((reg123 && reg93))}));
  assign wire126 = reg121[(3'h4):(2'h2)];
  assign wire127 = wire125[(4'h8):(3'h7)];
  assign wire128 = ({$unsigned(($signed(wire104) ?
                               wire91[(1'h1):(1'h1)] : $signed(wire104)))} ?
                       {reg107} : $unsigned(($signed((|reg100)) > (reg94[(5'h10):(4'he)] | reg94))));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(4'hd):(1'h0)] wire49;
  input wire [(2'h3):(1'h0)] wire48;
  input wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire65,
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
                 wire53,
                 wire52,
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
                 (1'h0)};
  assign wire52 = wire47[(4'hd):(3'h5)];
  assign wire53 = $unsigned((&$signed(wire49)));
  assign wire54 = wire47;
  assign wire55 = ($unsigned(((!(|wire48)) & ($unsigned(wire47) ?
                          wire54 : (|wire49)))) ?
                      wire48[(1'h0):(1'h0)] : ($unsigned(((~&wire54) & (-wire54))) ?
                          {wire54[(1'h1):(1'h0)],
                              $signed($signed(wire51))} : {$signed($signed(wire50)),
                              $signed($unsigned(wire49))}));
  assign wire56 = ((((8'hb0) ?
                      $signed(wire51[(3'h6):(1'h0)]) : wire54) <<< $unsigned($unsigned(wire48[(2'h3):(1'h1)]))) != $unsigned(({wire53[(5'h10):(3'h7)]} ^ (~|$signed(wire47)))));
  assign wire57 = $signed($unsigned((wire51[(3'h6):(3'h5)] ^ (7'h42))));
  assign wire58 = wire54[(4'h9):(3'h5)];
  assign wire59 = wire58[(1'h0):(1'h0)];
  assign wire60 = (~wire58);
  assign wire61 = wire54[(4'h9):(3'h5)];
  assign wire62 = (8'hb8);
  assign wire63 = ((|(wire61 ^ ((wire57 | wire48) - wire57))) ^~ $signed($signed($signed(((8'haa) ?
                      wire48 : wire49)))));
  assign wire64 = {wire57, (+{(|wire58), (&$unsigned(wire54))})};
  assign wire65 = $signed((!$unsigned({{wire62, (8'hab)}})));
  always
    @(posedge clk) begin
      reg66 <= (+wire48[(1'h0):(1'h0)]);
      reg67 <= (~((wire51 ?
          $unsigned((^~wire50)) : (~&((8'ha9) ?
              wire52 : wire64))) > (wire59 ~^ $unsigned($unsigned(wire51)))));
      reg68 <= {(~|wire60)};
      if ((&wire61))
        begin
          if ({$signed((((wire50 >= (8'ha3)) ?
                      {(8'hb5), wire58} : $signed((8'haf))) ?
                  (^~wire60[(3'h6):(2'h3)]) : $unsigned((wire48 >= wire64))))})
            begin
              reg69 <= (^{$unsigned(reg67[(3'h7):(2'h2)])});
              reg70 <= wire50;
              reg71 <= $signed(wire58[(2'h3):(2'h3)]);
            end
          else
            begin
              reg69 <= reg67[(4'h8):(1'h1)];
              reg70 <= ($unsigned($signed(($signed(wire56) ?
                      ((8'hb9) < reg66) : $signed(wire56)))) ?
                  (8'hbb) : wire65);
              reg71 <= (((wire48[(2'h2):(1'h1)] >>> reg67[(4'ha):(2'h3)]) ?
                      (!wire59[(1'h1):(1'h1)]) : ($signed($unsigned(wire47)) ?
                          (wire53 ? {wire49} : $unsigned(wire51)) : ((wire64 ?
                                  wire52 : wire60) ?
                              (reg71 & wire58) : {(8'h9c), (8'hb8)}))) ?
                  ((-{$signed(wire55)}) ^ (^wire47)) : (~&wire59));
              reg72 <= wire52[(3'h5):(3'h4)];
              reg73 <= wire53;
            end
        end
      else
        begin
          if (reg68)
            begin
              reg69 <= (|{$unsigned(wire62[(2'h2):(2'h2)]),
                  $signed($signed(wire57))});
            end
          else
            begin
              reg69 <= {reg73,
                  $unsigned($signed(($signed(wire53) - $signed(wire50))))};
              reg70 <= {(reg68[(3'h4):(2'h3)] ?
                      ((~^wire59[(4'he):(4'hc)]) ^~ $signed($unsigned(wire52))) : (|$signed((wire49 != reg67))))};
              reg71 <= (^~$signed(((+reg66[(2'h2):(2'h2)]) < ((reg69 ?
                      reg69 : (8'hb0)) ?
                  ((8'hb4) < wire53) : $unsigned(wire59)))));
              reg72 <= (wire57 ?
                  ($unsigned($unsigned((&wire60))) ?
                      (&(!(~|reg71))) : reg66[(3'h4):(1'h1)]) : (((~^(wire53 > wire49)) ?
                          $unsigned((wire53 == wire62)) : wire51[(2'h2):(1'h1)]) ?
                      ((wire53[(4'hb):(3'h7)] ?
                              $signed(reg73) : $unsigned(wire60)) ?
                          $signed($unsigned((8'hb4))) : wire54) : (({wire54} | reg69) + (~^(^wire55)))));
              reg73 <= wire65[(3'h4):(2'h2)];
            end
          reg74 <= ((!wire55) > ($unsigned((+(wire64 ?
              reg72 : wire65))) && $signed(reg71)));
          reg75 <= wire63;
        end
    end
  assign wire76 = wire61[(3'h4):(1'h1)];
  assign wire77 = ($unsigned((~&(&wire58[(1'h0):(1'h0)]))) ?
                      $signed(($signed($unsigned(reg67)) && ((wire47 >> reg70) ?
                          reg68 : {(8'ha0)}))) : reg68);
  assign wire78 = wire50;
endmodule

module module18
#(parameter param42 = (((!(((8'ha0) != (8'h9c)) | (8'ha8))) == (((~&(8'hb9)) ? (~^(8'had)) : (&(8'hb6))) ? ((~&(8'ha6)) ? (~&(8'h9e)) : {(8'ha0), (8'ha6)}) : ((8'hb4) ? ((8'hb4) ? (8'ha2) : (8'ha1)) : (&(7'h41))))) ? (((((7'h41) ? (8'ha7) : (8'hbc)) >>> ((8'hab) ? (8'ha6) : (8'hac))) >> ({(8'ha6), (8'hb6)} ? {(8'hbb), (7'h40)} : (&(8'hbb)))) ? (^((~(8'hbe)) + ((7'h44) ? (8'ha6) : (8'ha8)))) : (&((~&(8'h9f)) && (~|(7'h42))))) : {((((8'haf) != (8'hb9)) ? {(8'hba), (8'hb3)} : (|(8'h9f))) ~^ {((8'h9e) ? (8'ha0) : (8'hb9)), {(8'h9c), (8'haa)}})}), 
parameter param43 = (-{{param42}}))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire23;
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = $unsigned((&wire19[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg24 <= {{(wire20[(3'h7):(2'h2)] ?
                  (^wire21[(3'h4):(1'h0)]) : wire22[(4'ha):(3'h5)])},
          (~|wire21[(2'h2):(1'h0)])};
      reg25 <= wire19;
    end
  assign wire26 = $unsigned($unsigned(wire22));
  assign wire27 = wire26;
  assign wire28 = ($signed(((+wire27) ^~ {wire22[(4'hc):(3'h7)]})) ?
                      $signed($unsigned((reg25[(3'h4):(2'h3)] << {(8'hbf),
                          wire27}))) : wire27[(1'h0):(1'h0)]);
  assign wire29 = wire27[(2'h3):(1'h0)];
  assign wire30 = {reg25,
                      ((($signed((8'hac)) != reg25) ?
                          {(~|(8'ha2))} : wire28[(4'h9):(2'h2)]) >= wire20[(1'h0):(1'h0)])};
  assign wire31 = (8'ha0);
  assign wire32 = ($unsigned(wire27[(4'hc):(3'h5)]) ?
                      wire22 : (((|(!wire28)) ?
                          (wire30[(3'h6):(2'h3)] ?
                              (^~wire21) : (wire26 ?
                                  wire26 : wire19)) : (reg24 >>> ((8'ha1) ?
                              wire20 : wire22))) ^ $unsigned(((reg25 ?
                              wire29 : wire20) ?
                          $unsigned(wire27) : $signed(wire31)))));
  assign wire33 = $signed(wire27);
  assign wire34 = ((wire20[(4'hd):(2'h3)] ~^ (((wire20 && wire33) && ((8'ha9) ?
                          (8'ha8) : wire28)) ?
                      ($signed(reg24) ?
                          ((8'hb2) | wire32) : (wire22 <<< wire32)) : ($unsigned(wire23) ?
                          wire33[(4'h8):(3'h4)] : (~wire20)))) + ((reg25[(4'hc):(2'h3)] * {reg25}) ?
                      ({$signed(wire30), (wire29 ? wire19 : (8'hbd))} ?
                          ($signed(reg25) ?
                              reg24 : $unsigned(wire29)) : wire32[(2'h2):(2'h2)]) : {wire31[(2'h3):(2'h2)],
                          ((wire23 < wire33) ?
                              $unsigned(wire28) : (|wire29))}));
  assign wire35 = wire23;
  assign wire36 = (((~&$signed($signed(wire22))) ?
                      $signed((((8'hb9) <= wire29) < (wire21 ^ reg24))) : (!$signed({reg25}))) ^~ {(~&($signed(wire29) ^ wire28[(4'hd):(2'h2)])),
                      wire29[(1'h1):(1'h1)]});
  always
    @(posedge clk) begin
      reg37 <= $signed(reg24[(1'h1):(1'h0)]);
      reg38 <= wire20[(4'ha):(4'h8)];
      reg39 <= ({wire33[(1'h1):(1'h1)], wire36} ?
          ($signed($signed({wire36, wire34})) ?
              wire23 : reg38[(2'h3):(2'h2)]) : ({reg24} ?
              (~|({wire23} >> (~|wire34))) : ($signed((~&(8'h9d))) || (reg37 | wire28[(4'h9):(3'h4)]))));
      reg40 <= (+wire28[(4'h8):(4'h8)]);
      reg41 <= wire28[(4'hf):(1'h0)];
    end
endmodule

module module173  (y, clk, wire177, wire176, wire175, wire174);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire177;
  input wire [(4'he):(1'h0)] wire176;
  input wire signed [(2'h3):(1'h0)] wire175;
  input wire [(5'h11):(1'h0)] wire174;
  wire signed [(4'hb):(1'h0)] wire186;
  wire [(5'h11):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire182;
  wire [(5'h15):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire179;
  wire [(4'h8):(1'h0)] wire178;
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg183 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire178 = ($unsigned(($unsigned((wire177 ?
                       (8'ha1) : wire176)) > $unsigned((wire177 ?
                       wire177 : wire174)))) ~^ wire177[(2'h2):(2'h2)]);
  assign wire179 = wire176[(4'hb):(3'h4)];
  assign wire180 = (!wire176[(4'h8):(2'h3)]);
  assign wire181 = {$unsigned($unsigned(({wire176,
                           wire180} & $signed(wire175))))};
  assign wire182 = $unsigned($unsigned((~^wire178[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg183 <= ({((^(wire180 ? wire174 : wire180)) ?
              (((8'ha7) ? wire182 : (8'hb2)) ?
                  wire181[(4'hf):(4'h9)] : $signed(wire180)) : wire181[(5'h13):(3'h7)]),
          (({wire174} == (wire178 ? wire176 : wire179)) ?
              wire182 : ($signed(wire174) == $unsigned(wire174)))} == wire179[(3'h5):(2'h3)]);
      reg184 <= ($unsigned({($signed(wire177) > (wire174 ?
              wire175 : reg183))}) | {wire180, wire182});
    end
  assign wire185 = wire175;
  assign wire186 = (~$unsigned(wire174));
endmodule

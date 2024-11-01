module top
#(parameter param204 = ((((((8'hb4) - (7'h40)) >>> {(7'h42)}) ? ((~(8'hb0)) ? ((7'h43) ? (8'h9e) : (8'h9d)) : ((8'hb1) >= (7'h41))) : (((8'hb3) ? (8'hae) : (8'hb9)) <= (8'hbb))) ^~ (~&(+(~|(8'ha4))))) ? (!((|(~|(8'hb9))) ~^ ({(8'ha0), (8'haa)} <= ((7'h40) >>> (8'ha0))))) : {(~^(~^((8'hae) ? (8'hbc) : (8'hb0))))}), 
parameter param205 = {(^(~|{(param204 ^~ param204), (param204 ^~ param204)})), (((param204 ? {param204, param204} : param204) <<< ((param204 ? (8'hb1) : (8'ha8)) ~^ param204)) ? (((&param204) <<< (param204 ? (8'ha7) : param204)) + param204) : (param204 ? ({param204} >> ((8'hb2) ? param204 : param204)) : param204))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire203;
  wire [(4'hb):(1'h0)] wire202;
  wire signed [(3'h5):(1'h0)] wire200;
  wire [(4'hd):(1'h0)] wire190;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire192;
  wire [(2'h3):(1'h0)] wire193;
  wire signed [(5'h12):(1'h0)] wire194;
  wire signed [(4'h9):(1'h0)] wire198;
  reg signed [(4'hd):(1'h0)] reg197 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire200,
                 wire190,
                 wire144,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 wire192,
                 wire193,
                 wire194,
                 wire198,
                 reg197,
                 reg196,
                 reg195,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = (8'ha6);
  assign wire6 = ($signed(($signed($unsigned(wire4)) != wire4[(1'h0):(1'h0)])) - $signed($unsigned((((7'h44) ^~ wire3) ?
                     wire5 : $unsigned(wire2)))));
  always
    @(posedge clk) begin
      if (((wire2 == wire0[(3'h4):(1'h1)]) >= ($unsigned(wire1) ?
          $signed($unsigned($signed(wire3))) : $unsigned({wire3}))))
        begin
          reg7 <= $unsigned((~^((!$unsigned(wire4)) * (8'h9c))));
          reg8 <= (~&(reg7 ^~ wire1[(5'h11):(5'h11)]));
          reg9 <= (($unsigned((wire2 > {wire5, wire5})) <= {{$signed(wire6),
                  (wire4 <= wire3)}}) + (reg8[(2'h3):(1'h1)] << (!(-$signed(wire1)))));
        end
      else
        begin
          if ($signed(wire2[(2'h2):(1'h0)]))
            begin
              reg7 <= (wire0 ?
                  $signed(wire6[(1'h0):(1'h0)]) : (!(^$unsigned(wire2))));
              reg8 <= (reg8[(3'h6):(1'h0)] + $signed(($unsigned($signed(wire4)) ^~ ((wire3 ?
                  reg9 : (8'ha8)) | wire5[(2'h2):(1'h0)]))));
              reg9 <= (~$signed($signed($signed($signed((8'hb4))))));
              reg10 <= $signed(({wire2} ?
                  wire1[(5'h10):(2'h3)] : ((wire6[(4'h8):(3'h6)] << wire2[(5'h11):(3'h4)]) && wire5)));
            end
          else
            begin
              reg7 <= ((8'ha3) ^~ wire5[(4'h9):(2'h3)]);
              reg8 <= (~&$signed((8'hba)));
            end
        end
    end
  assign wire11 = (wire6[(3'h4):(2'h3)] ?
                      ($unsigned((|$signed((8'ha0)))) ?
                          {(reg7[(1'h0):(1'h0)] ?
                                  (|reg7) : reg10[(1'h1):(1'h0)])} : wire1) : $unsigned((reg10[(1'h0):(1'h0)] | $unsigned((8'ha8)))));
  assign wire12 = (reg7[(2'h2):(1'h0)] ? reg9 : reg7);
  module13 #() modinst145 (.wire17(wire6), .wire18(reg8), .wire16(wire12), .wire14(reg10), .y(wire144), .clk(clk), .wire15(reg7));
  module146 #() modinst191 (wire190, clk, wire3, wire0, reg7, reg8, wire11);
  assign wire192 = $signed(reg8);
  assign wire193 = wire0;
  assign wire194 = wire4[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg195 <= reg9[(3'h4):(2'h2)];
      reg196 <= (({(8'h9f),
          (wire190[(2'h3):(1'h1)] >>> $signed(wire5))} || ((&(wire6 ?
              (8'hb9) : reg7)) ?
          $signed($unsigned(reg195)) : ($unsigned(wire193) >>> wire193[(1'h0):(1'h0)]))) != (&((~(wire190 | wire12)) ?
          ((~(8'ha7)) ?
              $unsigned(reg9) : wire6) : ($unsigned(wire12) != reg9))));
      reg197 <= reg10[(3'h4):(2'h2)];
    end
  module93 #() modinst199 (wire198, clk, wire0, wire190, reg197, wire6);
  module45 #() modinst201 (wire200, clk, wire12, wire11, wire192, wire144, reg196);
  assign wire202 = $signed(((wire200[(2'h3):(2'h2)] ~^ (wire144 != wire144[(4'ha):(3'h6)])) >> (($signed(wire5) >= $signed(reg10)) ?
                       (!$unsigned(wire3)) : (wire4 * $signed(reg10)))));
  assign wire203 = {$signed(reg197[(4'h8):(2'h3)])};
endmodule

module module146
#(parameter param188 = ((^(~|(~&(|(8'h9f))))) ? ((8'hb9) ~^ (({(8'hb5), (8'ha5)} ? ((8'hbf) ? (8'hb2) : (8'hab)) : (~(8'ha3))) <= (~((8'hbd) ? (8'h9c) : (8'ha9))))) : {({((8'h9c) ? (8'hab) : (8'ha6)), {(8'hb7)}} ? (((8'ha2) ? (8'hab) : (8'hb6)) ? ((8'hbe) ? (8'hb7) : (8'h9f)) : ((8'hb1) < (8'hb7))) : (((7'h40) ~^ (8'hb7)) & ((8'ha8) ? (8'h9c) : (8'hba)))), {({(8'ha1)} | ((8'hbe) ? (8'hae) : (7'h42)))}}), 
parameter param189 = (8'ha2))
(y, clk, wire147, wire148, wire149, wire150, wire151);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire147;
  input wire [(4'hb):(1'h0)] wire148;
  input wire signed [(4'he):(1'h0)] wire149;
  input wire signed [(5'h11):(1'h0)] wire150;
  input wire [(5'h10):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire155;
  wire signed [(4'hf):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire159;
  wire [(5'h15):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire185;
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  assign y = {wire152,
                 wire153,
                 wire154,
                 wire155,
                 wire156,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire185,
                 reg187,
                 (1'h0)};
  assign wire152 = (|$unsigned($unsigned(((wire151 | wire148) >> (wire149 || wire150)))));
  assign wire153 = (|$signed((7'h42)));
  assign wire154 = (^~(!((wire147 > $unsigned((8'ha4))) | $unsigned(wire148[(3'h6):(3'h4)]))));
  assign wire155 = {(8'hab)};
  assign wire156 = $unsigned(wire154[(1'h0):(1'h0)]);
  assign wire157 = $unsigned(((8'ha7) ?
                       (wire148[(4'ha):(2'h3)] <<< ((-wire153) ?
                           wire154[(5'h11):(4'hc)] : (~wire153))) : ($unsigned((^~wire156)) ?
                           wire156 : $unsigned((wire151 ~^ (8'haa))))));
  assign wire158 = (&(^~$signed(wire149[(1'h1):(1'h0)])));
  assign wire159 = $unsigned(((8'haf) << wire153[(4'h9):(4'h8)]));
  assign wire160 = wire152;
  module161 #() modinst186 (.wire165(wire148), .wire163(wire157), .y(wire185), .clk(clk), .wire164(wire159), .wire162(wire158), .wire166(wire160));
  always
    @(posedge clk) begin
      reg187 <= wire185;
    end
endmodule

module module13
#(parameter param143 = ((!(8'h9c)) > (^~(((~|(8'hb5)) <= ((8'hac) >>> (8'hb0))) & (((8'ha9) << (8'ha9)) ~^ ((8'hab) == (8'haa)))))))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire140;
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire142,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire43,
                 wire44,
                 wire90,
                 wire92,
                 wire140,
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
                 (1'h0)};
  assign wire19 = (8'hb2);
  assign wire20 = ((8'hb2) ?
                      ({$signed((^~wire19))} ?
                          {wire16,
                              {$signed(wire14),
                                  $signed(wire19)}} : ({$unsigned((8'h9c)),
                              wire17} | ({wire16} == wire15[(2'h2):(1'h0)]))) : wire16[(1'h1):(1'h1)]);
  assign wire21 = (~&({wire15[(3'h5):(1'h0)],
                      ($signed(wire14) >> (wire16 ^ wire20))} | (-({wire14,
                          wire16} ?
                      (&wire18) : wire20[(4'ha):(4'h9)]))));
  assign wire22 = (($unsigned($unsigned(wire20[(1'h1):(1'h0)])) || $unsigned(((wire21 ?
                          wire16 : wire20) ?
                      (8'hb2) : wire21[(4'hf):(4'he)]))) - wire18[(1'h1):(1'h1)]);
  assign wire23 = (~wire19);
  always
    @(posedge clk) begin
      reg24 <= {(($unsigned(wire17) ?
                  ((wire18 > wire15) & (wire18 ?
                      wire18 : (8'hb0))) : (-(-wire18))) ?
              wire14[(1'h1):(1'h0)] : wire18[(2'h2):(2'h2)])};
      if ((wire23[(3'h5):(2'h3)] >>> wire17))
        begin
          reg25 <= wire19;
          reg26 <= ($signed((~&((wire20 <<< wire16) ?
              wire23[(2'h2):(1'h1)] : wire15))) || $signed((|reg24)));
          reg27 <= wire15;
          reg28 <= ($unsigned((((|wire20) ~^ (reg24 ? wire14 : (8'ha2))) ?
                  $unsigned($signed(reg25)) : (8'hbe))) ?
              (~^$unsigned(((&wire18) & (~|wire21)))) : wire21);
        end
      else
        begin
          reg25 <= ($signed(($unsigned(reg25) ?
              wire20 : reg28)) == reg27[(4'h8):(2'h2)]);
          reg26 <= (($unsigned(((~wire17) > $signed(wire20))) ?
              $signed(reg27[(4'h8):(1'h0)]) : wire20[(3'h5):(2'h3)]) >> wire17[(2'h3):(2'h2)]);
          reg27 <= wire19;
          if (wire14[(1'h0):(1'h0)])
            begin
              reg28 <= wire19;
              reg29 <= wire14;
              reg30 <= (($unsigned($signed(wire23)) ?
                  wire18[(2'h2):(1'h0)] : (~|(^$signed(wire20)))) <= {reg29[(2'h3):(2'h2)]});
            end
          else
            begin
              reg28 <= (reg24[(4'h8):(3'h5)] ?
                  ({(&((8'hb4) ^~ reg24))} ?
                      {((^reg30) >>> (~|(8'hb2))),
                          (reg28[(4'hc):(4'h9)] >>> (wire14 & wire21))} : reg28[(1'h1):(1'h1)]) : $signed(reg28));
            end
          if ({$unsigned(wire22), (~|$signed($unsigned((~^wire19))))})
            begin
              reg31 <= wire23;
              reg32 <= $signed({$signed(wire20)});
            end
          else
            begin
              reg31 <= (8'h9d);
              reg32 <= ($unsigned((((reg27 ? reg28 : wire19) ?
                  (wire21 ? reg31 : reg31) : (reg27 ?
                      reg24 : wire23)) - $unsigned($signed(wire17)))) != (8'hbb));
            end
        end
      reg33 <= reg31;
    end
  always
    @(posedge clk) begin
      reg34 <= wire18;
      reg35 <= $signed({($signed($signed((8'h9f))) ?
              wire16 : ($signed(wire23) ?
                  (reg34 && wire18) : $unsigned((8'hac))))});
      if (((reg29 ? wire14 : (-$signed((reg34 >>> wire17)))) & (~&wire20)))
        begin
          reg36 <= ((~^(~^reg31)) & (~^(7'h41)));
          reg37 <= {$unsigned((|$unsigned((~|wire19)))),
              ((+(8'hbd)) >> ($signed((wire17 ?
                  reg26 : reg28)) + reg30[(1'h0):(1'h0)]))};
          reg38 <= $signed($signed((reg26[(1'h1):(1'h0)] ?
              {wire18[(2'h2):(1'h1)]} : ($signed(wire22) ?
                  $unsigned(wire22) : (+(8'ha5))))));
        end
      else
        begin
          reg36 <= $unsigned((^~($signed((wire20 >>> reg24)) + wire22)));
          reg37 <= wire23[(4'hc):(4'ha)];
          reg38 <= (wire17 > wire14[(1'h1):(1'h1)]);
          if (reg25)
            begin
              reg39 <= $signed($signed(reg35));
              reg40 <= $unsigned(({wire23[(4'ha):(3'h7)]} <<< $unsigned(reg25[(3'h4):(1'h0)])));
              reg41 <= $unsigned((~^$signed($unsigned(reg38[(4'h9):(3'h6)]))));
              reg42 <= reg36[(3'h4):(3'h4)];
            end
          else
            begin
              reg39 <= reg30[(1'h1):(1'h1)];
              reg40 <= $signed(wire16[(4'ha):(3'h5)]);
              reg41 <= {{(8'h9f)},
                  ($signed(wire17) ^ (+(reg35 ?
                      reg40 : (wire20 ? reg42 : wire16))))};
            end
        end
    end
  assign wire43 = (~$signed((reg25 | ({reg38, reg40} ?
                      wire21 : $unsigned(reg26)))));
  assign wire44 = $signed((reg41 | $signed(($unsigned((8'ha9)) | {reg33}))));
  module45 #() modinst91 (.wire47(reg31), .y(wire90), .wire49(wire19), .wire50(reg37), .clk(clk), .wire48(reg36), .wire46(wire43));
  assign wire92 = {{$unsigned($signed($unsigned(reg31)))}};
  module93 #() modinst141 (wire140, clk, reg32, wire92, reg39, reg35);
  assign wire142 = wire22;
endmodule

module module93
#(parameter param138 = (+(((((8'haf) >> (8'hb0)) ? {(8'ha9), (8'hae)} : ((8'hbb) ? (8'ha6) : (8'hbe))) ? (-{(8'ha7)}) : ({(8'hb0), (8'ha7)} >>> ((8'h9d) ? (7'h43) : (8'hb6)))) << ((~(8'hb2)) <= ((^(8'hab)) ? (~(8'ha7)) : ((8'hb6) ? (8'hbd) : (8'haa)))))), 
parameter param139 = {({param138, param138} != (+(+(|param138)))), (param138 ? {((param138 ? param138 : param138) ? (param138 ? param138 : (8'ha0)) : (^~param138)), ((param138 < param138) || (param138 ^ (8'hb2)))} : param138)})
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire97;
  input wire [(4'hd):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  assign y = {wire137,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg136,
                 reg135,
                 reg134,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg99,
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= $signed($signed($unsigned(wire94[(4'ha):(2'h3)])));
      reg99 <= ($unsigned({({wire94} + {(8'ha9), (8'ha6)})}) ?
          wire96[(1'h1):(1'h1)] : ({$signed(wire94[(4'hd):(1'h1)])} || ((wire95 & (wire96 == (8'hbe))) ?
              $signed((wire97 ? reg98 : reg98)) : wire96)));
    end
  assign wire100 = wire97[(4'h9):(1'h0)];
  assign wire101 = wire96[(4'ha):(1'h0)];
  assign wire102 = (wire96 * wire101);
  assign wire103 = (~&(^($signed(wire96[(2'h2):(2'h2)]) || $unsigned(wire94[(5'h12):(5'h12)]))));
  assign wire104 = $unsigned((+wire96[(4'ha):(1'h1)]));
  assign wire105 = (^(^($unsigned((wire101 ? wire102 : wire96)) ?
                       $unsigned($unsigned(wire97)) : (((8'ha8) ~^ wire102) > {wire96}))));
  assign wire106 = wire104;
  always
    @(posedge clk) begin
      reg107 <= ($unsigned((reg99 ?
          (~&(wire96 ?
              (7'h40) : wire106)) : wire101)) <= ($signed(wire105[(3'h4):(3'h4)]) >>> wire104[(4'hb):(3'h6)]));
      if ((wire105 & (8'hbb)))
        begin
          reg108 <= (wire96[(4'hc):(4'hb)] ?
              $unsigned($signed($signed(wire106[(4'h8):(3'h6)]))) : (|(wire101 + reg107[(5'h10):(3'h5)])));
          if ((($unsigned($signed((wire95 ^~ reg108))) ?
              $signed($unsigned((wire97 <= wire103))) : (reg108 ?
                  ($signed((8'ha5)) ?
                      {wire94,
                          reg99} : wire104[(4'h8):(1'h0)]) : ((wire94 ~^ wire102) ?
                      (~^wire106) : wire105))) || ((wire103 ?
                  {reg108[(2'h3):(2'h3)]} : (~&reg98)) ?
              $signed(reg99[(1'h0):(1'h0)]) : (^~$unsigned(wire106[(4'h8):(4'h8)])))))
            begin
              reg109 <= (&($signed((reg98[(1'h0):(1'h0)] ?
                      $signed(wire102) : $unsigned(wire96))) ?
                  wire105 : {$signed((reg107 == (8'ha0)))}));
              reg110 <= wire95[(2'h3):(1'h1)];
              reg111 <= $unsigned(($unsigned($unsigned(reg99[(2'h2):(2'h2)])) != (~|((reg108 << wire97) ?
                  (wire95 + wire103) : (wire103 ? (8'h9d) : wire97)))));
              reg112 <= (8'hae);
              reg113 <= (reg111 ^~ wire103);
            end
          else
            begin
              reg109 <= $unsigned((~|(8'ha4)));
              reg110 <= ((|($unsigned((wire105 ? reg111 : reg113)) ?
                      (wire94[(2'h3):(1'h1)] << (wire103 & wire103)) : $signed((reg108 && reg107)))) ?
                  ((((wire106 ? wire97 : wire100) ?
                          ((8'hb3) >= (8'hab)) : wire94[(2'h3):(1'h0)]) >>> wire102) ?
                      reg107 : $unsigned((|$unsigned(wire105)))) : $signed($unsigned(($unsigned(wire101) ?
                      $signed((8'hae)) : (reg110 ? reg109 : wire106)))));
              reg111 <= (reg99 ^~ $unsigned(wire96));
              reg112 <= wire96;
              reg113 <= (8'ha5);
            end
        end
      else
        begin
          reg108 <= ($signed(reg113) ^~ (!(8'hb7)));
          reg109 <= reg110;
          reg110 <= $unsigned({$unsigned($unsigned(wire105[(3'h6):(2'h2)]))});
          reg111 <= (($signed(reg111) - wire96) ?
              reg107[(5'h11):(2'h3)] : ({{(-(8'hbc))}} + (&((+reg98) || (~|wire97)))));
        end
      reg114 <= (reg98[(4'h9):(3'h6)] ^~ reg113);
      if ($signed(wire94[(3'h5):(2'h2)]))
        begin
          reg115 <= (~^((|((-reg107) + (reg108 ^ wire104))) ?
              {($signed((8'hbb)) > {reg107, reg113})} : (-({reg113,
                  wire105} || wire94[(2'h3):(2'h2)]))));
          if ($unsigned(wire104[(3'h7):(3'h6)]))
            begin
              reg116 <= $signed((8'hb1));
              reg117 <= (($signed(((~|reg116) ?
                      (~^wire97) : wire103[(3'h7):(2'h3)])) ?
                  $unsigned(wire101[(3'h4):(2'h3)]) : ((8'ha4) ?
                      (~((8'ha2) && reg110)) : wire106[(4'hd):(4'h8)])) ^~ (~|(wire96 ?
                  ((reg114 ? wire101 : reg113) || (~^reg112)) : (&wire94))));
            end
          else
            begin
              reg116 <= reg98[(4'h9):(3'h4)];
              reg117 <= (($signed(wire97) ?
                      reg108 : (({wire106} <= (wire106 || reg110)) << (^~(-reg99)))) ?
                  $unsigned({reg98[(4'h9):(2'h3)]}) : wire96[(4'hd):(2'h3)]);
              reg118 <= $unsigned({wire103[(4'h8):(3'h7)]});
              reg119 <= reg110[(4'hb):(2'h3)];
              reg120 <= $signed(wire105);
            end
          reg121 <= reg115[(4'hb):(1'h1)];
        end
      else
        begin
          if ($signed((~|wire97[(1'h1):(1'h1)])))
            begin
              reg115 <= {reg120};
              reg116 <= ($unsigned($signed(((reg121 ?
                      wire101 : wire105) + (reg112 ? (8'hb9) : reg108)))) ?
                  ((^~(~&(wire96 ^ reg110))) ?
                      $unsigned((reg111[(3'h5):(3'h4)] ?
                          $unsigned(reg114) : (reg108 ^~ reg108))) : ($signed((reg114 ?
                          reg120 : reg115)) * ($unsigned(wire104) * ((7'h42) >= reg108)))) : $signed(wire106));
              reg117 <= $unsigned((+(+{$unsigned(reg110)})));
              reg118 <= wire105[(3'h6):(1'h1)];
            end
          else
            begin
              reg115 <= reg117[(3'h5):(2'h3)];
            end
          reg119 <= ((-wire102) ^ reg115[(4'hd):(3'h4)]);
          reg120 <= {($signed((-(wire103 == wire96))) ?
                  reg119 : $signed($signed({wire103, wire106})))};
          reg121 <= {(({(|wire101), $signed(wire94)} ?
                  $signed((reg111 ? wire102 : wire94)) : $unsigned({reg109,
                      wire100})) == (^$signed($unsigned(reg113))))};
          reg122 <= (~^({reg98} ?
              (^~$signed((wire106 >= reg118))) : $unsigned($unsigned((~reg114)))));
        end
      if ((^~reg98[(5'h10):(3'h5)]))
        begin
          reg123 <= (~$unsigned(wire95[(4'h8):(2'h2)]));
          reg124 <= ({(reg98 - $unsigned((reg123 ? (8'hb7) : (8'ha3)))),
                  {reg121[(1'h0):(1'h0)],
                      {$signed(wire105), {reg118, wire97}}}} ?
              reg112[(4'he):(1'h0)] : (reg120 || (^(reg110 ?
                  reg112 : (+wire106)))));
          reg125 <= (reg108[(3'h4):(2'h3)] ?
              reg115[(5'h13):(5'h13)] : (^~$signed(((reg116 ?
                      (7'h44) : (7'h41)) ?
                  $unsigned(wire97) : $unsigned(wire103)))));
          reg126 <= $unsigned(reg123[(3'h4):(1'h1)]);
        end
      else
        begin
          if ($unsigned($unsigned(((|(reg113 >>> wire96)) < $signed((~^(7'h41)))))))
            begin
              reg123 <= $signed(reg121[(1'h0):(1'h0)]);
              reg124 <= ($signed($unsigned((~|(reg109 > reg122)))) ?
                  {($unsigned(reg125[(1'h0):(1'h0)]) * $signed($unsigned((8'ha2)))),
                      (^reg107)} : ((reg120[(3'h5):(3'h5)] | $signed(wire96)) >>> (7'h41)));
              reg125 <= wire100;
            end
          else
            begin
              reg123 <= $unsigned({{$signed($signed(wire100))}});
              reg124 <= (reg107 ?
                  reg98[(3'h5):(1'h1)] : $unsigned($unsigned(reg111)));
            end
          reg126 <= ($signed((reg118 << $signed((reg123 * wire105)))) ?
              reg121 : $signed($unsigned({(~reg121)})));
          reg127 <= ($unsigned(wire95[(3'h6):(3'h6)]) ?
              $unsigned((~^((wire94 * (8'hb3)) ~^ (~^reg125)))) : $signed((~{(wire94 <<< (8'hb8))})));
        end
    end
  assign wire128 = $unsigned(reg108);
  assign wire129 = (^~$signed((wire97 > reg116)));
  assign wire130 = (($signed(($unsigned(wire128) ? reg119 : (-wire101))) ?
                       {$unsigned($signed(wire103))} : wire129[(1'h1):(1'h1)]) - reg112[(4'hd):(4'hb)]);
  assign wire131 = $unsigned(({$unsigned(wire97)} ?
                       ((^$signed(reg112)) * (^~wire129)) : (reg108[(2'h2):(1'h0)] ^~ $unsigned(reg118))));
  assign wire132 = reg111;
  assign wire133 = (+$signed((($unsigned(reg127) ?
                       (wire132 ? reg98 : wire96) : (reg108 ?
                           wire96 : reg108)) ~^ wire101)));
  always
    @(posedge clk) begin
      reg134 <= $signed((8'ha8));
      reg135 <= ((reg134 ^~ ((reg120[(3'h7):(3'h7)] ?
          reg110[(4'h8):(2'h3)] : ((8'hb3) ?
              reg124 : wire103)) <= (-reg98[(4'hb):(1'h1)]))) - $unsigned((^~reg107[(4'hf):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg136 <= wire104[(3'h7):(1'h0)];
    end
  assign wire137 = {reg127[(4'hb):(3'h6)]};
endmodule

module module45
#(parameter param89 = ((&((((8'ha6) ? (8'haa) : (8'haf)) << ((8'haa) ? (8'h9c) : (8'h9f))) | (((8'hbb) >= (8'ha7)) != (+(8'ha7))))) ? (((~((8'ha3) <<< (8'hb6))) ^~ (~((8'ha1) ? (8'ha8) : (8'hb5)))) ? ((8'h9c) ? (((8'ha9) & (8'hb9)) - {(8'ha8)}) : (8'hb1)) : ((~((8'hb4) | (8'hbc))) ? (+(8'hb9)) : (!(~^(8'ha9))))) : (^({((7'h41) ~^ (8'hb6))} * (((8'h9d) ? (8'ha2) : (8'ha7)) - {(8'h9d)})))))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h1db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire50;
  input wire signed [(2'h3):(1'h0)] wire49;
  input wire signed [(4'h9):(1'h0)] wire48;
  input wire [(2'h3):(1'h0)] wire47;
  input wire signed [(2'h2):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire72,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
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
                 (1'h0)};
  assign wire51 = $unsigned(wire47);
  assign wire52 = wire46;
  assign wire53 = wire46[(2'h2):(1'h0)];
  assign wire54 = ($unsigned($unsigned(wire48)) ^ (^$signed(wire50[(4'hd):(4'h8)])));
  always
    @(posedge clk) begin
      if ({(((wire50[(3'h4):(3'h4)] * $unsigned(wire46)) ?
                  (|(8'hac)) : wire52[(3'h5):(1'h1)]) ?
              ($unsigned((|wire50)) == $unsigned({wire53})) : ((!$signed((8'ha2))) != $unsigned((^~wire47)))),
          wire54})
        begin
          if ($signed((7'h42)))
            begin
              reg55 <= $signed($unsigned($signed((8'ha3))));
              reg56 <= $signed($unsigned((($unsigned(wire51) ^ wire48[(3'h4):(2'h3)]) < $signed((wire53 ?
                  wire48 : wire48)))));
            end
          else
            begin
              reg55 <= wire49;
              reg56 <= $unsigned(wire51[(3'h4):(3'h4)]);
              reg57 <= wire52;
            end
          if (reg55)
            begin
              reg58 <= wire53[(4'hb):(4'h9)];
              reg59 <= (^(8'had));
            end
          else
            begin
              reg58 <= wire54[(2'h3):(2'h2)];
              reg59 <= (~($unsigned(wire48) ?
                  (+((~^wire46) ?
                      $signed(reg59) : (wire53 ? wire54 : wire54))) : wire48));
            end
          reg60 <= ((~$unsigned((~|wire47))) ?
              {reg58} : {$signed($unsigned((^~wire50))), (!(^wire47))});
          if (reg55)
            begin
              reg61 <= (~^($signed($unsigned($unsigned(wire51))) >>> ((~^reg57[(3'h7):(3'h6)]) ?
                  $signed((|reg56)) : $unsigned({reg57, wire52}))));
              reg62 <= (reg56 ?
                  ({wire46[(2'h2):(1'h1)]} ?
                      reg60[(1'h1):(1'h0)] : reg57[(3'h7):(3'h7)]) : reg60[(4'h8):(2'h2)]);
              reg63 <= $signed({$unsigned($signed((wire46 ? reg62 : reg59))),
                  wire52[(3'h4):(1'h1)]});
              reg64 <= ((~|{(8'hab),
                  reg57}) ^~ $signed($unsigned((!$unsigned(wire48)))));
            end
          else
            begin
              reg61 <= $signed(reg62);
              reg62 <= reg55;
              reg63 <= $unsigned($signed((~&($unsigned(reg56) ?
                  {reg57, wire48} : $signed(reg58)))));
            end
          if ($signed(($signed((~&$signed(wire47))) || $signed(((wire54 ?
                  wire46 : (8'had)) ?
              $signed(wire50) : wire48[(3'h4):(1'h0)])))))
            begin
              reg65 <= (^reg61[(4'he):(3'h6)]);
              reg66 <= (~^reg55[(2'h3):(1'h0)]);
              reg67 <= wire48;
            end
          else
            begin
              reg65 <= (reg58[(1'h1):(1'h1)] ? (&(^~(^~{reg66}))) : reg58);
              reg66 <= (~$signed(reg56[(1'h1):(1'h0)]));
              reg67 <= reg59[(4'hc):(1'h0)];
            end
        end
      else
        begin
          reg55 <= $signed((reg61 ?
              ($signed($unsigned(reg63)) << wire54[(4'ha):(2'h2)]) : (8'hac)));
          if ((wire54 << {{reg67},
              ($unsigned({wire46}) ?
                  wire50[(4'he):(3'h7)] : (reg58[(3'h4):(1'h0)] ^ (reg55 >> wire53)))}))
            begin
              reg56 <= $unsigned((8'h9d));
            end
          else
            begin
              reg56 <= $signed($unsigned(((((8'hbe) * wire54) || {reg57}) ?
                  (((7'h42) < reg59) * $unsigned(reg66)) : ($signed((7'h42)) ?
                      reg58[(4'h9):(3'h5)] : (reg61 ? (8'hb4) : (8'ha4))))));
              reg57 <= $signed((({{reg59, wire47}, {reg58, wire47}} ?
                      reg55[(1'h0):(1'h0)] : $unsigned(reg56[(2'h2):(1'h0)])) ?
                  $signed($unsigned((-reg67))) : (|(reg66[(2'h2):(2'h2)] - ((8'h9e) + wire48)))));
            end
          if (reg56)
            begin
              reg58 <= ((wire49[(1'h0):(1'h0)] >= $signed($signed((!wire51)))) ?
                  reg59[(5'h10):(3'h6)] : (-(|({reg63,
                      reg55} ~^ $unsigned(reg64)))));
              reg59 <= $unsigned((($signed({(8'hbe)}) ?
                  ((reg56 <= reg57) != (|reg63)) : {$signed(wire46)}) && $signed(($signed(reg62) | {wire49}))));
              reg60 <= ({wire53[(2'h2):(1'h0)], reg60} >> ((($signed((7'h42)) ?
                      (reg63 ?
                          wire48 : reg55) : $unsigned(reg63)) - ((wire53 ^ reg66) ?
                      $unsigned(reg55) : wire50)) ?
                  (((^reg61) + ((8'ha1) <= wire51)) * reg64[(4'h8):(3'h7)]) : $signed(((reg59 ?
                      wire49 : (8'ha5)) <<< (|reg66)))));
            end
          else
            begin
              reg58 <= wire49;
              reg59 <= reg66;
            end
          reg61 <= {$unsigned(reg67[(4'he):(3'h7)])};
          if ($unsigned((($unsigned(wire47[(1'h1):(1'h1)]) > $unsigned($unsigned(reg64))) << (8'h9d))))
            begin
              reg62 <= {($unsigned((~$unsigned(wire49))) << {$signed((~&wire53)),
                      (wire50 >> $signed(wire54))})};
            end
          else
            begin
              reg62 <= ((wire52 ?
                  (-$signed(wire47[(2'h3):(2'h3)])) : $signed(((wire47 ?
                          reg61 : reg61) ?
                      $unsigned(reg56) : (wire49 ?
                          reg57 : (8'hb8))))) ~^ reg61[(4'hb):(1'h1)]);
              reg63 <= $signed($signed((($signed(reg62) ?
                      (reg59 == reg62) : $unsigned((8'ha6))) ?
                  reg57[(3'h4):(1'h1)] : $signed($unsigned(wire52)))));
              reg64 <= wire46;
            end
        end
      reg68 <= ($unsigned((^~reg60)) != (~|wire48));
      reg69 <= {$unsigned($signed($unsigned($signed((8'ha1)))))};
      reg70 <= ($signed(reg59[(3'h6):(1'h1)]) >>> ((-reg63[(2'h2):(1'h1)]) || ($unsigned($signed(wire47)) <<< ($unsigned((7'h40)) == $signed(reg67)))));
      reg71 <= (8'hb3);
    end
  assign wire72 = (({((8'hae) ? (~&wire54) : $unsigned(reg62)),
                              $unsigned((reg58 - reg55))} ?
                          reg62[(4'hc):(2'h2)] : (~&$unsigned({reg62}))) ?
                      ((($unsigned(reg62) & $unsigned(reg58)) != $signed((~wire46))) ?
                          $unsigned(wire52) : ($signed((reg60 ?
                                  wire46 : (8'hb1))) ?
                              (~|$signed(reg70)) : ($unsigned(reg65) ?
                                  {reg61, wire52} : (reg65 ?
                                      (8'had) : reg56)))) : reg61);
  always
    @(posedge clk) begin
      reg73 <= (reg55 ?
          reg55[(2'h2):(2'h2)] : $unsigned($signed(((8'haf) ?
              (~^(8'hba)) : $unsigned(wire48)))));
      if (reg65[(3'h4):(2'h2)])
        begin
          if (reg69)
            begin
              reg74 <= $signed(($unsigned($signed((^~reg68))) ?
                  (|reg71[(1'h0):(1'h0)]) : $unsigned(($signed(reg66) & (-reg69)))));
            end
          else
            begin
              reg74 <= (~&$unsigned(wire46));
              reg75 <= {$signed($signed($signed(reg59[(4'h8):(3'h7)])))};
            end
          reg76 <= (reg70[(1'h1):(1'h1)] ?
              {$signed(($signed(reg58) ?
                      (|reg64) : $signed(wire46)))} : $signed({(~^(reg75 ?
                      reg67 : reg68)),
                  (~|$signed(reg73))}));
          reg77 <= ((wire50[(1'h1):(1'h0)] >>> reg64[(3'h7):(3'h7)]) ?
              $signed($signed(((reg70 == wire46) ?
                  reg74[(1'h1):(1'h1)] : (reg71 ?
                      reg70 : wire54)))) : $unsigned($signed(($unsigned(reg59) ?
                  wire52 : (-reg63)))));
          reg78 <= wire72[(3'h5):(1'h1)];
        end
      else
        begin
          reg74 <= $unsigned((|reg73));
          if ($signed($unsigned(((^~(8'hbe)) ?
              ($unsigned(reg78) ? (reg60 + reg59) : (~|reg68)) : reg78))))
            begin
              reg75 <= (reg71[(1'h1):(1'h0)] + (($unsigned(reg65) ?
                  (^~$unsigned(reg68)) : reg56[(1'h1):(1'h0)]) && reg56));
            end
          else
            begin
              reg75 <= $signed(wire51);
              reg76 <= $unsigned((!$signed($unsigned((&reg65)))));
              reg77 <= ((reg60[(1'h1):(1'h1)] == $signed(wire51[(1'h0):(1'h0)])) | reg64[(4'hd):(4'h9)]);
              reg78 <= ($signed(((reg60[(3'h7):(3'h6)] ?
                  (reg77 ? reg58 : reg59) : $signed(reg63)) ~^ {{reg67},
                  (wire47 ? wire50 : wire47)})) ^~ ($signed($signed((reg62 ?
                      reg59 : wire54))) ?
                  (($signed(wire46) == $signed(reg60)) > $unsigned(wire52)) : $unsigned($signed((|reg61)))));
              reg79 <= $signed(wire52[(3'h7):(2'h2)]);
            end
          if ($signed(((~$unsigned((reg67 - reg56))) <<< $unsigned((8'hb2)))))
            begin
              reg80 <= wire49[(1'h0):(1'h0)];
              reg81 <= {{(~(~^(wire48 ? (8'hb7) : reg73))), (^reg60)},
                  (((^~(8'h9d)) ?
                          (reg73[(4'he):(3'h7)] && reg73[(4'h8):(1'h1)]) : $signed({reg68,
                              wire49})) ?
                      $unsigned({wire48}) : reg65)};
            end
          else
            begin
              reg80 <= (wire72 ?
                  $signed((~&(&$signed(wire50)))) : (+(~&$signed($unsigned(wire48)))));
            end
        end
      reg82 <= ($unsigned($signed($signed(reg65[(2'h3):(1'h1)]))) + $signed($unsigned({$unsigned(reg76)})));
    end
  assign wire83 = reg68;
  assign wire84 = wire49[(1'h1):(1'h1)];
  assign wire85 = (!{wire54});
  assign wire86 = reg70[(1'h0):(1'h0)];
  assign wire87 = (|((((wire48 << reg77) ?
                      (reg81 ?
                          (8'ha5) : (8'hbb)) : reg78) != $unsigned($unsigned(wire84))) ^ $unsigned(((!reg77) <<< $signed(reg66)))));
  assign wire88 = ((8'hb4) ?
                      reg79[(5'h12):(4'ha)] : $unsigned((~{wire53[(2'h3):(1'h0)]})));
endmodule

module module161  (y, clk, wire166, wire165, wire164, wire163, wire162);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire166;
  input wire signed [(2'h3):(1'h0)] wire165;
  input wire signed [(2'h2):(1'h0)] wire164;
  input wire signed [(4'ha):(1'h0)] wire163;
  input wire [(4'hb):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire184;
  wire signed [(5'h14):(1'h0)] wire183;
  wire [(4'hf):(1'h0)] wire182;
  wire signed [(4'he):(1'h0)] wire181;
  wire signed [(4'hb):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire179;
  wire signed [(5'h12):(1'h0)] wire178;
  wire signed [(5'h15):(1'h0)] wire177;
  wire [(4'hf):(1'h0)] wire174;
  wire [(4'hd):(1'h0)] wire173;
  wire [(3'h7):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire171;
  wire signed [(4'h8):(1'h0)] wire170;
  wire signed [(5'h11):(1'h0)] wire169;
  wire [(4'hb):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire167;
  reg [(4'he):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg176,
                 reg175,
                 (1'h0)};
  assign wire167 = {$signed(wire164), wire162};
  assign wire168 = {$unsigned({wire163})};
  assign wire169 = wire166;
  assign wire170 = (^~$unsigned((wire167[(1'h0):(1'h0)] ?
                       ((wire162 == (8'hb5)) ?
                           (~^wire162) : $unsigned(wire166)) : {wire166[(3'h4):(2'h3)]})));
  assign wire171 = $signed((wire164[(1'h0):(1'h0)] > (&wire167)));
  assign wire172 = (~$signed($signed(({wire163, wire164} << (~|wire163)))));
  assign wire173 = wire166;
  assign wire174 = (({((wire171 ?
                               wire173 : wire173) < $signed(wire166))} >>> ((&(+wire164)) | ((-wire170) * ((8'hbb) ^ wire173)))) ?
                       $signed(($signed({wire170}) <<< $unsigned((-wire168)))) : wire168);
  always
    @(posedge clk) begin
      reg175 <= $signed(wire172);
      reg176 <= ($unsigned((~|wire164)) != wire171);
    end
  assign wire177 = (8'ha6);
  assign wire178 = wire172;
  assign wire179 = (&(((wire166 ?
                       (wire167 >= reg175) : $signed(wire173)) && (wire173[(2'h2):(1'h0)] ?
                       $signed(wire168) : $unsigned(wire164))) ^~ (wire169[(4'h9):(3'h4)] ?
                       {(~^wire168)} : (~^wire167))));
  assign wire180 = ((((wire163 > ((8'hb8) ? (8'hb8) : wire170)) ?
                               ($signed(wire167) ~^ wire164[(1'h1):(1'h0)]) : $signed((wire168 <<< wire171))) ?
                           (wire173[(4'h9):(4'h8)] ^ (+wire177)) : (~(wire162[(2'h2):(2'h2)] ?
                               ((8'hb4) && wire173) : (wire173 ?
                                   wire163 : (8'hbe))))) ?
                       (-$signed(wire173)) : wire165[(2'h3):(1'h1)]);
  assign wire181 = ($signed($signed((~^{wire163}))) ^~ (~&$unsigned($unsigned((wire173 && (8'hb1))))));
  assign wire182 = (wire162[(3'h6):(2'h2)] ?
                       (($unsigned((wire178 <<< wire179)) | $unsigned(wire174)) >>> $signed(((reg176 > wire172) ~^ $unsigned(reg175)))) : $unsigned($unsigned((~&wire180))));
  assign wire183 = wire177;
  assign wire184 = $signed(($unsigned(reg175) ?
                       (^~$unsigned($signed((8'had)))) : ($unsigned((~wire178)) | ($unsigned(wire181) ?
                           (^wire172) : (+wire168)))));
endmodule

module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire185;
  wire signed [(4'hd):(1'h0)] wire184;
  wire [(5'h11):(1'h0)] wire183;
  wire signed [(4'hf):(1'h0)] wire182;
  wire [(3'h7):(1'h0)] wire180;
  wire [(5'h11):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire [(5'h14):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire180,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire5,
                 wire4,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire4 = ({wire1[(3'h5):(2'h2)],
                         (~|{wire3[(4'hf):(2'h2)], wire3[(4'ha):(1'h1)]})} ?
                     (wire2[(4'h9):(1'h1)] ?
                         $unsigned(wire3[(3'h7):(1'h1)]) : wire1[(1'h1):(1'h0)]) : ($unsigned(($unsigned(wire3) ?
                         wire3 : {wire3,
                             wire2})) || (wire1 + wire3[(3'h4):(2'h3)])));
  assign wire5 = wire2;
  module6 #() modinst109 (wire108, clk, wire2, wire5, wire3, wire1);
  assign wire110 = (|wire5);
  assign wire111 = ($signed(wire1[(1'h0):(1'h0)]) ?
                       wire108 : {(((wire4 ?
                               wire110 : wire108) < (wire110 << wire4)) & {(^wire0)}),
                           $unsigned($signed((|wire0)))});
  assign wire112 = {wire108[(2'h2):(1'h0)]};
  assign wire113 = $unsigned(wire112[(3'h5):(1'h0)]);
  assign wire114 = (wire2 ? $unsigned((~(&(~wire3)))) : wire2[(4'hf):(4'hb)]);
  always
    @(posedge clk) begin
      reg115 <= (wire110 - (($unsigned((wire112 ?
          wire112 : wire110)) >>> (^((8'h9c) <= wire5))) * (($signed(wire108) ^ ((8'ha3) ?
              wire1 : wire2)) ?
          ({wire2, (8'hbd)} & $signed(wire111)) : wire114[(4'hb):(1'h0)])));
      if ($signed($signed((8'ha2))))
        begin
          reg116 <= wire113;
          reg117 <= $signed({wire4[(4'h9):(1'h1)]});
          reg118 <= reg117[(4'hd):(4'h9)];
          reg119 <= ((^~$signed((reg117[(2'h3):(1'h0)] ?
              reg116[(3'h4):(2'h3)] : (8'hb5)))) & wire3);
        end
      else
        begin
          if ($unsigned(reg118))
            begin
              reg116 <= wire114;
              reg117 <= wire110[(5'h11):(5'h10)];
              reg118 <= wire5[(4'ha):(3'h7)];
              reg119 <= wire4;
              reg120 <= $signed($unsigned(reg119));
            end
          else
            begin
              reg116 <= reg117;
            end
        end
      reg121 <= (-reg118);
    end
  assign wire122 = (reg119[(2'h2):(1'h1)] ?
                       wire108 : $unsigned({reg118[(4'hc):(3'h6)],
                           ({wire2} ?
                               ((7'h43) ? reg120 : reg117) : (^~(8'hab)))}));
  assign wire123 = $signed(wire4[(4'h8):(1'h0)]);
  assign wire124 = reg117;
  assign wire125 = $signed($signed(wire113[(3'h5):(3'h4)]));
  assign wire126 = reg117;
  assign wire127 = wire126[(1'h1):(1'h1)];
  assign wire128 = ($signed($unsigned(((wire113 == (8'hb9)) >= (wire4 ?
                       wire0 : wire111)))) != reg121[(4'h8):(1'h1)]);
  module129 #() modinst181 (wire180, clk, wire114, wire122, wire125, wire123);
  assign wire182 = wire128;
  assign wire183 = ((~$signed(wire180)) ?
                       ((^~wire128) - $unsigned($unsigned({reg116,
                           (8'hae)}))) : (|{(~|wire3)}));
  assign wire184 = wire112;
  assign wire185 = wire123;
endmodule

module module129
#(parameter param178 = {({{((8'had) ? (8'hb6) : (8'ha1)), ((8'ha5) || (8'hba))}, ({(8'ha1), (8'hae)} ? ((8'ha2) >= (8'h9e)) : (^~(8'hbf)))} << (((+(7'h42)) <<< (&(8'hbf))) << (&(~^(8'hbd)))))}, 
parameter param179 = (((param178 <<< {(~^(8'hbe))}) > (~|((param178 ? param178 : param178) ? param178 : (param178 ? param178 : param178)))) ? (param178 <<< (&(~&param178))) : ({((-param178) | {param178, param178}), ((~^param178) ? (~|param178) : (param178 ? param178 : (7'h43)))} ? (~&((param178 ? param178 : param178) ? (^param178) : param178)) : (8'ha6))))
(y, clk, wire130, wire131, wire132, wire133);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire130;
  input wire signed [(4'ha):(1'h0)] wire131;
  input wire [(3'h7):(1'h0)] wire132;
  input wire [(5'h11):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire169;
  wire signed [(2'h2):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire166;
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire166,
                 reg177,
                 reg176,
                 reg175,
                 (1'h0)};
  assign wire134 = $unsigned(({wire131,
                       {wire131[(3'h4):(2'h2)]}} && (-$signed(wire130[(1'h0):(1'h0)]))));
  assign wire135 = wire133;
  assign wire136 = wire130;
  assign wire137 = wire134;
  assign wire138 = wire132;
  assign wire139 = wire134[(2'h2):(1'h0)];
  assign wire140 = wire139;
  assign wire141 = {$signed({{$signed(wire139)}}), wire138};
  assign wire142 = $unsigned($signed((wire130 < wire136[(3'h6):(1'h0)])));
  module143 #() modinst167 (.wire146(wire130), .clk(clk), .wire144(wire142), .wire148(wire133), .wire147(wire134), .wire145(wire139), .y(wire166));
  assign wire168 = wire137;
  assign wire169 = wire140[(3'h6):(3'h6)];
  assign wire170 = (wire131 ?
                       (-$signed(($unsigned((8'hb6)) ?
                           (wire131 < wire135) : $unsigned(wire141)))) : (wire141[(2'h2):(1'h1)] >>> $signed($signed((wire133 | (8'hbc))))));
  assign wire171 = wire134;
  assign wire172 = $unsigned((((wire133 ?
                           wire130 : $unsigned(wire135)) ^ ($signed(wire131) ?
                           $unsigned(wire131) : $unsigned((8'hb3)))) ?
                       wire170[(4'hd):(3'h4)] : $signed($signed({wire132}))));
  assign wire173 = wire131;
  assign wire174 = wire142;
  always
    @(posedge clk) begin
      reg175 <= wire139[(3'h6):(1'h0)];
      reg176 <= $unsigned({wire142[(4'ha):(4'h9)]});
      reg177 <= wire170[(4'hf):(4'h9)];
    end
endmodule

module module6
#(parameter param106 = (&{{(((8'ha0) ? (8'hb6) : (7'h42)) >>> ((8'hb3) ? (8'hb7) : (8'ha4)))}}), 
parameter param107 = ((~^((~|param106) ? (!(param106 <= param106)) : (^(param106 ? param106 : param106)))) ? ({((~|param106) && (8'h9c))} > ((-{param106, param106}) * ((!param106) ? {param106, param106} : {param106}))) : (((~|(^param106)) * (!(param106 ? param106 : param106))) ? (^~((|(8'hb2)) >>> (param106 + param106))) : (((param106 | (8'hb6)) ? (param106 ? param106 : param106) : (param106 >> param106)) & ((param106 ? param106 : param106) || param106)))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire103;
  assign y = {wire105,
                 wire11,
                 wire64,
                 wire66,
                 wire67,
                 wire68,
                 wire81,
                 wire83,
                 wire103,
                 (1'h0)};
  assign wire11 = $signed($signed(wire8));
  module12 #() modinst65 (.clk(clk), .wire14(wire8), .wire13(wire10), .y(wire64), .wire15(wire7), .wire16(wire9));
  assign wire66 = $unsigned(wire8);
  assign wire67 = (wire66[(2'h3):(1'h0)] ?
                      $unsigned(($unsigned((wire64 != wire9)) <<< (&(&wire8)))) : $unsigned($unsigned((wire10[(5'h10):(3'h7)] ?
                          wire64 : {wire11, wire10}))));
  assign wire68 = (wire66[(2'h2):(2'h2)] ?
                      {($signed((^wire10)) ?
                              wire7[(5'h11):(4'hb)] : ($signed(wire9) ^ $signed(wire10))),
                          $unsigned((~|$signed(wire11)))} : ($signed(((~^wire8) ?
                              (wire67 << (8'h9e)) : (wire64 ~^ wire8))) ?
                          (^$unsigned(wire66[(1'h1):(1'h0)])) : $unsigned((&(wire67 ^~ wire67)))));
  module69 #() modinst82 (wire81, clk, wire66, wire10, wire8, wire9);
  assign wire83 = $signed($signed(({(wire68 ? wire10 : wire67)} || wire66)));
  module84 #() modinst104 (wire103, clk, wire8, wire9, wire81, wire64, wire83);
  assign wire105 = wire10;
endmodule

module module84
#(parameter param102 = ({{(((8'hb0) + (8'hbd)) ? (8'hbc) : ((8'hb7) ~^ (8'hab)))}} + (&(((^~(7'h42)) ^ {(8'hb4)}) ? ((^(8'hb2)) ? (&(7'h43)) : ((8'h9c) ? (8'ha6) : (8'hb9))) : (((8'had) <<< (8'ha8)) ? (8'ha8) : ((8'h9e) >= (7'h40)))))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire89;
  input wire [(3'h4):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  input wire signed [(3'h6):(1'h0)] wire86;
  input wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  assign y = {wire101,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire90 = $unsigned(wire89);
  assign wire91 = wire88[(2'h2):(2'h2)];
  assign wire92 = wire90;
  assign wire93 = wire91[(1'h0):(1'h0)];
  assign wire94 = $signed(wire87);
  assign wire95 = {(wire87[(2'h3):(2'h2)] ?
                          $unsigned(((wire94 ~^ wire86) ?
                              (~|wire94) : (8'hb6))) : wire90[(4'ha):(2'h3)])};
  assign wire96 = wire87;
  assign wire97 = (wire91[(5'h10):(4'ha)] | (~(|(wire95 ?
                      $unsigned(wire90) : (wire96 ? wire90 : (7'h40))))));
  assign wire98 = $signed($signed(wire94));
  always
    @(posedge clk) begin
      reg99 <= $unsigned((8'hb3));
      reg100 <= wire93[(1'h1):(1'h1)];
    end
  assign wire101 = (reg99[(5'h13):(1'h1)] ?
                       ((($signed(reg100) <<< (wire88 ?
                           (8'ha8) : wire90)) ~^ wire92) | (^($unsigned(wire93) ?
                           wire89 : (wire93 != wire95)))) : wire92);
endmodule

module module69
#(parameter param79 = (^(!(((~|(8'hbd)) & (^~(8'h9f))) - {((8'ha0) == (8'ha0)), ((8'hb7) << (8'hb6))}))), 
parameter param80 = param79)
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire73;
  input wire [(4'ha):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire signed [(4'hd):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  assign y = {wire78, wire77, wire76, wire75, wire74, (1'h0)};
  assign wire74 = wire71[(4'ha):(3'h7)];
  assign wire75 = $unsigned($unsigned(({wire74[(1'h0):(1'h0)]} <<< wire74)));
  assign wire76 = (wire72[(3'h4):(3'h4)] ?
                      $signed($signed($signed($signed(wire70)))) : $unsigned(wire70));
  assign wire77 = wire76[(4'hd):(4'hb)];
  assign wire78 = $signed((~|wire70[(2'h3):(1'h1)]));
endmodule

module module12
#(parameter param62 = (({(((7'h42) ? (8'ha9) : (8'hb0)) << ((8'hbd) & (8'hb1))), (((8'had) >>> (8'ha2)) ? (~(8'hab)) : (!(8'hb5)))} == {((~&(8'ha3)) ? ((8'ha0) <= (8'ha2)) : ((8'ha9) < (8'hbe))), {(-(8'h9c))}}) + ({(-((8'hb2) ? (8'ha5) : (8'hba))), (((7'h41) << (8'h9d)) ^~ {(8'h9c)})} & ((((8'hba) ^~ (8'hbf)) ? {(8'hbe), (8'hb0)} : ((8'haa) + (8'ha0))) | (((8'hb8) ? (8'h9d) : (8'hbf)) + ((7'h40) & (7'h43)))))), 
parameter param63 = param62)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire51,
                 wire50,
                 wire49,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
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
                 (1'h0)};
  assign wire17 = wire14[(3'h5):(1'h0)];
  assign wire18 = (~({(8'h9e)} || $signed(((wire17 ?
                      (7'h41) : wire14) * (~&wire14)))));
  assign wire19 = $unsigned(($unsigned($signed(wire14)) ?
                      (($signed((8'hb7)) ? {wire16, wire17} : {wire15}) ?
                          ($unsigned(wire16) ~^ $signed(wire17)) : (wire16 ?
                              wire16[(1'h0):(1'h0)] : wire15[(4'hd):(4'hd)])) : (($signed(wire16) ^ $unsigned(wire13)) != ((wire16 ?
                              wire18 : wire16) ?
                          (wire18 > wire14) : (&wire18)))));
  assign wire20 = wire16;
  assign wire21 = $unsigned((7'h44));
  assign wire22 = $unsigned((wire20[(1'h0):(1'h0)] ?
                      (~$signed((8'ha7))) : wire18[(2'h3):(1'h0)]));
  assign wire23 = $signed(wire17);
  assign wire24 = $unsigned(wire16[(3'h4):(2'h3)]);
  assign wire25 = $unsigned(($unsigned(({(8'had)} >> wire15)) ?
                      $signed((~^$signed(wire19))) : (wire14 ~^ wire17[(4'ha):(1'h1)])));
  assign wire26 = (wire18[(2'h3):(2'h3)] ?
                      $signed(wire22) : {$unsigned((wire13[(3'h4):(1'h1)] || $signed(wire23))),
                          $signed($signed((&wire23)))});
  always
    @(posedge clk) begin
      reg27 <= $unsigned($unsigned((($signed(wire23) ?
              $signed(wire14) : (~&wire23)) ?
          (~&(wire20 ? wire26 : wire18)) : (|$unsigned(wire22)))));
      if (wire25[(4'hb):(3'h4)])
        begin
          reg28 <= wire16;
          reg29 <= (8'hbe);
        end
      else
        begin
          reg28 <= (reg28 ?
              wire20 : (wire15[(4'hd):(4'h8)] >= (((wire17 ?
                      wire13 : reg28) + $signed(wire17)) ?
                  ((wire25 - wire20) > (wire20 * (8'hb4))) : (~^wire24[(4'h9):(4'h9)]))));
          reg29 <= reg29[(2'h2):(2'h2)];
          if (($signed({(^$unsigned((8'ha9))),
              (8'ha0)}) + {(&(+(wire15 && reg29)))}))
            begin
              reg30 <= ($unsigned(($unsigned($signed(reg28)) <<< {$unsigned(reg28),
                  (wire18 ? wire21 : wire15)})) & wire16[(4'he):(3'h7)]);
              reg31 <= {reg30,
                  ((!wire20[(3'h4):(1'h0)]) ?
                      (wire17 || wire18) : $unsigned(wire14[(4'h9):(2'h3)]))};
              reg32 <= wire13[(3'h4):(3'h4)];
              reg33 <= wire25[(4'ha):(3'h4)];
              reg34 <= ($signed(reg30[(2'h3):(1'h1)]) ?
                  ($unsigned({(wire23 ? wire17 : wire20)}) ?
                      $signed({((8'hbd) ?
                              (8'hb6) : reg29)}) : wire26[(5'h12):(4'hf)]) : wire24);
            end
          else
            begin
              reg30 <= wire13;
              reg31 <= {$signed(({((8'h9d) + (8'hbc)),
                      $signed(wire21)} >= $signed($unsigned(wire20)))),
                  reg34[(1'h1):(1'h1)]};
              reg32 <= $signed($unsigned(reg33[(3'h5):(2'h3)]));
              reg33 <= (&$unsigned(wire23));
              reg34 <= wire18;
            end
          reg35 <= wire20;
        end
      if (((^~$unsigned((8'hb7))) + (({(~^wire26)} ?
          (!(+reg32)) : $signed($unsigned(reg34))) && (($unsigned(wire21) ?
              {reg30, wire23} : $signed(wire17)) ?
          wire18[(2'h2):(1'h1)] : wire19[(2'h2):(1'h1)]))))
        begin
          reg36 <= (!((!wire23[(2'h2):(2'h2)]) ?
              {$unsigned(wire23[(2'h3):(1'h0)])} : reg32[(3'h4):(2'h3)]));
          reg37 <= reg36;
          reg38 <= {wire15[(3'h5):(2'h2)]};
          reg39 <= reg35[(2'h2):(2'h2)];
          reg40 <= (wire20 - reg35);
        end
      else
        begin
          if (wire17[(4'h9):(1'h0)])
            begin
              reg36 <= reg34[(3'h4):(2'h3)];
              reg37 <= $unsigned(wire16[(4'he):(2'h2)]);
            end
          else
            begin
              reg36 <= (wire13[(2'h2):(1'h1)] >> reg30[(3'h6):(1'h1)]);
              reg37 <= ((reg38 ?
                  {reg38[(4'hf):(4'hf)],
                      $unsigned(wire21[(1'h0):(1'h0)])} : $unsigned($unsigned({wire21,
                      wire26}))) > $unsigned($unsigned($unsigned(((8'hb8) ?
                  wire19 : wire15)))));
              reg38 <= (wire17[(1'h1):(1'h0)] != reg28[(1'h0):(1'h0)]);
              reg39 <= reg29[(3'h5):(1'h0)];
              reg40 <= ((reg39[(3'h5):(1'h1)] ?
                  $unsigned((~(|reg31))) : $signed(($signed(reg37) ?
                      (~wire15) : (~|reg30)))) * (($unsigned($signed(reg39)) ?
                  reg29 : reg30[(2'h2):(1'h1)]) * $unsigned(wire25)));
            end
          reg41 <= wire25;
          reg42 <= reg30[(1'h1):(1'h0)];
          reg43 <= {((reg38[(5'h10):(3'h5)] ?
                  (~(reg40 ? reg32 : reg29)) : reg40[(3'h7):(3'h6)]) ^ reg39),
              $unsigned((-((reg30 ? wire21 : wire14) - $unsigned(wire26))))};
          if ($unsigned(wire17[(4'hb):(4'h9)]))
            begin
              reg44 <= $signed(({(~&reg41)} | wire16[(4'hd):(1'h1)]));
              reg45 <= $unsigned(wire26[(2'h3):(1'h1)]);
            end
          else
            begin
              reg44 <= $unsigned(reg40[(2'h3):(1'h1)]);
              reg45 <= reg42[(1'h0):(1'h0)];
              reg46 <= $unsigned($signed((((wire17 || reg37) ?
                      ((8'ha0) != reg33) : (8'ha4)) ?
                  wire24 : $unsigned((-(8'hb2))))));
            end
        end
      reg47 <= wire24[(3'h6):(3'h5)];
      reg48 <= (|((^$signed((wire24 | reg35))) << reg39));
    end
  assign wire49 = reg29;
  assign wire50 = (^(reg34[(3'h4):(2'h2)] ?
                      wire25 : $unsigned((!$unsigned(wire16)))));
  assign wire51 = (((8'ha2) ? reg45 : reg32) ?
                      $signed(wire15[(2'h3):(1'h0)]) : reg36);
  always
    @(posedge clk) begin
      if ((reg45[(2'h3):(1'h1)] ?
          reg36 : (wire16[(3'h5):(3'h4)] ?
              (+$unsigned($signed(reg38))) : (wire19[(1'h0):(1'h0)] ?
                  $unsigned((reg36 ? reg35 : wire15)) : (wire22[(4'h8):(2'h2)] ?
                      (wire49 - wire23) : $signed(reg40))))))
        begin
          reg52 <= wire51[(4'h8):(4'h8)];
          reg53 <= reg40[(3'h4):(2'h3)];
        end
      else
        begin
          reg52 <= reg33[(4'h8):(1'h0)];
          reg53 <= reg52;
          reg54 <= (8'hb8);
        end
      reg55 <= (~$unsigned($unsigned(((wire13 ? reg37 : reg47) ?
          (reg41 >= reg40) : (~^wire25)))));
    end
  assign wire56 = reg35[(5'h13):(4'he)];
  assign wire57 = ($unsigned(reg29) ?
                      ({reg54} << $unsigned($unsigned(wire20))) : $unsigned(reg31));
  assign wire58 = wire56;
  assign wire59 = reg55[(1'h0):(1'h0)];
  assign wire60 = (wire51[(4'hd):(4'hd)] + {((^~reg36) ?
                          reg27[(5'h14):(5'h10)] : reg37[(2'h3):(2'h2)])});
  assign wire61 = $unsigned(($unsigned(reg35[(5'h13):(2'h2)]) && (reg45 >> $unsigned((8'hb6)))));
endmodule

module module143  (y, clk, wire148, wire147, wire146, wire145, wire144);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire148;
  input wire [(4'he):(1'h0)] wire147;
  input wire signed [(4'h9):(1'h0)] wire146;
  input wire signed [(5'h15):(1'h0)] wire145;
  input wire [(5'h14):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  wire signed [(2'h2):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire158;
  wire [(4'h8):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire151;
  wire [(3'h7):(1'h0)] wire150;
  wire signed [(4'hd):(1'h0)] wire149;
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire151,
                 wire150,
                 wire149,
                 reg165,
                 reg164,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire149 = (($unsigned(wire148) ?
                       $unsigned((8'hb6)) : wire145) && $signed($unsigned($signed(wire148))));
  assign wire150 = ((wire145[(3'h5):(2'h2)] || (8'hb9)) ?
                       ($unsigned($unsigned(((8'h9c) == wire146))) - $unsigned({$signed(wire146)})) : $signed((+($signed(wire147) ?
                           (wire145 ? (8'hb9) : (8'hbb)) : (~wire146)))));
  assign wire151 = $unsigned($signed(wire145[(5'h13):(5'h11)]));
  always
    @(posedge clk) begin
      reg152 <= $unsigned(wire145[(2'h3):(1'h0)]);
      if ({{wire150[(3'h7):(1'h1)]},
          $signed(($signed((!wire146)) >>> (~^((8'hb2) < wire146))))})
        begin
          if ((~(($signed(wire150) ?
              $unsigned(wire145) : ($unsigned(wire148) ?
                  wire145[(5'h11):(4'hb)] : $unsigned(wire147))) - (~($signed(wire148) | ((8'hac) != wire144))))))
            begin
              reg153 <= wire149;
              reg154 <= $unsigned((-(wire145[(4'hf):(1'h0)] || wire150[(3'h7):(1'h0)])));
              reg155 <= ((|wire149) << (^~((+(8'ha9)) ?
                  reg153 : $unsigned(wire151))));
            end
          else
            begin
              reg153 <= (~|($signed(($signed((7'h44)) & $unsigned(reg153))) <<< ($signed((wire144 - wire151)) ?
                  ((reg153 ~^ wire148) ?
                      (+reg154) : $signed(wire150)) : (8'ha7))));
              reg154 <= (wire146[(3'h7):(3'h5)] ?
                  (reg153[(3'h6):(3'h4)] & $signed($signed($unsigned(wire147)))) : (wire148 ?
                      wire148[(1'h0):(1'h0)] : ((wire147[(4'ha):(3'h4)] <<< {(8'hbb)}) ?
                          $unsigned($signed(wire150)) : (7'h41))));
              reg155 <= (|wire148);
            end
        end
      else
        begin
          reg153 <= {wire151,
              ((reg155[(1'h1):(1'h0)] == (~(reg154 ? wire144 : reg153))) ?
                  wire149[(4'hc):(3'h6)] : {($signed(reg152) ?
                          reg153[(5'h11):(4'h8)] : (^wire144))})};
          reg154 <= $unsigned({wire144[(3'h4):(2'h3)]});
          reg155 <= $signed(wire149);
        end
    end
  assign wire156 = $unsigned(wire150[(2'h2):(2'h2)]);
  assign wire157 = wire156;
  assign wire158 = wire150[(1'h1):(1'h0)];
  assign wire159 = reg152[(3'h4):(3'h4)];
  assign wire160 = reg152;
  assign wire161 = ((^~$unsigned(({wire158} ?
                           reg152 : (wire149 ? wire158 : wire157)))) ?
                       wire156[(2'h2):(1'h1)] : ((!$signed((-wire159))) ?
                           ((~wire146[(1'h0):(1'h0)]) << (8'hb6)) : wire157));
  assign wire162 = $unsigned((((wire160[(2'h2):(1'h0)] ?
                           $signed(wire160) : ((8'haa) < wire149)) ?
                       ($unsigned(wire148) ?
                           wire157 : reg152) : {$unsigned(wire145)}) >= (wire161 << $signed(reg152))));
  assign wire163 = wire144[(4'hf):(4'h8)];
  always
    @(posedge clk) begin
      reg164 <= (wire147 ?
          ($unsigned(reg152[(5'h11):(1'h0)]) >> $unsigned(wire161[(3'h5):(2'h2)])) : wire150[(2'h3):(2'h3)]);
      reg165 <= {(7'h40), ($unsigned(wire161[(4'ha):(1'h1)]) <= wire149)};
    end
endmodule

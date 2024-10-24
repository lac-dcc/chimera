module top
#(parameter param151 = (^~(((~&((8'hb7) ? (8'hbe) : (8'hb9))) ? (((7'h41) < (8'ha4)) && (~&(8'h9f))) : {{(8'ha4), (8'ha1)}}) >> ((((8'hbe) ? (8'ha6) : (8'hae)) || ((8'hb9) ? (8'h9f) : (8'hbf))) < (((8'ha8) ? (8'ha0) : (8'ha2)) ? {(8'hbe), (8'hbb)} : ((8'hb3) ? (8'hb3) : (8'haa)))))), 
parameter param152 = (+((((param151 | param151) * (8'hab)) ^~ (param151 ? (~&param151) : (+(8'hb3)))) >= (param151 ? param151 : ((param151 ? (8'ha7) : param151) ? {param151} : (param151 ~^ param151))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire148;
  wire signed [(5'h15):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire133;
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire5,
                 wire9,
                 wire133,
                 reg150,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg6,
                 reg7,
                 reg8,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= wire3;
    end
  always
    @(posedge clk) begin
      if ((~^((~wire3) ? $unsigned(wire1) : $signed((wire3 >= wire1)))))
        begin
          reg7 <= wire3;
          reg8 <= (~$unsigned(reg6));
        end
      else
        begin
          reg7 <= wire0[(3'h4):(2'h3)];
        end
    end
  assign wire9 = {(reg8[(5'h12):(4'h8)] <= wire5[(1'h0):(1'h0)]),
                     wire5[(3'h4):(3'h4)]};
  always
    @(posedge clk) begin
      reg10 <= $signed(({$unsigned(reg8),
          reg7[(1'h0):(1'h0)]} * (($signed(wire9) >= (wire1 ^ wire0)) ?
          wire2 : ((8'haa) ? ((8'hbb) ? (8'h9e) : (7'h41)) : (~&wire4)))));
      reg11 <= wire2[(3'h7):(2'h2)];
      reg12 <= $signed((&(+reg8)));
    end
  module13 #() modinst134 (.wire15(wire2), .wire17(reg12), .clk(clk), .y(wire133), .wire16(reg11), .wire14(reg8));
  assign wire135 = wire0[(3'h7):(1'h1)];
  assign wire136 = wire9;
  assign wire137 = {wire4[(5'h13):(3'h5)]};
  assign wire138 = $unsigned($unsigned((~|$signed($signed(wire3)))));
  always
    @(posedge clk) begin
      reg139 <= reg7;
      reg140 <= wire2[(5'h11):(3'h7)];
      reg141 <= ((~((^~((8'ha9) > reg12)) ?
          reg140 : reg11[(4'he):(3'h6)])) ~^ reg140[(3'h6):(2'h2)]);
      reg142 <= wire1[(4'hb):(3'h7)];
    end
  assign wire143 = reg12[(3'h4):(3'h4)];
  assign wire144 = $unsigned((^~{((!wire3) ?
                           $signed(wire137) : (reg7 < reg140))}));
  assign wire145 = wire0[(2'h2):(1'h0)];
  assign wire146 = $signed((reg7 ? $signed(wire5) : wire135));
  assign wire147 = $signed(((~^(|$unsigned((8'hb4)))) ^~ {reg8[(5'h12):(4'h8)],
                       (~(wire143 ? wire143 : wire2))}));
  assign wire148 = ($unsigned(((reg8[(5'h14):(1'h1)] ?
                           ((8'ha5) ? wire4 : (7'h41)) : $signed(wire144)) ?
                       wire144[(3'h4):(3'h4)] : (reg7[(3'h4):(2'h3)] & $unsigned(wire143)))) == wire143);
  assign wire149 = $signed($signed(reg12[(4'h9):(3'h6)]));
  always
    @(posedge clk) begin
      reg150 <= (-$unsigned((^wire9[(3'h4):(1'h0)])));
    end
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire128;
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire85,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire28,
                 wire128,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= wire16[(1'h1):(1'h0)];
      if ($unsigned({$unsigned((8'hb3)), reg18[(1'h0):(1'h0)]}))
        begin
          if ((|$signed(($unsigned((wire15 ? wire17 : wire16)) ?
              wire15[(4'h9):(4'h9)] : wire16[(1'h1):(1'h1)]))))
            begin
              reg19 <= (wire15 ?
                  (&wire16[(1'h0):(1'h0)]) : ((^~$signed((8'haa))) ?
                      $unsigned(({(8'had), wire16} ?
                          (|wire14) : $signed((8'h9c)))) : wire14[(4'hc):(2'h3)]));
              reg20 <= wire14;
              reg21 <= wire17;
            end
          else
            begin
              reg19 <= ($unsigned(((|$unsigned(wire16)) ?
                  wire16 : (8'hb3))) == ((reg20[(4'ha):(1'h1)] | $signed($signed(wire15))) & $signed($unsigned($unsigned(reg20)))));
            end
          reg22 <= {$signed($signed(($signed(reg21) <= (reg18 ?
                  wire16 : reg18))))};
          reg23 <= $signed(((wire14 ?
              wire16[(2'h3):(2'h3)] : $signed((reg18 ^~ reg19))) != wire14[(4'hb):(2'h2)]));
          reg24 <= reg21;
        end
      else
        begin
          reg19 <= reg20[(1'h1):(1'h1)];
          reg20 <= (+$signed(wire15));
          reg21 <= {($unsigned((~&wire15)) ?
                  ($signed((wire16 * wire14)) == $unsigned(((8'hb9) ?
                      wire17 : reg19))) : (($unsigned(reg18) ?
                          (reg19 && (8'ha7)) : reg23) ?
                      ($signed(wire16) ? (|wire17) : wire17) : $signed((wire16 ?
                          reg21 : wire17)))),
              (((reg21[(4'h8):(3'h5)] ? $signed(wire15) : $signed(reg22)) ?
                      $unsigned((~^wire16)) : (|reg22[(1'h1):(1'h0)])) ?
                  (&(&reg18[(2'h2):(1'h1)])) : $unsigned((!$unsigned(wire14))))};
          reg22 <= reg21;
        end
      reg25 <= ($signed((~wire16[(1'h1):(1'h0)])) ^ (-reg21));
    end
  always
    @(posedge clk) begin
      reg26 <= (-wire15);
      reg27 <= $signed(wire17);
    end
  assign wire28 = $signed(((^wire15) ?
                      wire17 : ((reg20[(4'ha):(4'ha)] >>> (~reg25)) ?
                          $unsigned(reg21) : ($signed(reg21) ?
                              (wire17 ^~ reg18) : reg18))));
  module29 #() modinst54 (.wire34(reg27), .wire30(wire17), .clk(clk), .y(wire53), .wire33(wire16), .wire31(reg20), .wire32(reg18));
  assign wire55 = wire15;
  assign wire56 = (8'haa);
  assign wire57 = (reg25 > ($signed($unsigned((!reg26))) ~^ $unsigned(wire14[(3'h6):(1'h1)])));
  module58 #() modinst86 (.wire62(wire28), .clk(clk), .wire61(reg20), .y(wire85), .wire60(reg19), .wire59(reg27));
  module87 #() modinst129 (.wire90(wire57), .wire88(reg20), .wire91(reg26), .clk(clk), .y(wire128), .wire89(reg18));
  assign wire130 = (8'had);
  assign wire131 = $signed(($signed($signed(wire55[(2'h3):(1'h0)])) ?
                       $signed((reg18 ^ (+wire28))) : wire28[(4'ha):(4'h9)]));
  assign wire132 = wire55;
endmodule

module module87
#(parameter param127 = ((~&((8'ha9) ? (~^((8'ha4) ? (8'haa) : (8'ha3))) : ((&(8'hbf)) << (~|(8'ha1))))) << (~^(8'hb1))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire91;
  input wire signed [(3'h4):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire89;
  input wire [(5'h13):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire125;
  wire signed [(5'h10):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg122,
                 reg121,
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
                 reg106,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire92 = (~&$signed((~&(~^$signed(wire91)))));
  assign wire93 = (wire92[(1'h0):(1'h0)] ^~ wire88);
  assign wire94 = (wire88[(1'h0):(1'h0)] ?
                      (^wire91) : $signed((^~((^~(8'hbb)) ^ $unsigned((8'hb3))))));
  assign wire95 = ((wire89[(4'h9):(2'h3)] - wire92[(4'h8):(3'h4)]) || (|(~{wire91,
                      $signed(wire92)})));
  always
    @(posedge clk) begin
      reg96 <= ($signed($signed((!(-(8'ha6))))) ~^ ($unsigned((~&wire95)) <<< (~^wire89)));
      reg97 <= $unsigned($unsigned((^~(wire94 ?
          $signed(wire95) : $signed(wire94)))));
    end
  assign wire98 = $signed(reg97[(5'h13):(4'h8)]);
  assign wire99 = $signed((!wire89[(4'hb):(3'h4)]));
  assign wire100 = wire91[(3'h6):(3'h6)];
  assign wire101 = (wire88 ?
                       (~{$unsigned(wire98[(5'h11):(4'hf)]),
                           wire99[(3'h7):(2'h3)]}) : $signed(($signed({wire99,
                               wire89}) ?
                           ({wire91} ?
                               (wire94 <<< wire89) : (wire95 ?
                                   wire98 : wire94)) : $signed($signed(wire92)))));
  assign wire102 = ($unsigned((8'hb6)) >> ((^~$unsigned((wire95 + wire99))) + ($unsigned(wire95[(4'hc):(3'h6)]) ?
                       (8'ha8) : ((wire91 ? wire89 : wire98) ?
                           {wire90} : ((7'h43) ? reg97 : wire89)))));
  assign wire103 = wire88[(4'hd):(4'ha)];
  assign wire104 = reg96;
  assign wire105 = ($unsigned(wire88[(4'ha):(2'h2)]) - ((((wire95 ?
                           reg96 : wire88) == $unsigned((7'h40))) ?
                       (8'hac) : (^~wire90)) && (wire103[(4'hd):(2'h3)] ?
                       wire92 : (((7'h40) ? wire90 : wire99) < (!(8'hbe))))));
  always
    @(posedge clk) begin
      if ((reg96 ?
          $unsigned((($signed(reg96) | wire98) >> $signed($signed(wire98)))) : ({($unsigned(wire98) ?
                  (wire91 == wire99) : (wire89 ^ wire100)),
              wire89} == $signed((&wire101)))))
        begin
          reg106 <= (~|wire91[(1'h1):(1'h1)]);
          reg107 <= wire88[(5'h11):(4'h9)];
          reg108 <= wire95[(5'h10):(1'h0)];
          if (wire98)
            begin
              reg109 <= {$unsigned(wire92)};
            end
          else
            begin
              reg109 <= wire98[(4'h9):(3'h7)];
              reg110 <= reg107;
            end
          if ((reg108[(5'h11):(2'h3)] ? {reg108[(5'h13):(4'h8)]} : {{reg106}}))
            begin
              reg111 <= wire103[(4'hc):(4'h9)];
              reg112 <= $signed((($unsigned(wire93[(4'he):(3'h7)]) ?
                  wire100 : (~|reg110[(3'h4):(3'h4)])) - ({$signed((7'h43))} ?
                  ((wire104 ? reg97 : (8'ha8)) ?
                      {wire93,
                          wire94} : wire95[(2'h3):(1'h0)]) : $unsigned(wire95[(1'h1):(1'h1)]))));
              reg113 <= $unsigned({$unsigned(wire92[(3'h6):(3'h6)]),
                  {{(wire104 ? (8'h9e) : reg107)}}});
              reg114 <= ((reg107 <<< wire91[(4'h8):(2'h2)]) < $signed($unsigned($unsigned((wire99 ?
                  wire88 : reg96)))));
              reg115 <= {reg97};
            end
          else
            begin
              reg111 <= $signed(($unsigned((~|wire105[(1'h0):(1'h0)])) ?
                  wire104[(3'h5):(2'h2)] : $unsigned(($signed(wire92) ?
                      (reg97 == wire103) : (wire99 ? reg112 : wire100)))));
              reg112 <= (^(((~$unsigned(reg111)) ?
                      {((7'h41) ? (8'h9e) : wire103),
                          (+reg113)} : $signed($unsigned((7'h43)))) ?
                  $unsigned(wire95) : $signed({(~&(8'hb1))})));
              reg113 <= (~|(wire93[(3'h6):(3'h5)] ?
                  $signed({((8'ha1) ^ reg96),
                      $signed(wire101)}) : wire101[(4'hb):(3'h4)]));
              reg114 <= $unsigned(wire102[(3'h6):(2'h2)]);
            end
        end
      else
        begin
          reg106 <= {wire89};
          reg107 <= wire92[(4'hb):(3'h5)];
          reg108 <= ({wire100[(5'h13):(4'hb)], (!wire91[(3'h6):(3'h4)])} ?
              (^wire102) : (~|reg114[(2'h3):(2'h3)]));
          reg109 <= reg97;
          if (($unsigned($unsigned($signed({(8'ha0)}))) ^ $signed((8'hb8))))
            begin
              reg110 <= ({$unsigned(($signed((8'hbd)) | (-(8'hbc))))} <<< reg108);
              reg111 <= ({{(reg113[(3'h4):(2'h2)] ^ wire103), (7'h44)},
                  reg97} >> $signed((wire91 >> ((reg96 ? wire101 : (8'haf)) ?
                  $unsigned((8'haf)) : wire95))));
              reg112 <= $unsigned((8'hb5));
              reg113 <= $unsigned(wire105[(1'h1):(1'h1)]);
            end
          else
            begin
              reg110 <= ($signed((wire88 * {wire93,
                  (8'hb2)})) && $signed($unsigned($signed((-(8'hb2))))));
            end
        end
      reg116 <= wire92;
    end
  assign wire117 = $unsigned($unsigned(wire103[(4'hc):(3'h5)]));
  assign wire118 = (($signed(((wire93 ? reg115 : wire102) ?
                           (^reg106) : $unsigned(wire117))) - (&wire99)) ?
                       $signed($signed(reg96[(3'h4):(3'h4)])) : wire105[(2'h2):(2'h2)]);
  assign wire119 = (~^wire89);
  assign wire120 = ((&reg107[(1'h0):(1'h0)]) << (({(wire95 >> reg109),
                               (^wire101)} ?
                           ($unsigned(wire117) ?
                               $signed(reg97) : wire93) : $unsigned((reg111 && wire92))) ?
                       $signed(reg108) : $unsigned($unsigned((reg111 >= reg109)))));
  always
    @(posedge clk) begin
      reg121 <= reg96;
      reg122 <= wire119[(4'hb):(1'h1)];
    end
  assign wire123 = wire88;
  assign wire124 = wire89;
  assign wire125 = (8'ha9);
  assign wire126 = $unsigned((($signed(wire98[(4'h8):(1'h0)]) ?
                       $unsigned((wire119 < (8'hbe))) : wire125) && {(+$signed(wire95))}));
endmodule

module module58
#(parameter param84 = (^~(&((&((8'hae) ? (7'h43) : (8'hb8))) ? ((|(8'hbb)) >>> {(8'hbf)}) : (((7'h41) ? (8'hb9) : (8'ha2)) <= (+(8'ha3)))))))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire62;
  input wire [(3'h6):(1'h0)] wire61;
  input wire [(4'hb):(1'h0)] wire60;
  input wire [(3'h4):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire83,
                 wire65,
                 wire64,
                 wire63,
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
                 (1'h0)};
  assign wire63 = $signed($signed((^((~^(8'hb9)) ?
                      (~|(8'hb2)) : (wire60 | (8'had))))));
  assign wire64 = (8'ha5);
  assign wire65 = $unsigned({($signed($unsigned(wire60)) + $unsigned($unsigned(wire59))),
                      ($unsigned(wire64) ?
                          {$signed((8'hb1)), wire62} : wire64)});
  always
    @(posedge clk) begin
      reg66 <= {({$signed((wire62 ^ wire65)),
              wire59[(2'h2):(2'h2)]} ^ {((-wire61) >>> wire59)})};
      reg67 <= (^($signed(wire65[(1'h0):(1'h0)]) ?
          {(wire59 <= wire60[(4'h9):(4'h9)])} : $signed(wire59)));
      if (wire60[(4'h8):(1'h0)])
        begin
          if ((~(8'haa)))
            begin
              reg68 <= $unsigned((^~$unsigned(wire65[(4'hc):(3'h5)])));
              reg69 <= (~&reg66);
              reg70 <= ((~&wire61[(3'h5):(1'h1)]) ?
                  $unsigned({(^~wire65),
                      ((wire61 == (8'haf)) ?
                          (reg69 - wire64) : (8'h9e))}) : wire62[(4'h8):(1'h1)]);
              reg71 <= wire61[(2'h3):(1'h0)];
            end
          else
            begin
              reg68 <= (wire59 ? wire62 : wire64);
              reg69 <= wire63;
            end
          reg72 <= $signed((wire65[(4'hb):(4'hb)] + $signed((wire63 ?
              reg67[(3'h4):(2'h3)] : $signed(wire65)))));
          if ($unsigned(($signed({$unsigned(wire59), (wire65 && (8'ha4))}) ?
              $signed((((8'hb0) ? wire62 : wire65) ?
                  {wire62,
                      wire64} : (wire64 >>> reg67))) : wire63[(5'h13):(5'h13)])))
            begin
              reg73 <= $signed((-$signed(((wire65 ?
                  wire59 : wire64) != (~|wire60)))));
              reg74 <= ((reg67 ?
                  wire62 : (((reg72 ^~ (8'ha4)) && reg66) ?
                      (reg69 ? reg71 : wire61) : {$unsigned(reg70),
                          (reg67 ?
                              wire61 : wire60)})) >>> $unsigned((~$signed((~|reg70)))));
              reg75 <= reg69;
            end
          else
            begin
              reg73 <= (reg74 <= wire62[(1'h0):(1'h0)]);
              reg74 <= ($unsigned($signed(reg69)) || wire62);
              reg75 <= reg72[(4'hb):(3'h7)];
            end
          if ($signed((~(&$signed((+wire61))))))
            begin
              reg76 <= ($unsigned($signed(($signed(wire62) ?
                      (wire63 ~^ reg74) : reg67[(3'h5):(3'h4)]))) ?
                  $unsigned(reg69[(4'h8):(1'h0)]) : reg68[(3'h6):(3'h6)]);
            end
          else
            begin
              reg76 <= (-$unsigned(reg68[(4'h8):(1'h0)]));
              reg77 <= $unsigned((wire62[(2'h3):(1'h0)] ?
                  wire59[(1'h0):(1'h0)] : (&reg73)));
              reg78 <= $unsigned((($signed((~wire64)) ?
                  (-reg66[(3'h7):(3'h4)]) : wire64) != ((!(wire59 ?
                  (8'ha2) : (8'hae))) == {(~wire63)})));
            end
          reg79 <= (((wire64[(1'h0):(1'h0)] & reg77) >>> (reg72 ~^ (((8'hb9) << reg68) <<< (wire61 >= reg70)))) ^~ $unsigned(($unsigned($unsigned((8'hbb))) ~^ ($signed(reg67) ?
              (wire59 < (7'h43)) : (reg70 ? reg69 : wire65)))));
        end
      else
        begin
          reg68 <= $unsigned({wire61});
          reg69 <= $signed(((^~((reg74 ^~ (8'hbc)) == reg76[(4'he):(4'ha)])) ?
              ($signed(reg70[(3'h5):(2'h3)]) ?
                  (reg78[(3'h5):(1'h0)] > $signed(wire64)) : reg75[(4'hd):(4'h9)]) : (+(reg68 << ((8'hab) ?
                  reg67 : (8'hb7))))));
          if ((&reg76))
            begin
              reg70 <= wire62[(3'h6):(2'h3)];
              reg71 <= reg77[(3'h7):(3'h4)];
              reg72 <= {(((reg79[(1'h0):(1'h0)] * reg79[(2'h2):(1'h0)]) ?
                          ((~|reg79) ?
                              $signed(reg75) : wire64[(4'hb):(3'h7)]) : (-(wire63 & reg74))) ?
                      (((~reg70) || {reg75}) ~^ (~(reg69 - reg75))) : (wire65[(2'h3):(2'h2)] <<< (-{reg77})))};
              reg73 <= wire63[(5'h11):(3'h4)];
              reg74 <= reg74;
            end
          else
            begin
              reg70 <= (~|$signed($unsigned(reg79)));
              reg71 <= $signed((~$unsigned((-wire65[(1'h1):(1'h1)]))));
              reg72 <= ($unsigned($signed((wire65[(2'h3):(2'h3)] * (^reg73)))) ?
                  {(-reg69), reg77} : (&{(!reg79[(2'h2):(1'h0)]),
                      $unsigned({wire59, reg75})}));
            end
          reg75 <= {($unsigned($unsigned({reg76, reg72})) ?
                  ({wire62} ?
                      reg70 : $unsigned(reg72[(3'h6):(3'h4)])) : $signed((+reg70[(3'h6):(3'h6)]))),
              reg72[(2'h2):(1'h0)]};
          reg76 <= wire64;
        end
    end
  always
    @(posedge clk) begin
      reg80 <= reg71[(1'h1):(1'h0)];
      reg81 <= $unsigned(wire65);
      reg82 <= $unsigned(reg77[(4'h9):(2'h3)]);
    end
  assign wire83 = $signed({reg77[(4'hd):(4'hd)], (reg71 >>> wire62)});
endmodule

module module29
#(parameter param52 = ((((((8'hb5) ? (8'ha3) : (8'h9f)) >>> (~&(8'hbb))) ? ((~^(8'ha2)) ? (~(8'hbf)) : (~&(8'hb9))) : (((8'hbb) >> (7'h40)) >= (^(8'hb0)))) >= (({(8'ha7), (8'h9d)} > ((8'hbf) ^~ (8'had))) ? ({(8'hba)} ? {(7'h40), (8'hb2)} : {(8'hbd)}) : (((8'hb8) ? (8'ha8) : (8'ha4)) ? (^(7'h40)) : (~&(7'h41))))) != ({(((8'hb1) & (7'h44)) ? (|(8'had)) : ((8'ha3) == (8'had)))} ? ((((8'hb2) ^ (7'h44)) ? (^(8'hbd)) : {(8'hbc), (8'h9f)}) < {((7'h40) ? (8'hb4) : (8'hae)), {(8'ha8), (8'h9c)}}) : ((8'ha0) ? ((~&(8'hb9)) * ((8'hac) ? (8'hb1) : (8'hb3))) : (((8'hb5) ? (8'hb9) : (8'hb6)) ? (~^(8'hb9)) : ((8'ha6) | (8'hb5)))))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire35;
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire35,
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
                 (1'h0)};
  assign wire35 = wire34;
  always
    @(posedge clk) begin
      reg36 <= wire33[(4'he):(4'hd)];
    end
  always
    @(posedge clk) begin
      reg37 <= wire32[(2'h2):(1'h1)];
      reg38 <= wire32;
      if (({$unsigned((+{reg38})),
          (($signed(wire34) ?
              (reg36 ? reg38 : reg38) : {(8'hbf),
                  (8'hbf)}) == {$unsigned((8'ha4))})} >= $signed(reg36)))
        begin
          if ({$signed(reg37),
              (wire31[(3'h5):(3'h4)] ?
                  reg37[(1'h1):(1'h1)] : wire33[(3'h6):(3'h5)])})
            begin
              reg39 <= (wire33[(1'h0):(1'h0)] + {(^($signed((8'hb2)) * wire31[(2'h3):(1'h0)])),
                  (7'h42)});
              reg40 <= (8'hb9);
            end
          else
            begin
              reg39 <= reg40[(2'h3):(2'h2)];
              reg40 <= reg40;
              reg41 <= ({$unsigned($signed({reg40})),
                      $unsigned(reg39[(3'h4):(1'h0)])} ?
                  ($unsigned((^~wire35[(2'h2):(2'h2)])) ?
                      (+((~reg39) ?
                          {wire33} : wire34)) : reg40[(4'hb):(4'hb)]) : $signed({reg40,
                      ((wire34 - reg36) ?
                          ((8'hb0) ? wire35 : wire33) : reg37)}));
              reg42 <= (($signed($unsigned($unsigned(reg38))) ~^ reg38[(4'hb):(2'h3)]) ?
                  ((($signed(reg36) != (8'hb2)) ?
                          wire35[(2'h2):(1'h1)] : reg40[(1'h1):(1'h1)]) ?
                      $unsigned(reg37) : reg41) : $signed(wire32[(4'hf):(4'hd)]));
              reg43 <= (8'hb6);
            end
          reg44 <= $signed(((reg36[(3'h5):(2'h3)] ?
                  $unsigned($signed((8'h9c))) : (~|reg38)) ?
              (^~reg41[(3'h6):(3'h4)]) : $signed(wire35[(2'h2):(1'h0)])));
          reg45 <= ($signed(wire34) ?
              $unsigned(reg44[(3'h7):(3'h6)]) : (($unsigned({reg40}) ?
                  $unsigned(((8'hac) ? wire35 : (8'hbe))) : (^~{(7'h40),
                      wire32})) + reg41));
        end
      else
        begin
          if (({($signed(((8'haa) << wire30)) ?
                      (^~(^~wire34)) : reg38[(3'h6):(3'h4)]),
                  $unsigned({$unsigned(reg38)})} ?
              {{$signed((reg39 ? wire33 : reg45)),
                      {$unsigned((8'h9d)), (reg36 + (8'hbe))}}} : wire34))
            begin
              reg39 <= $signed(reg44);
              reg40 <= reg45[(4'h8):(3'h5)];
              reg41 <= (((reg42[(4'hc):(4'hc)] * ((reg40 * wire35) != $unsigned(reg38))) ~^ (wire32[(2'h3):(2'h2)] ?
                      $signed(((8'hb3) <<< (8'h9f))) : $signed(((8'hbe) <<< reg37)))) ?
                  ({$signed($signed((7'h42))), $unsigned((reg42 ^~ wire32))} ?
                      $signed((~^$unsigned((8'had)))) : wire31) : (^~$signed((reg38 ?
                      wire35 : reg43))));
            end
          else
            begin
              reg39 <= (($unsigned($unsigned(wire33[(4'ha):(4'h8)])) ?
                  (+(reg45[(3'h4):(3'h4)] & (wire34 ?
                      wire32 : reg37))) : wire32) >> wire31);
              reg40 <= $unsigned($unsigned(wire32[(1'h0):(1'h0)]));
              reg41 <= ($unsigned(reg44[(4'hf):(4'h9)]) ?
                  {(8'hb8)} : ($signed($unsigned($unsigned(wire32))) * (~^reg38[(1'h1):(1'h1)])));
            end
        end
    end
  assign wire46 = (!{wire30});
  assign wire47 = $unsigned({reg40[(3'h5):(1'h0)], wire31[(1'h0):(1'h0)]});
  assign wire48 = wire31[(4'h9):(3'h5)];
  assign wire49 = reg40[(1'h0):(1'h0)];
  assign wire50 = reg39[(3'h4):(2'h3)];
  assign wire51 = wire32[(4'hd):(1'h0)];
endmodule

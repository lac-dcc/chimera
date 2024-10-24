module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire [(4'h9):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire135;
  assign y = {wire140, wire139, wire138, wire137, wire135, (1'h0)};
  module5 #() modinst136 (.clk(clk), .y(wire135), .wire9(wire0), .wire7(wire1), .wire8(wire3), .wire6(wire2));
  assign wire137 = $signed((~^{($signed(wire0) ?
                           $signed(wire3) : ((8'ha7) << wire3))}));
  assign wire138 = wire2;
  assign wire139 = $unsigned((wire1[(3'h7):(3'h6)] ?
                       wire0 : {$unsigned((wire1 && (8'ha4))),
                           $signed({wire3})}));
  assign wire140 = $unsigned((wire3[(3'h6):(3'h6)] ?
                       (^wire0) : (wire0 ? (8'ha0) : $signed((~|wire4)))));
endmodule

module module5
#(parameter param134 = ((({{(8'hb0), (8'hb6)}, ((8'hba) ? (8'hb7) : (7'h41))} > (((8'had) - (8'ha4)) ? ((8'hbe) < (8'ha7)) : (+(8'h9d)))) ? ((~|(~&(8'haf))) >= ((^(8'hba)) < {(8'hbb), (8'hab)})) : (((~&(8'ha4)) * ((8'hb1) != (8'hbc))) ? (8'hb8) : (((8'ha5) ? (8'ha7) : (8'hb0)) || ((8'hab) ^~ (8'ha4))))) ? (!({{(8'haa)}, (~^(8'hae))} > {(~|(8'hbf)), ((8'ha4) ? (7'h42) : (8'ha5))})) : {{(((7'h41) ? (8'haa) : (8'ha2)) >>> ((8'hb9) * (8'ha6)))}}))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(4'h8):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire123;
  wire [(4'ha):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire120;
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 wire67,
                 wire11,
                 wire10,
                 wire69,
                 wire70,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire120,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire10 = wire6;
  assign wire11 = $signed(wire7[(4'hb):(4'ha)]);
  module12 #() modinst68 (wire67, clk, wire11, wire7, wire10, wire9, wire6);
  assign wire69 = (&wire7);
  assign wire70 = wire8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg71 <= $signed((~(+(!wire11[(5'h10):(2'h3)]))));
      reg72 <= (($signed($signed(reg71)) ?
          ($unsigned(wire7) ?
              ($unsigned(wire7) ?
                  $signed(wire9) : (8'hb2)) : $signed($unsigned(wire11))) : (((~wire67) ?
              {wire70} : $signed(wire70)) != $unsigned({reg71}))) & (^~$unsigned($unsigned((wire70 ?
          wire10 : (8'h9d))))));
      reg73 <= ((wire10[(2'h3):(2'h3)] > $unsigned($signed(wire6))) << $unsigned(wire8));
      reg74 <= (wire7[(2'h3):(2'h3)] ?
          (~^{$signed((wire7 ? wire8 : wire8)),
              wire67[(4'h8):(3'h4)]}) : wire10);
    end
  assign wire75 = reg72[(4'hf):(2'h3)];
  assign wire76 = reg71;
  assign wire77 = (^wire76);
  assign wire78 = (~(-$unsigned(wire75[(3'h6):(2'h2)])));
  assign wire79 = {wire77[(4'hf):(4'hb)],
                      $signed((~&$unsigned(wire77[(3'h5):(2'h2)])))};
  module80 #() modinst121 (wire120, clk, wire79, wire7, wire77, reg71);
  assign wire122 = $signed((-wire9));
  assign wire123 = {(+$unsigned(((wire10 ? wire77 : wire76) ?
                           (wire11 ? wire70 : wire11) : (reg72 ?
                               wire6 : (7'h43))))),
                       ($signed(wire7) == ((wire78 ?
                           {wire78,
                               wire6} : wire78[(4'hf):(3'h4)]) < $unsigned($unsigned(wire69))))};
  always
    @(posedge clk) begin
      if (wire79[(3'h5):(1'h0)])
        begin
          reg124 <= (wire7 ?
              (8'ha3) : (wire75 ? reg74[(5'h11):(4'h8)] : $signed(wire9)));
          reg125 <= wire11[(4'hf):(4'hd)];
          reg126 <= ((wire75 ?
              {((~wire67) ? (wire7 ? wire75 : wire122) : (~|wire8)),
                  $unsigned((wire122 | reg125))} : wire122) >= wire10[(2'h3):(2'h3)]);
        end
      else
        begin
          reg124 <= wire77[(3'h6):(3'h6)];
        end
      reg127 <= {(7'h43),
          ((~&wire120) ~^ ((~((8'had) || wire11)) ?
              ((~^wire76) + wire7[(3'h6):(2'h2)]) : (reg73 < $signed(wire11))))};
    end
  assign wire128 = (~^($signed(($signed((8'hbe)) >>> $signed(reg126))) ?
                       (~^({wire9, (8'hbf)} ?
                           (8'ha6) : (+reg127))) : (wire67[(1'h0):(1'h0)] ?
                           wire120 : $signed((wire79 && (8'ha5))))));
  assign wire129 = wire75;
  assign wire130 = reg72;
  assign wire131 = $unsigned(($signed((^~(-reg74))) ?
                       $signed($signed((|wire11))) : (&{(!wire128),
                           (&wire79)})));
  assign wire132 = (reg74 ^~ $unsigned(wire131));
  assign wire133 = (8'hbb);
endmodule

module module80
#(parameter param118 = ((({{(8'h9d), (8'h9d)}} ? (~^((8'hb1) ~^ (8'hbc))) : (!(~&(8'h9d)))) ? {((8'ha8) ? ((8'hbe) <= (7'h41)) : ((7'h44) <= (8'hb9)))} : {((+(8'hb4)) ? ((8'had) ? (8'hb8) : (8'ha6)) : ((8'hb5) ? (8'h9e) : (8'hb3))), ({(8'hb2)} & ((8'hba) * (8'hb2)))}) ? (((8'hbd) ? (!(~&(8'h9c))) : {((8'h9d) <<< (8'ha9))}) ? ((~((8'ha8) || (8'h9d))) ? (((8'ha3) > (8'hbd)) ? {(7'h44), (8'ha9)} : (^(7'h42))) : (((8'ha6) < (8'hab)) ? ((8'ha1) >> (8'ha6)) : ((8'h9f) << (7'h43)))) : (((~&(8'hbb)) ? ((8'hb5) ? (8'ha5) : (8'hae)) : (&(8'hab))) ? ({(8'hae)} == ((8'ha1) ? (8'hb2) : (8'haa))) : ({(8'haa)} & (8'hb4)))) : (((~&(|(8'hb3))) ? ((!(8'hb8)) ? ((8'h9e) ? (8'hb5) : (8'hb4)) : {(8'ha4), (8'ha7)}) : (-(!(8'hb2)))) ? ((~^((7'h42) > (8'ha1))) || (((8'hb4) >= (8'h9e)) ? (~&(8'hbc)) : ((7'h42) | (8'ha2)))) : ((8'had) && (((7'h40) ? (8'h9e) : (8'h9f)) ? ((8'ha1) < (8'hb3)) : ((7'h40) ? (8'hb0) : (8'hac)))))), 
parameter param119 = (~|(+(^(~(8'hba))))))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire84;
  input wire signed [(2'h3):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire86;
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire98,
                 wire97,
                 wire96,
                 wire86,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= wire82[(3'h7):(3'h5)];
    end
  assign wire86 = wire84[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      if (wire86)
        begin
          if ($unsigned($signed(((-$signed(wire84)) == {$signed(wire81),
              $unsigned((8'hb9))}))))
            begin
              reg87 <= reg85[(4'hd):(2'h2)];
              reg88 <= (wire82 - (-$unsigned(wire83[(2'h2):(1'h1)])));
              reg89 <= $signed((($signed((reg85 << wire81)) ^~ ((^reg88) && (wire83 == wire86))) ?
                  ((((8'h9e) ?
                      reg85 : (8'hba)) <<< wire82[(2'h3):(1'h1)]) ^ wire81) : {$signed((^wire82)),
                      ((~^reg85) ? (wire81 ? wire83 : wire83) : wire86)}));
              reg90 <= (~^wire82);
              reg91 <= reg87;
            end
          else
            begin
              reg87 <= reg90[(3'h4):(2'h2)];
              reg88 <= (($unsigned(($unsigned(wire86) ?
                  wire83[(1'h0):(1'h0)] : $signed(reg89))) <= {$unsigned(wire83),
                  reg91}) <= $signed((!((reg85 ? wire82 : reg87) ?
                  wire84 : (~^wire84)))));
            end
          if ((wire81[(4'hb):(4'ha)] << {wire86}))
            begin
              reg92 <= $signed({(reg90[(4'hf):(3'h4)] == (^{reg90, wire84}))});
            end
          else
            begin
              reg92 <= ($signed({(wire82[(3'h6):(3'h4)] ?
                          reg87 : wire86[(3'h7):(3'h6)])}) ?
                  wire81 : (~&(reg85[(3'h7):(3'h5)] ?
                      reg91[(4'hc):(3'h5)] : wire86)));
            end
          reg93 <= reg90[(5'h10):(3'h7)];
        end
      else
        begin
          reg87 <= wire81[(3'h4):(3'h4)];
          reg88 <= $signed({(~|((reg89 || reg91) || reg91)),
              {$signed(wire82[(3'h5):(2'h3)])}});
          reg89 <= $unsigned((wire82 ?
              $signed((8'ha2)) : ($unsigned((reg87 != reg92)) << $signed((reg85 * reg85)))));
          reg90 <= wire83;
          reg91 <= {reg88, $unsigned((|$signed((reg92 || wire82))))};
        end
      reg94 <= $unsigned($signed((-reg91[(4'hd):(4'hd)])));
      reg95 <= ({(~^(8'hb8)), $unsigned({reg85})} ?
          (~^((|reg90[(4'hc):(4'h9)]) | ($unsigned((8'haf)) - $unsigned(reg85)))) : (((reg89 << (!reg88)) < (reg88[(3'h5):(2'h2)] && $unsigned((8'hab)))) ^ (~&reg92[(3'h7):(2'h3)])));
    end
  assign wire96 = {({wire81, wire86} + $unsigned($unsigned($unsigned(reg95)))),
                      $signed({wire81, wire86})};
  assign wire97 = $signed((~|reg93));
  assign wire98 = (~&$signed(($signed((wire82 ?
                      reg95 : (8'h9c))) || (-reg93[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire81)
        begin
          reg99 <= (+wire98);
          reg100 <= $unsigned($unsigned($signed($unsigned({reg99}))));
        end
      else
        begin
          if ($signed(((+wire96) ?
              ((-wire97[(4'hd):(2'h3)]) ?
                  reg88 : ((wire98 ? reg90 : wire81) ?
                      $signed(reg92) : ((7'h41) ? wire83 : reg91))) : wire96)))
            begin
              reg99 <= ({wire81,
                  $signed($signed((wire84 ? reg99 : reg88)))} >> (reg91 ?
                  (8'hb6) : reg89));
              reg100 <= {wire97[(1'h1):(1'h0)],
                  (^(reg90[(2'h2):(1'h1)] * $signed((!wire98))))};
              reg101 <= (~wire82[(2'h2):(1'h1)]);
              reg102 <= wire83;
            end
          else
            begin
              reg99 <= $unsigned(reg100);
            end
          reg103 <= wire83;
        end
      reg104 <= $signed(reg87[(1'h0):(1'h0)]);
      reg105 <= ((^~reg99) != $signed({(!$unsigned(wire82))}));
    end
  assign wire106 = (reg88 ?
                       wire98[(4'hd):(3'h7)] : $signed((reg95[(3'h4):(2'h2)] ?
                           $unsigned((wire86 ?
                               (8'h9f) : wire83)) : ($unsigned(wire97) >= (wire82 + reg105)))));
  assign wire107 = {{(8'hba), {reg102[(4'h8):(3'h5)]}}};
  assign wire108 = wire106;
  assign wire109 = ((wire108[(1'h0):(1'h0)] ?
                       $signed(wire108[(2'h2):(2'h2)]) : ($unsigned((wire97 ?
                           reg92 : wire96)) ^~ reg92)) > (((~reg101[(4'h8):(3'h4)]) <= {{(8'hab)}}) ?
                       (wire108 ?
                           reg102 : {$unsigned(reg105),
                               wire108}) : wire86[(2'h3):(2'h2)]));
  assign wire110 = $unsigned($signed(($unsigned(wire108[(1'h0):(1'h0)]) ?
                       $unsigned(wire96[(3'h7):(1'h1)]) : $unsigned($unsigned(reg100)))));
  always
    @(posedge clk) begin
      reg111 <= (^~($signed(($signed(wire84) > wire98[(4'hf):(4'he)])) <= reg85));
      reg112 <= ((~^(reg94[(1'h1):(1'h1)] ?
          (+$signed((8'ha6))) : $signed($signed(reg111)))) < $signed($signed((8'ha4))));
      reg113 <= {reg90[(1'h0):(1'h0)], $signed($unsigned(reg112))};
      reg114 <= reg88[(2'h2):(1'h0)];
      reg115 <= (+reg99[(4'hb):(4'h9)]);
    end
  assign wire116 = $unsigned(wire97[(2'h3):(2'h3)]);
  assign wire117 = wire106[(3'h6):(3'h4)];
endmodule

module module12
#(parameter param66 = {{({((8'h9c) | (8'hac)), ((8'h9c) <= (8'ha4))} ? (~&((8'ha3) ? (8'hac) : (8'hbe))) : {(&(8'ha3))}), ((!((8'ha8) ? (8'h9c) : (8'hb6))) > ((8'ha2) ? ((8'h9f) ? (8'hb5) : (8'ha0)) : ((8'ha2) ? (8'hb6) : (8'hbe))))}, ((+(8'had)) ? (^(8'ha7)) : {(((7'h43) | (8'ha1)) != (~|(8'hac)))})})
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire signed [(2'h2):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg59,
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
                 (1'h0)};
  assign wire18 = wire15[(1'h0):(1'h0)];
  assign wire19 = $unsigned($signed({$unsigned((~^wire15)),
                      $signed((^~wire17))}));
  assign wire20 = {{$signed(((~&(8'hb6)) ?
                              wire16[(5'h11):(5'h10)] : $signed(wire14))),
                          wire19[(1'h1):(1'h1)]}};
  assign wire21 = (wire20 <<< $unsigned(({$unsigned((8'haa)),
                      $signed(wire17)} - (-wire19[(2'h2):(1'h1)]))));
  assign wire22 = {$signed(wire17)};
  assign wire23 = $signed((&(!(wire19 ? (|wire15) : wire14))));
  assign wire24 = $signed((($signed(wire23[(2'h3):(2'h2)]) ?
                      wire20[(1'h1):(1'h0)] : ((7'h43) == wire21[(1'h1):(1'h1)])) ~^ (~|wire20[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg25 <= (+wire13);
      if ({$unsigned((|$signed((reg25 - wire22)))),
          $unsigned(wire23[(1'h0):(1'h0)])})
        begin
          reg26 <= wire22;
        end
      else
        begin
          if (wire20[(1'h1):(1'h1)])
            begin
              reg26 <= $unsigned($unsigned(wire16[(4'hf):(4'he)]));
              reg27 <= (~^wire13[(2'h2):(1'h0)]);
              reg28 <= $unsigned({{$signed($unsigned(wire13)),
                      wire16[(4'h8):(1'h1)]}});
              reg29 <= ({$unsigned(wire22[(1'h0):(1'h0)]),
                  wire24[(4'ha):(1'h1)]} >>> $unsigned(reg25));
              reg30 <= reg25;
            end
          else
            begin
              reg26 <= reg27[(3'h7):(1'h0)];
              reg27 <= wire13;
              reg28 <= {wire14, {wire19}};
              reg29 <= reg27[(2'h3):(2'h3)];
            end
          reg31 <= (&reg26[(3'h6):(3'h5)]);
        end
      reg32 <= reg31;
      reg33 <= {(^reg27[(3'h7):(1'h1)])};
      if ((wire15[(2'h2):(2'h2)] ?
          reg33[(4'he):(3'h5)] : (($unsigned((wire15 - wire16)) ?
                  wire16[(3'h4):(1'h0)] : $signed(reg27[(3'h6):(2'h2)])) ?
              (~^((8'ha7) >>> wire24)) : wire14)))
        begin
          reg34 <= $unsigned({$signed($unsigned(reg25[(3'h6):(2'h2)]))});
          if (((^$unsigned((reg30[(2'h2):(2'h2)] + (wire19 + wire19)))) ?
              (!(-(!wire17))) : (wire22[(3'h6):(3'h4)] ?
                  {({wire22, reg31} ? (!wire21) : $signed(wire20)),
                      ((reg31 ? wire23 : reg25) << {wire18,
                          wire18})} : wire23[(1'h1):(1'h1)])))
            begin
              reg35 <= (-((+wire20[(3'h4):(3'h4)]) ?
                  ($signed({reg29}) ?
                      ($signed(reg32) ^~ $unsigned((8'ha6))) : reg34) : wire13[(1'h1):(1'h1)]));
              reg36 <= (~|$signed(wire19[(1'h0):(1'h0)]));
            end
          else
            begin
              reg35 <= wire23[(2'h2):(2'h2)];
            end
          reg37 <= wire16;
        end
      else
        begin
          reg34 <= (~|reg25[(4'he):(2'h2)]);
          reg35 <= $unsigned($unsigned($unsigned($unsigned($signed(wire13)))));
          reg36 <= reg28;
          reg37 <= $unsigned(((reg37[(3'h7):(3'h4)] > $unsigned(reg34[(2'h3):(2'h3)])) ?
              wire21 : reg26));
          reg38 <= (reg33[(4'ha):(3'h6)] ?
              (^reg35) : {($unsigned($unsigned(reg29)) ?
                      (wire14[(4'h8):(2'h3)] ?
                          wire16 : reg25[(5'h13):(5'h13)]) : (wire22 == (wire18 ^~ (8'h9e))))});
        end
    end
  always
    @(posedge clk) begin
      reg39 <= ($unsigned({(|reg28)}) != wire18);
    end
  assign wire40 = wire15[(1'h0):(1'h0)];
  assign wire41 = (($signed({$unsigned(wire14), reg31[(4'he):(4'hd)]}) ?
                          (~^$unsigned(wire20)) : {$unsigned((wire21 ~^ (8'ha9))),
                              (~^$signed((8'hac)))}) ?
                      (wire23[(3'h4):(3'h4)] || reg38) : wire18[(3'h7):(3'h6)]);
  assign wire42 = reg35;
  assign wire43 = ({wire42,
                          ((wire21[(3'h6):(2'h3)] & (reg38 >= wire19)) == wire17[(1'h1):(1'h1)])} ?
                      (~|(~&((reg27 > wire16) ?
                          $signed(reg37) : $unsigned(wire41)))) : (~wire23[(2'h3):(1'h0)]));
  assign wire44 = {(8'hb1)};
  always
    @(posedge clk) begin
      reg45 <= reg30;
      reg46 <= {$unsigned((~^(!$unsigned(reg27)))), (8'hb8)};
      reg47 <= (((($unsigned((7'h43)) ? wire43 : (wire13 <<< wire42)) ?
              ($unsigned((8'ha1)) ^ (^~reg26)) : $unsigned($unsigned(wire44))) ?
          ($unsigned($signed(wire24)) >= wire18) : $unsigned(((reg39 ?
                  reg35 : reg39) ?
              reg33[(3'h6):(2'h2)] : (7'h40)))) <= $unsigned(reg31[(1'h0):(1'h0)]));
      reg48 <= $signed((~$unsigned((((8'hb7) ? reg35 : wire23) ?
          wire42 : $signed(reg36)))));
      if (wire41)
        begin
          reg49 <= $signed(reg33[(4'hd):(1'h1)]);
          reg50 <= $signed({reg45[(4'hb):(1'h1)]});
          reg51 <= ($unsigned($unsigned(wire18)) >>> $signed((~&$unsigned(reg36[(4'h8):(4'h8)]))));
          if (((8'haf) ~^ $signed((((wire16 & wire20) ?
              (wire21 ^ (8'hbc)) : ((8'hb1) ? reg34 : wire43)) >= (|{(7'h43),
              wire13})))))
            begin
              reg52 <= ($unsigned({{$signed(reg30), $unsigned(reg31)}}) ?
                  (&(~&wire44)) : $unsigned(wire14));
              reg53 <= wire21[(3'h5):(2'h2)];
              reg54 <= (({reg49[(1'h1):(1'h1)],
                          $signed((reg39 ? reg32 : reg39))} ?
                      $unsigned(reg25) : $signed(($unsigned(wire20) ?
                          $signed(reg45) : (+wire43)))) ?
                  wire41[(2'h2):(2'h2)] : {$signed(reg53),
                      $signed($signed(reg52))});
            end
          else
            begin
              reg52 <= reg51[(3'h7):(3'h4)];
              reg53 <= {$signed((8'h9d))};
              reg54 <= wire16[(1'h1):(1'h0)];
              reg55 <= $unsigned($signed($signed(((reg39 ? reg28 : wire19) ?
                  wire42 : $signed(reg34)))));
            end
          if ($signed($signed($signed($signed(reg35[(1'h0):(1'h0)])))))
            begin
              reg56 <= $signed(wire24);
              reg57 <= {(~^{reg33, (&wire22)}),
                  $signed($signed($unsigned($signed((7'h41)))))};
              reg58 <= reg56;
            end
          else
            begin
              reg56 <= ({{(reg37 ? $signed((8'ha6)) : (wire21 + wire14)),
                          wire19}} ?
                  $unsigned($unsigned(reg54)) : wire23);
              reg57 <= (~|wire14);
              reg58 <= $signed(reg58);
              reg59 <= wire22[(4'hb):(4'h8)];
            end
        end
      else
        begin
          if ($unsigned($unsigned(wire15[(2'h2):(1'h1)])))
            begin
              reg49 <= $signed((~|(8'h9d)));
              reg50 <= $signed((((^$unsigned(wire24)) << ($signed(reg51) <= (reg35 == reg46))) ?
                  (~|$signed((reg31 != reg27))) : $signed(reg53[(2'h2):(2'h2)])));
              reg51 <= (((wire23 >> $signed(wire23)) >= $signed((^~(8'hb2)))) ?
                  {reg46[(3'h6):(1'h0)]} : reg28[(4'hc):(1'h1)]);
              reg52 <= ((~^({wire44[(1'h0):(1'h0)],
                  (wire41 ? wire24 : reg27)} ~^ {reg46})) * {(({reg55} ?
                      (!wire16) : ((8'hac) ?
                          wire16 : wire15)) - (~$signed(reg25))),
                  (-$signed(reg46))});
            end
          else
            begin
              reg49 <= (reg52 ^ $unsigned((~{(wire44 ? reg29 : wire23),
                  (~|reg32)})));
              reg50 <= {reg32};
              reg51 <= {$signed((reg55[(3'h4):(1'h1)] ?
                      wire13[(1'h1):(1'h1)] : ($signed(reg47) < reg27))),
                  (wire19[(2'h2):(1'h1)] > $signed($signed($unsigned(wire17))))};
              reg52 <= $signed(((((7'h42) ?
                  (reg54 ?
                      wire40 : wire18) : (&wire21)) == (!$unsigned(reg55))) - (-$signed(reg58[(2'h2):(2'h2)]))));
              reg53 <= (($signed(((~reg47) ?
                  $signed(wire44) : {reg50})) + (&({(8'ha4), reg39} ?
                  (reg25 ? (8'ha1) : reg32) : wire40))) + reg26);
            end
        end
    end
  assign wire60 = (wire21[(3'h5):(2'h3)] ?
                      ($unsigned({{reg46}}) ?
                          wire15[(2'h2):(1'h0)] : ((~|(&wire16)) * $unsigned($unsigned(wire44)))) : $unsigned(($signed((reg49 ?
                          reg50 : wire22)) >>> {(wire13 ^ wire17),
                          (^wire23)})));
  assign wire61 = {reg32[(3'h5):(1'h0)]};
  assign wire62 = (&$unsigned((!((wire60 ?
                      reg55 : wire24) == $unsigned(reg56)))));
  assign wire63 = (((^(reg47[(3'h5):(1'h0)] ?
                              (reg55 != reg34) : (wire42 ? wire44 : wire16))) ?
                          $unsigned((|$signed(wire16))) : {((8'hbd) == $signed((8'ha4))),
                              (wire19 != {wire22, wire60})}) ?
                      ({($unsigned(reg57) ? (+wire22) : {(8'hae)}),
                          ((!wire19) ?
                              wire16 : ((7'h42) ?
                                  reg38 : (8'hb6)))} == wire40) : reg57[(2'h3):(2'h3)]);
  assign wire64 = (^~(($unsigned($signed(reg54)) ?
                      ((reg36 ? reg53 : reg38) ?
                          $unsigned(wire22) : (reg51 ?
                              (8'h9d) : reg39)) : {(reg55 <<< wire17)}) >= wire19));
  assign wire65 = (~&reg36);
endmodule

module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(4'h8):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire127,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 reg126,
                 reg125,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ((wire2[(4'h8):(3'h5)] + wire0) ^~ {(^($unsigned(wire1) << wire2[(3'h5):(3'h4)]))});
  assign wire5 = (^wire1[(2'h2):(1'h0)]);
  assign wire6 = (wire3 * ($unsigned((wire3[(4'hc):(2'h2)] != (~|wire2))) ?
                     wire1[(3'h5):(3'h5)] : wire5));
  always
    @(posedge clk) begin
      reg7 <= wire6;
      if ($signed($signed(($unsigned($signed(wire2)) ? (7'h43) : wire3))))
        begin
          reg8 <= ($unsigned($unsigned(wire4[(4'hc):(1'h0)])) ?
              $signed((((wire1 ?
                  wire4 : wire2) <= wire0[(1'h0):(1'h0)]) & ($signed(wire0) * wire4[(4'hd):(3'h5)]))) : ((~&$unsigned(wire1[(2'h2):(1'h0)])) >>> reg7));
          reg9 <= wire0[(5'h10):(4'h8)];
        end
      else
        begin
          reg8 <= ($unsigned($unsigned($unsigned($signed(wire3)))) < (8'haa));
          reg9 <= ((~wire6[(4'h9):(3'h7)]) >> ((~|$signed(wire1[(3'h6):(1'h0)])) ?
              $signed(reg9) : $signed(wire5[(1'h0):(1'h0)])));
          reg10 <= reg8;
        end
    end
  assign wire11 = wire4;
  assign wire12 = (7'h43);
  module13 #() modinst121 (.wire15(wire0), .y(wire120), .wire14(wire3), .clk(clk), .wire16(reg9), .wire17(reg8));
  assign wire122 = wire2[(2'h3):(2'h3)];
  assign wire123 = wire11[(4'hd):(3'h7)];
  assign wire124 = wire6[(4'hd):(1'h1)];
  always
    @(posedge clk) begin
      reg125 <= $signed((-reg10));
      reg126 <= ((($unsigned((reg9 < (8'haf))) ?
                  $unsigned($signed(wire2)) : {$signed((8'hae)),
                      $signed((8'h9d))}) ?
              (^~reg7[(3'h7):(3'h7)]) : wire123) ?
          $unsigned($signed({(wire2 == reg125),
              $signed(wire124)})) : $unsigned(($unsigned(wire120) | wire11[(5'h14):(2'h3)])));
    end
  assign wire127 = wire122;
endmodule

module module13
#(parameter param118 = {(((+((8'ha8) ^ (8'h9e))) == {((8'hb2) ? (8'ha9) : (8'hb5))}) + ((~^((7'h43) >= (7'h44))) ? (|((8'hb6) ? (8'hb0) : (8'hb4))) : (~|((8'ha9) ? (8'h9d) : (8'ha6)))))}, 
parameter param119 = {(^~(((param118 > (8'hb9)) * (&param118)) ? (~(!param118)) : param118))})
(y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire115;
  assign y = {wire117,
                 wire18,
                 wire63,
                 wire65,
                 wire87,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire115,
                 (1'h0)};
  assign wire18 = (^wire14);
  module19 #() modinst64 (.wire22(wire15), .y(wire63), .wire20(wire16), .wire21(wire18), .wire23(wire17), .clk(clk));
  assign wire65 = $unsigned($unsigned($unsigned({{wire18}})));
  module66 #() modinst88 (wire87, clk, wire15, wire16, wire63, wire17);
  assign wire89 = $signed(((wire15[(3'h6):(3'h6)] ?
                          (wire14[(3'h6):(1'h1)] <<< (wire65 ?
                              wire16 : wire65)) : (wire14[(3'h7):(1'h0)] & wire17)) ?
                      $unsigned(($unsigned((8'ha6)) ?
                          $unsigned(wire17) : {(8'ha4)})) : (($unsigned(wire87) ?
                              (wire18 ? wire65 : wire17) : wire65) ?
                          ((7'h44) ?
                              ((8'haf) ?
                                  wire87 : wire65) : wire18) : $unsigned($unsigned((8'hba))))));
  assign wire90 = $signed($unsigned((wire16[(4'ha):(2'h2)] ^ wire17)));
  assign wire91 = $unsigned((8'hbd));
  assign wire92 = wire65;
  module93 #() modinst116 (.clk(clk), .wire95(wire92), .wire94(wire18), .wire96(wire15), .wire98(wire65), .wire97(wire17), .y(wire115));
  assign wire117 = $unsigned(wire115[(5'h10):(5'h10)]);
endmodule

module module93
#(parameter param113 = ({((|((7'h40) ? (8'hb0) : (8'hb0))) ^~ (8'hbc)), {((&(8'hb1)) ? ((8'hba) ? (8'hbf) : (8'hbe)) : ((8'hb5) ^ (8'ha4))), (^{(7'h40), (8'hbb)})}} >> {((!((8'ha9) ^~ (7'h40))) ? (~(!(8'ha0))) : (8'hb1))}), 
parameter param114 = (~|(param113 ? ((8'ha9) && ((param113 ? param113 : param113) ? (param113 * param113) : param113)) : (((param113 ? param113 : (8'ha7)) >> (+param113)) ~^ (8'hbf)))))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire98;
  input wire [(4'h8):(1'h0)] wire97;
  input wire signed [(4'hc):(1'h0)] wire96;
  input wire signed [(3'h5):(1'h0)] wire95;
  input wire [(3'h7):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire99,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg101,
                 (1'h0)};
  assign wire99 = wire98;
  assign wire100 = (8'hbe);
  always
    @(posedge clk) begin
      reg101 <= wire98[(1'h0):(1'h0)];
    end
  assign wire102 = ($unsigned((~|$unsigned(reg101))) ^ wire94[(3'h5):(2'h3)]);
  assign wire103 = $unsigned(wire98);
  assign wire104 = $unsigned($unsigned({(~wire94)}));
  always
    @(posedge clk) begin
      reg105 <= $signed((^($unsigned($signed(wire97)) * (((8'hba) < wire98) && {wire98,
          wire104}))));
      if ({((|wire104) ?
              ({wire96[(4'hb):(4'h8)],
                  {(8'hb8)}} & $signed(wire97)) : (($unsigned(wire96) ?
                  $unsigned(reg105) : (wire94 ?
                      wire100 : wire99)) > $signed($unsigned((8'hbc))))),
          $unsigned(wire100[(4'h8):(1'h0)])})
        begin
          if ($signed((wire94 >> wire94)))
            begin
              reg106 <= reg105;
              reg107 <= (8'ha0);
              reg108 <= $signed((({(wire99 ? wire102 : wire95),
                      $signed(reg107)} >= $signed((^wire99))) ?
                  $unsigned(((wire98 <= wire97) ?
                      (wire103 == reg105) : wire102[(4'ha):(3'h4)])) : $signed(reg105)));
            end
          else
            begin
              reg106 <= ($unsigned({(!wire95[(2'h3):(1'h1)]),
                      $signed($signed(wire98))}) ?
                  wire95 : (~&$signed(($signed(wire98) ?
                      $unsigned(wire96) : {(8'hbf), reg108}))));
            end
          if (reg106)
            begin
              reg109 <= $unsigned(wire97[(3'h4):(2'h3)]);
              reg110 <= (~&$unsigned((^~$signed((wire97 != reg107)))));
            end
          else
            begin
              reg109 <= (^~(8'hbb));
              reg110 <= ($signed(wire98) < $signed($unsigned($signed((wire95 - reg107)))));
            end
          reg111 <= $unsigned($signed($signed((8'hbe))));
        end
      else
        begin
          reg106 <= wire95;
          reg107 <= wire102;
          reg108 <= wire97;
          reg109 <= (wire104[(3'h4):(1'h0)] ?
              (wire99 ?
                  wire95[(2'h2):(1'h1)] : $signed($signed($signed(reg105)))) : $unsigned($signed(($signed(wire99) ?
                  ((8'h9f) ? wire96 : wire99) : wire97[(2'h2):(1'h0)]))));
          reg110 <= $signed({(&(wire94 ? $signed((7'h42)) : {(8'hab)})),
              (^~(wire100 & wire94))});
        end
      reg112 <= (~(+((^reg105) ^~ reg101[(5'h10):(4'ha)])));
    end
endmodule

module module66
#(parameter param85 = ((!(8'hb1)) ? (((~(7'h43)) ? (((8'hb1) ? (8'hbb) : (7'h43)) ? (+(8'ha8)) : (!(8'h9c))) : ((~&(8'ha5)) ? ((8'h9c) <= (8'ha5)) : ((8'hbf) ? (8'had) : (8'h9f)))) ? ((((8'hb0) <= (8'hba)) << (8'hb2)) ? (8'hac) : (((7'h41) || (8'had)) ^ ((7'h40) ? (7'h41) : (8'hb3)))) : ({(-(8'hb0)), ((8'ha3) ? (8'hb3) : (8'ha2))} ~^ ((+(8'hbb)) ? ((8'ha9) <= (8'haa)) : (!(8'hbd))))) : ((~(^~(~(8'ha3)))) ? {(((8'ha5) <<< (8'had)) ? ((7'h42) ? (8'h9f) : (8'ha3)) : ((8'ha6) > (8'ha3)))} : ((|((8'hb4) ? (8'ha8) : (8'haf))) | (((8'had) <= (7'h44)) ? {(8'hb8)} : ((8'h9f) ? (8'haf) : (8'hba)))))), 
parameter param86 = (param85 ? (((~&{(8'had), param85}) ? param85 : {{param85}, param85}) ? (-(~(&param85))) : (7'h44)) : {((+(&param85)) ? param85 : ((~&param85) ? (param85 ? param85 : (8'hb6)) : param85))}))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire70;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire signed [(3'h5):(1'h0)] wire68;
  input wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire71;
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire73,
                 wire72,
                 wire71,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire71 = ($signed(wire68) ^~ ({(~&wire68[(1'h0):(1'h0)])} & ((&$signed(wire67)) ^ (+$unsigned(wire68)))));
  assign wire72 = wire70;
  assign wire73 = wire70[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg74 <= $signed(((((|wire71) ?
          {(8'ha7)} : $signed(wire73)) <<< $unsigned(wire69)) <= $signed(((wire69 ?
          wire69 : wire70) <= wire70))));
      if ($unsigned((wire71[(1'h1):(1'h0)] ?
          $unsigned((~^(8'h9f))) : ($unsigned(wire72) ^ $signed(wire70)))))
        begin
          if ((8'ha0))
            begin
              reg75 <= $unsigned(wire71);
              reg76 <= (reg75 <= (wire70[(1'h0):(1'h0)] ?
                  reg75 : (wire73[(3'h4):(1'h0)] ?
                      wire72[(4'he):(4'hc)] : $unsigned((reg75 ?
                          wire73 : wire68)))));
              reg77 <= (8'hb1);
              reg78 <= (wire69[(3'h4):(1'h1)] | ($unsigned((8'hae)) <<< (~^(((8'hb1) >= reg75) - wire71))));
              reg79 <= ((^$signed((((8'hbb) ? reg78 : wire69) ?
                      (wire69 && wire70) : (reg75 ^ reg75)))) ?
                  (($signed($unsigned((8'h9f))) > ((~wire72) ?
                      (wire72 ?
                          reg74 : wire69) : wire71)) >>> wire72) : (reg75[(4'hd):(4'hc)] == (!$signed($signed((8'had))))));
            end
          else
            begin
              reg75 <= wire71[(5'h10):(4'hc)];
              reg76 <= $unsigned($signed(wire69[(4'h8):(3'h5)]));
              reg77 <= {{reg77},
                  (wire68[(3'h4):(3'h4)] ?
                      wire68[(2'h3):(2'h3)] : $signed(reg76[(2'h3):(1'h0)]))};
              reg78 <= wire68;
              reg79 <= wire73[(4'hd):(4'ha)];
            end
          if ({reg76})
            begin
              reg80 <= (wire67[(5'h10):(3'h6)] ?
                  (wire72[(2'h3):(1'h0)] & (($unsigned(wire68) << (8'hb0)) ?
                      $signed(reg78[(3'h7):(3'h5)]) : ({wire72, reg76} ?
                          $unsigned((8'hb7)) : (wire72 ?
                              wire71 : reg76)))) : (~&$unsigned({reg78,
                      ((8'h9e) != wire68)})));
              reg81 <= (7'h41);
            end
          else
            begin
              reg80 <= (reg79[(4'ha):(4'h9)] ^~ ($signed(($unsigned(wire72) ?
                  {(8'hbb)} : wire72)) + (-((~^reg80) ?
                  $unsigned(reg74) : wire67))));
            end
        end
      else
        begin
          if (($unsigned($signed(((~&reg79) ?
              $unsigned(wire70) : (reg75 <= reg81)))) > reg78[(2'h2):(1'h1)]))
            begin
              reg75 <= ((^~(~|$unsigned(reg79[(2'h3):(2'h2)]))) ?
                  ((8'hbd) ?
                      wire69[(3'h4):(2'h2)] : {$unsigned((reg75 ^~ wire71)),
                          ($signed(wire72) && reg75)}) : (-reg76[(3'h7):(3'h5)]));
              reg76 <= {$signed($unsigned($signed((wire68 << reg77))))};
              reg77 <= $signed((8'hbb));
            end
          else
            begin
              reg75 <= {$signed(($signed((8'hba)) > ($unsigned(reg74) * $unsigned(reg75))))};
              reg76 <= $unsigned($signed(((reg76 - reg78[(1'h1):(1'h0)]) != {(^(8'h9d))})));
              reg77 <= (8'ha6);
            end
          reg78 <= (~&((($unsigned(reg75) ? $signed(reg81) : $unsigned(reg75)) ?
                  (-{wire68, wire72}) : (((8'hac) ?
                      wire70 : (8'hbc)) | reg74)) ?
              $signed((~^(reg80 + wire72))) : (reg77 + wire71[(2'h2):(2'h2)])));
          reg79 <= wire70;
          reg80 <= wire68[(3'h5):(3'h5)];
        end
      reg82 <= (~|(^(wire69[(4'hd):(1'h0)] || $signed((~&reg80)))));
    end
  assign wire83 = (~{(^{$unsigned(reg77)}), reg75});
  assign wire84 = wire72;
endmodule

module module19
#(parameter param61 = (((^({(8'ha3), (8'ha7)} ? ((8'hb7) ? (8'hb5) : (8'hb4)) : (7'h43))) ? (8'hb1) : (~(8'ha5))) ? ({(8'hb1)} ^ (({(8'hb7)} <= ((8'ha3) <<< (8'ha7))) & (((7'h42) ? (8'ha4) : (8'h9f)) ? ((8'ha2) ^~ (8'hb8)) : ((8'ha8) ? (8'hb1) : (8'hb7))))) : (({(8'ha7), {(8'ha7), (8'hb2)}} + (~^((8'had) ? (8'ha4) : (8'hb5)))) ? ({((8'hb6) << (8'h9d))} < (((8'ha9) ? (8'h9d) : (8'hbc)) ? (~^(8'hbe)) : ((8'hbe) ? (8'haa) : (8'ha0)))) : {(((8'hb2) ? (8'haa) : (8'hab)) ? ((8'hb5) ? (8'hb7) : (8'hb2)) : (8'hb4)), {(~^(8'ha4))}})), 
parameter param62 = (param61 << param61))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire [(3'h7):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire24;
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire24,
                 reg50,
                 reg49,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
  assign wire24 = (((~{$signed(wire23),
                      (|wire21)}) < wire21[(2'h3):(1'h1)]) ^~ $signed(wire20));
  always
    @(posedge clk) begin
      reg25 <= (((wire21 || (!$signed(wire24))) ?
              ($unsigned(wire23) >= wire20) : ((^(wire20 ? (8'ha6) : wire24)) ?
                  wire20[(1'h0):(1'h0)] : ((~wire22) | (|wire22)))) ?
          wire20 : ({$unsigned((wire22 ? (8'hb7) : wire23)),
              wire22} > $signed((~^$signed((8'hbf))))));
      reg26 <= (wire20 != {$signed($signed($unsigned(wire21))), wire20});
      reg27 <= (($unsigned(reg25[(5'h12):(4'hb)]) ?
          wire21 : (wire24[(1'h1):(1'h1)] > {{wire22, wire21}})) ~^ wire24);
      if (reg25)
        begin
          reg28 <= {$signed((wire21 | {$unsigned((8'hbc)),
                  ((8'hb6) ? wire21 : wire21)}))};
        end
      else
        begin
          reg28 <= (((((^reg26) ? {reg27} : $signed((8'ha3))) ?
                  $signed(((8'hb6) ? wire21 : reg25)) : reg28) ?
              reg27[(3'h5):(1'h0)] : (((reg28 & wire22) ?
                      {wire21, wire21} : (reg28 ? reg25 : wire21)) ?
                  (wire22[(3'h6):(3'h5)] && wire20) : reg26)) < $unsigned(wire24));
          reg29 <= $signed($signed(((&(wire22 <<< wire22)) ?
              (+(wire24 ? reg27 : reg25)) : reg27[(3'h5):(2'h3)])));
          reg30 <= (~^(^~($unsigned($unsigned(wire22)) * (&$signed(wire22)))));
          reg31 <= (reg27[(4'h9):(3'h7)] ?
              {{(7'h41), {(wire22 ? reg28 : reg26)}}} : ((reg27 <<< ((reg28 ?
                      reg28 : (8'hb0)) | {reg28, wire21})) ?
                  $unsigned($signed((8'hb5))) : {(|$signed(reg29))}));
          reg32 <= (wire20 ?
              reg27 : $signed(($unsigned(reg30) ?
                  reg25[(1'h0):(1'h0)] : {reg29, (wire22 & wire22)})));
        end
      reg33 <= wire20[(2'h2):(1'h0)];
    end
  assign wire34 = {reg33};
  assign wire35 = reg25;
  assign wire36 = $signed($signed(wire20));
  assign wire37 = ($unsigned({(~(|reg32)),
                      (~|wire21[(2'h2):(1'h0)])}) << $signed(((&reg30[(2'h3):(2'h3)]) + (~^$unsigned(reg25)))));
  always
    @(posedge clk) begin
      if ((~reg33[(2'h2):(1'h0)]))
        begin
          reg38 <= (~|(($unsigned((wire24 ?
              wire21 : reg31)) == $signed((wire37 > reg25))) >= $unsigned($signed((reg29 <= wire37)))));
          if ($unsigned($unsigned(wire37)))
            begin
              reg39 <= (reg25[(1'h1):(1'h0)] ?
                  (-$signed(wire21[(2'h2):(2'h2)])) : $signed(reg31));
              reg40 <= (wire24 | reg28);
              reg41 <= reg33;
              reg42 <= reg39[(2'h2):(2'h2)];
            end
          else
            begin
              reg39 <= ((^~$signed(reg38)) ?
                  ($unsigned((8'ha0)) ^ ($signed(reg27[(3'h4):(1'h1)]) - reg42[(1'h0):(1'h0)])) : $unsigned(($unsigned((8'hbf)) ?
                      reg31[(3'h4):(1'h0)] : reg26[(1'h0):(1'h0)])));
              reg40 <= (~&$signed(({wire35[(2'h3):(1'h1)],
                  (reg33 ? wire21 : reg29)} >>> wire22[(4'h8):(4'h8)])));
              reg41 <= $signed($signed(((~|(reg41 ? (8'hba) : reg30)) ?
                  (reg30 ?
                      (reg27 ?
                          wire24 : reg39) : $signed(wire20)) : ({wire23} + reg39))));
              reg42 <= reg28;
            end
        end
      else
        begin
          reg38 <= reg25[(4'hc):(4'hb)];
          reg39 <= reg42;
        end
      reg43 <= wire35;
      reg44 <= $signed(($unsigned((^{reg33,
          (8'hb0)})) && reg40[(2'h2):(1'h0)]));
    end
  assign wire45 = reg25;
  assign wire46 = (!wire23[(4'h8):(3'h5)]);
  assign wire47 = ({reg28} ^~ $signed($signed(((~|wire45) >= wire35[(1'h1):(1'h1)]))));
  assign wire48 = $signed(wire47);
  always
    @(posedge clk) begin
      reg49 <= $signed(((reg44[(3'h5):(2'h2)] ?
              ($signed(wire34) == reg33[(4'ha):(4'h9)]) : reg32[(4'ha):(4'h8)]) ?
          ((+wire37[(3'h7):(3'h6)]) >>> reg39) : reg29));
      reg50 <= $signed({((reg39[(4'hf):(1'h1)] && $unsigned(wire45)) ?
              reg49[(3'h5):(3'h4)] : (wire21 ?
                  $unsigned(wire35) : reg38[(3'h4):(2'h2)]))});
    end
  assign wire51 = ($unsigned($unsigned($unsigned({wire48, reg27}))) * reg31);
  assign wire52 = $unsigned(reg29[(4'hc):(4'h8)]);
  assign wire53 = ($signed({wire48[(1'h0):(1'h0)], wire24[(5'h12):(3'h5)]}) ?
                      (&(|{$signed(reg41)})) : {((^{reg31}) & reg41),
                          (~|$signed(wire34[(3'h4):(3'h4)]))});
  assign wire54 = reg49;
  assign wire55 = (!((wire45 ? wire20 : reg40) ? (|$signed((8'hb6))) : reg33));
  assign wire56 = $signed(($signed($signed(reg33[(4'he):(1'h0)])) ~^ reg49));
  assign wire57 = $unsigned(wire24);
  assign wire58 = wire51;
  assign wire59 = wire57[(4'hf):(3'h7)];
  assign wire60 = $signed($unsigned(({{reg28, (8'hbc)}} ~^ wire35)));
endmodule

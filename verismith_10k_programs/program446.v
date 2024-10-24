module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire137;
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire132,
                 wire57,
                 wire56,
                 wire54,
                 wire5,
                 wire6,
                 wire52,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 reg55,
                 (1'h0)};
  assign wire5 = (({(^$signed(wire3))} - (|$unsigned({wire0,
                     (7'h42)}))) ~^ {$signed(wire3[(2'h2):(1'h0)]),
                     (wire2 <= ((wire3 ? wire3 : wire0) >= wire2))});
  assign wire6 = ($unsigned($unsigned($unsigned(wire3[(4'h8):(2'h3)]))) ?
                     wire4[(1'h0):(1'h0)] : wire3);
  module7 #() modinst53 (wire52, clk, wire0, wire4, wire5, wire1, wire2);
  assign wire54 = wire52;
  always
    @(posedge clk) begin
      reg55 <= (8'ha3);
    end
  assign wire56 = ({$signed($signed((^wire2))), (!(-wire1[(5'h11):(2'h3)]))} ?
                      (+wire5) : ({$unsigned(((8'hbe) >= (8'ha2))),
                              ((+wire0) <<< wire52[(3'h5):(3'h5)])} ?
                          ($signed((~wire54)) ?
                              wire0 : (~|(wire0 ? (8'hba) : wire3))) : wire52));
  assign wire57 = {(!wire54), (~|wire6[(4'hc):(2'h3)])};
  module58 #() modinst133 (wire132, clk, wire6, wire52, wire5, wire2, wire56);
  assign wire134 = wire57;
  assign wire135 = wire4[(1'h0):(1'h0)];
  assign wire136 = $unsigned($unsigned({(~&((8'haf) ? (8'hb4) : wire1)),
                       (8'ha5)}));
  module58 #() modinst138 (.wire62(wire4), .wire60(wire57), .y(wire137), .wire61(wire54), .wire59(wire6), .clk(clk), .wire63(wire1));
  assign wire139 = $unsigned((+$signed(((wire1 ?
                       wire136 : wire4) > (wire1 ~^ wire132)))));
  assign wire140 = $unsigned($unsigned(reg55));
endmodule

module module58  (y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  input wire [(5'h13):(1'h0)] wire61;
  input wire [(2'h3):(1'h0)] wire60;
  input wire [(4'ha):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire131;
  wire [(3'h6):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire122;
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire92,
                 wire64,
                 wire94,
                 wire95,
                 wire122,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire64 = wire60;
  always
    @(posedge clk) begin
      reg65 <= wire63;
      if ($unsigned($unsigned((wire59 < wire64))))
        begin
          reg66 <= {$unsigned({(~(wire61 ? wire64 : wire62))}),
              ($signed(($signed(reg65) ^~ (-reg65))) ?
                  (($signed(wire59) ? $signed(wire62) : wire59[(2'h3):(1'h0)]) ?
                      (~|wire61) : ((wire60 ^ wire64) > $signed(wire64))) : reg65)};
        end
      else
        begin
          reg66 <= {$unsigned((&$signed({wire61})))};
          reg67 <= reg66[(5'h10):(3'h7)];
        end
    end
  always
    @(posedge clk) begin
      reg68 <= (reg65 ? wire59 : wire61);
      reg69 <= $signed(($signed($signed((wire60 ? wire64 : reg65))) ?
          reg67 : (|wire64)));
      reg70 <= {((7'h44) ?
              $unsigned($unsigned({reg67})) : $signed((reg69[(2'h3):(1'h1)] >= reg68)))};
      if ($signed($signed((+$signed(reg67)))))
        begin
          reg71 <= (~&wire59[(4'ha):(3'h6)]);
          reg72 <= (~|$unsigned($unsigned({wire62})));
          reg73 <= reg72[(3'h5):(2'h3)];
          reg74 <= (((&reg71[(3'h6):(3'h6)]) ?
                  $signed(reg66) : {$unsigned($signed(reg67))}) ?
              {(+(+$signed(reg65)))} : $unsigned($unsigned((~^((7'h42) ?
                  wire63 : reg70)))));
          reg75 <= reg70[(1'h0):(1'h0)];
        end
      else
        begin
          reg71 <= $unsigned(reg66[(4'hd):(2'h2)]);
          reg72 <= (^(8'hb3));
          if ((reg74 ? $signed($unsigned((|reg75[(1'h1):(1'h0)]))) : wire64))
            begin
              reg73 <= ({(reg67[(4'h8):(4'h8)] ?
                          (reg65 >> $unsigned(wire60)) : (|reg69[(1'h0):(1'h0)])),
                      reg73[(4'he):(3'h4)]} ?
                  (&(!($unsigned(wire59) ?
                      wire62 : ((8'hb0) ?
                          reg72 : (8'ha8))))) : reg65[(4'hd):(4'hd)]);
            end
          else
            begin
              reg73 <= ($unsigned(($unsigned($unsigned(wire62)) >>> reg72[(1'h1):(1'h0)])) ?
                  $signed(reg73) : $signed(reg67[(5'h14):(4'ha)]));
              reg74 <= wire61;
              reg75 <= (($unsigned({reg72}) ^~ $signed($signed((^~reg70)))) * $signed($signed((((8'ha5) ?
                  wire62 : wire59) > {reg68, wire63}))));
            end
          reg76 <= $signed({wire62[(1'h0):(1'h0)]});
        end
      reg77 <= (wire63 + reg76[(3'h5):(2'h3)]);
    end
  module78 #() modinst93 (.wire81(reg77), .wire82(reg67), .wire79(wire60), .y(wire92), .clk(clk), .wire80(reg71));
  assign wire94 = $unsigned($unsigned($unsigned((wire60[(2'h3):(1'h1)] ?
                      ((8'ha5) ? wire64 : reg76) : reg68))));
  assign wire95 = $signed((($unsigned((-wire60)) ?
                          (^~$unsigned((8'ha4))) : reg75[(2'h2):(1'h1)]) ?
                      {{(reg66 ? wire60 : wire92)},
                          (~&$signed(reg66))} : (reg74[(4'hf):(4'h8)] ?
                          (~^$unsigned(wire61)) : wire92[(2'h2):(2'h2)])));
  module96 #() modinst123 (.wire98(reg70), .wire101(wire63), .wire97(wire95), .wire100(reg77), .clk(clk), .wire99(wire62), .y(wire122));
  assign wire124 = (-$unsigned(reg76));
  assign wire125 = (wire94 ? $signed($signed(wire95[(5'h12):(4'he)])) : wire63);
  assign wire126 = (|wire59);
  assign wire127 = $unsigned((+$signed(reg72[(3'h4):(3'h4)])));
  assign wire128 = {wire124};
  assign wire129 = wire95[(4'he):(3'h5)];
  assign wire130 = reg66[(4'h8):(1'h1)];
  assign wire131 = reg74;
endmodule

module module7
#(parameter param51 = (-(8'hb7)))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire43,
                 wire41,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg17,
                 (1'h0)};
  assign wire13 = $unsigned(wire9[(3'h5):(3'h5)]);
  assign wire14 = $signed(wire12);
  assign wire15 = ((-wire13[(4'ha):(3'h4)]) ? wire11 : wire8);
  assign wire16 = {$signed(($signed(wire12[(1'h0):(1'h0)]) ^ $signed($unsigned(wire14))))};
  always
    @(posedge clk) begin
      reg17 <= $signed(({wire12} ?
          wire12 : {$unsigned($unsigned(wire15)), $signed((wire11 < wire16))}));
    end
  module18 #() modinst42 (wire41, clk, wire9, reg17, wire12, wire13, wire15);
  assign wire43 = $signed((((~|wire11[(2'h2):(1'h0)]) >= (-wire12)) ^ ((-wire14[(1'h1):(1'h0)]) ?
                      $signed((~&wire10)) : wire12)));
  always
    @(posedge clk) begin
      reg44 <= wire14;
      reg45 <= (wire15 ?
          $signed((-(|wire12))) : ((((wire9 ?
                  wire8 : wire15) & wire10[(4'h8):(2'h3)]) + (((8'ha6) ?
                      wire12 : wire41) ?
                  (wire11 * wire9) : reg44)) ?
              {(wire41[(4'h8):(2'h2)] ?
                      $signed(wire8) : {(8'haf)})} : ((|wire43) > (~((8'hb6) ?
                  (8'h9e) : wire16)))));
      reg46 <= (wire15[(4'hb):(4'h8)] == wire14[(1'h1):(1'h0)]);
      reg47 <= reg46[(2'h2):(1'h0)];
      reg48 <= {($unsigned($unsigned(((7'h40) ? wire8 : (8'hb5)))) ?
              $unsigned($unsigned(wire12[(3'h7):(2'h3)])) : wire13)};
    end
  assign wire49 = ((wire12 - reg46) ? wire10[(2'h2):(1'h1)] : (7'h40));
  assign wire50 = reg45;
endmodule

module module18
#(parameter param40 = (~|(~^(^~(((8'hae) ? (8'hb4) : (7'h42)) ? {(8'h9c), (7'h43)} : (~^(8'h9e)))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire signed [(4'he):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg31,
                 (1'h0)};
  assign wire24 = ((~|wire19) < $signed(wire20));
  assign wire25 = wire20[(1'h1):(1'h1)];
  assign wire26 = (~|$unsigned(wire21[(4'h9):(4'h9)]));
  assign wire27 = ($signed((8'had)) ? wire20 : wire21[(1'h0):(1'h0)]);
  assign wire28 = wire23;
  assign wire29 = (~(8'hb5));
  assign wire30 = wire28[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg31 <= wire29;
    end
  assign wire32 = $unsigned(((-(wire29[(2'h3):(1'h1)] ?
                      (wire25 ? wire23 : wire19) : (wire20 ?
                          wire24 : (8'hb4)))) || ((&{wire26,
                      wire22}) << $unsigned((wire25 & wire20)))));
  assign wire33 = (wire26 ?
                      {((+$signed(wire28)) > wire19[(2'h2):(2'h2)])} : $signed({(wire19 ?
                              $unsigned(wire20) : (~^wire28)),
                          ((~|wire26) ^ $signed(wire32))}));
  assign wire34 = $unsigned(wire25);
  assign wire35 = ({{$unsigned(((8'hb0) ? wire23 : wire30))}} >>> wire30);
  assign wire36 = wire34;
  assign wire37 = ((-{wire29[(3'h7):(3'h4)]}) > wire19);
  assign wire38 = ((^~wire25) * wire24[(3'h5):(1'h0)]);
  assign wire39 = $signed((|wire28));
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire101;
  input wire signed [(4'hf):(1'h0)] wire100;
  input wire [(4'hb):(1'h0)] wire99;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire signed [(2'h2):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire103,
                 wire102,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire102 = (wire98 || (^~wire97[(1'h1):(1'h0)]));
  assign wire103 = (wire98 & (8'hac));
  always
    @(posedge clk) begin
      reg104 <= {$unsigned((((wire98 >> wire102) << {wire100}) ?
              $signed(wire101[(1'h0):(1'h0)]) : wire101[(1'h1):(1'h1)]))};
      if (wire102[(3'h6):(2'h2)])
        begin
          reg105 <= (&wire102[(3'h4):(2'h3)]);
          reg106 <= (((|(wire103 & (wire97 + wire100))) ~^ wire97) ?
              $unsigned($unsigned({((7'h44) ? (8'hb6) : wire100),
                  wire97[(1'h0):(1'h0)]})) : wire102);
        end
      else
        begin
          if ((^((wire103 ?
              (-$unsigned(wire103)) : wire98[(2'h2):(1'h1)]) || ((~|{(8'ha7),
              wire99}) > {reg105, (|wire103)}))))
            begin
              reg105 <= $unsigned($signed($unsigned($unsigned((^wire97)))));
              reg106 <= (8'ha4);
              reg107 <= (|reg106[(3'h4):(1'h1)]);
            end
          else
            begin
              reg105 <= ($unsigned((~^wire99)) || ((~^$signed(wire101[(2'h3):(2'h2)])) ^~ (^(+(&wire103)))));
              reg106 <= (7'h44);
            end
          reg108 <= $signed((8'hba));
        end
      if ($unsigned(wire102[(3'h4):(2'h3)]))
        begin
          reg109 <= (($signed((~$signed(reg108))) ?
                  (wire99[(3'h6):(2'h3)] ?
                      wire97[(1'h1):(1'h1)] : (wire101 ^ $signed(wire99))) : (~&(~^(wire101 ?
                      reg107 : wire102)))) ?
              $unsigned({(~|(reg105 >= reg104))}) : wire98[(2'h3):(2'h3)]);
          reg110 <= wire101[(2'h2):(2'h2)];
        end
      else
        begin
          reg109 <= (({wire97[(2'h2):(1'h0)]} ?
              reg109 : ($unsigned({reg106, wire101}) ?
                  ((wire102 <= reg105) << (wire99 ?
                      wire99 : wire98)) : $unsigned(reg106[(2'h2):(1'h0)]))) || ($unsigned($unsigned((^~wire98))) ^ wire102[(4'h8):(3'h5)]));
          reg110 <= wire102;
        end
    end
  assign wire111 = reg109;
  assign wire112 = $unsigned((reg105[(4'h8):(4'h8)] ?
                       reg106 : (|$signed($signed(reg110)))));
  assign wire113 = $signed((|{((^reg106) ?
                           (wire101 << (8'hb0)) : (reg108 ? wire102 : wire99)),
                       ($unsigned(reg110) ? {wire102} : $unsigned(wire102))}));
  assign wire114 = (~$unsigned($signed(($signed(wire103) ?
                       wire98[(2'h2):(1'h0)] : reg109[(2'h2):(2'h2)]))));
  assign wire115 = {wire98};
  assign wire116 = wire97;
  assign wire117 = {(wire114 ?
                           (reg106[(1'h0):(1'h0)] > reg108) : (wire101[(2'h2):(1'h1)] == wire115))};
  assign wire118 = reg105[(5'h12):(5'h10)];
  assign wire119 = (-$unsigned(({reg106[(2'h2):(1'h0)],
                       (reg108 ? (8'hb5) : wire101)} > (8'haf))));
  assign wire120 = wire112;
  assign wire121 = (!(8'h9e));
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire82;
  input wire [(3'h4):(1'h0)] wire81;
  input wire [(4'hd):(1'h0)] wire80;
  input wire [(2'h2):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 (1'h0)};
  assign wire83 = (&wire81);
  assign wire84 = wire82[(3'h4):(1'h1)];
  assign wire85 = ($signed($unsigned(((wire81 ? wire82 : (8'ha6)) ?
                      wire82 : (wire81 >= wire80)))) * (8'h9c));
  assign wire86 = {($unsigned(((wire81 <= wire82) ?
                          wire82 : {wire84})) && (~|wire84))};
  assign wire87 = (^wire80[(3'h5):(1'h1)]);
  assign wire88 = $unsigned(wire86[(4'h8):(1'h1)]);
  assign wire89 = (($signed((~&(wire87 ?
                      (8'ha9) : (8'haa)))) >= wire84[(1'h0):(1'h0)]) > (((wire82 ?
                      wire80[(4'hb):(2'h3)] : (8'hb5)) | {(|wire88)}) > $unsigned((~|$unsigned(wire85)))));
  assign wire90 = $unsigned(wire86);
  assign wire91 = ($unsigned($unsigned({(wire88 + wire85)})) >> (((~(wire79 >= wire84)) >>> wire82) ?
                      wire80 : $signed((8'h9d))));
endmodule

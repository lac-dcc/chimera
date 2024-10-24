module top
#(parameter param145 = ((!((8'hb8) ? (((7'h44) ? (7'h40) : (8'ha3)) ? {(8'h9f)} : ((8'hb1) ? (8'ha8) : (8'h9e))) : (!((8'h9d) ? (8'ha3) : (8'hbf))))) > (!(((~^(7'h43)) >> ((8'hb6) == (7'h40))) ? (^{(8'hab)}) : ((~(8'ha8)) ? ((8'ha4) ? (8'ha9) : (8'ha8)) : ((8'h9c) ? (8'hb2) : (8'ha8)))))), 
parameter param146 = param145)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire144;
  wire [(5'h11):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire5;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire5,
                 (1'h0)};
  assign wire5 = {{wire1[(4'ha):(2'h2)]}, wire0[(1'h1):(1'h0)]};
  module6 #() modinst134 (.wire9(wire4), .wire8(wire1), .wire10(wire5), .y(wire133), .wire7(wire3), .clk(clk));
  assign wire135 = (|wire3[(4'hc):(3'h6)]);
  assign wire136 = (~^(!($signed($signed((8'hbb))) <<< wire2)));
  assign wire137 = wire2;
  assign wire138 = $signed(wire4);
  assign wire139 = (-$unsigned(wire0[(2'h2):(1'h0)]));
  assign wire140 = ($unsigned(wire138) ?
                       $unsigned($signed({wire5,
                           wire2})) : (!$unsigned((&wire133[(1'h1):(1'h0)]))));
  assign wire141 = ($unsigned($unsigned((!$unsigned(wire2)))) + $unsigned(wire2));
  assign wire142 = {wire133[(4'hc):(2'h2)],
                       $unsigned((|($unsigned(wire4) * (^wire2))))};
  assign wire143 = wire138[(2'h3):(1'h0)];
  assign wire144 = (~$signed(((^$signed(wire4)) - wire141)));
endmodule

module module6
#(parameter param131 = (&(~&(!{((8'h9f) < (8'hae))}))), 
parameter param132 = (|((-param131) ? param131 : param131)))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire128;
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  assign y = {wire130,
                 wire85,
                 wire57,
                 wire55,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire87,
                 wire88,
                 wire93,
                 wire94,
                 wire95,
                 wire128,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg58,
                 (1'h0)};
  assign wire11 = ((((wire7 ? wire9 : ((8'hba) >> wire9)) ?
                              $signed($unsigned(wire9)) : wire10) ?
                          $unsigned(wire10) : wire9) ?
                      (~(wire7 > wire9)) : wire10[(2'h3):(2'h2)]);
  assign wire12 = wire9;
  assign wire13 = wire8;
  assign wire14 = ({((~|(wire12 ? wire8 : wire11)) << ((wire8 ?
                              wire9 : (7'h44)) ^ $signed(wire13)))} ?
                      $unsigned($unsigned({wire11[(2'h3):(1'h0)]})) : wire11);
  module15 #() modinst56 (wire55, clk, wire13, wire14, wire7, wire10);
  assign wire57 = (~|wire7[(5'h12):(3'h4)]);
  always
    @(posedge clk) begin
      reg58 <= wire12[(4'ha):(3'h7)];
    end
  module59 #() modinst86 (.wire62(wire13), .wire64(wire14), .wire63(wire7), .y(wire85), .wire61(wire55), .clk(clk), .wire60(wire10));
  assign wire87 = {wire55, $unsigned(wire57)};
  assign wire88 = {$unsigned(wire7[(3'h4):(2'h2)]),
                      (((wire10[(3'h5):(1'h0)] ?
                          $signed(wire57) : wire55) ^~ $signed((wire12 != wire85))) & wire57)};
  always
    @(posedge clk) begin
      reg89 <= wire57;
      if ($signed(wire10))
        begin
          reg90 <= ((&wire11) | $unsigned($signed(wire14)));
        end
      else
        begin
          reg90 <= {wire11, wire13};
          reg91 <= ((wire85 ?
              ((8'h9e) ?
                  $signed($signed((8'hbc))) : wire9) : ($unsigned((-wire7)) && $signed((wire87 >>> reg90)))) & $unsigned((|(((8'hb9) ^ wire14) == (wire55 >>> wire88)))));
          reg92 <= wire55[(4'hb):(3'h6)];
        end
    end
  assign wire93 = ((~|wire14[(1'h1):(1'h1)]) ? wire10 : reg58[(1'h1):(1'h1)]);
  assign wire94 = wire55[(4'hf):(1'h1)];
  assign wire95 = $unsigned(wire55[(3'h7):(1'h0)]);
  module96 #() modinst129 (wire128, clk, wire93, reg89, reg91, wire12, wire94);
  assign wire130 = wire85[(4'h9):(3'h6)];
endmodule

module module96
#(parameter param126 = (-(+(~&((^~(8'ha4)) ? ((7'h41) ? (7'h44) : (8'hbc)) : ((8'hb7) <<< (8'hb0)))))), 
parameter param127 = (|(8'hbb)))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire101;
  input wire signed [(5'h11):(1'h0)] wire100;
  input wire signed [(2'h2):(1'h0)] wire99;
  input wire signed [(2'h2):(1'h0)] wire98;
  input wire [(3'h6):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  assign y = {wire125,
                 wire116,
                 wire115,
                 wire114,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg102 <= $signed((~^($signed($signed(wire99)) - ({wire100} ?
          (wire98 ? (8'haf) : wire99) : wire97[(1'h1):(1'h1)]))));
      if ({$signed((8'hb4))})
        begin
          reg103 <= (({((wire101 | wire97) ~^ wire97)} ^ wire98) ?
              $unsigned($signed(wire101)) : (~(8'ha7)));
          if ($signed((~&($unsigned($unsigned(wire99)) ?
              (wire99 ?
                  $unsigned(wire100) : ((8'hb2) ^~ (8'hb4))) : $signed($unsigned(reg102))))))
            begin
              reg104 <= reg102[(4'h9):(2'h3)];
              reg105 <= $unsigned((wire98 ?
                  wire101[(1'h0):(1'h0)] : reg102[(2'h3):(1'h1)]));
              reg106 <= (-$unsigned(reg105[(1'h0):(1'h0)]));
              reg107 <= (|$signed((~|wire101[(2'h3):(1'h0)])));
            end
          else
            begin
              reg104 <= reg103[(2'h3):(2'h3)];
            end
          reg108 <= (({(!(wire98 ?
                  reg107 : reg104))} + (-(8'hbf))) != reg103[(2'h2):(1'h0)]);
        end
      else
        begin
          reg103 <= (8'hb7);
          reg104 <= ({$unsigned({wire98[(1'h0):(1'h0)], {wire100}}),
              {{{wire101, wire100}}, reg107[(3'h5):(1'h1)]}} == ((^wire101) ?
              reg105[(2'h3):(1'h1)] : wire97[(3'h5):(3'h5)]));
          reg105 <= {$signed($unsigned(wire99))};
          reg106 <= (^~($signed($signed($signed(wire97))) ?
              wire98 : $signed(((reg102 ?
                  reg106 : wire98) ^~ reg105[(3'h4):(2'h2)]))));
          if (((((reg104 << $signed(reg108)) ?
                  $signed((&reg103)) : reg106[(3'h6):(1'h0)]) ?
              wire100[(5'h10):(1'h0)] : (({reg106} ?
                  wire98 : wire98) - (reg108[(2'h2):(2'h2)] ~^ (&reg103)))) <<< (|(8'hbc))))
            begin
              reg107 <= (^~$signed(($unsigned($unsigned(wire98)) >>> {$unsigned(reg108)})));
              reg108 <= reg103;
              reg109 <= (reg102 >>> reg107);
            end
          else
            begin
              reg107 <= $signed($unsigned((((reg106 ^ (8'hb4)) | reg109) <<< (^(wire101 ?
                  wire97 : reg104)))));
              reg108 <= (|reg105[(3'h6):(1'h1)]);
              reg109 <= wire101[(1'h0):(1'h0)];
              reg110 <= $unsigned(reg107[(3'h5):(2'h2)]);
              reg111 <= $unsigned($signed(reg102));
            end
        end
      reg112 <= $unsigned($unsigned({({wire100} ?
              $signed(reg107) : (~&(8'h9f))),
          reg104}));
      reg113 <= (8'h9d);
    end
  assign wire114 = (wire99[(1'h1):(1'h1)] >= $unsigned($unsigned(($unsigned(wire99) ?
                       $signed(reg102) : reg108))));
  assign wire115 = wire99[(1'h1):(1'h1)];
  assign wire116 = (~^(8'hac));
  always
    @(posedge clk) begin
      if ((~(~^(~|(reg106[(4'hc):(3'h4)] <<< $unsigned(reg108))))))
        begin
          if (reg113[(3'h5):(2'h3)])
            begin
              reg117 <= reg112;
              reg118 <= ({wire97[(1'h0):(1'h0)],
                  (&$signed($signed(reg102)))} >= (|{wire101}));
              reg119 <= $signed((wire101 < $unsigned($signed((|reg112)))));
            end
          else
            begin
              reg117 <= $signed($unsigned(((~((8'ha8) ? wire100 : wire101)) ?
                  ((reg102 ?
                      wire116 : reg105) || $unsigned(wire100)) : ((reg106 ?
                      reg104 : reg112) > $unsigned(reg109)))));
              reg118 <= (((|(8'ha5)) ?
                  $signed($signed(wire101)) : (-reg118)) != reg119);
              reg119 <= {reg109[(2'h3):(2'h3)]};
            end
          reg120 <= (((8'hbf) == reg110[(1'h0):(1'h0)]) ?
              ($signed($signed($unsigned((8'hb1)))) ?
                  (reg112 ?
                      wire101[(2'h3):(1'h0)] : ($signed((8'h9d)) <= (wire100 <= reg119))) : (reg103 ?
                      (+$signed(reg103)) : reg113)) : {$signed((^(|wire100))),
                  (~^(^~(^wire99)))});
          reg121 <= ($signed(reg104) <= $signed(((^~wire99[(1'h0):(1'h0)]) - ($unsigned(wire100) ?
              (reg106 ? wire98 : reg112) : (+reg117)))));
        end
      else
        begin
          reg117 <= wire99[(1'h0):(1'h0)];
          if ((~(reg105[(2'h3):(2'h3)] ?
              $signed(wire116[(4'hc):(4'h8)]) : ($unsigned($signed(reg105)) ?
                  reg112[(1'h1):(1'h1)] : (~^wire101[(1'h1):(1'h1)])))))
            begin
              reg118 <= wire99[(1'h0):(1'h0)];
              reg119 <= ($unsigned($unsigned((reg103 ?
                      (wire99 ^ wire100) : (-reg120)))) ?
                  reg117 : reg110);
              reg120 <= wire101;
              reg121 <= {{$signed((8'h9f))}};
            end
          else
            begin
              reg118 <= wire100[(5'h10):(5'h10)];
              reg119 <= $unsigned({{reg113},
                  $unsigned((reg106 ? (&(8'ha0)) : reg120))});
            end
        end
      reg122 <= ((~$signed(($signed(wire98) ^~ (^reg109)))) ^ wire98[(1'h0):(1'h0)]);
      reg123 <= $unsigned(reg113);
      reg124 <= $unsigned(reg117);
    end
  assign wire125 = reg112[(1'h0):(1'h0)];
endmodule

module module59
#(parameter param83 = ((((+(+(8'hac))) != (!((8'hb9) ? (7'h44) : (8'had)))) > ({(~(8'h9c))} ? (((7'h44) ? (8'hbd) : (8'ha7)) ? ((8'hb7) ? (8'ha6) : (8'hb8)) : {(8'hb8)}) : (^((8'ha9) ? (8'hbb) : (8'hb9))))) ? (!{(~&((8'h9f) ? (8'hb2) : (8'hb9)))}) : (((((7'h41) == (7'h44)) ? ((8'ha1) ? (8'ha0) : (8'h9f)) : ((8'ha5) << (8'hb8))) || (((8'ha5) ? (8'h9e) : (8'hb7)) > ((8'ha4) ? (8'hb6) : (8'hb4)))) < (~^(((8'h9e) ? (8'hb2) : (8'hbd)) - ((8'ha4) ? (8'ha3) : (8'ha5)))))), 
parameter param84 = (~|param83))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire64;
  input wire [(2'h2):(1'h0)] wire63;
  input wire [(4'hc):(1'h0)] wire62;
  input wire [(4'h9):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire65;
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire66,
                 wire65,
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
                 (1'h0)};
  assign wire65 = {{(wire62 ?
                              $signed($unsigned((8'ha5))) : $unsigned($unsigned(wire60))),
                          wire62[(1'h0):(1'h0)]}};
  assign wire66 = $signed(wire60);
  always
    @(posedge clk) begin
      if ({wire65})
        begin
          if (($signed(wire66[(1'h1):(1'h1)]) ?
              wire64 : (~&$signed(wire63[(1'h1):(1'h1)]))))
            begin
              reg67 <= wire61[(2'h3):(2'h3)];
              reg68 <= wire65;
            end
          else
            begin
              reg67 <= $signed(wire62);
              reg68 <= (^~((8'hbe) && (wire65[(4'h9):(1'h0)] && reg68[(4'he):(3'h6)])));
              reg69 <= reg68;
              reg70 <= (|$unsigned(($signed(wire66[(1'h0):(1'h0)]) ?
                  $signed(wire61[(1'h1):(1'h0)]) : ($signed(wire64) <<< (wire65 ?
                      wire65 : (8'ha0))))));
            end
          reg71 <= (~|$unsigned({($signed(reg68) ?
                  (wire62 >> wire66) : {reg70})}));
          reg72 <= (8'hb1);
        end
      else
        begin
          reg67 <= (&wire66);
          if (wire65[(2'h3):(1'h0)])
            begin
              reg68 <= ((~&($signed($signed(wire65)) != wire66[(2'h2):(1'h1)])) - $unsigned((wire63 ?
                  wire61 : reg72[(1'h1):(1'h0)])));
              reg69 <= (reg69 ?
                  wire62[(1'h0):(1'h0)] : (+$signed((wire62[(4'h8):(1'h0)] ?
                      (reg71 ? wire60 : wire64) : {reg71, wire65}))));
            end
          else
            begin
              reg68 <= {{(wire64[(4'h8):(2'h2)] < wire65[(3'h4):(1'h1)])},
                  (8'hbd)};
              reg69 <= $signed(((reg72[(4'h8):(2'h3)] + wire60) - reg71[(2'h2):(2'h2)]));
              reg70 <= (reg72 ?
                  (wire66 && $signed($unsigned((~&reg68)))) : {wire63[(1'h1):(1'h0)]});
            end
          if (reg67[(3'h4):(2'h2)])
            begin
              reg71 <= $signed(($signed($signed(reg71[(2'h3):(1'h1)])) >> wire66));
              reg72 <= (~|$unsigned(reg71[(2'h2):(1'h1)]));
            end
          else
            begin
              reg71 <= ($unsigned({(^~reg72[(3'h4):(1'h1)])}) ?
                  $unsigned(($unsigned($signed(reg70)) << $unsigned($signed(reg67)))) : ($signed($signed((wire64 <= reg72))) ?
                      reg72 : (7'h43)));
              reg72 <= (reg72[(3'h6):(2'h2)] && $unsigned((($signed(wire64) ?
                  wire65 : reg69[(3'h6):(1'h1)]) || $signed(wire64))));
            end
          reg73 <= wire60[(3'h4):(2'h2)];
        end
      reg74 <= $unsigned(((((wire63 < reg70) + {reg71, reg72}) ?
              reg67 : {$signed(reg69)}) ?
          $unsigned(($unsigned(reg70) ?
              (reg70 << wire60) : ((8'hbc) >> reg72))) : wire60));
      reg75 <= (&($unsigned($signed(reg74)) << ((reg72 >>> wire66) ?
          wire61 : reg68[(4'hb):(1'h1)])));
      reg76 <= reg72[(3'h5):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg77 <= ({reg68, reg70} ?
          $unsigned(reg68) : (^~(reg74[(3'h4):(2'h3)] ?
              (~^$unsigned(wire61)) : ((-reg74) <= $unsigned(wire61)))));
      reg78 <= ((^~wire60) < ((~^(reg67[(1'h0):(1'h0)] ?
          (wire65 ? wire66 : reg73) : {reg75,
              reg70})) < (($signed(wire64) == (reg73 ^~ reg76)) ?
          wire66 : (|wire65[(4'ha):(3'h5)]))));
      reg79 <= (8'had);
      reg80 <= {$signed((~|reg76[(5'h10):(4'h8)])),
          {$signed((reg77[(3'h5):(1'h1)] && (reg74 ? reg67 : reg69)))}};
    end
  assign wire81 = wire63[(1'h0):(1'h0)];
  assign wire82 = $unsigned(($signed(((reg67 > reg77) ?
                          (wire61 | reg70) : (^wire62))) ?
                      $signed(reg77) : $signed(reg72)));
endmodule

module module15
#(parameter param54 = {{((8'hae) ? ((&(8'ha5)) > {(8'hb6)}) : {{(8'hbc), (7'h42)}, {(7'h40), (8'had)}}), {(+((8'ha7) ? (8'hbe) : (7'h40)))}}})
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  assign y = {wire53,
                 wire48,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 (1'h0)};
  assign wire20 = wire18;
  assign wire21 = ($signed((wire20[(1'h0):(1'h0)] ?
                          $unsigned({wire20, wire19}) : {$unsigned(wire19),
                              ((8'hb1) ? wire16 : (8'hac))})) ?
                      (wire19 || $unsigned({wire16})) : ($signed(wire18[(2'h2):(1'h1)]) >>> ((wire20[(1'h0):(1'h0)] > $signed(wire16)) & {(-wire19),
                          (wire19 ~^ wire18)})));
  assign wire22 = (^~$unsigned((($signed((8'h9d)) ?
                      $unsigned((8'ha9)) : {wire21,
                          wire20}) ^ $unsigned($signed(wire21)))));
  assign wire23 = wire16;
  assign wire24 = $signed($unsigned((8'ha7)));
  assign wire25 = {$signed(((^(&wire20)) ?
                          wire18[(2'h2):(1'h1)] : (~$signed(wire18))))};
  assign wire26 = (~$unsigned((^wire22)));
  assign wire27 = wire17[(4'hf):(3'h4)];
  assign wire28 = wire22;
  always
    @(posedge clk) begin
      reg29 <= (wire24 ?
          $signed((^(wire16[(1'h0):(1'h0)] + wire18[(1'h0):(1'h0)]))) : $unsigned($unsigned({$signed(wire26)})));
      if (wire23)
        begin
          reg30 <= (~^{$unsigned(wire28[(2'h3):(1'h1)]),
              {$unsigned((~|wire17)), (8'haa)}});
        end
      else
        begin
          reg30 <= $unsigned($unsigned(($signed($unsigned(wire16)) <= $unsigned((wire26 >= wire19)))));
          reg31 <= wire18[(2'h3):(2'h2)];
          reg32 <= $signed($signed($unsigned($signed((wire27 ?
              wire20 : wire24)))));
          if ((reg29[(3'h5):(3'h4)] << (wire26[(2'h2):(1'h0)] ?
              (($unsigned(wire17) ?
                      $signed(wire20) : (wire18 ? reg32 : (7'h44))) ?
                  (wire20[(3'h6):(2'h3)] ?
                      wire25 : ((8'hb2) ?
                          wire20 : wire28)) : (~|(reg31 >>> wire25))) : wire22[(2'h3):(1'h0)])))
            begin
              reg33 <= (^{$unsigned($unsigned(wire28[(4'hb):(3'h5)]))});
              reg34 <= $unsigned(($signed((wire18 ?
                      (!wire20) : (reg33 + reg31))) ?
                  $unsigned((wire19 ?
                      $unsigned(wire18) : (wire27 ^~ wire26))) : (~|reg29)));
              reg35 <= {(^~(reg32 ?
                      {reg33[(3'h6):(2'h2)]} : $unsigned((-reg32)))),
                  ((&{(reg32 & reg31), (8'h9f)}) ?
                      reg34 : (&$unsigned((wire18 ^ wire20))))};
              reg36 <= reg35[(4'hb):(1'h0)];
            end
          else
            begin
              reg33 <= wire20[(3'h5):(1'h1)];
              reg34 <= $unsigned(wire16[(4'h8):(2'h2)]);
              reg35 <= (~{$signed($unsigned((~|wire27))),
                  ((+reg34) ?
                      reg34 : (reg32[(1'h1):(1'h1)] ?
                          {wire23} : $unsigned(reg31)))});
              reg36 <= reg36[(4'he):(1'h0)];
            end
        end
      if ((+({wire26} == reg32)))
        begin
          reg37 <= (~|((^~(&(reg30 != wire24))) ?
              wire28[(2'h3):(1'h0)] : {$signed(wire18)}));
        end
      else
        begin
          reg37 <= (!$signed(($unsigned(wire25) == ($signed(wire25) ?
              $signed(wire22) : wire27))));
          reg38 <= (~(8'hbd));
          reg39 <= $signed(reg37[(3'h7):(2'h3)]);
          reg40 <= wire22;
          reg41 <= $signed(((&$unsigned((8'ha1))) ?
              $signed((wire16 | (&wire28))) : (!$unsigned(reg36[(3'h6):(2'h3)]))));
        end
      if (({(($unsigned((8'hbc)) <= {(8'ha5), (8'ha5)}) ?
                  reg33 : reg35[(4'hf):(1'h0)]),
              (|{(&reg30), (|(8'h9c))})} ?
          $unsigned($unsigned(wire27[(5'h10):(4'h8)])) : (wire20[(5'h11):(2'h3)] ?
              ((+wire20[(1'h1):(1'h1)]) ^~ reg38) : ((~|wire18[(1'h1):(1'h1)]) ?
                  reg34[(4'he):(3'h4)] : wire17))))
        begin
          reg42 <= $signed(reg41);
          reg43 <= wire20[(2'h2):(2'h2)];
          if ({reg42[(1'h1):(1'h1)]})
            begin
              reg44 <= (wire21 << wire22);
            end
          else
            begin
              reg44 <= (8'ha7);
              reg45 <= $unsigned((~^$unsigned(({reg42,
                  reg36} >= $unsigned(wire17)))));
              reg46 <= $unsigned($unsigned({(&(~wire18)),
                  wire27[(4'ha):(3'h6)]}));
              reg47 <= reg39[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg42 <= wire21[(1'h1):(1'h1)];
          reg43 <= ((wire19 ?
                  (((wire26 == reg45) ?
                      $signed(wire16) : (wire19 ?
                          wire21 : reg31)) >>> ((wire27 ~^ wire27) > reg40[(1'h1):(1'h0)])) : ({(wire19 ?
                          reg34 : wire26),
                      (!reg40)} | (&(~reg37)))) ?
              (|{$signed($signed(reg40)),
                  ($signed(reg43) >>> (wire20 <= (8'ha6)))}) : (8'hb4));
          reg44 <= reg44;
        end
    end
  assign wire48 = (((-$unsigned((~reg42))) ^~ reg39) ?
                      (|{(8'hbf)}) : $signed($unsigned($unsigned(reg38))));
  always
    @(posedge clk) begin
      reg49 <= $signed({$signed((wire20 & $signed(wire48))),
          {(wire28[(4'h9):(2'h2)] >= (reg47 ~^ (8'ha3))),
              reg43[(1'h0):(1'h0)]}});
      reg50 <= ((((-$unsigned(wire17)) <<< ((~^(8'hbb)) ?
          wire24 : {wire24, reg32})) != wire17) >= reg33);
      reg51 <= $unsigned(reg44[(3'h6):(2'h3)]);
      reg52 <= $signed(($unsigned(((~&reg41) ?
          $unsigned((8'hb3)) : wire17[(3'h5):(1'h0)])) ^~ $unsigned(reg38)));
    end
  assign wire53 = (~|$unsigned(reg47[(3'h4):(1'h0)]));
endmodule

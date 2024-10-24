module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire140,
                 wire138,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  assign wire5 = $signed($unsigned(wire0));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg6 <= wire0[(2'h3):(2'h3)];
          reg7 <= (((|$signed($signed(wire5))) ?
              (8'haa) : $unsigned((!$signed(wire0)))) ^~ $signed(reg6[(1'h0):(1'h0)]));
          if ({(wire4[(1'h1):(1'h1)] ^~ reg6[(4'h9):(1'h1)]),
              $unsigned($unsigned({$signed(wire0), $unsigned(wire5)}))})
            begin
              reg8 <= (($unsigned($unsigned(wire5)) + ($unsigned((wire1 < reg6)) ?
                  $signed((reg6 > (8'hbf))) : $unsigned($signed(wire3)))) <= $unsigned(wire0));
            end
          else
            begin
              reg8 <= wire5[(3'h5):(2'h3)];
              reg9 <= (($signed({(wire3 || reg6)}) | $unsigned((reg8[(1'h1):(1'h0)] ?
                      $signed(wire3) : (wire5 ? reg8 : reg6)))) ?
                  wire5 : $signed($signed($unsigned({wire3}))));
            end
          if (wire4)
            begin
              reg10 <= ((-wire5) < reg8[(3'h7):(3'h5)]);
              reg11 <= wire5;
              reg12 <= reg10[(4'hf):(4'h9)];
            end
          else
            begin
              reg10 <= (8'hb2);
              reg11 <= {(wire1[(5'h13):(4'h8)] ? reg10 : reg11)};
              reg12 <= {wire3[(3'h5):(1'h1)]};
              reg13 <= ((~&((&reg9) != {wire5, reg12})) ?
                  wire4 : (|(reg6 > reg6[(2'h2):(1'h1)])));
            end
          reg14 <= reg7;
        end
      else
        begin
          reg6 <= ($signed((((wire5 ?
                  wire1 : reg14) >> reg6[(4'h9):(3'h5)]) < reg7[(3'h7):(1'h1)])) ?
              ($unsigned(($unsigned(reg12) ? $signed(reg13) : reg12)) ?
                  $signed((8'hb9)) : reg8[(5'h12):(3'h5)]) : (|wire5[(3'h7):(3'h4)]));
          reg7 <= {$signed(wire3[(4'hf):(3'h4)])};
          reg8 <= reg14;
          reg9 <= $signed($unsigned(reg12[(3'h4):(1'h1)]));
        end
      reg15 <= $signed($signed((!$unsigned(reg11))));
      reg16 <= (-(($signed((reg15 ? wire5 : (8'hac))) ?
          reg8 : $unsigned({(8'hb5)})) >> wire5));
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned($signed(reg13));
      reg18 <= $signed(((((wire0 >= reg16) ?
          ((8'hb2) - (8'hae)) : $signed(wire5)) | ($signed(wire4) ?
          ((8'ha8) != reg14) : $unsigned(wire0))) && (^~reg14)));
    end
  assign wire19 = (reg9 ?
                      $unsigned({($signed((8'hb1)) << (-(8'hbe)))}) : $signed(reg7));
  assign wire20 = reg17[(2'h2):(1'h0)];
  assign wire21 = (^~wire0[(3'h7):(3'h7)]);
  assign wire22 = ({(-reg8[(5'h11):(2'h3)]),
                      reg17} ^ (-(+$signed((wire2 >= reg18)))));
  module23 #() modinst139 (wire138, clk, wire2, reg18, wire0, wire21, wire19);
  assign wire140 = $signed($signed(($signed(((8'hb7) == wire20)) ?
                       $unsigned((~|reg8)) : {(|reg12)})));
endmodule

module module23
#(parameter param136 = (+{(({(8'hb8), (8'ha0)} && (^~(8'ha8))) == (8'hbd)), (~^(8'hb7))}), 
parameter param137 = {(-{((param136 & (8'hbf)) & (param136 ? param136 : param136))}), (+(({param136} ? (param136 ? (8'hab) : param136) : param136) + {(+param136), (param136 <= param136)}))})
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire112;
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire114,
                 wire74,
                 wire76,
                 wire97,
                 wire99,
                 wire100,
                 wire112,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  module29 #() modinst75 (wire74, clk, wire24, wire28, wire27, wire25);
  assign wire76 = $unsigned((({(~wire27), wire25[(5'h13):(4'he)]} ?
                          wire28 : ((wire26 ? wire28 : wire26) ?
                              $unsigned(wire74) : $signed(wire27))) ?
                      wire25[(4'he):(4'hc)] : (+$unsigned((~|wire74)))));
  module77 #() modinst98 (wire97, clk, wire24, wire27, wire76, wire74);
  assign wire99 = ((!wire97) ? {wire26} : (7'h42));
  assign wire100 = {(8'had)};
  module101 #() modinst113 (.wire106(wire74), .wire102(wire99), .clk(clk), .wire104(wire97), .wire105(wire28), .wire103(wire25), .y(wire112));
  assign wire114 = $signed(wire100[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      if ($signed(($signed(((wire99 < wire100) ^ $signed(wire76))) ?
          (wire114[(2'h2):(1'h1)] ?
              wire76[(1'h1):(1'h1)] : (|$signed((8'hab)))) : {(^~{wire25}),
              $unsigned({wire100, (8'hb0)})})))
        begin
          reg115 <= $unsigned($signed((&wire27[(4'hf):(1'h1)])));
          reg116 <= ((!(-wire76[(1'h1):(1'h1)])) ? (~(8'h9f)) : wire112);
          if ($unsigned($signed($signed(wire28[(1'h0):(1'h0)]))))
            begin
              reg117 <= $signed(reg116);
              reg118 <= wire74;
              reg119 <= wire99[(4'hb):(4'h9)];
              reg120 <= {(&({(8'had)} ~^ wire100))};
            end
          else
            begin
              reg117 <= ((wire25[(3'h4):(1'h0)] ^ wire100[(2'h2):(1'h1)]) <<< {((|$unsigned(wire28)) >> ($unsigned(wire97) + (8'hb0))),
                  (reg119[(3'h7):(3'h6)] ^~ $unsigned(reg117))});
              reg118 <= $signed($unsigned($signed((~^$unsigned((8'hb6))))));
            end
          reg121 <= (-wire100);
        end
      else
        begin
          reg115 <= (&wire112);
        end
      reg122 <= $signed(wire97);
      if (reg122)
        begin
          reg123 <= $unsigned(((8'hab) ?
              ($signed($signed(wire27)) - ((reg118 + reg122) < $signed(wire114))) : reg116[(2'h3):(1'h0)]));
          if ((wire74 ? wire25 : $signed($unsigned($unsigned((|wire27))))))
            begin
              reg124 <= (|$signed((wire27[(3'h6):(2'h2)] ?
                  $signed({(8'haa)}) : wire76)));
            end
          else
            begin
              reg124 <= (|{reg124});
              reg125 <= $unsigned((8'h9d));
              reg126 <= ($signed((wire99[(4'ha):(1'h1)] <<< wire26[(4'h9):(2'h3)])) ?
                  $signed($signed(wire99)) : ($signed(((wire28 < wire97) ?
                          (wire100 ? (8'ha3) : wire25) : (8'ha8))) ?
                      wire74[(1'h0):(1'h0)] : {wire74, (7'h41)}));
              reg127 <= {({(8'hb8)} & $unsigned($unsigned((reg115 ^~ reg123)))),
                  ($signed(((wire97 ? wire99 : reg116) ?
                      (reg122 ?
                          reg118 : reg117) : (reg118 << wire25))) <= (8'hbf))};
              reg128 <= $unsigned($signed(wire100[(1'h1):(1'h0)]));
            end
          reg129 <= $signed((~|(&(((8'hac) ? reg128 : (8'ha8)) ?
              (reg124 ? reg121 : reg121) : wire97))));
          reg130 <= reg126;
          reg131 <= {(reg122 & ((reg121 >> wire74) * ((^reg125) ?
                  (wire74 <<< wire28) : {wire74}))),
              wire112[(1'h0):(1'h0)]};
        end
      else
        begin
          reg123 <= (~^{$unsigned($signed($unsigned(wire76))),
              ((&(-wire74)) ^ (-reg131))});
          reg124 <= wire97[(2'h3):(2'h3)];
          reg125 <= $signed($signed(($signed($signed(reg117)) ?
              ((~reg124) ^ (reg117 ? reg117 : reg120)) : $signed(((8'ha8) ?
                  reg121 : (8'hb6))))));
        end
    end
  assign wire132 = (((wire28[(3'h7):(2'h3)] ?
                           wire74 : ((reg116 ? reg131 : reg129) ?
                               reg126 : $unsigned(wire99))) || {$signed(reg117[(2'h3):(1'h0)])}) ?
                       reg119[(4'hc):(4'ha)] : $unsigned((~^(reg122[(5'h11):(4'h9)] ?
                           $unsigned(reg125) : (~&wire74)))));
  assign wire133 = $signed($signed(wire25));
  assign wire134 = reg125[(1'h1):(1'h1)];
  assign wire135 = wire97[(1'h0):(1'h0)];
endmodule

module module101  (y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire106;
  input wire [(2'h3):(1'h0)] wire105;
  input wire [(2'h2):(1'h0)] wire104;
  input wire signed [(3'h5):(1'h0)] wire103;
  input wire [(4'hb):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  assign y = {wire111, wire110, wire109, wire108, wire107, (1'h0)};
  assign wire107 = $signed((wire104 ? wire105[(2'h2):(1'h0)] : wire102));
  assign wire108 = $signed($unsigned(wire105[(1'h1):(1'h0)]));
  assign wire109 = $unsigned(((wire104[(1'h0):(1'h0)] - ($signed(wire102) || wire104)) ?
                       (-(wire104 ?
                           wire107[(3'h4):(3'h4)] : $signed(wire108))) : $signed(wire106)));
  assign wire110 = (~^$unsigned(({$signed(wire106), wire109} ?
                       wire107 : {wire102, ((8'hb5) ? wire102 : wire102)})));
  assign wire111 = wire107[(2'h3):(2'h2)];
endmodule

module module77
#(parameter param96 = {((^~{((8'hb0) || (8'hb8)), ((8'hb2) ? (8'hb1) : (8'haa))}) ? ((^((8'hac) ? (8'hb3) : (8'hb5))) ? (&((7'h41) <<< (8'hb3))) : {((8'hb5) != (8'hb8))}) : (({(7'h40)} ? (+(8'ha4)) : ((7'h43) <<< (8'hbd))) ? (((8'ha1) ? (8'ha9) : (8'h9f)) >> (-(8'ha8))) : (((7'h43) ? (8'hbf) : (8'ha6)) ? ((8'hb3) ^~ (7'h42)) : ((8'hb5) ? (8'ha2) : (8'haf))))), ({(((8'ha4) >> (8'hbc)) ? ((8'ha1) ? (7'h41) : (7'h44)) : ((8'hbe) >> (7'h44)))} ? {(~&(~|(7'h43)))} : ({(^(8'hba))} ~^ (+((7'h44) ? (8'hbd) : (8'hb2)))))})
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire81;
  input wire [(3'h4):(1'h0)] wire80;
  input wire [(2'h3):(1'h0)] wire79;
  input wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire82 = wire80[(2'h2):(1'h1)];
  assign wire83 = (|$unsigned(($signed((^~wire78)) && wire79[(1'h1):(1'h1)])));
  assign wire84 = $unsigned(wire79[(1'h0):(1'h0)]);
  assign wire85 = wire79[(2'h2):(1'h1)];
  assign wire86 = (|$signed(wire80[(1'h0):(1'h0)]));
  assign wire87 = ((wire85 ?
                      wire86[(3'h4):(1'h1)] : (^~($signed(wire85) ?
                          (~^wire80) : $unsigned((8'hbb))))) | (~|$signed((~&$signed(wire78)))));
  assign wire88 = $unsigned({((wire78[(4'ha):(2'h3)] ? (+wire85) : wire81) ?
                          $unsigned((|wire87)) : wire81)});
  assign wire89 = {$unsigned({($signed(wire87) >> wire82[(2'h2):(1'h0)])})};
  assign wire90 = $signed(wire86[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg91 <= wire83[(3'h6):(3'h4)];
      reg92 <= $unsigned(wire87[(5'h10):(4'ha)]);
      if (wire80[(2'h2):(1'h0)])
        begin
          reg93 <= ((^$unsigned(wire84[(4'hf):(4'h8)])) ?
              {(~&wire88), $signed((((8'hbb) ^~ wire80) < (8'hbc)))} : (8'ha3));
          if ((^~$unsigned(wire82)))
            begin
              reg94 <= $signed((wire85[(5'h11):(4'he)] >= wire83[(2'h2):(2'h2)]));
            end
          else
            begin
              reg94 <= {(^reg92[(2'h2):(1'h1)])};
            end
          reg95 <= wire86[(2'h3):(2'h2)];
        end
      else
        begin
          reg93 <= (8'ha7);
        end
    end
endmodule

module module29
#(parameter param72 = ((!((~(^~(8'hb3))) ? (((7'h44) ? (8'ha3) : (8'had)) ? ((8'had) ? (8'hb2) : (7'h44)) : (^~(8'had))) : {((8'hab) < (7'h42))})) < (8'hab)), 
parameter param73 = (((-(~&{param72, param72})) ? ((~|param72) << (((8'ha6) ^ param72) != (+param72))) : (((param72 || param72) ? param72 : (param72 <<< param72)) ^~ ((param72 ? param72 : param72) ? {param72} : (~|param72)))) ? (!((param72 ? (-(8'hab)) : param72) == (8'had))) : ((((-param72) ? param72 : (param72 & param72)) || ({param72, param72} >= (param72 << param72))) ? {(|(param72 | param72))} : ((-(8'had)) ? ((param72 < param72) && (~param72)) : (param72 > param72)))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  assign y = {wire71,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg46,
                 reg45,
                 reg44,
                 reg38,
                 (1'h0)};
  assign wire34 = wire31;
  assign wire35 = (wire31 >= wire31[(5'h12):(4'h9)]);
  assign wire36 = (~&($unsigned({$signed(wire30)}) != (^~((wire34 ?
                          (8'h9e) : (8'h9e)) ?
                      (wire31 | (8'hbc)) : wire31))));
  assign wire37 = $unsigned(wire33);
  always
    @(posedge clk) begin
      reg38 <= {wire33[(4'h8):(2'h3)],
          ((wire32[(3'h6):(3'h5)] ?
              $signed(wire30[(1'h1):(1'h1)]) : (-$signed(wire35))) >> (({(7'h41),
                  wire37} ?
              wire36 : wire31) > $signed((wire34 ? (8'haa) : wire32))))};
    end
  assign wire39 = $unsigned($unsigned(wire32[(1'h1):(1'h1)]));
  assign wire40 = (!$signed({((wire31 ?
                          wire31 : (7'h40)) | wire33[(5'h13):(5'h13)])}));
  assign wire41 = (8'ha8);
  assign wire42 = wire34;
  assign wire43 = ($unsigned($unsigned(wire33[(2'h2):(1'h0)])) >>> $signed(($unsigned({wire32,
                          wire40}) ?
                      wire41[(3'h6):(1'h1)] : (~|wire30))));
  always
    @(posedge clk) begin
      reg44 <= ((wire36 ?
          {wire30[(1'h1):(1'h1)]} : wire32) - ($signed(wire36[(1'h0):(1'h0)]) << ((8'hb2) == $unsigned(((8'ha3) ?
          wire33 : wire43)))));
      reg45 <= $signed(({{(&wire36), reg44[(2'h3):(1'h0)]},
          $signed((wire32 ^~ wire37))} + (~^$signed(wire32))));
      reg46 <= ({($unsigned(wire41) ? $signed(reg45) : (+(~^(8'hba)))),
          ($unsigned((wire33 >= reg44)) ?
              $signed(reg45) : (^~(wire31 + wire40)))} ^~ wire41);
    end
  assign wire47 = (^(&$unsigned((&$unsigned((8'ha5))))));
  assign wire48 = ($signed(wire39) << ($signed(((-wire40) << (wire43 ?
                      wire43 : wire36))) > ($signed($unsigned((8'ha0))) - (^reg38))));
  assign wire49 = ($signed((!($signed(reg38) <<< (^~wire35)))) > (^~wire31[(3'h7):(1'h1)]));
  assign wire50 = (8'h9d);
  assign wire51 = wire43[(4'ha):(1'h1)];
  assign wire52 = $unsigned($signed($signed($unsigned(wire51[(3'h5):(2'h2)]))));
  assign wire53 = {$unsigned((~^(~^{reg45, wire32}))), wire40[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      if ((wire52[(1'h1):(1'h1)] ?
          ((&$unsigned($signed(wire49))) > $unsigned((((8'ha9) ?
              wire36 : wire51) | wire50[(3'h6):(3'h6)]))) : wire34[(4'ha):(3'h5)]))
        begin
          reg54 <= $signed(wire41[(3'h7):(1'h0)]);
          reg55 <= ({$signed($signed(wire37))} ?
              $unsigned(wire41) : ((~^$unsigned($signed(reg54))) ^~ $signed((8'hb1))));
          reg56 <= reg54[(3'h5):(2'h2)];
          if ({(&wire36), ($unsigned(wire42[(2'h3):(1'h0)]) * wire32)})
            begin
              reg57 <= (^reg46[(5'h13):(3'h4)]);
            end
          else
            begin
              reg57 <= (~($signed((wire33[(3'h5):(1'h1)] ?
                      (+wire53) : (^wire39))) ?
                  wire35[(1'h0):(1'h0)] : (wire41 > wire49)));
              reg58 <= wire34;
            end
        end
      else
        begin
          reg54 <= (wire32 ?
              $unsigned(((&(^~wire41)) <<< $unsigned($unsigned(wire50)))) : $unsigned($unsigned($signed((~|reg46)))));
        end
      reg59 <= ({(wire48 ? $signed(reg38) : (|(wire43 ? reg58 : reg58))),
              wire33} ?
          $signed($signed(wire40[(2'h2):(1'h1)])) : $unsigned($unsigned($unsigned(wire36))));
    end
  always
    @(posedge clk) begin
      reg60 <= reg56;
      reg61 <= ((^wire33) ?
          ({($unsigned(reg45) & reg56[(3'h5):(2'h2)]),
                  ($unsigned(wire42) ? $signed(reg46) : {reg60, (8'hb7)})} ?
              $signed($signed((!(8'haa)))) : (($unsigned(reg46) ?
                  reg38[(3'h5):(2'h2)] : (reg46 ?
                      wire41 : reg57)) < wire52)) : (^wire43));
      if (wire41[(3'h5):(2'h2)])
        begin
          reg62 <= wire36[(1'h1):(1'h1)];
          reg63 <= $unsigned(wire37[(3'h6):(3'h6)]);
        end
      else
        begin
          if ((reg46 ? {$unsigned(wire43)} : wire48[(2'h3):(2'h2)]))
            begin
              reg62 <= (reg57[(4'hb):(1'h1)] && (-reg61[(4'hc):(4'ha)]));
              reg63 <= (!wire34[(4'ha):(4'ha)]);
              reg64 <= (&(~&$unsigned(((wire33 ? reg62 : reg63) >= (wire30 ?
                  (8'hb8) : wire32)))));
            end
          else
            begin
              reg62 <= wire52[(4'h9):(4'h9)];
            end
          reg65 <= (reg62 ? (~^wire48) : wire47[(3'h5):(3'h5)]);
        end
    end
  always
    @(posedge clk) begin
      reg66 <= (&(~^(&{reg63[(4'hb):(2'h2)], wire32[(3'h4):(1'h1)]})));
      reg67 <= wire32;
      reg68 <= (8'hbd);
      reg69 <= wire36[(1'h1):(1'h0)];
      reg70 <= $unsigned($signed(reg67[(3'h7):(2'h2)]));
    end
  assign wire71 = (~(8'hb9));
endmodule

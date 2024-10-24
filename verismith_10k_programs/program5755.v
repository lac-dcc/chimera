module top
#(parameter param157 = (-((~(~{(8'hb2)})) ? ((~|((8'hb5) ? (8'hb7) : (8'hb2))) ? (((8'ha0) ? (8'hb6) : (8'hb3)) ? ((8'ha8) ? (8'ha5) : (8'ha5)) : (~&(7'h44))) : (((8'ha6) ? (8'hb0) : (8'hb4)) ? ((8'ha9) ? (7'h44) : (8'hac)) : (~^(8'hbf)))) : ({((7'h42) ? (8'h9d) : (8'hb7))} ^~ ({(8'ha2), (8'ha9)} ? {(8'hab), (8'hbf)} : ((8'ha0) ? (7'h41) : (8'ha4)))))), 
parameter param158 = (~&(~|((^(param157 ? param157 : (8'hb3))) && (8'hb2)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire152;
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire19,
                 wire21,
                 wire22,
                 wire25,
                 wire26,
                 wire27,
                 wire152,
                 reg156,
                 reg24,
                 reg23,
                 (1'h0)};
  module5 #() modinst20 (wire19, clk, wire3, wire0, wire2, wire4, wire1);
  assign wire21 = ((&({wire0} ?
                          $unsigned(wire2[(4'hf):(4'h9)]) : $signed($unsigned(wire2)))) ?
                      (!wire0) : $unsigned(((8'h9c) < ((wire19 + wire0) ?
                          $signed(wire0) : (~(8'h9e))))));
  assign wire22 = {wire0[(4'ha):(1'h0)], wire3};
  always
    @(posedge clk) begin
      reg23 <= (~wire2[(5'h10):(2'h2)]);
      reg24 <= ($signed(($unsigned(wire4) ?
              $signed({(8'hb1), wire2}) : wire21[(4'hb):(4'h8)])) ?
          (^wire22[(3'h7):(3'h7)]) : (~&wire3));
    end
  assign wire25 = wire0[(3'h6):(3'h6)];
  assign wire26 = $unsigned($signed(($signed(wire19) ?
                      {$unsigned(reg23)} : wire19[(3'h7):(3'h6)])));
  assign wire27 = {((8'ha0) ?
                          wire26[(3'h4):(2'h2)] : (-(((8'hbd) ?
                                  reg23 : (8'ha0)) ?
                              reg23 : (&(8'hb5))))),
                      (wire0[(4'hc):(3'h7)] ^~ wire1)};
  module28 #() modinst153 (.wire33(wire25), .wire32(wire0), .y(wire152), .clk(clk), .wire30(wire21), .wire29(wire4), .wire31(wire27));
  assign wire154 = (8'hb9);
  assign wire155 = $unsigned({$signed((((8'hbc) ? wire27 : wire21) ?
                           (wire3 ? wire154 : wire26) : (wire19 ^~ (8'hae))))});
  always
    @(posedge clk) begin
      reg156 <= wire25[(1'h0):(1'h0)];
    end
endmodule

module module28  (y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire31;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(3'h4):(1'h0)] wire111;
  reg signed [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  assign y = {wire150,
                 wire113,
                 wire34,
                 wire35,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire89,
                 wire92,
                 wire111,
                 reg91,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 (1'h0)};
  assign wire34 = wire31;
  assign wire35 = (^~wire32[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg36 <= (+(({(wire32 ? (8'had) : wire32)} ?
          (wire32[(2'h3):(1'h1)] ?
              (wire34 ?
                  wire34 : wire30) : $signed(wire29)) : (-$unsigned(wire31))) <<< {($unsigned((8'ha3)) ?
              (wire33 || wire30) : $signed(wire35))}));
      reg37 <= (($unsigned(($unsigned(wire31) < (reg36 >>> wire29))) ?
              $signed(wire34[(4'hc):(1'h1)]) : wire34[(4'h9):(2'h3)]) ?
          wire33 : wire31[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg38 <= reg36[(3'h7):(1'h0)];
      reg39 <= (+(~&$signed($unsigned($unsigned(reg38)))));
      reg40 <= {(-wire29)};
      if ((8'ha3))
        begin
          reg41 <= $unsigned(((~&((wire30 ?
              (8'hbf) : reg40) && $unsigned((8'ha2)))) || (-reg39[(2'h3):(2'h2)])));
          reg42 <= wire34;
          reg43 <= $signed((+$signed((&(reg40 < wire29)))));
        end
      else
        begin
          reg41 <= reg40;
          reg42 <= $signed($signed($signed($signed(((7'h43) ?
              wire32 : (8'hba))))));
          reg43 <= (^~wire32[(3'h4):(1'h0)]);
        end
      reg44 <= reg39[(4'hd):(4'hd)];
    end
  assign wire45 = ($signed($signed(((reg39 ? reg43 : (8'hb4)) - (~reg44)))) ?
                      (wire29[(3'h7):(3'h6)] == $signed((reg36[(1'h0):(1'h0)] ?
                          wire29 : reg43))) : (^(wire32[(3'h5):(3'h4)] - wire31[(1'h0):(1'h0)])));
  assign wire46 = {(({reg43[(2'h3):(2'h3)]} != ({(8'hae)} ~^ (wire32 >= reg39))) * reg37)};
  assign wire47 = reg44;
  assign wire48 = ($unsigned(reg37[(2'h2):(1'h1)]) ?
                      $unsigned((~|reg36)) : $signed((reg43 >= ({wire35,
                          wire47} >> (wire34 ? (8'hb0) : wire31)))));
  module49 #() modinst90 (wire89, clk, reg42, wire45, reg37, wire31);
  always
    @(posedge clk) begin
      reg91 <= ({$signed($signed((wire48 ? reg38 : wire30))),
          $signed($unsigned(((8'hb8) ?
              wire35 : (8'hae))))} != $unsigned(($unsigned((~^reg38)) * $signed(((8'ha6) ?
          wire47 : reg37)))));
    end
  assign wire92 = reg41;
  module93 #() modinst112 (wire111, clk, wire30, reg36, wire34, wire48);
  assign wire113 = (((($signed(wire45) << (reg40 ?
                       (8'hb9) : reg38)) <<< reg91) & (^$unsigned(wire92))) > reg91[(3'h6):(1'h1)]);
  always
    @(posedge clk) begin
      reg114 <= (wire46[(3'h4):(2'h3)] - $signed(({wire45} | $signed((!wire33)))));
      reg115 <= {{(~^wire29)}};
      reg116 <= wire30;
      reg117 <= {(&reg43[(4'hc):(2'h2)])};
    end
  module118 #() modinst151 (wire150, clk, wire31, wire29, reg38, wire35, wire47);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire13,
                 wire12,
                 wire11,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = ((~^(((wire10 >= wire8) ^~ (|wire10)) ?
                          (-(wire10 ?
                              wire10 : wire10)) : wire9[(5'h11):(4'he)])) ?
                      wire10[(3'h5):(1'h1)] : (8'hbe));
  assign wire12 = wire8[(4'h8):(1'h1)];
  assign wire13 = $unsigned(((+wire6) ? wire12[(2'h2):(2'h2)] : (|wire6)));
  always
    @(posedge clk) begin
      reg14 <= ({wire10, $unsigned(wire7)} && (|(wire9 ?
          $unsigned($signed(wire10)) : wire11[(4'ha):(4'ha)])));
      reg15 <= $signed(reg14[(4'hb):(3'h7)]);
      reg16 <= (^~($unsigned($signed((|reg15))) + wire8));
    end
  assign wire17 = $signed(wire12[(1'h1):(1'h0)]);
  assign wire18 = (^$unsigned({wire12[(4'ha):(3'h5)]}));
endmodule

module module118
#(parameter param149 = (8'hab))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire123;
  input wire [(4'hd):(1'h0)] wire122;
  input wire signed [(2'h2):(1'h0)] wire121;
  input wire signed [(2'h2):(1'h0)] wire120;
  input wire [(4'ha):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire148;
  wire signed [(4'he):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(2'h2):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire140;
  wire signed [(4'ha):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire125;
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire125,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg124,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg124 <= wire123[(4'he):(4'hc)];
    end
  assign wire125 = $signed($signed((!($signed(reg124) ?
                       $signed(wire122) : (8'h9d)))));
  always
    @(posedge clk) begin
      reg126 <= wire120;
      if (({$unsigned({reg126}), reg124[(3'h4):(2'h2)]} ?
          $unsigned($unsigned(((wire121 >>> reg126) ?
              wire122[(4'ha):(3'h7)] : (wire122 ^~ (8'h9d))))) : $unsigned(reg124)))
        begin
          reg127 <= wire120[(2'h2):(1'h0)];
          if ((reg127[(3'h6):(3'h6)] & ({($unsigned(reg126) ^~ wire119[(3'h5):(3'h4)])} > reg126[(3'h4):(1'h0)])))
            begin
              reg128 <= $signed($signed(wire120));
              reg129 <= $signed((wire119[(4'h8):(3'h5)] ?
                  $signed((8'haa)) : $signed($unsigned($unsigned(reg126)))));
              reg130 <= {(8'ha7),
                  ($signed({(^wire120), $unsigned(wire122)}) && (((wire120 ?
                          reg129 : wire122) ?
                      (wire119 & reg124) : reg127[(3'h4):(3'h4)]) * $signed((reg129 - reg127))))};
            end
          else
            begin
              reg128 <= ($unsigned(((reg124 ?
                      $signed(reg129) : reg130[(1'h1):(1'h1)]) ?
                  $signed((reg129 != reg126)) : $unsigned($unsigned(reg127)))) ^~ wire121);
              reg129 <= reg127[(1'h1):(1'h0)];
              reg130 <= wire120;
              reg131 <= ((8'hbc) || {((~|(wire123 <= reg130)) & {wire120[(2'h2):(1'h0)],
                      ((8'hbc) < reg130)})});
              reg132 <= $unsigned((((^~$signed(wire122)) != $unsigned((-wire119))) ?
                  reg129[(3'h6):(3'h4)] : (~&(~^(|reg129)))));
            end
          reg133 <= reg126[(5'h15):(4'h9)];
          reg134 <= reg124;
          if ((((&$signed($signed(reg129))) << reg128[(3'h4):(2'h2)]) >> reg132))
            begin
              reg135 <= (((+((reg124 >= (7'h42)) ?
                      $unsigned(wire119) : $unsigned(wire125))) ?
                  wire121 : $unsigned({(8'hbb)})) || wire120);
              reg136 <= $signed((reg130 ?
                  wire125[(3'h5):(1'h0)] : (($signed(wire121) ?
                      $signed(reg124) : (wire121 && reg133)) ^ $unsigned($signed((7'h40))))));
              reg137 <= $signed($signed($signed({(wire122 >>> reg124),
                  wire119})));
            end
          else
            begin
              reg135 <= (reg136[(5'h15):(4'h8)] ?
                  reg127[(3'h4):(3'h4)] : (reg136 >>> {($signed(reg131) ^ {reg132,
                          reg129}),
                      $signed($unsigned(reg130))}));
            end
        end
      else
        begin
          reg127 <= $unsigned($unsigned(reg136));
          reg128 <= {$signed($signed(reg126[(3'h5):(1'h1)]))};
          reg129 <= reg127;
        end
      reg138 <= ((reg136[(5'h11):(4'ha)] ?
              reg136[(3'h4):(1'h1)] : ($signed({reg124}) ?
                  $signed({wire119}) : $signed($unsigned((8'hb0))))) ?
          (&({$unsigned(reg128), wire123[(4'hc):(2'h3)]} ^~ reg132)) : reg133);
    end
  assign wire139 = {((&$unsigned((-wire122))) ?
                           {(!{reg132, reg133}),
                               ($signed(reg124) ?
                                   wire122 : $signed(reg129))} : (-($unsigned(reg136) | (reg134 || (8'hb1))))),
                       (((reg124 ? $unsigned(reg126) : {reg137, reg131}) ?
                           (~wire125) : $unsigned((wire121 ?
                               wire122 : wire123))) > $signed($unsigned($signed(wire119))))};
  assign wire140 = $unsigned({(reg130 >= wire119[(4'h9):(4'h8)]),
                       reg137[(2'h2):(2'h2)]});
  assign wire141 = (^$signed((~|reg128[(4'hb):(2'h3)])));
  assign wire142 = ((^($unsigned(reg138[(4'ha):(3'h5)]) & ({(8'hbd),
                           reg124} + $unsigned(wire125)))) ?
                       $signed(wire121) : reg131);
  assign wire143 = ($signed($signed((reg138[(4'hb):(4'h9)] ?
                       (wire122 ?
                           reg135 : reg137) : (~|reg126)))) * (reg137[(3'h6):(3'h6)] ?
                       reg133 : ({$unsigned(reg136)} >>> wire121[(1'h0):(1'h0)])));
  assign wire144 = wire119[(3'h6):(3'h5)];
  assign wire145 = $signed(((|wire122[(4'h9):(2'h3)]) && reg132));
  assign wire146 = (+$unsigned(wire142));
  assign wire147 = reg128;
  assign wire148 = (&reg134);
endmodule

module module93  (y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire97;
  input wire signed [(5'h10):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire [(5'h15):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire98;
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire98,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire98 = $unsigned($signed((&{$signed(wire94)})));
  always
    @(posedge clk) begin
      if ({$signed({(~^$unsigned(wire95))})})
        begin
          reg99 <= $signed({$signed(({(8'hb3), (7'h42)} ?
                  (wire97 >= (8'hb7)) : $unsigned(wire97)))});
        end
      else
        begin
          reg99 <= (~^wire97[(4'hb):(3'h5)]);
          reg100 <= $unsigned((~wire95[(3'h6):(3'h4)]));
          if ((wire95 ? wire95 : $unsigned($signed((wire95 == {wire97})))))
            begin
              reg101 <= wire94;
              reg102 <= reg99;
              reg103 <= reg102;
            end
          else
            begin
              reg101 <= ((wire96 && $unsigned($unsigned($signed((8'hb4))))) ?
                  ($signed(wire95) ?
                      $signed($unsigned((^wire95))) : (~&((8'ha9) && $signed(wire94)))) : ({{reg103}} != ($signed((wire96 ?
                          wire95 : wire96)) ?
                      $unsigned($unsigned(wire97)) : (reg101[(5'h12):(4'h9)] ?
                          (~&wire94) : (wire96 ? wire98 : reg102)))));
              reg102 <= reg99;
              reg103 <= ((wire94[(1'h0):(1'h0)] ?
                  (^({reg99} ?
                      reg101[(2'h3):(2'h3)] : (reg99 == reg99))) : $unsigned(wire95[(1'h1):(1'h0)])) + $unsigned(wire95[(4'h8):(1'h1)]));
              reg104 <= (reg99 ^ (~(~|{wire94})));
            end
          reg105 <= $unsigned($signed((~&((reg104 ?
              wire94 : reg101) <= $unsigned(wire97)))));
        end
    end
  assign wire106 = ({wire98[(2'h2):(1'h1)],
                       reg104[(5'h10):(3'h7)]} > reg104[(4'hc):(3'h6)]);
  assign wire107 = (((-$signed($unsigned(reg99))) ?
                           $signed(($unsigned(reg101) ?
                               $signed(reg105) : $signed(wire96))) : reg101) ?
                       (|(($unsigned(reg105) ?
                               (wire98 <<< wire98) : {reg105, reg102}) ?
                           $signed({wire97}) : (^(reg102 ?
                               wire94 : wire96)))) : {reg105[(4'h8):(3'h7)]});
  assign wire108 = wire97;
  assign wire109 = wire106[(3'h6):(1'h1)];
  assign wire110 = wire97;
endmodule

module module49  (y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire53;
  input wire [(5'h12):(1'h0)] wire52;
  input wire [(4'hd):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg59,
                 (1'h0)};
  assign wire54 = {{wire51[(2'h2):(2'h2)]},
                      ((($signed(wire50) ?
                          wire53[(1'h1):(1'h1)] : (wire50 ?
                              wire51 : wire53)) <<< (+wire52)) ~^ wire53)};
  assign wire55 = wire51[(3'h7):(2'h3)];
  assign wire56 = $unsigned((wire55[(4'ha):(1'h1)] ?
                      ($signed($unsigned(wire51)) ?
                          wire54 : (|$unsigned(wire53))) : $unsigned($signed($unsigned(wire50)))));
  assign wire57 = ($unsigned({$signed((~|wire56))}) ~^ (^~(^wire54)));
  assign wire58 = wire51[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg59 <= $unsigned(((wire57 ?
          {wire58[(2'h2):(1'h1)], (wire52 || wire54)} : wire57) == (((wire50 ?
                  wire55 : wire54) ?
              $unsigned(wire52) : {wire57, wire54}) ?
          $unsigned($unsigned(wire50)) : ($signed(wire56) - (~|wire51)))));
    end
  assign wire60 = $unsigned($unsigned({$signed((~^wire50))}));
  assign wire61 = wire51;
  assign wire62 = wire56[(4'h9):(4'h8)];
  assign wire63 = $signed(($signed((wire50[(4'h8):(2'h2)] ?
                          (~^wire57) : {wire57, wire54})) ?
                      (-$signed(wire53[(3'h4):(1'h0)])) : $unsigned(({wire62,
                          wire50} * (wire57 ? wire53 : wire62)))));
  assign wire64 = ({(~|wire63[(1'h0):(1'h0)])} > wire56);
  assign wire65 = ($unsigned($signed(wire60)) ?
                      $unsigned(wire53) : (((~&$signed((8'ha4))) | $signed($signed(reg59))) ?
                          ($signed((wire50 < (8'hb6))) >> $signed({wire54})) : (8'hb9)));
  assign wire66 = $signed($signed(wire50[(3'h4):(2'h2)]));
  assign wire67 = wire54;
  assign wire68 = (wire57[(4'ha):(3'h5)] ?
                      (wire66[(4'hf):(4'hf)] + wire52) : wire51);
  assign wire69 = (~(&(wire56[(4'hf):(4'hf)] || wire50[(1'h1):(1'h1)])));
  assign wire70 = {($unsigned($signed($signed((8'hb7)))) || $unsigned($signed($signed((8'hb6))))),
                      $unsigned($signed($unsigned((wire55 <<< (8'ha5)))))};
  assign wire71 = $signed((7'h42));
  assign wire72 = wire62;
  assign wire73 = (8'hbd);
  assign wire74 = wire73;
  always
    @(posedge clk) begin
      if (wire70[(2'h2):(1'h0)])
        begin
          reg75 <= $unsigned($unsigned(($signed((wire61 - (8'hb7))) >>> ($signed(wire74) ?
              $signed(wire53) : $unsigned(wire67)))));
          reg76 <= wire67;
          reg77 <= $unsigned((8'haa));
          reg78 <= ($unsigned($unsigned($signed(reg77))) ?
              (+$signed({(wire62 && reg59)})) : wire53[(4'hf):(1'h0)]);
        end
      else
        begin
          reg75 <= {wire74[(2'h2):(2'h2)]};
          reg76 <= ((wire57[(2'h3):(1'h1)] - $signed(wire72[(2'h3):(1'h1)])) > ($signed($unsigned($unsigned(wire53))) ?
              wire70 : {$signed($unsigned(wire65)), wire70[(1'h1):(1'h1)]}));
          reg77 <= {$unsigned((8'hb4)),
              $signed($unsigned($signed((wire56 > wire63))))};
        end
      reg79 <= reg76[(1'h1):(1'h1)];
      if ($signed(reg77))
        begin
          reg80 <= wire62[(1'h0):(1'h0)];
          reg81 <= wire56;
          reg82 <= wire53[(5'h14):(4'h9)];
          reg83 <= {wire52};
        end
      else
        begin
          if ($signed($signed((~|wire62[(1'h1):(1'h0)]))))
            begin
              reg80 <= ((&$signed(((&(8'hb8)) + $unsigned((8'hac))))) & ((8'ha7) ?
                  (($signed(wire65) && (reg80 ?
                      (8'ha4) : reg83)) > ($unsigned(wire52) - $unsigned(wire65))) : $signed(reg76[(3'h6):(1'h0)])));
              reg81 <= $unsigned($signed(wire69));
            end
          else
            begin
              reg80 <= (^~(^reg83[(1'h1):(1'h1)]));
              reg81 <= wire53[(4'hd):(1'h1)];
              reg82 <= (8'ha1);
              reg83 <= $unsigned($unsigned(($unsigned((-wire65)) ?
                  wire67[(4'hb):(2'h2)] : reg80[(1'h0):(1'h0)])));
            end
          reg84 <= $signed((8'ha0));
          if ((+$unsigned($signed($signed(wire70[(1'h0):(1'h0)])))))
            begin
              reg85 <= (8'hb0);
              reg86 <= $unsigned($signed($unsigned(wire61[(1'h1):(1'h1)])));
              reg87 <= reg82[(3'h6):(1'h0)];
            end
          else
            begin
              reg85 <= reg76[(4'h9):(4'h8)];
              reg86 <= (wire58[(3'h6):(3'h6)] >= (({(-wire56)} << ((!reg83) ~^ (7'h40))) ?
                  (8'ha9) : wire55[(3'h6):(3'h4)]));
              reg87 <= $unsigned(wire53);
            end
        end
      reg88 <= reg85;
    end
endmodule

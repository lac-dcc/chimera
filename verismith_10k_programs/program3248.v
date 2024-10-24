module top
#(parameter param168 = (~^((~|{((8'h9e) ? (8'hb1) : (8'haf)), (~|(8'hb7))}) & ((~((8'hbf) ^~ (8'hb9))) ? {((8'ha9) ? (8'hb4) : (8'h9d)), {(8'hb2), (7'h41)}} : (8'ha2)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire167,
                 wire165,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (^~wire1[(2'h2):(2'h2)]);
  assign wire5 = (((^$unsigned($signed(wire1))) >> ($unsigned(wire1) <= wire1)) >= wire4[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg6 <= wire3[(2'h2):(2'h2)];
      reg7 <= $signed($unsigned(($unsigned((&wire0)) != ($signed(wire5) ?
          (!wire0) : wire0))));
      reg8 <= $signed($unsigned($unsigned((~|$unsigned(wire2)))));
      reg9 <= $signed(((wire3 < (^(^reg7))) ?
          $signed(wire1[(1'h0):(1'h0)]) : (~&(^$unsigned(wire4)))));
      if (reg7[(4'hf):(1'h1)])
        begin
          reg10 <= wire3;
          reg11 <= wire1;
          reg12 <= $signed($signed({wire4[(2'h3):(2'h2)]}));
          reg13 <= $signed(((wire2[(3'h6):(3'h4)] & (&(reg11 ?
                  (8'hb7) : (8'ha3)))) ?
              $signed($unsigned((reg6 >= wire3))) : {$signed((7'h43)),
                  ({wire3, reg6} ? wire4 : (wire4 || reg6))}));
          reg14 <= ((~^(($unsigned((8'haa)) ? (wire5 == reg9) : wire5) ?
                  wire1[(1'h1):(1'h1)] : (~&reg10[(1'h0):(1'h0)]))) ?
              ({wire4} ?
                  (7'h44) : $unsigned((reg8 ?
                      wire3[(1'h0):(1'h0)] : (&wire2)))) : $signed($signed(((reg10 >>> (8'ha7)) + (wire2 <<< reg6)))));
        end
      else
        begin
          if ((~|reg9[(3'h5):(1'h1)]))
            begin
              reg10 <= wire5;
              reg11 <= $signed(reg12[(3'h4):(3'h4)]);
              reg12 <= reg7;
            end
          else
            begin
              reg10 <= $signed($unsigned((wire2 >> (&(reg11 ?
                  reg13 : (8'h9c))))));
            end
          reg13 <= $signed(((!(reg14[(2'h3):(1'h1)] ?
                  (wire0 ? wire2 : wire2) : (|wire2))) ?
              ((&$signed((8'h9c))) ?
                  $signed($signed(wire2)) : ({reg12} && wire5)) : $unsigned(reg14)));
          reg14 <= (^reg7[(1'h1):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg15 <= $signed(reg9);
    end
  assign wire16 = ((wire2[(1'h1):(1'h1)] < (($signed(wire4) ?
                      ((7'h44) >>> (8'hb6)) : (!reg10)) > (+(wire4 ?
                      wire3 : reg7)))) <<< (~|{((wire2 ?
                          reg6 : wire2) <= $signed(wire1))}));
  assign wire17 = (~reg8);
  assign wire18 = reg15[(2'h3):(1'h1)];
  assign wire19 = (reg9 && $signed(($unsigned($signed(wire18)) ?
                      $signed((reg8 ?
                          reg11 : reg7)) : $signed($signed(wire17)))));
  assign wire20 = wire1;
  assign wire21 = (~|$signed(reg10[(3'h4):(2'h2)]));
  module22 #() modinst166 (.wire23(wire18), .clk(clk), .y(wire165), .wire26(wire0), .wire25(wire21), .wire24(wire3));
  assign wire167 = $signed($signed(($signed((^~(8'hab))) ?
                       {(wire16 ? wire3 : wire16)} : reg8)));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire163;
  wire [(5'h15):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  assign y = {wire163,
                 wire140,
                 wire139,
                 wire137,
                 wire122,
                 wire78,
                 wire77,
                 wire75,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg138,
                 (1'h0)};
  assign wire27 = (-wire25);
  assign wire28 = wire24;
  assign wire29 = (($signed(wire28) - wire23[(4'ha):(3'h7)]) ?
                      ((($unsigned((8'h9c)) ?
                              wire27 : (~wire28)) < (~&$signed(wire24))) ?
                          $unsigned($signed($unsigned(wire25))) : ({(wire26 ?
                                      wire28 : wire26),
                                  $unsigned((8'h9f))} ?
                              wire23 : (wire26[(2'h2):(1'h0)] ?
                                  ((8'hbd) ?
                                      wire24 : wire23) : wire27[(3'h7):(3'h5)]))) : (~$unsigned(((7'h43) <<< {wire27}))));
  assign wire30 = (&wire26);
  always
    @(posedge clk) begin
      reg31 <= ((~|wire29[(2'h2):(1'h0)]) ?
          {((~^$unsigned(wire30)) ?
                  wire26[(1'h1):(1'h1)] : $signed($signed(wire28)))} : $signed($signed(($unsigned(wire29) + $signed(wire27)))));
      reg32 <= (wire30[(4'he):(4'he)] | wire27[(4'he):(1'h1)]);
      reg33 <= $signed(wire29);
    end
  always
    @(posedge clk) begin
      reg34 <= wire28;
    end
  module35 #() modinst76 (wire75, clk, wire23, reg33, wire27, reg34);
  assign wire77 = ((^reg32[(3'h4):(2'h3)]) + wire75);
  assign wire78 = (($signed($unsigned(((8'hbd) < (8'haf)))) ?
                      ((wire75 ? wire27[(4'hd):(2'h3)] : ((8'ha6) && wire29)) ?
                          $unsigned((&wire75)) : (~$unsigned(reg33))) : reg34) >= reg34);
  module79 #() modinst123 (wire122, clk, wire30, wire25, wire75, wire28);
  always
    @(posedge clk) begin
      reg124 <= wire24[(2'h2):(1'h1)];
      reg125 <= {$signed($signed(wire78))};
    end
  always
    @(posedge clk) begin
      reg126 <= wire25[(4'hd):(4'h8)];
      reg127 <= ($signed((wire29 ?
          ($unsigned(wire24) + (reg34 | wire23)) : (reg124 ?
              wire122[(3'h4):(2'h3)] : {(8'ha2)}))) <= {$signed($signed(((8'haa) > wire28)))});
      reg128 <= {((-($unsigned(wire75) ? (wire30 & wire25) : $signed(wire28))) ?
              (-$signed($signed((7'h43)))) : wire27),
          (~^(($unsigned((8'hb4)) ^ $signed(reg124)) - reg34[(4'h8):(3'h7)]))};
      if ((((8'hb6) ?
          $unsigned(wire75[(2'h2):(1'h0)]) : $signed($signed(wire27))) << $unsigned(($unsigned(wire29) >> (8'hb2)))))
        begin
          if ({$signed(($unsigned((!(8'hbe))) ?
                  $signed((reg32 >>> wire122)) : reg34))})
            begin
              reg129 <= (7'h41);
            end
          else
            begin
              reg129 <= {(!(((reg32 <= (8'ha4)) ?
                      wire78[(4'hd):(3'h7)] : ((8'hb9) ?
                          wire78 : (8'ha0))) + {(8'hbc)})),
                  $unsigned(wire75[(1'h1):(1'h0)])};
            end
          if ((8'ha3))
            begin
              reg130 <= $unsigned(($signed({wire30[(5'h11):(4'hc)],
                      (~^reg125)}) ?
                  wire24 : $unsigned(wire29)));
              reg131 <= $unsigned($unsigned(((reg124[(4'hf):(3'h6)] ?
                      (wire27 - wire24) : $signed(reg128)) ?
                  $signed(((7'h42) ? (8'ha8) : wire29)) : (8'ha6))));
            end
          else
            begin
              reg130 <= ((($unsigned({wire27}) ?
                      {((8'ha2) > (8'ha7)),
                          $signed(reg32)} : $unsigned(reg33[(4'h9):(3'h6)])) && (wire78 || ((wire28 * (8'hb8)) ?
                      (-reg128) : (-reg31)))) ?
                  (~(((~wire24) ?
                      (8'hb4) : (reg126 >= (8'hb4))) | wire23[(4'hf):(2'h3)])) : (reg33[(2'h2):(1'h1)] ?
                      (wire26[(5'h10):(4'hd)] || reg130) : reg126[(3'h5):(3'h4)]));
              reg131 <= $signed(wire77);
              reg132 <= $unsigned(reg124[(1'h0):(1'h0)]);
              reg133 <= $unsigned((+(~&wire28)));
            end
        end
      else
        begin
          reg129 <= (reg132[(3'h4):(1'h1)] ^~ (((wire29 == wire122) ?
                  wire29[(3'h7):(3'h6)] : $unsigned((wire78 - wire23))) ?
              reg129 : (&(~^wire78[(4'hf):(4'hd)]))));
          reg130 <= wire24[(1'h0):(1'h0)];
          if ($signed(((wire26[(4'hb):(1'h0)] << (reg129 ?
              $unsigned((8'h9d)) : (&wire29))) <= ((reg124 ?
                  (~|reg32) : (wire29 ? (8'ha5) : reg127)) ?
              $signed($signed(wire27)) : $signed($unsigned(reg129))))))
            begin
              reg131 <= reg129[(4'hc):(4'hb)];
              reg132 <= reg130;
              reg133 <= $signed(wire25);
              reg134 <= {(8'ha7)};
              reg135 <= (!$unsigned(wire29));
            end
          else
            begin
              reg131 <= (|{{((reg126 || wire122) ?
                          (reg130 ? reg125 : (8'ha5)) : $unsigned(reg126))},
                  $unsigned((8'h9c))});
              reg132 <= (~^$unsigned({{{reg34}, {reg126}},
                  (+(reg134 ? wire122 : reg132))}));
              reg133 <= ($unsigned(reg34) ?
                  reg31 : ((~^$unsigned((reg126 ^~ reg126))) ?
                      wire28[(4'hb):(1'h1)] : {((wire78 <<< wire122) | $unsigned(wire25))}));
            end
        end
      reg136 <= (~&reg127[(5'h13):(3'h7)]);
    end
  assign wire137 = $unsigned(((~^(wire24 ? reg135 : $signed(reg31))) ?
                       reg127[(5'h14):(3'h4)] : reg32));
  always
    @(posedge clk) begin
      reg138 <= $unsigned($unsigned(wire75[(2'h3):(2'h3)]));
    end
  assign wire139 = (($signed(reg138[(3'h4):(2'h2)]) == (+$signed($unsigned(reg129)))) ?
                       wire23[(2'h3):(1'h1)] : $signed($signed($signed((~^wire25)))));
  assign wire140 = wire29[(2'h2):(2'h2)];
  module141 #() modinst164 (.wire143(wire78), .wire144(wire23), .wire142(reg135), .wire145(reg130), .clk(clk), .wire146(reg131), .y(wire163));
endmodule

module module141  (y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire146;
  input wire [(2'h2):(1'h0)] wire145;
  input wire [(2'h2):(1'h0)] wire144;
  input wire [(2'h3):(1'h0)] wire143;
  input wire signed [(4'h9):(1'h0)] wire142;
  wire signed [(2'h2):(1'h0)] wire151;
  wire [(4'he):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire148;
  wire signed [(5'h12):(1'h0)] wire147;
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire147 = wire146;
  assign wire148 = $unsigned({wire147});
  assign wire149 = (!((8'ha1) ^~ wire146[(4'h9):(1'h0)]));
  assign wire150 = wire142;
  assign wire151 = wire149;
  always
    @(posedge clk) begin
      reg152 <= ((!(|wire151)) + {(wire149 == (^~wire142[(3'h7):(1'h1)])),
          $signed($signed($unsigned(wire145)))});
      reg153 <= (+(+wire149));
      reg154 <= $signed(wire149[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg155 <= (^~{wire143});
      if (((+wire145) ?
          (reg155 ?
              wire148[(4'h8):(1'h1)] : {(^(wire142 >= reg153))}) : (+(wire143 ^ $unsigned($signed(reg153))))))
        begin
          reg156 <= {$signed(((((8'hb5) ? (8'had) : wire146) ?
                  wire147 : $unsigned((7'h44))) <= wire149))};
          if ((wire149[(4'h8):(4'h8)] << (reg154[(2'h2):(1'h1)] < wire148[(4'hb):(3'h5)])))
            begin
              reg157 <= $unsigned((~|$unsigned($unsigned((~&(8'ha3))))));
              reg158 <= (reg157[(2'h3):(2'h3)] ^ (8'haa));
            end
          else
            begin
              reg157 <= ($signed((~&((wire144 < wire143) ?
                      {reg154} : $signed((7'h43))))) ?
                  ((~&(~&$unsigned((7'h40)))) == (7'h43)) : wire151);
              reg158 <= $signed((^~($unsigned((wire148 ?
                  reg157 : (8'h9f))) ~^ (~^$signed((8'ha0))))));
              reg159 <= reg153[(1'h1):(1'h0)];
              reg160 <= {(&(~^$unsigned((+wire148))))};
            end
          reg161 <= (~|{(reg154 ?
                  ($signed(reg155) ?
                      (8'ha0) : $unsigned(reg152)) : (+wire144[(1'h0):(1'h0)]))});
        end
      else
        begin
          if (((wire145 >>> reg153[(2'h2):(2'h2)]) > (~wire148[(4'hf):(4'hf)])))
            begin
              reg156 <= ((^reg156[(3'h5):(2'h3)]) ?
                  wire150[(4'ha):(3'h4)] : reg157[(1'h1):(1'h0)]);
            end
          else
            begin
              reg156 <= wire149;
              reg157 <= $signed(reg159[(5'h12):(5'h12)]);
              reg158 <= $signed($unsigned($signed({(&(8'hb1))})));
            end
          reg159 <= reg156;
          reg160 <= {$unsigned($signed(($signed(wire147) ?
                  (wire147 ? reg160 : reg159) : $signed((7'h40)))))};
          reg161 <= reg157[(4'ha):(4'ha)];
        end
      reg162 <= wire148;
    end
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire83;
  input wire [(4'ha):(1'h0)] wire82;
  input wire signed [(3'h5):(1'h0)] wire81;
  input wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire103,
                 wire102,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire84 = $unsigned(wire81);
  assign wire85 = $signed((~(($signed(wire84) ?
                      $unsigned(wire80) : wire80[(3'h4):(1'h1)]) & $signed($signed((8'hbb))))));
  assign wire86 = wire83;
  assign wire87 = ((|($unsigned($signed(wire83)) | wire81[(3'h5):(1'h0)])) & wire82[(4'ha):(1'h1)]);
  assign wire88 = wire82;
  assign wire89 = (wire85 ?
                      (((^wire82) || {(wire88 ? wire88 : wire81),
                          wire83[(4'hc):(4'ha)]}) > ($signed($unsigned(wire85)) << $signed(wire82[(1'h1):(1'h1)]))) : wire84[(4'ha):(3'h5)]);
  assign wire90 = wire85[(3'h4):(3'h4)];
  assign wire91 = $unsigned(wire87);
  assign wire92 = (-(^~wire82[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      if ((($signed(wire84) ?
          ($unsigned(wire91) ?
              wire84 : $unsigned($unsigned(wire81))) : (($signed(wire87) >= wire92) < wire91[(4'hb):(4'ha)])) >= $unsigned($unsigned(wire86))))
        begin
          if (((-$unsigned((!wire83[(2'h3):(1'h1)]))) ~^ wire87))
            begin
              reg93 <= (~|wire91[(4'hb):(3'h4)]);
              reg94 <= {$unsigned($unsigned(reg93)),
                  (!(^$unsigned(((8'hac) ? (8'hbb) : reg93))))};
              reg95 <= $signed(wire89[(2'h2):(1'h0)]);
            end
          else
            begin
              reg93 <= (reg94[(4'hb):(4'h9)] - (&(|(8'haf))));
              reg94 <= reg93;
              reg95 <= $unsigned($unsigned($unsigned({wire80[(1'h1):(1'h1)]})));
              reg96 <= $signed({($unsigned(wire80) ?
                      $signed((!wire84)) : (~|(reg94 ? wire91 : wire84)))});
            end
          reg97 <= $signed(wire80[(4'ha):(3'h5)]);
        end
      else
        begin
          reg93 <= wire84[(4'ha):(1'h0)];
          reg94 <= $unsigned(reg95);
        end
      reg98 <= (reg95 ? reg96 : $unsigned(wire84[(3'h5):(1'h0)]));
      reg99 <= {$signed($signed($signed(wire84)))};
      reg100 <= ($signed((($unsigned(reg98) ?
              $unsigned((8'hac)) : ((8'hb7) >= wire86)) + (8'hbd))) ?
          $unsigned(($signed(reg98[(2'h3):(2'h3)]) >= wire83[(1'h1):(1'h0)])) : $unsigned(($signed((7'h43)) ?
              (wire84[(4'h9):(3'h4)] * (reg96 < reg98)) : wire92)));
      reg101 <= $unsigned(((reg94 && reg98) ?
          wire88[(5'h12):(4'hc)] : $signed(($unsigned(reg95) ^ {wire92,
              reg93}))));
    end
  assign wire102 = $unsigned((~^$signed(wire90)));
  assign wire103 = (-(8'haf));
  always
    @(posedge clk) begin
      if ($signed($signed((~|($unsigned(reg99) ?
          {wire82} : $unsigned(reg93))))))
        begin
          if ({($signed(reg94) | wire91[(4'h8):(2'h3)]), reg99[(3'h4):(1'h0)]})
            begin
              reg104 <= reg100;
              reg105 <= wire102;
            end
          else
            begin
              reg104 <= {((wire89 ?
                      ((reg94 - wire84) >= $unsigned((8'ha5))) : reg96[(2'h3):(2'h3)]) <= reg95)};
              reg105 <= (^wire88[(2'h3):(2'h3)]);
            end
          reg106 <= wire90;
          reg107 <= (+(+(!$signed(reg101))));
          reg108 <= ($unsigned((^~(((8'hac) ^ wire103) || $signed((8'h9c))))) <<< {{(8'hab)}});
        end
      else
        begin
          reg104 <= $signed({wire83});
        end
    end
  assign wire109 = ($unsigned($unsigned(reg106[(4'h8):(1'h1)])) ?
                       (wire89 >>> wire86) : $signed({{(wire102 ^~ reg107)},
                           wire102[(3'h4):(2'h3)]}));
  assign wire110 = $unsigned($signed((~^(|reg98[(2'h2):(1'h1)]))));
  assign wire111 = reg96[(3'h4):(2'h3)];
  assign wire112 = (&((~^reg98[(4'h8):(3'h4)]) ?
                       $signed(((!wire110) ?
                           {(8'hb3),
                               (8'ha0)} : (reg104 && wire81))) : reg94[(3'h5):(3'h5)]));
  assign wire113 = $unsigned((reg94[(1'h0):(1'h0)] + wire87[(4'hf):(4'ha)]));
  always
    @(posedge clk) begin
      if (reg96[(2'h3):(1'h1)])
        begin
          if (reg94[(2'h3):(2'h3)])
            begin
              reg114 <= {($signed({reg106[(4'ha):(2'h2)], {(8'hb5), wire112}}) ?
                      $unsigned(wire87[(4'h8):(4'h8)]) : wire82[(1'h0):(1'h0)])};
              reg115 <= wire82[(4'h9):(2'h3)];
              reg116 <= $unsigned($signed((($signed(wire113) ?
                  $unsigned(reg93) : (^~reg98)) ^~ ($unsigned(wire92) >>> (+reg94)))));
            end
          else
            begin
              reg114 <= ($signed(reg108[(1'h1):(1'h0)]) ?
                  (({$unsigned((8'hb2)), reg116} ?
                          ($unsigned(reg108) && (wire113 ?
                              (8'hb3) : wire102)) : (-(wire89 ?
                              wire102 : (8'hb7)))) ?
                      ((8'ha3) == $signed((wire112 ?
                          wire88 : reg97))) : (~^wire113)) : (reg108 * reg98[(2'h3):(1'h0)]));
              reg115 <= wire92;
              reg116 <= $unsigned((wire88 | ((&(reg97 < wire111)) >> reg116)));
            end
          reg117 <= ($unsigned(((((8'h9d) ? reg106 : reg107) ?
                  wire112[(4'hc):(4'hb)] : $unsigned(reg101)) ?
              (-(8'hbf)) : $signed($signed(reg93)))) == (-$unsigned((reg104 || (~&reg114)))));
          reg118 <= wire88[(5'h11):(5'h10)];
          reg119 <= ((-$signed((!(~|reg97)))) ?
              ((~^$unsigned((~&reg115))) & ((reg101[(2'h2):(1'h0)] + $unsigned(wire82)) <= $signed($signed(reg104)))) : (!wire113[(2'h3):(2'h2)]));
          reg120 <= {(&((reg104[(1'h1):(1'h1)] || {wire90}) < reg118))};
        end
      else
        begin
          reg114 <= ((+$signed($unsigned((wire86 ?
              reg99 : wire113)))) | reg116);
          reg115 <= {(~&({{wire85, reg108}, (wire109 | reg94)} ?
                  {$unsigned(wire112),
                      $signed(wire113)} : reg95[(4'he):(4'he)])),
              ($signed({(reg98 ?
                      wire111 : wire80)}) != (((+reg119) ~^ reg95[(4'ha):(3'h7)]) - (-$unsigned(reg106))))};
          if ($signed({$unsigned(reg119[(3'h5):(2'h3)]),
              ($signed((~&reg119)) ^ $unsigned({reg99, wire89}))}))
            begin
              reg116 <= {wire111[(4'hb):(2'h3)]};
              reg117 <= ($signed((8'haa)) * $unsigned($signed((&reg120))));
              reg118 <= wire81;
              reg119 <= $signed($unsigned((~^(!reg93[(3'h6):(1'h1)]))));
            end
          else
            begin
              reg116 <= (wire111 ?
                  reg100 : $signed((((reg108 << wire87) <<< (8'ha9)) > $signed((&(8'haa))))));
              reg117 <= (^~wire103);
            end
          reg120 <= $unsigned(reg116);
          reg121 <= $unsigned(reg115[(3'h4):(2'h3)]);
        end
    end
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire signed [(4'he):(1'h0)] wire38;
  input wire [(4'hc):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire74,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire41,
                 wire40,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg57,
                 reg56,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = $unsigned(wire39[(5'h12):(4'hd)]);
  assign wire41 = {(8'hbb)};
  always
    @(posedge clk) begin
      reg42 <= wire36;
      reg43 <= ({$unsigned($signed($unsigned(wire41)))} || wire40);
      reg44 <= $unsigned(reg42);
      reg45 <= $signed(wire39);
    end
  assign wire46 = wire38;
  assign wire47 = reg43[(3'h5):(2'h3)];
  assign wire48 = reg44[(3'h6):(3'h4)];
  assign wire49 = (+(wire36 <= (8'ha8)));
  assign wire50 = ({(8'hbc), wire48} ?
                      reg42[(1'h1):(1'h0)] : ($signed(((&wire40) ?
                          reg45 : (reg42 ^ wire41))) == ({$unsigned(wire38)} == wire49[(5'h12):(2'h2)])));
  assign wire51 = wire46[(2'h2):(1'h0)];
  assign wire52 = (($unsigned(wire36) || wire39) ^~ wire40);
  assign wire53 = (wire46[(4'h8):(2'h2)] ? wire47[(4'hf):(4'hf)] : wire48);
  assign wire54 = $unsigned(reg43);
  assign wire55 = wire46[(4'h9):(4'h8)];
  always
    @(posedge clk) begin
      reg56 <= wire41;
      reg57 <= wire53[(3'h4):(2'h3)];
    end
  assign wire58 = $signed(({reg57} & (!wire47)));
  assign wire59 = ({(^(^~$signed(wire40)))} ?
                      wire51 : (((wire38 + ((8'hb7) - wire51)) > {(wire53 ?
                              reg44 : (7'h44)),
                          {wire53,
                              wire36}}) != ($unsigned((^~(7'h42))) | {{(8'hb8)}})));
  assign wire60 = ($signed({((8'hbb) ?
                              $unsigned((8'hbc)) : reg42[(3'h6):(3'h4)]),
                          (wire53 ? {(8'hbb)} : $signed(reg43))}) ?
                      (!$unsigned($signed($signed(wire51)))) : (~^($unsigned($unsigned(wire38)) ?
                          ((wire55 ?
                              reg45 : wire39) && $signed((8'ha9))) : ($unsigned(reg45) ?
                              (!wire54) : wire52))));
  assign wire61 = wire53[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg62 <= wire55[(2'h3):(1'h0)];
      reg63 <= $unsigned(wire55);
      reg64 <= $unsigned($unsigned((|(!reg62[(5'h12):(5'h10)]))));
      if (wire46[(4'hc):(4'hc)])
        begin
          reg65 <= reg45[(4'ha):(4'h9)];
        end
      else
        begin
          reg65 <= ($unsigned($signed((~^{(8'ha9)}))) ?
              reg57 : ($unsigned(wire37[(1'h1):(1'h0)]) ?
                  (reg42[(2'h3):(2'h2)] ?
                      ((~&reg42) & wire59[(2'h2):(1'h0)]) : $signed(wire46[(3'h6):(3'h6)])) : (+$signed((wire59 ?
                      (8'hb1) : wire46)))));
        end
      reg66 <= (wire53 <= (~&$signed({reg65[(3'h4):(2'h2)]})));
    end
  assign wire67 = $unsigned($signed((~&((~^wire38) ?
                      (reg65 ? (8'hb2) : wire46) : {(8'ha4), reg62}))));
  assign wire68 = {((|($signed(wire36) - ((8'haf) ?
                          wire38 : wire49))) << reg44)};
  always
    @(posedge clk) begin
      if ((&$signed($unsigned((~|reg42)))))
        begin
          reg69 <= (&reg65[(1'h0):(1'h0)]);
          reg70 <= ($unsigned((7'h40)) ?
              (^reg65[(2'h2):(2'h2)]) : {wire49[(5'h15):(5'h14)],
                  (((&wire55) >> wire36[(2'h2):(2'h2)]) ?
                      $signed((wire53 & wire53)) : {(8'hb0),
                          (reg42 & wire61)})});
          reg71 <= ((!(($signed((8'haf)) <= reg56) ?
              wire60 : (wire67 & $signed(wire37)))) >= {wire48});
          reg72 <= (8'ha5);
        end
      else
        begin
          reg69 <= $unsigned((($unsigned($signed(wire49)) << $unsigned((~wire49))) ^~ (wire51[(1'h0):(1'h0)] ?
              (wire47 == wire58[(3'h5):(3'h5)]) : reg57[(4'ha):(4'ha)])));
          reg70 <= reg45[(4'h9):(1'h0)];
        end
      reg73 <= ((wire54 + $unsigned($signed({(8'haa)}))) != $unsigned($unsigned((wire60 <= (wire54 ?
          (8'hbc) : wire55)))));
    end
  assign wire74 = (reg65[(3'h4):(1'h0)] >>> wire39);
endmodule

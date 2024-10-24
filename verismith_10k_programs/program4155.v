module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire194;
  wire signed [(4'hb):(1'h0)] wire193;
  wire [(5'h12):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire188;
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire96,
                 wire8,
                 wire5,
                 wire98,
                 wire101,
                 wire102,
                 wire106,
                 wire107,
                 wire188,
                 reg192,
                 reg191,
                 reg190,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg99,
                 reg100,
                 reg103,
                 reg104,
                 reg105,
                 (1'h0)};
  assign wire5 = (~|(~^wire3));
  always
    @(posedge clk) begin
      reg6 <= $signed(((($signed(wire0) ? $unsigned(wire5) : (~^wire3)) ?
          (~(wire4 && wire5)) : {(wire0 ?
                  wire0 : wire4)}) ^ (|$unsigned((8'ha3)))));
    end
  always
    @(posedge clk) begin
      reg7 <= {(+$signed((wire2[(3'h7):(2'h2)] >>> ((8'ha5) >>> wire1)))),
          (^wire0)};
    end
  assign wire8 = (~$unsigned($unsigned(wire2[(3'h7):(3'h5)])));
  always
    @(posedge clk) begin
      reg9 <= wire3;
      reg10 <= wire5;
      reg11 <= wire1;
      reg12 <= {(+((((8'hb3) < wire8) > {reg7, wire0}) > $signed((reg9 ?
              (7'h40) : reg10))))};
      if ($unsigned({$signed($signed(wire2[(2'h3):(1'h1)]))}))
        begin
          reg13 <= $unsigned($signed({$unsigned((wire5 + (7'h42))),
              (-(reg11 >> (8'ha6)))}));
          reg14 <= (~$signed(reg13));
          reg15 <= $unsigned(({($signed(reg10) ? reg9 : (8'ha6))} ?
              $signed((|{reg6, wire5})) : {reg6}));
          if (($signed(wire1[(5'h12):(5'h10)]) >> reg11[(4'hc):(3'h5)]))
            begin
              reg16 <= (~|reg14);
              reg17 <= $signed(($unsigned((reg13 << ((8'h9e) ?
                      (8'hb8) : reg13))) ?
                  (wire3 ?
                      {(~|reg14)} : ((wire5 ? wire0 : reg6) ?
                          {reg12, wire1} : {wire5})) : (({reg15} ?
                          reg16[(3'h4):(2'h2)] : {reg12}) ?
                      $signed(wire3) : (~|wire2))));
            end
          else
            begin
              reg16 <= (($unsigned((8'hb1)) ?
                  ($unsigned(reg12) ?
                      $signed((reg14 ?
                          reg12 : (8'h9d))) : $unsigned((8'hab))) : ((((8'ha7) < reg13) ?
                      (&(8'hb3)) : $unsigned(wire2)) >> $signed((8'ha4)))) <= (wire2 ?
                  ((^wire0[(1'h0):(1'h0)]) <<< {$signed(reg9),
                      (reg10 ? reg9 : wire8)}) : {(~^$unsigned(reg6))}));
              reg17 <= (!{reg15});
              reg18 <= {wire2[(4'h9):(3'h4)]};
              reg19 <= (!(~reg15));
            end
          reg20 <= $signed(reg7[(1'h0):(1'h0)]);
        end
      else
        begin
          reg13 <= $signed((reg15 < wire5[(2'h3):(1'h1)]));
          reg14 <= $signed((^~$unsigned((~(^~(8'hac))))));
        end
    end
  module21 #() modinst97 (.y(wire96), .clk(clk), .wire23(reg16), .wire24(reg19), .wire22(reg14), .wire25(wire1));
  assign wire98 = (^~(reg12[(5'h10):(3'h5)] ?
                      ({$unsigned(wire8), reg14} ?
                          {wire4, (~&reg20)} : ($unsigned(reg18) ?
                              (wire2 ?
                                  wire5 : reg7) : (reg15 ^ wire5))) : (!reg14[(3'h6):(3'h5)])));
  always
    @(posedge clk) begin
      reg99 <= ((8'hb5) ?
          ((~{$signed(reg16)}) ?
              $signed({(wire98 < reg10),
                  (reg12 ? wire4 : (8'hba))}) : ({(~&wire3),
                  (~wire3)} < (reg10[(4'h8):(3'h4)] ?
                  (reg20 >>> (8'h9d)) : wire4[(3'h4):(2'h3)]))) : $signed((~^(|$signed(reg18)))));
      reg100 <= wire3[(3'h7):(3'h7)];
    end
  assign wire101 = ($signed((-$unsigned($signed(reg13)))) ?
                       {(&reg100), reg15} : wire4[(2'h2):(1'h0)]);
  assign wire102 = wire2;
  always
    @(posedge clk) begin
      reg103 <= (^(+(^(+reg19))));
      reg104 <= {(({(reg12 >= (8'ha8)), reg20} ?
                  (+reg13) : {reg19[(5'h14):(4'ha)], $unsigned(reg103)}) ?
              (8'ha8) : $unsigned(reg100)),
          {(+reg10)}};
      reg105 <= $unsigned(((~|reg10[(3'h7):(3'h4)]) ?
          wire4 : (reg13[(3'h5):(1'h1)] >>> $unsigned(((7'h43) ?
              reg10 : (7'h43))))));
    end
  assign wire106 = (|(8'h9d));
  assign wire107 = ($signed($unsigned($unsigned((~wire1)))) && $unsigned(((+(reg12 ?
                           (8'haa) : reg6)) ?
                       {{wire96, reg6}} : reg100)));
  module108 #() modinst189 (.wire109(reg7), .y(wire188), .wire110(wire3), .wire111(reg100), .clk(clk), .wire112(reg99));
  always
    @(posedge clk) begin
      reg190 <= ({$signed((wire101 ? (~|wire107) : reg20)),
              {$signed((reg19 ? (8'hae) : wire1)),
                  ($signed((8'hbd)) ? $signed(wire102) : {wire3})}} ?
          reg10 : (wire2[(3'h6):(3'h4)] * {{{wire4}, {reg100, reg20}}}));
      reg191 <= $unsigned((reg100 ? $signed(wire8[(4'ha):(3'h6)]) : (^~reg13)));
      reg192 <= reg15[(3'h6):(3'h4)];
    end
  assign wire193 = $signed(wire98);
  assign wire194 = ($unsigned((((^~reg6) ? (reg6 || (8'ha0)) : (&reg103)) ?
                           wire107[(4'h8):(3'h5)] : $signed((8'ha8)))) ?
                       (((-(reg20 ? reg17 : wire0)) ?
                           $signed((-reg11)) : wire106[(3'h5):(2'h2)]) <= (8'ha4)) : $unsigned(reg10[(3'h7):(3'h6)]));
  assign wire195 = (&{(8'had)});
endmodule

module module108
#(parameter param186 = (8'ha1), 
parameter param187 = (+(~param186)))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire112;
  input wire [(5'h14):(1'h0)] wire111;
  input wire signed [(5'h13):(1'h0)] wire110;
  input wire [(4'hb):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire146;
  wire signed [(4'he):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  assign y = {wire179,
                 wire146,
                 wire145,
                 wire144,
                 wire137,
                 wire136,
                 wire131,
                 wire130,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
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
                 (1'h0)};
  assign wire113 = wire109[(3'h6):(2'h3)];
  assign wire114 = $unsigned(((($unsigned(wire113) ?
                           (8'hb4) : ((8'hb6) ? wire109 : wire112)) ?
                       {((8'hbe) + wire112),
                           wire111[(4'hb):(4'h9)]} : (8'hb5)) & ($unsigned((+wire110)) ^ (wire110 | {wire109}))));
  assign wire115 = $signed(wire113[(4'hb):(3'h6)]);
  assign wire116 = wire109[(3'h6):(3'h5)];
  assign wire117 = (^~wire114);
  assign wire118 = $signed({($signed({(7'h44), wire110}) ?
                           (~&$unsigned(wire111)) : $unsigned(wire117[(3'h5):(3'h5)])),
                       wire116[(4'ha):(4'ha)]});
  assign wire119 = {(&(wire110 | wire112[(2'h3):(2'h3)]))};
  always
    @(posedge clk) begin
      reg120 <= $unsigned(wire112[(4'hd):(3'h5)]);
      if (wire115[(1'h1):(1'h1)])
        begin
          reg121 <= $signed((^(|$unsigned(wire109[(3'h5):(3'h4)]))));
          reg122 <= $unsigned($unsigned((((wire114 ? wire113 : wire114) ?
                  wire114[(2'h2):(2'h2)] : $signed(wire119)) ?
              wire113[(4'h9):(2'h2)] : ({wire117} >= (8'ha9)))));
          if ($unsigned($signed(wire113[(4'hb):(1'h0)])))
            begin
              reg123 <= wire117[(3'h5):(3'h5)];
            end
          else
            begin
              reg123 <= (+(7'h44));
              reg124 <= {$signed($unsigned((8'hab))),
                  (+(wire113 ?
                      (|$signed(wire118)) : ((wire117 ? wire109 : (8'hb0)) ?
                          (wire111 ? (8'hbe) : wire118) : ((8'h9e) ?
                              wire119 : wire114))))};
              reg125 <= $signed((^$signed($unsigned((8'ha0)))));
              reg126 <= reg122;
              reg127 <= wire115[(3'h5):(3'h4)];
            end
          reg128 <= wire119;
          reg129 <= $unsigned(wire116);
        end
      else
        begin
          reg121 <= $signed($unsigned((!(8'ha4))));
          if ($signed((reg123 * ((reg122[(4'h8):(1'h0)] >> $unsigned(reg125)) ?
              (~|reg121[(4'he):(3'h4)]) : wire116[(5'h11):(3'h5)]))))
            begin
              reg122 <= reg128[(4'hb):(3'h5)];
              reg123 <= reg126;
            end
          else
            begin
              reg122 <= $unsigned((reg123 ~^ (^wire113[(4'hb):(3'h5)])));
              reg123 <= {$unsigned(((7'h43) < (8'ha6))),
                  $signed({$unsigned(reg126[(1'h1):(1'h1)]), reg122})};
              reg124 <= (wire110 ?
                  $unsigned({reg120}) : (wire112[(4'he):(4'hd)] * $unsigned((reg126[(3'h4):(1'h1)] >= wire109[(1'h0):(1'h0)]))));
              reg125 <= $unsigned(reg121);
            end
          reg126 <= wire119;
        end
    end
  assign wire130 = {wire114[(4'ha):(2'h2)]};
  assign wire131 = wire118[(4'hd):(1'h0)];
  always
    @(posedge clk) begin
      reg132 <= (~reg125[(1'h0):(1'h0)]);
      reg133 <= reg121;
      reg134 <= reg126[(1'h1):(1'h1)];
      reg135 <= $signed($signed($signed($signed($signed(reg121)))));
    end
  assign wire136 = (^{(~^($signed(wire131) ? wire117 : (^~reg129))),
                       (~|(+$unsigned((8'h9f))))});
  assign wire137 = $signed(reg133);
  always
    @(posedge clk) begin
      if (((!reg132[(3'h4):(2'h2)]) >= wire110[(4'hc):(4'ha)]))
        begin
          reg138 <= reg129[(3'h4):(1'h0)];
          reg139 <= reg122[(3'h5):(1'h1)];
          reg140 <= wire114[(4'h8):(3'h6)];
        end
      else
        begin
          reg138 <= wire118[(5'h11):(5'h11)];
        end
      reg141 <= reg129;
      reg142 <= (+$unsigned($unsigned(wire112)));
      reg143 <= (~|$signed((wire115 ^ $unsigned(reg132))));
    end
  assign wire144 = $signed(wire116);
  assign wire145 = ($signed($unsigned((^~{reg135}))) < {$signed((reg143[(3'h5):(1'h1)] ?
                           wire113[(4'hc):(3'h5)] : $signed(reg134)))});
  assign wire146 = $signed((+(8'ha9)));
  module147 #() modinst180 (.y(wire179), .wire149(wire131), .wire150(reg124), .wire148(wire145), .wire151(reg120), .clk(clk));
  always
    @(posedge clk) begin
      reg181 <= (reg121[(4'h9):(4'h9)] < {$signed((^wire117[(3'h6):(1'h1)])),
          (((wire179 ?
              reg135 : wire130) < $unsigned(wire114)) >>> {(reg128 && wire146)})});
      reg182 <= (8'hbe);
      reg183 <= $unsigned((~|$unsigned($signed(reg138[(2'h2):(1'h1)]))));
      reg184 <= {($unsigned(wire118[(4'hc):(2'h2)]) <= (8'ha4))};
      reg185 <= reg140;
    end
endmodule

module module21
#(parameter param94 = ((7'h40) < (~|((((8'ha2) ? (8'hba) : (8'ha2)) ^ ((8'h9c) ^~ (8'hbe))) <<< {{(8'hbc)}}))), 
parameter param95 = param94)
(y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire74;
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire88,
                 wire26,
                 wire74,
                 reg90,
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
                 (1'h0)};
  assign wire26 = ($unsigned($signed({{wire25, wire24}, $unsigned(wire24)})) ?
                      ($unsigned({$unsigned(wire25), $signed((8'hb4))}) ?
                          ($unsigned(wire25[(3'h7):(1'h0)]) > {{wire23,
                                  (8'hb7)}}) : {{{(8'h9f)}, (wire22 + wire25)},
                              wire23[(4'h8):(1'h1)]}) : wire22);
  module27 #() modinst75 (wire74, clk, wire26, wire23, wire24, wire25, wire22);
  always
    @(posedge clk) begin
      reg76 <= {$signed(($unsigned(wire22) >= ({(8'haa)} ?
              $unsigned(wire23) : (wire24 ? wire74 : wire26))))};
      reg77 <= wire24[(4'hd):(3'h7)];
      reg78 <= $signed(((!(|(wire25 > wire74))) ?
          $unsigned((wire24 ~^ (!wire74))) : $unsigned((wire25 >= wire22[(1'h1):(1'h1)]))));
      if ((wire23 + (({(!reg78)} ?
          $unsigned({wire74}) : ((reg77 ?
              reg77 : wire26) - (reg78 && reg77))) > $unsigned({$unsigned(wire22)}))))
        begin
          reg79 <= reg76;
          reg80 <= wire74[(3'h6):(1'h1)];
          reg81 <= $unsigned($signed($unsigned(((wire23 ^ reg79) || wire25))));
          reg82 <= reg78;
          if ((!{wire23, wire24}))
            begin
              reg83 <= $signed((~reg82));
              reg84 <= {(wire74 * $unsigned(wire23)), wire25[(4'hf):(4'hf)]};
              reg85 <= wire22[(4'h9):(2'h3)];
            end
          else
            begin
              reg83 <= (~|(reg81 ?
                  reg77[(3'h4):(3'h4)] : $unsigned(wire22[(1'h0):(1'h0)])));
              reg84 <= $unsigned({(wire24 ?
                      $unsigned((wire24 ?
                          wire24 : wire22)) : (reg79[(1'h1):(1'h1)] ?
                          (reg77 ? reg84 : reg78) : (~|wire23))),
                  $signed(((wire25 | reg82) && reg85[(3'h4):(1'h1)]))});
              reg85 <= $unsigned((~^wire22[(4'h9):(3'h6)]));
            end
        end
      else
        begin
          reg79 <= $unsigned(reg80[(3'h6):(3'h4)]);
          if ((reg76[(2'h3):(1'h1)] ?
              (reg85 ?
                  $signed($signed({(7'h41), reg82})) : ($signed((~|reg79)) ?
                      (reg78[(4'hc):(3'h4)] ~^ (+(8'ha7))) : wire26[(1'h1):(1'h1)])) : ((reg78[(4'hf):(3'h7)] | $signed((wire25 - reg84))) ?
                  (~|$signed((^wire23))) : reg82[(4'hf):(4'hc)])))
            begin
              reg80 <= $unsigned($unsigned((reg78[(2'h3):(2'h3)] >> reg84)));
              reg81 <= (~|reg81[(1'h0):(1'h0)]);
              reg82 <= $unsigned((+reg80[(3'h6):(2'h2)]));
              reg83 <= (($unsigned((&((8'haa) ? wire22 : reg81))) ?
                      ((8'h9d) >= reg82[(2'h2):(1'h0)]) : ((wire25 ?
                          $unsigned(reg85) : $signed(reg82)) == $unsigned({reg79}))) ?
                  $signed((+(~&(~|reg85)))) : wire26[(3'h4):(1'h1)]);
              reg84 <= reg83[(3'h5):(1'h0)];
            end
          else
            begin
              reg80 <= $signed($unsigned(((reg81[(2'h2):(1'h1)] ~^ $unsigned(wire24)) ~^ wire74[(3'h4):(1'h1)])));
              reg81 <= $signed($signed(wire74[(1'h0):(1'h0)]));
            end
          reg85 <= $unsigned((8'hb4));
          reg86 <= ((wire26 ^~ $unsigned((((8'h9f) ?
              reg85 : reg82) << $unsigned(wire26)))) <<< $unsigned(((|$unsigned(wire24)) ?
              (reg78 ?
                  wire23[(3'h6):(3'h4)] : $signed((8'hbe))) : ((wire22 * wire74) >= (^~wire26)))));
          reg87 <= $signed((~&(wire74[(1'h1):(1'h1)] | ($unsigned(reg82) ?
              (+(8'ha2)) : $signed(wire74)))));
        end
    end
  assign wire88 = (8'hac);
  assign wire89 = $unsigned(wire22);
  always
    @(posedge clk) begin
      reg90 <= reg86;
    end
  assign wire91 = (((reg78[(4'hb):(3'h5)] ?
                          $unsigned((reg82 ^ reg76)) : $signed($signed(reg82))) | wire25[(4'hf):(2'h2)]) ?
                      $signed(reg77) : wire89);
  assign wire92 = $signed(reg87[(3'h5):(1'h1)]);
  assign wire93 = ((($unsigned((^~reg77)) ?
                          reg86[(3'h7):(2'h2)] : $signed($unsigned(reg79))) && reg78[(2'h3):(2'h3)]) ?
                      reg77[(4'h8):(4'h8)] : ((~|wire23) ?
                          $signed($unsigned((reg80 ?
                              reg82 : reg81))) : (8'hb2)));
endmodule

module module27
#(parameter param72 = (!(((+((8'hb4) ? (8'ha6) : (8'h9e))) || (((8'hb3) ^~ (7'h42)) <<< ((8'ha7) + (8'hb1)))) ? ((-(+(8'hbe))) ? ((~^(8'h9e)) ~^ (^(8'ha7))) : {((8'haa) | (8'h9c))}) : ((!((8'hac) ? (8'hb4) : (8'hb3))) >> {((7'h43) ^~ (8'hb1)), ((7'h44) ^~ (8'hb5))}))), 
parameter param73 = (8'had))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire32;
  input wire [(5'h12):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire56,
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
                 wire45,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire32)
        begin
          if (wire28[(4'ha):(3'h5)])
            begin
              reg33 <= $unsigned(wire29);
            end
          else
            begin
              reg33 <= wire32;
              reg34 <= (~&wire30);
            end
          reg35 <= ($signed(($signed(((8'hb0) | wire31)) ?
              wire29 : $unsigned(wire30))) || wire28);
          if (({(($unsigned(wire31) >>> (wire32 - reg35)) <= (+$signed(reg35)))} ?
              $signed(reg35) : (~|wire29)))
            begin
              reg36 <= {wire28[(1'h0):(1'h0)], wire31};
              reg37 <= $unsigned(($unsigned($unsigned(wire31[(4'hd):(1'h1)])) ?
                  reg35 : $unsigned(($signed((8'ha4)) ?
                      (wire31 <<< reg35) : {wire30}))));
            end
          else
            begin
              reg36 <= ((~|reg35) ?
                  reg33[(3'h7):(1'h1)] : (wire32[(3'h4):(2'h3)] | $signed($unsigned((wire32 ^~ wire31)))));
              reg37 <= $unsigned(reg33);
              reg38 <= reg33[(2'h3):(2'h2)];
              reg39 <= ((reg35 ?
                      wire32 : ($signed(((8'ha4) ^~ reg36)) ?
                          ($unsigned((8'hbb)) ?
                              $unsigned(reg38) : ((8'ha4) ?
                                  wire32 : wire31)) : (!$unsigned(reg34)))) ?
                  (^($signed($unsigned(reg38)) ?
                      $signed((reg36 ^ (8'haf))) : $signed(reg38[(1'h0):(1'h0)]))) : {(+(!(~&(8'ha0)))),
                      ((reg35[(4'hb):(3'h4)] >= reg33) ?
                          $signed($unsigned(wire29)) : {(reg38 ?
                                  (8'h9f) : reg34)})});
            end
          if ((reg39[(1'h1):(1'h1)] || reg36[(4'hb):(4'h9)]))
            begin
              reg40 <= ($signed($signed((^$unsigned(reg33)))) + $signed((($signed(reg37) * (!wire29)) != $signed({wire28,
                  (8'ha2)}))));
              reg41 <= (((wire31 ? wire28[(4'he):(4'hd)] : (^(~&reg36))) ?
                  reg36[(4'he):(3'h4)] : wire32[(1'h1):(1'h1)]) <<< $signed($signed({$unsigned(reg40)})));
              reg42 <= (+((^(|reg35[(4'h9):(3'h6)])) ?
                  (|((wire30 ? reg34 : reg40) ?
                      $unsigned(reg36) : $unsigned(reg38))) : {reg34[(5'h12):(4'hc)]}));
              reg43 <= (reg34 << $signed($signed({reg39[(2'h3):(2'h3)]})));
            end
          else
            begin
              reg40 <= reg38;
              reg41 <= wire31;
              reg42 <= reg38;
              reg43 <= {reg43[(1'h0):(1'h0)]};
            end
          if ((8'hac))
            begin
              reg44 <= (~$unsigned(((reg37[(5'h13):(3'h5)] ~^ wire31[(1'h0):(1'h0)]) ?
                  ({reg34} ?
                      (reg40 >>> reg41) : ((8'hb4) ?
                          wire32 : wire31)) : reg36)));
            end
          else
            begin
              reg44 <= (($unsigned(($unsigned(wire29) ?
                      $unsigned(wire29) : $signed(reg34))) ?
                  (+reg34[(3'h6):(2'h3)]) : reg34[(5'h12):(4'he)]) || $unsigned($unsigned(((reg43 ?
                  reg41 : reg41) || $signed(reg40)))));
            end
        end
      else
        begin
          reg33 <= ((($signed(((8'hb9) > wire29)) >>> reg44[(1'h0):(1'h0)]) ?
                  reg44 : (8'had)) ?
              reg39 : $unsigned((wire28[(2'h2):(1'h0)] ?
                  $unsigned(wire29[(2'h3):(1'h1)]) : ((reg42 ^~ wire29) ?
                      (~|reg41) : reg42[(3'h4):(3'h4)]))));
          if (reg43[(1'h1):(1'h1)])
            begin
              reg34 <= (((((wire31 - (8'hb3)) > (-reg44)) ?
                      $unsigned((~^(8'ha9))) : ($unsigned(wire30) <= $signed(wire28))) ?
                  ((!reg39) ?
                      reg36 : $unsigned($signed(reg36))) : $unsigned(((reg40 ?
                      reg39 : reg34) <= reg33))) ^ (wire32[(3'h6):(3'h5)] ?
                  (wire28[(4'hc):(2'h3)] ?
                      $signed((~wire28)) : ((reg38 ? reg35 : wire30) ?
                          $unsigned(reg39) : $signed(wire29))) : (((reg43 ?
                      (7'h44) : reg35) ^~ $unsigned(reg40)) && (~reg40))));
              reg35 <= wire29[(4'h9):(4'h8)];
              reg36 <= (^~(((~^$signed((8'hb2))) ?
                      wire31 : ($signed(wire32) <<< (^wire28))) ?
                  $unsigned((&(reg34 ?
                      reg43 : reg44))) : $unsigned(reg34[(5'h13):(4'hc)])));
              reg37 <= (~(&(($unsigned(reg37) == (reg41 == (8'ha9))) <<< reg34)));
              reg38 <= ($unsigned(wire30) != reg44[(1'h1):(1'h1)]);
            end
          else
            begin
              reg34 <= ({($unsigned({reg34, (7'h40)}) < reg33),
                      wire28[(1'h0):(1'h0)]} ?
                  ((~&(reg44[(1'h1):(1'h1)] << reg36[(1'h1):(1'h0)])) + reg35[(4'ha):(1'h0)]) : $unsigned((~(reg44[(2'h2):(1'h0)] - ((8'ha7) ?
                      reg37 : reg40)))));
              reg35 <= {reg41[(2'h3):(1'h0)], {reg33, reg34}};
              reg36 <= (~^reg44);
              reg37 <= {reg35};
            end
          reg39 <= (~^($signed(reg38[(1'h0):(1'h0)]) << wire29));
          if ({(|$signed(reg38))})
            begin
              reg40 <= $signed((&$unsigned(reg37)));
              reg41 <= reg35[(3'h5):(3'h5)];
              reg42 <= ($unsigned(((reg33[(3'h7):(1'h1)] ?
                      ((8'ha0) > wire30) : $signed(reg42)) ?
                  reg44[(3'h4):(1'h1)] : ($unsigned(reg33) ?
                      $signed(reg36) : (~reg40)))) && (reg44[(3'h5):(1'h0)] ?
                  (-$signed(reg37)) : ((&wire29) <= ((8'hac) >>> $signed(reg40)))));
              reg43 <= (($unsigned(($signed((8'hb3)) ?
                      (&(7'h42)) : $unsigned(reg33))) & $unsigned(reg37[(3'h5):(1'h0)])) ?
                  {wire30} : ((wire28[(1'h0):(1'h0)] ?
                          $signed({reg43, reg41}) : (reg40 ?
                              $unsigned(reg35) : (~(8'h9f)))) ?
                      (~$signed({wire29, reg42})) : (reg38 || (reg33 ?
                          $signed((7'h41)) : (reg40 <= reg34)))));
            end
          else
            begin
              reg40 <= $signed($signed($signed($signed($signed((8'hbc))))));
              reg41 <= ($unsigned($unsigned((~(reg36 <= reg34)))) ?
                  {(~|reg39[(1'h1):(1'h0)])} : (-reg42));
            end
        end
    end
  assign wire45 = {{$signed((+(wire31 <= reg34))),
                          $signed(($signed(reg38) >>> {wire30}))}};
  assign wire46 = (~|(($signed(((8'hbc) - reg40)) ~^ wire29[(4'hd):(4'hd)]) ?
                      $unsigned(reg36[(5'h14):(3'h7)]) : (($signed(wire28) ?
                          $signed(wire45) : $signed(reg34)) > $unsigned(reg35[(4'hb):(4'ha)]))));
  assign wire47 = $signed((-(^~((^~wire28) ?
                      reg44[(3'h7):(1'h0)] : (!reg43)))));
  assign wire48 = reg37[(3'h5):(2'h3)];
  assign wire49 = ({$signed(reg39[(3'h4):(1'h1)]),
                          $signed($unsigned($signed(wire46)))} ?
                      $unsigned({wire48[(4'h8):(3'h5)],
                          ((!reg42) - (~&wire32))}) : $unsigned((~|reg43[(3'h6):(3'h5)])));
  assign wire50 = {$unsigned((^reg34[(5'h12):(2'h2)]))};
  assign wire51 = ((reg38[(3'h6):(2'h3)] || (!$signed($signed(wire50)))) & reg44[(3'h6):(3'h6)]);
  assign wire52 = (-((((~|reg44) ?
                              (wire29 > reg39) : (wire29 ? wire47 : reg43)) ?
                          reg35[(4'h9):(1'h0)] : $signed((reg42 ?
                              reg43 : (8'ha7)))) ?
                      (~&reg35[(4'ha):(1'h0)]) : {{$signed(wire32)}}));
  assign wire53 = ((~^wire30[(4'ha):(4'ha)]) ?
                      $unsigned(reg40[(1'h1):(1'h1)]) : $unsigned(reg41));
  assign wire54 = (reg33 ?
                      (^((^~(wire50 != reg40)) == $signed((wire30 <= (8'haf))))) : ($unsigned((!wire53[(4'ha):(1'h1)])) || $signed(($signed(reg38) >= $unsigned(wire30)))));
  assign wire55 = $signed(((reg42[(1'h0):(1'h0)] ?
                      reg35[(3'h4):(2'h2)] : ($unsigned((8'hba)) ?
                          wire52[(4'hd):(3'h5)] : $unsigned(reg38))) >>> ((^(~|reg42)) ?
                      (reg38 < (wire48 ? wire54 : reg34)) : {(8'ha7)})));
  assign wire56 = $signed(wire54);
  always
    @(posedge clk) begin
      if (reg39)
        begin
          if ((reg33 << $unsigned(wire48[(4'he):(2'h3)])))
            begin
              reg57 <= ($signed(($unsigned((8'ha2)) > (8'hb0))) ?
                  $signed(reg40[(2'h2):(1'h1)]) : ($unsigned($unsigned($signed(wire52))) ?
                      wire46 : reg35));
              reg58 <= $unsigned(reg37);
              reg59 <= {$signed(reg37), {wire50, wire52}};
              reg60 <= {{reg35[(3'h4):(1'h0)], wire48[(4'ha):(3'h4)]}};
            end
          else
            begin
              reg57 <= (((((reg59 != reg40) >> $signed(reg57)) - (^(~&wire53))) ?
                  reg43[(1'h0):(1'h0)] : $signed(wire45[(4'hd):(4'h8)])) >= (((8'ha6) && reg36[(5'h10):(5'h10)]) <= (reg36 ~^ ((reg43 ?
                      reg41 : reg35) ?
                  reg38 : {wire55}))));
              reg58 <= ((!reg58) || (7'h40));
              reg59 <= $unsigned($signed(reg57[(3'h5):(1'h1)]));
            end
        end
      else
        begin
          if ($signed((|reg59)))
            begin
              reg57 <= $unsigned(((($unsigned(wire51) & reg40) ?
                  ((wire54 ~^ wire51) << ((8'haf) ?
                      (8'hae) : (8'hb3))) : reg42) >> (8'hac)));
              reg58 <= (~^$unsigned($signed($unsigned($unsigned(reg44)))));
              reg59 <= $unsigned($unsigned($unsigned((|(reg37 ?
                  reg59 : reg58)))));
              reg60 <= reg34[(2'h3):(1'h1)];
              reg61 <= $unsigned((($signed((reg42 ?
                  reg39 : reg59)) || wire50[(2'h3):(1'h0)]) * (-wire45[(3'h6):(2'h3)])));
            end
          else
            begin
              reg57 <= wire53[(3'h5):(1'h0)];
              reg58 <= reg58;
              reg59 <= ((-($unsigned(reg37) > ({reg44, wire50} ?
                      {wire28} : reg40[(3'h4):(1'h1)]))) ?
                  ((wire48[(3'h7):(2'h2)] != ($signed((8'hac)) ?
                      wire55[(1'h0):(1'h0)] : $signed(reg60))) && ((reg37[(3'h7):(2'h3)] ?
                      $signed(wire28) : $signed(reg38)) + ((wire31 > (8'h9e)) ~^ wire52[(4'h8):(3'h5)]))) : {$unsigned((wire56 ?
                          reg34 : wire30)),
                      $unsigned($unsigned((reg37 ? wire50 : wire53)))});
            end
        end
      if (reg58[(3'h7):(2'h2)])
        begin
          if ((reg40 <<< wire54[(1'h1):(1'h1)]))
            begin
              reg62 <= (($unsigned($unsigned($unsigned(wire45))) ?
                      (reg35 ?
                          (&((8'h9d) && (8'hb9))) : wire46[(2'h3):(2'h2)]) : ((|(~^wire32)) ?
                          $unsigned((reg36 ^ wire29)) : wire29[(4'h9):(1'h1)])) ?
                  wire28 : $signed($signed(wire31)));
              reg63 <= reg42[(1'h1):(1'h1)];
              reg64 <= ((wire47[(3'h5):(3'h4)] && ((~reg36) >>> ((-wire47) & wire46[(4'hb):(4'ha)]))) >= reg57);
            end
          else
            begin
              reg62 <= ($signed(reg41[(3'h6):(1'h0)]) >= (&reg43));
            end
        end
      else
        begin
          reg62 <= $unsigned(($unsigned({(~&wire55), $unsigned(wire53)}) ?
              (~$signed((reg39 ?
                  reg42 : wire53))) : ((~^$signed(wire52)) == wire53)));
        end
    end
  always
    @(posedge clk) begin
      reg65 <= ($signed(reg57[(2'h2):(2'h2)]) ?
          wire30 : (reg64[(3'h4):(2'h2)] != (reg58 >>> {(8'ha1), (|wire51)})));
      reg66 <= wire47[(1'h1):(1'h1)];
    end
  assign wire67 = reg43[(3'h5):(2'h3)];
  assign wire68 = {$unsigned(({(wire48 + reg37),
                          $unsigned(wire31)} && $unsigned((8'h9f))))};
  assign wire69 = (|(^((reg40[(3'h4):(3'h4)] != wire32) ?
                      ($signed(reg44) ?
                          (~|reg64) : $signed((7'h44))) : {{wire51, wire45}})));
  assign wire70 = $unsigned(wire32);
  assign wire71 = (!((+((reg38 ? wire46 : reg41) ?
                      reg39 : (-reg64))) ^~ wire29));
endmodule

module module147
#(parameter param178 = (&{({((8'hb0) ^ (8'ha0)), (|(8'h9f))} ? ({(8'hbb)} ? ((7'h43) ? (8'hbe) : (8'ha2)) : ((7'h40) <= (8'ha1))) : ((8'hb9) ? ((8'h9e) | (8'hbd)) : ((8'hbf) && (8'hbe))))}))
(y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire151;
  input wire [(4'ha):(1'h0)] wire150;
  input wire [(3'h4):(1'h0)] wire149;
  input wire [(4'he):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire [(5'h13):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire170;
  wire [(2'h3):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire [(4'h8):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 reg174,
                 reg173,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire152 = $signed($unsigned(wire150[(3'h5):(3'h4)]));
  assign wire153 = $signed({{wire151}, ($signed($signed(wire149)) >= wire148)});
  assign wire154 = (wire152[(1'h1):(1'h1)] ?
                       $signed($unsigned(wire151[(2'h3):(2'h3)])) : $signed((((~^wire150) - wire152) - (~|wire150))));
  assign wire155 = (7'h41);
  assign wire156 = wire155;
  assign wire157 = $unsigned(wire153[(4'h8):(3'h7)]);
  assign wire158 = {wire154[(4'h8):(2'h3)]};
  assign wire159 = wire158;
  assign wire160 = (wire149[(1'h0):(1'h0)] + $unsigned({$unsigned((~^wire149)),
                       $signed((-wire152))}));
  assign wire161 = $signed((7'h43));
  always
    @(posedge clk) begin
      if ((($unsigned((|(wire157 ?
          wire160 : (8'ha9)))) > wire149[(3'h4):(2'h3)]) >> {$signed($unsigned(wire153)),
          wire154}))
        begin
          reg162 <= $signed(wire157);
        end
      else
        begin
          reg162 <= $unsigned(wire161[(4'h9):(3'h4)]);
          if ($unsigned(wire157[(3'h6):(1'h0)]))
            begin
              reg163 <= $signed(wire153[(3'h5):(2'h3)]);
              reg164 <= $unsigned((^~($unsigned((~wire157)) ?
                  reg162[(4'h8):(2'h3)] : (-(wire160 < reg162)))));
              reg165 <= (^~$unsigned((-$unsigned(wire148))));
            end
          else
            begin
              reg163 <= {{$unsigned(wire156[(3'h4):(2'h3)])}};
              reg164 <= wire154[(4'hc):(3'h7)];
              reg165 <= {reg163};
            end
          reg166 <= ((+(wire154[(4'hf):(3'h6)] != ({wire153, wire153} ?
                  (8'h9d) : {wire156, wire159}))) ?
              $signed(({wire149} ?
                  $unsigned($unsigned(wire153)) : (wire159[(4'h8):(1'h1)] << $unsigned(wire161)))) : $unsigned(wire154));
        end
      reg167 <= reg166;
    end
  assign wire168 = (-wire157[(3'h5):(3'h4)]);
  assign wire169 = (7'h41);
  assign wire170 = ($unsigned((^~wire157[(1'h0):(1'h0)])) * {wire149});
  assign wire171 = (~|(reg164[(4'h9):(1'h1)] != ($unsigned($signed(wire154)) ?
                       reg162 : (wire161[(4'hd):(4'hc)] ?
                           reg166[(5'h13):(3'h5)] : (~|wire155)))));
  assign wire172 = $unsigned({((^~wire153[(4'he):(4'h8)]) ^ $unsigned($signed(wire148))),
                       $unsigned((^((8'h9f) ? reg165 : wire153)))});
  always
    @(posedge clk) begin
      reg173 <= $unsigned(((&wire154[(5'h10):(4'hd)]) ?
          wire149 : reg162[(3'h4):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg174 <= $unsigned($signed((!$signed(wire172[(2'h2):(1'h0)]))));
    end
  assign wire175 = (($signed(reg167) - reg164[(1'h1):(1'h1)]) << ($unsigned(reg164) ?
                       (({wire150,
                           wire148} + reg166[(3'h4):(1'h0)]) && reg164[(3'h7):(1'h0)]) : (((~&wire158) ?
                           ((8'ha8) <<< (8'ha1)) : $unsigned(reg173)) == {{wire155}})));
  assign wire176 = wire158;
  assign wire177 = $unsigned(wire169);
endmodule

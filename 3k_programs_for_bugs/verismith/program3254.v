module top
#(parameter param141 = ((({(^(8'hbb))} >>> (8'hbe)) ^~ (({(8'hae), (8'ha6)} ? ((8'ha0) ? (8'ha0) : (8'hb1)) : (~(8'hbc))) + (!{(8'hb7), (8'had)}))) ? ((~|((~(7'h40)) <= (~(8'ha6)))) ? {(8'hb4)} : (((!(8'ha0)) ? ((8'hbc) != (8'hb6)) : ((8'hab) ? (8'hb8) : (8'hbd))) ? ((~|(8'hb4)) ? ((8'hb1) >>> (8'hbb)) : ((8'hab) | (8'ha2))) : ((+(8'hb5)) ? ((8'hb2) ? (8'ha7) : (8'hbd)) : ((8'ha1) < (8'h9d))))) : ((~^(^~(8'had))) ? (({(7'h43), (8'ha7)} ? ((7'h41) ? (8'hb2) : (8'hb8)) : {(8'hb2), (8'hab)}) - (~((8'ha5) ? (8'hb5) : (8'h9c)))) : (-((+(8'hac)) + ((7'h41) ? (8'haf) : (8'hbf)))))), 
parameter param142 = (((^~(+{param141})) ? (^(&((8'hb5) ? param141 : param141))) : param141) >= (-(8'hbb))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire134;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire50,
                 wire48,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire8,
                 wire7,
                 wire6,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~^{(^{(^wire2)})});
    end
  assign wire6 = wire2;
  assign wire7 = $unsigned((^~(&wire1)));
  assign wire8 = (wire3[(4'ha):(3'h5)] ?
                     wire1[(2'h3):(2'h2)] : (($signed($signed(wire3)) > (~&$signed(wire1))) ^~ reg5[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg9 <= wire2;
      if ((^~($signed(((wire4 <<< wire3) <= (~(8'ha3)))) && (!$unsigned((reg9 ?
          wire6 : (8'h9c)))))))
        begin
          reg10 <= (wire2 ^~ {(^(!(|wire7))), (~(!(wire2 | wire6)))});
          if ($unsigned($signed(wire8)))
            begin
              reg11 <= (8'hba);
              reg12 <= $unsigned((+{(|$unsigned(wire8))}));
            end
          else
            begin
              reg11 <= ((^~$unsigned({((8'ha9) ? wire8 : reg12),
                      (wire3 * wire6)})) ?
                  {$signed(($signed(wire6) > $unsigned(wire0))),
                      (wire3 + (wire6 ^~ {wire7}))} : $signed((wire7 <<< reg12[(3'h4):(1'h0)])));
              reg12 <= wire6;
            end
        end
      else
        begin
          reg10 <= (-$signed((wire4[(5'h13):(5'h12)] > wire2)));
          reg11 <= $unsigned((!reg12[(2'h2):(2'h2)]));
        end
      reg13 <= (8'ha9);
      reg14 <= (~&{{wire7, $signed((^(8'hac)))}});
      reg15 <= reg12;
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire2)))
        begin
          if (wire6[(1'h0):(1'h0)])
            begin
              reg16 <= {(($signed((wire2 ? wire2 : wire2)) ?
                          (~|wire3) : wire6) ?
                      $unsigned((^~((7'h41) ?
                          wire0 : wire6))) : ($signed(wire7[(5'h14):(5'h13)]) ?
                          reg12 : $signed(wire4)))};
              reg17 <= reg16;
            end
          else
            begin
              reg16 <= (reg13[(1'h1):(1'h1)] ?
                  $unsigned(($signed(wire8[(4'h8):(3'h4)]) && (~&(+wire3)))) : (-$signed(((~^reg13) ?
                      reg11[(4'hc):(4'h9)] : (wire6 ? (8'hb7) : wire0)))));
              reg17 <= reg12;
              reg18 <= $unsigned($signed(wire3));
              reg19 <= wire8[(5'h11):(3'h4)];
              reg20 <= (8'hbd);
            end
          reg21 <= (wire3 ^ $unsigned((~&(!wire6[(3'h4):(3'h4)]))));
          reg22 <= $signed(reg21[(1'h0):(1'h0)]);
          if ($unsigned({wire6, (~&$unsigned(reg22))}))
            begin
              reg23 <= {($unsigned(wire2) | (~&((wire6 ?
                      reg9 : reg20) <= (7'h43)))),
                  (reg13[(1'h1):(1'h1)] ^~ reg15[(3'h7):(3'h5)])};
            end
          else
            begin
              reg23 <= (!wire0);
              reg24 <= ($unsigned(($signed(reg18[(4'ha):(2'h3)]) < $signed((reg14 + (8'hb0))))) >>> $signed(({(wire0 ?
                      reg9 : reg15),
                  (&reg20)} <<< $signed(wire7))));
              reg25 <= (($signed(($unsigned(reg5) ?
                      wire6[(3'h5):(3'h4)] : reg16[(3'h6):(3'h5)])) | (^reg12)) ?
                  {$unsigned((reg16 ?
                          $unsigned(reg24) : (^~wire0)))} : wire2[(2'h2):(1'h0)]);
              reg26 <= (~^{$unsigned($signed(reg5[(2'h2):(2'h2)])),
                  reg9[(2'h3):(2'h3)]});
            end
          reg27 <= reg5[(3'h5):(2'h2)];
        end
      else
        begin
          reg16 <= (({reg5[(4'h8):(3'h4)]} & ($signed($unsigned(reg17)) ?
                  ($unsigned(reg10) ?
                      ((7'h41) | reg23) : reg18[(4'he):(4'he)]) : (-$unsigned(reg9)))) ?
              wire4 : wire3);
        end
      if ($signed(wire1))
        begin
          reg28 <= $unsigned(reg22[(1'h1):(1'h1)]);
          reg29 <= ($unsigned(reg28[(1'h1):(1'h0)]) ^ $unsigned(wire2[(1'h0):(1'h0)]));
          reg30 <= (^(^~reg13[(1'h1):(1'h0)]));
        end
      else
        begin
          reg28 <= $signed($signed($signed(reg26)));
          reg29 <= $unsigned(wire4);
          reg30 <= {$unsigned((|{$unsigned(reg17),
                  ((8'ha4) ? reg14 : (8'ha2))}))};
        end
    end
  assign wire31 = (wire8[(5'h12):(1'h0)] ^ wire3[(3'h6):(1'h0)]);
  assign wire32 = ($signed($unsigned(wire7)) >> reg15[(1'h1):(1'h1)]);
  assign wire33 = reg13;
  assign wire34 = $signed((^~({$unsigned(wire4), (reg16 < (7'h41))} ?
                      $signed((-wire4)) : ($unsigned((8'hbb)) ?
                          $unsigned(wire8) : (&reg15)))));
  module35 #() modinst49 (wire48, clk, reg13, reg21, reg18, reg28);
  assign wire50 = $unsigned(reg25[(3'h4):(1'h1)]);
  module51 #() modinst135 (wire134, clk, reg23, wire50, reg26, wire34);
  assign wire136 = $unsigned({($signed((^reg13)) ?
                           (reg29 ?
                               (!wire31) : ((7'h44) ?
                                   reg14 : wire3)) : ((^~wire50) ?
                               reg30 : reg22[(3'h4):(2'h3)]))});
  assign wire137 = $signed(wire33[(2'h2):(1'h1)]);
  assign wire138 = reg25;
  assign wire139 = $unsigned(((($unsigned(wire34) ?
                           $signed((8'ha1)) : wire136) ?
                       (8'ha9) : (&{(8'hb4), wire3})) + (|reg20)));
  assign wire140 = ($signed(reg21[(2'h2):(1'h0)]) ?
                       ($unsigned(wire137) ^ (8'hbb)) : $signed(wire138[(4'ha):(3'h5)]));
endmodule

module module51
#(parameter param133 = (~|((((^(8'haf)) ? {(8'h9c)} : ((8'ha6) ? (8'hbe) : (8'h9e))) >>> (-((8'hb8) ~^ (8'ha6)))) ? (+(^((8'ha8) ? (8'hbd) : (8'ha9)))) : (((~^(8'hae)) ? {(8'hb2), (8'ha7)} : (~^(8'haa))) ? (~|(|(8'h9f))) : (((8'hb4) ? (8'hbd) : (8'hbf)) ? ((8'hab) >>> (8'h9d)) : ((8'hb3) < (8'had)))))))
(y, clk, wire52, wire53, wire54, wire55);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire52;
  input wire signed [(3'h6):(1'h0)] wire53;
  input wire signed [(3'h4):(1'h0)] wire54;
  input wire [(5'h15):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire83;
  reg [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire86,
                 wire85,
                 wire56,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire83,
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
                 reg57,
                 (1'h0)};
  assign wire56 = ((&wire52[(4'h9):(3'h4)]) < wire54);
  always
    @(posedge clk) begin
      reg57 <= wire52;
    end
  assign wire58 = ((+(reg57 != wire55[(3'h7):(2'h2)])) || wire53[(2'h3):(2'h2)]);
  assign wire59 = ((8'ha9) - (+$signed(wire55)));
  assign wire60 = wire59;
  assign wire61 = ((^wire60[(3'h4):(3'h4)]) && wire59);
  assign wire62 = ((wire58[(2'h3):(2'h2)] ?
                          (wire59[(1'h0):(1'h0)] ?
                              $unsigned(wire52) : wire61[(1'h0):(1'h0)]) : wire58) ?
                      ((8'hbb) ?
                          ($unsigned(reg57) | (!(-wire55))) : (((wire59 ^~ wire54) >> (wire60 >>> (8'h9f))) != ({wire56,
                              wire54} ~^ wire58))) : {(-($signed((8'hb9)) ?
                              (&(8'hbd)) : (~^reg57)))});
  module63 #() modinst84 (.wire68(wire56), .wire66(wire58), .y(wire83), .wire65(wire61), .clk(clk), .wire64(wire55), .wire67(wire62));
  assign wire85 = wire52;
  assign wire86 = wire55;
  module87 #() modinst110 (.wire88(wire61), .clk(clk), .wire89(wire52), .y(wire109), .wire91(wire58), .wire90(wire83));
  assign wire111 = $signed(((reg57[(3'h7):(3'h6)] ^~ $signed(wire58[(3'h6):(1'h1)])) < wire85));
  assign wire112 = wire53[(2'h2):(2'h2)];
  assign wire113 = $unsigned((^{wire60, $unsigned((~reg57))}));
  assign wire114 = wire83;
  assign wire115 = (&wire112[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg116 <= {(+wire62)};
      if ($unsigned($unsigned(wire60[(4'h8):(2'h3)])))
        begin
          reg117 <= wire60[(2'h2):(2'h2)];
          if (((8'h9c) ? reg116 : (wire53 ? wire86[(5'h11):(2'h3)] : wire114)))
            begin
              reg118 <= wire55[(5'h10):(3'h4)];
              reg119 <= reg57[(1'h0):(1'h0)];
              reg120 <= $signed((!(reg116[(5'h10):(4'hd)] <<< {$unsigned(reg118)})));
            end
          else
            begin
              reg118 <= $unsigned(wire53);
              reg119 <= (($unsigned(((8'h9e) ?
                  (wire83 || (8'hb8)) : wire60)) | (wire115 << (wire59[(1'h1):(1'h1)] < wire112[(2'h2):(1'h0)]))) ^~ (wire109[(4'h8):(3'h6)] ?
                  (^(-$signed(wire54))) : {($unsigned(wire55) << wire53[(1'h0):(1'h0)])}));
            end
          reg121 <= $signed(wire52[(4'he):(4'he)]);
        end
      else
        begin
          reg117 <= (~|$signed(((~&((8'h9e) * wire59)) ?
              reg57[(3'h4):(1'h0)] : (^~$signed(reg57)))));
          reg118 <= $signed(($signed(wire52[(4'hc):(1'h1)]) & $signed((-(wire61 & wire58)))));
          if (wire109[(3'h4):(1'h0)])
            begin
              reg119 <= wire85[(5'h11):(2'h2)];
              reg120 <= wire112;
              reg121 <= ((^~wire62[(2'h3):(2'h2)]) ?
                  ($unsigned(wire53) > ($signed(reg121) >> $signed(reg121))) : (~^$signed(reg121)));
            end
          else
            begin
              reg119 <= $signed(wire55);
              reg120 <= $unsigned(($signed((8'hac)) != $unsigned({$signed(wire111)})));
              reg121 <= wire56;
              reg122 <= (^(^$signed(((reg116 ? reg119 : (8'hab)) != ((7'h43) ?
                  wire61 : reg116)))));
            end
          if ({($signed(((wire58 ? reg121 : reg117) ?
                      (8'hac) : {wire58, reg117})) ?
                  $signed($signed((wire109 ?
                      wire109 : wire114))) : {$signed({wire59, reg57}),
                      $signed({wire58})})})
            begin
              reg123 <= reg119[(5'h10):(1'h1)];
              reg124 <= ({((8'hb6) ?
                          $unsigned((wire55 * reg123)) : $unsigned($unsigned((8'h9e))))} ?
                  (7'h44) : (wire112 ?
                      (($signed(reg120) ?
                          $signed(reg117) : $unsigned(wire58)) & reg120) : ((~$unsigned(wire83)) < (wire86 * $unsigned(wire114)))));
            end
          else
            begin
              reg123 <= {(($unsigned($unsigned(wire114)) >= wire111[(1'h0):(1'h0)]) ?
                      wire55 : reg116[(3'h7):(2'h2)]),
                  $unsigned((~reg121[(3'h5):(3'h4)]))};
              reg124 <= (~$signed((-(+wire109))));
              reg125 <= $signed($signed(wire113));
              reg126 <= (^~($unsigned(reg57[(1'h0):(1'h0)]) ?
                  $unsigned({$signed(wire62),
                      wire56[(4'ha):(2'h3)]}) : (~|wire55)));
            end
        end
      reg127 <= reg119;
      reg128 <= reg120[(4'ha):(1'h0)];
    end
  assign wire129 = $signed((wire58 < (^((!wire85) ^~ (~|wire112)))));
  assign wire130 = wire55[(4'h9):(2'h3)];
  assign wire131 = (($signed(($unsigned(reg122) * {(8'h9e)})) * (reg122[(1'h0):(1'h0)] ?
                       wire111 : $unsigned($unsigned(wire129)))) | ((8'hb6) << (reg126[(3'h4):(2'h3)] ?
                       ((wire58 <<< wire111) ?
                           {wire85} : ((7'h43) ?
                               wire129 : wire53)) : $signed($signed(wire56)))));
  assign wire132 = $signed(wire53[(2'h3):(1'h1)]);
endmodule

module module35
#(parameter param47 = ((((((7'h44) ? (8'h9e) : (8'ha6)) && (~(8'hae))) ? {(&(8'had)), ((8'haf) ~^ (8'hb7))} : {{(8'ha2), (8'h9e)}, {(8'hac)}}) ? (((~^(8'ha2)) ? {(8'ha1), (8'ha3)} : ((8'hb4) ? (8'hb7) : (8'hba))) ? (&((8'hac) ? (8'hb2) : (7'h40))) : ((&(8'hb0)) ^~ ((8'hb0) != (8'ha7)))) : ((~^(8'hb7)) ? {((8'ha1) ? (8'ha0) : (8'hab))} : (&((8'ha3) ~^ (8'hb3))))) >>> ((^~(~|((8'ha4) ? (8'hba) : (8'hae)))) ? ((~{(8'ha1), (8'h9c)}) ? ({(7'h41), (8'ha8)} ^~ (8'hb8)) : ((!(7'h42)) ~^ ((8'hb0) ? (8'haf) : (8'hbe)))) : ((!{(8'had)}) ? (~|((8'hbe) ^~ (8'ha9))) : (&((7'h42) ? (8'hb8) : (7'h42)))))))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(3'h5):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire40;
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire46, wire45, wire44, wire40, reg43, reg42, reg41, (1'h0)};
  assign wire40 = $unsigned((~^(~|$signed((wire36 ^ (8'hb5))))));
  always
    @(posedge clk) begin
      reg41 <= $unsigned($unsigned({wire38,
          (wire37 ? (wire37 ? wire38 : wire40) : (^~(8'hbb)))}));
      reg42 <= ((&reg41[(5'h14):(4'hf)]) >= wire38[(2'h3):(2'h2)]);
      reg43 <= ($unsigned(($signed((wire37 - (8'hb3))) && wire38)) ?
          $unsigned($signed($signed((wire37 ?
              wire38 : (8'hbd))))) : (reg42[(3'h5):(3'h4)] ^ reg42[(4'h9):(3'h6)]));
    end
  assign wire44 = $signed($unsigned((|($unsigned((8'h9d)) ?
                      (wire36 & reg41) : (8'hbc)))));
  assign wire45 = wire36[(3'h5):(2'h2)];
  assign wire46 = wire38[(2'h3):(1'h0)];
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire91;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  input wire [(3'h4):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire98,
                 wire97,
                 reg106,
                 reg100,
                 reg99,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg92 <= {({($unsigned(wire88) != $signed((7'h43)))} ^ $unsigned(($unsigned((8'h9c)) ?
              (~|wire91) : (wire89 ? wire91 : (8'hb7)))))};
      if ((reg92 && (^((|reg92) - wire91))))
        begin
          reg93 <= $unsigned({$signed(($unsigned(reg92) ?
                  (&wire88) : $signed(wire89))),
              $unsigned($signed((wire90 ? wire91 : wire89)))});
        end
      else
        begin
          reg93 <= wire91[(1'h0):(1'h0)];
          if ({$unsigned((&(8'hbd))),
              ((wire89[(2'h3):(1'h1)] ?
                  $unsigned(((8'hbb) ~^ wire91)) : (8'hbd)) << $unsigned(reg92[(2'h2):(1'h0)]))})
            begin
              reg94 <= (&($signed((8'h9d)) | wire91));
            end
          else
            begin
              reg94 <= $unsigned((reg94 + (8'hbd)));
              reg95 <= $unsigned($signed($signed((8'ha1))));
              reg96 <= wire91[(4'ha):(1'h0)];
            end
        end
    end
  assign wire97 = ($unsigned((((reg96 >= wire88) ?
                              $unsigned((8'hba)) : (reg95 != reg94)) ?
                          (-(reg94 ? reg92 : (8'hb8))) : (~&{reg96}))) ?
                      $signed((~^$unsigned((+reg95)))) : (wire89 <= wire88[(2'h3):(1'h0)]));
  assign wire98 = $signed(reg95);
  always
    @(posedge clk) begin
      reg99 <= reg93;
      reg100 <= ((({{wire98, wire97}} ?
              ((8'hb3) > (reg96 ^~ reg96)) : $unsigned(wire88)) ?
          $signed(wire98[(3'h6):(3'h5)]) : (&reg99[(1'h0):(1'h0)])) >>> ($unsigned(((~|reg92) ?
          ((8'hab) | wire98) : (~|wire88))) + ((~|$unsigned(wire90)) + (reg94[(3'h6):(3'h5)] ?
          (+wire98) : (reg93 ^ wire88)))));
    end
  assign wire101 = (({{{wire89},
                               (wire90 ? (8'hbf) : wire91)}} < $signed(reg95)) ?
                       {(~reg92),
                           wire89[(1'h0):(1'h0)]} : $signed((!(~^(~reg92)))));
  assign wire102 = $signed($unsigned((^~$signed($signed(wire91)))));
  assign wire103 = (wire101[(1'h1):(1'h1)] ?
                       {($unsigned($signed(wire91)) ?
                               (reg96[(1'h0):(1'h0)] ?
                                   reg93 : (wire88 << reg92)) : wire90[(3'h6):(3'h4)])} : ({$unsigned((reg96 << (8'ha8))),
                               (~&reg94)} ?
                           $signed($signed(wire90[(3'h4):(1'h0)])) : (&$unsigned({wire88,
                               wire97}))));
  assign wire104 = (8'ha8);
  assign wire105 = $signed((~&{$unsigned(reg94[(4'h8):(3'h5)]),
                       $signed(wire97[(5'h10):(5'h10)])}));
  always
    @(posedge clk) begin
      reg106 <= (8'hb0);
    end
  assign wire107 = $signed($signed(reg95[(3'h4):(1'h1)]));
  assign wire108 = $signed($signed(reg92));
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire68;
  input wire [(2'h2):(1'h0)] wire67;
  input wire signed [(5'h14):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg77,
                 reg76,
                 reg75,
                 reg70,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg69 <= wire67[(1'h0):(1'h0)];
      reg70 <= $unsigned($unsigned(reg69));
    end
  assign wire71 = ($unsigned((!$unsigned((wire67 ? wire68 : wire65)))) ?
                      $unsigned(wire64) : wire66[(2'h2):(1'h1)]);
  assign wire72 = $unsigned((|(-wire68)));
  assign wire73 = wire65[(4'h8):(3'h4)];
  assign wire74 = wire71;
  always
    @(posedge clk) begin
      reg75 <= $signed(($unsigned($signed((wire67 >>> reg70))) + (~^wire64[(3'h7):(1'h1)])));
      reg76 <= $unsigned((~|((&(&reg69)) ~^ $unsigned($signed(wire66)))));
      reg77 <= ((reg69 ?
          (wire73 ?
              ($unsigned(reg76) | (^reg69)) : $signed((wire65 ?
                  reg70 : wire64))) : {$signed((wire72 ? wire64 : wire73)),
              ((reg69 ? reg70 : wire68) ^~ (wire72 ^~ wire64))}) >>> reg75);
    end
  assign wire78 = (wire66[(3'h7):(2'h3)] ?
                      ((reg77[(4'h9):(3'h7)] ?
                              reg70[(1'h1):(1'h0)] : (+$signed(wire65))) ?
                          ($unsigned($signed((8'hb6))) < wire65) : {reg75}) : wire65[(2'h2):(2'h2)]);
  assign wire79 = $signed($unsigned({$unsigned(wire72),
                      (wire67[(1'h0):(1'h0)] ?
                          {wire74, wire64} : wire68[(4'he):(2'h2)])}));
  assign wire80 = reg70;
  assign wire81 = wire78;
  assign wire82 = ($signed((^~((reg75 ?
                      wire72 : reg69) * wire80[(3'h7):(3'h4)]))) != (reg76 >= (~$unsigned((reg70 ?
                      wire80 : wire64)))));
endmodule

module top
#(parameter param73 = ({{(((8'hb3) >> (8'haa)) ? ((8'hbc) ? (8'ha9) : (7'h43)) : {(8'hb4), (8'hab)}), (((7'h41) ? (8'ha3) : (8'ha2)) ? ((8'hb6) ? (8'hbb) : (7'h44)) : (~^(8'hbd)))}} ? (((!(~(8'hac))) ? (((8'ha9) != (8'h9c)) == {(8'haf), (8'ha5)}) : {((8'hae) ? (8'hac) : (8'hac)), (~(7'h43))}) ? {{{(8'hb9), (8'hb8)}, ((8'hb5) >>> (7'h43))}} : (((&(8'ha7)) ^~ (^~(8'haf))) > ((~(8'ha5)) ? (8'h9c) : ((8'h9d) ? (7'h41) : (8'ha5))))) : (({(&(8'hbb)), ((7'h42) ^ (8'hb0))} || {((8'hbb) ^~ (8'hbc))}) < (~&(~|(~^(8'hb4)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire69;
  assign y = {wire72, wire71, wire5, wire69, (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  module6 #() modinst70 (.wire9(wire5), .wire11(wire4), .wire10(wire3), .wire8(wire0), .wire7(wire2), .clk(clk), .y(wire69));
  assign wire71 = (({($unsigned(wire69) * $signed(wire5)), (&$signed(wire5))} ?
                          $signed($unsigned((~|wire1))) : ((+$signed((8'hb8))) <<< (8'hbf))) ?
                      (($signed((wire2 ? wire5 : wire4)) ?
                              (!wire1) : $unsigned((wire1 == wire69))) ?
                          {wire5,
                              (((8'hb2) >> wire5) ?
                                  $unsigned(wire4) : (wire5 - wire3))} : wire0) : (+(((wire5 >= wire69) ?
                          (wire5 ? wire69 : (8'h9e)) : ((8'ha5) ?
                              wire5 : wire2)) <= (wire1[(3'h5):(1'h1)] ?
                          wire4[(4'ha):(3'h6)] : ((8'hbc) >> wire2)))));
  assign wire72 = wire71[(1'h1):(1'h1)];
endmodule

module module6
#(parameter param68 = (({{((8'hbc) ? (8'hb1) : (8'hbd)), ((7'h40) ^ (8'hb4))}} != ((&((8'ha6) || (8'hac))) ? (((8'h9f) ? (7'h41) : (8'h9f)) ? ((8'hbd) || (8'hb6)) : (~&(8'hb6))) : (((8'h9f) | (7'h44)) << ((8'h9f) ? (8'hbd) : (8'hae))))) >= ((({(8'hbc), (8'hb7)} ? (~^(8'had)) : (8'ha8)) ? (7'h43) : (((8'haf) || (8'ha8)) ? ((8'ha1) > (8'hab)) : ((8'ha8) * (8'ha5)))) ? (-(((7'h40) ? (8'hbe) : (8'hb6)) ? (7'h42) : ((8'hba) ? (8'hbb) : (8'hb4)))) : ((7'h40) <<< (((7'h41) ? (8'haa) : (8'h9d)) && ((8'ha7) || (8'hb7)))))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire26;
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire66,
                 wire26,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (wire7[(4'hf):(3'h5)] ^~ wire10);
      if ((~wire7))
        begin
          reg13 <= wire10;
          reg14 <= (|(~reg13[(1'h0):(1'h0)]));
          reg15 <= reg14[(4'he):(4'he)];
        end
      else
        begin
          reg13 <= ({(wire9[(2'h2):(1'h1)] <<< {$unsigned(reg13)}),
              reg12[(4'hb):(3'h7)]} >>> (-(reg12 << wire8[(4'he):(4'hd)])));
        end
      reg16 <= (reg15[(4'hc):(3'h6)] ?
          reg14[(4'hc):(2'h3)] : wire9[(3'h7):(3'h4)]);
    end
  always
    @(posedge clk) begin
      if ({(8'ha7),
          (($unsigned({reg13}) ?
              $unsigned(((8'hb2) << reg16)) : (~^$unsigned(wire11))) & (reg16 <<< $unsigned({reg12,
              wire10})))})
        begin
          reg17 <= $unsigned((reg16 ?
              ((reg15 ? $signed(reg16) : reg12) ?
                  $signed(reg15[(3'h4):(1'h0)]) : $unsigned($unsigned((8'hab)))) : $signed((!$unsigned((8'hb0))))));
          reg18 <= $unsigned(wire8);
          reg19 <= {$signed(reg16[(4'hc):(4'ha)])};
          reg20 <= ($signed({((wire8 ^ wire7) * reg19[(2'h3):(2'h3)]),
                  $unsigned(reg16[(4'h9):(3'h6)])}) ?
              ((|(wire11[(2'h2):(1'h0)] ?
                      (wire7 ? wire8 : reg19) : $unsigned(wire8))) ?
                  (~&(&(wire11 ~^ reg17))) : wire10[(2'h2):(1'h0)]) : $unsigned($unsigned(wire10)));
        end
      else
        begin
          if ($unsigned(((reg15[(2'h2):(1'h0)] ?
              reg13 : wire10) > $signed(($signed((8'had)) == wire9[(3'h7):(2'h3)])))))
            begin
              reg17 <= $unsigned(($signed($signed(((8'h9f) ?
                      reg18 : (8'hbc)))) ?
                  ((^~(8'hbc)) ?
                      $signed(reg19) : $unsigned((+wire11))) : ($unsigned({wire10,
                          reg18}) ?
                      reg13[(1'h1):(1'h1)] : ((reg17 ?
                          (8'hab) : wire8) != reg13[(1'h0):(1'h0)]))));
              reg18 <= (!$signed($signed(({reg14} ?
                  $signed(reg18) : (reg18 ? wire9 : wire8)))));
            end
          else
            begin
              reg17 <= $signed(((-(-$unsigned(wire9))) >= reg14));
            end
          if (($unsigned(reg20[(3'h5):(3'h5)]) ?
              ({((8'haf) >>> wire8[(5'h11):(3'h7)])} ?
                  (~^reg13) : $signed({((7'h42) > wire7)})) : reg19[(3'h4):(2'h2)]))
            begin
              reg19 <= ((^~$unsigned(reg20[(2'h3):(1'h0)])) ? reg14 : wire8);
              reg20 <= $unsigned(reg19);
              reg21 <= (({((reg20 ? wire11 : (8'hbc)) ?
                      (reg19 ? (8'hba) : reg15) : reg18),
                  (reg20[(3'h7):(1'h1)] ?
                      $signed(wire10) : $signed((8'hbb)))} * reg19[(4'h8):(3'h4)]) && (($unsigned(reg19) ?
                      (reg20 ?
                          (wire11 << (8'hb4)) : (reg16 | reg15)) : $unsigned((reg19 ?
                          reg16 : reg18))) ?
                  {(reg16 ? (~wire11) : (reg20 <= reg12)),
                      (wire11 <= $signed(wire11))} : ($unsigned($signed(wire10)) ?
                      ((^~reg13) >> $unsigned(reg20)) : $signed({reg15,
                          (8'hbe)}))));
            end
          else
            begin
              reg19 <= (~&({($signed((8'ha9)) | $unsigned(reg19)),
                  ($signed(reg21) | $signed(reg16))} ^ (^reg14[(4'ha):(3'h4)])));
              reg20 <= reg19;
              reg21 <= $signed({reg14[(5'h12):(3'h5)],
                  ((^wire10) > ((~&(8'hb8)) < wire11[(3'h6):(1'h1)]))});
              reg22 <= ($signed($signed((~$unsigned(wire7)))) ?
                  {wire10[(2'h2):(1'h0)]} : ((((reg14 ?
                      (8'hb3) : reg17) >= wire7[(3'h4):(2'h2)]) >>> $signed(reg16)) || $signed($signed($unsigned(reg15)))));
            end
          reg23 <= (reg16 ?
              {wire8[(3'h5):(2'h3)]} : $unsigned(wire8[(5'h10):(4'hb)]));
        end
      reg24 <= reg17[(4'hb):(3'h6)];
      reg25 <= $signed((reg17 << reg18));
    end
  assign wire26 = ($signed(reg24[(2'h3):(1'h1)]) ? $signed(reg20) : (^~wire7));
  module27 #() modinst67 (.y(wire66), .wire29(reg23), .wire31(reg22), .wire30(reg16), .clk(clk), .wire28(reg13));
endmodule

module module27
#(parameter param65 = (~|((((^(8'hb7)) ? ((8'hb1) >= (8'ha3)) : ((8'hb6) ? (8'haf) : (8'hb1))) <= (((8'ha1) ? (8'haa) : (8'ha7)) ? {(8'hae), (8'hba)} : ((8'hb3) << (8'haf)))) * (((^(8'hae)) >> ((8'ha4) ? (8'hb7) : (8'ha7))) ^~ (~|(-(8'hab)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  assign y = {wire62,
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
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg64,
                 reg63,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= wire30;
    end
  assign wire33 = ($signed((~|wire31[(4'ha):(2'h3)])) ?
                      wire28 : (wire28 == (&((wire31 ? wire29 : (8'hb2)) ?
                          wire30 : wire30))));
  assign wire34 = {$unsigned($unsigned($signed(wire31)))};
  assign wire35 = $signed(($signed($signed(wire30[(4'h9):(3'h6)])) <= $unsigned(reg32[(2'h3):(1'h0)])));
  assign wire36 = ($unsigned((&wire28)) ?
                      ($unsigned(($signed((8'h9f)) <<< wire28[(4'hc):(4'h9)])) ^ $signed(wire34[(4'h8):(3'h5)])) : {$unsigned(wire31[(4'ha):(2'h2)]),
                          ((wire33[(3'h4):(2'h3)] ^~ (wire31 && (8'h9e))) ?
                              (~^(wire28 ? reg32 : wire35)) : (((8'hb8) ?
                                      wire30 : (8'hbc)) ?
                                  ((8'hb1) << wire33) : ((8'hbb) ?
                                      wire31 : wire29)))});
  assign wire37 = $unsigned($signed(wire35));
  assign wire38 = $unsigned($signed($signed({(wire34 && wire30),
                      $unsigned(wire34)})));
  assign wire39 = $unsigned((^~$unsigned($signed({wire31}))));
  always
    @(posedge clk) begin
      reg40 <= (-(&(~^(!$unsigned(wire29)))));
      reg41 <= ($signed((8'hb0)) ?
          wire30 : ((((wire29 >= reg32) | {wire37}) ?
                  $signed({wire30,
                      wire36}) : (wire37[(4'hb):(1'h1)] * wire31[(3'h4):(2'h3)])) ?
              reg32[(1'h0):(1'h0)] : ($signed({reg32}) ?
                  wire30[(3'h7):(1'h0)] : wire29[(4'ha):(1'h0)])));
      reg42 <= {$unsigned({((wire31 ? wire28 : reg40) * (wire33 >>> wire29)),
              ((wire35 ? reg40 : reg32) || wire30[(1'h1):(1'h0)])})};
      reg43 <= reg40[(1'h0):(1'h0)];
      reg44 <= $signed((reg40 || (~&(~|(wire39 - wire34)))));
    end
  assign wire45 = wire38[(3'h4):(1'h1)];
  assign wire46 = $unsigned(($signed(wire31) ?
                      $signed(((wire28 ?
                          reg32 : wire30) & (!wire33))) : wire31[(2'h3):(1'h0)]));
  assign wire47 = (~{({reg32[(1'h0):(1'h0)]} ?
                          $signed(reg43[(2'h3):(2'h3)]) : $unsigned(wire29[(4'he):(4'h9)]))});
  assign wire48 = $signed((reg32 ? $signed((-wire30)) : wire39));
  assign wire49 = (+wire29[(5'h11):(4'he)]);
  assign wire50 = reg43[(1'h0):(1'h0)];
  assign wire51 = $signed({$unsigned($signed($unsigned(wire46))), wire29});
  assign wire52 = (({{reg32[(2'h2):(1'h0)]}} + ((((8'hab) ?
                              wire45 : reg43) > $signed(reg44)) ?
                          $signed((reg43 ?
                              (7'h44) : reg40)) : $unsigned((wire45 << reg32)))) ?
                      wire30 : reg44);
  assign wire53 = $signed((wire39 == ({wire48[(3'h4):(2'h3)]} ~^ (!$unsigned(wire45)))));
  assign wire54 = wire36[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed($signed(wire52)))
        begin
          reg55 <= (wire29[(5'h10):(4'hf)] ?
              {(-((wire35 >> wire45) ? $signed(reg40) : (wire48 >>> wire28))),
                  $unsigned(reg41)} : wire31);
          reg56 <= wire50[(1'h0):(1'h0)];
          reg57 <= reg56[(3'h4):(1'h1)];
        end
      else
        begin
          if (wire34[(3'h7):(3'h5)])
            begin
              reg55 <= {{((^$unsigned(reg40)) & wire29[(1'h0):(1'h0)])}};
              reg56 <= $signed($unsigned($signed($unsigned(reg42[(3'h6):(1'h1)]))));
              reg57 <= reg55;
              reg58 <= $unsigned($unsigned(wire31));
              reg59 <= {((-((reg43 & wire54) ~^ ((8'hae) >> (8'h9c)))) ?
                      {(8'hbf), reg42} : wire30[(4'hb):(3'h7)]),
                  reg41[(2'h3):(2'h3)]};
            end
          else
            begin
              reg55 <= $signed((&$unsigned((wire49[(3'h4):(2'h3)] <= (wire51 << wire49)))));
              reg56 <= (($unsigned($unsigned(wire50[(2'h3):(2'h3)])) || wire30) * wire51);
              reg57 <= (8'hb8);
            end
        end
      reg60 <= ($signed((7'h43)) ^ $unsigned((reg59[(2'h3):(2'h2)] >>> wire51[(3'h4):(2'h2)])));
      reg61 <= (!wire34[(4'hc):(3'h5)]);
    end
  assign wire62 = $unsigned(($unsigned((reg43 ?
                      wire51[(1'h1):(1'h1)] : $signed(wire38))) > (!(~^(wire38 >>> wire31)))));
  always
    @(posedge clk) begin
      reg63 <= wire45[(3'h7):(3'h6)];
      reg64 <= ((((((8'ha9) << (8'h9d)) && wire48[(2'h3):(2'h2)]) > {$unsigned(wire46),
          wire38}) ^~ {reg55}) >> reg56);
    end
endmodule

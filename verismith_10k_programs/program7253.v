module top
#(parameter param106 = {(((((8'h9f) | (7'h44)) <<< (~^(8'ha6))) << (((7'h42) <= (8'haf)) > ((8'ha0) ? (8'haf) : (8'hb3)))) ~^ (((^~(8'hb0)) ? (~(8'h9f)) : (7'h43)) ? {((8'ha7) <= (8'hab)), ((8'h9c) ? (8'hbc) : (8'hba))} : (((8'ha8) ? (8'h9f) : (8'hbf)) <<< (~^(8'ha1)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  assign y = {wire105,
                 wire92,
                 wire91,
                 wire89,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg104,
                 reg103,
                 reg102,
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
  assign wire5 = wire3;
  assign wire6 = (^~$signed(wire4[(5'h11):(3'h5)]));
  assign wire7 = wire0[(1'h0):(1'h0)];
  assign wire8 = $unsigned((+$unsigned(wire2[(4'hb):(4'hb)])));
  assign wire9 = (wire8 ? wire5 : $unsigned(wire4));
  assign wire10 = wire5;
  assign wire11 = wire2;
  assign wire12 = wire5;
  assign wire13 = {(8'hb2)};
  module14 #() modinst90 (.wire15(wire10), .clk(clk), .wire16(wire9), .y(wire89), .wire18(wire13), .wire17(wire4));
  assign wire91 = $unsigned(($signed($signed($unsigned(wire5))) ?
                      wire1[(3'h4):(2'h2)] : wire11[(4'h9):(3'h7)]));
  assign wire92 = (8'hb0);
  always
    @(posedge clk) begin
      reg93 <= wire4;
      reg94 <= $unsigned((wire89 - wire4));
      if ($signed($signed(({$unsigned(wire1), wire9} ?
          $signed(wire3) : {{wire0, wire1}}))))
        begin
          if ($unsigned(wire12[(3'h6):(1'h0)]))
            begin
              reg95 <= wire5[(3'h6):(3'h5)];
              reg96 <= ((($signed($signed((8'hbc))) >>> $unsigned((7'h42))) || $signed($unsigned($signed(wire10)))) >= reg94);
              reg97 <= reg93;
              reg98 <= {$signed({$unsigned(wire10), wire12})};
              reg99 <= wire7;
            end
          else
            begin
              reg95 <= $signed($unsigned(reg94));
              reg96 <= $unsigned(((8'hb4) < reg96[(1'h0):(1'h0)]));
              reg97 <= ($unsigned($signed($signed(wire12))) ?
                  wire4[(4'hf):(4'ha)] : wire13);
            end
          reg100 <= $unsigned((~^(^($signed(wire89) * wire0))));
          if (wire7)
            begin
              reg101 <= {($unsigned((8'hb3)) < {(&wire2)})};
            end
          else
            begin
              reg101 <= {$signed((((wire2 <<< wire91) < {wire10}) ?
                      $unsigned((wire10 ~^ (8'haf))) : (wire5 <<< $signed(reg94))))};
              reg102 <= $unsigned(wire2[(4'hc):(4'hb)]);
              reg103 <= ({($signed($unsigned(wire1)) | (wire7 ?
                      $unsigned(wire92) : wire91[(3'h6):(3'h4)]))} <<< {$unsigned(wire8[(3'h7):(3'h7)])});
              reg104 <= reg101[(4'ha):(2'h3)];
            end
        end
      else
        begin
          if (wire8[(1'h1):(1'h0)])
            begin
              reg95 <= reg100[(5'h10):(4'hb)];
              reg96 <= $signed(reg101[(2'h2):(1'h1)]);
              reg97 <= $signed({((-$unsigned((8'h9f))) ~^ ($signed(reg104) + $unsigned(wire12))),
                  {(~(reg94 ? reg103 : (7'h42)))}});
              reg98 <= reg97[(1'h0):(1'h0)];
            end
          else
            begin
              reg95 <= (reg101[(3'h6):(2'h3)] <= wire1);
              reg96 <= wire12[(5'h10):(1'h1)];
              reg97 <= wire9[(1'h0):(1'h0)];
              reg98 <= {(((+$signed(wire7)) ?
                      (^~$signed(reg103)) : ({wire5} ?
                          (~reg102) : $signed(reg95))) | (!(^~(^~(8'hb6)))))};
              reg99 <= $signed(($signed(((wire1 ?
                  reg99 : wire11) || $unsigned(wire6))) >= $unsigned(($signed(reg99) ?
                  $signed((8'hba)) : $unsigned(wire0)))));
            end
          reg100 <= wire0;
          reg101 <= reg103;
        end
    end
  assign wire105 = $signed((reg95[(2'h3):(2'h3)] ?
                       $unsigned(($unsigned(wire91) ?
                           $signed(wire6) : {reg93})) : $unsigned((~&wire2))));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire45,
                 wire44,
                 wire20,
                 wire19,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire19 = wire15[(2'h3):(1'h0)];
  assign wire20 = (wire15 ?
                      ({wire16[(1'h0):(1'h0)]} ?
                          (wire18 ?
                              (^~$signed(wire16)) : wire15[(1'h0):(1'h0)]) : $unsigned((wire19[(4'hb):(4'hb)] ?
                              (wire15 <<< wire19) : $unsigned(wire17)))) : (-wire18));
  always
    @(posedge clk) begin
      reg21 <= $signed(wire19);
    end
  always
    @(posedge clk) begin
      reg22 <= wire20[(4'hd):(3'h5)];
      reg23 <= wire20[(4'ha):(1'h0)];
      reg24 <= (+$signed(({reg23} ?
          wire19[(1'h1):(1'h0)] : ((wire19 != (8'ha8)) ?
              $signed((8'hac)) : $unsigned(wire16)))));
      if ($signed((8'hb1)))
        begin
          reg25 <= (($signed((wire16[(2'h2):(1'h1)] == (^~wire20))) ?
              (^~$signed(reg23[(1'h1):(1'h0)])) : wire20[(1'h0):(1'h0)]) > ((+(reg21 ?
                  (-wire18) : $signed(wire15))) ?
              reg24[(4'ha):(3'h4)] : ((wire19 ?
                      wire15[(2'h3):(2'h2)] : {wire18}) ?
                  ((reg24 ?
                      wire19 : reg23) * $signed(reg21)) : wire20[(3'h7):(1'h1)])));
          reg26 <= ($signed($signed(reg22)) * $unsigned((^$signed((~^reg23)))));
          reg27 <= (($signed(($unsigned(reg23) ~^ wire18)) * reg25) ?
              ({($unsigned(wire19) ? {wire20} : (reg21 << reg21))} ?
                  (|(!wire15[(4'h9):(2'h3)])) : $signed(($unsigned(wire15) < reg25))) : wire18);
          reg28 <= reg24;
        end
      else
        begin
          reg25 <= $unsigned($signed($unsigned($signed($signed(wire20)))));
          reg26 <= (reg21 ?
              (^{$signed(((8'ha0) ?
                      wire17 : reg21))}) : $unsigned($unsigned((!(reg22 + (8'hb4))))));
          reg27 <= reg27[(2'h2):(1'h0)];
          if ((wire17 ? $signed(wire17[(3'h4):(1'h1)]) : reg26))
            begin
              reg28 <= ($signed(wire18) ?
                  $unsigned(reg27[(5'h14):(5'h14)]) : $signed((wire17[(1'h1):(1'h1)] ?
                      $signed((reg22 ?
                          reg23 : reg22)) : wire20[(4'h9):(1'h1)])));
              reg29 <= (reg28 >> $unsigned($unsigned(reg28[(2'h2):(1'h0)])));
              reg30 <= $unsigned({(reg23[(1'h0):(1'h0)] ^ wire19[(2'h2):(2'h2)]),
                  {wire19[(4'ha):(2'h3)], reg25}});
              reg31 <= $unsigned(reg28[(1'h1):(1'h1)]);
            end
          else
            begin
              reg28 <= (wire17[(4'ha):(4'h9)] ?
                  {(reg30[(2'h2):(1'h0)] ?
                          ((reg31 >= reg30) ?
                              reg24 : reg23) : (wire19[(4'hb):(2'h3)] ?
                              wire17[(1'h1):(1'h0)] : $unsigned(reg28))),
                      $unsigned(($signed(reg25) == $unsigned((8'ha2))))} : (($unsigned({reg24}) ?
                          $signed((reg30 != (8'hbe))) : reg22[(4'ha):(1'h0)]) ?
                      ((wire15[(3'h7):(1'h1)] << wire16) ~^ $unsigned(((8'hb7) ?
                          reg21 : (8'h9e)))) : ((~(wire20 ? reg24 : (8'hbe))) ?
                          (wire15[(1'h1):(1'h1)] ?
                              {reg31, reg29} : {reg21, reg28}) : (8'ha3))));
              reg29 <= wire17;
              reg30 <= (reg23[(1'h0):(1'h0)] ?
                  (^~(|((~|reg29) | (+wire15)))) : {(((wire19 & reg29) ?
                          $unsigned(reg29) : $signed((8'hb8))) || $signed((reg23 <<< wire17)))});
              reg31 <= (~|reg27[(2'h3):(1'h0)]);
            end
          reg32 <= ((reg27 ?
              $signed($unsigned({wire17, (8'h9d)})) : reg26) ^~ wire20);
        end
    end
  always
    @(posedge clk) begin
      if ((~(8'ha1)))
        begin
          if ((reg21[(4'h9):(3'h6)] ^~ (reg22[(3'h5):(2'h2)] ?
              reg32[(4'ha):(3'h6)] : wire16[(2'h2):(1'h1)])))
            begin
              reg33 <= reg29;
              reg34 <= $signed($unsigned(((+$unsigned((8'hbf))) ?
                  ((reg22 > reg33) ?
                      (reg25 & reg30) : $unsigned(reg28)) : (reg23 ?
                      $signed(wire16) : $unsigned(wire19)))));
            end
          else
            begin
              reg33 <= ({$signed(reg32), reg29} ?
                  reg27[(3'h7):(1'h1)] : (+(~&((+reg26) ?
                      $unsigned((8'haa)) : ((8'hb6) && wire15)))));
              reg34 <= {$unsigned({reg34, reg24[(4'ha):(1'h0)]}), wire16};
            end
        end
      else
        begin
          reg33 <= reg27[(1'h0):(1'h0)];
          if ($unsigned($unsigned((reg27 | {wire15}))))
            begin
              reg34 <= (((reg29 ?
                      (~^$signed((8'hbc))) : wire17) < reg32[(3'h7):(3'h7)]) ?
                  ((reg26 ?
                          (wire15[(4'ha):(3'h4)] ~^ {reg25}) : $signed((!(8'hb1)))) ?
                      (-$signed(reg23)) : wire15[(4'hb):(2'h2)]) : $signed({(reg26[(3'h4):(2'h2)] ?
                          (reg31 ? wire20 : reg23) : $unsigned(reg33)),
                      reg24[(3'h4):(1'h1)]}));
              reg35 <= (+{({reg21[(1'h0):(1'h0)],
                      $signed(reg25)} >>> $unsigned((reg23 ?
                      reg26 : wire20)))});
            end
          else
            begin
              reg34 <= ((reg31[(4'h9):(2'h2)] < reg22[(2'h2):(2'h2)]) || ($unsigned(($unsigned((8'hbe)) ?
                      (reg25 ? reg28 : reg32) : $unsigned(reg31))) ?
                  reg33[(2'h2):(1'h0)] : reg35));
            end
          reg36 <= $signed($signed($unsigned((wire17 || (reg35 ?
              reg28 : wire17)))));
        end
      reg37 <= ({($unsigned(((8'ha1) ? reg31 : wire18)) ?
              ({wire20} ~^ ((8'hbe) <= (8'h9d))) : ($unsigned(wire17) ?
                  reg26[(3'h4):(3'h4)] : $unsigned(reg33)))} == reg26[(2'h2):(1'h0)]);
      reg38 <= reg26[(2'h3):(1'h0)];
      if (((8'hab) < (|$unsigned(($signed((8'hb3)) ?
          $signed(reg24) : wire15)))))
        begin
          reg39 <= ($signed((8'hae)) ?
              $signed(reg28) : (reg30[(1'h0):(1'h0)] > (~wire16[(2'h2):(1'h0)])));
          reg40 <= ($unsigned(reg39[(4'hc):(4'hb)]) ?
              $signed(($unsigned((reg31 ? reg34 : (8'hae))) ?
                  $signed((~wire20)) : (|$unsigned(wire17)))) : (&(^~((reg32 ?
                      reg22 : wire15) ?
                  reg29 : (&reg32)))));
          reg41 <= reg23[(2'h2):(1'h0)];
          reg42 <= reg32;
          reg43 <= reg37;
        end
      else
        begin
          reg39 <= {reg40,
              (reg28[(1'h1):(1'h1)] ? reg39 : $signed(reg23[(1'h0):(1'h0)]))};
        end
    end
  assign wire44 = $unsigned(reg38[(3'h5):(2'h3)]);
  assign wire45 = ({{reg42, (|wire15)}, $signed($unsigned((7'h42)))} ?
                      ((({reg23} ? reg42 : (wire44 != reg40)) ?
                          ($signed(reg35) <<< (reg29 || (8'h9d))) : ($signed((8'hae)) ?
                              (^~reg22) : reg25)) >= ($signed(reg24[(1'h1):(1'h1)]) >= reg43)) : (~(8'hbb)));
  module46 #() modinst74 (.wire50(wire20), .wire47(reg32), .wire49(reg24), .wire48(reg34), .wire51(wire18), .y(wire73), .clk(clk));
  assign wire75 = $signed(reg26[(1'h1):(1'h0)]);
  assign wire76 = reg39[(4'hd):(4'h8)];
  assign wire77 = $unsigned($signed({(8'hb6),
                      ((-reg34) ?
                          $unsigned(reg21) : ((8'ha2) ? wire45 : reg28))}));
  assign wire78 = ($signed(reg26[(3'h5):(1'h0)]) >> (~^wire15[(3'h4):(2'h2)]));
  assign wire79 = (&reg38[(3'h5):(2'h3)]);
  assign wire80 = (reg40 ? (~^(~|(^reg41))) : $signed(reg31[(4'h8):(1'h1)]));
  assign wire81 = $signed($signed((((wire79 == wire79) ~^ reg38) ^ $signed((|reg35)))));
  assign wire82 = (reg37 || $unsigned((8'hab)));
  assign wire83 = $signed(wire17);
  assign wire84 = (wire16[(2'h3):(1'h1)] >>> $signed({(&reg43)}));
  assign wire85 = reg39;
  assign wire86 = reg23;
  assign wire87 = (~|reg25[(4'hb):(2'h2)]);
  assign wire88 = (~|reg38);
endmodule

module module46
#(parameter param71 = ((^(&(+((8'ha5) ? (8'hb4) : (8'hbb))))) ? (|((|{(8'ha9)}) ? ((~|(8'hbb)) < ((7'h42) ? (8'hb3) : (7'h44))) : (((8'ha5) && (8'ha4)) ? (~&(8'ha3)) : ((8'hb7) ~^ (8'h9d))))) : ((((8'had) ? (~(8'ha6)) : (^~(8'ha0))) + (((8'hbe) != (8'hae)) >> ((8'ha8) ? (8'haf) : (8'hb7)))) | (+(((8'ha4) << (8'h9e)) ^ (^(8'hac)))))), 
parameter param72 = ((~^{((param71 ? param71 : (8'ha8)) ? (param71 ? param71 : (8'ha7)) : param71), (&(-param71))}) == ((&(~^(param71 == (8'hbd)))) ? (!(8'ha3)) : (((param71 << param71) << (param71 ? param71 : param71)) ? ((8'ha4) ? ((8'ha2) != param71) : (~param71)) : (8'hbd)))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire51;
  input wire [(3'h7):(1'h0)] wire50;
  input wire signed [(5'h12):(1'h0)] wire49;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  assign y = {wire70,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire47)
        begin
          reg52 <= wire51;
          reg53 <= (&wire51);
          if (wire48)
            begin
              reg54 <= $signed($unsigned(reg53[(3'h4):(1'h1)]));
            end
          else
            begin
              reg54 <= $signed($signed($unsigned($unsigned((wire48 ?
                  wire48 : reg54)))));
              reg55 <= wire51[(2'h3):(1'h1)];
              reg56 <= reg55[(4'ha):(4'h9)];
              reg57 <= (8'hbf);
            end
        end
      else
        begin
          reg52 <= {({reg55[(1'h1):(1'h1)],
                      ((wire49 <= (8'hb2)) <<< $unsigned(wire49))} ?
                  ((reg53 * reg53[(4'h8):(3'h7)]) ?
                      (|$unsigned(wire49)) : $signed((8'haf))) : $signed(wire49[(4'hd):(3'h7)]))};
          reg53 <= reg56[(3'h6):(3'h4)];
        end
      reg58 <= $unsigned($signed({$unsigned({(8'hbc)})}));
      reg59 <= $signed({(((|reg53) ?
              $signed(wire51) : {wire50,
                  reg53}) | ($unsigned(wire50) <= (wire51 ? wire51 : reg52)))});
    end
  assign wire60 = ($unsigned(wire51) ?
                      wire51 : ($unsigned((^~{reg57,
                          wire49})) ~^ $signed(((wire50 >= reg56) ?
                          (~(8'hab)) : $unsigned(reg57)))));
  assign wire61 = $signed((~(reg59 ? {$signed(wire48)} : reg58)));
  assign wire62 = (wire60 ?
                      (wire47[(1'h1):(1'h1)] ?
                          ($signed(reg53) & $signed({reg55,
                              wire60})) : reg54[(2'h2):(1'h1)]) : wire49[(3'h6):(3'h5)]);
  assign wire63 = ((reg59[(1'h1):(1'h0)] ?
                      (wire51[(4'he):(2'h2)] ?
                          (reg56 ?
                              (wire62 ? (8'hb8) : wire61) : (reg59 ?
                                  wire48 : wire47)) : wire61[(4'hc):(1'h0)]) : (^~$signed((wire48 ?
                          (8'hbb) : reg53)))) + reg57[(3'h5):(2'h3)]);
  assign wire64 = reg54[(3'h4):(2'h3)];
  assign wire65 = reg58;
  always
    @(posedge clk) begin
      reg66 <= (wire63[(3'h6):(2'h2)] >> reg58);
      reg67 <= wire60;
      reg68 <= (((({wire60} > (^reg53)) << {(wire60 ?
              reg67 : wire65)}) >= $unsigned(wire48)) == wire48);
    end
  always
    @(posedge clk) begin
      reg69 <= (reg52 * (|$signed((wire65[(1'h1):(1'h1)] | (wire65 >= wire64)))));
    end
  assign wire70 = (^(($signed((|(8'hba))) ?
                          ($signed((7'h44)) ?
                              reg52 : (|reg52)) : $unsigned(reg59)) ?
                      ($signed(((8'hb9) > wire49)) ?
                          ({reg59} - (+wire64)) : wire50[(3'h6):(3'h6)]) : (((reg68 - reg57) ?
                          (|(7'h43)) : wire63) > $unsigned($unsigned(reg52)))));
endmodule

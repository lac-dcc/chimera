module top
#(parameter param164 = ((~&((8'hba) ? ((7'h41) <<< ((8'hbc) != (8'hb2))) : ((-(8'ha4)) <<< {(7'h43), (7'h41)}))) >> {(({(8'haf), (8'hbd)} - ((8'ha9) ? (8'hbb) : (7'h44))) ? ((~&(8'had)) ? ((8'hb9) ? (7'h40) : (8'hbb)) : (&(8'hb5))) : (((8'hb3) ? (8'hbb) : (8'hb3)) ? ((8'ha3) ? (8'hab) : (7'h42)) : (&(7'h43))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  assign y = {wire150,
                 wire148,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire61,
                 wire59,
                 wire5,
                 reg163,
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
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire5 = (~&(({(wire0 > (8'ha3)),
                     wire4[(4'ha):(2'h3)]} & $signed(wire1[(4'hc):(3'h7)])) * (~|(+wire1[(2'h3):(1'h0)]))));
  module6 #() modinst60 (wire59, clk, wire1, wire5, wire4, wire2);
  assign wire61 = {(8'had)};
  always
    @(posedge clk) begin
      if ((+((~{(8'h9c), $signed((8'h9e))}) ?
          ((^~wire61) >= wire0) : wire61[(1'h1):(1'h1)])))
        begin
          reg62 <= $unsigned($unsigned((!$unsigned(wire4[(3'h7):(1'h1)]))));
          reg63 <= ($signed($signed($unsigned(wire59[(1'h0):(1'h0)]))) ?
              {{$unsigned($unsigned(wire2)), $unsigned($signed(wire5))},
                  (!wire4[(1'h0):(1'h0)])} : (!$signed((!{wire1, wire0}))));
          reg64 <= (({wire5[(5'h10):(3'h5)]} ?
              (^~$unsigned(((8'hbe) == reg62))) : wire3) <= ({(^(wire5 ?
                      wire3 : wire1))} ?
              $signed((8'hbe)) : {$signed($unsigned((8'hb0)))}));
          reg65 <= ({reg62} ?
              ($signed({reg63, {reg64}}) ?
                  (^~((|reg63) | ((8'ha4) != (8'hae)))) : $signed({((8'hb1) ?
                          (7'h43) : reg62),
                      (wire59 == wire3)})) : (7'h43));
          reg66 <= (~^$signed(reg62[(4'hb):(3'h6)]));
        end
      else
        begin
          if ((((~&(reg66 ? $signed(wire1) : $unsigned(reg66))) ?
              reg63 : (wire0 ?
                  reg65 : ((wire3 ? reg63 : wire1) ?
                      (wire3 ^~ wire59) : wire0))) <<< wire59))
            begin
              reg62 <= (7'h44);
            end
          else
            begin
              reg62 <= ({$unsigned($signed(wire3[(4'hc):(3'h4)])), (+wire61)} ?
                  $unsigned(reg63) : reg65[(4'h8):(1'h1)]);
            end
          reg63 <= reg64;
          reg64 <= (reg62 ?
              $signed($unsigned(($signed(wire61) >>> $signed(wire2)))) : (~^$unsigned((8'ha1))));
          reg65 <= (reg66[(2'h2):(1'h1)] < (reg64[(1'h0):(1'h0)] ?
              ((8'h9f) ?
                  {(~|wire5)} : reg62[(3'h5):(3'h4)]) : ((+(^~wire2)) - ($unsigned(wire4) ?
                  $signed(wire61) : (wire1 ? wire1 : wire61)))));
          reg66 <= {(&(reg62 ~^ (wire0[(1'h0):(1'h0)] ?
                  $signed(reg62) : reg62))),
              {$signed((~(wire1 ? wire61 : wire1))), wire61[(3'h6):(1'h0)]}};
        end
      reg67 <= (($unsigned({(8'hab),
          $unsigned(reg62)}) == wire2[(1'h1):(1'h0)]) <= {reg65[(1'h1):(1'h0)],
          (~(reg65[(3'h5):(2'h3)] ? (8'h9e) : reg64[(3'h4):(2'h3)]))});
      reg68 <= (8'hbf);
    end
  assign wire69 = $unsigned(($signed((~(-wire3))) < $unsigned(((wire4 - (7'h40)) ?
                      wire5 : (reg68 ? wire1 : reg67)))));
  assign wire70 = ($signed((^~(8'hab))) + $signed((((wire4 > wire2) ?
                      {wire69,
                          reg68} : $unsigned(reg62)) || ($signed(reg64) & (wire4 ?
                      reg68 : reg67)))));
  assign wire71 = ($unsigned(wire1[(4'hf):(4'hb)]) || $signed((~$unsigned({wire3,
                      reg67}))));
  assign wire72 = $unsigned(wire3);
  assign wire73 = wire1[(3'h7):(3'h5)];
  assign wire74 = reg65;
  assign wire75 = (wire70[(4'h8):(3'h6)] * $unsigned({$unsigned($signed(wire3))}));
  assign wire76 = wire5;
  module77 #() modinst149 (.wire80(wire3), .wire79(wire74), .clk(clk), .wire78(wire5), .wire81(wire72), .y(wire148));
  module85 #() modinst151 (.wire87(wire4), .y(wire150), .wire88(wire1), .wire86(reg66), .wire89(wire75), .clk(clk), .wire90(wire69));
  always
    @(posedge clk) begin
      if (wire3[(4'hf):(4'he)])
        begin
          reg152 <= (wire75 << (&($signed((wire75 ?
              wire74 : (8'hb2))) + (!(wire70 - wire76)))));
        end
      else
        begin
          reg152 <= (($unsigned(($signed(wire148) ?
                  {wire0} : reg65[(4'ha):(4'h8)])) ?
              $unsigned(((wire0 ?
                  wire74 : reg67) | {wire72})) : (wire1[(5'h11):(4'hc)] <= wire148)) & (wire74[(3'h7):(1'h1)] ?
              reg67[(4'hc):(3'h5)] : {reg66}));
          reg153 <= wire76[(3'h5):(1'h1)];
          reg154 <= (((wire73 && ((wire70 ~^ reg64) | $unsigned(wire59))) - ($unsigned((reg66 ^ (7'h42))) & ((wire150 ?
                  reg66 : wire3) ?
              {(8'hb7)} : wire72[(5'h10):(4'h9)]))) ^ reg63);
        end
      reg155 <= $signed((8'hb8));
    end
  always
    @(posedge clk) begin
      if (wire0[(2'h2):(2'h2)])
        begin
          reg156 <= {reg64};
          reg157 <= ((({wire70[(2'h2):(1'h1)]} ^ $signed((reg65 ?
              reg152 : (8'h9e)))) - $signed((~$unsigned(wire5)))) | $unsigned({(~|(wire61 ?
                  wire4 : wire61))}));
          reg158 <= $signed($signed((!($signed(reg152) ?
              (reg157 >>> wire2) : (reg157 == (7'h43))))));
        end
      else
        begin
          if ((($unsigned($signed((wire2 + reg67))) ?
              {$unsigned((wire4 == reg65)),
                  wire70[(2'h3):(1'h0)]} : ((~^(wire69 <<< wire71)) ?
                  wire71 : $unsigned((reg63 ?
                      wire74 : reg68)))) <<< $unsigned((&($signed(wire70) >>> wire70)))))
            begin
              reg156 <= $signed($signed(reg153));
              reg157 <= wire3;
              reg158 <= ((reg158[(1'h0):(1'h0)] ?
                      ({wire73[(3'h6):(2'h2)]} <<< wire72) : ((((8'haa) ?
                              wire69 : wire76) ?
                          wire74[(1'h1):(1'h0)] : (^wire75)) >> $signed((reg68 ^ (7'h44))))) ?
                  reg155 : ($signed((wire148[(2'h3):(2'h3)] >>> wire71)) ?
                      (~^$signed($unsigned(wire70))) : reg65[(3'h4):(1'h0)]));
              reg159 <= (8'hb6);
              reg160 <= $signed(wire61);
            end
          else
            begin
              reg156 <= $unsigned((-$unsigned(wire150[(4'h8):(1'h0)])));
              reg157 <= (^reg68[(3'h4):(3'h4)]);
              reg158 <= (~|((-wire4[(1'h1):(1'h1)]) && (^~$unsigned((reg155 * wire75)))));
            end
        end
      reg161 <= $signed(wire70);
      if ({($unsigned($unsigned($signed(wire148))) ?
              $unsigned($unsigned((-reg63))) : $signed($signed($signed((7'h40))))),
          (wire61[(3'h5):(3'h4)] ?
              (&(wire71[(2'h2):(1'h0)] < $unsigned(wire73))) : $signed({reg155[(2'h3):(2'h2)]}))})
        begin
          reg162 <= (|$unsigned({(+(wire74 * reg65)), $unsigned((|reg161))}));
        end
      else
        begin
          reg162 <= wire73;
        end
      reg163 <= wire150;
    end
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire81;
  input wire [(4'h9):(1'h0)] wire80;
  input wire signed [(5'h15):(1'h0)] wire79;
  input wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire139;
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire142,
                 wire141,
                 wire95,
                 wire84,
                 wire83,
                 wire82,
                 wire97,
                 wire98,
                 wire99,
                 wire139,
                 reg144,
                 reg143,
                 (1'h0)};
  assign wire82 = $signed($unsigned({wire78[(3'h6):(3'h6)]}));
  assign wire83 = (^~(|wire82));
  assign wire84 = ($unsigned($unsigned((8'hbf))) ?
                      (wire83[(5'h11):(3'h4)] ?
                          wire81[(1'h0):(1'h0)] : (($unsigned(wire82) ^ {(8'ha7),
                              wire80}) * wire79)) : wire80[(4'h9):(3'h6)]);
  module85 #() modinst96 (.wire90(wire84), .wire87(wire81), .wire86(wire83), .wire89(wire82), .clk(clk), .y(wire95), .wire88(wire78));
  assign wire97 = (($signed((-wire78[(3'h6):(2'h3)])) ? wire84 : wire78) ?
                      $signed((+(wire82 ?
                          $signed(wire83) : (wire83 | wire95)))) : $unsigned($unsigned(wire82[(4'h8):(3'h5)])));
  assign wire98 = wire78;
  assign wire99 = (wire80 ? wire80[(4'h9):(1'h0)] : wire82[(1'h0):(1'h0)]);
  module100 #() modinst140 (.wire101(wire80), .wire105(wire81), .wire102(wire95), .clk(clk), .wire104(wire84), .y(wire139), .wire103(wire97));
  assign wire141 = {{wire99}, (8'haf)};
  assign wire142 = wire83[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg143 <= wire79[(4'he):(3'h6)];
      reg144 <= (~&{$unsigned(($signed((7'h42)) ?
              wire98[(4'hb):(4'hb)] : $unsigned(wire84))),
          ((&(wire84 & wire97)) || $unsigned(((8'hb5) ? wire80 : wire81)))});
    end
  assign wire145 = (!(wire99 ?
                       ($signed(reg144) ?
                           {wire139[(4'hc):(3'h7)],
                               (-wire83)} : $signed((|wire141))) : $signed($signed(reg143[(3'h7):(2'h2)]))));
  assign wire146 = $unsigned((~(($unsigned(reg144) ?
                           $signed(wire80) : (!wire81)) ?
                       (+wire98) : reg143[(4'hf):(3'h4)])));
  assign wire147 = {(($signed($signed(wire99)) ?
                           ((wire145 ? wire78 : wire84) ?
                               ((8'hac) | wire146) : $signed(wire84)) : $unsigned($unsigned(wire97))) < $unsigned($signed((~(7'h43)))))};
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire13,
                 wire12,
                 wire11,
                 reg50,
                 reg49,
                 reg48,
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
                 (1'h0)};
  assign wire11 = wire10;
  assign wire12 = ((^(wire10[(1'h0):(1'h0)] < $signed((8'hbe)))) != wire9[(1'h1):(1'h1)]);
  assign wire13 = (wire7 ?
                      $signed((($signed(wire12) || wire8[(1'h1):(1'h0)]) ?
                          wire7[(2'h2):(1'h0)] : (wire8 || (wire12 ?
                              wire7 : wire10)))) : wire9);
  module14 #() modinst30 (wire29, clk, wire12, wire11, wire9, wire10);
  assign wire31 = wire8[(1'h0):(1'h0)];
  assign wire32 = wire8;
  assign wire33 = ($unsigned((&$unsigned(wire32))) ~^ wire13);
  assign wire34 = $unsigned(($unsigned((-((8'hb0) == (8'hbb)))) <<< (wire8[(3'h7):(3'h7)] ?
                      ((-wire9) ? (+wire11) : (~|(8'h9e))) : wire33)));
  assign wire35 = wire12;
  assign wire36 = (wire29[(1'h1):(1'h1)] ^~ (wire31[(2'h3):(1'h0)] << $unsigned((7'h44))));
  always
    @(posedge clk) begin
      reg37 <= $signed(wire34[(2'h3):(1'h0)]);
      reg38 <= wire31[(1'h0):(1'h0)];
      reg39 <= wire34;
      reg40 <= reg39;
      if (wire7[(1'h1):(1'h0)])
        begin
          reg41 <= wire8[(3'h4):(1'h0)];
          reg42 <= reg41;
          reg43 <= (~{(7'h44), (8'hb4)});
          if ($signed(($signed(wire32) | ($unsigned($signed(wire10)) <<< (wire31[(2'h2):(1'h1)] <= wire12)))))
            begin
              reg44 <= ((wire29[(3'h4):(3'h4)] ?
                  (&$unsigned(reg41[(1'h0):(1'h0)])) : $unsigned($unsigned($signed(wire34)))) << {$unsigned(((reg39 ?
                          wire34 : wire12) ?
                      (+wire8) : wire10)),
                  (&{(wire9 ? wire35 : wire13)})});
              reg45 <= $unsigned($signed((!($unsigned((8'hbb)) | (reg41 ?
                  reg42 : wire32)))));
              reg46 <= reg40;
            end
          else
            begin
              reg44 <= wire11;
              reg45 <= ($signed(wire29) <<< {(wire36 ?
                      ((wire36 ? reg46 : wire31) - (-wire36)) : (~|reg37))});
              reg46 <= (reg37[(4'h8):(3'h6)] ?
                  $unsigned((wire29[(2'h3):(1'h0)] ?
                      ((wire33 >= reg41) ?
                          (reg41 ?
                              wire10 : reg38) : reg46) : (wire32[(2'h3):(2'h2)] > (wire8 >= wire32)))) : $unsigned({($unsigned(reg37) > wire35[(2'h2):(1'h1)])}));
              reg47 <= (8'hb2);
              reg48 <= (reg39 + $signed(reg38));
            end
        end
      else
        begin
          reg41 <= $unsigned(reg48[(3'h5):(2'h2)]);
          if (((!($unsigned($unsigned(wire35)) ?
                  wire9 : wire10[(3'h4):(3'h4)])) ?
              (reg46 >= wire32[(2'h2):(1'h1)]) : $unsigned((((!(7'h44)) >>> reg42) <<< reg40[(3'h7):(3'h4)]))))
            begin
              reg42 <= (7'h41);
              reg43 <= wire9;
              reg44 <= wire13[(3'h5):(1'h0)];
              reg45 <= ((&wire29) ^~ wire35[(1'h1):(1'h1)]);
            end
          else
            begin
              reg42 <= $unsigned((|{$signed((!wire32))}));
              reg43 <= (((~^{$signed(reg47), reg45[(4'h9):(3'h5)]}) ?
                      $signed({(8'hbf)}) : wire29[(3'h4):(1'h1)]) ?
                  $signed($signed({{reg37}, $signed(wire7)})) : wire31);
            end
          reg46 <= wire31;
          reg47 <= reg39[(1'h0):(1'h0)];
          if (({{{(wire8 ? reg41 : reg37)}, wire32[(2'h3):(2'h2)]}} ?
              $unsigned((wire29 || (^~(reg37 & reg39)))) : reg37))
            begin
              reg48 <= wire12;
              reg49 <= reg40;
              reg50 <= (reg40 >= {wire9[(3'h7):(3'h6)]});
            end
          else
            begin
              reg48 <= {(wire35 ?
                      reg49 : (reg41 ?
                          reg40[(4'hf):(2'h3)] : $signed(reg40[(4'h9):(3'h4)])))};
              reg49 <= wire13[(1'h0):(1'h0)];
              reg50 <= (reg42 ?
                  (^$unsigned(wire33[(2'h3):(2'h2)])) : wire12[(4'h8):(3'h5)]);
            end
        end
    end
  assign wire51 = wire9;
  assign wire52 = ($unsigned(((((7'h42) ? (8'hbc) : wire36) ?
                      reg43[(3'h6):(3'h6)] : (^~wire51)) & $unsigned($signed((8'ha5))))) ^~ wire36[(2'h2):(1'h0)]);
  assign wire53 = reg38[(4'h9):(3'h6)];
  assign wire54 = wire9[(4'hf):(4'hf)];
  assign wire55 = reg44[(4'hb):(1'h0)];
  assign wire56 = (-((^~(|$signed((8'hb5)))) ?
                      $unsigned({(8'hb5),
                          (-(8'hae))}) : $unsigned($signed($unsigned((8'h9d))))));
  assign wire57 = (|$unsigned(reg37[(1'h1):(1'h1)]));
  assign wire58 = {(~^(($unsigned(reg37) ?
                          (~&wire56) : (reg42 <<< reg39)) >> (((8'hbc) + wire8) ?
                          $unsigned(wire56) : $signed(reg40)))),
                      (8'hac)};
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire19 = $unsigned((wire15[(4'h8):(2'h2)] ?
                      $signed(wire18) : {(~&$signed(wire15)),
                          wire17[(2'h3):(1'h0)]}));
  assign wire20 = wire16;
  assign wire21 = {wire20,
                      ((wire20 ^ (~|(wire19 ? wire15 : wire17))) ^~ (8'ha1))};
  assign wire22 = ((~$unsigned((^~(|wire21)))) ?
                      (($signed({wire18}) ?
                          wire15[(1'h0):(1'h0)] : ($unsigned(wire16) & $signed(wire18))) << (&(8'hb9))) : wire21[(1'h0):(1'h0)]);
  assign wire23 = (wire22[(5'h11):(3'h4)] ? $unsigned(wire21) : (!wire16));
  assign wire24 = wire18;
  assign wire25 = $signed(wire18);
  assign wire26 = (~|$unsigned(($signed((wire21 >= wire21)) ?
                      ((&wire22) <= (wire22 ?
                          wire22 : wire22)) : $unsigned({wire18}))));
  always
    @(posedge clk) begin
      reg27 <= {$unsigned((-(~^(wire18 == wire25))))};
      reg28 <= (wire26 ?
          {wire17[(3'h6):(3'h5)]} : ($signed((+{wire26})) ?
              $unsigned($signed(wire21[(1'h0):(1'h0)])) : $signed({wire16,
                  (wire25 ? (8'haa) : reg27)})));
    end
endmodule

module module100
#(parameter param137 = ((((+(~(8'ha0))) == (((8'ha0) ? (7'h41) : (8'hb0)) || ((8'hb8) ? (8'ha7) : (8'hac)))) ~^ ((|((8'hb9) ? (8'hb0) : (8'hb3))) >> ((&(8'hbe)) ? ((8'hb5) ? (8'haa) : (8'hb1)) : ((8'hb0) > (8'haa))))) * (((!((8'hb8) ? (8'ha4) : (8'h9e))) ? ((8'ha5) >= (~^(8'h9f))) : ((~(8'hbb)) | (~^(8'hb3)))) ? (8'ha0) : ({(|(8'hba)), (8'hb3)} ? (((8'hab) <= (7'h41)) >= (^(8'hb5))) : (((8'h9c) ? (8'hba) : (7'h41)) ? ((8'hb1) && (8'hbf)) : ((8'hae) ? (8'hac) : (8'h9f)))))), 
parameter param138 = ({((~|(param137 ? param137 : param137)) ? (+{(8'ha5)}) : ({param137, param137} ? (~param137) : (+param137)))} && (({(param137 <= param137)} ? (param137 ? (param137 ? param137 : param137) : (8'ha4)) : (param137 != param137)) + {((-(7'h43)) << param137), {(~|param137), ((8'hb3) ? (8'hac) : param137)}})))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire105;
  input wire [(5'h10):(1'h0)] wire104;
  input wire [(3'h5):(1'h0)] wire103;
  input wire signed [(4'hb):(1'h0)] wire102;
  input wire signed [(3'h7):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(2'h2):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(4'he):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire123,
                 wire122,
                 wire108,
                 wire107,
                 wire106,
                 reg126,
                 reg125,
                 reg124,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire106 = (~&($unsigned((-((8'hbe) + wire104))) ?
                       $signed({(wire102 == wire101)}) : ($signed($unsigned(wire105)) ?
                           wire101 : ($unsigned(wire102) - (8'had)))));
  assign wire107 = $unsigned(wire105[(4'h8):(3'h7)]);
  assign wire108 = wire106;
  always
    @(posedge clk) begin
      reg109 <= (wire106[(5'h11):(3'h5)] ^ $signed((~^((wire103 * wire108) ^ wire104[(2'h2):(2'h2)]))));
      if ((^wire103))
        begin
          reg110 <= (($signed(wire102) ?
                  {$signed($unsigned(wire103))} : $signed(((reg109 ?
                          wire102 : wire101) ?
                      $signed(wire107) : wire108))) ?
              wire103 : (~wire105));
          reg111 <= wire106;
        end
      else
        begin
          if ((wire105[(2'h3):(1'h0)] < reg109))
            begin
              reg110 <= (reg109[(1'h0):(1'h0)] * reg109[(4'hc):(4'h8)]);
              reg111 <= (({wire108, (|$unsigned(wire107))} ?
                      $signed($signed((wire102 ?
                          (8'haf) : wire108))) : ((wire102 ?
                              (reg109 ?
                                  wire101 : (7'h40)) : $unsigned((8'hb7))) ?
                          ($signed(wire105) ?
                              (8'hb8) : (|wire107)) : (-wire107))) ?
                  $signed($signed(wire106)) : $unsigned($unsigned(wire108[(1'h1):(1'h0)])));
            end
          else
            begin
              reg110 <= (~^(wire107 && ((~^wire104[(3'h6):(1'h0)]) ?
                  (^~$signed(wire108)) : $signed($signed(wire102)))));
              reg111 <= (+(($unsigned((reg109 >> wire105)) && reg110) <<< (reg111 < wire104[(4'h8):(3'h7)])));
            end
          reg112 <= (8'hbc);
          reg113 <= (~$signed((7'h40)));
          reg114 <= ({$unsigned($unsigned((reg111 ? (8'hac) : wire103)))} ?
              $signed(wire105) : $signed((8'had)));
          if ($unsigned({reg111}))
            begin
              reg115 <= (^$signed(wire101));
              reg116 <= ((wire107[(1'h1):(1'h0)] <= ($signed($unsigned(reg113)) ?
                      $signed(reg110) : reg114)) ?
                  $signed(wire106) : wire101[(2'h3):(1'h0)]);
              reg117 <= ((^~(-(!$unsigned(reg114)))) | {$signed(wire103[(3'h5):(1'h1)])});
            end
          else
            begin
              reg115 <= reg116[(2'h2):(2'h2)];
              reg116 <= wire106[(1'h0):(1'h0)];
              reg117 <= (^$signed((~^((-wire105) ^~ (!wire103)))));
              reg118 <= {((reg109 * {wire104[(1'h0):(1'h0)]}) >> $unsigned(reg116[(3'h6):(1'h1)])),
                  wire102[(2'h3):(1'h0)]};
              reg119 <= wire104[(3'h7):(3'h7)];
            end
        end
      reg120 <= $signed((({(wire104 ? reg111 : reg116),
          {(8'had),
              wire102}} ~^ (((8'had) || (8'hb8)) >>> $signed(reg119))) && (wire107[(3'h7):(1'h0)] && $signed({(7'h43)}))));
      reg121 <= ({((~&(wire107 ^~ wire102)) ?
              {(!reg115)} : $signed($unsigned(reg116))),
          ($signed((reg109 > (7'h42))) ?
              reg110[(2'h2):(1'h0)] : {$unsigned(wire104),
                  $unsigned(reg112)})} ^~ $unsigned((7'h44)));
    end
  assign wire122 = (+wire104[(4'hb):(4'hb)]);
  assign wire123 = (~|$unsigned($signed((~&reg120[(3'h4):(3'h4)]))));
  always
    @(posedge clk) begin
      reg124 <= reg111[(3'h5):(1'h0)];
      reg125 <= $signed(wire102);
      reg126 <= (($unsigned(($unsigned(reg120) ?
              (&(8'hab)) : (8'had))) <= (-(reg121 ~^ wire123))) ?
          reg120 : (((~^reg111) ?
                  $signed($signed(wire107)) : $signed((8'hbd))) ?
              wire107 : $signed(reg113[(1'h1):(1'h1)])));
    end
  assign wire127 = $signed({(reg115 & ($unsigned(reg121) ~^ (reg115 << wire105))),
                       ((wire123 ?
                           (reg111 ?
                               reg109 : (8'ha2)) : (~&reg126)) & $signed(wire101[(2'h3):(1'h0)]))});
  assign wire128 = wire105[(1'h1):(1'h0)];
  assign wire129 = (^~$unsigned({reg115[(3'h7):(3'h5)],
                       $signed(reg116[(3'h6):(2'h2)])}));
  assign wire130 = reg113;
  assign wire131 = $signed(wire128[(4'hd):(1'h1)]);
  assign wire132 = (reg110 ?
                       reg118[(4'h9):(2'h3)] : ($signed({$unsigned((8'hbc))}) >= reg114[(4'hc):(3'h5)]));
  assign wire133 = reg124;
  assign wire134 = ($unsigned(reg113) ?
                       ((~|reg110) >>> reg117[(4'h9):(3'h5)]) : $unsigned((8'hb6)));
  assign wire135 = $unsigned((reg117[(4'hc):(3'h7)] ^~ (reg126 > $unsigned((wire104 ?
                       reg124 : (8'ha6))))));
  assign wire136 = $signed((reg117[(3'h4):(2'h3)] << (|{wire123,
                       $signed(wire135)})));
endmodule

module module85  (y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  input wire signed [(3'h7):(1'h0)] wire88;
  input wire signed [(4'hf):(1'h0)] wire87;
  input wire [(4'hf):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  assign y = {wire94, wire93, wire92, wire91, (1'h0)};
  assign wire91 = wire88;
  assign wire92 = $unsigned(((wire86 << $signed(wire86)) != (wire91 <= (((8'h9c) ?
                          wire90 : wire89) ?
                      $signed(wire90) : $unsigned(wire88)))));
  assign wire93 = {(-((^{wire86, wire88}) ?
                          $signed((^wire90)) : $unsigned({wire91}))),
                      ((|wire88[(3'h5):(3'h5)]) >> ($signed($signed(wire92)) ?
                          $signed((wire89 <= wire86)) : wire91))};
  assign wire94 = $unsigned(wire92[(3'h5):(3'h4)]);
endmodule

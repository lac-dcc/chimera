module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire97,
                 wire94,
                 wire34,
                 wire22,
                 wire21,
                 reg96,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned((~|(wire3 ? wire3 : wire1))))))
        begin
          reg4 <= wire0[(1'h1):(1'h0)];
          if ($unsigned((|$unsigned($unsigned((wire3 >= (8'hb7)))))))
            begin
              reg5 <= $unsigned(wire3[(2'h2):(2'h2)]);
              reg6 <= $unsigned(((wire3[(1'h1):(1'h1)] ?
                      (((8'hb8) ? reg5 : wire2) ?
                          $unsigned((7'h41)) : reg5[(1'h1):(1'h0)]) : ((reg5 || (8'ha8)) || (~|wire3))) ?
                  (((wire2 ? (7'h43) : wire2) == (-reg4)) ?
                      wire1 : $unsigned({reg5})) : reg4));
            end
          else
            begin
              reg5 <= (~&(-{((reg6 < (8'hbd)) + (reg5 && wire1))}));
            end
          reg7 <= reg6;
          if ($signed(reg4[(1'h0):(1'h0)]))
            begin
              reg8 <= (wire3 >>> (wire2 ^~ reg5[(4'h9):(3'h5)]));
              reg9 <= $signed(((~|wire0[(3'h4):(2'h3)]) << ($signed(wire0) ?
                  ((reg4 + wire1) ?
                      (reg8 ? reg4 : reg6) : $unsigned(reg4)) : wire3)));
              reg10 <= wire2[(4'ha):(3'h4)];
            end
          else
            begin
              reg8 <= (8'had);
              reg9 <= wire0;
              reg10 <= $unsigned(reg9);
              reg11 <= (+{wire2, reg6});
              reg12 <= ((!(($signed(wire3) ? $unsigned(reg5) : $signed(reg7)) ?
                  reg9 : ((reg7 <= reg5) ?
                      wire0[(4'hd):(4'ha)] : (reg8 ?
                          wire2 : wire2)))) * $signed((reg5[(3'h5):(2'h3)] ?
                  (-$unsigned((8'hb5))) : reg7[(5'h10):(4'ha)])));
            end
          if (reg9)
            begin
              reg13 <= ($signed({reg8, $signed(reg11)}) ?
                  reg9[(1'h0):(1'h0)] : (wire2 ?
                      ($unsigned(reg7[(3'h6):(3'h5)]) ?
                          reg6[(3'h5):(3'h5)] : {$unsigned(reg7)}) : wire0[(1'h0):(1'h0)]));
              reg14 <= $signed(reg7[(5'h11):(3'h4)]);
            end
          else
            begin
              reg13 <= ($unsigned(reg5) ? $signed(reg9) : wire0[(2'h3):(2'h2)]);
              reg14 <= $signed($signed(reg10));
              reg15 <= $signed(reg13);
              reg16 <= reg7;
              reg17 <= reg16[(1'h1):(1'h0)];
            end
        end
      else
        begin
          if (($unsigned((8'haa)) | (!$unsigned({(reg9 >>> reg4)}))))
            begin
              reg4 <= reg11[(1'h0):(1'h0)];
              reg5 <= reg8[(2'h2):(2'h2)];
            end
          else
            begin
              reg4 <= (reg16 >> reg10[(4'ha):(4'h9)]);
              reg5 <= (-(~^(reg6[(4'hb):(3'h5)] ?
                  reg9[(4'hf):(4'hc)] : $unsigned($unsigned((8'hbe))))));
              reg6 <= wire1;
            end
          if (($unsigned($unsigned($signed($signed(wire1)))) ?
              reg16 : ((((wire0 ? reg11 : reg14) ? reg14 : $signed(reg13)) ?
                  ((reg16 ? reg11 : reg12) ?
                      (reg15 ?
                          reg6 : wire2) : reg4[(3'h4):(3'h4)]) : $unsigned((|reg9))) ^~ reg12)))
            begin
              reg7 <= (+(reg14 == (8'hb0)));
              reg8 <= wire0[(4'ha):(3'h4)];
              reg9 <= {$signed($signed(((reg15 == reg11) ?
                      (wire3 ? reg9 : reg12) : reg10[(2'h2):(1'h1)])))};
            end
          else
            begin
              reg7 <= {$signed((&(|reg13)))};
              reg8 <= reg4[(3'h5):(2'h2)];
              reg9 <= {$unsigned(wire0[(4'ha):(4'h9)])};
              reg10 <= (~reg8[(3'h7):(3'h4)]);
              reg11 <= reg13[(2'h2):(1'h0)];
            end
        end
      reg18 <= $signed(reg9[(3'h7):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg19 <= reg14;
      reg20 <= ((|reg5[(2'h2):(2'h2)]) ?
          $unsigned($unsigned(({(8'h9f),
              reg16} ^~ (reg11 >> (7'h43))))) : {((~|(reg7 | reg18)) >= reg4[(3'h5):(2'h2)])});
    end
  assign wire21 = (reg17 ?
                      (({(^~(8'ha5))} | (~((8'ha5) ?
                          reg11 : reg18))) && $unsigned({$unsigned(reg6)})) : (reg8 ?
                          $unsigned((reg7 ?
                              reg16[(2'h2):(2'h2)] : $signed(wire0))) : reg16));
  assign wire22 = wire21[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed((|reg12[(4'hc):(1'h1)])))
        begin
          reg23 <= reg20[(1'h0):(1'h0)];
        end
      else
        begin
          reg23 <= reg9;
        end
      if ((((((7'h42) - $signed(reg10)) ?
          {(reg7 ? (8'hbe) : reg13), $signed((8'hb5))} : reg20) > (reg11 ?
          ($unsigned(reg6) ^ $signed(reg6)) : wire2)) & (8'ha4)))
        begin
          reg24 <= $signed($signed({{$signed(reg16)},
              $signed((wire22 ? reg16 : reg7))}));
          reg25 <= ((((reg16 ?
                      reg6[(4'hd):(4'hd)] : (~^reg11)) >> $signed($signed((7'h40)))) ?
                  (((reg15 ? reg19 : (8'h9e)) - ((8'ha3) ? (8'ha6) : wire21)) ?
                      ($unsigned(wire22) - ((8'ha8) >>> reg7)) : (8'hb4)) : ((+(reg17 ?
                          reg20 : reg6)) ?
                      $signed((reg23 ?
                          reg13 : wire21)) : (^~$unsigned((8'haa))))) ?
              ((~|reg9) ?
                  wire1[(5'h12):(4'hb)] : (wire0[(4'h9):(3'h6)] ?
                      ($unsigned(reg14) ?
                          (reg24 ?
                              wire21 : (8'hb9)) : $signed(reg13)) : reg18)) : $signed(((&(8'hac)) < reg17)));
          if (({$unsigned($unsigned((~^wire1)))} ?
              ((reg5 & reg19[(4'h9):(2'h2)]) ?
                  reg12 : (((wire0 <<< (8'ha0)) <<< (~reg24)) ?
                      (reg23 ? ((7'h44) & reg17) : $signed((8'hb3))) : ({reg13,
                              reg18} ?
                          $signed((8'ha8)) : reg14))) : $unsigned($unsigned({{(8'hbb)}}))))
            begin
              reg26 <= $signed((+reg12[(4'hd):(4'h9)]));
              reg27 <= $unsigned((($signed(((8'hb5) <<< reg23)) && $signed(((8'hab) ?
                      reg8 : (8'hbe)))) ?
                  reg19 : wire2));
              reg28 <= reg15;
            end
          else
            begin
              reg26 <= ($unsigned((reg20 ?
                      $unsigned($signed(reg24)) : ($unsigned(reg6) != $signed(reg13)))) ?
                  reg26 : $unsigned(reg8[(2'h2):(2'h2)]));
              reg27 <= (~|((^(~|wire21)) ?
                  $unsigned(reg14[(3'h5):(2'h2)]) : reg12));
              reg28 <= $signed((reg12 > (|(|wire1))));
              reg29 <= $signed(wire22[(2'h3):(1'h0)]);
              reg30 <= (^((-((^wire3) != (8'hb1))) ?
                  {($signed((8'haf)) ? reg12 : wire22)} : (^~reg12)));
            end
        end
      else
        begin
          if ((^(wire2 - ((~|$signed(reg25)) ?
              ((^~(8'ha7)) >>> (~&reg16)) : reg5[(1'h1):(1'h1)]))))
            begin
              reg24 <= $signed($signed(reg30[(5'h11):(5'h11)]));
              reg25 <= $signed((wire21 ? reg9 : reg26[(2'h2):(1'h1)]));
              reg26 <= (~^(((8'ha2) == reg26) - $signed(reg25)));
            end
          else
            begin
              reg24 <= {(-$signed(reg11)), wire22};
              reg25 <= $signed(reg25);
              reg26 <= $unsigned((wire0 || $unsigned(reg19[(1'h0):(1'h0)])));
              reg27 <= $signed({reg12,
                  (reg18 ? (~|$signed(reg8)) : $signed((^~reg29)))});
            end
          if ((reg27[(4'hb):(4'ha)] ? (8'hb9) : reg9))
            begin
              reg28 <= reg10[(1'h0):(1'h0)];
              reg29 <= (&$signed(((reg26 ?
                  $unsigned(reg28) : $signed(reg17)) + reg29[(5'h11):(4'hb)])));
              reg30 <= (reg8[(1'h0):(1'h0)] ? reg7 : reg11);
              reg31 <= (($unsigned((-(reg6 ? wire2 : (8'h9e)))) == {(|(reg5 ?
                          reg30 : (8'hbb)))}) ?
                  $unsigned(reg27[(4'ha):(4'h9)]) : reg30);
            end
          else
            begin
              reg28 <= (($signed($unsigned($signed(reg13))) ?
                      $unsigned(wire22) : ((reg28 ?
                              (-reg27) : reg18[(3'h4):(1'h1)]) ?
                          {(wire2 < reg4)} : wire1[(3'h7):(1'h1)])) ?
                  $unsigned(($signed((reg19 < reg13)) && $unsigned(reg29))) : reg24[(5'h12):(5'h10)]);
              reg29 <= $unsigned(reg9[(4'ha):(3'h4)]);
              reg30 <= $signed(reg14[(4'h8):(2'h3)]);
              reg31 <= (($unsigned($unsigned(reg23)) ?
                  (~$signed(reg30)) : (((|wire0) ?
                      (reg10 == reg9) : wire0) & (reg14[(1'h0):(1'h0)] && $unsigned((7'h43))))) * (8'hb1));
              reg32 <= $signed((~|$signed((~^wire3[(5'h10):(4'hc)]))));
            end
          reg33 <= (~(($signed(reg16) | $signed((reg4 < reg26))) & (~&reg10)));
        end
    end
  assign wire34 = (~$unsigned($unsigned(wire1)));
  module35 #() modinst95 (wire94, clk, reg25, reg23, reg26, reg9);
  always
    @(posedge clk) begin
      reg96 <= (wire21 <= ($unsigned($unsigned(wire21[(2'h2):(1'h1)])) ?
          (!reg33) : (^reg6)));
    end
  assign wire97 = (~&((({reg33, wire1} ? $signed(reg96) : $signed(reg7)) ?
                          reg25[(1'h0):(1'h0)] : ($signed(reg12) ?
                              reg9[(1'h1):(1'h0)] : (~|wire21))) ?
                      {wire94[(3'h7):(3'h6)]} : $signed((reg15 != (^reg29)))));
endmodule

module module35
#(parameter param92 = (((~^(((8'hbe) ? (8'hb6) : (8'hbd)) ? {(8'h9d)} : ((8'hba) ~^ (7'h43)))) >= {(|((8'h9f) ? (8'hb3) : (8'hbd)))}) >> ({(!((8'hbe) ? (7'h43) : (8'hb3))), (+{(8'hbf)})} << ((((8'hbb) == (8'hb0)) | ((8'hbc) ? (8'hbd) : (8'hb8))) ? (((8'hbc) ? (7'h40) : (7'h40)) <= ((8'hbe) ? (8'hbd) : (8'hbe))) : (^{(8'hb8)})))), 
parameter param93 = (((+((param92 ? param92 : (8'h9c)) ? (param92 ? param92 : param92) : ((7'h44) >= (8'hb7)))) | {(((8'haf) ? (8'hbb) : param92) != param92)}) ? (-({param92} ^ ((param92 || param92) != (param92 * param92)))) : ({((~|param92) >= (~|param92)), ((7'h43) | (~^(8'hb8)))} ? param92 : (({(8'ha0), param92} ~^ (~|param92)) + param92))))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire [(3'h5):(1'h0)] wire37;
  input wire [(4'hf):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire51;
  wire [(3'h4):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire40;
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
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
                 wire76,
                 wire51,
                 wire50,
                 wire49,
                 wire40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire40 = (^~wire36);
  always
    @(posedge clk) begin
      reg41 <= $unsigned($signed(wire40[(2'h2):(2'h2)]));
      reg42 <= $signed(($signed(($signed(reg41) & wire40)) * {{(!wire38),
              reg41}}));
      if (wire38)
        begin
          reg43 <= wire39;
          if (reg42)
            begin
              reg44 <= wire40;
              reg45 <= ((($unsigned($unsigned(wire39)) ?
                  $unsigned((&reg42)) : reg43[(2'h2):(1'h0)]) > wire38) & wire39);
            end
          else
            begin
              reg44 <= reg41[(5'h11):(4'hf)];
              reg45 <= (~^reg44);
              reg46 <= wire38[(4'hd):(1'h1)];
              reg47 <= $signed($signed(($signed(((8'hbf) >>> wire38)) - (^reg45[(2'h2):(1'h1)]))));
            end
          reg48 <= reg41[(1'h1):(1'h0)];
        end
      else
        begin
          if ((reg42 ?
              {(wire40 ?
                      (wire38[(4'he):(4'hb)] ?
                          $signed(wire36) : reg46[(2'h3):(2'h2)]) : wire38[(5'h13):(4'hc)]),
                  reg42} : (8'ha5)))
            begin
              reg43 <= (^reg42);
              reg44 <= $unsigned(wire39);
            end
          else
            begin
              reg43 <= {wire37[(3'h5):(1'h1)],
                  $signed(((wire37[(2'h2):(2'h2)] >= (reg47 || reg48)) | (~{(8'ha1),
                      (8'hb5)})))};
              reg44 <= $unsigned((~^$unsigned(reg48[(2'h2):(2'h2)])));
            end
          reg45 <= (($unsigned((wire39[(3'h7):(2'h2)] << $unsigned(reg48))) >>> {$unsigned({(8'hae)})}) < reg41[(2'h3):(2'h2)]);
        end
    end
  assign wire49 = reg48[(2'h2):(2'h2)];
  assign wire50 = ($unsigned(reg46) > $signed(reg46));
  assign wire51 = (((wire36 ?
                      $signed($signed(wire38)) : reg46[(3'h5):(1'h1)]) * (~$unsigned($signed(wire50)))) != $unsigned(wire49));
  always
    @(posedge clk) begin
      reg52 <= {(^$unsigned((|(+(7'h43))))),
          (reg45[(2'h2):(2'h2)] ?
              wire36[(3'h7):(3'h6)] : $signed((|(reg46 != (8'hbf)))))};
      reg53 <= (~&($signed((^wire38[(2'h3):(2'h2)])) ~^ $unsigned({(reg42 ?
              reg44 : reg45),
          wire49})));
    end
  module54 #() modinst77 (.wire59(reg45), .wire57(reg42), .y(wire76), .wire55(reg48), .wire58(reg41), .wire56(reg46), .clk(clk));
  assign wire78 = $signed((reg52 ?
                      (wire36[(4'hc):(1'h0)] >>> reg53[(4'h9):(3'h5)]) : wire51[(2'h2):(2'h2)]));
  assign wire79 = $unsigned(reg45);
  assign wire80 = (((8'hac) - wire76) ?
                      {{wire49[(4'h8):(3'h5)]}, wire51} : reg43);
  assign wire81 = (-$signed((wire76 <= ((wire76 ? wire49 : wire49) ?
                      wire36[(2'h2):(2'h2)] : (+wire78)))));
  assign wire82 = wire80[(2'h3):(1'h0)];
  assign wire83 = {$signed((+(|$unsigned(wire51))))};
  assign wire84 = $unsigned((wire81 * (((reg48 << wire79) ?
                      (-(7'h40)) : wire82[(2'h2):(2'h2)]) ^~ (~&wire36))));
  assign wire85 = reg42[(3'h6):(2'h2)];
  assign wire86 = $signed(({(~|wire82), wire50[(2'h2):(1'h1)]} ?
                      (!($unsigned(wire49) ?
                          (+wire81) : {(8'hb5), (8'ha8)})) : {(8'hae),
                          $unsigned({wire38})}));
  assign wire87 = ($unsigned($unsigned({(reg48 ? (8'h9d) : reg48),
                      wire40})) > $signed((~|($unsigned(wire37) >> (~^wire78)))));
  assign wire88 = $unsigned($signed((&(((8'ha1) ? wire85 : reg46) ?
                      wire50 : (wire39 ? reg46 : reg44)))));
  assign wire89 = ((8'hac) ?
                      (8'hb9) : $unsigned($unsigned(reg47[(3'h4):(1'h1)])));
  assign wire90 = wire40;
  assign wire91 = wire82[(1'h0):(1'h0)];
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire59;
  input wire [(5'h10):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire signed [(4'ha):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  assign y = {wire75,
                 wire74,
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
                 (1'h0)};
  assign wire60 = $signed($signed(wire59[(3'h5):(2'h2)]));
  assign wire61 = ($unsigned(wire59) ?
                      (8'haa) : ((wire56[(4'hf):(1'h0)] == (8'hbb)) ?
                          $signed($signed(wire58)) : wire58[(2'h3):(1'h0)]));
  assign wire62 = (-(-$unsigned(((&wire61) * wire58[(5'h10):(4'hb)]))));
  assign wire63 = {(|(|$unsigned((wire56 << wire60))))};
  assign wire64 = (((((~&wire62) || $signed(wire62)) << ($signed(wire56) && ((8'ha0) ?
                      (8'hbb) : wire63))) <<< ((7'h42) + (&wire59))) == wire56);
  assign wire65 = ($signed(wire56[(4'h8):(3'h4)]) ?
                      wire62[(3'h4):(2'h2)] : wire64[(3'h4):(1'h1)]);
  assign wire66 = $unsigned(($unsigned((^(!wire59))) << (^wire58[(4'hf):(3'h7)])));
  assign wire67 = (&($unsigned(wire57[(3'h4):(3'h4)]) || ({{wire62, wire64},
                          {wire65}} ?
                      {wire57[(3'h4):(3'h4)],
                          (wire56 - wire58)} : wire55[(3'h7):(3'h4)])));
  assign wire68 = (wire59 ?
                      $signed($unsigned({{wire65}})) : {{$signed(wire62),
                              (7'h43)}});
  assign wire69 = {(~|$unsigned(({(8'hb7), wire56} < $signed(wire60))))};
  assign wire70 = $unsigned({$signed(wire59[(3'h7):(2'h2)]), wire67});
  assign wire71 = $unsigned($unsigned((8'hbc)));
  assign wire72 = ($signed((({wire66, wire65} >= wire71[(2'h3):(1'h0)]) ?
                          $signed($unsigned(wire71)) : $unsigned($signed(wire59)))) ?
                      (-(~|(|$unsigned((8'haf))))) : {$unsigned(((~|wire57) - $signed((7'h41))))});
  assign wire73 = wire67[(3'h6):(3'h6)];
  assign wire74 = $signed(($unsigned((~^(wire65 ?
                      wire61 : wire71))) << wire65));
  assign wire75 = (^~wire58);
endmodule

module top
#(parameter param77 = (!((|({(8'hb6)} + {(8'ha9)})) | (^~(((8'ha9) ? (8'hae) : (8'hb0)) ? (!(8'hb4)) : (~|(8'hae)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire48,
                 wire46,
                 wire44,
                 wire7,
                 wire6,
                 wire5,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 (1'h0)};
  assign wire5 = $signed((wire4 << $unsigned((8'hbf))));
  assign wire6 = wire0[(3'h7):(3'h5)];
  assign wire7 = wire3;
  module8 #() modinst45 (wire44, clk, wire1, wire6, wire2, wire5);
  assign wire46 = (wire0 ?
                      wire4[(2'h2):(2'h2)] : (wire2[(1'h1):(1'h1)] - $signed(((wire3 ?
                              wire4 : wire1) ?
                          $unsigned(wire6) : (wire5 ? wire2 : wire0)))));
  always
    @(posedge clk) begin
      reg47 <= $unsigned(($unsigned(($signed(wire1) || $unsigned((8'haf)))) ?
          $unsigned(wire46[(4'h8):(3'h4)]) : wire0[(4'h9):(3'h5)]));
    end
  assign wire48 = (wire1[(1'h1):(1'h1)] < $unsigned(wire2[(4'hd):(4'hd)]));
  always
    @(posedge clk) begin
      if ((((((wire44 || wire7) ^~ $unsigned(wire7)) && (wire6[(4'h9):(3'h7)] ?
          $unsigned(wire48) : {wire48})) < $unsigned($signed(wire0))) >>> wire46))
        begin
          reg49 <= wire44[(3'h4):(2'h3)];
        end
      else
        begin
          reg49 <= ($unsigned((wire0 >> $signed($signed(wire6)))) & (wire5[(1'h1):(1'h0)] ?
              (wire46 ?
                  {wire2,
                      wire48[(4'hf):(4'hc)]} : {(wire0 - wire3)}) : wire46[(5'h12):(2'h2)]));
          if ($signed(((($unsigned(wire4) ? (~wire1) : $signed(wire1)) ?
              (!$signed(wire3)) : wire4[(3'h7):(3'h6)]) ~^ $signed((~&wire46[(2'h2):(1'h0)])))))
            begin
              reg50 <= $signed($unsigned(wire4));
            end
          else
            begin
              reg50 <= wire3[(3'h7):(3'h6)];
              reg51 <= $unsigned(((($unsigned((8'ha9)) & $unsigned(wire0)) ?
                      $signed((!wire1)) : $unsigned(((8'hbc) >> wire3))) ?
                  $unsigned((8'hb9)) : wire4));
              reg52 <= reg47;
            end
          reg53 <= (&$unsigned(reg51));
          if ($unsigned((8'ha7)))
            begin
              reg54 <= wire6[(4'h8):(3'h7)];
              reg55 <= $signed(({reg52[(2'h2):(1'h0)]} ?
                  $signed(((~&wire4) ?
                      $signed(wire5) : $signed(wire44))) : (wire4 < {$unsigned(reg49),
                      $signed((8'hbf))})));
            end
          else
            begin
              reg54 <= (7'h42);
            end
        end
      reg56 <= $signed((reg47[(4'he):(1'h1)] ? (~|(+wire6)) : (8'h9d)));
      reg57 <= (~|($unsigned($unsigned($unsigned(wire0))) && $signed($unsigned(reg55))));
      reg58 <= $unsigned((wire5 ~^ wire0));
    end
  assign wire59 = (($signed(wire1) ?
                          (({(8'hb5), wire0} > reg53) ?
                              $signed((^~reg58)) : (wire48[(4'h8):(4'h8)] ?
                                  $unsigned(reg58) : wire3[(4'he):(3'h5)])) : wire0[(4'ha):(2'h2)]) ?
                      (~($signed((wire44 ?
                          wire7 : reg51)) || (&$signed(reg54)))) : (^~((reg53 ?
                          {wire1} : (reg55 ?
                              wire4 : reg49)) <= ($unsigned(wire46) << {(7'h40)}))));
  assign wire60 = reg58;
  assign wire61 = wire59;
  assign wire62 = $signed($signed($signed($unsigned($signed(wire0)))));
  assign wire63 = (7'h40);
  assign wire64 = wire44;
  assign wire65 = (+(^~$unsigned((^~(~wire46)))));
  always
    @(posedge clk) begin
      reg66 <= $unsigned((~(wire59 != (~&(wire1 <= reg54)))));
      if (({(+reg58[(3'h4):(2'h3)]),
          (wire4[(1'h0):(1'h0)] <<< $unsigned({wire44,
              reg57}))} > $signed($unsigned($unsigned($signed(wire1))))))
        begin
          reg67 <= $unsigned((($unsigned((^~reg58)) ?
              $signed(wire44) : ((!wire60) ?
                  reg57 : $unsigned(reg57))) | $signed((reg47[(4'he):(1'h0)] ?
              reg57 : ((7'h44) ^~ reg51)))));
          reg68 <= $signed({$unsigned($signed((wire60 ? (8'ha7) : reg47))),
              ($signed((wire65 - (8'ha4))) << reg52)});
        end
      else
        begin
          reg67 <= $unsigned(reg68);
          reg68 <= (!$signed(($unsigned(wire44[(1'h0):(1'h0)]) ?
              wire44 : wire63)));
        end
      if (wire6)
        begin
          if (wire5)
            begin
              reg69 <= wire62;
              reg70 <= $signed($signed((((wire44 ?
                      reg69 : wire62) << $signed(wire48)) ?
                  $unsigned((wire7 & wire48)) : $unsigned(reg49))));
            end
          else
            begin
              reg69 <= reg51[(4'hc):(4'h9)];
            end
          reg71 <= $signed($unsigned($unsigned($signed($signed(wire0)))));
        end
      else
        begin
          reg69 <= $signed((wire48[(2'h3):(1'h1)] ?
              (((wire60 + reg53) == $signed((7'h43))) ?
                  (8'haf) : $signed((-wire7))) : (wire65 * wire46)));
          reg70 <= (8'hba);
          reg71 <= {$signed(wire7),
              (((reg71[(4'he):(4'ha)] ? {wire59, wire48} : (reg53 & reg49)) ?
                  ($unsigned(wire59) ?
                      reg49 : (reg70 * reg55)) : ((8'hbb) && (reg47 ?
                      reg49 : reg70))) | $unsigned((|(!wire3))))};
          reg72 <= reg55[(2'h3):(2'h3)];
        end
      reg73 <= $signed((+$signed(((wire46 ? wire3 : (8'haf)) ?
          (reg69 != wire1) : reg66[(1'h0):(1'h0)]))));
    end
  assign wire74 = {{(^~((wire3 < reg54) ? reg56 : wire63))}};
  assign wire75 = {$signed($unsigned($unsigned(wire60[(3'h4):(2'h3)]))),
                      $signed($signed(({wire1} ? (wire46 & wire64) : reg50)))};
  assign wire76 = (|(~&(-$signed(wire46[(4'hf):(2'h3)]))));
endmodule

module module8
#(parameter param43 = (~&(((~|{(8'hb3)}) ? ((-(8'h9c)) | ((8'hb5) ? (8'hb1) : (8'ha7))) : (8'haf)) ? ((8'hba) ? ((8'hbb) >= (-(8'hbf))) : {((7'h40) ? (8'ha3) : (8'ha2)), (+(8'hb5))}) : (~|(!((8'haf) ? (8'h9e) : (7'h42)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire13 = (^~(^(~(8'hae))));
  assign wire14 = wire13;
  assign wire15 = $unsigned($unsigned((^~(!{wire9}))));
  assign wire16 = wire13;
  assign wire17 = wire9;
  assign wire18 = wire12[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg19 <= {$unsigned(((!$signed(wire13)) | $signed($signed(wire13))))};
      reg20 <= (8'hab);
      if (($signed((~&$signed((^wire16)))) | (-($unsigned(reg19) ?
          reg19[(2'h3):(1'h1)] : wire9))))
        begin
          reg21 <= wire13;
        end
      else
        begin
          reg21 <= (wire13 ^~ wire11);
        end
      reg22 <= ($signed($unsigned($unsigned($unsigned((8'ha0))))) * ({wire15} ?
          wire10 : wire15));
      if ($unsigned($signed(($signed((^reg20)) == $unsigned(((8'hb0) ?
          reg20 : wire10))))))
        begin
          reg23 <= $signed($unsigned($signed(wire10)));
          reg24 <= ((~|$unsigned($signed((wire10 != wire12)))) >= (+(~|((reg19 * wire18) != $signed(wire15)))));
          reg25 <= {wire16[(1'h0):(1'h0)],
              (($signed($signed(wire15)) <= {$signed(reg21)}) ?
                  reg24[(1'h0):(1'h0)] : (wire11 * $signed(reg20[(1'h1):(1'h0)])))};
        end
      else
        begin
          reg23 <= (^(^{(wire17[(4'he):(3'h4)] >>> $signed(reg21))}));
          if ($unsigned(($unsigned(reg21[(3'h5):(2'h2)]) ?
              wire14 : $signed($unsigned(wire14)))))
            begin
              reg24 <= ($unsigned(wire10) <= $unsigned(reg23[(2'h3):(2'h3)]));
              reg25 <= (~|(wire17 ?
                  $signed($unsigned({(7'h40)})) : (^~(((8'ha9) ?
                          wire12 : wire18) ?
                      wire11 : wire15[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg24 <= {($signed(reg19[(4'h8):(3'h4)]) ?
                      ((8'haa) >>> $unsigned((!wire18))) : wire12[(2'h2):(2'h2)]),
                  (~|$signed((reg22 ? (+wire17) : reg22)))};
              reg25 <= (!wire17[(3'h4):(2'h2)]);
              reg26 <= (~(wire11[(2'h2):(1'h0)] | reg24[(1'h0):(1'h0)]));
              reg27 <= (wire17 ^~ reg26[(4'h8):(1'h0)]);
            end
          reg28 <= reg27[(3'h4):(2'h3)];
          if ($unsigned(wire9[(4'he):(3'h4)]))
            begin
              reg29 <= (~^reg25);
              reg30 <= ($signed((reg23 <= $unsigned((wire13 ?
                      (8'hb8) : reg29)))) ?
                  $signed((-(-(8'ha7)))) : {(((~^reg21) << $unsigned(reg26)) ?
                          ((reg25 << (8'hab)) ?
                              $signed((8'hbd)) : $unsigned(reg26)) : {reg28[(1'h1):(1'h1)],
                              $signed(wire10)}),
                      $unsigned(($unsigned((8'hac)) ?
                          $unsigned((8'ha6)) : wire17[(3'h7):(1'h1)]))});
              reg31 <= $unsigned($unsigned($unsigned(wire14)));
              reg32 <= reg19[(1'h1):(1'h1)];
              reg33 <= (!reg20);
            end
          else
            begin
              reg29 <= (~|$signed($unsigned({reg28[(4'hd):(1'h0)],
                  $unsigned((8'h9d))})));
            end
          reg34 <= ($unsigned(($unsigned(((8'ha9) ? reg23 : (8'ha8))) ?
              $signed($signed(reg29)) : $unsigned(reg27[(4'hb):(1'h0)]))) <<< (~|$unsigned($signed(wire18))));
        end
    end
  always
    @(posedge clk) begin
      reg35 <= ((8'hb7) & (^reg30[(3'h4):(3'h4)]));
      reg36 <= $unsigned(reg20[(4'hd):(2'h3)]);
      reg37 <= $unsigned(wire10[(4'h8):(3'h6)]);
      reg38 <= (~|((7'h41) ^ (($signed(reg37) ? $unsigned(reg31) : (8'hb9)) ?
          wire16 : $unsigned($unsigned(reg37)))));
    end
  assign wire39 = reg31[(3'h6):(3'h4)];
  assign wire40 = (reg27[(3'h4):(3'h4)] >>> $unsigned((({(7'h44),
                          reg34} - $signed(reg37)) ?
                      wire13 : ($unsigned(reg28) && wire9[(5'h11):(2'h3)]))));
  assign wire41 = ($signed(wire18) & reg33);
  assign wire42 = (reg38[(3'h4):(3'h4)] ~^ $signed(($signed($unsigned(reg24)) ^ (~|(reg23 ?
                      reg24 : reg29)))));
endmodule

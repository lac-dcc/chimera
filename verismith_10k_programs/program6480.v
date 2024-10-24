module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire74;
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire74,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire5 = (|(&wire1[(3'h4):(1'h0)]));
  assign wire6 = ((~^{wire3[(1'h0):(1'h0)], (&wire1)}) >= wire5[(2'h2):(2'h2)]);
  assign wire7 = (wire3 ~^ wire0);
  assign wire8 = (wire1[(1'h1):(1'h0)] * ((8'h9f) ^ $unsigned((7'h44))));
  assign wire9 = (~wire0[(4'he):(3'h6)]);
  assign wire10 = {wire6, wire0};
  assign wire11 = (^~(&wire10));
  module12 #() modinst75 (.wire13(wire0), .wire16(wire7), .wire15(wire11), .wire14(wire5), .clk(clk), .y(wire74), .wire17(wire8));
  always
    @(posedge clk) begin
      reg76 <= ((wire2[(3'h7):(3'h6)] <<< ($signed($unsigned(wire0)) > (^~wire0[(4'hc):(4'ha)]))) - $unsigned((-(~^wire74[(1'h0):(1'h0)]))));
      reg77 <= (wire9[(1'h1):(1'h0)] >>> $unsigned($signed(wire4)));
    end
  assign wire78 = $signed($unsigned($signed((wire0[(4'ha):(3'h6)] ?
                      $unsigned(wire3) : wire9))));
  assign wire79 = wire0[(4'hb):(4'hb)];
  assign wire80 = (wire8[(1'h0):(1'h0)] <= (($signed((~wire79)) ?
                          $unsigned((~^(8'hb0))) : $unsigned((wire1 ?
                              wire4 : wire7))) ?
                      (8'hbb) : wire79));
  assign wire81 = ($signed(wire80) << wire7[(4'hf):(3'h5)]);
endmodule

module module12
#(parameter param73 = ((~^(-({(8'h9e), (8'haa)} ? (8'ha2) : ((8'hb5) ? (8'h9f) : (8'hb1))))) == {{((!(8'ha7)) * ((7'h44) >= (8'h9d)))}}))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  assign y = {wire72, wire71, wire70, wire69, wire68, wire66, (1'h0)};
  module18 #() modinst67 (.wire19(wire14), .wire20(wire16), .wire21(wire17), .clk(clk), .y(wire66), .wire22(wire13));
  assign wire68 = ((($unsigned((wire17 ? wire66 : wire17)) ?
                          (8'h9c) : $unsigned((wire17 ? wire13 : (8'hb1)))) ?
                      (wire16[(3'h6):(3'h6)] ?
                          $signed(wire66[(4'hd):(4'hc)]) : (~|((8'had) > wire13))) : wire15) && (($signed((8'ha5)) == wire16) ?
                      $signed((wire15[(2'h2):(1'h0)] >> (&(8'hb5)))) : wire66));
  assign wire69 = wire68;
  assign wire70 = $signed((|$unsigned((((8'haf) ?
                      wire68 : wire16) == (wire68 ^ wire15)))));
  assign wire71 = $signed((~$signed(($signed(wire69) ?
                      ((8'ha8) ~^ wire68) : $signed(wire66)))));
  assign wire72 = $unsigned(({wire71[(4'hd):(3'h5)],
                      (|$signed(wire70))} ^ (^$signed((^~wire66)))));
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire23;
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire45,
                 wire44,
                 wire43,
                 wire23,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = wire20;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($unsigned(wire19) ?
          wire22 : $signed($signed(wire19))))))
        begin
          if ($unsigned($unsigned(($signed((wire20 ?
              wire22 : wire20)) && wire22))))
            begin
              reg24 <= $signed($signed(((&wire22) <= ($signed(wire23) * wire21[(3'h4):(1'h0)]))));
            end
          else
            begin
              reg24 <= $unsigned((|$signed((-$unsigned(wire23)))));
              reg25 <= wire20[(4'hd):(4'hc)];
              reg26 <= wire19;
              reg27 <= $unsigned(wire19[(1'h0):(1'h0)]);
            end
          if (wire22)
            begin
              reg28 <= reg27;
            end
          else
            begin
              reg28 <= wire23[(1'h1):(1'h0)];
              reg29 <= (8'hb1);
              reg30 <= (($signed($unsigned((~^reg24))) ?
                      $signed(((wire23 > wire22) ?
                          reg24 : (reg29 - reg24))) : $unsigned(reg27)) ?
                  (reg26[(5'h11):(4'h9)] ?
                      {((!reg29) ?
                              reg26 : $unsigned((8'hba)))} : (~(&$signed(reg25)))) : reg28[(3'h4):(2'h3)]);
            end
        end
      else
        begin
          reg24 <= ((^~(($unsigned(wire21) ?
                      ((8'hb5) ? (8'ha3) : wire20) : reg24[(4'ha):(3'h4)]) ?
                  (^~{reg30, reg26}) : (reg28 ?
                      wire21[(3'h6):(2'h2)] : $unsigned((8'hbe))))) ?
              {$unsigned((reg25[(2'h2):(2'h2)] && (reg24 <<< reg28)))} : (+(((+(8'ha5)) ?
                      $unsigned(wire19) : reg26) ?
                  reg26[(5'h14):(5'h11)] : wire23)));
          reg25 <= {(8'h9e), wire19};
          reg26 <= reg29;
        end
      reg31 <= $unsigned((~^reg28));
      if ($unsigned($signed(reg25)))
        begin
          if (($unsigned((({(8'haa)} * (wire23 && reg24)) ?
                  $unsigned((^reg25)) : $signed((reg24 - reg26)))) ?
              {$unsigned(reg28),
                  $signed(((reg27 ?
                      (8'hbc) : (8'hb9)) & $signed(wire22)))} : (($unsigned($unsigned((8'hb1))) ?
                  $unsigned($signed(reg31)) : ((reg30 ?
                      reg30 : (8'hac)) && (~|wire23))) | (!(reg31 ?
                  (~(7'h41)) : $signed((8'hac)))))))
            begin
              reg32 <= ($signed($signed($unsigned({wire19}))) || ($signed(($unsigned((8'hb6)) ?
                  $signed(reg27) : (reg26 ?
                      wire21 : reg27))) <= $unsigned({$unsigned(reg26)})));
              reg33 <= (~^reg29[(3'h5):(1'h1)]);
              reg34 <= $signed(reg26);
              reg35 <= $unsigned(({reg31[(1'h1):(1'h0)],
                      $signed($unsigned(wire23))} ?
                  reg28 : wire20[(4'h8):(4'h8)]));
            end
          else
            begin
              reg32 <= $unsigned(({(wire23 > {(8'h9c), reg24}),
                      wire20[(4'he):(4'hd)]} ?
                  reg27 : (|{(reg24 ? reg24 : wire20)})));
              reg33 <= reg24[(4'ha):(1'h0)];
              reg34 <= ({({(8'h9f)} ^~ (8'hb7)),
                  (reg25[(2'h2):(1'h1)] ?
                      $unsigned($signed(reg25)) : (~(-reg31)))} ^ (^~({reg26} ^ (+$signed(reg24)))));
              reg35 <= wire21;
              reg36 <= $unsigned($signed((8'ha4)));
            end
          if ((((&reg35) ? reg32[(3'h4):(2'h3)] : $signed(reg26)) ?
              wire20 : $signed({$unsigned($signed(wire21))})))
            begin
              reg37 <= reg29[(4'hc):(4'h8)];
              reg38 <= ((reg32[(3'h4):(1'h0)] ?
                  (reg24 - ((8'ha0) ?
                      (reg25 - (7'h40)) : {reg26})) : reg32[(3'h6):(2'h2)]) >>> $signed({reg30}));
              reg39 <= ((+(|($unsigned(reg37) ?
                      $unsigned((7'h43)) : (!wire21)))) ?
                  {($signed(reg28) << reg32[(3'h4):(2'h3)]), wire23} : reg33);
              reg40 <= {(~$unsigned(({(8'hbd), wire22} ?
                      (~^reg34) : reg35[(4'hc):(4'hb)]))),
                  reg31[(4'hc):(4'hb)]};
            end
          else
            begin
              reg37 <= $signed(reg26);
              reg38 <= reg28[(2'h3):(2'h2)];
            end
          reg41 <= ($unsigned(reg30[(1'h0):(1'h0)]) ?
              $unsigned(wire22[(3'h7):(3'h5)]) : wire23);
          reg42 <= (reg34 ?
              wire22 : $unsigned((($unsigned(reg25) >= reg24[(1'h0):(1'h0)]) ~^ (7'h44))));
        end
      else
        begin
          reg32 <= ((($unsigned($signed(wire22)) != reg34) > reg41[(3'h7):(2'h2)]) & $unsigned($signed({(^~reg30)})));
          reg33 <= $unsigned($signed({(|reg26)}));
          if ((|reg41))
            begin
              reg34 <= {$unsigned(reg29)};
            end
          else
            begin
              reg34 <= reg38;
            end
          reg35 <= $unsigned((~&$unsigned((-(wire20 > reg32)))));
        end
    end
  assign wire43 = reg26[(2'h2):(1'h1)];
  assign wire44 = $unsigned(reg36[(4'h8):(4'h8)]);
  assign wire45 = ($signed({$unsigned((!reg27)),
                          ((reg29 ? (8'ha3) : (8'h9e)) >= $signed(reg42))}) ?
                      (reg24[(3'h5):(3'h5)] <= wire20[(4'hf):(3'h6)]) : $signed({({reg38,
                              reg28} >> reg34)}));
  always
    @(posedge clk) begin
      reg46 <= $unsigned((wire43 ?
          {($unsigned(reg37) << {wire43, reg28}),
              (8'hb9)} : $unsigned(($unsigned((8'hb7)) ?
              $unsigned(wire23) : wire21))));
      reg47 <= (((&$signed((reg29 ? reg24 : (8'hb8)))) ?
              (8'ha0) : $unsigned((wire23[(1'h0):(1'h0)] <<< (^reg38)))) ?
          {$signed(wire43),
              $signed((wire44[(3'h6):(3'h4)] ?
                  reg30 : $unsigned((7'h41))))} : {$signed(reg36),
              {((wire23 ? reg31 : reg36) ? (^~reg24) : reg41)}});
      reg48 <= (~&reg25[(2'h3):(1'h1)]);
      reg49 <= (&$signed($unsigned({(^reg41), reg29})));
      if (((!((reg38[(2'h2):(1'h0)] >> ((8'ha1) >= reg46)) ?
          ($signed(reg49) ?
              $unsigned(reg27) : (reg39 ?
                  (8'ha7) : wire20)) : (wire21 <= $signed((7'h44))))) < (^~reg31)))
        begin
          reg50 <= ({(wire21 ? $unsigned({(8'hb6), reg34}) : reg24),
              reg35} && reg31[(3'h5):(2'h3)]);
          reg51 <= $signed(wire21[(2'h3):(2'h3)]);
          reg52 <= ((($unsigned(reg31) & ($unsigned(wire21) <= $signed(reg29))) ~^ (!({reg26} ?
                  (wire44 ? reg29 : wire45) : (~&reg46)))) ?
              reg40 : {$unsigned(reg24[(1'h0):(1'h0)]),
                  {reg42, reg29[(4'hb):(1'h1)]}});
          reg53 <= ((reg27[(2'h2):(2'h2)] ?
                  $signed(reg27[(3'h6):(1'h1)]) : $signed({(&reg33),
                      $signed(reg35)})) ?
              $unsigned((reg50 >> $signed(((7'h41) == reg25)))) : wire21[(3'h4):(1'h1)]);
        end
      else
        begin
          if ((~|(~|$signed((!$unsigned(wire19))))))
            begin
              reg50 <= reg39;
              reg51 <= $unsigned((^(+(~&(reg33 ? reg48 : wire22)))));
              reg52 <= $signed(reg31);
              reg53 <= (reg34 >>> ($unsigned((((8'hbf) ? reg30 : wire20) ?
                      reg27[(2'h2):(1'h0)] : $signed(wire22))) ?
                  reg48 : ((reg46[(4'hc):(1'h1)] ^~ $signed(reg38)) ~^ reg50[(1'h1):(1'h0)])));
            end
          else
            begin
              reg50 <= ({$signed(wire43)} ?
                  $signed((+reg39[(4'hd):(4'ha)])) : ($signed($unsigned(reg41)) | reg38[(3'h5):(1'h0)]));
              reg51 <= ((-((-$signed(reg52)) ?
                  reg26[(4'ha):(1'h1)] : {reg27,
                      (reg41 <= reg41)})) >>> $unsigned($unsigned((^~(reg41 ?
                  reg53 : wire44)))));
              reg52 <= reg34[(3'h5):(1'h1)];
            end
          reg54 <= reg27[(2'h2):(1'h0)];
          reg55 <= (({(&reg51[(4'he):(4'hb)])} & reg28[(2'h3):(2'h3)]) * wire19[(1'h0):(1'h0)]);
          reg56 <= $signed((&reg32));
        end
    end
  assign wire57 = reg50[(1'h0):(1'h0)];
  assign wire58 = reg36;
  assign wire59 = $unsigned((reg42 <<< (8'hb3)));
  assign wire60 = {reg46[(1'h0):(1'h0)]};
  assign wire61 = $signed($signed(({(wire19 <= reg29), reg36[(4'hd):(4'hd)]} ?
                      (reg51 ?
                          (^~reg36) : reg31) : $signed($unsigned(reg51)))));
  assign wire62 = $unsigned($unsigned({reg48}));
  assign wire63 = wire44;
  assign wire64 = $signed((~|((-(-reg32)) ?
                      (~$signed(reg36)) : ((wire23 < reg56) ?
                          ((7'h43) != reg40) : (reg25 ? reg32 : reg40)))));
  assign wire65 = (reg27 ?
                      reg39[(3'h7):(2'h2)] : $unsigned(wire59[(5'h12):(4'hd)]));
endmodule

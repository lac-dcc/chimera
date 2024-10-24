module top
#(parameter param47 = {(~^(~&(((8'ha1) ? (8'haa) : (8'hae)) < ((8'hb9) && (8'hbe)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire4,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst22 (.y(wire21), .wire6(wire1), .wire9(wire2), .wire7(wire3), .wire8(wire4), .clk(clk));
  assign wire23 = ({$unsigned({$signed((7'h41)), wire1[(3'h7):(3'h5)]}),
                          wire0[(4'hc):(3'h6)]} ?
                      ($unsigned((~^(wire21 << (8'had)))) | wire2) : {((wire21 ?
                              wire2[(4'hb):(4'h8)] : $signed(wire4)) == wire4[(1'h0):(1'h0)])});
  assign wire24 = {((8'ha1) ?
                          (wire1 ^ ((8'hbc) != $signed(wire21))) : {wire3,
                              (8'hbd)})};
  assign wire25 = (($unsigned(wire24[(1'h0):(1'h0)]) ?
                      (8'hbe) : ($signed(wire0[(4'he):(1'h1)]) ?
                          $unsigned((wire0 - wire4)) : $unsigned(wire0[(4'hf):(4'he)]))) & (|(!((^wire2) >> $signed(wire21)))));
  always
    @(posedge clk) begin
      reg26 <= ($signed(((((8'h9f) ? wire21 : wire4) >= (~|wire21)) ?
              wire1[(3'h5):(2'h2)] : ((wire3 ? wire23 : wire25) || ((8'ha5) ?
                  wire24 : wire0)))) ?
          {{wire23[(4'h9):(2'h2)]}} : (wire3 <<< (($unsigned(wire1) ?
              (wire25 ?
                  wire0 : wire2) : $unsigned(wire21)) >= {(wire25 << (8'hbb)),
              ((7'h43) >= wire21)})));
      if ((^(+{wire0, $unsigned($unsigned(wire21))})))
        begin
          reg27 <= ($signed((wire25 ?
                  $unsigned(wire25[(1'h1):(1'h1)]) : (~|(wire25 == wire21)))) ?
              (($unsigned(wire23[(2'h3):(2'h2)]) ^ $unsigned($signed(wire1))) ?
                  (&$signed($signed(wire2))) : (wire23 + ($signed(wire21) ?
                      (!wire3) : $unsigned(wire25)))) : (-(~^(^$unsigned(wire0)))));
          if (($signed(wire25) ?
              ((8'hb8) ^ ($unsigned((~|reg27)) >= $unsigned((^~(8'haf))))) : wire24))
            begin
              reg28 <= ((+wire0) ?
                  wire0[(4'hc):(2'h3)] : ({$unsigned($unsigned(wire21)),
                      (~|{(8'hbe)})} == $unsigned($signed(wire1))));
              reg29 <= reg27;
              reg30 <= (8'h9c);
            end
          else
            begin
              reg28 <= $signed($unsigned($unsigned((&wire21))));
              reg29 <= $unsigned(wire25[(2'h2):(2'h2)]);
              reg30 <= wire21;
              reg31 <= (-$signed(wire4));
            end
          if (((wire0 ?
                  (wire21 ?
                      wire25[(2'h2):(2'h2)] : reg28[(4'hb):(3'h6)]) : (wire24[(2'h2):(2'h2)] ?
                      ((wire2 > wire3) ?
                          $unsigned(wire25) : (~^reg30)) : wire2)) ?
              (reg26[(2'h3):(2'h3)] ?
                  $unsigned(wire21[(2'h2):(1'h0)]) : ({wire0} * reg29[(4'h8):(4'h8)])) : (reg26[(3'h7):(3'h4)] & $unsigned(reg27[(3'h5):(3'h4)]))))
            begin
              reg32 <= ((!$unsigned(((~|(8'ha8)) ?
                  wire25 : (wire25 ? reg29 : reg30)))) > (^~reg27));
              reg33 <= $unsigned({{((8'ha6) >= wire21[(1'h0):(1'h0)])}});
            end
          else
            begin
              reg32 <= wire0[(3'h6):(2'h3)];
              reg33 <= wire24;
              reg34 <= ((wire21[(3'h5):(1'h1)] && reg30[(4'hb):(4'ha)]) - $signed($signed((reg30 ?
                  (wire4 ? reg29 : wire23) : wire1))));
              reg35 <= (($unsigned(wire21[(3'h7):(1'h0)]) ?
                  (reg29[(4'hc):(1'h0)] <<< $signed(wire0[(3'h5):(3'h4)])) : (({wire24} ?
                          ((8'hb9) ? wire21 : wire0) : (8'hb9)) ?
                      (reg30 || ((8'hb0) ^ wire23)) : ($signed((8'hb6)) * $unsigned(reg33)))) <= reg27);
            end
          if ((8'hb7))
            begin
              reg36 <= reg30[(2'h3):(2'h2)];
            end
          else
            begin
              reg36 <= wire24;
              reg37 <= (($signed($unsigned(wire24[(3'h4):(1'h1)])) ?
                  (8'had) : (wire0[(4'he):(4'h8)] ?
                      ($unsigned((8'ha5)) ?
                          $signed((8'ha1)) : (^reg30)) : $unsigned($signed((8'h9f))))) ^ $unsigned(wire25));
              reg38 <= $unsigned($unsigned((wire2[(5'h10):(4'he)] && reg29[(2'h2):(2'h2)])));
              reg39 <= (^~$signed((|(&wire23))));
              reg40 <= (($signed($signed((~|wire3))) ? reg28 : wire25) ?
                  reg32[(3'h5):(3'h5)] : (($unsigned($signed(reg38)) <<< reg34[(2'h2):(2'h2)]) ?
                      (wire25[(1'h1):(1'h0)] >>> reg33[(2'h3):(2'h2)]) : (~(reg29[(4'h8):(3'h6)] ?
                          (~wire4) : reg33[(1'h0):(1'h0)]))));
            end
          reg41 <= wire1;
        end
      else
        begin
          reg27 <= wire4[(1'h0):(1'h0)];
          reg28 <= $unsigned(reg27);
        end
      if ($signed(($signed(reg38[(3'h7):(1'h1)]) == (~^reg38[(5'h15):(4'he)]))))
        begin
          reg42 <= {reg32[(1'h1):(1'h0)]};
        end
      else
        begin
          if ({(wire23[(4'hd):(2'h3)] << (wire24 ?
                  reg41 : reg34[(1'h1):(1'h0)])),
              reg30[(2'h3):(2'h3)]})
            begin
              reg42 <= (reg39[(1'h1):(1'h0)] ?
                  $signed((($unsigned(reg29) == $unsigned(reg31)) ?
                      ((8'hbb) != $unsigned((8'hb2))) : $unsigned($unsigned(reg32)))) : reg30);
              reg43 <= reg29;
            end
          else
            begin
              reg42 <= (wire25 ?
                  ((reg32 + reg26) ?
                      $unsigned($unsigned((reg37 ?
                          reg27 : reg42))) : $signed((^(^reg28)))) : ($unsigned((~^wire2)) ~^ (wire3 ?
                      (~^(+reg36)) : $unsigned($unsigned(reg43)))));
            end
          reg44 <= ($unsigned(wire21[(4'h8):(2'h2)]) ?
              $signed($unsigned(wire3)) : wire21[(2'h2):(2'h2)]);
        end
    end
  assign wire45 = $unsigned($signed({wire1[(3'h7):(3'h7)], reg42}));
  assign wire46 = (~&$signed(((~&((7'h44) ? wire4 : (8'hae))) ?
                      (^~{reg29}) : ((8'ha7) ?
                          (~^wire24) : (wire3 ? wire3 : wire24)))));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire10;
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire10,
                 reg20,
                 reg19,
                 reg18,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = wire6[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg11 <= wire10[(4'hc):(3'h5)];
      reg12 <= (&$unsigned(($signed((^wire10)) >> wire9)));
    end
  assign wire13 = (^($unsigned($signed((wire8 >= wire7))) ?
                      (|reg11) : $signed(wire7)));
  assign wire14 = (({wire7, $signed(wire6)} < (((wire8 ?
                              reg11 : wire9) <<< wire10) ?
                          (((8'hb7) ? wire6 : wire10) << {wire10,
                              reg12}) : {$signed(reg11)})) ?
                      ((wire8 ?
                          $signed((~^(8'hbe))) : wire7) && reg12[(2'h2):(1'h0)]) : (8'hba));
  assign wire15 = (8'ha8);
  assign wire16 = wire6[(4'h8):(3'h4)];
  assign wire17 = wire10;
  always
    @(posedge clk) begin
      reg18 <= {wire8[(4'h8):(2'h2)]};
      reg19 <= (!($signed($unsigned((wire16 ? (8'h9f) : wire15))) ?
          wire15[(3'h4):(3'h4)] : ($signed((~(8'hbc))) ?
              $unsigned({wire14}) : $signed((^~(8'ha5))))));
      reg20 <= wire16[(4'hb):(3'h5)];
    end
endmodule

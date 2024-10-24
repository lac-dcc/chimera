module top
#(parameter param43 = ({{{{(7'h44)}, {(8'hb0)}}, ((~(8'hb0)) == {(8'h9d), (8'h9d)})}, ((~(8'hac)) ? ({(7'h41), (7'h40)} ^ ((8'hb5) <<< (8'ha5))) : (~&((8'had) ? (8'hb6) : (8'had))))} == (!({(8'hb6), (-(8'hbf))} ? (((8'hae) >>> (7'h42)) | {(8'hb3), (8'hb8)}) : (-((8'h9c) * (7'h42)))))), 
parameter param44 = ((~|(((param43 || param43) > param43) ? param43 : param43)) ? {param43, (8'hb8)} : (^param43)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
                 reg20,
                 reg19,
                 reg18,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned($signed((^~(8'hb9)))) ^~ (wire1 ?
          (((wire1 == wire0) ? $signed(wire1) : $signed(wire1)) ?
              (8'ha8) : $unsigned((wire3 ?
                  wire2 : wire0))) : $signed({wire2}))))
        begin
          if ((((((wire0 ?
              wire4 : wire1) < $unsigned(wire4)) >>> $unsigned(wire2)) & $signed((!$signed(wire2)))) == (~(wire3 ?
              (wire3[(4'hc):(4'hb)] ?
                  (~&wire3) : (^~(7'h40))) : wire0[(4'ha):(2'h2)]))))
            begin
              reg5 <= wire1;
              reg6 <= $unsigned($unsigned(wire0));
              reg7 <= ($unsigned((+reg5[(3'h4):(3'h4)])) ?
                  (reg6 | (~|{$signed(reg6), (wire0 ? wire4 : wire4)})) : reg5);
              reg8 <= (^($signed($unsigned($signed(reg6))) ?
                  $signed(((wire1 ?
                      wire1 : reg5) > reg6[(3'h6):(1'h1)])) : (~(reg6 ?
                      (|reg6) : $unsigned(reg7)))));
              reg9 <= wire3;
            end
          else
            begin
              reg5 <= $unsigned(reg6);
              reg6 <= ($unsigned(($signed((reg6 <<< wire3)) ?
                      {wire2, wire1[(4'hb):(4'h8)]} : (^$signed(reg6)))) ?
                  $signed(wire1) : (reg9[(5'h10):(2'h2)] - (reg5[(1'h0):(1'h0)] ^~ $unsigned($signed(wire2)))));
              reg7 <= (-$unsigned(wire4));
              reg8 <= $signed(((+((wire4 * wire3) <<< (reg7 > wire3))) << $signed($signed($signed(wire2)))));
            end
          reg10 <= $signed({(wire1 && (~(-reg8)))});
          reg11 <= reg8;
        end
      else
        begin
          reg5 <= wire0;
          reg6 <= $signed($unsigned($unsigned($unsigned((reg7 ?
              reg10 : reg10)))));
          if (({$unsigned($signed(reg11))} ?
              ($unsigned({(^reg5),
                  (wire0 >>> (8'hb7))}) >> $signed(($signed(reg7) ~^ (wire0 ?
                  wire0 : reg8)))) : reg10))
            begin
              reg7 <= $unsigned((&reg11));
              reg8 <= $signed(((reg5 ?
                  (-(wire3 >>> wire3)) : wire0) - (reg6[(4'h9):(3'h6)] ?
                  $signed($signed(reg7)) : (+wire3))));
              reg9 <= reg8[(3'h6):(1'h1)];
              reg10 <= (8'hbe);
            end
          else
            begin
              reg7 <= (wire4 | wire2[(4'ha):(4'h9)]);
              reg8 <= {(|$signed(wire0))};
              reg9 <= reg10;
            end
          reg11 <= ((^~(&($signed(reg5) ?
              (reg11 ~^ reg10) : (wire1 ?
                  wire3 : wire4)))) > $signed(wire2[(4'h9):(3'h7)]));
        end
      reg12 <= (~&((reg6 ^~ ({(7'h41)} & {reg7})) < (($signed(wire0) ?
          $signed((8'hb0)) : (-reg7)) ^ (8'hb9))));
      reg13 <= $signed((~&($signed((+reg10)) >> ($unsigned(reg12) ^ (reg12 ?
          wire2 : reg9)))));
    end
  assign wire14 = (reg13 < $unsigned(({wire0[(5'h11):(2'h2)],
                          $unsigned(reg10)} ?
                      reg5[(1'h1):(1'h1)] : ($signed(wire1) != wire3))));
  assign wire15 = (8'hb2);
  assign wire16 = {{(!((~wire0) <= (reg13 ? reg11 : reg12)))},
                      wire15[(4'ha):(1'h1)]};
  assign wire17 = reg8;
  always
    @(posedge clk) begin
      reg18 <= $unsigned($unsigned(($signed($unsigned(wire14)) ?
          (reg12[(1'h1):(1'h0)] ^ (~reg11)) : ((!reg5) ?
              $signed((8'hbc)) : $signed((8'hb5))))));
      reg19 <= ($unsigned(({wire0[(4'hb):(3'h7)]} ?
              $unsigned((reg18 ? reg7 : (8'haf))) : (~&reg11))) ?
          (!$signed((~{wire15, wire1}))) : {(($signed(wire4) ?
                      wire17 : $unsigned(reg5)) ?
                  $signed($signed(reg13)) : ((wire2 >= wire1) <<< reg7)),
              ($signed((~|wire17)) != $unsigned($unsigned(reg7)))});
      reg20 <= {wire3,
          $signed({({reg18, reg12} ? reg11 : $unsigned(reg18)),
              $unsigned(reg18)})};
    end
  assign wire21 = (reg5[(2'h2):(1'h0)] != $unsigned(wire3));
  assign wire22 = reg8;
  assign wire23 = ((8'ha5) && reg11[(3'h6):(1'h0)]);
  assign wire24 = wire22[(5'h10):(3'h7)];
  assign wire25 = $unsigned((({$unsigned(wire1)} ?
                      wire3[(4'h9):(3'h5)] : (+((8'hb5) >= reg19))) << reg6));
  assign wire26 = {((+(^{(8'hb1),
                          reg19})) > ({$unsigned(wire2)} << (~^reg11)))};
  assign wire27 = wire23;
  always
    @(posedge clk) begin
      if ((((reg13[(3'h5):(2'h3)] <<< ((8'hbd) <= (wire15 * reg6))) ?
          reg19 : (({reg9, reg6} & (wire17 | reg13)) ?
              wire22[(4'hb):(3'h4)] : ((reg20 ?
                  wire25 : reg5) >= $unsigned(wire0)))) ~^ (^($unsigned(wire3[(5'h10):(4'h8)]) ?
          reg20 : (~^$signed((8'ha2)))))))
        begin
          reg28 <= ({$unsigned((+(reg6 >>> reg9)))} ?
              reg19 : (|(~|$unsigned((reg10 >= reg9)))));
          reg29 <= (^wire15[(1'h0):(1'h0)]);
          reg30 <= wire25;
          reg31 <= (reg20 ?
              reg20[(4'he):(4'ha)] : $signed($unsigned(((-wire17) ?
                  {reg29} : (-reg5)))));
        end
      else
        begin
          reg28 <= wire14[(3'h5):(2'h2)];
          reg29 <= (reg28 << (($unsigned({reg6, wire14}) ?
                  (reg28[(3'h4):(3'h4)] + wire23[(4'hd):(4'h9)]) : $signed(reg20[(4'h8):(3'h4)])) ?
              ((!(~|reg19)) ?
                  wire2 : (reg30[(3'h7):(3'h6)] & $signed(wire26))) : $signed({$signed(reg7)})));
          if ((&$signed((((wire26 ? wire21 : wire21) ?
              wire25 : reg7[(2'h2):(2'h2)]) ^~ (|(~&(8'hab)))))))
            begin
              reg30 <= wire17;
              reg31 <= reg19[(4'h9):(4'h8)];
              reg32 <= reg18[(3'h4):(1'h0)];
              reg33 <= (~&(~&$signed(((8'ha5) ^~ $unsigned(wire22)))));
            end
          else
            begin
              reg30 <= wire24[(2'h2):(2'h2)];
              reg31 <= (wire25[(5'h10):(4'h8)] ?
                  ((~&$unsigned($signed(wire21))) ?
                      wire15 : reg20[(4'h9):(4'h9)]) : reg9[(4'hb):(4'ha)]);
              reg32 <= ($unsigned(wire27[(3'h6):(2'h3)]) - $signed({(reg9 ?
                      reg5 : (reg29 ^ wire27)),
                  $signed((-wire22))}));
              reg33 <= {wire3};
            end
          if (($unsigned($unsigned(wire14)) ?
              (~&$signed({(reg31 > wire27)})) : reg11))
            begin
              reg34 <= $unsigned(($unsigned(reg5[(1'h1):(1'h0)]) * (reg5 ?
                  reg11 : $unsigned(((8'hab) <= wire17)))));
              reg35 <= (^~wire16[(4'h8):(2'h2)]);
              reg36 <= (reg12[(3'h5):(3'h4)] ?
                  reg13 : {(&$unsigned((reg10 + reg30))),
                      (($signed(wire2) ?
                          {reg11} : (wire4 ?
                              (8'hbc) : reg6)) != $signed(((8'hbf) ^ wire25)))});
              reg37 <= (7'h41);
            end
          else
            begin
              reg34 <= $signed(($signed(reg36[(2'h2):(1'h1)]) + $unsigned(($unsigned(reg8) ?
                  $signed(wire22) : reg32))));
              reg35 <= ((8'h9d) ?
                  {({$signed(reg36), wire22} ?
                          (!{reg28}) : ($signed(reg29) << reg9[(1'h1):(1'h0)]))} : {reg36});
              reg36 <= reg12[(3'h5):(3'h4)];
              reg37 <= ($signed(reg18) <<< wire23[(4'h8):(3'h7)]);
              reg38 <= reg18[(2'h3):(2'h3)];
            end
        end
      reg39 <= {{reg20[(4'hd):(4'hb)]}};
      reg40 <= $signed(reg33[(3'h7):(2'h2)]);
    end
  assign wire41 = reg8[(3'h5):(1'h1)];
  assign wire42 = wire23[(1'h0):(1'h0)];
endmodule

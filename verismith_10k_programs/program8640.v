module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {$signed(((wire1 ? (wire4 ? wire1 : wire1) : wire0) ?
                         (!wire3) : wire0[(1'h0):(1'h0)])),
                     $signed(wire3)};
  assign wire6 = ((8'hb8) ?
                     ($signed($unsigned($unsigned((8'ha8)))) || (({wire1,
                             wire3} & (^~(8'hb6))) ?
                         {(wire1 ? wire0 : wire1),
                             $signed(wire0)} : wire5)) : (($unsigned($signed(wire0)) ^ $unsigned({wire1,
                         wire1})) * wire5));
  assign wire7 = ($signed($unsigned($unsigned((wire6 != wire2)))) ?
                     ($unsigned({(^wire1), wire1[(2'h2):(2'h2)]}) ?
                         ($unsigned(wire3[(1'h0):(1'h0)]) ?
                             wire2[(3'h5):(2'h2)] : $signed((8'ha1))) : $unsigned($unsigned(wire2))) : wire2[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg8 <= wire4;
      if (wire4[(3'h4):(2'h3)])
        begin
          reg9 <= {((^~((|wire6) ? (reg8 >>> wire3) : $unsigned(wire5))) ?
                  (wire4 || wire0[(1'h1):(1'h1)]) : (+{(wire1 || wire6)}))};
        end
      else
        begin
          reg9 <= (~&wire3);
          reg10 <= wire0;
          if (((8'ha3) ?
              $signed($signed(((wire2 ?
                  (8'haf) : reg10) & $signed(wire6)))) : ((~^$signed(((8'ha8) - (8'hbe)))) ?
                  $signed($signed((wire4 | (7'h40)))) : (reg8 ?
                      ($unsigned(wire4) ?
                          wire5[(2'h2):(1'h1)] : $signed(wire1)) : ((^~wire0) ?
                          (8'ha1) : wire7[(3'h7):(1'h1)])))))
            begin
              reg11 <= $signed(((~wire1) ?
                  ((+(&(8'had))) ?
                      wire6[(2'h3):(2'h3)] : wire0) : (reg8[(3'h4):(1'h1)] <<< ($unsigned(reg9) ?
                      wire5[(1'h1):(1'h1)] : (reg9 ? reg9 : wire5)))));
              reg12 <= wire6[(1'h0):(1'h0)];
              reg13 <= (^~wire5);
              reg14 <= {(+$signed((reg13 ? (~^wire0) : reg13))),
                  wire7[(3'h7):(2'h2)]};
            end
          else
            begin
              reg11 <= $unsigned(({($unsigned(reg10) & (wire3 ?
                          wire3 : wire5))} ?
                  (wire1 ?
                      wire2 : (((7'h43) ?
                          reg9 : reg14) ~^ wire0[(2'h2):(2'h2)])) : $unsigned($unsigned(((8'hb6) ?
                      (8'hb2) : reg8)))));
            end
        end
      reg15 <= (-$unsigned($signed((!(wire5 == wire0)))));
      reg16 <= (-$unsigned(wire1));
      reg17 <= {$unsigned(((~&reg11) != reg11[(1'h1):(1'h1)]))};
    end
  always
    @(posedge clk) begin
      reg18 <= (wire1[(3'h4):(1'h1)] ?
          reg17[(2'h3):(1'h1)] : (^(~|{$unsigned(wire4)})));
      reg19 <= $signed(((8'ha7) ? (|(8'hae)) : (^reg18[(5'h13):(4'h9)])));
      reg20 <= reg14[(3'h5):(3'h5)];
    end
  assign wire21 = $signed($signed(((~^wire6[(2'h2):(1'h0)]) != {$signed(wire3),
                      (reg18 ? wire7 : reg10)})));
  assign wire22 = $unsigned(reg20);
  assign wire23 = ((reg15 ?
                      $signed($unsigned(reg16)) : (($signed(wire7) ?
                              (wire6 >= wire6) : ((7'h40) ? wire21 : wire1)) ?
                          (8'haf) : $signed((|reg12)))) <<< $signed({(~^(8'ha2))}));
  assign wire24 = wire1[(1'h0):(1'h0)];
  assign wire25 = {(wire22 ? wire2[(2'h3):(2'h3)] : (~|wire21))};
  always
    @(posedge clk) begin
      if ((^~wire4))
        begin
          reg26 <= $signed(({$unsigned({(8'ha9)})} != $unsigned(wire7)));
          reg27 <= (&reg19);
          reg28 <= wire25[(3'h4):(3'h4)];
          reg29 <= reg19[(1'h0):(1'h0)];
          reg30 <= (-($unsigned(reg9) ?
              ((wire0[(1'h0):(1'h0)] ?
                  {reg28} : $unsigned(reg11)) < $signed(reg8)) : (^{(!wire2)})));
        end
      else
        begin
          if (wire25)
            begin
              reg26 <= ((((-(&wire7)) != reg28) ? reg17 : $unsigned(reg14)) ?
                  (($signed(wire0[(2'h2):(1'h0)]) ?
                      $signed($unsigned(wire25)) : ($unsigned(reg18) ?
                          reg18[(4'ha):(3'h4)] : $signed((8'ha4)))) > {$unsigned((wire23 <= reg30))}) : wire2);
              reg27 <= ($unsigned((-$unsigned((7'h44)))) | wire24);
            end
          else
            begin
              reg26 <= $signed((~^(|$signed({reg29, reg16}))));
              reg27 <= {reg17,
                  $unsigned($unsigned($unsigned($signed(wire25))))};
              reg28 <= $unsigned(($unsigned(((|reg28) ?
                      (wire22 <<< wire24) : reg28)) ?
                  reg27[(3'h7):(1'h1)] : (|{(|wire3)})));
              reg29 <= {$signed(((reg15 * reg12[(5'h10):(3'h7)]) ^ ($signed(reg17) & reg13))),
                  ($unsigned((&{reg29, wire25})) ?
                      $unsigned((reg19 & (8'ha3))) : ((^~(reg16 >>> reg13)) ?
                          ($signed(reg20) ?
                              (wire22 ?
                                  wire6 : wire3) : (~reg11)) : {$signed((8'haa))}))};
              reg30 <= wire22;
            end
          reg31 <= $signed((~&{reg11}));
          reg32 <= wire6;
          reg33 <= (wire5[(1'h1):(1'h0)] ?
              reg19[(1'h0):(1'h0)] : (|($signed(((8'hb5) >> reg30)) == $unsigned($unsigned(reg10)))));
          reg34 <= (~|reg32);
        end
      if ((~($signed($signed((reg16 && reg8))) + $unsigned($unsigned($signed(reg14))))))
        begin
          if (($signed((8'ha1)) << reg12))
            begin
              reg35 <= $unsigned($unsigned(($signed(reg9) << (^((8'ha1) ?
                  reg17 : (8'hab))))));
            end
          else
            begin
              reg35 <= ((reg32[(4'hd):(1'h0)] <= wire25) ?
                  (^~(~^wire1)) : {reg17});
              reg36 <= (({{reg30[(5'h10):(1'h1)]},
                          {$signed(reg28), (~&reg17)}} ?
                      ((wire2[(2'h2):(1'h0)] ?
                          {wire21,
                              reg32} : (reg28 <= reg9)) + (+(reg15 >= wire2))) : reg16[(1'h0):(1'h0)]) ?
                  ((reg20 > ((!wire6) && reg8)) && (8'ha5)) : $signed((reg8 ?
                      reg10 : reg34[(2'h2):(2'h2)])));
              reg37 <= $unsigned(reg20[(1'h1):(1'h1)]);
            end
          reg38 <= $unsigned(((($signed(reg8) > (+(8'h9d))) ?
              $unsigned((8'h9e)) : (8'had)) << (~(~wire25[(5'h13):(3'h7)]))));
        end
      else
        begin
          reg35 <= reg30[(1'h0):(1'h0)];
          reg36 <= reg16;
          reg37 <= $unsigned((8'h9d));
          reg38 <= reg20;
          reg39 <= {(&$signed(reg18))};
        end
      reg40 <= reg39;
      reg41 <= (8'h9c);
    end
endmodule

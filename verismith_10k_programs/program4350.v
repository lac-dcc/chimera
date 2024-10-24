module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire6,
                 wire5,
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
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned(wire0);
  assign wire6 = (~|wire5);
  always
    @(posedge clk) begin
      if (((~^(($signed(wire1) ~^ wire6) == wire4[(1'h0):(1'h0)])) ?
          $unsigned((wire5 ?
              $signed(wire0[(1'h1):(1'h0)]) : ($signed(wire1) ?
                  $signed((8'ha3)) : wire3))) : (+wire2)))
        begin
          if ((wire1 ?
              (($signed($unsigned((8'hb2))) > $unsigned((wire5 - wire6))) ?
                  $unsigned(((wire2 && wire4) ?
                      (wire5 ?
                          wire1 : wire4) : wire5[(3'h4):(1'h1)])) : ((wire6 ?
                          wire1 : (wire3 << wire5)) ?
                      (wire6 ?
                          $signed(wire6) : (+wire0)) : ((wire0 >>> wire4) < (wire1 ?
                          (8'hbb) : wire1)))) : (wire5 ?
                  (+(8'ha4)) : $unsigned(wire0[(1'h0):(1'h0)]))))
            begin
              reg7 <= (~$unsigned(({(wire0 >= wire0), wire4} ?
                  ((wire6 ~^ wire2) << (~&wire1)) : ((wire4 == wire2) ?
                      (wire5 ^ wire3) : $unsigned(wire2)))));
              reg8 <= (wire3 ?
                  (^wire6[(4'he):(2'h3)]) : $signed((reg7[(4'hd):(3'h6)] ?
                      wire5[(3'h5):(2'h2)] : wire6)));
              reg9 <= wire0;
              reg10 <= {wire4, ({reg9} ? wire6[(4'ha):(4'h8)] : reg8)};
            end
          else
            begin
              reg7 <= wire4[(2'h2):(1'h0)];
              reg8 <= $unsigned(($unsigned({reg10, (&wire2)}) ?
                  $signed((!(|reg8))) : $unsigned(reg7[(4'hb):(2'h3)])));
              reg9 <= {reg10};
            end
          if (wire5)
            begin
              reg11 <= (~$unsigned($signed($unsigned((wire4 >>> reg9)))));
              reg12 <= $signed((+$unsigned(wire6)));
              reg13 <= reg7;
              reg14 <= reg9;
              reg15 <= (^~$signed(($signed(wire6[(2'h3):(2'h3)]) <= (~(~&wire2)))));
            end
          else
            begin
              reg11 <= $signed(($unsigned(reg9) >= $signed($signed({(8'hba)}))));
              reg12 <= ({$signed((~^((8'ha1) | wire0))), reg11} ?
                  (($signed($unsigned(reg13)) == wire5[(3'h5):(3'h4)]) ?
                      $unsigned($unsigned((-wire6))) : (($unsigned(wire3) ?
                              reg13 : $signed(reg15)) ?
                          {{wire3},
                              (~|(8'hb7))} : (|reg11))) : ($unsigned((|$signed((8'hba)))) ?
                      ($signed((wire2 == reg14)) <= $signed((&(8'hb0)))) : reg9));
            end
        end
      else
        begin
          reg7 <= ({(((reg12 ? wire2 : reg8) ? reg11 : (|reg10)) ?
                  (wire1[(1'h0):(1'h0)] ?
                      (wire2 ?
                          (7'h40) : wire3) : reg14[(2'h3):(1'h0)]) : $unsigned((^~reg7)))} || ($signed($unsigned({(7'h40)})) + (~^((reg11 ?
              reg10 : reg14) <<< {wire4, wire2}))));
          reg8 <= $signed((wire5 >>> wire2[(3'h6):(2'h3)]));
        end
    end
  assign wire16 = wire5[(3'h6):(2'h2)];
  assign wire17 = $unsigned(wire3);
  assign wire18 = (($signed(wire16) ?
                      $signed($signed((~|wire3))) : $signed((wire6[(4'he):(4'h8)] ^~ reg10))) * (~&($unsigned((8'hb1)) != $unsigned(reg7))));
  assign wire19 = ((~^(^reg9)) ?
                      $signed($unsigned($signed($unsigned(reg11)))) : (^(&$signed(reg14[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg20 <= (reg8[(4'hf):(4'h8)] > (~^wire6));
      reg21 <= $signed(wire1);
    end
  assign wire22 = wire4;
  assign wire23 = $unsigned((wire1 != (~$unsigned((wire5 ^~ reg13)))));
  assign wire24 = reg15[(2'h2):(1'h1)];
  assign wire25 = {$signed(((((8'ha2) - wire0) >= wire3) < wire6[(2'h2):(1'h1)])),
                      {((+(reg12 ? (7'h43) : (8'hab))) - wire3)}};
  assign wire26 = (wire17 ?
                      reg10 : (reg14[(1'h1):(1'h1)] & $signed({((8'hba) ?
                              (7'h40) : wire16)})));
  assign wire27 = $signed($signed($signed(reg21[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      if ((&wire24))
        begin
          if ((~^$signed((reg9[(1'h0):(1'h0)] + {(~|wire19)}))))
            begin
              reg28 <= $unsigned($unsigned((((wire0 >> (7'h44)) ?
                      (&wire4) : wire2[(3'h7):(1'h1)]) ?
                  $signed($signed(reg13)) : wire26[(2'h3):(2'h3)])));
              reg29 <= {$signed($unsigned($signed({wire18, wire18}))),
                  ($unsigned((^{reg13})) <= (((~&wire2) ?
                      (-wire5) : $unsigned(wire5)) >= $unsigned(((8'ha4) == wire5))))};
            end
          else
            begin
              reg28 <= $signed(reg10);
              reg29 <= (+(+$unsigned((+$unsigned((8'hb2))))));
              reg30 <= ((+(wire6 ?
                  ($unsigned(wire16) >= wire18) : {reg28,
                      $signed((8'ha4))})) - (&$unsigned((reg13[(3'h4):(3'h4)] ^ (~wire2)))));
              reg31 <= ($signed($signed((+{(8'had), wire6}))) ?
                  $signed((($unsigned(reg29) ?
                      (reg14 ? (8'hae) : reg13) : wire23) == {(wire26 + wire6),
                      (wire17 <<< reg28)})) : (^~(((wire0 - wire4) ?
                      {reg28, reg11} : (wire0 ^~ reg12)) != wire22)));
            end
          reg32 <= (+((^$unsigned($signed((7'h41)))) ?
              (-wire2) : $unsigned(((wire26 || reg29) ?
                  (reg11 > (8'ha4)) : (reg20 << reg8)))));
          reg33 <= {((($signed(wire27) ?
                  (wire17 ?
                      reg11 : wire23) : (reg13 <= wire27)) + ({wire1} && wire4[(2'h3):(2'h2)])) << ($unsigned((^wire26)) <<< reg20[(4'hd):(3'h4)]))};
        end
      else
        begin
          reg28 <= ((wire23[(4'hb):(3'h6)] ?
                  wire16 : (reg33 ? (~{reg10, wire18}) : reg14)) ?
              {(($signed((8'hb9)) < (reg21 * reg12)) | (&{(8'ha5),
                      reg33}))} : ((~^((+wire0) ? wire3 : $signed(wire27))) ?
                  (reg13[(1'h1):(1'h0)] & $unsigned($signed(wire22))) : reg8));
          reg29 <= (8'h9e);
        end
      if ({wire27[(4'ha):(2'h2)], (8'hbb)})
        begin
          reg34 <= ($unsigned((^~$unsigned(((8'hb0) ?
              reg32 : reg10)))) < wire2[(4'hb):(1'h0)]);
          if ((!$signed(wire23)))
            begin
              reg35 <= wire6[(3'h7):(2'h2)];
            end
          else
            begin
              reg35 <= $signed(wire27);
            end
          reg36 <= ($unsigned($signed({$unsigned(wire3)})) ?
              ((wire5 ? reg21 : ($signed(reg9) ? wire27 : {reg9, reg20})) ?
                  $unsigned({(reg33 ?
                          (8'ha0) : wire0)}) : reg12) : $unsigned((^$signed(reg7))));
        end
      else
        begin
          reg34 <= reg11[(5'h14):(3'h6)];
          reg35 <= $unsigned({wire3,
              $unsigned($unsigned(reg8[(4'ha):(3'h5)]))});
          if (wire19[(4'ha):(2'h3)])
            begin
              reg36 <= (reg28[(4'hb):(2'h3)] ^~ ($unsigned(($unsigned(wire16) ?
                      reg29[(5'h10):(4'hf)] : reg10)) ?
                  ($unsigned((reg28 ? wire6 : wire5)) ?
                      $unsigned({wire17}) : $signed($signed(reg36))) : (reg36 * ($signed(reg20) ?
                      wire6 : {(8'ha0), reg30}))));
              reg37 <= reg36[(4'ha):(2'h2)];
            end
          else
            begin
              reg36 <= $unsigned(((^$signed($signed((8'haa)))) ?
                  {($signed(reg15) ? $signed(reg10) : $signed(wire6)),
                      (wire2[(4'h8):(3'h6)] ?
                          (^~reg20) : (wire0 ? (8'ha4) : reg15))} : {({reg13} ?
                          $unsigned(wire4) : reg33[(2'h3):(1'h1)]),
                      (8'hb6)}));
              reg37 <= $signed($signed(($signed($unsigned(reg15)) <<< {(reg37 ^ wire1),
                  {reg10, reg37}})));
            end
          if ($signed(reg12[(2'h3):(2'h2)]))
            begin
              reg38 <= $unsigned($unsigned({(8'hb4)}));
              reg39 <= ((^reg37) ?
                  {wire4[(2'h3):(1'h1)],
                      (((reg36 | (8'ha8)) ^ $signed(wire0)) ?
                          (~|(|reg31)) : $unsigned(((8'hb7) ?
                              wire17 : (8'ha7))))} : reg14[(1'h1):(1'h1)]);
              reg40 <= $unsigned((({reg34[(1'h0):(1'h0)],
                      (reg8 ? reg37 : wire6)} << $signed(((7'h42) - reg12))) ?
                  $signed(wire6) : wire5[(1'h1):(1'h1)]));
              reg41 <= wire1[(1'h1):(1'h1)];
            end
          else
            begin
              reg38 <= $unsigned($unsigned((reg11[(4'hf):(3'h6)] | wire27)));
            end
          reg42 <= reg39;
        end
    end
endmodule

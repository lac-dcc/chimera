module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = {((~((wire0 ? wire2 : wire2) ?
                         (wire0 ? wire1 : wire0) : wire1)) <<< (-({wire4,
                             (8'hb3)} ?
                         wire3[(3'h7):(3'h5)] : $signed(wire4))))};
  always
    @(posedge clk) begin
      reg6 <= ($unsigned((-wire5)) >> $signed((((wire4 ? wire5 : wire0) ?
          (wire0 ^~ wire4) : (~&wire5)) << (wire5 ?
          $signed(wire3) : wire3[(5'h11):(4'ha)]))));
    end
  assign wire7 = {wire4[(4'hd):(2'h3)],
                     {$signed(($unsigned(wire4) | $signed(wire2))),
                         {(reg6[(1'h1):(1'h0)] ?
                                 (wire1 ? wire0 : wire5) : $signed((8'h9e)))}}};
  assign wire8 = {{$unsigned((~^$signed(wire2)))}};
  assign wire9 = wire0[(3'h7):(3'h7)];
  assign wire10 = $signed(wire3);
  assign wire11 = wire2;
  assign wire12 = $signed(({wire3[(4'h8):(4'h8)]} + wire9));
  assign wire13 = wire5;
  assign wire14 = (~(((wire1 ? (^wire11) : {(7'h41), reg6}) <= ((wire3 ?
                      wire13 : wire13) == $signed(wire4))) >>> wire8));
  assign wire15 = wire0[(2'h2):(1'h1)];
  assign wire16 = $signed((($signed(wire13[(1'h0):(1'h0)]) & $signed((wire4 ?
                      wire5 : reg6))) <= reg6));
  assign wire17 = wire14;
  always
    @(posedge clk) begin
      if ((^wire13[(3'h5):(3'h4)]))
        begin
          reg18 <= wire10[(3'h5):(1'h0)];
          if ((wire15[(4'h8):(3'h6)] >= ($unsigned(((reg18 - wire17) ?
              (^~wire5) : reg18)) <<< (&((wire17 ?
              wire9 : (8'hb8)) <<< $unsigned(reg6))))))
            begin
              reg19 <= ($signed((wire12 >> $unsigned($signed(reg18)))) + $unsigned((wire8[(1'h1):(1'h0)] ?
                  ({wire8} ?
                      wire9 : (wire9 == wire10)) : (wire12[(1'h0):(1'h0)] ?
                      (~&wire12) : (&wire1)))));
              reg20 <= $unsigned($unsigned($unsigned(wire1)));
              reg21 <= wire12;
            end
          else
            begin
              reg19 <= (wire13[(1'h0):(1'h0)] ^ $signed(({wire9[(4'ha):(3'h5)]} ?
                  $signed($signed(reg20)) : (^~$signed((8'hac))))));
              reg20 <= wire10;
              reg21 <= (+$unsigned((+$unsigned((wire2 || (8'hb3))))));
              reg22 <= $signed($signed(($unsigned($signed((8'hb4))) < reg21)));
            end
          reg23 <= (reg22[(4'hf):(1'h0)] ?
              $unsigned($signed({wire5[(4'hd):(1'h1)]})) : wire11);
          reg24 <= (+$unsigned($signed(($unsigned(reg18) || $unsigned(wire13)))));
        end
      else
        begin
          reg18 <= ($unsigned((-((reg23 ?
                  reg18 : wire12) < $unsigned(wire16)))) ?
              reg19 : wire5);
          if ((~(^$unsigned(reg20[(2'h2):(1'h0)]))))
            begin
              reg19 <= reg21;
              reg20 <= reg19[(1'h1):(1'h1)];
              reg21 <= reg23;
            end
          else
            begin
              reg19 <= $signed({$unsigned($signed(reg20[(2'h3):(2'h2)])),
                  wire17[(4'hc):(4'h9)]});
            end
          reg22 <= $unsigned(wire5[(2'h2):(1'h0)]);
        end
      if ((wire10 ?
          $signed($unsigned((reg6 ?
              (wire14 ?
                  wire9 : wire11) : $signed(wire12)))) : ($unsigned($unsigned(wire5[(4'hc):(3'h7)])) ?
              (($unsigned(wire8) && (reg18 <<< wire10)) ?
                  reg20 : $signed((reg21 ?
                      reg19 : wire0))) : wire17[(4'hc):(2'h3)])))
        begin
          reg25 <= (~($signed((wire11 ? $unsigned(reg19) : wire4)) >= {((wire7 ?
                  wire16 : wire2) <= {reg6})}));
          reg26 <= (!{(!(^~(reg23 * wire14))),
              (wire7 & ({wire12} > $signed(reg24)))});
          if ((~^wire17))
            begin
              reg27 <= $signed((+$signed($signed($signed(wire11)))));
            end
          else
            begin
              reg27 <= $unsigned((~^($signed($signed(wire3)) >>> ($signed(wire0) | (~wire7)))));
              reg28 <= $signed($unsigned(wire15[(4'hd):(3'h7)]));
              reg29 <= (+reg25);
              reg30 <= {(($signed($signed(wire14)) ? (~{wire0}) : wire1) ?
                      (^((wire3 ?
                          wire10 : reg29) <= $signed(reg29))) : reg18[(1'h0):(1'h0)])};
              reg31 <= {((+$signed((reg18 <<< wire13))) | {$unsigned($unsigned(wire0)),
                      $unsigned((wire12 ? wire0 : reg28))}),
                  (|$unsigned(({wire10} == $signed(reg27))))};
            end
          reg32 <= ((wire8[(1'h0):(1'h0)] ?
              $signed((-((8'hb3) ?
                  reg26 : (8'ha8)))) : wire13[(5'h11):(4'h9)]) * $signed($signed($unsigned((~&wire5)))));
          if (reg25[(3'h4):(2'h2)])
            begin
              reg33 <= reg28;
              reg34 <= $unsigned(((((8'hba) >> $unsigned(reg18)) ?
                  reg33 : $unsigned((wire8 ?
                      reg24 : (8'ha6)))) & wire12[(1'h0):(1'h0)]));
              reg35 <= (($signed($unsigned((~&wire11))) ?
                      {((wire9 >>> reg25) ? (~&wire15) : $signed(wire14)),
                          wire17} : (8'ha1)) ?
                  (((^~wire5[(1'h0):(1'h0)]) ?
                          reg33 : ($unsigned(reg18) ?
                              (~^reg29) : $signed((8'hbb)))) ?
                      (~|reg23) : wire3) : (-(reg25 ?
                      $unsigned({(8'hbc), reg31}) : ((^reg31) >> {(8'ha9),
                          reg26}))));
            end
          else
            begin
              reg33 <= ((reg19[(1'h0):(1'h0)] | (^~$unsigned((&wire1)))) ?
                  $unsigned((reg28[(4'h9):(1'h1)] && reg30[(3'h6):(3'h5)])) : wire2);
            end
        end
      else
        begin
          reg25 <= ((~$unsigned((|wire13))) ?
              (wire1[(2'h3):(2'h2)] * (&$signed($signed(wire14)))) : $signed((7'h43)));
          reg26 <= $unsigned($unsigned(wire16));
          reg27 <= {wire17[(4'ha):(3'h5)], $signed($signed({$signed(wire14)}))};
          reg28 <= wire1[(1'h1):(1'h1)];
          reg29 <= {wire1[(1'h0):(1'h0)], reg27[(3'h6):(1'h1)]};
        end
      reg36 <= $unsigned((~(~^reg32[(3'h6):(2'h3)])));
      if (reg23)
        begin
          if ($unsigned($signed((wire14[(1'h0):(1'h0)] ?
              (reg28 <= (^reg30)) : wire8))))
            begin
              reg37 <= (((wire4 <<< reg28) ?
                      $unsigned(((reg24 >> reg27) >> (wire11 > wire1))) : (^$unsigned($signed(reg31)))) ?
                  (8'hb4) : $unsigned((~|({wire14, reg33} ?
                      (reg29 ^ wire2) : wire14))));
            end
          else
            begin
              reg37 <= ((reg34[(4'h9):(3'h6)] >>> (&reg33)) ?
                  $signed((~|(~|(~^reg30)))) : $signed($signed((reg27 != {wire0}))));
            end
        end
      else
        begin
          reg37 <= (~|reg31);
          reg38 <= (&(7'h44));
          reg39 <= (wire17 ?
              reg37 : $signed(({$signed((8'h9f))} << (reg33 ?
                  {wire15} : {reg37, (8'ha2)}))));
          reg40 <= reg27[(2'h3):(2'h2)];
          reg41 <= reg23;
        end
    end
  assign wire42 = (8'hb1);
  assign wire43 = ($signed(reg34[(3'h6):(1'h1)]) ~^ {$unsigned(reg35[(5'h10):(3'h6)])});
  assign wire44 = $unsigned({$signed(wire0),
                      $signed(({reg25} ? reg41 : (^reg22)))});
endmodule

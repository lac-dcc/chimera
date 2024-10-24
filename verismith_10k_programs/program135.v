module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire33,
                 wire16,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
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
                 reg17,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (7'h42);
  assign wire6 = wire3;
  assign wire7 = ((+$signed(wire0[(4'hb):(3'h5)])) ~^ (&(~wire6)));
  always
    @(posedge clk) begin
      if ($unsigned(wire7))
        begin
          reg8 <= {$unsigned(wire4[(3'h4):(1'h1)]),
              (&{({wire1, wire4} & $signed(wire4)),
                  ($signed(wire0) && ((8'had) ~^ wire0))})};
          reg9 <= (reg8 << (wire1[(3'h4):(1'h1)] ?
              ({((7'h42) >> wire0)} ?
                  wire1 : (wire0[(4'h8):(4'h8)] - (wire1 ?
                      wire5 : wire2))) : $unsigned(wire0[(5'h12):(4'hd)])));
          reg10 <= ((wire5[(2'h2):(2'h2)] ?
              $unsigned(((wire6 > wire3) ?
                  wire1 : $unsigned(reg9))) : (^~({wire2} >>> {(8'ha3),
                  wire0}))) ^ (&wire1));
          reg11 <= ((wire0 >>> $unsigned((((8'hbf) ^~ wire4) ?
              (reg9 >= wire0) : ((8'hb2) ?
                  wire3 : wire7)))) || $unsigned($unsigned(((^wire2) | $signed(wire0)))));
        end
      else
        begin
          reg8 <= (8'hb8);
        end
      if ((^~$signed($signed(((+wire4) ~^ (reg9 & (8'haf)))))))
        begin
          reg12 <= ($signed((~&$unsigned((wire7 << wire2)))) ^~ ((wire6 | (-$unsigned(wire2))) ?
              reg8 : (^reg10[(2'h3):(1'h1)])));
        end
      else
        begin
          reg12 <= (~|(wire4[(2'h3):(2'h2)] ?
              {$unsigned($unsigned(wire0))} : $unsigned((reg12 ?
                  (~&wire3) : (!reg8)))));
          reg13 <= $signed((wire6[(2'h3):(2'h2)] ?
              wire4 : {$signed(wire6[(3'h4):(2'h3)]), {$signed(wire2)}}));
          reg14 <= ($unsigned((!((wire2 < reg13) || $unsigned(wire4)))) ?
              ($unsigned({(wire5 ? (8'h9f) : wire0), wire6[(1'h0):(1'h0)]}) ?
                  wire7 : (reg12 == $signed((|reg11)))) : $signed(($signed(wire7[(4'hc):(3'h5)]) ?
                  (~&((8'hb0) ? reg9 : reg11)) : $signed({wire4}))));
        end
    end
  assign wire15 = (~|wire2[(2'h3):(1'h1)]);
  assign wire16 = ({($signed($unsigned(reg11)) ^ wire5),
                      reg13[(2'h3):(1'h1)]} * reg10[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg17 <= (+wire15);
      reg18 <= wire2[(3'h4):(3'h4)];
      if (reg8)
        begin
          if ((8'ha0))
            begin
              reg19 <= wire4[(2'h3):(2'h3)];
              reg20 <= (~&(reg19 ?
                  {reg13} : (~((wire15 ? wire15 : wire6) ?
                      {wire16, wire15} : (reg13 ^ reg10)))));
              reg21 <= $signed($unsigned(reg14));
              reg22 <= reg8[(2'h2):(2'h2)];
              reg23 <= (((({reg22, wire1} && (reg21 ? reg14 : reg9)) ?
                  ($unsigned(wire7) << $signed(reg18)) : $unsigned($unsigned(wire16))) >> reg20[(4'h8):(4'h8)]) && reg14);
            end
          else
            begin
              reg19 <= wire15;
              reg20 <= (&$unsigned($unsigned($signed({wire1}))));
              reg21 <= (!reg22[(4'he):(2'h3)]);
            end
          reg24 <= (^~$unsigned((&wire7)));
          reg25 <= ($unsigned((!{reg21[(3'h4):(1'h1)],
              $unsigned(wire4)})) >> $unsigned(((wire5[(2'h2):(2'h2)] >> $signed(reg8)) >= wire7)));
          if ((^{$unsigned({(reg19 ? wire3 : (8'haa)),
                  ((7'h42) ? reg8 : reg19)}),
              reg19}))
            begin
              reg26 <= (8'hb0);
              reg27 <= {($unsigned(reg14) ?
                      {reg23[(3'h5):(1'h1)],
                          (^(wire2 <<< reg20))} : {reg17[(2'h2):(2'h2)],
                          wire3}),
                  $unsigned(reg22[(4'hc):(4'h9)])};
              reg28 <= reg14;
              reg29 <= (reg18 ?
                  (reg18[(3'h5):(3'h4)] ?
                      $signed(reg14[(1'h1):(1'h1)]) : reg11) : $signed((8'ha4)));
              reg30 <= reg10;
            end
          else
            begin
              reg26 <= (^~(~^($signed(reg28) ^~ $signed((8'ha5)))));
            end
          reg31 <= $unsigned($unsigned(({$signed(reg8)} ?
              $unsigned({reg27, reg8}) : (|(wire7 ? reg28 : wire1)))));
        end
      else
        begin
          reg19 <= (reg29 ?
              (reg12[(5'h11):(4'hf)] && $unsigned((^$unsigned(reg29)))) : $unsigned($signed(reg12[(1'h0):(1'h0)])));
          reg20 <= (((wire6 ? $unsigned(reg24[(1'h1):(1'h0)]) : reg28) ?
              $signed($unsigned((wire15 + (8'hb5)))) : {((reg28 ?
                      (7'h40) : reg23) <<< {reg13, wire2})}) >>> reg27);
          reg21 <= {$signed(reg23[(3'h7):(3'h5)])};
          reg22 <= (&$unsigned($unsigned($signed($unsigned(wire1)))));
          reg23 <= reg14[(2'h2):(1'h0)];
        end
      reg32 <= ($unsigned($signed(reg31)) ?
          (^~($unsigned((reg13 ? (7'h43) : (8'hb5))) || $unsigned((reg9 ?
              (8'h9d) : wire7)))) : reg29[(3'h5):(2'h2)]);
    end
  assign wire33 = (^~reg32);
  always
    @(posedge clk) begin
      if ($signed(reg14))
        begin
          reg34 <= reg31;
        end
      else
        begin
          reg34 <= {$signed($signed(reg27)),
              {reg22[(4'h9):(3'h7)], $unsigned($signed(wire16))}};
          reg35 <= reg32[(4'h9):(3'h7)];
          reg36 <= $unsigned(({reg31} - (8'h9c)));
          reg37 <= (^~((reg22[(4'h9):(2'h3)] - (wire7[(4'ha):(3'h7)] <= wire2[(1'h1):(1'h1)])) - reg18[(1'h0):(1'h0)]));
        end
    end
  always
    @(posedge clk) begin
      reg38 <= $signed($unsigned(($signed($unsigned(reg28)) ?
          (reg26[(3'h4):(1'h0)] ?
              (wire16 ? reg14 : reg10) : {(7'h41),
                  reg9}) : $unsigned(reg12[(4'h8):(1'h0)]))));
      reg39 <= reg14;
    end
  always
    @(posedge clk) begin
      reg40 <= reg14;
    end
  assign wire41 = $unsigned(((wire6 ?
                      ($signed(wire6) ?
                          $signed(reg25) : ((8'had) >= reg31)) : ({reg10,
                              wire2} ?
                          (&(8'ha5)) : reg40[(3'h6):(2'h2)])) != reg17[(1'h0):(1'h0)]));
  assign wire42 = wire4[(2'h3):(1'h0)];
  assign wire43 = $unsigned($unsigned($unsigned(reg12)));
  assign wire44 = (({(^~(~&reg23)),
                      wire15[(3'h6):(3'h6)]} < (~^reg27)) & $signed(reg13));
endmodule

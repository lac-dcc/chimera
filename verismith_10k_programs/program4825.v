module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire38,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg37,
                 reg36,
                 reg35,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed((^~((~^$signed(wire0)) & wire4)));
      if ($unsigned(((^~wire0) <= wire1)))
        begin
          if (wire1[(3'h5):(1'h0)])
            begin
              reg6 <= $unsigned((reg5 + (($signed(wire2) << {(8'hb3)}) >>> (-$unsigned(wire1)))));
              reg7 <= $unsigned({wire1, wire2});
              reg8 <= {((8'hb8) ? (&(!$signed(wire2))) : $unsigned((+wire4))),
                  ((($unsigned(reg6) ? $unsigned(reg7) : (reg6 > wire3)) ?
                      (reg5[(5'h10):(3'h5)] ?
                          (7'h41) : wire0) : (~|$signed(wire3))) ^ (wire3[(3'h5):(1'h0)] ?
                      $signed($unsigned(reg5)) : reg7[(2'h2):(1'h0)]))};
              reg9 <= $unsigned({{((|reg6) <= (reg7 ? (8'h9f) : reg6))}});
            end
          else
            begin
              reg6 <= (|reg7[(2'h2):(1'h1)]);
              reg7 <= reg8;
            end
          if ($signed(($unsigned(((|(8'hae)) ?
                  $unsigned(reg8) : $unsigned(reg7))) ?
              $unsigned(reg9[(3'h6):(1'h1)]) : reg7[(1'h0):(1'h0)])))
            begin
              reg10 <= reg8;
              reg11 <= wire0;
            end
          else
            begin
              reg10 <= wire4[(2'h3):(2'h3)];
              reg11 <= $signed(($unsigned((wire3 ? $signed(wire1) : reg9)) ?
                  reg11 : $signed($signed((reg10 != wire3)))));
              reg12 <= {($unsigned((-reg7[(1'h1):(1'h0)])) ?
                      $signed(reg8[(1'h1):(1'h1)]) : (!$unsigned(reg5)))};
              reg13 <= ((!(~&(^~(reg8 ? reg7 : wire0)))) ?
                  reg11[(2'h3):(2'h3)] : $signed((8'h9e)));
              reg14 <= reg10[(2'h2):(1'h0)];
            end
          if ($unsigned(wire2[(1'h0):(1'h0)]))
            begin
              reg15 <= {$signed($unsigned((+(~^reg8)))),
                  (!(!(~^$unsigned(wire3))))};
              reg16 <= (~|(+(reg14[(2'h3):(2'h3)] ?
                  reg13[(4'h8):(2'h3)] : $signed($unsigned(reg7)))));
              reg17 <= {{$unsigned((8'hb6))},
                  (reg8 ? $signed(reg7[(2'h3):(1'h1)]) : (8'h9e))};
            end
          else
            begin
              reg15 <= $unsigned(((~|(wire4 ?
                      (reg8 ? reg13 : (8'hb8)) : reg8)) ?
                  {(+reg17[(4'h9):(1'h0)])} : reg11[(3'h5):(1'h1)]));
              reg16 <= $unsigned((~|(~|($signed(reg7) == (reg14 ?
                  reg17 : reg6)))));
              reg17 <= (~reg6[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          if (((&{reg17, $unsigned(reg17)}) ?
              {reg5,
                  ($unsigned((reg9 ?
                      (7'h43) : reg11)) >> reg17[(4'hb):(3'h4)])} : (^$unsigned((~^reg14)))))
            begin
              reg6 <= (!reg16);
              reg7 <= $signed((8'h9f));
              reg8 <= ((+(^((wire3 ? reg9 : reg14) ?
                      (wire2 == wire1) : $unsigned(reg10)))) ?
                  wire1[(2'h3):(2'h2)] : $signed({$unsigned((reg8 >= (8'h9f)))}));
              reg9 <= (~$signed(($unsigned({wire3, reg9}) ?
                  {(wire0 & reg14),
                      {reg13, wire4}} : ($signed(reg15) < (reg12 << reg8)))));
            end
          else
            begin
              reg6 <= ((+reg6) ? wire2[(4'h8):(3'h6)] : reg13[(1'h0):(1'h0)]);
              reg7 <= $signed(reg9[(2'h2):(1'h1)]);
              reg8 <= reg7[(3'h4):(1'h0)];
            end
          reg10 <= (^((-reg8[(2'h2):(1'h0)]) << $signed((&reg15[(3'h5):(2'h3)]))));
        end
      reg18 <= $unsigned({(({(8'hae)} ?
              ((8'ha0) - reg5) : (~|(8'ha5))) << reg7[(1'h0):(1'h0)])});
      if ($signed($signed(wire0)))
        begin
          reg19 <= {$signed((&wire4))};
          reg20 <= (~|{reg10[(1'h1):(1'h0)]});
          if ({(((wire2[(1'h0):(1'h0)] ?
                  {reg7, reg7} : $unsigned(reg14)) && ((reg14 ?
                      (8'hb2) : (8'ha2)) ?
                  reg7[(3'h4):(2'h3)] : (reg6 ?
                      reg9 : (8'h9e)))) << (+(!(reg15 >> reg18)))),
              (~&$unsigned(((^reg15) ? (|reg7) : reg20)))})
            begin
              reg21 <= (8'hb3);
              reg22 <= (reg16 ? wire2[(1'h0):(1'h0)] : reg10);
            end
          else
            begin
              reg21 <= ((~((~&reg20[(4'he):(4'h8)]) ?
                      (^$signed(wire3)) : reg5[(2'h2):(1'h1)])) ?
                  ((reg13 == (8'hb1)) ?
                      reg9[(1'h0):(1'h0)] : {$unsigned($unsigned(reg12))}) : wire2[(3'h6):(3'h5)]);
              reg22 <= $unsigned(reg11);
              reg23 <= reg21;
              reg24 <= $unsigned((~|(reg11[(2'h3):(1'h1)] ?
                  wire1[(2'h3):(2'h3)] : (8'hbb))));
            end
        end
      else
        begin
          reg19 <= ((reg6 - (^~{(reg19 >> (8'hbd))})) << $unsigned((7'h43)));
          reg20 <= reg11;
          reg21 <= (8'ha7);
        end
    end
  assign wire25 = (^~(^~reg9));
  assign wire26 = wire0;
  assign wire27 = (reg14[(4'h9):(3'h4)] <= ((&$signed($unsigned(reg17))) ?
                      ({(!wire0), reg10} * ($unsigned(reg19) ?
                          reg20 : (8'hb4))) : reg16[(4'he):(4'hc)]));
  assign wire28 = reg24;
  assign wire29 = (~^$unsigned(wire2[(3'h4):(1'h0)]));
  assign wire30 = $signed(((8'hb9) ? (8'hbf) : reg15[(2'h2):(1'h1)]));
  assign wire31 = ($unsigned($unsigned($unsigned(reg6[(1'h0):(1'h0)]))) - reg18[(2'h2):(1'h1)]);
  assign wire32 = ((-{{wire26[(2'h2):(1'h1)], $signed(wire2)}, wire2}) ?
                      $signed({{(reg14 + wire28),
                              wire27[(2'h2):(1'h0)]}}) : (^{$signed($signed(wire4))}));
  assign wire33 = wire29[(1'h0):(1'h0)];
  assign wire34 = {reg18};
  always
    @(posedge clk) begin
      if ((|(wire31 && ((reg14[(3'h6):(3'h6)] == $unsigned(wire33)) ?
          $signed((wire26 ? wire26 : wire28)) : (~$unsigned((8'hba)))))))
        begin
          reg35 <= $unsigned($signed(((~&$unsigned(wire31)) <<< (wire25 ~^ $signed(reg6)))));
          reg36 <= (reg20[(3'h7):(1'h1)] | reg18);
          reg37 <= (($unsigned({$signed(reg10), (wire3 ? wire28 : reg22)}) ?
              $signed($unsigned(wire31[(1'h0):(1'h0)])) : ({{wire30, (7'h42)},
                  (^~(7'h43))} <= $unsigned($signed(reg14)))) <<< $unsigned(($signed({reg5}) & $unsigned({(8'haf)}))));
        end
      else
        begin
          reg35 <= ((reg36 - {((reg17 <<< reg6) ?
                  $unsigned(reg35) : (reg18 ? reg14 : wire30)),
              $signed((8'ha1))}) * $signed(($unsigned(wire31) >= (!reg15))));
        end
    end
  assign wire38 = (~(~($unsigned($signed(wire26)) ?
                      reg13 : $unsigned(reg35[(2'h3):(2'h2)]))));
endmodule

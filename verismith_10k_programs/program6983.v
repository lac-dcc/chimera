module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
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
      reg4 <= (($unsigned(wire3[(3'h7):(3'h5)]) ?
              (wire3 <<< (wire0[(5'h10):(3'h4)] ?
                  (|wire0) : wire3[(3'h4):(1'h1)])) : (($unsigned(wire0) > $unsigned(wire0)) ?
                  wire1[(3'h4):(2'h3)] : (!{wire3}))) ?
          $unsigned(wire2[(1'h1):(1'h1)]) : wire3);
      reg5 <= wire2[(2'h2):(1'h0)];
      if ($signed($unsigned($signed(wire2))))
        begin
          reg6 <= $unsigned(wire1[(3'h6):(3'h4)]);
          reg7 <= (~reg5[(3'h5):(2'h2)]);
          reg8 <= reg5[(1'h0):(1'h0)];
          reg9 <= reg8;
          reg10 <= ((reg9 - reg7[(1'h1):(1'h0)]) > (^~$signed(($unsigned(reg9) <= reg9[(3'h5):(3'h4)]))));
        end
      else
        begin
          reg6 <= $signed($signed($unsigned(reg8[(3'h5):(2'h2)])));
          reg7 <= wire0[(4'h9):(3'h5)];
          if (({$signed((wire1[(3'h6):(1'h0)] && $signed((8'ha1)))),
                  (+$unsigned($unsigned(wire0)))} ?
              $unsigned($unsigned($unsigned({reg4,
                  reg6}))) : ((($unsigned(wire3) != (8'hb3)) ?
                  (wire2[(3'h7):(2'h2)] <= reg7) : $signed({(8'hb9),
                      reg8})) ~^ $signed(reg6))))
            begin
              reg8 <= {wire3[(3'h5):(2'h3)]};
              reg9 <= $unsigned(((|(^~reg7[(2'h2):(1'h0)])) ?
                  ((!reg9[(4'h8):(3'h4)]) ?
                      wire1 : reg6[(1'h1):(1'h0)]) : reg9[(4'h9):(3'h7)]));
              reg10 <= $signed(reg10);
            end
          else
            begin
              reg8 <= $unsigned((-$signed(($signed(reg6) == $signed(wire3)))));
              reg9 <= $unsigned(((~&reg5[(2'h2):(1'h1)]) <= $unsigned(({wire3} ?
                  (reg10 >> wire0) : {reg6, reg5}))));
              reg10 <= $signed(($unsigned(((reg9 == reg7) ?
                  wire0[(3'h5):(1'h0)] : reg5)) * (~^((wire2 * reg5) ?
                  $signed(reg5) : (|wire3)))));
            end
          reg11 <= (((~|((~|reg10) ?
                  (reg8 || reg9) : {wire3})) == (~|$unsigned((wire1 ?
                  wire1 : wire0)))) ?
              {(|(!reg10))} : reg6[(1'h1):(1'h0)]);
          reg12 <= (-$signed($signed((8'ha3))));
        end
      if (reg5)
        begin
          reg13 <= wire1[(1'h0):(1'h0)];
        end
      else
        begin
          reg13 <= (|(^reg10));
          reg14 <= (~reg9);
          reg15 <= reg5;
        end
      reg16 <= ((+(+reg7[(1'h0):(1'h0)])) ^ $signed(({$unsigned(reg13)} ?
          reg4 : (reg14 && reg14))));
    end
  always
    @(posedge clk) begin
      reg17 <= (({({(8'hae), reg12} ?
                  (|wire1) : reg6[(1'h0):(1'h0)])} >>> (8'hbe)) ?
          reg10[(4'hb):(4'h9)] : ($unsigned({reg5[(3'h5):(1'h1)],
                  $unsigned(reg14)}) ?
              $signed($unsigned(reg12)) : $signed($signed(reg8))));
      if (($signed({(+$unsigned(reg17)), (8'hb2)}) ?
          reg13 : (reg13 ? (^~$unsigned((!reg14))) : $signed(reg12))))
        begin
          reg18 <= (8'hb4);
          reg19 <= reg4;
          reg20 <= $signed($signed((!$unsigned($unsigned(reg14)))));
          if (reg20[(4'h8):(1'h1)])
            begin
              reg21 <= (~reg10[(1'h1):(1'h0)]);
              reg22 <= $signed($signed($unsigned((|wire0))));
              reg23 <= {$signed(($signed((reg4 ? wire1 : reg16)) ?
                      ($signed(reg17) << reg14[(2'h2):(2'h2)]) : $signed($unsigned(reg22))))};
              reg24 <= (((8'ha9) & ($signed($unsigned((7'h43))) <= $signed({reg5}))) >= wire0);
            end
          else
            begin
              reg21 <= $signed(reg21);
              reg22 <= reg13[(4'hc):(3'h6)];
              reg23 <= $signed(((&reg9) < wire1));
            end
          reg25 <= ({(!$signed((wire3 > (8'ha5))))} ?
              $unsigned((reg5 ?
                  reg18[(1'h0):(1'h0)] : ($unsigned(wire0) != $signed(reg20)))) : {$signed($signed(reg7))});
        end
      else
        begin
          reg18 <= reg21[(1'h1):(1'h0)];
          reg19 <= ($unsigned($signed(reg20[(1'h0):(1'h0)])) ?
              $signed($signed($signed($signed(reg25)))) : ($unsigned(reg12) ?
                  (reg18 ? (+(~reg24)) : reg18) : {$unsigned((8'ha6))}));
          reg20 <= $signed((+reg8));
          reg21 <= reg18;
        end
      reg26 <= $signed($signed({((reg25 >> (8'had)) > $signed(wire0)),
          $unsigned(reg9[(4'h8):(3'h7)])}));
      reg27 <= {reg18[(2'h3):(2'h3)], $unsigned((|$signed($signed(reg23))))};
    end
  assign wire28 = (wire0[(5'h10):(4'ha)] >>> $signed((reg27 ?
                      reg8 : reg17[(2'h3):(1'h0)])));
  assign wire29 = {(~&($signed((wire0 ? reg18 : reg12)) ?
                          {(8'hbe)} : (~(reg21 ? reg23 : reg13)))),
                      {$signed(($signed(wire2) ^~ $unsigned(wire0)))}};
  assign wire30 = (~|{$signed(($signed(reg27) ^~ (reg8 ? reg16 : (8'ha8)))),
                      reg14[(4'hc):(4'ha)]});
  assign wire31 = ($signed(($unsigned((~&(8'hb6))) ?
                      {$signed(reg27)} : wire29)) >= (~(+($unsigned(wire3) ?
                      (wire28 && reg9) : ((8'hac) < reg17)))));
  always
    @(posedge clk) begin
      reg32 <= $unsigned($unsigned($unsigned(reg5)));
      reg33 <= wire1;
      if ({(+$unsigned(((reg22 ? reg21 : wire29) <<< reg10[(4'hf):(1'h1)])))})
        begin
          reg34 <= {(($signed($signed((8'hb0))) < reg27[(3'h7):(2'h2)]) ?
                  (^~(wire1 ?
                      $unsigned(reg21) : (wire2 ?
                          wire1 : reg9))) : reg13[(4'h9):(4'h8)])};
          reg35 <= ($signed({$signed((reg8 ?
                  reg13 : wire31))}) - wire28[(1'h0):(1'h0)]);
          reg36 <= reg10[(3'h6):(3'h6)];
        end
      else
        begin
          if (wire30[(1'h0):(1'h0)])
            begin
              reg34 <= {reg24[(4'hb):(2'h2)],
                  (({(reg9 << wire31), reg27[(4'ha):(1'h1)]} ?
                          reg10[(3'h6):(1'h1)] : wire29) ?
                      (8'ha7) : $unsigned((|$unsigned(reg13))))};
            end
          else
            begin
              reg34 <= ({(^~({wire3} - (|reg27))),
                  (^reg12[(2'h2):(2'h2)])} <= $signed(($signed(reg14[(1'h1):(1'h1)]) ?
                  $signed(reg21) : $unsigned({wire1, reg35}))));
              reg35 <= $unsigned($unsigned(reg7));
              reg36 <= wire29[(4'he):(3'h7)];
              reg37 <= reg24;
              reg38 <= $unsigned(reg14);
            end
          reg39 <= (+$signed(reg8[(3'h5):(2'h3)]));
          reg40 <= $unsigned($unsigned(reg20[(4'hc):(4'h9)]));
          reg41 <= $unsigned($signed((wire1 ?
              reg17 : (reg15[(3'h6):(2'h2)] ?
                  (reg13 ? reg23 : wire31) : (wire30 ? (8'hbc) : reg16)))));
        end
    end
  assign wire42 = ($unsigned($unsigned($signed(reg8))) ?
                      (~|(8'ha9)) : (~(8'hac)));
  assign wire43 = reg17[(1'h0):(1'h0)];
endmodule

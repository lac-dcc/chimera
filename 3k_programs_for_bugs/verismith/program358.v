module top
#(parameter param39 = (~|((8'hab) >> (8'hba))), 
parameter param40 = {(|(((^~param39) ~^ (param39 > param39)) ? (param39 ? (param39 - param39) : ((8'hb6) & param39)) : (param39 || ((7'h41) ? param39 : param39)))), ((param39 == {(param39 ? param39 : param39)}) >= (~|(^{param39})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire5,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 (1'h0)};
  assign wire4 = {(|wire2[(3'h6):(2'h2)]), $unsigned(wire3)};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= ($signed({(wire5 ?
              (wire4 ?
                  wire0 : (7'h40)) : $signed(wire5))}) > wire5[(4'hc):(3'h6)]);
      reg7 <= ($unsigned($unsigned(wire1)) <= (wire1[(4'ha):(4'h8)] ?
          wire5 : ((((7'h40) ? wire2 : wire0) ?
              $unsigned(wire2) : wire5) < wire2[(3'h7):(3'h4)])));
      reg8 <= (-reg6);
      if ((~^((&{wire4}) + $unsigned((^(wire5 ? reg7 : reg8))))))
        begin
          reg9 <= reg8;
          reg10 <= (|((+{wire0[(5'h12):(3'h7)]}) ?
              {$signed({(8'hbf), wire5}), (8'hb9)} : ($unsigned($signed(reg7)) ?
                  $unsigned((wire3 ? reg9 : (8'hb1))) : wire2)));
        end
      else
        begin
          reg9 <= (^~$unsigned({((reg8 ? reg10 : reg8) * (-wire3))}));
          reg10 <= wire2;
          if (wire4)
            begin
              reg11 <= wire0[(4'h8):(3'h6)];
              reg12 <= (+$signed($signed(((&reg9) * {reg7}))));
              reg13 <= reg11[(1'h1):(1'h1)];
              reg14 <= (^({($unsigned((8'had)) || $unsigned(reg7))} | (8'h9e)));
            end
          else
            begin
              reg11 <= {reg10[(3'h7):(3'h5)], wire3};
              reg12 <= $signed(reg11[(2'h3):(1'h0)]);
              reg13 <= (({reg7[(3'h4):(2'h3)]} - $unsigned((~^reg7))) < reg14[(3'h4):(2'h3)]);
              reg14 <= ($unsigned($signed(reg13[(2'h3):(1'h1)])) ?
                  ((reg11[(1'h1):(1'h0)] ?
                          ((reg11 <= reg7) - $unsigned(wire4)) : (^~{wire4})) ?
                      reg9[(4'hb):(3'h6)] : reg6) : $signed($unsigned((!(~^wire2)))));
            end
        end
      if ((^~(reg10 ? $unsigned((&wire3)) : {(reg9[(2'h2):(1'h1)] * wire3)})))
        begin
          reg15 <= ((&($unsigned((reg11 ^ reg9)) - (~$signed(reg7)))) ?
              (&wire0[(3'h4):(2'h3)]) : ((($signed(reg7) ?
                          {reg8, reg10} : (~^reg8)) ?
                      reg7 : $signed(reg7)) ?
                  (8'ha2) : reg14[(3'h4):(2'h3)]));
          reg16 <= {(~^$signed((^$signed((8'hbe)))))};
        end
      else
        begin
          if ({(&$signed(((+reg9) ? wire5[(3'h4):(2'h3)] : $unsigned(reg14)))),
              (wire2 | ($signed((reg6 ? reg6 : reg16)) ?
                  $signed((|wire3)) : {$unsigned(reg14)}))})
            begin
              reg15 <= ($signed((~|{$unsigned(reg12)})) ?
                  $signed(({(reg14 + reg9), (reg12 ? reg16 : wire3)} ?
                      reg15 : wire3[(4'he):(3'h7)])) : reg9[(2'h3):(2'h3)]);
              reg16 <= $unsigned((~|$signed(($signed(reg16) + $unsigned(reg8)))));
              reg17 <= $unsigned($unsigned($signed(reg16)));
            end
          else
            begin
              reg15 <= $signed(($unsigned(($unsigned(wire5) ?
                      reg9 : (reg6 ? reg16 : reg15))) ?
                  reg12 : reg14[(4'h9):(3'h4)]));
              reg16 <= reg7[(2'h2):(1'h1)];
            end
          reg18 <= reg17[(2'h3):(1'h0)];
          reg19 <= reg10;
          reg20 <= ($unsigned($unsigned(reg15[(2'h3):(1'h1)])) ?
              (^~$signed({(reg6 ? reg13 : (7'h41)),
                  $unsigned(wire4)})) : reg17);
          reg21 <= $signed(((^$signed(reg13[(4'h8):(1'h1)])) <<< $signed({(reg13 ?
                  reg8 : reg7),
              (~reg10)})));
        end
    end
  assign wire22 = $signed((reg13 | (((reg14 <= reg16) < $unsigned(reg14)) > ((reg19 != reg17) == $signed(reg21)))));
  assign wire23 = $unsigned($unsigned((reg9[(3'h6):(2'h2)] - ($unsigned(reg21) ?
                      (reg18 <= reg16) : (reg11 && reg9)))));
  assign wire24 = reg20;
  assign wire25 = reg21[(4'h8):(3'h6)];
  assign wire26 = $signed((+wire1));
  always
    @(posedge clk) begin
      reg27 <= $signed((reg9[(4'hb):(1'h1)] <<< (^~$unsigned((^~reg7)))));
    end
  always
    @(posedge clk) begin
      reg28 <= (^~(wire22 * ((reg8[(3'h5):(1'h0)] ^ $unsigned((8'ha0))) >> wire24[(4'hb):(4'h9)])));
      if (($signed(((wire25 ?
              reg27[(1'h0):(1'h0)] : (wire25 ? wire22 : (8'haa))) ?
          {{(8'hb8)},
              reg7[(1'h1):(1'h0)]} : {(reg6 >= reg10)})) >= {(~|(^$unsigned((8'ha7)))),
          wire26[(5'h10):(4'hb)]}))
        begin
          reg29 <= ({{wire23[(1'h0):(1'h0)],
                      $unsigned((reg14 ? wire2 : (8'hbb)))}} ?
              (^{($unsigned(reg19) ?
                      reg11 : $signed(reg21))}) : wire25[(5'h11):(4'hc)]);
          reg30 <= reg13[(2'h2):(1'h1)];
          reg31 <= $signed($signed((&(&(wire0 ? reg27 : wire2)))));
          reg32 <= $signed(((reg6[(4'hf):(1'h0)] ?
              wire5 : {wire25[(4'hd):(1'h0)]}) ^~ ($signed(((7'h43) == reg12)) & ({reg10,
                  reg30} ?
              (^reg6) : (+reg7)))));
        end
      else
        begin
          reg29 <= ($signed((~^$unsigned(reg17[(3'h6):(3'h5)]))) ?
              (~{reg30,
                  $unsigned($signed(wire22))}) : $unsigned((($unsigned(reg29) >> $signed((8'ha7))) * $signed(reg6[(3'h6):(3'h6)]))));
          reg30 <= $unsigned($signed(wire4));
          reg31 <= wire2;
          if ((wire22 > (reg21[(4'he):(4'h8)] >= {(!(+wire23))})))
            begin
              reg32 <= $signed((wire26[(4'hd):(4'hc)] && ({reg30,
                  (7'h41)} > wire26[(2'h3):(1'h0)])));
              reg33 <= (-{(reg21[(1'h1):(1'h1)] ? wire26 : reg30)});
            end
          else
            begin
              reg32 <= $unsigned(reg20[(1'h1):(1'h0)]);
              reg33 <= reg33;
            end
          reg34 <= (($unsigned((7'h40)) ?
                  (~&(~$unsigned(reg8))) : {reg11, ({(8'hb4)} && reg31)}) ?
              (reg8 ?
                  reg7[(2'h3):(2'h2)] : (wire2 == $unsigned(reg13))) : (($unsigned(((8'hb2) << wire0)) ?
                      $signed($unsigned(reg9)) : {(8'had), wire25}) ?
                  reg33 : $unsigned($unsigned((reg28 ? (8'hac) : reg13)))));
        end
      reg35 <= (&{wire23[(5'h11):(3'h5)]});
    end
  assign wire36 = (reg14 ? $signed((+{(^~reg29)})) : wire2);
  assign wire37 = wire36;
  assign wire38 = wire25[(2'h3):(2'h3)];
endmodule

module top
#(parameter param38 = (((~|(((8'hbf) ? (8'haf) : (8'had)) ? (+(8'had)) : ((8'hb5) ? (8'hac) : (7'h44)))) ? (-{((8'hbd) ? (8'h9e) : (8'hbc))}) : ({(~&(8'hba)), {(8'h9f)}} >>> (^(~(8'ha5))))) ^~ (8'ha4)), 
parameter param39 = (param38 & (^~param38)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (wire2 ? wire0[(4'h9):(1'h1)] : (8'hb6));
  assign wire5 = ($unsigned((!((wire2 && wire2) * ((7'h42) || wire0)))) || $signed(wire0));
  assign wire6 = wire2[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg7 <= wire1[(2'h2):(1'h1)];
      reg8 <= $unsigned(wire3);
      if ((~^$unsigned({(+{wire5, wire2})})))
        begin
          reg9 <= ((^~(wire4 ?
              $unsigned((wire2 ?
                  wire4 : wire3)) : ($signed(reg8) >>> $unsigned(reg7)))) && {(&(^~((8'ha3) << wire4)))});
          reg10 <= wire4;
          if ((({((8'had) ? {wire5, reg8} : ((8'ha9) ? wire1 : reg10))} ?
                  ($unsigned(reg8) ?
                      reg8[(3'h7):(1'h1)] : $signed(reg7)) : (~|wire0)) ?
              (&($signed((reg10 <<< wire2)) ?
                  $signed((reg10 ?
                      reg10 : (8'hbd))) : $unsigned(reg10))) : {wire6[(4'hb):(1'h1)],
                  (wire3[(3'h6):(2'h3)] || ((wire1 >= reg9) ?
                      (reg8 >= wire5) : ((8'h9f) ? reg7 : reg7)))}))
            begin
              reg11 <= $unsigned(wire3);
              reg12 <= reg9[(1'h0):(1'h0)];
              reg13 <= (~&$unsigned(reg8));
              reg14 <= {(7'h44), $signed($signed(reg9[(2'h3):(2'h3)]))};
              reg15 <= reg8[(4'h8):(3'h6)];
            end
          else
            begin
              reg11 <= {$unsigned($signed((wire3[(2'h3):(2'h2)] ?
                      wire2[(2'h3):(2'h2)] : (wire1 ? (8'ha7) : wire5)))),
                  reg9};
              reg12 <= {(((wire3 ? (8'h9c) : (wire0 << (8'hae))) ?
                      ((^wire4) ?
                          wire1[(1'h1):(1'h1)] : reg12[(1'h0):(1'h0)]) : $signed(reg7[(2'h3):(1'h1)])) - $unsigned({{wire2}}))};
            end
          reg16 <= ({$signed(wire0)} && {(reg9[(2'h3):(2'h2)] ?
                  $unsigned($signed((8'ha1))) : reg12[(2'h3):(2'h3)]),
              (^$signed(reg14))});
          reg17 <= (~|{$unsigned($unsigned((-reg14))),
              (wire0 ? (8'hbf) : $signed($unsigned(reg12)))});
        end
      else
        begin
          reg9 <= (~&(($unsigned(wire2) ? {(+reg9)} : reg9) ?
              wire4 : {($unsigned(reg12) ?
                      (reg13 >>> (8'haf)) : (reg17 ~^ reg9)),
                  {reg9, reg11}}));
        end
      reg18 <= wire6;
      if ((^{(+{reg16, {reg14}})}))
        begin
          reg19 <= $unsigned(($signed(reg16) <<< {$unsigned($unsigned(wire6))}));
        end
      else
        begin
          if (wire0)
            begin
              reg19 <= (($signed((^~wire0[(4'hd):(4'hd)])) ?
                      wire0 : $unsigned($unsigned((reg18 - wire0)))) ?
                  ((&((~^reg17) ?
                      reg18 : reg7)) <= (((wire1 <<< (7'h42)) <<< (^wire6)) || (((8'ha2) ?
                          reg16 : wire3) ?
                      (~reg8) : $unsigned(reg16)))) : ({{(^reg9),
                          reg7[(2'h3):(1'h1)]}} >>> wire0));
              reg20 <= ($signed({reg9[(4'h9):(3'h4)]}) >>> wire4[(1'h0):(1'h0)]);
              reg21 <= $unsigned((~^($unsigned(((8'ha7) << (8'hbd))) * wire4)));
              reg22 <= ((^~$unsigned((^~(&(8'haa))))) ?
                  reg18[(2'h2):(1'h0)] : (reg18 ?
                      {({reg15} ? (reg7 ? reg8 : reg16) : $signed(reg10)),
                          $signed($signed(reg12))} : reg13[(3'h4):(2'h2)]));
            end
          else
            begin
              reg19 <= $unsigned($signed(reg19));
              reg20 <= $signed(($unsigned(reg10) ?
                  reg15 : ($signed(reg11) < reg15[(3'h4):(1'h1)])));
              reg21 <= $unsigned($unsigned(reg7));
              reg22 <= reg15[(5'h11):(4'h9)];
              reg23 <= reg19[(3'h6):(2'h2)];
            end
          reg24 <= ($signed(wire3[(1'h0):(1'h0)]) ?
              ((^(~(wire5 ? reg13 : reg8))) << (8'hb0)) : reg15);
          reg25 <= (~|$unsigned($signed((+(reg14 ^ wire1)))));
        end
    end
  assign wire26 = (|reg20);
  assign wire27 = (-reg24[(4'ha):(4'h9)]);
  assign wire28 = reg9[(3'h7):(2'h3)];
  assign wire29 = ($unsigned($signed(((8'hb9) ?
                      (8'h9d) : (wire28 + reg22)))) ^~ (~&((~reg10[(3'h5):(1'h0)]) ?
                      (!reg23) : wire5[(1'h0):(1'h0)])));
  assign wire30 = reg14[(1'h0):(1'h0)];
  assign wire31 = reg9;
  assign wire32 = $signed(reg24[(4'h9):(3'h5)]);
  assign wire33 = {(((^~$signed(reg14)) == reg24) ?
                          (^~{(reg14 ? reg15 : reg18),
                              {reg18, reg10}}) : (~^{{reg8, wire26},
                              {(8'had)}})),
                      wire6[(4'h9):(1'h1)]};
  assign wire34 = (reg19[(4'hb):(4'hb)] + ({(|reg19)} ?
                      $unsigned(wire5) : reg9));
  assign wire35 = (~&$signed(($signed($signed(wire27)) ?
                      (-$unsigned((8'hb1))) : $unsigned($unsigned(wire31)))));
  assign wire36 = $signed({$signed(((reg25 ? reg24 : (8'haa)) ?
                          reg23 : (wire6 ? reg8 : wire34)))});
  assign wire37 = $signed($signed(reg20[(4'h8):(3'h7)]));
endmodule

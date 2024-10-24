module top
#(parameter param33 = (8'ha5), 
parameter param34 = ({(param33 ^ (param33 ? param33 : {param33})), ((7'h43) == ((param33 | (8'h9d)) ? (~|param33) : (^param33)))} ? ((((param33 ? (7'h43) : param33) ? {(8'hb6), param33} : (param33 ? (8'hae) : (8'hbb))) ? ((^(8'hb1)) ? (param33 >= param33) : param33) : (param33 ? param33 : (+param33))) > ((!param33) || (((8'haa) ? param33 : param33) + (param33 - param33)))) : (^param33)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = ((($signed($unsigned(wire3)) * ({wire2, wire4} ?
                     $signed(wire3) : (wire2 <= wire4))) & (~|wire0)) != (8'h9f));
  assign wire6 = wire4;
  assign wire7 = (~&$unsigned({(8'ha1)}));
  assign wire8 = wire5[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg9 <= (wire6[(1'h1):(1'h0)] ?
          ((~|((!(8'had)) ? (^(8'had)) : (^wire0))) ?
              (+wire7) : $unsigned(wire0[(4'he):(4'ha)])) : wire5[(2'h3):(1'h0)]);
      reg10 <= wire2;
      reg11 <= (8'hb6);
      if (wire2)
        begin
          reg12 <= {reg11,
              {$signed($signed((wire8 ? reg11 : wire3))),
                  (-wire6[(4'ha):(4'h8)])}};
        end
      else
        begin
          reg12 <= (~|wire3);
        end
      reg13 <= reg9[(1'h0):(1'h0)];
    end
  assign wire14 = $signed(((-(!wire5)) * (~|(~&$unsigned(wire3)))));
  always
    @(posedge clk) begin
      reg15 <= wire6[(4'h9):(2'h3)];
      if ((~&$unsigned((~^$unsigned({wire2, wire14})))))
        begin
          reg16 <= $unsigned(reg9);
          reg17 <= $unsigned({reg12[(4'hd):(4'hb)],
              $unsigned(reg15[(3'h5):(2'h3)])});
        end
      else
        begin
          reg16 <= (reg17[(2'h2):(2'h2)] & ($signed((wire5 ?
              wire7 : $unsigned(reg16))) >>> (reg11[(3'h5):(3'h5)] ^ wire7)));
          reg17 <= wire3[(2'h2):(1'h1)];
          if (reg11[(1'h0):(1'h0)])
            begin
              reg18 <= wire6[(2'h2):(2'h2)];
            end
          else
            begin
              reg18 <= reg12;
              reg19 <= ((&$signed($unsigned({reg9,
                  reg9}))) <<< {wire8[(1'h1):(1'h0)]});
              reg20 <= $unsigned(wire3);
              reg21 <= (wire3[(1'h1):(1'h1)] ?
                  reg13 : {$unsigned($signed(wire6))});
            end
          if ({$unsigned((reg16[(1'h0):(1'h0)] ~^ $unsigned(reg17[(1'h0):(1'h0)]))),
              $unsigned($unsigned((~|$signed(reg19))))})
            begin
              reg22 <= ((((|$unsigned((8'hb1))) ?
                          (wire4 ?
                              $signed(reg13) : wire3) : ($unsigned((8'hb6)) <<< $signed(reg13))) ?
                      (8'h9e) : wire14[(4'he):(2'h3)]) ?
                  reg20 : ($signed($unsigned(wire8[(3'h4):(3'h4)])) - (((~|reg20) * wire1[(4'ha):(4'h9)]) ?
                      reg15 : (~^(~&(8'hbe))))));
              reg23 <= {(reg22[(3'h4):(2'h3)] != ($signed((&wire5)) ?
                      reg9 : reg21[(2'h2):(2'h2)]))};
              reg24 <= $unsigned(($signed((+(~^(8'ha8)))) ?
                  (8'hac) : {wire2[(4'hc):(4'hc)],
                      $signed($unsigned((8'ha2)))}));
              reg25 <= (reg18 ? (~&(!{$signed(wire1)})) : reg18);
            end
          else
            begin
              reg22 <= (((reg15 ?
                  (^wire4[(2'h2):(2'h2)]) : (~^(reg22 ~^ reg10))) & reg25) - {(7'h40),
                  wire0[(3'h6):(3'h5)]});
              reg23 <= $signed((!(~&{((7'h43) >= wire1), {reg22, reg22}})));
              reg24 <= $unsigned(wire8);
              reg25 <= wire2[(2'h2):(1'h1)];
              reg26 <= reg19[(4'ha):(1'h0)];
            end
          reg27 <= ($signed($unsigned((!(~^reg19)))) - $unsigned((reg26 ?
              ($unsigned(reg22) ?
                  $unsigned((8'h9f)) : $signed(reg25)) : reg25[(1'h0):(1'h0)])));
        end
      reg28 <= $signed(wire6[(1'h1):(1'h1)]);
    end
  assign wire29 = (!{(reg27 | (!((8'ha6) ? reg20 : wire7)))});
  assign wire30 = reg24[(1'h0):(1'h0)];
  assign wire31 = reg18;
  assign wire32 = (reg25 ~^ $signed($unsigned($unsigned((~|reg18)))));
endmodule

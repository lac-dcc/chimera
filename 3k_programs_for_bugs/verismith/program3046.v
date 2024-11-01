module top
#(parameter param28 = ((((~|(7'h43)) ? ((^(8'h9f)) & ((8'hb7) ? (8'hb8) : (8'ha3))) : (|{(8'hb5)})) * (!(((8'haf) ? (8'ha6) : (8'hbd)) >>> ((8'ha1) << (8'hbc))))) <= {(!{{(8'hbc)}, ((8'hb6) ? (8'ha5) : (7'h40))}), (8'ha3)}), 
parameter param29 = param28)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
                 reg22,
                 reg21,
                 reg20,
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
  assign wire4 = ({((!(8'hb6)) & wire1[(1'h0):(1'h0)])} ?
                     wire0[(4'h9):(3'h5)] : {(8'hbc), wire3[(3'h5):(2'h2)]});
  always
    @(posedge clk) begin
      reg5 <= (~&$unsigned((+(~^(wire1 ? wire1 : wire3)))));
      reg6 <= wire2[(1'h0):(1'h0)];
      reg7 <= $signed(wire1[(2'h2):(1'h1)]);
      reg8 <= $unsigned((+((wire4 & (wire1 ?
          wire3 : (8'ha2))) - reg5[(4'hc):(4'h8)])));
      if ($signed(($signed(wire4) >= {(reg7[(5'h11):(5'h10)] > $unsigned((8'hb4)))})))
        begin
          reg9 <= wire3[(2'h3):(2'h2)];
          reg10 <= ($signed(reg9[(3'h5):(2'h2)]) < $signed(wire3[(1'h0):(1'h0)]));
          reg11 <= $unsigned(reg6[(2'h3):(2'h2)]);
          reg12 <= $unsigned(wire0);
        end
      else
        begin
          reg9 <= reg10;
          reg10 <= reg5[(2'h3):(1'h0)];
          if ($signed((~&(((!wire4) && (-reg7)) ?
              {(wire4 ? reg12 : reg7), $unsigned(wire4)} : {(wire3 >= reg7)}))))
            begin
              reg11 <= reg6[(1'h1):(1'h1)];
              reg12 <= {$unsigned(({((8'hab) ? wire1 : reg9)} ^ reg8))};
              reg13 <= ((wire0[(3'h7):(3'h4)] ? reg5 : wire1[(1'h0):(1'h0)]) ?
                  ((reg11[(3'h6):(1'h1)] ~^ wire0[(2'h2):(2'h2)]) ?
                      $signed($signed((reg11 ^~ reg8))) : wire3[(2'h2):(2'h2)]) : $unsigned($unsigned(($signed(reg6) && (~^wire3)))));
              reg14 <= wire4[(2'h3):(1'h1)];
            end
          else
            begin
              reg11 <= ((8'ha8) ?
                  ((wire0[(3'h6):(2'h3)] ?
                          (|wire3) : $signed(reg14[(3'h6):(2'h2)])) ?
                      wire2[(2'h2):(2'h2)] : (~|{$signed(reg11),
                          (7'h41)})) : (~^wire0));
            end
          reg15 <= (wire1 ?
              $signed({{(~&reg14)},
                  ($unsigned(reg5) ?
                      {(8'hbe),
                          reg11} : wire3[(2'h3):(1'h1)])}) : ($unsigned((+((8'ha7) != reg11))) < reg10));
          reg16 <= (~(~&wire0[(3'h4):(2'h3)]));
        end
    end
  assign wire17 = $signed((reg15 & {$signed((^~wire4))}));
  assign wire18 = reg11;
  assign wire19 = (-(reg15[(3'h7):(1'h1)] ^ (~^wire4)));
  always
    @(posedge clk) begin
      reg20 <= (($signed((|{reg15, wire19})) ? (~^reg7) : (8'ha3)) ?
          (reg10[(1'h0):(1'h0)] ?
              (($unsigned((8'hbf)) || wire4) == ({reg5, reg9} ?
                  (8'hb7) : (^~reg13))) : reg14) : $unsigned((~&(reg9 ?
              $signed(wire2) : wire0))));
      reg21 <= reg9;
      reg22 <= reg11[(4'h8):(1'h1)];
    end
  assign wire23 = $signed((wire4 ?
                      ($signed($unsigned(wire3)) >= ((8'hbe) ?
                          $unsigned(wire1) : (~^reg8))) : reg7));
  assign wire24 = $unsigned(reg10[(4'h9):(4'h8)]);
  assign wire25 = (reg14 ~^ (reg11 - (~&(|((7'h42) * wire19)))));
  assign wire26 = ($unsigned((((reg13 ?
                          (8'ha8) : (8'hb6)) > (&wire17)) ^ wire18[(1'h1):(1'h1)])) ?
                      $unsigned(($signed($signed(wire19)) ?
                          (8'ha9) : (wire3 && $unsigned(reg8)))) : ($unsigned($signed(reg13[(4'ha):(4'ha)])) > (7'h42)));
  assign wire27 = reg11[(1'h1):(1'h0)];
endmodule

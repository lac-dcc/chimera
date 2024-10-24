module top
#(parameter param24 = (((^~(((8'hba) != (7'h42)) <= (!(8'hb9)))) ? {(-((8'hbf) ? (8'hb7) : (8'ha5)))} : (~^(((8'ha4) ? (8'hbf) : (7'h43)) ? ((8'hbe) >> (8'hb4)) : (~|(8'hbd))))) ? ((-(((8'hbd) && (8'h9c)) && ((8'hb4) ^~ (8'ha6)))) ? {(((8'ha7) ? (8'ha5) : (8'h9d)) == {(8'hb0)}), (8'hb9)} : (((8'ha9) ? (7'h44) : {(8'hb1)}) != (-{(8'ha6), (8'hb7)}))) : {(((~&(8'h9e)) ? (~^(7'h40)) : (-(8'hb6))) || (^~((8'hba) >> (8'hb5))))}), 
parameter param25 = param24)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire10,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg9,
                 (1'h0)};
  assign wire5 = ((|{$unsigned(wire0)}) <<< ($signed((wire2[(1'h1):(1'h0)] ?
                         $signed(wire4) : wire0)) ?
                     $signed((|(&wire1))) : $signed(wire1[(2'h2):(2'h2)])));
  assign wire6 = wire2[(5'h12):(1'h0)];
  assign wire7 = (wire4 ?
                     (~(wire2 < wire1[(3'h5):(2'h2)])) : $unsigned($signed({wire6[(2'h3):(1'h1)]})));
  assign wire8 = (!wire1);
  always
    @(posedge clk) begin
      reg9 <= (wire3[(3'h7):(1'h0)] ?
          ($unsigned(wire3) ^ wire1[(4'ha):(4'h9)]) : (~^$signed((8'had))));
    end
  assign wire10 = $signed((|(~&($unsigned(wire7) && (reg9 | wire0)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned((^~(8'hb2)))))
        begin
          reg11 <= $signed((!$unsigned($signed($unsigned((8'hb7))))));
          reg12 <= $unsigned(($unsigned((~&{wire0,
              wire2})) > $signed(wire10[(4'h8):(3'h6)])));
          reg13 <= $signed($signed(reg12[(3'h6):(2'h2)]));
          reg14 <= (wire6 ?
              $signed(wire1) : ((~(~|wire1)) ?
                  ((~&$unsigned(reg11)) ?
                      (wire8[(1'h1):(1'h0)] ~^ reg12[(2'h2):(1'h1)]) : $unsigned(reg9[(1'h0):(1'h0)])) : $unsigned(reg9)));
          if (reg12[(3'h4):(1'h1)])
            begin
              reg15 <= (wire1[(1'h1):(1'h1)] | $signed(({(wire10 != wire5)} ?
                  $unsigned($signed(reg9)) : ($unsigned(reg9) ?
                      $unsigned(wire5) : $unsigned(wire6)))));
              reg16 <= $signed(reg12);
              reg17 <= (^~(-(wire6 != $signed($signed(reg13)))));
              reg18 <= wire0[(2'h2):(2'h2)];
            end
          else
            begin
              reg15 <= ((wire7 ~^ (^($signed((8'ha1)) ?
                      $signed(wire2) : $unsigned((8'ha7))))) ?
                  $unsigned((+($signed(reg14) << (wire0 ?
                      reg13 : reg18)))) : reg14[(4'hd):(2'h2)]);
            end
        end
      else
        begin
          reg11 <= {reg12};
          reg12 <= $signed($signed($signed(({wire10, wire1} ?
              reg12 : $unsigned(wire4)))));
          reg13 <= ($unsigned(reg16[(1'h0):(1'h0)]) < reg17[(3'h5):(3'h5)]);
        end
      reg19 <= (~|((reg9[(3'h4):(1'h0)] ?
          {(reg15 ? (8'ha1) : reg18),
              $unsigned(reg18)} : $signed($unsigned(wire3))) && (($unsigned(wire3) ~^ wire0[(1'h0):(1'h0)]) && ((8'hbf) && $unsigned(wire0)))));
    end
  assign wire20 = $signed((($unsigned((wire5 ? reg15 : wire2)) ^ {(~^reg11),
                      (wire3 & (8'ha1))}) ~^ reg12[(1'h0):(1'h0)]));
  assign wire21 = reg18;
  assign wire22 = reg16;
  assign wire23 = ((wire20[(3'h6):(2'h3)] > (8'hbc)) ?
                      ((~&(wire8 ~^ (^wire6))) ?
                          $unsigned((((8'hb5) == wire2) ?
                              (reg11 ?
                                  wire10 : wire21) : (8'ha7))) : (~$unsigned((|reg15)))) : (|($signed($signed(reg16)) >>> (^(~|wire10)))));
endmodule

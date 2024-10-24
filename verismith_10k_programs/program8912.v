module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (!wire0[(3'h4):(1'h0)]);
  assign wire6 = wire3[(1'h1):(1'h0)];
  assign wire7 = (((|(!$unsigned(wire2))) ?
                         ((^~(&wire2)) - ($signed(wire6) ?
                             {wire2, wire0} : (~|(8'hb4)))) : $signed((&(wire2 ?
                             wire0 : wire4)))) ?
                     $unsigned($unsigned(wire3)) : $signed($unsigned(($unsigned(wire2) ?
                         $unsigned(wire1) : wire2))));
  assign wire8 = $unsigned(({wire1[(1'h0):(1'h0)], wire6[(1'h1):(1'h0)]} ?
                     (wire5 ?
                         wire7 : {((8'hb7) <= (8'ha3))}) : ($signed($unsigned(wire3)) ?
                         $signed((~&wire6)) : $unsigned({wire7, (8'hbe)}))));
  always
    @(posedge clk) begin
      if (((wire8 == $signed(((wire6 & wire8) > {wire7}))) ^~ (^~((~&(wire0 ?
          wire8 : wire0)) > ($signed(wire1) < (~wire1))))))
        begin
          reg9 <= $signed((~wire2));
          reg10 <= (~^(~&(8'hb2)));
        end
      else
        begin
          reg9 <= ((~|{wire4[(4'hc):(4'h8)]}) ?
              $signed(((&reg10[(2'h3):(1'h0)]) + {wire6[(1'h0):(1'h0)]})) : ((reg9 ?
                      wire7 : (wire8[(1'h0):(1'h0)] || (8'haa))) ?
                  (!((reg9 ? wire8 : wire5) ?
                      wire0 : reg10[(2'h3):(2'h2)])) : $unsigned(wire1)));
          reg10 <= $unsigned((($unsigned(wire1) + wire8) <= $unsigned($unsigned((wire3 >>> wire6)))));
          reg11 <= $signed({$unsigned((reg9 ? (8'hbc) : $unsigned(wire1))),
              wire6});
        end
      reg12 <= (($unsigned($unsigned(wire1[(1'h0):(1'h0)])) ^ ($unsigned(wire8[(2'h2):(1'h0)]) ?
          $signed($unsigned((8'hb4))) : $unsigned(wire1[(1'h0):(1'h0)]))) <<< $unsigned(wire5));
      reg13 <= (reg10[(1'h0):(1'h0)] || ((~^(8'h9d)) && (-reg10[(3'h5):(1'h1)])));
      if (wire8)
        begin
          reg14 <= ($unsigned(({wire4, wire6[(2'h2):(1'h0)]} ?
                  (|(reg12 != reg13)) : reg13)) ?
              $signed((-reg10)) : ((wire8 || (((8'hbf) ?
                  wire1 : reg9) == $unsigned(reg11))) != $unsigned((wire6[(3'h4):(2'h2)] ~^ wire7))));
          reg15 <= reg12[(4'hf):(1'h1)];
          reg16 <= $unsigned($signed($unsigned(reg14)));
        end
      else
        begin
          reg14 <= (^$unsigned(reg14));
          reg15 <= wire3[(2'h2):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg17 <= $signed({wire2, $signed((8'hae))});
      reg18 <= ((8'hb4) ? reg14 : wire5);
      reg19 <= (-$unsigned((8'hbd)));
      reg20 <= $unsigned(reg17[(2'h2):(2'h2)]);
      reg21 <= (8'ha1);
    end
  assign wire22 = reg19[(2'h2):(1'h0)];
  assign wire23 = (8'hb2);
endmodule

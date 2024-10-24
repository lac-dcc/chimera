module top
#(parameter param27 = ((~&((&(&(7'h42))) ^~ (((8'hb1) + (8'hb4)) ? ((8'hbf) * (7'h41)) : (&(8'hb4))))) ? (|(&{{(8'ha4), (8'ha7)}, ((8'hbd) << (8'hb6))})) : {{(((8'hb9) * (8'ha1)) & ((8'ha9) >>> (7'h44)))}, (-(8'hb8))}), 
parameter param28 = (|param27))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((+(+((wire2 ? wire2 : wire2) >= wire2))));
      reg5 <= {wire1[(5'h11):(3'h7)]};
    end
  assign wire6 = reg5[(4'hc):(3'h6)];
  assign wire7 = {(~&$unsigned($signed(reg4[(3'h4):(1'h0)])))};
  assign wire8 = (-(reg4 ?
                     $signed(((reg5 ? reg4 : reg5) - (wire0 ?
                         reg5 : wire0))) : $signed((~^(wire7 ?
                         wire6 : reg5)))));
  assign wire9 = ($signed(wire6[(3'h6):(3'h4)]) >= $unsigned($unsigned((7'h42))));
  assign wire10 = $signed((+wire0[(3'h4):(1'h1)]));
  assign wire11 = $unsigned($signed(wire2));
  assign wire12 = $signed(({(8'ha9), $signed((wire2 < wire7))} != (-(8'hb7))));
  assign wire13 = (((wire6 >> wire8) >= $unsigned(wire0[(4'hf):(4'hf)])) && $signed(($unsigned({wire2,
                      wire8}) > (wire7 ? wire6 : (wire2 ? (8'hb2) : wire1)))));
  assign wire14 = (8'hb3);
  always
    @(posedge clk) begin
      reg15 <= (wire2 ?
          ({$signed((wire1 ? reg5 : wire11)),
              $unsigned($signed(wire14))} - (wire9 | wire7[(2'h3):(1'h0)])) : (reg5 ?
              wire9[(1'h0):(1'h0)] : {(~|(&wire9))}));
    end
  always
    @(posedge clk) begin
      reg16 <= (~&$unsigned(wire3[(1'h0):(1'h0)]));
      if ($unsigned(wire12[(2'h3):(2'h2)]))
        begin
          reg17 <= ({$signed(wire3[(3'h5):(1'h0)])} ?
              ((wire8 <<< wire10) ?
                  {$unsigned($signed(reg5)),
                      $unsigned($unsigned(reg16))} : (|$unsigned(wire6[(2'h2):(2'h2)]))) : wire0);
          reg18 <= ($unsigned(wire8) ?
              {($unsigned({reg4}) ?
                      ((wire6 ? reg17 : (8'ha0)) ?
                          (^reg17) : $signed(wire3)) : wire2[(3'h6):(3'h4)]),
                  wire11} : (wire12[(1'h1):(1'h0)] < {$signed($signed((8'hbc)))}));
        end
      else
        begin
          if ((reg15[(3'h4):(2'h3)] & reg4[(4'h9):(3'h6)]))
            begin
              reg17 <= ((wire2[(4'hf):(4'hd)] <<< reg17[(2'h2):(1'h0)]) && (wire14 ?
                  wire2[(4'hf):(4'hb)] : $signed(wire9[(4'h9):(3'h4)])));
              reg18 <= ($signed((({(8'ha6),
                  reg18} >> $unsigned(reg4)) >> $signed({reg16}))) || wire10);
            end
          else
            begin
              reg17 <= $unsigned(reg5[(4'hb):(1'h0)]);
              reg18 <= ((^wire12[(1'h1):(1'h0)]) >= wire9);
            end
          if (((&reg5[(1'h1):(1'h1)]) >> (((-(!wire13)) == {(^wire8)}) << $signed((wire12 ?
              $unsigned(wire1) : (wire6 ? (8'ha1) : reg18))))))
            begin
              reg19 <= (~&(!$unsigned($signed((~|wire3)))));
              reg20 <= wire11;
              reg21 <= ((~^$unsigned($signed($signed(reg20)))) ?
                  wire6[(1'h0):(1'h0)] : (8'h9c));
              reg22 <= (wire7[(2'h3):(2'h2)] ?
                  $signed((~^{(reg4 <= reg17)})) : {((^$unsigned(wire13)) ?
                          ($unsigned((8'ha1)) - wire0[(3'h7):(3'h4)]) : $unsigned($signed(reg21)))});
            end
          else
            begin
              reg19 <= $unsigned({$unsigned($unsigned((wire13 ?
                      wire0 : wire0)))});
            end
          reg23 <= reg17;
          reg24 <= ($unsigned((^~wire0[(3'h4):(1'h1)])) ?
              (&wire8[(4'h9):(2'h3)]) : $unsigned(wire0[(4'hb):(4'h9)]));
          reg25 <= $signed(((^$unsigned((~|wire2))) - $unsigned(((wire2 ^~ wire12) > $signed(wire1)))));
        end
      reg26 <= reg21;
    end
endmodule

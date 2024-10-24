module top
#(parameter param24 = (8'ha2), 
parameter param25 = param24)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = (((8'hb8) ?
                         wire0[(4'h9):(4'h9)] : (wire2[(4'h9):(2'h3)] ?
                             (wire0 ?
                                 {wire2} : ((7'h42) ?
                                     (8'ha7) : wire3)) : (^~$signed((8'hb3))))) ?
                     (~^($signed($unsigned(wire3)) < (8'hbf))) : $unsigned((wire3[(5'h12):(5'h10)] != wire3[(4'ha):(3'h5)])));
  assign wire6 = (^~{wire5, $unsigned($signed($signed((7'h44))))});
  assign wire7 = (wire2 ?
                     {($signed(wire6[(1'h0):(1'h0)]) >> wire2[(4'hb):(3'h7)])} : {(wire4 * (wire6[(1'h1):(1'h0)] ?
                             (wire1 ? wire6 : wire2) : (wire3 >>> wire0))),
                         $signed((~wire0))});
  assign wire8 = (({(wire5[(1'h0):(1'h0)] ? (&wire3) : $unsigned(wire1))} ?
                     ((wire3 - (wire4 ? wire4 : (8'hb2))) ?
                         ($signed(wire1) != (~|wire0)) : wire4[(5'h13):(3'h7)]) : wire4) + $unsigned(wire6));
  always
    @(posedge clk) begin
      reg9 <= (($unsigned(wire5) <<< $unsigned((-$unsigned((8'had))))) ?
          (!$signed({wire5, $unsigned((8'ha7))})) : ((((wire1 ?
                  wire2 : wire7) * {wire5}) >> wire0[(1'h1):(1'h0)]) ?
              (-wire2[(4'h9):(1'h1)]) : wire3[(3'h5):(2'h3)]));
      if (($signed(wire0[(4'he):(4'he)]) ?
          $signed($signed($signed($unsigned((8'ha6))))) : (reg9 ?
              $signed(wire3) : wire0[(3'h7):(3'h6)])))
        begin
          reg10 <= (+($unsigned(($signed(wire7) ?
              {wire7, wire5} : (~&wire0))) ^ wire8[(3'h5):(2'h2)]));
          reg11 <= (8'ha4);
          reg12 <= ($unsigned((&{$signed(reg10)})) + (8'ha2));
        end
      else
        begin
          reg10 <= (({wire4[(3'h7):(3'h6)]} ?
                  ({wire7[(1'h0):(1'h0)]} ^~ $signed(wire8[(2'h3):(1'h1)])) : (wire3 ?
                      {reg11, $signed(wire6)} : wire0)) ?
              wire5[(1'h1):(1'h0)] : wire0);
          reg11 <= (reg12 <<< $signed(reg11[(1'h0):(1'h0)]));
        end
      reg13 <= $unsigned($unsigned(wire0));
      reg14 <= $unsigned(wire0[(2'h3):(1'h1)]);
    end
  assign wire15 = (~^$signed((~&wire2)));
  assign wire16 = ($signed(($signed(wire5[(1'h0):(1'h0)]) >= wire8[(3'h4):(1'h0)])) * wire7[(2'h2):(1'h0)]);
  assign wire17 = $signed(wire0[(4'h8):(3'h5)]);
  assign wire18 = (~|(^~{$unsigned((8'ha7))}));
  assign wire19 = ($unsigned((-((&reg10) <= wire8[(4'h9):(4'h8)]))) <<< $unsigned((reg9[(3'h4):(2'h3)] ?
                      $signed(wire15) : $unsigned(wire18))));
  assign wire20 = (^(wire4 < reg12[(4'hb):(3'h5)]));
  assign wire21 = wire18[(1'h0):(1'h0)];
  assign wire22 = wire6[(1'h0):(1'h0)];
  assign wire23 = wire1;
endmodule

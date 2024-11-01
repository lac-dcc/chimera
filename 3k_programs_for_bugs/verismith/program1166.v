module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire9,
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
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = {((($unsigned(wire0) ~^ wire1) + $unsigned((wire4 ^~ (8'ha1)))) ?
                         ($unsigned($unsigned(wire1)) ?
                             $unsigned($signed(wire0)) : (wire2[(2'h2):(1'h1)] ?
                                 wire2 : wire2)) : wire0[(3'h4):(2'h3)]),
                     $unsigned(wire4[(3'h7):(1'h0)])};
  assign wire7 = (~&$unsigned(wire6));
  assign wire8 = $unsigned({wire2});
  assign wire9 = $unsigned(((!((wire2 >= wire7) * (-wire4))) ?
                     wire4 : $signed($unsigned((wire4 ^~ (8'h9c))))));
  always
    @(posedge clk) begin
      reg10 <= wire9;
    end
  always
    @(posedge clk) begin
      reg11 <= wire0;
    end
  assign wire12 = (&$unsigned($unsigned(wire4[(4'hb):(3'h7)])));
  assign wire13 = wire12;
  assign wire14 = ($signed(wire12) ?
                      wire2 : {(wire12[(3'h4):(1'h0)] ?
                              $unsigned(wire8[(1'h0):(1'h0)]) : (wire2 >= $unsigned((8'ha6))))});
  always
    @(posedge clk) begin
      reg15 <= (~^((~($signed(wire8) > (~|wire8))) ?
          (~&wire12) : (!$signed((wire0 ? wire5 : reg11)))));
      reg16 <= wire8[(2'h2):(1'h0)];
      if (((wire5[(3'h6):(2'h2)] || ($signed(wire12[(4'hb):(2'h3)]) > (|(-wire7)))) ?
          $unsigned($unsigned(wire6)) : {(8'had), (-$signed((|reg15)))}))
        begin
          if (wire9[(3'h6):(3'h6)])
            begin
              reg17 <= $unsigned((wire12 ?
                  $signed(reg16) : $unsigned({$signed((7'h40))})));
              reg18 <= (((wire4[(2'h2):(2'h2)] ?
                      {(reg11 & wire0),
                          wire9[(4'ha):(3'h7)]} : ((~^reg15) * {wire14,
                          wire13})) ?
                  (~wire5) : (^$unsigned((^reg17)))) * $signed($unsigned(reg17[(4'hc):(3'h6)])));
              reg19 <= (^wire2);
              reg20 <= wire14[(2'h2):(1'h0)];
            end
          else
            begin
              reg17 <= wire3[(3'h7):(3'h4)];
              reg18 <= (reg20[(4'he):(3'h6)] ?
                  ((reg15[(3'h5):(2'h3)] & $unsigned((reg17 > reg11))) + ((wire12 * {reg16}) ?
                      wire1 : $signed(wire0))) : wire6[(2'h2):(1'h0)]);
              reg19 <= $unsigned(wire13[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          reg17 <= (wire4[(2'h2):(1'h0)] >> reg16[(1'h1):(1'h0)]);
          reg18 <= ((!($signed($unsigned(wire7)) ?
              (8'ha2) : $unsigned((-wire12)))) & reg16);
          reg19 <= (+(!({reg15[(3'h5):(3'h4)],
              wire14[(3'h4):(3'h4)]} <<< ($unsigned(reg19) >>> (|wire8)))));
          reg20 <= (+$unsigned(wire7));
        end
      reg21 <= $unsigned($unsigned({(wire7[(1'h1):(1'h1)] ?
              $unsigned(wire5) : wire2)}));
    end
endmodule

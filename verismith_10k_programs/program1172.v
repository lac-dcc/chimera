module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg29,
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
                 (1'h0)};
  assign wire5 = wire2[(4'hb):(1'h1)];
  assign wire6 = $signed(wire1);
  assign wire7 = (({(wire0 ? ((7'h42) ? wire6 : wire4) : (~wire0)), wire2} ?
                     wire5 : wire2[(3'h5):(2'h2)]) <= wire4);
  assign wire8 = wire6[(4'h8):(2'h3)];
  assign wire9 = (|$unsigned(({wire3[(3'h6):(2'h2)], $signed((8'hb5))} ?
                     ((~&wire7) ?
                         (wire5 || wire1) : (wire3 ?
                             (7'h44) : wire5)) : wire4[(1'h1):(1'h0)])));
  assign wire10 = wire2[(5'h11):(4'h8)];
  assign wire11 = (((wire6 ?
                          ($unsigned(wire1) ?
                              wire8 : {wire0,
                                  wire5}) : (!wire1[(4'hd):(4'hd)])) ?
                      (wire7[(1'h0):(1'h0)] <<< (+$signed(wire7))) : wire4[(4'hf):(4'hd)]) ~^ wire9);
  assign wire12 = wire3[(4'h9):(1'h1)];
  assign wire13 = (((+((^~wire0) || (wire2 ? wire2 : wire2))) ?
                      (7'h40) : ($unsigned((~^wire6)) | $signed(((8'ha7) ^~ wire5)))) == wire8[(5'h13):(2'h2)]);
  assign wire14 = (((((~^(8'hb1)) + (^~wire0)) ?
                          wire9[(5'h13):(3'h7)] : wire5) ?
                      wire3 : $signed(wire3[(2'h2):(1'h0)])) ^~ $unsigned((((wire9 + wire8) ?
                          (8'had) : wire5) ?
                      wire12[(1'h1):(1'h1)] : wire11[(3'h6):(2'h3)])));
  assign wire15 = (-($signed($unsigned({wire2,
                      (8'hac)})) >> (wire4 >>> $signed(wire4[(4'hf):(1'h1)]))));
  assign wire16 = (({(|$signed(wire10))} ?
                          $unsigned((wire9 ?
                              wire10 : (wire15 >>> wire2))) : wire8[(4'he):(1'h1)]) ?
                      (~^(($unsigned(wire14) < wire7[(3'h4):(1'h0)]) ?
                          ($unsigned(wire4) ?
                              wire11 : (wire11 <= wire0)) : {wire4,
                              $unsigned((8'hb9))})) : wire3[(4'h8):(2'h3)]);
  assign wire17 = {$signed((8'ha5))};
  always
    @(posedge clk) begin
      reg18 <= wire17;
      if (wire15[(4'hc):(4'h8)])
        begin
          reg19 <= (((wire17 ?
                  $unsigned($signed(wire15)) : (wire17 ?
                      wire7[(4'hc):(4'hb)] : $signed(wire6))) ^~ $signed($signed((wire4 || wire3)))) ?
              reg18 : $signed($unsigned((-(~^wire17)))));
          reg20 <= wire12[(1'h0):(1'h0)];
        end
      else
        begin
          reg19 <= wire14;
          if ((~|$signed(reg20[(3'h7):(1'h0)])))
            begin
              reg20 <= wire16;
            end
          else
            begin
              reg20 <= $unsigned($signed((wire11 >>> (8'ha2))));
              reg21 <= (!{(^(8'ha8))});
            end
          if ($signed(reg20[(2'h2):(2'h2)]))
            begin
              reg22 <= (-$unsigned((wire4[(4'he):(1'h1)] == $signed($unsigned(wire17)))));
              reg23 <= ((|reg22) >= $signed(reg19[(5'h10):(4'hd)]));
              reg24 <= ($unsigned(($unsigned($unsigned(reg20)) * reg22[(1'h0):(1'h0)])) ~^ reg18);
              reg25 <= wire8;
              reg26 <= {(&wire1), ((7'h40) != wire8[(2'h3):(2'h3)])};
            end
          else
            begin
              reg22 <= wire16;
            end
          reg27 <= (~^$signed((reg24[(4'hf):(4'ha)] ?
              ($unsigned((8'ha5)) || $signed(reg19)) : (wire2 & $unsigned(reg24)))));
          reg28 <= $unsigned(($signed(((wire16 ? wire16 : wire2) ?
                  wire3[(4'hc):(3'h5)] : $unsigned(wire10))) ?
              ({(reg25 <<< wire16)} >= $unsigned((wire2 ?
                  reg25 : reg19))) : reg19[(1'h0):(1'h0)]));
        end
      reg29 <= (~^(8'ha8));
    end
endmodule

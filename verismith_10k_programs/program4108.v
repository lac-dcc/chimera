module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire27,
                 wire17,
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
  assign wire5 = $signed(wire1[(2'h3):(2'h3)]);
  assign wire6 = ($signed(({(wire4 || wire2),
                     (wire5 ?
                         wire1 : wire2)} != wire0)) ^ $unsigned((^~$unsigned($unsigned(wire3)))));
  assign wire7 = (~^wire2);
  assign wire8 = wire6;
  assign wire9 = $signed(wire0[(3'h7):(2'h3)]);
  assign wire10 = wire4;
  assign wire11 = $unsigned((8'haf));
  assign wire12 = $unsigned($signed($unsigned($signed($unsigned(wire4)))));
  assign wire13 = ($signed(wire4) ~^ (wire12[(4'h9):(4'h8)] ?
                      $signed(wire10) : wire9[(2'h2):(2'h2)]));
  assign wire14 = $signed(wire7[(2'h2):(2'h2)]);
  assign wire15 = wire4[(2'h2):(1'h1)];
  assign wire16 = ($signed({wire0,
                          (wire0[(1'h1):(1'h0)] ? {wire7} : (~|(8'ha2)))}) ?
                      wire8[(3'h4):(1'h1)] : (~(($unsigned((8'hae)) & wire6) >>> $unsigned(wire14[(3'h4):(1'h0)]))));
  assign wire17 = ((~^wire6) ?
                      $unsigned($signed(wire15[(3'h4):(3'h4)])) : ($signed(wire2[(1'h1):(1'h0)]) ?
                          (7'h42) : ({$signed((8'hb6)), $signed(wire2)} ?
                              ($unsigned(wire12) + $signed(wire3)) : $unsigned(wire11[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire2[(3'h4):(1'h1)])) && (($unsigned($signed(wire13)) ?
              $unsigned({wire7, wire7}) : ($unsigned(wire5) ?
                  (wire1 ? (8'hac) : wire13) : $unsigned(wire2))) ?
          wire15[(3'h6):(3'h4)] : (wire16 ?
              $signed(wire0) : (~&$signed(wire16))))))
        begin
          if ((~^{({{wire10, (7'h42)}} | $unsigned($unsigned((8'hb8)))),
              (+$unsigned(wire15[(2'h3):(1'h1)]))}))
            begin
              reg18 <= (8'ha6);
            end
          else
            begin
              reg18 <= (!(+wire5));
            end
          if ($unsigned(wire13))
            begin
              reg19 <= ($signed($unsigned($signed(wire2))) ?
                  wire4 : (-$unsigned($unsigned((wire7 ? reg18 : wire9)))));
              reg20 <= (|$unsigned((+$signed(wire9[(4'hc):(1'h1)]))));
            end
          else
            begin
              reg19 <= (wire5[(1'h0):(1'h0)] ?
                  {$signed(({wire10, wire14} >>> {wire13, (8'h9f)})),
                      reg18[(3'h4):(2'h2)]} : wire2[(1'h0):(1'h0)]);
              reg20 <= (wire10[(1'h1):(1'h0)] ?
                  {wire10,
                      $unsigned({$unsigned(reg20),
                          (wire10 ? reg19 : wire6)})} : {(((-wire0) ?
                              $unsigned(wire10) : ((8'ha0) || wire8)) ?
                          wire5[(3'h4):(2'h3)] : (wire11[(5'h11):(1'h0)] ?
                              (~|wire16) : (wire16 ? wire4 : wire3))),
                      ($signed((~^wire12)) ?
                          (&(wire7 ? wire3 : wire3)) : (^~wire16))});
              reg21 <= wire11;
            end
          if (wire14[(3'h6):(3'h4)])
            begin
              reg22 <= wire17[(2'h2):(1'h1)];
            end
          else
            begin
              reg22 <= wire8;
            end
        end
      else
        begin
          reg18 <= wire8[(4'he):(3'h7)];
          if ({{wire8[(3'h6):(3'h4)]},
              $signed($unsigned((reg19[(2'h2):(2'h2)] ?
                  $unsigned(wire9) : ((8'hba) ? wire9 : wire15))))})
            begin
              reg19 <= $signed((((~{reg22}) ?
                  wire6 : (&$signed(reg20))) + (wire13 ?
                  $unsigned($signed(wire0)) : $signed($signed(wire7)))));
            end
          else
            begin
              reg19 <= $signed((^~((-{wire4, reg20}) ?
                  $signed($unsigned(wire17)) : (8'ha4))));
            end
          reg20 <= $signed(wire11[(4'hd):(4'hc)]);
          reg21 <= $unsigned({$signed((^$signed(wire5))),
              $signed((wire5[(3'h5):(2'h3)] >>> $unsigned(reg18)))});
        end
      reg23 <= (+wire6);
      reg24 <= $unsigned((^~($unsigned((~wire11)) + wire5)));
      reg25 <= ((~^$unsigned(($signed(wire2) ? wire6 : (|(8'hb6))))) ?
          $unsigned(wire8) : reg23);
      reg26 <= wire2;
    end
  assign wire27 = (|(~|wire2));
endmodule

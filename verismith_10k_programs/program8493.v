module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 (1'h0)};
  assign wire4 = wire1[(3'h6):(3'h5)];
  assign wire5 = (($unsigned((wire1[(3'h4):(2'h2)] ?
                     $unsigned((8'haa)) : wire2)) >= $unsigned({wire3,
                     ((7'h40) != wire4)})) >>> ({((wire3 ?
                         wire0 : wire4) ^ (wire2 ? wire3 : wire2)),
                     (&wire3)} >> (!$unsigned(wire0))));
  assign wire6 = {((8'haf) + $unsigned(wire0[(4'hd):(1'h0)]))};
  always
    @(posedge clk) begin
      reg7 <= (~^wire2[(3'h4):(2'h2)]);
    end
  assign wire8 = wire0[(2'h3):(2'h3)];
  assign wire9 = $unsigned((($unsigned((wire5 ?
                     wire1 : wire6)) >>> (reg7[(1'h0):(1'h0)] ?
                     {wire4} : {(8'had),
                         (8'h9e)})) >= $unsigned((reg7[(3'h7):(2'h3)] <<< (wire8 & wire5)))));
  always
    @(posedge clk) begin
      reg10 <= reg7;
      reg11 <= wire5[(1'h0):(1'h0)];
      if (((($signed(wire6[(4'ha):(3'h7)]) && (^(~&(8'ha8)))) ?
              (wire8 ^~ $unsigned(reg7[(1'h0):(1'h0)])) : $signed($unsigned($unsigned(wire8)))) ?
          (($signed((wire0 >> wire9)) ?
              (+wire1) : wire4) || wire8) : wire8[(1'h1):(1'h1)]))
        begin
          reg12 <= ((~&wire9[(1'h0):(1'h0)]) ^~ ($signed(((wire4 ?
                  wire5 : wire6) ?
              (8'haa) : wire9[(2'h2):(2'h2)])) << (reg11[(2'h3):(1'h1)] ?
              $signed(wire9) : wire1)));
          reg13 <= (&{{(~|wire4[(3'h7):(1'h0)]),
                  ($signed((8'hb5)) ?
                      $unsigned((8'hb9)) : (wire9 ? wire2 : wire3))},
              $signed((~&$signed(wire3)))});
        end
      else
        begin
          reg12 <= ((reg7 ? reg13[(1'h1):(1'h1)] : $signed(wire3)) ?
              (!wire5[(2'h3):(2'h2)]) : {{{{reg12, reg11},
                          (wire1 ? wire5 : reg11)}},
                  {$unsigned({wire4, reg12})}});
          reg13 <= $signed(({(wire5[(3'h7):(2'h3)] != $unsigned(wire6)),
                  ((wire4 ? (8'hb6) : reg11) ? wire4 : (wire0 > reg7))} ?
              $unsigned($signed(((8'h9f) ?
                  wire3 : wire3))) : $signed(((|reg10) ?
                  wire4[(1'h1):(1'h0)] : $unsigned((8'ha2))))));
          reg14 <= (~&$unsigned(wire2[(3'h5):(1'h0)]));
          reg15 <= ($unsigned((((~|(8'ha3)) - (8'hb0)) ?
              wire9[(1'h1):(1'h0)] : wire4[(4'hd):(2'h2)])) ~^ wire5[(4'ha):(3'h5)]);
          reg16 <= (((-((reg10 * wire8) ?
                  wire9[(1'h0):(1'h0)] : $signed((8'h9c)))) ?
              {reg7, wire9} : $signed(reg13[(2'h2):(2'h2)])) | (wire1 | wire2));
        end
    end
  assign wire17 = $unsigned({reg11, (^wire2)});
  assign wire18 = (~^((|$unsigned($unsigned(reg14))) ?
                      (wire8 ? (|$signed(wire17)) : wire0) : (({reg13, wire5} ?
                          $unsigned(reg13) : (wire1 ?
                              reg11 : wire4)) > (~^$unsigned(wire1)))));
endmodule

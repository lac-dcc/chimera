module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (wire3[(1'h0):(1'h0)] >>> $signed(({wire1,
                     {wire3}} >> $unsigned($unsigned(wire1)))));
  assign wire5 = {(|(~|$signed((~&(8'ha7))))), (^wire2)};
  always
    @(posedge clk) begin
      reg6 <= $unsigned(($unsigned(wire0[(3'h7):(1'h0)]) ?
          (wire5[(1'h0):(1'h0)] ?
              $unsigned((wire0 == wire1)) : (~|(^wire1))) : ((~^wire3) ?
              $signed((wire1 & wire5)) : (&(wire0 ? (8'hbd) : wire2)))));
      if ($signed(reg6[(1'h0):(1'h0)]))
        begin
          reg7 <= ($signed($unsigned(wire5)) ?
              {$signed(((wire4 ?
                      wire2 : wire0) | $unsigned(wire3)))} : $signed((|($signed(wire5) ?
                  (wire2 ? wire4 : wire3) : (~wire3)))));
          reg8 <= ((8'h9e) ?
              wire5 : {(wire3[(1'h0):(1'h0)] ? reg7 : $unsigned(reg6)),
                  $signed({(wire5 & (8'haa)), wire2})});
          reg9 <= wire3[(2'h2):(2'h2)];
          if ((wire3 ?
              reg9 : ($unsigned((reg8 ?
                  (~wire0) : {(8'ha7)})) >= (!wire0[(1'h0):(1'h0)]))))
            begin
              reg10 <= $unsigned($signed(((((8'hae) | wire2) > wire5) ?
                  $unsigned((reg9 && (8'ha4))) : $signed(((8'hb7) == wire5)))));
              reg11 <= (($signed(reg6) == (!wire1)) ?
                  $unsigned(($signed(reg6) && {(8'hb5),
                      (+reg8)})) : (($signed((reg8 ^ wire5)) ?
                          (~&(reg6 ? wire1 : reg9)) : wire5) ?
                      $unsigned($signed((^~wire4))) : (wire0 > ((wire4 ?
                              wire3 : (8'h9c)) ?
                          wire3[(2'h2):(1'h0)] : wire4[(3'h5):(1'h1)]))));
              reg12 <= $unsigned(reg9);
              reg13 <= (^$unsigned($unsigned(reg11)));
            end
          else
            begin
              reg10 <= ((~^((reg11[(4'hc):(4'hb)] == $signed(wire3)) ?
                      $unsigned((reg8 * wire3)) : ($unsigned((8'hba)) ?
                          (reg9 ? wire5 : wire2) : (~|reg7)))) ?
                  (~|reg7[(2'h3):(2'h2)]) : wire0[(2'h2):(1'h1)]);
              reg11 <= reg7[(1'h1):(1'h1)];
              reg12 <= $unsigned(reg8[(2'h3):(1'h0)]);
              reg13 <= (~|$unsigned($signed(($unsigned((8'hb4)) > reg12))));
              reg14 <= $signed((reg10 ?
                  (~^(|$unsigned(wire1))) : (|$signed(wire0))));
            end
        end
      else
        begin
          reg7 <= $unsigned(((^$unsigned({(8'hb4)})) ?
              ($unsigned({wire1}) <= wire2[(2'h3):(1'h1)]) : (!reg8)));
          reg8 <= (^~reg13);
        end
    end
  assign wire15 = (reg12[(1'h1):(1'h1)] ?
                      reg10[(2'h3):(2'h2)] : $unsigned($signed((reg12[(1'h0):(1'h0)] ?
                          ((8'ha3) == wire4) : (wire4 ? wire0 : wire0)))));
  assign wire16 = $unsigned($unsigned({$signed(((8'h9d) * wire5))}));
endmodule

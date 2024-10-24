module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (8'ha7);
  always
    @(posedge clk) begin
      if ($unsigned(((!wire3) ?
          $signed(($unsigned(wire0) << {wire5})) : (^$unsigned($unsigned(wire3))))))
        begin
          reg6 <= (({wire1, wire5} + $unsigned(($signed(wire0) ?
              $signed(wire5) : $signed((8'ha7))))) > $signed($signed(((~&wire0) ?
              ((8'hbc) + wire5) : wire1))));
          reg7 <= wire5;
          if (wire0[(4'hb):(1'h0)])
            begin
              reg8 <= $unsigned(((($signed((8'hb2)) ?
                      (reg6 ? (8'hb3) : (8'hb8)) : ((8'hbd) && wire4)) ?
                  (wire2 ? ((7'h41) == wire3) : $unsigned((7'h43))) : (~{wire1,
                      (8'hb8)})) >>> $signed(wire5[(4'hc):(4'hb)])));
            end
          else
            begin
              reg8 <= {(^~$unsigned({wire1})),
                  $unsigned($signed($signed((wire5 <<< wire2))))};
              reg9 <= reg8;
            end
          reg10 <= (!reg8);
          reg11 <= $signed((($unsigned((wire5 > wire0)) ?
                  wire1[(1'h0):(1'h0)] : $signed(reg9)) ?
              $signed($unsigned(((8'hbd) ^~ wire0))) : $unsigned(($signed(reg10) ?
                  $signed(reg9) : (wire2 > (8'ha7))))));
        end
      else
        begin
          if (wire1[(2'h2):(2'h2)])
            begin
              reg6 <= $unsigned($signed($unsigned(($unsigned(reg10) ?
                  $unsigned(wire2) : (reg6 ? reg8 : wire0)))));
              reg7 <= reg9;
              reg8 <= ((+(8'hb4)) ?
                  $signed(reg9[(2'h2):(1'h0)]) : $signed(reg8));
              reg9 <= wire1[(1'h1):(1'h0)];
            end
          else
            begin
              reg6 <= wire4[(3'h4):(2'h3)];
            end
          reg10 <= {$unsigned(wire5)};
          reg11 <= $signed((~$unsigned(reg10[(3'h5):(3'h4)])));
        end
      reg12 <= (!$unsigned($unsigned((^(reg6 | reg10)))));
      reg13 <= $unsigned(((((~|reg10) ?
          wire5[(3'h7):(1'h1)] : $signed(reg11)) * $unsigned(reg10)) >= ($unsigned(reg8) <= (~&wire4))));
    end
  assign wire14 = (~|$unsigned(((wire1 ^~ ((8'hac) - reg13)) || $unsigned(reg7))));
  assign wire15 = $unsigned({{reg7},
                      ($signed(reg11[(4'he):(4'hc)]) - ((7'h42) ?
                          (7'h43) : {reg7, reg10}))});
  assign wire16 = (wire3[(1'h1):(1'h0)] ?
                      $signed((wire4[(1'h1):(1'h0)] || wire3[(4'hc):(4'h8)])) : $unsigned({{(&wire1)}}));
  assign wire17 = (~^reg12);
  assign wire18 = ({(reg12[(3'h4):(1'h1)] ?
                              $unsigned((wire2 > reg10)) : ((^~reg6) & reg10))} ?
                      reg11[(4'hb):(3'h5)] : reg12);
  assign wire19 = (^($signed((((8'hbc) ? reg6 : wire4) <<< reg6)) ?
                      wire3[(4'h8):(2'h2)] : $signed((8'hb7))));
endmodule

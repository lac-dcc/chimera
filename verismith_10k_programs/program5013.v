module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire2 != ({wire2[(2'h3):(2'h2)],
              $unsigned(((8'ha1) ? wire1 : wire0))} ?
          ($unsigned(wire2[(5'h10):(3'h7)]) ?
              (^((7'h40) ? (8'hbc) : wire1)) : ((~|wire3) ?
                  (wire2 << wire0) : (~|wire3))) : {(wire3[(4'ha):(2'h3)] - wire3[(1'h0):(1'h0)])}));
      reg5 <= wire2;
      if ((wire1[(4'hd):(4'hc)] && {$unsigned(wire3[(4'hd):(1'h0)]),
          $unsigned($unsigned(wire0))}))
        begin
          reg6 <= (wire0[(3'h4):(3'h4)] != $unsigned($signed(($signed(wire3) == $unsigned(wire2)))));
          reg7 <= {(wire3 >= ((wire1 ?
                  {reg4, reg5} : $signed(wire2)) <= (~^(wire2 ?
                  reg5 : reg6))))};
          reg8 <= reg6[(3'h4):(3'h4)];
        end
      else
        begin
          reg6 <= wire1;
          if ($signed((8'h9e)))
            begin
              reg7 <= (8'ha1);
              reg8 <= ($signed(($unsigned(reg5[(3'h7):(3'h7)]) ?
                  ((~|(8'ha7)) ?
                      (wire3 - reg8) : (wire3 <= (8'hb8))) : $signed($signed(reg8)))) <= wire0);
              reg9 <= {$unsigned($unsigned($unsigned((reg8 ? reg7 : wire1))))};
              reg10 <= (~^((~^wire1[(4'h8):(1'h0)]) ^~ $signed(wire0[(4'h9):(3'h4)])));
            end
          else
            begin
              reg7 <= {{$unsigned((~|$signed(wire1))),
                      ((|reg4[(4'h8):(1'h1)]) ? (-$signed(reg5)) : wire1)}};
              reg8 <= (reg4[(4'h8):(2'h2)] > {($unsigned(wire3[(4'hd):(4'h9)]) ?
                      (~reg10) : $unsigned(((7'h43) ? reg6 : wire1)))});
            end
          reg11 <= $unsigned((~|(^$signed((reg9 | wire0)))));
          reg12 <= {($signed((-((8'hbb) ^ wire0))) ?
                  ({wire0, $unsigned(wire2)} ?
                      reg10[(3'h5):(3'h5)] : (reg10[(3'h5):(1'h1)] ?
                          (wire0 ?
                              reg7 : (8'h9f)) : (+reg4))) : $signed($signed($unsigned(wire1)))),
              {(!$unsigned((wire2 == wire3)))}};
          reg13 <= $signed({wire0});
        end
    end
  assign wire14 = ({$unsigned($unsigned(wire1[(4'hc):(1'h1)])),
                          ((reg4 ? $signed(wire3) : $signed(wire3)) ?
                              $signed((wire1 ?
                                  reg12 : reg4)) : (reg11[(4'hb):(4'ha)] ?
                                  (reg8 + wire2) : (reg11 ? reg9 : reg10)))} ?
                      ((8'h9e) ?
                          (~|wire2) : (reg10[(3'h4):(1'h0)] < (7'h44))) : $signed(reg9[(5'h10):(1'h0)]));
  assign wire15 = ($unsigned($unsigned(({reg10,
                      reg5} >= (~^(8'ha6))))) > (8'ha5));
  assign wire16 = $unsigned($signed((&(reg13[(4'h9):(1'h1)] ?
                      $signed(reg11) : $unsigned(reg7)))));
  assign wire17 = $unsigned($unsigned(reg4[(4'h8):(1'h0)]));
  assign wire18 = $signed((-(reg7 >>> $unsigned(reg4[(2'h3):(1'h0)]))));
  assign wire19 = (reg8 ? $signed(reg8) : reg5);
  assign wire20 = {($unsigned(wire2[(4'h9):(2'h3)]) >>> (reg6[(4'ha):(1'h1)] || $signed({wire1}))),
                      $signed(wire15)};
  assign wire21 = $unsigned((wire2[(3'h5):(3'h5)] & reg10[(3'h5):(3'h4)]));
  assign wire22 = $unsigned($unsigned({(reg5[(1'h1):(1'h0)] ^~ reg6),
                      ((^~wire20) ^~ wire16)}));
  assign wire23 = $unsigned(reg8[(5'h12):(1'h1)]);
endmodule

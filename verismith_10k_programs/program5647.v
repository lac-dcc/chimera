module top
#(parameter param20 = (((((^~(7'h44)) ? ((8'hab) - (7'h43)) : ((7'h43) ? (8'hb0) : (8'ha9))) * ({(8'hb6)} * (|(8'hb9)))) << (+{{(8'h9d)}, (+(8'haf))})) ^~ (((((8'hb6) ? (8'hbc) : (7'h44)) ? (&(8'h9d)) : ((8'hab) + (7'h44))) ? (((8'hbb) == (8'ha9)) != ((8'ha7) - (7'h43))) : (((8'hbb) ? (8'hbb) : (8'hb5)) * ((8'hac) * (7'h42)))) >= ((~|((7'h43) || (8'hab))) ? {((8'hb4) != (8'ha3))} : (-((8'ha6) ? (8'hb4) : (8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
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
      reg4 <= (^~wire2[(1'h1):(1'h0)]);
      reg5 <= (7'h42);
      if ($unsigned($signed(({(wire0 ?
              reg4 : (7'h44))} | wire2[(3'h4):(1'h0)]))))
        begin
          reg6 <= ((($signed($unsigned((8'ha2))) << wire0) != $unsigned((!(wire0 << reg5)))) ?
              $unsigned($signed((&{wire2, reg5}))) : ({$unsigned((^reg4))} ?
                  $signed(((!wire1) ?
                      wire3 : (wire3 > reg5))) : $signed(wire2)));
          reg7 <= $signed(({$unsigned((~wire1))} ?
              $signed((&$signed(reg5))) : {$unsigned(wire1)}));
        end
      else
        begin
          reg6 <= (-(reg7[(2'h2):(2'h2)] ?
              wire2 : (wire1 ? $signed((~|(7'h40))) : wire1[(1'h1):(1'h0)])));
          if ($unsigned((8'ha2)))
            begin
              reg7 <= $signed({$signed(($unsigned(wire2) & (wire1 ?
                      wire1 : wire2)))});
            end
          else
            begin
              reg7 <= (-(~&(~^{$signed(reg5)})));
              reg8 <= $signed((($unsigned($unsigned(reg4)) != wire3[(3'h4):(1'h0)]) ?
                  (~(~|(-reg5))) : wire3));
              reg9 <= (+$unsigned((((reg5 ? reg5 : reg5) ?
                  (~|wire1) : (8'haf)) <= wire2)));
            end
          if (wire3[(5'h13):(4'h8)])
            begin
              reg10 <= $signed((reg5 || ({$unsigned(reg9)} ~^ $unsigned($signed(reg8)))));
            end
          else
            begin
              reg10 <= {($signed(reg5[(3'h5):(3'h4)]) ?
                      ($signed($signed(reg9)) == (wire3[(5'h12):(4'hc)] ?
                          $signed(reg8) : ((8'h9d) ?
                              reg9 : reg7))) : $signed($unsigned((reg10 * (8'hb6))))),
                  (-((8'hbf) + (!$signed(reg8))))};
              reg11 <= (^wire2[(3'h6):(3'h4)]);
              reg12 <= $unsigned(reg4[(1'h1):(1'h1)]);
              reg13 <= $unsigned($signed(reg10));
            end
        end
    end
  assign wire14 = (~|(reg9 ?
                      (((reg11 & reg5) ?
                          ((8'hb9) ? reg10 : reg13) : (reg11 ?
                              reg7 : reg9)) > $signed(reg10)) : ($unsigned(reg5[(4'h8):(2'h2)]) || {(~&(8'hbc)),
                          {wire0, (8'ha1)}})));
  assign wire15 = (~$signed(reg6[(1'h0):(1'h0)]));
  assign wire16 = ((($signed($signed(reg5)) == (^~{wire1})) <= ((|reg11) ?
                          $signed((-wire14)) : reg5)) ?
                      ({(((7'h42) ~^ reg10) ^ ((8'hb6) | reg6))} ?
                          $unsigned(((reg4 ? wire14 : wire0) ?
                              reg7 : (!reg10))) : ($signed(reg8) - ((8'hb5) ^~ $unsigned(reg11)))) : ((~^$unsigned({wire3})) <<< $signed((reg6 == (wire3 ^~ wire2)))));
  assign wire17 = wire15;
  assign wire18 = $signed(wire2[(3'h5):(3'h4)]);
  assign wire19 = $signed((reg11[(2'h3):(1'h1)] ?
                      (!((reg11 ^ reg6) ?
                          reg9[(2'h3):(2'h2)] : (reg6 ?
                              reg4 : wire0))) : $unsigned((~^reg13[(3'h6):(3'h4)]))));
endmodule

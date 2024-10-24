module top
#(parameter param25 = ((((((8'ha8) ? (7'h43) : (8'ha7)) <= (8'hbe)) ^ ({(8'hb9)} ? ((8'ha4) | (8'hab)) : ((8'hae) ^~ (8'h9d)))) ^ (^~(+((8'ha9) ? (8'hbb) : (7'h42))))) ? (8'hac) : (((|(-(8'ha0))) != {{(8'hab)}}) ^~ (8'hbb))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 wire4,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0[(1'h1):(1'h1)];
  assign wire5 = $signed((~&$unsigned($signed(wire3))));
  always
    @(posedge clk) begin
      reg6 <= {{(wire2[(1'h1):(1'h1)] ? {$signed(wire2), wire1} : wire0),
              {(~&$unsigned(wire1))}},
          $signed($signed(wire2))};
      reg7 <= wire3[(2'h2):(2'h2)];
      reg8 <= $signed((wire3[(2'h2):(2'h2)] | {wire3,
          {$signed((8'ha3)), $unsigned(wire0)}}));
      reg9 <= ((!((!(^reg6)) ?
          {wire5[(4'hd):(4'hc)]} : ($unsigned(reg6) ~^ (reg8 ?
              reg6 : reg8)))) == $signed($unsigned($unsigned((~^wire2)))));
    end
  assign wire10 = ((+$unsigned((7'h44))) <= (wire5 | wire5[(4'ha):(4'h9)]));
  assign wire11 = $unsigned(({((^~wire0) ?
                              reg6[(3'h6):(2'h2)] : wire0[(1'h1):(1'h1)]),
                          ((wire2 + wire5) ? (wire0 * (8'h9f)) : {reg8})} ?
                      ((+$signed(reg8)) << $signed(wire2[(2'h3):(2'h2)])) : $signed($signed(wire5))));
  assign wire12 = {$unsigned($unsigned(({wire2, wire3} < $signed(reg8)))),
                      ((($signed(reg6) ?
                          (wire11 ?
                              wire0 : wire10) : $signed((8'hb4))) - $unsigned($unsigned(wire10))) && (($unsigned(wire2) ?
                          (8'ha7) : (wire2 ? wire4 : wire11)) || (!reg7)))};
  assign wire13 = $unsigned((-reg9));
  assign wire14 = (~{(^~((reg8 ? reg9 : reg6) ? {wire3} : (-wire11))), wire13});
  assign wire15 = $unsigned((wire2 ? wire1[(3'h4):(2'h2)] : (~(~^(8'haa)))));
  assign wire16 = $signed((8'ha1));
  always
    @(posedge clk) begin
      reg17 <= $unsigned({$unsigned(wire11[(2'h3):(1'h1)]), (8'h9e)});
      if ((reg17 ? reg7 : reg8[(1'h0):(1'h0)]))
        begin
          reg18 <= $signed(wire1);
          reg19 <= $unsigned(($unsigned(((~&wire1) ?
              (~reg8) : $unsigned(reg9))) & {wire15, (-wire3[(3'h4):(1'h1)])}));
          reg20 <= (^reg7[(2'h2):(1'h0)]);
          if ($signed($signed(($signed(reg8) ?
              {(reg9 ? reg6 : reg18)} : reg6))))
            begin
              reg21 <= $unsigned($unsigned(reg20));
            end
          else
            begin
              reg21 <= ((reg19 ^~ (wire2[(2'h3):(1'h1)] ?
                      $unsigned((&wire12)) : (wire11[(5'h13):(5'h11)] && reg6[(3'h4):(1'h1)]))) ?
                  $unsigned(wire2[(3'h5):(3'h4)]) : $signed($signed($unsigned(((8'ha9) ?
                      reg6 : reg9)))));
              reg22 <= $signed($signed(reg8[(2'h2):(1'h1)]));
              reg23 <= ((wire16[(5'h10):(5'h10)] + (reg9 ?
                      ($signed((8'h9e)) ?
                          reg9[(1'h0):(1'h0)] : $signed(wire0)) : wire11[(4'h8):(4'h8)])) ?
                  ($unsigned((-(wire12 ? wire1 : wire14))) ?
                      (($unsigned(wire5) ?
                              $unsigned(reg8) : $unsigned((8'haf))) ?
                          ((wire2 ^~ reg22) >>> $signed(wire16)) : $signed((wire15 ?
                              reg6 : wire10))) : reg18[(4'h9):(2'h3)]) : (^((~|((8'hb3) ?
                      (8'hb4) : wire2)) >= ({wire10, wire3} ?
                      wire16 : reg9[(4'hd):(4'hd)]))));
            end
          reg24 <= wire15;
        end
      else
        begin
          reg18 <= (^~(wire16[(4'ha):(2'h2)] ?
              $unsigned(($signed(wire15) ?
                  $unsigned((8'hb8)) : (reg7 < reg19))) : $unsigned((^(!reg18)))));
          reg19 <= ((!((wire4[(4'hb):(4'hb)] < wire12) ?
              (-$unsigned(reg7)) : {(!(8'ha9)),
                  $signed(reg23)})) * (($unsigned($unsigned(reg8)) ?
                  reg18[(3'h7):(3'h6)] : ($signed(wire15) ?
                      ((8'ha5) ? wire12 : reg23) : $unsigned(wire1))) ?
              (8'ha8) : wire16));
          reg20 <= $unsigned(reg24);
        end
    end
endmodule

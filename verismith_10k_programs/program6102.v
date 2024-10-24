module top
#(parameter param19 = ({(8'hbe)} ? {((~^((7'h43) ? (8'hb2) : (8'ha2))) ? (~&(~|(7'h41))) : ((!(8'hb1)) == (8'h9d))), (8'h9f)} : ((({(7'h42)} ? {(8'hb8), (8'hb3)} : ((8'hb9) || (8'ha4))) ? ((~(8'hbe)) ^ ((8'h9d) <<< (8'hb9))) : (((8'ha1) * (8'hbc)) ? {(8'hb3), (8'hb0)} : ((8'hb3) ? (8'hbe) : (8'hb4)))) ? (((~&(8'hbb)) >> (8'ha6)) & (~^((8'hbf) >= (8'hbc)))) : ((((8'hb2) ? (8'hb5) : (7'h41)) ? (+(8'hbf)) : ((8'hb3) - (8'ha1))) > (~|((8'hbc) ^ (8'ha2)))))), 
parameter param20 = param19)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (+$unsigned(((wire2[(4'hf):(2'h3)] - (wire0 ?
                     (8'hbc) : wire2)) >= wire3[(1'h1):(1'h1)])));
  assign wire5 = $signed((wire3 ?
                     wire4[(3'h6):(3'h6)] : $unsigned({wire3, (|wire4)})));
  always
    @(posedge clk) begin
      if ((8'hb4))
        begin
          if ($signed($unsigned({((~^wire1) ?
                  wire3[(3'h7):(1'h0)] : {wire0, wire2})})))
            begin
              reg6 <= $unsigned({wire5});
              reg7 <= ($unsigned(((~^$signed((8'h9e))) ?
                  wire5 : (~&{reg6, wire5}))) <= reg6);
              reg8 <= $signed({wire4, wire0[(4'hb):(3'h5)]});
              reg9 <= (8'h9d);
            end
          else
            begin
              reg6 <= {wire4, {$unsigned($signed((wire5 ? (7'h43) : wire1)))}};
              reg7 <= (({$unsigned((|wire1))} ?
                      (wire4 ^~ $signed($signed((8'h9e)))) : (^($signed(reg6) ^~ (^reg9)))) ?
                  $signed(wire5) : (reg7 != wire3));
              reg8 <= reg6;
            end
          reg10 <= $signed(wire1[(3'h5):(3'h5)]);
        end
      else
        begin
          reg6 <= $unsigned($unsigned(($signed((+wire5)) && reg8)));
          if ((reg9[(1'h1):(1'h1)] ?
              (8'hae) : $unsigned($unsigned(wire4[(3'h6):(1'h1)]))))
            begin
              reg7 <= $unsigned({((8'hba) || ($signed(wire1) ?
                      (~^reg6) : (8'ha6))),
                  (wire5[(4'hc):(3'h5)] - $signed({wire2, reg7}))});
              reg8 <= ($unsigned(wire3) ?
                  (reg9[(2'h2):(1'h0)] ?
                      (^wire1[(1'h1):(1'h0)]) : (~{(wire0 ?
                              reg10 : wire2)})) : (-{$signed(wire2)}));
              reg9 <= ($signed({$unsigned((wire5 != wire3)),
                      wire5[(2'h2):(1'h1)]}) ?
                  ($unsigned({(wire3 > (8'ha6))}) ?
                      ((8'hb7) ?
                          {$signed(wire2),
                              (8'hb0)} : wire4) : ($unsigned($signed(wire2)) << $unsigned($unsigned(wire2)))) : ($signed($signed((!wire1))) & (reg6 > (~&(wire1 ?
                      reg7 : wire3)))));
            end
          else
            begin
              reg7 <= {$unsigned((reg9 ?
                      $signed((8'ha0)) : ($signed(wire0) ?
                          $signed(reg6) : $unsigned(wire3)))),
                  reg10};
            end
          reg10 <= (^~(wire2[(1'h0):(1'h0)] ?
              (({reg9,
                  reg10} != $unsigned((8'ha4))) | $unsigned((|reg10))) : $unsigned($signed((|reg6)))));
        end
      reg11 <= reg9;
      reg12 <= reg9[(1'h1):(1'h1)];
    end
  assign wire13 = (~|$unsigned((&(wire2[(3'h4):(3'h4)] ?
                      {wire0} : $signed(wire3)))));
  assign wire14 = $signed((~(($signed(reg7) << (-reg8)) <<< ((wire5 < reg10) ?
                      wire5 : (wire13 ? wire0 : (8'ha1))))));
  assign wire15 = (((reg12[(4'hb):(3'h6)] >= $signed($signed(wire0))) || $unsigned((8'hb9))) > $unsigned((&$signed($unsigned(wire4)))));
  assign wire16 = (~&$signed(($signed({wire5, reg9}) ?
                      {(~|wire13), $signed(reg6)} : ((wire3 ? wire15 : reg6) ?
                          wire0 : reg10[(3'h7):(3'h5)]))));
  assign wire17 = reg8;
  assign wire18 = $signed(reg7);
endmodule

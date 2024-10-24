module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
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
  assign wire4 = ($unsigned($signed(((|wire1) ?
                         ((8'hb1) ? wire2 : wire0) : (-wire2)))) ?
                     wire3[(3'h4):(2'h3)] : wire3[(3'h6):(3'h6)]);
  assign wire5 = {(8'hb0), (8'haf)};
  always
    @(posedge clk) begin
      reg6 <= wire4[(2'h3):(1'h1)];
      reg7 <= $unsigned(reg6);
      reg8 <= wire5[(2'h3):(2'h3)];
      reg9 <= reg6;
    end
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg10 <= ($unsigned((8'hb6)) ?
              (~(wire4 ?
                  reg9 : ((&wire3) ?
                      (wire3 ? reg8 : reg7) : (reg7 ?
                          reg7 : (8'ha0))))) : $signed(wire5));
          reg11 <= (($signed($signed((wire3 ^~ wire5))) <= ($unsigned(wire3) ?
              {(reg8 >>> reg8)} : (|{wire1}))) & $unsigned({reg10}));
          reg12 <= ($unsigned({((+wire1) ?
                      reg11[(4'hf):(3'h5)] : $unsigned(reg9)),
                  {(~^wire5), {wire1}}}) ?
              (8'ha6) : {(~wire3)});
          reg13 <= (^{((8'hbd) ?
                  $signed((reg9 == (8'hb6))) : ($unsigned(wire2) == $unsigned(reg9))),
              wire0[(3'h6):(1'h0)]});
        end
      else
        begin
          if ($unsigned((~&$signed((|(~wire2))))))
            begin
              reg10 <= $unsigned(((~&reg8) != (7'h43)));
              reg11 <= $signed(({wire2, $signed($signed(reg7))} ?
                  {$unsigned((reg10 >= reg7)),
                      (~(reg8 ? reg10 : wire5))} : (($unsigned(wire3) ?
                      (+reg12) : $signed((7'h40))) * $unsigned(reg6))));
            end
          else
            begin
              reg10 <= (~{wire2});
              reg11 <= reg10[(4'h8):(4'h8)];
              reg12 <= ($unsigned({reg9[(4'h8):(1'h0)]}) ?
                  (^~(^wire1[(4'h8):(3'h4)])) : (|$unsigned($signed($signed(reg9)))));
              reg13 <= (($unsigned((7'h44)) ?
                      $unsigned($signed(wire4[(2'h3):(1'h0)])) : reg11) ?
                  (wire5[(3'h5):(3'h5)] ?
                      reg8 : $unsigned($signed((~&reg12)))) : reg9[(4'ha):(2'h2)]);
            end
          reg14 <= (($signed((&(wire3 ?
              reg8 : wire5))) - (reg10 & reg12[(2'h3):(2'h2)])) & $unsigned({reg6,
              reg11}));
          reg15 <= {reg11[(3'h4):(2'h3)]};
          if ($signed(wire0[(4'hc):(2'h2)]))
            begin
              reg16 <= (wire0 <= $unsigned((~&$unsigned($unsigned(reg15)))));
              reg17 <= (~$signed(($unsigned($signed(wire0)) || (wire4[(2'h3):(2'h3)] || {reg13,
                  reg10}))));
              reg18 <= reg17[(4'hf):(2'h3)];
              reg19 <= {reg9,
                  ((($unsigned(wire3) ?
                      $signed(wire2) : {wire5,
                          reg14}) == wire1[(2'h3):(1'h0)]) >>> (reg18 ?
                      ($unsigned(reg8) & (wire3 ? (8'hb1) : wire5)) : ({(8'hb0),
                              reg13} ?
                          {reg12} : reg11)))};
            end
          else
            begin
              reg16 <= {$signed(wire0),
                  ({$signed(wire5[(2'h3):(1'h1)])} * wire0[(5'h11):(3'h6)])};
              reg17 <= (reg14[(1'h1):(1'h0)] ? wire5 : wire4[(3'h4):(3'h4)]);
              reg18 <= $unsigned($unsigned(({(8'ha3)} << (|$unsigned(reg7)))));
              reg19 <= (~|((((wire1 && reg12) ? (-reg16) : (|(8'hbe))) ?
                      (8'ha5) : (8'hbe)) ?
                  ($signed(reg7) == $unsigned((wire3 >= reg19))) : reg11[(5'h15):(5'h13)]));
            end
        end
      reg20 <= $signed($signed(reg18[(3'h6):(3'h6)]));
      reg21 <= $unsigned(($unsigned(((-(8'ha4)) ? (+reg11) : {reg11, reg18})) ?
          ((wire2 ?
              wire5[(4'h9):(3'h5)] : reg6[(4'hc):(2'h2)]) - ((reg17 != wire3) ?
              $unsigned(wire5) : (|reg6))) : wire0[(2'h2):(1'h0)]));
    end
  assign wire22 = ($unsigned((~&(~^$unsigned(reg6)))) ?
                      ((^reg18) ?
                          (~&$unsigned(reg6[(3'h5):(3'h5)])) : reg16) : wire2);
endmodule

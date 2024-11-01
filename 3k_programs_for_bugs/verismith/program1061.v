module top
#(parameter param26 = ((&(({(8'hb9)} > ((8'hae) - (7'h42))) <<< ((^(8'ha4)) ? (^~(8'haa)) : ((8'hb8) && (8'ha1))))) >= {{(((8'ha0) ^~ (8'hab)) ? ((8'ha8) ? (8'h9e) : (8'haf)) : (^(7'h42))), (((8'ha8) - (8'haf)) ? ((8'hb2) ? (8'hba) : (8'ha8)) : ((8'ha5) << (8'ha0)))}, {{((8'hb7) ? (8'hbd) : (8'hbd)), (-(8'hba))}, ({(8'hbe)} ? (~(8'haa)) : ((8'h9e) >> (8'h9c)))}}), 
parameter param27 = {((+(8'ha0)) ? {param26, param26} : ((param26 ? (param26 ? param26 : param26) : param26) < ((param26 ^~ param26) > (param26 < (8'h9e))))), (&(param26 && ({param26} << {(8'ha3), param26})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire5,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
  assign wire5 = (wire1[(1'h1):(1'h1)] == wire3[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg6 <= {wire4};
      if (wire1)
        begin
          reg7 <= {$signed($unsigned({{wire3, wire0},
                  ((8'ha9) ? (8'hbe) : (8'ha0))}))};
          reg8 <= (wire4[(3'h4):(1'h0)] != {{wire3[(4'h9):(3'h6)]}});
          reg9 <= ((wire2[(2'h2):(2'h2)] ?
                  $signed(((|wire1) ?
                      $unsigned(wire5) : reg6[(3'h5):(3'h5)])) : ($unsigned((wire2 * wire5)) ?
                      (&$unsigned(wire5)) : {{wire1, (8'hb9)}})) ?
              ({((wire0 & reg7) || (reg6 ^~ wire2))} >= reg7) : ((~|$unsigned(wire3)) ?
                  wire5[(1'h0):(1'h0)] : $signed($unsigned($signed(reg7)))));
          reg10 <= (wire0[(3'h5):(1'h0)] ?
              ((|$unsigned({wire2})) >= ((wire1 ?
                      $signed((8'hba)) : (wire2 ? reg7 : wire0)) ?
                  (|wire1[(1'h0):(1'h0)]) : reg7)) : reg7);
          if (((reg7 ?
              ($unsigned($unsigned((8'hb3))) <<< (&$signed(wire1))) : (|(|(8'hbc)))) != $unsigned((~&$signed(wire0)))))
            begin
              reg11 <= wire3[(4'h9):(3'h7)];
              reg12 <= wire3[(3'h6):(3'h5)];
              reg13 <= (+$signed((8'hb8)));
              reg14 <= wire0[(2'h3):(1'h0)];
            end
          else
            begin
              reg11 <= (~((wire0 ?
                  $unsigned(reg14) : (^~wire5[(1'h1):(1'h0)])) == $unsigned((reg10 * $unsigned(reg14)))));
            end
        end
      else
        begin
          reg7 <= $unsigned($unsigned(($signed((reg9 ?
              reg13 : wire0)) | reg6[(3'h5):(3'h4)])));
          reg8 <= $unsigned($signed(((~|{wire2,
              reg9}) || $signed($signed(wire2)))));
          reg9 <= $signed(reg8[(4'ha):(1'h0)]);
          reg10 <= ($unsigned(reg8) ?
              ((($unsigned(reg9) ?
                      (reg10 ?
                          reg8 : reg8) : $unsigned((8'h9d))) > ((+(7'h41)) ?
                      (!wire2) : reg13[(1'h0):(1'h0)])) ?
                  {(~^reg6[(1'h0):(1'h0)]),
                      wire0[(3'h7):(1'h0)]} : (8'h9d)) : $unsigned($signed($unsigned(((8'hba) ?
                  wire3 : reg9)))));
        end
    end
  assign wire15 = (^~(^~(-$signed((wire1 & wire2)))));
  assign wire16 = (((-($unsigned(wire15) >= $signed(reg9))) != ($unsigned(reg9[(4'ha):(1'h0)]) ?
                      reg13 : {(&reg6)})) >> (((&(8'hba)) ^ ($unsigned(reg14) ?
                          (reg12 ? wire15 : (7'h44)) : (reg9 ? reg8 : wire0))) ?
                      reg9 : reg7));
  assign wire17 = $signed((-($unsigned((wire15 ^ (8'ha2))) ?
                      $signed((reg11 > reg8)) : (reg8[(5'h10):(4'h9)] ^~ (wire16 ?
                          reg7 : wire4)))));
  assign wire18 = ($unsigned((~&reg7[(1'h1):(1'h1)])) & ($signed((+$signed(reg12))) == wire17[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg19 <= (~wire16);
      reg20 <= (^$signed({reg14[(1'h0):(1'h0)], reg10}));
      reg21 <= {reg13, reg11[(1'h0):(1'h0)]};
      reg22 <= reg20[(5'h11):(4'ha)];
      reg23 <= reg10[(1'h1):(1'h1)];
    end
  assign wire24 = ($signed((~|(8'hbf))) ?
                      ({(8'hac),
                          $signed(wire16)} * reg9) : ((^~((^~reg19) * reg6[(2'h3):(1'h0)])) ?
                          (8'hbc) : $unsigned((&(^reg23)))));
  assign wire25 = ((-{$signed(reg10[(2'h2):(2'h2)])}) ?
                      $signed((reg21 ?
                          (-wire15[(2'h2):(2'h2)]) : (~&$signed(reg12)))) : $unsigned(((~&reg10[(1'h1):(1'h1)]) ^~ $signed(reg12))));
endmodule

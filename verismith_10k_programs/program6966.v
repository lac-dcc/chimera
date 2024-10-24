module top
#(parameter param21 = ((~|((|(~^(7'h44))) != {(~|(8'h9d))})) & ({(((8'hb7) ? (8'ha5) : (8'hb5)) ~^ (^~(8'ha3)))} * (((^~(8'hab)) && ((7'h42) ? (8'hb8) : (8'hbf))) <<< ({(8'hb9)} & ((8'ha3) == (8'hab)))))), 
parameter param22 = ((+(^~param21)) <<< {((^(-param21)) ? param21 : ((&param21) & (param21 * param21)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire5,
                 wire4,
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
  assign wire4 = (wire1[(2'h2):(2'h2)] ? $signed(wire2) : wire0[(4'h8):(2'h2)]);
  assign wire5 = wire3[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ((($signed($unsigned($unsigned(wire3))) ^~ wire5) ?
          ((-{$unsigned(wire2)}) ?
              ({(+(8'hbb))} ?
                  wire1[(3'h4):(2'h3)] : wire5) : $unsigned($signed((wire1 ?
                  wire4 : wire2)))) : ((~&{(~^wire5)}) <= $unsigned((~wire1)))))
        begin
          if (wire4)
            begin
              reg6 <= (~(~^wire3[(1'h0):(1'h0)]));
              reg7 <= (&wire2[(2'h3):(1'h1)]);
              reg8 <= wire4[(4'hc):(2'h2)];
              reg9 <= $signed(((wire0 && $unsigned((wire1 ?
                  reg8 : wire2))) > $signed(wire2)));
              reg10 <= wire1[(4'hd):(2'h3)];
            end
          else
            begin
              reg6 <= {wire2[(2'h3):(1'h1)], $signed(wire1)};
              reg7 <= ($unsigned((({wire2, reg8} ? $unsigned(wire4) : (!reg9)) ?
                  wire0 : (reg6 * (reg6 ? reg6 : reg6)))) & ((((reg10 ?
                      reg7 : reg10) < {wire3, reg6}) ?
                  ((reg8 ? reg6 : reg10) ?
                      {reg9} : wire0) : (reg7[(4'hc):(1'h0)] ?
                      (~^wire2) : $unsigned(reg8))) | (8'ha2)));
            end
          reg11 <= {$signed(reg8)};
          reg12 <= reg7[(3'h5):(1'h0)];
          reg13 <= reg11;
          if ({$unsigned(reg13)})
            begin
              reg14 <= {(($signed((wire1 == wire4)) ?
                          ((reg10 ~^ wire3) >> (-(7'h43))) : reg11[(4'h9):(1'h0)]) ?
                      $signed($unsigned($unsigned(reg6))) : $unsigned($signed($signed(reg9)))),
                  $unsigned(reg6)};
            end
          else
            begin
              reg14 <= ($unsigned(($signed({wire0, reg7}) ?
                  (8'h9f) : {(reg6 && reg11),
                      $signed(wire2)})) ^ {$signed({$signed(reg11),
                      {reg9, (8'hb5)}}),
                  (-reg9)});
              reg15 <= wire5;
              reg16 <= reg6[(1'h0):(1'h0)];
              reg17 <= (~|($signed((!(~^wire1))) && $signed($signed(reg6[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          reg6 <= $unsigned($signed(($unsigned(reg17) & reg14[(3'h4):(3'h4)])));
        end
    end
  assign wire18 = ((^~(((^~reg13) >= (8'ha4)) > ((^reg14) <<< reg8))) ^~ {(-$signed(reg7[(5'h10):(4'hc)]))});
  assign wire19 = reg15;
  assign wire20 = (({wire2,
                              ((~&reg12) ?
                                  ((8'h9e) ? (8'haa) : wire3) : (8'ha6))} ?
                          (|wire1[(2'h3):(2'h2)]) : $signed((~$signed(wire0)))) ?
                      $signed($unsigned((!(+(8'ha9))))) : (8'hb2));
endmodule

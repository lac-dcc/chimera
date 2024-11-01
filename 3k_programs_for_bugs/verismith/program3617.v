module top
#(parameter param20 = ((({(~|(8'haf)), (&(8'haa))} ^ (((8'hbe) ? (8'hbc) : (7'h44)) ? ((8'hb1) | (8'hbb)) : {(8'h9e), (8'ha7)})) ? ((|(8'ha9)) + ((^(8'ha0)) ? (+(8'ha1)) : ((8'ha9) ? (8'hbc) : (8'hb7)))) : {((+(8'ha9)) ? ((8'ha5) ? (8'h9f) : (8'ha9)) : ((8'hb3) ? (8'ha6) : (8'ha6))), ((^~(8'h9e)) ? {(8'ha5), (8'h9c)} : ((8'ha4) ? (7'h40) : (8'ha0)))}) && ((((|(7'h44)) && ((8'ha8) * (7'h43))) < (((8'hab) ? (8'ha5) : (8'h9e)) ^ ((7'h43) | (8'h9d)))) ? {(~&((8'hb0) * (8'h9d))), ({(7'h42), (8'ha6)} ? (^(8'ha9)) : (+(8'ha8)))} : (^((|(7'h40)) ? ((8'h9f) <<< (8'ha5)) : ((8'hb1) ? (8'h9d) : (8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (8'hb5);
      if ($signed(wire4))
        begin
          reg6 <= {wire4[(3'h7):(3'h5)]};
          if (((reg5 ?
              wire3 : ($signed(wire0[(3'h4):(1'h0)]) ?
                  (reg5 ?
                      (wire4 ?
                          reg6 : reg5) : $unsigned((7'h43))) : $unsigned((!wire0)))) < (8'hb2)))
            begin
              reg7 <= (wire0[(1'h0):(1'h0)] * reg6);
              reg8 <= {(|(~reg7)), $signed(wire3[(2'h3):(1'h1)])};
              reg9 <= (wire1[(2'h2):(2'h2)] < (~&{(((8'h9c) ?
                      reg5 : reg6) < (reg8 ? wire4 : (8'hbd)))}));
              reg10 <= (8'haf);
              reg11 <= $unsigned(wire4);
            end
          else
            begin
              reg7 <= {reg6};
            end
          reg12 <= $unsigned((reg6[(5'h11):(4'hd)] ?
              $signed(wire0[(5'h13):(2'h2)]) : (~&(~(!wire3)))));
        end
      else
        begin
          reg6 <= $unsigned($unsigned($signed(reg11)));
          if ((reg8 ?
              (reg11 ?
                  (!(^~wire3)) : (wire1[(1'h0):(1'h0)] != (-(wire1 ?
                      reg9 : (8'hbe))))) : (|({reg7} ?
                  ((reg10 * (8'hb2)) ?
                      (wire2 ?
                          wire2 : (8'had)) : (|wire4)) : reg11[(3'h4):(1'h0)]))))
            begin
              reg7 <= wire4[(1'h0):(1'h0)];
              reg8 <= {reg5[(4'h8):(1'h1)],
                  ($unsigned((|(!wire3))) ?
                      $unsigned((wire1 <<< (~|wire0))) : $unsigned($signed((!wire3))))};
              reg9 <= {$signed($unsigned(wire1))};
            end
          else
            begin
              reg7 <= $unsigned(reg7[(2'h3):(2'h3)]);
              reg8 <= ($unsigned(reg7) > wire4[(2'h2):(1'h1)]);
              reg9 <= ($signed((($signed((8'hb9)) & (~^reg9)) ~^ reg9[(4'h8):(1'h0)])) | ((-$signed(reg12)) ?
                  reg8 : reg11[(1'h1):(1'h1)]));
              reg10 <= (~&(~|{(((8'hb7) >>> (8'hac)) - wire0[(1'h0):(1'h0)]),
                  wire2[(4'h9):(4'h8)]}));
            end
          reg11 <= (~|reg12[(2'h3):(1'h0)]);
          reg12 <= $unsigned((^~($unsigned(((8'haf) ? reg11 : reg9)) ?
              ($unsigned(reg7) >>> wire2[(3'h7):(3'h5)]) : (|reg9))));
          reg13 <= wire4;
        end
    end
  always
    @(posedge clk) begin
      reg14 <= wire2[(3'h7):(3'h5)];
    end
  assign wire15 = $unsigned(wire2);
  assign wire16 = reg5[(3'h7):(1'h0)];
  assign wire17 = reg8[(3'h6):(3'h6)];
  assign wire18 = {$signed(wire0)};
  assign wire19 = ((^(wire3[(3'h7):(3'h4)] ?
                      $unsigned(reg9[(4'h9):(3'h7)]) : ((wire1 ? reg8 : wire1) ?
                          (wire15 ?
                              wire1 : reg12) : wire16[(1'h0):(1'h0)]))) >= wire0[(4'hf):(4'he)]);
endmodule

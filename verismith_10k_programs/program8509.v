module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire2)))
        begin
          reg4 <= (-wire1);
          reg5 <= reg4;
          reg6 <= ($signed(reg5[(3'h5):(2'h2)]) ?
              (8'ha7) : $signed((~(~$unsigned(reg5)))));
          reg7 <= $unsigned((~|(8'haf)));
        end
      else
        begin
          reg4 <= $signed((~|(^~(reg7[(4'h9):(4'h8)] ?
              $unsigned(wire1) : $signed(reg4)))));
          if (reg7)
            begin
              reg5 <= $unsigned($unsigned((wire3[(4'h8):(2'h3)] ?
                  wire1[(3'h4):(2'h2)] : (reg5[(1'h1):(1'h1)] & $signed(reg4)))));
              reg6 <= $unsigned(wire3);
              reg7 <= {$unsigned(((wire2[(3'h4):(1'h0)] <= wire3) ?
                      {(wire0 ? wire2 : (8'hbc)),
                          wire0[(4'h8):(3'h5)]} : reg7))};
              reg8 <= $signed(reg7[(2'h2):(1'h0)]);
            end
          else
            begin
              reg5 <= $signed((reg5 != (^~$unsigned((~&reg6)))));
              reg6 <= (~^reg8);
              reg7 <= ((&reg7) ?
                  (({{reg6}} ~^ (reg7[(4'h9):(3'h5)] ?
                      (wire3 ?
                          reg6 : wire3) : reg4[(4'h8):(3'h6)])) >> (+reg4)) : wire2);
            end
          reg9 <= wire1;
          if ((((~^$signed((reg4 << reg4))) ?
                  ($signed(reg9) + (reg8[(4'h8):(1'h1)] ?
                      reg4 : (reg4 > (8'ha0)))) : {($signed(wire2) << reg6)}) ?
              $unsigned(((~reg6) ?
                  (^(reg9 ?
                      (8'hae) : wire1)) : reg4)) : $unsigned($unsigned(((wire1 <= (8'hb9)) ?
                  $signed(wire3) : (wire2 ? wire3 : reg4))))))
            begin
              reg10 <= (reg9 || (wire2[(3'h4):(2'h2)] ?
                  {(reg5 ? wire2 : reg7[(2'h3):(2'h2)]),
                      {((8'hac) ? wire3 : (8'had)),
                          (reg8 >>> reg4)}} : (reg5[(2'h3):(1'h1)] ?
                      (-reg9[(5'h15):(5'h12)]) : reg4)));
              reg11 <= ((~^(!reg7)) * reg8);
              reg12 <= $signed($signed(reg8));
            end
          else
            begin
              reg10 <= {((reg7 < ($signed(reg7) ?
                      (&wire1) : $unsigned(wire1))) || reg9[(5'h14):(5'h13)])};
            end
          if ((8'ha7))
            begin
              reg13 <= (^$signed((~(^~(reg5 << reg4)))));
              reg14 <= $unsigned((+(($unsigned(reg9) ?
                  wire0[(1'h1):(1'h0)] : (reg5 == reg9)) << ((reg7 & reg4) ?
                  reg9[(4'he):(3'h4)] : $signed((7'h40))))));
              reg15 <= $signed(wire2[(1'h1):(1'h1)]);
              reg16 <= reg12;
            end
          else
            begin
              reg13 <= $signed({($unsigned(((8'hbb) ?
                      wire2 : (8'hac))) & {(reg12 & reg8)}),
                  ((-reg15[(2'h3):(2'h3)]) ?
                      ((wire2 ?
                          reg11 : wire1) > (-wire1)) : $unsigned(wire1))});
            end
        end
      reg17 <= (~&$signed({$unsigned((reg12 ? (8'hbc) : reg13))}));
      reg18 <= (~$signed($unsigned(reg8)));
    end
  assign wire19 = $signed(reg15);
  assign wire20 = reg6[(4'h8):(3'h7)];
  assign wire21 = ($signed((8'ha3)) ?
                      (!(~^reg5)) : (reg7[(3'h6):(2'h2)] >> ($unsigned(reg10[(1'h0):(1'h0)]) < ($unsigned(wire19) ?
                          reg16 : ((7'h44) ? reg8 : wire20)))));
endmodule

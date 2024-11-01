module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
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
  assign wire4 = ((({(7'h40)} ?
                         wire1[(4'hd):(1'h1)] : (8'ha4)) > ($unsigned(wire2[(3'h4):(1'h1)]) + {(wire0 ?
                             wire0 : wire1),
                         $signed(wire2)})) ?
                     {((wire1 ?
                             (wire2 ?
                                 wire2 : (8'ha6)) : (wire2 << wire3)) ^~ {$signed(wire3)}),
                         (!{$signed((8'hac))})} : $unsigned(wire3[(2'h3):(2'h2)]));
  assign wire5 = $signed((^(|({wire2} ?
                     (wire1 >= (8'h9f)) : wire2[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      if (wire4[(5'h11):(1'h0)])
        begin
          if (wire4[(3'h4):(2'h2)])
            begin
              reg6 <= (~$unsigned(wire2));
              reg7 <= ((!(&wire4[(1'h0):(1'h0)])) * (~&wire0[(2'h2):(1'h1)]));
              reg8 <= (^$signed($unsigned(reg6)));
              reg9 <= $signed(((wire4 >>> wire3) ?
                  reg8[(3'h6):(2'h2)] : reg8[(3'h6):(3'h5)]));
              reg10 <= wire1[(3'h4):(2'h3)];
            end
          else
            begin
              reg6 <= reg8[(2'h3):(2'h2)];
              reg7 <= wire3;
              reg8 <= wire1;
              reg9 <= (+({(((8'ha8) ? wire2 : (8'haf)) & wire0[(1'h1):(1'h1)]),
                  ($signed(reg7) ? ((8'ha5) - reg6) : $signed(reg6))} || reg6));
            end
          reg11 <= reg7[(1'h0):(1'h0)];
          reg12 <= reg8[(3'h5):(2'h3)];
        end
      else
        begin
          reg6 <= $unsigned(reg8);
          if (wire5)
            begin
              reg7 <= reg7[(2'h2):(1'h1)];
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= $unsigned($unsigned((^~(wire2 ?
                  ((8'haf) >> reg12) : (reg12 <= (8'hb6))))));
            end
        end
      reg13 <= reg11;
      reg14 <= wire3;
      reg15 <= (reg6[(2'h3):(2'h3)] <<< $unsigned({{(~|reg7)}}));
    end
  assign wire16 = $signed({reg10});
  assign wire17 = ($unsigned(($unsigned($signed(reg8)) ?
                          $unsigned((reg14 && wire3)) : ((reg13 ?
                                  wire2 : reg13) ?
                              (wire0 && (8'hb2)) : (wire3 ^ wire16)))) ?
                      reg14 : ((wire5 && reg14[(2'h2):(2'h2)]) ?
                          (((reg11 ?
                              wire1 : reg7) != ((8'ha4) >>> (8'hb9))) <<< $unsigned($unsigned(wire0))) : reg10));
  assign wire18 = (-(((~(8'hb8)) * $signed((wire2 & reg14))) == $signed(wire0[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      reg19 <= wire4;
      reg20 <= (&wire0[(1'h0):(1'h0)]);
    end
endmodule

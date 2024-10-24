module top
#(parameter param22 = {(((((8'hae) ? (8'ha9) : (7'h42)) ? (-(8'h9f)) : ((8'hbe) ? (7'h44) : (8'hb5))) - (((7'h40) < (8'had)) || (^~(8'ha2)))) ? ((|((7'h44) ? (8'haf) : (8'hb8))) >> {((8'ha1) ? (8'ha7) : (8'ha8)), (~^(8'hb9))}) : (8'haf))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned((((wire2[(1'h1):(1'h1)] ~^ ((8'ha5) ? wire3 : wire1)) ?
          wire0 : (wire0 ^ wire0[(1'h1):(1'h0)])) || (wire2[(4'hd):(3'h7)] & {$signed(wire1)})));
      reg5 <= wire3;
      reg6 <= wire3;
      if ((wire2 ? $signed(reg4) : $unsigned(wire2)))
        begin
          reg7 <= (~wire2[(4'hf):(4'ha)]);
        end
      else
        begin
          if (reg6)
            begin
              reg7 <= ($unsigned($signed(wire3)) ?
                  $signed((reg6 ?
                      ((-wire0) >> ((8'hb7) ? reg4 : reg5)) : (~|(reg7 ?
                          reg4 : (8'h9f))))) : $signed((reg6[(4'he):(3'h5)] * ((wire3 >> wire1) ?
                      wire2[(3'h6):(3'h6)] : (wire1 ^~ (8'ha3))))));
              reg8 <= ($signed($unsigned(wire2)) | (^reg5));
            end
          else
            begin
              reg7 <= (~^{(8'had), (reg4[(4'he):(4'h9)] << reg5)});
              reg8 <= $unsigned((($signed($signed(wire1)) | wire3) != $unsigned((reg4[(2'h3):(2'h2)] ?
                  reg6[(4'he):(3'h4)] : $signed(wire2)))));
            end
        end
      reg9 <= $unsigned($signed(reg7[(4'h8):(2'h3)]));
    end
  assign wire10 = (8'ha2);
  assign wire11 = {(8'hb3),
                      $signed(($unsigned($signed((8'ha9))) ?
                          wire3[(1'h1):(1'h0)] : ((~wire1) ?
                              $signed(wire10) : reg9[(2'h2):(1'h0)])))};
  assign wire12 = wire2[(5'h10):(3'h7)];
  assign wire13 = (8'hb3);
  always
    @(posedge clk) begin
      reg14 <= ({wire10,
          ((~reg8[(4'hc):(2'h3)]) - (^$signed(wire10)))} * wire0);
      reg15 <= (+$signed($signed(((8'hb4) ?
          $signed(wire11) : reg8[(4'hb):(4'h8)]))));
      reg16 <= wire1[(3'h5):(3'h5)];
      reg17 <= wire13;
    end
  assign wire18 = $unsigned(wire13[(5'h12):(3'h6)]);
  assign wire19 = wire13;
  assign wire20 = $unsigned((((reg16[(4'ha):(1'h0)] ?
                              wire3 : (wire1 ^~ (8'had))) ?
                          ({wire13} >>> reg15) : reg15[(3'h5):(1'h0)]) ?
                      ({reg9} ?
                          (~&$signed(reg9)) : {wire3[(2'h2):(1'h0)],
                              {reg16, reg7}}) : $unsigned(((wire13 ~^ wire10) ?
                          (^~reg15) : (wire1 ? wire3 : reg7)))));
  assign wire21 = $unsigned($signed(wire12[(3'h4):(2'h3)]));
endmodule

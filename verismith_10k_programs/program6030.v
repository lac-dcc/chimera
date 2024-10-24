module top
#(parameter param18 = ((+(((~&(8'hb1)) < ((8'hbd) ? (8'haa) : (8'h9f))) < (((8'h9d) ? (8'ha5) : (8'hb9)) ? (~(8'ha4)) : ((8'hbf) || (8'hb1))))) >>> {(((^(7'h43)) & ((8'h9d) ? (8'ha2) : (8'hb4))) ? (-(~|(8'hac))) : ((-(8'hab)) ? (|(8'had)) : ((8'ha5) - (8'ha7))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1[(4'hd):(1'h1)];
  always
    @(posedge clk) begin
      if ({wire2, $unsigned((wire3 >> wire3))})
        begin
          reg5 <= (~&((wire2[(4'h9):(1'h0)] + (wire4 ?
              (wire4 ? wire4 : wire4) : (wire3 >= wire3))) + $signed(wire2)));
          reg6 <= (($signed(($signed((8'ha5)) ? wire3 : (wire3 < reg5))) ?
              wire0[(3'h5):(2'h3)] : wire3) >> (($unsigned((wire1 >>> wire0)) ?
              (!$signed(wire0)) : (((8'hae) ? wire4 : wire4) ?
                  (wire4 ?
                      wire4 : wire0) : reg5[(3'h4):(2'h3)])) ^ {wire0[(4'hd):(4'h9)]}));
          if (reg5)
            begin
              reg7 <= {$signed(reg5), (wire1 ^ reg6[(2'h2):(1'h1)])};
              reg8 <= reg7;
              reg9 <= (wire3 >> wire0);
              reg10 <= $signed($unsigned($signed((~reg8[(2'h3):(1'h0)]))));
            end
          else
            begin
              reg7 <= $unsigned($unsigned($signed($unsigned($unsigned(wire0)))));
              reg8 <= (^wire2[(4'h8):(3'h5)]);
            end
          if ({(8'haa)})
            begin
              reg11 <= (reg5 ^~ (8'ha6));
              reg12 <= (~(^({{(8'hb3)}, {reg8}} == reg9[(2'h2):(1'h0)])));
            end
          else
            begin
              reg11 <= reg6;
              reg12 <= ((~reg8) ?
                  wire0[(4'h8):(1'h0)] : (&(($signed(wire3) != $unsigned(reg8)) ?
                      {(wire2 + reg9)} : reg10)));
            end
        end
      else
        begin
          reg5 <= $signed(((reg7 ?
              (~|wire1[(3'h6):(1'h1)]) : $unsigned({reg8,
                  reg11})) >>> wire0[(4'hd):(2'h3)]));
          if (((^~{$unsigned((!(8'haf)))}) && $unsigned((wire4[(1'h1):(1'h0)] * (wire2[(2'h2):(2'h2)] < (~reg8))))))
            begin
              reg6 <= (wire2[(3'h5):(1'h0)] & (~($signed((reg5 + wire3)) != wire0[(3'h6):(2'h2)])));
              reg7 <= (|wire0);
              reg8 <= (wire3[(3'h7):(1'h0)] ?
                  $signed(wire1[(5'h11):(4'hf)]) : {($signed((wire2 ?
                          reg9 : reg6)) != ((reg11 ? wire4 : reg9) ?
                          (8'ha4) : $unsigned((8'hba))))});
            end
          else
            begin
              reg6 <= (((&$signed(wire2[(1'h1):(1'h1)])) ?
                  (wire1[(3'h4):(1'h0)] < $unsigned(wire1)) : ($signed($signed(reg5)) - (^~(~&reg7)))) << wire1[(5'h11):(4'ha)]);
            end
        end
    end
  assign wire13 = (-reg6);
  always
    @(posedge clk) begin
      reg14 <= reg10[(1'h1):(1'h0)];
      reg15 <= (|{$signed(reg5)});
      reg16 <= wire1[(5'h11):(3'h4)];
      reg17 <= {wire0};
    end
endmodule

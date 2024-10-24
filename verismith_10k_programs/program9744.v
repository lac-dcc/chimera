module top
#(parameter param18 = ((({((8'h9c) ^~ (8'hb7)), (~&(8'h9d))} ? (+{(8'ha7)}) : (-(~&(8'hab)))) ? ((~(8'ha1)) ? ((|(8'hba)) ? (~|(8'hb4)) : {(8'hbd)}) : (~|(-(8'hb6)))) : ({(&(8'had)), (^~(7'h41))} ? {((8'h9d) * (8'hb9)), (8'hb6)} : {((8'hb7) ? (8'ha8) : (8'ha3)), ((8'ha4) ? (8'ha2) : (8'ha1))})) ? ((((~(8'ha0)) << (~(8'hbf))) == ((^(8'had)) >> (~&(8'hb7)))) >>> ((((8'hb1) ? (8'hac) : (7'h43)) ? {(7'h44), (8'ha9)} : ((8'hb8) ? (8'haa) : (8'had))) ? ({(8'ha1)} ? ((8'hbb) ? (8'hbf) : (8'hbf)) : {(8'hb0)}) : (-(8'hba)))) : {(~(^(^(7'h42))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire10,
                 wire9,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((($unsigned(wire0) >= wire4[(3'h6):(2'h2)]) <= wire3[(2'h2):(1'h1)]))
        begin
          reg5 <= {$unsigned(wire3[(2'h2):(1'h1)])};
        end
      else
        begin
          reg5 <= reg5[(2'h2):(1'h0)];
          reg6 <= ($signed($unsigned(($signed(wire3) ~^ $unsigned(wire3)))) ?
              $signed($signed((^~$signed(wire4)))) : (wire3[(2'h3):(1'h1)] ?
                  ((|(~&wire4)) >> $signed((~&wire2))) : $unsigned(wire0)));
        end
      reg7 <= $signed(wire1);
      reg8 <= ((wire2[(4'h8):(3'h6)] ?
          ((^(wire0 ? (8'ha7) : reg6)) ?
              (reg7 ?
                  (7'h41) : $unsigned(reg6)) : ((~^wire2) ~^ (8'h9c))) : {wire2[(3'h7):(1'h1)],
              $unsigned(((8'had) ?
                  reg7 : wire2))}) | ($signed((reg6[(2'h3):(2'h2)] ^ (reg6 || (8'h9c)))) ?
          $signed((8'hbf)) : $signed((wire2 * wire3))));
    end
  assign wire9 = (-wire1[(4'h9):(3'h4)]);
  assign wire10 = {wire9[(5'h10):(3'h5)],
                      (~^{$unsigned({wire9}), $signed($unsigned(reg6))})};
  always
    @(posedge clk) begin
      if (wire10[(4'he):(2'h2)])
        begin
          reg11 <= reg8;
          reg12 <= {$unsigned($signed(reg5)),
              (reg11[(3'h7):(3'h4)] ?
                  reg6[(2'h2):(1'h0)] : $signed(wire4[(3'h4):(1'h0)]))};
          reg13 <= (~^wire3[(4'hb):(1'h0)]);
        end
      else
        begin
          reg11 <= $unsigned(((&(!{wire1})) ~^ wire0));
          reg12 <= wire2;
          reg13 <= $signed($unsigned($unsigned(($signed(wire0) * (7'h44)))));
          reg14 <= (~&(((!$unsigned(reg6)) ?
              $signed((~|(7'h42))) : $signed(((7'h42) ?
                  wire9 : reg8))) << $signed(((8'hb5) - (reg11 ?
              wire4 : wire1)))));
        end
      reg15 <= (~|{wire2[(3'h6):(2'h3)], $unsigned({$unsigned(reg8)})});
      reg16 <= reg7[(3'h5):(2'h2)];
      reg17 <= $unsigned((wire1 ?
          ($signed($unsigned(reg7)) ?
              $unsigned(wire10) : $unsigned(reg12)) : (~^$signed((~&(7'h40))))));
    end
endmodule

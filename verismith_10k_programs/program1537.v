module top
#(parameter param23 = (~^{{{((8'ha1) ? (8'hac) : (7'h43)), ((8'hae) ? (8'hb6) : (8'hba))}}, (^~(7'h44))}), 
parameter param24 = (^~(&param23)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
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
  assign wire4 = $unsigned(($unsigned(wire3[(3'h4):(2'h3)]) ?
                     wire2[(1'h1):(1'h1)] : (wire2 > wire0[(3'h4):(3'h4)])));
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      if ((wire0[(3'h6):(3'h6)] ? wire4 : $unsigned(wire1[(3'h6):(1'h0)])))
        begin
          reg6 <= $signed((8'hb9));
          reg7 <= $unsigned(((wire2[(1'h0):(1'h0)] ?
              (~^(8'ha0)) : $unsigned(wire2)) ^ ((8'hac) ?
              $unsigned($unsigned(wire5)) : $unsigned($unsigned(wire2)))));
        end
      else
        begin
          reg6 <= $unsigned(reg6);
          if ((wire4 + $signed(($signed((^wire1)) == wire0))))
            begin
              reg7 <= {(~^(^~($unsigned(reg7) ?
                      $unsigned(wire4) : wire5[(4'ha):(3'h4)]))),
                  $unsigned(reg7)};
              reg8 <= wire0;
            end
          else
            begin
              reg7 <= (~&((((^wire0) ? reg7 : $unsigned((8'hba))) ?
                  ((wire1 > wire1) ^~ {wire2}) : ($unsigned(wire1) ?
                      reg6 : (reg6 >= wire1))) == $signed((!(~^reg6)))));
            end
          reg9 <= (reg6 ? (wire0 ? wire5[(1'h1):(1'h0)] : (8'hb0)) : (~wire4));
          reg10 <= {{((^~((8'ha3) ? reg7 : wire4)) >>> wire0)}};
        end
      reg11 <= wire4[(4'hc):(2'h3)];
      reg12 <= reg11[(2'h2):(1'h1)];
      reg13 <= ((^~{(|(&(8'hba))), {(reg8 < reg6)}}) >>> reg11[(1'h0):(1'h0)]);
      reg14 <= (|(reg10[(2'h3):(1'h1)] ?
          (~&($signed((8'hbd)) ?
              (reg11 + reg10) : reg10[(3'h6):(2'h3)])) : reg7[(4'hf):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg15 <= wire5[(3'h4):(2'h2)];
      reg16 <= $signed(($unsigned(($unsigned(reg15) ?
              $unsigned((7'h41)) : reg13[(4'h8):(3'h4)])) ?
          (&$unsigned(reg7)) : (reg15[(2'h2):(1'h0)] & $unsigned((+reg13)))));
    end
  always
    @(posedge clk) begin
      reg17 <= {$signed(reg10)};
    end
  assign wire18 = (~(!wire5));
  assign wire19 = $signed({(^$signed($signed(wire3))),
                      (reg11 ? reg13 : {((8'hbc) ~^ wire4)})});
  assign wire20 = ((^(($unsigned((8'ha4)) ~^ $unsigned((8'haf))) - $unsigned((reg10 ?
                      wire18 : (8'hbe))))) ^~ $unsigned(reg12));
  assign wire21 = $unsigned($unsigned(reg14[(3'h4):(2'h2)]));
  assign wire22 = reg14[(3'h5):(3'h5)];
endmodule

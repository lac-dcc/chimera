module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = (wire5 ?
                     (wire5[(2'h3):(2'h3)] ?
                         ((wire3 ? wire5 : (~wire4)) ?
                             ((wire3 ?
                                 wire5 : wire2) >= $signed((8'hbb))) : (8'h9c)) : ($signed($signed((8'hb2))) ?
                             {wire1, (~wire2)} : $signed({wire5,
                                 (8'ha0)}))) : (^~((wire1 - wire2[(4'h8):(3'h7)]) ?
                         wire5[(3'h4):(1'h0)] : {wire3[(1'h0):(1'h0)],
                             $signed((8'ha2))})));
  always
    @(posedge clk) begin
      reg7 <= wire0;
      reg8 <= (~reg7);
      reg9 <= ($signed(({$unsigned(wire2)} ?
          ((^~wire0) == wire3[(2'h2):(1'h0)]) : $signed((wire3 | (8'ha2))))) > (8'hba));
      reg10 <= (((!{wire4[(4'hc):(2'h3)],
          ((7'h41) >= wire6)}) | wire3[(1'h1):(1'h0)]) - wire0);
      reg11 <= $unsigned($signed($signed((-(reg9 > wire6)))));
    end
  always
    @(posedge clk) begin
      reg12 <= (-$unsigned((($signed(reg7) != $unsigned(wire1)) * (~&(8'hb1)))));
      reg13 <= ({(~|(^wire0[(1'h0):(1'h0)]))} ?
          $unsigned(reg8[(4'h9):(1'h1)]) : $signed($signed($signed((~^reg8)))));
    end
  always
    @(posedge clk) begin
      reg14 <= (&(reg9[(2'h2):(2'h2)] ?
          wire1[(4'hf):(3'h7)] : $signed($unsigned((wire0 || (8'ha0))))));
      reg15 <= wire2;
      reg16 <= (reg7[(2'h2):(1'h1)] ?
          ((~^($signed(reg14) >> $unsigned(wire5))) ~^ $unsigned($signed({reg9}))) : (^reg13[(4'he):(3'h5)]));
      reg17 <= reg13;
      reg18 <= ($unsigned(((wire6 <<< (~|reg15)) ?
              (^~reg8[(1'h1):(1'h0)]) : (reg7[(1'h1):(1'h0)] ?
                  (~&reg14) : (reg9 > wire1)))) ?
          ((($unsigned((8'hb7)) ?
              $unsigned((8'hb6)) : (^reg12)) | reg12[(1'h1):(1'h1)]) << $signed($signed(reg17[(2'h3):(2'h2)]))) : ($unsigned(((7'h40) ?
              (~|reg16) : reg11)) - $signed(reg12)));
    end
endmodule

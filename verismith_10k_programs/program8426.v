module top
#(parameter param14 = ((^((!{(7'h41), (8'hb7)}) * ((8'hab) | {(8'hbc)}))) < ((((8'ha4) ? ((8'ha2) ? (8'hac) : (8'hb9)) : ((8'h9f) << (7'h43))) << (((8'ha5) ^~ (8'ha3)) ? {(8'had), (7'h40)} : (~&(8'ha3)))) - ((&(!(8'ha6))) + (((8'ha9) ? (8'had) : (8'h9f)) & (~(7'h43)))))), 
parameter param15 = ((~^((^~((8'ha2) >>> param14)) ? (^param14) : ((!param14) ? (~|param14) : (param14 || (7'h42))))) & (((param14 ? param14 : {param14}) <<< (^param14)) ? (+param14) : (param14 ~^ ({param14, (8'hb0)} || ((8'hba) <<< param14))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 reg8,
                 reg7,
                 reg6,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (7'h43);
    end
  assign wire5 = (~($signed(reg4) == $unsigned($unsigned($signed(reg4)))));
  always
    @(posedge clk) begin
      reg6 <= wire2[(2'h2):(2'h2)];
      reg7 <= wire1;
      reg8 <= ((wire5 > ((reg6 ? $signed(wire5) : (&reg4)) ?
          $unsigned($unsigned((8'ha0))) : ((8'ha7) && $unsigned(wire3)))) > wire0[(5'h12):(5'h11)]);
    end
  assign wire9 = ($signed($signed($signed({wire0,
                     wire2}))) >= $signed((($signed((8'ha7)) ?
                     ((8'hb1) - wire1) : $unsigned(reg6)) * (~reg6))));
  assign wire10 = reg6;
  assign wire11 = $unsigned(((8'ha9) + {($signed((8'hb0)) ?
                          {reg7, (8'h9f)} : $signed(wire3)),
                      wire2}));
  assign wire12 = wire3;
  assign wire13 = $signed((^~wire2));
endmodule

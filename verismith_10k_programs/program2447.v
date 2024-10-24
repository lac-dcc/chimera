module top
#(parameter param14 = {((^~({(8'hac)} ^ (8'h9f))) ? ((((8'ha4) ? (8'ha8) : (8'hb6)) < ((8'hba) ? (8'ha7) : (8'hbf))) ? {((8'ha3) ? (7'h41) : (8'hb7))} : {(~^(8'ha3))}) : ((((8'hb7) ? (8'hbb) : (8'hb4)) ^ ((8'hb0) ? (8'had) : (8'h9e))) ? (((8'ha5) ? (8'hbc) : (8'hbb)) ~^ ((8'hb4) ? (7'h42) : (7'h42))) : (8'ha5)))}, 
parameter param15 = {((&(((8'hb7) <= param14) ? (|(8'hae)) : (~^param14))) != ((^(param14 >> (8'hba))) <= param14)), (param14 ~^ ((param14 | param14) <<< param14))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire9,
                 wire6,
                 wire5,
                 reg10,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire2[(4'h9):(3'h6)];
  assign wire6 = $signed({(^~$unsigned((wire3 & wire2))),
                     wire5[(4'h8):(4'h8)]});
  always
    @(posedge clk) begin
      reg7 <= (8'ha8);
      reg8 <= ($unsigned($signed({wire0[(2'h2):(1'h0)]})) ? wire5 : (-{wire1}));
    end
  assign wire9 = $signed((wire3[(3'h6):(1'h0)] ? wire1 : reg7));
  always
    @(posedge clk) begin
      reg10 <= (reg8[(1'h1):(1'h1)] ?
          (!$signed($unsigned((~|wire3)))) : $unsigned((((wire3 ~^ wire9) * (^(8'hab))) ?
              $unsigned(reg7[(2'h2):(2'h2)]) : ((wire5 ? wire9 : wire9) ?
                  (&wire3) : {reg7}))));
    end
  assign wire11 = ((reg8 >= wire9) != reg10[(5'h12):(5'h10)]);
  assign wire12 = $signed(reg7);
  assign wire13 = ($signed($unsigned((!{wire12, wire1}))) ?
                      wire1[(4'hd):(1'h0)] : (($signed((wire5 ?
                              wire4 : wire2)) ?
                          $unsigned({wire11,
                              wire2}) : {reg10[(3'h6):(1'h1)]}) && (((7'h44) ?
                          $signed(wire3) : wire1[(4'hf):(3'h5)]) - reg7)));
endmodule

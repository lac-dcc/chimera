module top
#(parameter param13 = ({((((8'hb7) ? (8'ha2) : (8'hb3)) < ((8'hac) ^ (7'h42))) << {((8'hb9) && (8'hb8))}), {(((8'hb3) ? (8'h9f) : (8'hbb)) <<< {(8'hb8), (8'ha8)})}} ~^ (+((-{(8'hae)}) + (((8'ha8) ? (8'hb1) : (8'hba)) >> ((8'hbd) > (8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($signed(($signed((wire0 ?
          (8'hbb) : wire0)) ~^ (~^$signed(wire3)))));
      reg5 <= $unsigned($unsigned($unsigned(wire3)));
    end
  always
    @(posedge clk) begin
      reg6 <= ((wire1 ?
              wire1[(2'h2):(2'h2)] : (({wire3} ? wire0 : (reg4 >= wire0)) ?
                  $unsigned((wire0 || reg4)) : $unsigned($unsigned(reg4)))) ?
          ($signed($unsigned((reg4 | wire2))) | (7'h40)) : (~|wire3));
      reg7 <= (($unsigned(((~^(8'ha7)) ? {reg4} : (-wire3))) ?
              wire0 : wire3[(4'he):(4'h8)]) ?
          {$unsigned({$signed(wire1),
                  (wire3 ? wire2 : wire0)})} : $signed(reg5[(4'hb):(4'hb)]));
    end
  assign wire8 = (-$unsigned(wire2[(1'h0):(1'h0)]));
  assign wire9 = $unsigned(wire3);
  assign wire10 = ($unsigned((7'h40)) ?
                      (~|((reg5[(4'hd):(2'h3)] * wire1[(3'h5):(3'h5)]) ?
                          wire0[(2'h2):(1'h1)] : ((wire8 * reg7) ^~ {(8'hbb),
                              wire9}))) : $unsigned(wire0));
  assign wire11 = ((^~(reg7[(2'h2):(2'h2)] ?
                      $signed((^~reg6)) : $unsigned(reg7[(4'h8):(3'h7)]))) >>> (wire2[(3'h7):(2'h2)] ?
                      wire10[(3'h4):(1'h1)] : $signed((~wire1))));
  assign wire12 = ({$unsigned($unsigned((~^wire8)))} ?
                      (reg4[(3'h6):(3'h6)] && $signed($signed((wire8 ?
                          reg4 : (8'ha0))))) : reg4[(4'ha):(2'h3)]);
endmodule

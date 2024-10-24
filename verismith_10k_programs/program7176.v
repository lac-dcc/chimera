module top
#(parameter param16 = {(~^(|{((8'ha3) << (8'ha1)), (~&(8'hb1))})), (~&{(~&{(8'hb4), (8'hb1)})})}, 
parameter param17 = (param16 ? (~|{param16}) : (((~^(param16 ? param16 : param16)) ? (((8'hbe) ? param16 : param16) ^ (param16 ? param16 : param16)) : (~&(&param16))) ~^ param16)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = {($unsigned($unsigned((wire3 ? wire3 : wire3))) * wire1),
                     $signed((wire3[(2'h3):(2'h3)] * $unsigned((wire1 << wire0))))};
  assign wire5 = (wire1[(2'h3):(2'h2)] + $unsigned({$signed((^~wire1)),
                     ((wire4 > (8'hac)) ?
                         wire0[(4'hb):(4'h9)] : (wire3 | wire1))}));
  assign wire6 = wire0[(4'hf):(4'ha)];
  assign wire7 = $signed(wire6);
  assign wire8 = $unsigned($signed(((^(~&wire7)) >= {wire3,
                     (wire5 <<< wire6)})));
  assign wire9 = (((8'hb2) != {wire5[(1'h1):(1'h1)],
                     wire6}) <<< wire4[(3'h5):(3'h4)]);
  assign wire10 = (8'hb5);
  always
    @(posedge clk) begin
      reg11 <= (|$unsigned(((~&$signed((8'had))) * wire10[(4'hb):(3'h4)])));
      reg12 <= $unsigned(({wire2,
              ({wire9, wire3} ? ((8'hb8) ? wire1 : wire8) : wire4)} ?
          wire4[(4'hb):(1'h0)] : $unsigned(wire5)));
      reg13 <= ((($unsigned((8'hb3)) ?
          $unsigned($unsigned(wire4)) : $unsigned((~&wire2))) >>> (wire0[(2'h2):(1'h1)] ?
          {(~^reg11), (~wire1)} : (8'ha0))) == (wire9 ?
          wire7[(2'h2):(1'h1)] : $unsigned($signed((wire1 ? wire7 : reg12)))));
      reg14 <= reg13[(4'hc):(3'h7)];
      reg15 <= reg13;
    end
endmodule

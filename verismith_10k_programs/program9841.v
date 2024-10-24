module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((wire0[(4'h8):(3'h5)] ^ (wire3 <= (wire2 < $unsigned((8'hba))))) ?
          $unsigned($signed($unsigned((wire2 != wire0)))) : wire2);
      reg5 <= ((((wire2[(3'h4):(1'h1)] ?
          wire2[(2'h2):(1'h1)] : $unsigned(wire3)) >>> wire2[(4'hd):(1'h0)]) ^~ $signed(((reg4 && (8'hb2)) != {reg4,
          (8'hac)}))) < ($unsigned($unsigned((!wire0))) ?
          ($signed((wire3 ? wire0 : wire3)) ?
              $signed($unsigned(wire1)) : wire0[(4'h8):(1'h1)]) : {$signed(wire2[(2'h2):(1'h1)]),
              (+$unsigned(wire2))}));
    end
  assign wire6 = $signed(((!(7'h41)) + (+($signed((8'ha7)) ?
                     wire2 : {wire2, wire1}))));
  assign wire7 = (7'h42);
  assign wire8 = $unsigned($unsigned({$signed($unsigned((8'ha6)))}));
  assign wire9 = ($unsigned((wire2[(4'h9):(4'h8)] ?
                     wire6[(1'h1):(1'h1)] : wire7[(1'h1):(1'h0)])) == (($unsigned((wire8 ?
                         (7'h40) : wire1)) ?
                     (~&$unsigned(reg4)) : {(reg4 * (8'ha1))}) < wire3));
  assign wire10 = (-$unsigned(($signed(reg5[(3'h7):(2'h3)]) - $unsigned(wire9))));
  assign wire11 = $unsigned((!$unsigned((8'hb4))));
  assign wire12 = $unsigned($signed(reg4[(2'h3):(2'h2)]));
  assign wire13 = {(((8'had) ?
                              $unsigned($signed(wire6)) : (wire0[(4'h9):(3'h7)] & (~^reg5))) ?
                          wire12 : $unsigned($signed(((8'had) ?
                              wire0 : wire7))))};
endmodule

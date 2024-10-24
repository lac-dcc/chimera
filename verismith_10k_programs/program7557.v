module top
#(parameter param16 = (((8'ha0) >>> ({((8'ha9) ? (8'h9d) : (8'hbe))} & (|{(7'h42)}))) - (~&{(8'hb4)})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
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
      reg4 <= $unsigned(wire1[(5'h12):(2'h3)]);
      reg5 <= $signed(((wire3 ?
          $signed((wire0 < wire3)) : ((~wire3) ?
              (wire0 ? wire3 : wire2) : (-reg4))) <= reg4));
      reg6 <= {($unsigned(reg4[(3'h7):(3'h4)]) ? $signed({(-(8'hba))}) : wire2),
          $unsigned((wire2 ?
              (~|(+wire2)) : (wire2[(1'h1):(1'h0)] ~^ (wire1 == reg5))))};
      reg7 <= ($unsigned($unsigned($unsigned((-wire0)))) ?
          {wire3, (8'h9d)} : (wire2 ?
              (~wire3[(4'h8):(2'h2)]) : ($signed({wire2}) ?
                  $unsigned($unsigned(wire3)) : (~|((8'hbb) - reg6)))));
    end
  assign wire8 = ($unsigned(($signed($signed(wire0)) ?
                     $unsigned(reg4) : wire1)) * ($signed($signed(wire3[(4'hd):(3'h6)])) <= $signed(wire0)));
  assign wire9 = ($signed($unsigned((&$unsigned(wire1)))) ?
                     $unsigned(reg5[(4'h8):(3'h4)]) : wire1[(3'h7):(3'h7)]);
  assign wire10 = (8'hb9);
  assign wire11 = $unsigned($unsigned({(+((7'h43) ? wire0 : reg6))}));
  assign wire12 = reg7;
  assign wire13 = reg6[(3'h7):(3'h7)];
  assign wire14 = (~&(~^($unsigned((wire3 * wire10)) > reg5)));
  assign wire15 = $unsigned($unsigned(wire12[(4'hb):(2'h3)]));
endmodule

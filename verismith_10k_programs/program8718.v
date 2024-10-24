module top
#(parameter param15 = (!((+((8'hbc) < {(8'ha2)})) ? (^~(((8'hb9) <<< (8'ha3)) << ((8'ha6) > (8'hb0)))) : (~&(((8'ha2) ? (8'haf) : (8'ha7)) && ((8'hbd) ? (8'hb5) : (8'haa)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  assign y = {wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 (1'h0)};
  assign wire4 = (&$unsigned($signed(((~wire3) ?
                     $unsigned(wire2) : $unsigned(wire3)))));
  assign wire5 = $signed((~&$unsigned($signed((wire4 == (8'hb6))))));
  assign wire6 = ((+wire0[(3'h5):(1'h0)]) ?
                     $unsigned(($unsigned({wire0,
                         wire2}) + $signed((~^wire3)))) : (wire3 ?
                         $unsigned(({wire3,
                             wire5} * $signed((8'ha6)))) : (8'hb6)));
  assign wire7 = $signed(((^~(((8'hba) == wire1) >= $unsigned(wire4))) ?
                     (~^wire3) : $unsigned(wire3)));
  assign wire8 = $unsigned(wire3[(1'h0):(1'h0)]);
  assign wire9 = wire5[(3'h6):(2'h3)];
  assign wire10 = ($unsigned((((wire2 && wire2) <= {wire4,
                          wire2}) ^ $unsigned((|wire2)))) ?
                      (~wire3) : $signed((wire9 ?
                          ({wire9} ?
                              (wire0 >> (7'h41)) : $unsigned(wire9)) : ({wire8} ^~ $signed(wire6)))));
  assign wire11 = {($signed((-wire9)) << (($unsigned(wire3) >= {(8'h9f),
                          (8'h9d)}) < (wire7[(1'h0):(1'h0)] < (wire4 ?
                          wire9 : wire0)))),
                      (8'hbe)};
  assign wire12 = (wire6 >> wire7);
  always
    @(posedge clk) begin
      reg13 <= ((wire8 ?
          (^~wire0) : $signed(wire10[(4'hf):(4'hc)])) ^~ (-{((wire7 ?
              wire9 : (8'ha4)) <= ((8'hb5) && wire6)),
          (~|{wire12})}));
    end
  assign wire14 = ($signed(wire12) ? wire5[(4'h8):(1'h0)] : wire10);
endmodule

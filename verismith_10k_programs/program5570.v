module top
#(parameter param12 = ((+{(|((8'h9f) <<< (7'h44))), {((8'hab) >= (8'hba)), ((8'haa) == (8'hb6))}}) & ({({(8'haa), (8'hbc)} + (8'h9c)), (((8'ha2) + (8'ha8)) ? (|(8'h9c)) : ((8'hb4) ? (8'hba) : (8'ha2)))} ? (~^(8'ha3)) : (!(|(|(8'hb4)))))), 
parameter param13 = param12)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire11, wire10, wire9, wire7, wire6, wire5, wire4, reg8, (1'h0)};
  assign wire4 = {(((wire3[(4'h9):(3'h4)] > wire0[(1'h1):(1'h1)]) ?
                             wire0 : (-$signed(wire0))) ?
                         ($signed($signed(wire0)) ^~ wire2) : (^~wire2[(1'h0):(1'h0)])),
                     (wire1[(2'h3):(1'h0)] || {{(wire1 << wire3),
                             $unsigned(wire1)},
                         wire2})};
  assign wire5 = ($signed($unsigned(wire1)) && ($signed(((~wire3) - wire4)) == (8'hb5)));
  assign wire6 = $signed({$signed($unsigned($signed(wire5))),
                     {{$signed((8'hae)), (|wire4)},
                         (wire2[(4'h8):(2'h2)] ?
                             $unsigned((8'h9f)) : (^~wire2))}});
  assign wire7 = $unsigned({wire0[(3'h7):(3'h5)]});
  always
    @(posedge clk) begin
      reg8 <= (wire1 <= (($signed({wire6}) >= ($unsigned(wire5) & wire6)) ?
          $unsigned(wire5[(4'hd):(4'hd)]) : (wire4[(4'h8):(2'h2)] || wire6[(5'h13):(2'h3)])));
    end
  assign wire9 = $signed($unsigned(($unsigned((~reg8)) | $unsigned($unsigned(wire1)))));
  assign wire10 = {({$signed(wire6[(1'h1):(1'h1)]),
                          wire0[(5'h11):(2'h2)]} - $signed(wire6))};
  assign wire11 = (({$unsigned($signed(wire7)), (8'hb3)} ?
                      $unsigned((|$unsigned(wire7))) : (8'hb9)) < ({(wire10 < wire9)} ?
                      $unsigned((wire7[(3'h5):(3'h4)] ?
                          $unsigned(wire9) : wire5[(3'h7):(3'h5)])) : wire6[(5'h13):(4'hc)]));
endmodule

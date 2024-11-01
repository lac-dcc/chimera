module top
#(parameter param18 = ((|(^~((!(8'ha7)) ? ((8'hb8) & (8'hbf)) : ((8'ha0) ~^ (8'h9e))))) ? {(((8'h9e) ? {(8'hbd)} : (8'h9f)) ^~ (~(~(8'hb7))))} : (^~(^~{(8'hbf)}))), 
parameter param19 = (param18 ? {param18} : (-(((param18 * (7'h40)) ^ ((8'hbb) + param18)) + ((param18 <<< param18) >= param18)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = ($signed($unsigned((wire1[(1'h1):(1'h0)] ~^ $signed(wire3)))) ^ $unsigned((!{$signed(wire4)})));
  assign wire6 = ((($unsigned((wire1 ^ wire1)) * {(wire4 ?
                         wire5 : wire1)}) <= (wire1 ?
                     wire1 : ($unsigned((8'hb6)) ?
                         (~wire5) : ((8'ha3) ? (7'h43) : wire4)))) & wire0);
  assign wire7 = $unsigned(($signed(wire4) >>> ((^~wire1) ?
                     (!wire0) : $unsigned((~|wire6)))));
  assign wire8 = $signed($unsigned({(!{wire7}),
                     $signed(((8'hb6) ? wire5 : wire7))}));
  assign wire9 = wire0[(4'h8):(2'h2)];
  assign wire10 = (+$signed(wire8));
  assign wire11 = (wire9 ?
                      wire10[(2'h3):(1'h1)] : ((~&$signed((~&wire8))) ?
                          $signed(wire4) : ({{wire9, wire10},
                              ((8'hb2) ? wire8 : wire3)} * (8'ha9))));
  assign wire12 = ($signed((+wire2)) ?
                      wire8 : ($unsigned((-(wire3 >>> wire11))) && $signed((wire1 ?
                          $unsigned((7'h40)) : $unsigned(wire6)))));
  always
    @(posedge clk) begin
      reg13 <= (($unsigned(wire11) ?
          $signed($signed($signed(wire12))) : (!$signed((|wire10)))) + (wire3 ?
          $signed($unsigned((wire9 >> wire1))) : {(-wire3),
              wire9[(1'h0):(1'h0)]}));
      reg14 <= $unsigned((~wire0[(3'h7):(1'h0)]));
    end
  assign wire15 = wire12;
  assign wire16 = ({(|wire3)} & wire10[(1'h0):(1'h0)]);
  assign wire17 = ((!{((~|wire6) >= (-wire7)),
                      (~$unsigned(wire10))}) * $unsigned((|wire8[(3'h4):(2'h2)])));
endmodule

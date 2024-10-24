module top
#(parameter param16 = (|{(|(((8'hb5) ~^ (8'hac)) ? ((7'h42) >>> (8'hb8)) : (~&(8'hb0))))}), 
parameter param17 = (~^param16))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire15,
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
  assign wire5 = (wire1 ?
                     ((-wire0) ?
                         wire0 : $unsigned(((wire1 == wire1) ?
                             $signed((8'h9d)) : $unsigned((8'hbc))))) : wire0);
  assign wire6 = ((((wire2 * wire2) > $unsigned(((8'hbe) ^~ wire4))) || {$unsigned((wire1 ?
                             wire2 : wire1))}) ?
                     $unsigned($signed($signed((wire3 >>> wire3)))) : wire2[(4'hf):(2'h3)]);
  assign wire7 = ($signed($unsigned({(wire4 ^ wire2), (^wire4)})) * ((8'hbb) ?
                     (($unsigned(wire2) <<< $signed((7'h41))) ?
                         ((+wire4) ^ (wire5 <<< wire0)) : (~&(wire0 ?
                             (8'h9e) : wire5))) : ($unsigned($unsigned(wire2)) ?
                         (~|(~wire1)) : wire5)));
  assign wire8 = wire6;
  assign wire9 = $unsigned(wire6);
  assign wire10 = wire1[(3'h5):(3'h4)];
  assign wire11 = (^~(((|((8'ha9) ~^ wire5)) ?
                      wire9[(3'h4):(2'h3)] : $unsigned($unsigned(wire0))) ^~ (wire0[(4'h9):(1'h1)] - (wire3[(3'h7):(3'h6)] ?
                      $signed(wire9) : wire1[(3'h6):(2'h2)]))));
  assign wire12 = $unsigned(wire10[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg13 <= ($unsigned($unsigned(({wire7, wire7} ?
          ((7'h41) ~^ wire10) : $unsigned((8'ha2))))) < (&(^wire5)));
      reg14 <= wire8[(4'h8):(3'h4)];
    end
  assign wire15 = wire2[(4'h9):(3'h6)];
endmodule

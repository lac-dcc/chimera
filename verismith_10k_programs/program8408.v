module top
#(parameter param14 = (((-(((7'h43) ? (8'h9f) : (8'ha2)) ? ((8'hbc) ? (8'had) : (8'hac)) : ((7'h41) ^~ (8'hb5)))) ^~ (~(((8'h9c) ? (8'ha7) : (8'hbb)) ~^ {(7'h43), (8'hae)}))) ? (~&(8'had)) : (-(((!(8'ha5)) | ((8'hb4) ? (8'hbf) : (8'hb6))) ? {(~^(8'haf)), ((8'hb8) > (8'hb4))} : {{(8'hbd)}, (8'hbe)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire3[(2'h2):(1'h0)];
  assign wire5 = ($signed(wire4) != $unsigned((((^wire4) <= $unsigned(wire4)) ?
                     ($unsigned(wire1) ?
                         wire4[(2'h3):(2'h2)] : $unsigned(wire1)) : ($signed(wire3) ?
                         $signed(wire3) : {(7'h42), (8'hae)}))));
  assign wire6 = $signed(((~^((wire4 <<< wire5) ? {wire5} : (!wire2))) ?
                     $unsigned((&$unsigned((7'h41)))) : ((((8'hba) < wire0) ?
                         (wire3 ?
                             wire3 : wire2) : wire5) && (|$signed(wire3)))));
  assign wire7 = (({$unsigned(((8'hb3) ? wire6 : wire4)),
                         $unsigned(((7'h44) >> wire2))} ^~ $unsigned(wire0)) ?
                     $signed((^$unsigned($signed((8'ha5))))) : wire6[(2'h2):(2'h2)]);
  assign wire8 = (&wire5[(3'h4):(1'h1)]);
  assign wire9 = (|wire4[(1'h1):(1'h0)]);
  assign wire10 = $unsigned((^(~wire7[(4'h9):(2'h3)])));
  assign wire11 = ($unsigned(wire8[(5'h10):(5'h10)]) ?
                      $unsigned(($signed((wire1 ? wire0 : wire3)) ^~ {wire1,
                          (wire4 ?
                              wire7 : wire6)})) : $unsigned(($signed({wire4,
                              wire3}) ?
                          $unsigned(wire2) : (~^$unsigned(wire5)))));
  assign wire12 = wire11;
  assign wire13 = wire12[(2'h3):(1'h0)];
endmodule

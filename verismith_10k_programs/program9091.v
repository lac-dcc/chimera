module top
#(parameter param11 = ((~^({((7'h43) ? (8'hb5) : (8'hbc)), ((8'hb4) > (8'hba))} ? {((8'haa) && (8'hbc))} : (8'hae))) ? (((8'ha3) <= (((8'h9c) >> (8'hb4)) ? {(8'ha5)} : ((8'h9c) >= (8'ha9)))) - (^{((8'hb9) && (8'hb0))})) : ({((~^(8'haf)) << (8'ha0)), ((|(8'hb4)) ? ((8'hb3) ? (8'hab) : (8'ha1)) : {(8'h9f)})} + {(((8'hbd) ? (8'ha2) : (8'had)) < ((8'hab) != (8'hbd)))})), 
parameter param12 = (((((~&param11) ? ((8'hb6) * param11) : (+param11)) | param11) <= {param11, ((^param11) ~^ (param11 <<< param11))}) > param11))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire5, reg10, (1'h0)};
  assign wire5 = ($unsigned(wire0[(5'h11):(4'h9)]) ?
                     $signed(wire2) : wire1[(1'h0):(1'h0)]);
  assign wire6 = wire5[(1'h0):(1'h0)];
  assign wire7 = (((~{(wire0 != wire6)}) & (~$signed(wire4))) - wire1);
  assign wire8 = ($unsigned($unsigned(($unsigned(wire7) ?
                         ((8'hb6) * (8'hb8)) : (wire7 > (8'ha8))))) ?
                     ($signed((~|$signed(wire7))) ?
                         ((^wire5[(2'h2):(1'h1)]) ?
                             (+(wire5 == wire5)) : wire5) : $signed($signed((+wire1)))) : wire4);
  assign wire9 = ($signed(wire4) ?
                     ((|{(!wire0), $unsigned(wire5)}) ?
                         (8'h9e) : wire2[(3'h5):(2'h3)]) : {({wire4[(2'h2):(2'h2)]} ?
                             wire5[(1'h0):(1'h0)] : wire6),
                         $signed((8'ha3))});
  always
    @(posedge clk) begin
      reg10 <= $unsigned({(~&($signed(wire4) < (^(8'hbe)))),
          (|(wire2 ^~ wire4[(1'h1):(1'h1)]))});
    end
endmodule

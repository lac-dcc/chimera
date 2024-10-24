module top #(parameter param31 = (8'ha0)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire27;
  assign y = {wire30, wire29, wire4, wire27, (1'h0)};
  assign wire4 = {(^(~&(+$unsigned((8'h9e))))),
                     ((((wire1 | wire1) ? wire1 : (wire0 ? (8'h9e) : (8'hae))) ?
                             $unsigned(wire1[(5'h12):(4'hc)]) : wire1[(3'h4):(1'h1)]) ?
                         {($signed(wire2) ? wire0 : $signed(wire1))} : wire0)};
  module5 #() modinst28 (wire27, clk, wire3, wire2, wire1, wire4, wire0);
  assign wire29 = (^wire0[(3'h6):(3'h6)]);
  assign wire30 = $unsigned((!(^$signed((~(8'ha3))))));
endmodule

module module5
#(parameter param26 = ((((8'hba) ? ({(8'ha1)} - ((8'ha3) ? (7'h41) : (7'h41))) : (!((8'ha2) ? (8'hbd) : (8'hb3)))) ? ((((8'ha6) >> (8'hba)) ? ((8'haf) ? (8'hb1) : (8'haf)) : ((8'h9c) ~^ (8'hba))) ^~ (((8'hbe) ? (8'hbb) : (8'h9e)) && (!(8'ha6)))) : {(((7'h40) ? (8'h9d) : (8'hbf)) ? (^(8'hb9)) : (^(8'hb6)))}) <<< (-(&(8'ha9)))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire11;
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 reg18,
                 reg17,
                 reg16,
                 reg12,
                 (1'h0)};
  assign wire11 = (+wire6);
  always
    @(posedge clk) begin
      reg12 <= (^~(+wire11));
    end
  assign wire13 = wire6[(1'h0):(1'h0)];
  assign wire14 = wire13;
  assign wire15 = {((($unsigned(wire6) ?
                              $signed(wire9) : wire6[(1'h1):(1'h0)]) <= $unsigned($unsigned(wire7))) ?
                          (|($signed(wire11) ?
                              (reg12 ~^ wire9) : {wire10})) : wire10[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg16 <= $signed(($signed(wire8) ?
          wire9 : {$signed(reg12), $signed($signed(wire10))}));
      reg17 <= (($unsigned(((wire14 ? wire13 : wire10) ^~ $unsigned(wire15))) ?
              ($signed((8'h9c)) ?
                  $unsigned(wire9[(2'h3):(1'h1)]) : wire11[(1'h0):(1'h0)]) : wire9[(2'h3):(1'h1)]) ?
          $signed($signed($signed((-wire15)))) : $unsigned(wire15));
      reg18 <= $signed(wire13);
    end
  assign wire19 = $signed((wire8 ?
                      (((~|reg16) ? (wire13 >>> wire13) : {reg12, wire8}) ?
                          wire8 : {(!reg18), wire11}) : reg17));
  assign wire20 = (!(|({$unsigned(reg18)} ?
                      reg17[(4'he):(3'h4)] : ($signed(wire19) ^~ (^~wire7)))));
  assign wire21 = reg17;
  assign wire22 = ((!reg12) ? $signed($signed(wire9[(1'h1):(1'h1)])) : wire6);
  assign wire23 = wire8[(4'h9):(4'h9)];
  assign wire24 = wire7[(1'h1):(1'h0)];
  assign wire25 = ((+$unsigned($signed($signed((8'hbd))))) ?
                      (wire7 ?
                          wire14[(4'he):(4'hd)] : $unsigned((8'hbd))) : {(!(+$signed(wire10))),
                          (wire6 ?
                              wire10[(3'h6):(2'h3)] : $unsigned(wire23[(3'h7):(2'h3)]))});
endmodule

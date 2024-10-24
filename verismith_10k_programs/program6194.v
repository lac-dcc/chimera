module top
#(parameter param43 = ((((((8'hae) << (7'h41)) ? {(7'h40)} : ((8'ha1) ? (8'hbe) : (8'hb4))) <= {(~^(8'hba)), (8'haa)}) | (({(8'ha3), (8'h9f)} >> ((7'h41) ? (8'hb4) : (8'hb6))) | (((8'hbf) >= (8'ha3)) ? ((7'h40) ? (7'h43) : (8'hbd)) : ((8'hbc) < (7'h41))))) != {(~^({(8'ha0), (8'hab)} ? (^~(8'hae)) : {(8'haa)})), {{((8'hbc) == (8'hac))}}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire34;
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire34,
                 (1'h0)};
  assign wire4 = ($signed($unsigned((wire2[(1'h0):(1'h0)] >> wire3))) + ((($unsigned(wire2) == {wire3,
                         (8'hb6)}) ?
                     $signed(wire3[(3'h7):(3'h5)]) : $unsigned($unsigned(wire1))) - wire0[(1'h0):(1'h0)]));
  assign wire5 = wire4[(2'h2):(1'h0)];
  assign wire6 = wire1[(2'h2):(2'h2)];
  assign wire7 = ((8'ha1) ?
                     (~^$signed($unsigned((wire6 ?
                         wire0 : wire5)))) : $unsigned({((wire2 ?
                                 wire5 : wire0) ?
                             $unsigned(wire3) : $unsigned(wire0))}));
  assign wire8 = (-$signed($unsigned((8'ha0))));
  assign wire9 = (((8'hab) ?
                     $unsigned(wire3[(2'h2):(1'h1)]) : wire1[(2'h2):(1'h0)]) <<< $signed(wire3[(4'hf):(4'hf)]));
  assign wire10 = $signed(($unsigned((~&wire1)) + $signed($signed($unsigned((8'ha6))))));
  assign wire11 = (~|$signed(wire10));
  assign wire12 = (wire7[(1'h1):(1'h1)] ? wire5[(3'h7):(2'h2)] : (8'ha8));
  assign wire13 = {wire5};
  assign wire14 = $signed(wire0);
  assign wire15 = $unsigned(wire2);
  module16 #() modinst35 (.wire19(wire6), .clk(clk), .wire17(wire2), .wire18(wire10), .wire20(wire5), .y(wire34), .wire21(wire12));
  assign wire36 = ((wire7[(2'h2):(1'h1)] & $unsigned(wire15)) > {(((~|wire6) ?
                              {wire9, wire3} : $unsigned((8'h9d))) ?
                          (~^((8'hae) ?
                              (8'hb2) : wire4)) : $signed(wire14[(3'h4):(2'h3)]))});
  assign wire37 = ({wire1, wire15[(3'h4):(2'h2)]} ? (~&wire10) : wire12);
  assign wire38 = {(&{wire0, (|wire4[(4'h8):(3'h7)])})};
  assign wire39 = (~((^~wire38) ?
                      ($unsigned(wire10) < wire13[(4'hf):(4'hb)]) : $unsigned({$unsigned(wire37),
                          (wire38 * (8'ha6))})));
  assign wire40 = $signed({wire5[(3'h6):(1'h0)]});
  assign wire41 = wire40[(4'hd):(2'h3)];
  assign wire42 = wire2[(5'h14):(4'h8)];
endmodule

module module16
#(parameter param32 = ({(+((|(8'ha1)) ? ((8'hb4) ? (8'hb2) : (8'ha8)) : ((7'h43) ? (8'h9d) : (8'hbe))))} ? ((8'hb1) ? (+(^((8'haa) & (8'hab)))) : {({(8'ha9)} < ((8'haf) == (7'h43))), (!{(8'hb8), (8'hbe)})}) : (({((8'hb4) ? (8'h9e) : (8'ha6))} >> ({(8'hb0), (8'hba)} - (|(8'ha8)))) + ({{(8'hb8)}} == (!((8'hb5) + (8'hbc)))))), 
parameter param33 = {{(-(param32 == (^~param32))), (!((param32 ~^ param32) <= (param32 ? (8'hb3) : param32)))}, (7'h42)})
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg23,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= wire17[(4'hc):(4'h9)];
      reg23 <= (wire18 != {wire19[(3'h5):(1'h1)],
          {((wire21 ? wire18 : reg22) ?
                  wire21[(3'h7):(3'h6)] : (wire20 ? reg22 : wire21)),
              (8'ha7)}});
    end
  assign wire24 = $signed(wire20);
  assign wire25 = $signed(((~((reg22 ?
                      (8'hb4) : wire18) != (wire24 & (8'hb7)))) && (8'ha4)));
  assign wire26 = $unsigned($unsigned($unsigned((wire20 ?
                      (~|wire17) : $signed(reg22)))));
  always
    @(posedge clk) begin
      reg27 <= wire24;
      reg28 <= $signed(wire21[(4'h8):(1'h1)]);
      reg29 <= $unsigned($signed($unsigned(((reg27 ~^ wire19) & $signed(wire26)))));
      reg30 <= $unsigned(($signed($unsigned((8'hb0))) ?
          (reg27 ?
              ($signed(reg23) ?
                  {wire25} : wire17) : reg23) : (|(+(reg22 * wire19)))));
      reg31 <= (wire20[(2'h2):(1'h0)] == (((^~(wire24 >= reg29)) >> {(^wire17),
              (8'ha8)}) ?
          $unsigned(((&reg28) ? (+(8'ha3)) : {reg29})) : (((wire21 ?
                  wire18 : reg29) || (wire25 ~^ (7'h40))) ?
              (wire18 ?
                  $signed((8'hb2)) : $signed(wire20)) : ((&wire17) * reg27))));
    end
endmodule

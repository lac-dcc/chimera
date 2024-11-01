module top
#(parameter param38 = {((8'h9e) ? ((((8'hb5) | (8'ha6)) && {(8'hbf), (8'ha7)}) == (+((8'hb3) ? (8'hb9) : (8'h9f)))) : (8'hbe))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire21;
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 wire21,
                 reg36,
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire5 = {wire0};
  module6 #() modinst22 (.wire11(wire2), .wire7(wire0), .clk(clk), .y(wire21), .wire9(wire3), .wire10(wire5), .wire8(wire4));
  assign wire23 = (8'hbd);
  assign wire24 = wire0;
  assign wire25 = $signed((8'hb9));
  assign wire26 = (8'hb4);
  always
    @(posedge clk) begin
      reg27 <= $signed({$signed($signed(wire4))});
    end
  always
    @(posedge clk) begin
      reg28 <= (^(wire5 + {((wire26 ? wire2 : wire2) > (7'h41))}));
      reg29 <= wire24;
      reg30 <= ((wire24 ?
          ((wire4[(2'h2):(1'h1)] ?
              $signed((8'ha8)) : (wire23 >>> wire21)) <= ($unsigned(wire0) >= (wire2 ?
              reg28 : wire1))) : (8'hbf)) >>> $unsigned((&((&wire5) < (wire3 ?
          wire0 : wire24)))));
    end
  assign wire31 = reg28;
  assign wire32 = $signed((^(^$unsigned($signed(wire21)))));
  assign wire33 = $unsigned(wire3[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg34 <= ((8'hbf) ? wire23 : (&wire32));
      reg35 <= (|{$signed(wire24[(2'h3):(1'h1)]),
          ({{wire23, reg30}, $signed((8'had))} ?
              $unsigned((reg27 ? wire2 : reg28)) : {reg28[(2'h3):(1'h1)]})});
      reg36 <= $unsigned($unsigned((wire4[(5'h11):(3'h6)] - (8'ha6))));
    end
  assign wire37 = ((((&((7'h44) ? wire23 : wire5)) ^~ $signed((^~wire32))) ?
                          (((-wire0) > (wire2 << wire26)) ^ (8'hab)) : ({{reg35,
                                      wire2}} ?
                              (!wire4) : reg35[(3'h5):(3'h4)])) ?
                      $signed($unsigned($signed(wire21[(1'h1):(1'h0)]))) : $signed($unsigned((^~wire32[(2'h2):(1'h1)]))));
endmodule

module module6
#(parameter param19 = (&({(^(+(8'hbc)))} << (~(&((8'ha0) >>> (8'ha4)))))), 
parameter param20 = (|param19))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  assign y = {wire18, wire17, wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = $signed(wire11);
  assign wire13 = (|(-wire10[(1'h0):(1'h0)]));
  assign wire14 = (!wire12);
  assign wire15 = wire10[(4'ha):(4'h8)];
  assign wire16 = (wire11 ?
                      ((8'had) ?
                          ($unsigned({wire12}) >> (wire10 ?
                              (wire9 ^ (7'h40)) : wire7[(3'h6):(3'h5)])) : wire14) : wire8[(4'he):(2'h2)]);
  assign wire17 = wire8[(4'hd):(4'h8)];
  assign wire18 = ($signed($signed(wire15)) ?
                      $unsigned($signed($unsigned($unsigned(wire11)))) : (-{$signed($unsigned(wire7))}));
endmodule

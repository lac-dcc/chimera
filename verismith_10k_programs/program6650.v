module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire5 = $unsigned((({wire1[(4'hd):(4'h8)],
                     wire4[(4'hd):(4'ha)]} < ((wire3 ? (8'hba) : wire4) ?
                     $unsigned(wire0) : {wire2})) < wire4[(2'h2):(1'h0)]));
  assign wire6 = (&wire4);
  assign wire7 = wire1[(3'h4):(1'h0)];
  assign wire8 = $unsigned($unsigned(wire5));
  assign wire9 = (~^wire4);
  assign wire10 = $unsigned(wire2);
  module11 #() modinst30 (wire29, clk, wire7, wire10, wire0, wire6);
  assign wire31 = (wire8 > (wire29[(2'h3):(2'h3)] ~^ ((^(!wire5)) > ($unsigned(wire1) ?
                      wire2[(4'he):(4'hd)] : wire6))));
  assign wire32 = (wire31 | (wire7 & {$signed((|wire29))}));
  assign wire33 = $unsigned($unsigned(wire31));
  always
    @(posedge clk) begin
      reg34 <= $unsigned((7'h42));
      reg35 <= ({(-wire3), wire1[(4'ha):(4'ha)]} >> (8'hbc));
      reg36 <= wire6;
    end
  assign wire37 = {(8'haa)};
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire16;
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire16,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire16 = wire13;
  always
    @(posedge clk) begin
      reg17 <= $signed(wire15);
      reg18 <= $unsigned(wire16);
      reg19 <= $signed($unsigned((+reg18[(2'h3):(2'h3)])));
    end
  assign wire20 = $unsigned($signed(wire16));
  assign wire21 = (8'hbb);
  assign wire22 = ((!(^~((!reg17) ^~ {reg18, (8'hbe)}))) ?
                      {($unsigned($signed(wire21)) ?
                              (wire14[(4'h8):(3'h7)] > (wire20 ?
                                  wire13 : reg19)) : (!(wire14 < wire16))),
                          wire12} : ($signed(wire21[(3'h6):(3'h6)]) > $signed(($signed((8'haf)) & (-reg18)))));
  assign wire23 = (~^reg19[(2'h3):(1'h0)]);
  assign wire24 = (wire15[(1'h1):(1'h0)] ?
                      $signed((($unsigned(reg18) ^~ wire23) ?
                          $unsigned($signed(wire21)) : {(wire15 == wire22)})) : {{(8'ha1)}});
  assign wire25 = (((-(^(8'hbe))) ?
                          reg19[(3'h6):(3'h4)] : {((|wire21) ?
                                  $signed(reg17) : (reg17 + wire23))}) ?
                      (8'ha7) : $signed({$signed((reg17 ? wire24 : wire22))}));
  assign wire26 = wire15;
  assign wire27 = $unsigned($signed({{((8'h9e) ? wire25 : wire14)},
                      (~|((8'ha0) >> reg19))}));
  assign wire28 = ((^(+$unsigned($signed(wire25)))) ?
                      wire24[(3'h6):(3'h6)] : $signed($signed((~wire25[(3'h4):(3'h4)]))));
endmodule

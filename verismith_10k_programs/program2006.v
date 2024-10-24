module top
#(parameter param75 = (((~|(((7'h42) | (8'hba)) + (~|(8'hab)))) ? {{(~|(8'hba)), (-(8'hbb))}, (~&((8'hbc) * (8'h9c)))} : ((8'had) ? ({(8'hae), (8'hb0)} ? ((7'h41) ? (8'hb7) : (8'ha6)) : ((8'hac) * (8'hb4))) : {((7'h41) * (8'ha9)), (~&(8'hae))})) == ((~{(^~(8'ha8)), ((8'ha3) > (8'ha6))}) * ((!(~&(8'had))) ? (((8'ha0) > (8'ha7)) <<< {(8'hb5), (8'hbe)}) : ((!(8'h9d)) ? ((8'hb2) ^ (8'ha1)) : {(8'hb4), (7'h41)})))), 
parameter param76 = ((((~^(param75 ? param75 : param75)) >>> param75) ? param75 : {({param75} ^ (param75 != param75))}) >> param75))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire66;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire40,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire66,
                 (1'h0)};
  module5 #() modinst41 (.wire7(wire3), .wire8(wire2), .clk(clk), .wire6(wire0), .wire9(wire4), .y(wire40));
  assign wire42 = ($signed(({(wire1 << wire1)} - (+wire1[(4'h9):(3'h6)]))) <= wire4[(3'h6):(1'h0)]);
  assign wire43 = wire40[(4'h8):(3'h6)];
  assign wire44 = (wire40 ?
                      (^~(((!wire4) ? wire4 : wire3[(4'hd):(2'h3)]) ?
                          wire42 : {wire0[(4'hb):(3'h5)]})) : (-{((wire3 > wire1) ?
                              (~|wire0) : (|(8'ha5))),
                          ((~^wire3) ? $signed(wire42) : $signed((8'ha0)))}));
  assign wire45 = (wire43 <= {wire44[(4'hc):(4'hb)]});
  assign wire46 = wire1[(4'h9):(3'h6)];
  assign wire47 = $signed(wire4[(3'h6):(2'h3)]);
  assign wire48 = wire40;
  assign wire49 = wire48[(1'h0):(1'h0)];
  module50 #() modinst67 (wire66, clk, wire48, wire44, wire2, wire40, wire43);
  assign wire68 = {((^~{wire1}) ?
                          $unsigned($unsigned((wire46 ?
                              wire42 : (8'haa)))) : wire1),
                      {($signed((wire48 < wire44)) * $signed(wire44)),
                          wire0[(3'h7):(1'h1)]}};
  assign wire69 = (^(|(wire0 ?
                      {(wire47 ?
                              wire45 : wire49)} : $unsigned(wire4[(3'h7):(2'h3)]))));
  assign wire70 = (~|(~|wire66));
  assign wire71 = (8'hba);
  assign wire72 = ((~(+{$unsigned((8'ha4))})) != wire49);
  assign wire73 = {wire43};
  assign wire74 = (~&$signed($unsigned($signed((wire4 < wire2)))));
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  input wire [(4'h9):(1'h0)] wire52;
  input wire signed [(4'h9):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg61,
                 (1'h0)};
  assign wire56 = ((wire55 & ((~|(wire51 ?
                          wire54 : wire55)) >= $signed((wire53 && wire51)))) ?
                      $unsigned({(|$signed(wire51))}) : $signed((((wire55 <= wire52) ?
                          (wire52 * wire55) : {wire55}) << {wire55[(3'h4):(2'h2)]})));
  assign wire57 = wire55;
  assign wire58 = ({((wire51 ? (-wire53) : wire52[(3'h7):(3'h5)]) ?
                              ($signed((7'h40)) << (wire55 ?
                                  wire55 : (8'had))) : ($unsigned(wire54) || wire55)),
                          ({(wire54 ? wire56 : (8'ha5))} && wire52)} ?
                      wire57 : $unsigned((wire57[(4'hf):(1'h0)] ?
                          wire54[(3'h5):(3'h4)] : ((wire52 ?
                              wire55 : wire53) & wire52[(3'h4):(2'h3)]))));
  assign wire59 = ((^~$unsigned(wire53[(4'hc):(2'h2)])) ?
                      $signed($signed(($signed(wire53) && wire55))) : (^($signed(((7'h43) ?
                          wire55 : wire52)) >>> {(wire52 ? wire53 : wire51)})));
  assign wire60 = (wire58[(3'h4):(2'h2)] ^ wire58[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg61 <= $unsigned($signed({($signed(wire54) ?
              (wire56 >> wire57) : (wire56 != (8'ha4)))}));
    end
  assign wire62 = $unsigned($unsigned(wire56));
  assign wire63 = $unsigned((&wire53));
  assign wire64 = $unsigned(wire60[(3'h4):(1'h1)]);
  assign wire65 = ($unsigned(wire51[(4'h8):(1'h0)]) && wire52[(2'h2):(1'h0)]);
endmodule

module module5
#(parameter param39 = ((&(8'ha3)) ? {{((&(8'hb9)) ? ((7'h43) + (8'hac)) : (~(8'ha4)))}} : (((-((8'hb4) == (8'ha1))) >>> (((8'ha4) | (7'h43)) ? (^(8'hb9)) : ((8'hb6) ~^ (8'hbc)))) + {(((7'h44) ? (8'h9f) : (7'h44)) < {(8'hba)})})))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire34;
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  assign y = {wire36,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire34,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire10 = wire9[(1'h0):(1'h0)];
  assign wire11 = ($signed(wire6[(3'h6):(1'h1)]) ? wire9 : $unsigned(wire8));
  assign wire12 = (8'hbc);
  assign wire13 = wire9[(1'h0):(1'h0)];
  assign wire14 = wire10[(1'h1):(1'h1)];
  module15 #() modinst35 (.wire16(wire11), .clk(clk), .wire19(wire9), .wire18(wire13), .wire17(wire14), .wire20(wire6), .y(wire34));
  assign wire36 = $signed($unsigned(wire14[(5'h11):(1'h1)]));
  always
    @(posedge clk) begin
      reg37 <= (((!wire12[(2'h2):(2'h2)]) ?
          (|$signed((wire8 ?
              wire13 : wire13))) : wire13[(2'h3):(2'h3)]) <<< wire7);
      reg38 <= (&wire11);
    end
endmodule

module module15
#(parameter param32 = {(~^(({(8'haf)} == ((8'ha4) ? (8'hbc) : (8'h9d))) ? {((8'hb7) >> (8'hac)), ((8'had) ^~ (8'hb0))} : (~|((8'hbd) ? (8'ha8) : (8'hb9))))), ((({(8'hb4), (8'hb2)} ? ((8'ha3) ? (8'ha7) : (8'had)) : {(7'h44)}) <<< (|((8'hac) && (8'ha8)))) ? {((~(8'hb6)) >> (&(7'h41)))} : ((~((8'h9d) ? (8'hbe) : (8'hb2))) ? ((^~(8'ha3)) & ((7'h41) ? (8'had) : (8'hb0))) : (((8'ha3) ? (8'ha6) : (8'hab)) ? (~|(8'ha2)) : (~&(8'hae)))))}, 
parameter param33 = param32)
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (^(~^((wire16 ?
                      {wire17,
                          wire19} : (wire16 <<< wire17)) | (wire19[(4'hb):(4'h9)] || $signed(wire20)))));
  assign wire22 = {{wire20[(3'h4):(1'h0)],
                          $signed(($signed(wire21) >= $signed((8'hac))))},
                      {wire17[(5'h12):(5'h11)], wire21[(4'he):(2'h3)]}};
  assign wire23 = wire18[(3'h4):(2'h2)];
  assign wire24 = $signed((&(-wire22)));
  assign wire25 = wire18;
  assign wire26 = $signed(({($signed(wire21) ?
                              wire21[(4'hf):(4'hf)] : (-wire20)),
                          (((8'hbb) ? wire16 : wire24) ?
                              $unsigned(wire21) : (wire18 ? wire18 : wire19))} ?
                      $signed(($signed(wire25) ~^ (wire17 ?
                          wire19 : wire19))) : wire21));
  assign wire27 = (!$signed((((wire18 ^~ wire24) ?
                      (8'hb2) : (-wire17)) ~^ wire22)));
  assign wire28 = (&$unsigned(wire21));
  assign wire29 = wire17[(4'h8):(4'h8)];
  assign wire30 = $signed($unsigned((8'hba)));
  assign wire31 = {$signed(wire22[(4'h8):(1'h1)])};
endmodule

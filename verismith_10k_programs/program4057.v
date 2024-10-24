module top #(parameter param66 = (8'hbd)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire44;
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire62,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire12,
                 wire44,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = {$unsigned($unsigned($unsigned(wire3))),
                     ($signed(wire0) * $unsigned($unsigned($unsigned((8'hb6)))))};
  assign wire5 = (wire4[(2'h2):(1'h1)] * wire1);
  assign wire6 = $unsigned({$signed(($signed(wire1) <<< wire2[(4'hb):(3'h7)])),
                     wire1});
  assign wire7 = (wire4 ? wire0 : wire5[(1'h1):(1'h1)]);
  assign wire8 = wire4[(2'h2):(2'h2)];
  assign wire9 = $signed(wire7[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire2);
    end
  always
    @(posedge clk) begin
      reg11 <= wire3[(1'h1):(1'h0)];
    end
  assign wire12 = ({(|$unsigned(wire9))} ?
                      $unsigned((wire1[(4'h8):(1'h0)] | (!(~^reg11)))) : wire9);
  always
    @(posedge clk) begin
      reg13 <= $signed(($signed((wire2 ?
          (wire6 ?
              (8'ha5) : wire0) : $unsigned(wire6))) || wire4[(2'h3):(2'h3)]));
      reg14 <= reg11;
    end
  module15 #() modinst45 (.clk(clk), .wire17(reg11), .wire18(wire8), .y(wire44), .wire16(wire1), .wire19(wire3));
  module46 #() modinst63 (wire62, clk, wire1, wire5, wire12, reg13, wire4);
  assign wire64 = (reg13[(1'h0):(1'h0)] ^~ (wire9 ?
                      $unsigned(((~|wire5) ?
                          (wire12 || wire3) : (wire0 ?
                              reg13 : wire9))) : (wire44[(1'h0):(1'h0)] >= wire2[(4'h9):(4'h9)])));
  assign wire65 = (-$unsigned((~&wire12)));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire signed [(3'h7):(1'h0)] wire50;
  input wire [(3'h4):(1'h0)] wire49;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire signed [(5'h14):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  assign y = {wire61,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg54,
                 (1'h0)};
  assign wire52 = ($signed(wire51[(4'ha):(1'h1)]) >> (((8'hb4) ?
                      {{wire51}} : $unsigned((wire50 ?
                          wire50 : wire47))) - (((~^wire49) - $signed(wire50)) != wire50[(1'h1):(1'h1)])));
  assign wire53 = $signed((|wire52));
  always
    @(posedge clk) begin
      reg54 <= $signed(wire50[(3'h5):(1'h0)]);
    end
  assign wire55 = {{$signed($signed(wire51)), wire51},
                      ((wire51 ?
                              wire53 : $signed((wire47 ? wire49 : (8'hb3)))) ?
                          ((wire53[(4'h8):(3'h4)] ~^ wire47[(1'h1):(1'h1)]) ?
                              ($signed(wire48) ?
                                  reg54 : wire53[(2'h3):(1'h0)]) : ({wire53,
                                      wire48} ?
                                  $signed((8'hbd)) : (^~reg54))) : wire47)};
  assign wire56 = ($unsigned(({(wire53 ? wire49 : wire55), wire53} ?
                          reg54 : (~$unsigned(wire52)))) ?
                      ($unsigned(wire48[(2'h2):(1'h1)]) ?
                          wire48[(1'h1):(1'h0)] : $signed(((+(8'ha4)) >= wire51[(5'h12):(4'ha)]))) : {(((8'hb6) <= $signed(wire49)) <= $unsigned((8'hb1))),
                          (-$signed($signed(wire55)))});
  always
    @(posedge clk) begin
      reg57 <= (wire49[(2'h3):(2'h3)] >> ($unsigned({$unsigned((8'h9d))}) ?
          wire52[(3'h6):(3'h5)] : (~|wire49[(1'h1):(1'h0)])));
      reg58 <= ((+wire48[(2'h2):(2'h2)]) >> $signed(wire55[(2'h2):(2'h2)]));
      reg59 <= ($signed((($unsigned(wire48) ?
          (8'hac) : wire52) & ($unsigned(wire51) || (wire53 & wire47)))) ^ wire51[(5'h15):(4'h8)]);
      reg60 <= $unsigned(wire48[(2'h2):(2'h2)]);
    end
  assign wire61 = $unsigned($unsigned($signed((~wire53[(1'h0):(1'h0)]))));
endmodule

module module15
#(parameter param43 = (|(((~((8'ha6) ? (8'hb8) : (8'hb6))) ^ {((7'h44) && (7'h40)), {(8'ha7), (8'ha5)}}) > ((!((7'h40) ^~ (8'ha9))) ? (((8'hb3) ? (8'ha2) : (7'h40)) ? ((7'h43) > (8'hb6)) : (~&(8'ha8))) : (!((8'hbb) <<< (8'hbe)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire20;
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg31,
                 reg30,
                 reg21,
                 (1'h0)};
  assign wire20 = (~^wire19);
  always
    @(posedge clk) begin
      reg21 <= wire19;
    end
  assign wire22 = $signed($signed(({$signed(wire17)} ~^ wire19[(4'hb):(3'h4)])));
  assign wire23 = reg21[(3'h6):(1'h0)];
  assign wire24 = ($unsigned($signed((-wire23))) * ($unsigned(wire18[(3'h6):(2'h3)]) | wire18));
  assign wire25 = wire24[(3'h7):(2'h2)];
  assign wire26 = wire16;
  assign wire27 = wire26;
  assign wire28 = (wire18 ?
                      $unsigned(({(wire20 ? wire17 : wire26),
                          {wire20, reg21}} >> ((wire24 ?
                          wire26 : (8'hb7)) * (wire18 ?
                          (8'ha2) : wire24)))) : wire27[(1'h1):(1'h0)]);
  assign wire29 = $signed($signed((|$signed(wire18))));
  always
    @(posedge clk) begin
      reg30 <= ($unsigned($signed((~&$signed(wire25)))) > reg21);
      reg31 <= $unsigned((wire23[(3'h4):(2'h2)] ^ wire27[(4'h8):(4'h8)]));
    end
  assign wire32 = wire26[(3'h7):(2'h3)];
  assign wire33 = reg31;
  assign wire34 = $unsigned((8'hb6));
  assign wire35 = (wire28[(4'he):(4'hd)] >> $unsigned(wire18[(2'h3):(2'h2)]));
  assign wire36 = $unsigned((^(((|wire16) ^ (+wire20)) ?
                      ({(8'hb8),
                          wire27} * $signed(reg21)) : (wire24[(5'h15):(4'hb)] ?
                          wire26 : (8'ha4)))));
  assign wire37 = wire20;
  assign wire38 = (wire34[(1'h1):(1'h0)] <<< (wire33 ^~ $signed(reg31[(3'h7):(1'h0)])));
  always
    @(posedge clk) begin
      reg39 <= (+(8'hb3));
      reg40 <= $unsigned((wire35[(5'h10):(4'hf)] ?
          ($signed((~wire16)) ?
              (reg21 ~^ wire23[(4'hd):(4'hd)]) : $unsigned($signed(wire19))) : $unsigned(({reg30} & {wire16,
              wire19}))));
      reg41 <= ((~^wire29) ? wire17[(5'h10):(4'ha)] : wire37[(2'h2):(2'h2)]);
      reg42 <= ($unsigned((($unsigned(wire34) + {wire23}) <= reg39)) != $unsigned((^~(8'ha6))));
    end
endmodule

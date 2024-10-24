module top
#(parameter param73 = (7'h40))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire42;
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire18,
                 wire20,
                 wire42,
                 reg44,
                 reg45,
                 reg46,
                 reg54,
                 (1'h0)};
  module5 #() modinst19 (wire18, clk, wire2, wire3, wire4, wire0, wire1);
  assign wire20 = $signed($unsigned($signed($unsigned(wire18[(4'h9):(1'h0)]))));
  module21 #() modinst43 (.wire24(wire1), .wire23(wire3), .wire26(wire20), .y(wire42), .wire22(wire0), .clk(clk), .wire25(wire2));
  always
    @(posedge clk) begin
      reg44 <= (8'ha7);
      reg45 <= $signed($signed(({((8'ha6) ? wire18 : wire18)} ?
          (~&wire2[(2'h2):(1'h1)]) : {$unsigned(wire3)})));
      reg46 <= wire20[(2'h2):(1'h1)];
    end
  assign wire47 = wire1[(3'h7):(3'h6)];
  assign wire48 = wire1[(3'h6):(2'h2)];
  assign wire49 = (7'h44);
  assign wire50 = $signed($signed(wire4));
  assign wire51 = (~|$unsigned($signed($signed((wire49 ? reg46 : (8'h9f))))));
  assign wire52 = $signed(wire4[(1'h1):(1'h1)]);
  assign wire53 = wire3;
  always
    @(posedge clk) begin
      reg54 <= (+(8'hab));
    end
  assign wire55 = wire42;
  assign wire56 = wire0;
  module57 #() modinst71 (wire70, clk, wire51, wire55, wire1, reg46, wire50);
  assign wire72 = (!$unsigned((!wire56)));
endmodule

module module57
#(parameter param69 = ((^{{((8'had) ? (8'ha7) : (8'hab)), (~^(8'hb9))}}) & (~^{((!(7'h41)) ? ((8'hbb) >> (8'hb9)) : ((8'h9e) ? (7'h42) : (8'hb4))), (-((8'haa) ? (8'ha5) : (8'ha3)))})))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire62;
  input wire [(5'h12):(1'h0)] wire61;
  input wire signed [(4'ha):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire [(4'hc):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire63;
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  assign y = {wire68, wire67, wire63, reg66, reg65, reg64, (1'h0)};
  assign wire63 = $signed((+$unsigned(((&(8'ha2)) ?
                      $signed((8'hbe)) : $signed((8'ha9))))));
  always
    @(posedge clk) begin
      reg64 <= (|($unsigned($signed((wire59 < wire63))) ?
          wire58 : (~&($signed(wire63) ?
              (wire59 - wire59) : (wire60 << (8'ha7))))));
      reg65 <= $signed($signed((~$signed({wire59, wire58}))));
      reg66 <= $signed(wire60);
    end
  assign wire67 = ((((^$signed((8'hb9))) || $unsigned((wire63 & wire58))) ?
                      ($signed((&wire59)) >> ((reg65 ?
                          reg64 : wire59) & (reg65 - wire61))) : $signed(wire61)) <<< ($signed(wire62[(3'h5):(3'h5)]) ?
                      ((&(wire61 ?
                          reg66 : wire59)) | $signed($unsigned(wire63))) : ((((7'h43) >= reg66) && (~^wire58)) ?
                          ((7'h44) - $unsigned(wire60)) : ((wire62 < wire60) <<< $signed((8'hb7))))));
  assign wire68 = ($unsigned(($unsigned($signed(wire62)) << reg66[(1'h1):(1'h1)])) ?
                      $signed((7'h40)) : ($unsigned(reg65[(2'h2):(1'h1)]) ?
                          $signed($signed(((8'hbb) > reg65))) : $signed({$unsigned(reg66),
                              (|wire61)})));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  input wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire27;
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 reg28,
                 (1'h0)};
  assign wire27 = $unsigned($signed((wire25[(2'h2):(1'h1)] ?
                      wire22[(1'h0):(1'h0)] : (~^wire23))));
  always
    @(posedge clk) begin
      reg28 <= $unsigned((&(!(~|{wire23, wire23}))));
    end
  assign wire29 = $unsigned((((~|{(8'hb5)}) && {(reg28 ? wire23 : wire27),
                          wire27[(4'he):(2'h3)]}) ?
                      reg28 : $signed((wire26 ?
                          $signed(reg28) : (wire22 || reg28)))));
  assign wire30 = wire22;
  assign wire31 = ($signed(wire23) >>> wire26[(3'h6):(1'h0)]);
  assign wire32 = $signed(reg28[(1'h0):(1'h0)]);
  assign wire33 = wire30;
  assign wire34 = ($unsigned((8'had)) << reg28);
  assign wire35 = (8'haa);
  assign wire36 = $unsigned(((wire30 ?
                          wire34 : ({wire24, wire26} ?
                              wire24 : (wire27 ~^ reg28))) ?
                      $unsigned((|$unsigned(wire34))) : ((^~((8'ha2) ?
                          wire32 : wire33)) >>> $signed((-wire33)))));
  assign wire37 = $unsigned({(wire27[(3'h6):(3'h6)] < ((~|wire34) ?
                          (~^wire32) : ((8'hb8) >> wire29))),
                      {{wire25[(3'h6):(3'h6)], (wire36 > wire30)},
                          ((wire33 ? (8'ha6) : wire27) & (wire36 << wire23))}});
  assign wire38 = ((~&$signed(wire24)) > (({(wire24 ^~ (7'h42)), (8'hb9)} ?
                          ($unsigned(wire26) << (!wire23)) : {(!wire32)}) ?
                      $signed(($signed(wire35) ?
                          (wire37 ~^ wire32) : $signed(wire31))) : wire29));
  assign wire39 = $signed(wire33[(3'h4):(1'h0)]);
  assign wire40 = $unsigned(wire37);
  assign wire41 = ((~$signed(wire27)) + $signed(($unsigned((|wire22)) - wire34)));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire11;
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire17, wire16, wire15, wire14, wire13, wire11, reg12, (1'h0)};
  assign wire11 = $signed((({{wire8}, $unsigned(wire8)} ?
                          $unsigned(wire6) : wire10) ?
                      $unsigned({(|wire8), wire9[(4'h9):(2'h2)]}) : wire9));
  always
    @(posedge clk) begin
      reg12 <= ((~|(~^$unsigned((wire10 ^~ wire8)))) ?
          ($signed($unsigned($unsigned((8'hb7)))) ?
              $unsigned((!wire6)) : $signed((wire7[(4'ha):(3'h4)] ?
                  $signed(wire11) : wire10[(3'h7):(3'h5)]))) : ({(wire8[(1'h0):(1'h0)] < $signed(wire9)),
                  wire9} ?
              (wire10[(2'h3):(1'h0)] ?
                  ($unsigned(wire10) ?
                      {(8'hab)} : wire6) : $signed($signed((8'ha0)))) : $unsigned($unsigned(wire6[(3'h7):(3'h6)]))));
    end
  assign wire13 = $unsigned({$unsigned($signed((wire6 || wire11))), wire11});
  assign wire14 = {(wire8 ?
                          $signed(((wire7 <= (8'hb0)) * wire10)) : (($unsigned(wire11) ?
                                  $unsigned(wire8) : $unsigned(wire13)) ?
                              (!reg12[(3'h5):(2'h2)]) : ((^~wire11) ^ wire13[(2'h2):(1'h1)])))};
  assign wire15 = $signed(({$unsigned((wire7 ? wire6 : (8'ha9))),
                          (wire14[(3'h4):(2'h2)] ?
                              {wire7} : wire6[(3'h7):(2'h3)])} ?
                      wire8 : (wire7 >> wire6)));
  assign wire16 = ($signed((((8'ha7) ?
                          ((8'hbe) ?
                              wire9 : wire14) : wire13[(3'h7):(2'h3)]) ~^ wire6[(1'h0):(1'h0)])) ?
                      ({wire7[(4'ha):(4'h8)], $signed($unsigned(wire8))} ?
                          reg12[(1'h1):(1'h0)] : wire15) : $unsigned({$unsigned((wire7 ?
                              wire9 : wire13)),
                          {wire13}}));
  assign wire17 = wire8;
endmodule

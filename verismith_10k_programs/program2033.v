module top
#(parameter param76 = (~(~&((((8'haf) ^ (8'ha0)) ? ((8'hb9) ? (8'hb6) : (8'ha5)) : {(8'hbf), (8'hbb)}) ? (~^((8'hb1) >= (8'hb1))) : (+((8'hae) != (8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire55;
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  assign y = {wire75,
                 wire71,
                 wire70,
                 wire55,
                 reg74,
                 reg73,
                 reg72,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  module5 #() modinst56 (wire55, clk, wire4, wire1, wire0, wire3);
  always
    @(posedge clk) begin
      reg57 <= {wire2[(2'h2):(1'h0)],
          $signed($signed($signed((wire3 + wire0))))};
      reg58 <= $signed($signed($unsigned($signed(wire3))));
      reg59 <= $unsigned($unsigned($signed($unsigned($signed(wire55)))));
      if (reg57)
        begin
          reg60 <= $signed($signed(wire2[(2'h2):(2'h2)]));
        end
      else
        begin
          if ($unsigned((8'hb5)))
            begin
              reg60 <= (((~^($signed(wire0) ?
                      $signed((8'ha9)) : $unsigned(wire1))) != (~^$unsigned((wire1 ?
                      reg58 : reg57)))) ?
                  ((+{(wire1 ? wire2 : wire1)}) - ({$unsigned(wire1),
                          $signed((8'hbb))} ?
                      (8'h9d) : ((wire1 ?
                          wire1 : reg58) ~^ reg60[(4'h8):(1'h1)]))) : $signed(reg59));
            end
          else
            begin
              reg60 <= (reg59 ?
                  $signed({reg59[(4'hf):(3'h4)],
                      $signed(reg59)}) : $unsigned((!$unsigned((8'hb6)))));
              reg61 <= (~^{((-$signed(wire2)) >= reg57)});
              reg62 <= {wire0, (reg61 < wire4[(1'h1):(1'h1)])};
              reg63 <= ((8'hb3) ?
                  wire2[(2'h2):(1'h0)] : (reg58[(3'h4):(1'h0)] - ($unsigned($signed(reg58)) ?
                      reg58 : ($unsigned(wire4) >>> (reg57 != (8'hba))))));
            end
          reg64 <= $signed((reg57[(5'h12):(5'h11)] ?
              reg61[(1'h0):(1'h0)] : wire3[(4'he):(2'h2)]));
          if (wire0)
            begin
              reg65 <= (reg64 - $signed($unsigned(($signed(reg57) << (reg60 <<< wire2)))));
            end
          else
            begin
              reg65 <= $signed(((((reg58 >= wire1) <= $unsigned(wire0)) == (wire3 ?
                  $signed(wire1) : $unsigned((8'ha3)))) * {wire0}));
              reg66 <= ((((~^reg59) <= ({reg57, wire2} ?
                          (wire2 ^~ reg63) : $signed(reg58))) ?
                      {$unsigned(reg64), wire55} : (((8'hba) ?
                              (!reg58) : (reg62 - reg62)) ?
                          ($signed(reg61) ?
                              $signed(wire1) : $unsigned(reg62)) : ({wire1,
                              (8'hb7)} >= $unsigned(wire1)))) ?
                  (+wire0[(4'h9):(2'h2)]) : (~$signed((~^$unsigned(wire55)))));
            end
          if (reg59[(1'h1):(1'h1)])
            begin
              reg67 <= $unsigned((7'h43));
              reg68 <= reg60;
            end
          else
            begin
              reg67 <= {$unsigned($unsigned(reg65)), (8'ha8)};
              reg68 <= (+{wire0,
                  ($unsigned((reg66 == wire2)) * $unsigned($signed(wire4)))});
            end
        end
      reg69 <= {$unsigned(wire55[(3'h5):(3'h5)]),
          (^(+$unsigned(reg61[(4'he):(4'h8)])))};
    end
  assign wire70 = ((~^reg64[(3'h4):(2'h2)]) - $signed($signed((^reg62[(2'h2):(1'h0)]))));
  assign wire71 = wire1[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg72 <= $unsigned(($unsigned(reg57) ?
          (^~(!(wire1 ? reg61 : wire2))) : $signed(($signed(wire71) ?
              $signed(reg69) : (wire55 ? (8'ha5) : reg69)))));
      reg73 <= ((!$unsigned($unsigned((reg69 + wire55)))) ?
          reg62[(3'h5):(1'h1)] : (8'hab));
      reg74 <= reg68[(3'h6):(1'h1)];
    end
  assign wire75 = $signed(reg64);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= wire6;
    end
  assign wire11 = $unsigned((~^$signed($unsigned($signed(wire8)))));
  assign wire12 = (($signed((reg10 ?
                          $signed(wire6) : ((8'ha3) ?
                              wire11 : wire9))) <<< (!wire8)) ?
                      (wire7[(3'h7):(2'h3)] << (+((wire11 * (7'h43)) ?
                          (~&wire8) : (-wire6)))) : {((wire11[(2'h2):(1'h1)] ?
                              ((8'haa) ?
                                  wire11 : wire6) : (wire8 || reg10)) > wire11[(1'h0):(1'h0)])});
  assign wire13 = wire8[(2'h2):(1'h0)];
  assign wire14 = wire8[(1'h0):(1'h0)];
  assign wire15 = $signed($unsigned((($signed(wire8) ?
                          wire8 : $unsigned(wire12)) ?
                      $unsigned(wire11[(1'h1):(1'h1)]) : (~|(wire7 != reg10)))));
  assign wire16 = (8'hb3);
  module17 #() modinst43 (wire42, clk, reg10, wire12, wire11, wire16, wire9);
  assign wire44 = (wire12[(4'ha):(4'ha)] * wire6[(3'h6):(3'h5)]);
  assign wire45 = wire11;
  assign wire46 = wire15;
  assign wire47 = $signed((8'hbe));
  assign wire48 = (({((wire6 != wire7) + wire9)} ?
                          ((wire16[(1'h0):(1'h0)] << wire45[(4'ha):(4'ha)]) ?
                              (!$unsigned(wire14)) : ((wire13 ^~ wire6) ?
                                  ((8'h9e) & wire42) : $signed(wire45))) : ((^~$signed(wire15)) >> $unsigned((wire46 ?
                              wire9 : (8'hb9))))) ?
                      (+{{(wire12 | wire7)}}) : $unsigned(($signed((&wire11)) ?
                          wire45 : ((7'h44) > (~wire14)))));
  always
    @(posedge clk) begin
      reg49 <= (wire42 <= wire16[(4'h8):(3'h4)]);
      reg50 <= reg10;
      reg51 <= (!wire16);
      reg52 <= (wire11 ?
          (((((8'ha2) ? (7'h43) : wire44) << (wire8 ? wire16 : wire14)) ?
              {(~|wire11)} : (8'haf)) > wire7) : wire14);
    end
  assign wire53 = $unsigned($signed(wire42[(2'h3):(1'h0)]));
  assign wire54 = (&wire13[(1'h0):(1'h0)]);
endmodule

module module17
#(parameter param41 = (~^(((!((8'ha6) ? (8'hb8) : (8'h9c))) << (((8'hac) * (7'h40)) ? ((8'hac) < (8'hae)) : ((8'hb4) ? (8'hbc) : (8'hbe)))) == ((8'hbd) ^ ((^~(8'hbc)) ? ((8'haf) >> (8'ha0)) : ((8'hb3) ? (8'ha6) : (8'ha2)))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(4'hd):(1'h0)] wire20;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg34,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= wire18;
    end
  assign wire24 = wire22[(4'hc):(3'h5)];
  assign wire25 = (8'hb1);
  assign wire26 = (((~wire20[(3'h4):(2'h3)]) ?
                      (((wire24 ? wire24 : wire22) | (wire19 ?
                          wire25 : wire19)) <= $signed((&wire20))) : $signed($unsigned((wire21 - wire21)))) == {(wire18 ?
                          wire19[(1'h0):(1'h0)] : (8'ha1)),
                      wire19[(1'h0):(1'h0)]});
  assign wire27 = $signed((+(+$unsigned((7'h41)))));
  assign wire28 = {(~|(~|(wire22[(4'hc):(2'h3)] ?
                          wire25[(3'h7):(3'h5)] : (~&wire24)))),
                      $unsigned((~^$unsigned(wire26[(1'h1):(1'h1)])))};
  assign wire29 = wire18[(2'h3):(1'h0)];
  assign wire30 = ($signed(wire28[(1'h0):(1'h0)]) ?
                      ($unsigned(wire20) ?
                          reg23[(1'h1):(1'h1)] : wire26) : reg23);
  assign wire31 = (^~($unsigned($unsigned(wire18[(1'h0):(1'h0)])) <= $unsigned(wire25)));
  assign wire32 = ((((7'h43) | {(wire21 ?
                              reg23 : wire19)}) < $signed($signed($unsigned(wire21)))) ?
                      ($signed($unsigned(reg23[(2'h2):(1'h0)])) <= $signed({(-wire26),
                          (wire29 ? wire28 : wire18)})) : ($unsigned({{wire20,
                                  reg23}}) ?
                          wire24 : wire24[(3'h4):(2'h2)]));
  assign wire33 = $signed(wire22);
  always
    @(posedge clk) begin
      reg34 <= $unsigned((8'hb6));
    end
  assign wire35 = wire31;
  assign wire36 = $signed(wire32[(3'h5):(2'h2)]);
  assign wire37 = $unsigned(wire32[(1'h1):(1'h0)]);
  assign wire38 = ($unsigned(((~&$signed(wire20)) ?
                      wire28 : wire25)) << ((wire25[(2'h2):(1'h0)] ?
                          $unsigned(wire22[(4'hb):(2'h2)]) : $unsigned((~^(8'h9d)))) ?
                      $unsigned($unsigned($signed(wire35))) : $unsigned(((~wire28) ?
                          (~wire22) : wire18[(1'h1):(1'h1)]))));
  assign wire39 = (|$signed((($unsigned(wire32) ?
                      (reg23 ?
                          reg23 : wire27) : wire38[(5'h12):(4'hc)]) <= wire28[(3'h6):(2'h3)])));
  assign wire40 = wire39[(1'h1):(1'h0)];
endmodule

module top
#(parameter param89 = {(^(^~(~|((8'haf) ? (8'ha9) : (8'hb2)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire42;
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire61,
                 wire42,
                 reg82,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  module4 #() modinst43 (.wire7(wire2), .y(wire42), .wire6(wire1), .wire5(wire0), .wire9((8'ha2)), .clk(clk), .wire8(wire3));
  always
    @(posedge clk) begin
      if ((wire0 ?
          $signed(((wire2[(4'hf):(2'h3)] ?
              (^~wire1) : wire1) >= (wire1 ~^ {wire3}))) : wire1[(4'h9):(4'h9)]))
        begin
          reg44 <= (!$signed(wire0[(1'h0):(1'h0)]));
          reg45 <= $unsigned((wire0 ?
              ({{wire2},
                  reg44} > ({wire0} < wire3[(3'h4):(3'h4)])) : ((+$signed(wire1)) ?
                  ($unsigned(wire42) ?
                      wire3 : wire3[(3'h7):(3'h4)]) : $unsigned((wire42 > wire1)))));
          reg46 <= ($unsigned($signed({((8'ha0) <= wire2), (!wire3)})) ?
              (($unsigned($signed(reg44)) ?
                      $unsigned(wire3) : ((wire3 >= wire1) ?
                          wire0[(4'hd):(3'h5)] : wire3)) ?
                  reg44[(3'h6):(2'h3)] : wire1) : $signed(wire2[(4'ha):(3'h6)]));
        end
      else
        begin
          if ($signed(wire42))
            begin
              reg44 <= (~{wire0});
            end
          else
            begin
              reg44 <= $signed(reg46);
              reg45 <= (~&reg44[(3'h6):(3'h5)]);
              reg46 <= $unsigned((8'hbf));
              reg47 <= wire1;
              reg48 <= $unsigned($unsigned($unsigned({(reg47 > reg45),
                  reg46[(2'h3):(2'h2)]})));
            end
          reg49 <= (wire42[(1'h1):(1'h1)] ?
              $unsigned({$unsigned(wire2[(2'h3):(2'h2)]),
                  wire1[(5'h11):(4'he)]}) : ((($unsigned(reg45) > $signed(wire42)) ?
                      $unsigned($signed(reg44)) : wire1[(1'h0):(1'h0)]) ?
                  reg45 : wire1[(3'h6):(3'h5)]));
          if (wire42)
            begin
              reg50 <= (^reg48[(3'h5):(1'h0)]);
              reg51 <= reg48[(5'h12):(1'h0)];
              reg52 <= (reg48 && reg44);
            end
          else
            begin
              reg50 <= wire1[(4'hf):(3'h5)];
            end
        end
      reg53 <= $signed(((reg51 <= $signed((reg45 ? reg45 : wire3))) | {reg49,
          $unsigned((wire3 ? reg44 : reg44))}));
      if (((8'hab) >= {(8'hb6)}))
        begin
          reg54 <= $unsigned(wire3[(4'hc):(4'h8)]);
          if (reg47)
            begin
              reg55 <= $signed({$unsigned($unsigned(((8'hab) ? reg44 : reg47))),
                  reg45});
              reg56 <= ({$signed(((+wire1) && (reg45 + reg54))),
                  reg55[(2'h3):(2'h3)]} <<< ((~^$unsigned({reg55})) ?
                  (reg48 ^ $unsigned($signed(reg45))) : ((7'h40) <<< (^~((8'h9f) ?
                      reg51 : reg54)))));
              reg57 <= (-(reg50 ? (~reg54) : (7'h43)));
              reg58 <= (!(reg48 ?
                  wire0 : $unsigned(((7'h42) >>> (wire42 ? wire0 : (8'ha6))))));
            end
          else
            begin
              reg55 <= (reg57 || wire1[(3'h5):(1'h1)]);
            end
        end
      else
        begin
          reg54 <= $unsigned(reg50[(3'h7):(3'h5)]);
          reg55 <= $unsigned(({(~&(reg51 << wire2))} ?
              reg47 : reg52[(3'h4):(2'h3)]));
          reg56 <= (((reg57[(3'h6):(3'h6)] * reg54[(3'h4):(3'h4)]) || (((wire2 ?
                          wire1 : reg55) ?
                      $unsigned(reg58) : $signed((8'ha9))) ?
                  $unsigned((~reg46)) : ((reg47 <= (8'hae)) ?
                      (^~reg58) : reg58))) ?
              ((^reg56) - $unsigned(wire3)) : (+$unsigned($unsigned($signed(reg45)))));
          reg57 <= $unsigned(($unsigned($signed((reg44 > (8'hb0)))) <<< ((~|reg52) - (reg50[(4'h9):(4'h9)] ?
              (~&reg48) : (wire0 * wire3)))));
        end
      reg59 <= (($signed(wire0) ~^ (+{reg44})) ?
          reg46[(1'h1):(1'h0)] : {reg49[(1'h0):(1'h0)],
              ((reg45[(4'hd):(1'h1)] ?
                  $signed(reg57) : reg56[(3'h4):(3'h4)]) * (reg47[(3'h7):(1'h1)] ?
                  wire0[(1'h1):(1'h0)] : wire42))});
      reg60 <= (7'h43);
    end
  assign wire61 = reg45[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg62 <= wire3;
      if ((~^wire0))
        begin
          if ((+reg48))
            begin
              reg63 <= {reg46, $unsigned(reg44)};
              reg64 <= (reg54 ?
                  ({(^((8'hb4) >= (8'ha5)))} ?
                      reg54[(2'h3):(2'h3)] : reg47) : (($unsigned(reg55[(5'h13):(4'hd)]) ^~ $unsigned($signed((7'h42)))) ?
                      (((reg52 ?
                          reg55 : reg59) > (reg54 << reg52)) ^ wire42[(3'h4):(2'h3)]) : (^~reg55[(5'h15):(3'h6)])));
              reg65 <= wire0;
              reg66 <= ((reg58 ?
                  $signed({(reg59 + reg46)}) : reg47) >= $signed(((reg50 ?
                      (reg45 ? reg64 : reg57) : {reg51, (8'hb0)}) ?
                  $unsigned($signed(reg49)) : $unsigned((reg57 ?
                      reg57 : (8'hbb))))));
              reg67 <= (-$signed({reg52[(1'h1):(1'h0)], (~|(wire1 << wire2))}));
            end
          else
            begin
              reg63 <= (((~&$unsigned((-reg44))) ^~ wire3) <= reg62[(3'h5):(2'h2)]);
              reg64 <= $unsigned(($signed((reg51[(3'h5):(1'h1)] ^ (~^reg57))) ?
                  $signed(({reg54} >= (reg57 & reg64))) : ($unsigned($unsigned(reg65)) >> reg67[(3'h6):(1'h1)])));
              reg65 <= {reg51,
                  ((&reg59[(2'h2):(2'h2)]) ?
                      (|((~|reg57) ? (~&reg57) : reg55)) : (8'ha5))};
            end
          reg68 <= (^~$unsigned($unsigned($signed(reg58[(1'h1):(1'h0)]))));
          if ((reg49 - reg65))
            begin
              reg69 <= ((8'had) ? $signed(reg48) : reg57);
              reg70 <= $unsigned({wire1, reg51});
              reg71 <= reg65[(1'h1):(1'h0)];
            end
          else
            begin
              reg69 <= {((((reg62 ? reg58 : reg51) ?
                          (8'ha9) : reg62[(2'h2):(1'h0)]) ?
                      (wire0[(3'h7):(1'h0)] != (reg68 ?
                          reg70 : reg70)) : reg60[(2'h2):(1'h0)]) >= $signed($unsigned((reg45 >>> reg60))))};
              reg70 <= {reg66[(3'h5):(2'h3)]};
              reg71 <= reg71;
              reg72 <= (((^~$signed((~|reg48))) ?
                      reg47[(2'h2):(2'h2)] : $unsigned((+$signed(reg46)))) ?
                  ((reg50 >= $signed($signed(reg64))) ?
                      reg60 : ($signed($unsigned(wire3)) == (~(reg70 ?
                          reg68 : reg53)))) : $signed($signed({(~(8'hb9))})));
            end
          reg73 <= {reg69[(4'hf):(3'h6)]};
        end
      else
        begin
          reg63 <= (^~((reg60 ?
              (reg56 ? reg48 : (^reg73)) : (~^reg54)) & reg60[(3'h4):(1'h1)]));
        end
      reg74 <= (~&(((reg69[(4'hc):(4'hb)] <= (7'h43)) ~^ (|reg60[(1'h1):(1'h0)])) ^~ $unsigned(reg53)));
    end
  assign wire75 = reg62;
  assign wire76 = (wire2 >= $signed((reg53 ?
                      $unsigned(reg53[(5'h12):(4'he)]) : {$signed(wire3)})));
  assign wire77 = (~&(~({(wire0 - (8'ha3)), (reg49 <= reg48)} ?
                      reg57 : wire61[(3'h6):(2'h3)])));
  assign wire78 = $signed(((wire61[(4'ha):(2'h2)] ?
                      (~&wire3) : ($unsigned((8'ha5)) ?
                          $signed(reg63) : $unsigned(reg57))) >= (wire76 != reg45[(4'h9):(3'h5)])));
  assign wire79 = $signed(($unsigned($unsigned($unsigned(reg72))) ?
                      $signed((8'hbf)) : (^wire0[(1'h1):(1'h1)])));
  assign wire80 = wire1;
  assign wire81 = (((($signed(wire1) - (^~reg45)) * (wire3[(2'h2):(1'h0)] ?
                          ((8'hb3) ? wire1 : reg68) : $signed(reg52))) ?
                      ((reg60[(2'h2):(1'h1)] ?
                          (wire78 ?
                              (8'ha7) : reg49) : $unsigned(reg52)) < (~|wire0[(4'hc):(4'h9)])) : (|($signed(reg54) ?
                          (wire79 ~^ reg60) : {reg60,
                              reg67}))) ^~ ({($signed((8'hba)) | reg66[(2'h3):(1'h0)])} > reg65));
  always
    @(posedge clk) begin
      reg82 <= ($signed($signed(((~&reg62) & {reg69, reg48}))) ?
          ($signed(reg45[(3'h5):(3'h5)]) ~^ (8'ha3)) : reg69[(3'h6):(1'h1)]);
    end
  assign wire83 = {($unsigned($unsigned(reg46)) + $signed((|(reg57 ?
                          (7'h41) : (8'hb6)))))};
  assign wire84 = wire79;
  assign wire85 = reg51[(1'h1):(1'h1)];
  assign wire86 = (^~wire3[(3'h6):(3'h4)]);
  assign wire87 = ({$unsigned(wire83), wire76} ? reg73 : (8'ha0));
  assign wire88 = (wire75 ?
                      wire79 : $signed((($signed(wire77) ^~ (reg50 * (7'h43))) ?
                          $signed($unsigned(reg66)) : ((wire80 ?
                                  wire78 : reg47) ?
                              reg65[(4'he):(4'ha)] : {wire84, reg66}))));
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire5;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire37;
  assign y = {wire41, wire40, wire39, wire10, wire37, (1'h0)};
  assign wire10 = (^~($unsigned(wire8[(4'h8):(3'h5)]) == $signed($signed((wire8 < (8'hbd))))));
  module11 #() modinst38 (.wire16(wire6), .wire13(wire9), .wire12(wire10), .wire15(wire7), .y(wire37), .wire14(wire5), .clk(clk));
  assign wire39 = (~wire37[(3'h4):(1'h0)]);
  assign wire40 = $signed($unsigned(wire6));
  assign wire41 = ($signed({wire37[(1'h1):(1'h1)], {$signed(wire37)}}) ?
                      (($unsigned((~&(8'hb1))) << wire37) ?
                          (&(wire10 == (|(7'h40)))) : wire39) : ({wire5,
                          $signed(wire8)} << $unsigned((wire6 ?
                          ((8'ha2) <= wire40) : (~|wire9)))));
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  assign y = {wire36,
                 wire35,
                 wire34,
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
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 (1'h0)};
  assign wire17 = wire15[(4'hb):(3'h6)];
  assign wire18 = ({{(&wire14), (8'ha6)},
                      (~^$unsigned(wire16[(4'h8):(2'h2)]))} * (-(wire17[(2'h2):(1'h0)] ?
                      $unsigned($signed(wire13)) : $unsigned((~&wire14)))));
  assign wire19 = ((8'hba) * ((~&(^~(wire16 + wire14))) && {$unsigned(wire13[(5'h12):(4'hb)]),
                      $signed($unsigned(wire14))}));
  assign wire20 = wire17[(1'h0):(1'h0)];
  assign wire21 = {wire16[(4'hd):(3'h5)], ($unsigned(wire17) >= wire13)};
  assign wire22 = wire13[(5'h15):(3'h4)];
  assign wire23 = ((($unsigned(wire13[(3'h7):(3'h7)]) != ((wire20 ?
                      wire18 : wire21) == (wire22 ?
                      wire15 : wire22))) || $signed({(!(8'h9e)),
                      $unsigned(wire20)})) && (-$signed($unsigned((~|wire21)))));
  assign wire24 = wire17;
  assign wire25 = $unsigned((((wire24 >= wire14) ?
                      $signed(wire24[(2'h3):(2'h3)]) : ($unsigned(wire16) | wire14)) <= wire20));
  assign wire26 = wire23[(3'h5):(1'h1)];
  assign wire27 = (($signed((~^(wire20 ?
                          wire24 : wire18))) >>> (^(^~$unsigned(wire13)))) ?
                      ({({wire17, wire16} ?
                                  $signed(wire12) : (wire12 ?
                                      wire13 : (8'ha1)))} ?
                          wire26[(2'h3):(1'h0)] : wire25[(1'h0):(1'h0)]) : ($unsigned(wire13[(2'h2):(2'h2)]) & (^~wire24)));
  assign wire28 = $signed({$signed(wire24), $unsigned(wire22[(4'h8):(3'h7)])});
  assign wire29 = wire20;
  assign wire30 = (&wire20[(3'h6):(1'h0)]);
  assign wire31 = $unsigned((^~wire21[(5'h10):(3'h4)]));
  assign wire32 = {$unsigned($unsigned($signed(wire17))),
                      ($signed($unsigned((&wire30))) * $unsigned(wire29))};
  assign wire33 = (~|((wire15 == $signed(wire29[(1'h1):(1'h0)])) <= {($unsigned(wire25) << $signed(wire26))}));
  assign wire34 = (&wire23[(3'h6):(1'h0)]);
  assign wire35 = $unsigned(wire31[(1'h1):(1'h1)]);
  assign wire36 = $unsigned({$signed($unsigned($unsigned(wire29))),
                      ((!(wire33 ? (8'h9c) : wire35)) ?
                          $signed((^wire34)) : ($unsigned((7'h42)) ?
                              (8'ha4) : (wire13 != (8'h9f))))});
endmodule

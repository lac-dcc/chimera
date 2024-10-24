module top
#(parameter param76 = (((~&(~&((8'hae) ^ (8'h9e)))) ? (((&(8'hab)) >>> {(8'hab), (8'hab)}) >= (8'ha7)) : (8'hb8)) << {(((&(8'ha7)) ? ((8'ha2) >= (8'hbc)) : (~&(8'hb0))) || {(^(7'h40))})}), 
parameter param77 = (((&{param76, ((8'hbc) ? (8'hb6) : param76)}) ? {param76, param76} : {(^(!param76)), ((~&param76) ? (~|param76) : (param76 <<< param76))}) && (param76 - (+param76))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire72;
  assign y = {wire75, wire74, wire4, wire5, wire6, wire7, wire72, (1'h0)};
  assign wire4 = (($unsigned(wire3[(2'h3):(2'h3)]) ?
                     ($unsigned($unsigned(wire2)) ?
                         wire0 : wire1) : wire0[(1'h0):(1'h0)]) && $signed($unsigned(((^wire2) && wire1[(4'h9):(2'h2)]))));
  assign wire5 = ((!$signed(wire2)) ? wire1 : wire2);
  assign wire6 = wire1;
  assign wire7 = $unsigned((~(!wire4[(2'h3):(2'h2)])));
  module8 #() modinst73 (.y(wire72), .wire11(wire5), .clk(clk), .wire9(wire6), .wire13(wire3), .wire12(wire7), .wire10(wire2));
  assign wire74 = {$unsigned((~^(wire1[(2'h3):(2'h3)] & (+wire4)))),
                      ((-wire1) == wire2)};
  assign wire75 = ($signed(wire72) ?
                      (($signed($signed(wire0)) >= (8'h9f)) ~^ (8'hb3)) : {(wire6 ?
                              wire2[(4'hf):(2'h3)] : $signed($signed(wire74)))});
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire35;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire37,
                 wire14,
                 wire15,
                 wire35,
                 (1'h0)};
  assign wire14 = (|{$signed(wire11[(2'h3):(1'h1)]),
                      (($signed(wire13) && (wire12 & wire12)) <<< wire10[(1'h0):(1'h0)])});
  assign wire15 = {((8'hb6) & wire13)};
  module16 #() modinst36 (.clk(clk), .y(wire35), .wire20(wire12), .wire17(wire11), .wire19(wire14), .wire18(wire15), .wire21(wire10));
  assign wire37 = wire13[(1'h0):(1'h0)];
  module38 #() modinst64 (.clk(clk), .wire42(wire35), .wire40(wire10), .wire41(wire15), .y(wire63), .wire39(wire11));
  assign wire65 = $signed({{$unsigned($unsigned((8'ha2)))},
                      {$signed({wire35})}});
  assign wire66 = (^~wire35);
  assign wire67 = ((($signed(((8'hac) ? (8'hb2) : (8'ha7))) ?
                      ((wire13 ?
                          wire11 : wire11) > (8'hbe)) : $signed($signed((8'ha0)))) >> ((wire63[(3'h5):(2'h3)] ^~ {wire63}) == $unsigned(wire66))) + wire14[(4'he):(4'he)]);
  assign wire68 = (wire10[(1'h0):(1'h0)] ?
                      wire12[(2'h3):(2'h3)] : $signed(wire67));
  assign wire69 = wire37[(3'h6):(2'h2)];
  assign wire70 = wire15[(4'he):(1'h0)];
  assign wire71 = wire66[(3'h4):(2'h3)];
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire signed [(3'h6):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  assign y = {wire62,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg49,
                 (1'h0)};
  assign wire43 = (7'h41);
  assign wire44 = wire42[(3'h5):(1'h1)];
  assign wire45 = (($signed($signed($signed(wire42))) > (8'hb2)) ?
                      $signed((wire42[(3'h7):(1'h1)] ?
                          (+$unsigned(wire44)) : $unsigned((wire40 ?
                              wire39 : wire42)))) : wire40);
  assign wire46 = (^wire43);
  assign wire47 = ($unsigned($unsigned({(!wire42)})) ?
                      {wire39[(3'h5):(2'h3)],
                          ((wire40 ? wire45 : $signed(wire42)) ?
                              $unsigned(wire42[(3'h5):(2'h3)]) : wire41)} : (wire39 - (~^$signed(wire40[(1'h0):(1'h0)]))));
  assign wire48 = ((8'hb1) >>> wire39);
  always
    @(posedge clk) begin
      reg49 <= wire42;
    end
  assign wire50 = reg49;
  assign wire51 = {{((wire43[(1'h0):(1'h0)] <= $unsigned(reg49)) == ($signed((7'h40)) ?
                              (wire50 ? wire41 : wire47) : wire48)),
                          $unsigned(wire48[(3'h7):(3'h6)])},
                      $signed({($unsigned(wire50) <<< $signed(wire45))})};
  assign wire52 = (!reg49[(3'h5):(2'h2)]);
  assign wire53 = $unsigned({$unsigned($unsigned((wire46 <<< wire40))),
                      {wire50}});
  assign wire54 = ($signed((-{wire48})) ?
                      (&wire41[(4'hc):(4'h8)]) : (|{(^~(wire42 | wire39)),
                          wire48}));
  assign wire55 = (~|$signed(((!$signed((8'ha8))) ?
                      $unsigned(wire48[(3'h5):(2'h2)]) : $unsigned(wire41))));
  always
    @(posedge clk) begin
      if ($unsigned((~$unsigned(wire47))))
        begin
          reg56 <= (^~$unsigned(wire55[(4'he):(4'he)]));
          reg57 <= wire54[(1'h1):(1'h0)];
          reg58 <= (^$signed(wire42));
        end
      else
        begin
          reg56 <= ({$signed($signed(wire44)),
              ($signed($unsigned((8'hba))) < $unsigned($signed(wire52)))} * ((wire40 >> ((8'ha3) ?
              (8'ha6) : (wire48 == wire46))) <= $unsigned(($unsigned(wire53) == {wire44}))));
          reg57 <= (-$signed((!((8'hac) ? $signed(wire40) : (~wire41)))));
          reg58 <= $unsigned(wire54);
        end
      reg59 <= reg58[(1'h0):(1'h0)];
      reg60 <= (wire51 && $unsigned((!((wire41 > wire46) ?
          $unsigned((8'hbd)) : (wire42 ? wire45 : reg59)))));
      reg61 <= wire45[(3'h4):(1'h1)];
    end
  assign wire62 = (reg60[(2'h2):(2'h2)] + (~$signed($signed({wire48,
                      wire46}))));
endmodule

module module16
#(parameter param33 = ((((~^((7'h43) != (8'hbc))) >= (((8'ha1) >>> (8'hb2)) ? ((8'h9c) ? (8'haf) : (8'ha9)) : ((8'hbc) & (8'ha4)))) ? (~&{(8'ha3)}) : (((^~(8'h9d)) >>> (8'hbb)) ~^ {{(8'hb5)}, ((8'hb5) >>> (8'hb4))})) ? ((~&(~^((8'ha9) ? (8'hba) : (8'hb6)))) ^~ {((+(7'h41)) + (^(8'ha6)))}) : (((+((8'hba) ? (8'hb2) : (8'hb6))) ? ({(8'hab), (8'ha9)} ? {(8'h9d)} : {(8'ha0), (8'ha5)}) : (((8'ha2) ? (8'hbf) : (8'hb4)) > ((8'hb0) + (7'h41)))) * ((((8'hb2) ? (8'ha8) : (8'hba)) ? ((8'ha4) <= (8'ha0)) : ((8'ha4) <= (8'hb1))) ? ((~^(8'h9e)) ? (8'ha3) : ((7'h43) ^~ (8'ha4))) : ((^~(8'hb4)) ? ((8'hbb) ? (8'had) : (8'ha6)) : {(8'ha7), (7'h42)})))), 
parameter param34 = param33)
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire23,
                 wire22,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire22 = wire19[(1'h0):(1'h0)];
  assign wire23 = {wire22[(4'hc):(4'h9)]};
  always
    @(posedge clk) begin
      reg24 <= (wire21[(4'h8):(3'h7)] ?
          ((8'hb2) << wire17[(5'h14):(4'h8)]) : ($signed(wire18[(2'h2):(1'h1)]) ?
              wire19[(1'h1):(1'h1)] : $signed(wire21[(3'h6):(3'h5)])));
      reg25 <= {$signed($unsigned(reg24[(4'hc):(4'h8)])), reg24[(3'h7):(3'h6)]};
      reg26 <= (~&$signed($signed(((wire21 ?
          wire18 : wire18) >> wire18[(3'h5):(3'h5)]))));
      reg27 <= (^reg25[(1'h1):(1'h0)]);
    end
  assign wire28 = $unsigned((!((^(wire18 != wire20)) ?
                      ($unsigned(wire22) ?
                          wire17[(3'h6):(3'h4)] : $unsigned(reg25)) : ($signed(wire23) << (+reg26)))));
  assign wire29 = ((reg26[(3'h4):(2'h3)] > (-((reg25 == wire19) & ((7'h44) >> reg25)))) <= $unsigned({wire19}));
  assign wire30 = ((reg24 > (-(-{wire29, wire18}))) ?
                      (8'hb7) : $signed($unsigned(((wire17 ~^ reg27) || (8'hb3)))));
  assign wire31 = $signed((($signed((^wire18)) ?
                          (8'hab) : (wire19 >= (&wire19))) ?
                      wire17 : ($signed((reg24 ? wire21 : wire18)) ?
                          (^$unsigned(wire22)) : wire28[(4'ha):(4'ha)])));
  assign wire32 = {(~wire18)};
endmodule

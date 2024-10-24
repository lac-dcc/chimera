module top
#(parameter param92 = ((^({((7'h41) ? (8'hb8) : (8'had))} >>> (|{(8'ha6)}))) ? ((-(((8'haa) ? (8'h9d) : (8'hbe)) ? (8'hbd) : ((8'hb6) ? (8'hb7) : (8'ha1)))) ? ((~^((8'ha1) < (8'hba))) + (&(8'ha3))) : {((8'hb5) > ((8'hbd) ? (8'ha4) : (8'hb8))), ((|(8'h9d)) & ((8'ha1) ? (8'hba) : (8'hba)))}) : (({(~&(8'ha4)), ((8'ha0) >>> (7'h44))} ? (((8'ha4) ? (8'h9e) : (7'h43)) <<< ((8'ha7) ? (8'hac) : (7'h42))) : (|(^(8'hac)))) & {(^~((8'hb8) && (8'ha4))), (((8'hbf) ? (8'hba) : (8'ha0)) ? ((8'hb0) ? (8'ha3) : (8'ha1)) : ((8'h9c) >> (8'hb7)))})), 
parameter param93 = param92)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  assign y = {wire91,
                 wire88,
                 wire87,
                 wire85,
                 wire6,
                 wire5,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire5 = (wire1 ? $signed(wire2) : wire1[(2'h2):(2'h2)]);
  assign wire6 = {wire5, (wire2 ? $signed($signed($signed((8'hae)))) : wire4)};
  module7 #() modinst86 (.clk(clk), .wire9(wire4), .wire11(wire2), .wire10(wire5), .y(wire85), .wire8(wire3));
  assign wire87 = (8'hb4);
  assign wire88 = ((~&wire0) ?
                      $signed((((wire1 ? wire0 : wire4) ?
                          (wire5 ? wire0 : wire0) : ((8'h9e) ?
                              wire4 : (8'hb6))) == (wire87[(1'h1):(1'h1)] ?
                          wire87 : wire4))) : $signed((({wire1, wire0} ?
                          wire87[(4'hd):(4'hb)] : wire87[(4'hc):(2'h3)]) < {$unsigned(wire1)})));
  always
    @(posedge clk) begin
      reg89 <= wire5;
      reg90 <= ($unsigned(($signed(wire85) ?
              $signed((8'hb3)) : $signed(wire4))) ?
          $signed($unsigned((^~$unsigned(reg89)))) : (wire2 ?
              wire88 : wire1[(2'h2):(1'h0)]));
    end
  assign wire91 = ((+$unsigned((wire3 ? (reg90 ? wire0 : wire0) : (8'hba)))) ?
                      ($signed(((~|wire85) > (reg90 > wire4))) ?
                          wire85 : ($signed($unsigned(reg89)) ?
                              reg89[(4'hb):(2'h2)] : wire2[(4'h8):(3'h7)])) : ($unsigned(({wire85} ^ wire85[(3'h6):(3'h5)])) ?
                          ($signed($signed(wire3)) ?
                              $signed(wire85[(4'ha):(4'ha)]) : reg89[(5'h11):(2'h3)]) : ($unsigned({wire6,
                                  reg90}) ?
                              (wire85 <= (wire0 ? wire85 : (8'hb6))) : reg89)));
endmodule

module module7
#(parameter param83 = (&((8'had) && ({((8'h9c) ? (8'hae) : (8'ha4)), ((8'h9f) <= (8'hbc))} ? ((-(8'hab)) ? {(8'haa), (7'h44)} : ((8'hbb) ? (8'hb5) : (8'hb7))) : (!(8'hb0))))), 
parameter param84 = (((((param83 ? param83 : param83) ? param83 : param83) | ((param83 ? param83 : param83) ? (param83 <<< param83) : (param83 ^ param83))) <= param83) ? {{((~|param83) > (param83 ? param83 : param83))}, param83} : {param83}))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire46;
  assign y = {wire82, wire81, wire79, wire48, wire12, wire46, (1'h0)};
  assign wire12 = {($unsigned((!$signed(wire11))) ?
                          $unsigned(wire11) : wire11[(2'h3):(2'h2)])};
  module13 #() modinst47 (wire46, clk, wire11, wire8, wire10, wire9, wire12);
  assign wire48 = $signed(wire9);
  module49 #() modinst80 (.wire50(wire9), .wire51(wire12), .wire52(wire48), .y(wire79), .wire53(wire8), .clk(clk));
  assign wire81 = $signed({$signed(wire46)});
  assign wire82 = wire11;
endmodule

module module49
#(parameter param77 = (~^((~^(((8'ha5) ? (7'h44) : (8'hbf)) <<< (+(8'haa)))) ? ((~|(!(8'hba))) << (^((8'haf) ? (8'hb2) : (8'had)))) : (~^(&(~&(8'hb5)))))), 
parameter param78 = ((|param77) ^ (param77 ? ((8'h9e) ? ({param77, param77} && param77) : ((param77 ? param77 : param77) <<< (param77 ? (8'ha4) : param77))) : (param77 ? (7'h42) : {param77}))))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire53;
  input wire [(5'h13):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire [(3'h4):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg75,
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
                 (1'h0)};
  assign wire54 = $unsigned(($unsigned(wire53) ?
                      $unsigned(wire52) : (^(7'h44))));
  assign wire55 = ($signed($signed({$signed(wire51),
                      (~&wire51)})) == (wire51[(3'h4):(2'h2)] ?
                      (~&(wire53 - wire51)) : $unsigned(wire52)));
  assign wire56 = wire50[(2'h3):(2'h3)];
  assign wire57 = $unsigned($signed(($signed($unsigned(wire51)) ?
                      (&$signed(wire54)) : {wire50, (~|wire54)})));
  always
    @(posedge clk) begin
      if (wire55)
        begin
          if (wire52[(3'h4):(2'h3)])
            begin
              reg58 <= ($signed($unsigned($signed(wire50[(1'h0):(1'h0)]))) ?
                  (+$signed(wire52)) : (($unsigned(wire51) ?
                      wire52[(4'h9):(4'h8)] : $signed(wire57[(1'h1):(1'h1)])) != $signed($unsigned($signed(wire50)))));
              reg59 <= (($signed({(+wire56),
                      ((8'hbb) << wire52)}) - {{$unsigned(wire54),
                          $signed(wire57)}}) ?
                  wire52[(5'h12):(3'h5)] : (~wire54[(3'h6):(3'h6)]));
            end
          else
            begin
              reg58 <= (wire57[(3'h6):(2'h3)] != (8'haf));
            end
          if ((^$signed($unsigned({wire57}))))
            begin
              reg60 <= wire53[(2'h2):(1'h1)];
              reg61 <= ($unsigned($signed($unsigned($unsigned(reg60)))) ?
                  $unsigned((~|((~&wire52) ?
                      wire55[(3'h5):(2'h3)] : (wire56 ?
                          reg59 : wire50)))) : {{((wire56 ?
                              wire53 : reg59) || (wire54 <<< wire56))},
                      (^$signed((~&wire57)))});
              reg62 <= (reg61[(5'h10):(4'hd)] >> $signed($signed(((^~wire51) <= $unsigned(reg60)))));
              reg63 <= wire57;
              reg64 <= ((|$signed($signed((^~wire55)))) + $unsigned($signed($signed((~|wire53)))));
            end
          else
            begin
              reg60 <= (~&(reg58 || $unsigned(wire56[(4'ha):(4'h9)])));
              reg61 <= (($signed(wire53[(2'h2):(1'h0)]) > wire54[(1'h0):(1'h0)]) == $signed(($signed((~&wire50)) ?
                  (wire57[(3'h7):(1'h0)] ^~ (reg64 ?
                      wire52 : (8'hb1))) : ($unsigned(wire57) != reg63[(4'h9):(2'h3)]))));
            end
          reg65 <= $unsigned($signed($unsigned((8'hb2))));
        end
      else
        begin
          reg58 <= (8'hb9);
          reg59 <= (($unsigned(((-wire50) ?
                  reg63[(4'hb):(1'h1)] : (wire52 ? reg64 : wire50))) ?
              (wire56[(4'h8):(3'h5)] ?
                  (wire50[(2'h2):(2'h2)] ?
                      wire56 : (+(8'hbf))) : wire53[(2'h3):(2'h2)]) : ($signed(wire50[(3'h4):(1'h0)]) ?
                  wire56 : $signed((wire50 ?
                      wire53 : reg61)))) >> $unsigned(wire56[(3'h5):(2'h3)]));
          reg60 <= wire55;
          reg61 <= ($unsigned(({reg58[(3'h5):(1'h0)], wire51[(4'hf):(1'h1)]} ?
                  (8'hb6) : $unsigned(wire50))) ?
              $signed((+{(8'had)})) : (reg60 ?
                  reg65 : (|wire50[(2'h3):(2'h3)])));
          reg62 <= $signed((({$unsigned(wire56)} ?
              $signed((|reg60)) : wire51) <= (~reg59)));
        end
      reg66 <= ($unsigned($unsigned($unsigned((reg60 >> wire52)))) >= $unsigned(({(wire56 * wire50)} && {reg59[(2'h2):(1'h1)],
          $signed(reg60)})));
    end
  always
    @(posedge clk) begin
      reg67 <= ((reg65[(2'h2):(1'h1)] ?
              reg62 : $unsigned((^reg59[(3'h6):(3'h4)]))) ?
          $signed($unsigned(((reg60 ^~ wire53) ?
              (~^reg58) : reg61))) : {{$signed(reg62),
                  (((8'h9f) ? reg58 : reg64) | $signed(wire51))}});
    end
  assign wire68 = ($signed(($signed($signed(wire53)) * $unsigned($unsigned(reg60)))) != $signed({((|reg67) ?
                          (reg58 >>> wire53) : (reg67 ? wire57 : wire53)),
                      $signed((reg59 * reg67))}));
  assign wire69 = $signed((^wire52[(4'ha):(3'h5)]));
  assign wire70 = $signed(wire51);
  assign wire71 = reg60;
  assign wire72 = ((wire71[(1'h1):(1'h0)] ? {{wire54}} : reg58) ?
                      ((reg62[(4'hd):(4'ha)] ?
                          $signed((reg66 ~^ reg59)) : {(-(8'had))}) << reg66[(4'he):(4'hb)]) : ((((wire50 ~^ wire69) ?
                              (reg66 >>> (8'hb5)) : $unsigned((8'ha2))) ?
                          ((reg65 ? (8'hb0) : (8'hb7)) + (wire55 ?
                              wire68 : (8'hb0))) : $signed($signed((8'ha8)))) <= wire56));
  assign wire73 = wire57[(3'h5):(2'h2)];
  assign wire74 = $unsigned({($unsigned((reg58 + wire68)) == wire71[(3'h4):(1'h1)]),
                      (^~(~(-wire68)))});
  always
    @(posedge clk) begin
      reg75 <= wire53[(3'h4):(2'h3)];
    end
  assign wire76 = (~^(reg64 ? reg61 : $unsigned($signed($signed((8'hae))))));
endmodule

module module13
#(parameter param44 = (+{({((8'haa) | (8'ha2))} ? (8'hb4) : ((8'hba) | ((8'haf) << (8'hbd))))}), 
parameter param45 = param44)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 reg38,
                 reg28,
                 reg27,
                 reg26,
                 reg21,
                 (1'h0)};
  assign wire19 = wire14;
  assign wire20 = (($unsigned(wire14) ?
                          {$signed(wire18[(4'he):(1'h0)])} : wire18) ?
                      wire17 : $signed(wire16));
  always
    @(posedge clk) begin
      reg21 <= wire16;
    end
  assign wire22 = (8'haf);
  assign wire23 = $signed($signed($signed($unsigned({reg21}))));
  assign wire24 = ((wire19 ?
                      ($signed(((8'hb5) ? wire23 : wire18)) ?
                          {$unsigned(wire17)} : ((wire14 ? wire19 : (8'hbf)) ?
                              $unsigned(wire14) : ((8'ha2) != wire16))) : (+$unsigned($signed(wire16)))) == wire17[(5'h10):(2'h3)]);
  assign wire25 = $signed({$unsigned((|(|wire22)))});
  always
    @(posedge clk) begin
      reg26 <= wire20[(3'h6):(3'h6)];
      reg27 <= wire19;
      reg28 <= wire19;
    end
  assign wire29 = $signed($signed((~|$unsigned(((8'hb0) & wire23)))));
  assign wire30 = (-wire23);
  assign wire31 = ($signed(({$signed(reg28)} >> (8'ha8))) << wire24);
  assign wire32 = ({($unsigned($unsigned(wire16)) ?
                          wire30 : (((7'h42) ?
                              reg21 : wire20) || $unsigned(wire22)))} >>> wire14[(2'h3):(2'h3)]);
  assign wire33 = ($signed($signed(wire15[(4'he):(4'hd)])) ?
                      wire20[(3'h7):(3'h7)] : $signed($signed((&wire31[(3'h4):(3'h4)]))));
  assign wire34 = (^~{wire23[(4'hb):(1'h1)],
                      ($unsigned(wire14[(2'h3):(1'h1)]) < $unsigned($unsigned(wire20)))});
  assign wire35 = reg26;
  assign wire36 = wire32[(2'h2):(2'h2)];
  assign wire37 = ((^(-$signed((wire20 ? wire17 : wire23)))) ?
                      wire18 : (!wire25[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      reg38 <= $signed((((&{reg28}) ?
          wire30 : (&wire31)) & $unsigned((^wire15[(4'h8):(1'h0)]))));
    end
  assign wire39 = (~|wire37[(2'h2):(1'h0)]);
  assign wire40 = $unsigned($unsigned(wire24));
  assign wire41 = (-(!(($signed((8'hb7)) ?
                          $unsigned(wire20) : reg27[(2'h2):(1'h0)]) ?
                      reg38[(3'h4):(1'h1)] : wire16[(1'h0):(1'h0)])));
  assign wire42 = ((~wire24) >> {(({(8'h9e)} ? wire25 : wire23) ?
                          (~^$unsigned((8'h9f))) : reg21[(2'h2):(1'h1)])});
  assign wire43 = $signed($unsigned($signed((8'ha4))));
endmodule

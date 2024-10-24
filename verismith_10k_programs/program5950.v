module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire74;
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 reg83,
                 reg82,
                 (1'h0)};
  module4 #() modinst75 (wire74, clk, wire3, wire2, wire0, wire1);
  assign wire76 = $signed((~^($unsigned((^~wire74)) >> (wire2[(2'h2):(1'h1)] >>> (wire3 <<< wire2)))));
  assign wire77 = $unsigned(wire74);
  assign wire78 = wire3;
  assign wire79 = $signed($unsigned(wire3[(1'h0):(1'h0)]));
  assign wire80 = (8'hbc);
  assign wire81 = $unsigned($unsigned(wire3));
  always
    @(posedge clk) begin
      reg82 <= (~|wire0[(3'h6):(1'h0)]);
      reg83 <= (~&wire79[(3'h4):(2'h2)]);
    end
  assign wire84 = wire81[(1'h0):(1'h0)];
  assign wire85 = $signed($signed({((wire2 ? wire78 : wire84) + wire0)}));
  assign wire86 = wire3[(1'h0):(1'h0)];
  assign wire87 = wire77;
endmodule

module module4
#(parameter param72 = (&(8'hb2)), 
parameter param73 = param72)
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire70;
  assign y = {wire47, wire10, wire9, wire49, wire50, wire51, wire70, (1'h0)};
  assign wire9 = $signed((wire6 ?
                     (wire8[(1'h0):(1'h0)] ?
                         $unsigned((wire8 * (7'h44))) : ($signed(wire5) ?
                             {wire6,
                                 wire7} : $signed(wire6))) : {{((8'hbd) ~^ wire8)}}));
  assign wire10 = {(wire6[(4'hc):(4'h8)] ?
                          (-(&{wire8, wire6})) : $unsigned(wire5)),
                      wire6[(4'h9):(3'h7)]};
  module11 #() modinst48 (.wire14(wire5), .wire12(wire9), .wire16(wire6), .wire15(wire7), .clk(clk), .wire13(wire10), .y(wire47));
  assign wire49 = (wire5[(4'hc):(4'hb)] < (!(((wire5 != wire47) ?
                      $signed(wire47) : $unsigned(wire9)) >>> (^$signed((8'hb2))))));
  assign wire50 = (wire49 & ((&wire6) + wire7[(1'h0):(1'h0)]));
  assign wire51 = $signed($unsigned(({$unsigned(wire5)} ?
                      wire7[(5'h10):(4'hf)] : {wire10, $signed(wire6)})));
  module52 #() modinst71 (wire70, clk, wire51, wire6, wire50, wire10, wire8);
endmodule

module module52
#(parameter param68 = ((~&(^~{((8'ha7) >= (7'h43)), (^~(8'hb2))})) || ({{((8'h9e) ^~ (8'h9e))}, (((8'ha8) <<< (8'hbb)) < ((8'hb8) >> (8'ha3)))} <= ((((8'ha5) - (8'ha2)) ? ((7'h43) ? (8'had) : (8'h9c)) : (~^(8'hac))) ? {((8'hb0) ? (8'ha8) : (8'ha6)), ((7'h41) ? (8'hbd) : (8'haf))} : ((8'hbd) ^ {(8'ha3)})))), 
parameter param69 = {(param68 ^ (+((&param68) || {param68, param68}))), param68})
(y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  input wire signed [(4'hc):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire [(2'h3):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire54 ?
          $signed({((wire57 >> wire54) ?
                  (^wire56) : wire55[(1'h1):(1'h0)])}) : $unsigned(wire57)))
        begin
          if (((wire57 * wire53) << $unsigned($unsigned((wire57[(2'h3):(1'h0)] ?
              (8'hb1) : (wire55 ? (8'hb9) : (8'ha5)))))))
            begin
              reg58 <= (~^($unsigned(wire56[(3'h5):(1'h1)]) * wire54));
              reg59 <= ($signed(wire55) ?
                  ((~|(+wire57[(2'h2):(1'h1)])) ?
                      (-(((8'hbb) ?
                          reg58 : wire57) ^ $unsigned(wire53))) : reg58) : wire56[(4'ha):(1'h0)]);
            end
          else
            begin
              reg58 <= wire53[(2'h2):(2'h2)];
              reg59 <= ({$unsigned(((wire57 ? wire55 : wire56) ?
                      wire53 : wire57))} <<< $signed(((~$unsigned(wire53)) ?
                  ($unsigned(reg58) + (wire54 <<< wire53)) : $unsigned($signed(wire53)))));
              reg60 <= (wire56 ?
                  $unsigned(($unsigned((wire56 + wire54)) ?
                      ({wire55, wire54} ?
                          (wire56 >= wire56) : $signed(wire57)) : $signed($unsigned(wire55)))) : ($signed(wire54[(3'h6):(3'h4)]) ?
                      (^~{$unsigned(wire56)}) : $unsigned(reg58)));
            end
          reg61 <= {($unsigned((wire54 ?
                      (wire53 ? wire56 : reg60) : reg59[(1'h1):(1'h0)])) ?
                  (wire57 == (wire56[(5'h10):(4'h9)] | reg60[(1'h1):(1'h0)])) : $signed($signed((reg60 | wire57))))};
        end
      else
        begin
          reg58 <= $signed($signed((~|reg61[(3'h4):(2'h3)])));
          if (((~&(|wire57[(4'h8):(1'h1)])) == reg59))
            begin
              reg59 <= $signed(($unsigned((~|{wire54, wire53})) ?
                  reg59[(2'h3):(2'h2)] : $unsigned(wire56[(3'h4):(1'h0)])));
              reg60 <= $unsigned((reg60 >= reg58));
              reg61 <= (reg61 ?
                  (+wire55[(2'h3):(1'h0)]) : $unsigned((reg58[(2'h3):(2'h2)] ?
                      ((|wire53) ? {wire54} : $signed(wire55)) : wire55)));
              reg62 <= ($unsigned((8'hac)) ?
                  $signed(($signed($signed(wire57)) && $unsigned($signed(wire54)))) : {{((8'had) ?
                              $unsigned(reg58) : $signed((8'hb3)))},
                      ({wire55[(4'hb):(1'h0)], (~|reg61)} ?
                          $unsigned((~wire57)) : ((+wire55) <= (wire57 < reg60)))});
            end
          else
            begin
              reg59 <= (^~($unsigned(($unsigned(reg60) ?
                      $unsigned(reg59) : reg60)) ?
                  (($signed(wire56) ? (8'h9f) : wire54) * reg62) : (8'ha9)));
              reg60 <= (~wire56[(4'he):(3'h7)]);
            end
          reg63 <= ({(((wire53 ? reg61 : wire57) ?
                      $unsigned(reg62) : (-reg61)) - ($signed((8'hb0)) <= (wire53 ?
                      (8'hb9) : reg60))),
                  $signed(($unsigned((8'ha9)) ?
                      wire53[(2'h2):(1'h1)] : $signed((8'hb9))))} ?
              wire53 : {$signed($signed(reg62[(3'h4):(2'h2)]))});
        end
    end
  assign wire64 = (^reg61);
  assign wire65 = reg59;
  assign wire66 = ($unsigned(((8'had) & $unsigned({reg58}))) ?
                      $unsigned((~&(!reg60[(1'h1):(1'h0)]))) : reg61[(1'h1):(1'h0)]);
  assign wire67 = {$signed($unsigned(($unsigned(reg60) ?
                          $unsigned(wire64) : (wire55 >> reg60))))};
endmodule

module module11
#(parameter param45 = ((({(~&(8'ha6)), ((8'had) ? (8'h9c) : (7'h43))} != (+(~&(8'h9e)))) <<< (((+(8'hae)) ? ((8'had) ? (8'ha5) : (8'haf)) : ((8'hb0) != (8'ha8))) ^ {((8'ha7) != (8'hae))})) == {((^~{(8'hb4)}) ? (^~(8'hb4)) : ({(8'hbc), (7'h42)} ? ((8'had) ? (7'h44) : (8'hae)) : {(8'hba), (8'ha8)})), ((((8'ha2) == (8'hb9)) ^~ (8'hbe)) ? {((8'hb8) ? (8'ha5) : (8'hb2)), {(7'h41), (7'h42)}} : ({(7'h42)} ~^ ((8'h9c) ? (8'hac) : (7'h43))))}), 
parameter param46 = (((param45 ~^ (!(~&(8'had)))) ? (~|param45) : (!param45)) ? param45 : {((param45 <<< (param45 ~^ param45)) ? ((param45 >= (8'hb8)) ? (^param45) : (param45 >> param45)) : param45), param45}))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg42,
                 reg41,
                 reg40,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire16;
    end
  assign wire18 = wire15[(3'h4):(2'h3)];
  assign wire19 = (((~|wire15) ?
                      $signed(wire18) : $unsigned(wire12)) <= ($unsigned($unsigned(wire16)) ?
                      $signed($signed((|wire13))) : (8'h9e)));
  assign wire20 = ($signed($signed((!wire18))) ?
                      ((-$signed($signed(wire13))) != $unsigned($signed($signed(wire18)))) : $unsigned($unsigned((wire14[(3'h4):(1'h0)] || (~^wire19)))));
  assign wire21 = ((wire15[(4'he):(4'hc)] ?
                      $signed($unsigned((wire14 ?
                          reg17 : (8'hb3)))) : ((^~wire18) ?
                          ($signed((7'h43)) ?
                              wire14[(4'h9):(2'h3)] : wire20) : {wire16})) ^ wire14[(3'h7):(3'h7)]);
  assign wire22 = (^~(((|$unsigned(reg17)) == $signed((wire18 < reg17))) >> (~{{wire13},
                      (&wire13)})));
  assign wire23 = $unsigned(wire18[(4'hb):(4'h8)]);
  assign wire24 = wire15[(4'hb):(4'h9)];
  assign wire25 = (|(8'ha2));
  always
    @(posedge clk) begin
      reg26 <= (8'ha6);
      reg27 <= ((wire18[(2'h3):(2'h3)] ^~ {$unsigned((wire19 ?
              wire15 : (8'ha7)))}) | (~&$signed(wire15)));
      reg28 <= reg26[(3'h5):(3'h4)];
      reg29 <= {{$signed(($unsigned(wire24) & (wire13 ? wire22 : reg28))),
              wire23}};
      if (wire19[(4'h8):(3'h5)])
        begin
          reg30 <= {($signed(($unsigned((8'haa)) >> wire14)) ?
                  ((8'hb4) ?
                      wire18[(1'h1):(1'h1)] : {$unsigned(wire13),
                          $signed(wire23)}) : {wire25, wire21})};
          reg31 <= $unsigned(((wire16 ?
                  (wire18[(4'hb):(4'h8)] ?
                      (~&(8'hae)) : $unsigned(wire13)) : $signed($signed(wire24))) ?
              reg17[(1'h0):(1'h0)] : (^(8'ha3))));
          if (({$unsigned(((reg27 ? reg17 : wire19) - wire12[(4'h8):(2'h2)])),
                  $signed(wire25)} ?
              (($unsigned(((7'h43) & (8'hbc))) ?
                      $signed(reg29) : ((reg29 ? wire23 : (7'h42)) ?
                          $signed(wire25) : wire25)) ?
                  {$unsigned($signed(reg28)),
                      wire22[(4'ha):(3'h7)]} : $signed($unsigned({wire12,
                      reg29}))) : wire22))
            begin
              reg32 <= $unsigned((!wire20));
              reg33 <= ((^reg28[(3'h4):(2'h3)]) ^ $signed($signed(wire25)));
            end
          else
            begin
              reg32 <= $signed((($signed({reg28}) ?
                      (7'h41) : reg29[(3'h5):(2'h3)]) ?
                  $unsigned(wire13[(1'h0):(1'h0)]) : (($unsigned(reg28) ?
                          (+wire22) : $unsigned(wire25)) ?
                      {(wire20 * reg28)} : reg17)));
              reg33 <= wire15[(4'ha):(3'h7)];
            end
        end
      else
        begin
          reg30 <= reg17[(1'h0):(1'h0)];
        end
    end
  assign wire34 = $unsigned(wire25);
  assign wire35 = wire34[(3'h7):(2'h3)];
  assign wire36 = (($unsigned(wire16) ?
                          reg28 : {$signed($unsigned(wire23)),
                              (&$unsigned(wire14))}) ?
                      $signed(((reg33[(4'h9):(1'h0)] ?
                              (wire22 ^ reg31) : reg26[(5'h10):(3'h5)]) ?
                          (wire19 > ((8'hb8) ~^ wire12)) : reg33)) : (((~|(wire24 - reg17)) << (&{reg28})) ?
                          wire25 : ((wire35 != (wire12 ?
                              wire19 : reg28)) >> $signed($signed(reg17)))));
  assign wire37 = wire20[(5'h11):(3'h5)];
  assign wire38 = (~($unsigned((reg17 | wire25)) ?
                      $unsigned($unsigned(reg17)) : $unsigned(((~&reg26) ?
                          (reg31 != reg33) : (wire20 ? reg33 : reg30)))));
  assign wire39 = $unsigned($signed(((reg30 != {wire37}) ?
                      wire18[(3'h6):(1'h0)] : {((8'ha7) ? wire20 : (8'hae))})));
  always
    @(posedge clk) begin
      reg40 <= $unsigned($signed(({(wire19 <= wire24),
          reg27[(1'h0):(1'h0)]} <= $signed(reg30))));
      reg41 <= (reg17[(1'h0):(1'h0)] + wire37);
      reg42 <= $signed(reg30[(3'h5):(3'h5)]);
    end
  assign wire43 = $unsigned($signed(wire20[(5'h14):(4'ha)]));
  assign wire44 = ((reg40[(3'h7):(1'h1)] * {$signed(reg27[(4'ha):(3'h6)]),
                      $unsigned((reg17 ? reg28 : (8'hb7)))}) ~^ wire14);
endmodule

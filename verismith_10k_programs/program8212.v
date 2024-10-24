module top
#(parameter param110 = ((&(((-(8'ha4)) ? ((7'h42) ~^ (8'ha9)) : ((7'h40) ^ (8'h9d))) ? ((7'h44) ? (8'hba) : ((7'h42) ? (8'hb4) : (8'hb6))) : ((&(7'h42)) ? ((7'h40) << (7'h44)) : ((8'hb1) ? (8'hbd) : (8'hbc))))) > ({(8'hb5)} ? {{{(8'hbe)}}, (((8'ha1) ^ (8'hb4)) & {(7'h41)})} : (8'ha2))), 
parameter param111 = {param110})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire105;
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  assign y = {wire109, wire107, wire105, reg108, (1'h0)};
  module5 #() modinst106 (.wire9(wire3), .wire6(wire2), .clk(clk), .wire7(wire4), .y(wire105), .wire8(wire0));
  assign wire107 = wire4[(5'h10):(3'h4)];
  always
    @(posedge clk) begin
      reg108 <= ((($signed((wire105 + wire3)) | ((8'hb1) ?
              (wire2 > wire3) : wire2)) <= $unsigned(($signed(wire105) ?
              (wire107 & wire0) : wire3))) ?
          ({wire105[(4'hb):(2'h3)], $unsigned($signed(wire2))} >> ({(wire105 ?
                      (8'h9f) : wire2),
                  wire3[(2'h3):(2'h3)]} ?
              $unsigned(wire3[(4'hc):(4'hc)]) : ($signed(wire3) == (wire105 ?
                  wire0 : (8'hbc))))) : (^~$signed((~&$signed((8'ha0))))));
    end
  assign wire109 = $unsigned($signed($unsigned($unsigned(wire107))));
endmodule

module module5
#(parameter param104 = ((((((8'ha2) ? (7'h43) : (8'hbc)) ? ((8'hb9) == (8'hb2)) : (-(8'hae))) || (((8'hbd) < (8'hbf)) ^ {(8'ha4), (8'ha8)})) ? {(((8'ha6) ? (8'hb5) : (8'hb6)) ? (8'hb3) : ((8'hb3) | (8'ha8))), (^~(!(7'h43)))} : (8'hb0)) < ((|(((8'hb5) ? (8'hbc) : (8'hb1)) ? (!(8'h9e)) : ((8'h9c) ? (8'hbe) : (8'hb2)))) ? (^(8'hbf)) : ((7'h41) ? ({(8'ha5), (7'h42)} ? ((8'hb0) ? (8'ha2) : (8'hb3)) : ((7'h44) ? (8'hab) : (8'ha7))) : (~{(8'haa), (8'ha1)})))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire81;
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire54,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire67,
                 wire68,
                 wire69,
                 wire81,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  module10 #() modinst55 (.wire12(wire9), .wire11((8'hab)), .wire13(wire7), .clk(clk), .wire15(wire6), .y(wire54), .wire14(wire8));
  assign wire56 = (($unsigned(wire54) ?
                      wire9[(4'hd):(4'hd)] : $unsigned((~(wire54 ?
                          wire7 : wire6)))) >= (wire7 ?
                      wire9[(3'h6):(2'h3)] : (~|(&(wire9 ?
                          (8'hbd) : (8'haf))))));
  assign wire57 = (8'hb7);
  assign wire58 = $unsigned($signed((^~wire57[(5'h14):(4'h8)])));
  assign wire59 = $signed({((!(+wire9)) ? wire9[(1'h1):(1'h1)] : (+(7'h42)))});
  assign wire60 = wire57;
  assign wire61 = $unsigned($unsigned((((wire57 >>> wire59) < wire58) >= $unsigned((~|wire58)))));
  assign wire62 = wire59;
  always
    @(posedge clk) begin
      reg63 <= (&wire59);
      reg64 <= reg63[(2'h3):(2'h3)];
      reg65 <= {{$unsigned($unsigned($unsigned(wire8)))}};
      reg66 <= (~(^~(~(+$signed((8'hbd))))));
    end
  assign wire67 = {(-reg66),
                      ($unsigned((^(^wire57))) ? wire6 : $signed(wire58))};
  assign wire68 = $signed(((|wire8[(3'h6):(3'h6)]) ?
                      $unsigned($unsigned($signed(wire59))) : ({wire59[(2'h3):(1'h0)],
                          {wire9}} <= (reg64 ?
                          (wire8 - wire59) : $signed(wire7)))));
  assign wire69 = (wire67[(1'h1):(1'h1)] ?
                      {$unsigned($unsigned(wire6[(3'h4):(3'h4)]))} : $unsigned(($unsigned($signed(wire8)) <<< (wire6[(4'hb):(3'h4)] ?
                          wire61 : (8'hb1)))));
  module70 #() modinst82 (.wire73(reg63), .wire74(wire58), .wire71(wire56), .clk(clk), .wire72(wire61), .y(wire81));
  always
    @(posedge clk) begin
      if ($unsigned((8'haf)))
        begin
          reg83 <= $signed(reg64[(3'h5):(3'h4)]);
          reg84 <= ($signed($unsigned(($unsigned((7'h43)) ?
              (wire56 ?
                  wire54 : wire54) : $unsigned((8'hb6))))) <<< $signed(wire9));
        end
      else
        begin
          reg83 <= (+(reg83[(1'h1):(1'h1)] ?
              wire57[(5'h11):(1'h1)] : (({(8'hbb),
                  wire62} << $signed(wire69)) >= wire59[(3'h7):(3'h5)])));
          reg84 <= ($signed($unsigned(((~&reg84) ?
              wire61[(1'h0):(1'h0)] : reg84))) && ((~|wire67) ?
              $unsigned(reg65) : reg83[(1'h1):(1'h1)]));
          if (wire6[(4'h9):(3'h4)])
            begin
              reg85 <= ($unsigned(wire69) & $signed(wire6));
            end
          else
            begin
              reg85 <= wire67;
              reg86 <= $signed((|(8'h9d)));
            end
          if (wire7[(4'h8):(2'h3)])
            begin
              reg87 <= ((&reg86) < wire59[(4'hb):(4'hb)]);
              reg88 <= (($signed(((wire54 && wire62) ?
                      reg85[(4'ha):(4'h8)] : (^wire7))) ?
                  wire54 : wire61) ~^ ((wire58 ?
                  $unsigned((reg85 ~^ wire61)) : (wire8[(2'h3):(2'h2)] == {(8'had)})) <<< wire68[(4'h8):(3'h6)]));
              reg89 <= $unsigned((^(+wire7[(4'h9):(2'h2)])));
              reg90 <= (8'ha1);
              reg91 <= (|$unsigned(($signed((reg64 ~^ reg89)) ?
                  $unsigned($unsigned(reg87)) : wire7)));
            end
          else
            begin
              reg87 <= $signed(reg91);
            end
          reg92 <= $unsigned((~(reg63 <= ((wire8 * (8'hb5)) ?
              wire67 : wire59[(2'h3):(2'h3)]))));
        end
      reg93 <= (reg90 ?
          (~reg83) : {$signed(((wire56 | wire58) || wire68[(4'ha):(2'h3)])),
              (wire67[(2'h2):(1'h1)] ? reg87 : wire6)});
    end
  always
    @(posedge clk) begin
      reg94 <= wire6;
      reg95 <= $unsigned($unsigned($unsigned(wire54)));
    end
  assign wire96 = wire6;
  assign wire97 = (~{{(!(wire59 ? wire67 : wire6))}, wire62});
  assign wire98 = $unsigned(reg65[(2'h3):(1'h0)]);
  assign wire99 = ((wire62[(4'h9):(3'h7)] << wire9[(3'h4):(3'h4)]) ?
                      $signed(wire67) : (wire61 ?
                          (((wire98 ? wire69 : wire81) ?
                                  {wire8, (8'hb3)} : $signed(reg89)) ?
                              wire68[(4'h8):(2'h3)] : $signed((reg84 ^ wire81))) : $signed($unsigned(reg86[(2'h2):(2'h2)]))));
  assign wire100 = reg94;
  assign wire101 = (-(!$unsigned(wire96[(2'h2):(2'h2)])));
  assign wire102 = wire67;
  assign wire103 = (&$signed((8'ha8)));
endmodule

module module70
#(parameter param80 = {({(+(8'ha8))} << (!(((8'ha8) ? (7'h42) : (8'h9f)) ? {(8'ha9), (8'hb2)} : ((8'ha4) ? (8'ha6) : (8'ha2))))), (~^{(~(+(7'h44)))})})
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire74;
  input wire [(4'h9):(1'h0)] wire73;
  input wire [(2'h2):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  assign y = {wire79, wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = (^((8'hba) ?
                      wire71[(2'h3):(1'h1)] : (^~wire74[(4'ha):(3'h6)])));
  assign wire76 = $signed((|wire72));
  assign wire77 = wire75[(1'h0):(1'h0)];
  assign wire78 = (((((8'hbd) || $unsigned(wire74)) >> ($unsigned(wire74) ?
                              (8'hba) : (-wire77))) ?
                          (^~(wire71[(2'h3):(2'h3)] ?
                              (wire72 ?
                                  wire77 : wire77) : $signed((8'hbc)))) : ((wire77[(2'h2):(1'h1)] & $signed((8'ha1))) <= wire71[(4'hc):(3'h6)])) ?
                      (&$unsigned(wire74)) : wire76);
  assign wire79 = wire75;
endmodule

module module10
#(parameter param52 = ((8'hbb) ^ (((((7'h43) ^ (8'hb1)) <= (!(8'hb8))) ~^ (!{(8'hb8)})) || ((((8'haa) ? (8'h9e) : (7'h44)) || (^~(8'hac))) ? (((8'ha4) ? (8'h9f) : (8'haf)) ? ((8'hb8) ? (8'hb1) : (8'haf)) : ((8'ha0) ? (8'hb2) : (8'hb7))) : (|(!(8'ha5)))))), 
parameter param53 = (param52 ? ((((param52 ? param52 : param52) | (param52 && param52)) ? {(param52 || param52)} : ({param52, param52} ? {param52} : param52)) >= param52) : param52))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire31,
                 wire30,
                 wire18,
                 wire17,
                 wire16,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire16 = ((+{(~&(~wire11)),
                      (wire12[(4'hb):(4'hb)] * (wire14 ^~ wire13))}) << $signed({wire12}));
  assign wire17 = (((&$signed({wire11})) ^~ ((~&$unsigned(wire16)) ?
                      $signed(wire14[(1'h1):(1'h0)]) : {(+wire16)})) * wire16);
  assign wire18 = (~^wire15[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg19 <= wire14[(2'h2):(2'h2)];
      reg20 <= wire13;
      reg21 <= (wire18 != wire18);
      if ($signed($signed($signed((8'hba)))))
        begin
          reg22 <= wire17;
          if ((+$signed((8'hb4))))
            begin
              reg23 <= reg20;
              reg24 <= (($signed(wire14[(1'h1):(1'h0)]) >>> reg22) > ((~|wire18) || $unsigned(wire16[(4'hc):(2'h2)])));
              reg25 <= wire15;
            end
          else
            begin
              reg23 <= wire17[(1'h0):(1'h0)];
              reg24 <= wire16[(3'h7):(2'h3)];
              reg25 <= (8'hb6);
              reg26 <= $signed(((^~reg19[(2'h2):(2'h2)]) ?
                  {(-wire12[(3'h4):(1'h1)]),
                      $signed({wire11})} : (($unsigned(wire18) + {wire13,
                      wire15}) < (|reg21))));
              reg27 <= reg21;
            end
          reg28 <= ($unsigned({$unsigned((wire13 ? reg21 : reg20)),
              wire14}) + $unsigned($unsigned(wire15[(3'h4):(1'h0)])));
        end
      else
        begin
          reg22 <= wire12;
        end
      reg29 <= $signed({(8'hbf)});
    end
  assign wire30 = $signed(reg19);
  assign wire31 = $unsigned(reg26[(4'hd):(1'h1)]);
  always
    @(posedge clk) begin
      reg32 <= (reg29 | (((~{wire14, reg29}) || (|(reg22 ?
          wire18 : wire17))) + $signed((&wire12[(4'h9):(3'h5)]))));
      reg33 <= (&$unsigned((((wire30 ? (8'h9f) : (8'hba)) ?
          wire14 : $signed(reg22)) >> {(~^reg32)})));
      reg34 <= (7'h40);
      reg35 <= ({reg23} + $signed((((reg32 > reg29) == (wire15 ?
          reg25 : reg26)) & reg34)));
      if ((({{{(8'hb2), wire15}, reg23}, (~&(!(8'ha5)))} ?
          wire15[(4'h9):(1'h0)] : reg22[(1'h0):(1'h0)]) || (+reg29)))
        begin
          reg36 <= $signed(reg20[(2'h2):(2'h2)]);
          reg37 <= reg20[(4'h8):(3'h6)];
          if ({$unsigned((wire13 && reg29))})
            begin
              reg38 <= $signed(reg28);
              reg39 <= wire13[(2'h3):(1'h1)];
              reg40 <= (~|((~^$signed((~^reg32))) >= {reg38}));
              reg41 <= $signed(reg22);
            end
          else
            begin
              reg38 <= wire11;
              reg39 <= $unsigned((|$signed((!$unsigned((7'h40))))));
              reg40 <= {($signed($signed(reg20)) < $unsigned(reg20)),
                  ((~&$signed(((8'ha1) || (8'h9f)))) ?
                      {$signed((reg19 ?
                              wire30 : wire18))} : {(reg40 ~^ (wire31 ?
                              (8'ha8) : reg28))})};
              reg41 <= (8'hb2);
              reg42 <= ({reg34} ^ (($unsigned(wire30[(4'ha):(2'h3)]) != $unsigned((~&wire16))) + reg29));
            end
        end
      else
        begin
          if ($unsigned({$signed($unsigned($unsigned((8'hac)))),
              (($signed(wire14) + $unsigned(reg24)) ? (^~(^reg26)) : reg39)}))
            begin
              reg36 <= $signed($signed(reg36[(3'h7):(3'h7)]));
            end
          else
            begin
              reg36 <= $signed(wire12[(1'h1):(1'h1)]);
              reg37 <= (reg33 | (($unsigned($signed((7'h41))) << $signed(reg22)) ?
                  (-wire11) : (((wire15 - reg33) ?
                          {reg26, reg24} : $signed(reg20)) ?
                      reg37[(4'ha):(2'h2)] : (((8'hbf) ? wire18 : reg28) ?
                          reg34[(2'h3):(2'h3)] : wire30))));
              reg38 <= $signed(reg33[(3'h7):(2'h3)]);
            end
          reg39 <= (~|$unsigned(wire18));
        end
    end
  always
    @(posedge clk) begin
      reg43 <= (~|$unsigned((|$unsigned((8'ha7)))));
      if ((^~$signed(((^~{reg24}) >> {$unsigned(reg42)}))))
        begin
          reg44 <= (^~(reg28[(3'h5):(2'h2)] ? $signed(wire16) : (8'hac)));
          if ($unsigned({reg36[(2'h3):(2'h3)]}))
            begin
              reg45 <= $signed($unsigned({($unsigned(reg20) ?
                      {reg35, reg20} : (~&reg38))}));
              reg46 <= (reg38[(2'h3):(2'h2)] ?
                  $signed(($unsigned((&wire15)) ?
                      ((^(8'ha6)) ?
                          {wire13} : (reg28 - wire15)) : reg35[(2'h3):(2'h2)])) : (~$unsigned(reg38[(1'h1):(1'h1)])));
            end
          else
            begin
              reg45 <= reg35;
            end
          reg47 <= (!$unsigned(($unsigned((reg43 < reg27)) ?
              ((reg39 >>> wire18) ?
                  (wire18 ? wire31 : reg23) : reg40) : (~((8'ha0) ?
                  wire30 : reg36)))));
          reg48 <= reg32[(2'h2):(1'h1)];
        end
      else
        begin
          reg44 <= (((&{(^~reg38)}) ?
              ({$unsigned(wire13),
                  (reg35 ? reg20 : reg29)} + reg20) : $signed($signed((wire14 ?
                  reg45 : reg29)))) >> (7'h40));
        end
      reg49 <= ((((~^$unsigned(reg43)) ?
          reg47[(3'h5):(2'h3)] : (8'hbe)) + reg25[(2'h2):(1'h1)]) >= (8'hb5));
    end
  assign wire50 = wire16;
  assign wire51 = wire11[(1'h1):(1'h0)];
endmodule

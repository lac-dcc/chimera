module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire79;
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire5,
                 wire6,
                 wire79,
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
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $signed({$signed((8'ha8)),
                     {(~^((8'ha3) == wire2)),
                         (wire5[(3'h4):(3'h4)] ?
                             (|wire5) : $unsigned(wire1))}});
  module7 #() modinst80 (.wire10(wire1), .wire12(wire2), .wire8(wire5), .clk(clk), .wire11(wire4), .y(wire79), .wire9(wire6));
  always
    @(posedge clk) begin
      if (wire6[(1'h0):(1'h0)])
        begin
          reg81 <= {(wire2 ? (wire2[(4'hd):(4'hd)] << wire3) : wire1)};
          reg82 <= (~wire1);
          reg83 <= (($signed({((8'hb0) ? reg81 : wire2)}) ?
              $signed((-(!wire5))) : wire3[(5'h10):(3'h7)]) | wire1);
          if ({{$unsigned((~^(8'hbe)))}})
            begin
              reg84 <= wire79[(4'h8):(4'h8)];
              reg85 <= $signed(($signed(wire1) - $unsigned(wire4[(3'h7):(2'h2)])));
              reg86 <= ({{{{wire2, wire6}},
                          (wire3[(2'h2):(1'h1)] ? $signed(wire4) : (8'hb6))}} ?
                  {$unsigned($unsigned((wire0 > (8'hbc))))} : $signed({($signed(wire5) ~^ $signed(wire79)),
                      wire5[(3'h4):(1'h1)]}));
              reg87 <= reg82;
              reg88 <= $unsigned((8'hb2));
            end
          else
            begin
              reg84 <= (^~reg84);
              reg85 <= wire3;
              reg86 <= (-(($signed(reg88) + ((~|reg86) || wire5)) != (8'hb1)));
              reg87 <= wire5[(2'h3):(1'h0)];
              reg88 <= (~wire1[(1'h1):(1'h1)]);
            end
          reg89 <= (($signed(({(7'h41)} <= (wire3 && wire5))) ^ $signed($unsigned((reg81 ?
              wire2 : wire0)))) - wire2[(4'h9):(3'h4)]);
        end
      else
        begin
          if ({(~^((~$unsigned(reg88)) ~^ $unsigned(reg84))),
              (!(+wire1[(4'hc):(1'h0)]))})
            begin
              reg81 <= $unsigned($unsigned(($unsigned($signed(wire5)) | (reg87 ?
                  $signed(wire79) : $unsigned(wire1)))));
              reg82 <= reg87[(2'h3):(1'h1)];
              reg83 <= (reg81 ?
                  $unsigned(wire79[(2'h2):(2'h2)]) : $signed($signed(reg88)));
              reg84 <= (reg88 ?
                  reg86 : (({wire5[(1'h1):(1'h1)], (+reg83)} ?
                          ({reg83, wire1} ?
                              (reg84 ? reg82 : wire4) : (wire2 ?
                                  wire6 : (8'hbd))) : $unsigned((-wire4))) ?
                      $signed((wire5[(3'h5):(2'h3)] >= $signed(reg87))) : (reg89 ?
                          (8'hbd) : reg82[(4'h8):(3'h4)])));
              reg85 <= reg87[(1'h0):(1'h0)];
            end
          else
            begin
              reg81 <= (~^($signed(((~^reg86) != reg83)) + ({(~&reg86)} | $signed((wire2 ?
                  (8'hba) : wire0)))));
              reg82 <= $signed((reg88[(2'h3):(2'h3)] ?
                  reg88[(1'h0):(1'h0)] : (^~($signed(reg85) | reg88))));
              reg83 <= reg89;
              reg84 <= ($signed($signed((^(reg85 ? (8'hbf) : wire3)))) ?
                  reg84[(2'h3):(2'h3)] : ((reg82 ?
                      ($unsigned(wire6) ?
                          (|reg81) : reg86[(3'h7):(3'h7)]) : {(~wire1),
                          (&wire6)}) >> $signed({$unsigned(wire6),
                      (reg89 ? wire0 : wire4)})));
              reg85 <= ((~&$unsigned((((8'h9f) >> reg86) ?
                      (reg86 ? reg88 : wire4) : reg85[(2'h3):(2'h2)]))) ?
                  wire79 : $signed((reg83[(2'h2):(1'h0)] && (~^(reg81 | wire1)))));
            end
        end
      reg90 <= (({$unsigned($unsigned(reg83)),
              $unsigned(wire1[(3'h4):(1'h0)])} ^~ (8'haa)) ?
          ((($unsigned(reg87) ?
              (reg85 > reg89) : {wire1}) + wire79) | (($signed(reg87) ?
              wire79 : (^~(7'h41))) >>> {(wire1 >>> wire2),
              (~reg83)})) : reg85[(4'h9):(1'h0)]);
      reg91 <= ((~&reg85[(4'ha):(3'h6)]) * ($unsigned(((reg81 ^ reg88) | reg90[(4'hf):(4'he)])) ?
          $signed(((^~reg83) ~^ (~|wire0))) : ($unsigned($signed(reg81)) ?
              (reg87 ~^ {reg85, reg82}) : (!wire0))));
      reg92 <= (wire6[(2'h3):(2'h3)] != (~&reg89[(4'h8):(3'h5)]));
      reg93 <= {reg81};
    end
  assign wire94 = reg88;
  assign wire95 = ($signed(reg89) ?
                      (+$signed((reg87[(4'h8):(3'h4)] ?
                          reg84[(4'h9):(3'h5)] : reg92))) : $unsigned((~reg87)));
  assign wire96 = (8'ha3);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  assign y = {wire78,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire45,
                 wire44,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire14,
                 wire13,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire13 = ($signed((^~(~^(8'ha3)))) <= wire11[(1'h0):(1'h0)]);
  assign wire14 = wire8;
  always
    @(posedge clk) begin
      reg15 <= {($signed(wire14[(1'h0):(1'h0)]) ?
              (+$signed(wire11[(4'h9):(3'h6)])) : (wire12 ?
                  (~|wire13) : ((wire8 >>> wire14) ?
                      (~wire12) : wire13[(4'h8):(4'h8)])))};
      if (((~^{$unsigned((^(8'hb9)))}) ?
          $unsigned($signed(($signed(wire13) ?
              (wire8 ?
                  wire10 : wire10) : (^wire12)))) : (wire14[(3'h5):(3'h4)] ?
              $signed((8'ha7)) : (wire9 ? reg15 : $signed($signed(wire14))))))
        begin
          reg16 <= wire8;
        end
      else
        begin
          reg16 <= {wire10[(2'h3):(2'h3)], (8'hbe)};
          reg17 <= (-{($unsigned((reg16 ? reg15 : wire12)) ?
                  {$unsigned(wire9), wire10} : {wire10, $signed(wire12)}),
              $unsigned(((~reg15) >>> reg15))});
        end
      if (reg16)
        begin
          if ((^(~^(8'h9f))))
            begin
              reg18 <= (8'h9f);
              reg19 <= (reg18[(1'h1):(1'h1)] ?
                  reg18 : $unsigned((reg16[(1'h1):(1'h0)] || (wire9 | $unsigned(wire14)))));
            end
          else
            begin
              reg18 <= ((~|{(((8'haf) ? reg19 : wire12) ?
                          (wire12 ? reg15 : reg17) : {reg19, reg17}),
                      $signed(reg15)}) ?
                  $signed($unsigned(reg19[(1'h0):(1'h0)])) : $unsigned(($unsigned((^~wire14)) & (wire11 >> reg18))));
              reg19 <= $unsigned($signed(((~|reg18) ?
                  (!wire12) : (~|$unsigned(reg17)))));
            end
          reg20 <= $unsigned(reg19);
          reg21 <= ((wire11[(1'h1):(1'h0)] < (~|($unsigned(wire13) > (8'ha3)))) << ((reg20[(2'h3):(1'h1)] ?
                  ($unsigned(wire8) ?
                      {wire12} : $signed(wire9)) : $signed((|wire8))) ?
              wire14 : wire13));
          reg22 <= $signed($signed((~^(((8'hab) <= wire12) | reg19[(1'h0):(1'h0)]))));
          reg23 <= $signed((^(&wire13)));
        end
      else
        begin
          reg18 <= (wire11 <<< $unsigned($unsigned(((wire8 ?
              reg18 : wire9) <<< $signed((8'hab))))));
          if (reg15)
            begin
              reg19 <= $unsigned(reg16[(2'h2):(2'h2)]);
              reg20 <= reg16;
              reg21 <= $unsigned((wire12[(4'hc):(3'h4)] ?
                  (($unsigned(wire10) ? $signed(reg18) : (reg20 > (8'hb6))) ?
                      ($unsigned(wire14) < (8'ha9)) : (!wire9[(3'h4):(2'h2)])) : (~^(|(~|reg15)))));
            end
          else
            begin
              reg19 <= $unsigned($signed((|$unsigned($signed(wire11)))));
              reg20 <= $unsigned((($unsigned((8'h9e)) ?
                  $unsigned($unsigned(wire10)) : {{wire9},
                      (!(7'h44))}) + ((reg19 ?
                  (reg21 >= wire13) : reg22) * wire11)));
            end
          reg22 <= reg21;
          reg23 <= $unsigned(reg17);
          reg24 <= ({$unsigned((reg22[(5'h12):(1'h0)] ?
                      (~&wire11) : {(8'had)})),
                  (&$signed($signed(reg22)))} ?
              $unsigned($unsigned(reg22[(5'h14):(3'h4)])) : reg23[(3'h7):(2'h3)]);
        end
      reg25 <= $signed((~|reg16[(1'h1):(1'h1)]));
      reg26 <= $signed(((&(((8'ha0) >= wire8) ? (~^reg23) : reg23)) | wire10));
    end
  assign wire27 = reg15[(1'h1):(1'h0)];
  assign wire28 = (reg23[(4'h9):(1'h1)] ?
                      (|((wire11[(4'h9):(3'h5)] >> (wire9 ?
                          (8'hbb) : wire8)) + wire10[(2'h3):(1'h1)])) : $signed(reg25));
  assign wire29 = $signed($signed($signed(reg22)));
  assign wire30 = reg23;
  assign wire31 = {((reg26 ? $unsigned((~(8'had))) : reg15[(1'h0):(1'h0)]) ?
                          $unsigned((8'hb0)) : wire13[(1'h1):(1'h1)])};
  assign wire32 = ($unsigned(wire8[(2'h3):(2'h3)]) ? wire28 : (^reg21));
  assign wire33 = $signed(wire11);
  always
    @(posedge clk) begin
      if ($signed($signed((7'h40))))
        begin
          reg34 <= reg23;
          reg35 <= {(|reg20[(4'h8):(3'h4)]),
              $signed($unsigned((~&$signed(wire9))))};
        end
      else
        begin
          reg34 <= wire32[(2'h3):(1'h0)];
          reg35 <= ({{$signed((reg21 < reg26))},
              (reg21 || (~^$signed(reg25)))} ^~ {$signed(reg22[(5'h11):(4'he)])});
          if (((((^~$signed(reg25)) ~^ (wire12 ?
                  $unsigned(wire8) : (~|(8'haf)))) ?
              wire12[(4'ha):(3'h4)] : reg22) ^~ (8'h9e)))
            begin
              reg36 <= ($unsigned(reg20) & wire29[(1'h1):(1'h1)]);
              reg37 <= $signed($unsigned((8'hbc)));
              reg38 <= reg26[(4'he):(3'h6)];
              reg39 <= wire31;
              reg40 <= {(reg24 ?
                      wire14[(3'h4):(1'h1)] : ({wire27[(3'h5):(1'h0)]} ?
                          (&$signed(reg16)) : $signed((reg39 <<< reg21))))};
            end
          else
            begin
              reg36 <= ((^~reg37[(2'h3):(2'h2)]) ?
                  $unsigned((|({(8'h9d),
                      reg26} >= $unsigned(reg36)))) : ((^~(~&wire33)) ^ wire9));
              reg37 <= wire33[(3'h6):(2'h2)];
              reg38 <= $signed(reg22[(1'h0):(1'h0)]);
            end
          reg41 <= (~&$signed($signed($unsigned($signed(wire32)))));
        end
      reg42 <= reg20[(3'h6):(3'h4)];
      reg43 <= $signed(((({wire29} ? ((8'hbc) - wire28) : (wire11 << wire8)) ?
              (reg40[(4'h8):(2'h2)] ?
                  $unsigned((8'ha0)) : (wire11 != wire14)) : $signed($signed(reg39))) ?
          $signed($signed({(8'ha5)})) : ($unsigned(((8'ha3) ? reg18 : wire8)) ?
              $unsigned((reg37 ? reg15 : reg42)) : (wire33 || {wire12,
                  reg23}))));
    end
  assign wire44 = (~{(~$signed(wire32[(2'h3):(2'h3)]))});
  assign wire45 = $signed((reg43[(3'h4):(1'h1)] ? $unsigned(wire11) : reg37));
  module46 #() modinst62 (.wire51(reg39), .wire48(wire29), .wire47(wire27), .y(wire61), .wire49(reg20), .wire50(reg41), .clk(clk));
  assign wire63 = $signed({reg18});
  assign wire64 = (wire14[(1'h1):(1'h1)] && $signed((wire9[(3'h7):(1'h1)] ?
                      (wire30[(1'h0):(1'h0)] - reg18[(4'h8):(1'h0)]) : ((~|reg19) * $unsigned(reg37)))));
  assign wire65 = ($unsigned(wire12) & ((|$unsigned($signed(reg26))) ?
                      ((wire64[(2'h3):(2'h3)] ?
                              ((7'h42) ? reg20 : wire44) : (wire45 ?
                                  reg22 : wire13)) ?
                          wire9 : reg19) : ($signed($unsigned(wire64)) ~^ $unsigned($signed(wire8)))));
  assign wire66 = reg39;
  assign wire67 = wire29;
  assign wire68 = (($signed(wire33) | $signed((reg20[(3'h4):(1'h0)] ?
                          (reg25 - wire12) : (^reg35)))) ?
                      reg26 : reg24);
  always
    @(posedge clk) begin
      if ((~&(reg41[(4'hb):(3'h7)] ~^ ($unsigned(wire28[(2'h2):(1'h0)]) != ($unsigned(wire44) <<< {(8'h9e),
          wire11})))))
        begin
          reg69 <= reg39;
        end
      else
        begin
          reg69 <= $unsigned($signed(reg20[(3'h5):(2'h2)]));
          reg70 <= (~^($unsigned((~^$unsigned(wire30))) ?
              $signed((reg24 ?
                  (^(8'hb1)) : $signed(reg17))) : (~&$signed((wire44 ?
                  reg16 : (8'ha5))))));
          if (((~^(reg16[(2'h3):(1'h1)] ?
              $unsigned((&wire13)) : {(!reg42),
                  reg17[(1'h0):(1'h0)]})) && $unsigned({$unsigned((wire8 > (8'ha8)))})))
            begin
              reg71 <= (^~(~^$unsigned((|(~reg20)))));
              reg72 <= (~|$signed($unsigned(($unsigned(reg26) ?
                  $signed(wire68) : (reg40 && reg23)))));
              reg73 <= reg71;
              reg74 <= $unsigned((|$signed($unsigned((wire45 ?
                  reg72 : reg26)))));
              reg75 <= $unsigned(($unsigned(({wire13,
                      reg19} & reg17[(3'h7):(1'h0)])) ?
                  $signed(reg39[(2'h3):(1'h1)]) : $unsigned(reg25[(2'h2):(1'h1)])));
            end
          else
            begin
              reg71 <= (reg22[(1'h1):(1'h0)] > (8'ha4));
              reg72 <= reg41[(3'h4):(2'h3)];
              reg73 <= ($unsigned(({reg43, $signed(reg73)} ?
                  (~(^~reg75)) : ((reg69 ?
                      reg35 : (8'hb1)) ^~ $signed(wire14)))) <<< reg21);
            end
          reg76 <= reg36;
        end
      reg77 <= wire11[(4'hc):(2'h2)];
    end
  assign wire78 = reg26[(4'he):(4'h8)];
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire51;
  input wire [(3'h4):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(3'h7):(1'h0)] wire48;
  input wire [(5'h11):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 (1'h0)};
  assign wire52 = $signed($signed(wire51[(1'h1):(1'h1)]));
  assign wire53 = $signed(wire48[(2'h3):(1'h1)]);
  assign wire54 = (8'hb4);
  assign wire55 = (8'hb0);
  assign wire56 = wire55[(2'h3):(2'h3)];
  assign wire57 = (-$unsigned($unsigned((~&(&wire52)))));
  assign wire58 = ($unsigned($signed({$unsigned(wire55)})) ?
                      $unsigned((wire57[(2'h3):(1'h0)] << wire55)) : ($signed($unsigned($unsigned(wire52))) ?
                          $unsigned({((8'hb1) ? wire54 : wire57),
                              $signed(wire57)}) : wire48[(1'h1):(1'h0)]));
  assign wire59 = (^~wire54[(1'h0):(1'h0)]);
  assign wire60 = (wire59[(2'h2):(1'h1)] ?
                      wire53[(3'h6):(2'h3)] : $signed((8'hbb)));
endmodule

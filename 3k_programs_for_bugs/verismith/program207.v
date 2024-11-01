module top
#(parameter param77 = (!(((((8'hb1) + (8'h9f)) ? (~&(8'h9e)) : (&(8'hb5))) ? (~^((8'ha6) ? (8'h9d) : (8'haa))) : ({(8'h9f), (8'ha0)} ? (~(8'hbf)) : ((8'hae) << (8'hb1)))) ? (~&((|(8'hb1)) || ((8'hb0) | (7'h44)))) : {(~^((8'hb6) ? (8'ha6) : (8'ha1))), ({(8'hb9)} ? (+(7'h44)) : (~&(8'hbc)))})), 
parameter param78 = param77)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire76,
                 wire70,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg7,
                 (1'h0)};
  assign wire5 = (-(^~wire1));
  assign wire6 = {$unsigned({((~^wire3) ? wire0 : $signed(wire4)), wire0}),
                     {$signed(wire1[(2'h2):(1'h0)]), $signed((wire3 + wire0))}};
  always
    @(posedge clk) begin
      reg7 <= ($unsigned(wire4[(4'h8):(2'h2)]) ^ wire1[(3'h4):(1'h1)]);
    end
  assign wire8 = (~^(($signed(wire4[(5'h12):(5'h12)]) - wire1) - (wire3[(1'h0):(1'h0)] ?
                     {wire2[(2'h3):(1'h0)]} : wire2)));
  assign wire9 = ((7'h41) <= $unsigned((&($unsigned(reg7) ?
                     $unsigned(wire3) : ((8'hba) ? wire4 : wire6)))));
  assign wire10 = (wire5 ^ wire0[(2'h2):(2'h2)]);
  assign wire11 = wire9[(2'h2):(1'h1)];
  assign wire12 = ((^($unsigned($signed((8'hb7))) ?
                      (8'ha9) : $signed((reg7 < wire1)))) ^ $signed(wire10[(4'hb):(4'h9)]));
  assign wire13 = wire5;
  assign wire14 = (^~wire13);
  assign wire15 = {(&wire10),
                      $signed($unsigned($unsigned(wire2[(1'h1):(1'h1)])))};
  assign wire16 = {$unsigned(wire1[(4'hb):(2'h3)]),
                      ($signed($unsigned((wire14 >> wire3))) ?
                          ($unsigned({wire4}) ?
                              ((&wire5) ?
                                  (~wire10) : $signed(wire12)) : wire12) : $signed(wire1))};
  assign wire17 = (8'hbc);
  assign wire18 = (((~^$unsigned({reg7})) ?
                          $unsigned($signed((^~reg7))) : (($signed(wire4) < $unsigned(wire15)) == (~&$signed(wire4)))) ?
                      wire10 : {wire13, wire11});
  module19 #() modinst71 (wire70, clk, wire11, wire12, reg7, wire2, wire4);
  always
    @(posedge clk) begin
      reg72 <= (wire16 ?
          $unsigned(((wire10 << {wire6}) ?
              wire0[(2'h3):(2'h3)] : ($signed(wire18) >= (wire17 > (8'hb1))))) : ($unsigned((wire9 ?
                  $signed(wire4) : wire6[(3'h6):(1'h1)])) ?
              ($signed((wire3 ? (8'hb1) : wire16)) * $signed((wire18 ?
                  wire4 : (8'hb0)))) : (8'ha7)));
      reg73 <= (wire17[(3'h5):(3'h4)] ^~ wire2[(2'h2):(2'h2)]);
      reg74 <= wire6;
      reg75 <= (wire2[(3'h6):(3'h6)] && (|{wire14}));
    end
  assign wire76 = {(((wire1[(3'h4):(3'h4)] != {wire0,
                              wire4}) > (~^(reg74 <= (8'hac)))) ?
                          ($unsigned((wire2 ? wire18 : wire13)) ?
                              $unsigned(wire18) : $signed($signed(wire6))) : (~^(8'hab)))};
endmodule

module module19
#(parameter param69 = (((8'hb7) >= ((&{(8'ha7)}) >> {((8'ha8) == (8'haf)), {(8'hbd), (8'had)}})) ? {((~|((8'h9c) ? (8'haa) : (8'ha6))) ? (((8'hb1) >> (8'hb4)) && {(8'hbd), (8'hb5)}) : (((8'hbc) || (8'hbd)) >>> {(8'hb8), (8'ha8)})), (((^(8'hb9)) || (-(8'hba))) <<< (-{(8'hbb)}))} : ((-((|(8'hb3)) ^~ {(8'hb3), (8'had)})) << {(((8'ha5) ~^ (8'ha3)) + (^~(8'ha3)))})))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
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
                 (1'h0)};
  assign wire25 = wire22;
  assign wire26 = (8'h9c);
  assign wire27 = (wire24 ~^ wire20[(2'h3):(1'h1)]);
  assign wire28 = (^wire21[(3'h5):(2'h3)]);
  assign wire29 = wire20[(1'h1):(1'h0)];
  assign wire30 = wire24;
  assign wire31 = $unsigned((($signed(wire26[(2'h2):(1'h0)]) ?
                          (8'h9f) : (8'hb4)) ?
                      ((7'h42) <<< wire23[(4'hb):(4'ha)]) : (&wire28[(1'h0):(1'h0)])));
  assign wire32 = $signed(wire29[(4'hb):(3'h4)]);
  always
    @(posedge clk) begin
      reg33 <= ($signed(wire28) | wire26[(1'h1):(1'h1)]);
      reg34 <= $signed(wire30);
      if (((wire23[(4'hc):(2'h3)] ? wire30 : (8'hbf)) ?
          ((wire28 <<< wire24) == ($signed((wire22 ?
              wire23 : wire28)) > wire28)) : {reg33, wire32}))
        begin
          reg35 <= (((((8'ha4) ? (+wire20) : $signed(wire23)) ?
                  (reg34 != (wire32 ?
                      wire27 : reg33)) : $unsigned($signed(wire27))) + (8'ha4)) ?
              wire20 : ((wire28[(2'h2):(1'h0)] ?
                      $unsigned((^wire26)) : reg34[(4'h8):(1'h0)]) ?
                  $signed(wire29) : wire27[(4'ha):(2'h3)]));
          reg36 <= reg35[(2'h2):(2'h2)];
          if (($unsigned({wire28}) ?
              ((((wire24 ?
                      (8'hb6) : wire28) > $signed(reg34)) > $unsigned($signed(wire26))) ?
                  (^~(8'hbf)) : {reg36[(2'h3):(1'h1)],
                      $unsigned((wire21 ? wire24 : wire28))}) : (~((reg35 ?
                      $signed(reg33) : (reg35 >= (8'had))) ?
                  {(|wire27)} : wire22))))
            begin
              reg37 <= wire24[(1'h0):(1'h0)];
              reg38 <= $unsigned(($unsigned((+(~&reg37))) ?
                  ((8'ha8) == ($signed(wire25) ?
                      $signed((8'hba)) : $unsigned(wire29))) : (!$signed((+wire26)))));
            end
          else
            begin
              reg37 <= wire22;
              reg38 <= $signed((~|{wire21[(3'h6):(3'h4)]}));
              reg39 <= $signed((wire21[(2'h3):(1'h1)] ?
                  wire25 : (~(&((7'h41) ? (8'hb7) : reg37)))));
            end
        end
      else
        begin
          reg35 <= wire27;
          if (wire31)
            begin
              reg36 <= $signed((&$signed((reg37 != (reg36 ?
                  wire23 : (7'h41))))));
              reg37 <= reg39;
            end
          else
            begin
              reg36 <= (reg36[(1'h0):(1'h0)] ?
                  $signed($unsigned(wire21)) : $signed(((^wire32[(3'h5):(1'h0)]) ?
                      wire30 : ((wire29 ? wire32 : wire25) ?
                          {(8'hb1), wire32} : (wire27 | wire27)))));
              reg37 <= $unsigned($signed((~|($unsigned(reg38) ?
                  (wire31 ? wire21 : wire29) : {wire21}))));
              reg38 <= $signed({$unsigned({(-wire28)})});
              reg39 <= wire29;
            end
          reg40 <= (wire20[(3'h5):(1'h0)] << reg34);
        end
      reg41 <= {(-wire28[(3'h5):(2'h3)])};
      reg42 <= (8'hbc);
    end
  assign wire43 = $unsigned((reg41 ?
                      reg36 : (wire30[(3'h6):(2'h3)] <<< (^~(wire32 ?
                          wire22 : reg39)))));
  assign wire44 = $signed(wire20[(1'h1):(1'h0)]);
  assign wire45 = ((^~(^($unsigned(wire28) - wire31))) + wire22);
  assign wire46 = reg39[(3'h6):(1'h0)];
  assign wire47 = ($signed(wire32) ?
                      ((reg40 ~^ {wire32, reg40}) ?
                          (~reg40[(4'hc):(3'h5)]) : wire22) : ($unsigned((^wire26[(3'h4):(1'h0)])) ?
                          ($unsigned(reg34[(3'h4):(2'h2)]) & $unsigned($unsigned(reg38))) : {{reg38[(1'h1):(1'h1)],
                                  reg33}}));
  assign wire48 = (&(wire22 ? (-(~^wire31)) : (-(8'ha4))));
  assign wire49 = {wire22[(4'h9):(1'h1)]};
  assign wire50 = $signed({(~&((reg33 & (8'hab)) >>> reg33[(2'h2):(1'h0)])),
                      wire49[(1'h0):(1'h0)]});
  module51 #() modinst65 (wire64, clk, wire30, wire45, reg35, reg40);
  assign wire66 = $unsigned($signed(wire25));
  assign wire67 = (^((($signed(reg33) != (wire44 ? wire50 : (8'ha1))) ?
                          $unsigned((!wire66)) : wire25) ?
                      ((reg35[(4'h8):(3'h5)] << $signed(wire25)) < (!$unsigned(reg39))) : reg40));
  assign wire68 = $unsigned(($unsigned(wire26[(1'h1):(1'h1)]) - $signed(wire23[(4'h8):(3'h6)])));
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  input wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire56 = $signed(({wire55[(3'h4):(3'h4)],
                      wire55} <= ((^$unsigned(wire52)) & wire53[(4'ha):(1'h0)])));
  assign wire57 = $signed(((8'h9d) * $signed(wire56)));
  assign wire58 = {($signed($signed((wire55 ^~ wire56))) ?
                          $signed((&$unsigned(wire56))) : $signed(($unsigned(wire53) == (wire57 || wire56)))),
                      wire53};
  assign wire59 = wire54[(1'h1):(1'h1)];
  assign wire60 = wire53[(4'ha):(1'h1)];
  assign wire61 = {($unsigned(((&wire59) ? (~wire57) : (+wire60))) ?
                          wire52[(3'h6):(1'h1)] : ($unsigned($signed(wire59)) ?
                              {{wire55, wire56},
                                  $unsigned((8'h9d))} : (wire57[(3'h5):(3'h5)] ?
                                  $unsigned(wire57) : (wire58 ?
                                      wire55 : wire55))))};
  always
    @(posedge clk) begin
      reg62 <= $signed($signed(wire58[(4'hc):(4'h9)]));
      reg63 <= ($unsigned($signed((~&wire54[(3'h5):(3'h4)]))) ?
          (($signed($signed(wire56)) ?
                  (wire52 ?
                      (8'hb1) : (wire52 ?
                          (8'hbd) : wire57)) : (^$signed(reg62))) ?
              $unsigned((!(wire52 ?
                  wire53 : (8'hbd)))) : ((~$signed(wire53)) & $unsigned($signed(wire53)))) : $signed($signed(wire58[(4'ha):(2'h3)])));
    end
endmodule

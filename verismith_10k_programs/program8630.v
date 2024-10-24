module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(4'h8):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire75,
                 wire6,
                 wire5,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire5 = $signed(($signed(((^~wire0) ?
                         {wire0, wire4} : wire3[(2'h3):(2'h3)])) ?
                     wire3[(1'h1):(1'h1)] : wire3[(1'h1):(1'h1)]));
  assign wire6 = {$unsigned($unsigned(wire4)),
                     {(8'hab),
                         ((8'hb0) ?
                             $unsigned((wire3 ?
                                 wire4 : (8'hbd))) : {(~|wire5)})}};
  module7 #() modinst76 (wire75, clk, wire1, wire5, wire2, wire6);
  always
    @(posedge clk) begin
      reg77 <= wire6[(4'hb):(4'hb)];
      if ($signed(wire6))
        begin
          reg78 <= (({$signed($unsigned(wire5))} ?
              ($unsigned(wire0) ?
                  ((&reg77) > $unsigned(wire75)) : ({wire1} ^~ $signed(reg77))) : $unsigned((!wire0))) ^~ (~^wire4));
        end
      else
        begin
          reg78 <= wire0[(3'h7):(3'h7)];
          reg79 <= wire3;
          reg80 <= (+wire6);
          reg81 <= $unsigned(((-{$signed(wire1), (~&(7'h43))}) ?
              $unsigned(reg78) : ($signed((^~wire0)) ?
                  wire3[(2'h2):(1'h0)] : (8'had))));
          reg82 <= (!$unsigned($unsigned(reg80)));
        end
      reg83 <= ($unsigned($unsigned(((8'hb7) >>> (wire2 >>> wire0)))) - (+{(reg77[(2'h2):(1'h0)] >> $signed(wire5)),
          $unsigned((wire4 << wire4))}));
      if ((reg80 + $signed($unsigned($unsigned((reg77 ? (8'hba) : reg78))))))
        begin
          reg84 <= (^$signed((({wire5} ? $unsigned((8'ha4)) : reg81) ?
              wire1 : $unsigned($unsigned(wire0)))));
          if ($unsigned($signed(reg82)))
            begin
              reg85 <= {$signed(((reg83 <= {(8'ha5),
                      wire5}) < reg79[(1'h1):(1'h0)]))};
              reg86 <= (~wire2[(4'he):(4'h8)]);
              reg87 <= reg79[(4'h9):(1'h1)];
            end
          else
            begin
              reg85 <= (($unsigned((~(7'h42))) ?
                  (~|$unsigned((reg80 << reg84))) : $unsigned(({reg81} || (wire1 > reg85)))) || ($unsigned($unsigned((|(8'ha7)))) ?
                  $signed((^~$unsigned(reg85))) : $unsigned(reg85)));
              reg86 <= wire2;
            end
          reg88 <= reg84;
          reg89 <= ((!reg79) ?
              $unsigned(reg85) : $signed(reg88[(1'h1):(1'h0)]));
          reg90 <= (!((&reg85) <= $signed($unsigned(reg80))));
        end
      else
        begin
          reg84 <= wire4;
          reg85 <= {(reg80[(4'ha):(4'h9)] <<< ({{reg90, (8'hbe)}, (!(8'haa))} ?
                  ((wire0 ?
                      reg78 : reg90) <<< wire6[(4'h9):(4'h9)]) : wire3[(2'h2):(2'h2)]))};
          reg86 <= (~&reg84[(4'h9):(4'h9)]);
          if ((&$signed($signed((&(-wire5))))))
            begin
              reg87 <= $unsigned((wire4[(4'hd):(2'h2)] ?
                  $signed(reg84[(3'h7):(3'h6)]) : wire75[(1'h0):(1'h0)]));
              reg88 <= ($signed((reg78[(5'h12):(4'h8)] - ((!reg83) != {reg87}))) ~^ (-(((^~wire4) ?
                  (reg89 ? wire0 : (8'ha9)) : {reg81}) >>> (reg81 ?
                  {(8'hab), (7'h42)} : wire5))));
              reg89 <= $unsigned(reg82);
              reg90 <= $signed(($signed($unsigned($signed(reg90))) << reg86[(3'h6):(3'h4)]));
              reg91 <= $signed($unsigned((-{wire75[(1'h0):(1'h0)], (8'h9f)})));
            end
          else
            begin
              reg87 <= (7'h43);
              reg88 <= reg79;
              reg89 <= (wire5[(4'hf):(3'h5)] ?
                  $signed(wire3[(1'h0):(1'h0)]) : ($signed(reg80) ?
                      reg86[(4'hb):(3'h6)] : ($signed((8'hb4)) ^~ ((~wire3) ?
                          reg80 : (wire3 ? reg81 : reg84)))));
            end
        end
      reg92 <= (^(8'hb1));
    end
  always
    @(posedge clk) begin
      reg93 <= (~|wire4[(4'h9):(3'h6)]);
      reg94 <= $unsigned({reg93[(2'h2):(2'h2)],
          (^~(~|(wire0 ? reg82 : wire0)))});
    end
  assign wire95 = $signed((~|reg93));
  assign wire96 = (!wire2[(3'h6):(2'h2)]);
  assign wire97 = $unsigned(reg93);
  assign wire98 = ($unsigned(((~|{reg87, reg89}) ?
                      reg81 : $unsigned((-wire96)))) & reg90[(1'h1):(1'h1)]);
endmodule

module module7
#(parameter param73 = (((({(8'hab)} << {(8'ha2)}) ? (-(&(8'hb3))) : (|{(8'ha2)})) ? (8'ha7) : ({((7'h44) ? (8'ha5) : (8'ha1)), ((8'hab) ? (8'ha5) : (8'hb3))} >> (8'hba))) ? (^({((7'h41) < (7'h40))} || (((8'ha2) ? (8'hae) : (7'h44)) && ((8'hae) >> (8'hbe))))) : (&((((8'hb5) ? (8'h9e) : (8'ha2)) ^~ ((8'ha1) ? (7'h42) : (8'haf))) | (^~((8'ha1) > (8'hb4)))))), 
parameter param74 = (8'ha5))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  assign y = {wire71,
                 wire40,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire12 = $signed(({$signed(wire10)} ?
                      (8'ha2) : $unsigned(wire10[(1'h0):(1'h0)])));
  assign wire13 = $signed((|(((!(8'hb6)) == (wire10 > wire10)) ?
                      wire8 : ((wire8 >> wire10) ?
                          $signed(wire9) : wire12[(1'h1):(1'h0)]))));
  assign wire14 = wire13[(2'h2):(1'h1)];
  assign wire15 = wire9[(4'h9):(2'h2)];
  assign wire16 = $signed(($unsigned($unsigned(((8'ha5) & wire13))) ?
                      wire9[(3'h7):(1'h0)] : ((+$unsigned(wire11)) != (-(wire12 ?
                          wire8 : wire10)))));
  assign wire17 = $signed((-wire13[(1'h1):(1'h0)]));
  assign wire18 = (~|((wire12 ? wire14 : wire10) ?
                      {((wire17 <<< wire8) ? wire10 : (|wire10))} : wire12));
  always
    @(posedge clk) begin
      reg19 <= ($signed((($signed(wire18) ^~ $unsigned(wire14)) ?
              $signed(wire10[(3'h4):(2'h3)]) : ((wire14 && wire12) || wire17))) ?
          $signed($unsigned(($signed(wire8) ?
              $unsigned(wire13) : (+wire13)))) : (7'h41));
    end
  always
    @(posedge clk) begin
      if (((8'hb1) ?
          (!$unsigned(({(8'ha6),
              wire18} >= (wire12 << wire15)))) : {$signed($unsigned(((8'ha7) ~^ wire11))),
              wire16}))
        begin
          reg20 <= (8'ha7);
        end
      else
        begin
          reg20 <= $signed($unsigned((|({wire15, (8'hb8)} ?
              (|wire15) : reg20))));
        end
      if (wire10)
        begin
          reg21 <= (({$signed($signed(wire13))} && wire18) ?
              (&{wire9}) : ($unsigned((+wire17)) > wire18));
        end
      else
        begin
          reg21 <= {$signed((+$unsigned(wire16)))};
          reg22 <= $signed(wire8[(2'h2):(1'h0)]);
          reg23 <= ((($unsigned($unsigned(wire12)) << ((~|wire10) ?
                      ((8'hbb) ? (8'h9c) : reg21) : $signed(wire9))) ?
                  {((wire11 ? wire18 : wire8) * $unsigned(wire18)),
                      {(reg22 > wire9), {reg19}}} : wire17) ?
              (reg20[(3'h4):(1'h0)] != reg20) : $unsigned({(wire16 <= wire16[(3'h5):(3'h4)]),
                  $unsigned($unsigned(wire10))}));
          reg24 <= $signed(wire10[(3'h7):(1'h1)]);
          reg25 <= $unsigned($signed($unsigned(reg24)));
        end
      if (($unsigned(((reg24[(3'h4):(2'h2)] + {wire14, wire12}) >= reg24)) ?
          wire18 : ($signed($signed(reg24[(4'hd):(4'ha)])) >>> $unsigned(($unsigned(reg23) * wire18[(3'h4):(2'h3)])))))
        begin
          if ($signed(({($unsigned(reg25) ? {reg23, wire14} : $unsigned(reg24)),
              reg20} && (^~{{wire18}, (^(8'hbf))}))))
            begin
              reg26 <= {reg25[(3'h5):(1'h0)],
                  $signed($unsigned($unsigned((wire16 ? reg25 : (8'hb7)))))};
              reg27 <= {{$signed(({(8'hb4), wire13} < (^wire11))),
                      ($unsigned((wire15 ~^ reg23)) && wire15)},
                  wire14[(3'h5):(1'h1)]};
            end
          else
            begin
              reg26 <= ($signed(((reg19[(3'h5):(2'h3)] | reg20[(4'h9):(1'h1)]) ?
                  (~&(reg19 >>> (8'hb9))) : (^(~^wire16)))) * wire16[(3'h5):(2'h3)]);
            end
          reg28 <= $signed((-wire12[(3'h6):(1'h0)]));
        end
      else
        begin
          if ($unsigned(reg24[(3'h5):(1'h1)]))
            begin
              reg26 <= (+$unsigned($unsigned($signed(reg20))));
              reg27 <= (7'h41);
            end
          else
            begin
              reg26 <= $unsigned({((reg23 >= (wire13 >>> wire13)) || $unsigned((|wire16)))});
              reg27 <= (($signed(reg25[(4'hd):(4'h8)]) ?
                  wire13[(2'h2):(1'h0)] : wire12[(4'h9):(1'h1)]) <<< wire17[(4'h8):(3'h4)]);
              reg28 <= (($unsigned(wire9[(4'hc):(4'h9)]) ~^ wire11) ?
                  $unsigned((wire16[(3'h7):(3'h4)] ?
                      $signed({wire10}) : ($unsigned(reg23) && $signed(wire12)))) : wire18[(2'h2):(1'h0)]);
              reg29 <= ((8'hb2) ?
                  reg25 : {((~|wire15[(4'h8):(3'h6)]) * (+(reg28 ?
                          wire8 : wire9))),
                      wire16[(3'h5):(1'h0)]});
              reg30 <= $unsigned((~&wire8));
            end
          if ((({{(reg26 ? wire8 : reg22)}} + (($signed(wire16) ?
                      (reg21 ? reg26 : reg24) : $unsigned(reg24)) ?
                  $signed((wire17 >> reg28)) : $unsigned((~^wire12)))) ?
              reg27 : reg20[(2'h3):(1'h0)]))
            begin
              reg31 <= $signed(($unsigned(($unsigned(reg23) ?
                      (8'hba) : (!wire18))) ?
                  $unsigned(wire11[(2'h3):(1'h0)]) : ((~^(reg21 ?
                          reg30 : reg30)) ?
                      $signed((&reg22)) : ($signed(wire15) << (~|reg23)))));
            end
          else
            begin
              reg31 <= $signed(((((|reg24) && {wire15,
                  (8'hae)}) * reg21) ^~ wire17[(2'h3):(1'h0)]));
              reg32 <= $signed((8'ha7));
              reg33 <= (!{(($signed(wire16) ~^ {reg28, wire15}) ?
                      $unsigned(wire8) : $unsigned((!(8'ha6)))),
                  wire10});
            end
          reg34 <= ((reg28 * ({wire14, (^wire11)} ?
                  (^~(reg30 ? (8'hba) : reg20)) : ((&wire18) ?
                      (reg33 >> reg29) : reg25[(3'h5):(3'h5)]))) ?
              $signed(wire16[(3'h4):(2'h2)]) : $unsigned(($signed((wire9 ?
                      wire12 : reg20)) ?
                  {{reg30, wire11}} : (wire16[(1'h1):(1'h0)] ?
                      {reg28, reg33} : (wire10 ? wire14 : wire18)))));
          if ($signed({reg34[(4'hf):(4'ha)]}))
            begin
              reg35 <= reg34;
              reg36 <= {$unsigned({reg29, reg21[(2'h3):(2'h3)]})};
              reg37 <= wire18[(2'h2):(1'h0)];
              reg38 <= $signed($unsigned(wire12));
            end
          else
            begin
              reg35 <= wire15;
              reg36 <= reg33;
              reg37 <= (({{(reg23 ? reg28 : wire8), reg23[(4'h8):(3'h5)]},
                          wire15[(3'h7):(3'h6)]} ?
                      ((wire17[(1'h0):(1'h0)] ?
                              (wire11 ?
                                  (8'haa) : wire17) : (wire15 ^~ wire16)) ?
                          wire15[(2'h3):(1'h1)] : {((8'ha2) + reg30),
                              $signed(reg36)}) : wire15[(4'hc):(2'h2)]) ?
                  wire15 : wire13[(1'h0):(1'h0)]);
              reg38 <= (reg33[(3'h4):(1'h1)] ?
                  ((&(|$signed(reg38))) | wire17[(4'he):(3'h6)]) : {($unsigned((reg20 >> reg35)) <<< $signed((|wire13))),
                      reg34[(4'h9):(3'h4)]});
            end
          reg39 <= $signed({wire15});
        end
    end
  assign wire40 = {$unsigned(wire12[(2'h2):(2'h2)]),
                      ($signed((^(wire10 | wire11))) ?
                          (^~reg32[(4'h8):(2'h3)]) : (((~(8'hb5)) < {(8'hb9)}) * (^reg34)))};
  module41 #() modinst72 (wire71, clk, reg32, wire15, reg33, wire16, reg38);
endmodule

module module41  (y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire46;
  input wire signed [(4'ha):(1'h0)] wire45;
  input wire [(3'h6):(1'h0)] wire44;
  input wire [(3'h4):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire47;
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  assign y = {wire70,
                 wire62,
                 wire61,
                 wire47,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 (1'h0)};
  assign wire47 = (((!(wire46[(3'h7):(1'h1)] >= (wire44 ? wire44 : wire46))) ?
                      wire42[(4'hc):(1'h1)] : wire42[(3'h6):(3'h6)]) != (wire46 && wire42[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ($signed((~^{$signed(wire47)})))
        begin
          reg48 <= (((~^(8'hb4)) ?
                  wire45 : ((wire46 <= wire44) ?
                      ((wire46 ? wire43 : wire43) ?
                          wire46 : (wire45 ?
                              wire46 : wire43)) : $signed(wire44))) ?
              (8'ha3) : ({(wire43 ?
                          $signed(wire43) : (wire45 ? wire45 : (8'ha5)))} ?
                  wire46 : $signed(wire45[(3'h4):(3'h4)])));
          reg49 <= $signed((wire43[(3'h4):(2'h3)] <<< $unsigned(wire43[(3'h4):(1'h0)])));
          reg50 <= wire43;
          if ((reg48 ?
              $signed($signed(wire44[(2'h3):(1'h1)])) : ($unsigned(((reg48 ?
                      wire45 : wire42) ?
                  (wire47 ? (8'ha0) : reg49) : {wire43,
                      wire43})) - reg50[(3'h4):(2'h2)])))
            begin
              reg51 <= (!$unsigned((+wire43)));
              reg52 <= ((~$signed((wire45 ?
                      (reg48 ? wire43 : wire46) : (wire44 << reg49)))) ?
                  ((((8'hb8) <<< reg48[(2'h3):(2'h2)]) ?
                      reg49 : (~(^~reg50))) <<< (($unsigned((8'hb6)) <= $unsigned(reg48)) << wire43)) : $signed(({$unsigned(wire42)} ?
                      wire47 : (+((8'hba) ? wire47 : wire42)))));
            end
          else
            begin
              reg51 <= $unsigned((~&((wire42[(4'hc):(4'hb)] << reg51[(1'h1):(1'h0)]) << (wire47 ?
                  $signed(wire46) : (wire47 + reg48)))));
              reg52 <= $unsigned($signed((~|reg51[(5'h12):(5'h12)])));
            end
        end
      else
        begin
          reg48 <= $unsigned(wire44[(1'h0):(1'h0)]);
          reg49 <= ($signed($unsigned($unsigned(wire43[(1'h0):(1'h0)]))) & $signed(reg50[(2'h3):(2'h2)]));
          reg50 <= (((+(!(reg50 ?
                  wire47 : wire47))) <= $signed($signed(reg48))) ?
              $unsigned($signed(((~&wire44) ?
                  {wire44, reg48} : (&(8'hba))))) : (wire42[(2'h2):(2'h2)] ?
                  (wire45[(4'h8):(1'h0)] ^~ reg48[(2'h2):(1'h1)]) : {$unsigned(wire43),
                      {(^reg52), reg49}}));
        end
      if ((^~reg51[(4'hb):(2'h2)]))
        begin
          reg53 <= reg48[(1'h1):(1'h0)];
          reg54 <= wire45[(4'ha):(4'h9)];
        end
      else
        begin
          reg53 <= (-wire43[(1'h0):(1'h0)]);
          reg54 <= reg51;
          reg55 <= $signed({reg48[(2'h2):(2'h2)],
              ($signed(wire47[(4'h8):(1'h1)]) ? reg54[(1'h1):(1'h1)] : reg51)});
        end
      reg56 <= ($unsigned((~&(|$signed(reg51)))) << {(&$signed(((8'h9c) <= wire44))),
          $unsigned(wire44)});
      reg57 <= (!reg49);
    end
  always
    @(posedge clk) begin
      reg58 <= reg49;
      reg59 <= reg52;
      reg60 <= reg52[(4'he):(4'h8)];
    end
  assign wire61 = {((~|(7'h44)) + ((reg48 > (reg49 >>> reg52)) ?
                          {(wire42 << reg50)} : (~^$unsigned(wire42)))),
                      (wire46 < ($unsigned(((8'h9e) | reg49)) ?
                          $signed($unsigned((8'h9f))) : reg48))};
  assign wire62 = $signed(reg56);
  always
    @(posedge clk) begin
      if ({$unsigned(((^~reg55[(1'h0):(1'h0)]) != reg56[(1'h1):(1'h0)]))})
        begin
          if ($signed({(($signed(reg55) ?
                  ((8'ha2) - (8'hb5)) : (reg50 | reg56)) >= (|wire44[(3'h5):(1'h1)]))}))
            begin
              reg63 <= $unsigned(wire44);
              reg64 <= ((!{(~^reg53)}) > ((reg49[(1'h0):(1'h0)] ?
                  (wire45[(2'h2):(2'h2)] ?
                      (wire62 > reg63) : {reg59,
                          wire46}) : $unsigned($signed(reg60))) || reg60[(3'h5):(2'h3)]));
            end
          else
            begin
              reg63 <= wire43[(1'h0):(1'h0)];
              reg64 <= reg58[(3'h4):(1'h0)];
              reg65 <= reg58[(1'h1):(1'h1)];
              reg66 <= (8'hbd);
              reg67 <= (!wire43);
            end
          reg68 <= $unsigned(((reg50 ?
                  ((reg54 ?
                      reg65 : wire45) ~^ (reg52 != wire61)) : ($unsigned(reg52) << reg49)) ?
              reg57[(1'h0):(1'h0)] : {$unsigned({reg67, wire47}),
                  $unsigned(reg65[(4'hd):(4'h8)])}));
          reg69 <= wire62[(1'h0):(1'h0)];
        end
      else
        begin
          reg63 <= ((($unsigned($signed(wire42)) ?
                      $unsigned(reg53[(1'h1):(1'h0)]) : (!(reg49 && wire47))) ?
                  $signed({(+reg66), (reg56 - reg64)}) : $unsigned((|reg52))) ?
              {reg54,
                  (reg50[(1'h1):(1'h0)] >> $unsigned($unsigned(reg69)))} : $unsigned(($unsigned((reg49 ?
                      wire47 : wire45)) ?
                  {(^reg54), (^~reg60)} : $unsigned((reg50 >>> wire47)))));
          if (reg65)
            begin
              reg64 <= (^~$unsigned((^~$unsigned((reg65 >= wire44)))));
            end
          else
            begin
              reg64 <= $signed(((!(8'h9d)) ~^ $signed($signed(reg49))));
              reg65 <= ((reg51[(4'ha):(4'h9)] < (((wire43 ? reg52 : wire42) ?
                          ((8'hae) ? reg68 : reg48) : wire62) ?
                      (reg67 == reg54[(4'h9):(2'h2)]) : (~(~^reg48)))) ?
                  ({reg54[(4'hb):(3'h6)]} ?
                      wire61[(4'hc):(3'h6)] : $signed({$signed(wire43),
                          (reg53 && reg58)})) : wire61[(5'h11):(2'h3)]);
              reg66 <= $signed(wire61[(5'h10):(4'hc)]);
              reg67 <= $signed(($unsigned($signed($signed(reg68))) * (^~$unsigned({reg68}))));
              reg68 <= $unsigned({$signed((~&$unsigned((7'h44)))),
                  ($signed(reg54) & ($signed((8'hba)) - $unsigned(reg67)))});
            end
          reg69 <= (8'ha8);
        end
    end
  assign wire70 = ((reg52[(3'h5):(1'h1)] < (-((reg57 ?
                          (8'h9c) : wire45) >>> (~|reg50)))) ?
                      $unsigned({reg60}) : $unsigned(($signed((reg63 ?
                          wire44 : reg51)) <= ({wire43, wire61} ?
                          {wire43, wire46} : (~wire43)))));
endmodule

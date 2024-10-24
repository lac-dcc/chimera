module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  assign y = {wire95,
                 wire5,
                 wire4,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire4 = ((^(~(((8'hae) ^~ wire1) ?
                     (wire3 ?
                         wire2 : (8'hb3)) : wire3[(4'h9):(3'h7)]))) <= wire1[(4'he):(4'ha)]);
  assign wire5 = $unsigned($signed({$unsigned($unsigned(wire2)),
                     {(wire3 ^ wire1)}}));
  module6 #() modinst96 (.clk(clk), .wire10(wire2), .wire8(wire1), .wire9(wire0), .wire7(wire4), .y(wire95));
  always
    @(posedge clk) begin
      reg97 <= wire1[(5'h10):(4'hd)];
      if (wire0[(5'h13):(3'h6)])
        begin
          if ((wire4[(4'hf):(4'h9)] & wire1[(1'h0):(1'h0)]))
            begin
              reg98 <= $signed(((~|($signed(wire95) ?
                      wire2 : (wire3 != reg97))) ?
                  ($signed({(8'hbf),
                      wire2}) * $signed((wire95 || wire1))) : wire0[(4'h8):(2'h2)]));
            end
          else
            begin
              reg98 <= wire1[(3'h7):(3'h4)];
              reg99 <= (-$unsigned($unsigned(wire0[(3'h7):(3'h6)])));
              reg100 <= reg98[(2'h3):(2'h3)];
            end
          reg101 <= $signed((~&wire2));
          reg102 <= {(8'hb5),
              ($unsigned({$unsigned(wire5), ((7'h42) != wire1)}) ?
                  (reg98 ?
                      $signed((reg101 < reg99)) : $unsigned((~^reg98))) : $signed({(reg99 >= reg97)}))};
        end
      else
        begin
          reg98 <= (wire95[(2'h2):(1'h1)] ~^ $unsigned({wire0[(1'h0):(1'h0)]}));
        end
      reg103 <= (reg101 | (~|{wire0[(5'h14):(4'h8)],
          ((reg101 & wire1) <<< $unsigned(wire95))}));
      reg104 <= {wire3[(3'h5):(1'h1)], $signed($signed(wire2[(4'hc):(3'h6)]))};
      reg105 <= (8'ha0);
    end
endmodule

module module6
#(parameter param94 = ({(~&(8'haa))} != (~^(({(8'hbc)} == ((8'hb3) >> (8'hb0))) || ((-(8'ha2)) <<< (|(7'h41)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire63;
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire74,
                 wire66,
                 wire63,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 (1'h0)};
  module11 #() modinst64 (.y(wire63), .wire13(wire7), .wire12((8'ha7)), .wire14(wire8), .wire15(wire9), .clk(clk), .wire16(wire10));
  always
    @(posedge clk) begin
      reg65 <= ((+((^~(7'h43)) && wire63[(2'h3):(1'h1)])) && wire63[(1'h0):(1'h0)]);
    end
  assign wire66 = (!wire7[(5'h10):(5'h10)]);
  always
    @(posedge clk) begin
      if (wire10)
        begin
          if ($signed($unsigned(wire63)))
            begin
              reg67 <= {wire7[(3'h4):(1'h0)],
                  ($signed((+wire66)) ?
                      ((8'ha5) ?
                          (-(wire10 ? wire10 : wire9)) : $signed(((8'h9c) ?
                              (8'hb8) : wire10))) : (~&(|$signed(wire63))))};
              reg68 <= reg65[(2'h3):(2'h3)];
              reg69 <= reg68[(3'h5):(3'h4)];
              reg70 <= $signed({(((reg65 ^~ reg69) ?
                          {wire8, reg65} : wire8[(3'h6):(3'h5)]) ?
                      (!wire10) : ((wire66 << wire10) ?
                          $signed(wire66) : $unsigned(wire7)))});
              reg71 <= $unsigned(wire10[(2'h2):(1'h0)]);
            end
          else
            begin
              reg67 <= $signed(reg71[(3'h6):(3'h4)]);
            end
          reg72 <= {$unsigned((reg68[(3'h5):(3'h4)] ?
                  wire7[(5'h10):(2'h2)] : ((&reg70) ?
                      {reg68} : $unsigned(reg67))))};
          reg73 <= wire8;
        end
      else
        begin
          reg67 <= ({(~^(8'ha4)), $unsigned(reg70[(4'hd):(1'h0)])} ?
              reg65[(2'h2):(1'h1)] : (^$unsigned($unsigned({reg69}))));
          reg68 <= {{$unsigned(($unsigned((8'ha4)) ?
                      reg67[(1'h1):(1'h1)] : {wire66})),
                  (((reg65 ? reg72 : (8'hae)) ?
                      wire9[(1'h1):(1'h1)] : $signed(reg72)) + $unsigned((8'ha8)))}};
        end
    end
  assign wire74 = (|(~&{{$unsigned(reg73), $signed(reg67)},
                      $signed((~reg68))}));
  always
    @(posedge clk) begin
      reg75 <= $unsigned(((~{reg67}) && ((&(~^reg71)) ?
          $unsigned($unsigned(reg65)) : $signed((reg69 ? reg67 : (7'h42))))));
      reg76 <= $signed({(|$unsigned((~reg67))), (-(8'hb4))});
      reg77 <= $signed(($signed($unsigned(reg73[(1'h1):(1'h0)])) <= ((~|{reg68}) < $signed($unsigned(wire63)))));
      reg78 <= wire9[(4'hc):(1'h1)];
      reg79 <= {$signed((+reg76))};
    end
  assign wire80 = wire63;
  assign wire81 = wire66;
  always
    @(posedge clk) begin
      reg82 <= $signed((-$signed((-wire63[(1'h1):(1'h1)]))));
      reg83 <= reg68;
      if ({reg70[(1'h0):(1'h0)], reg65[(3'h4):(3'h4)]})
        begin
          reg84 <= $unsigned($unsigned(reg78[(2'h2):(1'h1)]));
        end
      else
        begin
          if ((wire7[(5'h10):(1'h1)] ?
              $signed({$signed((~^wire80)),
                  $signed($unsigned(wire63))}) : reg75[(3'h6):(2'h3)]))
            begin
              reg84 <= ($unsigned($unsigned(reg68)) ?
                  (!$signed(($signed(wire74) - (~wire7)))) : reg65[(2'h2):(2'h2)]);
              reg85 <= (($signed(reg68) ?
                      reg83 : (~|(reg76 ?
                          $signed(wire9) : wire63[(2'h2):(1'h0)]))) ?
                  {((&(wire8 ^~ (8'hbf))) != {(reg69 ? wire7 : wire74)}),
                      $signed(((^~(8'ha0)) ?
                          (~&reg75) : (~&wire10)))} : $signed(((&(wire10 ?
                          reg67 : (8'h9c))) ?
                      $unsigned((-reg71)) : reg68[(3'h7):(1'h0)])));
              reg86 <= reg65[(3'h5):(2'h3)];
              reg87 <= ((8'haf) ?
                  $signed(reg76[(4'hd):(4'h8)]) : reg79[(5'h10):(3'h7)]);
            end
          else
            begin
              reg84 <= wire74;
              reg85 <= reg84[(3'h7):(3'h6)];
            end
          reg88 <= reg67[(1'h1):(1'h1)];
          reg89 <= $signed({{(+$unsigned(reg72))}});
          reg90 <= ((reg71[(3'h5):(3'h5)] << ((!(reg88 ?
                  (8'hb0) : wire80)) != $unsigned(((8'hab) ?
                  wire63 : reg84)))) ?
              (((wire81[(2'h3):(1'h0)] >= $unsigned(wire9)) ?
                      reg71[(4'h9):(1'h0)] : ($unsigned(wire9) ?
                          reg82[(2'h2):(2'h2)] : $signed(reg88))) ?
                  $unsigned($signed(((7'h44) & wire66))) : reg85) : wire8[(4'hd):(3'h4)]);
          reg91 <= $signed((+$unsigned((reg73 ? reg70 : $unsigned(reg88)))));
        end
      reg92 <= (((&$signed((wire74 < (8'hb3)))) || (-{reg67})) ?
          wire74[(3'h4):(1'h1)] : (8'hb7));
      reg93 <= $signed(((((reg83 >= wire8) ?
          (reg92 ?
              (8'hbf) : (8'h9f)) : reg78) < $unsigned((reg76 & reg73))) ^ (reg69[(3'h7):(3'h5)] ?
          $signed((^reg68)) : $unsigned((reg70 | reg90)))));
    end
endmodule

module module11
#(parameter param61 = ((8'haf) ~^ {(({(8'haf), (7'h44)} + (&(8'ha7))) ? (&(|(8'hba))) : {((7'h44) ? (8'hb2) : (8'hb2)), ((8'hbd) ? (8'ha5) : (8'hae))})}), 
parameter param62 = ((+param61) ? param61 : (!param61)))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire18,
                 wire17,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = (!(wire12[(2'h3):(1'h0)] ?
                      (|$signed((wire15 ~^ (7'h43)))) : ((!(~|(7'h44))) ?
                          wire13[(3'h4):(1'h0)] : wire16)));
  assign wire18 = ($signed($unsigned(wire12)) ?
                      (8'hb5) : wire12[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg19 <= {{$signed($signed($signed(wire15)))}};
      reg20 <= $unsigned(wire13[(5'h10):(4'hc)]);
      reg21 <= (-$signed($unsigned(wire17[(5'h10):(4'hd)])));
      reg22 <= (((-(~&reg19[(4'h9):(4'h8)])) + $unsigned(($unsigned(wire16) ~^ (reg21 << wire18)))) << (reg20 != $unsigned($unsigned($unsigned((8'ha9))))));
    end
  assign wire23 = $unsigned($unsigned(((-(~^(8'hb4))) ?
                      (reg21[(3'h7):(2'h2)] ?
                          $unsigned(reg21) : (reg21 ?
                              (8'hb9) : wire18)) : reg20)));
  assign wire24 = wire13;
  assign wire25 = reg19;
  assign wire26 = $signed((8'h9e));
  always
    @(posedge clk) begin
      reg27 <= reg22;
      reg28 <= wire26[(1'h1):(1'h1)];
      if ($unsigned(((((8'haa) ? reg27 : wire17) != ($signed(reg19) ?
              (wire16 | reg21) : reg22[(3'h4):(1'h0)])) ?
          $unsigned(($unsigned(wire12) ?
              wire12[(2'h3):(2'h2)] : wire17[(1'h0):(1'h0)])) : ($unsigned($unsigned(wire15)) ?
              {wire26[(1'h1):(1'h0)], (&wire24)} : reg21[(4'hc):(4'ha)]))))
        begin
          if ($signed(wire26))
            begin
              reg29 <= (~&(~((&$signed(wire18)) ?
                  ((reg19 >>> (7'h43)) ?
                      (wire17 >> reg28) : ((8'ha2) ?
                          wire17 : (7'h41))) : $unsigned((reg28 ?
                      (8'h9d) : wire18)))));
              reg30 <= wire17;
              reg31 <= $unsigned(((~^($unsigned(wire13) >>> wire18[(1'h1):(1'h0)])) & (((reg30 ?
                      reg30 : reg29) ?
                  (reg22 + (8'ha7)) : (wire25 ?
                      reg19 : reg21)) < (~&(8'ha8)))));
              reg32 <= {$signed(wire14)};
              reg33 <= $unsigned($unsigned(($signed(wire18) | (^(~|wire16)))));
            end
          else
            begin
              reg29 <= $signed((8'h9f));
              reg30 <= (({(((8'h9d) | wire14) - reg29[(4'hb):(3'h7)]),
                      {$unsigned(reg28), (reg22 ? reg30 : wire18)}} ?
                  (($unsigned(reg28) ?
                          (reg19 != reg29) : (reg30 ? reg32 : wire13)) ?
                      reg32 : wire24) : $signed($signed((reg22 & wire26)))) - wire25[(1'h0):(1'h0)]);
            end
          if ($signed(reg33[(4'hf):(4'hf)]))
            begin
              reg34 <= $signed($signed((&reg21[(4'h9):(3'h7)])));
              reg35 <= $signed({$signed(reg32[(5'h11):(5'h11)]), (~|reg28)});
              reg36 <= reg27[(2'h2):(1'h1)];
              reg37 <= wire12;
            end
          else
            begin
              reg34 <= $unsigned(reg34);
              reg35 <= $unsigned(wire26[(1'h0):(1'h0)]);
            end
          if ({$unsigned(reg22), wire13[(4'hd):(4'hc)]})
            begin
              reg38 <= (($unsigned($signed(reg37[(3'h4):(1'h1)])) + ((8'hb6) ?
                  ($signed(wire14) ?
                      (~|(8'hac)) : (wire17 ?
                          wire14 : reg37)) : (&$unsigned(wire12)))) > (!{reg32[(4'he):(3'h6)],
                  reg37[(1'h1):(1'h1)]}));
              reg39 <= (reg21[(3'h6):(2'h2)] + wire14[(1'h1):(1'h1)]);
            end
          else
            begin
              reg38 <= ($unsigned(reg29[(3'h6):(3'h4)]) ?
                  $unsigned({(~^reg33)}) : wire18);
              reg39 <= $signed((wire18[(4'h8):(1'h0)] ?
                  (~&$signed((reg33 >= reg33))) : reg34[(5'h13):(1'h1)]));
              reg40 <= {wire13[(3'h5):(2'h3)],
                  (~^($signed((|reg29)) | $signed((reg21 ? reg20 : (8'hb1)))))};
              reg41 <= (reg27[(4'ha):(3'h4)] == $unsigned($unsigned(reg39)));
              reg42 <= (reg30[(3'h7):(3'h5)] - (8'hbe));
            end
        end
      else
        begin
          reg29 <= reg38[(2'h2):(1'h0)];
          if (wire15[(3'h5):(1'h0)])
            begin
              reg30 <= reg30;
              reg31 <= ((-(^~$unsigned(reg41[(3'h4):(2'h2)]))) && reg28);
            end
          else
            begin
              reg30 <= (((((reg30 <<< wire18) != $signed(reg41)) <= ((~^reg32) ~^ wire12[(1'h1):(1'h0)])) >>> (-reg39)) ?
                  (~{((reg31 ? reg32 : reg22) ? reg21 : reg33),
                      (~&$unsigned(reg29))}) : $signed({wire23,
                      ($signed(reg31) ~^ ((8'hb1) ? reg42 : (7'h44)))}));
              reg31 <= reg38;
              reg32 <= reg35[(3'h4):(3'h4)];
              reg33 <= $signed((8'ha6));
              reg34 <= reg20;
            end
        end
      reg43 <= ((($signed(wire15[(1'h1):(1'h1)]) && ($signed(wire26) ?
              reg31 : (reg21 <<< reg20))) ?
          {reg32[(4'hd):(4'hc)],
              $unsigned({reg42,
                  reg40})} : reg27) > (~&$unsigned(($unsigned(wire26) ?
          reg35[(2'h2):(1'h1)] : (!reg41)))));
      reg44 <= reg36[(3'h6):(1'h1)];
    end
  assign wire45 = {((reg36 ? {reg42} : (8'ha8)) ?
                          (^~(&wire14[(3'h4):(2'h2)])) : reg19),
                      reg30};
  assign wire46 = {(8'hac),
                      ($unsigned(reg21[(4'h8):(2'h3)]) ?
                          $signed($unsigned((wire16 * (7'h41)))) : $unsigned((^~(reg30 ?
                              reg42 : (8'hb1)))))};
  assign wire47 = reg20[(1'h1):(1'h1)];
  assign wire48 = $unsigned(reg35[(3'h4):(2'h3)]);
  assign wire49 = (reg36[(3'h4):(2'h2)] <<< reg35);
  always
    @(posedge clk) begin
      if ({(((+reg37[(2'h2):(1'h0)]) < (!reg29)) <<< (~$unsigned($signed(wire49)))),
          $signed({$signed({(8'hb8)}), wire16[(3'h5):(1'h1)]})})
        begin
          reg50 <= ({(+reg43),
                  (reg22[(2'h2):(1'h1)] ?
                      ($signed(reg38) & {wire12, reg29}) : ((&wire23) ?
                          (reg40 ? (7'h44) : reg35) : $signed(reg37)))} ?
              (wire24 <= (reg44 ~^ (7'h43))) : ((~wire48[(4'he):(3'h6)]) | $unsigned(({reg28} <<< {reg27}))));
          reg51 <= ($signed(($signed(((8'ha2) ?
              reg31 : (8'hb8))) < reg44[(1'h0):(1'h0)])) != ($signed(($unsigned(reg22) ?
                  $unsigned(reg42) : reg28)) ?
              $signed((+$unsigned(reg28))) : {$signed($unsigned(reg22))}));
          reg52 <= $signed($signed(reg21[(2'h2):(1'h0)]));
          reg53 <= $signed(((~&$unsigned((reg29 ?
              reg39 : reg20))) < ($unsigned((wire25 * (8'ha5))) ^ $unsigned($signed(reg27)))));
        end
      else
        begin
          reg50 <= wire18;
          reg51 <= (!($signed(($signed((7'h44)) != (!reg35))) - (~wire12[(2'h2):(2'h2)])));
          if (reg27[(4'hf):(4'ha)])
            begin
              reg52 <= $signed(wire48[(4'hb):(4'ha)]);
              reg53 <= reg30;
              reg54 <= reg43;
            end
          else
            begin
              reg52 <= ($unsigned($signed((&$unsigned(wire45)))) ^~ {$signed(((-(8'hb7)) ?
                      ((8'h9f) ? reg37 : wire25) : (reg40 ? reg27 : reg54))),
                  $signed($unsigned(reg44[(3'h4):(3'h4)]))});
              reg53 <= {$unsigned({wire26[(1'h0):(1'h0)]}),
                  (~&$unsigned(((8'h9d) ? (reg53 <<< wire25) : (-wire24))))};
              reg54 <= {(!$unsigned($unsigned(((7'h40) <= reg19)))), reg29};
              reg55 <= ({$unsigned(reg36[(3'h6):(3'h4)]),
                  (~wire46[(4'hf):(4'hb)])} >= {reg42[(2'h2):(1'h0)],
                  $signed({$unsigned(wire12)})});
              reg56 <= $signed(wire18[(2'h3):(1'h0)]);
            end
          reg57 <= reg51;
        end
      reg58 <= (8'hb3);
      reg59 <= (((8'hbd) ? reg27 : reg30) ?
          (($unsigned({(8'ha3), reg33}) <= wire13) && (reg35 ?
              ($unsigned(reg33) - $unsigned(wire17)) : ((wire14 && reg30) <<< $signed(reg22)))) : wire14);
      reg60 <= wire49;
    end
endmodule

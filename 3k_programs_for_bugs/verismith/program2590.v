module top
#(parameter param93 = ((8'ha6) == (8'haf)), 
parameter param94 = ((8'haa) ? ((+{(param93 > param93)}) ? param93 : ((param93 ? param93 : (param93 >= param93)) + ((param93 >>> param93) || (param93 && param93)))) : param93))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire89;
  assign y = {wire92, wire91, wire5, wire89, (1'h0)};
  assign wire5 = (~wire0[(1'h1):(1'h0)]);
  module6 #() modinst90 (wire89, clk, wire2, wire3, wire0, wire5, wire1);
  assign wire91 = $unsigned((!wire5[(3'h4):(3'h4)]));
  assign wire92 = $signed((!$unsigned(wire89)));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire74;
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  module12 #() modinst75 (wire74, clk, wire11, wire10, wire8, wire7, wire9);
  assign wire76 = ((^~$signed(wire10[(4'he):(3'h6)])) <<< {wire74,
                      $signed(wire10)});
  assign wire77 = (((($signed((8'hb6)) ? $unsigned(wire9) : (+wire8)) ?
                          wire7 : wire9) ^~ wire76[(1'h1):(1'h0)]) ?
                      $unsigned((^~$signed((wire8 >>> wire8)))) : (wire7 ?
                          $unsigned(($signed(wire8) ?
                              (wire8 ?
                                  wire7 : (8'hb6)) : ((7'h42) ~^ wire74))) : ((wire9[(2'h3):(1'h0)] * (wire10 * wire7)) || wire10)));
  assign wire78 = wire10;
  always
    @(posedge clk) begin
      reg79 <= wire76;
      if ($unsigned($signed(wire7[(4'hc):(3'h4)])))
        begin
          reg80 <= (wire9[(4'hd):(4'hc)] * $signed({(((8'hbc) ?
                      wire9 : wire74) ?
                  (wire77 >>> wire77) : {(8'ha9)})}));
        end
      else
        begin
          reg80 <= wire78;
          reg81 <= $unsigned(wire9[(4'hb):(3'h6)]);
          reg82 <= $signed($signed((wire76[(1'h1):(1'h1)] ?
              (&((8'hac) | wire8)) : reg79)));
          reg83 <= $signed($unsigned({reg82[(3'h6):(2'h3)]}));
        end
      reg84 <= (reg80 ?
          $unsigned($unsigned(((wire7 || reg83) - $unsigned(reg79)))) : $unsigned(wire7[(4'h9):(2'h2)]));
    end
  assign wire85 = (wire10[(1'h0):(1'h0)] && $unsigned((~|(wire9[(3'h5):(3'h5)] ?
                      wire74 : (reg80 == (8'hb6))))));
  assign wire86 = $signed((reg80[(1'h0):(1'h0)] & (^~wire85[(3'h5):(2'h3)])));
  assign wire87 = (8'ha0);
  assign wire88 = (-(wire74 ?
                      reg84 : (wire86[(3'h6):(2'h3)] ?
                          wire7 : wire74[(3'h4):(3'h4)])));
endmodule

module module12
#(parameter param72 = ((&((&((8'hb4) ? (8'h9f) : (7'h40))) ? {{(8'hab)}, ((8'ha9) - (8'ha3))} : (8'hb4))) ? (((((8'hb2) <<< (8'ha1)) + (8'hba)) > (-((7'h40) <= (8'hb3)))) ? ((((8'ha1) <<< (8'ha3)) & ((8'ha0) ~^ (8'h9d))) ? (((8'hb9) || (8'hbb)) >> ((8'hb5) ? (8'ha5) : (7'h42))) : ({(8'hb0), (8'haf)} < (~^(8'hb0)))) : {(((7'h43) * (8'ha8)) ^ (~(7'h43))), ((~&(8'haa)) ^~ ((8'ha6) ~^ (8'h9f)))}) : (({(~^(8'hb2)), ((8'hac) > (8'hab))} + (((8'hbb) <= (8'hb6)) ^ {(8'ha1)})) >= {((8'hba) ? (~^(8'hb5)) : ((7'h40) ? (8'ha3) : (7'h43))), ({(7'h41)} ? ((8'hbe) ? (8'hab) : (7'h43)) : (~(8'hba)))})), 
parameter param73 = (8'hbf))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h2d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire [(2'h2):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire71,
                 wire57,
                 wire56,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire35,
                 wire34,
                 wire33,
                 wire20,
                 wire19,
                 wire18,
                 reg70,
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
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire18 = $signed(wire14[(3'h7):(3'h6)]);
  assign wire19 = wire18;
  assign wire20 = (((~(~(+wire17))) ?
                      $unsigned($signed($signed(wire13))) : $unsigned({{wire14},
                          {(8'hb0),
                              wire16}})) - $unsigned(($signed(wire16[(2'h3):(1'h1)]) <= ($signed(wire14) * (wire19 ?
                      wire13 : (7'h42))))));
  always
    @(posedge clk) begin
      reg21 <= wire17;
      reg22 <= wire13;
      reg23 <= (($unsigned(reg21) ~^ $signed($unsigned($unsigned(wire14)))) == ((^$signed((-wire19))) ?
          $unsigned(wire20) : (wire14[(5'h11):(3'h6)] ?
              reg22 : ((+reg22) << (~|wire14)))));
      reg24 <= (~(wire14[(5'h11):(4'h8)] ?
          (~$signed($unsigned(wire15))) : (8'ha1)));
    end
  always
    @(posedge clk) begin
      if ((^wire19[(3'h6):(1'h1)]))
        begin
          reg25 <= wire19[(1'h0):(1'h0)];
          reg26 <= reg22[(1'h0):(1'h0)];
          if (($signed({(reg26 >> $unsigned(wire20))}) ?
              (reg22 ^ $signed(((-(8'haa)) ?
                  ((8'hba) ?
                      (8'haa) : wire14) : $signed(reg21)))) : ($unsigned($unsigned($signed((8'haf)))) << (8'ha4))))
            begin
              reg27 <= (~&(|$unsigned(((wire19 ?
                  reg21 : reg23) >= (~&reg26)))));
              reg28 <= reg21;
              reg29 <= wire15[(2'h2):(1'h0)];
              reg30 <= wire15;
              reg31 <= {(((wire15 ?
                      $signed(reg24) : wire19[(4'ha):(2'h3)]) * ((wire18 * wire13) * {reg23,
                      reg27})) ~^ ((wire19[(3'h5):(3'h5)] ^ (reg28 ?
                      wire15 : reg29)) << wire17)),
                  $unsigned((((^reg23) >= $signed(reg23)) ?
                      (~&(reg28 & (8'hb4))) : ((!(8'hb4)) - {wire20})))};
            end
          else
            begin
              reg27 <= reg31[(3'h6):(2'h3)];
              reg28 <= {(+$signed(($unsigned(reg22) <<< reg30[(1'h1):(1'h1)])))};
            end
          reg32 <= reg26;
        end
      else
        begin
          reg25 <= wire16[(3'h6):(3'h5)];
          reg26 <= reg30;
          reg27 <= (~^$signed(($signed(reg22) == reg31[(3'h5):(3'h5)])));
          reg28 <= $unsigned({$signed(($signed(wire19) ?
                  ((8'ha7) | (8'ha3)) : $signed(reg25))),
              (|$unsigned(reg26))});
        end
    end
  assign wire33 = {(~&$unsigned(wire13[(1'h0):(1'h0)])),
                      $signed((!$signed(reg31)))};
  assign wire34 = (8'hac);
  assign wire35 = (~$unsigned($unsigned(reg27)));
  always
    @(posedge clk) begin
      reg36 <= wire33[(3'h5):(3'h4)];
      reg37 <= (!(($signed(wire19[(2'h2):(2'h2)]) ? wire13 : (8'ha4)) ?
          reg25 : $unsigned(($unsigned(reg36) < {reg21, reg24}))));
      reg38 <= ((-reg27[(3'h5):(3'h4)]) && $signed(((|((8'ha9) || (8'hb5))) ?
          wire19 : $signed($unsigned(wire13)))));
    end
  assign wire39 = wire35[(3'h7):(3'h7)];
  assign wire40 = ((reg32 ?
                      ($unsigned(reg31[(4'he):(3'h6)]) * reg30[(4'hb):(4'ha)]) : $unsigned((~&wire39[(3'h6):(2'h2)]))) || $unsigned((+{(wire17 ?
                          reg22 : (8'hb4))})));
  assign wire41 = ({$unsigned($unsigned((reg25 ? reg31 : reg27))),
                          $signed(wire16)} ?
                      ($signed($signed((^~(8'hbc)))) * reg36[(1'h1):(1'h1)]) : wire15[(2'h2):(1'h1)]);
  assign wire42 = {($signed(((reg38 ? reg22 : reg28) ?
                              (wire35 ? wire40 : reg21) : (reg25 > reg25))) ?
                          wire41 : reg25[(1'h1):(1'h1)])};
  assign wire43 = wire41;
  assign wire44 = ((!$unsigned(reg26[(4'he):(4'hd)])) != (^($signed((wire39 ?
                      wire17 : (8'hbf))) == $signed(((8'haa) ?
                      (8'ha1) : reg38)))));
  always
    @(posedge clk) begin
      reg45 <= reg21[(4'h9):(3'h5)];
      reg46 <= wire19[(3'h4):(2'h2)];
      if (reg30)
        begin
          if ((wire19 || ($signed(reg26[(3'h6):(3'h5)]) ?
              reg36[(3'h4):(3'h4)] : {$unsigned((^~wire35)),
                  (~&$signed(reg45))})))
            begin
              reg47 <= $signed(reg23[(1'h1):(1'h0)]);
              reg48 <= $signed($signed($unsigned((8'ha0))));
              reg49 <= wire13;
              reg50 <= reg22[(1'h1):(1'h1)];
              reg51 <= {((~&{reg26, (~^wire13)}) ?
                      $unsigned($signed(reg28[(1'h1):(1'h0)])) : reg21),
                  $signed($unsigned(wire15[(1'h1):(1'h0)]))};
            end
          else
            begin
              reg47 <= (wire17[(1'h1):(1'h1)] != $unsigned($signed(wire39[(1'h0):(1'h0)])));
              reg48 <= {(^($unsigned((8'hbd)) ?
                      ((reg51 <= reg24) + $signed(reg45)) : $signed((^~reg25)))),
                  (^~($unsigned(reg24[(4'ha):(1'h0)]) ?
                      reg31 : (+(^(8'ha1)))))};
            end
          reg52 <= (|$signed($signed(reg22)));
          reg53 <= ((~^{wire40}) <= reg48);
          reg54 <= ($unsigned($signed({$signed(wire34), (!reg28)})) ?
              ($signed($signed((8'ha5))) >>> ((^~(reg52 ?
                  reg53 : wire19)) >> $signed($signed(reg30)))) : reg31[(1'h1):(1'h0)]);
          reg55 <= (8'h9e);
        end
      else
        begin
          reg47 <= ($signed(wire44) ?
              (reg47 ?
                  $signed(reg32) : (~((+reg49) ?
                      $unsigned(wire44) : $signed(reg24)))) : ($unsigned(((|wire17) ?
                      $signed(wire43) : reg48[(2'h2):(1'h0)])) ?
                  wire13[(3'h5):(3'h4)] : reg22));
          reg48 <= ((!$signed(reg54)) ?
              $unsigned((reg23[(2'h2):(1'h0)] || reg23)) : ($signed(wire33[(2'h3):(2'h3)]) ^~ ($unsigned($unsigned(reg28)) ?
                  wire20[(3'h6):(3'h4)] : reg25)));
        end
    end
  assign wire56 = $unsigned($unsigned({($signed((7'h41)) ?
                          reg52 : (wire14 || reg29)),
                      {(~|reg49)}}));
  assign wire57 = wire17;
  always
    @(posedge clk) begin
      if (((reg23[(1'h0):(1'h0)] < reg55[(1'h0):(1'h0)]) && $signed((({wire16,
              reg32} ?
          {reg45} : wire57) && $unsigned(wire39[(4'hb):(4'hb)])))))
        begin
          reg58 <= ({(8'hba),
              (~^((^(8'h9c)) ?
                  $unsigned(wire19) : reg54[(3'h5):(3'h4)]))} <= ((wire14 ?
                  (~^(!reg55)) : $signed($unsigned(wire42))) ?
              $unsigned(($unsigned(wire19) << ((8'hb1) ?
                  reg48 : (7'h42)))) : wire41));
          reg59 <= wire13[(3'h7):(2'h3)];
          if ((($unsigned(wire33[(3'h6):(3'h5)]) ?
              $signed(((wire15 >> (8'hb4)) & (reg30 ~^ reg50))) : (wire17[(2'h3):(2'h3)] > $signed((&reg24)))) > wire44[(1'h1):(1'h1)]))
            begin
              reg60 <= (8'ha1);
              reg61 <= reg37;
              reg62 <= (({(^(+reg22)),
                      ($signed((8'ha9)) ?
                          {reg58, wire15} : (reg61 ?
                              (8'hab) : reg47))} && $unsigned(($signed(reg25) >= (|reg36)))) ?
                  (reg49 >= (&((wire15 ? reg51 : reg28) ?
                      (wire14 << (8'ha7)) : reg54[(1'h0):(1'h0)]))) : reg25);
              reg63 <= $signed((-$signed(({reg47, reg53} ?
                  reg28[(3'h6):(1'h1)] : wire34))));
              reg64 <= wire39[(5'h12):(2'h2)];
            end
          else
            begin
              reg60 <= (7'h40);
              reg61 <= {((~^(((8'hbe) ?
                      (8'hbb) : wire35) == (8'ha5))) + reg37)};
              reg62 <= (!((wire42 ?
                      {reg23[(2'h2):(2'h2)],
                          $unsigned(reg22)} : {$signed(wire15)}) ?
                  {$unsigned((reg46 || reg48))} : ({$signed((8'ha9))} ^~ (((8'hb2) == wire18) ?
                      reg28[(2'h2):(1'h0)] : $unsigned(reg52)))));
            end
          reg65 <= reg47[(3'h7):(3'h4)];
          reg66 <= wire43;
        end
      else
        begin
          if ($signed($signed($unsigned(wire16))))
            begin
              reg58 <= wire43;
              reg59 <= (!(~|$unsigned(reg48)));
              reg60 <= (~((^reg30[(4'h8):(3'h7)]) ?
                  ($signed((reg45 ? reg48 : reg54)) ?
                      ({reg53} ?
                          (+wire42) : $signed(reg53)) : $signed((!(8'ha5)))) : reg31[(1'h0):(1'h0)]));
            end
          else
            begin
              reg58 <= $signed(($unsigned($signed((wire43 && reg21))) ^ (~^{((8'hb3) & reg26),
                  $signed(wire40)})));
            end
          reg61 <= reg28[(4'hf):(3'h7)];
          reg62 <= ({$unsigned(wire18[(4'hc):(4'hb)])} ?
              reg50[(3'h7):(3'h4)] : ($unsigned(($unsigned(wire16) ?
                      $signed(reg53) : reg32)) ?
                  {((reg37 ^~ reg38) ~^ $unsigned(wire33)),
                      ((reg58 > wire44) >> ((8'hbc) ?
                          reg58 : reg30))} : ((&(reg25 ?
                      reg32 : reg47)) != ($unsigned(wire17) <<< (reg66 ?
                      reg45 : reg26)))));
          reg63 <= wire17[(3'h5):(3'h4)];
          if ($unsigned(reg49[(4'h8):(1'h1)]))
            begin
              reg64 <= $unsigned((8'ha6));
            end
          else
            begin
              reg64 <= $signed(wire34);
            end
        end
      reg67 <= ($signed({((reg21 || reg37) - reg63[(2'h3):(2'h2)])}) + $signed($signed(wire33)));
      reg68 <= $unsigned(($signed({(reg23 <= reg51),
          ((8'had) ? reg21 : reg48)}) >> (|((reg46 ?
          (7'h43) : wire20) ^~ (~&wire43)))));
      reg69 <= (~^wire16);
    end
  always
    @(posedge clk) begin
      reg70 <= wire18[(1'h0):(1'h0)];
    end
  assign wire71 = (~wire13);
endmodule

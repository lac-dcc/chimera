module top
#(parameter param90 = {(&({(|(7'h44))} + ((7'h43) && {(8'hb2), (8'ha2)}))), (!((8'hb0) || {((8'ha7) ? (8'hb0) : (8'ha1)), {(8'haa)}}))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h275):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire40;
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  assign y = {wire89,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire4,
                 wire5,
                 wire6,
                 wire40,
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
                 reg76,
                 reg75,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire4 = $signed(wire2[(4'h9):(3'h4)]);
  assign wire5 = (wire4 ?
                     $unsigned(wire0[(3'h6):(3'h6)]) : wire1[(2'h3):(1'h0)]);
  assign wire6 = $unsigned(wire0);
  module7 #() modinst41 (wire40, clk, wire1, wire3, wire0, wire4, wire2);
  assign wire42 = {$unsigned({wire40[(2'h2):(1'h1)]}),
                      (!$unsigned({wire40[(3'h6):(1'h1)]}))};
  assign wire43 = wire5;
  assign wire44 = (wire0[(2'h3):(2'h2)] ^ (+wire4));
  assign wire45 = wire6;
  assign wire46 = ({wire45[(3'h4):(2'h2)]} >> (~^wire3[(4'hd):(2'h2)]));
  assign wire47 = ((wire45 ? wire45[(3'h4):(3'h4)] : wire3[(5'h15):(5'h11)]) ?
                      (~&{$signed($unsigned(wire4)),
                          (~&wire1[(4'h8):(2'h3)])}) : $signed(($signed((wire40 ?
                              wire45 : wire40)) ?
                          (wire6 ~^ $unsigned(wire43)) : $unsigned({wire5,
                              wire2}))));
  assign wire48 = (^~wire47[(4'he):(1'h1)]);
  assign wire49 = (8'ha8);
  assign wire50 = {$unsigned($unsigned(((wire46 != wire4) == (wire1 ?
                          wire46 : wire42)))),
                      $unsigned(((~^$signed(wire3)) < (wire45[(2'h3):(2'h2)] > wire43)))};
  always
    @(posedge clk) begin
      reg51 <= $unsigned(wire43[(4'he):(2'h2)]);
      reg52 <= wire40[(3'h6):(3'h4)];
    end
  assign wire53 = (wire43 ? wire2 : (~&$signed(wire44)));
  assign wire54 = (wire53 ?
                      wire4[(3'h5):(1'h0)] : $unsigned(wire2[(1'h1):(1'h0)]));
  assign wire55 = wire1;
  assign wire56 = wire50[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg57 <= $signed(((^$unsigned((wire46 ? wire54 : reg51))) ?
          (wire2 ? wire54 : $unsigned((wire54 > wire49))) : $signed(wire50)));
      if ((wire5 ^~ reg57[(1'h1):(1'h0)]))
        begin
          reg58 <= $unsigned(wire42[(1'h0):(1'h0)]);
          reg59 <= {(+{wire4[(3'h5):(3'h4)], {(~|reg51), $signed(wire49)}})};
          reg60 <= {wire0,
              {wire56[(4'he):(1'h1)],
                  {wire4[(4'he):(1'h0)], $signed(wire47[(3'h4):(1'h1)])}}};
          reg61 <= (|($signed((7'h43)) * wire49));
          reg62 <= $signed(reg57[(1'h0):(1'h0)]);
        end
      else
        begin
          if ($signed($signed($unsigned($signed(wire2)))))
            begin
              reg58 <= {$unsigned(((^~$unsigned((8'hbb))) ?
                      ((~wire6) ^~ ((8'hb6) ?
                          wire3 : wire47)) : (reg52 >= $signed((8'hb9))))),
                  ($signed(($unsigned(reg57) ? (reg61 <= reg60) : wire40)) ?
                      $unsigned(wire6[(4'he):(4'hc)]) : ({(wire1 ?
                                  wire2 : (8'hb9))} ?
                          (wire55[(4'h8):(3'h6)] || {wire45}) : wire48))};
              reg59 <= wire56[(5'h10):(4'hd)];
              reg60 <= wire55;
            end
          else
            begin
              reg58 <= (((+(^{wire48})) - ($signed({(8'hae)}) != {wire53})) & ($signed($signed((~^wire44))) ?
                  (wire54[(4'hc):(2'h3)] >> {$signed(wire54),
                      $unsigned(wire53)}) : (&$signed((wire50 >= wire45)))));
              reg59 <= wire55[(3'h5):(3'h5)];
              reg60 <= (^~((8'ha3) >>> $unsigned({$signed(wire50)})));
              reg61 <= ($unsigned((((wire42 <<< reg58) ?
                  $signed(wire4) : (^~wire42)) >> {$signed((8'hae)),
                  {wire42, (8'ha1)}})) <= $signed((^$unsigned((wire46 ?
                  wire4 : wire4)))));
            end
          reg62 <= $signed(wire47);
          reg63 <= {$unsigned((8'hb2)), wire1};
        end
    end
  always
    @(posedge clk) begin
      if ($signed((-(($signed(reg62) ~^ reg63) ?
          $signed($unsigned(wire48)) : reg63[(4'hc):(3'h5)]))))
        begin
          reg64 <= (wire4[(4'h9):(4'h9)] <= $signed((~wire40)));
          if ((reg63 ? (^~wire43[(3'h6):(1'h0)]) : reg51[(3'h7):(3'h4)]))
            begin
              reg65 <= $signed(($signed(wire1[(5'h10):(4'ha)]) ?
                  reg58[(4'h8):(4'h8)] : $signed((~&(reg64 + reg58)))));
              reg66 <= $unsigned({((|reg60[(3'h7):(2'h3)]) ?
                      {$signed(reg59), wire40[(1'h1):(1'h0)]} : (^~{wire43,
                          wire44}))});
              reg67 <= (+$unsigned((!(&$signed(wire4)))));
            end
          else
            begin
              reg65 <= $unsigned((&wire4));
              reg66 <= $unsigned(wire42[(1'h0):(1'h0)]);
              reg67 <= wire44[(3'h4):(1'h0)];
            end
          reg68 <= $unsigned((7'h42));
          reg69 <= $unsigned((|reg52));
          reg70 <= (reg64[(1'h1):(1'h1)] * (8'hb5));
        end
      else
        begin
          reg64 <= $unsigned((~$signed(reg62[(2'h2):(1'h1)])));
          if ((reg60[(3'h7):(1'h1)] << (7'h40)))
            begin
              reg65 <= $signed(reg51);
            end
          else
            begin
              reg65 <= ($signed($unsigned($unsigned(wire6[(2'h3):(1'h1)]))) << reg51);
              reg66 <= wire46;
              reg67 <= wire56[(5'h10):(3'h6)];
              reg68 <= ($signed((($signed(wire4) ^~ ((8'hab) ?
                          (8'ha1) : (8'haf))) ?
                      reg62[(4'h8):(2'h3)] : {(reg61 ? (8'ha8) : reg61),
                          (reg65 ? reg67 : wire44)})) ?
                  wire46[(2'h2):(1'h0)] : $unsigned(($unsigned(wire48[(1'h0):(1'h0)]) ?
                      (^(~reg68)) : ($signed(reg66) ?
                          (reg51 * reg51) : $signed((8'ha3))))));
              reg69 <= $signed($unsigned($unsigned(wire44)));
            end
          if (((-(-(8'hac))) ?
              wire4[(4'hc):(1'h1)] : (-((8'hae) ^~ $signed($unsigned(wire43))))))
            begin
              reg70 <= $signed({{reg57, $signed($signed(wire49))}});
              reg71 <= reg60[(5'h12):(4'he)];
              reg72 <= wire44[(5'h10):(4'ha)];
              reg73 <= $signed(wire44);
              reg74 <= ($signed($signed((wire3[(3'h6):(2'h3)] >> $unsigned(reg58)))) ?
                  $signed(reg73) : (&$unsigned(($unsigned((8'h9e)) >= (reg51 - wire45)))));
            end
          else
            begin
              reg70 <= reg52[(3'h7):(1'h1)];
              reg71 <= (~$signed((^~(~&reg57))));
            end
          reg75 <= wire48[(3'h5):(3'h4)];
        end
      reg76 <= $signed($unsigned(reg74));
      reg77 <= (-($signed(($signed(wire54) ? reg60 : $unsigned(wire5))) ?
          $unsigned(reg59[(2'h2):(1'h0)]) : (reg69 >= {reg60[(5'h12):(4'hd)],
              $signed(wire54)})));
      if ({(8'had)})
        begin
          reg78 <= ($signed($unsigned(({wire56,
              reg69} || $signed(wire42)))) >> (($signed(reg70[(3'h4):(3'h4)]) ?
              ($signed(wire46) ^~ $signed((7'h41))) : wire54) ^ (($signed(reg60) ?
              (wire49 <= (8'hb8)) : (wire0 ?
                  reg70 : wire53)) < $unsigned((reg62 ? wire48 : (7'h43))))));
          reg79 <= wire53[(3'h7):(2'h2)];
          reg80 <= {reg73[(3'h5):(2'h2)]};
          reg81 <= (~|reg78);
          if ($unsigned($unsigned((($unsigned(reg63) >> reg75) <= $unsigned((~&wire55))))))
            begin
              reg82 <= $unsigned((wire0 || (-((~(8'ha5)) ?
                  (~wire48) : (wire53 ? (7'h41) : wire54)))));
              reg83 <= reg52[(3'h4):(3'h4)];
              reg84 <= ((reg57[(1'h1):(1'h0)] | wire55[(2'h3):(2'h2)]) << ($signed(((wire55 ^~ (7'h40)) ?
                  $unsigned(reg57) : $signed(wire48))) * $signed(reg66[(1'h0):(1'h0)])));
            end
          else
            begin
              reg82 <= {$unsigned($signed((~|(wire6 ? reg79 : reg67)))),
                  ((8'ha5) | {(^((8'hbb) ? (8'hb6) : reg51))})};
              reg83 <= $unsigned(($signed($signed($unsigned(reg64))) ?
                  (8'ha5) : ({(~^reg63)} << $unsigned((wire1 ?
                      reg74 : reg76)))));
              reg84 <= reg67;
              reg85 <= {$unsigned(wire1[(5'h11):(4'hc)])};
              reg86 <= ($unsigned(((+$signed((8'hac))) ?
                      reg61[(3'h7):(2'h3)] : (~|(reg81 && wire2)))) ?
                  $unsigned($signed({(-reg76),
                      (reg66 + wire47)})) : (({$signed(wire48)} & reg57[(1'h0):(1'h0)]) ?
                      $signed(($signed((8'hb1)) + reg80)) : reg67));
            end
        end
      else
        begin
          reg78 <= ($unsigned($signed(wire50[(1'h1):(1'h0)])) ?
              $unsigned($signed(reg84[(3'h4):(3'h4)])) : (wire53[(2'h3):(2'h2)] ?
                  $unsigned($signed((reg74 ?
                      wire54 : wire54))) : (wire53[(4'he):(1'h0)] ?
                      ((reg66 ? wire0 : reg61) - $signed((8'hbf))) : wire1)));
          reg79 <= wire5[(1'h0):(1'h0)];
          if ({wire48[(3'h6):(1'h0)], (~|(-$signed((~^(8'hbe)))))})
            begin
              reg80 <= $signed((-reg68));
            end
          else
            begin
              reg80 <= wire5[(3'h5):(3'h5)];
              reg81 <= (-wire5);
              reg82 <= ((({{reg82, wire56}} ?
                      $unsigned((~|reg58)) : (^~$signed(reg75))) ?
                  (&(-(reg76 ? wire46 : reg80))) : (reg81 ?
                      reg69[(4'h9):(3'h7)] : $signed(((8'hb8) ?
                          reg66 : reg75)))) <= {$signed((~|(wire56 ?
                      reg84 : wire45))),
                  wire56});
            end
          reg83 <= reg58[(4'h8):(3'h6)];
          if (reg84[(3'h5):(1'h1)])
            begin
              reg84 <= reg81;
              reg85 <= {($signed({$signed(reg77),
                      reg77}) && ($unsigned((wire4 != reg61)) ?
                      {$signed(reg64), (|reg66)} : ((~|reg62) >= {reg80,
                          reg61}))),
                  ($signed($unsigned({wire5, wire6})) ?
                      wire55 : $unsigned(($signed(reg59) << (wire45 <<< reg77))))};
              reg86 <= ({wire46[(4'ha):(1'h1)]} >> $signed(wire47[(1'h1):(1'h1)]));
              reg87 <= (|wire40);
              reg88 <= wire49;
            end
          else
            begin
              reg84 <= (({reg65[(4'h9):(3'h4)],
                      (reg79 ? (^reg78) : $signed(wire47))} ?
                  reg88[(4'h8):(3'h5)] : {(reg75[(3'h4):(2'h3)] ?
                          wire53 : (reg63 ?
                              reg69 : wire50))}) & ($signed((reg76 != (reg67 ?
                      reg74 : reg61))) ?
                  ((((8'hbc) > reg72) <= (reg68 ? wire3 : reg71)) ?
                      (~reg81[(2'h2):(1'h0)]) : wire47[(2'h2):(1'h0)]) : ($unsigned(reg51[(4'hb):(2'h2)]) > $signed({(8'hb1),
                      (8'h9e)}))));
            end
        end
    end
  assign wire89 = (&$signed($signed(reg88)));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire14,
                 wire13,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire13 = ((wire10 ? (7'h40) : {$signed((8'ha4)), (|(!wire12))}) ?
                      (wire11[(1'h1):(1'h0)] && ($unsigned((~|wire11)) ^~ (!wire10[(4'h8):(2'h3)]))) : (($unsigned({wire12}) ?
                          ((wire8 ?
                              wire11 : wire8) >> $unsigned(wire11)) : $signed((wire11 ?
                              (8'ha1) : (8'ha9)))) <= ((wire11 ?
                          (|wire8) : (wire10 ?
                              wire9 : wire8)) >= (wire9 ^~ wire12[(4'he):(2'h2)]))));
  assign wire14 = {(+$unsigned(wire8))};
  always
    @(posedge clk) begin
      if ((~^$unsigned(wire9)))
        begin
          if ((|($unsigned(((wire10 ? wire13 : wire14) == (~|wire14))) ?
              $unsigned(($unsigned(wire14) ?
                  {wire12,
                      (8'hbe)} : $signed(wire8))) : ($signed((-wire12)) ~^ wire8[(3'h7):(3'h6)]))))
            begin
              reg15 <= (&({$signed(((8'hb4) ? wire12 : wire9))} ?
                  {(8'ha2), {$unsigned((8'hab))}} : {wire13}));
              reg16 <= (wire11[(5'h14):(5'h14)] || ((((7'h40) ?
                          $unsigned((8'hb9)) : $signed(wire9)) ?
                      {wire9, (wire12 ? wire12 : reg15)} : ((wire11 ^~ wire13) ?
                          $signed(reg15) : $unsigned(wire10))) ?
                  $signed(wire13) : wire10[(3'h4):(3'h4)]));
              reg17 <= ((^wire10) <<< ({(((8'h9d) >= wire14) ^~ wire8)} << ({$unsigned(wire13),
                  {wire8, reg15}} >= ((wire14 ~^ wire14) != ((7'h42) ?
                  wire13 : (8'ha1))))));
            end
          else
            begin
              reg15 <= $signed(wire11[(3'h6):(2'h2)]);
            end
          if (($unsigned($unsigned((~^reg17[(1'h0):(1'h0)]))) ?
              (wire9[(3'h6):(3'h5)] * (~(~|(&(8'hb1))))) : (wire9[(3'h5):(2'h2)] ?
                  wire13[(1'h1):(1'h1)] : reg15)))
            begin
              reg18 <= (wire14 ?
                  (!((&$signed(wire12)) < {(wire11 > wire9)})) : $unsigned(($signed(wire9) < ($unsigned((8'ha5)) ?
                      wire9 : (!(7'h44))))));
              reg19 <= reg18;
              reg20 <= (wire10[(4'ha):(2'h3)] > ((8'h9e) >= {$signed((wire11 > reg17)),
                  wire9[(3'h4):(2'h2)]}));
              reg21 <= (wire9 >>> reg16);
            end
          else
            begin
              reg18 <= wire8[(2'h3):(1'h1)];
              reg19 <= (wire12 - (wire14[(3'h5):(1'h0)] ?
                  ((&wire14) ? wire13[(2'h2):(1'h0)] : reg19) : (~|reg18)));
              reg20 <= reg20[(3'h6):(2'h3)];
              reg21 <= wire12;
              reg22 <= wire12[(4'hf):(3'h7)];
            end
          reg23 <= ($signed((wire10 ^~ $signed($signed(reg17)))) + (!{reg20,
              ($signed((8'hac)) == reg20)}));
          reg24 <= (((~&$signed((wire13 ^~ reg16))) & ({(reg21 ?
                      (8'hbb) : (8'hb3))} ?
              (~^$unsigned(reg15)) : $unsigned((^reg16)))) >> wire9);
          if (reg24)
            begin
              reg25 <= $signed(((+reg19[(2'h2):(1'h1)]) & $signed($signed(reg23[(2'h3):(1'h1)]))));
              reg26 <= ({(!(reg18 ? $signed(wire14) : (wire9 <<< reg23)))} ?
                  ({reg23} ?
                      (~|{$unsigned(reg23),
                          (wire9 && reg25)}) : (&wire10)) : reg24);
              reg27 <= reg15[(4'hb):(2'h3)];
            end
          else
            begin
              reg25 <= reg15[(3'h7):(1'h0)];
            end
        end
      else
        begin
          reg15 <= (($unsigned(((wire11 + wire11) ?
                      wire8[(1'h0):(1'h0)] : reg21[(3'h4):(2'h2)])) ?
                  reg16 : $unsigned((^~(|reg27)))) ?
              ((reg16 ?
                      $signed((wire11 < reg26)) : ($unsigned(wire10) ^ {wire12})) ?
                  (~^reg27[(4'hd):(4'hb)]) : (((!wire11) ?
                      (wire10 ?
                          reg27 : reg15) : wire9[(4'hc):(4'h8)]) ^ {(^reg20)})) : wire8[(4'h8):(3'h5)]);
        end
      reg28 <= $unsigned($unsigned(((!(~wire12)) >>> {reg19})));
    end
  assign wire29 = $signed((!(((8'hac) & (-wire12)) < (8'ha0))));
  assign wire30 = wire10[(4'ha):(4'h8)];
  assign wire31 = (|(((reg25 >= (reg25 << reg17)) << $signed({wire12,
                      wire29})) || reg16[(3'h4):(2'h3)]));
  assign wire32 = (reg23 & {((^~$signed(reg19)) ^~ {reg26[(5'h12):(1'h1)]}),
                      reg27[(3'h6):(3'h6)]});
  assign wire33 = ($signed((~|reg15)) && $signed($unsigned((~$unsigned(wire10)))));
  assign wire34 = $unsigned((((^{(8'hb3), wire29}) ?
                          $unsigned((&reg17)) : ({(8'hbd)} | (wire10 ?
                              reg22 : reg21))) ?
                      ((^(7'h40)) + wire31[(5'h11):(4'h8)]) : (wire10 >>> (~^$signed((8'hb3))))));
  assign wire35 = reg25;
  assign wire36 = (+{$unsigned($signed($signed(wire34))),
                      ($signed((~|wire32)) ? reg17 : $signed(wire30))});
  assign wire37 = {$unsigned($signed(($signed(wire8) ?
                          (~^wire31) : (wire32 | wire36))))};
  assign wire38 = (8'hbe);
  assign wire39 = ($signed($unsigned($unsigned(wire12[(4'h8):(2'h3)]))) << reg23);
endmodule

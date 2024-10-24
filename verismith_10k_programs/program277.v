module top
#(parameter param116 = ((((^(~|(8'ha5))) ? (8'hb6) : ((8'had) ~^ (~(7'h42)))) ? {({(8'hb3)} ? ((8'had) ? (8'hbc) : (7'h43)) : ((8'hb5) > (8'hb0))), (((8'ha3) >>> (8'had)) ? {(8'hbb)} : (8'hb2))} : {(~&{(8'ha3), (8'ha1)}), ({(8'hba), (8'hae)} ? (!(8'hb8)) : ((8'ha0) ? (8'hb4) : (7'h40)))}) ? ((~|((~^(8'h9d)) ? {(8'hb5)} : ((8'h9e) ? (8'hb1) : (8'hba)))) ? {{((8'h9e) | (8'ha4))}, (!(~|(7'h41)))} : ({{(8'hab), (7'h43)}} ~^ ((8'ha3) ? (-(8'haf)) : ((8'hbf) ? (7'h41) : (7'h41))))) : (|({{(8'ha5)}, ((8'ha3) ? (8'hae) : (7'h42))} ? (~((7'h43) ? (8'hb8) : (8'hb7))) : ((!(8'h9f)) <<< ((8'hb4) ^ (8'hb8)))))), 
parameter param117 = param116)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire107;
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire107,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire5 = (^(!(($unsigned(wire2) ?
                         (wire2 ? wire4 : wire3) : wire1[(1'h1):(1'h0)]) ?
                     ({wire4,
                         wire0} > (wire2 * (8'hbf))) : $unsigned((wire4 >> (7'h44))))));
  assign wire6 = $signed($signed({(wire2[(2'h2):(2'h2)] ?
                         (^wire3) : wire4[(4'h9):(4'h8)]),
                     $signed(wire4[(2'h2):(1'h0)])}));
  assign wire7 = $unsigned(wire5);
  assign wire8 = (((wire4[(2'h2):(1'h1)] ~^ wire6[(3'h7):(2'h3)]) + wire6[(3'h6):(3'h5)]) >> ($unsigned(wire0[(3'h7):(1'h0)]) ?
                     {($unsigned(wire3) ?
                             $unsigned(wire0) : wire5[(4'he):(2'h3)]),
                         ((^(8'hbe)) ?
                             (wire4 & (8'ha5)) : (wire1 ?
                                 wire2 : wire7))} : (wire5[(3'h7):(2'h2)] <<< wire1)));
  assign wire9 = {$unsigned(($signed($unsigned(wire1)) ?
                         $signed((wire1 != wire2)) : ((&wire8) ?
                             wire6[(2'h3):(2'h2)] : wire4[(4'h8):(3'h7)])))};
  module10 #() modinst108 (wire107, clk, wire5, wire1, wire0, wire2, wire9);
  assign wire109 = $unsigned((((wire8 ? (|(8'had)) : (-wire2)) ?
                           wire107 : ($signed(wire8) != wire4)) ?
                       ($unsigned($signed((7'h43))) >> (~&wire6)) : {$unsigned(wire5[(4'hc):(4'h8)]),
                           $signed(wire7[(1'h0):(1'h0)])}));
  assign wire110 = $signed(wire107);
  always
    @(posedge clk) begin
      reg111 <= ({$unsigned((!(^~wire7))), (wire7 ? wire8 : wire107)} ?
          wire6[(2'h3):(2'h2)] : (((8'hbb) && wire1[(3'h6):(3'h5)]) | $unsigned(((-wire7) ^~ $signed(wire109)))));
      reg112 <= (-wire3);
      reg113 <= (((~^$signed(wire8[(3'h6):(2'h2)])) >= ($unsigned($signed((8'hb4))) ?
              $unsigned((^~wire110)) : ((-wire107) ?
                  (wire6 ? (8'h9e) : wire110) : (wire1 ? wire110 : wire6)))) ?
          (~^({$signed(wire6)} ? {wire5} : (~$signed(reg111)))) : (|wire109));
      reg114 <= (wire9[(5'h12):(4'ha)] ~^ $unsigned((|(^{reg113, wire110}))));
      reg115 <= {wire6, reg112[(2'h2):(1'h0)]};
    end
endmodule

module module10
#(parameter param105 = ((|((!(8'ha0)) << ({(8'ha0), (8'hb7)} <= (8'had)))) ^~ (-(((&(8'haf)) < (~|(8'ha4))) < (((8'hb3) ? (8'ha2) : (8'ha5)) >>> {(8'hb4), (8'hac)})))), 
parameter param106 = (((~&({param105, (7'h40)} || (7'h40))) ? (+((param105 <= param105) && (^~param105))) : (((param105 ? param105 : param105) ? (param105 | param105) : (param105 ? param105 : param105)) ^~ (((8'hb7) && (8'haf)) < (param105 + param105)))) ? {((~(~&param105)) - (8'hb1)), (!(param105 ? (param105 ~^ (8'hbd)) : param105))} : param105))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire39;
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire75,
                 wire74,
                 wire73,
                 wire63,
                 wire62,
                 wire43,
                 wire42,
                 wire41,
                 wire16,
                 wire39,
                 reg76,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg61,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire16 = wire14[(4'hf):(4'ha)];
  module17 #() modinst40 (.wire18(wire14), .wire19(wire15), .clk(clk), .wire21(wire12), .y(wire39), .wire20(wire11), .wire22(wire16));
  assign wire41 = (^~{((~(&(8'ha7))) ^ ($signed(wire11) ? wire39 : {wire15})),
                      ((wire11 ? wire12[(4'h8):(3'h5)] : wire16) ?
                          {$signed(wire39),
                              (wire39 ? (8'ha3) : wire16)} : {wire16})});
  assign wire42 = (((|wire41) ?
                      $signed((-$signed(wire39))) : $unsigned(wire11)) & (~&((wire13 & wire15) + wire12[(3'h5):(1'h0)])));
  assign wire43 = ({(($signed(wire16) + (~wire16)) ?
                          (-(7'h43)) : $unsigned($signed(wire16))),
                      wire39} == $unsigned($unsigned(wire42)));
  always
    @(posedge clk) begin
      if ((wire15 | {$unsigned((((8'hb0) ?
              wire14 : wire12) ^~ $signed(wire42)))}))
        begin
          reg44 <= $signed(wire11[(3'h5):(1'h1)]);
          reg45 <= wire15;
          if ({$unsigned(((!(wire13 && (8'hb7))) ^~ wire39)),
              wire39[(4'h8):(1'h1)]})
            begin
              reg46 <= $unsigned($unsigned(($signed($signed(reg44)) ?
                  (8'ha1) : (8'ha4))));
              reg47 <= wire13[(3'h7):(3'h7)];
              reg48 <= ($unsigned(($signed(wire42) <<< $signed(wire39))) * reg47[(4'h8):(1'h0)]);
              reg49 <= (!$unsigned((^~(!$signed(reg44)))));
            end
          else
            begin
              reg46 <= (8'hb7);
              reg47 <= wire16;
              reg48 <= wire11[(4'h9):(2'h2)];
              reg49 <= $unsigned(reg44);
              reg50 <= (~^reg46);
            end
          reg51 <= $signed($signed((~^reg48)));
        end
      else
        begin
          reg44 <= $unsigned($unsigned({reg44, $signed((~&(8'ha0)))}));
          reg45 <= ($signed($signed(wire11[(1'h1):(1'h0)])) ?
              (($unsigned((8'ha4)) >> $unsigned($unsigned(wire39))) ?
                  ($signed(wire15) ?
                      reg45[(4'h8):(1'h1)] : wire12) : $signed(($signed((8'h9c)) ?
                      {wire12} : wire14))) : {$unsigned(reg48[(2'h2):(1'h0)]),
                  (reg47 > ({wire14, wire15} ?
                      (wire15 <<< reg44) : (reg46 <= (7'h42))))});
        end
      reg52 <= {$unsigned((wire14 | (~(!reg50))))};
      reg53 <= (~$unsigned({$unsigned($signed(reg47))}));
      reg54 <= reg48[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      if ((((|(8'haf)) ?
              reg48[(3'h4):(1'h1)] : $unsigned((((7'h43) ? wire16 : reg45) ?
                  wire13[(2'h3):(2'h3)] : (~reg49)))) ?
          wire41[(3'h6):(3'h5)] : (&($signed({wire16}) <= ({wire11, wire15} ?
              (reg52 + reg51) : (reg48 ? reg45 : reg53))))))
        begin
          reg55 <= {$unsigned((~|{(~|(8'hae)), (+reg51)})),
              $signed($signed(wire43[(3'h6):(3'h6)]))};
        end
      else
        begin
          reg55 <= {{((8'hac) <<< ((wire39 >= (8'hba)) ?
                      {reg55, wire41} : (7'h40)))},
              $unsigned((~(reg47[(3'h4):(3'h4)] ? (~&wire12) : reg44)))};
        end
      if ($unsigned($unsigned((~(((8'hbb) ? (8'ha5) : (8'ha5)) ?
          (reg48 >= wire11) : ((8'hb6) < wire14))))))
        begin
          if ($unsigned({$unsigned(reg49[(1'h1):(1'h1)])}))
            begin
              reg56 <= $unsigned($signed($signed((~^$signed(reg47)))));
              reg57 <= (8'hae);
              reg58 <= reg46[(1'h0):(1'h0)];
              reg59 <= $unsigned(reg44[(3'h5):(3'h5)]);
              reg60 <= reg49[(2'h3):(1'h1)];
            end
          else
            begin
              reg56 <= (-$unsigned(((reg45 ? $signed(wire15) : (~|reg46)) ?
                  ((wire13 <= reg55) >> (^wire41)) : $signed(reg54[(3'h5):(3'h4)]))));
              reg57 <= (reg58 > reg59[(3'h7):(1'h1)]);
              reg58 <= $signed((&(-$signed($unsigned(reg52)))));
              reg59 <= (|($signed(({(8'hbc), reg51} ?
                      reg48[(2'h2):(2'h2)] : (reg52 - reg45))) ?
                  reg57[(3'h5):(3'h5)] : reg46[(3'h7):(1'h1)]));
            end
        end
      else
        begin
          reg56 <= (~^reg44);
          reg57 <= (^~(&$unsigned($signed($signed(wire16)))));
          reg58 <= ({($signed(reg46) ?
                  ((reg60 ~^ (8'ha0)) >> (~|reg52)) : ($signed(reg48) << reg47))} && $signed(({(!wire15),
              wire14} && ((reg58 ? wire12 : wire15) ?
              (wire13 ? reg57 : (8'hae)) : wire39))));
          reg59 <= (~(($signed((^~reg44)) ?
              (reg60[(4'hc):(2'h3)] >>> {reg46, reg59}) : ((wire12 == reg48) ?
                  (reg57 & reg48) : (wire15 <<< wire15))) | reg54[(4'h8):(1'h0)]));
        end
      reg61 <= reg51[(4'hc):(1'h0)];
    end
  assign wire62 = reg51[(3'h4):(2'h2)];
  assign wire63 = reg46;
  always
    @(posedge clk) begin
      reg64 <= ($unsigned($signed($signed({reg45, reg58}))) ?
          $unsigned((8'ha4)) : (~|((8'ha2) ?
              (!(wire14 * wire43)) : $signed((reg45 & reg44)))));
      reg65 <= $signed(wire43[(1'h0):(1'h0)]);
      if ((~|reg52[(1'h1):(1'h0)]))
        begin
          reg66 <= $signed($unsigned(reg44[(3'h6):(3'h5)]));
          reg67 <= wire16[(4'ha):(4'h9)];
          if ({(~|(~(^~$unsigned((8'ha5)))))})
            begin
              reg68 <= (reg45 <= wire43[(3'h5):(3'h5)]);
              reg69 <= ($signed(($signed(wire11) ?
                  reg46[(3'h7):(3'h4)] : reg44[(4'hc):(4'h8)])) ~^ ((reg46[(3'h4):(2'h3)] > $unsigned(reg68)) ?
                  ($unsigned($signed(reg67)) > (wire43 ?
                      ((8'ha3) ? (8'hae) : reg56) : (!reg52))) : reg61));
            end
          else
            begin
              reg68 <= reg61[(2'h2):(1'h1)];
              reg69 <= {reg58};
              reg70 <= {$unsigned(reg44), reg58};
              reg71 <= reg61[(1'h1):(1'h0)];
            end
          reg72 <= ($unsigned(($signed($signed(reg61)) ?
              $signed(reg64) : $signed((~|wire62)))) >> $unsigned(($signed(wire14) >> ($unsigned((8'hbb)) < (reg66 ?
              reg59 : wire62)))));
        end
      else
        begin
          reg66 <= (~&(!$signed({reg65, ((8'hb0) ? reg55 : reg64)})));
        end
    end
  assign wire73 = reg70[(5'h10):(5'h10)];
  assign wire74 = {$signed({(&reg57[(1'h1):(1'h1)])})};
  assign wire75 = wire41[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg76 <= $signed((($signed($unsigned(wire75)) <<< (((8'hae) | reg69) >> $unsigned(reg53))) * wire14));
    end
  module77 #() modinst101 (wire100, clk, reg46, reg71, reg67, reg52);
  assign wire102 = (&$signed((((|wire13) ?
                           (reg71 ? wire100 : wire74) : (reg71 ?
                               reg56 : reg70)) ?
                       $unsigned($unsigned(reg47)) : $unsigned((~(8'ha8))))));
  assign wire103 = (reg70[(4'h9):(3'h5)] ? reg60[(4'hc):(3'h5)] : reg59);
  assign wire104 = $unsigned(({(|reg49)} & ($unsigned(wire15) ?
                       ($signed(reg70) * (!reg48)) : (!wire103))));
endmodule

module module77
#(parameter param99 = (|(^((8'hb9) - ((-(8'hbd)) <= (~&(8'ha9)))))))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire80;
  input wire [(4'hd):(1'h0)] wire79;
  input wire [(4'h8):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 reg98,
                 reg97,
                 reg96,
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
                 (1'h0)};
  assign wire82 = $unsigned(wire78[(3'h7):(1'h0)]);
  assign wire83 = (8'ha9);
  assign wire84 = (8'hb0);
  always
    @(posedge clk) begin
      reg85 <= $unsigned((wire83 ? wire79[(4'hc):(3'h5)] : wire81));
      if (((~^(~|reg85[(3'h5):(3'h5)])) == $unsigned((8'had))))
        begin
          if ((((~|wire83) ?
                  (wire84[(3'h7):(3'h4)] > ($unsigned(wire84) != {wire81})) : wire78) ?
              (wire84[(3'h6):(3'h5)] && $unsigned((&(wire82 >>> (7'h43))))) : ($signed(wire78) >> ($signed(wire80) ?
                  reg85[(2'h3):(2'h3)] : wire80))))
            begin
              reg86 <= $unsigned(reg85);
            end
          else
            begin
              reg86 <= reg85[(3'h5):(1'h0)];
              reg87 <= {(!((~&{wire79, wire79}) && reg86)),
                  wire81[(5'h12):(3'h4)]};
            end
          reg88 <= (reg87[(2'h2):(1'h0)] ?
              {$unsigned(({wire83} ?
                      ((8'hb8) ? wire84 : reg85) : ((8'hb8) ?
                          (8'ha5) : (8'hae))))} : (wire81[(4'hd):(4'h9)] >= (reg86[(2'h2):(1'h1)] ?
                  reg85 : wire81)));
          if ($signed((+(wire82 < $signed({wire83})))))
            begin
              reg89 <= wire82;
            end
          else
            begin
              reg89 <= (((($signed(wire80) ?
                          (~|reg89) : (wire79 ? reg89 : wire84)) ?
                      wire84 : reg88) ?
                  (~|(((8'ha5) ? wire80 : wire78) ?
                      {reg89} : reg85)) : {(^~$signed(wire78)),
                      reg88}) | $signed($unsigned($unsigned((wire79 ^ wire80)))));
              reg90 <= (((((wire78 ? (8'hb5) : wire81) ?
                      (reg86 - (8'hb4)) : (reg87 - reg86)) <= (reg85[(1'h1):(1'h0)] - wire81)) ?
                  $signed($signed($unsigned(wire82))) : wire82) <= (|$unsigned({$signed(wire78)})));
              reg91 <= $signed({($signed({reg86}) <= $unsigned($unsigned((8'ha4)))),
                  (~&((reg90 ? wire79 : wire81) ?
                      (wire82 >>> reg89) : $signed(wire80)))});
              reg92 <= ({wire78[(1'h0):(1'h0)],
                      ((~(^~(8'ha8))) ?
                          ($unsigned((8'hbf)) ?
                              (wire81 >> wire78) : {reg89, reg85}) : reg86)} ?
                  wire82[(1'h0):(1'h0)] : ($signed(((&wire79) < wire83[(3'h7):(2'h3)])) >= $signed((!(wire79 != reg86)))));
              reg93 <= reg87[(4'ha):(1'h1)];
            end
          if ((^~($signed(((wire82 <<< wire78) ?
              (wire80 ?
                  wire78 : (8'hbf)) : $signed(wire83))) && $unsigned($unsigned((wire78 >= reg93))))))
            begin
              reg94 <= $signed((|reg85));
              reg95 <= ((&$signed(reg88[(4'ha):(3'h5)])) ?
                  (^~$signed($unsigned($signed(reg91)))) : ($signed(((reg85 && reg85) ^ $signed(wire84))) ?
                      $signed($unsigned($signed(reg89))) : ($unsigned((reg85 ^ reg92)) && (wire82[(3'h7):(3'h7)] ?
                          (|wire83) : wire84[(3'h4):(3'h4)]))));
              reg96 <= (~^($signed(((wire80 ? reg88 : wire78) ?
                      (reg93 ? wire82 : reg87) : reg90)) ?
                  ((^{reg95}) - (reg93 ?
                      reg87[(1'h0):(1'h0)] : $signed(wire80))) : (reg90 ?
                      {reg88[(4'hd):(2'h3)]} : reg86[(4'h8):(3'h7)])));
              reg97 <= wire80[(1'h0):(1'h0)];
            end
          else
            begin
              reg94 <= {(((reg85 ?
                      (reg89 - reg94) : ((8'ha6) ?
                          reg86 : reg87)) + reg92[(2'h2):(1'h1)]) << ($signed((wire84 == (8'ha8))) >= reg96)),
                  (8'ha9)};
              reg95 <= (($unsigned({{reg88, reg93},
                      (wire78 ? (8'hab) : wire82)}) > wire79) ?
                  reg86[(4'h8):(2'h2)] : reg86[(4'h8):(4'h8)]);
              reg96 <= wire82;
            end
          reg98 <= wire82[(1'h1):(1'h1)];
        end
      else
        begin
          if (reg87)
            begin
              reg86 <= {{($unsigned(wire78) ?
                          {(-wire82), (wire80 >> wire78)} : (&(~^reg92)))}};
              reg87 <= (reg97 ? reg86 : wire79[(3'h6):(2'h2)]);
              reg88 <= {$signed($signed(reg90)),
                  (~($unsigned(wire80[(1'h1):(1'h1)]) ^~ $unsigned((wire80 ?
                      wire80 : reg89))))};
              reg89 <= wire83[(5'h12):(3'h6)];
              reg90 <= {(8'ha7)};
            end
          else
            begin
              reg86 <= reg88[(3'h5):(2'h2)];
              reg87 <= (-((~|reg87[(3'h5):(2'h2)]) >= ((~(wire79 >>> reg89)) == reg86[(2'h2):(1'h1)])));
            end
          reg91 <= (wire84 >> {$unsigned((&$signed((8'ha2)))),
              (-reg85[(2'h3):(2'h3)])});
          if (reg96[(4'hf):(4'hb)])
            begin
              reg92 <= wire79[(1'h1):(1'h0)];
              reg93 <= ({reg92[(1'h0):(1'h0)]} ?
                  {$signed($unsigned((^reg94)))} : $unsigned({$signed((reg93 != reg86)),
                      $signed((reg97 ? (8'hb2) : wire80))}));
              reg94 <= reg85;
              reg95 <= wire79;
              reg96 <= {wire82[(3'h6):(2'h2)]};
            end
          else
            begin
              reg92 <= $signed($unsigned($unsigned(wire80)));
              reg93 <= {reg89, wire78[(3'h6):(1'h0)]};
              reg94 <= (((+{(~|wire84),
                      (reg86 ?
                          reg86 : wire82)}) >= (reg89 ^ ((&reg87) - reg94[(2'h3):(2'h3)]))) ?
                  $unsigned(reg85[(3'h5):(2'h3)]) : $signed({reg88[(2'h2):(2'h2)]}));
              reg95 <= {$unsigned((^~reg92[(3'h7):(3'h7)]))};
            end
          reg97 <= (reg93[(3'h6):(2'h2)] ? $signed(wire84) : reg85);
        end
    end
endmodule

module module17
#(parameter param38 = (~^(&{(~^((8'hb4) ? (8'ha1) : (8'hb9))), (((8'hab) ? (8'hbd) : (8'hb6)) ^ (+(8'ha6)))})))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire25,
                 wire24,
                 wire23,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = $unsigned((&$unsigned({(wire19 || wire19)})));
  assign wire24 = $unsigned({$signed(wire19[(2'h3):(2'h2)]),
                      $unsigned(($unsigned(wire18) ?
                          (~|wire21) : $unsigned((8'ha7))))});
  assign wire25 = wire20[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg26 <= wire19;
      if (wire21)
        begin
          reg27 <= ({$signed(wire21[(2'h2):(2'h2)]),
              $signed(wire22)} + $unsigned($signed(wire20[(3'h6):(1'h1)])));
          if ((+wire22[(4'h8):(3'h5)]))
            begin
              reg28 <= ($unsigned(({{wire24},
                      $signed(wire23)} | $unsigned($signed(wire22)))) ?
                  wire22 : (((8'hb8) ?
                      wire20 : wire24) >>> (!({wire24} ^ $unsigned(wire19)))));
              reg29 <= (8'haf);
              reg30 <= $signed(($signed(((8'ha8) ?
                      wire18[(1'h1):(1'h0)] : (wire24 || (8'h9e)))) ?
                  wire18 : $unsigned((8'h9e))));
              reg31 <= ($signed(($signed((reg29 | wire21)) ?
                  ($unsigned(wire19) | reg28[(3'h6):(2'h3)]) : $unsigned((reg30 ?
                      reg28 : wire18)))) * (8'hac));
            end
          else
            begin
              reg28 <= wire19[(1'h0):(1'h0)];
              reg29 <= ($unsigned(($signed($unsigned(wire24)) ?
                      $unsigned((^~wire19)) : (wire20[(1'h1):(1'h1)] ~^ (reg28 & reg31)))) ?
                  ($unsigned((wire18[(4'hb):(3'h4)] ?
                          (wire25 - reg29) : $signed(wire22))) ?
                      reg27 : {$unsigned((8'hb3)),
                          (-(reg27 ?
                              (8'hb0) : wire24))}) : wire19[(1'h0):(1'h0)]);
              reg30 <= {((wire22[(3'h4):(2'h2)] - wire18[(4'hb):(2'h3)]) || (wire22 ?
                      $signed((wire20 >= (8'hbc))) : wire19[(2'h2):(1'h1)]))};
            end
          reg32 <= reg29;
          reg33 <= ({($unsigned($signed((8'ha2))) == wire25[(1'h1):(1'h1)])} ?
              {$signed({$unsigned(wire24), $unsigned(wire18)}),
                  ({$signed(reg26)} ^ (!reg32))} : ((wire24[(3'h4):(2'h2)] ?
                      reg26[(4'h8):(3'h6)] : $signed(reg26[(3'h5):(1'h1)])) ?
                  {($signed(wire20) ? reg31 : $signed(reg31)),
                      {wire23, $signed(reg27)}} : {((wire18 ? reg28 : (8'hae)) ?
                          reg26[(2'h3):(1'h1)] : (reg27 + wire25))}));
          reg34 <= reg32[(1'h0):(1'h0)];
        end
      else
        begin
          if (((&$signed($signed(wire18[(4'ha):(3'h5)]))) > ({{reg32[(4'h8):(1'h0)],
                      reg34},
                  ({reg26} ? (^~wire24) : (|wire23))} ?
              (~|(~|$signed(reg26))) : (^~(reg30[(1'h1):(1'h1)] ?
                  wire25 : $signed(wire18))))))
            begin
              reg27 <= $unsigned(((|(+(wire20 ? wire23 : reg33))) <<< wire23));
              reg28 <= $signed($signed($signed($unsigned((&reg30)))));
              reg29 <= (wire20[(3'h4):(2'h3)] ?
                  (($signed($signed(wire25)) ?
                      ($signed(reg30) ?
                          wire19 : $signed(wire22)) : {$unsigned(wire19),
                          ((8'ha7) ?
                              wire24 : reg27)}) + ((^{wire25}) ^~ (((8'hb3) <<< wire22) ~^ (wire18 ?
                      wire23 : (8'hbf))))) : (wire25 ?
                      (~|$unsigned($unsigned(wire22))) : $signed(((wire23 == reg30) ?
                          reg29[(2'h2):(1'h1)] : {wire21}))));
              reg30 <= $unsigned($signed((wire19 | wire19[(2'h3):(2'h2)])));
              reg31 <= {($unsigned(((^wire18) ^~ reg27)) * (($signed(reg27) > $unsigned(wire22)) ?
                      $unsigned((wire18 ? wire21 : reg28)) : reg26)),
                  (-(($unsigned((8'hbf)) <<< $unsigned(wire22)) ?
                      $unsigned($unsigned((8'hbc))) : $signed(wire20)))};
            end
          else
            begin
              reg27 <= reg33;
              reg28 <= $unsigned($signed(($signed((-wire21)) ^~ reg29[(3'h4):(3'h4)])));
              reg29 <= $unsigned(((wire18[(1'h0):(1'h0)] != ((reg29 & (8'haf)) ?
                  reg33[(4'hf):(4'ha)] : $signed(reg30))) && $signed(reg33[(5'h12):(3'h7)])));
            end
        end
      reg35 <= (wire18 ?
          ((!wire18[(2'h3):(1'h0)]) ?
              (((|wire22) ?
                  (~wire20) : (reg32 ?
                      wire25 : (8'h9f))) != ({wire21} >> reg28)) : ($unsigned($unsigned(reg34)) * $signed(reg27))) : ((8'hac) - ((!$signed(wire18)) * $signed((reg27 ?
              reg29 : wire22)))));
    end
  assign wire36 = $unsigned(({$unsigned(reg30[(1'h0):(1'h0)]),
                          ((|wire20) ?
                              {wire18, wire19} : wire21[(3'h4):(1'h1)])} ?
                      wire25 : (~&(7'h42))));
  assign wire37 = $signed(wire24[(1'h0):(1'h0)]);
endmodule

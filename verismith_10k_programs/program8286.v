module top
#(parameter param101 = {(-((((8'hb0) > (8'hbb)) ? {(8'hae), (8'hab)} : {(8'hb5), (8'hbf)}) ? ((!(8'hac)) >= ((8'hb4) * (8'hb7))) : (&((8'ha2) && (8'ha4)))))}, 
parameter param102 = ({(param101 & (&(param101 + param101))), (((param101 & param101) ? {param101, param101} : (param101 > (8'ha8))) ^~ {((8'ha3) ^ (8'hb7)), (param101 ? param101 : param101)})} ^ (!param101)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire81;
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire85,
                 wire84,
                 wire83,
                 wire4,
                 wire81,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire4 = wire3[(4'h8):(4'h8)];
  module5 #() modinst82 (wire81, clk, wire1, wire3, wire2, wire4, wire0);
  assign wire83 = $signed((~^$signed(wire4)));
  assign wire84 = $unsigned($signed((8'ha1)));
  assign wire85 = ((wire4[(2'h2):(2'h2)] - $signed($signed((wire2 ?
                          wire3 : (8'ha2))))) ?
                      {wire83} : ({((wire81 ? wire2 : wire1) ?
                                  (&wire3) : $unsigned(wire84))} ?
                          ($signed(wire4) + ((wire4 ? (8'hb2) : (8'hbb)) ?
                              wire2 : $unsigned((8'ha8)))) : wire81[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      reg86 <= {(~((-$unsigned(wire85)) ?
              {(~&wire83), wire2} : (wire85 - wire84[(3'h6):(2'h2)]))),
          ((~(((8'ha5) ? wire0 : wire81) ?
              {wire2} : wire81[(3'h7):(3'h6)])) * $unsigned($unsigned((wire0 == wire3))))};
      if ($signed($unsigned($unsigned(({wire84} << wire81)))))
        begin
          reg87 <= $unsigned($unsigned((7'h42)));
        end
      else
        begin
          reg87 <= ((wire81[(3'h5):(2'h3)] ?
                  wire2 : $unsigned(wire0[(4'hb):(1'h1)])) ?
              (wire4[(4'hc):(3'h4)] >= wire3) : ($signed(((^~wire4) << (wire84 ?
                      wire4 : wire85))) ?
                  wire83 : (((wire84 || wire81) + ((8'hb0) & wire85)) - wire2[(5'h12):(1'h0)])));
          if (wire0[(5'h10):(5'h10)])
            begin
              reg88 <= wire85[(1'h1):(1'h0)];
              reg89 <= $signed((wire3 < wire85[(3'h5):(2'h3)]));
              reg90 <= (-(~|((+{reg88}) ?
                  (wire84 ? {wire81} : $unsigned((8'ha5))) : ($signed(reg88) ?
                      $unsigned(reg88) : (~^wire1)))));
              reg91 <= $signed($signed(wire83[(3'h5):(3'h5)]));
              reg92 <= ((8'h9c) * reg88);
            end
          else
            begin
              reg88 <= (wire1[(4'he):(4'h8)] > reg89);
              reg89 <= (^(!(wire85 ?
                  (~|$unsigned(reg88)) : $unsigned($signed((8'hb6))))));
            end
        end
      reg93 <= ($unsigned(((^$signed(wire0)) ?
          wire85[(2'h2):(1'h0)] : $unsigned(reg90[(3'h5):(2'h3)]))) >= (|wire84));
      reg94 <= (reg90[(3'h4):(1'h0)] ?
          ($signed(((reg87 >= wire85) ?
              (reg90 <= wire2) : (reg89 ?
                  wire1 : reg93))) ^~ wire83[(1'h0):(1'h0)]) : reg91);
    end
  assign wire95 = (~$unsigned(reg86[(3'h6):(3'h5)]));
  assign wire96 = $unsigned(($unsigned($signed($signed(reg87))) ?
                      $signed((|reg86)) : ($unsigned((reg86 ?
                          reg94 : wire85)) >>> reg88)));
  assign wire97 = ({wire96[(3'h6):(2'h2)]} ~^ $unsigned({$unsigned(wire96[(4'h9):(4'h8)])}));
  assign wire98 = ($unsigned($unsigned($signed($signed(wire83)))) >> wire2);
  assign wire99 = (-({$signed((wire95 ? (7'h41) : (8'hbb)))} ?
                      $unsigned($signed((wire83 ?
                          reg88 : wire85))) : wire97[(1'h1):(1'h1)]));
  assign wire100 = wire85[(3'h4):(1'h1)];
endmodule

module module5
#(parameter param80 = (^~((((8'ha7) ? {(8'hb0), (8'haa)} : ((7'h41) | (8'ha7))) ? {(^~(8'hb8)), (!(8'haf))} : ({(8'hb2), (8'hb7)} ? ((8'hb3) ? (8'hbc) : (8'ha2)) : ((7'h41) || (8'hb7)))) == (~&(~((8'hbd) ? (8'hba) : (8'hbf)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire47;
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire47,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  module11 #() modinst48 (wire47, clk, wire8, wire7, wire10, wire6);
  always
    @(posedge clk) begin
      if (wire47)
        begin
          reg49 <= (~^(^~$signed(wire8[(5'h11):(3'h4)])));
          reg50 <= ((^(8'ha5)) < wire9[(1'h1):(1'h1)]);
          reg51 <= ((~&wire8[(4'ha):(2'h2)]) ?
              $unsigned(($signed((~|wire10)) > ($unsigned((8'ha2)) ?
                  $signed(wire8) : (&wire9)))) : (7'h41));
          reg52 <= ($unsigned($signed({(^~wire8),
              {wire8}})) ~^ $signed((((~&reg50) | $signed(wire10)) ?
              reg51[(3'h4):(2'h3)] : (wire6[(2'h3):(1'h0)] != (~(8'hb6))))));
        end
      else
        begin
          if ({(&$unsigned(wire6[(4'hc):(2'h3)])), (reg50 ? reg50 : (8'ha4))})
            begin
              reg49 <= $unsigned($signed(wire8[(4'h8):(2'h2)]));
              reg50 <= wire6[(5'h11):(5'h11)];
              reg51 <= wire47;
              reg52 <= ($signed((|((~^wire8) != wire7))) - $unsigned($unsigned(((reg52 ?
                      reg51 : reg50) ?
                  wire8[(1'h1):(1'h1)] : $signed(wire7)))));
              reg53 <= {{(8'hb5), (&(~^(8'haf)))},
                  (wire9[(2'h2):(1'h1)] ?
                      ($signed(wire8) & (-(^~wire6))) : ($unsigned((~wire8)) ?
                          reg49[(5'h14):(4'hb)] : (!$unsigned(reg52))))};
            end
          else
            begin
              reg49 <= (wire6[(4'hf):(1'h0)] ^ $unsigned(reg52[(3'h7):(1'h1)]));
              reg50 <= {((^~$signed((wire6 | wire6))) ?
                      (-$signed($unsigned(wire9))) : ((^(+(8'ha3))) ?
                          $signed((reg53 <= reg53)) : (reg52[(3'h7):(2'h2)] && (reg49 ?
                              wire9 : reg53)))),
                  $unsigned(reg50)};
              reg51 <= $unsigned((~wire9[(2'h2):(2'h2)]));
              reg52 <= reg51[(2'h3):(1'h0)];
            end
          reg54 <= {{($signed((~wire47)) ?
                      $signed($unsigned(reg50)) : {reg53,
                          wire7[(4'hc):(1'h0)]}),
                  wire47}};
          reg55 <= ($signed($signed((wire10 ?
                  wire7[(5'h10):(4'h8)] : (8'hb9)))) ?
              reg52[(3'h5):(1'h1)] : ($unsigned(reg53) <= (wire6[(5'h11):(1'h0)] ?
                  reg49[(4'h8):(3'h5)] : ($unsigned((8'ha4)) ^~ wire10))));
        end
    end
  assign wire56 = $unsigned(((~|$unsigned($unsigned(wire10))) && (reg55 >> {wire7[(4'ha):(3'h7)],
                      reg54})));
  assign wire57 = $unsigned((^{(~&(-reg53))}));
  assign wire58 = $signed(wire6[(4'hc):(3'h5)]);
  assign wire59 = (8'hbc);
  assign wire60 = ((-wire59) <= wire56[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire57[(5'h14):(4'h8)])
        begin
          reg61 <= wire47;
          reg62 <= (&{(+$signed({(8'hb3)})), wire9[(1'h0):(1'h0)]});
        end
      else
        begin
          reg61 <= ($signed((~{$unsigned(wire8)})) ?
              {wire7[(3'h6):(3'h5)],
                  ($unsigned(((8'hb0) ? reg54 : wire60)) ?
                      ($unsigned(wire56) & (|reg51)) : (8'ha2))} : wire47);
          reg62 <= reg51;
          reg63 <= $unsigned(($unsigned(($signed((8'had)) > wire47[(4'h8):(2'h3)])) < (($unsigned((8'hae)) * (~^wire58)) ~^ reg61)));
          reg64 <= (~reg53[(2'h3):(2'h2)]);
          if ((!(wire59 ? (~{(|reg54)}) : wire8)))
            begin
              reg65 <= (~|reg64[(1'h0):(1'h0)]);
              reg66 <= ((wire57 ?
                      (~^$signed((^reg53))) : wire58[(4'ha):(1'h0)]) ?
                  $signed(reg53) : (wire57[(5'h15):(5'h15)] <<< ($unsigned(reg63) >>> wire8)));
              reg67 <= (^~$signed((reg66 << (|reg54[(5'h12):(1'h0)]))));
              reg68 <= ((~|reg54[(2'h2):(2'h2)]) ?
                  $signed($signed((^(reg50 ^ (8'hb0))))) : ({$unsigned((wire56 ?
                          wire7 : wire6)),
                      ((8'ha4) ?
                          (reg54 != (8'h9c)) : wire58[(2'h2):(1'h1)])} - $signed((~|$unsigned((8'ha1))))));
            end
          else
            begin
              reg65 <= $signed((reg54 ^~ (^~(((7'h43) >= wire60) ?
                  wire10[(4'he):(4'hc)] : (reg55 <= reg64)))));
              reg66 <= reg61;
              reg67 <= {(^$signed($signed((8'hbc)))),
                  (&$signed($unsigned($unsigned(reg67))))};
            end
        end
      reg69 <= ((({((8'ha8) ? (8'h9d) : (8'haf)), (wire59 - wire56)} ?
                  wire58[(4'h8):(1'h1)] : $signed(reg53)) ?
              $signed((^~{(8'haa), wire7})) : (reg51[(3'h6):(3'h4)] ?
                  {wire7} : ((reg61 ? wire59 : reg49) ?
                      $signed((8'hbb)) : (~|reg49)))) ?
          {wire56[(2'h3):(2'h3)], reg49[(4'hf):(4'h8)]} : wire60);
      reg70 <= (reg55 == wire57[(4'hd):(2'h2)]);
      reg71 <= $unsigned((+(((reg53 && reg62) > reg52[(1'h1):(1'h1)]) >>> ((wire8 ?
              reg61 : reg65) ?
          (wire9 ? (7'h42) : reg61) : $unsigned((8'hb2))))));
      reg72 <= (~|((((reg51 ^~ reg50) ? (&reg51) : reg71[(2'h2):(1'h1)]) ?
              wire59 : (((8'ha0) ? wire56 : reg62) == $unsigned(reg52))) ?
          reg55[(1'h0):(1'h0)] : $unsigned((wire60[(2'h2):(2'h2)] ?
              $signed(reg51) : $signed(reg63)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned(((8'ha9) ? wire58[(1'h1):(1'h0)] : reg53)))
        begin
          reg73 <= $unsigned($unsigned($unsigned(wire56)));
          if ((^~reg63[(3'h6):(3'h5)]))
            begin
              reg74 <= $unsigned(wire57[(3'h5):(1'h0)]);
              reg75 <= $unsigned($signed($unsigned(((reg54 ? wire57 : (7'h44)) ?
                  (reg64 ? (8'hae) : wire47) : reg68))));
              reg76 <= ({($signed(reg51[(1'h1):(1'h1)]) ?
                      wire57 : (+(wire56 ? reg74 : reg71)))} <<< (8'h9c));
              reg77 <= reg55;
              reg78 <= reg63[(1'h1):(1'h1)];
            end
          else
            begin
              reg74 <= wire6;
              reg75 <= $signed(wire47);
              reg76 <= (reg68[(2'h2):(1'h0)] ?
                  $signed(($signed({reg68}) ?
                      ((~&wire8) + $signed(reg62)) : wire8[(3'h7):(3'h6)])) : (+(~|reg67[(2'h3):(1'h0)])));
              reg77 <= ((|reg71) & reg71);
              reg78 <= reg77;
            end
          reg79 <= {(^wire9),
              (reg70[(1'h1):(1'h0)] ?
                  $unsigned((^~(|wire9))) : $unsigned($unsigned(wire56)))};
        end
      else
        begin
          reg73 <= (reg55 || {$signed(((reg67 ? reg70 : wire58) ?
                  {(8'haa), (8'hbf)} : (wire10 | reg74)))});
          if ($signed(($signed(($signed(wire7) ^ $signed(reg73))) * reg55)))
            begin
              reg74 <= ($signed(reg50) - {$signed($unsigned({reg71, reg71}))});
            end
          else
            begin
              reg74 <= (^(&$unsigned(((^~reg64) && (wire10 ? reg53 : wire7)))));
              reg75 <= $unsigned(reg75);
            end
          reg76 <= (7'h41);
          reg77 <= $signed($unsigned((^(+(8'haf)))));
          if (reg61[(2'h2):(1'h0)])
            begin
              reg78 <= (wire6 <= $unsigned($signed(reg62)));
              reg79 <= (reg62[(1'h0):(1'h0)] ?
                  $unsigned($signed(reg79[(5'h10):(4'hd)])) : $signed(reg49));
            end
          else
            begin
              reg78 <= wire9;
              reg79 <= {$unsigned($signed(reg73[(1'h1):(1'h0)]))};
            end
        end
    end
endmodule

module module11
#(parameter param45 = (({(((8'hb1) & (8'hbf)) ? ((7'h40) ? (8'hbb) : (8'hb3)) : ((8'ha4) ^~ (8'ha1)))} ? (((~|(8'hb7)) ? (7'h43) : {(8'hb2)}) ^ (((8'ha4) ? (8'hb8) : (8'ha9)) ? ((8'hbb) * (8'hbf)) : (~(8'ha7)))) : (^~(((8'hb4) ? (8'haa) : (8'ha4)) ~^ ((8'hb0) ? (8'hbb) : (8'h9f))))) ? (^(~|(8'hbe))) : ((~^({(8'ha0)} ? ((8'haf) ? (8'hb4) : (8'hae)) : (^(8'hac)))) * (((8'h9e) ? ((7'h42) ? (8'ha4) : (8'h9e)) : ((8'ha2) < (8'hb5))) <<< ((7'h43) <<< ((8'hbc) ? (8'had) : (8'hac)))))), 
parameter param46 = param45)
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg44,
                 reg37,
                 reg34,
                 reg33,
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
  assign wire16 = wire13;
  assign wire17 = ({wire16[(2'h3):(2'h3)], (^wire13[(5'h14):(5'h10)])} ?
                      (|$signed(wire14)) : wire14);
  assign wire18 = (+wire15);
  assign wire19 = (~&(wire13 << ((wire15 < $unsigned(wire17)) - wire14[(3'h6):(2'h2)])));
  assign wire20 = wire13;
  always
    @(posedge clk) begin
      reg21 <= wire14[(5'h10):(1'h1)];
      reg22 <= (((~&((8'hb6) ? wire15 : (8'h9c))) < (($unsigned(wire19) ?
          wire14[(4'h9):(1'h0)] : $signed(wire13)) & wire13[(5'h10):(2'h2)])) & $unsigned((wire17 ?
          (~&(wire19 << wire15)) : ($signed(wire18) ? wire14 : {wire17}))));
      reg23 <= wire19[(4'h9):(1'h1)];
      if ((((~|($signed(reg23) ?
              (!wire12) : wire12)) - $signed((wire15 ^~ $signed(reg22)))) ?
          ({wire18} ? wire14 : wire19) : ({wire14,
              ($signed(wire20) & (|wire18))} < (-wire18[(2'h2):(1'h1)]))))
        begin
          if (wire16[(2'h3):(1'h1)])
            begin
              reg24 <= reg23;
              reg25 <= (reg21 ?
                  ($signed(reg23[(5'h10):(1'h0)]) >>> (reg21[(2'h3):(2'h3)] > ((^~wire15) ?
                      (wire14 && reg22) : ((8'ha8) && wire19)))) : $signed(reg22[(3'h4):(2'h3)]));
              reg26 <= $unsigned((~|($unsigned(reg24[(4'h8):(1'h0)]) == wire20)));
              reg27 <= ((reg26[(4'h8):(1'h0)] ?
                  wire19[(4'h9):(1'h1)] : (^~(8'h9e))) >> ($unsigned(($unsigned(wire19) < ((8'ha4) ?
                  (7'h41) : wire16))) * ({(-wire16)} ?
                  wire13 : $unsigned($signed((8'ha1))))));
            end
          else
            begin
              reg24 <= (reg25 ?
                  $signed(($signed((^~(8'h9e))) ?
                      $signed(wire16) : $signed($signed(reg23)))) : ($unsigned($unsigned($unsigned(wire18))) ~^ $signed(wire14[(3'h5):(1'h0)])));
              reg25 <= {reg27};
              reg26 <= (+(8'ha7));
            end
          reg28 <= reg27;
          reg29 <= (7'h40);
          if (reg25)
            begin
              reg30 <= reg27;
            end
          else
            begin
              reg30 <= (reg29 ?
                  reg23[(3'h7):(3'h7)] : ({$signed({wire13})} ?
                      wire20[(4'ha):(4'h9)] : (-((wire14 >>> wire15) - wire16[(1'h0):(1'h0)]))));
              reg31 <= wire17;
              reg32 <= (reg28[(3'h4):(1'h1)] || $signed(($signed($unsigned((8'hb4))) ?
                  ((8'hbe) ?
                      (^~wire17) : (wire17 && reg27)) : wire17[(4'ha):(2'h2)])));
            end
          reg33 <= ((($signed((reg28 < wire16)) ?
                  $signed((8'ha4)) : wire13) || $unsigned(($unsigned(reg23) ?
                  {(8'hb3), wire14} : (wire17 << reg22)))) ?
              (|$unsigned($unsigned(reg24))) : {($unsigned(reg25) | reg21[(3'h6):(2'h2)]),
                  wire18});
        end
      else
        begin
          reg24 <= (~{$signed(reg21)});
          reg25 <= reg25;
          if ((!$signed({(!$unsigned((7'h40))),
              {wire19[(4'h9):(3'h5)], wire15}})))
            begin
              reg26 <= ($signed(wire17) < (!((wire17[(4'hd):(1'h0)] ?
                  (~^(7'h40)) : reg32[(2'h2):(1'h0)]) >= ($signed(reg23) != wire19[(2'h2):(1'h0)]))));
              reg27 <= $unsigned(reg31);
              reg28 <= ($unsigned($unsigned((((7'h40) ?
                  wire15 : wire14) <<< (reg29 < reg32)))) != $signed(wire16[(3'h4):(1'h1)]));
            end
          else
            begin
              reg26 <= $signed($signed(reg27));
              reg27 <= reg21;
              reg28 <= ((~&(((-wire19) != ((8'h9e) ? (8'hb5) : reg23)) ?
                      (8'hb4) : {{reg26, reg33}})) ?
                  ($unsigned((8'hb7)) << (|$signed(reg27))) : $unsigned(({{wire15,
                              reg22},
                          $signed(reg28)} ?
                      (7'h40) : $unsigned((reg27 ? wire19 : wire12)))));
              reg29 <= reg31[(4'ha):(4'h8)];
            end
        end
      reg34 <= (!(-reg23));
    end
  assign wire35 = (+$unsigned($unsigned(reg32)));
  assign wire36 = (($signed((wire12 ?
                      {wire16,
                          reg28} : reg24[(3'h6):(2'h2)])) << reg25) * $signed({reg21}));
  always
    @(posedge clk) begin
      reg37 <= wire18;
    end
  assign wire38 = wire16;
  assign wire39 = $unsigned((wire18[(1'h1):(1'h0)] ?
                      $signed((reg21 ?
                          ((8'ha4) ?
                              reg27 : wire14) : (reg23 + reg25))) : ((~(wire17 ?
                              reg27 : wire18)) ?
                          ($unsigned(wire16) ?
                              (reg21 ?
                                  (8'hae) : reg22) : wire35) : {$signed(wire13),
                              (^~wire19)})));
  assign wire40 = $signed(reg33);
  assign wire41 = {$unsigned(wire36)};
  assign wire42 = {{$unsigned(((reg33 ? wire14 : reg22) <= (wire20 ^~ wire15))),
                          {wire40, $unsigned((^~(7'h41)))}},
                      $signed(reg29[(5'h15):(5'h14)])};
  assign wire43 = {{reg21[(2'h2):(2'h2)], (wire20 || reg28)}};
  always
    @(posedge clk) begin
      reg44 <= wire38;
    end
endmodule

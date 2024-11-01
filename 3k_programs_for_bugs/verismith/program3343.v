module top
#(parameter param76 = (&((~|(^~((7'h40) ? (8'haa) : (8'hb8)))) ? ((~^((8'hbc) ? (8'haa) : (8'hbb))) + (((8'hac) & (8'hb0)) ~^ {(8'hb5), (8'hb3)})) : (!((~(8'ha5)) >> {(8'ha1), (8'ha3)})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire19;
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  assign y = {wire75,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire19,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
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
                 reg26,
                 (1'h0)};
  module5 #() modinst20 (wire19, clk, wire3, wire2, wire4, wire0, wire1);
  assign wire21 = {(8'h9c),
                      $signed((((wire4 || wire19) && $unsigned(wire0)) == wire1))};
  assign wire22 = wire1;
  assign wire23 = (($signed(wire22[(2'h3):(2'h3)]) == (($signed(wire1) | (wire21 >= wire4)) ?
                          (wire3[(3'h6):(3'h6)] != $signed(wire19)) : (7'h42))) ?
                      (|$unsigned((((8'ha5) ?
                          wire22 : wire2) || (^wire4)))) : $signed(wire3));
  assign wire24 = $signed($unsigned($signed(($signed(wire1) <<< $unsigned(wire4)))));
  assign wire25 = $unsigned(wire1[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      if (((wire3 ? (|$signed($unsigned(wire0))) : wire19) ?
          wire1[(3'h5):(2'h3)] : wire23[(3'h7):(3'h7)]))
        begin
          reg26 <= $signed($signed((&wire23[(1'h0):(1'h0)])));
          reg27 <= $unsigned(wire24);
          reg28 <= (!(^~(wire21 ?
              {$signed(wire1)} : $signed(((8'hb4) > wire3)))));
          reg29 <= {(+$unsigned($signed($unsigned(reg27)))),
              {((!(wire1 ? reg28 : wire21)) != ($signed(wire4) ?
                      (wire21 ? wire19 : (8'hae)) : wire25)),
                  ((!$signed((8'hbd))) != $unsigned($unsigned(reg27)))}};
        end
      else
        begin
          reg26 <= reg27[(2'h2):(2'h2)];
          reg27 <= {(((8'hac) * (8'ha3)) == (reg29 || ({reg26,
                  wire22} << $signed(reg29))))};
        end
      if (wire0[(3'h6):(2'h2)])
        begin
          reg30 <= (($unsigned({wire23,
                  (~^(8'ha0))}) >>> $unsigned((+(reg29 && wire19)))) ?
              ((~|wire3) ?
                  wire22[(3'h6):(1'h0)] : (({reg27,
                      wire4} >>> wire3[(1'h1):(1'h1)]) > reg26[(4'hd):(3'h7)])) : wire0[(2'h3):(1'h0)]);
        end
      else
        begin
          reg30 <= $signed(reg29);
        end
      reg31 <= reg30;
      if (wire22[(4'h9):(3'h5)])
        begin
          reg32 <= wire2;
          if ($signed(((!$unsigned(wire23)) ?
              ($signed(reg30[(3'h4):(1'h1)]) >> (^(wire22 ?
                  (7'h40) : wire19))) : (8'hb8))))
            begin
              reg33 <= $unsigned($signed((8'hb0)));
            end
          else
            begin
              reg33 <= $signed((^wire19));
            end
          reg34 <= (wire19 * ({{(reg29 ? reg27 : (8'hb3)),
                  $unsigned(wire23)}} << (((^~wire3) ?
              wire23[(3'h5):(1'h0)] : ((8'hbd) - wire4)) > wire3)));
          reg35 <= ($signed(wire2) ?
              $signed(reg26[(3'h7):(1'h1)]) : $signed($signed($signed({reg33,
                  wire21}))));
        end
      else
        begin
          reg32 <= ($unsigned($unsigned($unsigned(((7'h41) >= (8'hb3))))) ?
              wire21 : wire19[(4'hd):(4'h8)]);
          reg33 <= wire2;
        end
      if ($unsigned(($signed($signed(((8'hb1) ? (8'hb3) : wire3))) ?
          ((&((8'ha4) ? wire0 : wire22)) ?
              (~|(~|wire0)) : ((8'ha9) << $signed(wire23))) : $unsigned(wire25))))
        begin
          reg36 <= $unsigned(((+$signed((wire25 & wire19))) ?
              wire0[(3'h6):(2'h2)] : reg33[(5'h13):(2'h2)]));
          reg37 <= reg30;
        end
      else
        begin
          reg36 <= $unsigned({((!(wire19 >> reg34)) >= (reg30 ?
                  {wire2, wire1} : reg35[(4'ha):(2'h2)])),
              (wire22 - (reg28 || $signed(reg31)))});
          reg37 <= (~|((reg33[(5'h11):(4'he)] ?
                  {$signed(wire1)} : wire3[(1'h1):(1'h1)]) ?
              (((^~reg29) < wire24) ?
                  reg28[(1'h1):(1'h0)] : ((reg36 || reg32) + ((8'hb0) <= (7'h44)))) : $unsigned(reg33)));
          reg38 <= (|wire3[(4'h9):(1'h1)]);
          reg39 <= (~&$unsigned(($signed((reg33 >= (7'h44))) || ($signed(reg33) ?
              $unsigned(reg30) : $unsigned(reg30)))));
        end
    end
  assign wire40 = (!(((wire22 ? wire25 : $signed(reg35)) >> ((reg29 ?
                      reg37 : reg33) > (wire25 - (8'hbd)))) <= reg36[(3'h7):(3'h7)]));
  assign wire41 = $signed(wire0);
  assign wire42 = {(~^$unsigned(($signed(reg26) * reg39[(4'ha):(3'h6)]))),
                      ((^$unsigned((&(8'hb3)))) ?
                          reg36 : ((^~(~^(8'ha6))) ?
                              (|(wire0 & reg35)) : reg33[(2'h3):(1'h0)]))};
  assign wire43 = (8'hae);
  assign wire44 = {wire23[(3'h6):(1'h0)], $unsigned(wire21[(3'h4):(3'h4)])};
  assign wire45 = $unsigned(reg31);
  always
    @(posedge clk) begin
      reg46 <= ((wire24[(2'h3):(2'h2)] ?
          {((wire4 ? reg39 : (8'ha3)) ?
                  (wire45 ? reg37 : (8'h9d)) : (reg32 >> wire21)),
              ({wire1, reg27} >>> reg34)} : reg30[(2'h2):(1'h0)]) <<< wire19);
      reg47 <= wire45[(3'h5):(3'h4)];
      if ({(|wire41[(2'h3):(1'h1)]), (~(^~reg35[(3'h6):(2'h3)]))})
        begin
          if (wire44[(3'h6):(1'h0)])
            begin
              reg48 <= wire21[(3'h4):(1'h0)];
              reg49 <= wire4[(4'ha):(3'h4)];
              reg50 <= reg32[(4'hb):(3'h4)];
            end
          else
            begin
              reg48 <= $signed((reg38[(1'h0):(1'h0)] ?
                  $signed(reg28) : (reg28 ~^ ((~|(8'ha3)) << (wire25 ?
                      reg38 : wire40)))));
            end
          reg51 <= $unsigned((($unsigned((^~wire4)) <= ((~&(8'hb9)) >>> {wire19})) ^ $unsigned((|wire21[(1'h0):(1'h0)]))));
          reg52 <= ($signed((((reg46 >= reg36) || $unsigned(wire44)) > wire42)) >= ((({wire41,
                      reg31} < wire21) ?
                  reg51 : reg49) ?
              (~|(reg36[(3'h7):(1'h1)] & wire43)) : $signed(reg26)));
          reg53 <= (!reg31);
          reg54 <= ($signed($unsigned(wire1[(3'h5):(2'h3)])) ?
              ($unsigned(reg53[(1'h0):(1'h0)]) ~^ wire24[(2'h3):(1'h0)]) : $unsigned(wire25));
        end
      else
        begin
          if ((reg38 || $unsigned({(wire24[(2'h3):(1'h0)] ?
                  $unsigned(reg51) : (~|wire41)),
              wire23})))
            begin
              reg48 <= $unsigned((~&(reg35[(3'h4):(3'h4)] ?
                  $unsigned((reg48 ? wire45 : wire3)) : (&(reg51 + reg50)))));
              reg49 <= {(wire1 << {(8'h9f), wire43[(3'h7):(3'h7)]}),
                  reg34[(3'h6):(1'h1)]};
              reg50 <= (({(&wire23[(3'h7):(3'h5)])} == {$signed(reg26)}) ?
                  (~|$signed(({reg37} ?
                      (!reg39) : ((8'hae) ? reg34 : reg35)))) : (-((!(reg52 ?
                          wire1 : reg38)) ?
                      ((reg31 ?
                          reg52 : (8'ha4)) >= $signed(reg51)) : (wire24 >= $unsigned(reg36)))));
            end
          else
            begin
              reg48 <= $unsigned(reg49);
              reg49 <= reg37;
              reg50 <= $unsigned({((~&wire45[(4'h8):(3'h7)]) == wire23),
                  (((!reg35) | (8'hbe)) ?
                      (((8'hb6) ? reg37 : (8'hb4)) ?
                          (8'haa) : (^~wire3)) : ($unsigned(wire25) ?
                          (wire4 ? reg49 : wire42) : $signed(wire2)))});
              reg51 <= reg36[(1'h1):(1'h0)];
              reg52 <= ((-$unsigned($signed($unsigned(reg34)))) ?
                  $unsigned($unsigned($signed(wire19[(3'h6):(3'h5)]))) : {$unsigned(wire2[(5'h13):(3'h4)]),
                      ((~&(!wire23)) && wire41)});
            end
          reg53 <= ((~&(reg29[(4'h9):(2'h2)] ?
              (-(wire42 ?
                  (8'hb3) : (8'hb1))) : reg30[(3'h4):(1'h1)])) >= $unsigned((^~wire44)));
          reg54 <= $unsigned(reg36);
          reg55 <= $signed(((^~(-(~^wire22))) ?
              (+((reg39 <<< reg51) ?
                  wire0[(3'h7):(2'h3)] : (wire43 & reg27))) : (~|$unsigned(reg33[(3'h7):(1'h1)]))));
          if ($signed($unsigned(((!reg46) ?
              ((~|reg53) ? $unsigned(reg38) : wire3) : wire45))))
            begin
              reg56 <= wire19;
              reg57 <= $signed(reg37[(4'he):(4'he)]);
              reg58 <= $signed((-({(+reg52)} != reg50)));
            end
          else
            begin
              reg56 <= (^~wire40);
              reg57 <= $signed($signed(($signed((wire25 ?
                  wire4 : reg55)) >> (8'hb3))));
              reg58 <= reg50[(1'h0):(1'h0)];
              reg59 <= (|($signed($signed((reg51 ? reg37 : (8'hbd)))) ?
                  {(reg36 ?
                          (-wire44) : (reg29 ?
                              reg48 : reg46))} : (^$unsigned((reg58 ^~ reg46)))));
              reg60 <= ((((wire22[(2'h2):(1'h1)] ? $signed(reg33) : wire41) ?
                      ({(8'ha4), reg36} ?
                          wire22 : reg48[(2'h2):(1'h1)]) : $signed((wire25 ?
                          (8'hb2) : wire3))) * (reg33[(5'h13):(5'h12)] ?
                      (|reg51[(2'h3):(2'h2)]) : reg48[(1'h1):(1'h0)])) ?
                  $unsigned(reg38[(2'h2):(1'h1)]) : wire3[(3'h5):(3'h4)]);
            end
        end
      reg61 <= ((~&(8'had)) ?
          $unsigned((+reg57[(1'h0):(1'h0)])) : {(^~reg32),
              wire1[(1'h0):(1'h0)]});
    end
  assign wire62 = ({wire1, reg36} >= $signed(wire1[(5'h11):(1'h0)]));
  assign wire63 = {((+($unsigned(wire22) <= reg48)) <<< (8'hac))};
  assign wire64 = reg60;
  assign wire65 = (~^$unsigned((~&(^~reg49))));
  assign wire66 = $unsigned({$unsigned(reg39)});
  always
    @(posedge clk) begin
      if ($unsigned(reg32))
        begin
          reg67 <= ($unsigned($unsigned(reg50[(2'h3):(2'h2)])) ?
              {reg30[(3'h4):(2'h2)],
                  $unsigned({wire1[(1'h0):(1'h0)], (&reg58)})} : reg55);
        end
      else
        begin
          reg67 <= $signed((((wire22 ?
                  (8'ha4) : (reg56 == (8'ha5))) > reg32[(5'h10):(5'h10)]) ?
              $signed(((reg33 ~^ reg27) & (!reg53))) : (($unsigned((8'ha7)) ?
                      (reg34 ^ wire42) : (reg53 == reg57)) ?
                  (|reg38) : (!{reg55, reg37}))));
          reg68 <= (!($signed(($unsigned(reg54) >> wire64)) ?
              {{(reg35 ? wire44 : reg67), $unsigned(wire4)},
                  ((wire45 ^ (8'hba)) ?
                      wire22 : reg31[(1'h1):(1'h1)])} : wire22[(1'h1):(1'h0)]));
          reg69 <= (wire62 ?
              wire4[(3'h7):(2'h3)] : ($unsigned(({wire0} || (reg56 ^~ reg29))) ?
                  (~$unsigned($unsigned(wire21))) : (-{{reg33},
                      $signed((7'h43))})));
          if ($unsigned((reg46[(3'h6):(3'h5)] <<< (-$unsigned(reg35)))))
            begin
              reg70 <= ($unsigned(wire43) ?
                  $unsigned($unsigned(($unsigned(reg49) ?
                      $signed(wire43) : wire21[(1'h0):(1'h0)]))) : wire3[(4'h8):(1'h0)]);
              reg71 <= $unsigned(reg60);
              reg72 <= ($signed($unsigned({(!reg30)})) ?
                  ($unsigned({(reg56 ? reg47 : reg61), wire2}) ?
                      {$unsigned((-reg46))} : (~{(wire62 ?
                              wire24 : wire43)})) : (8'hb5));
              reg73 <= reg69[(1'h0):(1'h0)];
            end
          else
            begin
              reg70 <= $unsigned($unsigned((~$signed(reg71[(4'hf):(3'h7)]))));
              reg71 <= (^wire24[(1'h1):(1'h1)]);
              reg72 <= $unsigned($unsigned((~|$signed(wire22[(2'h3):(1'h1)]))));
              reg73 <= {((({wire43} & ((8'h9c) ? reg72 : reg61)) ?
                          (+reg36) : $signed(reg32)) ?
                      {reg56[(2'h3):(1'h1)],
                          (reg38[(1'h1):(1'h0)] < (~|reg47))} : $signed((wire0 ?
                          (reg58 & reg69) : {reg69}))),
                  ($signed(reg47) ?
                      $signed(reg46[(4'h9):(4'h9)]) : {reg38,
                          ($signed(wire25) ?
                              $unsigned(reg39) : (reg35 ? wire62 : reg50))})};
            end
        end
      reg74 <= $unsigned((|$unsigned(reg38[(1'h1):(1'h0)])));
    end
  assign wire75 = reg47;
endmodule

module module5
#(parameter param17 = ((~((!{(7'h41), (8'ha0)}) ? {(8'h9d)} : ((~|(7'h41)) << {(8'hb9)}))) ? (+((~|((8'hbb) ? (8'hbe) : (8'hbc))) ? (((8'haa) | (8'ha2)) ? ((8'hbf) - (8'h9d)) : (8'h9d)) : (((8'ha8) ? (7'h43) : (8'hbd)) * {(8'h9d), (8'hb5)}))) : (7'h42)), 
parameter param18 = ((({(8'ha0), {param17, (8'hb8)}} ? (((8'had) ? param17 : param17) ^~ param17) : ({param17, param17} ? (param17 ? param17 : param17) : param17)) | (!param17)) ? (param17 ? (((param17 * (8'ha5)) ? (8'hbe) : {param17}) * {(-param17), (8'hbf)}) : (-((~param17) + param17))) : (!({(param17 + param17)} >= {((7'h40) ? param17 : (8'ha1)), {param17}}))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (8'hba);
  assign wire12 = $unsigned(wire7);
  assign wire13 = (~|$unsigned((-wire10)));
  assign wire14 = (-wire8);
  assign wire15 = {wire12};
  assign wire16 = (+$unsigned($signed(wire8[(2'h2):(1'h0)])));
endmodule

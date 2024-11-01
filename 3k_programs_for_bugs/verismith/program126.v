module top
#(parameter param94 = ((((~&{(8'hb3)}) ^ (~&{(8'hb4), (8'ha9)})) ? (&(8'hb7)) : (~&(((8'ha9) * (8'hb0)) ? ((8'haa) - (8'ha1)) : {(8'hb1)}))) - (^(~|{((7'h44) ? (8'haa) : (8'hb7)), ((8'hb6) > (8'ha1))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h33a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire67,
                 wire65,
                 wire50,
                 wire36,
                 wire35,
                 wire34,
                 wire17,
                 wire16,
                 wire15,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (wire1 == (|(wire1 ?
                     $signed(wire2[(3'h5):(1'h1)]) : ($signed((8'ha9)) ?
                         {wire3} : $signed(wire2)))));
  assign wire6 = $signed(wire0);
  assign wire7 = wire3;
  assign wire8 = $signed({$unsigned(wire6[(4'ha):(3'h7)])});
  assign wire9 = wire1;
  assign wire10 = wire1;
  always
    @(posedge clk) begin
      reg11 <= wire5;
      reg12 <= wire6[(2'h2):(1'h1)];
      reg13 <= (wire6[(4'h8):(4'h8)] && wire4);
      reg14 <= (~^$signed(wire9[(3'h7):(3'h6)]));
    end
  assign wire15 = $unsigned({$signed(reg13[(1'h1):(1'h0)])});
  assign wire16 = (($signed(wire1[(2'h3):(2'h2)]) ~^ {(((8'hae) << wire2) ~^ wire3[(1'h0):(1'h0)])}) ?
                      $signed(wire10[(2'h2):(2'h2)]) : (&reg13));
  assign wire17 = $signed($signed((&($signed(reg12) ?
                      $unsigned(wire10) : (wire1 ? wire6 : wire4)))));
  always
    @(posedge clk) begin
      if ((!$unsigned($unsigned(wire9))))
        begin
          reg18 <= (^(~(wire4 ?
              (((7'h44) | wire4) ?
                  reg12[(3'h6):(1'h1)] : (wire9 ? wire7 : (8'hbe))) : wire10)));
          reg19 <= (|wire2);
          reg20 <= wire15;
        end
      else
        begin
          if ($signed((|wire17[(3'h5):(3'h4)])))
            begin
              reg18 <= wire17[(4'he):(3'h4)];
              reg19 <= $unsigned((|{($signed(reg20) + reg20), $signed(wire5)}));
              reg20 <= $signed((|$unsigned(((~&wire2) ?
                  (wire7 ? (8'hb7) : reg19) : (wire17 ? (8'hb1) : wire17)))));
              reg21 <= wire8;
            end
          else
            begin
              reg18 <= $signed(($signed($unsigned(wire5)) ?
                  ($unsigned((reg12 ? reg13 : reg12)) ?
                      ((wire9 >> wire17) ?
                          ((8'ha1) ?
                              reg20 : reg11) : $signed((8'haa))) : (wire3 || $unsigned(reg12))) : $unsigned(((reg12 + reg19) ?
                      {wire1} : wire7[(3'h7):(1'h0)]))));
              reg19 <= {($unsigned((~{(7'h40),
                      wire1})) == $signed($unsigned($signed(wire2))))};
              reg20 <= $signed({wire10,
                  (wire10 ? wire6[(4'ha):(3'h4)] : $unsigned(wire10))});
              reg21 <= ((~&(&(wire10 != (&reg21)))) - ($signed($unsigned($unsigned((8'ha7)))) ?
                  ($unsigned((wire7 * wire4)) ?
                      reg18[(5'h12):(2'h2)] : ((+(8'ha2)) ?
                          (~&wire5) : $unsigned(reg14))) : ((((8'hbb) ?
                              reg19 : (8'ha3)) ?
                          (wire10 ? (8'hab) : (8'hae)) : reg12[(3'h4):(2'h3)]) ?
                      $signed($signed(wire2)) : (reg11[(3'h7):(3'h5)] == $unsigned((8'ha6))))));
              reg22 <= reg18;
            end
          reg23 <= ($signed($signed(reg22[(1'h0):(1'h0)])) ?
              $signed($unsigned(((wire5 | (7'h41)) ?
                  wire16[(4'h8):(3'h5)] : $signed(wire1)))) : $signed(wire15[(1'h0):(1'h0)]));
          reg24 <= (~&(^~wire2));
          reg25 <= ($unsigned(wire10[(1'h1):(1'h1)]) ?
              ((8'ha1) ?
                  $unsigned(reg20) : (reg21[(4'hb):(1'h0)] ?
                      $signed((&wire17)) : wire8)) : $unsigned(reg21));
        end
      reg26 <= (^~$signed(($unsigned($unsigned(reg18)) ?
          wire17[(4'h9):(3'h5)] : reg25[(3'h4):(2'h2)])));
      if ((wire15 != $signed(reg12)))
        begin
          reg27 <= {wire6[(4'h8):(4'h8)]};
          reg28 <= reg12[(2'h3):(1'h0)];
          reg29 <= (8'h9c);
          reg30 <= wire3;
        end
      else
        begin
          reg27 <= (~^{(wire2[(2'h3):(2'h2)] <= ($signed(wire9) <= (reg28 ?
                  (8'hb4) : reg11))),
              wire1[(3'h7):(1'h1)]});
          reg28 <= $unsigned(reg14[(4'h9):(2'h2)]);
          if ($unsigned($signed(({(&reg13),
              $unsigned(wire7)} - (~$unsigned(reg13))))))
            begin
              reg29 <= reg29[(3'h4):(2'h2)];
              reg30 <= {$unsigned(reg13)};
              reg31 <= wire0;
              reg32 <= reg28;
              reg33 <= $unsigned($signed(((~&reg31) != ($signed(reg24) || wire5[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg29 <= ($unsigned((($unsigned(reg13) ?
                          wire17[(2'h3):(1'h1)] : (wire15 + wire4)) ?
                      ((reg23 ? wire8 : wire6) ?
                          wire3 : reg19) : $signed(wire17))) ?
                  wire4 : reg12[(3'h4):(1'h0)]);
            end
        end
    end
  assign wire34 = {(~{(+{(7'h41)}), (wire8[(4'hc):(3'h6)] ? {wire0} : wire15)}),
                      (reg27 ? $unsigned(reg29[(3'h6):(2'h2)]) : (~^reg22))};
  assign wire35 = reg26;
  assign wire36 = (reg13[(3'h5):(2'h2)] ?
                      ($unsigned((wire3 ?
                          $unsigned((8'ha5)) : $signed(reg27))) >> {(-((8'haf) ?
                              wire8 : (8'hbb)))}) : $unsigned(($unsigned(reg14) >>> $unsigned((!reg23)))));
  always
    @(posedge clk) begin
      if ({(8'haf), reg20})
        begin
          reg37 <= $unsigned(wire1);
          if (wire6)
            begin
              reg38 <= $signed(wire7[(4'ha):(2'h3)]);
              reg39 <= {{((reg12[(1'h1):(1'h1)] ?
                              $signed(wire36) : reg14[(4'he):(2'h2)]) ?
                          ((reg31 ?
                              wire1 : (8'ha7)) | (8'ha4)) : ((wire34 ~^ reg24) ?
                              (reg26 & (8'ha6)) : reg26[(3'h7):(2'h3)])),
                      $unsigned((|(reg29 < wire2)))}};
              reg40 <= wire0;
              reg41 <= $signed(reg38);
              reg42 <= $unsigned(($unsigned($signed($signed(reg19))) < (((wire5 ?
                  reg20 : reg39) != $signed((8'ha6))) || reg38[(3'h7):(3'h4)])));
            end
          else
            begin
              reg38 <= reg14;
              reg39 <= (wire34[(1'h0):(1'h0)] ^~ $signed($unsigned(((reg39 != reg20) ?
                  $signed(reg13) : (reg19 * reg22)))));
              reg40 <= ($unsigned({wire34[(1'h1):(1'h0)]}) > reg18);
              reg41 <= reg21;
              reg42 <= (|(!reg21));
            end
          reg43 <= $unsigned(reg14[(3'h6):(2'h3)]);
          if (((~^wire16) ~^ (wire1[(2'h2):(2'h2)] < (-(!(reg38 - wire36))))))
            begin
              reg44 <= (((&$signed(reg12[(4'h9):(2'h3)])) ?
                      $signed(((^~wire1) ?
                          (wire15 != reg28) : (reg18 ?
                              reg12 : reg27))) : (reg29 ?
                          $unsigned(reg41) : reg21)) ?
                  (wire1 >= ($signed((8'hb7)) ?
                      ((8'h9d) ?
                          ((7'h43) ?
                              (8'h9d) : reg42) : (reg32 >>> wire5)) : $unsigned({(7'h44)}))) : wire9[(3'h7):(1'h0)]);
              reg45 <= ((+$signed((wire36 || $unsigned(wire10)))) ?
                  $signed(reg26[(1'h0):(1'h0)]) : reg32);
              reg46 <= $signed((~reg32));
              reg47 <= reg18;
              reg48 <= (|$signed(reg11[(4'h9):(4'h9)]));
            end
          else
            begin
              reg44 <= {(-$signed((|wire1))),
                  {reg33[(1'h0):(1'h0)], ($unsigned({reg12}) && {(-wire35)})}};
            end
          reg49 <= (&(&reg20));
        end
      else
        begin
          if ((~&(reg21[(2'h3):(2'h3)] ?
              {((!reg37) != $unsigned(wire36)),
                  (8'hb2)} : $signed($unsigned(((8'hbb) ? wire10 : wire1))))))
            begin
              reg37 <= reg31[(4'hb):(1'h0)];
              reg38 <= ((wire36 > $unsigned((&(&(7'h44))))) ^ reg48);
              reg39 <= (-{reg13[(3'h4):(2'h2)],
                  (wire34[(4'ha):(3'h4)] << wire4)});
            end
          else
            begin
              reg37 <= $unsigned(wire35);
            end
          if ($unsigned((wire0[(2'h3):(1'h0)] < ($unsigned($signed(wire1)) + (~&$unsigned(wire34))))))
            begin
              reg40 <= reg47;
              reg41 <= ((({(8'hac), (wire4 && wire17)} ?
                  $signed((reg14 <<< reg20)) : reg40[(2'h2):(1'h0)]) || wire4[(3'h4):(1'h1)]) <<< reg27);
              reg42 <= $signed(reg43[(3'h4):(3'h4)]);
              reg43 <= reg46[(3'h6):(3'h5)];
              reg44 <= reg13[(3'h4):(1'h0)];
            end
          else
            begin
              reg40 <= (!((reg40[(1'h1):(1'h1)] ?
                      ({(8'ha9), reg19} | (reg40 ?
                          (8'hbc) : (8'hb6))) : (reg14[(1'h0):(1'h0)] >>> {reg33})) ?
                  {$signed($unsigned(wire0)),
                      reg42} : $signed(((reg29 >> wire2) & (wire3 ~^ wire10)))));
              reg41 <= reg27[(3'h4):(2'h3)];
              reg42 <= (!(~|wire9[(3'h7):(1'h1)]));
            end
        end
    end
  assign wire50 = $signed({{$unsigned($unsigned((8'hab)))}, (8'hbd)});
  module51 #() modinst66 (wire65, clk, reg22, reg12, reg43, reg24);
  assign wire67 = (~|$signed(({reg30[(2'h2):(2'h2)]} ?
                      wire5 : (wire50[(4'he):(4'ha)] << reg23[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg68 <= $unsigned((reg43[(4'ha):(2'h3)] ?
          $unsigned($unsigned((-reg38))) : ($unsigned($signed(wire65)) ~^ {reg41})));
      reg69 <= ($signed(($signed($unsigned(wire6)) && $signed(wire0[(2'h3):(1'h1)]))) ?
          (+$unsigned($unsigned($signed(reg47)))) : $unsigned(($unsigned((|wire8)) ?
              wire2 : ((&(8'hae)) && (7'h44)))));
      reg70 <= $unsigned(((wire17[(3'h5):(1'h1)] ?
              $signed(reg38[(2'h2):(1'h0)]) : $signed($unsigned(reg30))) ?
          (~&((wire50 != wire9) ?
              reg18[(5'h11):(4'ha)] : (reg29 ?
                  reg22 : wire50))) : $signed(reg31)));
      if ($signed(reg30[(3'h5):(2'h2)]))
        begin
          reg71 <= reg31;
          if ($signed(($unsigned(wire16) <<< reg38[(3'h4):(1'h1)])))
            begin
              reg72 <= {$unsigned($signed($signed($signed(wire17))))};
              reg73 <= reg24[(4'h8):(1'h1)];
              reg74 <= $signed((($unsigned(wire16) ?
                      $unsigned({reg39}) : reg18[(2'h2):(1'h1)]) ?
                  $signed($unsigned((reg39 == reg41))) : wire10));
              reg75 <= ({({$unsigned(reg24)} >= reg29[(5'h11):(4'ha)]),
                      ($signed($unsigned(reg44)) | reg42[(4'ha):(3'h7)])} ?
                  (7'h41) : $unsigned($unsigned((~&reg22[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg72 <= (((reg46 ?
                      reg28 : ($unsigned(wire17) * (reg20 ? (8'hae) : wire5))) ?
                  ((~|reg74[(1'h0):(1'h0)]) >> ({reg75} != (!(7'h43)))) : reg31) >= {wire16[(4'ha):(1'h1)],
                  $unsigned($unsigned((&(8'ha3))))});
            end
          reg76 <= $signed(((~&(~|{reg44})) ^ $unsigned($signed(reg44))));
          reg77 <= reg13[(3'h4):(1'h1)];
        end
      else
        begin
          if ((^~reg68[(3'h4):(1'h0)]))
            begin
              reg71 <= $signed(reg71[(4'hb):(4'hb)]);
              reg72 <= $signed($signed(reg37[(3'h7):(1'h1)]));
              reg73 <= wire1[(4'hd):(3'h4)];
            end
          else
            begin
              reg71 <= {({($unsigned(wire16) << $unsigned(reg29))} * (+(^(wire5 * reg21))))};
              reg72 <= {$unsigned((~|{(~reg33)})), reg77[(2'h3):(1'h1)]};
            end
        end
      if ({$unsigned($unsigned(wire15[(3'h4):(2'h2)]))})
        begin
          if ($unsigned($unsigned((wire15[(1'h0):(1'h0)] ?
              reg77[(3'h5):(2'h2)] : wire10[(2'h2):(1'h1)]))))
            begin
              reg78 <= ($unsigned(wire1) ?
                  {(~^$signed($signed(wire1))),
                      wire65[(1'h0):(1'h0)]} : ($unsigned(((reg39 & wire6) ?
                      reg30[(4'h9):(3'h7)] : (reg20 ?
                          reg69 : reg76))) << wire9[(3'h5):(3'h4)]));
              reg79 <= wire67;
              reg80 <= {((wire2 >= $unsigned(((8'hbc) ? reg79 : reg39))) ?
                      (~{(reg11 < wire3)}) : wire3)};
            end
          else
            begin
              reg78 <= $unsigned(reg38);
              reg79 <= (8'ha9);
              reg80 <= $signed(((($signed(reg27) ?
                      (reg32 ? reg19 : reg47) : $unsigned(reg68)) ?
                  $signed(reg11) : $unsigned(reg46[(2'h2):(1'h0)])) > wire50[(2'h3):(2'h2)]));
              reg81 <= (!($unsigned(wire8) > {wire7}));
              reg82 <= reg76[(4'hb):(1'h1)];
            end
          reg83 <= $unsigned((~|$signed((^~wire9))));
          if (($unsigned($unsigned($signed($unsigned(reg81)))) + (reg48[(4'hd):(3'h5)] ^ (~{$unsigned(reg42)}))))
            begin
              reg84 <= (!(~|(^reg49)));
              reg85 <= (~^$signed((wire15[(2'h3):(2'h2)] < reg12)));
              reg86 <= ($unsigned($unsigned($unsigned((wire0 << wire0)))) ~^ (($unsigned((reg79 ?
                      reg28 : reg45)) <<< reg44) ?
                  $signed({reg46[(4'ha):(2'h2)],
                      wire7}) : wire15[(3'h4):(1'h1)]));
              reg87 <= wire8[(4'hc):(2'h3)];
            end
          else
            begin
              reg84 <= reg38;
              reg85 <= (^reg23[(1'h1):(1'h0)]);
              reg86 <= (~^(reg87[(3'h4):(1'h0)] ?
                  reg87 : reg33[(2'h2):(2'h2)]));
              reg87 <= $signed((^~(reg30[(1'h0):(1'h0)] ?
                  reg11[(2'h2):(1'h0)] : ((reg13 | wire36) ?
                      ((8'ha5) && reg73) : reg30))));
              reg88 <= reg24[(4'h8):(3'h4)];
            end
          if ({(reg82 ? (!{reg28[(1'h0):(1'h0)], $unsigned(wire9)}) : reg14),
              reg27})
            begin
              reg89 <= reg84;
              reg90 <= ((wire10[(2'h2):(1'h1)] ?
                  ($unsigned({(8'hb7), reg44}) ?
                      $unsigned(reg41) : $signed({reg25})) : reg88) <= reg79);
            end
          else
            begin
              reg89 <= ($unsigned($unsigned((reg22[(3'h4):(1'h0)] <= reg24))) ?
                  (~&wire3) : {reg72[(4'he):(3'h4)], wire50});
            end
          reg91 <= wire7[(2'h3):(2'h3)];
        end
      else
        begin
          reg78 <= ((reg24[(4'h8):(2'h3)] ?
                  ((reg26[(3'h7):(3'h4)] ? (wire50 > reg33) : $signed(reg45)) ?
                      (~|(reg77 ? wire67 : reg90)) : (!{reg20,
                          reg42})) : (&(^~$signed(reg45)))) ?
              ((!wire50[(3'h6):(1'h0)]) > ({(reg81 ~^ (8'hbc))} && ((~wire0) <<< (~^reg28)))) : $unsigned((8'hb0)));
          if ((!$signed(reg85[(2'h3):(2'h3)])))
            begin
              reg79 <= reg81[(4'he):(4'h9)];
              reg80 <= reg78;
              reg81 <= (~^{($unsigned((reg23 ? reg19 : wire6)) ?
                      reg25[(2'h2):(1'h1)] : $unsigned((+reg19)))});
              reg82 <= ($unsigned((({reg76, reg68} ?
                      reg49[(1'h0):(1'h0)] : reg49) << $unsigned((reg76 ?
                      reg31 : reg79)))) ?
                  $unsigned((~reg70[(1'h1):(1'h0)])) : reg33[(2'h2):(2'h2)]);
            end
          else
            begin
              reg79 <= {reg29[(5'h12):(4'hf)],
                  $signed((^~$signed(reg43[(4'h9):(4'h9)])))};
              reg80 <= (+reg13[(1'h0):(1'h0)]);
            end
          if ($unsigned((~&(~^reg81[(4'hf):(3'h7)]))))
            begin
              reg83 <= (reg12 ? (~(reg85[(2'h3):(1'h0)] ^~ reg43)) : reg76);
              reg84 <= ($signed($unsigned($signed($unsigned(reg40)))) == $unsigned(($unsigned($signed(reg47)) < reg49[(1'h1):(1'h0)])));
            end
          else
            begin
              reg83 <= {(|$signed($unsigned(reg46[(3'h7):(3'h4)]))), reg76};
              reg84 <= (wire2 * reg14);
              reg85 <= $unsigned($signed(reg80[(3'h5):(3'h5)]));
              reg86 <= $unsigned((^~reg40[(2'h3):(1'h0)]));
            end
        end
    end
  assign wire92 = ($signed($signed((~$signed(wire50)))) <<< (~&{(8'haa)}));
  assign wire93 = (~^(~(~|{$signed((8'had)), ((8'ha5) ? reg88 : (8'haf))})));
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire55;
  input wire [(5'h12):(1'h0)] wire54;
  input wire signed [(4'hd):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire56 = $signed($unsigned(wire54[(4'hc):(4'h9)]));
  assign wire57 = {wire54,
                      ((~&(wire54[(3'h5):(2'h3)] ?
                          (~&wire56) : (8'h9c))) == $unsigned($signed((wire56 ?
                          wire52 : wire52))))};
  assign wire58 = (^wire56);
  assign wire59 = ($unsigned(((8'hb8) ?
                      {(~^wire57),
                          (8'hae)} : wire55[(1'h1):(1'h0)])) << (&($unsigned(wire54) - wire54[(4'h9):(3'h4)])));
  assign wire60 = ((~&(wire54 >= wire57[(4'hd):(3'h7)])) ?
                      $signed(((&$unsigned(wire53)) ?
                          ((~&wire59) > wire57[(2'h2):(1'h1)]) : wire54[(5'h12):(1'h0)])) : wire59);
  assign wire61 = wire57[(3'h5):(2'h2)];
  assign wire62 = {wire54[(4'hd):(3'h6)]};
  always
    @(posedge clk) begin
      reg63 <= $signed($unsigned($unsigned((8'hb8))));
      reg64 <= {$unsigned((wire55 ?
              (~|$unsigned(wire56)) : wire55[(1'h1):(1'h0)])),
          $signed(($unsigned($unsigned(wire54)) ^~ $signed((^~wire54))))};
    end
endmodule

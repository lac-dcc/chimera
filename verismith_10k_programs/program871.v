module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire112,
                 wire110,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = (wire3 ? $unsigned($signed(wire0)) : wire2[(1'h0):(1'h0)]);
  assign wire5 = wire0;
  assign wire6 = (($unsigned((&(|wire3))) ?
                     (^(wire1[(2'h2):(1'h0)] ~^ wire2[(2'h2):(2'h2)])) : (+$unsigned(((8'haf) ?
                         (8'ha4) : wire0)))) || (wire4 ~^ (wire3[(3'h7):(2'h3)] >= ((~|wire3) >= $signed(wire5)))));
  assign wire7 = wire0[(1'h1):(1'h1)];
  assign wire8 = ({{(~&(wire0 ? wire0 : wire4))}} ?
                     ((-(-(wire3 >> wire2))) ~^ wire3[(3'h7):(3'h6)]) : wire1);
  assign wire9 = {{$unsigned(wire0[(4'hd):(1'h1)]), (&$signed({wire5}))}};
  always
    @(posedge clk) begin
      reg10 <= {($signed(wire9) ?
              ((-$unsigned(wire5)) >= $signed((~^wire7))) : wire4[(4'hf):(4'hb)]),
          wire3};
      reg11 <= ((wire3 != wire3) ? wire5 : $unsigned(wire0));
      reg12 <= wire2[(2'h2):(1'h1)];
      reg13 <= $unsigned(wire3[(1'h1):(1'h0)]);
      reg14 <= (wire8[(4'hb):(4'h9)] + (wire6[(5'h11):(2'h2)] ?
          wire3 : $signed((&(^~reg13)))));
    end
  module15 #() modinst111 (.wire17(reg12), .wire19(wire6), .wire16(reg13), .wire18(wire4), .y(wire110), .clk(clk));
  assign wire112 = reg10[(3'h5):(3'h5)];
endmodule

module module15
#(parameter param108 = (((^(~^((8'h9c) ^~ (8'hae)))) - (8'ha5)) <= ({(~^((7'h40) & (8'haa))), ({(8'hab), (8'hb0)} ? ((7'h43) ? (8'h9d) : (8'ha1)) : ((8'hb3) ? (8'hac) : (8'haf)))} ? {(~&(|(8'hab)))} : (^(((8'hbe) < (8'hbf)) == (8'hbf))))), 
parameter param109 = ((~^((+param108) ? (~&((8'ha2) ? (8'haa) : param108)) : (~|(~|param108)))) - (8'hb5)))
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(2'h2):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire93;
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire49,
                 wire51,
                 wire52,
                 wire93,
                 (1'h0)};
  module20 #() modinst50 (.wire22(wire17), .wire24(wire16), .wire25(wire19), .wire23(wire18), .wire21((8'hae)), .clk(clk), .y(wire49));
  assign wire51 = wire19[(4'he):(3'h6)];
  assign wire52 = (^(~&$signed(($unsigned(wire17) ?
                      (wire49 ? (7'h44) : wire18) : ((8'h9e) ?
                          wire49 : wire49)))));
  module53 #() modinst94 (wire93, clk, wire18, wire17, wire49, wire19, wire51);
  assign wire95 = (~|((wire49[(5'h13):(4'ha)] ?
                      (wire51 != wire18[(4'hd):(2'h3)]) : wire52[(4'ha):(3'h5)]) <= (~^$signed($signed(wire19)))));
  assign wire96 = $signed(wire95);
  assign wire97 = {({$unsigned((wire95 + wire17)),
                          $unsigned(wire16)} * (wire96 | $signed(wire49[(4'h8):(1'h1)]))),
                      {((!{(8'hbd), wire52}) != (wire51 ?
                              $unsigned(wire51) : (wire95 > wire52))),
                          (8'hb4)}};
  assign wire98 = (|wire95[(2'h3):(1'h1)]);
  assign wire99 = wire17;
  assign wire100 = wire19;
  assign wire101 = $signed(wire98);
  assign wire102 = ($unsigned({(~&wire49[(3'h6):(3'h4)])}) && wire93[(2'h2):(1'h1)]);
  assign wire103 = wire51;
  assign wire104 = wire103[(2'h3):(2'h2)];
  assign wire105 = $unsigned((~^$signed($signed(wire16))));
  assign wire106 = (^($signed($signed(wire104)) * ((!$signed(wire17)) ?
                       (!wire49) : $signed(wire95[(5'h12):(3'h5)]))));
  assign wire107 = $signed((+($signed(wire51[(3'h7):(3'h4)]) > ((wire19 && wire104) >= (wire98 ^~ wire99)))));
endmodule

module module53
#(parameter param91 = (~^(~|(-(~^{(8'h9d), (8'had)})))), 
parameter param92 = {((+(param91 ? param91 : (-param91))) >> (((~^param91) ? param91 : (param91 ? param91 : param91)) << param91))})
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  input wire [(2'h3):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  assign y = {wire90,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire59 = $signed($signed((|wire57)));
  assign wire60 = $signed((^~wire59[(5'h12):(3'h5)]));
  assign wire61 = $unsigned((~|wire54));
  assign wire62 = {(wire56[(3'h4):(2'h2)] + (~&$signed({wire54, wire61})))};
  always
    @(posedge clk) begin
      reg63 <= wire61;
      reg64 <= ((wire57[(2'h2):(1'h1)] ?
          wire57[(1'h1):(1'h0)] : wire56) <= (reg63 ?
          $unsigned(((^wire55) ^ $unsigned(wire59))) : wire60[(3'h5):(3'h4)]));
      reg65 <= wire61[(3'h7):(3'h6)];
      reg66 <= wire56;
      reg67 <= (|$unsigned({$unsigned((reg66 ? reg66 : wire59))}));
    end
  assign wire68 = (+$unsigned(($signed(((8'ha0) ~^ (8'hac))) >> $unsigned((wire58 > (8'h9f))))));
  always
    @(posedge clk) begin
      reg69 <= $signed((wire54[(5'h12):(4'hb)] ?
          wire56 : $unsigned($unsigned($signed(wire56)))));
      if ($signed($unsigned(wire68)))
        begin
          reg70 <= $unsigned({wire55[(2'h3):(2'h3)]});
          reg71 <= reg64[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned($unsigned(reg67)))
            begin
              reg70 <= {reg65[(4'hd):(3'h6)]};
            end
          else
            begin
              reg70 <= {{$unsigned({wire54[(1'h1):(1'h0)]})}};
              reg71 <= (&wire54);
              reg72 <= $unsigned(reg64[(2'h2):(1'h1)]);
              reg73 <= wire68[(2'h3):(2'h2)];
            end
          reg74 <= wire54;
          reg75 <= (wire59 & ($signed(reg64[(1'h0):(1'h0)]) ?
              (reg70[(3'h5):(1'h1)] >= reg74) : {reg73, reg71[(2'h3):(2'h2)]}));
        end
      reg76 <= wire57;
      reg77 <= $signed(((8'hbf) & $unsigned((reg67[(1'h0):(1'h0)] ?
          (wire62 ? reg76 : wire55) : ((8'hb6) ? reg70 : reg75)))));
      if ((|{{((~^(7'h43)) ? $signed((8'ha3)) : (wire58 * wire56)),
              (~^$signed(wire68))},
          (wire58 ?
              ((~|wire61) ?
                  (reg72 ?
                      wire54 : reg74) : $signed(wire60)) : (!$signed(wire62)))}))
        begin
          if ($unsigned({$signed($unsigned((~|reg69))),
              (!reg70[(4'he):(2'h2)])}))
            begin
              reg78 <= reg69;
              reg79 <= ($unsigned(({$unsigned((8'hb4)), reg71[(4'h8):(3'h6)]} ?
                      $unsigned((+(8'hb6))) : ($signed(reg72) ?
                          $unsigned(reg67) : wire61))) ?
                  ($signed($unsigned(reg63)) ?
                      {$signed(reg63),
                          reg77[(3'h6):(2'h2)]} : (&{(wire60 - reg64)})) : {reg76,
                      reg75});
              reg80 <= (((reg71[(3'h5):(3'h4)] ?
                  (8'hb4) : ({reg64} ?
                      $signed(reg65) : (&wire59))) > wire58) ~^ reg69[(2'h2):(2'h2)]);
            end
          else
            begin
              reg78 <= reg79[(3'h6):(2'h2)];
              reg79 <= (reg67 ?
                  reg79[(2'h2):(1'h1)] : (~&(((reg80 ? reg67 : wire54) ?
                      $signed(reg72) : $signed(reg80)) != ((~^(8'hb8)) ?
                      $signed(reg75) : (reg77 | reg69)))));
              reg80 <= (8'hb3);
              reg81 <= reg70;
              reg82 <= (-($signed($signed($signed(reg79))) | (^($signed((7'h40)) >= reg81))));
            end
          reg83 <= {$unsigned($unsigned($signed($unsigned(reg64)))),
              ((($signed(wire68) > {reg67}) ?
                      ((wire58 ?
                          reg71 : reg81) && $unsigned(reg81)) : $unsigned(reg75)) ?
                  reg64 : reg63[(3'h5):(1'h0)])};
          reg84 <= (reg73[(5'h12):(4'h8)] > (8'hbc));
        end
      else
        begin
          reg78 <= reg70;
          if (wire62)
            begin
              reg79 <= reg79[(3'h5):(3'h4)];
              reg80 <= ($signed((reg81[(3'h6):(3'h4)] ^ ((reg79 < reg83) > {reg77}))) ?
                  $signed($signed(reg67)) : (reg83[(1'h1):(1'h1)] == (~|(reg67 && reg66))));
            end
          else
            begin
              reg79 <= $signed(wire59);
              reg80 <= {$signed(($signed($signed(wire56)) == (~^(reg79 ?
                      reg72 : reg77))))};
              reg81 <= ($signed(reg81) ?
                  $unsigned((8'ha4)) : $signed($signed((reg78[(5'h10):(4'hb)] ?
                      $signed(reg82) : wire57[(3'h5):(3'h4)]))));
            end
          reg82 <= $unsigned((|wire60[(2'h3):(1'h0)]));
          if (reg77)
            begin
              reg83 <= (!wire60);
              reg84 <= reg70[(1'h0):(1'h0)];
              reg85 <= ({$unsigned((((7'h41) - wire54) && $unsigned((8'hb1)))),
                      $signed($unsigned((reg78 && (8'hb3))))} ?
                  ((((^wire62) ?
                      wire57 : $signed(reg65)) == reg74) >> $signed(wire61[(3'h7):(2'h3)])) : (reg65[(1'h1):(1'h1)] <<< ($unsigned($unsigned(reg67)) && ({reg78,
                      (8'h9f)} < wire60[(4'h8):(3'h7)]))));
              reg86 <= $signed($unsigned(($unsigned($unsigned(wire59)) ?
                  {wire56[(5'h14):(5'h14)], reg83} : (~(reg74 <= reg66)))));
              reg87 <= {$unsigned((^(~(wire58 ^~ (8'ha9)))))};
            end
          else
            begin
              reg83 <= $unsigned((!wire54));
              reg84 <= reg83;
              reg85 <= wire60;
              reg86 <= (+($unsigned((wire68 ?
                  $signed(reg81) : (reg86 ?
                      reg80 : wire56))) != reg81[(4'h8):(2'h3)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg88 <= (~|((((reg71 <= wire68) ?
              $signed(reg86) : (reg71 ? reg72 : wire60)) ?
          $signed((|reg76)) : wire59) - (~&wire56)));
      reg89 <= wire68[(1'h0):(1'h0)];
    end
  assign wire90 = $signed((~&$unsigned((^~wire57[(3'h5):(2'h2)]))));
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'h9):(1'h0)] wire24;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire27;
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire48,
                 wire34,
                 wire33,
                 wire32,
                 wire27,
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
                 reg36,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= ((-$unsigned((^(~^wire21)))) ?
          {(^~wire22[(4'hd):(4'h9)]), {wire25}} : $unsigned((({(8'haf),
                      wire24} ?
                  $unsigned(wire21) : wire22[(4'hb):(2'h2)]) ?
              ((&wire22) && wire23[(2'h3):(2'h3)]) : wire21)));
    end
  assign wire27 = $unsigned({{wire21[(2'h3):(1'h1)]},
                      (~$signed((wire22 ? wire24 : wire24)))});
  always
    @(posedge clk) begin
      reg28 <= $signed(reg26);
    end
  always
    @(posedge clk) begin
      reg29 <= $unsigned($unsigned($signed(reg28)));
      reg30 <= (((reg26 ~^ wire21[(4'hb):(4'h8)]) >>> (&$unsigned({wire21,
          wire24}))) << ((~&(8'ha6)) ?
          (|wire23[(1'h0):(1'h0)]) : {reg28[(2'h2):(1'h0)]}));
      reg31 <= wire22[(1'h0):(1'h0)];
    end
  assign wire32 = wire21[(2'h3):(2'h3)];
  assign wire33 = wire25;
  assign wire34 = (((-$unsigned((reg30 - reg29))) >>> (&(~&{reg29,
                      reg30}))) < ((!((~&reg30) ? wire27 : $unsigned(reg29))) ?
                      ($unsigned((reg28 ? reg29 : reg29)) ?
                          (^wire21) : $unsigned(wire24)) : wire22));
  always
    @(posedge clk) begin
      if ((wire27 + reg30))
        begin
          if (wire25)
            begin
              reg35 <= (&wire22);
              reg36 <= ((wire33 <= wire23) ?
                  ($unsigned($signed(wire23)) ?
                      {(wire23 ?
                              (reg31 != wire32) : (wire33 ?
                                  wire22 : reg29))} : wire32) : (^~reg26));
            end
          else
            begin
              reg35 <= (^((~|wire32) ?
                  $signed(((wire25 >>> wire34) ?
                      (wire34 ?
                          wire21 : reg35) : (^~wire33))) : $unsigned(reg35[(2'h2):(1'h1)])));
              reg36 <= reg30[(4'hc):(4'hc)];
            end
          if ($unsigned($signed(($unsigned(wire24) <= (reg26[(4'h9):(1'h0)] ?
              (-wire24) : wire23)))))
            begin
              reg37 <= (8'ha2);
              reg38 <= ({wire24, $unsigned(reg37)} >>> reg31[(3'h5):(1'h1)]);
              reg39 <= {(~^(8'ha5))};
            end
          else
            begin
              reg37 <= {$unsigned(reg35)};
              reg38 <= (!$signed($signed($unsigned((reg39 ?
                  wire25 : wire22)))));
              reg39 <= wire23;
              reg40 <= reg36;
              reg41 <= (&reg40[(1'h1):(1'h0)]);
            end
          if ($unsigned({($signed(reg29[(3'h5):(2'h3)]) >> ((8'ha5) ?
                  wire21 : (8'hb9)))}))
            begin
              reg42 <= $unsigned(((($signed((7'h44)) >>> wire34) == $signed((wire34 ?
                  wire23 : reg28))) >>> reg39[(4'ha):(3'h5)]));
              reg43 <= ($signed((~|$unsigned($unsigned(wire27)))) <= ((reg39 - (8'haf)) ?
                  $signed(((~|wire32) ?
                      wire33 : ((8'hb0) ? wire24 : (8'ha0)))) : (8'ha0)));
              reg44 <= reg30;
              reg45 <= $signed(((((&wire24) ^ {wire34,
                      wire27}) == ($unsigned(reg29) ?
                      {reg42, reg35} : $unsigned((8'ha3)))) ?
                  (^~$unsigned($unsigned(reg28))) : $unsigned($signed(reg31[(1'h1):(1'h1)]))));
              reg46 <= {$signed((wire27[(2'h3):(1'h1)] | $unsigned((wire25 ?
                      reg30 : reg36))))};
            end
          else
            begin
              reg42 <= ({$signed(reg30[(5'h10):(4'he)])} == $signed((reg31 >= $signed(reg41[(4'ha):(1'h0)]))));
              reg43 <= (~|wire23);
            end
        end
      else
        begin
          reg35 <= wire27;
          reg36 <= $unsigned($unsigned((~$unsigned(((7'h44) > reg45)))));
          reg37 <= $signed((!($unsigned($unsigned(reg30)) ?
              (8'had) : ((wire27 ? reg44 : wire27) < $signed(reg28)))));
        end
      reg47 <= (($unsigned($signed((reg26 && reg38))) ?
              $unsigned(reg30[(4'he):(3'h5)]) : {($unsigned((8'ha8)) ?
                      $signed((8'ha8)) : (wire23 <<< reg37)),
                  (reg37 ? {reg43} : wire22)}) ?
          $signed($unsigned({reg39[(4'hc):(1'h0)]})) : reg46[(1'h1):(1'h0)]);
    end
  assign wire48 = (((~^($unsigned(wire21) + (-reg31))) ?
                      wire24[(2'h2):(1'h1)] : ($unsigned($unsigned(wire33)) ?
                          $unsigned((reg40 != (8'ha0))) : ($unsigned((8'hb1)) ?
                              (wire23 + reg45) : $signed((8'hb7))))) != (wire25[(5'h14):(4'ha)] + {(^(reg45 ?
                          wire33 : wire24))}));
endmodule

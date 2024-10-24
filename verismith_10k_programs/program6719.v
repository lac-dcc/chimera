module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire107;
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire4,
                 wire61,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire107,
                 (1'h0)};
  assign wire4 = ($signed($signed({wire1[(3'h5):(1'h1)],
                     $unsigned((8'hbc))})) * wire2[(3'h6):(3'h6)]);
  module5 #() modinst62 (.wire9(wire2), .clk(clk), .wire8(wire1), .y(wire61), .wire7(wire0), .wire6(wire4));
  assign wire63 = {$unsigned($unsigned($unsigned((wire61 >>> wire4))))};
  assign wire64 = (~{(~(wire63 || (wire1 >> wire2))),
                      (((+wire3) ?
                          wire1 : wire2[(3'h6):(1'h1)]) ~^ ($unsigned(wire3) ?
                          (wire4 ? wire2 : wire4) : (wire3 ? wire3 : wire2)))});
  assign wire65 = $signed(((wire61 == ((wire0 ? wire63 : wire61) >= wire2)) ?
                      (8'hb8) : (~&wire2)));
  assign wire66 = ($unsigned(((wire65[(3'h4):(2'h3)] ~^ $unsigned(wire61)) >> (-$unsigned(wire3)))) ?
                      {$signed(((wire4 <= wire63) - $unsigned(wire2))),
                          (((wire3 >>> (8'hae)) <= wire1[(1'h1):(1'h0)]) > (^~wire0[(5'h13):(4'h9)]))} : $unsigned((|$signed($unsigned(wire0)))));
  assign wire67 = wire63[(1'h1):(1'h0)];
  assign wire68 = wire63[(2'h3):(2'h2)];
  module69 #() modinst108 (.wire71(wire65), .wire74(wire0), .wire73(wire4), .wire72(wire66), .clk(clk), .y(wire107), .wire70(wire67));
  assign wire109 = wire4[(3'h7):(1'h1)];
  assign wire110 = (~|({$unsigned($signed(wire67)),
                           $unsigned((wire61 >> wire61))} ?
                       wire68 : $unsigned((wire1[(5'h11):(4'h8)] ?
                           (&wire1) : $unsigned(wire3)))));
  assign wire111 = $signed((({(~|wire4)} || ((^~wire61) >= (wire63 && wire67))) != $signed(({wire64,
                       wire4} >>> ((7'h41) ? wire66 : wire0)))));
  assign wire112 = ($signed($signed((8'hb9))) ?
                       wire65 : {wire111, $signed($unsigned((&(8'hb4))))});
  assign wire113 = $signed(wire63[(2'h2):(2'h2)]);
  assign wire114 = ($signed((|wire112[(3'h7):(1'h1)])) | ((|$signed(wire2[(2'h3):(2'h2)])) ?
                       wire3[(4'hb):(3'h5)] : wire113[(5'h15):(4'hf)]));
  assign wire115 = (+wire3);
  assign wire116 = $signed($signed($unsigned(wire109)));
  assign wire117 = $unsigned({wire0[(1'h1):(1'h0)]});
  assign wire118 = ({$unsigned($signed(wire61[(3'h7):(1'h1)])),
                       $unsigned($signed($signed(wire68)))} >> $unsigned(wire113));
  assign wire119 = (($signed($signed((~|wire109))) | (8'ha5)) ?
                       $signed(wire4) : $unsigned((8'ha7)));
endmodule

module module69
#(parameter param105 = {(~^(|((&(7'h44)) ? ((7'h41) || (7'h40)) : {(8'ha3), (8'hb7)}))), (~|(((+(8'ha7)) ? ((8'hb9) >>> (8'ha2)) : ((8'ha0) ~^ (8'ha1))) > ((~&(8'h9c)) ? ((8'ha0) >= (8'ha1)) : {(8'ha1), (8'hac)})))}, 
parameter param106 = (param105 ? param105 : param105))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire74;
  input wire signed [(3'h5):(1'h0)] wire73;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire signed [(4'h8):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  assign y = {wire104, wire102, wire77, wire76, wire75, (1'h0)};
  assign wire75 = (8'ha4);
  assign wire76 = ((^~wire72[(3'h5):(2'h2)]) * wire70[(1'h1):(1'h1)]);
  assign wire77 = {(-((8'hb8) ? wire72 : $unsigned({wire73, wire74})))};
  module78 #() modinst103 (.wire80(wire76), .y(wire102), .clk(clk), .wire81(wire74), .wire79(wire70), .wire82(wire75));
  assign wire104 = $unsigned($unsigned(($signed($signed(wire73)) ?
                       $unsigned((wire71 >>> wire76)) : wire77[(2'h2):(2'h2)])));
endmodule

module module5
#(parameter param59 = (((^~({(8'h9d), (8'hbf)} ? ((8'hb1) ^~ (8'ha3)) : ((8'hb2) ? (8'hb7) : (8'ha6)))) ? (&(8'h9d)) : ((((8'hbe) ? (8'ha3) : (7'h41)) ? {(8'ha8), (7'h44)} : (^(8'hb4))) ? (&(~&(8'hb5))) : (8'haa))) && ((((|(7'h41)) ? ((8'hb4) ? (8'hb8) : (7'h42)) : ((7'h43) >>> (8'hb3))) >= ((~|(8'ha3)) ? ((7'h43) ? (8'hb1) : (8'hb3)) : (+(8'hbd)))) ? {{(^~(8'hbc))}, ((8'ha6) ? (~^(8'hba)) : ((8'ha4) ? (8'hb3) : (8'hb4)))} : ({((8'hba) != (8'hb6))} ^~ {(~|(8'hae)), ((8'haa) ? (7'h40) : (8'hbc))}))), 
parameter param60 = ((^~param59) && ((((^~param59) ? ((7'h41) ? param59 : param59) : (8'hbd)) ? (^~(param59 >= param59)) : ((^~param59) ~^ (param59 ? param59 : param59))) && (~{param59, (param59 * param59)}))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire22,
                 wire18,
                 wire17,
                 wire16,
                 reg55,
                 reg54,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg21,
                 reg20,
                 reg19,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= (^~({$unsigned(wire6), $signed($unsigned(wire7))} >= (({(8'ha4),
          wire9} > (wire6 >= wire7)) << wire8)));
      reg11 <= reg10[(2'h2):(2'h2)];
      if ($signed(wire7[(2'h2):(2'h2)]))
        begin
          reg12 <= reg11[(3'h4):(1'h0)];
          if (reg11)
            begin
              reg13 <= reg10[(3'h7):(2'h3)];
              reg14 <= ($signed((^(wire7 ?
                  (~&wire8) : $signed(reg10)))) | ($unsigned((|(wire6 <= reg12))) ^~ (~($signed(wire7) ?
                  reg12[(4'hc):(3'h5)] : $unsigned(wire7)))));
            end
          else
            begin
              reg13 <= reg11[(2'h3):(1'h0)];
            end
          reg15 <= reg10;
        end
      else
        begin
          reg12 <= (8'ha3);
        end
    end
  assign wire16 = $signed(((reg11 ? $signed(reg10) : {(~&wire8)}) ^~ wire8));
  assign wire17 = (+$unsigned(($unsigned((reg14 ^~ wire9)) >= (^~reg10))));
  assign wire18 = reg11[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire17);
      reg20 <= $signed(((~^$unsigned($signed(wire9))) ^~ (reg11[(3'h5):(1'h0)] << wire7)));
      reg21 <= reg11[(2'h3):(1'h0)];
    end
  assign wire22 = (((({reg10} <= $unsigned((8'h9e))) ?
                          reg20[(1'h1):(1'h1)] : (!$signed((8'ha7)))) ?
                      $signed($unsigned((~^reg13))) : ((|(8'ha2)) ?
                          wire16[(3'h4):(2'h2)] : reg13[(3'h7):(3'h7)])) > $signed(({(reg11 >= reg13),
                          $unsigned(wire8)} ?
                      (8'ha7) : $unsigned(reg13[(5'h11):(4'ha)]))));
  always
    @(posedge clk) begin
      reg23 <= wire6;
      reg24 <= ($signed(wire8) ?
          wire18[(2'h3):(1'h1)] : (^~(&(wire7 ^~ (reg23 & reg10)))));
      if ($unsigned(wire7))
        begin
          reg25 <= reg13[(3'h7):(1'h1)];
          reg26 <= reg14[(1'h1):(1'h0)];
        end
      else
        begin
          if ((8'h9c))
            begin
              reg25 <= (&(wire8 >>> ($unsigned($signed(wire8)) || $unsigned({wire7}))));
              reg26 <= wire8[(4'h9):(4'h9)];
              reg27 <= $signed(wire7[(4'he):(4'he)]);
            end
          else
            begin
              reg25 <= ($signed((({reg25, wire8} ? reg25 : reg23) * ((|wire8) ?
                  {reg21} : $unsigned(reg14)))) || (~|$signed(reg11)));
              reg26 <= $unsigned((~|$unsigned(reg25[(4'hb):(2'h2)])));
              reg27 <= (7'h42);
              reg28 <= reg20;
              reg29 <= {$signed(((((8'hbf) != reg13) <= (wire9 ?
                          reg15 : reg24)) ?
                      ((^~reg15) + (reg12 <<< wire8)) : reg27))};
            end
        end
    end
  always
    @(posedge clk) begin
      reg30 <= (-(((reg11[(3'h4):(2'h3)] && $unsigned(reg15)) ?
          reg29 : reg29) ~^ {(reg14[(3'h5):(2'h3)] >= reg10[(2'h2):(1'h0)]),
          {reg28, $unsigned((7'h43))}}));
      reg31 <= (|reg19[(2'h3):(2'h3)]);
      reg32 <= reg11[(2'h2):(2'h2)];
      if ((~^reg20))
        begin
          if ((((reg21[(4'hd):(1'h1)] ?
                  ({(8'hb1), reg28} < (~&reg19)) : {wire22}) == wire16) ?
              reg30[(3'h4):(3'h4)] : reg31))
            begin
              reg33 <= wire22;
              reg34 <= (~|{$signed((^~(reg14 | reg11)))});
              reg35 <= (reg15[(1'h1):(1'h0)] | (8'hbf));
              reg36 <= $unsigned(((|$unsigned($signed(wire22))) >= {wire16[(2'h3):(2'h3)],
                  reg11[(3'h6):(3'h4)]}));
              reg37 <= (({(reg13 ^~ reg29[(3'h4):(2'h3)]),
                      reg25[(2'h2):(2'h2)]} * (reg14 ?
                      (|(reg21 ? wire16 : (8'hb3))) : ($unsigned(reg29) ?
                          (reg32 == reg36) : reg23[(1'h1):(1'h1)]))) ?
                  {(reg19[(2'h3):(1'h0)] != (reg25[(1'h1):(1'h1)] ?
                          (reg24 >>> reg13) : $signed(reg36))),
                      ($signed(((8'hba) ? reg25 : (8'hb6))) ?
                          reg21 : ((reg36 ? reg31 : wire6) ?
                              reg21[(5'h12):(4'h8)] : (~wire17)))} : (reg13[(3'h5):(3'h5)] > (({(8'haa)} > reg28) ^ (7'h44))));
            end
          else
            begin
              reg33 <= (+wire8[(5'h11):(4'h8)]);
            end
        end
      else
        begin
          reg33 <= (!({{wire22[(3'h6):(3'h4)]}} & reg24[(1'h0):(1'h0)]));
          if (((~&reg34[(3'h7):(3'h7)]) ?
              (~^$signed(({reg20} < (+reg35)))) : reg31))
            begin
              reg34 <= wire8[(4'hd):(4'h8)];
              reg35 <= ((8'ha1) ? {{$signed({reg28})}} : $unsigned(reg13));
              reg36 <= (^(~^($unsigned((wire18 ? reg23 : reg25)) ?
                  $unsigned((~(8'hab))) : ($unsigned(reg25) ?
                      (reg32 >>> wire9) : reg13))));
              reg37 <= $signed($signed({reg34}));
              reg38 <= reg37;
            end
          else
            begin
              reg34 <= ($signed(reg37[(2'h3):(1'h1)]) ^ (+$signed(($signed(reg25) + ((8'h9c) != reg12)))));
              reg35 <= {($signed(reg11) ?
                      (|{reg21[(4'h8):(1'h0)]}) : {$unsigned(wire17[(2'h2):(1'h1)]),
                          ($signed(reg35) ? wire6[(2'h2):(2'h2)] : (&reg30))}),
                  {reg38, wire18[(2'h2):(2'h2)]}};
              reg36 <= (({reg23} ?
                  reg10[(2'h2):(2'h2)] : reg21) & (reg15[(2'h2):(2'h2)] >> ($signed(reg29) << $signed(reg31[(4'h8):(1'h1)]))));
            end
          if ((($unsigned((!(reg37 - wire16))) <<< (reg11[(3'h4):(1'h1)] <<< reg15)) <= $signed($signed(reg24))))
            begin
              reg39 <= $signed(reg14[(3'h5):(3'h4)]);
              reg40 <= reg13[(1'h0):(1'h0)];
              reg41 <= {reg33[(2'h2):(1'h1)]};
              reg42 <= (reg15[(2'h3):(1'h1)] >> $signed(reg36[(3'h5):(2'h3)]));
            end
          else
            begin
              reg39 <= ((&$unsigned(((8'ha2) >= (^~(8'hb4))))) ?
                  ($unsigned(((|reg11) << $unsigned(reg31))) >>> (((reg37 ?
                          reg14 : reg28) ?
                      wire9[(1'h0):(1'h0)] : reg15) + ((!reg34) ?
                      wire16[(2'h3):(1'h1)] : (reg32 ?
                          (8'h9f) : wire16)))) : reg19[(2'h3):(1'h1)]);
            end
          reg43 <= {reg28[(5'h13):(1'h1)]};
        end
    end
  assign wire44 = $unsigned((+$signed((~&$unsigned(reg20)))));
  assign wire45 = ($signed($signed(wire16[(1'h1):(1'h0)])) <<< ({$signed({reg10}),
                      (|$signed((8'hbc)))} <<< (|$signed((|reg12)))));
  assign wire46 = $unsigned(wire45[(1'h0):(1'h0)]);
  assign wire47 = reg40[(2'h3):(1'h0)];
  assign wire48 = ((((~|(reg14 ?
                      reg41 : wire9)) == $signed(reg11[(3'h5):(2'h2)])) != (reg33[(2'h2):(1'h0)] ?
                      ($unsigned(reg41) ?
                          (wire47 <= (8'hae)) : (8'haa)) : ((8'hab) ^ $signed(reg15)))) ~^ $unsigned(reg31[(3'h7):(3'h4)]));
  assign wire49 = wire44;
  assign wire50 = (((((8'ha8) ? reg20 : ((8'hb8) ? reg27 : (7'h44))) ?
                              $unsigned($signed((8'ha5))) : ($signed(reg23) ?
                                  $signed(reg30) : $signed(wire18))) ?
                          wire47[(3'h6):(3'h6)] : ((&$signed(wire48)) >= $unsigned($unsigned(reg23)))) ?
                      ((^(((8'haf) ? reg25 : reg35) < {wire47,
                          reg21})) || (~|((~^reg12) ?
                          $unsigned((8'hbb)) : (reg19 ?
                              reg21 : (8'hbf))))) : ((!($unsigned(reg34) ?
                          $signed(reg29) : $unsigned(reg13))) + ($signed(((8'hb9) >> reg33)) << $signed((reg30 ?
                          reg36 : wire44)))));
  assign wire51 = ((|$unsigned(($signed(reg11) >> reg37))) ?
                      (8'hbc) : (~^(($unsigned(wire9) && reg38[(4'he):(3'h7)]) ?
                          ((wire9 > reg36) ?
                              reg20[(3'h5):(2'h3)] : $unsigned(reg43)) : ($unsigned(reg11) || wire48[(2'h3):(1'h0)]))));
  assign wire52 = $signed((+$signed($signed((~reg36)))));
  assign wire53 = reg25;
  always
    @(posedge clk) begin
      reg54 <= (wire48[(5'h11):(3'h7)] > wire9);
      reg55 <= $signed({(&{(reg41 >> reg33)}), reg41});
    end
  assign wire56 = (~&($signed((8'hb7)) >> reg20[(3'h4):(1'h1)]));
  assign wire57 = (wire48 ?
                      $unsigned($unsigned($signed({reg11,
                          reg55}))) : $unsigned((-{reg38,
                          (reg38 ? reg20 : (8'hb2))})));
  assign wire58 = reg28;
endmodule

module module78
#(parameter param101 = ((((((8'ha8) < (8'hac)) ? ((8'ha1) ~^ (8'hb7)) : ((8'hba) ? (8'ha0) : (8'h9c))) >= ({(8'h9e), (8'had)} ~^ {(8'ha8)})) <= {(&((8'hae) >>> (8'hb5)))}) << {(+((-(8'ha7)) ? (8'hb7) : ((8'hbf) | (7'h43))))}))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire82;
  input wire [(4'hc):(1'h0)] wire81;
  input wire [(5'h15):(1'h0)] wire80;
  input wire [(4'ha):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire [(3'h7):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire82[(2'h2):(1'h1)] ?
          $signed((($unsigned(wire81) == $unsigned(wire80)) ^ $unsigned(wire80))) : $signed($signed((^$unsigned((7'h44)))))))
        begin
          if (wire80[(3'h5):(3'h4)])
            begin
              reg83 <= wire82[(3'h7):(2'h2)];
            end
          else
            begin
              reg83 <= ($signed((+{$signed(wire82)})) >>> $unsigned(((^{wire82,
                  wire82}) ~^ (wire81 ? $signed(reg83) : wire80))));
              reg84 <= reg83[(3'h4):(1'h1)];
              reg85 <= $unsigned((&(&reg83)));
              reg86 <= $signed($signed($signed((8'h9e))));
              reg87 <= (^(($signed(wire82[(3'h6):(2'h3)]) ?
                  reg85 : $signed($unsigned(reg85))) ^~ (~wire81[(3'h7):(3'h5)])));
            end
          reg88 <= (&reg86);
          reg89 <= ((|reg87[(1'h0):(1'h0)]) ?
              ((~^reg86[(3'h5):(3'h4)]) < ((reg84 <= wire82) >> ((reg88 || wire82) ?
                  (!reg83) : (wire79 >= (8'hb2))))) : wire82[(4'h9):(2'h3)]);
        end
      else
        begin
          reg83 <= {reg88};
          reg84 <= ((wire80 <<< reg83[(1'h0):(1'h0)]) ?
              {wire79[(2'h2):(1'h1)]} : wire79);
        end
      reg90 <= reg85[(1'h0):(1'h0)];
      if (wire80)
        begin
          reg91 <= ((+reg83[(1'h1):(1'h1)]) ? reg86 : reg83);
        end
      else
        begin
          reg91 <= $unsigned((reg91 ^ $signed({(+wire82),
              reg90[(2'h3):(1'h1)]})));
          reg92 <= ((|(wire81 >>> $unsigned((reg88 && reg84)))) ?
              $unsigned({(+$unsigned(reg83)), reg89[(1'h0):(1'h0)]}) : wire82);
        end
      reg93 <= (+wire81[(4'h9):(3'h5)]);
      reg94 <= wire81;
    end
  assign wire95 = reg93;
  assign wire96 = ($signed(($unsigned($signed(wire79)) ?
                      (~wire81) : ($signed((8'hae)) > (~^reg94)))) && (|reg86[(4'hc):(2'h3)]));
  assign wire97 = ($signed((reg89 ?
                      reg89[(3'h4):(2'h2)] : (((8'hb5) & wire96) ^ (+(8'hb8))))) || {reg93});
  assign wire98 = ($signed(wire80) | (^$signed(((wire97 ? wire97 : reg84) ?
                      ((8'hb8) ? reg84 : reg93) : reg89))));
  assign wire99 = $unsigned($signed((+$signed((~&reg93)))));
  assign wire100 = reg88[(2'h2):(1'h0)];
endmodule

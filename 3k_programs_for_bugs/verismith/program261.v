module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire110;
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  assign y = {wire112,
                 wire59,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire4,
                 wire110,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire4 = (wire0[(2'h2):(2'h2)] * ($unsigned((~$signed(wire1))) | (-wire0)));
  always
    @(posedge clk) begin
      if ((wire2 <<< ($signed(($signed(wire4) ?
          $signed(wire3) : $signed(wire0))) << $signed(($unsigned((8'hb2)) < wire4[(1'h0):(1'h0)])))))
        begin
          if ($unsigned(wire4))
            begin
              reg5 <= $signed((^$signed(wire3[(2'h2):(2'h2)])));
              reg6 <= $unsigned((8'ha8));
              reg7 <= (-$unsigned((~&((reg5 <<< wire3) ^~ wire1))));
              reg8 <= $unsigned(((((wire0 ? wire4 : reg7) ?
                  (8'ha0) : {reg7,
                      wire3}) > (reg7 != $unsigned(wire2))) && ((7'h41) ?
                  (~|(wire3 ^~ wire1)) : wire1[(2'h2):(2'h2)])));
            end
          else
            begin
              reg5 <= reg6[(1'h1):(1'h0)];
            end
          reg9 <= (~&(reg5 >= ($signed($unsigned((7'h43))) ?
              ((wire0 ? wire4 : (8'hae)) ?
                  $unsigned(wire1) : (wire2 ?
                      reg7 : reg6)) : (reg8[(4'h9):(3'h7)] * reg5[(2'h2):(1'h1)]))));
          reg10 <= reg7[(2'h3):(1'h0)];
          if (({$unsigned(reg7[(2'h2):(2'h2)])} ?
              wire0 : (reg10 <= (((-reg6) < $signed(reg8)) >>> $unsigned(reg7[(2'h2):(1'h0)])))))
            begin
              reg11 <= ($signed($unsigned($unsigned(reg9))) > (-((&$unsigned((8'ha7))) < (~|$unsigned(reg10)))));
              reg12 <= $signed((((~&$unsigned(reg8)) ?
                      $signed(reg6) : ((&reg11) >>> ((8'ha2) < reg11))) ?
                  {((+(8'hb0)) ?
                          reg5[(3'h6):(3'h5)] : reg6[(1'h0):(1'h0)])} : (+((wire0 <<< wire3) ?
                      wire1 : reg9))));
              reg13 <= ({(reg12[(2'h3):(1'h0)] & wire1),
                  (((wire2 >>> wire4) <= reg6[(1'h0):(1'h0)]) ~^ (+reg10))} - ((!(-$signed(wire3))) ?
                  reg12 : ((!{reg8}) < (~$unsigned(wire1)))));
              reg14 <= wire1;
            end
          else
            begin
              reg11 <= wire3;
              reg12 <= ((+wire1[(2'h3):(2'h2)]) <<< {$unsigned(wire2[(2'h2):(1'h0)])});
              reg13 <= $unsigned($signed((!reg10[(4'hc):(3'h7)])));
              reg14 <= wire1[(2'h3):(1'h0)];
              reg15 <= $unsigned((|$signed($signed((wire3 ? reg9 : reg6)))));
            end
        end
      else
        begin
          reg5 <= ($signed(wire2[(4'h8):(1'h1)]) ~^ (reg8[(4'hb):(1'h0)] ?
              ($signed((-reg8)) ?
                  ((reg13 ?
                      reg13 : (8'ha3)) | reg15) : $unsigned(((8'hab) >= reg12))) : ((wire2 >> (reg9 ?
                      wire1 : reg15)) ?
                  $signed(reg9[(3'h5):(3'h5)]) : {wire3, (~^reg13)})));
          reg6 <= reg7[(3'h4):(2'h3)];
          reg7 <= (~&$signed({reg7[(3'h4):(1'h0)], (-wire0)}));
        end
      reg16 <= $unsigned((^~(~($unsigned(reg13) == (~|reg7)))));
      reg17 <= $signed($signed(reg8));
      if (reg15[(4'h8):(3'h5)])
        begin
          reg18 <= reg16[(3'h7):(2'h3)];
          reg19 <= reg17;
          if ({reg15, ((~&reg17[(4'hc):(3'h4)]) <<< $unsigned(reg17))})
            begin
              reg20 <= $signed((^(~&$unsigned($unsigned(wire4)))));
            end
          else
            begin
              reg20 <= ($signed(({$signed(wire1)} ?
                  reg19[(4'h9):(3'h7)] : $signed((+(7'h42))))) && reg9);
              reg21 <= (|(8'ha8));
              reg22 <= reg8;
            end
          reg23 <= (&({(!(~&reg7)), (~&$signed(reg18))} ?
              reg8[(4'h8):(3'h5)] : (8'hb5)));
        end
      else
        begin
          if (reg21)
            begin
              reg18 <= (^~(|reg18[(2'h3):(1'h1)]));
              reg19 <= reg13[(4'hd):(1'h0)];
              reg20 <= reg15;
              reg21 <= $unsigned((!(reg12 ?
                  {reg16[(4'hb):(3'h6)],
                      (reg7 ?
                          reg14 : (8'hb6))} : ((~|reg9) <<< $unsigned((8'hb7))))));
              reg22 <= reg22;
            end
          else
            begin
              reg18 <= reg14;
            end
          reg23 <= {($unsigned((~^$unsigned((7'h44)))) ?
                  $unsigned(((8'ha2) ? (&reg20) : {reg19})) : ((~reg17) ?
                      (7'h44) : ({reg21} ?
                          $signed((7'h40)) : $signed((8'hbe)))))};
        end
    end
  assign wire24 = $signed((!(!reg7)));
  assign wire25 = {reg21[(4'h8):(2'h3)],
                      (!((reg6 ~^ reg9[(2'h3):(1'h0)]) ?
                          (+wire2[(1'h0):(1'h0)]) : $unsigned((reg11 ?
                              wire2 : reg19))))};
  assign wire26 = $signed(((~reg6[(1'h1):(1'h1)]) ?
                      reg7 : $signed(((reg5 && wire2) ?
                          (~wire3) : (-(8'hae))))));
  assign wire27 = {(8'h9c),
                      $unsigned(($unsigned(((8'hb4) ? wire24 : reg6)) ?
                          ((reg23 - (8'ha5)) & (wire25 & reg19)) : reg15[(4'hb):(1'h0)]))};
  assign wire28 = {(~reg14),
                      (reg7[(1'h1):(1'h0)] ?
                          $signed((reg23[(2'h2):(1'h1)] >>> reg8[(5'h10):(4'hb)])) : $unsigned($signed((reg11 == reg9))))};
  module29 #() modinst60 (wire59, clk, reg22, reg12, reg9, wire2, reg23);
  always
    @(posedge clk) begin
      reg61 <= {(reg12[(2'h2):(2'h2)] + $unsigned($unsigned((~^reg23)))),
          ($unsigned((~|(reg13 != wire24))) ?
              (($unsigned(wire59) ?
                  (reg19 ?
                      (8'ha4) : reg14) : wire4) || wire2[(4'hc):(3'h5)]) : $unsigned($signed(reg7)))};
      reg62 <= $signed(($signed($unsigned(wire26)) ?
          {reg8[(1'h1):(1'h0)],
              $signed(((8'h9c) & reg17))} : ($unsigned($unsigned(wire26)) != $signed((reg20 - reg15)))));
      reg63 <= (!($signed($unsigned(wire2)) ? reg23[(4'ha):(3'h5)] : wire2));
      reg64 <= reg14;
      if ($signed(($unsigned($unsigned((wire0 ?
          reg7 : reg20))) >= $signed(($signed(reg13) && $unsigned(wire3))))))
        begin
          reg65 <= reg9;
        end
      else
        begin
          if (((!$signed(reg10[(2'h3):(2'h3)])) ?
              reg20 : (~|reg65[(2'h3):(2'h3)])))
            begin
              reg65 <= ($signed((-{(reg61 == wire25),
                  (reg8 ? (8'hb5) : reg10)})) <= (^reg62[(3'h4):(1'h1)]));
            end
          else
            begin
              reg65 <= (~|$unsigned(($signed((|(8'hb3))) >>> $unsigned($unsigned(wire25)))));
            end
          if (wire27[(2'h2):(1'h1)])
            begin
              reg66 <= reg23;
              reg67 <= $unsigned(reg14[(2'h3):(1'h0)]);
            end
          else
            begin
              reg66 <= {(~|((wire1 ?
                      (reg21 * reg12) : reg8) > (~|reg67[(4'hb):(4'h9)]))),
                  reg7};
              reg67 <= (^wire26[(5'h11):(4'hd)]);
              reg68 <= ((reg10 ?
                  (+$unsigned($signed(reg22))) : ((wire28 ?
                      reg17[(2'h2):(2'h2)] : ((8'ha5) ^~ (8'h9c))) && ((-reg66) <<< ((8'ha2) ?
                      reg22 : reg18)))) >> reg65);
            end
        end
    end
  module69 #() modinst111 (wire110, clk, reg23, reg22, wire28, reg16);
  assign wire112 = ($signed($unsigned($unsigned($unsigned(reg21)))) ?
                       reg7[(3'h6):(1'h1)] : (~|(+wire24[(1'h1):(1'h1)])));
endmodule

module module69
#(parameter param108 = (^(({(^~(8'ha3))} ? {((8'ha6) ? (7'h41) : (8'hab))} : (((8'hba) ? (8'hbc) : (8'hb7)) ? (~&(8'hb9)) : ((8'h9f) ? (8'hb4) : (8'haf)))) ? ((((7'h42) ? (8'h9f) : (7'h42)) ? ((8'hab) ? (8'ha9) : (7'h40)) : (^(8'hb1))) <<< (~|{(8'h9f)})) : {(((8'hac) ? (8'h9e) : (7'h41)) || {(8'ha5)}), (((7'h40) ? (8'haa) : (8'haf)) ^ ((8'hac) && (8'hba)))})), 
parameter param109 = (((8'haf) >>> (~param108)) ? ((((param108 ? param108 : (8'hbf)) ? {param108, param108} : ((8'ha3) ? param108 : param108)) ? ((^param108) < (-param108)) : (((8'h9e) || param108) ? (param108 ? param108 : param108) : {param108})) - (^~((param108 ? param108 : param108) > (~&param108)))) : ((~{(param108 < param108), (^~param108)}) ? (param108 ? {(param108 != param108)} : ((param108 ? param108 : param108) <<< {param108, param108})) : (!param108))))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  input wire [(4'hf):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire74;
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire74,
                 reg100,
                 (1'h0)};
  assign wire74 = $unsigned(wire70);
  module75 #() modinst96 (wire95, clk, wire73, wire74, wire71, wire70);
  assign wire97 = wire70;
  assign wire98 = ($signed(($unsigned(((8'hb9) * wire74)) && $signed((wire71 ?
                          wire73 : wire72)))) ?
                      wire70[(4'hd):(4'hc)] : $signed({wire71}));
  assign wire99 = ((wire73[(4'hb):(2'h3)] >> wire73) >= (~&wire73));
  always
    @(posedge clk) begin
      reg100 <= (wire99[(1'h0):(1'h0)] & ($unsigned(wire70[(4'hc):(2'h3)]) ?
          wire95[(4'ha):(3'h6)] : wire97));
    end
  assign wire101 = (8'hac);
  assign wire102 = (($signed(($signed((8'hb5)) ? wire95 : (7'h41))) ?
                           $signed($unsigned(wire97[(4'hd):(3'h6)])) : {(^{wire95,
                                   (8'had)})}) ?
                       $unsigned(wire99[(2'h2):(1'h0)]) : wire71[(3'h4):(2'h2)]);
  assign wire103 = $unsigned($signed((($unsigned(wire70) ?
                       (wire97 * wire98) : $unsigned(wire73)) >>> wire73[(2'h2):(2'h2)])));
  assign wire104 = $signed($unsigned((wire71[(3'h4):(1'h0)] & wire101[(3'h4):(1'h0)])));
  assign wire105 = wire98[(2'h3):(2'h2)];
  assign wire106 = (^wire105[(3'h7):(3'h7)]);
  assign wire107 = wire70[(3'h6):(2'h2)];
endmodule

module module29  (y, clk, wire30, wire31, wire32, wire33, wire34);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire56;
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  assign y = {wire58,
                 wire43,
                 wire56,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((wire34[(4'hc):(4'ha)] == (^~$unsigned((wire32 ?
          wire32 : (8'ha0))))) >> wire31[(4'h8):(3'h7)]))
        begin
          reg35 <= (wire32 ?
              $unsigned($signed(((wire32 ?
                  wire32 : wire33) != (-wire32)))) : $unsigned((((wire33 ?
                          wire31 : wire30) ?
                      $unsigned(wire33) : wire31[(2'h2):(2'h2)]) ?
                  wire32 : (~&$unsigned((8'hbc))))));
        end
      else
        begin
          reg35 <= {wire30[(4'he):(4'hb)]};
          reg36 <= ((wire33 * $signed(wire30[(5'h10):(2'h3)])) ?
              (-reg35) : wire30[(5'h11):(4'h9)]);
          reg37 <= wire33;
          reg38 <= $signed((((wire33 << (wire32 ^ wire34)) < $signed(((8'h9c) ?
              wire30 : wire33))) <<< ($signed({wire32}) ?
              wire30 : ((!(8'hba)) ? $signed(wire33) : reg35))));
          if ({{$unsigned($unsigned({wire33, (8'ha4)})),
                  (&wire31[(2'h3):(1'h1)])},
              reg37[(1'h0):(1'h0)]})
            begin
              reg39 <= {(!(~|{(wire33 | wire30)}))};
            end
          else
            begin
              reg39 <= $unsigned((wire31[(3'h6):(1'h0)] >>> (reg38 >> wire30[(4'h9):(4'h9)])));
              reg40 <= wire34[(4'h9):(3'h5)];
            end
        end
      reg41 <= (wire34 ?
          reg40[(1'h1):(1'h0)] : $unsigned({$signed((wire34 & wire33))}));
      reg42 <= $signed($signed(((^(~reg40)) ? (7'h41) : reg41[(2'h2):(1'h1)])));
    end
  assign wire43 = wire32[(2'h2):(1'h1)];
  module44 #() modinst57 (.wire45(wire43), .wire49(reg35), .wire47(reg36), .y(wire56), .wire46(reg38), .wire48(reg39), .clk(clk));
  assign wire58 = {reg42, reg39};
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire49;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire [(4'h8):(1'h0)] wire47;
  input wire [(4'he):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  assign y = {wire55, wire54, wire53, wire52, wire51, reg50, (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= {$unsigned(wire45[(2'h2):(2'h2)]), $unsigned($unsigned(wire45))};
    end
  assign wire51 = ($signed(($unsigned((~reg50)) ~^ ((reg50 | wire48) * $signed((8'ha5))))) ?
                      $unsigned((8'ha4)) : ((8'haf) ? wire49 : wire45));
  assign wire52 = reg50;
  assign wire53 = (!(((~^(wire51 || wire52)) ?
                      $signed($unsigned(wire47)) : (7'h42)) + $unsigned($signed((wire47 ?
                      wire52 : wire48)))));
  assign wire54 = $unsigned(wire49);
  assign wire55 = $unsigned(($unsigned($signed(wire45[(4'ha):(3'h6)])) > wire52));
endmodule

module module75
#(parameter param94 = (~^((&(((7'h40) - (8'haf)) ? (^(8'hbd)) : (&(8'ha6)))) ? {(^((8'ha5) ? (8'hb1) : (7'h44)))} : (((^~(7'h43)) ^ (~&(8'hb2))) <= (((8'ha7) ? (8'hbe) : (8'hbe)) ? ((8'hb4) << (8'hb3)) : ((8'hac) <= (7'h42)))))))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire79;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire [(3'h5):(1'h0)] wire77;
  input wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire80 = ((-(($unsigned(wire78) ?
                          (wire78 ? wire77 : wire79) : (wire78 << wire78)) ?
                      wire76[(4'ha):(3'h6)] : $signed((~^wire77)))) << (-wire78));
  assign wire81 = ($unsigned($signed({$unsigned(wire79)})) ?
                      $unsigned($signed(wire77[(3'h5):(3'h5)])) : $unsigned(($signed(((8'hae) ?
                          wire78 : wire76)) << wire78[(2'h2):(1'h0)])));
  assign wire82 = {$signed((wire81[(1'h0):(1'h0)] || (wire81 ?
                          ((8'ha4) || wire77) : $signed(wire78)))),
                      {(wire78[(2'h3):(2'h3)] | ({wire79, wire79} ?
                              (|(8'ha8)) : (wire78 ? wire79 : wire81))),
                          wire79[(2'h2):(1'h0)]}};
  assign wire83 = ($signed(wire81[(4'he):(4'h9)]) ? (~wire80) : wire81);
  assign wire84 = $signed((wire81 - $unsigned((&wire83))));
  assign wire85 = (8'hbd);
  always
    @(posedge clk) begin
      reg86 <= $signed($unsigned((wire77 ?
          wire76[(3'h4):(2'h3)] : ((wire80 ? wire80 : wire79) <<< (8'hbe)))));
      reg87 <= (~&(wire81[(2'h2):(2'h2)] ?
          $unsigned({{wire84}}) : $signed((wire77 <= {reg86, (8'hb4)}))));
      if (wire77)
        begin
          reg88 <= {(wire84 ~^ wire77),
              ($signed((wire84 << (wire82 ?
                  wire85 : wire76))) >= ($unsigned((wire84 || wire77)) ?
                  $unsigned({wire85,
                      reg87}) : ((wire79 ~^ wire77) == $signed(wire77))))};
          reg89 <= ($unsigned((-(reg86[(4'hb):(4'h8)] ?
                  wire84[(3'h4):(2'h3)] : $unsigned((8'ha6))))) ?
              ($signed($signed($signed(reg86))) | (8'hae)) : wire81[(1'h0):(1'h0)]);
        end
      else
        begin
          reg88 <= $unsigned(({$signed(wire80[(4'h9):(3'h4)]),
              wire79[(3'h5):(3'h4)]} && (!$unsigned(reg86))));
          reg89 <= (~&(~($signed(wire78) && $signed(reg86))));
          reg90 <= {$unsigned((~|((~&(7'h44)) ?
                  $unsigned(wire78) : $unsigned(wire81)))),
              reg89};
          reg91 <= wire85[(3'h7):(1'h0)];
          reg92 <= reg91[(1'h1):(1'h0)];
        end
      reg93 <= ($signed(wire81) ? {$signed({(-(8'haa)), (8'h9e)})} : wire78);
    end
endmodule

module top
#(parameter param112 = (^~((({(8'hbd)} ? ((8'hab) ? (8'h9e) : (8'ha2)) : {(8'haf), (8'ha7)}) * (((8'ha6) ? (8'hb5) : (8'hb5)) ? {(8'haf), (8'ha0)} : (|(8'hb6)))) || {(-(7'h40)), ({(8'hb8)} <<< ((7'h40) <= (8'ha8)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire110;
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire110,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire4 = {(|$unsigned(wire1))};
  assign wire5 = $unsigned({wire0[(3'h6):(3'h6)],
                     $signed(((wire2 > (8'hb0)) ? $unsigned(wire2) : wire2))});
  assign wire6 = $unsigned(wire2[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg7 <= wire2[(2'h2):(1'h1)];
      if ((|({{$signed(wire2), $unsigned(reg7)}} ?
          (($signed(wire4) ?
              wire2[(4'hb):(4'h9)] : wire0) + wire1[(2'h3):(1'h0)]) : $signed($signed((^~reg7))))))
        begin
          reg8 <= wire0;
          reg9 <= (^$signed($signed((+(wire5 <= wire0)))));
          if ((wire3[(4'he):(4'hc)] ?
              wire2[(5'h10):(1'h1)] : ($unsigned($signed((~&(8'haa)))) ?
                  ((wire3 || reg9[(3'h6):(3'h6)]) ?
                      {(wire1 != reg8),
                          ((8'hb8) ?
                              wire0 : wire0)} : (~(|wire4))) : ($unsigned((reg9 ?
                      reg8 : wire4)) >>> (&{wire2, (7'h44)})))))
            begin
              reg10 <= reg9;
              reg11 <= reg7;
              reg12 <= ($unsigned(reg7[(4'hb):(4'hb)]) ?
                  ((+$signed(reg7)) ?
                      ($unsigned(wire4) != (~&(^reg8))) : {($unsigned(wire1) >>> (&reg9)),
                          (&(wire6 >>> wire3))}) : {(wire1 ~^ {reg7}),
                      $signed(wire4)});
            end
          else
            begin
              reg10 <= wire6;
              reg11 <= (wire0[(1'h1):(1'h0)] ?
                  wire5 : ((((wire2 | wire6) ^~ (|reg8)) ?
                      {(~|reg8), {reg12}} : wire5) < wire3));
            end
          reg13 <= $signed(wire3);
          if (reg9[(1'h1):(1'h1)])
            begin
              reg14 <= $signed((reg13 ?
                  $unsigned(reg12[(4'hf):(3'h5)]) : (($unsigned(wire5) <= $unsigned((7'h44))) ^~ wire5)));
            end
          else
            begin
              reg14 <= (((reg7[(1'h1):(1'h0)] ?
                          wire4[(4'hb):(3'h7)] : $signed(wire1)) ?
                      wire5[(4'he):(4'h9)] : reg14[(1'h0):(1'h0)]) ?
                  wire2 : reg8);
            end
        end
      else
        begin
          reg8 <= (~({(wire5 ?
                  wire2 : (wire2 ^~ wire4))} == {$signed($signed(wire2))}));
          reg9 <= wire4;
        end
      reg15 <= (~^reg13[(4'ha):(3'h6)]);
    end
  assign wire16 = reg9[(4'h8):(1'h1)];
  assign wire17 = ({(8'h9e)} + ($unsigned(reg10[(5'h11):(4'h8)]) || ({(reg14 ?
                          reg8 : wire6),
                      wire6[(1'h0):(1'h0)]} | (8'h9d))));
  assign wire18 = {$signed((((wire3 ? (8'ha5) : wire0) || (reg7 ?
                          wire0 : wire6)) * reg7[(2'h2):(1'h1)])),
                      reg12[(4'he):(3'h5)]};
  assign wire19 = ($signed({((wire3 ~^ reg13) || reg14)}) <<< $signed((^~({(8'ha4)} | wire4[(4'hb):(3'h4)]))));
  module20 #() modinst111 (wire110, clk, wire0, wire19, wire6, reg9);
endmodule

module module20  (y, clk, wire21, wire22, wire23, wire24);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire signed [(4'he):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(5'h10):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire78;
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  assign y = {wire109,
                 wire86,
                 wire85,
                 wire81,
                 wire80,
                 wire34,
                 wire49,
                 wire51,
                 wire78,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
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
                 reg84,
                 reg83,
                 reg82,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^~wire21[(4'ha):(4'h9)]))
        begin
          reg25 <= $signed((8'ha7));
          reg26 <= wire23;
          reg27 <= ({(({wire23} ?
                  {(8'hb8), wire23} : ((8'ha6) ?
                      wire21 : wire23)) ^ reg25)} >= $unsigned(wire22[(1'h1):(1'h1)]));
          if (wire21[(2'h2):(1'h0)])
            begin
              reg28 <= $signed((-reg27));
              reg29 <= (~^($signed({wire24}) ?
                  ($signed({reg28, wire24}) < wire23) : wire21[(2'h2):(1'h1)]));
            end
          else
            begin
              reg28 <= (&$signed((!(reg27 == $unsigned((8'ha5))))));
              reg29 <= reg29[(1'h1):(1'h0)];
              reg30 <= ($signed({wire21[(3'h4):(1'h1)]}) ?
                  reg25[(3'h4):(2'h3)] : (~&(({(8'ha4),
                      reg27} - (~wire21)) >>> (~^{(8'h9f), wire22}))));
              reg31 <= (-(reg29[(3'h4):(3'h4)] ?
                  $signed($signed($unsigned(reg27))) : (($signed((8'hb5)) <<< wire21) ?
                      reg30 : ($unsigned(wire22) ? reg30 : $signed((8'h9f))))));
            end
        end
      else
        begin
          reg25 <= reg26;
          reg26 <= ((7'h40) < reg25);
          reg27 <= $unsigned((reg26 & $signed($unsigned((8'h9f)))));
          if ((!{(8'hba),
              $unsigned(($unsigned(reg26) ?
                  $unsigned(wire23) : $signed(reg31)))}))
            begin
              reg28 <= reg27[(1'h1):(1'h0)];
              reg29 <= (reg29[(2'h2):(1'h0)] ?
                  wire22 : $unsigned(reg30[(3'h7):(3'h7)]));
            end
          else
            begin
              reg28 <= ($signed((~^wire24)) ?
                  $signed($unsigned((8'hb6))) : reg29[(3'h4):(2'h3)]);
              reg29 <= ($signed({(-wire21)}) ?
                  $signed((8'hb7)) : ({$unsigned(((8'hb9) ? reg31 : wire23))} ?
                      $unsigned(reg29[(1'h1):(1'h1)]) : (((^~reg25) >>> $unsigned(reg28)) ?
                          $signed(reg28) : {((7'h41) <<< reg28)})));
              reg30 <= $unsigned(reg31);
              reg31 <= (^~wire21[(3'h6):(2'h3)]);
            end
        end
      reg32 <= {(reg30 >>> (!$unsigned((reg30 < reg29))))};
      reg33 <= wire22;
    end
  assign wire34 = $signed({reg28[(1'h0):(1'h0)]});
  module35 #() modinst50 (wire49, clk, reg25, reg26, reg31, wire34, wire24);
  assign wire51 = reg28[(2'h2):(2'h2)];
  module52 #() modinst79 (wire78, clk, wire51, wire34, wire23, reg29, reg27);
  assign wire80 = (((&$signed((reg25 ^ reg27))) + reg25[(2'h3):(2'h2)]) ^ $signed($signed(wire23[(4'hc):(2'h3)])));
  assign wire81 = ($signed((({wire80, reg25} ^ $signed(wire34)) <= wire23)) ?
                      $unsigned((+$unsigned(reg31))) : $signed(wire23));
  always
    @(posedge clk) begin
      reg82 <= $signed(wire81[(1'h0):(1'h0)]);
      reg83 <= (reg25[(2'h3):(2'h3)] * reg33[(2'h2):(2'h2)]);
      reg84 <= $signed($unsigned((($signed(wire21) ?
          wire49 : (~wire78)) << $signed(wire80))));
    end
  assign wire85 = wire34;
  assign wire86 = (($unsigned(reg29) ?
                      wire23[(5'h10):(3'h6)] : (reg26[(4'h8):(3'h7)] == ($signed(wire85) ?
                          (reg31 ?
                              wire23 : (8'ha3)) : (|wire34)))) == reg83[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg87 <= $signed((-$signed({$unsigned(wire22)})));
      reg88 <= {wire78[(4'h9):(4'h8)]};
      if (reg32)
        begin
          reg89 <= wire85;
          reg90 <= (^wire49[(3'h4):(1'h1)]);
        end
      else
        begin
          reg89 <= $unsigned((wire85 ^~ reg26));
        end
      reg91 <= {(!$unsigned(reg29[(1'h0):(1'h0)]))};
      reg92 <= $signed(wire22);
    end
  always
    @(posedge clk) begin
      if (((&(8'hb2)) != wire34[(4'h9):(1'h0)]))
        begin
          if ((^~($unsigned(((wire51 ^ reg87) ?
              {reg91} : reg33[(2'h3):(1'h0)])) ^ ($unsigned($unsigned(wire34)) * wire49))))
            begin
              reg93 <= $unsigned(reg82[(1'h1):(1'h0)]);
              reg94 <= $signed(reg30);
              reg95 <= $signed((8'hbd));
              reg96 <= (^reg95[(4'hb):(4'ha)]);
            end
          else
            begin
              reg93 <= ((!reg25) ?
                  ($unsigned(reg91[(3'h5):(1'h1)]) ?
                      $signed({wire49}) : reg91) : reg83);
              reg94 <= (wire22[(4'h9):(3'h6)] & (8'hb0));
              reg95 <= wire78[(4'h8):(3'h7)];
              reg96 <= ((((((7'h41) ?
                      reg32 : wire85) ^ $signed(reg25)) >> reg93) ?
                  ((&{reg30}) ?
                      $signed((wire78 & wire49)) : ((~&reg82) ?
                          (+wire34) : (+wire34))) : (&$unsigned((reg88 && (8'hb8))))) <<< $unsigned((-(8'hb3))));
              reg97 <= wire85;
            end
          reg98 <= $unsigned(reg84);
        end
      else
        begin
          reg93 <= $signed($unsigned((|($unsigned(reg29) >> $unsigned(wire81)))));
          if (reg33[(2'h3):(1'h0)])
            begin
              reg94 <= $unsigned((&reg26));
              reg95 <= (($unsigned({$signed(reg26)}) >> reg89) == ({{(wire51 ?
                              wire86 : (8'ha0))},
                      (wire78 != reg25[(3'h7):(2'h2)])} ?
                  $unsigned(reg30[(3'h4):(1'h0)]) : (8'hb8)));
              reg96 <= (reg91 == (~|$signed($signed((reg88 ? reg97 : reg87)))));
              reg97 <= ($signed(reg28[(2'h3):(1'h1)]) && ({$unsigned((~^reg28)),
                  ($unsigned(reg93) << reg84)} || ($signed($unsigned((8'hbe))) == (reg27[(4'ha):(2'h3)] ?
                  reg91[(1'h0):(1'h0)] : (+reg83)))));
            end
          else
            begin
              reg94 <= wire23;
              reg95 <= wire85[(3'h6):(3'h4)];
              reg96 <= (8'had);
              reg97 <= reg93;
            end
          reg98 <= ($signed((reg95[(3'h4):(1'h0)] >= wire51[(5'h12):(3'h6)])) ?
              (~$signed(reg27)) : {({{wire49, wire24},
                      $unsigned(reg94)} & $signed(reg97))});
          reg99 <= reg91[(1'h1):(1'h1)];
        end
      reg100 <= {(($signed(wire49) + reg30[(4'h8):(2'h3)]) ?
              ((reg33 ?
                  {reg89} : $unsigned((8'hb5))) * $signed((reg87 ~^ wire80))) : (^~reg28)),
          $signed(reg94[(1'h1):(1'h0)])};
      if ((^(~$signed({$unsigned((8'haa)), ((8'hac) ? reg100 : reg26)}))))
        begin
          reg101 <= reg90;
          reg102 <= reg31;
          if (reg92[(3'h6):(2'h3)])
            begin
              reg103 <= reg100[(4'h8):(2'h2)];
              reg104 <= $signed(($signed($signed(wire81[(3'h7):(2'h2)])) ?
                  (wire22 ?
                      {(wire86 > (8'hba)),
                          (!reg83)} : reg31) : ($signed($signed((8'ha3))) ?
                      ((reg99 ? wire51 : (8'hb8)) ?
                          wire85[(4'h8):(3'h6)] : (~&reg101)) : ((wire78 | wire24) ~^ $unsigned(reg88)))));
              reg105 <= ((reg31 ~^ (&wire24)) ? reg83[(2'h2):(1'h1)] : (8'hb2));
              reg106 <= reg100;
            end
          else
            begin
              reg103 <= $signed($signed(reg31));
              reg104 <= reg103;
              reg105 <= wire49[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg101 <= (((+($signed((8'hb9)) ?
                  (reg87 <= (8'haf)) : (|reg102))) ~^ ({wire49[(2'h2):(1'h1)],
                      wire86} ?
                  ({wire86, (8'hac)} ?
                      $unsigned(reg91) : $signed(reg103)) : ($unsigned(reg26) < ((7'h40) ?
                      wire51 : reg28)))) ?
              (($signed($unsigned((8'hae))) ?
                      (8'hae) : $unsigned(wire22[(4'hc):(4'hb)])) ?
                  $unsigned(reg31) : $unsigned((reg92 ?
                      (reg89 ?
                          reg33 : wire22) : (reg91 ^~ reg84)))) : ((reg105 >>> reg99) ~^ $unsigned(reg102[(3'h6):(3'h4)])));
          if ({($unsigned(reg98[(3'h4):(2'h3)]) ?
                  (wire81[(3'h4):(2'h2)] && wire81) : reg100[(5'h14):(3'h6)]),
              ((|((-(8'ha3)) <<< (8'hbe))) ?
                  ($unsigned(wire23[(2'h3):(1'h0)]) ?
                      $unsigned(((8'h9c) ? reg33 : reg106)) : ($signed(reg98) ?
                          $signed(reg91) : $signed(wire86))) : $signed(((^~reg94) ?
                      {reg97, wire85} : reg102)))})
            begin
              reg102 <= ((8'hb5) ?
                  ((-$unsigned(reg25[(1'h0):(1'h0)])) ?
                      reg93[(3'h5):(2'h2)] : $signed(((wire51 >>> reg87) ?
                          (reg30 ?
                              reg87 : reg82) : $unsigned(reg32)))) : reg98);
            end
          else
            begin
              reg102 <= (wire81[(3'h5):(2'h2)] > $signed($signed(((reg92 <<< reg29) ?
                  (reg87 ? reg98 : reg106) : ((8'h9d) == reg26)))));
              reg103 <= $signed($signed($unsigned((^reg96))));
              reg104 <= $unsigned($unsigned($unsigned($unsigned((~&(8'hb5))))));
              reg105 <= reg88[(3'h4):(2'h2)];
            end
          reg106 <= $signed(wire23[(4'he):(1'h1)]);
          reg107 <= ((((|(~&reg106)) ?
                  (~&(reg30 ?
                      reg30 : wire86)) : ($unsigned(reg83) * (!reg33))) ?
              (+$unsigned($signed(reg84))) : $unsigned(((wire86 || reg30) ^~ $unsigned(reg87)))) ^~ $signed($signed((^(reg91 ?
              (8'ha5) : reg97)))));
        end
      reg108 <= ($unsigned({((8'hbe) == (reg104 >>> reg102)),
          reg32[(4'he):(3'h6)]}) && (wire80[(4'he):(3'h6)] ?
          (~(+(~^reg103))) : (reg29[(1'h1):(1'h1)] ^~ $unsigned((7'h41)))));
    end
  assign wire109 = (wire21[(1'h0):(1'h0)] >= (~|(8'ha8)));
endmodule

module module52  (y, clk, wire57, wire56, wire55, wire54, wire53);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire57;
  input wire signed [(5'h13):(1'h0)] wire56;
  input wire [(5'h15):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  input wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire58;
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire58,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire58 = ((wire55 ?
                      ($unsigned((wire56 != (7'h41))) & $unsigned($unsigned(wire54))) : ({wire53[(4'hb):(3'h7)],
                          $signed(wire54)} << ((wire57 | wire53) >= $signed(wire57)))) && $signed(wire55[(4'hb):(2'h2)]));
  always
    @(posedge clk) begin
      reg59 <= wire55[(4'hf):(4'he)];
      reg60 <= (^~reg59);
      reg61 <= wire53[(3'h7):(1'h1)];
      reg62 <= (8'hb4);
      reg63 <= (~|reg60);
    end
  assign wire64 = (!((wire54 ~^ {wire56[(4'hc):(3'h5)]}) ?
                      reg62[(3'h5):(2'h2)] : ((wire57[(4'hb):(3'h7)] ?
                          {wire57} : $signed(reg59)) + $signed(wire58))));
  assign wire65 = ($unsigned(wire54[(3'h5):(3'h4)]) ?
                      $unsigned({(|$unsigned(wire55)),
                          wire54[(2'h3):(1'h1)]}) : ($unsigned((-$signed((7'h41)))) || wire64[(3'h4):(3'h4)]));
  assign wire66 = reg62;
  assign wire67 = {$signed($unsigned((&wire56)))};
  assign wire68 = $signed(($unsigned($unsigned((reg62 != (8'hbb)))) == {(wire55 ?
                          (!(8'ha0)) : (reg62 | (8'hba)))}));
  assign wire69 = wire67[(1'h0):(1'h0)];
  assign wire70 = (((-$signed((wire69 >> (8'ha3)))) <<< wire66[(3'h7):(2'h2)]) | {reg62,
                      (((reg59 && wire67) ? wire55 : reg60) ?
                          {$signed(wire64)} : wire68)});
  assign wire71 = reg63;
  assign wire72 = (|((~|(reg61 ^ (wire64 + wire64))) ?
                      ($signed(((8'ha1) ? (7'h41) : wire68)) ?
                          wire71 : wire54) : wire56[(5'h11):(4'hb)]));
  assign wire73 = (~($unsigned({(wire58 ? wire66 : wire66)}) ?
                      wire57[(3'h4):(2'h2)] : ($signed(reg63) ?
                          wire53[(4'h9):(3'h5)] : reg60[(1'h0):(1'h0)])));
  assign wire74 = ($unsigned(($signed((wire65 && wire73)) >> (^(8'haa)))) > $unsigned((wire71 + ((reg61 ?
                          wire67 : wire66) ?
                      (wire54 || (8'hbe)) : wire66))));
  assign wire75 = (~|$unsigned({$signed((wire65 ? wire54 : (8'hbb))),
                      wire74[(4'h9):(3'h5)]}));
  assign wire76 = (|wire64);
  assign wire77 = wire68[(3'h4):(3'h4)];
endmodule

module module35
#(parameter param48 = {(+(~|(!{(8'h9e), (8'hb7)})))})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  assign y = {wire47, wire46, wire43, wire42, wire41, reg45, reg44, (1'h0)};
  assign wire41 = (+{$signed(wire40), $signed($unsigned({(8'haf), wire40}))});
  assign wire42 = (-$unsigned((((~&wire36) << (wire37 == wire37)) ?
                      wire41[(1'h1):(1'h0)] : (wire36 ^ $signed(wire41)))));
  assign wire43 = ((($signed({wire36}) ?
                          (wire36 - (wire42 ?
                              wire40 : wire41)) : $unsigned((8'ha6))) >> $unsigned(wire37)) ?
                      ($signed(({wire37, wire40} ?
                          wire40[(2'h3):(2'h3)] : $signed(wire38))) || (-wire38[(4'h8):(2'h2)])) : ((wire41 >= (wire36 != ((8'hb8) + wire37))) ?
                          $signed($unsigned($signed(wire41))) : (^$signed(((8'had) ?
                              (8'hac) : wire39)))));
  always
    @(posedge clk) begin
      reg44 <= $unsigned(({(+wire39)} ?
          $unsigned((-$signed(wire41))) : wire42));
      reg45 <= reg44;
    end
  assign wire46 = $unsigned($unsigned(($unsigned({reg44, wire40}) ?
                      ((-(8'hae)) <<< wire41) : reg44)));
  assign wire47 = $unsigned($unsigned($signed(wire40[(3'h6):(1'h0)])));
endmodule

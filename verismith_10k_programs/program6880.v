module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire82;
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire82,
                 (1'h0)};
  assign wire4 = ($signed(((~^{(8'ha6)}) + ($signed(wire1) ^ (8'hae)))) ?
                     $signed($signed(wire3[(4'he):(4'h9)])) : $unsigned({($signed(wire2) - wire2[(3'h4):(1'h1)])}));
  assign wire5 = (((~^$signed($unsigned(wire3))) ?
                     $signed(((|wire4) + (wire0 >>> wire1))) : $signed($unsigned((^wire1)))) || wire4[(1'h1):(1'h1)]);
  assign wire6 = (^($unsigned((^(wire1 ? (8'hac) : wire5))) ?
                     ($signed(wire2[(4'hb):(4'h8)]) ?
                         $signed($unsigned(wire4)) : $signed(wire2[(3'h6):(3'h6)])) : (~&wire1)));
  assign wire7 = wire0;
  assign wire8 = wire2;
  assign wire9 = wire7[(3'h7):(1'h1)];
  assign wire10 = $signed((wire1[(3'h4):(3'h4)] ?
                      $signed({$signed(wire4),
                          {wire5, wire4}}) : $unsigned(($signed(wire8) ?
                          $unsigned(wire3) : ((8'hb3) * wire3)))));
  assign wire11 = (wire6 ^~ (($unsigned((wire4 ? wire9 : wire7)) ?
                          wire3[(3'h6):(2'h2)] : wire0[(4'h9):(4'h9)]) ?
                      (-(~&(&wire4))) : $unsigned($signed(wire2))));
  assign wire12 = ((-((wire4[(5'h14):(2'h2)] < wire11[(4'ha):(4'h9)]) ?
                          $unsigned(wire8) : wire8[(2'h2):(2'h2)])) ?
                      $signed((~|wire9[(4'ha):(1'h0)])) : $signed($unsigned((!(wire4 + wire4)))));
  assign wire13 = wire12;
  assign wire14 = {({$signed($unsigned((8'ha3)))} == $signed(wire1[(4'hc):(4'hb)]))};
  module15 #() modinst83 (wire82, clk, wire13, wire6, wire11, wire1, wire2);
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  assign y = {wire81, wire80, wire78, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire18;
  assign wire22 = wire20;
  assign wire23 = wire22[(4'h9):(1'h1)];
  assign wire24 = {{wire21[(5'h10):(4'hb)], wire19}, (8'hb0)};
  module25 #() modinst79 (.y(wire78), .wire28(wire23), .wire27(wire20), .wire29(wire16), .clk(clk), .wire26(wire17));
  assign wire80 = ((&($signed({wire23}) ?
                      $unsigned(wire21[(4'hd):(4'h9)]) : $unsigned((wire78 ?
                          wire22 : wire19)))) ^~ ($unsigned($unsigned(((8'hbe) ?
                          (8'hbc) : wire20))) ?
                      wire19 : $unsigned(($unsigned(wire19) == $signed((8'hb3))))));
  assign wire81 = $unsigned(($signed($signed($unsigned(wire80))) ~^ $signed(wire24[(4'hc):(3'h7)])));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
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
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= $unsigned({$signed(wire27[(3'h4):(1'h0)])});
      reg31 <= ($unsigned($signed(reg30)) ?
          (~&wire28[(4'hd):(4'hd)]) : {$signed(wire27[(1'h0):(1'h0)]),
              ($unsigned((8'h9c)) >> (wire27 ?
                  (&wire28) : (wire28 >= wire26)))});
      reg32 <= $signed((8'hb4));
      reg33 <= $signed($signed(reg32[(2'h3):(2'h2)]));
      reg34 <= wire28;
    end
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg35 <= $unsigned(($signed($unsigned((wire28 >>> wire26))) ?
              (((~&reg33) * wire27[(4'h9):(2'h2)]) ?
                  reg34 : (~^(wire28 << (8'hb6)))) : wire26[(4'h8):(3'h4)]));
        end
      else
        begin
          reg35 <= wire26[(5'h11):(4'he)];
          if (($signed(wire29[(5'h10):(4'hc)]) >> wire26[(4'h9):(3'h7)]))
            begin
              reg36 <= (reg32 == $signed(wire29[(5'h10):(2'h2)]));
              reg37 <= (7'h41);
              reg38 <= ($unsigned((~&(8'haf))) != $signed($signed(((reg36 < reg36) << $signed(reg36)))));
              reg39 <= reg30;
            end
          else
            begin
              reg36 <= (wire29 + (|reg39[(1'h0):(1'h0)]));
              reg37 <= reg33;
              reg38 <= {($unsigned($unsigned((&reg32))) ^~ (~^((-reg39) ?
                      reg33 : wire26))),
                  (+{wire27[(1'h0):(1'h0)], {(~reg34)}})};
            end
        end
      if ($signed(reg39))
        begin
          if (reg37[(3'h6):(3'h4)])
            begin
              reg40 <= (reg32 ?
                  ((8'hb3) ?
                      $unsigned({reg39}) : reg38[(1'h0):(1'h0)]) : reg38[(3'h5):(1'h1)]);
              reg41 <= ($signed((~^($signed(reg33) != reg40))) ?
                  ({$unsigned($signed(reg35))} ?
                      $signed(reg36[(5'h14):(5'h14)]) : {reg34,
                          ((reg30 ?
                              (8'hb8) : reg31) + (reg39 >= reg34))}) : wire29);
              reg42 <= $signed((($unsigned($unsigned(reg31)) ?
                  reg36[(5'h13):(4'hd)] : reg40[(3'h7):(3'h6)]) >>> $signed((-reg40[(3'h5):(3'h5)]))));
              reg43 <= (^($unsigned(({reg30} | ((8'hab) ? wire28 : reg42))) ?
                  $unsigned((reg34 << (reg31 && reg42))) : ($signed((reg34 <<< reg31)) | (&$signed(reg39)))));
              reg44 <= (((({reg42} ?
                          {(7'h41), reg33} : (reg40 ?
                              reg34 : reg34)) != ((8'hae) ^ $signed(reg30))) ?
                      (($unsigned(reg38) || wire27) + (~^$unsigned(reg30))) : reg41) ?
                  wire26 : (~|wire26));
            end
          else
            begin
              reg40 <= reg37;
              reg41 <= ($unsigned((($unsigned(reg39) ?
                      {reg33} : (|(8'hb3))) && (^~(reg30 ? wire28 : reg44)))) ?
                  ($unsigned({((8'hbd) >>> (8'hbf))}) ?
                      (^~$unsigned((&reg39))) : ((reg44 ?
                              (reg40 ~^ reg43) : {reg37}) ?
                          ((reg30 | wire27) ?
                              reg33[(4'h9):(3'h6)] : reg36[(4'hc):(4'h8)]) : (&(~&reg39)))) : reg35);
              reg42 <= (~reg43[(5'h12):(2'h3)]);
            end
          if ($unsigned({$signed((~^(-reg31)))}))
            begin
              reg45 <= $signed($signed(($unsigned(((7'h42) ?
                  reg42 : (8'had))) | $unsigned($unsigned(wire26)))));
            end
          else
            begin
              reg45 <= $signed(($unsigned(wire28) ?
                  ({(+reg32), reg43} ? reg31[(1'h0):(1'h0)] : reg36) : reg36));
              reg46 <= reg36;
              reg47 <= reg30[(3'h5):(3'h4)];
            end
          if (((reg41[(2'h2):(2'h2)] >= ((^~$signed(reg34)) + $signed($signed(wire26)))) ?
              {reg44[(3'h4):(1'h0)]} : $signed(reg30[(5'h10):(4'ha)])))
            begin
              reg48 <= reg34;
              reg49 <= ({reg35[(3'h6):(3'h4)], reg33[(4'hc):(3'h5)]} ?
                  wire28[(4'hc):(4'hb)] : ($signed($signed(((8'h9d) ?
                      reg46 : wire26))) - ($unsigned(wire29) | reg35)));
              reg50 <= $signed($unsigned($signed(($signed(wire27) ?
                  {reg30} : reg49))));
              reg51 <= wire26;
            end
          else
            begin
              reg48 <= (~(&{((reg40 ? (8'hbc) : reg50) || (wire27 ?
                      reg40 : wire29))}));
              reg49 <= {($unsigned(((reg44 ? (8'hb5) : reg46) ?
                          {wire26, reg47} : $unsigned(reg49))) ?
                      {reg30[(3'h5):(2'h2)],
                          ((wire26 ? (8'hbb) : reg39) ?
                              reg38[(4'h9):(3'h4)] : reg33[(4'hb):(3'h4)])} : $signed(reg48))};
            end
          reg52 <= ((reg50[(4'hd):(4'h8)] ?
              $signed((reg38[(3'h5):(3'h4)] ?
                  (8'hb1) : $unsigned(wire27))) : {(&(reg43 ? reg33 : reg34)),
                  (reg39[(1'h1):(1'h0)] ?
                      reg44[(1'h1):(1'h1)] : reg40)}) ^~ $signed($signed(($signed(reg33) < (reg36 < reg50)))));
        end
      else
        begin
          reg40 <= $signed(reg50[(4'hb):(3'h4)]);
          reg41 <= reg34[(1'h0):(1'h0)];
        end
      reg53 <= ((^{$unsigned(reg38),
          ((8'h9f) | (reg42 ? (8'haf) : reg32))}) || (!(wire28[(2'h3):(1'h1)] ?
          $unsigned($signed(reg33)) : ((reg40 <<< reg49) + wire26[(5'h12):(5'h12)]))));
      reg54 <= $signed($unsigned((~$unsigned($signed(reg45)))));
      reg55 <= reg30;
    end
  assign wire56 = reg49;
  assign wire57 = $signed((($unsigned((8'hb1)) ^~ ({(8'hbb), reg39} - reg49)) ?
                      (reg38 & reg44[(1'h0):(1'h0)]) : $unsigned(((reg45 >= reg44) ?
                          reg50[(1'h1):(1'h1)] : (&reg44)))));
  assign wire58 = reg44;
  assign wire59 = (~&$unsigned(wire27[(4'h9):(2'h2)]));
  always
    @(posedge clk) begin
      reg60 <= {reg45[(4'hf):(3'h7)],
          ((-reg46[(4'h8):(4'h8)]) ?
              $signed({(~^reg44), (~|reg53)}) : $unsigned((reg32 ?
                  (~&(8'hb7)) : {reg35, (8'hbb)})))};
      reg61 <= reg45[(4'h8):(3'h4)];
      reg62 <= reg55[(2'h3):(2'h2)];
      reg63 <= ((^~(reg40 - $unsigned((reg32 >> reg31)))) ?
          reg33 : $signed((reg35 ?
              (reg40 ?
                  (reg43 ?
                      wire29 : reg35) : (wire59 || reg40)) : $signed($signed(reg47)))));
    end
  assign wire64 = ($signed($unsigned((+(reg47 ?
                      reg40 : wire27)))) << reg33[(4'hc):(3'h6)]);
  assign wire65 = {reg42[(1'h1):(1'h1)]};
  assign wire66 = $unsigned($signed(reg54[(4'hb):(4'hb)]));
  assign wire67 = reg53;
  assign wire68 = {{wire57, (&$signed((|reg52)))},
                      {(+($unsigned(wire59) != reg43[(2'h3):(2'h3)])),
                          (^~$unsigned($signed(wire58)))}};
  assign wire69 = $unsigned(wire28[(1'h1):(1'h1)]);
  assign wire70 = $signed($unsigned((!(reg62[(4'h8):(4'h8)] ?
                      wire66 : reg48))));
  assign wire71 = $signed(reg32[(4'hc):(4'hb)]);
  assign wire72 = ($unsigned((wire66 * ($signed((7'h44)) ?
                      (wire64 && wire56) : (wire71 || reg43)))) >>> wire71);
  assign wire73 = reg54[(5'h10):(1'h0)];
  assign wire74 = $signed((~$signed($unsigned(wire72[(1'h1):(1'h0)]))));
  assign wire75 = (~{$unsigned(reg38)});
  assign wire76 = {reg32,
                      (((wire26[(4'hb):(1'h1)] ?
                              $unsigned(reg36) : reg41[(3'h5):(2'h2)]) * wire71) ?
                          {wire56} : ($unsigned(wire26) * (+$unsigned(wire64))))};
  assign wire77 = ($unsigned($unsigned($signed((~&reg63)))) > (({((8'hb9) ?
                          reg44 : wire74),
                      reg46} | wire76) == (^~$signed((~^reg38)))));
endmodule

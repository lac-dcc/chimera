module top
#(parameter param88 = ((((&((8'hb5) - (8'hbd))) ? ((-(7'h43)) ? ((8'ha8) ? (7'h43) : (8'hb4)) : {(8'hbf), (8'h9e)}) : ((&(7'h40)) && (^(8'ha8)))) ? (^(8'hb1)) : {(((8'hb8) ? (8'haf) : (8'hbc)) ? ((8'hab) ? (8'hb1) : (8'h9e)) : ((8'haf) ? (8'ha6) : (8'hbd)))}) ? {(|(((8'ha6) ? (8'hab) : (8'hb3)) ^~ ((8'hb5) ? (8'hb9) : (8'hb7)))), (+{{(8'ha8)}})} : (8'ha3)), 
parameter param89 = ((((~|(param88 << param88)) ? param88 : ({param88, param88} >>> (param88 >>> (8'hac)))) ? {((^param88) & (8'ha3))} : (param88 | {(param88 ? param88 : param88), {param88, param88}})) == param88))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire5,
                 reg85,
                 reg84,
                 reg79,
                 (1'h0)};
  assign wire5 = $signed((~|$unsigned((+wire0[(4'ha):(3'h5)]))));
  module6 #() modinst75 (.y(wire74), .wire10(wire3), .wire9(wire0), .wire7(wire2), .wire8(wire4), .clk(clk));
  assign wire76 = (8'hb7);
  assign wire77 = $unsigned((^wire0[(3'h5):(1'h0)]));
  assign wire78 = $unsigned($unsigned((wire76 ?
                      (~(wire4 << wire0)) : (8'haf))));
  always
    @(posedge clk) begin
      reg79 <= (~^(+((-wire74) ?
          ($signed((8'hae)) ? {wire2} : (^~(8'ha2))) : ($unsigned(wire0) ?
              wire0 : (wire76 ? (8'hb4) : wire74)))));
    end
  assign wire80 = $unsigned((wire2[(4'h8):(3'h7)] - (wire2 >> ((&wire78) << (~(7'h43))))));
  assign wire81 = wire1[(1'h0):(1'h0)];
  assign wire82 = $unsigned($signed({{(wire1 ? wire80 : wire5)}}));
  assign wire83 = {wire1[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg84 <= (^wire4);
      reg85 <= wire83[(4'h8):(3'h6)];
    end
  assign wire86 = ({wire5[(4'ha):(4'h9)],
                          (((wire77 ^~ wire77) ?
                              reg84[(3'h4):(2'h3)] : wire5[(4'he):(4'hd)]) == (&(wire3 > wire81)))} ?
                      (wire3 < wire2) : $signed(((-$unsigned(wire3)) ?
                          ($unsigned(wire82) ?
                              {wire3} : (|reg84)) : ($signed(wire2) == ((8'hba) == wire77)))));
  assign wire87 = wire78;
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire11;
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire73,
                 wire71,
                 wire29,
                 wire28,
                 wire11,
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
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = {(~&((wire9 ?
                          wire10[(4'h9):(3'h5)] : ((8'hb9) ?
                              wire8 : wire8)) + ($unsigned(wire8) <= $signed((8'hb1))))),
                      {$unsigned((wire7[(4'h9):(3'h5)] ?
                              wire10 : $signed(wire9)))}};
  always
    @(posedge clk) begin
      if ((wire8 & (wire8 ? (^wire9) : (~|wire8[(2'h2):(1'h1)]))))
        begin
          if (wire9[(3'h4):(1'h0)])
            begin
              reg12 <= wire7[(4'ha):(3'h6)];
              reg13 <= wire9[(2'h2):(2'h2)];
              reg14 <= wire11;
              reg15 <= (8'ha7);
              reg16 <= ((^wire8[(4'hc):(4'h9)]) ?
                  ($signed(reg14) ?
                      $unsigned($signed({reg12,
                          wire11})) : wire7) : (reg14[(3'h6):(2'h3)] ^ reg14));
            end
          else
            begin
              reg12 <= wire8[(3'h5):(2'h2)];
              reg13 <= {wire8[(5'h11):(5'h11)]};
            end
          if (({(reg16 >> wire8)} ? reg14[(3'h6):(3'h6)] : $unsigned(reg13)))
            begin
              reg17 <= ((-wire8) == ({(reg12 ?
                      ((8'ha3) ?
                          reg13 : reg13) : $unsigned(wire9))} <<< (8'hb1)));
              reg18 <= (~|$unsigned($signed(reg13)));
              reg19 <= ($signed(reg12) - reg15[(3'h7):(2'h2)]);
              reg20 <= reg14[(2'h3):(1'h0)];
            end
          else
            begin
              reg17 <= reg16[(2'h3):(2'h2)];
              reg18 <= {(~&$unsigned(((^~wire11) ?
                      $signed((8'had)) : ((8'hb3) ? wire10 : wire10)))),
                  reg19};
            end
        end
      else
        begin
          if (wire8)
            begin
              reg12 <= reg13[(3'h7):(3'h4)];
            end
          else
            begin
              reg12 <= ((((|wire11) ?
                  ((reg12 ?
                      reg20 : reg13) ~^ reg20[(2'h2):(1'h1)]) : reg18) + reg16) + $signed((reg14 ?
                  (wire7 ?
                      ((7'h40) ? reg13 : wire10) : $signed(reg20)) : ((wire9 ?
                      wire9 : reg20) << $signed(reg16)))));
              reg13 <= ((|reg20[(1'h0):(1'h0)]) >> {((8'hb1) ?
                      (~^((8'ha3) ? (8'ha1) : reg20)) : (8'hb8)),
                  $unsigned({(-reg19)})});
              reg14 <= ((reg16 ^ {$signed(((8'hb9) ?
                      reg14 : wire9))}) && (wire10[(4'hd):(4'hd)] ^ {wire10[(4'he):(4'ha)],
                  (^$unsigned(reg14))}));
            end
          if (reg20[(1'h1):(1'h1)])
            begin
              reg15 <= $signed((~|{$signed(((7'h43) > (8'hbd))),
                  (~&(reg20 >= reg20))}));
              reg16 <= reg20;
            end
          else
            begin
              reg15 <= ($unsigned((wire8 ^~ wire9)) < reg19);
              reg16 <= reg19;
              reg17 <= wire8[(5'h10):(3'h4)];
              reg18 <= (wire8 < (8'hb0));
              reg19 <= reg12[(1'h1):(1'h0)];
            end
          if ($signed($unsigned((7'h42))))
            begin
              reg20 <= reg18[(1'h1):(1'h0)];
            end
          else
            begin
              reg20 <= $unsigned((($unsigned((reg16 ? reg13 : (8'ha9))) ?
                  (8'haa) : $unsigned(reg16)) != wire10[(4'h9):(2'h2)]));
              reg21 <= reg18;
              reg22 <= (~&reg18);
              reg23 <= $unsigned((8'ha3));
              reg24 <= (~(($signed(reg22) ?
                      (^~$unsigned((8'hb3))) : reg23[(4'h9):(2'h2)]) ?
                  (reg18 >> (-(reg17 ?
                      wire10 : reg18))) : (~|((reg15 && (8'hb4)) >= reg23))));
            end
          reg25 <= (!($unsigned((^((8'ha1) <<< reg24))) >= $unsigned(((|reg14) ?
              $unsigned(wire10) : reg19[(1'h0):(1'h0)]))));
          reg26 <= $unsigned($signed((&{(~&reg20), wire8})));
        end
      reg27 <= ($unsigned(wire11) ?
          {$unsigned($signed((|reg17))), (~reg12[(2'h2):(1'h0)])} : {(reg20 ?
                  reg25 : $signed((^reg21)))});
    end
  assign wire28 = wire11[(1'h0):(1'h0)];
  assign wire29 = ({$signed(($signed(reg24) <<< (8'ha7))),
                      (+({reg27} || (~&reg26)))} ^ $signed($signed($signed(reg12))));
  module30 #() modinst72 (.y(wire71), .wire32(wire28), .wire31(wire8), .wire33(reg27), .clk(clk), .wire34(reg18));
  assign wire73 = (8'hb4);
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire34;
  input wire [(4'hb):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
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
                 reg37,
                 (1'h0)};
  assign wire35 = wire33;
  assign wire36 = $signed((~^(((&wire32) > wire34[(2'h2):(2'h2)]) || ((wire34 || wire35) != $unsigned(wire33)))));
  always
    @(posedge clk) begin
      reg37 <= ($unsigned(wire36[(5'h12):(5'h11)]) ?
          (wire35[(1'h1):(1'h0)] == (-((wire35 ? wire34 : wire34) ?
              $unsigned(wire32) : wire32[(3'h5):(2'h2)]))) : ($unsigned((8'ha6)) ?
              $unsigned(wire31[(1'h0):(1'h0)]) : $signed($unsigned({(8'ha3)}))));
    end
  assign wire38 = ((wire34 >>> wire34[(1'h0):(1'h0)]) ?
                      wire35[(1'h1):(1'h1)] : $unsigned((|wire32[(2'h2):(1'h0)])));
  assign wire39 = $signed((!$unsigned((reg37[(4'hd):(3'h7)] <<< ((8'ha8) ?
                      wire35 : (8'hb5))))));
  assign wire40 = ($signed($unsigned($signed((wire35 ? wire32 : wire33)))) ?
                      (~^wire36[(3'h6):(1'h1)]) : wire38[(2'h2):(1'h1)]);
  assign wire41 = ((wire31[(5'h12):(3'h7)] ?
                      ((~&(wire32 <<< wire32)) ?
                          (~&wire33[(3'h4):(3'h4)]) : (8'ha2)) : (|(|((8'ha2) != wire40)))) != ((~&$unsigned(wire32[(2'h3):(2'h3)])) & {$signed((~|wire40)),
                      wire39}));
  assign wire42 = (((($unsigned(wire33) ?
                      (wire38 > wire31) : (wire39 + reg37)) & (~|$signed(wire34))) > wire35[(2'h2):(2'h2)]) >= (+{$signed(((8'hac) ?
                          wire33 : wire41))}));
  assign wire43 = (&($unsigned(((wire32 >= wire31) ?
                      (+wire35) : {(7'h40), wire32})) | (|(~$signed(wire33)))));
  assign wire44 = (~&$unsigned(wire43));
  assign wire45 = $unsigned(wire43);
  assign wire46 = (~|$signed((~|$unsigned((wire31 <= wire38)))));
  always
    @(posedge clk) begin
      reg47 <= ({($unsigned($unsigned(wire31)) ?
                  wire45[(4'ha):(3'h4)] : ($signed(wire39) ?
                      (wire46 ? wire39 : wire46) : (reg37 ^~ (8'ha4)))),
              wire32} ?
          $signed(wire45) : wire35[(2'h3):(1'h0)]);
      reg48 <= (((wire38[(4'ha):(3'h4)] ? wire42 : (8'ha4)) ?
          $signed(wire31[(4'hf):(4'hc)]) : (^~{$signed(reg47)})) - (wire34 ?
          wire46[(2'h2):(1'h0)] : (((wire34 ?
              (7'h40) : wire45) ~^ $unsigned(wire39)) <= $unsigned((wire39 < wire40)))));
      if ((($signed($unsigned(wire43)) ? wire44 : (8'ha3)) ?
          ({$unsigned((wire38 ?
                  wire41 : wire33))} | ($signed((^wire43)) && ($unsigned((8'ha9)) ?
              ((8'ha8) ? wire43 : wire35) : $signed(reg37)))) : wire43))
        begin
          reg49 <= (wire38 * (({(^wire42)} ?
                  (wire40 <= $unsigned(wire33)) : wire45) ?
              {($unsigned(wire38) < $signed(wire40)),
                  wire43[(2'h2):(1'h1)]} : $unsigned($unsigned(((8'hac) + wire41)))));
          reg50 <= wire43[(1'h0):(1'h0)];
        end
      else
        begin
          reg49 <= $signed(wire33);
          reg50 <= ({(($signed(wire45) <<< (wire32 ?
                  wire43 : wire33)) <= $signed($signed((7'h42))))} ~^ wire46);
          reg51 <= $signed($signed($signed(((8'hbd) <<< (wire46 ?
              reg47 : reg48)))));
        end
      reg52 <= (reg37 | (!wire33));
      if ($signed(((reg52 < (~|(wire45 && wire39))) ?
          ($signed((wire41 ?
              wire43 : reg47)) << wire33) : ($signed((!(8'hb3))) ?
              $unsigned((reg51 ^ (7'h42))) : (wire36[(3'h7):(3'h7)] << wire46[(3'h7):(3'h5)])))))
        begin
          if ((8'hb5))
            begin
              reg53 <= $unsigned($unsigned(wire34[(1'h1):(1'h1)]));
              reg54 <= reg48;
              reg55 <= $unsigned(reg53[(2'h2):(1'h0)]);
              reg56 <= reg55[(4'h9):(4'h8)];
            end
          else
            begin
              reg53 <= $unsigned($signed(wire46));
            end
        end
      else
        begin
          reg53 <= $signed($unsigned(((~|reg51) | reg55[(3'h6):(3'h4)])));
        end
    end
  assign wire57 = ((^$signed(reg37)) * $unsigned((wire43[(1'h0):(1'h0)] << $unsigned((wire38 ?
                      reg50 : wire45)))));
  assign wire58 = (reg52[(3'h6):(3'h5)] ?
                      reg47 : $unsigned($signed(((wire34 >>> reg54) ?
                          reg55 : $unsigned(reg49)))));
  assign wire59 = reg56;
  always
    @(posedge clk) begin
      if (((&(((8'had) && (wire58 ? reg49 : reg56)) ?
              $signed({wire36}) : (~(-wire36)))) ?
          $unsigned({(^reg48),
              $signed((wire44 && reg50))}) : ($unsigned((reg50[(2'h2):(1'h1)] ?
                  (wire57 | wire41) : $signed(reg51))) ?
              wire33 : $unsigned(reg53[(1'h1):(1'h1)]))))
        begin
          if ((-wire40[(2'h2):(1'h1)]))
            begin
              reg60 <= $unsigned($unsigned(((^$unsigned((8'hbb))) ?
                  (8'hb4) : (wire58[(3'h4):(2'h2)] && (8'haa)))));
              reg61 <= reg50;
            end
          else
            begin
              reg60 <= ((|(({(8'hb7)} == $signed(wire41)) ?
                      $signed((^(8'ha1))) : $unsigned(reg47[(1'h1):(1'h0)]))) ?
                  reg49 : $unsigned((((wire35 | wire41) >> {reg47}) + ((wire45 ?
                      (8'hb1) : reg54) && (~&wire43)))));
            end
          reg62 <= $signed(((($unsigned(wire40) ? reg37 : (reg56 <<< (8'ha7))) ?
              {$unsigned((8'h9c))} : (8'hbc)) > ({(wire57 || (8'hab)),
              wire57[(3'h4):(3'h4)]} >>> wire41)));
          reg63 <= $unsigned((^(wire42[(3'h4):(2'h3)] ?
              ($unsigned(wire38) ?
                  wire38[(1'h1):(1'h0)] : reg51[(1'h0):(1'h0)]) : $unsigned((reg54 || reg49)))));
          reg64 <= $unsigned($signed(($unsigned((reg54 ? reg47 : reg49)) ?
              (wire33[(4'h9):(2'h3)] ?
                  $unsigned(wire58) : (reg53 ?
                      reg37 : reg49)) : (reg54[(5'h10):(4'h9)] ?
                  (reg50 ? (8'ha5) : reg55) : (+reg49)))));
        end
      else
        begin
          reg60 <= wire46;
          reg61 <= $signed((-wire39[(3'h4):(2'h3)]));
          reg62 <= (~(wire36 > $unsigned((7'h42))));
          reg63 <= (~^($signed($signed((wire33 - reg48))) != (&wire40[(1'h1):(1'h1)])));
        end
      reg65 <= {(reg37[(3'h7):(2'h2)] ?
              reg55[(1'h1):(1'h0)] : wire59[(4'hd):(2'h3)]),
          $signed({{(wire40 ? wire46 : (8'ha8)), (wire44 ? reg48 : reg52)},
              $unsigned((wire45 & wire59))})};
      if (wire45)
        begin
          if (wire40)
            begin
              reg66 <= wire42[(1'h0):(1'h0)];
            end
          else
            begin
              reg66 <= reg48;
            end
          reg67 <= (~$unsigned($signed($signed(((8'hba) ? reg63 : reg60)))));
          reg68 <= reg48[(4'h8):(3'h6)];
          reg69 <= wire38[(2'h3):(2'h2)];
        end
      else
        begin
          reg66 <= reg61[(4'hd):(4'hc)];
          reg67 <= wire57;
          if ((~&((reg49 ? (+reg54) : $signed($unsigned(wire58))) ?
              wire36[(3'h4):(2'h3)] : (wire32[(3'h5):(1'h0)] && $unsigned({wire36,
                  (8'hbf)})))))
            begin
              reg68 <= $signed(($signed(reg63) >> (!(reg62[(4'h8):(3'h7)] ?
                  ((7'h40) * reg68) : wire45))));
            end
          else
            begin
              reg68 <= wire57;
              reg69 <= (^((&(reg62[(4'hb):(1'h0)] ?
                  (!reg50) : {wire40})) != $unsigned(wire36)));
            end
        end
      reg70 <= (|reg48);
    end
endmodule

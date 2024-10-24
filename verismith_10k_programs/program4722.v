module top
#(parameter param82 = (8'hb2), 
parameter param83 = ((|param82) ? param82 : (~|(~((param82 ? param82 : param82) ? param82 : param82)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire78;
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire15,
                 wire16,
                 wire78,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire2[(2'h2):(2'h2)]))
        begin
          reg5 <= $unsigned($unsigned({(~^wire2[(1'h0):(1'h0)])}));
          reg6 <= wire3[(4'h8):(2'h3)];
          reg7 <= wire1[(2'h2):(2'h2)];
        end
      else
        begin
          if ((~&{wire1}))
            begin
              reg5 <= wire2;
              reg6 <= (wire0[(1'h1):(1'h0)] || ((-wire4[(4'hc):(3'h5)]) ?
                  (+wire3) : ((wire0 - $unsigned(wire1)) ?
                      $signed({wire1}) : wire3)));
              reg7 <= reg6[(2'h3):(2'h3)];
              reg8 <= {{(wire3 >>> ($unsigned((8'ha6)) || $signed(wire4))),
                      reg6[(3'h4):(2'h3)]},
                  reg7};
            end
          else
            begin
              reg5 <= (8'ha0);
            end
        end
      if (wire3[(3'h7):(2'h3)])
        begin
          reg9 <= (reg8[(2'h2):(1'h0)] >>> {({{reg7}, $signed(reg7)} ?
                  {wire4} : wire3[(3'h6):(3'h5)])});
          reg10 <= (!(reg5[(3'h7):(3'h6)] < $signed(($signed(wire3) ^~ (reg6 >= reg5)))));
          reg11 <= $signed(reg6[(4'h8):(3'h7)]);
        end
      else
        begin
          reg9 <= (reg6[(1'h0):(1'h0)] > $unsigned(wire1[(4'hc):(4'h9)]));
          reg10 <= $unsigned(reg8[(1'h1):(1'h1)]);
          reg11 <= $signed(wire2[(2'h2):(2'h2)]);
          reg12 <= $signed(wire2[(3'h7):(2'h2)]);
          reg13 <= $signed(((^$signed((&reg7))) ?
              $signed(wire1) : $signed({(reg5 ? reg5 : (8'hba))})));
        end
      reg14 <= (&((7'h41) >>> $unsigned(({wire0} << reg10))));
    end
  assign wire15 = ({(((reg13 << reg9) ?
                          ((8'haa) ? wire2 : reg9) : {reg8}) - $unsigned({wire4,
                          wire1})),
                      $unsigned($unsigned($signed((8'ha4))))} & wire2[(3'h7):(3'h6)]);
  assign wire16 = $unsigned($unsigned($unsigned(((^reg12) ?
                      $signed((8'hbd)) : (wire2 ? reg9 : wire2)))));
  always
    @(posedge clk) begin
      if ((($unsigned($unsigned((8'ha5))) ?
          (reg11[(4'h9):(1'h1)] >>> (reg7[(3'h6):(1'h0)] - $unsigned(wire4))) : (&(~&$signed(reg7)))) != $signed($signed(wire4[(4'h9):(3'h5)]))))
        begin
          reg17 <= {reg6, $signed($signed(reg7[(2'h3):(2'h2)]))};
          reg18 <= wire16[(4'h8):(2'h3)];
          reg19 <= $unsigned(reg12);
        end
      else
        begin
          reg17 <= $unsigned($signed(({(7'h41)} ?
              ({reg10,
                  (8'ha7)} ^~ $unsigned((8'h9e))) : $unsigned($unsigned(reg19)))));
        end
      reg20 <= $unsigned((+reg9));
    end
  always
    @(posedge clk) begin
      reg21 <= (-$signed(($unsigned((reg20 ? reg11 : reg19)) ?
          ((reg9 ? wire0 : reg17) ? wire2 : (wire3 <= (8'hb7))) : ((~^reg7) ?
              wire0[(3'h5):(2'h2)] : {reg7}))));
      reg22 <= ($unsigned($signed($unsigned({reg13}))) ?
          reg19[(2'h2):(1'h1)] : wire16[(3'h5):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg23 <= (~|((8'hac) == wire2[(1'h1):(1'h1)]));
      reg24 <= reg17[(1'h1):(1'h1)];
      reg25 <= (wire15 ? ((~{$unsigned(reg13)}) << (8'hb3)) : (8'had));
    end
  module26 #() modinst79 (wire78, clk, wire16, reg23, reg11, reg18);
  assign wire80 = $unsigned($unsigned($signed($unsigned(wire0[(4'ha):(1'h0)]))));
  assign wire81 = ($unsigned((((reg14 == reg19) ?
                              (reg14 != reg8) : reg23[(1'h1):(1'h1)]) ?
                          $unsigned(reg20) : $signed({reg24, (8'hb4)}))) ?
                      ((^((^wire0) && (|reg14))) ?
                          (^$signed(wire2[(3'h5):(1'h1)])) : reg23) : (((-{(8'hb2)}) + (wire16 >> $unsigned(reg9))) ?
                          reg24[(1'h1):(1'h0)] : $signed($signed((8'hab)))));
endmodule

module module26  (y, clk, wire27, wire28, wire29, wire30);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(2'h3):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire75;
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  assign y = {wire77,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire40,
                 wire41,
                 wire42,
                 wire75,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire31 = wire29[(1'h1):(1'h1)];
  assign wire32 = (!wire31[(4'h9):(3'h5)]);
  assign wire33 = wire30;
  assign wire34 = wire30[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg35 <= $unsigned(wire29[(1'h0):(1'h0)]);
      reg36 <= wire33[(4'hd):(4'h9)];
      reg37 <= ((8'hb9) ?
          $unsigned((~wire27[(4'h9):(3'h5)])) : wire30[(2'h2):(2'h2)]);
      reg38 <= wire32;
      reg39 <= (|{(!wire27[(4'ha):(4'ha)])});
    end
  assign wire40 = $unsigned(((8'hb8) ?
                      $unsigned(((reg36 ~^ (8'hb9)) ?
                          (+(7'h44)) : reg38[(2'h2):(2'h2)])) : reg37[(3'h5):(2'h2)]));
  assign wire41 = (wire34 ?
                      ((-wire33[(5'h10):(4'h8)]) ?
                          ({wire29[(1'h1):(1'h0)]} || $signed((wire34 ^ reg39))) : reg37) : (((wire28[(2'h3):(1'h1)] ?
                              ((8'h9f) != wire30) : ((8'ha7) > wire32)) ?
                          $unsigned((reg36 ^~ wire27)) : $signed(wire33[(4'hd):(4'hd)])) ^ (^((reg39 >= wire33) >= wire32))));
  assign wire42 = {((wire27[(4'h8):(2'h3)] <= (!{(8'hb1),
                          wire34})) != reg37[(4'hc):(4'h9)]),
                      ($unsigned((^$unsigned(wire33))) ?
                          $unsigned({$unsigned(wire33)}) : $signed($unsigned(wire32[(4'hb):(1'h0)])))};
  module43 #() modinst76 (wire75, clk, wire41, wire27, wire40, reg38);
  assign wire77 = $signed(wire32[(4'ha):(2'h3)]);
endmodule

module module43  (y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire47;
  input wire signed [(3'h5):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg64,
                 reg63,
                 reg62,
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
                 (1'h0)};
  assign wire48 = {wire46, $signed(wire46[(2'h3):(1'h1)])};
  assign wire49 = wire47[(1'h1):(1'h1)];
  assign wire50 = wire45;
  assign wire51 = ($signed($signed($signed($unsigned(wire50)))) ?
                      wire45 : wire49);
  always
    @(posedge clk) begin
      if ((((wire44 ?
              (~&((8'hbf) ?
                  wire51 : (8'hb9))) : ((~&wire46) == (wire51 == (8'hba)))) ?
          $unsigned(((wire50 ?
              wire46 : wire46) ~^ $unsigned((8'h9f)))) : wire49[(1'h1):(1'h1)]) != (wire51[(5'h11):(1'h0)] ?
          (((wire49 ? wire51 : wire51) ? wire44 : {(8'haf)}) ?
              ($unsigned(wire46) >= $unsigned(wire44)) : {(wire49 ?
                      wire44 : (7'h42)),
                  (wire44 ? wire45 : wire48)}) : wire49)))
        begin
          reg52 <= ($signed($unsigned(wire44)) ?
              $unsigned($unsigned(((wire47 ? wire49 : wire46) & {wire48,
                  wire47}))) : wire51[(1'h1):(1'h1)]);
          reg53 <= {{(wire47[(4'hf):(4'h9)] * {wire48}),
                  {{(wire49 <<< wire51)}}},
              (^(reg52[(2'h3):(1'h1)] <= ((wire46 ? wire47 : wire45) ?
                  wire49[(3'h7):(3'h6)] : (+(7'h42)))))};
          reg54 <= wire45;
          if ($unsigned(reg52))
            begin
              reg55 <= ((~^reg54[(1'h0):(1'h0)]) ?
                  (~^$signed(((!wire46) ?
                      reg52[(3'h5):(3'h5)] : (+wire45)))) : wire48[(4'h8):(3'h7)]);
              reg56 <= $unsigned(($signed((^(wire47 ? wire50 : wire44))) ?
                  $unsigned({$signed(wire44), wire50}) : (&($unsigned(wire51) ?
                      (~wire47) : {reg54, reg52}))));
              reg57 <= $unsigned($unsigned(((8'ha7) <<< ($signed((8'had)) ?
                  reg52 : ((8'hb9) >> wire44)))));
            end
          else
            begin
              reg55 <= (((reg54 ^~ {(~reg53)}) >> ((+$signed(reg56)) < reg57[(3'h6):(3'h6)])) * wire46);
              reg56 <= (wire44 ?
                  ($unsigned({(~|wire45), $signed(wire45)}) ?
                      $unsigned((reg52 == (~wire50))) : ($signed($unsigned(wire46)) ?
                          $signed(((8'h9c) >= reg54)) : (wire50 != (wire45 ?
                              wire49 : (8'hb7))))) : (wire45 ?
                      $unsigned({(wire49 ? wire46 : reg55)}) : {{reg53},
                          $unsigned(((8'hb9) + reg52))}));
              reg57 <= wire48[(3'h7):(2'h2)];
              reg58 <= (((reg56 <<< (7'h42)) <<< (^(reg52[(2'h3):(1'h1)] ~^ reg55))) ?
                  (|(reg53 < (~&((7'h43) ?
                      wire46 : wire51)))) : $signed((((wire48 ?
                          reg57 : wire50) ?
                      $unsigned((8'haf)) : (wire48 ?
                          reg55 : reg52)) ^~ reg56)));
            end
          reg59 <= (reg58 > (((|$unsigned((8'h9c))) | ($signed(reg52) || wire50)) && {reg55,
              $signed(reg57)}));
        end
      else
        begin
          reg52 <= (((reg57 | reg56[(2'h2):(2'h2)]) == (^~{$unsigned((8'hba))})) <= reg59[(3'h6):(2'h3)]);
          reg53 <= (((wire46[(1'h0):(1'h0)] ?
                      ($signed((8'ha7)) != wire47[(4'hf):(1'h1)]) : reg52[(1'h0):(1'h0)]) ?
                  ((~&(reg54 ?
                      wire46 : wire50)) < (^~wire48)) : ({reg53[(4'hd):(2'h3)]} ?
                      (8'h9e) : reg57[(2'h3):(1'h0)])) ?
              $signed(wire47[(4'h8):(2'h2)]) : (^~(~^((wire44 ^~ reg56) ?
                  (wire49 ? reg54 : wire44) : (!reg57)))));
          reg54 <= $unsigned(wire44);
        end
      if ($signed((wire46 ?
          wire50[(4'h9):(2'h3)] : $unsigned($unsigned({wire47, wire51})))))
        begin
          reg60 <= (^($signed(((wire46 ? wire47 : reg57) < $signed(reg53))) ?
              $unsigned(($signed(reg59) ?
                  $unsigned((8'hbb)) : $signed(reg58))) : $signed($unsigned((8'hbf)))));
        end
      else
        begin
          if ($signed(wire45[(3'h6):(2'h2)]))
            begin
              reg60 <= wire49;
            end
          else
            begin
              reg60 <= $signed((-reg59[(4'he):(3'h4)]));
              reg61 <= (+reg57);
            end
        end
      reg62 <= reg56;
      reg63 <= ((((8'ha7) == ((8'ha3) ?
              wire50 : $unsigned(wire50))) && wire51[(3'h5):(2'h2)]) ?
          $unsigned((+((|wire47) ?
              (wire51 ? wire50 : wire48) : {wire48,
                  reg56}))) : (wire49 ~^ wire49));
      reg64 <= ($unsigned($unsigned($unsigned($unsigned((8'hbe))))) & ($signed((reg61[(1'h1):(1'h1)] <<< {wire51,
          reg58})) ^ ((wire44[(1'h1):(1'h1)] ?
              reg58[(2'h2):(1'h0)] : {reg58, reg53}) ?
          {(^wire46)} : $unsigned(reg59))));
    end
  assign wire65 = {(+wire50)};
  assign wire66 = reg54[(2'h3):(1'h1)];
  assign wire67 = reg53;
  assign wire68 = reg64[(1'h0):(1'h0)];
  assign wire69 = $unsigned(reg53);
  assign wire70 = (~|(^~($unsigned($unsigned((8'hbb))) ?
                      ((reg61 != (8'haa)) ^ (8'hbe)) : (^{(8'ha0)}))));
  assign wire71 = reg57[(3'h6):(3'h6)];
  assign wire72 = $unsigned(reg56);
  assign wire73 = $signed(reg59);
  assign wire74 = wire65;
endmodule

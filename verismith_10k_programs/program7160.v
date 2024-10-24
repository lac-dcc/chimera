module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h290):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire80;
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  assign y = {wire87,
                 wire86,
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
                 wire15,
                 wire30,
                 wire31,
                 wire80,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
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
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire5 = (8'ha5);
  assign wire6 = (~($unsigned((wire5[(4'h8):(2'h3)] ?
                         (wire0 >= wire5) : wire5)) ?
                     $unsigned(wire5[(1'h0):(1'h0)]) : wire2[(5'h13):(4'hd)]));
  assign wire7 = (-$unsigned(wire1[(2'h3):(2'h3)]));
  assign wire8 = $unsigned((($unsigned((wire2 ? wire2 : wire3)) ?
                     $unsigned($unsigned(wire7)) : (wire3[(1'h1):(1'h0)] ?
                         (wire4 == wire2) : $unsigned(wire7))) & wire6[(3'h5):(3'h5)]));
  assign wire9 = (wire8[(5'h12):(3'h6)] || (wire2[(4'h9):(3'h4)] ?
                     $unsigned(({wire0, wire5} ?
                         {wire3} : (wire8 ?
                             wire3 : wire3))) : $signed((8'ha0))));
  assign wire10 = wire8[(4'ha):(4'h9)];
  assign wire11 = wire8;
  assign wire12 = {$signed(wire11), wire11};
  assign wire13 = (~^$signed({wire5[(3'h5):(2'h2)]}));
  assign wire14 = wire1[(4'hb):(4'ha)];
  assign wire15 = $signed((((^(wire9 <<< wire9)) <= wire1) ?
                      (~|(+$unsigned(wire1))) : (^wire9[(4'hd):(4'hc)])));
  always
    @(posedge clk) begin
      reg16 <= $unsigned({{(wire2 ? wire13 : wire13[(1'h1):(1'h0)])}});
      reg17 <= $unsigned((8'hb4));
      if (wire3[(2'h2):(1'h1)])
        begin
          reg18 <= wire9;
          reg19 <= {(~|(8'h9f))};
          if ((reg17[(1'h1):(1'h1)] ? reg18[(1'h1):(1'h0)] : wire3))
            begin
              reg20 <= $signed(wire10);
              reg21 <= wire13[(2'h2):(1'h0)];
              reg22 <= reg20;
              reg23 <= ($unsigned((reg20[(1'h0):(1'h0)] ?
                      (wire7[(1'h1):(1'h0)] <<< (wire0 ?
                          wire7 : wire11)) : $signed((wire4 ^ wire9)))) ?
                  (-$unsigned(wire1)) : wire10[(3'h7):(3'h5)]);
              reg24 <= {wire0[(4'h8):(4'h8)],
                  (^$signed($signed((wire6 && wire13))))};
            end
          else
            begin
              reg20 <= ({(^$unsigned((wire12 || wire12)))} ~^ ((((reg22 != (8'hb4)) <<< {wire4,
                  (8'ha8)}) || (~&(8'ha3))) ~^ $signed(wire1)));
            end
          if ($unsigned($unsigned($unsigned(wire6[(1'h0):(1'h0)]))))
            begin
              reg25 <= (~wire6[(4'h9):(3'h4)]);
              reg26 <= wire9[(4'hf):(4'hc)];
            end
          else
            begin
              reg25 <= $signed(($unsigned((reg25 >> $unsigned((8'h9d)))) && ((reg21[(1'h0):(1'h0)] ?
                  $signed(reg23) : wire15) <= (~&$unsigned(wire1)))));
              reg26 <= reg25[(2'h2):(1'h0)];
            end
          reg27 <= (&(~&$unsigned({reg26})));
        end
      else
        begin
          if ((-(|$unsigned($signed((|wire10))))))
            begin
              reg18 <= reg27[(1'h0):(1'h0)];
            end
          else
            begin
              reg18 <= $unsigned((+(~^{$unsigned(wire2)})));
              reg19 <= $signed((wire9[(3'h5):(2'h2)] <= $unsigned($signed((wire2 - (8'ha5))))));
              reg20 <= wire15[(3'h5):(2'h3)];
            end
          reg21 <= (^(({(wire15 ? (8'ha7) : reg18),
                  (-reg23)} >>> $unsigned($unsigned(wire2))) ?
              (~|reg27) : reg26[(3'h4):(2'h3)]));
        end
      reg28 <= (({(((8'had) ? wire12 : reg22) ^ $unsigned(reg18)),
              ($unsigned((8'hbc)) ? reg20[(1'h1):(1'h0)] : (^(8'h9d)))} ?
          {wire0} : ((&{reg16, wire7}) ?
              {(~|(8'ha4)), $unsigned(wire8)} : (|(wire2 ?
                  wire8 : wire6)))) || (wire5[(3'h5):(1'h1)] * {$unsigned((|reg23)),
          $signed(((8'hb1) << reg22))}));
      reg29 <= $unsigned($signed(((((8'hba) | (8'haa)) ?
              (~|reg18) : (!wire10)) ?
          ($unsigned(reg17) ?
              ((8'hae) ?
                  (8'ha9) : (8'ha9)) : {reg18}) : ((+reg26) >> $signed(wire13)))));
    end
  assign wire30 = (&reg28[(3'h7):(2'h2)]);
  assign wire31 = $unsigned($unsigned((~&((reg16 ^ (8'ha2)) ?
                      (~|(8'haf)) : (-reg21)))));
  module32 #() modinst81 (.wire35(wire13), .wire34(wire5), .clk(clk), .y(wire80), .wire36(wire4), .wire33(wire10), .wire37(wire15));
  always
    @(posedge clk) begin
      reg82 <= ({$unsigned(((wire8 << wire8) ? reg17 : $unsigned((8'ha9)))),
          reg25} << $unsigned((wire6[(3'h5):(1'h1)] * $unsigned($unsigned(reg29)))));
      reg83 <= (&wire31[(2'h2):(2'h2)]);
      reg84 <= $signed($unsigned($unsigned({(reg16 ? wire3 : wire2)})));
      reg85 <= ($signed(reg24[(2'h3):(1'h0)]) ?
          {wire6, {reg21[(4'hd):(4'h9)]}} : $signed(wire13));
    end
  assign wire86 = $signed(wire13[(3'h4):(2'h3)]);
  assign wire87 = wire15[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg88 <= {({((~|(8'hb5)) < (reg29 ?
                  reg23 : reg27))} + reg83[(2'h2):(1'h0)])};
      reg89 <= ($unsigned(reg24) ?
          wire13[(3'h6):(1'h0)] : (^wire10[(2'h3):(2'h3)]));
      if (reg22)
        begin
          reg90 <= (reg28[(4'hb):(2'h3)] ~^ (($signed((^(8'haa))) ?
              $unsigned(reg82) : reg17[(1'h1):(1'h1)]) + (^~reg17[(3'h4):(2'h3)])));
          reg91 <= $signed(wire0[(1'h1):(1'h1)]);
          reg92 <= reg29;
        end
      else
        begin
          reg90 <= (((~^reg26[(3'h4):(3'h4)]) == (+($signed(wire87) > ((8'h9f) ?
              wire3 : wire12)))) << $signed($unsigned(wire13)));
        end
      reg93 <= wire11[(4'h9):(4'h8)];
    end
  always
    @(posedge clk) begin
      if (wire30)
        begin
          reg94 <= wire8;
          if ({$signed($unsigned((+(wire0 ? wire30 : reg89)))),
              {($signed($unsigned(wire15)) ?
                      {$unsigned(wire1),
                          ((7'h41) ? reg93 : wire10)} : $signed((^reg26))),
                  $unsigned($unsigned(((8'hb6) * reg91)))}})
            begin
              reg95 <= $signed(wire0[(3'h4):(2'h2)]);
              reg96 <= (wire9[(2'h2):(1'h1)] ?
                  ((|$signed(wire10[(2'h2):(2'h2)])) ?
                      reg21 : ($signed({(8'hb4),
                          wire13}) || reg18[(3'h5):(2'h3)])) : wire5);
              reg97 <= ((~|((&reg96) >= $signed($unsigned(reg21)))) ?
                  $unsigned((&(+reg89[(3'h4):(2'h2)]))) : reg82[(3'h7):(3'h7)]);
            end
          else
            begin
              reg95 <= (^~(~|$signed(reg18)));
              reg96 <= (wire87[(1'h0):(1'h0)] ?
                  (^wire2[(4'hb):(1'h1)]) : $signed(wire13));
              reg97 <= $unsigned((|(-wire0)));
              reg98 <= $unsigned($signed(wire10[(3'h4):(3'h4)]));
              reg99 <= $unsigned((((-$signed(wire31)) | $unsigned($signed(reg22))) >= (($signed(reg18) > {wire7}) ?
                  $unsigned((reg84 ?
                      wire86 : reg97)) : $signed(reg23[(4'h9):(2'h2)]))));
            end
          reg100 <= (!({(-(~reg82))} & wire6));
          reg101 <= reg18[(4'h8):(3'h4)];
          reg102 <= $unsigned(reg92[(1'h1):(1'h0)]);
        end
      else
        begin
          reg94 <= (~reg91);
          if ($signed(reg82[(3'h6):(3'h6)]))
            begin
              reg95 <= (wire86 | ($unsigned($signed($unsigned(reg96))) << ($signed(wire80) <<< $unsigned(((8'had) ~^ reg29)))));
            end
          else
            begin
              reg95 <= $unsigned($unsigned(reg23));
            end
        end
      reg103 <= wire31[(1'h1):(1'h0)];
      if ((~reg82))
        begin
          reg104 <= (reg23[(3'h4):(1'h0)] ?
              ((reg99 * $unsigned(reg19[(2'h3):(2'h3)])) != $signed(reg23[(4'h8):(2'h3)])) : (reg82 ?
                  reg18[(1'h1):(1'h1)] : reg102));
          reg105 <= wire0[(4'h8):(2'h3)];
          reg106 <= {(($signed($signed(wire10)) + (reg29[(2'h2):(1'h0)] && (~|reg23))) && {$signed((reg89 ?
                      (8'h9c) : wire7))})};
          reg107 <= wire5[(4'h8):(1'h1)];
          reg108 <= (wire86[(2'h3):(2'h2)] <= reg97[(4'ha):(1'h0)]);
        end
      else
        begin
          reg104 <= reg22[(2'h3):(2'h3)];
        end
    end
endmodule

module module32
#(parameter param79 = ((~&((((8'haa) == (8'ha9)) * ((8'ha0) ? (8'haf) : (8'ha9))) ? (((7'h41) >>> (8'had)) - ((7'h41) ^~ (8'hb5))) : {(~&(8'hb8))})) ? ((-((8'hac) <<< (~^(8'hb0)))) >> ((((8'hb1) >>> (8'hb0)) >= ((8'ha5) ? (8'ha0) : (8'h9e))) ? ({(8'hb9)} ? ((8'hb1) ? (8'hb3) : (8'hb8)) : (&(8'hb5))) : (((8'hb9) ? (8'h9e) : (8'hbc)) >= (^(7'h42))))) : (+(((&(8'haa)) || {(8'hbc), (8'h9e)}) ? (((8'ha7) ~^ (8'ha1)) < (+(8'hbb))) : (((8'ha3) << (7'h42)) | (!(8'haf)))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire36;
  input wire [(4'h9):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  assign y = {wire78,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire46,
                 wire45,
                 wire44,
                 wire39,
                 wire38,
                 reg77,
                 reg76,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire38 = (~|(~(wire36[(5'h11):(4'he)] & (+$signed(wire33)))));
  assign wire39 = wire34;
  always
    @(posedge clk) begin
      reg40 <= wire34[(4'ha):(4'ha)];
      reg41 <= {{wire36, {(~^(~wire35)), {$signed(wire39)}}},
          wire34[(1'h0):(1'h0)]};
      reg42 <= wire35[(3'h4):(2'h3)];
      reg43 <= ({(wire33 ?
              wire38 : ($unsigned(wire38) ?
                  $unsigned(wire39) : $unsigned(wire36))),
          wire34} || reg42[(3'h7):(1'h1)]);
    end
  assign wire44 = wire34[(4'hd):(4'h8)];
  assign wire45 = $unsigned((^~wire37[(1'h0):(1'h0)]));
  assign wire46 = wire45;
  module47 #() modinst72 (wire71, clk, wire45, wire44, reg43, wire38, wire36);
  assign wire73 = (($signed((reg40 ?
                      wire39 : (wire33 >= wire38))) <= $signed($unsigned((7'h44)))) < $signed(wire35));
  assign wire74 = (8'hb4);
  assign wire75 = {$unsigned($signed((~|$signed(wire45))))};
  always
    @(posedge clk) begin
      reg76 <= wire75;
      reg77 <= $signed($unsigned(($signed((wire34 ^ (8'hb7))) ?
          ($signed(wire46) <<< wire45) : $signed((reg40 != reg42)))));
    end
  assign wire78 = {(($signed((wire39 + wire34)) ?
                          $unsigned((7'h42)) : wire33) < {{(reg43 <= reg77)}})};
endmodule

module module47
#(parameter param69 = (7'h42), 
parameter param70 = (~(+{{(~^param69), param69}})))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  input wire [(2'h2):(1'h0)] wire49;
  input wire [(4'ha):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire54,
                 wire53,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire53 = wire48[(2'h2):(1'h0)];
  assign wire54 = $signed($unsigned(((wire52[(3'h4):(1'h0)] ?
                      wire53 : (wire48 ?
                          wire48 : (8'ha7))) < wire53[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      if ((8'ha5))
        begin
          if ($signed((~^(wire51[(2'h2):(2'h2)] << ($signed((8'hb6)) ?
              wire54[(4'ha):(4'h8)] : $unsigned(wire54))))))
            begin
              reg55 <= $unsigned(((8'h9d) ?
                  wire48 : ($signed(((8'h9d) ?
                      wire49 : wire49)) ^ $unsigned($unsigned((8'hbb))))));
            end
          else
            begin
              reg55 <= $unsigned($unsigned((~((^~reg55) == ((8'hb1) ?
                  wire52 : (8'h9e))))));
              reg56 <= wire54[(3'h4):(1'h0)];
            end
          reg57 <= $unsigned(wire53);
          if (wire49[(1'h0):(1'h0)])
            begin
              reg58 <= ((wire50[(2'h3):(2'h2)] ?
                      {$unsigned($unsigned(reg56)),
                          (reg55 ?
                              (7'h40) : $unsigned(wire50))} : ((reg56[(4'ha):(3'h5)] ?
                          $unsigned(wire54) : $unsigned(reg55)) | $signed((wire51 ?
                          wire51 : reg57)))) ?
                  ((-(reg56 ?
                      $unsigned(reg56) : {reg56})) <<< $unsigned((|$unsigned(reg57)))) : reg55);
              reg59 <= ($unsigned($signed(wire54[(3'h4):(2'h3)])) ?
                  {$signed($unsigned((reg56 ?
                          reg56 : reg58)))} : wire52[(3'h6):(3'h6)]);
              reg60 <= $signed(reg58[(3'h4):(1'h1)]);
            end
          else
            begin
              reg58 <= wire54[(4'ha):(1'h0)];
              reg59 <= $unsigned((|$signed(reg59)));
              reg60 <= $signed(wire54[(4'ha):(2'h2)]);
              reg61 <= reg60;
            end
        end
      else
        begin
          if (wire54)
            begin
              reg55 <= ($signed(((~|{reg58, reg58}) ?
                  {$unsigned(wire51)} : $unsigned((wire49 ?
                      (8'hbb) : reg59)))) >> wire54[(3'h7):(3'h7)]);
              reg56 <= $unsigned({((wire54 != $unsigned(wire53)) ?
                      reg55[(4'h8):(3'h4)] : ((reg61 ?
                          (8'hb9) : reg57) ~^ wire51[(1'h1):(1'h1)]))});
              reg57 <= reg61[(2'h3):(1'h1)];
              reg58 <= ($unsigned((7'h42)) && wire54);
              reg59 <= {(|$unsigned((wire53[(1'h1):(1'h1)] >> (wire51 * reg56))))};
            end
          else
            begin
              reg55 <= reg57;
              reg56 <= reg55;
              reg57 <= $unsigned(($signed($unsigned($unsigned(wire54))) ?
                  ({$signed(reg56), (wire52 ? wire54 : reg58)} ?
                      ({wire49,
                          wire49} * $signed(reg59)) : wire51[(1'h1):(1'h1)]) : ((wire54 >>> (|(8'hb2))) ?
                      $unsigned((reg59 & reg58)) : wire54)));
              reg58 <= (~^(((~wire52[(5'h10):(1'h1)]) ?
                  reg60[(3'h4):(2'h2)] : reg57[(2'h3):(2'h3)]) * (({wire51,
                          (8'ha7)} ?
                      $signed(reg56) : (reg58 < wire51)) ?
                  wire50[(2'h2):(2'h2)] : $unsigned($signed(reg56)))));
            end
          reg60 <= wire53;
        end
      reg62 <= (reg57[(4'h8):(4'h8)] < reg55);
      reg63 <= (((((8'ha9) ? (^~wire48) : {reg57, reg59}) ?
              (^~reg57) : ((reg62 >= reg59) ? $signed(wire50) : (~reg57))) ?
          reg55 : {wire51}) * reg55);
    end
  assign wire64 = $unsigned((reg61 ^ (8'hae)));
  assign wire65 = $signed((wire52[(5'h10):(4'hd)] ?
                      (!((wire51 ? wire50 : wire54) >> {reg63,
                          reg63})) : reg63));
  assign wire66 = (|reg60);
  assign wire67 = $signed($unsigned(wire66[(4'h8):(3'h6)]));
  assign wire68 = $signed({($signed($signed(reg62)) ?
                          wire50 : ((reg57 - reg58) >>> (-wire64)))});
endmodule

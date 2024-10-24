module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire80;
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire29,
                 wire30,
                 wire31,
                 wire80,
                 reg85,
                 reg84,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned($signed($unsigned(wire2)));
  assign wire5 = $signed(wire4[(3'h7):(3'h5)]);
  assign wire6 = $signed((wire2[(3'h4):(1'h0)] + (($signed(wire1) ?
                     (wire0 | wire4) : (&wire3)) ^~ $signed($unsigned(wire5)))));
  assign wire7 = $signed($unsigned($unsigned($signed(wire2))));
  always
    @(posedge clk) begin
      reg8 <= wire3[(2'h3):(2'h3)];
      reg9 <= (~&wire6[(2'h2):(2'h2)]);
      reg10 <= $signed(((wire7 << $unsigned((wire4 ?
          wire1 : reg9))) << $signed((8'ha1))));
      reg11 <= wire6[(3'h5):(2'h2)];
      reg12 <= $signed(wire3);
    end
  assign wire13 = wire5;
  assign wire14 = wire0;
  assign wire15 = reg9;
  assign wire16 = $unsigned(((~&wire4) ?
                      $signed(((+(8'hbf)) ?
                          reg11 : (~|reg9))) : $signed(wire2[(1'h0):(1'h0)])));
  assign wire17 = wire3;
  assign wire18 = {wire6, (-$signed(wire17))};
  assign wire19 = {((^~$signed((|wire2))) ?
                          (((wire7 & wire3) ?
                              $signed(reg9) : ((8'h9f) ?
                                  (8'hbd) : wire17)) << ((!reg12) ?
                              (wire7 != wire17) : (&wire2))) : {$unsigned((~wire7)),
                              ((wire4 != wire4) ^ {reg8})})};
  assign wire20 = (^wire0);
  always
    @(posedge clk) begin
      reg21 <= wire17;
      reg22 <= wire18;
    end
  always
    @(posedge clk) begin
      reg23 <= wire6[(2'h3):(2'h2)];
      if ($unsigned($unsigned((^(|{wire16})))))
        begin
          reg24 <= (~&{$unsigned($unsigned($unsigned(wire3)))});
          if (reg11)
            begin
              reg25 <= $signed($unsigned($signed((8'ha0))));
              reg26 <= $signed((({(reg22 | (8'h9c))} ?
                  {$signed(wire17),
                      $signed(wire2)} : $signed((wire15 | wire0))) << (8'hae)));
              reg27 <= (wire1 | reg10[(4'ha):(1'h1)]);
              reg28 <= $unsigned({$signed(wire0[(1'h1):(1'h1)])});
            end
          else
            begin
              reg25 <= {((-(wire15 ?
                      $signed(reg21) : (wire17 ?
                          wire0 : (8'haa)))) << (^~$signed($unsigned((8'hba)))))};
              reg26 <= reg25;
            end
        end
      else
        begin
          reg24 <= (((~|(wire1 || (wire13 ?
              wire4 : reg22))) != reg24) >> $signed(((~&{reg10}) >= (-$unsigned(wire14)))));
          reg25 <= reg23;
          reg26 <= wire4[(1'h1):(1'h1)];
          reg27 <= reg9;
        end
    end
  assign wire29 = reg12;
  assign wire30 = (reg10 ?
                      $unsigned((wire17 ?
                          ((reg8 && reg10) ?
                              $unsigned((8'h9f)) : reg12) : (~&$signed((8'hb0))))) : $unsigned(($unsigned({wire1}) ?
                          wire20[(3'h4):(1'h0)] : {$signed(wire29)})));
  assign wire31 = ($signed(reg22[(3'h7):(3'h5)]) >= $unsigned($unsigned((reg27[(4'he):(3'h6)] >= (wire14 ?
                      reg28 : reg24)))));
  module32 #() modinst81 (.wire34(reg8), .wire37(wire13), .wire33(reg23), .clk(clk), .wire35(wire19), .wire36(wire20), .y(wire80));
  assign wire82 = wire0[(3'h4):(2'h3)];
  assign wire83 = (($signed(wire19[(5'h15):(4'hd)]) >>> (((&reg22) ?
                              reg25 : {reg25, reg28}) ?
                          ($unsigned(reg10) >= {reg22,
                              reg24}) : (|(~&wire17)))) ?
                      $unsigned((-((-wire20) || wire13[(3'h6):(3'h6)]))) : wire29);
  always
    @(posedge clk) begin
      reg84 <= reg22[(3'h6):(1'h1)];
      reg85 <= ($unsigned($signed(($unsigned(reg22) ?
          (wire18 != reg28) : $unsigned((8'hb9))))) + $signed(reg11[(1'h0):(1'h0)]));
    end
endmodule

module module32
#(parameter param78 = (((((!(8'hbb)) <<< ((8'haa) >>> (8'haa))) != (+(8'h9d))) ~^ {(((8'ha5) ? (8'hb5) : (8'hae)) ^~ {(8'hb5)})}) << (!(~(((8'hb0) ^ (8'hb6)) ? ((8'ha3) ? (8'hae) : (8'hb8)) : ((8'hb9) <= (8'h9c)))))), 
parameter param79 = ((param78 ? (((&param78) ? param78 : {(8'ha8), param78}) ? (8'hac) : param78) : {(param78 ? (~|param78) : (param78 != param78)), ((param78 <= param78) >= ((8'haa) ? param78 : (8'h9f)))}) <= param78))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  assign y = {wire76, wire43, wire42, wire41, wire40, wire39, wire38, (1'h0)};
  assign wire38 = wire35[(4'hb):(2'h3)];
  assign wire39 = $unsigned((&wire34[(4'hc):(4'h9)]));
  assign wire40 = (~^wire37[(2'h2):(1'h0)]);
  assign wire41 = {{wire39[(3'h4):(1'h1)]}};
  assign wire42 = $unsigned((wire40[(2'h3):(1'h0)] ?
                      (($signed(wire33) <= (wire33 ?
                          (8'hbc) : wire37)) > wire37) : $unsigned((8'hba))));
  assign wire43 = $signed({((wire36 ^ {wire39,
                          wire37}) <<< (&$signed(wire41)))});
  module44 #() modinst77 (wire76, clk, wire36, wire37, wire35, wire39);
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire48;
  input wire [(4'hc):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg71,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= (&($signed((-{wire47, wire48})) ?
          (^~$unsigned($unsigned(wire48))) : $signed(wire47[(3'h6):(3'h5)])));
      if (((^{wire48[(3'h4):(2'h3)],
          (wire48 ?
              $unsigned(wire46) : (wire47 | (8'hb2)))}) > $unsigned(($unsigned($signed(reg49)) - wire47[(3'h5):(3'h4)]))))
        begin
          if ({(8'ha0)})
            begin
              reg50 <= $signed(($unsigned({(!wire47)}) >= $signed(wire46[(1'h0):(1'h0)])));
              reg51 <= wire47[(1'h0):(1'h0)];
              reg52 <= (($unsigned(((wire47 ? wire46 : wire46) ?
                      $signed(reg51) : (+wire45))) ?
                  $unsigned({(wire45 ?
                          (8'ha2) : reg50)}) : wire46) + $unsigned(reg49[(3'h5):(2'h3)]));
              reg53 <= ($unsigned($signed((8'hae))) ?
                  $signed($signed($signed($unsigned(wire45)))) : $signed((7'h41)));
            end
          else
            begin
              reg50 <= (+(^~(reg50 >>> wire45)));
            end
          reg54 <= wire47;
          reg55 <= $unsigned({($unsigned(reg52) ^~ $unsigned((!reg50)))});
          reg56 <= $unsigned(reg55[(3'h6):(1'h1)]);
          reg57 <= (8'haf);
        end
      else
        begin
          reg50 <= wire46[(4'h8):(2'h3)];
          if ((&$unsigned(($signed({wire45}) ?
              reg55 : $unsigned((reg52 ? wire47 : reg56))))))
            begin
              reg51 <= $unsigned((reg56 ?
                  reg53[(1'h1):(1'h0)] : ((~&{wire46}) ^~ (^~(reg54 && (8'ha8))))));
              reg52 <= ($signed(reg55[(3'h5):(3'h5)]) ?
                  (($signed((reg50 ? reg49 : (7'h43))) != reg55) ?
                      $unsigned({(~&reg53)}) : $signed(wire47[(4'hb):(3'h7)])) : reg55[(1'h1):(1'h0)]);
            end
          else
            begin
              reg51 <= $unsigned(reg56[(4'h9):(2'h2)]);
              reg52 <= (wire46[(1'h1):(1'h1)] < $signed($signed(((~|reg53) == $signed(reg55)))));
            end
          reg53 <= ($signed(((!(reg56 ? reg54 : reg52)) ?
              {(wire48 >> reg49)} : wire47)) >>> (((reg50 ?
                  (^reg57) : (wire45 - reg52)) ?
              $unsigned((wire48 >>> reg55)) : $signed((wire45 ?
                  reg50 : (8'hb2)))) <= (({reg49} ?
              ((8'hae) < reg50) : (reg52 ?
                  reg51 : reg56)) || $signed($unsigned(wire46)))));
          reg54 <= ($signed(reg49[(3'h5):(2'h3)]) ^~ reg56);
          reg55 <= ((^((-(reg50 - wire47)) * (-(wire45 ? reg53 : wire45)))) ?
              reg56[(5'h10):(2'h3)] : $signed($signed(wire45[(3'h6):(1'h1)])));
        end
      if (((reg56 > (((reg51 || reg56) ?
          reg54[(3'h4):(2'h3)] : $unsigned(reg56)) ~^ $signed((wire45 ?
          (7'h42) : wire46)))) | $signed(reg54)))
        begin
          if (($unsigned(wire46) >>> wire47[(3'h7):(3'h5)]))
            begin
              reg58 <= $signed((|reg54));
              reg59 <= ($signed(wire46) ?
                  (reg58[(3'h7):(3'h4)] != ((~|(reg52 < wire47)) < {reg56})) : {reg49[(3'h5):(3'h4)],
                      (((reg58 ^ wire48) > $unsigned((8'ha3))) != (reg52[(3'h4):(2'h3)] ?
                          (reg57 ? reg58 : reg58) : (wire47 ?
                              wire48 : reg58)))});
              reg60 <= $unsigned({reg55});
              reg61 <= $unsigned($unsigned(($unsigned((+(8'hba))) <<< ((reg55 ?
                  reg52 : (8'hbb)) <<< (reg55 ? reg54 : reg56)))));
            end
          else
            begin
              reg58 <= (~reg56[(5'h13):(2'h3)]);
            end
          reg62 <= wire46[(4'h8):(1'h1)];
          reg63 <= (($signed(reg52) != (reg50[(3'h4):(1'h1)] ?
                  reg59 : (-$signed(reg49)))) ?
              ((^~$signed(((8'hbd) & reg58))) ?
                  $signed($unsigned((~|wire47))) : $signed(reg54)) : (^~($signed(reg57) ?
                  $signed($unsigned(reg56)) : $unsigned($unsigned(reg59)))));
        end
      else
        begin
          reg58 <= reg59;
          reg59 <= {reg53, reg49};
          reg60 <= $unsigned((-(reg62[(1'h0):(1'h0)] ?
              wire47 : $signed((reg63 * wire45)))));
          reg61 <= {(reg50 & $signed($unsigned($unsigned(reg60)))),
              $signed((reg63[(3'h4):(1'h0)] ?
                  wire47[(1'h1):(1'h0)] : (8'hbc)))};
          reg62 <= (((!($signed(reg52) ? (8'hae) : wire46)) >>> reg55) ?
              (($unsigned(wire46[(3'h6):(2'h2)]) ?
                  reg52[(4'h8):(2'h2)] : $unsigned((!wire48))) <= {$unsigned(reg61)}) : $unsigned(reg62));
        end
      if (($signed((~&($unsigned(reg56) ? (wire48 * reg50) : reg51))) ?
          $unsigned(($unsigned((reg49 ? reg54 : reg61)) ?
              $signed($signed((8'ha0))) : reg58[(2'h2):(1'h1)])) : {$unsigned($signed(reg59)),
              reg53[(2'h2):(1'h0)]}))
        begin
          reg64 <= reg53[(1'h1):(1'h0)];
        end
      else
        begin
          reg64 <= reg61;
          if ($unsigned($signed($signed({(-reg60), (wire47 - reg55)}))))
            begin
              reg65 <= $signed(((-((reg51 || reg51) & wire48[(1'h1):(1'h0)])) ^ $signed(((~&(8'hb5)) ?
                  reg57[(2'h3):(1'h1)] : (reg55 ? (8'hb6) : reg51)))));
              reg66 <= {reg59, wire46[(4'h9):(3'h6)]};
              reg67 <= {$unsigned((~^{reg54[(3'h5):(2'h3)], (&reg55)})),
                  (reg56[(5'h11):(4'hd)] ?
                      reg57[(1'h0):(1'h0)] : $unsigned(reg51))};
              reg68 <= {($unsigned(((reg61 ? (8'ha6) : reg54) ?
                      reg59 : reg53[(2'h3):(1'h0)])) << {reg67})};
            end
          else
            begin
              reg65 <= (+(reg58[(3'h7):(3'h5)] <= {{reg52, (~|wire45)}}));
              reg66 <= wire48;
              reg67 <= (~&(!(~|($signed(reg65) ?
                  ((8'hbd) || reg57) : (wire46 && reg58)))));
            end
          reg69 <= wire45;
          reg70 <= reg53;
        end
      reg71 <= $unsigned((($unsigned($unsigned(reg65)) ?
          (&(reg63 ?
              wire47 : reg63)) : ((^~(8'ha8)) || reg62)) == ($signed({wire46,
              (8'hb8)}) ?
          $signed((reg67 - reg53)) : $signed(reg52[(3'h6):(2'h2)]))));
    end
  assign wire72 = (({(~reg60)} | {$signed({reg50}),
                      {reg55, wire47}}) >>> ({(~^(+reg65))} ?
                      {reg64} : (((reg57 ? (8'hb7) : reg52) ?
                              $unsigned(wire47) : (reg62 ^~ (8'hbe))) ?
                          $signed((^~reg49)) : (8'ha3))));
  assign wire73 = $signed((reg59 ?
                      (reg54[(4'hb):(3'h6)] < (reg52[(4'h8):(2'h2)] == (reg51 <= reg65))) : reg56));
  assign wire74 = reg50;
  assign wire75 = (reg59 ?
                      ($signed($signed($signed(reg71))) - reg56) : $signed((-$unsigned((reg55 >= reg50)))));
endmodule

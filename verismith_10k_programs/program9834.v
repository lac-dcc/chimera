module top
#(parameter param205 = (!(-(~^(~^((8'ha3) >> (8'hbc)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire204;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire189;
  wire signed [(5'h13):(1'h0)] wire200;
  wire [(2'h3):(1'h0)] wire201;
  wire signed [(3'h6):(1'h0)] wire202;
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg199 = (1'h0);
  assign y = {wire204,
                 wire4,
                 wire5,
                 wire19,
                 wire20,
                 wire82,
                 wire84,
                 wire86,
                 wire187,
                 wire189,
                 wire200,
                 wire201,
                 wire202,
                 reg85,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 (1'h0)};
  assign wire4 = ((&$unsigned((8'hbb))) >>> (+wire3));
  assign wire5 = (wire0 >> (!(+{$unsigned(wire1), $unsigned(wire3)})));
  always
    @(posedge clk) begin
      if ((8'ha0))
        begin
          reg6 <= (~^(wire1[(1'h1):(1'h0)] + (+{$signed(wire3),
              wire2[(1'h1):(1'h1)]})));
          reg7 <= {(~^$signed($signed((~^wire3))))};
          if ($unsigned(($signed({wire3}) ~^ {((wire0 ? wire4 : reg6) ?
                  (-wire3) : (7'h43)),
              ((wire3 ? reg7 : wire3) && $unsigned(wire3))})))
            begin
              reg8 <= (~(!(wire3[(4'hf):(1'h1)] ?
                  $signed(((8'h9c) ? wire2 : wire5)) : ({wire1,
                      wire5} && (~wire2)))));
              reg9 <= reg6[(1'h0):(1'h0)];
              reg10 <= $signed(wire5[(3'h6):(3'h4)]);
              reg11 <= (wire2 ?
                  ((~&(((8'hb6) * wire0) || ((8'h9c) && (8'h9f)))) ?
                      (~|$unsigned($unsigned(reg9))) : ($signed((+reg10)) ?
                          wire1 : (reg6 <= $signed(reg10)))) : $signed((wire5[(3'h6):(3'h6)] <<< wire0)));
              reg12 <= $signed(($unsigned($unsigned((reg7 ?
                  wire4 : reg11))) || ((8'hbc) + reg9[(4'hc):(4'hc)])));
            end
          else
            begin
              reg8 <= (((wire5 & wire1) ?
                  ($signed(((8'h9f) ? wire1 : wire4)) ?
                      reg12 : reg6) : $unsigned(wire2)) < reg6);
              reg9 <= ((~&$signed(wire2[(4'hf):(3'h6)])) ?
                  (reg8[(1'h0):(1'h0)] >= (~&(^~((8'had) ?
                      reg7 : reg9)))) : reg12);
              reg10 <= ((-(((wire2 ? wire2 : wire0) ?
                      wire3 : (wire3 ? reg8 : (8'ha6))) ?
                  wire1[(2'h2):(1'h0)] : $signed($unsigned(wire2)))) >> reg8);
              reg11 <= (8'hb1);
            end
          reg13 <= {{{reg7[(3'h6):(2'h3)], reg8[(1'h1):(1'h1)]}}};
          reg14 <= reg10;
        end
      else
        begin
          if ($signed((8'h9f)))
            begin
              reg6 <= wire5[(1'h0):(1'h0)];
              reg7 <= (8'hb6);
              reg8 <= (^(|($signed({(8'ha6), wire0}) - wire5)));
            end
          else
            begin
              reg6 <= reg11;
              reg7 <= ((8'hb6) - $unsigned(wire3));
            end
          reg9 <= (wire1 + wire0[(3'h5):(2'h2)]);
          reg10 <= ($signed($unsigned(($unsigned((8'ha3)) ?
              $unsigned(wire2) : {reg14}))) <= reg8);
        end
      reg15 <= $unsigned(reg7);
      reg16 <= (~&wire4[(4'hb):(3'h7)]);
      reg17 <= (reg12[(2'h3):(2'h3)] | reg10);
      reg18 <= ((reg15 ?
          reg15[(5'h11):(5'h11)] : {((~&reg13) ?
                  (wire3 || reg7) : (~^reg13))}) != reg16[(3'h6):(3'h6)]);
    end
  assign wire19 = ((~|$signed(({wire2} ?
                      $unsigned(reg7) : (^~wire0)))) == {(-wire4)});
  assign wire20 = $unsigned((&reg7));
  module21 #() modinst83 (wire82, clk, wire1, reg18, reg16, wire4);
  assign wire84 = $signed(wire4);
  always
    @(posedge clk) begin
      reg85 <= (wire2 ?
          $signed((~&$signed((7'h44)))) : ($unsigned($signed($unsigned(wire5))) > (^~reg11)));
    end
  assign wire86 = wire3[(3'h4):(1'h0)];
  module87 #() modinst188 (wire187, clk, wire19, wire86, reg7, reg11);
  module45 #() modinst190 (.wire48(reg85), .wire50(wire187), .wire49(wire82), .clk(clk), .y(wire189), .wire47(wire2), .wire46(wire84));
  always
    @(posedge clk) begin
      if (wire84[(3'h6):(2'h3)])
        begin
          reg191 <= (7'h40);
          reg192 <= reg9[(1'h1):(1'h0)];
          reg193 <= {wire187,
              $unsigned(((!((8'hbc) ^ reg6)) < (((8'hb3) || reg10) - wire1)))};
          reg194 <= ((reg7[(3'h5):(1'h1)] <= $signed(reg8)) ?
              (!$signed(((^~wire1) + (|(8'hb2))))) : (&(reg9 ?
                  reg85 : (8'ha3))));
          if ((~|wire82[(3'h5):(1'h0)]))
            begin
              reg195 <= $unsigned((&{$signed($signed(wire84)),
                  (((8'hac) ? reg11 : reg6) ?
                      {wire19, wire19} : $signed(wire5))}));
              reg196 <= $signed(reg9);
            end
          else
            begin
              reg195 <= {reg11[(2'h2):(2'h2)],
                  $signed($unsigned(({reg9} ? $unsigned(reg192) : (!reg192))))};
              reg196 <= (wire0 ?
                  (^($signed($signed((8'ha0))) ?
                      $unsigned({reg194, (8'ha9)}) : ((~wire20) ?
                          wire20[(5'h13):(5'h10)] : (!reg18)))) : ($signed((8'hb3)) ?
                      $unsigned((reg18[(1'h0):(1'h0)] ?
                          $signed(wire4) : $signed(reg15))) : wire4[(4'ha):(3'h5)]));
            end
        end
      else
        begin
          reg191 <= ((reg196 ? {wire0} : wire189) ?
              (reg85 > $unsigned(wire5)) : (wire189[(4'hb):(4'hb)] ?
                  {$unsigned(reg16[(2'h3):(2'h3)])} : $unsigned(reg11)));
          reg192 <= reg192[(3'h4):(1'h1)];
          reg193 <= ($signed((!$unsigned((reg14 ? wire86 : wire0)))) ?
              (wire2[(3'h7):(1'h0)] && reg191[(5'h14):(5'h11)]) : reg196);
        end
      reg197 <= reg194;
      reg198 <= $unsigned($unsigned(($signed((^(8'hbb))) ^ reg197[(2'h2):(1'h1)])));
      reg199 <= wire20[(5'h10):(4'h9)];
    end
  assign wire200 = reg10;
  assign wire201 = $signed(wire187[(4'ha):(2'h3)]);
  module21 #() modinst203 (.wire22(wire4), .y(wire202), .clk(clk), .wire23(reg13), .wire25(reg6), .wire24(reg197));
  assign wire204 = ((wire0[(3'h6):(3'h5)] == {{$unsigned(reg11),
                           {wire82, wire2}}}) >> wire0[(1'h1):(1'h1)]);
endmodule

module module87  (y, clk, wire88, wire89, wire90, wire91);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire88;
  input wire [(4'he):(1'h0)] wire89;
  input wire signed [(3'h6):(1'h0)] wire90;
  input wire [(4'he):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire184;
  reg signed [(4'h8):(1'h0)] reg186 = (1'h0);
  assign y = {wire92, wire93, wire94, wire95, wire184, reg186, (1'h0)};
  assign wire92 = wire88;
  assign wire93 = ({$signed({$unsigned(wire90)}),
                      (-$signed((wire88 ?
                          wire90 : wire91)))} + wire91[(2'h3):(2'h3)]);
  assign wire94 = $signed((8'h9d));
  assign wire95 = (-$signed((($signed(wire91) ?
                      $signed(wire94) : (|wire94)) + wire91[(1'h1):(1'h0)])));
  module96 #() modinst185 (wire184, clk, wire91, wire88, wire92, wire90, wire94);
  always
    @(posedge clk) begin
      reg186 <= $unsigned(wire90[(2'h2):(1'h1)]);
    end
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire43;
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire80, wire26, wire29, wire43, reg28, reg27, (1'h0)};
  assign wire26 = wire22[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg27 <= (+(~|{$unsigned(wire23)}));
      reg28 <= ((^$signed((~&wire25))) ~^ $unsigned((wire26 <<< $signed($signed(reg27)))));
    end
  assign wire29 = (^~((wire22 & (wire24 ?
                          ((8'hb8) ? wire24 : wire25) : (wire22 || (8'ha4)))) ?
                      ((&reg27[(2'h3):(1'h0)]) + ((wire22 ? reg28 : reg28) ?
                          (|reg27) : {reg27})) : ((wire22 - $unsigned(reg27)) ?
                          {$unsigned(wire22),
                              $signed(reg28)} : wire23[(3'h4):(2'h2)])));
  module30 #() modinst44 (wire43, clk, wire24, reg28, wire25, wire22);
  module45 #() modinst81 (.clk(clk), .y(wire80), .wire46(wire23), .wire50(wire24), .wire48(wire25), .wire49(wire22), .wire47(reg28));
endmodule

module module45
#(parameter param78 = (^(~^((!((8'hbe) <= (8'ha9))) ? ((~(8'hac)) + {(8'hbb)}) : (8'had)))), 
parameter param79 = ((8'hae) & param78))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire50;
  input wire signed [(2'h3):(1'h0)] wire49;
  input wire signed [(2'h2):(1'h0)] wire48;
  input wire signed [(4'h8):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire53,
                 wire52,
                 wire51,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  assign wire51 = ($signed({(~(wire49 ?
                          wire46 : wire49))}) <<< ((-(wire50 > (8'hbf))) ^~ $unsigned(wire46[(2'h3):(1'h0)])));
  assign wire52 = $signed((wire51[(2'h2):(1'h1)] && ($unsigned({wire48}) ?
                      (!$unsigned((8'hab))) : (wire50 && $signed(wire46)))));
  assign wire53 = ((($unsigned($signed(wire47)) > (+(wire51 + wire46))) ?
                          ($unsigned((wire46 ?
                              wire52 : wire47)) ~^ (((8'hab) >>> wire49) ?
                              (wire49 >> wire51) : $signed(wire52))) : ({(wire47 ?
                                  wire46 : wire48)} ^~ $unsigned(((8'hb6) ?
                              wire52 : wire50)))) ?
                      wire48[(1'h0):(1'h0)] : (((!(~^wire52)) <<< wire49[(1'h1):(1'h0)]) ?
                          (((wire48 >>> wire51) ? wire49 : $unsigned(wire50)) ?
                              $unsigned(wire48[(2'h2):(1'h0)]) : wire49[(2'h2):(2'h2)]) : ($unsigned(wire49) ?
                              (wire52 ?
                                  $unsigned(wire48) : (|wire48)) : ($signed(wire48) || {wire48,
                                  wire50}))));
  always
    @(posedge clk) begin
      if ((^~((wire49 << (8'h9d)) ? (|(8'hb1)) : wire52[(3'h6):(3'h6)])))
        begin
          reg54 <= {wire51[(3'h7):(2'h3)]};
          if ($signed({($signed($signed(reg54)) ?
                  ((~&wire47) ?
                      (!reg54) : $signed(wire51)) : wire47[(2'h2):(1'h1)])}))
            begin
              reg55 <= $unsigned(($signed(reg54[(5'h11):(3'h4)]) << wire46[(2'h2):(2'h2)]));
              reg56 <= $unsigned($unsigned(($signed((wire51 ?
                  wire52 : reg55)) << ((^~(8'hb1)) ?
                  (!(8'had)) : (~|(8'h9c))))));
              reg57 <= (($unsigned((((7'h44) <<< wire50) ?
                  (8'haf) : reg54[(4'hb):(4'ha)])) - reg55[(1'h1):(1'h0)]) > {{$unsigned(wire53[(3'h7):(1'h1)])}});
              reg58 <= (($unsigned($unsigned({wire49})) << (|{$signed(wire52)})) ?
                  reg54 : ((reg57[(3'h4):(3'h4)] ?
                          wire48[(1'h0):(1'h0)] : ({reg55} * (reg56 * (8'hae)))) ?
                      $unsigned(reg56[(3'h4):(3'h4)]) : wire47[(3'h4):(2'h3)]));
              reg59 <= (~|reg57[(3'h5):(3'h4)]);
            end
          else
            begin
              reg55 <= wire48;
              reg56 <= $signed($signed(wire50[(2'h2):(2'h2)]));
              reg57 <= $signed($signed($unsigned(reg55)));
            end
          reg60 <= wire51;
          reg61 <= ((&$signed((((8'ha8) ? wire49 : reg58) ?
              $signed(wire53) : {reg58, (8'hb8)}))) >>> (|reg56));
          reg62 <= reg56[(1'h1):(1'h0)];
        end
      else
        begin
          reg54 <= (+(+$signed(wire51[(2'h2):(1'h0)])));
          if ({$unsigned(((~^wire47[(1'h1):(1'h0)]) ?
                  $unsigned((reg58 ?
                      reg56 : wire46)) : ((!wire49) != (reg62 <= (8'haf)))))})
            begin
              reg55 <= reg62[(3'h7):(2'h2)];
              reg56 <= $unsigned($unsigned({wire46}));
            end
          else
            begin
              reg55 <= $unsigned(reg60);
              reg56 <= (wire46 <= {$unsigned(({(8'ha1),
                      reg56} ^~ reg60[(4'hd):(4'hb)]))});
              reg57 <= $signed(reg55);
            end
          reg58 <= {$signed(reg57[(2'h2):(1'h1)]),
              $unsigned((wire46 | $signed(wire48[(1'h1):(1'h0)])))};
          reg59 <= reg57[(3'h4):(2'h2)];
          reg60 <= ($signed((reg55[(3'h4):(1'h0)] ?
              (!{reg57,
                  (8'ha3)}) : $signed(wire48))) ^~ ((!((reg55 ^ reg54) <= $unsigned(wire47))) >> (reg54 ?
              (!(&wire46)) : $unsigned($signed(reg60)))));
        end
      reg63 <= (~^wire52[(4'ha):(4'h9)]);
      reg64 <= reg56[(4'h8):(2'h2)];
      reg65 <= {reg58, (^~($signed($signed(reg64)) * $signed(reg64)))};
      reg66 <= $unsigned($signed(wire52));
    end
  assign wire67 = $unsigned((~&(wire51[(4'hd):(2'h3)] ?
                      reg65 : (reg64[(4'hd):(1'h1)] > wire46))));
  assign wire68 = $signed((({(reg66 ~^ reg65), reg60} ?
                          $signed($signed(reg54)) : $signed(wire50[(1'h1):(1'h0)])) ?
                      ($signed((~|wire53)) ?
                          reg65[(1'h0):(1'h0)] : {$signed(reg54),
                              $unsigned(wire67)}) : reg64));
  assign wire69 = $signed(reg65[(1'h0):(1'h0)]);
  assign wire70 = (8'hac);
  assign wire71 = (wire67[(4'ha):(1'h1)] || ($signed((&$unsigned(wire69))) ?
                      (((!wire67) <= (wire69 ?
                          (8'ha4) : reg65)) ^ (|$unsigned(reg58))) : {$unsigned((8'hb6))}));
  always
    @(posedge clk) begin
      reg72 <= $unsigned(wire52[(2'h3):(1'h0)]);
      reg73 <= $signed(reg60);
      reg74 <= $signed(((+$signed((|reg58))) ?
          wire70[(3'h7):(2'h3)] : reg64[(3'h4):(2'h2)]));
      reg75 <= ($signed((&(reg61[(3'h5):(2'h2)] * (reg65 << reg64)))) <<< ((!$unsigned($signed(reg54))) ?
          reg56[(4'h8):(2'h3)] : (!wire53)));
    end
  assign wire76 = (^$unsigned((~^$signed($unsigned((8'hb0))))));
  assign wire77 = reg63;
endmodule

module module30
#(parameter param42 = (~(~&((&(-(8'haa))) ? {((8'hb2) ? (8'hab) : (8'hb2))} : (~^(!(7'h41)))))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire [(3'h6):(1'h0)] wire32;
  input wire [(4'h9):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  assign y = {wire41, wire40, wire39, wire38, wire37, wire36, wire35, (1'h0)};
  assign wire35 = (^~{$unsigned(((wire32 && wire34) & wire33)),
                      $signed(wire34[(4'h9):(2'h3)])});
  assign wire36 = wire34;
  assign wire37 = $signed($signed(wire31[(3'h6):(1'h1)]));
  assign wire38 = ((|$signed(($unsigned(wire32) ?
                          (8'h9d) : $signed((8'hbc))))) ?
                      $signed(($signed((wire33 + wire33)) - wire34)) : (wire34[(4'ha):(3'h5)] * $signed($unsigned((^wire32)))));
  assign wire39 = $signed((-{$signed((wire33 ? wire33 : (7'h44)))}));
  assign wire40 = (&((wire38 ?
                      ($unsigned((8'ha1)) < wire31[(1'h1):(1'h0)]) : ($signed(wire35) ^~ wire32[(2'h3):(2'h2)])) >> wire31));
  assign wire41 = $signed(((wire31 - $signed(wire38)) ?
                      ((wire36[(4'he):(4'hc)] != (wire32 ?
                          wire36 : wire40)) == wire36[(2'h2):(1'h0)]) : ({(wire31 ?
                              wire36 : wire34)} <= $signed(wire31))));
endmodule

module module96
#(parameter param182 = (^(^(|{((8'haa) ? (7'h42) : (8'h9e)), ((8'hbf) ? (8'hb0) : (8'ha7))}))), 
parameter param183 = {({(!(param182 && param182))} > (~^(((8'hb3) >>> param182) ? (param182 ? param182 : param182) : param182)))})
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h390):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire101;
  input wire signed [(5'h15):(1'h0)] wire100;
  input wire [(4'hc):(1'h0)] wire99;
  input wire signed [(3'h5):(1'h0)] wire98;
  input wire [(5'h13):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(5'h14):(1'h0)] wire180;
  wire signed [(4'hf):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire159;
  wire signed [(5'h15):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire signed [(5'h10):(1'h0)] wire155;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(5'h13):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  reg signed [(3'h4):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire140,
                 wire139,
                 wire122,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire102 = wire101;
  assign wire103 = (^~((!((8'hac) * $unsigned(wire101))) ?
                       (|$signed((wire101 >= wire99))) : $signed(wire100[(5'h11):(4'hc)])));
  assign wire104 = {((~|wire99[(2'h2):(1'h0)]) | wire99),
                       $signed($signed((wire99[(3'h7):(1'h0)] || $unsigned(wire101))))};
  assign wire105 = $signed({wire101,
                       ({(wire99 <= wire97)} ?
                           $unsigned((wire102 ?
                               wire97 : wire102)) : $signed((!wire103)))});
  assign wire106 = wire104[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg107 <= $unsigned(wire102);
      if ($signed(($signed(((&wire102) + $unsigned(wire103))) ?
          (~|$signed(wire106[(2'h2):(1'h1)])) : (8'hb6))))
        begin
          reg108 <= {wire106, reg107};
          reg109 <= $unsigned(({((|wire104) ?
                      {(8'haf)} : (wire98 ? wire106 : wire100))} ?
              reg108 : wire99[(3'h5):(2'h2)]));
          reg110 <= (~|(($unsigned((wire99 ~^ reg107)) ?
              (~^(wire97 <<< wire105)) : (^(wire106 ?
                  wire104 : wire103))) > (+$signed({wire97}))));
        end
      else
        begin
          reg108 <= ((&(wire100[(4'hf):(4'hf)] ? $signed(wire102) : wire104)) ?
              $signed({(|reg108[(1'h0):(1'h0)]),
                  ({wire102, wire103} ?
                      (8'had) : $signed(wire101))}) : $signed(((wire97 ^~ $signed(wire103)) ?
                  $unsigned((&(8'hbf))) : (wire102 > (reg109 ?
                      reg108 : (8'hbd))))));
          reg109 <= $signed((!(wire104[(4'h9):(1'h0)] ?
              (reg110[(3'h6):(2'h3)] ?
                  wire100 : wire99) : ($unsigned(wire106) & (~|wire104)))));
          reg110 <= wire105[(3'h5):(2'h2)];
          reg111 <= $unsigned($signed((8'hb3)));
          reg112 <= ((-wire99) ?
              {($unsigned((wire104 ?
                      reg110 : (8'hac))) & (wire102[(5'h10):(2'h2)] >>> $signed((8'ha6)))),
                  $unsigned(((~|reg107) && (reg111 ^ wire104)))} : (-{reg107[(4'h8):(2'h3)]}));
        end
      if (($signed(($signed(reg110) ?
          ((reg108 >>> wire105) ?
              reg107[(1'h1):(1'h0)] : wire105) : reg111[(3'h5):(1'h1)])) * $signed($unsigned(($unsigned(wire100) != reg112[(3'h4):(1'h0)])))))
        begin
          reg113 <= $signed($unsigned(wire97));
        end
      else
        begin
          reg113 <= reg108;
          if (wire101)
            begin
              reg114 <= $signed($signed((&(&(wire99 >> reg108)))));
              reg115 <= (reg110[(4'ha):(1'h0)] ?
                  ((wire100 * {(reg111 || wire98)}) ~^ ($signed($unsigned(wire101)) ?
                      ({wire100,
                          wire97} <= $signed(reg111)) : wire98[(1'h0):(1'h0)])) : $signed(wire97[(2'h3):(2'h2)]));
              reg116 <= reg107;
              reg117 <= $signed($signed($unsigned((wire105 ?
                  wire106[(4'hb):(2'h2)] : (reg108 == reg112)))));
            end
          else
            begin
              reg114 <= (^(|(^~reg110)));
            end
          if (wire102[(1'h0):(1'h0)])
            begin
              reg118 <= reg113;
              reg119 <= $signed((~&reg117[(3'h7):(2'h2)]));
              reg120 <= ({reg109[(1'h1):(1'h1)],
                      $unsigned((|$signed(wire99)))} ?
                  {$signed({(reg110 && reg111)}),
                      reg107} : ((~^(wire99[(3'h7):(2'h3)] ~^ {reg107})) || (-$signed($unsigned(reg113)))));
            end
          else
            begin
              reg118 <= ((!$signed({(reg109 ? reg107 : (8'ha4)),
                  $signed(wire100)})) && (wire99[(1'h0):(1'h0)] >>> $signed(((reg115 ?
                      reg109 : reg112) ?
                  $unsigned(reg115) : (|reg109)))));
              reg119 <= $unsigned($signed($signed((~$unsigned(reg112)))));
              reg120 <= ((reg108 - reg119[(5'h14):(3'h5)]) ?
                  ($unsigned($signed((8'hb9))) ?
                      $unsigned($unsigned((wire106 + reg108))) : ({(!wire97)} < {(wire105 ?
                              reg120 : reg115),
                          (+reg109)})) : ($unsigned(($unsigned(wire101) ?
                      reg119[(5'h10):(4'hc)] : wire101[(4'hc):(2'h3)])) < $signed(reg120[(4'hb):(4'hb)])));
            end
          reg121 <= $unsigned($signed($unsigned((wire103[(2'h2):(2'h2)] ?
              $signed(reg117) : (reg114 ? reg110 : reg110)))));
        end
    end
  assign wire122 = $signed($signed($unsigned(({wire102} ^ reg118))));
  always
    @(posedge clk) begin
      if (wire105)
        begin
          reg123 <= $signed(wire98);
          reg124 <= (^~(wire101 <= wire106));
          reg125 <= (-(!((((8'hae) ? reg123 : (8'ha5)) ^ $unsigned(reg117)) ?
              $signed(wire104[(1'h0):(1'h0)]) : $unsigned((wire100 ?
                  (8'ha6) : reg108)))));
        end
      else
        begin
          reg123 <= reg113;
          if ($unsigned($unsigned((^(^~(^reg117))))))
            begin
              reg124 <= reg120[(1'h0):(1'h0)];
            end
          else
            begin
              reg124 <= ($signed((reg123 || wire101[(3'h6):(2'h3)])) >= wire104);
              reg125 <= (~^(^~(reg112[(4'h8):(3'h6)] ?
                  $unsigned(reg112) : (~|$signed(reg111)))));
              reg126 <= wire100[(4'hd):(3'h6)];
              reg127 <= ($signed((~$unsigned((wire98 ? reg121 : reg125)))) ?
                  (wire98[(3'h4):(1'h1)] ^~ $unsigned({reg121[(4'ha):(2'h2)]})) : wire122);
            end
          reg128 <= $signed(((reg125 == wire105) <<< $signed((reg118[(4'h9):(3'h6)] < (reg109 < reg123)))));
          if ((wire106[(4'ha):(2'h2)] ? reg121 : {reg117[(2'h3):(1'h0)]}))
            begin
              reg129 <= reg107[(4'hd):(4'h8)];
              reg130 <= reg107;
              reg131 <= reg126[(3'h4):(2'h3)];
              reg132 <= ($unsigned($signed(reg108)) ?
                  $signed((8'had)) : reg124[(3'h7):(3'h6)]);
              reg133 <= (wire122[(2'h2):(1'h0)] ^ reg109);
            end
          else
            begin
              reg129 <= $signed($signed((!$unsigned(wire105[(2'h2):(1'h0)]))));
              reg130 <= ((wire99[(3'h5):(3'h4)] >= (!$unsigned((7'h44)))) ?
                  ($signed($signed((~&reg118))) ?
                      {$unsigned($unsigned((8'ha7))),
                          wire103} : ($signed((wire98 ?
                          reg114 : reg123)) != (~|(reg123 + (8'h9e))))) : wire99[(4'hb):(1'h0)]);
              reg131 <= $signed((~($unsigned(((8'hb9) < wire106)) ?
                  (reg121[(3'h7):(2'h3)] & $signed((8'hb4))) : (&wire105))));
            end
        end
      reg134 <= $signed({(~^$signed(((8'hbb) ? reg124 : reg125)))});
      reg135 <= (-$unsigned($signed($unsigned($unsigned(wire101)))));
      if ($signed((!$unsigned((~reg116)))))
        begin
          reg136 <= $unsigned(wire106);
        end
      else
        begin
          reg136 <= (reg109[(2'h2):(1'h1)] | (reg127 ?
              reg108[(4'h8):(4'h8)] : reg121[(4'hb):(3'h7)]));
          reg137 <= reg114[(1'h0):(1'h0)];
        end
      reg138 <= ($signed((!reg112[(3'h5):(1'h1)])) & (~|($unsigned($signed((8'hac))) ?
          $unsigned(reg132[(1'h0):(1'h0)]) : (~&(!reg128)))));
    end
  assign wire139 = (reg133[(3'h4):(2'h2)] ? reg107 : reg131);
  assign wire140 = {((({reg127, (8'had)} ? wire97 : (^reg131)) <<< ({reg137,
                                   reg128} ?
                               $unsigned(reg121) : (~^reg119))) ?
                           (({reg117, wire104} ?
                               $unsigned((8'haf)) : (-(8'hb3))) >= ({reg113} <<< reg138[(5'h10):(4'hd)])) : (|$signed((reg138 ?
                               wire102 : reg123))))};
  always
    @(posedge clk) begin
      reg141 <= $signed($unsigned({(|reg108[(2'h2):(2'h2)])}));
      if (((~^(-(wire101[(2'h3):(2'h2)] ~^ wire98))) ?
          reg110[(4'hf):(1'h0)] : reg119))
        begin
          if (((~(((reg110 ? wire139 : reg118) & $signed(reg117)) ?
                  reg123[(4'hd):(3'h7)] : $signed(wire139[(3'h4):(3'h4)]))) ?
              (((^~$signed(wire103)) ?
                  wire122 : $unsigned(reg115[(3'h4):(1'h0)])) <= ($unsigned((reg137 || reg123)) ?
                  (^reg107) : $signed($unsigned(wire100)))) : wire122))
            begin
              reg142 <= $signed($unsigned(wire103));
              reg143 <= $signed(((^reg112) - (({reg109,
                  wire103} ~^ $unsigned(reg119)) >= $unsigned(reg136))));
              reg144 <= (7'h42);
            end
          else
            begin
              reg142 <= (~^(&($unsigned((wire103 * reg137)) <<< (^wire105))));
              reg143 <= ($signed((($unsigned(reg132) ^ {wire106}) >>> (~^reg113[(4'h8):(1'h1)]))) >> (+reg108[(4'h9):(3'h6)]));
            end
          if (($unsigned(($unsigned(reg142[(5'h10):(4'ha)]) >= (-(wire139 << reg130)))) ?
              reg137 : {$unsigned(reg132)}))
            begin
              reg145 <= reg107;
            end
          else
            begin
              reg145 <= wire103;
              reg146 <= (8'hac);
              reg147 <= (~|$unsigned((-$unsigned((^wire106)))));
            end
          reg148 <= reg131[(1'h1):(1'h0)];
          if ($unsigned(({(!$signed(reg145)),
              ($unsigned(reg145) * wire122)} >= reg110)))
            begin
              reg149 <= (($unsigned((~|wire99)) ?
                  ((wire101 != reg121) ?
                      (~|(reg126 ?
                          wire101 : reg137)) : $unsigned($unsigned(reg116))) : (((wire106 ^ reg133) == (reg118 ?
                          reg144 : wire97)) ?
                      {wire103} : (~|((8'h9e) < reg148)))) | wire122[(1'h0):(1'h0)]);
              reg150 <= $signed(reg112[(2'h2):(1'h1)]);
              reg151 <= (!reg115[(2'h3):(2'h2)]);
            end
          else
            begin
              reg149 <= wire99[(1'h0):(1'h0)];
              reg150 <= (&reg123);
            end
          reg152 <= {wire105[(1'h1):(1'h1)], reg125[(1'h1):(1'h1)]};
        end
      else
        begin
          reg142 <= reg130;
        end
      reg153 <= (8'ha8);
      reg154 <= wire100;
    end
  assign wire155 = $unsigned(reg117[(4'h8):(2'h3)]);
  assign wire156 = $unsigned((($unsigned((reg153 << (7'h43))) & $signed($signed(reg132))) ?
                       $unsigned(reg127[(4'hb):(3'h4)]) : reg111[(3'h5):(1'h1)]));
  assign wire157 = (+reg151[(4'hf):(4'h9)]);
  assign wire158 = (($unsigned(wire139[(5'h10):(4'he)]) + reg137) ?
                       ({$unsigned($unsigned(reg110))} ?
                           $signed($unsigned((reg144 - reg116))) : reg134) : (($signed((^wire122)) >>> ($unsigned(reg107) ~^ reg119[(1'h1):(1'h1)])) ?
                           (reg147[(5'h10):(2'h3)] ^ $signed(wire106)) : {$unsigned(reg147[(4'he):(3'h5)])}));
  assign wire159 = reg109;
  assign wire160 = $unsigned({(^wire106),
                       (~($unsigned(wire97) ?
                           wire157[(4'h8):(3'h4)] : (^wire97)))});
  assign wire161 = $signed({wire105,
                       (((|reg124) < reg114) != {$unsigned(reg114)})});
  always
    @(posedge clk) begin
      if (($unsigned(wire159) ?
          (reg114[(2'h3):(1'h1)] << $unsigned(reg147[(4'ha):(2'h3)])) : (reg147[(4'h9):(3'h7)] ?
              {(reg145[(1'h1):(1'h0)] ?
                      $signed(reg115) : reg135[(5'h12):(5'h12)]),
                  reg146[(4'ha):(1'h1)]} : {$unsigned({reg114, reg132}),
                  wire102[(3'h5):(2'h3)]})))
        begin
          reg162 <= {wire122[(4'ha):(3'h4)], wire122[(4'hd):(1'h1)]};
          reg163 <= wire104;
          reg164 <= (($unsigned(($unsigned(wire155) ?
                  $signed((8'ha4)) : $unsigned(reg120))) ?
              wire159[(3'h6):(2'h3)] : reg144) << ((reg148 << $unsigned((~(8'h9e)))) ?
              {($signed(wire106) ?
                      ((8'ha0) ?
                          wire158 : (8'h9e)) : reg144[(4'h9):(3'h7)])} : reg117[(4'hb):(4'h8)]));
        end
      else
        begin
          if (wire98)
            begin
              reg162 <= (&$signed(($unsigned((reg132 ?
                  reg152 : reg124)) ~^ reg150[(3'h6):(3'h6)])));
              reg163 <= $unsigned({$unsigned($signed(reg163[(3'h5):(1'h0)])),
                  reg134});
              reg164 <= (|(+(-$signed(reg107[(4'he):(1'h0)]))));
              reg165 <= reg131[(3'h6):(3'h4)];
              reg166 <= $signed(((wire103[(4'h8):(2'h2)] & $unsigned((8'hab))) ?
                  (~|reg163) : ((reg116[(3'h4):(1'h0)] + $signed(reg148)) > wire104[(4'h9):(1'h0)])));
            end
          else
            begin
              reg162 <= $unsigned($signed(reg134[(2'h2):(1'h1)]));
            end
          reg167 <= $signed({reg146});
          reg168 <= wire122;
        end
      if (({(~&wire106)} << {{reg153},
          ({$signed((7'h42)), {wire100}} - (reg114 ? reg108 : reg153))}))
        begin
          reg169 <= ((~&(reg119[(5'h14):(4'ha)] ?
              (reg135 >>> (wire159 & wire102)) : reg121)) <<< (~|(((~|(8'ha0)) ?
                  (&(8'hb0)) : $signed(reg113)) ?
              {(reg153 | reg167)} : $signed(reg125))));
          if (({$unsigned($signed($unsigned(reg111)))} ~^ (~^reg145)))
            begin
              reg170 <= $unsigned(reg166);
              reg171 <= ($signed(($signed(wire102) < (^~$signed(reg164)))) ?
                  reg109 : $unsigned($unsigned(wire103)));
              reg172 <= (reg170 ? (~|reg117) : $signed(reg134));
              reg173 <= (&reg141[(2'h2):(1'h1)]);
              reg174 <= $unsigned(($unsigned((~^(|wire104))) - wire139[(5'h10):(4'hf)]));
            end
          else
            begin
              reg170 <= reg138[(4'hc):(2'h3)];
              reg171 <= wire101;
            end
          reg175 <= $signed((($signed(reg132) ?
                  wire103[(4'h9):(4'h9)] : (~(reg164 > reg112))) ?
              reg114 : {(^~$signed(wire157)),
                  ((wire122 ? reg173 : (8'h9f)) & (^~(7'h44)))}));
        end
      else
        begin
          reg169 <= {($unsigned(reg152) ?
                  $signed($unsigned($signed(reg126))) : reg111[(1'h0):(1'h0)]),
              ($signed(wire158) ^ wire159[(2'h2):(1'h1)])};
          reg170 <= (reg136 ?
              ((($unsigned(reg132) ? $signed(reg146) : (reg175 - (8'haf))) ?
                      ($signed(reg130) ?
                          (-wire97) : (wire104 ?
                              reg172 : (8'ha4))) : $unsigned((wire101 ?
                          wire160 : reg110))) ?
                  (-reg107[(3'h6):(1'h1)]) : {$unsigned((-reg119)),
                      {{reg147,
                              (8'ha4)}}}) : {(reg141[(1'h1):(1'h0)] ~^ $unsigned(wire139[(1'h0):(1'h0)]))});
          if ($unsigned((!{$unsigned((-reg169))})))
            begin
              reg171 <= $signed($unsigned({$unsigned(reg118),
                  $signed(wire100[(4'hc):(3'h7)])}));
              reg172 <= $unsigned((({(reg121 ? reg150 : reg137),
                  reg114[(1'h1):(1'h0)]} * $unsigned($signed(wire157))) | (reg115 >> $unsigned((reg111 ?
                  (8'ha7) : reg113)))));
            end
          else
            begin
              reg171 <= (|{(reg128[(1'h1):(1'h0)] ? reg142 : reg146),
                  (((reg149 << reg111) ?
                      reg111[(1'h0):(1'h0)] : (wire122 ^~ reg112)) & wire139[(4'hb):(1'h0)])});
              reg172 <= reg162[(4'hd):(4'h8)];
              reg173 <= (+reg142);
            end
          if ($unsigned(($signed((reg169 ?
              $unsigned(reg121) : $unsigned(reg142))) < $unsigned(wire161))))
            begin
              reg174 <= (reg170[(1'h1):(1'h0)] <= (&wire100[(4'hc):(4'hb)]));
              reg175 <= $unsigned($signed(reg173[(5'h12):(4'ha)]));
              reg176 <= (^~($unsigned($unsigned($unsigned(reg174))) + $signed(((reg107 ?
                  reg142 : reg142) <= reg170[(3'h7):(1'h0)]))));
            end
          else
            begin
              reg174 <= reg126;
              reg175 <= (wire98 <= reg128);
              reg176 <= (~^({((~&(7'h44)) ?
                      (wire161 ?
                          wire99 : wire106) : (reg117 | wire104))} < reg132));
              reg177 <= $unsigned((~&(reg129 || {$unsigned(wire98),
                  (-wire139)})));
              reg178 <= reg119;
            end
        end
      reg179 <= (8'had);
    end
  assign wire180 = ($unsigned(wire104) && reg135[(4'hd):(4'h9)]);
  assign wire181 = (^~(-wire99));
endmodule

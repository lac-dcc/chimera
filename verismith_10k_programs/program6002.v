module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire1[(2'h3):(2'h3)];
  assign wire6 = (($signed($unsigned(wire2[(1'h0):(1'h0)])) ?
                         ({(~&wire3),
                             wire0} > ($unsigned(wire5) - wire5)) : {((~wire4) ?
                                 (wire4 || wire1) : (wire5 ? wire1 : wire3)),
                             (8'h9f)}) ?
                     (8'hb7) : ($signed($unsigned($unsigned(wire2))) ?
                         wire4 : (wire5 + (^{wire3}))));
  assign wire7 = $signed($signed((((wire0 ?
                     (8'haf) : wire4) && wire1) | wire0[(1'h1):(1'h0)])));
  assign wire8 = ((+{wire3[(1'h1):(1'h1)],
                     (((8'h9d) ? wire4 : wire7) - wire0)}) || $unsigned(wire7));
  assign wire9 = (((+$signed(((8'haf) <<< (8'ha8)))) ?
                         ($unsigned(wire0) ?
                             $signed(wire8) : ((wire3 ?
                                 wire8 : wire8) && (wire1 & wire3))) : wire1) ?
                     ({wire1[(4'hb):(4'ha)]} ?
                         (wire3 ?
                             ((wire2 > wire6) ?
                                 {wire4,
                                     (7'h41)} : $signed(wire1)) : {wire4[(3'h5):(3'h5)],
                                 wire5[(3'h5):(2'h3)]}) : $signed($unsigned($unsigned((8'hba))))) : wire4);
  assign wire10 = (&$signed((+$unsigned($signed(wire7)))));
  assign wire11 = (($unsigned($signed(((7'h41) ?
                          wire10 : wire8))) + (!{$unsigned(wire7)})) ?
                      {wire5[(1'h1):(1'h0)],
                          (~^(wire4 >= wire2))} : ((($signed(wire4) ?
                                  (wire0 <= wire7) : {wire1}) ?
                              ($signed((8'hb0)) ~^ (^wire5)) : wire2) ?
                          {wire6,
                              wire6[(4'hc):(4'ha)]} : {wire7[(4'hb):(2'h2)]}));
  module12 #() modinst78 (wire77, clk, wire7, wire6, wire5, wire2);
  assign wire79 = (~|$signed($signed(((wire10 >= wire6) ?
                      (^wire0) : $signed((8'haa))))));
  assign wire80 = wire11;
  assign wire81 = (~|($unsigned($signed($signed((7'h44)))) <= (wire1 + wire6)));
  assign wire82 = $signed((8'hb4));
  assign wire83 = wire1;
  assign wire84 = ((8'hbb) == (^($unsigned($signed(wire9)) ?
                      $unsigned((wire80 || (8'ha0))) : wire83[(5'h10):(4'hd)])));
  assign wire85 = (~wire83[(3'h5):(1'h1)]);
  assign wire86 = wire79;
  assign wire87 = wire10[(1'h1):(1'h1)];
  assign wire88 = wire4[(3'h4):(3'h4)];
  assign wire89 = $unsigned((!(wire87 ? (8'hbd) : (&$signed(wire3)))));
  assign wire90 = {$signed(wire3[(3'h4):(1'h1)])};
  assign wire91 = {$signed($signed(((-wire6) >>> $signed(wire8)))),
                      $signed(((!wire6[(2'h2):(1'h0)]) ?
                          (((8'hb5) ?
                              wire89 : (8'hac)) - (^(8'hba))) : wire83[(4'h9):(2'h2)]))};
endmodule

module module12
#(parameter param76 = (((&{(&(8'hb0))}) ? (~|(+(^~(8'hb7)))) : (^~(7'h42))) ? (((((8'ha3) <<< (8'ha9)) ? (-(8'hb4)) : (~(8'haa))) ? (^~(!(8'haf))) : (((8'hab) ^ (8'hb3)) ? ((7'h41) & (8'hbb)) : (8'haf))) & {((&(8'hb0)) >= (+(8'hb9))), (-((8'ha7) ? (8'hb1) : (7'h42)))}) : (({((8'hbc) <= (8'hbe)), (+(8'hb2))} | (|((8'ha7) * (8'h9d)))) & ({((8'haa) | (8'h9e)), {(7'h44)}} ? (~&((8'hac) != (8'h9e))) : (((8'hb3) & (8'hb2)) ? (~|(8'ha1)) : (!(8'ha3)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire41;
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire69,
                 wire68,
                 wire52,
                 wire51,
                 wire50,
                 wire41,
                 reg71,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  module17 #() modinst42 (wire41, clk, wire13, wire14, wire16, wire15, (8'h9c));
  always
    @(posedge clk) begin
      reg43 <= (~^($signed($unsigned((wire41 ? wire16 : wire41))) ?
          (wire16 ?
              ({wire13, wire16} ?
                  wire13 : wire13[(4'hd):(3'h6)]) : (wire13[(4'h8):(1'h0)] ?
                  (|wire41) : (wire41 ?
                      (8'hb7) : wire14))) : $signed($unsigned($signed(wire14)))));
      reg44 <= (&$signed(((wire14 - {wire14}) >> (wire15[(4'ha):(4'h8)] <= $signed(wire15)))));
      reg45 <= $unsigned((^~{($signed((8'ha3)) ?
              {wire15, wire13} : {wire13, reg44})}));
      reg46 <= wire16;
      reg47 <= reg43;
    end
  always
    @(posedge clk) begin
      reg48 <= wire15[(5'h10):(4'hf)];
      reg49 <= (^(~(8'hb7)));
    end
  assign wire50 = {wire41,
                      $unsigned({($unsigned(wire16) ?
                              $unsigned(reg44) : $unsigned(wire13))})};
  assign wire51 = $signed(($signed(wire14[(1'h0):(1'h0)]) | $signed($unsigned({reg49,
                      wire16}))));
  assign wire52 = $unsigned($signed($signed((&{(8'hb5), reg46}))));
  always
    @(posedge clk) begin
      if ($unsigned(({$signed(((8'hb6) <<< reg47))} >= {($unsigned(reg44) ?
              reg49[(1'h1):(1'h1)] : reg47[(4'hb):(2'h3)]),
          $signed({(8'ha2)})})))
        begin
          reg53 <= (reg44[(3'h6):(1'h0)] >>> $signed($signed($signed(wire51))));
          reg54 <= ($signed($signed($unsigned((|wire14)))) ?
              reg45 : ({$signed($signed(wire13))} ?
                  (8'hb7) : $signed((^~$signed((8'ha3))))));
          reg55 <= $unsigned($unsigned(wire50[(3'h5):(3'h4)]));
        end
      else
        begin
          if ((reg44 && (~|wire15[(4'h9):(1'h1)])))
            begin
              reg53 <= (!(reg48[(1'h1):(1'h1)] >= (((reg46 << (8'hab)) < $signed(reg49)) <= wire16[(4'he):(2'h2)])));
              reg54 <= {{((&(wire15 ~^ reg49)) ~^ wire14[(4'h8):(1'h0)])}};
            end
          else
            begin
              reg53 <= reg54;
            end
          reg55 <= (~|$unsigned((wire16 ?
              (8'haf) : $unsigned((reg45 >= wire51)))));
          reg56 <= (~&(~(~^{(-reg47)})));
        end
      reg57 <= $signed(({({reg43, wire14} ?
              wire14[(3'h5):(2'h2)] : reg56)} ~^ wire52[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg58 <= {(wire13 <<< ({(wire41 ? reg47 : reg43),
              $unsigned((8'hb2))} ^~ {reg47})),
          $unsigned({((reg54 * reg43) ? $unsigned((8'hb6)) : (reg57 + (8'h9f))),
              (wire50 ? (wire16 ? reg55 : reg56) : $signed((8'hba)))})};
      if (((!((^$unsigned((8'hbf))) ?
              reg47[(4'hc):(4'hb)] : reg57[(4'h9):(3'h4)])) ?
          reg44[(2'h3):(1'h0)] : reg56[(4'hd):(4'hb)]))
        begin
          reg59 <= wire13[(3'h5):(2'h2)];
          reg60 <= (($signed((reg48 != $signed(reg54))) ?
                  $unsigned((8'hb6)) : (wire41 * {reg59, (+(8'hb4))})) ?
              wire14[(4'h8):(1'h0)] : (+{(wire15[(4'h9):(3'h4)] ?
                      $signed(reg55) : $signed(reg47)),
                  $unsigned((wire13 ? reg58 : reg46))}));
          reg61 <= ((($unsigned((wire16 > reg47)) ?
                      (~^{reg58, (8'h9e)}) : reg54[(2'h3):(1'h1)]) ?
                  $signed($signed((^~wire14))) : (reg44[(4'h9):(2'h3)] >>> (~|{wire41,
                      wire15}))) ?
              {(wire14[(4'hc):(4'hb)] <= ((&reg57) <<< (~^wire50))),
                  $unsigned((-$signed(wire15)))} : (reg47[(4'h9):(2'h3)] - $signed(reg48)));
          reg62 <= {$signed($signed(reg61)), (8'hb5)};
        end
      else
        begin
          if (reg57[(4'hc):(3'h4)])
            begin
              reg59 <= {$unsigned($signed((-wire52[(1'h0):(1'h0)])))};
            end
          else
            begin
              reg59 <= (reg44 ?
                  {$unsigned(reg43[(4'h8):(1'h1)]),
                      $signed(reg58[(4'hd):(3'h6)])} : wire50[(3'h6):(3'h6)]);
              reg60 <= $signed(reg55[(3'h7):(2'h2)]);
              reg61 <= $signed(reg61);
              reg62 <= (&{wire15[(5'h12):(4'hc)], wire14[(4'he):(3'h4)]});
              reg63 <= (8'hb2);
            end
          if ($signed(reg62[(2'h2):(1'h1)]))
            begin
              reg64 <= reg62[(3'h4):(1'h0)];
              reg65 <= (reg56 && $unsigned(reg44[(4'h8):(3'h7)]));
              reg66 <= $signed((^~((8'h9e) ~^ (((8'ha6) >= (8'hb0)) >>> {reg47,
                  reg48}))));
            end
          else
            begin
              reg64 <= $unsigned((~$unsigned(reg57[(4'h8):(3'h7)])));
              reg65 <= reg58[(1'h0):(1'h0)];
            end
        end
      reg67 <= $unsigned((+{reg57,
          ($signed(wire51) ? ((8'hb9) < reg61) : $signed(reg62))}));
    end
  assign wire68 = (wire15[(4'h8):(2'h3)] ?
                      reg62 : (~$unsigned($signed($signed(reg58)))));
  assign wire69 = reg56;
  assign wire70 = (!((~|($signed(reg64) > (~|wire14))) * $signed(reg59)));
  always
    @(posedge clk) begin
      reg71 <= (~^(({reg65, (8'ha9)} ?
          reg61 : ((+wire41) && ((8'hae) ? reg59 : reg44))) >= reg54));
    end
  assign wire72 = {reg53};
  assign wire73 = (~&(reg46[(4'h8):(3'h7)] ?
                      ((8'ha9) ?
                          $signed((wire69 ?
                              (8'ha2) : (8'hbf))) : ({reg71} >>> (~&wire72))) : ((-reg53) ~^ (~&{wire13}))));
  assign wire74 = (((|(!$signed(reg71))) ? reg62 : reg66[(1'h0):(1'h0)]) ?
                      ((reg56[(3'h6):(2'h3)] ?
                              reg44[(3'h5):(1'h0)] : ((reg62 ? reg46 : reg71) ?
                                  reg56[(1'h1):(1'h0)] : reg49)) ?
                          (+(~wire13)) : $signed((8'hbf))) : ($signed($signed((|reg48))) && wire68));
  assign wire75 = (wire41[(4'h8):(2'h3)] ?
                      (~|(|(+$unsigned(wire15)))) : $signed($unsigned((~^$unsigned(reg43)))));
endmodule

module module17
#(parameter param39 = (((~&(~&((8'hb1) ? (8'ha6) : (8'hb5)))) <<< {((~&(8'ha8)) ^~ (8'h9c)), (((8'h9f) ^ (7'h41)) ? ((8'ha1) & (8'hbc)) : ((8'hae) ? (8'ha9) : (8'hb8)))}) ? ({((&(7'h44)) >= ((8'h9c) < (8'ha2))), ((-(7'h41)) ? {(8'hb9)} : ((8'ha0) | (8'had)))} - (({(8'h9c), (8'hb5)} >>> ((8'ha3) != (8'ha0))) ? (|{(8'hbd)}) : ((~|(8'ha7)) * {(8'ha8)}))) : (&(~&((-(8'ha6)) ? (~(8'hab)) : ((8'hb6) ? (8'ha4) : (8'hba)))))), 
parameter param40 = (param39 < (~|param39)))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = (+$signed(wire20[(4'he):(4'h9)]));
  assign wire24 = wire22;
  assign wire25 = $signed($signed(wire18));
  assign wire26 = {(^~wire22[(3'h4):(1'h1)])};
  assign wire27 = $signed(wire25[(4'he):(3'h4)]);
  assign wire28 = (^$unsigned((~$signed((~&wire21)))));
  assign wire29 = wire20[(5'h12):(3'h7)];
  assign wire30 = wire24[(2'h3):(2'h3)];
  assign wire31 = $signed($signed($signed(($signed(wire30) ?
                      (~&wire24) : (wire22 << wire27)))));
  assign wire32 = (~|(wire20 == ((^~$unsigned(wire21)) && ((wire18 ?
                      wire22 : wire25) < (wire23 ~^ wire29)))));
  assign wire33 = $signed((~|wire30[(3'h5):(3'h5)]));
  assign wire34 = (8'ha2);
  assign wire35 = (+(wire22[(2'h2):(2'h2)] ?
                      (wire23[(1'h0):(1'h0)] >= wire18[(1'h1):(1'h1)]) : wire24));
  assign wire36 = {$signed(((~^{wire22,
                          wire27}) <<< ($signed(wire28) ^ (~&wire31))))};
  assign wire37 = (|(wire18 >> $signed(wire25)));
  assign wire38 = $signed($unsigned(({wire20[(1'h0):(1'h0)],
                      wire28} ^ wire24[(3'h5):(2'h3)])));
endmodule

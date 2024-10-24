module top
#(parameter param87 = ((({(~|(7'h42)), ((8'hb7) ? (8'hbe) : (8'hbb))} & (((7'h43) > (8'hb8)) && (!(8'ha4)))) ? (+({(8'hb3)} ? ((8'h9e) ? (8'hab) : (8'hbd)) : ((7'h40) || (8'ha1)))) : (-({(8'haf), (8'ha1)} ? ((8'hbe) ? (7'h40) : (8'hb9)) : {(8'ha1)}))) ? (((((8'hbe) ^~ (8'h9f)) <= (!(8'h9d))) <= (((8'haa) ? (8'ha7) : (8'had)) ? ((8'ha3) ^~ (8'hb3)) : (^(8'hb8)))) > (^(~(&(8'hb0))))) : (~^(^~(~|((7'h43) | (8'hab)))))), 
parameter param88 = ((param87 ? param87 : {param87}) != (^(~|(param87 > {param87})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire55;
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  module4 #() modinst56 (.y(wire55), .wire5(wire1), .clk(clk), .wire6(wire3), .wire8(wire0), .wire7(wire2));
  assign wire57 = (8'had);
  assign wire58 = wire0[(4'hc):(4'ha)];
  assign wire59 = ($unsigned($signed(((8'ha7) ?
                      $signed(wire55) : {wire57,
                          wire58}))) <<< {$unsigned({wire1[(4'hf):(4'h9)]})});
  assign wire60 = $signed((wire55 + ((~(wire58 ? wire59 : wire3)) ?
                      $signed(wire57[(1'h1):(1'h0)]) : ($signed(wire2) ?
                          ((8'hab) ? wire1 : (8'ha4)) : wire58))));
  assign wire61 = $signed((($unsigned($signed(wire55)) < $unsigned((wire55 ?
                          wire3 : wire60))) ?
                      ((~(^wire0)) ?
                          (8'hac) : ($unsigned((8'hbe)) ?
                              wire3 : (|wire57))) : (~|(~$unsigned(wire2)))));
  assign wire62 = $signed((wire3[(3'h5):(3'h5)] ?
                      ((wire60[(2'h3):(1'h0)] == $signed(wire0)) - wire57[(3'h4):(1'h1)]) : {wire3}));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg63 <= $signed((~(wire59[(5'h10):(4'hf)] - wire55)));
          reg64 <= wire61;
        end
      else
        begin
          reg63 <= $signed((wire59 & {((wire3 ^~ wire61) ?
                  $signed(wire62) : $unsigned(wire55))}));
          reg64 <= $signed($signed(wire61));
          if (wire0[(1'h1):(1'h0)])
            begin
              reg65 <= (8'had);
              reg66 <= {$unsigned((((wire1 && (7'h41)) ?
                          (wire3 < wire1) : (wire62 || wire57)) ?
                      (8'haa) : ((wire2 || reg65) && wire3)))};
            end
          else
            begin
              reg65 <= (wire55 ?
                  $signed($unsigned($unsigned((wire1 ^ reg64)))) : wire61);
            end
          if ($signed((~(((wire3 <<< wire61) ?
                  $unsigned((8'h9c)) : ((8'hac) ^ (8'ha1))) ?
              wire61[(2'h3):(1'h0)] : (~&wire62[(1'h0):(1'h0)])))))
            begin
              reg67 <= {(~^$signed((wire0[(3'h5):(2'h3)] ?
                      $signed(wire55) : (8'ha2)))),
                  $signed($signed(wire57))};
              reg68 <= (^{wire2});
              reg69 <= ($unsigned((((wire55 ?
                  wire3 : (8'hba)) ^ (!wire0)) * wire1)) && $unsigned($unsigned((wire3 ?
                  $unsigned(wire55) : (wire0 ? wire61 : wire0)))));
              reg70 <= (((&(reg65 >>> reg67)) ?
                      reg67 : $unsigned($unsigned($unsigned(wire3)))) ?
                  ({({reg68, wire2} ? (~&reg69) : (&wire57)),
                          $unsigned((wire1 ? reg68 : reg66))} ?
                      {wire57} : ($signed(wire55[(4'h8):(1'h0)]) ?
                          (!$unsigned(wire55)) : ((&wire2) ?
                              $signed(wire58) : wire0[(4'he):(1'h1)]))) : $signed(($unsigned((reg65 ~^ (8'ha9))) ?
                      {(reg67 << wire61),
                          (wire59 ? reg64 : reg63)} : $signed((~^wire2)))));
            end
          else
            begin
              reg67 <= (reg63 >>> wire60[(1'h0):(1'h0)]);
            end
          reg71 <= reg63[(4'ha):(3'h5)];
        end
      reg72 <= $unsigned({(({reg68, reg65} ?
                  $signed((8'hb5)) : {wire60, reg68}) ?
              ({reg69} ? reg67 : {reg71}) : $signed(reg63[(1'h1):(1'h0)])),
          $signed((reg65[(4'h8):(1'h1)] << (reg69 ^~ wire61)))});
      if ($signed(((8'hb6) <<< {$unsigned((-(8'hbe))), reg69[(1'h1):(1'h1)]})))
        begin
          if ((|reg68))
            begin
              reg73 <= $signed({(reg64[(3'h7):(3'h5)] ?
                      reg64 : wire59[(3'h7):(3'h7)]),
                  $unsigned($unsigned((reg66 ? wire58 : wire55)))});
              reg74 <= wire1[(1'h0):(1'h0)];
              reg75 <= reg74;
              reg76 <= (^~$unsigned(((+$unsigned((8'ha4))) || $unsigned($unsigned(wire1)))));
              reg77 <= $signed(wire1);
            end
          else
            begin
              reg73 <= reg76[(4'h8):(4'h8)];
              reg74 <= reg66[(4'h8):(1'h0)];
              reg75 <= (^~$signed(wire55[(3'h7):(3'h7)]));
              reg76 <= (^wire62);
              reg77 <= (!{(&$unsigned($signed((8'ha3))))});
            end
          reg78 <= $unsigned({wire3[(1'h1):(1'h0)], (~^reg70)});
          if (wire60)
            begin
              reg79 <= (wire0[(1'h1):(1'h0)] ?
                  ($unsigned(reg64[(2'h3):(1'h0)]) ?
                      $unsigned(reg64) : $unsigned((&$unsigned(wire59)))) : (~|{(reg72 < reg69)}));
              reg80 <= {$unsigned($unsigned(wire1))};
              reg81 <= reg69[(1'h1):(1'h1)];
              reg82 <= reg68[(3'h4):(2'h2)];
              reg83 <= wire1;
            end
          else
            begin
              reg79 <= (($unsigned($unsigned($unsigned(wire1))) ?
                      (~$signed((|reg74))) : ((reg70 ~^ wire1[(4'hb):(1'h0)]) ?
                          (~(wire0 == reg73)) : (8'h9e))) ?
                  (8'hb9) : $unsigned(((reg73 ?
                      (reg64 ? (8'hbd) : reg82) : ((8'ha9) ?
                          wire0 : reg79)) <= $unsigned($signed(wire1)))));
              reg80 <= ((~&$signed(((reg74 && wire60) ?
                  (~&reg76) : (wire3 >= reg82)))) | $unsigned((8'had)));
              reg81 <= ($signed((wire55[(2'h3):(1'h0)] >> {(~&wire55),
                  {(8'ha7), reg64}})) <= $unsigned($signed($unsigned({wire0,
                  reg82}))));
              reg82 <= ({{(wire57[(4'hd):(2'h3)] >> $signed(wire60)), reg65}} ?
                  (wire55 ?
                      wire61 : reg80[(4'h8):(3'h5)]) : $unsigned(($unsigned({(8'h9d),
                      wire58}) != wire61)));
            end
          reg84 <= (~^(((+(reg81 - reg75)) + reg83) >= reg66[(4'hb):(3'h5)]));
        end
      else
        begin
          reg73 <= $signed($unsigned(($unsigned(wire57) + $signed(reg68))));
          reg74 <= reg68[(1'h1):(1'h1)];
          reg75 <= reg63[(3'h4):(3'h4)];
          reg76 <= (|{(8'hb2),
              (((reg66 ^~ reg63) ? wire58[(1'h0):(1'h0)] : (|reg74)) ?
                  wire0 : (reg81 ? (^reg82) : (reg74 >> wire60)))});
        end
    end
  assign wire85 = (-reg80);
  assign wire86 = reg72;
endmodule

module module4
#(parameter param53 = (((((&(8'hab)) ? ((8'hbe) & (8'ha2)) : (^(8'hb0))) ? {(|(8'h9c)), {(8'h9c)}} : (((8'ha0) != (8'ha5)) ? ((8'hbe) < (8'hb3)) : (-(8'haf)))) ? (^~(~((8'hb6) * (8'hb6)))) : ((~{(8'hae), (8'hba)}) ? {((8'hb7) <<< (8'h9c))} : ((~&(8'ha1)) ^ ((8'haf) | (8'hb3))))) ? ((^~{((8'haf) * (8'hbb))}) ? ((~((8'ha1) >>> (8'ha9))) ? {((8'hab) >>> (8'hac))} : (((8'hae) ? (8'hae) : (8'ha4)) ? ((8'hb6) < (8'hb8)) : ((8'h9f) != (8'hb0)))) : ((+((8'haa) ? (8'ha5) : (8'hba))) ? ((~^(8'ha1)) ? (-(8'hbc)) : (-(7'h41))) : (8'hbd))) : (((((8'ha0) ? (8'ha9) : (8'hb3)) != {(8'h9c), (8'hb4)}) ~^ (~^((8'hab) ? (8'ha0) : (8'hb4)))) ? (-(((7'h40) ? (8'hae) : (8'haa)) ? ((8'hba) ? (8'hab) : (8'ha9)) : (~^(8'ha1)))) : (({(8'h9c), (8'ha9)} != (+(8'ha1))) ? {((8'ha4) ? (8'h9d) : (8'h9d))} : {((8'had) ? (8'h9e) : (8'hbd)), ((8'ha7) ? (8'hb8) : (8'hbc))}))), 
parameter param54 = (8'hbd))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire5;
  input wire [(3'h5):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire47;
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire23,
                 wire47,
                 reg49,
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
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= (~^wire6);
    end
  always
    @(posedge clk) begin
      reg10 <= wire6[(3'h4):(2'h3)];
      if ($signed($unsigned(wire8[(4'hc):(2'h2)])))
        begin
          reg11 <= (wire5[(4'h8):(4'h8)] ?
              wire8[(4'h9):(3'h4)] : (wire6 ? wire7[(3'h5):(2'h3)] : wire8));
          reg12 <= wire8;
          if ((|$signed($signed({wire7}))))
            begin
              reg13 <= wire5[(3'h7):(2'h2)];
              reg14 <= (~^$signed(reg13[(2'h3):(2'h2)]));
              reg15 <= (7'h44);
            end
          else
            begin
              reg13 <= {(+(-wire8))};
              reg14 <= $signed((+{(^(~^reg15))}));
            end
        end
      else
        begin
          reg11 <= $signed((reg9 == wire6));
          if (((~|$signed(({wire8} ?
              (wire5 ?
                  (8'hb0) : reg9) : reg11[(2'h3):(1'h1)]))) ^ $unsigned((((reg14 ?
                      wire5 : reg11) ?
                  wire6 : (wire5 ? wire6 : reg13)) ?
              ((~^reg12) ?
                  wire7[(3'h6):(3'h6)] : reg13[(4'h8):(2'h3)]) : (+(wire6 && wire8))))))
            begin
              reg12 <= $signed(wire5[(4'he):(4'h9)]);
              reg13 <= (wire7 ?
                  {wire5[(4'hc):(3'h4)]} : (-($signed($signed(reg10)) ?
                      $unsigned((~reg14)) : (((8'ha4) ?
                          reg13 : wire5) >= reg9[(2'h2):(2'h2)]))));
              reg14 <= (reg10[(4'hb):(1'h0)] ?
                  (^wire6) : (+(~|wire5[(5'h13):(5'h10)])));
            end
          else
            begin
              reg12 <= reg15[(3'h5):(3'h5)];
              reg13 <= $signed(reg14[(2'h2):(1'h1)]);
              reg14 <= $unsigned(($signed(reg14) ?
                  (($unsigned(wire7) ~^ (+wire8)) == ((&wire8) | wire7[(4'h8):(1'h0)])) : (reg12[(2'h2):(1'h1)] ~^ reg10)));
              reg15 <= ((wire7[(3'h6):(3'h4)] ?
                  (wire6 ?
                      $unsigned((wire6 != (8'hbd))) : (|$unsigned(reg13))) : (wire7[(4'ha):(3'h7)] - reg12)) - ((^~(((8'hac) ?
                          wire5 : wire5) ?
                      (reg12 == reg10) : reg10)) ?
                  (8'haf) : $signed((wire8[(1'h0):(1'h0)] & (reg10 & reg12)))));
              reg16 <= (reg11[(1'h0):(1'h0)] << reg9[(3'h4):(2'h2)]);
            end
          if ((|reg16))
            begin
              reg17 <= wire7;
              reg18 <= reg13[(3'h4):(1'h0)];
              reg19 <= ($signed(($signed($signed(wire7)) ? reg15 : wire8)) ?
                  ({{$unsigned((8'hb9))}, reg17} ?
                      $signed(((|reg11) ?
                          wire8[(3'h6):(1'h0)] : $unsigned(reg11))) : $signed($signed((reg18 ^~ wire5)))) : wire5[(4'h9):(2'h2)]);
              reg20 <= $signed((reg10[(3'h6):(3'h4)] & (((reg13 ?
                  reg18 : reg10) < $signed((8'hb3))) >>> $unsigned(reg10))));
            end
          else
            begin
              reg17 <= (reg14 ? reg17 : reg19[(3'h6):(1'h0)]);
            end
          reg21 <= $unsigned($unsigned((+reg18[(1'h0):(1'h0)])));
          reg22 <= ((&$unsigned($unsigned((reg21 ? reg13 : (8'hb8))))) ?
              $signed(($unsigned($signed((8'ha5))) <= (&(reg15 & reg15)))) : {((^(+reg9)) ?
                      ($unsigned(reg10) - reg18[(1'h0):(1'h0)]) : reg16[(1'h1):(1'h0)]),
                  {$signed(((8'hb0) >> reg10)), {(|wire7), $signed((8'haa))}}});
        end
    end
  assign wire23 = reg20[(1'h1):(1'h0)];
  module24 #() modinst48 (.wire26(wire7), .clk(clk), .wire29(reg15), .y(wire47), .wire28(reg18), .wire27(reg22), .wire25(reg9));
  always
    @(posedge clk) begin
      reg49 <= $unsigned(reg9);
    end
  assign wire50 = reg22;
  assign wire51 = (8'hb6);
  assign wire52 = (+{$unsigned((~^reg15[(2'h2):(1'h0)]))});
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  input wire [(4'hd):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= (wire25[(1'h1):(1'h1)] ?
          wire26[(4'h8):(2'h2)] : $signed((wire26[(4'h8):(3'h7)] ?
              (7'h43) : wire25)));
      if (wire29[(4'hb):(3'h5)])
        begin
          reg31 <= (wire26[(1'h0):(1'h0)] ?
              (reg30 ?
                  wire28 : (~&$signed((wire26 + wire25)))) : {($signed((wire26 ?
                          wire29 : wire25)) ?
                      ({wire27, wire28} ?
                          wire26 : (wire29 + wire25)) : ((wire29 ?
                          wire25 : wire27) >> $unsigned(reg30)))});
          reg32 <= (reg30 * {$unsigned($signed((^wire25)))});
        end
      else
        begin
          reg31 <= {$unsigned((^(&{reg32, reg32})))};
          reg32 <= $unsigned((~|$signed($signed((wire29 ~^ reg32)))));
          reg33 <= (&$signed({reg31[(1'h0):(1'h0)], reg31[(2'h3):(1'h1)]}));
          reg34 <= wire25;
        end
    end
  assign wire35 = {{wire27,
                          {(+$unsigned(wire27)),
                              $unsigned((wire28 ? wire26 : wire26))}}};
  assign wire36 = reg32[(2'h3):(1'h0)];
  assign wire37 = (reg34[(1'h1):(1'h0)] ?
                      $unsigned(wire35[(1'h0):(1'h0)]) : {$signed($signed($unsigned((8'hb0))))});
  assign wire38 = ($signed(wire27) * $unsigned(reg34));
  assign wire39 = wire29;
  assign wire40 = {wire26[(4'he):(4'he)],
                      $unsigned((+($signed(wire27) ?
                          $signed(wire26) : (wire26 >>> wire26))))};
  assign wire41 = (((8'h9f) <<< (&wire25)) ?
                      ($signed({$signed((8'ha7))}) ?
                          $unsigned({(~|wire35),
                              (wire25 ? wire37 : wire26)}) : $signed(((wire28 ?
                                  wire37 : wire28) ?
                              (wire36 ?
                                  wire37 : wire25) : (7'h42)))) : (wire27 >>> wire40));
  assign wire42 = $signed($signed($unsigned((wire39[(4'h9):(3'h7)] ?
                      reg33[(3'h4):(3'h4)] : (^wire40)))));
  assign wire43 = $unsigned(((((-wire38) ?
                      (!wire36) : wire27) < $signed($unsigned(wire35))) ^~ (((reg33 ?
                      wire29 : (8'h9f)) && ((8'hb9) << wire39)) > wire38[(4'hc):(3'h7)])));
  assign wire44 = ($signed({$signed(reg34[(2'h2):(2'h2)]),
                      wire35[(4'h8):(1'h0)]}) << ($unsigned(wire42[(3'h4):(1'h1)]) ?
                      $unsigned(($unsigned(wire38) ?
                          $signed(reg30) : (~wire25))) : (+$unsigned(((7'h43) ?
                          wire35 : wire27)))));
  assign wire45 = (^{($signed($signed(reg32)) == ($signed((8'h9e)) ?
                          wire38 : reg33)),
                      {{(wire27 & wire28), (wire41 ? reg30 : wire36)}}});
  assign wire46 = (+((-$signed(wire41[(4'h9):(1'h0)])) ?
                      (wire36[(1'h0):(1'h0)] <= ($unsigned(wire37) ?
                          $signed(reg33) : wire39[(3'h4):(2'h3)])) : reg30));
endmodule

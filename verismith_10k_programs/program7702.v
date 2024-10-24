module top
#(parameter param92 = ((|((((8'hb1) ? (8'hb1) : (8'hb6)) ? ((7'h42) ? (8'ha3) : (8'ha2)) : (&(8'hb6))) < ((~|(8'ha2)) ? ((8'hb6) + (8'hbf)) : ((8'hbb) || (8'hba))))) >>> (((((8'haf) ? (8'ha2) : (8'h9f)) ? {(8'hbc), (8'ha4)} : (8'hab)) ? ({(7'h42), (7'h41)} >> ((8'ha6) <<< (8'haa))) : (~|((8'hbf) ? (7'h43) : (8'hbc)))) | (~({(8'hac), (8'hac)} ? ((8'h9f) ? (8'ha4) : (7'h40)) : ((8'hac) == (8'hb1)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire82;
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire84,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire82,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg86,
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
                 (1'h0)};
  assign wire4 = {$unsigned(($signed({wire0}) ^ wire0[(1'h1):(1'h1)])),
                     $signed({(-(wire2 >>> (8'h9c))), wire1})};
  assign wire5 = wire4[(1'h0):(1'h0)];
  assign wire6 = ((wire4 ^ wire5) >> wire4);
  assign wire7 = (wire1[(4'he):(3'h6)] ?
                     $unsigned((~^{$signed(wire2)})) : ((~^wire5[(4'hd):(4'h9)]) ?
                         wire3 : (~^($unsigned(wire5) <<< (wire1 ?
                             (8'haf) : wire4)))));
  always
    @(posedge clk) begin
      if ((wire5[(4'ha):(3'h5)] << (($signed((+wire0)) ?
          ({wire5, (8'ha0)} ?
              wire1[(3'h4):(2'h2)] : (~&wire2)) : (^~wire3)) & wire2)))
        begin
          reg8 <= wire5[(4'hb):(1'h0)];
          reg9 <= wire6;
          reg10 <= wire5;
          reg11 <= reg9;
        end
      else
        begin
          reg8 <= $unsigned($unsigned($unsigned((wire1 >= {reg10}))));
          reg9 <= $signed(reg10);
          reg10 <= ((8'haf) ?
              $signed((^(((8'hb4) ? wire1 : reg8) ?
                  reg11[(2'h3):(1'h0)] : $unsigned(wire3)))) : (|((wire0[(3'h5):(1'h1)] >>> (8'h9e)) ?
                  ($signed(wire1) ?
                      $signed(reg9) : {wire7, reg8}) : $signed((wire4 ?
                      wire0 : wire5)))));
          reg11 <= (($signed($unsigned(reg11)) ?
              $signed($signed((wire0 >>> wire1))) : wire3[(1'h1):(1'h1)]) >> wire7[(4'hd):(4'hc)]);
        end
      reg12 <= (wire7[(2'h2):(2'h2)] == ((($signed(wire0) ?
          reg11 : $unsigned((8'hbf))) ^~ {(~wire6)}) + (wire3 & wire6[(5'h13):(3'h6)])));
      reg13 <= reg9[(4'ha):(3'h6)];
      if ((-(($signed($unsigned(reg13)) ^~ reg13) ?
          $signed($unsigned((wire2 ?
              wire0 : (8'hb3)))) : $unsigned($unsigned(reg13)))))
        begin
          if ({(-$signed((^~$unsigned(wire6)))),
              (-{$signed($unsigned(reg10)),
                  ($unsigned(reg11) << ((8'h9e) ^~ wire4))})})
            begin
              reg14 <= reg11;
            end
          else
            begin
              reg14 <= (8'ha1);
              reg15 <= (+reg13[(2'h2):(2'h2)]);
            end
          reg16 <= $signed((({(~^reg9), $signed((8'hbc))} ?
              wire7 : reg8) ^ (+$unsigned((wire7 >= wire0)))));
          reg17 <= (((^~{reg12}) & ((^~{wire1, reg15}) >>> reg13)) ?
              ($signed(wire3[(2'h2):(2'h2)]) > $signed(((reg11 ?
                  reg10 : reg11) | wire2))) : ($unsigned($unsigned($signed(reg16))) ?
                  (!(|reg13)) : reg16[(1'h1):(1'h1)]));
          reg18 <= {({$unsigned(((8'haf) ? wire3 : wire0)),
                      $signed($signed(reg11))} ?
                  $signed(wire4) : ((((8'ha3) >> (8'ha0)) ?
                      wire1 : $signed(wire3)) >>> $signed(wire3)))};
          reg19 <= (8'hb6);
        end
      else
        begin
          reg14 <= ($unsigned(({(&wire6)} && $unsigned($signed(reg17)))) != (~|wire0));
          reg15 <= wire1[(4'hb):(4'hb)];
          reg16 <= ((8'haf) ?
              (^~$signed((wire0 ? ((8'haa) || (8'ha3)) : wire6))) : wire7);
        end
      reg20 <= (reg16[(2'h3):(2'h2)] ?
          {{reg12[(1'h1):(1'h1)],
                  ($signed(wire2) == {reg19,
                      wire2})}} : $signed($unsigned((wire7[(4'hd):(2'h2)] ?
              $signed(reg12) : wire0))));
    end
  module21 #() modinst83 (wire82, clk, reg8, reg15, reg16, wire1);
  assign wire84 = wire6[(4'ha):(1'h1)];
  assign wire85 = (+wire5[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      reg86 <= ({((~^$signed(wire7)) ?
              $signed((~&reg9)) : ((wire0 <<< reg16) == reg17))} >> $signed({reg19}));
    end
  assign wire87 = (!{$signed(((^~wire84) && (reg16 ? reg12 : wire1)))});
  always
    @(posedge clk) begin
      reg88 <= $unsigned($unsigned((reg12 <= ((reg16 <= (8'hb9)) ?
          reg8 : wire1))));
      reg89 <= reg14[(2'h3):(1'h1)];
      reg90 <= ((~|wire6[(3'h6):(2'h3)]) ^ $unsigned((|wire3[(2'h3):(1'h1)])));
      reg91 <= wire7[(4'h9):(2'h3)];
    end
endmodule

module module21
#(parameter param81 = (({(-((7'h42) ? (7'h41) : (7'h40))), {(7'h41)}} && {(((8'hae) ? (8'ha5) : (8'h9d)) ? (~|(8'h9f)) : ((8'h9f) - (8'h9f)))}) >= (|(~|((+(8'hb1)) ? ((7'h44) - (7'h44)) : (^~(8'hb6)))))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire23;
  input wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire40,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire26 = $signed((&(~|$unsigned($unsigned((7'h43))))));
  assign wire27 = (wire26[(4'ha):(1'h1)] ?
                      {((8'hbb) ?
                              $unsigned(wire23[(4'ha):(3'h7)]) : wire24)} : $signed({((wire25 ?
                              wire25 : (8'hba)) >> (wire22 ?
                              wire26 : wire22))}));
  assign wire28 = $unsigned(wire24[(3'h4):(3'h4)]);
  assign wire29 = (((^wire28[(2'h2):(1'h1)]) ?
                          $unsigned(((wire22 ?
                              (7'h41) : wire24) || wire28[(2'h2):(2'h2)])) : ($signed($signed((8'hb5))) ?
                              (^(^~wire24)) : wire26)) ?
                      $unsigned($unsigned((wire25[(1'h0):(1'h0)] ?
                          wire26[(2'h3):(1'h1)] : {wire24}))) : wire27[(3'h7):(3'h7)]);
  assign wire30 = $signed($unsigned({(wire27[(2'h3):(2'h2)] * (~&(8'ha8)))}));
  assign wire31 = (-((-($signed(wire29) & (wire23 >= wire24))) ?
                      ($signed(((8'ha0) << wire30)) ?
                          wire27[(4'h9):(1'h0)] : wire23[(2'h3):(1'h0)]) : $unsigned((8'hb7))));
  always
    @(posedge clk) begin
      reg32 <= ($unsigned($unsigned((wire23[(4'h9):(4'h8)] * (wire30 ^~ wire31)))) | (~|(wire31 <= ((~|wire25) <= $unsigned((8'hb5))))));
      reg33 <= (~((8'hba) ?
          $unsigned($signed({wire25, (8'ha9)})) : {(~(wire30 || wire25)),
              ($signed(wire25) ? {wire29, wire31} : (wire30 & (8'h9e)))}));
      if ((8'haa))
        begin
          if ((wire27 && ((((wire28 ? wire30 : reg32) ?
              (wire22 * wire26) : $signed(wire30)) >>> $signed($unsigned(wire27))) && (wire22[(2'h3):(1'h1)] ?
              ($unsigned((7'h42)) == (wire25 ? wire31 : wire27)) : wire25))))
            begin
              reg34 <= ((wire29[(4'hf):(4'hb)] ?
                  wire29[(3'h4):(3'h4)] : $unsigned(((wire28 >= wire29) ?
                      {reg33, wire22} : $unsigned(wire30)))) ^~ (wire30 ?
                  wire27 : ((8'ha9) <<< wire24[(1'h0):(1'h0)])));
            end
          else
            begin
              reg34 <= ({reg33[(1'h0):(1'h0)], wire30[(4'h9):(2'h2)]} ?
                  $unsigned($signed(wire22[(3'h7):(3'h6)])) : reg32);
            end
        end
      else
        begin
          reg34 <= wire23[(4'hb):(3'h5)];
          reg35 <= wire25[(1'h1):(1'h1)];
          reg36 <= ($unsigned(wire26) ?
              (+((~(wire30 ?
                  (8'ha6) : reg32)) >> reg32)) : ($signed((~&wire27[(2'h3):(1'h1)])) > $signed((&$signed(reg35)))));
          reg37 <= {($unsigned(($unsigned(reg33) * $signed(wire25))) <<< ((&wire25) ?
                  $unsigned($signed(reg34)) : (wire29 ^~ {wire24, wire31}))),
              wire24};
          reg38 <= {(|$unsigned((-$unsigned(reg37)))),
              (($unsigned({wire26, wire30}) ?
                  wire30[(4'ha):(4'h9)] : wire27) * reg34)};
        end
      reg39 <= (+({$unsigned(wire26[(4'hd):(4'h9)]), (&$unsigned(wire30))} ?
          ($unsigned(((8'hb6) ^~ wire29)) ?
              $unsigned((wire31 == reg32)) : $signed($signed(reg38))) : wire27[(3'h4):(2'h2)]));
    end
  assign wire40 = (+$unsigned(reg39));
  always
    @(posedge clk) begin
      reg41 <= wire30;
      if (reg32)
        begin
          if ((((($unsigned((8'hab)) - $signed(wire24)) ^~ reg38[(1'h0):(1'h0)]) <= wire31) || ((8'hb8) ?
              $unsigned((-(wire40 ? (8'hb4) : (8'hb8)))) : ($signed(reg34) ?
                  $unsigned((reg33 ?
                      (8'h9e) : reg39)) : ($unsigned(wire26) <<< reg32)))))
            begin
              reg42 <= (((~|(^~(8'hbe))) ?
                      {({wire40,
                              wire40} << $signed((8'hab)))} : $signed(wire40[(3'h6):(3'h5)])) ?
                  $signed($unsigned($unsigned({reg41,
                      reg37}))) : ($signed((reg34 ?
                      wire40 : $signed(reg33))) && reg38[(1'h1):(1'h0)]));
              reg43 <= $signed((((8'ha0) == ((wire24 ?
                  wire30 : wire29) ~^ wire40[(3'h4):(1'h0)])) || reg37[(1'h1):(1'h1)]));
              reg44 <= $unsigned($unsigned($unsigned(reg42[(4'h9):(3'h6)])));
              reg45 <= ({(^~(((8'ha5) ? (8'hb0) : reg39) ?
                      (8'hb2) : reg43))} + (((^~reg38[(1'h0):(1'h0)]) ?
                  reg35 : wire31[(2'h2):(2'h2)]) != ((^(wire26 ?
                  reg38 : wire40)) <<< $unsigned(((8'hae) | wire24)))));
            end
          else
            begin
              reg42 <= (!$signed(reg34[(4'h9):(1'h0)]));
              reg43 <= ((!(((reg45 ? reg32 : wire28) & (^reg37)) ?
                      wire23 : (~|(8'haf)))) ?
                  $signed(wire24[(4'h9):(1'h1)]) : (!$signed((8'ha5))));
              reg44 <= (((+$signed($signed((8'hb2)))) ?
                  ($signed(wire26) | wire30[(4'hd):(3'h7)]) : wire22) >>> $unsigned(((-wire40) ?
                  ($unsigned(reg42) ? reg38 : wire24[(3'h5):(3'h4)]) : ((reg41 ?
                      reg34 : reg39) && {wire24}))));
              reg45 <= wire31[(1'h0):(1'h0)];
              reg46 <= $signed((($signed($signed(reg41)) ^~ {(~|(8'ha4)),
                  (reg41 ? reg41 : wire29)}) || wire24[(4'hd):(2'h3)]));
            end
          reg47 <= reg44[(2'h2):(1'h0)];
          reg48 <= reg45[(3'h7):(3'h5)];
          reg49 <= wire29[(1'h1):(1'h1)];
        end
      else
        begin
          reg42 <= $signed(wire22[(4'h9):(2'h2)]);
          reg43 <= ((!((wire25[(1'h1):(1'h0)] ?
              $signed(reg49) : (~^wire23)) <= $signed($signed(reg49)))) <= wire30[(5'h11):(3'h6)]);
          if ({$unsigned(wire22)})
            begin
              reg44 <= reg46[(4'hb):(3'h5)];
              reg45 <= {{(~|wire31[(4'h9):(1'h1)])}};
              reg46 <= (reg45 && (+$unsigned(((reg32 ?
                  reg39 : reg45) - reg47[(2'h2):(1'h1)]))));
              reg47 <= $signed(($signed(reg33[(1'h1):(1'h1)]) ?
                  (reg42 | reg36[(2'h2):(1'h0)]) : $unsigned(($unsigned(wire40) ?
                      $signed(reg41) : $unsigned(reg32)))));
            end
          else
            begin
              reg44 <= (!{wire23[(1'h1):(1'h1)],
                  $signed((~|wire25[(1'h0):(1'h0)]))});
              reg45 <= (~&reg35);
              reg46 <= (8'hb2);
            end
        end
      reg50 <= reg45[(3'h4):(2'h2)];
    end
  assign wire51 = (&$signed($unsigned(((wire27 ? reg46 : (8'hb9)) ?
                      (reg50 && reg49) : $signed(reg42)))));
  assign wire52 = (^~wire26[(1'h1):(1'h1)]);
  assign wire53 = $unsigned((wire28 ?
                      $unsigned((((8'hb7) == reg50) ?
                          $signed(wire24) : (~&(8'hb7)))) : {(((8'h9d) ?
                                  (8'hb7) : reg36) ?
                              reg36[(1'h1):(1'h1)] : wire26),
                          (wire31 ~^ (~&reg45))}));
  assign wire54 = $signed((8'hab));
  assign wire55 = (^wire30);
  assign wire56 = reg33;
  assign wire57 = {(reg42 + ((~|(~|reg33)) ? wire55 : reg33))};
  always
    @(posedge clk) begin
      if ({(wire23 ?
              $unsigned(((wire52 * reg48) ?
                  wire54 : (~|(8'hb2)))) : (wire28 >> wire40))})
        begin
          reg58 <= (!(wire54[(4'h9):(2'h3)] >= wire24));
          reg59 <= (!(($unsigned($signed(wire26)) ?
              $unsigned(reg35) : (reg39 ?
                  $signed(wire23) : (reg37 ^ reg41))) || wire29));
        end
      else
        begin
          reg58 <= wire25[(2'h2):(1'h1)];
          if (reg35)
            begin
              reg59 <= reg39[(3'h6):(3'h4)];
              reg60 <= (8'ha5);
              reg61 <= $unsigned(reg48);
              reg62 <= reg47[(4'ha):(2'h3)];
              reg63 <= (8'ha1);
            end
          else
            begin
              reg59 <= $unsigned($unsigned(((~reg46) ?
                  $unsigned((|reg63)) : (^~(wire30 ? reg41 : reg63)))));
            end
          reg64 <= $unsigned(reg45);
          reg65 <= ($unsigned($unsigned(reg64[(4'hc):(4'hb)])) + wire52[(1'h1):(1'h0)]);
        end
      if ((~&(|(((^~reg32) ? reg43[(3'h7):(3'h5)] : $signed(reg65)) ?
          {{reg44}} : reg62[(1'h1):(1'h0)]))))
        begin
          reg66 <= $unsigned(($signed(reg46[(4'hb):(4'ha)]) > $unsigned(wire54[(5'h14):(1'h1)])));
        end
      else
        begin
          if (wire29)
            begin
              reg66 <= (($signed($signed($unsigned(reg43))) != ($unsigned({reg49,
                          reg63}) ?
                      wire26 : wire52)) ?
                  (7'h40) : (|$unsigned(({(8'hb5)} >= $unsigned(wire29)))));
            end
          else
            begin
              reg66 <= (&($signed({wire56, (wire54 ? wire55 : reg64)}) ?
                  $unsigned({(reg50 ? wire28 : wire24),
                      $unsigned(wire30)}) : (~|reg58)));
              reg67 <= reg62;
              reg68 <= $unsigned(($unsigned((wire55[(3'h4):(3'h4)] << $unsigned(reg32))) ?
                  (~&($unsigned(reg62) ?
                      $unsigned(reg46) : reg65[(3'h7):(3'h4)])) : $unsigned($unsigned($unsigned((8'hb9))))));
              reg69 <= wire30[(1'h0):(1'h0)];
              reg70 <= $signed($unsigned((-$signed(reg38[(1'h0):(1'h0)]))));
            end
          if (wire54[(4'hc):(3'h5)])
            begin
              reg71 <= $unsigned((8'ha0));
              reg72 <= {{(((reg47 >> (8'hb8)) ? (&reg61) : (~reg64)) ?
                          ($unsigned(wire52) != $signed(reg33)) : $signed((reg64 ?
                              reg39 : reg50)))},
                  (reg37 ?
                      $signed(($unsigned(reg37) ^ reg39[(1'h1):(1'h0)])) : $signed(wire51[(3'h5):(3'h5)]))};
              reg73 <= $unsigned({(|reg33[(2'h2):(1'h0)]),
                  (^reg34[(3'h5):(1'h0)])});
              reg74 <= reg65[(5'h13):(4'hb)];
            end
          else
            begin
              reg71 <= (~|(8'ha8));
              reg72 <= wire55[(5'h10):(1'h1)];
              reg73 <= $unsigned($signed($signed($unsigned(reg46))));
            end
          reg75 <= (7'h41);
        end
      reg76 <= $signed(reg49);
      reg77 <= (((reg68[(2'h2):(2'h2)] ?
              ({reg60, reg41} & (8'ha5)) : (^~{wire25})) ?
          $unsigned((wire56[(4'ha):(1'h1)] + wire52[(2'h2):(1'h1)])) : reg32[(3'h6):(1'h1)]) & reg60);
    end
  assign wire78 = (((^{{(8'hb1)}, (^~(7'h41))}) ?
                          (|reg65[(3'h4):(1'h1)]) : {(~(|wire55)), (8'ha9)}) ?
                      {$signed((~&(wire24 | reg44))),
                          $unsigned(({reg59} ?
                              $signed(wire53) : reg33[(1'h1):(1'h0)]))} : (reg73 ?
                          $unsigned((~|(^reg46))) : $signed(reg50)));
  assign wire79 = reg70;
  assign wire80 = ($unsigned(reg64) & ({$signed($signed(wire30)),
                          ((wire28 == reg46) ? (!wire25) : reg32)} ?
                      (reg66 <<< reg66[(3'h5):(3'h4)]) : (reg42 > $unsigned(((8'hba) * (8'hb8))))));
endmodule

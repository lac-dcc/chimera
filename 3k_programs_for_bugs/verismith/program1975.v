module top
#(parameter param62 = ((7'h40) ? ({(((8'ha2) != (8'ha5)) >>> ((7'h41) ? (8'hab) : (8'h9c))), (&((8'hb3) > (8'ha4)))} <= (({(8'ha6)} ? ((8'hbc) ? (8'hbc) : (8'hb7)) : (~&(8'hba))) != ((8'hbf) ^ ((8'had) ? (8'hb9) : (8'ha3))))) : (((+((8'hb6) ? (7'h42) : (8'hb3))) ? (&((8'had) ? (8'hbf) : (8'hb0))) : ((~(8'hb9)) ? {(8'hbd), (8'h9f)} : ((8'ha7) ? (8'hab) : (8'hbc)))) ? (((8'ha5) >> (~^(8'hb4))) ? (((8'hb1) ? (8'hbd) : (8'ha0)) ? ((8'hab) ? (8'hbb) : (8'hbc)) : (~(8'h9c))) : (((7'h40) >= (8'hb2)) >= ((8'hb4) ? (8'h9f) : (8'ha1)))) : {{((8'hbf) + (7'h41))}, (^((8'h9f) ? (8'hac) : (8'hba)))})), 
parameter param63 = param62)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire60,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = (((!wire3) ~^ (wire0[(1'h0):(1'h0)] ?
                     $signed($unsigned(wire4)) : {(wire4 & (8'hb1)),
                         wire2[(3'h6):(3'h4)]})) ^ ($signed((^~wire1)) >> (~^{$signed(wire0)})));
  assign wire6 = ($unsigned(($signed((wire5 | (8'had))) ?
                     (wire1[(4'ha):(2'h3)] ^ $unsigned(wire2)) : (+(~wire3)))) << (wire2[(2'h3):(1'h1)] ?
                     (8'hb3) : ($unsigned((~^wire4)) >> $unsigned(((8'hb1) ?
                         wire5 : wire1)))));
  assign wire7 = {$signed((|wire1)), $unsigned($signed(wire0[(2'h3):(2'h3)]))};
  assign wire8 = $signed((wire6 || $signed(wire0)));
  always
    @(posedge clk) begin
      if ((((wire3 ? wire2 : wire1[(4'h8):(2'h3)]) ?
          ({(wire3 ? wire8 : wire0)} == ({wire5, (7'h44)} ?
              wire1[(4'ha):(4'h8)] : (wire5 | wire5))) : ((~^wire2) ?
              wire7 : $unsigned((+wire4)))) & {(8'ha6)}))
        begin
          reg9 <= ((^~(wire0 ? $signed(((8'hb6) << wire0)) : (8'hb0))) ?
              ($unsigned((!(!wire2))) >> wire3) : ((wire4 & ((&(8'hac)) ?
                  $signed(wire0) : (wire0 ?
                      wire7 : wire3))) > wire7[(1'h0):(1'h0)]));
        end
      else
        begin
          reg9 <= $unsigned((|reg9[(4'hf):(2'h2)]));
          if ($unsigned($unsigned((|(&wire6)))))
            begin
              reg10 <= (^{reg9,
                  $signed(($unsigned(wire4) ? {wire1, wire5} : (8'ha8)))});
              reg11 <= wire7;
              reg12 <= wire1;
              reg13 <= $unsigned(($unsigned(($unsigned(wire7) * $signed(wire2))) == ({(&reg11),
                  (wire0 < wire4)} || wire3[(1'h0):(1'h0)])));
              reg14 <= $signed((~$unsigned($unsigned((reg9 < wire8)))));
            end
          else
            begin
              reg10 <= $unsigned({($unsigned((wire1 & wire3)) ?
                      ({reg9, reg14} && (reg9 ?
                          reg10 : wire3)) : (reg9 < $unsigned(wire8)))});
              reg11 <= reg14;
              reg12 <= ((wire0 + (-(~$signed(wire3)))) ?
                  $signed((-(~&(wire8 ? wire5 : reg13)))) : reg9);
              reg13 <= (^~((~&(&wire7[(4'hf):(4'hf)])) <<< reg14));
              reg14 <= wire4;
            end
        end
      reg15 <= (((8'hb7) ?
              (wire0[(2'h3):(2'h3)] ?
                  ((wire8 ?
                      reg12 : wire5) && (reg11 > wire5)) : (8'hb9)) : (wire5 >>> wire6)) ?
          ((~&(~&wire3)) ?
              reg13 : reg12) : $unsigned((&$signed((wire4 - reg9)))));
      if (reg15[(3'h6):(2'h3)])
        begin
          reg16 <= $signed($signed((8'h9d)));
          reg17 <= ($unsigned(wire2[(3'h7):(3'h7)]) != reg9);
          reg18 <= wire3;
          reg19 <= (((reg10 ?
                      (!$unsigned(wire3)) : (wire2 ?
                          reg17 : {reg15, (8'ha1)})) ?
                  ($unsigned($signed(wire6)) ?
                      reg17 : wire7) : (~$unsigned((reg10 ? wire0 : reg12)))) ?
              (+(((~&wire8) ?
                  (wire5 ? reg13 : reg10) : $signed(wire5)) << $signed((wire8 ?
                  (8'h9c) : reg13)))) : $signed((((reg15 != wire4) ?
                      (reg10 >>> reg10) : $signed(reg14)) ?
                  $unsigned((8'hb5)) : reg10[(4'h8):(3'h5)])));
        end
      else
        begin
          if ($signed(wire1[(4'hd):(4'hd)]))
            begin
              reg16 <= (~^(reg10[(1'h0):(1'h0)] ~^ (^~reg14[(3'h4):(3'h4)])));
              reg17 <= $signed((^~(((reg13 ? (8'hb6) : wire4) ?
                  (wire5 ?
                      reg9 : wire5) : (-wire8)) - $signed($signed(wire8)))));
              reg18 <= $signed((((+(reg9 >= reg17)) ?
                  reg12[(4'hc):(3'h7)] : (8'ha7)) ^ wire6));
              reg19 <= (^$unsigned(({(^~(8'ha8))} ?
                  ((~|reg18) || $signed(reg18)) : (8'hab))));
            end
          else
            begin
              reg16 <= reg16;
              reg17 <= (^~reg19[(2'h2):(1'h0)]);
              reg18 <= (({wire1[(4'he):(2'h2)]} ?
                  (({wire3} ? (wire1 ? wire3 : wire1) : (~&wire3)) ?
                      (~$signed((8'hbd))) : wire6[(1'h1):(1'h1)]) : (|$signed((&reg12)))) + (8'hb8));
              reg19 <= (8'ha6);
            end
          reg20 <= ((8'h9e) ? (^(-(!(reg14 || reg9)))) : wire3[(3'h4):(3'h4)]);
        end
    end
  module21 #() modinst61 (.wire22(wire6), .wire24(wire2), .wire25(reg14), .y(wire60), .clk(clk), .wire23(reg12));
endmodule

module module21
#(parameter param58 = {((8'h9e) ? {((~^(8'hb3)) == ((8'h9c) ? (8'hb7) : (8'hb1)))} : (!(((8'h9c) ? (8'hb9) : (8'hae)) ? ((8'ha2) ? (8'hb9) : (8'haf)) : (~^(8'hb2))))), (~^((~^(-(8'h9d))) || (((7'h44) << (8'ha0)) * (-(8'hbd)))))}, 
parameter param59 = param58)
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire31;
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  assign y = {wire57,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
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
                 wire34,
                 wire31,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg33,
                 reg32,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'ha8))
        begin
          reg26 <= ({wire25[(3'h7):(3'h7)], wire23} > $signed(wire23));
          reg27 <= ((wire22 ^ ({(~|wire22)} > ((wire22 | (8'h9d)) ?
              (wire24 >>> reg26) : wire24))) == {(8'hac)});
        end
      else
        begin
          reg26 <= $signed((($signed((~wire22)) ?
                  ({reg26} != (~^reg26)) : (reg26[(3'h5):(1'h0)] != (&wire24))) ?
              (((wire23 ?
                  wire23 : wire22) == (wire22 < reg26)) != $signed(wire23)) : (wire24 <= (((8'h9f) ^ wire24) ~^ (wire22 ?
                  wire22 : reg27)))));
          reg27 <= (&(reg26 ?
              $unsigned(({wire23, wire23} ?
                  (wire25 ~^ reg26) : wire23[(3'h4):(1'h0)])) : (wire24[(1'h1):(1'h1)] ?
                  wire25 : ((^~(8'h9c)) ? $unsigned(wire23) : wire25))));
          reg28 <= (!{$signed({(+wire23)}), $signed($unsigned(reg26))});
          reg29 <= reg27;
        end
      reg30 <= $unsigned(reg26[(5'h12):(5'h11)]);
    end
  assign wire31 = ($signed((&$signed((reg30 <= reg29)))) ?
                      ($unsigned(reg29[(4'hc):(4'h8)]) || ({$unsigned(reg29)} > (^~reg27[(3'h4):(1'h0)]))) : (((-reg28[(3'h4):(2'h2)]) & ({reg30,
                              reg27} ?
                          {reg30} : (~reg29))) <<< (({(8'ha3),
                          reg28} & ((8'hb9) ? reg26 : wire25)) - wire24)));
  always
    @(posedge clk) begin
      reg32 <= $unsigned(wire23);
      reg33 <= (reg27 ? $unsigned(wire31) : reg28);
    end
  assign wire34 = (^~wire31);
  assign wire35 = (reg28 * ((8'ha7) ?
                      (&(~&(wire22 ^~ reg29))) : wire24[(1'h1):(1'h1)]));
  assign wire36 = {$unsigned({$unsigned(wire34), $signed($signed(wire25))}),
                      {(~$signed((reg29 >> reg33)))}};
  assign wire37 = {((~&$signed((reg26 << wire35))) ?
                          (wire35 ?
                              $unsigned($signed(reg29)) : {(wire31 ?
                                      reg27 : wire25)}) : {(&wire25[(4'h9):(3'h4)]),
                              $signed(wire24[(3'h7):(3'h7)])}),
                      (wire35 || {reg28[(1'h1):(1'h1)], reg30[(4'hb):(3'h4)]})};
  assign wire38 = reg27[(1'h1):(1'h1)];
  assign wire39 = wire23[(4'hc):(1'h1)];
  assign wire40 = $unsigned((~&reg33[(3'h5):(1'h0)]));
  assign wire41 = wire38;
  assign wire42 = wire24;
  assign wire43 = $signed(($unsigned((8'hb4)) != (-(wire38[(4'hf):(3'h5)] ?
                      (wire23 >>> reg29) : wire42))));
  assign wire44 = $unsigned((!(~^{reg27[(1'h0):(1'h0)]})));
  assign wire45 = wire41;
  assign wire46 = (wire38 == $unsigned($unsigned($signed($unsigned(wire40)))));
  assign wire47 = (|($unsigned(reg30) >= wire39[(3'h6):(1'h1)]));
  assign wire48 = $unsigned(wire44[(1'h1):(1'h0)]);
  assign wire49 = ((wire38[(4'hf):(3'h4)] ?
                          ((-((8'hb1) != wire39)) ?
                              reg26 : wire37[(3'h5):(3'h4)]) : wire47) ?
                      ((-((|reg33) ?
                              wire43[(2'h2):(1'h1)] : reg28[(3'h6):(3'h6)])) ?
                          ((^$signed(wire25)) | $unsigned($unsigned(reg27))) : (+$signed(wire31))) : (~&reg33[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned($signed({(8'hb0)})))))
        begin
          reg50 <= $unsigned($signed($unsigned(wire37)));
          if (reg26[(4'hd):(4'hd)])
            begin
              reg51 <= ($unsigned(reg27) & {$signed(((wire44 * wire44) ?
                      (wire44 ? (8'haf) : reg27) : $signed(wire42)))});
              reg52 <= reg26[(5'h11):(4'he)];
            end
          else
            begin
              reg51 <= $unsigned(wire48);
            end
          reg53 <= ($unsigned((({wire31, wire25} ?
                  $unsigned(wire25) : wire40) < wire25[(3'h6):(3'h5)])) ?
              {($unsigned($unsigned(reg32)) ?
                      (8'h9c) : $signed((wire31 >> wire22))),
                  reg26} : wire49);
          reg54 <= {reg33, {wire43}};
        end
      else
        begin
          if (reg32[(1'h0):(1'h0)])
            begin
              reg50 <= $unsigned(((^wire34) | (({wire35,
                      wire42} >>> $signed((7'h44))) ?
                  (~^reg51[(1'h1):(1'h0)]) : $unsigned((wire39 != wire25)))));
              reg51 <= $unsigned((({(~wire42), (wire39 > wire31)} >> wire47) ?
                  wire37[(3'h4):(1'h0)] : (($unsigned(wire48) >>> $signed(wire35)) ?
                      (8'hbb) : $signed((wire38 ? reg54 : reg54)))));
              reg52 <= wire31[(2'h3):(2'h2)];
            end
          else
            begin
              reg50 <= (~&$unsigned(wire34[(1'h1):(1'h0)]));
            end
        end
      reg55 <= reg51[(1'h1):(1'h0)];
      reg56 <= wire38[(5'h12):(4'hb)];
    end
  assign wire57 = {(((wire23[(1'h0):(1'h0)] < $unsigned((8'ha2))) ?
                              wire37 : ((wire47 ?
                                  wire23 : (8'hb0)) || (^(8'hb2)))) ?
                          wire36 : wire46[(2'h3):(2'h2)])};
endmodule

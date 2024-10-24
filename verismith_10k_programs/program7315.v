module top
#(parameter param44 = ((8'ha9) ? ((~|((&(8'ha6)) ? ((8'h9c) * (8'hbb)) : (~&(8'ha2)))) <<< (!(~|(~|(8'hba))))) : ((8'hab) < ({((8'hbb) ? (8'h9d) : (8'h9d)), ((8'h9f) ? (8'ha9) : (8'h9d))} || (((8'ha7) >= (8'ha8)) ^~ ((7'h44) > (7'h43)))))), 
parameter param45 = {param44})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire25,
                 wire24,
                 wire8,
                 wire6,
                 wire5,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned({(((|wire3) != (wire1 ? wire2 : wire2)) ?
                         ((wire4 + wire0) == {(8'hb1),
                             wire3}) : wire1[(3'h7):(3'h4)]),
                     ({(^~wire0)} - {wire3[(3'h7):(3'h7)]})});
  assign wire6 = ({wire3,
                         (((wire0 ? wire5 : wire3) >>> (!wire2)) ?
                             wire4 : (^~(wire1 ^ wire4)))} ?
                     wire3[(4'h8):(1'h0)] : wire1);
  always
    @(posedge clk) begin
      reg7 <= $unsigned($signed((({wire2} ?
          (~(8'hbc)) : (wire2 ?
              wire6 : wire0)) ^ $unsigned(wire0[(1'h0):(1'h0)]))));
    end
  assign wire8 = (wire0[(1'h1):(1'h1)] >= ((8'h9f) ^~ wire6[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      reg9 <= ($signed($unsigned((^~(8'ha0)))) ?
          wire4[(5'h12):(4'hb)] : (8'h9c));
      if (((~|(!reg9[(3'h5):(1'h1)])) ?
          $signed($unsigned(((wire2 ?
              wire5 : wire6) || $signed((7'h43))))) : $signed({wire5,
              wire2[(4'hb):(1'h0)]})))
        begin
          if ($signed(wire3[(3'h4):(1'h1)]))
            begin
              reg10 <= reg9;
              reg11 <= (({$signed((-wire2))} ?
                  $signed(wire5) : $unsigned(((reg9 ?
                      wire6 : (8'hb7)) << $unsigned(wire1)))) <<< {$signed(wire2)});
              reg12 <= (8'hbe);
              reg13 <= (^(^(($unsigned(wire6) || $unsigned(wire6)) + $unsigned((-wire2)))));
            end
          else
            begin
              reg10 <= $signed($unsigned($signed((wire6 ? (+wire6) : wire6))));
              reg11 <= $signed($signed((~^wire8)));
            end
          reg14 <= ((-(&$signed((wire3 ? (7'h44) : wire0)))) ?
              ((reg11[(4'h8):(2'h2)] - (8'ha7)) ?
                  reg12[(1'h0):(1'h0)] : $signed(wire4[(3'h6):(1'h1)])) : reg13);
          reg15 <= $unsigned(($unsigned(reg11) ?
              $signed({((8'ha7) | wire6)}) : $unsigned($unsigned((reg9 ?
                  (8'hbe) : wire4)))));
          reg16 <= $unsigned($signed(wire6));
        end
      else
        begin
          if ($unsigned(reg16[(1'h1):(1'h1)]))
            begin
              reg10 <= ({$unsigned((^{wire0})), (~^$signed({wire8, reg10}))} ?
                  reg16[(1'h0):(1'h0)] : $signed((({(8'hb5)} ?
                      wire6[(3'h5):(2'h2)] : (wire2 ~^ reg9)) <<< $unsigned({reg13}))));
              reg11 <= {(!(~^(^(wire5 >>> (8'hab))))),
                  (wire3 ?
                      $signed(reg9) : (!$signed((wire5 ? (8'ha7) : wire6))))};
              reg12 <= reg14[(2'h2):(2'h2)];
            end
          else
            begin
              reg10 <= (((wire4 - (reg7[(5'h10):(2'h3)] ?
                      (wire1 << reg13) : reg15[(4'hf):(1'h0)])) - $signed((|(~^wire3)))) ?
                  $unsigned($unsigned($unsigned(reg12[(1'h1):(1'h1)]))) : ($signed($signed($signed(reg16))) && (^{reg10})));
              reg11 <= {$unsigned({reg7[(3'h4):(1'h1)]})};
            end
          if ($signed((8'ha7)))
            begin
              reg13 <= ($unsigned(wire0) ?
                  reg16[(4'hc):(4'hb)] : $signed((~^reg7)));
              reg14 <= (-$signed((8'hb0)));
              reg15 <= (8'h9d);
              reg16 <= ((((wire3 | (~&wire0)) * (reg16[(4'ha):(3'h4)] ?
                  reg13 : $signed(wire0))) * (~&wire6)) || $unsigned(reg14[(2'h2):(1'h0)]));
            end
          else
            begin
              reg13 <= reg12[(3'h4):(2'h3)];
              reg14 <= $signed(($signed($unsigned((~&wire2))) ?
                  reg7[(4'ha):(4'h9)] : {(reg16 ~^ reg13),
                      (^reg10[(3'h4):(1'h1)])}));
              reg15 <= $signed(reg11[(3'h6):(3'h5)]);
            end
        end
      reg17 <= reg16[(3'h5):(3'h4)];
      if ((-$unsigned(wire8)))
        begin
          if ($signed($unsigned((~(~^wire3)))))
            begin
              reg18 <= (((wire0 | ($signed(wire3) ?
                  (7'h44) : (!wire3))) - (($signed(wire0) ?
                      $unsigned(wire2) : (+wire3)) ?
                  (8'ha7) : {(8'hb8)})) ^ reg12);
            end
          else
            begin
              reg18 <= (reg10[(2'h2):(1'h1)] ~^ (reg16[(3'h4):(1'h0)] ?
                  (~|(~^{reg15})) : ($unsigned(wire8[(3'h4):(2'h2)]) ?
                      $signed($unsigned(reg15)) : $signed($unsigned(wire8)))));
            end
          reg19 <= ($unsigned(($signed((&(8'hac))) ^ $unsigned((!reg10)))) >>> (reg10[(1'h1):(1'h0)] ^ (^wire4)));
          if ((|$unsigned(((&reg12[(3'h7):(2'h2)]) + $unsigned((reg9 ?
              reg18 : reg17))))))
            begin
              reg20 <= $unsigned(wire2);
              reg21 <= wire3[(3'h5):(3'h4)];
              reg22 <= (reg17[(3'h7):(1'h1)] ?
                  (wire8 ? (!(-(~&reg21))) : wire5) : {(^~{$signed((8'hb3)),
                          ((7'h44) ? reg16 : (8'ha7))})});
              reg23 <= wire3;
            end
          else
            begin
              reg20 <= $signed((wire2 ?
                  $signed(reg23) : (((~reg16) ?
                          $signed(wire0) : ((8'ha0) ? wire5 : (8'hbf))) ?
                      wire8[(4'ha):(3'h6)] : reg7[(4'h8):(3'h7)])));
            end
        end
      else
        begin
          reg18 <= (~|$unsigned({($signed(wire5) ? (~^wire4) : wire2)}));
          reg19 <= {$unsigned($unsigned(((reg20 ? reg21 : reg9) ?
                  ((8'hbd) >>> reg16) : $unsigned(reg21))))};
          reg20 <= wire6;
          reg21 <= ((|(-(reg15[(5'h11):(4'hf)] ?
                  $unsigned(reg19) : ((8'ha6) + wire1)))) ?
              (reg19[(2'h2):(1'h1)] || wire5) : (-((((8'hb0) ? wire3 : reg14) ?
                  $unsigned(reg10) : $signed(wire3)) && $signed($signed(reg16)))));
        end
    end
  assign wire24 = reg12[(3'h6):(2'h3)];
  assign wire25 = (~&(|wire4[(4'hb):(2'h3)]));
  always
    @(posedge clk) begin
      if ((reg17[(1'h0):(1'h0)] << ($signed({{reg7, reg23},
          $unsigned(reg17)}) >= {$unsigned($signed(wire5))})))
        begin
          reg26 <= $signed((reg21 >>> ((wire6 ?
              (!wire4) : reg23[(3'h6):(1'h0)]) * (wire24[(3'h7):(3'h6)] ?
              {reg20, (8'hb4)} : (wire3 ? reg13 : reg12)))));
          reg27 <= ({reg10,
              $signed(reg14[(2'h2):(1'h1)])} & (!$unsigned((^{wire6}))));
          if ((+(($signed((reg9 ? wire5 : wire5)) ^~ ($unsigned(reg27) ?
              ((8'hbb) ? wire1 : reg10) : (wire8 ?
                  wire3 : wire1))) && $signed(({reg23} | $unsigned(reg12))))))
            begin
              reg28 <= (&reg10[(2'h2):(1'h1)]);
              reg29 <= (wire5[(4'h8):(3'h4)] ?
                  $unsigned(($unsigned((reg14 ?
                      reg22 : reg18)) | $signed((|(8'h9d))))) : ($signed(wire6) ?
                      reg19[(4'h9):(3'h7)] : (reg27 ?
                          reg10 : reg19[(4'h8):(3'h6)])));
              reg30 <= reg15;
              reg31 <= (~&$signed((reg19 != ($signed(reg15) ?
                  $signed(wire3) : (wire4 ? reg7 : reg22)))));
            end
          else
            begin
              reg28 <= $unsigned(reg22);
              reg29 <= $unsigned((8'ha3));
            end
          reg32 <= (wire5 ?
              $signed(reg26) : ((&(!$signed(reg26))) ?
                  $signed(($signed(wire1) <= $unsigned(reg13))) : wire3));
          reg33 <= (reg7 ?
              reg18[(5'h15):(3'h6)] : (($signed($unsigned(wire25)) ?
                  $unsigned($signed(reg11)) : $unsigned(reg9[(3'h5):(2'h3)])) == (!$signed($signed(wire25)))));
        end
      else
        begin
          reg26 <= $unsigned(reg15);
          reg27 <= reg9;
          reg28 <= reg15[(4'ha):(3'h6)];
        end
      reg34 <= wire2;
      reg35 <= $signed(reg7);
    end
  assign wire36 = $unsigned({reg17[(4'h9):(1'h1)]});
  assign wire37 = $signed(((reg23 ?
                          ((reg19 ? wire1 : reg18) ?
                              (wire8 && wire4) : (reg29 ?
                                  reg21 : reg9)) : (((8'ha8) >= wire8) ?
                              (&(8'h9f)) : $unsigned(reg12))) ?
                      wire2[(3'h6):(1'h0)] : $unsigned($signed($unsigned(reg30)))));
  assign wire38 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire39 = ($signed((((|(8'h9f)) ?
                              $signed(wire4) : (wire6 ? reg22 : reg9)) ?
                          {(~|reg16)} : ((wire6 ^~ reg11) ?
                              (reg15 ?
                                  reg35 : reg29) : wire4[(2'h3):(2'h2)]))) ?
                      $signed($unsigned(reg26)) : reg28[(3'h6):(1'h0)]);
  assign wire40 = ((^~($unsigned((reg34 | (8'haf))) != $signed({(7'h43)}))) ?
                      (8'hba) : (8'haa));
  assign wire41 = reg21[(2'h2):(2'h2)];
  assign wire42 = wire6[(3'h6):(2'h3)];
  assign wire43 = reg12;
endmodule

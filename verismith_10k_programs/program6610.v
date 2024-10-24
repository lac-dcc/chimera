module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire49;
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  assign y = {wire51,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire18,
                 wire19,
                 wire49,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire4 = (wire3[(3'h5):(3'h4)] ^~ (8'hb2));
  assign wire5 = (~^(|wire1));
  assign wire6 = wire1[(5'h10):(3'h5)];
  assign wire7 = ({(wire4 ?
                             (wire2 ?
                                 wire6[(2'h2):(1'h1)] : $unsigned(wire1)) : (~|$signed(wire5))),
                         wire6} ?
                     wire0[(4'hf):(4'he)] : ({wire3} >>> (!$signed($signed(wire0)))));
  assign wire8 = $unsigned($unsigned(($unsigned((wire4 ?
                     wire4 : wire4)) + wire0)));
  always
    @(posedge clk) begin
      reg9 <= wire2[(4'h9):(4'h8)];
      reg10 <= {$signed($signed((~^wire3[(1'h0):(1'h0)])))};
      reg11 <= reg9[(2'h3):(2'h3)];
      if (((($unsigned({wire8}) ?
              ((wire5 >> wire7) & {wire6, wire5}) : (~|(-wire2))) ?
          wire1[(3'h5):(3'h4)] : $unsigned(reg11)) + wire8))
        begin
          reg12 <= (reg10[(3'h4):(2'h3)] ?
              ($unsigned(((wire1 >= wire6) - $unsigned(wire2))) ?
                  $unsigned(reg11) : ($unsigned(reg11) - $unsigned({wire7,
                      wire4}))) : $unsigned({wire6[(2'h2):(1'h1)],
                  ((wire8 & wire1) ? $unsigned(wire0) : $unsigned(wire8))}));
          reg13 <= $unsigned({(((wire0 ?
                  reg9 : (8'hb3)) << $signed(wire8)) - reg11)});
          reg14 <= wire6[(3'h7):(1'h1)];
          reg15 <= (wire1 >>> $unsigned((8'ha6)));
          reg16 <= $signed(reg15);
        end
      else
        begin
          reg12 <= $unsigned(((wire1 ?
                  {{reg11}} : $signed(reg11[(3'h6):(3'h6)])) ?
              $signed((~|(~reg10))) : reg15[(4'he):(3'h7)]));
          reg13 <= reg9;
          reg14 <= {(($unsigned((~^reg12)) & (!$unsigned(reg10))) ?
                  $signed((reg16[(4'ha):(4'h8)] & (~^reg10))) : (({reg16,
                              reg9} ?
                          $unsigned(wire8) : $signed(reg9)) ?
                      {(|reg16), (&wire5)} : ((wire2 == wire0) ?
                          (|reg16) : (~^reg12))))};
        end
      reg17 <= ($signed($signed($signed((reg14 ?
          wire4 : reg15)))) <<< $signed({((wire3 | (8'haf)) << $signed(wire3))}));
    end
  assign wire18 = reg13[(2'h2):(1'h0)];
  assign wire19 = ($signed($unsigned((~|$signed(wire8)))) != (-(!$signed($signed(wire18)))));
  always
    @(posedge clk) begin
      if ($unsigned((8'hb7)))
        begin
          reg20 <= (~^({(wire5 >> $signed((8'ha9))), wire3} && (((wire2 ?
              reg15 : reg11) != (~|reg11)) + reg17[(1'h1):(1'h1)])));
          reg21 <= reg9;
          if (reg15[(4'he):(4'hb)])
            begin
              reg22 <= ($signed($unsigned($signed(reg21))) != (^~$signed((^~$signed(wire2)))));
              reg23 <= (~^(!$signed($signed($unsigned(wire8)))));
              reg24 <= ($signed((wire8[(4'h8):(1'h1)] ?
                      ($unsigned(reg13) <= ((8'hb3) <= reg10)) : reg12)) ?
                  reg22[(4'ha):(2'h2)] : $unsigned($signed(reg10[(4'h9):(4'h9)])));
              reg25 <= wire5[(4'hf):(4'ha)];
            end
          else
            begin
              reg22 <= $unsigned(($signed({$unsigned(reg22), (+(8'hb1))}) ?
                  reg16 : (reg24[(2'h2):(2'h2)] >= wire6[(3'h6):(3'h6)])));
              reg23 <= (-reg20);
              reg24 <= ((((^~wire6[(3'h4):(1'h0)]) <= (8'ha1)) >= ($unsigned((wire3 || wire0)) ?
                      wire3 : wire7)) ?
                  (^~{$signed((wire2 ?
                          reg25 : (8'hb9)))}) : $signed(($unsigned($signed(reg10)) - (|$signed((8'ha9))))));
              reg25 <= $signed((reg22[(2'h3):(1'h1)] <<< (((8'haf) ?
                      (reg16 ? wire3 : wire4) : {reg23}) ?
                  (reg9[(3'h6):(2'h3)] ?
                      reg24[(2'h2):(2'h2)] : $unsigned(reg21)) : $unsigned(reg24[(2'h2):(1'h0)]))));
            end
        end
      else
        begin
          reg20 <= $unsigned(($unsigned((wire1[(3'h4):(2'h3)] ?
              reg21[(2'h2):(1'h1)] : reg15[(4'ha):(4'h9)])) >> ({$unsigned(reg9)} == wire6[(1'h1):(1'h1)])));
        end
      if ({wire18[(3'h6):(2'h3)]})
        begin
          reg26 <= reg24[(1'h1):(1'h1)];
          reg27 <= reg26[(4'h9):(2'h3)];
        end
      else
        begin
          if (($unsigned((!(8'hac))) & (|reg27)))
            begin
              reg26 <= $signed($signed(reg25[(4'h9):(1'h1)]));
              reg27 <= (wire2[(1'h1):(1'h1)] > {($signed((wire7 <<< wire18)) - {(8'hba)})});
              reg28 <= $signed(reg27);
              reg29 <= reg11[(4'hf):(3'h5)];
            end
          else
            begin
              reg26 <= reg16;
            end
          reg30 <= (reg21 ?
              $signed(reg17[(2'h3):(1'h1)]) : {(wire18 || $signed((reg13 ?
                      reg28 : reg16))),
                  (~^(^~reg15[(4'hf):(3'h5)]))});
        end
    end
  module31 #() modinst50 (wire49, clk, wire1, reg16, reg15, reg23);
  assign wire51 = (8'hac);
endmodule

module module31
#(parameter param48 = ((({((8'hb1) ? (8'hb8) : (8'h9f))} >> (((8'hab) ? (8'hb5) : (8'ha4)) < (~|(8'hb4)))) >>> ({((8'haa) ? (8'ha7) : (8'hb8))} - (^~((8'ha8) >> (7'h43))))) ? (!((((7'h40) || (8'ha3)) ? (8'had) : ((7'h41) ? (8'ha0) : (7'h43))) || (((8'hb4) >>> (8'hb9)) <<< (|(8'hb5))))) : {{({(8'hbd)} <= (8'hab)), (~&((7'h42) >> (8'hbe)))}}))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire35;
  input wire [(4'h8):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire47,
                 wire38,
                 wire37,
                 wire36,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire36 = $signed(((~|wire35) + (8'ha0)));
  assign wire37 = ((wire35 ?
                          wire34[(3'h4):(2'h3)] : {(^~{wire32, wire36}),
                              ($unsigned(wire33) & (^~wire33))}) ?
                      (-((wire35 + (-wire32)) ?
                          (8'h9d) : {$signed(wire36),
                              (wire35 && wire34)})) : wire34[(2'h3):(2'h3)]);
  assign wire38 = $signed(((~&$unsigned($signed(wire36))) >= {wire35, wire33}));
  always
    @(posedge clk) begin
      reg39 <= {((|(wire33[(4'h8):(3'h6)] || (^~wire36))) ^~ (wire33[(3'h4):(1'h0)] ?
              $unsigned(wire33) : (^wire35[(3'h7):(1'h1)]))),
          wire32};
    end
  always
    @(posedge clk) begin
      if (((~^wire37) < {(~^wire37)}))
        begin
          reg40 <= {$signed({wire36,
                  (((8'ha4) >>> wire37) ?
                      wire35[(2'h3):(1'h1)] : $unsigned(reg39))})};
        end
      else
        begin
          reg40 <= $signed((&$unsigned({{wire34},
              (wire34 ? (8'hab) : reg40)})));
          if ((~$unsigned($unsigned({wire36[(1'h1):(1'h1)]}))))
            begin
              reg41 <= $signed($unsigned(wire36[(1'h0):(1'h0)]));
              reg42 <= {(wire35 <<< ((!(!wire38)) ?
                      (+wire34) : ((wire32 ? wire33 : wire35) <<< wire32))),
                  (~&$unsigned(wire37[(2'h3):(2'h2)]))};
              reg43 <= $unsigned($unsigned(($signed($signed(wire32)) * $signed((wire35 ?
                  wire35 : wire34)))));
            end
          else
            begin
              reg41 <= (wire38 ? wire33 : (^reg40));
              reg42 <= $unsigned(reg42);
              reg43 <= (^(^reg42));
              reg44 <= reg41[(3'h7):(3'h7)];
            end
          reg45 <= ($signed(($unsigned(wire38[(5'h10):(4'hc)]) ?
              $signed((-wire36)) : ((reg43 ? reg42 : reg41) <= ((8'hb2) ?
                  reg40 : wire35)))) < {(-(|$signed((8'haa)))),
              {$unsigned(reg39[(3'h6):(1'h0)])}});
          reg46 <= reg45;
        end
    end
  assign wire47 = wire33[(3'h5):(2'h3)];
endmodule

module top
#(parameter param32 = (((^{((8'hb4) ? (8'hb7) : (7'h43)), (~|(8'ha3))}) & ((((8'hb9) ? (8'ha4) : (8'hbc)) ? ((8'h9d) & (8'ha6)) : {(7'h43)}) << ((!(8'h9f)) >= (&(8'hbe))))) ? ({((^(8'ha0)) ^~ (7'h44)), (((8'hbd) & (8'h9c)) && ((8'ha1) >>> (8'ha9)))} ? ({((8'hb9) ? (8'h9e) : (7'h41)), ((8'hbf) != (8'hb4))} ? {(&(8'ha5))} : (~^(+(7'h44)))) : (~|(((8'ha3) ? (7'h42) : (8'hb1)) >> {(8'ha3), (8'ha1)}))) : (({((7'h44) ? (8'hb1) : (8'had)), ((8'ha3) ? (8'hb9) : (8'ha9))} < (((8'hb3) > (8'had)) == {(8'had), (8'h9f)})) ? ((((7'h41) == (8'ha0)) > {(8'ha5)}) >>> (~|((8'ha4) && (7'h43)))) : (({(8'hb6), (8'hb1)} && {(8'had), (8'h9e)}) ^ (((8'ha3) == (8'hb3)) >= ((8'hbe) == (8'hbb)))))), 
parameter param33 = (param32 ? param32 : param32))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire31,
                 wire28,
                 wire27,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg30,
                 reg29,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = ((^~(((wire2 != wire1) ?
                     $unsigned(wire3) : wire1) || ($signed(wire1) ?
                     $unsigned(wire0) : (8'hb4)))) & {(~wire1[(2'h3):(1'h1)]),
                     (((wire0 ? wire0 : wire1) ? wire3 : wire1[(3'h7):(1'h1)]) ?
                         (wire3 * (wire3 << wire1)) : $signed(wire2[(1'h0):(1'h0)]))});
  assign wire5 = wire2;
  assign wire6 = wire1;
  assign wire7 = $signed(wire6[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= wire2;
      reg9 <= ($signed(((|(reg8 >> wire7)) >> wire1)) ?
          $unsigned({($unsigned(wire0) ?
                  $signed((8'hb5)) : (+wire1))}) : ((($signed(wire5) ?
                  (wire7 == wire4) : $signed(wire2)) && (~&(wire7 < wire2))) ?
              wire1 : (((wire0 ? wire7 : wire4) ?
                      $signed(wire4) : $signed(wire2)) ?
                  wire0 : (8'ha6))));
      reg10 <= wire3[(3'h5):(3'h4)];
      if ($unsigned({reg8, $signed($signed($signed(wire0)))}))
        begin
          reg11 <= $signed(reg10);
        end
      else
        begin
          if (reg9)
            begin
              reg11 <= (~&(~|reg11));
              reg12 <= wire3;
              reg13 <= ((~&wire4) ?
                  (wire3 + $unsigned(((reg8 > wire1) ?
                      reg10[(3'h4):(2'h3)] : (^(8'haf))))) : $unsigned({$signed((^~wire5)),
                      $signed((wire5 | (8'h9c)))}));
              reg14 <= ($unsigned(((wire7 > $unsigned(reg13)) ?
                  ($signed(reg13) ?
                      reg8[(3'h6):(3'h4)] : (wire6 ?
                          wire3 : reg8)) : (8'ha9))) ^~ (wire0 <<< wire3));
              reg15 <= reg14;
            end
          else
            begin
              reg11 <= ($signed(wire0[(3'h5):(1'h1)]) ?
                  ($signed(($signed(wire2) & wire0)) ~^ (~|((wire6 <<< reg8) ?
                      (wire4 >> (8'ha9)) : (wire1 << wire7)))) : reg10[(1'h1):(1'h1)]);
              reg12 <= $signed((reg11[(3'h7):(1'h1)] >> (8'ha6)));
              reg13 <= (-{((~wire0[(3'h4):(2'h3)]) ^~ reg8)});
              reg14 <= ($signed((|(~^reg14))) && reg11);
              reg15 <= $unsigned({{{$unsigned(wire4)},
                      (((8'hb4) ? (8'hb7) : reg13) | {reg14})},
                  ((-$signed(reg14)) >> (&$unsigned(reg14)))});
            end
          reg16 <= $signed((~^wire0[(3'h6):(1'h1)]));
        end
      if ({wire7[(2'h3):(1'h0)], $unsigned(($unsigned((8'had)) + reg8))})
        begin
          reg17 <= $signed(($signed((|(wire4 >> reg15))) * ($signed((|reg12)) ?
              $unsigned((reg11 >> wire5)) : (~&(wire3 ? reg15 : reg11)))));
          reg18 <= (~^($unsigned(((reg14 & reg8) == (wire6 ? reg15 : wire1))) ?
              $unsigned((-reg17[(3'h6):(3'h4)])) : (($unsigned(wire4) | reg14) & ((!reg11) != reg9))));
          if ($signed($signed(reg12)))
            begin
              reg19 <= reg12;
              reg20 <= reg13;
              reg21 <= ({(8'hbe), (~&reg16[(2'h2):(1'h1)])} <<< $signed((reg15 ?
                  ((|reg12) ?
                      (!reg10) : reg12) : $unsigned((wire6 >> (8'ha2))))));
            end
          else
            begin
              reg19 <= $unsigned(reg21);
              reg20 <= $unsigned(($signed((~^reg16)) << $unsigned($signed({reg19,
                  (7'h41)}))));
            end
          if ((-reg16))
            begin
              reg22 <= wire6[(3'h6):(2'h3)];
              reg23 <= reg15;
              reg24 <= (wire0 - $signed($unsigned($unsigned($unsigned(wire5)))));
              reg25 <= (~&$signed($signed(wire2[(2'h2):(1'h1)])));
              reg26 <= reg25;
            end
          else
            begin
              reg22 <= ((reg23[(1'h0):(1'h0)] ?
                      {$signed({(8'hb4)})} : wire4[(4'h8):(4'h8)]) ?
                  $signed(reg12[(1'h1):(1'h0)]) : reg16);
            end
        end
      else
        begin
          reg17 <= $unsigned(($unsigned($unsigned(reg24)) ?
              (({wire0, reg21} ^ (7'h44)) << $signed((wire7 ?
                  reg10 : reg13))) : $unsigned(reg15[(4'ha):(3'h6)])));
          reg18 <= $signed(($signed(reg15) ?
              reg18 : ((&$signed(reg17)) ?
                  $signed(reg16) : ((wire6 && (8'hbe)) ?
                      {(8'hbe)} : (reg26 ? reg15 : reg22)))));
          reg19 <= reg24;
          reg20 <= ($signed(({(!wire1), reg26} ?
              ($signed(reg16) ?
                  (~&wire1) : wire5[(2'h3):(2'h2)]) : reg9[(5'h10):(4'ha)])) >>> ($unsigned((&(reg17 >> wire7))) + ($signed((&wire4)) ?
              ((~^wire4) ~^ $unsigned(reg19)) : $unsigned((-reg11)))));
          if (((8'had) ?
              (~^{(~((8'hbb) ?
                      reg8 : (8'hae)))}) : $unsigned($unsigned(reg24[(3'h7):(3'h4)]))))
            begin
              reg21 <= {reg15,
                  ((wire0[(4'h8):(3'h4)] ?
                      reg8 : $signed($unsigned((8'hb0)))) && (8'hb9))};
              reg22 <= $unsigned((^(8'hae)));
              reg23 <= ($unsigned((8'hb9)) ~^ $unsigned((reg25 ?
                  $unsigned($unsigned(reg26)) : ((~^reg13) ? reg11 : reg9))));
            end
          else
            begin
              reg21 <= $unsigned({{$signed({reg12})}});
              reg22 <= (!reg23[(3'h5):(1'h1)]);
              reg23 <= (wire4[(3'h4):(1'h1)] ?
                  reg12[(4'ha):(4'h8)] : reg26[(4'ha):(2'h2)]);
              reg24 <= (8'hb3);
            end
        end
    end
  assign wire27 = $unsigned(reg11[(4'h8):(1'h0)]);
  assign wire28 = (|$unsigned(reg12[(5'h10):(5'h10)]));
  always
    @(posedge clk) begin
      reg29 <= $unsigned(reg18[(1'h1):(1'h0)]);
      reg30 <= reg25[(2'h2):(2'h2)];
    end
  assign wire31 = wire7[(2'h2):(2'h2)];
endmodule

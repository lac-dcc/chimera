module top
#(parameter param54 = {(^~{((8'had) ? (~(8'h9c)) : (8'ha1))}), (({{(8'hbe)}} ? ((^(8'had)) ? (8'hb1) : {(7'h41)}) : (8'hbf)) && ((!((8'h9c) <<< (7'h40))) ? ((-(8'ha7)) ? ((8'hac) != (8'had)) : (|(8'hb0))) : {(-(8'h9e)), ((8'hb6) ? (8'hab) : (8'hbe))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire50,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg38,
                 reg37,
                 reg36,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned(wire0));
      reg5 <= reg4;
    end
  assign wire6 = reg4[(2'h3):(1'h1)];
  assign wire7 = ($unsigned(wire1) ?
                     wire0 : (($signed((wire1 ?
                         wire0 : wire1)) ^~ $signed({reg5})) ^~ $signed((+(~^wire2)))));
  assign wire8 = (reg5 & $signed((7'h42)));
  assign wire9 = $unsigned((wire7[(3'h4):(2'h2)] ?
                     wire3[(3'h5):(1'h1)] : wire7));
  assign wire10 = ((~^(~({(8'hbc)} != $signed(reg5)))) ^~ (^~$signed((wire0 ?
                      $unsigned(wire0) : (^wire0)))));
  assign wire11 = $signed($unsigned((^~wire7)));
  assign wire12 = $unsigned(wire2[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg13 <= $signed(wire12);
      reg14 <= {wire9[(4'h8):(4'h8)]};
      if ($signed(((~|wire0[(1'h1):(1'h1)]) ?
          (($signed(wire6) != (^wire2)) ?
              $signed(reg14) : $unsigned((+reg14))) : $signed(((wire10 ?
              wire1 : reg14) >= (wire2 ? reg4 : wire10))))))
        begin
          reg15 <= $signed(reg14);
          if ($unsigned((~^(wire9[(2'h3):(2'h3)] < $signed(wire8[(4'h8):(4'h8)])))))
            begin
              reg16 <= {(|reg4[(3'h6):(2'h3)])};
              reg17 <= ((~((wire2 & {wire7}) ?
                  wire9[(2'h2):(2'h2)] : $unsigned($signed(wire10)))) << ($signed(wire12[(1'h0):(1'h0)]) | (7'h43)));
              reg18 <= $signed(wire3[(3'h7):(3'h7)]);
              reg19 <= ((|wire10[(4'hd):(3'h4)]) != (|reg18[(2'h2):(2'h2)]));
            end
          else
            begin
              reg16 <= wire7[(2'h3):(1'h1)];
              reg17 <= (^$unsigned(wire9[(4'h9):(3'h6)]));
              reg18 <= ((^((-reg17[(4'h8):(3'h4)]) ?
                      wire0 : {$signed(wire3), reg14})) ?
                  $unsigned(({(^reg17)} ? $signed(wire7) : wire1)) : (|wire6));
              reg19 <= $signed(wire11[(2'h3):(1'h1)]);
              reg20 <= wire12;
            end
          reg21 <= $unsigned((^$signed(reg17[(3'h6):(2'h3)])));
          if ((^~$signed(reg19[(4'hc):(4'ha)])))
            begin
              reg22 <= ((~{$unsigned(((8'hb4) ?
                      reg14 : (8'h9e)))}) <<< reg13[(4'ha):(3'h4)]);
              reg23 <= $signed(wire8[(1'h0):(1'h0)]);
              reg24 <= wire10[(4'h9):(4'h8)];
            end
          else
            begin
              reg22 <= {$signed($signed(wire6[(3'h6):(3'h4)]))};
              reg23 <= $unsigned(wire1[(4'hd):(1'h0)]);
              reg24 <= $signed(wire3[(2'h2):(2'h2)]);
              reg25 <= $signed(wire12[(3'h5):(3'h4)]);
              reg26 <= $signed((~|(&$unsigned((-(8'hbf))))));
            end
          reg27 <= (^reg23);
        end
      else
        begin
          reg15 <= $unsigned(reg21[(1'h0):(1'h0)]);
          if ($signed($unsigned(((8'hb9) ?
              ($unsigned(reg15) && $unsigned(wire10)) : (((7'h42) && reg21) ?
                  wire1[(2'h3):(1'h0)] : wire10[(2'h2):(2'h2)])))))
            begin
              reg16 <= $signed((!((~((8'hb9) ? wire0 : reg14)) ?
                  {((8'ha9) == reg23)} : {(wire2 ? reg21 : wire11),
                      {reg21, (8'ha7)}})));
            end
          else
            begin
              reg16 <= {$unsigned((reg18[(1'h0):(1'h0)] >= $unsigned((reg19 << reg17))))};
            end
          if ((~(reg5 >> $unsigned((((8'hae) ^~ wire9) > (8'hb1))))))
            begin
              reg17 <= reg22[(4'h8):(2'h2)];
              reg18 <= ((8'hab) ^ ((!(~|(reg25 ?
                  wire12 : reg22))) & wire1[(4'h9):(1'h0)]));
              reg19 <= (-reg5);
            end
          else
            begin
              reg17 <= (8'h9c);
              reg18 <= (reg16[(4'hb):(3'h7)] ?
                  $unsigned(reg26[(4'h8):(3'h6)]) : $unsigned((($unsigned(reg20) ?
                      (!reg18) : {(8'hb9), reg26}) ^ {{wire2}})));
              reg19 <= reg16[(1'h0):(1'h0)];
            end
        end
      if ((($signed((+$unsigned(reg17))) << (reg16 * $signed(((8'hb6) ?
          wire10 : reg24)))) & reg25))
        begin
          reg28 <= (($signed(((wire3 >> reg20) ?
                  (^(8'ha4)) : (~&(8'hbd)))) >= $unsigned((wire11 ?
                  (reg22 >> reg15) : $unsigned(wire0)))) ?
              ((+$signed((^~wire2))) || (8'ha5)) : reg18[(2'h2):(1'h0)]);
          reg29 <= $unsigned($signed(reg18[(2'h3):(2'h2)]));
          if (reg4)
            begin
              reg30 <= {{((reg14[(4'h9):(4'h8)] ? (+reg21) : reg18) ?
                          (8'ha7) : $signed((!reg27)))}};
            end
          else
            begin
              reg30 <= $signed((!(7'h44)));
              reg31 <= (reg4 ?
                  reg25 : ((|(-$signed(reg30))) <<< $signed((&wire8[(3'h5):(3'h5)]))));
              reg32 <= $signed((^~(&$signed($signed(reg4)))));
              reg33 <= $signed(wire7);
            end
          reg34 <= (-(((~^(^~reg19)) ~^ reg13[(4'h9):(1'h1)]) ?
              (~|((wire6 ~^ reg13) << reg15)) : $unsigned((reg23 ?
                  reg13[(4'ha):(4'h8)] : {reg29}))));
          if ($signed((reg28[(3'h5):(1'h0)] ?
              (((reg28 ^~ wire11) >= $unsigned((7'h44))) && wire12) : (+(~(&reg15))))))
            begin
              reg35 <= $signed({reg13[(1'h0):(1'h0)],
                  $unsigned($unsigned(reg33))});
              reg36 <= $signed(($signed((wire1[(4'he):(4'h9)] ?
                  reg14 : {reg34, reg32})) > $signed((-(wire8 & (8'h9c))))));
              reg37 <= reg4;
              reg38 <= (reg25[(1'h0):(1'h0)] ~^ wire7[(2'h3):(1'h1)]);
            end
          else
            begin
              reg35 <= wire6;
              reg36 <= $signed({wire6});
              reg37 <= (($unsigned(reg5) || (~^((reg38 - wire12) ?
                  $signed(wire12) : (~reg15)))) <<< (({reg25[(4'he):(4'hb)],
                      $unsigned(reg34)} ?
                  ((reg5 || (8'haf)) || {wire8}) : reg18[(1'h1):(1'h0)]) ^~ (reg37 <= $signed(((8'h9f) ?
                  reg26 : wire10)))));
            end
        end
      else
        begin
          reg28 <= ((($signed(reg13[(4'ha):(2'h2)]) == (reg28 ?
                  (reg13 == (8'ha8)) : wire3)) * (((reg26 ^~ reg4) | reg21) ?
                  $unsigned((~^reg14)) : (8'hab))) ?
              $unsigned((-reg29)) : {(+{(wire10 ? (8'ha4) : reg17)})});
          reg29 <= (((((^~reg25) ~^ (reg18 ? reg21 : reg34)) ?
                  (!(wire12 ? reg34 : reg29)) : $signed(reg20)) ?
              (reg26[(2'h3):(1'h1)] ?
                  reg26[(4'h8):(4'h8)] : $unsigned((reg15 ?
                      reg31 : (7'h43)))) : (-wire2)) ~^ (~|wire3[(1'h1):(1'h1)]));
          reg30 <= (-(|$signed({$unsigned(reg37), (reg19 ? wire7 : reg33)})));
        end
    end
  assign wire39 = reg38;
  assign wire40 = (reg14[(4'hb):(4'ha)] ?
                      {(reg20[(1'h1):(1'h0)] ?
                              ($signed(reg38) ?
                                  $signed((8'ha2)) : (reg36 >> reg27)) : {$signed(wire1)}),
                          $signed((wire0[(1'h0):(1'h0)] < (reg15 * wire10)))} : $signed(reg18));
  assign wire41 = $signed({wire7[(1'h1):(1'h1)]});
  assign wire42 = {(^~($signed(((8'hb4) != reg21)) == ((8'hb1) ?
                          $unsigned(reg18) : $signed(wire9)))),
                      reg32};
  assign wire43 = wire2[(3'h7):(3'h4)];
  assign wire44 = {reg37};
  assign wire45 = $unsigned(reg29);
  assign wire46 = $signed({((^wire39) ?
                          reg15[(4'h9):(3'h7)] : $signed(reg29))});
  assign wire47 = reg27;
  always
    @(posedge clk) begin
      reg48 <= ($unsigned((~&{wire7, (wire7 ^~ reg25)})) ?
          reg22 : $signed((^$unsigned($unsigned(wire11)))));
      reg49 <= $unsigned($signed((~|reg26[(3'h5):(2'h2)])));
    end
  assign wire50 = $signed((~wire9[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg51 <= (((wire43[(3'h5):(3'h4)] >>> ((+wire41) ?
          reg16[(4'hc):(1'h1)] : ((8'hb9) ~^ wire47))) ^ ((+$signed(reg15)) ?
          $signed(reg22[(2'h3):(1'h1)]) : $signed(wire43[(3'h4):(1'h1)]))) - $unsigned($signed({(reg14 >> reg28),
          ((8'ha0) ^~ (7'h44))})));
      reg52 <= wire44;
      reg53 <= $unsigned(wire50);
    end
endmodule

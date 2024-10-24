module top
#(parameter param146 = (8'hb5), 
parameter param147 = (!param146))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 (1'h0)};
  assign wire4 = ((($signed((wire3 ^~ wire3)) ? (-$signed(wire1)) : wire3) ?
                     $signed(((^~wire0) ?
                         ((8'hbe) ?
                             wire0 : wire2) : wire3)) : (((wire2 & (8'hb3)) ?
                             (8'ha9) : (^wire1)) ?
                         (~^$unsigned(wire3)) : (~&(wire1 ?
                             wire2 : wire0)))) ^ (+wire1[(4'he):(1'h0)]));
  assign wire5 = $signed(((((wire0 == wire0) ?
                     $signed(wire3) : wire4) < $signed((wire1 <<< wire3))) >= ((wire1 ?
                         (wire4 ^ wire2) : (wire0 & wire1)) ?
                     (wire1 ~^ wire0[(1'h0):(1'h0)]) : wire1)));
  assign wire6 = wire2;
  assign wire7 = $signed(({$signed((wire6 ? wire3 : wire5)), (^~wire0)} ?
                     $signed({((8'ha0) ^ wire3)}) : (wire2 << (~^$signed(wire2)))));
  assign wire8 = ((8'hb8) <<< wire6[(2'h3):(2'h3)]);
  assign wire9 = $unsigned(wire1[(4'hc):(3'h5)]);
  assign wire10 = wire9;
  always
    @(posedge clk) begin
      reg11 <= $signed(((-(^(wire6 ? wire1 : wire4))) ?
          ((wire4 + (~^wire1)) ?
              ((!wire9) >= wire9[(4'hd):(4'h8)]) : $signed((&wire1))) : wire8[(2'h2):(1'h0)]));
    end
  module12 #() modinst142 (wire141, clk, wire7, wire4, wire9, wire10);
  assign wire143 = wire2[(1'h1):(1'h1)];
  assign wire144 = $unsigned($signed(((~^$signed(wire6)) >= wire6[(1'h0):(1'h0)])));
  assign wire145 = $unsigned($unsigned(wire144));
endmodule

module module12
#(parameter param139 = (&{((((8'ha7) < (8'hbe)) && {(8'ha2), (8'ha2)}) <= (~((8'haa) >> (8'hb0)))), ((((8'hbb) + (8'hb0)) ? ((8'hb0) ? (8'h9d) : (8'ha0)) : (+(8'hae))) ^~ (^~(&(8'hbc))))}), 
parameter param140 = ((param139 ? (param139 ? ((^param139) ? (^param139) : (param139 | param139)) : (~&(param139 & (7'h44)))) : ({(param139 ? (8'hb7) : param139), (8'h9d)} ? param139 : ((param139 ~^ (7'h42)) ? (param139 ? param139 : (8'ha5)) : {param139}))) ? ((~^(~^param139)) ? param139 : (((param139 ? (8'hba) : param139) | param139) ? (^~(param139 ? (8'hb9) : (8'ha1))) : {{param139}})) : param139))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h3da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(3'h7):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire15;
  input wire [(3'h6):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire138;
  wire [(3'h7):(1'h0)] wire136;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire126;
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  assign y = {wire138,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire58,
                 wire59,
                 wire60,
                 wire71,
                 wire72,
                 wire126,
                 reg137,
                 reg17,
                 reg18,
                 reg19,
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
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire14[(1'h1):(1'h1)];
      if ($unsigned((^(wire16[(2'h2):(1'h0)] ?
          $signed(wire15) : ($unsigned(wire16) ? wire14 : (8'ha3))))))
        begin
          reg18 <= $signed(reg17[(2'h2):(1'h0)]);
          reg19 <= wire13[(4'h8):(3'h7)];
          reg20 <= reg17;
          reg21 <= $unsigned($unsigned((^{reg19})));
        end
      else
        begin
          reg18 <= (~^$unsigned({($signed(reg21) + reg21)}));
          reg19 <= (~wire15);
          reg20 <= $unsigned((reg21[(3'h7):(3'h5)] ?
              ((!$signed(reg18)) > $signed((~&reg20))) : $signed(reg21[(3'h4):(1'h1)])));
          reg21 <= wire15;
        end
      reg22 <= $unsigned(reg19);
      if (wire15)
        begin
          reg23 <= reg18;
        end
      else
        begin
          if ({reg23,
              ($unsigned(($unsigned(reg19) ?
                  $signed((8'hb4)) : (reg19 ~^ (8'hba)))) >= $unsigned((8'hb9)))})
            begin
              reg23 <= wire15;
              reg24 <= (reg20 ?
                  ((((reg19 == reg20) ?
                      (wire14 ?
                          (8'ha3) : reg21) : $signed(reg23)) != {(reg21 - reg21)}) >>> $unsigned({(reg22 ?
                          wire16 : reg20),
                      $unsigned(reg20)})) : $unsigned($signed(((~|reg23) ?
                      $unsigned(wire16) : reg21[(2'h2):(1'h0)]))));
              reg25 <= $signed(((!$signed(reg21[(4'he):(4'ha)])) + ((8'hb6) ?
                  $unsigned(reg21) : (~$unsigned(reg21)))));
            end
          else
            begin
              reg23 <= {((&((~^wire13) ? (^~wire13) : reg21[(4'hb):(3'h7)])) ?
                      $signed($signed(wire16[(3'h5):(3'h5)])) : (~^$signed((wire16 ?
                          wire15 : wire14)))),
                  (8'hbc)};
              reg24 <= (wire13 ?
                  $signed($signed(reg17[(2'h3):(2'h2)])) : ($unsigned(reg25[(4'he):(4'hc)]) | (~($signed(reg25) ?
                      $signed(reg21) : (wire15 ? reg22 : reg17)))));
            end
          if (($signed(wire13[(2'h2):(1'h0)]) >> wire13))
            begin
              reg26 <= (&($signed(((~&wire15) ?
                  {reg21,
                      reg22} : wire14[(3'h6):(3'h6)])) < $unsigned({reg23[(4'hb):(2'h2)]})));
              reg27 <= ($unsigned($unsigned((|(+reg19)))) << wire16);
            end
          else
            begin
              reg26 <= (wire16 != (reg23[(2'h3):(1'h0)] ?
                  $unsigned({$signed(reg27), (|reg21)}) : $signed(((reg17 ?
                          (8'h9e) : reg19) ?
                      (reg24 ? wire13 : (8'ha1)) : (reg25 ? reg20 : reg25)))));
              reg27 <= ($unsigned(((reg25 - wire14) >> (8'hb3))) <<< ((((~&reg22) ?
                      (reg24 ?
                          reg19 : reg27) : reg19[(2'h2):(1'h0)]) ~^ ((!wire15) ?
                      (^~reg27) : ((8'ha5) ? reg19 : reg22))) ?
                  (reg24[(4'hc):(4'hb)] ?
                      ((~reg18) || (reg25 ?
                          reg23 : (8'hbd))) : (reg26[(1'h1):(1'h1)] ?
                          wire13[(2'h2):(2'h2)] : $signed((8'haf)))) : (reg18[(2'h3):(1'h1)] ?
                      ((reg18 ?
                          wire13 : reg26) >> reg19[(5'h10):(5'h10)]) : ({(8'ha5),
                              reg25} ?
                          $unsigned(reg19) : (wire16 ^ (8'ha7))))));
              reg28 <= (~|({$unsigned((~^(7'h40)))} * (-(reg26 ?
                  $signed((8'haa)) : $unsigned(reg20)))));
            end
        end
      reg29 <= reg17[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (reg23)
        begin
          reg30 <= $unsigned((reg20[(2'h2):(1'h1)] >= {reg24[(1'h0):(1'h0)],
              ($signed(reg26) ?
                  (reg28 != (8'ha4)) : (wire16 ? reg28 : reg29))}));
        end
      else
        begin
          if ((($unsigned((((8'ha9) | reg25) == {reg22, (8'had)})) ?
              (((wire13 && wire16) ?
                  (reg19 ? wire15 : reg29) : (reg23 ?
                      wire16 : wire13)) < (reg21[(4'he):(3'h5)] ?
                  {wire13} : {(7'h43), reg20})) : (((reg22 & reg21) ?
                  (reg19 + wire15) : (reg28 + wire16)) >>> ($unsigned((8'hb3)) + (reg22 << reg29)))) << $unsigned($signed((!(reg17 >> reg21))))))
            begin
              reg30 <= $unsigned(reg23);
            end
          else
            begin
              reg30 <= (~$unsigned($signed({reg17})));
            end
          if ($signed($signed(((|reg29) ?
              $signed($unsigned(reg18)) : $unsigned((reg23 <<< reg17))))))
            begin
              reg31 <= ((reg29 >>> $unsigned($unsigned($unsigned((8'haa))))) | reg24[(3'h7):(3'h6)]);
            end
          else
            begin
              reg31 <= {wire15, reg27};
              reg32 <= (($unsigned(((reg19 ?
                  wire14 : wire15) ^~ wire14)) >= (&$signed($unsigned(wire16)))) == reg28[(3'h4):(2'h3)]);
            end
          reg33 <= reg28[(3'h5):(3'h4)];
          reg34 <= $unsigned((reg27 <<< reg23[(4'hc):(4'h9)]));
          reg35 <= $unsigned((^~wire16));
        end
      reg36 <= (wire16 ? reg22 : $signed(wire15));
      reg37 <= (|reg20[(2'h2):(1'h0)]);
      if ($signed((~|reg34[(3'h6):(2'h3)])))
        begin
          if ((!(~&{(&reg36[(4'h8):(1'h0)]), wire15})))
            begin
              reg38 <= ((-(&(^~((7'h41) + reg27)))) ^ $signed($signed((~|reg28))));
            end
          else
            begin
              reg38 <= $signed((((reg33 ?
                      wire14 : (reg29 ? reg35 : reg20)) + {$unsigned(reg18)}) ?
                  {(wire14[(3'h4):(2'h2)] ?
                          $unsigned(reg22) : (reg20 | (8'ha4)))} : ((reg29 ?
                          (reg23 ? reg31 : reg18) : $signed(reg34)) ?
                      {(~^reg29)} : $unsigned((wire14 ? reg28 : wire13)))));
              reg39 <= reg29[(4'hc):(4'h9)];
            end
          if ((((-$unsigned(reg38[(4'hc):(4'hb)])) ?
              ((-$signed(reg25)) ?
                  $signed((reg29 < (8'hbc))) : (((8'hbd) ?
                      reg26 : (8'h9c)) > ((8'hbf) & reg25))) : ((8'hbf) ?
                  (~^reg17[(1'h0):(1'h0)]) : $signed({reg28}))) <= $signed(({wire15[(1'h1):(1'h1)],
                  $unsigned((8'hb6))} ?
              $signed((&(8'hb2))) : reg36))))
            begin
              reg40 <= $signed((~reg28[(1'h0):(1'h0)]));
              reg41 <= wire14;
              reg42 <= {$signed({(!{reg38})})};
              reg43 <= $signed(((8'hbb) || $signed((-$unsigned(wire14)))));
              reg44 <= (((((reg18 == wire13) ?
                      reg33 : reg35) & $unsigned($unsigned(reg38))) < ((~reg43[(2'h3):(1'h1)]) == reg22[(1'h1):(1'h0)])) ?
                  $unsigned(reg19) : $signed(($signed($signed(reg17)) <<< reg18[(5'h13):(3'h6)])));
            end
          else
            begin
              reg40 <= $unsigned(((reg40 ? reg37[(3'h4):(2'h3)] : {(8'hac)}) ?
                  reg25 : reg34));
              reg41 <= (reg40[(1'h0):(1'h0)] ?
                  ($signed((~|$signed((8'hbd)))) >= ((|(wire14 ^~ reg29)) ?
                      (~^reg35[(4'h8):(2'h2)]) : $unsigned(reg29))) : $signed({$signed(reg32[(1'h1):(1'h0)]),
                      (^~reg24[(2'h2):(1'h0)])}));
              reg42 <= $unsigned($signed(reg21));
              reg43 <= $unsigned($unsigned(reg33));
            end
          reg45 <= ((8'hb8) << (|wire14[(1'h1):(1'h0)]));
          reg46 <= $signed($signed(reg25));
          reg47 <= (^(8'hbe));
        end
      else
        begin
          reg38 <= $signed(reg43[(1'h0):(1'h0)]);
          if (reg47)
            begin
              reg39 <= $unsigned($unsigned({$unsigned(reg17)}));
              reg40 <= $signed(reg46);
              reg41 <= reg30;
              reg42 <= $unsigned($signed(reg32));
            end
          else
            begin
              reg39 <= $signed(($signed(reg24) * reg37[(1'h1):(1'h1)]));
              reg40 <= ((~|((~|{reg42, wire16}) ?
                      (8'ha5) : $signed(reg29[(1'h1):(1'h1)]))) ?
                  (reg29 ?
                      $signed($unsigned($unsigned(reg37))) : ({reg42} ?
                          ((8'had) << reg46[(2'h3):(1'h1)]) : (reg40[(2'h3):(1'h0)] << ((8'hb5) ?
                              reg31 : reg43)))) : ((+reg25) ?
                      $unsigned(((reg42 != (7'h44)) || (~&reg22))) : reg43[(3'h7):(3'h4)]));
              reg41 <= ($signed((~^{{reg30, reg36}})) ^ reg28);
              reg42 <= (+((reg43[(3'h4):(2'h3)] ?
                      ((reg37 ?
                          reg24 : reg44) ^~ (reg18 ^ wire14)) : ($signed(reg43) ?
                          reg17 : $unsigned(reg33))) ?
                  ({$unsigned(reg35)} + $signed(reg34)) : reg27[(2'h2):(1'h1)]));
              reg43 <= $signed(reg24[(3'h7):(1'h1)]);
            end
          reg44 <= {(!(($unsigned(reg19) >= (&reg18)) < ({reg36,
                  reg35} == $unsigned((8'hae)))))};
        end
      if (($signed(reg22) ?
          $unsigned($unsigned({wire15, reg17[(3'h5):(2'h2)]})) : reg35))
        begin
          reg48 <= {(^$unsigned(reg46[(1'h1):(1'h1)])),
              {(^~$unsigned(wire16[(3'h6):(2'h3)])),
                  (wire16 ? (~(reg34 >>> reg42)) : (+$signed(reg27)))}};
          reg49 <= $unsigned($signed(reg26));
          reg50 <= reg43[(1'h1):(1'h0)];
          if ({$signed($signed((8'hbf))),
              $signed($unsigned($unsigned((&reg41))))})
            begin
              reg51 <= (^~$unsigned($signed((reg22[(2'h2):(2'h2)] * (reg31 ?
                  reg36 : reg25)))));
              reg52 <= (($signed((-{(8'hbc),
                  reg27})) * ($unsigned($signed(wire13)) ?
                  {reg43[(1'h0):(1'h0)],
                      (reg26 >> wire14)} : wire14[(2'h2):(1'h0)])) ^ reg41[(4'h8):(3'h6)]);
              reg53 <= $unsigned(($unsigned(reg24) == (^~reg39[(2'h3):(1'h0)])));
              reg54 <= $signed(((~(reg28[(2'h3):(1'h1)] ?
                      (reg38 ^~ reg35) : (reg39 ? (8'hab) : wire15))) ?
                  ((!reg32) ?
                      (~|reg45) : {reg18}) : $signed(reg52[(3'h4):(1'h1)])));
              reg55 <= $unsigned(({reg50[(3'h5):(2'h2)]} ?
                  (^~reg33[(5'h15):(4'hd)]) : $signed($signed(reg36[(3'h5):(1'h0)]))));
            end
          else
            begin
              reg51 <= ((!$signed(reg38)) ? reg21[(4'h8):(4'h8)] : reg47);
              reg52 <= reg45[(1'h0):(1'h0)];
              reg53 <= ((^~(({(8'hbc)} ^~ {reg54}) ?
                  ($unsigned(reg55) ?
                      wire14[(3'h4):(1'h1)] : (|reg18)) : reg30[(2'h2):(1'h1)])) & reg26[(2'h2):(1'h0)]);
              reg54 <= ($unsigned(({wire15, (reg33 - wire16)} ?
                      ((reg50 ?
                          reg23 : reg46) ^~ $unsigned(reg49)) : reg26[(1'h0):(1'h0)])) ?
                  (reg40 + reg18[(2'h2):(2'h2)]) : (!$unsigned((+$signed(wire13)))));
              reg55 <= ($unsigned(((reg38[(4'hb):(3'h4)] ?
                      (reg39 ?
                          reg17 : wire14) : $unsigned(reg32)) & $signed(reg33[(5'h11):(3'h5)]))) ?
                  {$signed(reg30)} : (&(~&((~^reg35) & reg40[(3'h6):(3'h6)]))));
            end
        end
      else
        begin
          reg48 <= reg29[(4'hc):(1'h0)];
          if ((reg46 ?
              (|(((reg31 ?
                  wire15 : reg54) <= reg41[(5'h14):(1'h1)]) ^~ ($unsigned(reg36) ?
                  (reg32 ? reg50 : reg48) : reg42[(1'h1):(1'h1)]))) : wire16))
            begin
              reg49 <= (wire14[(3'h4):(2'h3)] ?
                  reg35[(3'h4):(2'h3)] : reg55[(5'h14):(4'hb)]);
              reg50 <= $signed(($unsigned((^{reg55})) ^ $unsigned({$unsigned((8'hb1))})));
            end
          else
            begin
              reg49 <= reg29;
              reg50 <= reg52[(3'h5):(3'h5)];
              reg51 <= ((!{(~(~&wire15)), $unsigned((reg51 * reg26))}) ?
                  reg51 : (+$signed(((reg31 ? wire16 : (8'ha7)) ?
                      $unsigned(reg26) : (|reg26)))));
              reg52 <= reg25;
              reg53 <= (reg20[(3'h4):(2'h3)] ?
                  reg46 : (!(reg55[(4'hd):(4'h9)] << $signed((reg19 == wire14)))));
            end
          if ((~&reg34))
            begin
              reg54 <= ((~|$unsigned(((reg42 ?
                  (8'h9f) : reg40) >> (-reg35)))) || (~^reg50));
              reg55 <= reg36;
              reg56 <= (((8'ha1) >= reg43[(1'h0):(1'h0)]) ?
                  reg47 : reg45[(2'h2):(1'h0)]);
              reg57 <= reg37[(2'h2):(1'h1)];
            end
          else
            begin
              reg54 <= ($signed((+((wire14 ~^ reg35) ?
                      ((8'hb4) ? reg23 : reg51) : (-reg26)))) ?
                  ((~|$unsigned((reg40 <<< (8'ha4)))) ?
                      reg18 : (reg21 * {$unsigned((8'hb9))})) : (^~($signed((~^reg38)) - (reg40 ?
                      (reg52 ? reg17 : reg35) : {wire16}))));
              reg55 <= reg46;
              reg56 <= $signed($unsigned(((&(-reg39)) ?
                  $unsigned($signed(reg27)) : $signed((reg28 ?
                      reg34 : wire14)))));
            end
        end
    end
  assign wire58 = $unsigned(($signed(reg33) ?
                      ({{wire16}} ^ (8'h9d)) : reg28[(2'h3):(1'h0)]));
  assign wire59 = reg18;
  assign wire60 = reg29;
  always
    @(posedge clk) begin
      if ($unsigned(reg43[(3'h4):(2'h2)]))
        begin
          reg61 <= ((reg25[(3'h6):(1'h1)] ? (8'hba) : reg45[(2'h2):(2'h2)]) ?
              (+{(~^reg17)}) : reg22[(3'h7):(3'h4)]);
          if (reg57)
            begin
              reg62 <= $unsigned(reg50);
              reg63 <= ($unsigned(reg23) ?
                  reg55 : (reg34[(4'hc):(4'h8)] ?
                      (7'h44) : ($signed(reg26[(1'h0):(1'h0)]) >= (reg26[(3'h4):(1'h0)] ?
                          wire15[(1'h1):(1'h0)] : wire60))));
              reg64 <= reg32[(1'h0):(1'h0)];
              reg65 <= reg51[(2'h3):(1'h1)];
            end
          else
            begin
              reg62 <= reg31[(1'h0):(1'h0)];
              reg63 <= $signed((reg57[(3'h4):(1'h1)] && $unsigned((~reg43[(3'h7):(1'h1)]))));
              reg64 <= wire58;
              reg65 <= ($signed({(-$unsigned(reg53)), {(~^reg51)}}) ?
                  ({$signed(((8'h9e) ^ reg33)),
                      $signed({reg30})} == (!reg50[(4'h9):(4'h9)])) : $signed(reg34[(3'h7):(3'h6)]));
            end
          reg66 <= $unsigned($signed((((^~reg28) <= (-(8'hbb))) ?
              reg47[(4'h9):(1'h0)] : (~(reg45 ? (8'haa) : reg63)))));
          if ($signed($signed((($signed(reg37) ?
              (reg49 ? reg38 : wire60) : {reg39}) <= ($unsigned(reg47) ?
              (^~reg48) : wire13)))))
            begin
              reg67 <= $signed($signed(reg38[(1'h0):(1'h0)]));
              reg68 <= reg55;
            end
          else
            begin
              reg67 <= {$unsigned((reg53 ^~ reg27)),
                  ($unsigned((~&(|(8'hb2)))) ?
                      $unsigned({(reg46 & reg65)}) : (!{reg48[(3'h7):(3'h4)],
                          (reg42 << reg40)}))};
            end
          reg69 <= reg52[(4'h8):(3'h4)];
        end
      else
        begin
          reg61 <= (8'had);
          reg62 <= reg41;
        end
      reg70 <= $unsigned(reg31[(4'hb):(3'h5)]);
    end
  assign wire71 = reg68[(2'h2):(1'h1)];
  assign wire72 = reg43[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg73 <= reg42;
      reg74 <= $signed(reg61[(2'h3):(2'h3)]);
    end
  always
    @(posedge clk) begin
      if (reg24)
        begin
          if ($signed((((!(reg17 ? (8'ha0) : wire72)) ?
              reg41 : (+$unsigned(reg69))) && reg47[(4'h8):(2'h3)])))
            begin
              reg75 <= reg29[(4'he):(1'h0)];
            end
          else
            begin
              reg75 <= (wire14 << reg25);
              reg76 <= (^((~^reg27[(3'h4):(2'h2)]) >= $unsigned(((|reg70) * $unsigned(reg53)))));
              reg77 <= {$signed($signed(($unsigned(reg73) || {reg36, wire13}))),
                  $unsigned(($signed(reg54) ? reg20[(3'h4):(1'h0)] : reg66))};
            end
        end
      else
        begin
          reg75 <= (($unsigned(reg24) ?
              {reg73, (|$signed(reg44))} : (reg24 ?
                  (^~(-reg54)) : reg75)) == (~|reg28[(3'h5):(3'h4)]));
          if (({$signed(((7'h44) || reg38))} || ($signed($signed((reg31 ?
                  (8'h9f) : reg37))) ?
              reg39[(1'h1):(1'h0)] : $unsigned({(reg28 ? reg65 : reg34)}))))
            begin
              reg76 <= reg27;
              reg77 <= $unsigned((reg32 ?
                  {$signed((reg39 ?
                          reg51 : (8'hb5)))} : ((~|(reg49 >= reg76)) * reg61)));
              reg78 <= {((^(^reg74)) ?
                      ((+(reg21 < reg66)) < (&(wire71 * reg56))) : reg66[(4'h9):(4'h9)]),
                  (+reg42[(2'h2):(2'h2)])};
              reg79 <= reg42[(2'h3):(1'h1)];
            end
          else
            begin
              reg76 <= ((wire58[(4'ha):(4'h8)] ?
                      $unsigned(wire59) : ({$unsigned(reg32)} ?
                          $signed((~|reg36)) : (|reg52))) ?
                  reg28[(2'h2):(1'h1)] : (~|$unsigned({(8'haf)})));
              reg77 <= reg66;
            end
          if ($unsigned(reg51))
            begin
              reg80 <= $unsigned(($unsigned((7'h44)) ~^ (({(8'hb1),
                      reg75} <<< reg48[(4'hc):(4'h8)]) ?
                  $signed((reg22 ? reg70 : reg25)) : reg53)));
            end
          else
            begin
              reg80 <= ((&reg30) ^ reg21);
              reg81 <= (($unsigned($signed((&reg67))) ?
                      $unsigned(reg42) : reg67) ?
                  (((reg75[(2'h2):(1'h1)] >>> ((8'haa) ? reg23 : reg32)) ?
                      reg61 : $signed(reg25)) >= $signed($signed(reg43[(3'h5):(1'h0)]))) : ((($signed(reg77) ~^ reg49[(1'h1):(1'h0)]) ?
                          (reg68[(1'h0):(1'h0)] & (~&reg74)) : (~$signed((8'hb1)))) ?
                      $signed(reg33) : $signed(reg68)));
              reg82 <= reg36[(3'h4):(1'h1)];
              reg83 <= ((reg70[(1'h1):(1'h1)] ?
                  ({reg22[(3'h5):(3'h4)], wire72[(4'h8):(3'h7)]} ?
                      ((reg31 + reg30) ?
                          (wire16 ?
                              reg80 : reg55) : reg30[(2'h2):(1'h0)]) : reg22[(3'h5):(2'h2)]) : (~|(reg69[(1'h0):(1'h0)] ?
                      reg54[(5'h14):(2'h3)] : (reg32 ?
                          reg80 : reg68)))) >>> ($unsigned((wire72[(4'h9):(2'h2)] >>> (reg20 ?
                      (8'hb3) : (8'hb0)))) ?
                  {(wire58 ? reg56[(2'h2):(1'h1)] : reg25),
                      ($signed(reg34) ^ (^reg34))} : {$signed((reg48 >> reg68)),
                      (&reg38)}));
            end
          if (reg49)
            begin
              reg84 <= {reg76[(4'h9):(1'h0)]};
              reg85 <= ((|reg62[(4'ha):(2'h2)]) ?
                  (+wire71[(3'h4):(2'h3)]) : $unsigned((~^(reg74 >>> (reg53 << wire15)))));
              reg86 <= (($unsigned(reg35[(4'ha):(1'h0)]) + ($signed((8'ha1)) * (~^(reg50 ?
                  reg83 : reg42)))) * reg51[(5'h10):(4'hc)]);
              reg87 <= $signed(((^~((reg27 ^ wire14) ?
                      {wire15, reg62} : (reg35 ? wire59 : (8'ha8)))) ?
                  ({((7'h41) ~^ reg86), $signed(reg51)} ?
                      $unsigned((reg85 ?
                          wire59 : reg69)) : (reg34[(4'h9):(4'h9)] ?
                          (+reg64) : wire72[(5'h15):(5'h14)])) : {reg77[(1'h1):(1'h0)],
                      (reg51[(2'h3):(2'h3)] >>> (+reg19))}));
            end
          else
            begin
              reg84 <= $signed($signed((~&{$signed(reg18),
                  (reg83 ? reg26 : reg73)})));
            end
        end
    end
  module88 #() modinst127 (.clk(clk), .y(wire126), .wire89(reg86), .wire92(reg78), .wire91(reg64), .wire90(wire13));
  assign wire128 = (((~|$unsigned((reg53 ~^ reg44))) ?
                       reg69 : $unsigned(wire58)) >>> ((~(wire58 || reg25[(4'hb):(2'h3)])) >> ($unsigned((^reg17)) ?
                       ((~reg73) <<< $unsigned(reg52)) : $unsigned((reg75 ?
                           reg40 : reg45)))));
  assign wire129 = reg85;
  assign wire130 = {$signed((8'hbf)),
                       ($unsigned($signed(wire13)) ?
                           reg68[(2'h2):(1'h1)] : (((!reg80) != (+(8'hb9))) ?
                               (reg73 < (^~(8'hb5))) : {$signed((7'h44)),
                                   (8'ha5)}))};
  assign wire131 = reg34[(3'h6):(1'h0)];
  assign wire132 = reg68;
  assign wire133 = $signed((7'h42));
  assign wire134 = (reg33[(1'h1):(1'h0)] >>> {{(-reg68)}});
  assign wire135 = (($unsigned(wire71) ?
                       (|reg28) : (&$signed((reg63 ?
                           reg41 : reg44)))) + ((|$signed((|wire59))) == wire130));
  assign wire136 = reg45[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg137 <= reg32;
    end
  assign wire138 = reg43[(4'h8):(3'h5)];
endmodule

module module88
#(parameter param125 = (((^~(((8'ha6) && (7'h41)) ? {(8'hb6), (8'hbc)} : ((7'h44) + (8'hb7)))) < ((((8'h9c) ? (8'h9c) : (8'hb4)) ? {(8'hba), (8'haa)} : ((8'ha2) + (8'hae))) <<< {(^~(8'h9f)), ((8'haf) == (8'ha9))})) ? ((((!(7'h44)) ? ((8'ha7) <= (8'hae)) : (~(8'hbe))) ? (((7'h42) < (8'h9d)) + (!(8'hb7))) : (((8'ha7) ? (8'haa) : (8'hbb)) - ((8'hab) << (8'hb8)))) <= ((((8'h9c) ? (7'h43) : (8'ha0)) << ((8'hbc) * (8'hb3))) ? ((+(8'ha3)) ? ((8'hab) + (8'ha6)) : {(8'hae), (8'ha6)}) : (~&(~&(8'hae))))) : {({(|(8'hbf)), ((8'ha6) ? (8'hb0) : (8'hbb))} <<< (8'ha2))}))
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire92;
  input wire signed [(3'h7):(1'h0)] wire91;
  input wire [(2'h2):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire93;
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire93,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg116,
                 reg115,
                 reg114,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire93 = (^~(^wire91[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg94 <= ((~&(&$unsigned(wire91[(3'h5):(1'h0)]))) ?
          ($signed($unsigned(wire92)) ?
              $signed(($unsigned(wire91) && $signed(wire93))) : {{$signed(wire89),
                      {wire89, wire93}}}) : (($unsigned(wire90[(1'h1):(1'h1)]) ?
              wire91 : $unsigned({wire92})) - (+(~(wire89 ~^ (8'hab))))));
      reg95 <= $unsigned((8'ha8));
      if ({($unsigned(((+wire89) >> $unsigned(reg95))) >>> (|$signed(((7'h41) <= (7'h41))))),
          $unsigned((wire90 <<< $signed((8'hbc))))})
        begin
          if ((reg95 ?
              wire90 : {wire90,
                  $unsigned(((reg94 != wire92) ?
                      reg94 : wire93[(2'h3):(1'h1)]))}))
            begin
              reg96 <= (($unsigned({(~wire90), (~^wire91)}) >>> reg94) ?
                  ((~(^$unsigned((8'hae)))) ?
                      $signed((&wire91[(2'h2):(1'h0)])) : ((wire90[(2'h2):(2'h2)] ~^ (wire91 ?
                          wire93 : wire93)) ~^ wire93)) : $signed(wire89[(4'he):(3'h7)]));
              reg97 <= wire91;
              reg98 <= reg97[(3'h4):(1'h1)];
              reg99 <= wire92[(1'h0):(1'h0)];
              reg100 <= (((({reg94, wire92} ?
                      $signed(reg95) : $signed(reg96)) * (wire93 >= (wire90 || wire90))) ~^ $unsigned(((wire91 ?
                      reg95 : wire91) & wire91[(3'h7):(3'h4)]))) ?
                  ($unsigned(reg97) != $unsigned(wire89)) : $unsigned((wire90 ?
                      $unsigned(((8'hbd) ~^ reg97)) : $unsigned(wire93[(3'h7):(3'h4)]))));
            end
          else
            begin
              reg96 <= (!((7'h40) | ($signed(((8'ha1) * reg100)) <<< ((reg95 < (8'hbd)) == (reg98 >> wire89)))));
            end
          if ((reg97 ? wire90[(2'h2):(2'h2)] : wire93))
            begin
              reg101 <= wire92[(2'h2):(1'h1)];
              reg102 <= reg100[(1'h1):(1'h1)];
            end
          else
            begin
              reg101 <= (((~^$unsigned(reg94)) ?
                      $signed((reg94 >> (+reg95))) : ($unsigned({reg97,
                              reg99}) ?
                          (~(~wire92)) : (~^(-wire90)))) ?
                  reg94 : ({(8'ha4), $unsigned($signed(reg102))} ?
                      $signed(($signed((8'ha8)) << $signed(reg98))) : $unsigned($signed(reg99[(3'h7):(3'h5)]))));
              reg102 <= ((($unsigned($unsigned(reg101)) && $unsigned((^wire92))) >= wire91) - (~(reg100 == reg97)));
              reg103 <= $signed((($signed((~&reg98)) - $signed(wire92)) << $unsigned(($unsigned((8'ha4)) ?
                  (reg94 < wire90) : reg95))));
              reg104 <= wire90;
              reg105 <= (^wire91[(1'h0):(1'h0)]);
            end
          reg106 <= reg103;
          reg107 <= $signed((~^($signed($unsigned(wire90)) ?
              wire89[(4'h8):(3'h7)] : ((&reg98) ?
                  $unsigned(reg103) : $unsigned(wire92)))));
        end
      else
        begin
          reg96 <= wire90[(2'h2):(1'h0)];
          if ($signed($signed($unsigned($unsigned((reg97 ? reg105 : reg106))))))
            begin
              reg97 <= wire89[(3'h5):(3'h4)];
              reg98 <= (wire91[(3'h7):(3'h5)] ?
                  (reg102 ?
                      (~^wire92) : $signed($unsigned(reg95))) : (~{reg106}));
              reg99 <= reg101[(1'h0):(1'h0)];
              reg100 <= ((!reg96) ?
                  reg94[(3'h7):(3'h5)] : (reg98[(1'h0):(1'h0)] <= $signed(((reg103 < (8'hba)) ?
                      (reg102 ? reg100 : wire91) : reg99[(2'h3):(1'h0)]))));
              reg101 <= wire91[(1'h1):(1'h1)];
            end
          else
            begin
              reg97 <= reg103;
              reg98 <= $unsigned((($unsigned((~&wire92)) ?
                  {$unsigned(reg97)} : $signed((reg103 ?
                      reg100 : reg97))) + ($signed((wire93 > reg107)) ?
                  reg105 : $unsigned({reg99, reg104}))));
              reg99 <= $signed(reg104[(3'h6):(3'h6)]);
            end
          if ({$unsigned(reg100[(3'h7):(1'h0)])})
            begin
              reg102 <= reg100;
            end
          else
            begin
              reg102 <= reg106[(3'h6):(1'h1)];
              reg103 <= (($signed(reg94[(3'h4):(3'h4)]) << $unsigned((~&wire92))) | ((^reg104[(3'h5):(2'h2)]) <<< $unsigned((reg105 > (reg96 != reg106)))));
              reg104 <= (+$unsigned(reg103[(3'h5):(1'h0)]));
              reg105 <= $unsigned({(((wire89 ? reg107 : (8'ha0)) ?
                          (wire91 ? (8'ha2) : reg100) : (wire91 - reg94)) ?
                      ((wire92 <= (8'hae)) ?
                          $unsigned(reg102) : wire90[(2'h2):(2'h2)]) : ($unsigned(reg104) ~^ (reg94 ?
                          (8'hbf) : (8'ha6)))),
                  $unsigned($signed(reg104[(3'h5):(1'h0)]))});
            end
          reg106 <= {$signed(reg97[(1'h1):(1'h0)]),
              (+$unsigned(($unsigned((8'hac)) ?
                  $unsigned(reg104) : $signed(wire89))))};
          reg107 <= ((($signed($signed(reg104)) + $signed(reg106)) ?
              $unsigned({reg105[(1'h1):(1'h0)]}) : $unsigned((wire89 ?
                  (reg101 ?
                      (8'hbd) : reg100) : wire92))) ~^ reg97[(2'h3):(2'h3)]);
        end
      reg108 <= (8'hbb);
    end
  assign wire109 = $unsigned(wire91);
  assign wire110 = reg94[(1'h0):(1'h0)];
  assign wire111 = (({(8'h9d)} ?
                           {($signed((8'hae)) ? (^~reg101) : $signed(wire93)),
                               (~|wire90)} : $unsigned(wire91)) ?
                       $signed($unsigned((+wire92))) : wire91);
  assign wire112 = (|((&reg94) ?
                       $signed($unsigned(wire110)) : $unsigned($unsigned((wire89 ?
                           (8'ha4) : reg103)))));
  assign wire113 = (~reg100);
  always
    @(posedge clk) begin
      if ((~(($unsigned((reg105 ? wire113 : reg98)) << ($signed((8'hb2)) ?
              reg107 : (reg102 ? reg104 : wire110))) ?
          reg94[(3'h7):(2'h3)] : (((wire110 ? reg107 : (8'hb9)) << (reg106 ?
                  reg106 : wire110)) ?
              ((~wire109) == (reg98 == reg97)) : (~|(reg108 ?
                  reg99 : (8'h9d)))))))
        begin
          reg114 <= ($unsigned((reg102[(5'h12):(1'h1)] & ($unsigned(wire112) <<< $signed((8'hac))))) && $unsigned((wire92 ?
              (|$signed(wire93)) : (wire113[(5'h11):(4'hb)] != $unsigned(wire89)))));
          reg115 <= reg100;
          reg116 <= ($signed($unsigned(reg98[(1'h0):(1'h0)])) ?
              $unsigned({((+wire93) >>> reg100), wire91}) : {wire93,
                  {reg95[(4'h8):(2'h2)]}});
        end
      else
        begin
          reg114 <= $signed((^~$unsigned({$signed(reg108),
              reg96[(1'h1):(1'h1)]})));
        end
    end
  assign wire117 = $signed($unsigned($signed((reg104 ?
                       (reg99 ? wire89 : reg114) : reg114))));
  assign wire118 = $unsigned((-(|reg106[(4'h8):(2'h3)])));
  assign wire119 = $signed(wire110[(1'h1):(1'h0)]);
  assign wire120 = ((^wire91[(3'h7):(3'h5)]) >>> $signed($unsigned(($unsigned(reg97) && (~^wire109)))));
  always
    @(posedge clk) begin
      reg121 <= $unsigned((~^{reg106}));
      reg122 <= ($unsigned((&$signed($signed(wire92)))) ?
          (wire109[(4'hf):(2'h3)] ?
              (~&wire117) : {($signed(reg96) ?
                      (8'hb5) : $signed(wire117))}) : wire119[(3'h7):(3'h7)]);
      reg123 <= (8'ha7);
      reg124 <= (wire89 * $signed((&$signed(wire92[(2'h2):(1'h1)]))));
    end
endmodule

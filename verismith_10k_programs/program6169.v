module top
#(parameter param60 = {(+((+((8'ha5) || (8'ha5))) ? (((7'h42) != (8'hb1)) ? (-(7'h42)) : ((8'hbc) ? (8'hb5) : (8'hb7))) : ((7'h42) * ((8'h9c) ? (7'h41) : (8'hba))))), ({(((7'h42) & (8'ha8)) ? ((7'h42) ? (8'haa) : (7'h44)) : ((8'hba) * (8'ha7)))} != ((((8'hac) ^~ (8'h9e)) ~^ ((8'hb4) ? (7'h42) : (7'h42))) ? ((8'ha9) ? ((8'ha6) ? (8'had) : (7'h44)) : ((8'hbd) << (8'had))) : ((|(8'haa)) + {(8'h9c), (8'had)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire59,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 (1'h0)};
  assign wire5 = ((~|(8'hac)) ?
                     ({wire2} ?
                         (^~wire2) : $unsigned(($unsigned(wire2) == wire4))) : $signed(($unsigned($signed(wire4)) ?
                         ((wire3 ? wire3 : wire2) ?
                             (wire4 & wire3) : wire4) : wire4)));
  assign wire6 = (&$signed($signed(wire5[(3'h5):(1'h1)])));
  assign wire7 = (-$signed(wire2));
  assign wire8 = (wire3[(4'hc):(3'h5)] << {(wire2 ?
                         (wire0[(3'h4):(1'h0)] ?
                             (wire2 ? wire6 : wire3) : {wire0,
                                 wire7}) : $unsigned($unsigned(wire4)))});
  assign wire9 = wire0[(4'ha):(3'h6)];
  assign wire10 = wire1[(3'h7):(1'h0)];
  assign wire11 = wire0;
  assign wire12 = {(wire9 * (!wire3)),
                      {((|$signed(wire10)) + (^$signed(wire7)))}};
  assign wire13 = ((wire2[(4'h8):(4'h8)] > wire1[(2'h2):(1'h0)]) ?
                      wire10[(2'h3):(1'h1)] : (8'hbf));
  assign wire14 = wire10[(1'h1):(1'h0)];
  assign wire15 = $signed((-$signed(wire2)));
  assign wire16 = wire9[(3'h6):(1'h0)];
  assign wire17 = wire6;
  always
    @(posedge clk) begin
      reg18 <= (((&$unsigned(wire6[(3'h7):(1'h1)])) ?
              (8'haf) : ($unsigned($signed((8'hba))) >> wire12[(3'h6):(3'h6)])) ?
          wire6[(3'h4):(1'h0)] : ((+$signed($signed((8'hbe)))) <= $unsigned({wire7,
              {wire15, wire3}})));
      reg19 <= (wire15[(2'h2):(1'h0)] ^ wire13[(4'hc):(3'h7)]);
      reg20 <= {$unsigned(((wire8 > wire15) ?
              $unsigned($signed(wire1)) : ((~wire1) ?
                  $unsigned((8'hab)) : (wire15 >> wire5)))),
          {{(wire2[(2'h2):(2'h2)] ? (!wire10) : $unsigned(wire17))}}};
      if ((&wire4[(1'h1):(1'h1)]))
        begin
          reg21 <= ($unsigned(reg19[(1'h1):(1'h0)]) ?
              ((|(wire7 ?
                  (wire7 ? wire15 : (7'h41)) : (wire4 ?
                      wire11 : (7'h42)))) > (|($unsigned(wire15) ?
                  {wire8} : wire7[(1'h0):(1'h0)]))) : (wire14[(4'ha):(3'h6)] >= wire7[(3'h6):(2'h2)]));
          reg22 <= $unsigned($signed((($unsigned(wire15) || $signed(wire4)) ?
              wire4[(4'hb):(3'h6)] : wire13[(3'h4):(1'h0)])));
          if (wire9[(3'h4):(2'h2)])
            begin
              reg23 <= $signed((-wire17[(1'h1):(1'h1)]));
            end
          else
            begin
              reg23 <= ({{wire15[(1'h0):(1'h0)], (+reg21)},
                  (-((!wire3) ?
                      wire8 : wire5))} << $signed($signed($unsigned($signed(wire10)))));
              reg24 <= ((wire12 ?
                      $signed((|wire8)) : ($signed($signed(reg20)) ?
                          wire8[(4'h9):(1'h1)] : ($signed(wire11) > (8'hba)))) ?
                  $signed((~&wire16)) : wire14);
              reg25 <= ($unsigned($signed((reg19[(3'h4):(2'h2)] >>> $unsigned(wire4)))) ?
                  ($signed($signed($signed(wire12))) >= ($signed((wire12 ?
                          reg18 : (8'ha6))) ?
                      ((8'had) ?
                          (wire7 ?
                              wire17 : reg21) : wire6[(4'h9):(3'h7)]) : (^~reg22))) : (8'hbd));
            end
        end
      else
        begin
          if ($unsigned($unsigned(({{wire12,
                  reg22}} ^~ wire8[(5'h11):(4'h9)]))))
            begin
              reg21 <= ((&wire17[(1'h0):(1'h0)]) ? (8'haa) : wire9);
              reg22 <= (wire15 ?
                  ({$unsigned((~&wire1))} ?
                      (wire0 >>> reg22) : (((wire3 | (8'h9c)) ?
                          (reg25 <= (8'hac)) : reg25) << wire7[(1'h1):(1'h1)])) : (~(wire1[(4'hd):(3'h4)] < $unsigned($signed(wire13)))));
              reg23 <= (8'hb7);
              reg24 <= (-(&{($unsigned(wire5) ^ $unsigned((8'ha2))),
                  $unsigned((wire2 ? wire17 : wire10))}));
              reg25 <= $unsigned(reg21);
            end
          else
            begin
              reg21 <= wire4;
            end
          reg26 <= ((^~$signed($signed((~(8'hb6))))) || $signed(((-wire11) ^ reg25[(1'h1):(1'h1)])));
          reg27 <= wire2[(3'h7):(2'h3)];
        end
      reg28 <= $signed($signed(wire13));
    end
  assign wire29 = $unsigned(($signed($signed(wire1)) + {{(wire1 ?
                              reg19 : reg23),
                          {wire1}},
                      ($signed((8'h9f)) ^~ $unsigned((8'hae)))}));
  assign wire30 = reg20;
  assign wire31 = (|((wire9 ?
                      $unsigned((wire29 ?
                          wire17 : wire16)) : wire9[(4'h9):(4'h8)]) >> (&{(reg22 <= wire17),
                      $unsigned(reg19)})));
  assign wire32 = ((wire10[(2'h2):(1'h1)] ?
                      reg26[(1'h0):(1'h0)] : $signed($signed((+wire7)))) & (~wire29));
  always
    @(posedge clk) begin
      reg33 <= ((wire14 >>> {((wire13 ?
              wire8 : wire8) || wire7[(2'h2):(1'h1)])}) < {{$unsigned((reg19 ?
                  reg28 : wire6))},
          (~|wire30)});
      if ($unsigned((-(-((wire0 ? wire4 : wire7) >>> (+wire0))))))
        begin
          reg34 <= wire31[(1'h1):(1'h0)];
          reg35 <= wire3;
          reg36 <= ((&reg33[(1'h1):(1'h1)]) ?
              {({reg20} ?
                      $signed((reg18 <<< wire4)) : $unsigned($unsigned(wire12))),
                  ($signed((^wire3)) ?
                      reg24 : {$unsigned(wire8),
                          (reg22 < (8'hb9))})} : (((reg20[(2'h2):(2'h2)] ^ $unsigned((8'ha1))) * wire17[(1'h0):(1'h0)]) < $unsigned(wire6)));
          reg37 <= reg22[(1'h0):(1'h0)];
        end
      else
        begin
          reg34 <= ((8'hbb) == (8'hb7));
          reg35 <= $unsigned((~^wire4));
          if (((~|(8'h9e)) ~^ reg37))
            begin
              reg36 <= $unsigned(wire8);
              reg37 <= wire14[(1'h0):(1'h0)];
            end
          else
            begin
              reg36 <= (+reg18);
              reg37 <= $unsigned(((~&reg33[(1'h1):(1'h0)]) ?
                  (wire17[(2'h2):(1'h0)] ?
                      ($unsigned(wire32) ?
                          $signed((8'had)) : (reg37 << wire3)) : (((8'haf) || wire4) * (reg23 | reg35))) : (|({(8'haa),
                          wire32} ?
                      (~(8'hb0)) : reg24[(3'h5):(3'h5)]))));
              reg38 <= ((^(((+wire4) < (wire5 ^~ reg27)) ?
                      {$unsigned(reg35), $unsigned((8'ha0))} : ((wire10 ?
                          reg33 : reg34) <= ((8'hbc) | reg18)))) ?
                  (~|$signed((~&$unsigned(reg33)))) : $unsigned(wire32[(4'h8):(1'h0)]));
              reg39 <= ((!reg19) <= $signed((($signed(wire0) ?
                  wire9 : reg22) >>> reg33)));
              reg40 <= reg33[(2'h3):(1'h0)];
            end
          reg41 <= (wire10[(3'h7):(1'h1)] ?
              wire11 : $signed(((8'hb9) ?
                  ($signed(wire4) ?
                      (^~wire7) : wire14) : $signed((wire32 << reg24)))));
          if (wire7)
            begin
              reg42 <= ($signed($signed(($unsigned((8'ha2)) <<< (!(8'hbd))))) ?
                  wire3 : (^$unsigned(($unsigned(wire1) ^~ wire11[(1'h1):(1'h0)]))));
              reg43 <= (!($signed({(wire16 ? wire5 : wire4),
                  reg38}) << ((-(wire6 ? wire10 : (8'ha6))) >= $signed((wire1 ?
                  wire12 : reg26)))));
              reg44 <= ($signed(($signed(reg28[(2'h2):(1'h0)]) ?
                      {(-wire10),
                          wire13[(4'hc):(4'h9)]} : (^~wire4[(3'h5):(2'h3)]))) ?
                  (+($unsigned({wire30}) ?
                      {reg35} : (reg37 ?
                          $signed(wire32) : (8'hb8)))) : $unsigned((((reg26 ?
                          reg36 : reg42) & $unsigned(wire6)) ?
                      $signed(wire3[(4'h9):(3'h7)]) : (^$signed(wire0)))));
              reg45 <= ($signed(reg28[(3'h4):(1'h1)]) ^ (wire13[(4'h9):(3'h5)] - reg22[(2'h3):(2'h2)]));
              reg46 <= reg18[(3'h4):(3'h4)];
            end
          else
            begin
              reg42 <= (~($signed(((~|wire0) - (~&reg23))) ^~ $unsigned(wire10[(3'h4):(2'h2)])));
              reg43 <= (((|$signed($unsigned(reg21))) && reg44) ^~ {(wire1[(4'ha):(4'h9)] ?
                      (8'ha7) : (-$signed(wire4)))});
              reg44 <= $signed(reg23[(4'h8):(2'h3)]);
              reg45 <= (|$signed($unsigned($signed((|reg45)))));
            end
        end
      if (reg40)
        begin
          reg47 <= ($signed($signed((wire8[(1'h0):(1'h0)] ?
              reg33 : {wire0, wire9}))) >>> $unsigned($unsigned(wire8)));
          reg48 <= reg24[(1'h0):(1'h0)];
          reg49 <= {({reg37[(1'h1):(1'h0)]} >= $unsigned(reg41))};
          if ((^reg47))
            begin
              reg50 <= ({$unsigned($unsigned($signed(reg44)))} ?
                  $signed(($signed((wire10 + wire9)) - ({reg35} < wire0))) : (8'hb9));
              reg51 <= $unsigned($unsigned(wire13[(1'h0):(1'h0)]));
              reg52 <= reg23;
              reg53 <= (^$signed($unsigned($unsigned($unsigned((8'hb8))))));
              reg54 <= ($unsigned((~wire17)) ?
                  ((($signed(wire11) || reg27[(1'h0):(1'h0)]) - reg26) > $unsigned($signed($signed(wire9)))) : $signed(reg45[(2'h2):(1'h0)]));
            end
          else
            begin
              reg50 <= ((8'hb5) ?
                  (!(8'ha9)) : ((reg39[(4'hb):(4'ha)] ?
                      ((wire13 << reg27) == (reg34 ?
                          reg18 : reg54)) : reg34[(4'hc):(4'hb)]) ~^ (($signed(reg44) ?
                          wire14[(2'h2):(2'h2)] : {reg50, reg36}) ?
                      (8'ha1) : (-reg24[(3'h7):(3'h7)]))));
              reg51 <= {{$signed(({wire13} && (wire8 ? reg45 : reg51)))},
                  $unsigned($unsigned({$unsigned(reg50)}))};
            end
          if (reg34)
            begin
              reg55 <= $unsigned((wire4[(3'h6):(2'h3)] ?
                  ($unsigned((~^(8'hbf))) ?
                      $signed($unsigned(reg49)) : $signed($signed((8'hb8)))) : wire16[(5'h12):(1'h1)]));
              reg56 <= reg27[(1'h0):(1'h0)];
              reg57 <= reg39[(3'h5):(3'h5)];
            end
          else
            begin
              reg55 <= {$signed(($unsigned((reg56 ? reg43 : reg43)) ?
                      reg50 : ((reg44 ? (8'haf) : reg53) ?
                          (reg36 - reg38) : reg50)))};
            end
        end
      else
        begin
          if ((wire17 ?
              (($unsigned((reg34 + (8'hb5))) || (reg23[(3'h4):(2'h2)] ?
                  (reg22 ? wire31 : wire31) : $signed(wire6))) && (wire30 ?
                  reg33[(2'h2):(1'h0)] : (~^reg57[(3'h7):(3'h7)]))) : reg26))
            begin
              reg47 <= $unsigned($signed($signed({wire8[(1'h1):(1'h0)]})));
              reg48 <= {(($signed({reg49,
                      wire12}) * (|$signed((8'hb6)))) >> $signed((reg51 ?
                      (wire1 || wire12) : $unsigned(reg45))))};
              reg49 <= reg46[(3'h7):(1'h1)];
              reg50 <= $signed((8'hbe));
            end
          else
            begin
              reg47 <= (8'hbf);
            end
          reg51 <= (^(reg22 - reg48[(4'hb):(3'h7)]));
        end
      reg58 <= ({(wire32[(3'h5):(2'h3)] ?
              $unsigned(wire1) : (!$signed(wire10))),
          ((~^reg26) >= $unsigned(reg54))} <= reg55[(2'h2):(1'h1)]);
    end
  assign wire59 = $signed(reg52);
endmodule

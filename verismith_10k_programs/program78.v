module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire87,
                 wire85,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (&$signed(wire4));
  assign wire6 = ((~^(~|(^((8'hba) ? wire1 : wire4)))) ?
                     wire2 : (wire1[(5'h13):(4'hd)] ?
                         {wire2,
                             (wire3[(1'h1):(1'h1)] << $signed(wire0))} : wire0));
  assign wire7 = (~&($unsigned($unsigned(wire5[(1'h0):(1'h0)])) ?
                     (^~{(^~wire1), $signed(wire2)}) : wire1[(2'h3):(2'h2)]));
  assign wire8 = wire5[(4'hb):(1'h1)];
  assign wire9 = wire7;
  assign wire10 = $signed($unsigned($signed({$signed(wire6)})));
  module11 #() modinst86 (wire85, clk, wire4, wire6, wire7, wire5);
  assign wire87 = {$signed($signed(wire10)),
                      $unsigned($signed($unsigned(wire8[(2'h2):(1'h0)])))};
endmodule

module module11
#(parameter param83 = (^~(^~((|((8'hb2) != (8'hbc))) ? {((8'hb8) ? (8'hac) : (8'hb8))} : (-(!(8'hba)))))), 
parameter param84 = ((-(param83 & ({param83} & ((7'h41) ? param83 : param83)))) >= ((+(param83 ? param83 : param83)) ? (~{{param83}}) : param83)))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire82;
  wire [(4'h9):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire67;
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= {(wire12 - {(^(wire12 < wire14))})};
      reg17 <= reg16[(3'h6):(2'h2)];
      if (reg16)
        begin
          reg18 <= $unsigned(((((wire13 ? wire13 : wire12) ?
                  (wire14 ? wire15 : reg16) : $unsigned(wire13)) ?
              {$signed(wire12)} : (7'h42)) < wire14));
        end
      else
        begin
          reg18 <= reg18;
          reg19 <= $unsigned((($signed(reg17) ~^ ((wire15 ?
              wire14 : (8'hb3)) >> (~^wire14))) * reg17[(5'h13):(2'h2)]));
          if (wire14[(2'h3):(2'h3)])
            begin
              reg20 <= (wire15[(1'h1):(1'h1)] <= (reg17 ?
                  ((reg18 ? (wire15 && reg19) : wire15[(1'h1):(1'h1)]) ?
                      $signed((~&wire12)) : (wire12 || (reg16 >= wire14))) : wire12[(4'h8):(1'h1)]));
              reg21 <= $signed(($unsigned($signed($signed(wire14))) ^ $signed(($signed(reg17) | (-reg20)))));
              reg22 <= {wire14};
            end
          else
            begin
              reg20 <= $unsigned($signed((~&wire13)));
            end
        end
      if ($unsigned(reg22[(5'h15):(3'h7)]))
        begin
          reg23 <= (8'hba);
        end
      else
        begin
          reg23 <= $signed(($unsigned(((reg19 ? reg23 : wire15) * (~wire14))) ?
              (+reg16) : $unsigned(reg23)));
          reg24 <= ((~|reg22) ?
              (($signed($unsigned(reg21)) | $unsigned($unsigned(reg17))) ?
                  (~&{$signed(wire14)}) : reg16) : wire14);
          reg25 <= {({(reg23 ?
                      $unsigned(reg18) : ((8'hac) != (8'hae)))} >>> reg19),
              reg21[(5'h10):(4'he)]};
          reg26 <= (-($unsigned(reg23[(2'h3):(1'h1)]) ?
              $unsigned($unsigned(reg22)) : reg24[(4'h8):(3'h7)]));
        end
    end
  module27 #() modinst68 (.wire30(reg20), .wire28(reg22), .wire31(reg17), .y(wire67), .wire29(reg23), .clk(clk));
  assign wire69 = $unsigned(reg22[(4'h9):(3'h5)]);
  assign wire70 = wire69;
  assign wire71 = (8'had);
  always
    @(posedge clk) begin
      reg72 <= (~^(+reg20[(4'hd):(4'hb)]));
      reg73 <= {{$signed($signed((^~reg16))),
              ((-reg21) | $unsigned(reg16[(4'h8):(4'h8)]))},
          $unsigned(($unsigned((wire15 ? (8'hb2) : (8'ha4))) ?
              $signed($signed(reg26)) : (!wire12)))};
      reg74 <= $signed(wire13);
      reg75 <= $unsigned($unsigned($signed((7'h40))));
      reg76 <= (reg18[(1'h0):(1'h0)] ?
          $signed($signed(((reg21 ? (8'haa) : (8'ha9)) ?
              {reg72} : $unsigned(reg25)))) : ((~^$unsigned($signed(reg18))) ?
              reg73 : wire14[(3'h6):(1'h1)]));
    end
  assign wire77 = $signed(($unsigned($signed(reg16)) ~^ (^((wire69 ?
                      reg22 : reg73) > reg25[(4'hb):(1'h1)]))));
  assign wire78 = (reg22 ^ (^~($signed(((8'hb6) ? wire15 : (8'hae))) ?
                      wire77 : (reg18[(2'h2):(1'h1)] != (~reg25)))));
  assign wire79 = reg76[(5'h12):(3'h5)];
  assign wire80 = $unsigned($unsigned({wire14[(4'hb):(3'h5)]}));
  assign wire81 = reg20;
  assign wire82 = (-((|(~$unsigned(reg17))) ?
                      (reg75[(4'he):(4'h8)] + ((~^(8'ha7)) ?
                          reg21 : (~&(8'hba)))) : $signed(($unsigned((8'ha2)) >= {reg76,
                          wire71}))));
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire32 = (wire31[(2'h2):(2'h2)] | $unsigned(wire29[(1'h1):(1'h0)]));
  assign wire33 = {$unsigned(({(wire29 ? wire29 : wire32), (~^wire30)} ?
                          $unsigned((8'ha5)) : {(~^wire29)})),
                      (wire31 <= $signed($unsigned($unsigned(wire29))))};
  assign wire34 = ((~&wire33[(2'h2):(1'h1)]) <= ((wire30 <<< wire31[(3'h7):(1'h1)]) * (~wire28[(1'h0):(1'h0)])));
  assign wire35 = wire31;
  assign wire36 = $signed((8'hb1));
  always
    @(posedge clk) begin
      if (($signed(((wire31[(4'h9):(1'h0)] ? wire31 : $signed((8'ha5))) ?
              wire28 : $signed((^wire31)))) ?
          $signed((8'hbe)) : (8'haa)))
        begin
          if (($signed(wire35) ?
              wire36 : ($unsigned({$unsigned(wire35)}) ?
                  wire29 : (((wire36 == wire34) ?
                          $signed(wire29) : (wire31 ? wire34 : wire29)) ?
                      wire30[(5'h10):(5'h10)] : ({wire32,
                          wire31} >> (&(8'hb5)))))))
            begin
              reg37 <= $unsigned(wire29[(1'h1):(1'h0)]);
              reg38 <= $signed($unsigned((^wire30[(3'h5):(2'h2)])));
              reg39 <= wire31[(4'h8):(3'h6)];
              reg40 <= wire36[(1'h1):(1'h1)];
            end
          else
            begin
              reg37 <= (~|((~&$unsigned($unsigned((8'hb1)))) ?
                  (((^reg37) ?
                      (~(8'hb6)) : $unsigned((8'had))) >> $signed($unsigned(reg40))) : $unsigned($signed(reg37[(3'h4):(2'h2)]))));
              reg38 <= (&{((wire28[(3'h4):(2'h2)] & {(8'had),
                      wire29}) >= $signed((reg40 ? wire36 : reg37)))});
              reg39 <= (8'haf);
              reg40 <= ((reg38 ?
                  $signed($unsigned(reg38)) : (!(-(wire34 ?
                      reg37 : (8'ha5))))) || (&$unsigned((8'ha8))));
            end
          if ({(((+((8'ha3) * (7'h43))) ? wire32[(1'h1):(1'h1)] : (~&wire32)) ?
                  (wire31 ?
                      (wire32 != ((8'hb1) == wire30)) : ($signed(wire34) ?
                          $unsigned(reg37) : reg38)) : reg37[(2'h2):(1'h1)])})
            begin
              reg41 <= $signed(((wire34[(4'hb):(4'hb)] != wire29) ?
                  reg40 : reg39));
              reg42 <= ((8'h9f) >= $signed(wire29[(2'h2):(1'h1)]));
              reg43 <= $unsigned(((wire28[(1'h0):(1'h0)] ^ (reg37[(1'h1):(1'h1)] ^ {reg37})) ?
                  $signed(wire34) : (((~wire32) << $unsigned((8'ha1))) ?
                      $signed((wire36 ?
                          (8'h9e) : wire28)) : (+$signed(reg38)))));
              reg44 <= $unsigned(((($signed(wire30) ? reg41 : (-reg39)) ?
                  reg39 : ((reg37 || wire35) * $unsigned(wire28))) & $signed(wire29)));
            end
          else
            begin
              reg41 <= (({reg38[(3'h7):(2'h3)]} & $signed($signed(wire32[(3'h6):(3'h5)]))) ?
                  (~&((~&$unsigned(reg40)) ?
                      ((wire31 <= wire30) >>> reg42[(4'h8):(2'h2)]) : $signed(reg44))) : {(~(|wire33)),
                      (wire33[(1'h1):(1'h0)] < wire31[(1'h1):(1'h0)])});
            end
          if (reg37)
            begin
              reg45 <= wire31;
              reg46 <= (^(8'hab));
              reg47 <= (|{(reg39[(1'h0):(1'h0)] ^ ((reg46 || wire36) ?
                      wire35[(1'h1):(1'h0)] : reg40[(4'h9):(2'h3)])),
                  $unsigned($unsigned(reg42[(4'ha):(3'h5)]))});
              reg48 <= reg37;
            end
          else
            begin
              reg45 <= $signed({(($signed(wire28) >> (reg40 ?
                          reg42 : (8'haa))) ?
                      wire35[(3'h5):(2'h2)] : ((8'hb6) ?
                          (reg38 ? reg38 : reg43) : wire28))});
              reg46 <= {(+(!$unsigned({wire33, wire31}))),
                  ({wire33} << (((~|reg45) <= $signed(wire33)) - {wire35[(3'h6):(1'h1)]}))};
              reg47 <= (+$unsigned(((8'h9c) ?
                  ((reg37 ? wire34 : wire34) ?
                      {(8'ha5), wire30} : (|(8'hb9))) : {(~(8'haa)),
                      $signed(wire34)})));
              reg48 <= (reg45[(1'h0):(1'h0)] ?
                  (-reg37) : (~($unsigned({wire29}) ?
                      $unsigned($signed(reg38)) : ((reg48 ?
                          reg42 : wire29) >> $signed(reg48)))));
            end
          reg49 <= $signed((~^{$signed($signed(reg38))}));
        end
      else
        begin
          reg37 <= $signed($signed((^(^((8'hb0) - wire31)))));
          reg38 <= reg45[(3'h4):(3'h4)];
          reg39 <= reg46;
          if ($signed($unsigned((reg47 >= {((8'hba) ? (8'hb5) : reg49),
              reg39[(1'h1):(1'h1)]}))))
            begin
              reg40 <= reg44;
              reg41 <= wire33[(2'h2):(1'h0)];
              reg42 <= $unsigned(wire35);
              reg43 <= $unsigned(((!$unsigned($unsigned((8'hb5)))) ?
                  reg43[(2'h2):(1'h0)] : $unsigned($unsigned((reg39 ?
                      reg43 : (8'ha1))))));
            end
          else
            begin
              reg40 <= $signed(((((wire29 & wire34) || $unsigned(wire33)) >> (^reg37)) ?
                  ($signed($signed((8'hbd))) ?
                      (8'hbc) : $signed($unsigned(reg43))) : wire31));
              reg41 <= wire32[(4'h8):(2'h3)];
              reg42 <= $unsigned(wire28[(3'h4):(2'h2)]);
              reg43 <= ($unsigned((~&reg43)) ?
                  {$unsigned((7'h42)),
                      ((~^(8'h9f)) && reg38[(1'h0):(1'h0)])} : $unsigned(((wire34[(2'h2):(1'h0)] ?
                      wire34 : wire28[(4'ha):(3'h4)]) || (+(reg42 ?
                      reg39 : reg39)))));
              reg44 <= ((~(8'hbe)) ?
                  $unsigned((wire31[(4'h9):(3'h7)] & wire34)) : wire32);
            end
        end
      reg50 <= reg44;
      if (wire30[(4'h9):(1'h0)])
        begin
          if ($signed((((^(!wire36)) ?
                  ($unsigned(wire28) ?
                      (^~wire31) : (reg50 << reg47)) : (~^$signed((7'h41)))) ?
              (&wire33[(2'h3):(2'h3)]) : {(&reg50[(4'hb):(3'h6)]),
                  wire30[(4'h8):(1'h1)]})))
            begin
              reg51 <= reg47[(4'hb):(4'h9)];
              reg52 <= {(wire28 < reg41[(3'h7):(3'h4)]), reg44[(4'hc):(2'h2)]};
              reg53 <= wire36;
              reg54 <= reg41[(4'h9):(4'h8)];
            end
          else
            begin
              reg51 <= reg38[(3'h7):(1'h1)];
            end
          if ({reg45[(3'h4):(3'h4)]})
            begin
              reg55 <= $signed(({$signed(reg43), $unsigned({wire30})} ?
                  {$unsigned($unsigned(reg38))} : reg43[(4'ha):(3'h4)]));
              reg56 <= reg42[(4'h8):(3'h5)];
            end
          else
            begin
              reg55 <= wire28;
              reg56 <= (~reg45);
              reg57 <= $unsigned({(8'ha5)});
              reg58 <= wire29[(2'h2):(1'h1)];
              reg59 <= $unsigned((wire31 >= reg43[(4'h8):(2'h3)]));
            end
          reg60 <= (8'hb5);
        end
      else
        begin
          reg51 <= $signed(reg54[(4'hc):(1'h1)]);
          reg52 <= (8'ha1);
          reg53 <= (($unsigned($signed((reg55 ?
              reg53 : reg41))) >> (((~&reg49) ?
              $signed((7'h40)) : (-reg60)) ^ $signed($unsigned(reg43)))) & wire34[(4'h9):(3'h6)]);
          reg54 <= ($signed(reg57[(1'h1):(1'h0)]) && (reg46[(2'h2):(1'h1)] ?
              reg37[(1'h0):(1'h0)] : $unsigned($unsigned((~^(8'hb1))))));
        end
    end
  assign wire61 = $unsigned($signed(($unsigned(reg45) ?
                      ((reg60 ? (7'h43) : reg38) ?
                          (8'h9f) : (8'ha8)) : (-$unsigned(wire28)))));
  assign wire62 = $unsigned($signed(wire31[(4'hb):(4'hb)]));
  assign wire63 = (wire28[(3'h6):(3'h4)] >> reg52);
  assign wire64 = {{(|((reg39 ? reg55 : reg37) ? $signed((8'ha0)) : (8'hbc))),
                          {$signed((wire31 >>> reg57)),
                              $signed($signed(reg58))}}};
  assign wire65 = ($unsigned($signed($signed({reg45,
                      reg43}))) | $unsigned(((8'haf) ~^ {(~wire61),
                      $signed(wire63)})));
  assign wire66 = $unsigned($unsigned($unsigned($signed($unsigned(reg43)))));
endmodule

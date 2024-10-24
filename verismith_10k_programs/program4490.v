module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire66;
  assign y = {wire68, wire5, wire6, wire7, wire8, wire9, wire66, (1'h0)};
  assign wire5 = (wire3 | {((|(wire4 << wire0)) ?
                         (~^(|wire2)) : $unsigned(wire0[(3'h4):(2'h2)])),
                     (~^$signed((|(8'ha4))))});
  assign wire6 = $unsigned(((((wire0 ? wire2 : wire4) >= wire2[(3'h5):(2'h3)]) ?
                         (wire0[(4'ha):(3'h4)] ?
                             (wire5 ?
                                 wire2 : wire4) : (wire3 == wire5)) : ((+(8'hb7)) ?
                             {wire2} : (!wire1))) ?
                     wire0 : $unsigned((~&wire5[(2'h3):(2'h3)]))));
  assign wire7 = ((wire6 && wire5) ?
                     wire0[(3'h6):(3'h5)] : $signed((|($unsigned(wire3) - $signed(wire2)))));
  assign wire8 = {(!wire6)};
  assign wire9 = {{wire5,
                         $signed((wire7 ?
                             ((8'hb1) ? wire7 : wire3) : (~wire4)))}};
  module10 #() modinst67 (wire66, clk, wire3, wire0, wire2, wire8, wire1);
  assign wire68 = ((wire0 ?
                      (^$unsigned((wire9 ?
                          wire0 : wire6))) : (wire2[(3'h4):(2'h2)] ?
                          wire9[(2'h2):(2'h2)] : wire6[(4'h8):(3'h6)])) * $unsigned(((7'h43) || (8'hb1))));
endmodule

module module10  (y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire62;
  assign y = {wire65, wire64, wire16, wire17, wire62, (1'h0)};
  assign wire16 = (wire15 ?
                      $signed((8'hb3)) : (~&((+(wire12 ?
                          wire13 : (8'h9d))) <<< wire14[(2'h2):(2'h2)])));
  assign wire17 = ($unsigned((wire16 > {(wire12 - wire16)})) - wire12[(4'hd):(3'h4)]);
  module18 #() modinst63 (.wire19(wire12), .wire22(wire17), .wire20(wire11), .clk(clk), .wire23(wire15), .y(wire62), .wire21(wire13));
  assign wire64 = {$unsigned(wire11[(3'h6):(2'h3)])};
  assign wire65 = {(~&(~|(-wire64[(3'h4):(3'h4)]))),
                      (wire14[(1'h1):(1'h0)] ?
                          wire15[(5'h11):(3'h6)] : (((~wire14) ?
                              ((8'ha7) > wire16) : $signed(wire62)) != {$unsigned(wire62),
                              wire15[(5'h15):(4'hc)]}))};
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire55,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg57,
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
                 (1'h0)};
  assign wire24 = {wire23[(4'h9):(2'h2)]};
  assign wire25 = wire24[(4'he):(4'hc)];
  assign wire26 = {($unsigned($unsigned($signed((7'h44)))) >>> (wire22[(4'hb):(1'h1)] ?
                          wire19 : (-{wire25, wire22})))};
  assign wire27 = (8'hb6);
  assign wire28 = (wire21 ? wire24[(3'h5):(3'h5)] : (~wire22));
  assign wire29 = $unsigned((+$unsigned(wire24[(2'h2):(1'h1)])));
  assign wire30 = (($signed(($unsigned(wire23) ?
                      wire26 : (wire25 ?
                          wire29 : wire24))) >> (~((~&wire19) << $signed(wire28)))) ~^ (8'ha3));
  assign wire31 = $unsigned(({wire30,
                      ((wire26 ? wire22 : wire23) <<< wire28)} == wire24));
  assign wire32 = (+wire30);
  always
    @(posedge clk) begin
      reg33 <= $unsigned($signed((~|$signed(wire30[(3'h4):(3'h4)]))));
      if ({$unsigned((((wire24 >>> wire31) - (~wire26)) ?
              (wire29[(1'h1):(1'h1)] ?
                  (wire19 ? reg33 : (8'hb3)) : (^~wire21)) : (^~{wire21})))})
        begin
          if ((~(wire27 <<< $unsigned((8'hbd)))))
            begin
              reg34 <= $signed((wire25 >> (^~wire29)));
              reg35 <= wire29;
            end
          else
            begin
              reg34 <= ({$unsigned(((wire25 ? wire21 : wire24) ?
                      (wire25 ? reg33 : wire30) : $unsigned(wire30))),
                  {(~&(wire25 <<< wire24)),
                      wire24}} || $unsigned(((+(reg35 & wire31)) ?
                  wire32[(4'h9):(3'h4)] : wire21[(4'h8):(2'h2)])));
              reg35 <= wire20;
              reg36 <= $unsigned(wire30[(4'h8):(2'h2)]);
            end
          if ($signed(wire21))
            begin
              reg37 <= $signed(wire25);
              reg38 <= $unsigned((-reg33[(3'h4):(2'h3)]));
            end
          else
            begin
              reg37 <= ({wire24[(4'ha):(3'h4)], (~&wire29[(2'h3):(2'h3)])} ?
                  ($signed(wire26[(1'h0):(1'h0)]) * (wire32 ?
                      wire20 : (^$unsigned(wire31)))) : (~&{reg33[(1'h1):(1'h1)]}));
              reg38 <= (!($signed($signed($signed(wire31))) << ({(~reg34)} ?
                  (wire28 ?
                      wire19 : {(8'ha6)}) : $signed($unsigned((8'hb2))))));
              reg39 <= {reg34[(4'ha):(3'h7)]};
              reg40 <= ({$signed($unsigned($signed(reg35))),
                      (($signed(wire19) && wire30[(2'h2):(1'h1)]) ^~ $signed((wire23 + wire27)))} ?
                  wire25[(2'h3):(2'h2)] : ((~^($unsigned(wire24) ?
                          $signed((8'hb9)) : $signed(wire32))) ?
                      $unsigned(wire21[(3'h7):(3'h5)]) : $unsigned({wire32,
                          (&(7'h40))})));
              reg41 <= ({{$signed(wire20)}} ?
                  $unsigned(wire26[(1'h1):(1'h0)]) : wire27);
            end
          reg42 <= wire21[(2'h3):(1'h1)];
          if ((($unsigned(wire31) ?
                  ((8'hb3) ?
                      ((wire27 >= wire32) ?
                          reg37[(3'h6):(2'h3)] : (~(8'hab))) : (|reg37)) : wire19[(2'h3):(2'h2)]) ?
              (~&$signed(wire26)) : $unsigned((&($unsigned(wire28) ?
                  {reg40, (7'h40)} : $unsigned(reg34))))))
            begin
              reg43 <= reg38[(3'h6):(1'h1)];
            end
          else
            begin
              reg43 <= wire27;
              reg44 <= wire30[(4'ha):(2'h3)];
              reg45 <= $signed((~&({(~^reg37), (8'ha6)} < reg43)));
              reg46 <= wire32;
              reg47 <= ((((+(8'hba)) ?
                      wire30[(3'h7):(3'h4)] : reg37[(5'h13):(2'h3)]) ^ $signed(($signed(reg37) & (^~(8'ha1))))) ?
                  (&$unsigned(wire29[(3'h6):(2'h2)])) : reg41[(4'hf):(4'hc)]);
            end
        end
      else
        begin
          reg34 <= $unsigned(reg34);
          reg35 <= (8'ha0);
          reg36 <= wire28[(4'h9):(3'h6)];
          reg37 <= $signed({{((+reg44) <= (wire21 | reg34))}, wire23});
        end
      if (((-(~wire20[(2'h2):(1'h0)])) ?
          reg47[(4'hd):(1'h0)] : (reg44 || $signed((~|wire23[(3'h7):(3'h4)])))))
        begin
          reg48 <= (((~^(-(wire19 ^~ reg46))) ?
              $signed(((wire22 <= wire32) || {wire32,
                  wire19})) : (reg44 ^~ $signed(wire22))) > wire20[(1'h0):(1'h0)]);
        end
      else
        begin
          reg48 <= reg45;
        end
      if (reg46)
        begin
          if ((~&$unsigned((^wire26[(1'h0):(1'h0)]))))
            begin
              reg49 <= (((!(wire28[(3'h4):(2'h3)] ?
                  {reg44,
                      wire26} : $signed(wire25))) >= $signed($signed((&wire29)))) || reg38[(4'hc):(4'ha)]);
            end
          else
            begin
              reg49 <= (~|($signed($signed(wire31[(4'h8):(3'h5)])) - reg46[(4'hb):(2'h2)]));
            end
          if ({$signed(wire24)})
            begin
              reg50 <= wire20;
              reg51 <= (~^{$signed($unsigned(reg35)),
                  $unsigned((reg48 <= (!wire21)))});
              reg52 <= ($unsigned(((^~(+wire20)) && reg42)) ?
                  (^~{(~^reg35)}) : {$unsigned((reg39 - reg39[(4'ha):(3'h6)]))});
              reg53 <= ((^~$signed(($signed(reg39) ?
                  (wire29 ?
                      (8'hab) : wire21) : (~(8'hb4))))) ^ (-($unsigned($unsigned((7'h40))) ?
                  {(reg48 ? wire22 : wire21),
                      ((8'hbf) ? reg45 : (8'ha3))} : reg45)));
              reg54 <= reg43[(4'hf):(3'h4)];
            end
          else
            begin
              reg50 <= reg47[(4'hc):(2'h3)];
              reg51 <= ((reg54[(4'hf):(4'hf)] ?
                      $unsigned(reg33[(2'h3):(2'h2)]) : ($unsigned(wire24) > ($signed(reg51) <<< (~&reg48)))) ?
                  (reg37 > wire27) : $signed((($signed((8'hb7)) ?
                          reg41 : $signed(wire24)) ?
                      wire24[(4'hc):(2'h2)] : wire30[(2'h3):(2'h2)])));
            end
        end
      else
        begin
          reg49 <= $signed({reg39, wire25[(4'h9):(4'h8)]});
          reg50 <= $unsigned(reg54[(1'h0):(1'h0)]);
        end
    end
  assign wire55 = $unsigned((($signed((~^(8'h9f))) ?
                          (-(reg34 ?
                              reg39 : wire20)) : $signed($signed(reg52))) ?
                      $unsigned(reg50[(1'h0):(1'h0)]) : wire21[(4'hd):(3'h7)]));
  assign wire56 = {(^(($signed(wire21) ?
                          {wire24} : ((8'hae) * reg35)) * (reg53 * wire20)))};
  always
    @(posedge clk) begin
      reg57 <= (~wire19[(2'h2):(2'h2)]);
    end
  assign wire58 = wire56[(3'h4):(2'h3)];
  assign wire59 = (|$signed(wire56));
  assign wire60 = ((wire27[(3'h5):(3'h4)] == $signed(($unsigned(reg39) ?
                      $signed(reg51) : wire32[(3'h7):(2'h2)]))) < {$unsigned(wire26),
                      $unsigned($signed($signed(reg44)))});
  assign wire61 = (8'haf);
endmodule

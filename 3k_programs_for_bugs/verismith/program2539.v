module top
#(parameter param73 = (~^((~|((^~(7'h42)) ? ((8'hbb) & (8'ha0)) : {(8'ha4), (8'had)})) ? {((~&(8'ha4)) ? ((8'h9f) ? (8'ha2) : (8'hab)) : {(8'hb0), (8'hab)})} : ((|{(8'hbe)}) ? ({(8'hb1), (8'ha7)} ? ((8'hb3) ? (8'hb3) : (8'ha5)) : ((8'h9c) << (8'hab))) : (((8'ha5) ? (8'haf) : (8'ha3)) ? (!(8'ha3)) : ((8'hb4) ? (8'haa) : (8'ha2)))))), 
parameter param74 = {({{(^~param73)}, {((8'hb6) ^~ param73), (param73 ? param73 : (8'hbf))}} ? (~&(~|(~|(8'hbd)))) : ((7'h42) ? ((~|param73) <<< (param73 && param73)) : ((param73 ? param73 : param73) << (param73 ^ param73)))), param73})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = {(wire2[(3'h5):(3'h4)] >= $unsigned(($signed(wire0) | (wire2 >>> wire2))))};
  assign wire5 = wire0[(3'h4):(1'h1)];
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      if (($signed((wire1 ?
              (wire1[(2'h3):(2'h2)] ?
                  (wire4 - (8'ha6)) : wire6) : (+$unsigned(wire1)))) ?
          wire3[(2'h3):(2'h2)] : ((^$signed((^wire3))) | ($signed({wire3}) ?
              ((~wire5) ?
                  $unsigned(wire6) : wire4[(1'h0):(1'h0)]) : $signed({wire2})))))
        begin
          reg7 <= {wire4[(2'h3):(2'h3)], wire3[(3'h6):(1'h1)]};
          reg8 <= ((($unsigned($signed(wire5)) > ((wire1 || wire0) >>> $signed(reg7))) ?
                  ($unsigned((^~wire2)) ?
                      $unsigned({wire5, wire1}) : {wire5[(4'he):(4'ha)],
                          (wire4 * wire3)}) : reg7[(4'ha):(3'h7)]) ?
              ((8'hb6) + wire4[(3'h4):(3'h4)]) : (~|{wire3}));
        end
      else
        begin
          if ((~|$unsigned({$unsigned(wire3)})))
            begin
              reg7 <= $unsigned($unsigned($signed($unsigned((reg7 ?
                  wire0 : wire6)))));
            end
          else
            begin
              reg7 <= reg8;
              reg8 <= wire3[(4'h9):(3'h6)];
            end
          reg9 <= (~|wire3[(3'h4):(1'h1)]);
          reg10 <= (($unsigned((|(~&reg8))) > (~&$signed((reg8 ?
              wire6 : wire6)))) & $signed((8'hb8)));
          reg11 <= reg10[(4'hd):(4'h9)];
        end
    end
  assign wire12 = (-($unsigned((((8'ha5) >= (8'hb4)) ?
                          ((8'hba) ^ reg11) : wire1[(4'h9):(3'h6)])) ?
                      reg9[(2'h3):(1'h0)] : $unsigned(wire3)));
  assign wire13 = (wire3 ?
                      ($unsigned(wire3) ?
                          $unsigned(reg10) : {($signed(wire4) ?
                                  $signed(wire1) : wire0)}) : wire4[(3'h7):(1'h1)]);
  assign wire14 = $signed((wire12[(4'hb):(3'h5)] ? reg10 : wire0));
  assign wire15 = $signed({(((wire14 ? wire2 : wire12) > reg7) ?
                          wire13 : ((reg8 ? wire0 : wire2) ?
                              wire5 : $signed(reg11)))});
  assign wire16 = (wire1[(3'h6):(3'h5)] ? wire3 : wire13[(1'h1):(1'h1)]);
  assign wire17 = wire15;
  assign wire18 = (^reg11[(3'h5):(2'h2)]);
  assign wire19 = (~&$unsigned(((&wire17[(3'h5):(2'h3)]) ?
                      ((-wire16) ?
                          (8'haf) : (~&reg8)) : (~|wire0[(4'h8):(2'h2)]))));
  always
    @(posedge clk) begin
      reg20 <= (|wire18[(3'h6):(1'h0)]);
      reg21 <= ((~|$unsigned($unsigned(reg9[(1'h1):(1'h1)]))) ?
          reg9[(2'h3):(2'h3)] : $signed((~|wire5)));
    end
  assign wire22 = ($signed(wire18) ?
                      $signed($unsigned(wire6)) : $unsigned(((~((8'ha0) <<< wire4)) ?
                          (8'hb1) : $signed((!wire14)))));
  assign wire23 = (wire5[(4'h8):(1'h1)] > (wire4 >>> wire0));
  assign wire24 = (-($signed(wire14[(2'h3):(2'h2)]) << ((^~$unsigned(reg20)) ?
                      wire5[(4'he):(3'h5)] : $unsigned(wire14[(2'h3):(1'h0)]))));
  module25 #() modinst71 (wire70, clk, wire14, wire24, wire22, wire4, reg10);
  assign wire72 = {(7'h40)};
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 (1'h0)};
  assign wire31 = $unsigned({$unsigned($signed(wire28[(3'h5):(2'h2)]))});
  assign wire32 = wire29[(1'h1):(1'h1)];
  assign wire33 = $unsigned($unsigned(wire26));
  assign wire34 = (~wire33[(2'h3):(1'h1)]);
  assign wire35 = $unsigned((8'had));
  always
    @(posedge clk) begin
      reg36 <= wire30[(2'h3):(2'h2)];
      if ($unsigned(((-$unsigned((&wire28))) ?
          (wire31 ?
              (((8'ha3) - wire29) ?
                  reg36 : (wire34 | wire30)) : $unsigned((wire27 ^ wire32))) : (wire27 ?
              $unsigned({(8'hb9), (8'ha5)}) : ((8'hb9) ?
                  (wire35 & reg36) : (wire29 - wire27))))))
        begin
          if (wire26[(4'hd):(2'h3)])
            begin
              reg37 <= ((+$unsigned((!(wire26 ?
                  wire30 : wire27)))) ^ $unsigned($signed(wire29)));
              reg38 <= ((8'ha6) ?
                  {$unsigned((^~((8'had) && wire30))),
                      $unsigned(wire32)} : (!((|{wire28, wire33}) | wire28)));
              reg39 <= reg37;
              reg40 <= ({((((8'hb7) ? wire32 : reg36) ?
                          {reg37} : wire26[(3'h4):(1'h1)]) >> $signed((reg39 ?
                          reg36 : wire29))),
                      (reg38[(3'h7):(3'h5)] > ($signed(wire26) ^~ (wire27 ?
                          wire34 : wire32)))} ?
                  (reg37 | $unsigned($unsigned($unsigned(wire29)))) : $unsigned(wire29[(3'h4):(1'h0)]));
            end
          else
            begin
              reg37 <= $signed($signed((~(|(wire31 == wire35)))));
              reg38 <= {$signed((-(reg40 ?
                      wire34[(4'h8):(1'h1)] : (wire28 ? wire27 : reg37)))),
                  $unsigned($unsigned($signed((~|wire27))))};
            end
          reg41 <= (8'hb9);
          reg42 <= ($signed(($unsigned((wire32 << wire30)) ~^ (~(wire31 >>> reg40)))) ?
              wire29[(2'h3):(1'h1)] : (-$signed($unsigned((wire30 >>> reg37)))));
        end
      else
        begin
          reg37 <= (!$unsigned(((wire32[(2'h2):(1'h0)] ?
                  reg41[(4'h9):(2'h2)] : wire33[(4'h9):(2'h3)]) ?
              $signed({reg41}) : (^(reg41 ? wire35 : wire27)))));
          if ((-reg39[(3'h7):(3'h6)]))
            begin
              reg38 <= $signed((8'hab));
              reg39 <= reg38;
              reg40 <= reg42[(1'h0):(1'h0)];
            end
          else
            begin
              reg38 <= wire28;
              reg39 <= (wire35[(3'h6):(3'h5)] ? reg42 : (^~$signed(reg38)));
              reg40 <= $signed($signed($signed($unsigned((~^wire27)))));
              reg41 <= wire26;
            end
          reg42 <= $unsigned(wire31[(3'h4):(2'h3)]);
        end
      if (wire34)
        begin
          if ($signed(wire26))
            begin
              reg43 <= (reg42 && (wire33 ?
                  reg41 : {wire31[(2'h2):(2'h2)], reg39}));
            end
          else
            begin
              reg43 <= $signed({(($unsigned(wire32) == (reg38 << reg43)) & ((wire35 ?
                      wire30 : reg36) <= {wire26, reg41})),
                  $signed(((wire32 ? wire29 : (8'hbb)) ?
                      reg38 : (wire27 ? reg37 : (8'ha0))))});
              reg44 <= reg37[(2'h2):(1'h0)];
              reg45 <= $unsigned($unsigned(((wire32[(2'h2):(1'h1)] ?
                  wire28 : (!reg42)) <<< reg42)));
            end
          if ((wire26 ^ (~^($unsigned((~^reg36)) ?
              $unsigned((^reg38)) : $unsigned($signed(wire28))))))
            begin
              reg46 <= wire31;
              reg47 <= ((~$unsigned((8'hab))) ?
                  (wire27[(3'h5):(2'h3)] ?
                      (wire30 ?
                          (7'h41) : {(|(8'ha2)),
                              reg46[(2'h3):(1'h0)]}) : $unsigned(((~&wire31) << (8'hbc)))) : (reg44 ^ ({((8'hb7) - wire35)} + ($signed(wire30) ?
                      $unsigned((8'hb7)) : wire31[(4'h9):(3'h6)]))));
            end
          else
            begin
              reg46 <= ({$unsigned($signed(((8'ha6) != wire28)))} ~^ $unsigned(reg37[(4'h8):(3'h7)]));
              reg47 <= wire27;
              reg48 <= (wire26 ?
                  ((~&((reg40 ? (8'hbf) : wire28) ?
                      ((8'h9e) ~^ reg42) : (reg40 | wire32))) | (reg39[(3'h6):(3'h4)] >>> {{wire31},
                      wire28[(2'h3):(1'h0)]})) : reg36);
              reg49 <= {$signed(($signed(reg38[(2'h2):(1'h0)]) ?
                      ({reg41} ?
                          {reg38, wire27} : (wire34 ?
                              (8'ha8) : reg36)) : (&(^(8'hba))))),
                  {reg38[(4'ha):(1'h0)]}};
            end
          reg50 <= reg43;
          reg51 <= reg43;
        end
      else
        begin
          reg43 <= $signed((8'hbe));
          reg44 <= ((wire35 ?
              ($signed(reg36[(1'h1):(1'h0)]) != $signed($unsigned(reg37))) : ((+wire29) ?
                  reg50 : wire28)) | (!wire27[(2'h2):(1'h0)]));
          reg45 <= (reg45 & reg44[(1'h0):(1'h0)]);
          reg46 <= ($signed((8'h9c)) | $signed($signed($signed($unsigned(reg51)))));
        end
      reg52 <= {reg48, wire34[(3'h5):(2'h3)]};
      reg53 <= ($unsigned($unsigned((((8'hbf) ?
          reg40 : (7'h41)) << reg42))) >>> $unsigned($unsigned($unsigned((&wire31)))));
    end
  assign wire54 = (($signed(((8'ha3) - $unsigned(reg43))) - reg38[(1'h1):(1'h0)]) >> $signed(reg51));
  assign wire55 = $unsigned((wire28[(3'h6):(2'h2)] ?
                      reg49[(4'hb):(4'h9)] : $unsigned($signed((~&(8'ha5))))));
  assign wire56 = wire29[(2'h2):(1'h0)];
  assign wire57 = ((reg47[(4'h9):(1'h0)] + $unsigned(($signed((8'ha7)) ?
                          (wire56 ? (8'hbb) : (8'hb5)) : (wire28 ^ wire28)))) ?
                      ((8'ha4) && wire30[(4'hb):(3'h7)]) : wire30);
  assign wire58 = (~({{(reg38 - reg47)},
                      ((reg46 ? reg36 : reg48) ?
                          wire54 : (!wire29))} <= reg40));
  always
    @(posedge clk) begin
      reg59 <= {wire29[(3'h4):(2'h2)]};
      if ($signed($unsigned(($signed(reg59[(1'h0):(1'h0)]) != wire32))))
        begin
          reg60 <= (-(($unsigned((wire29 ? reg40 : reg52)) ?
              (wire29[(2'h3):(2'h3)] ?
                  wire56 : (reg37 ? wire31 : reg42)) : $unsigned((reg40 ?
                  reg51 : reg51))) + wire27));
          reg61 <= ($signed((reg43 ?
                  (wire27[(2'h2):(1'h1)] ?
                      reg42[(1'h0):(1'h0)] : $unsigned(wire55)) : reg43)) ?
              {((~&(reg51 ? reg60 : (7'h42))) ?
                      wire32[(1'h0):(1'h0)] : $signed(wire26[(4'h8):(2'h2)]))} : reg47[(3'h4):(1'h0)]);
          reg62 <= {$unsigned({{$signed(wire35)},
                  ($signed(wire26) ? $unsigned(reg45) : {wire28})}),
              (^~$unsigned((reg45[(3'h4):(3'h4)] ?
                  $signed(reg50) : $unsigned(reg53))))};
        end
      else
        begin
          reg60 <= reg39;
          reg61 <= ($unsigned((($signed(reg40) ?
              (reg41 + wire28) : reg53) && {(~|wire34)})) == {wire29[(3'h4):(1'h1)]});
          reg62 <= {($signed(reg52) >= {{(~^(8'had)), {wire58, wire54}}}),
              {((^~$signed(wire26)) + wire55[(2'h2):(2'h2)]),
                  $unsigned((8'hac))}};
        end
      reg63 <= $unsigned($signed(reg42));
      reg64 <= reg38;
    end
  assign wire65 = $unsigned(((&$unsigned($signed((8'hb1)))) ^ ({wire29[(3'h4):(3'h4)]} >> ($signed(reg43) < (~|reg51)))));
  assign wire66 = ($signed({(!(7'h43)), reg44}) ?
                      reg39 : $unsigned($signed({$unsigned((8'h9c))})));
  assign wire67 = wire58;
  assign wire68 = wire55[(2'h3):(2'h3)];
  assign wire69 = (8'ha9);
endmodule

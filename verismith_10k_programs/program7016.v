module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire57,
                 wire56,
                 wire54,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned((+$unsigned(wire1[(2'h2):(1'h0)])));
  assign wire5 = $unsigned(({wire1, (8'had)} ?
                     $signed($signed((wire4 ?
                         wire4 : wire3))) : (wire2[(2'h2):(1'h1)] * wire0)));
  assign wire6 = (((((~^(7'h42)) ^ wire0[(4'hc):(4'ha)]) ?
                     (|((8'ha9) >>> wire4)) : $unsigned(((8'hb4) | (8'hb6)))) <<< wire3) && wire2[(2'h3):(2'h2)]);
  assign wire7 = ((~^($unsigned(wire6[(3'h6):(2'h2)]) <<< wire6[(2'h2):(2'h2)])) != wire6);
  always
    @(posedge clk) begin
      reg8 <= wire6;
    end
  module9 #() modinst55 (wire54, clk, wire2, wire3, reg8, wire6, wire4);
  assign wire56 = ((+(+(8'hbc))) && wire6);
  assign wire57 = (!((((wire54 ? reg8 : wire56) ?
                          (wire3 ? (8'hb7) : wire5) : wire7[(1'h0):(1'h0)]) ?
                      (wire2 - reg8) : (-wire7[(3'h4):(2'h3)])) != wire6[(4'h9):(3'h5)]));
  always
    @(posedge clk) begin
      reg58 <= ($unsigned($signed(((8'h9e) <= $signed(wire0)))) ?
          (^~(~|$signed(wire7))) : $unsigned($unsigned((wire3[(4'h8):(1'h0)] + $signed(wire5)))));
      reg59 <= (reg58[(3'h6):(3'h4)] ?
          wire5 : ((~|($signed(wire4) ?
              {(8'hbc)} : (wire1 ? wire54 : wire57))) + wire57));
      reg60 <= $unsigned($signed({(8'hab), wire57}));
      if ($signed(wire5))
        begin
          reg61 <= wire7[(3'h7):(2'h3)];
          reg62 <= ((-$signed(((-(8'ha7)) ? wire4 : wire0[(4'hc):(1'h0)]))) ?
              wire6 : ((^{reg60}) < (wire4[(3'h4):(1'h1)] == ({reg58} > wire7))));
          reg63 <= wire3[(5'h12):(3'h6)];
          reg64 <= $signed($signed($signed($signed((reg62 <= reg59)))));
        end
      else
        begin
          reg61 <= (($unsigned($signed({wire0})) == $unsigned($signed($signed(reg63)))) || reg8);
        end
    end
  assign wire65 = $signed(wire6);
  assign wire66 = (($signed(reg58) ? wire1[(1'h1):(1'h0)] : $signed(wire0)) ?
                      ($unsigned(wire2) == reg64) : (~|$unsigned({(~wire5)})));
  assign wire67 = wire54[(1'h0):(1'h0)];
  assign wire68 = (($unsigned((+(wire6 ?
                      reg62 : (7'h41)))) && (|({reg61} >> $unsigned((8'hb6))))) && wire4[(3'h4):(2'h2)]);
  assign wire69 = $unsigned(($signed(wire54[(1'h0):(1'h0)]) == wire57[(4'hc):(3'h7)]));
  assign wire70 = {reg64};
  assign wire71 = {(8'ha3),
                      (~((!reg59[(2'h2):(2'h2)]) ^~ (wire2[(4'hb):(4'h8)] & (reg60 ?
                          wire65 : (8'ha1)))))};
  assign wire72 = $unsigned(reg63[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ({(wire6[(1'h0):(1'h0)] ?
              $unsigned((wire5 ?
                  (wire54 ^ wire57) : $signed((8'hb5)))) : wire3[(2'h2):(1'h1)])})
        begin
          reg73 <= $unsigned(((wire66[(5'h10):(3'h4)] ?
              (8'hbb) : (wire56 ?
                  (wire54 ?
                      reg64 : reg63) : (wire6 > wire54))) | $unsigned(((wire70 ?
                  wire65 : wire4) ?
              $signed(wire71) : wire2))));
          reg74 <= wire71;
          if ((^{$unsigned($signed($unsigned(wire70)))}))
            begin
              reg75 <= $unsigned(($signed($unsigned((wire71 & wire68))) ^~ wire72[(4'he):(1'h1)]));
              reg76 <= (reg60[(3'h5):(3'h4)] ?
                  $unsigned({wire68[(1'h0):(1'h0)]}) : (wire57 ?
                      wire66 : $signed((~&$signed(wire5)))));
              reg77 <= wire6[(2'h2):(1'h1)];
            end
          else
            begin
              reg75 <= (^reg62[(4'hc):(3'h7)]);
            end
        end
      else
        begin
          if (wire57)
            begin
              reg73 <= reg58[(4'h8):(3'h7)];
            end
          else
            begin
              reg73 <= wire3[(3'h6):(2'h2)];
              reg74 <= (wire0[(4'h9):(4'h9)] ?
                  (+(~|wire72)) : $signed($unsigned(wire6)));
              reg75 <= wire4[(5'h11):(4'hf)];
              reg76 <= wire56;
            end
        end
      reg78 <= wire68[(4'h9):(4'h9)];
      reg79 <= ((($signed($signed(reg58)) - wire7) ?
              reg59 : reg64[(1'h0):(1'h0)]) ?
          ({(reg77[(1'h1):(1'h1)] - {wire6})} ?
              (^~reg60[(3'h6):(2'h3)]) : {$signed(wire5[(2'h3):(2'h2)]),
                  reg64[(2'h3):(2'h3)]}) : $signed($unsigned(wire5)));
      reg80 <= {(&$unsigned($signed(wire54[(1'h0):(1'h0)])))};
      if ($signed(reg76))
        begin
          reg81 <= reg79[(2'h2):(1'h1)];
          reg82 <= $signed((!wire70));
        end
      else
        begin
          reg81 <= (|reg60);
          if ((~&$signed((&$unsigned(reg80)))))
            begin
              reg82 <= wire65;
              reg83 <= reg61[(1'h0):(1'h0)];
              reg84 <= $signed(wire2);
            end
          else
            begin
              reg82 <= $unsigned((!reg73[(3'h6):(3'h5)]));
            end
          reg85 <= (reg81[(3'h5):(1'h1)] ?
              wire0 : (wire1[(4'h8):(1'h0)] ^ {(wire65 ?
                      $unsigned(wire7) : wire0[(1'h0):(1'h0)]),
                  wire57[(4'hd):(4'h8)]}));
        end
    end
  assign wire86 = $unsigned((^wire4[(1'h0):(1'h0)]));
  assign wire87 = wire66;
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire52;
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  assign y = {wire15,
                 wire16,
                 wire17,
                 wire24,
                 wire25,
                 wire26,
                 wire52,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire15 = wire13[(3'h6):(1'h0)];
  assign wire16 = ((($signed(wire13[(3'h5):(1'h1)]) == $unsigned({wire14,
                          wire11})) ?
                      (($unsigned(wire13) ?
                              $unsigned(wire13) : {wire10, wire10}) ?
                          (~&wire13) : ((wire15 << wire11) ^ (wire10 ?
                              wire10 : wire12))) : (~&(-$unsigned(wire13)))) << ($signed((~|(8'haf))) ?
                      wire12[(3'h6):(3'h5)] : $unsigned(($unsigned((8'hb8)) ?
                          wire10[(4'ha):(4'h8)] : wire14[(1'h1):(1'h1)]))));
  assign wire17 = $unsigned($signed(wire13[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg18 <= (($signed({$unsigned(wire12),
              $signed((7'h42))}) <= (($unsigned(wire13) ?
              (wire14 ? wire16 : (7'h43)) : $unsigned(wire13)) != {wire16,
              {wire13, wire16}})) ?
          $unsigned((wire17[(1'h0):(1'h0)] ?
              $unsigned(wire11) : wire13[(3'h4):(2'h3)])) : wire10[(4'h8):(1'h1)]);
      if ($unsigned($signed($unsigned((&{wire15})))))
        begin
          reg19 <= {$signed(wire13[(1'h0):(1'h0)])};
        end
      else
        begin
          reg19 <= $signed(($unsigned(wire10) ? (7'h41) : reg19));
          reg20 <= wire13[(1'h0):(1'h0)];
          reg21 <= wire16;
        end
      reg22 <= wire15;
      reg23 <= $signed($unsigned(((wire16[(3'h5):(3'h4)] ^~ {wire15}) && $signed((wire12 < wire15)))));
    end
  assign wire24 = {wire10[(3'h5):(2'h3)],
                      (wire17 ? $unsigned(reg23) : reg18[(2'h3):(2'h3)])};
  assign wire25 = reg18;
  assign wire26 = reg21;
  module27 #() modinst53 (.wire29(wire12), .wire31(reg23), .wire28(wire24), .wire32(wire10), .clk(clk), .y(wire52), .wire30(reg20));
endmodule

module module27
#(parameter param50 = ({{{{(8'ha1)}, (!(8'hb8))}}} >> ({{{(8'ha8)}, ((8'hb5) ^ (8'hb3))}} | (~|(^(|(8'hb1)))))), 
parameter param51 = ({(param50 || (!(param50 ~^ param50)))} ? {param50} : param50))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire32;
  input wire [(4'hc):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(5'h10):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg46,
                 reg45,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire33 = wire28;
  assign wire34 = (wire29[(4'hb):(4'h9)] ?
                      $unsigned($unsigned((~|(wire30 || wire28)))) : wire33[(3'h6):(1'h0)]);
  assign wire35 = wire29[(2'h2):(1'h0)];
  assign wire36 = (wire34 ^~ wire32);
  always
    @(posedge clk) begin
      reg37 <= ((wire33 <= ((wire30 < $unsigned(wire32)) ?
              ((wire35 ? wire35 : wire33) ?
                  ((8'hb4) - wire31) : (wire30 ?
                      wire35 : (8'hbc))) : $unsigned(wire35))) ?
          $signed(($unsigned(wire36) ?
              $unsigned($signed(wire30)) : wire36)) : ((($signed((8'hb1)) ~^ $signed(wire30)) ?
                  {$signed(wire32),
                      (wire29 ?
                          wire33 : wire36)} : ((wire34 != wire35) > ((8'hb0) ?
                      wire33 : wire32))) ?
              $signed($unsigned((wire35 && wire28))) : wire30));
      reg38 <= wire31[(4'h9):(2'h2)];
      reg39 <= (!$unsigned($signed(((-(8'h9d)) ?
          $signed(reg38) : (wire33 + wire28)))));
      reg40 <= $unsigned(wire29);
      reg41 <= reg39;
    end
  assign wire42 = ((($unsigned(wire36) ?
                          reg39[(3'h6):(1'h0)] : $unsigned((wire32 != (8'hb4)))) < $unsigned((7'h40))) ?
                      wire35 : ((+{reg39, (wire32 || wire30)}) ?
                          (wire34[(3'h6):(3'h4)] ?
                              $signed(wire28[(3'h5):(1'h1)]) : wire35) : ((8'ha8) ?
                              {wire36} : $unsigned((wire32 ~^ wire29)))));
  assign wire43 = $unsigned($unsigned(wire35));
  assign wire44 = ($signed((wire33[(3'h6):(1'h1)] * $signed(((8'hbf) < wire35)))) != (-(^($signed(reg40) ?
                      (~^(8'hb8)) : (8'hba)))));
  always
    @(posedge clk) begin
      if (((~&(+wire31)) ? wire32[(1'h1):(1'h1)] : (8'hba)))
        begin
          reg45 <= $signed((|$unsigned(((wire44 ? wire42 : (8'hab)) ?
              (wire32 ? wire35 : wire28) : (wire29 ? wire32 : (8'hb7))))));
        end
      else
        begin
          reg45 <= ($unsigned((!{(~&wire42)})) ?
              (!((wire33[(1'h1):(1'h1)] & (reg41 ? (8'h9d) : wire30)) ?
                  (^~(reg45 > reg45)) : ($unsigned(wire42) && reg37))) : wire29);
          reg46 <= (($signed($unsigned(wire36)) ~^ ((8'hb9) ?
              wire32 : ((-reg38) ?
                  (wire33 ? reg40 : wire42) : (reg39 <= wire35)))) & reg41);
        end
    end
  assign wire47 = wire42[(1'h1):(1'h0)];
  assign wire48 = wire43;
  assign wire49 = $unsigned((-$unsigned((^$signed((8'hb6))))));
endmodule

module top
#(parameter param42 = (({(!((8'ha3) && (7'h42))), {((8'hb6) >>> (7'h44))}} * ((!((7'h42) <<< (8'haf))) ? (^((8'hbf) ? (8'hbf) : (8'ha5))) : (((8'hac) ? (8'ha1) : (8'ha5)) ~^ (7'h44)))) ? (({((8'hbb) != (8'hb3))} >>> ((+(8'hbe)) << {(7'h42), (8'ha5)})) ? ((((8'hb5) ? (7'h43) : (8'ha5)) >= (~(8'ha7))) || ({(7'h40), (8'hbf)} ? {(7'h44)} : (8'hbb))) : ({(^(8'ha5)), (~|(8'hb9))} != ((&(8'hb6)) <= ((8'hbf) | (8'hb9))))) : ((~(((8'hb7) ? (8'ha6) : (8'hb5)) ? {(7'h40), (8'hbd)} : (|(8'hae)))) <<< (~&{(&(8'h9c)), {(8'ha9)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire41,
                 wire39,
                 wire16,
                 wire15,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = wire1[(3'h4):(3'h4)];
  assign wire6 = wire5[(2'h2):(2'h2)];
  assign wire7 = $signed(wire5);
  assign wire8 = $unsigned(wire4);
  assign wire9 = {{(~^((^wire1) ? (^wire0) : ((8'ha0) ? wire6 : wire1)))},
                     ($signed((~^(wire3 >= wire3))) < $unsigned(($signed((8'ha7)) <<< wire4)))};
  assign wire10 = wire5[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg11 <= (wire1 <= (wire10[(4'h8):(3'h6)] ?
          (((wire3 ? wire1 : wire2) + wire7[(2'h3):(1'h0)]) ?
              (^wire7[(3'h4):(2'h2)]) : $signed($signed((8'ha5)))) : $signed(((wire6 << wire10) >= $signed((7'h40))))));
      reg12 <= $unsigned((($signed(((8'hb1) ^ wire7)) ?
          ((^wire5) >> $unsigned(wire5)) : ((8'ha8) ?
              (wire10 != wire6) : (reg11 ?
                  wire6 : wire3))) || $signed((wire8 & reg11))));
      reg13 <= $signed($unsigned($signed({(wire9 ? wire6 : wire3)})));
      reg14 <= wire2[(4'ha):(2'h3)];
    end
  assign wire15 = $signed($signed((wire6 || $signed($unsigned((8'hb4))))));
  assign wire16 = $signed(wire7);
  module17 #() modinst40 (wire39, clk, wire2, wire4, wire16, wire10);
  assign wire41 = ((^~(8'hbb)) ?
                      (|wire16) : $unsigned(($signed($signed(wire1)) >= $signed(wire39))));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 (1'h0)};
  assign wire22 = (|wire19);
  assign wire23 = ((^$unsigned(((wire21 ?
                          (8'ha5) : wire20) == wire21[(3'h4):(1'h1)]))) ?
                      (((((7'h44) >>> wire20) * $signed(wire22)) ?
                              $signed(wire20[(4'hd):(2'h3)]) : (~(wire20 ?
                                  wire18 : wire18))) ?
                          ($unsigned($signed(wire20)) ?
                              wire20[(4'ha):(3'h7)] : (wire19[(3'h4):(3'h4)] & wire20[(2'h3):(1'h1)])) : wire19) : (wire22 ?
                          ($signed(wire22) >>> (8'hb1)) : (wire19 && ((wire20 ?
                              (8'hac) : wire18) ~^ (wire20 ^ wire22)))));
  assign wire24 = $signed((8'h9d));
  assign wire25 = (wire21[(2'h2):(1'h1)] | (^~wire18));
  assign wire26 = wire19;
  assign wire27 = (wire21 ?
                      (wire26 ?
                          ((|$signed((8'h9f))) ?
                              ((&wire24) <= (^wire24)) : $unsigned({wire19,
                                  (8'hbc)})) : (wire22[(1'h0):(1'h0)] ?
                              wire22 : (-(^wire20)))) : ($unsigned({wire18,
                              $signed(wire26)}) ?
                          {($signed(wire25) * (wire24 ? wire18 : wire23)),
                              $signed((|(8'hb9)))} : wire20));
  assign wire28 = ($unsigned({((!wire25) ?
                              (wire22 ? wire25 : wire23) : {wire22, wire22})}) ?
                      (((wire26[(2'h2):(1'h0)] ?
                          wire22 : $signed(wire22)) & ($unsigned((8'ha2)) + wire24)) && $signed((~|wire19))) : wire22[(4'ha):(1'h1)]);
  always
    @(posedge clk) begin
      reg29 <= $unsigned(wire23);
      reg30 <= (-(|wire28));
      reg31 <= $signed(wire20);
      if (wire26[(4'he):(4'hc)])
        begin
          reg32 <= $signed($unsigned((~^wire23)));
        end
      else
        begin
          reg32 <= (8'hb6);
          reg33 <= $signed((~wire19[(3'h4):(3'h4)]));
          if (reg32[(4'h9):(3'h5)])
            begin
              reg34 <= ((reg32[(5'h10):(1'h0)] ?
                      wire18[(1'h1):(1'h1)] : (~&(7'h42))) ?
                  (8'hb3) : $unsigned(($unsigned((~|reg32)) ?
                      wire25 : reg29[(2'h3):(2'h2)])));
              reg35 <= $unsigned((^reg31));
              reg36 <= $signed((^$signed($unsigned((wire22 ? reg29 : reg32)))));
            end
          else
            begin
              reg34 <= $unsigned($unsigned($unsigned($signed($signed(wire24)))));
              reg35 <= {$signed($signed($signed(wire19))), (8'hb7)};
              reg36 <= $signed(($unsigned(($unsigned(reg33) ?
                      (reg34 <= wire22) : wire19)) ?
                  reg36 : reg35[(1'h0):(1'h0)]));
              reg37 <= (~&wire19);
              reg38 <= (({(((8'hbc) ^ reg36) > {wire25}),
                      ({wire26, wire25} || {wire22})} | reg33[(4'he):(4'ha)]) ?
                  ($signed({wire21}) & $unsigned((8'ha2))) : ($signed(wire27[(4'ha):(3'h4)]) ?
                      (reg34 ?
                          ((reg30 ?
                              wire18 : wire18) != $signed(wire27)) : {(~|reg31),
                              wire19}) : $signed(reg30[(2'h3):(2'h2)])));
            end
        end
    end
endmodule

module top
#(parameter param39 = ((((!((8'hb1) >>> (8'ha2))) * {{(8'hb7)}, {(8'hb0), (8'hb0)}}) ? (+(((8'hb9) ? (8'h9f) : (8'hb3)) <<< {(8'hab), (8'ha2)})) : (!(~^((8'hbe) ~^ (8'hb6))))) ? ({{((8'hb5) ? (8'ha8) : (8'hb9)), ((8'ha2) ? (8'hbb) : (8'hb8))}, (|(|(7'h44)))} ? {((~^(8'hbd)) ? {(8'hab)} : ((7'h44) << (8'hbc))), (^~((8'haa) ? (8'hbf) : (8'hba)))} : (~&(((8'hae) ^~ (8'hb7)) ? ((8'hac) + (8'hb3)) : ((8'ha5) & (8'hb5))))) : (~((((8'hb3) ? (8'hb7) : (8'hbe)) ? (!(8'haf)) : ((8'ha4) ? (8'hb6) : (8'hb3))) ^~ (((7'h42) >> (8'ha9)) ? (8'hb1) : {(8'hbf)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire38,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = (({{wire2[(1'h0):(1'h0)], (~&wire1)},
                     $signed((wire1 > wire2))} || (^(~&wire0))) & wire0);
  assign wire5 = (({(wire2[(3'h5):(3'h4)] >> (!wire4)),
                     ($unsigned((8'hb0)) == $signed(wire2))} != (8'hb9)) >>> $signed({wire2[(4'h9):(4'h9)],
                     $signed($signed((8'hb1)))}));
  assign wire6 = wire4[(4'h9):(4'h8)];
  assign wire7 = {wire2[(2'h2):(1'h0)]};
  assign wire8 = {wire7[(4'h9):(4'h8)], wire6[(2'h3):(1'h1)]};
  assign wire9 = $unsigned((wire5 ? wire7 : (wire7 >= $signed(wire1))));
  assign wire10 = (wire3[(4'h9):(1'h1)] >>> $unsigned($unsigned((wire5 >= (|wire8)))));
  assign wire11 = ($signed({wire9[(4'hc):(1'h1)],
                          ((wire4 ? (8'hbc) : wire7) ?
                              {wire1, wire7} : (^~wire5))}) ?
                      (^~$signed(wire4)) : wire10);
  always
    @(posedge clk) begin
      reg12 <= wire8[(1'h1):(1'h0)];
      reg13 <= $signed((wire4[(1'h0):(1'h0)] ?
          $signed(((wire1 ? wire10 : wire8) ?
              wire4[(4'h8):(3'h4)] : (wire1 - wire0))) : (~|$signed((~|wire3)))));
      reg14 <= (wire9 ? (!{$signed(wire4[(1'h0):(1'h0)])}) : wire7);
      reg15 <= wire8[(3'h4):(3'h4)];
      reg16 <= (~|(((8'hbd) ? wire6 : $unsigned($signed((8'had)))) && wire0));
    end
  assign wire17 = (wire10 ?
                      (^(~&($unsigned(wire4) ?
                          (wire8 != reg12) : (wire3 ?
                              (8'h9f) : wire2)))) : $signed($signed(reg15[(4'h8):(1'h0)])));
  assign wire18 = (~{$unsigned($signed(reg12))});
  assign wire19 = reg13;
  assign wire20 = $signed((wire17[(1'h1):(1'h0)] ?
                      $signed((wire4[(2'h2):(1'h1)] ?
                          $unsigned(wire1) : (reg16 << reg12))) : $unsigned($signed((wire6 ?
                          (8'ha0) : wire1)))));
  assign wire21 = ((~&(wire1[(4'h8):(2'h2)] != ($signed(wire17) ?
                          wire18[(3'h7):(1'h0)] : wire9[(4'he):(4'hd)]))) ?
                      wire4 : ((wire9 ?
                          ({wire7} ?
                              $signed((7'h40)) : (wire19 ?
                                  wire20 : wire3)) : $signed((~|(8'hac)))) ^ (!{reg14})));
  assign wire22 = reg13[(4'h8):(3'h6)];
  assign wire23 = reg12;
  assign wire24 = wire17[(2'h2):(1'h0)];
  assign wire25 = wire6[(2'h2):(1'h1)];
  assign wire26 = wire9;
  always
    @(posedge clk) begin
      if ({$signed(($signed($signed(wire24)) ?
              (reg13 ? $unsigned((8'ha2)) : $unsigned((8'hb9))) : wire10))})
        begin
          reg27 <= (~&(wire22[(2'h2):(2'h2)] <= $signed(({wire22, wire21} ?
              (wire23 * wire22) : wire4))));
        end
      else
        begin
          if ({$unsigned(wire4[(3'h6):(3'h6)])})
            begin
              reg27 <= wire26[(3'h4):(1'h1)];
              reg28 <= (wire26[(1'h1):(1'h0)] != (wire3 ?
                  ((~|wire8) ?
                      $signed((~wire7)) : $unsigned((|wire22))) : {$signed(wire19),
                      wire8}));
              reg29 <= wire2;
              reg30 <= (~reg14[(2'h2):(1'h0)]);
            end
          else
            begin
              reg27 <= (wire22 < $signed(({$signed(wire6)} >>> {reg30})));
              reg28 <= $unsigned(wire23[(3'h7):(3'h5)]);
              reg29 <= wire8;
              reg30 <= {({wire0, $unsigned(reg28)} && wire9[(4'ha):(4'ha)])};
              reg31 <= $unsigned($signed(reg29[(2'h2):(1'h0)]));
            end
          reg32 <= (^~wire19);
          reg33 <= $unsigned($signed(($signed((wire9 ?
              reg16 : wire0)) >= wire6[(3'h4):(2'h3)])));
        end
      reg34 <= (reg32[(3'h6):(3'h6)] * (wire4[(1'h1):(1'h0)] ?
          {($signed(wire23) ? $unsigned(wire2) : (!wire5)),
              ($signed(reg31) ? wire0 : (wire7 + (8'ha6)))} : wire19));
      reg35 <= $signed((!wire11[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg36 <= $unsigned((~^wire11[(2'h3):(1'h1)]));
      reg37 <= $unsigned(reg31[(3'h7):(3'h6)]);
    end
  assign wire38 = wire17[(1'h0):(1'h0)];
endmodule

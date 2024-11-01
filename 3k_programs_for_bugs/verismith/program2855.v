module top
#(parameter param28 = (((({(8'hb9)} ? ((7'h40) ? (8'had) : (8'hb0)) : ((8'hb9) ? (8'hb5) : (8'h9d))) ? {(8'hb5), (^(8'hb4))} : (((8'ha6) >= (7'h44)) ? ((8'hba) ? (7'h44) : (8'haf)) : (!(8'h9d)))) ? ((~^((8'ha9) ? (7'h43) : (8'hbc))) ? ({(8'ha2)} ? ((8'haa) ~^ (7'h41)) : (!(7'h44))) : (!((8'hb8) ? (8'ha0) : (8'hbf)))) : ((~|{(8'ha1)}) <<< (7'h40))) || {((((7'h43) & (8'hb2)) >>> {(7'h40)}) ? (&(&(8'haa))) : (((8'hb5) < (8'hab)) ? ((7'h42) ? (8'hb1) : (8'ha9)) : {(7'h40)})), (((^~(8'hae)) == ((8'hbf) ? (8'hab) : (8'haa))) ? (7'h44) : (~(~|(8'hab))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire6,
                 wire5,
                 reg19,
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
                 reg7,
                 (1'h0)};
  assign wire5 = ((((!$signed(wire0)) * $unsigned(wire1[(1'h0):(1'h0)])) ?
                     (wire1 * ((wire4 && wire4) ?
                         wire2[(1'h0):(1'h0)] : wire1[(2'h2):(1'h1)])) : wire1) | (+$unsigned(wire0[(3'h7):(1'h0)])));
  assign wire6 = $signed($signed(((&{wire0}) << wire4[(4'hf):(1'h1)])));
  always
    @(posedge clk) begin
      if ((wire4[(4'hb):(3'h7)] ?
          $signed($unsigned((wire5[(4'h9):(2'h2)] ?
              (~&wire2) : $unsigned((8'hb4))))) : wire3[(1'h1):(1'h1)]))
        begin
          if ($unsigned($unsigned((8'hb4))))
            begin
              reg7 <= wire1[(4'ha):(3'h6)];
              reg8 <= {{(8'h9f)}};
              reg9 <= $signed(((wire4[(4'ha):(3'h5)] ?
                      wire0 : (+wire1[(3'h5):(3'h5)])) ?
                  ($unsigned({wire3}) ?
                      $signed(reg7) : {{wire4, (7'h42)},
                          {reg7}}) : $unsigned($unsigned(wire6[(1'h1):(1'h1)]))));
              reg10 <= {reg7};
              reg11 <= $unsigned($unsigned(reg7[(2'h3):(1'h0)]));
            end
          else
            begin
              reg7 <= reg11[(3'h5):(3'h5)];
              reg8 <= wire2;
              reg9 <= wire4[(1'h1):(1'h0)];
            end
          reg12 <= $unsigned(wire0);
          reg13 <= ((^~wire2) ^ (wire3 ?
              wire3[(1'h1):(1'h0)] : ((+(~|reg9)) ?
                  $unsigned(wire2[(4'hd):(4'ha)]) : $unsigned((wire3 ?
                      wire3 : reg7)))));
          reg14 <= ($unsigned((8'hab)) ?
              wire1[(4'h9):(4'h8)] : wire2[(1'h0):(1'h0)]);
        end
      else
        begin
          if ({(reg12[(3'h4):(2'h3)] > ($signed(wire0[(3'h6):(1'h0)]) <= wire0[(4'he):(2'h3)]))})
            begin
              reg7 <= (reg7 ?
                  $unsigned($signed(wire3)) : {$signed(($unsigned(reg9) >= {wire6,
                          wire2})),
                      wire6});
              reg8 <= $unsigned($unsigned({$signed(reg11)}));
            end
          else
            begin
              reg7 <= (^~reg14[(3'h5):(1'h1)]);
              reg8 <= $signed({$unsigned({$signed(wire6),
                      ((8'ha5) ? reg10 : wire5)})});
              reg9 <= ($signed((wire0[(5'h14):(4'h8)] ?
                      wire0 : $unsigned((wire5 * reg8)))) ?
                  wire4[(5'h12):(2'h2)] : reg14[(3'h4):(3'h4)]);
              reg10 <= ($unsigned(($signed((wire2 ? reg12 : wire4)) ~^ (reg13 ?
                      (^~(8'hb5)) : $signed(reg10)))) ?
                  {$signed(((wire1 ? wire3 : wire3) > (&wire3)))} : (8'h9d));
            end
          if ($unsigned((reg10[(1'h0):(1'h0)] <= {$unsigned((~|reg10))})))
            begin
              reg11 <= $unsigned(reg13[(2'h2):(1'h1)]);
              reg12 <= (wire0[(3'h7):(3'h5)] ?
                  reg10[(2'h3):(2'h3)] : (&$unsigned((~wire1))));
              reg13 <= $signed($unsigned(({(-(8'ha0))} ? reg7 : reg13)));
              reg14 <= (^(reg7[(1'h0):(1'h0)] != reg13[(2'h2):(1'h0)]));
              reg15 <= ($unsigned($signed({(wire4 ^~ wire4)})) > $signed($signed(({reg9} ?
                  (~wire4) : $unsigned((8'h9f))))));
            end
          else
            begin
              reg11 <= (+reg14[(1'h1):(1'h1)]);
            end
          reg16 <= (~|$signed(($unsigned($unsigned(wire3)) ?
              ($signed(reg14) || reg7[(1'h0):(1'h0)]) : reg10)));
        end
      reg17 <= (reg12 ~^ wire6);
    end
  assign wire18 = ((reg15[(1'h1):(1'h1)] ? (8'hb1) : $unsigned(wire4)) < reg16);
  always
    @(posedge clk) begin
      reg19 <= wire6;
    end
  assign wire20 = {((~^(&{reg11, wire5})) < reg17[(1'h1):(1'h1)]),
                      (wire6 - (^~{(~&(8'ha4)), (reg8 + wire6)}))};
  assign wire21 = $unsigned($unsigned((~^$unsigned(wire4[(3'h4):(2'h3)]))));
  assign wire22 = reg10;
  assign wire23 = ((!$unsigned(reg15)) | $signed($unsigned({((8'hb0) ?
                          reg13 : wire1)})));
  assign wire24 = (({((wire6 != reg17) ~^ {wire18, wire3}),
                          $unsigned((wire2 > reg11))} ?
                      $unsigned($unsigned(reg9[(4'h8):(3'h5)])) : {wire5[(3'h4):(2'h2)],
                          {(!wire20), $signed(reg17)}}) | wire3);
  assign wire25 = reg19[(3'h6):(3'h6)];
  assign wire26 = reg15[(1'h1):(1'h1)];
  assign wire27 = wire18;
endmodule

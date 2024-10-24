module top
#(parameter param41 = (((^((8'ha0) - (8'hbf))) != ((!(^(8'ha1))) ? (((8'hb8) << (8'ha2)) ? ((8'hae) ^ (8'hab)) : (-(8'h9c))) : ((^(8'hbd)) + (+(8'ha5))))) - ({(((8'ha1) <= (8'hbb)) >> {(8'haf), (8'hbf)})} ? {(((8'hb2) ? (8'hae) : (8'ha1)) ~^ ((8'hba) ? (7'h42) : (8'hb0))), (+((8'ha9) ? (7'h40) : (7'h44)))} : (~&(^~((8'ha3) ? (8'ha9) : (8'hac)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
                 wire18,
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
                 wire4,
                 reg40,
                 reg39,
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
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $unsigned((wire0[(2'h2):(1'h0)] ?
                     wire3 : $signed($signed((wire4 - wire2)))));
  assign wire6 = $unsigned((wire5 ?
                     ($signed(wire2[(1'h1):(1'h1)]) * ((8'ha3) ?
                         $unsigned(wire4) : {wire3,
                             wire1})) : wire3[(4'ha):(3'h4)]));
  assign wire7 = $unsigned(wire5);
  assign wire8 = $signed(wire0[(1'h1):(1'h1)]);
  assign wire9 = $unsigned(($signed((^~wire1[(5'h10):(4'hb)])) || (+$unsigned(((7'h43) ?
                     wire2 : wire6)))));
  assign wire10 = (((~^({wire3, wire5} == $signed(wire6))) ?
                          wire5[(4'h9):(4'h8)] : $unsigned(wire3[(1'h0):(1'h0)])) ?
                      {wire5} : (~^$signed((~|wire8[(4'h8):(2'h3)]))));
  assign wire11 = (|$signed((wire5 ~^ $signed((|wire0)))));
  assign wire12 = $unsigned(((wire3[(4'ha):(3'h7)] == (((8'hae) & (8'hbd)) ?
                          wire5[(4'h8):(4'h8)] : $signed(wire8))) ?
                      $unsigned(((+wire7) & wire6)) : wire7));
  assign wire13 = $unsigned(($unsigned(wire9[(4'h8):(1'h0)]) >> (8'hb2)));
  assign wire14 = (!((((~|wire0) ? (-wire10) : wire4) ?
                          wire5[(2'h2):(1'h1)] : ((wire11 * wire10) ?
                              {wire1, wire11} : (wire9 ^~ wire1))) ?
                      {(~^wire5),
                          {(7'h43),
                              (wire3 ?
                                  wire7 : wire11)}} : $signed(($signed(wire7) >>> (!wire11)))));
  assign wire15 = (7'h40);
  assign wire16 = (wire15[(1'h0):(1'h0)] | $signed($signed($signed((wire2 << wire1)))));
  assign wire17 = (^(8'hb7));
  assign wire18 = wire0[(4'h8):(3'h7)];
  assign wire19 = (~^$unsigned((!$signed((wire18 ~^ wire7)))));
  always
    @(posedge clk) begin
      reg20 <= $unsigned(((wire2[(4'h8):(3'h4)] ?
              ($signed(wire3) ?
                  wire19 : $signed(wire11)) : $signed((wire15 <= wire16))) ?
          {$signed((8'h9d))} : wire6));
      reg21 <= {((({wire10, wire18} == (reg20 ? wire17 : (8'ha1))) ?
              $signed((~|(8'hb1))) : wire6) ^ (!wire5[(4'hd):(3'h6)])),
          (wire1[(4'h9):(3'h7)] || {(+$signed(wire2))})};
    end
  always
    @(posedge clk) begin
      if (($unsigned($unsigned($unsigned((wire10 ? reg21 : (8'hb7))))) ?
          reg20 : $unsigned((~(wire7[(3'h6):(3'h4)] ?
              $signed(reg21) : $signed(wire17))))))
        begin
          reg22 <= (wire8[(3'h4):(2'h2)] & wire19[(5'h10):(3'h5)]);
          reg23 <= wire7[(2'h2):(2'h2)];
          if (wire17)
            begin
              reg24 <= $signed($unsigned((wire10[(5'h13):(4'h9)] ?
                  (~(~&wire0)) : (wire8 ?
                      ((8'ha3) << reg23) : reg21[(3'h6):(1'h1)]))));
              reg25 <= (+(wire1 ?
                  $signed(((+wire14) < {reg20})) : (^(~|(wire5 ?
                      reg20 : reg21)))));
            end
          else
            begin
              reg24 <= wire15[(2'h2):(1'h0)];
              reg25 <= (-(^~(8'ha7)));
              reg26 <= reg23;
              reg27 <= wire10[(3'h7):(1'h1)];
            end
          reg28 <= wire4;
        end
      else
        begin
          reg22 <= (~reg24);
          reg23 <= wire15;
          reg24 <= ((reg20 ?
              $unsigned(((8'h9c) < (~wire17))) : wire5[(1'h1):(1'h0)]) ~^ ($unsigned((&wire16)) - (^~reg24)));
        end
      reg29 <= ($signed({{(reg27 < wire13)},
          ($unsigned(wire2) ?
              (reg22 != reg23) : wire12)}) <<< ($signed($signed($signed(wire8))) + wire14));
      if ((~^$unsigned(reg22[(1'h0):(1'h0)])))
        begin
          if (($signed(($signed((~|reg26)) && ((~&(8'hb8)) ?
                  {wire19, wire13} : wire4))) ?
              ((wire9[(3'h4):(1'h1)] >> ($signed(wire17) ?
                  (reg24 & wire10) : $unsigned(wire19))) ^ $signed((wire9[(4'h9):(3'h5)] || $unsigned(wire15)))) : (wire10 ?
                  ({{reg28},
                      (wire17 ?
                          wire4 : wire14)} < wire0[(1'h0):(1'h0)]) : (|(reg21[(3'h5):(1'h0)] > ((8'ha4) <<< (7'h40)))))))
            begin
              reg30 <= {$signed((8'hbd))};
              reg31 <= ($signed($unsigned(wire0)) ?
                  ($signed((wire0 << $signed(reg22))) ?
                      ({(wire13 ?
                              wire0 : reg28)} <<< $signed(wire15[(2'h3):(2'h3)])) : ($signed(wire10) < $unsigned($unsigned(wire13)))) : {(8'hb1),
                      reg22});
              reg32 <= $signed((~|((|(wire19 ?
                  wire18 : reg23)) - $signed($unsigned(wire12)))));
            end
          else
            begin
              reg30 <= reg31[(4'hd):(3'h6)];
              reg31 <= (|wire14[(2'h3):(2'h2)]);
              reg32 <= (~$unsigned({wire5}));
              reg33 <= reg31;
            end
          if (($signed(wire18) * $unsigned(wire8[(3'h6):(1'h1)])))
            begin
              reg34 <= $signed($signed($signed({reg22})));
              reg35 <= (((&(reg26[(1'h0):(1'h0)] ?
                  $unsigned((8'haa)) : reg20)) - reg30) || $signed(wire11));
              reg36 <= $unsigned(((~&({wire13, wire11} ?
                  $signed((8'ha0)) : {wire18})) && $unsigned((^~reg21[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg34 <= reg36[(3'h6):(1'h0)];
              reg35 <= ((8'hb8) == $signed(($unsigned($signed(wire0)) < ($unsigned(wire1) ?
                  $unsigned(reg23) : $unsigned(wire3)))));
              reg36 <= reg32[(2'h2):(1'h0)];
              reg37 <= ({reg23[(4'hf):(1'h0)], wire18} ?
                  reg23 : $signed(reg35[(3'h5):(3'h5)]));
            end
          reg38 <= (~^(((^~reg28) - ($signed(reg26) ?
              {wire14, wire15} : $unsigned(reg37))) <<< reg24[(1'h1):(1'h1)]));
        end
      else
        begin
          reg30 <= (&reg26);
          reg31 <= ({wire0[(3'h7):(1'h0)]} && $signed((8'haf)));
          reg32 <= wire1;
          reg33 <= $signed($signed((^(|(wire2 & wire11)))));
          reg34 <= (+((((reg36 ? wire0 : (8'hb2)) ? $unsigned(reg36) : wire12) ?
              $signed(wire13) : wire10[(4'hb):(3'h4)]) >> wire8));
        end
      reg39 <= (reg23[(4'hf):(2'h3)] + (((|(reg28 ? wire4 : (8'hb9))) ?
              $unsigned((reg34 ?
                  reg32 : wire17)) : $unsigned((reg20 | wire14))) ?
          {($unsigned(reg33) << ((8'hbd) ?
                  wire6 : (8'ha4)))} : (~^reg20[(1'h0):(1'h0)])));
      reg40 <= (($unsigned({$unsigned(reg24), (8'ha1)}) == (&($signed(reg23) ?
              ((7'h42) * reg37) : {wire10}))) ?
          ($unsigned(((reg35 ? (8'h9d) : reg35) && (wire14 ?
              (8'ha9) : (8'h9c)))) >>> (($signed(reg30) ?
              (+wire7) : (wire13 ?
                  reg24 : wire14)) == wire4[(4'h8):(2'h3)])) : $signed((((reg22 ?
                      reg20 : wire18) ?
                  (-reg39) : (-reg34)) ?
              ((reg37 ? wire1 : reg39) && wire18) : (-(wire17 || wire7)))));
    end
endmodule

module top
#(parameter param30 = (8'ha5), 
parameter param31 = (+param30))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
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
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$unsigned({($signed(wire1) ?
                  $signed(wire2) : (wire3 ~^ (7'h43))),
              (wire1[(3'h4):(1'h1)] - (&(8'hb1)))})};
    end
  assign wire6 = (((7'h42) ? wire1[(3'h6):(2'h3)] : (&wire4[(2'h3):(1'h1)])) ?
                     reg5 : ((-wire1[(4'he):(3'h7)]) ?
                         (8'ha1) : reg5[(2'h3):(2'h2)]));
  assign wire7 = wire6[(1'h0):(1'h0)];
  assign wire8 = (~&$signed((((reg5 ? wire2 : (8'ha2)) ?
                     (~(8'ha2)) : wire4) | wire4)));
  assign wire9 = wire0;
  assign wire10 = ($unsigned({wire8, (-(~^reg5))}) ?
                      ($unsigned((wire7[(1'h1):(1'h0)] ? wire1 : (!wire1))) ?
                          (wire4 - ((wire4 ?
                              wire3 : wire0) + wire8)) : {$unsigned(((8'had) >= wire8))}) : $unsigned({$signed($unsigned(wire1))}));
  always
    @(posedge clk) begin
      reg11 <= $signed($unsigned((7'h40)));
      if ($signed($signed((8'hac))))
        begin
          reg12 <= $unsigned((~(reg11 ?
              (wire9 ?
                  wire6[(3'h7):(3'h4)] : wire9[(1'h0):(1'h0)]) : wire0[(3'h6):(3'h5)])));
          reg13 <= $signed({{$signed((!wire3))},
              (+((^~(8'hb2)) ? wire7[(2'h3):(2'h2)] : reg5[(1'h0):(1'h0)]))});
        end
      else
        begin
          reg12 <= reg5;
          reg13 <= wire10;
          reg14 <= {(({(~&(8'hbe)), (+wire4)} <= $signed((wire3 ?
                      wire1 : (8'ha8)))) ?
                  $unsigned(((wire1 ?
                      wire1 : wire7) >> wire1[(4'ha):(3'h5)])) : (wire2[(4'h9):(4'h8)] != {(wire7 ?
                          wire10 : wire9),
                      reg12}))};
          reg15 <= $signed((wire10[(2'h2):(2'h2)] ?
              (reg13[(4'hf):(1'h1)] ?
                  wire8[(3'h7):(2'h2)] : $unsigned(wire7[(2'h3):(2'h3)])) : wire2[(3'h4):(3'h4)]));
        end
    end
  assign wire16 = reg12;
  assign wire17 = wire7[(3'h4):(1'h1)];
  assign wire18 = $signed(({$unsigned((wire0 >> reg15)),
                      $unsigned(((8'hb4) ? reg13 : reg15))} - wire16));
  assign wire19 = (&(wire6[(3'h4):(3'h4)] ?
                      $unsigned(wire0[(4'h9):(1'h0)]) : (~|wire2[(4'hb):(4'h8)])));
  assign wire20 = reg13;
  assign wire21 = ($unsigned((wire2 ^ ($signed(wire0) != $unsigned(reg13)))) ?
                      $signed((8'hbf)) : {reg15[(3'h5):(3'h4)]});
  assign wire22 = wire4;
  assign wire23 = (^(wire4 <= wire6));
  assign wire24 = (wire18[(2'h2):(1'h0)] ?
                      $unsigned($signed($unsigned({reg14,
                          wire8}))) : {$signed(({wire17} && {wire3, wire9}))});
  assign wire25 = $signed({wire4[(1'h0):(1'h0)],
                      ($unsigned((wire8 >= wire24)) ? (+{(8'hbe)}) : wire18)});
  assign wire26 = $unsigned($unsigned($signed(wire16[(2'h2):(1'h1)])));
  assign wire27 = $signed(wire22);
  assign wire28 = (reg14 < {(+$unsigned(wire19)), wire18});
  assign wire29 = wire9[(1'h1):(1'h0)];
endmodule

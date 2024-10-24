module top
#(parameter param37 = ((~^(^~(((8'haf) & (8'hb3)) * {(8'ha6), (7'h41)}))) ? (((~^((8'hbf) ? (8'hbf) : (8'hb2))) | {(!(8'hbf)), (~|(8'hbf))}) << (|(!((8'hb4) ^ (8'had))))) : ((~^((-(8'hb3)) != ((8'ha5) ? (8'haf) : (7'h44)))) != ((~(!(8'haa))) ? ((^~(7'h44)) > (-(8'hb9))) : {((8'hb9) ? (8'ha2) : (8'hb2)), {(8'ha7), (8'haf)}}))), 
parameter param38 = (param37 ? (7'h42) : (((^(param37 ? param37 : param37)) ? param37 : param37) ? ((((8'hb8) ? (8'had) : param37) & {param37, param37}) ? (&(~param37)) : {param37, (7'h42)}) : param37)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire36,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
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
                 reg17,
                 reg16,
                 reg7,
                 (1'h0)};
  assign wire5 = wire4[(3'h6):(1'h0)];
  assign wire6 = ((wire5[(1'h1):(1'h0)] ? wire4[(1'h0):(1'h0)] : wire4) ?
                     (!wire4) : ($unsigned(({wire5} ?
                         (wire5 != wire1) : (8'hb9))) & ((wire4 + wire2) <<< (~|wire0[(3'h6):(3'h5)]))));
  always
    @(posedge clk) begin
      reg7 <= wire6[(4'ha):(2'h2)];
    end
  assign wire8 = wire1[(1'h1):(1'h0)];
  assign wire9 = ((!reg7) >> (($unsigned($unsigned(wire8)) ?
                         $signed($unsigned(wire5)) : wire4[(3'h4):(1'h0)]) ?
                     {wire3[(4'hb):(4'hb)]} : wire2[(2'h2):(1'h1)]));
  assign wire10 = (&($unsigned((^~$signed(wire0))) - (((wire9 + (8'hbf)) << {(8'hb3),
                      wire2}) | $signed((~^wire1)))));
  assign wire11 = ($signed(((-(wire10 ^ wire8)) ?
                      {$unsigned(wire0)} : ((wire0 | reg7) << ((7'h40) > (8'hbe))))) < (&$unsigned((~^$signed(wire5)))));
  assign wire12 = reg7;
  assign wire13 = $unsigned(((((wire3 != wire11) >>> $unsigned(wire12)) || wire11[(4'h8):(3'h4)]) >>> {wire3,
                      (&(~&wire5))}));
  assign wire14 = ($signed(reg7[(5'h11):(4'hb)]) ?
                      wire13[(1'h1):(1'h1)] : $unsigned((&$signed((wire13 ?
                          wire5 : reg7)))));
  assign wire15 = (~|((wire9 ?
                      $unsigned(wire6) : $signed($unsigned(reg7))) >>> $unsigned((wire3[(3'h4):(2'h2)] && $unsigned((8'hbd))))));
  always
    @(posedge clk) begin
      reg16 <= $signed($signed($signed($unsigned(wire0))));
      reg17 <= (reg7 ?
          wire15[(3'h6):(3'h4)] : $signed($unsigned($signed((wire3 ?
              reg16 : wire14)))));
    end
  assign wire18 = (wire12[(5'h11):(2'h2)] * $signed(wire1));
  assign wire19 = (~^reg16[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire8)
        begin
          reg20 <= ($signed($signed((reg16[(1'h1):(1'h1)] ?
              wire14[(3'h4):(2'h3)] : wire13))) >>> $unsigned($unsigned(wire4[(4'hc):(1'h1)])));
          reg21 <= reg20[(2'h3):(2'h3)];
          reg22 <= (&(~|$unsigned((!$unsigned(wire3)))));
          reg23 <= wire2[(3'h4):(3'h4)];
          reg24 <= wire2;
        end
      else
        begin
          reg20 <= wire11[(3'h5):(3'h4)];
          if ({wire4[(4'hd):(4'h8)]})
            begin
              reg21 <= $unsigned((reg22 ?
                  {(+(wire4 <= wire15))} : {$unsigned((wire2 ?
                          (8'h9f) : reg20))}));
              reg22 <= {$signed(wire3[(3'h5):(1'h0)]), wire19[(2'h2):(2'h2)]};
              reg23 <= $signed($signed($signed({wire12[(4'hf):(4'h9)]})));
              reg24 <= (wire5 ?
                  (reg24[(1'h1):(1'h0)] ?
                      (^({(8'h9f),
                          wire9} == (&reg23))) : $unsigned(wire10[(4'hc):(3'h4)])) : $unsigned(((!$unsigned(wire9)) ?
                      (8'hbb) : ($unsigned((8'ha7)) ?
                          $signed((8'h9d)) : (^~wire4)))));
            end
          else
            begin
              reg21 <= reg23;
              reg22 <= wire10;
            end
          reg25 <= {(8'h9e), reg22};
          if (wire12)
            begin
              reg26 <= $signed(((~&wire15[(2'h3):(2'h2)]) ^ $unsigned(((wire3 ?
                      reg25 : wire19) ?
                  (wire9 == (7'h42)) : $signed(wire11)))));
            end
          else
            begin
              reg26 <= wire1;
              reg27 <= $unsigned({reg22[(3'h4):(2'h3)]});
              reg28 <= $unsigned(wire8);
            end
          reg29 <= $unsigned(wire2);
        end
      if ((~&(({{(8'ha2), reg7}} ? $signed(reg22[(1'h1):(1'h0)]) : wire3) ?
          (reg24 ?
              ($signed(reg28) ?
                  {wire3,
                      (8'hba)} : wire10[(4'h8):(3'h6)]) : (-reg27)) : $unsigned({(wire3 ?
                  wire0 : (8'hbd))}))))
        begin
          reg30 <= (~|{{((8'hbc) ? (wire18 + (7'h40)) : ((7'h42) & wire15)),
                  $signed(wire10)}});
          reg31 <= ($unsigned(reg28) ?
              (~{(&(wire5 ?
                      reg30 : reg16))}) : $signed({(wire10[(1'h0):(1'h0)] + ((7'h44) != reg28))}));
          reg32 <= (^~wire14);
          reg33 <= ($signed({$signed(reg27)}) ?
              (reg28 ?
                  (~&((&reg32) ?
                      $signed(reg31) : ((8'hbb) ?
                          wire18 : wire9))) : (8'ha2)) : $unsigned((reg22[(3'h7):(3'h5)] ?
                  ($signed(wire2) >= {(7'h41),
                      wire6}) : $signed($unsigned(reg31)))));
        end
      else
        begin
          if (wire1[(3'h4):(1'h0)])
            begin
              reg30 <= wire19;
              reg31 <= wire5;
              reg32 <= $signed(reg33[(4'hf):(4'hf)]);
              reg33 <= ($unsigned((^~(~|wire9))) ^~ wire4);
            end
          else
            begin
              reg30 <= reg17;
              reg31 <= (wire1 ~^ (wire9 ?
                  (wire14[(2'h2):(2'h2)] ?
                      $signed($unsigned((8'haa))) : wire11) : $unsigned($signed(wire9[(3'h6):(2'h3)]))));
            end
          reg34 <= $unsigned(wire4);
          reg35 <= {($signed(reg23) & (reg22[(4'hd):(3'h6)] ?
                  (~|reg33) : (((7'h40) != (8'hac)) ?
                      reg26[(1'h0):(1'h0)] : reg28[(2'h3):(2'h2)])))};
        end
    end
  assign wire36 = wire11;
endmodule

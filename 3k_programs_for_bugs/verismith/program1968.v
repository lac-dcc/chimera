module top
#(parameter param55 = ((~|((~((8'had) > (8'hb5))) <<< (^~((8'ha5) ? (8'ha6) : (8'hb1))))) < (((((7'h41) ? (8'hbe) : (7'h41)) ? ((8'hb3) ? (8'hb3) : (8'hb3)) : ((8'ha9) ? (8'hbc) : (8'hae))) ? (((8'ha9) ? (8'ha1) : (8'haa)) <= (-(8'hbf))) : (~&(~(8'ha7)))) ? (+(7'h40)) : {(((8'h9e) >> (8'ha0)) >>> (!(8'ha9))), ((^~(8'hac)) ~^ (&(8'haf)))})), 
parameter param56 = (+(((|(param55 ? (8'ha0) : (7'h44))) | param55) ? param55 : {((param55 ? param55 : param55) ? (param55 < param55) : {param55, param55})})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire17;
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 reg41,
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
                 (1'h0)};
  module5 #() modinst18 (.wire8(wire2), .wire7(wire3), .y(wire17), .clk(clk), .wire9(wire1), .wire6(wire4), .wire10(wire0));
  assign wire19 = $unsigned(wire4);
  assign wire20 = wire3;
  assign wire21 = $unsigned($signed($unsigned($signed($signed(wire0)))));
  assign wire22 = {(~&wire0[(3'h6):(2'h3)])};
  always
    @(posedge clk) begin
      reg23 <= wire4[(3'h7):(3'h5)];
      reg24 <= $signed($signed(wire0));
      if ((($signed({reg23[(3'h7):(3'h6)]}) || (&($unsigned(reg24) && wire20[(5'h10):(4'h9)]))) >= (8'hbe)))
        begin
          reg25 <= $unsigned((8'hb0));
        end
      else
        begin
          if ((~^wire1[(3'h5):(2'h3)]))
            begin
              reg25 <= $unsigned((&({(wire21 ? wire1 : wire2)} ?
                  $unsigned({wire2, (8'hb5)}) : ({wire22} ?
                      {wire21, wire20} : (^~(8'hb7))))));
            end
          else
            begin
              reg25 <= $signed($unsigned((((reg24 >>> (8'hb1)) >= reg24) ?
                  (wire1 ?
                      $signed((8'ha3)) : (~wire17)) : ((wire17 >= wire21) && wire20))));
              reg26 <= (+(^wire1[(1'h1):(1'h0)]));
              reg27 <= ($unsigned((((^wire19) <= (8'haa)) ?
                  $signed((reg23 | reg26)) : $unsigned(reg23))) | {wire1[(2'h3):(1'h1)]});
            end
        end
      if ((8'ha1))
        begin
          reg28 <= $unsigned(reg23);
          reg29 <= reg24[(4'ha):(4'h8)];
          if ({(8'hb2)})
            begin
              reg30 <= ($unsigned($unsigned(($signed(wire2) != wire19))) >> reg28[(1'h1):(1'h1)]);
              reg31 <= ($signed({{(reg27 ? wire20 : wire20),
                      ((8'hbb) >>> (8'hbf))}}) <<< wire22[(5'h14):(1'h1)]);
              reg32 <= (($signed(reg27[(3'h4):(1'h0)]) ?
                  reg26 : ((reg27 ? (reg30 * wire19) : $signed(reg31)) ?
                      reg27 : ($unsigned((7'h40)) ?
                          (wire21 ?
                              reg28 : wire20) : $signed(reg31)))) ^ $unsigned(reg26));
              reg33 <= (reg29 ?
                  ($signed((wire4[(3'h6):(1'h1)] ?
                          reg23[(3'h5):(1'h0)] : $signed(reg28))) ?
                      (reg23[(1'h0):(1'h0)] ?
                          wire20 : $signed((-reg28))) : (((~|reg25) ^ $unsigned((8'ha2))) >= (reg31 < $unsigned(reg27)))) : reg31[(4'h9):(3'h5)]);
              reg34 <= (reg33 ?
                  reg27 : $unsigned((($signed(reg31) < wire4[(4'h9):(3'h7)]) <<< (~wire21))));
            end
          else
            begin
              reg30 <= (8'hac);
              reg31 <= $signed((((|reg24[(5'h11):(4'ha)]) ?
                  ($unsigned(reg34) >> $signed(reg23)) : $unsigned(((8'ha3) ?
                      reg32 : wire0))) + (($unsigned(reg26) && {wire19}) ?
                  (reg24[(4'hb):(1'h1)] & (wire20 ?
                      wire19 : wire20)) : ((^~wire17) <<< {reg32, wire20}))));
              reg32 <= ((($signed({reg33, reg27}) != (wire0 >> {(7'h43),
                      reg28})) ?
                  (~&wire2) : ($signed((^~wire3)) ?
                      ((reg27 | (8'hb3)) ?
                          (reg31 | (8'hb9)) : $signed(wire19)) : (wire21[(4'h9):(1'h1)] ?
                          $signed(wire0) : (wire2 > reg29)))) == reg33);
              reg33 <= reg33[(1'h0):(1'h0)];
              reg34 <= reg23[(3'h6):(3'h4)];
            end
          reg35 <= ((wire19 || $unsigned(reg30)) ?
              $unsigned($unsigned(($signed(reg25) ?
                  {reg29} : reg33))) : wire17[(4'h8):(2'h2)]);
          if (reg25)
            begin
              reg36 <= ($unsigned($unsigned((~|wire3))) > $signed(wire21[(4'hb):(4'hb)]));
              reg37 <= (!(^(~|$signed((-wire20)))));
              reg38 <= ($signed((reg24[(3'h6):(3'h6)] ?
                      (&(reg31 * reg24)) : (reg31[(3'h6):(1'h0)] ?
                          $unsigned(reg23) : $unsigned(reg28)))) ?
                  ((^~$signed(wire19)) ?
                      reg33 : reg25) : (^~{(reg37 * $signed(wire2))}));
              reg39 <= $signed({($unsigned({reg35, (8'hb1)}) ?
                      wire4 : reg25[(3'h4):(2'h3)]),
                  wire1[(4'h9):(3'h7)]});
              reg40 <= $unsigned((|$signed($unsigned({reg33}))));
            end
          else
            begin
              reg36 <= reg39;
            end
        end
      else
        begin
          if ((~&reg28))
            begin
              reg28 <= $signed((reg34 * $unsigned(wire1[(3'h4):(1'h1)])));
              reg29 <= wire21[(2'h3):(2'h2)];
              reg30 <= (|($signed((reg37 ?
                      wire2[(3'h4):(1'h0)] : (reg25 == wire4))) ?
                  $unsigned({reg40, (reg25 ? reg37 : wire3)}) : (((reg34 ?
                              reg32 : wire20) ?
                          (^~reg29) : (wire2 ? (8'ha3) : wire17)) ?
                      {$unsigned(wire20)} : ((7'h42) ?
                          $signed(reg33) : (reg35 | reg35)))));
            end
          else
            begin
              reg28 <= (8'had);
              reg29 <= (((~^{{(8'ha1)},
                  wire17[(4'h9):(3'h6)]}) ^ reg26[(4'hb):(4'h8)]) - wire4[(1'h1):(1'h1)]);
            end
          reg31 <= wire20;
        end
      reg41 <= $unsigned(((~|wire17) ?
          reg29[(4'ha):(4'ha)] : $signed($signed(reg23[(3'h6):(2'h3)]))));
    end
  assign wire42 = (reg41[(4'hf):(3'h4)] & $unsigned({((reg40 * wire3) << reg38[(2'h2):(2'h2)])}));
  assign wire43 = (~|(reg35[(4'hb):(2'h2)] + ($signed(wire22[(4'hf):(1'h0)]) ?
                      $signed(wire19) : wire0[(3'h6):(2'h3)])));
  assign wire44 = reg24[(4'hf):(4'h9)];
  assign wire45 = (^($unsigned($signed((reg31 ^~ (8'ha9)))) ?
                      (wire3[(3'h7):(3'h4)] <<< $unsigned(((8'h9c) <<< reg29))) : (~^$signed($unsigned(reg37)))));
  assign wire46 = (wire0 >> wire3);
  assign wire47 = {$unsigned($unsigned(reg29)), reg31[(3'h4):(2'h2)]};
  assign wire48 = ((-wire19) ^ (reg28[(3'h7):(1'h0)] + (8'hb9)));
  assign wire49 = (reg36[(4'h8):(1'h1)] == ($signed((wire2 ?
                      (wire44 >>> wire42) : reg40)) & (((wire45 ?
                      (8'h9d) : wire21) + $signed((8'hb7))) ^~ {(^~reg28)})));
  assign wire50 = (!reg27[(1'h0):(1'h0)]);
  assign wire51 = $signed((8'ha7));
  assign wire52 = ($unsigned($signed(((reg26 ?
                          reg25 : reg32) - wire3[(4'hd):(4'h9)]))) ?
                      wire0 : wire3[(4'he):(3'h7)]);
  assign wire53 = $signed(($unsigned($signed({(8'h9e)})) ?
                      (wire47 * $unsigned({wire51})) : ($unsigned((wire51 ?
                          reg32 : wire49)) && reg36[(4'hd):(4'hd)])));
  assign wire54 = ((~|($signed(wire19[(4'hc):(4'ha)]) + (reg38[(2'h2):(2'h2)] ?
                          (wire17 & reg28) : (reg25 >= wire22)))) ?
                      wire44 : wire48);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (^~wire8[(3'h7):(2'h2)]);
  assign wire12 = $unsigned(wire7);
  assign wire13 = ($signed(wire11) - ($unsigned(wire11) * (wire11[(3'h5):(1'h0)] ?
                      wire11 : wire8[(3'h6):(1'h1)])));
  assign wire14 = $unsigned(({wire10[(1'h0):(1'h0)],
                      wire10} + ({wire9[(1'h1):(1'h1)], $signed(wire6)} ?
                      $signed(wire13) : $signed(wire8[(3'h4):(1'h1)]))));
  assign wire15 = (~|wire12[(2'h2):(1'h0)]);
  assign wire16 = ($unsigned(((&(wire8 ? wire13 : (8'hb0))) ?
                          wire10 : wire14)) ?
                      wire14[(3'h4):(3'h4)] : (wire14[(3'h4):(3'h4)] ?
                          ((~&$signed(wire11)) ~^ ($unsigned(wire10) ?
                              $unsigned(wire12) : wire8)) : $unsigned(wire11[(4'hd):(4'hc)])));
endmodule

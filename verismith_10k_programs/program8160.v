module top
#(parameter param59 = (8'ha9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire58,
                 wire56,
                 wire14,
                 wire5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = {($signed((wire1 ?
                         (wire3 >>> wire1) : $signed(wire0))) & wire2),
                     wire0[(4'h9):(3'h5)]};
  always
    @(posedge clk) begin
      reg6 <= (|wire1);
      reg7 <= wire0[(2'h3):(1'h0)];
      reg8 <= ($signed({{wire0}}) ?
          $unsigned(({(reg7 && reg6)} ^ (~&wire0))) : (((+$signed(reg7)) < reg7[(2'h2):(2'h2)]) ?
              wire1[(4'h8):(3'h6)] : ($unsigned(wire3) ?
                  ($signed(wire5) ?
                      (reg7 ? reg6 : wire0) : $unsigned(wire5)) : wire3)));
      reg9 <= ($unsigned($signed((((8'ha1) >= wire4) ~^ $unsigned(reg6)))) | wire5);
      reg10 <= (wire3[(1'h0):(1'h0)] ?
          wire3 : (|($unsigned({reg6}) ?
              wire5[(2'h3):(1'h1)] : $unsigned((&wire3)))));
    end
  always
    @(posedge clk) begin
      reg11 <= {wire1[(4'ha):(1'h0)]};
      reg12 <= {((reg10[(4'he):(4'ha)] ?
                  $unsigned({wire2}) : ($signed(reg11) ?
                      (!(8'hac)) : $unsigned(wire4))) ?
              $unsigned($signed((!wire2))) : $signed(((reg10 ?
                  (8'ha7) : wire1) ^ (wire0 ? reg9 : reg9)))),
          $unsigned(wire2)};
      reg13 <= ($signed((~$unsigned((reg8 & wire4)))) >> (~^(~^((reg8 ?
          wire1 : reg7) ~^ $unsigned(reg8)))));
    end
  assign wire14 = {((8'h9e) ?
                          (wire5 - reg7) : {wire5[(4'h8):(3'h4)],
                              ($unsigned(wire4) ? {(8'hac)} : $signed(reg10))}),
                      (reg6[(3'h4):(2'h3)] ?
                          $signed((^~(8'ha6))) : reg7[(3'h4):(2'h3)])};
  module15 #() modinst57 (.clk(clk), .y(wire56), .wire17(wire1), .wire20(wire14), .wire19(reg8), .wire16(wire5), .wire18(wire3));
  assign wire58 = $unsigned($unsigned(reg13[(2'h3):(2'h2)]));
endmodule

module module15
#(parameter param54 = (((((!(8'h9d)) ? ((8'ha8) ? (8'hb1) : (8'hba)) : ((8'ha4) ? (8'hae) : (8'hab))) == (((8'hbe) ~^ (8'hac)) ^~ ((8'ha8) >= (8'hbb)))) != ({(~^(8'hae))} ? {((8'hb7) > (8'h9d)), {(8'hb7)}} : (((8'hab) <<< (8'hb9)) ? (8'hb0) : (^(8'ha8))))) <<< ((^(((8'hbf) ~^ (8'hb1)) >= ((8'hb7) ? (8'hae) : (8'ha8)))) ? (^((~|(8'hb1)) ? ((8'hb6) << (7'h44)) : ((8'hae) ? (8'h9e) : (8'hbe)))) : {(8'ha3)})), 
parameter param55 = (^{((((8'hae) ^ param54) ~^ (~&param54)) << ((^~param54) ? param54 : (param54 ? (8'hb8) : param54))), {((param54 >= param54) ? ((8'hb6) && param54) : (param54 ? param54 : param54))}}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire36,
                 wire35,
                 wire34,
                 wire26,
                 wire25,
                 wire24,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= wire18;
      reg22 <= (+reg21[(1'h0):(1'h0)]);
      reg23 <= ((wire17[(1'h1):(1'h1)] << $signed(reg21[(2'h2):(2'h2)])) >= $unsigned(((8'h9e) ?
          ((wire19 ?
              reg21 : wire16) > $unsigned(reg21)) : $signed((wire18 && wire19)))));
    end
  assign wire24 = ({$unsigned((wire17 * {reg21}))} ?
                      ((8'hae) * ((~wire17[(1'h1):(1'h0)]) >>> ($unsigned(wire20) ^ reg22[(1'h1):(1'h1)]))) : $unsigned((+reg21[(3'h4):(3'h4)])));
  assign wire25 = ((wire24[(5'h10):(1'h1)] ^~ wire18) <= (~&(^~{(+wire24),
                      reg21})));
  assign wire26 = $signed({(($unsigned(wire17) ^ wire16) ?
                          wire24 : $signed(wire24[(4'hc):(4'h8)]))});
  always
    @(posedge clk) begin
      reg27 <= (((|wire19) ?
              ($signed((&wire25)) ?
                  $unsigned(wire19) : $signed((reg22 ?
                      wire24 : wire24))) : ({(~wire26)} ?
                  ((reg21 != wire19) ?
                      (!reg21) : wire19[(2'h2):(1'h0)]) : wire18)) ?
          $signed({$signed((wire20 ?
                  wire18 : (8'hac)))}) : (^~wire18[(3'h4):(2'h2)]));
      reg28 <= (($signed({wire26[(5'h14):(4'ha)]}) & $signed(((wire19 ?
          wire19 : wire25) > (+wire18)))) << wire26);
      reg29 <= {($unsigned({$signed((8'hb3)),
              (wire19 - wire17)}) << (($unsigned((8'ha9)) >= wire20) ?
              wire25[(4'hc):(3'h4)] : ((wire16 ? reg27 : wire26) ?
                  $signed(reg21) : (reg27 ? (8'hb7) : reg27))))};
      if ($unsigned((~((7'h43) <<< (^~reg21[(3'h4):(1'h0)])))))
        begin
          reg30 <= $unsigned((|$signed((+reg22))));
          reg31 <= $unsigned({(reg27[(3'h4):(2'h3)] >> reg27[(4'h8):(3'h7)])});
        end
      else
        begin
          reg30 <= (wire26 & wire26[(4'hb):(4'hb)]);
          reg31 <= (~wire20[(1'h0):(1'h0)]);
          reg32 <= $signed($unsigned({(-$unsigned(wire16))}));
          reg33 <= reg28;
        end
    end
  assign wire34 = (^((+((~reg29) < (~&reg31))) ?
                      ($unsigned(reg30) ~^ wire18) : (8'ha2)));
  assign wire35 = $unsigned($signed(($unsigned(wire16) ?
                      $unsigned(((8'hb1) + reg21)) : ((~(8'ha8)) | reg29[(4'h8):(1'h1)]))));
  assign wire36 = ($unsigned($signed({{(8'hb2),
                          reg29}})) ~^ $signed(wire16[(4'hd):(4'h8)]));
  always
    @(posedge clk) begin
      reg37 <= {$unsigned(wire16[(5'h11):(3'h4)]),
          ({(reg23[(3'h5):(3'h4)] << (&wire24)),
              (^~wire17[(3'h5):(2'h3)])} + $unsigned((wire24 ?
              (8'had) : (reg29 != reg33))))};
      if ({wire17, $unsigned($unsigned(wire18[(4'h8):(4'h8)]))})
        begin
          reg38 <= $signed((|wire36));
          reg39 <= $unsigned({($signed($signed(reg29)) < (reg29[(3'h4):(3'h4)] ?
                  $signed((8'hb0)) : (reg31 == reg23))),
              (+{(wire26 ? wire34 : reg22)})});
          reg40 <= $unsigned($signed($unsigned(reg39[(2'h2):(1'h0)])));
          if (reg38)
            begin
              reg41 <= ($unsigned(((wire35 == (reg30 >= reg32)) ?
                  $unsigned($unsigned(reg22)) : wire20)) & $signed((reg32 ?
                  (8'hbf) : (8'ha5))));
              reg42 <= {(({reg32[(2'h3):(2'h2)],
                          (8'hb4)} | $unsigned((reg40 | reg29))) ?
                      reg37[(3'h6):(3'h5)] : reg29[(1'h1):(1'h0)])};
            end
          else
            begin
              reg41 <= {$signed(reg27[(4'h8):(3'h4)]),
                  ($unsigned(($signed((8'h9f)) ?
                          $unsigned(wire34) : $unsigned(wire18))) ?
                      (($unsigned(reg23) ?
                              (+reg21) : (wire18 ? wire19 : wire35)) ?
                          (-(~^reg27)) : $signed($signed(wire16))) : reg23)};
              reg42 <= (($unsigned((|$unsigned(wire18))) ?
                      ($unsigned((reg22 <<< reg40)) > reg29[(1'h1):(1'h1)]) : reg39[(2'h2):(1'h1)]) ?
                  reg28 : wire17);
              reg43 <= wire19[(3'h5):(3'h5)];
            end
        end
      else
        begin
          reg38 <= reg42;
          reg39 <= wire26;
          reg40 <= ((({(~reg41), $unsigned((8'h9f))} ?
                      (reg23[(2'h3):(2'h2)] ?
                          (~wire19) : wire36[(4'hf):(3'h5)]) : wire24) ?
                  reg43[(4'h9):(1'h1)] : (~($signed(reg28) ?
                      $unsigned(wire18) : (reg41 ? wire35 : wire20)))) ?
              ((^wire35[(1'h0):(1'h0)]) & wire20) : wire26[(4'hb):(4'h8)]);
          if (reg37)
            begin
              reg41 <= ($signed($unsigned(reg40)) ?
                  (reg31 & ($unsigned((~^reg32)) ?
                      (~reg23) : $unsigned(reg43))) : reg39);
              reg42 <= $unsigned((^~reg38[(4'hd):(2'h2)]));
              reg43 <= (8'hab);
            end
          else
            begin
              reg41 <= {(^(($unsigned(reg40) << (reg30 ? reg37 : reg33)) ?
                      (8'ha9) : (reg21 > (^reg22)))),
                  (reg39[(1'h1):(1'h0)] ?
                      reg38 : $signed(reg37[(3'h4):(2'h3)]))};
              reg42 <= (~&{($unsigned($signed(wire18)) ?
                      (wire26[(5'h11):(3'h5)] ?
                          {(8'hb7)} : (reg21 ?
                              reg39 : reg28)) : ($unsigned(wire24) | (~wire34)))});
              reg43 <= (~(^($signed($signed(reg27)) > ({reg30,
                  reg38} > $signed((8'ha9))))));
              reg44 <= $signed({$signed(wire25)});
              reg45 <= reg21[(3'h5):(2'h2)];
            end
          reg46 <= $unsigned(($unsigned($signed((reg31 >>> reg33))) ?
              $unsigned($unsigned(wire26[(4'hc):(4'hb)])) : $signed(($signed(reg41) ^~ ((8'hb7) ^ (7'h43))))));
        end
      reg47 <= (~^reg30[(1'h1):(1'h1)]);
      reg48 <= ((~^{wire18, (reg27 == reg38[(3'h4):(1'h0)])}) ?
          $unsigned(wire26[(3'h5):(1'h0)]) : (|(~(^(reg39 ?
              reg21 : (8'hb9))))));
      reg49 <= (($unsigned($signed((reg43 && reg39))) ?
              wire20 : (reg47[(4'h8):(1'h0)] ?
                  (&reg42) : ((8'ha6) <= wire24[(1'h1):(1'h1)]))) ?
          {$unsigned((reg21 ? $signed(reg23) : (~wire18))),
              reg45} : $signed((($unsigned(reg46) >= $unsigned(reg43)) ?
              $signed((wire25 ? wire34 : reg44)) : reg46[(1'h1):(1'h1)])));
    end
  assign wire50 = (~|$signed(wire20[(1'h0):(1'h0)]));
  assign wire51 = $signed((~&wire26));
  assign wire52 = $unsigned($signed(wire51));
  assign wire53 = wire24;
endmodule

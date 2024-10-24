module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire58;
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  assign y = {wire63, wire61, wire60, wire4, wire5, wire58, reg62, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire4;
  module6 #() modinst59 (wire58, clk, wire3, wire1, wire5, wire0, wire2);
  assign wire60 = ((8'haa) ?
                      $signed(($unsigned(wire58[(4'h8):(3'h4)]) ?
                          wire58 : $unsigned(wire5[(5'h13):(3'h4)]))) : $unsigned((wire0 * wire2)));
  assign wire61 = $unsigned((wire4[(4'h9):(4'h8)] >= (8'hba)));
  always
    @(posedge clk) begin
      reg62 <= (~wire58[(1'h0):(1'h0)]);
    end
  assign wire63 = $signed($signed(($signed((wire2 ?
                      wire58 : wire5)) >= ((^~wire5) ^ $unsigned(wire4)))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire54;
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire12,
                 wire31,
                 wire37,
                 wire38,
                 wire54,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire12 = $signed($unsigned({wire10[(2'h3):(1'h0)]}));
  module13 #() modinst32 (wire31, clk, wire9, wire7, wire12, wire8);
  always
    @(posedge clk) begin
      reg33 <= wire12[(3'h5):(2'h3)];
      reg34 <= ($signed(((~&$unsigned(wire8)) ?
              $signed((8'hbd)) : (^$signed(wire12)))) ?
          ((~&(-((8'hbd) & wire7))) ?
              wire8[(4'ha):(1'h0)] : wire9) : ((~&$signed(((8'ha5) ^~ wire7))) && wire12));
      if (((8'hac) > (~^({reg33[(4'he):(3'h7)]} - reg34))))
        begin
          reg35 <= $signed((~$unsigned($unsigned((wire11 ? reg33 : wire9)))));
        end
      else
        begin
          reg35 <= (~&(wire8[(4'ha):(3'h6)] ? (^(!(wire7 * wire12))) : wire7));
          reg36 <= (~^(-(!$unsigned((wire7 ? reg35 : reg35)))));
        end
    end
  assign wire37 = ((($signed(wire9) >>> ($unsigned(wire9) ?
                          wire8[(2'h3):(1'h1)] : wire8[(4'h8):(1'h1)])) ?
                      {((^~wire12) ?
                              (~|wire9) : (~&reg34))} : {$unsigned(wire9)}) >= (reg36[(1'h1):(1'h0)] ?
                      wire11 : ((~^wire9) || (&$signed(reg33)))));
  assign wire38 = reg34;
  module39 #() modinst55 (wire54, clk, reg33, wire38, wire31, wire10);
  assign wire56 = wire38;
  assign wire57 = (wire10 ?
                      (^~$unsigned(($unsigned(wire12) ?
                          (~wire37) : (wire31 || wire31)))) : reg34);
endmodule

module module39  (y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire43;
  input wire signed [(5'h13):(1'h0)] wire42;
  input wire [(3'h5):(1'h0)] wire41;
  input wire [(5'h13):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire44;
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire44,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = (~&wire43);
  always
    @(posedge clk) begin
      reg45 <= (wire40[(5'h12):(4'hb)] ?
          (wire42[(4'h9):(3'h6)] ?
              (|wire43[(3'h6):(3'h5)]) : {{(wire42 ^~ wire43),
                      (wire44 ? wire42 : (8'h9d))},
                  wire43}) : $unsigned($unsigned((+$signed((8'haf))))));
    end
  always
    @(posedge clk) begin
      reg46 <= wire44[(4'hb):(2'h2)];
      reg47 <= $signed(((($signed(wire43) ?
              wire44 : reg45) & ($unsigned(reg46) ~^ $signed(wire44))) ?
          (8'ha1) : $signed(wire42[(1'h0):(1'h0)])));
    end
  assign wire48 = ($unsigned((~(8'ha0))) ?
                      ($signed(((-reg46) ? (^wire44) : ((7'h40) + wire40))) ?
                          wire44 : $unsigned($unsigned((wire41 ?
                              reg45 : wire44)))) : (|$unsigned($signed(reg45))));
  assign wire49 = ({(|$unsigned({reg45})), (~{(reg46 << reg47)})} != wire41);
  assign wire50 = wire48[(1'h1):(1'h1)];
  assign wire51 = $signed({(7'h44)});
  assign wire52 = ($unsigned(($unsigned($unsigned(wire51)) ?
                          $signed((wire40 ?
                              reg47 : wire41)) : (~$unsigned((8'hb0))))) ?
                      $signed(wire51) : $signed($signed(($unsigned(wire40) + (wire44 <<< (8'h9c))))));
  assign wire53 = (!(^~$signed((((8'ha3) != wire44) ?
                      (reg46 + (8'hba)) : (~&wire51)))));
endmodule

module module13
#(parameter param30 = (+({(((8'hb9) ^~ (8'hbc)) != (-(8'hbd))), (8'ha4)} ? ((8'ha8) ? ((&(8'ha1)) ? ((8'ha5) ? (7'h40) : (7'h40)) : (^~(8'hb8))) : (((8'ha4) ~^ (8'hb5)) > (~|(8'hab)))) : (-(((8'hb0) ? (8'hb1) : (8'h9e)) ? ((7'h43) == (8'ha6)) : ((8'ha5) ? (8'haf) : (8'hb1)))))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire20,
                 wire19,
                 wire18,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire18 = (($unsigned({(^wire16)}) << $signed(((|wire15) || (wire15 ?
                          wire14 : wire14)))) ?
                      ({$unsigned((&wire14)), (7'h41)} ?
                          $unsigned($unsigned((wire17 ?
                              wire16 : wire14))) : (($unsigned((8'ha7)) ?
                              (-wire15) : $signed(wire17)) + ({wire15} >= $unsigned(wire17)))) : (($unsigned($unsigned(wire16)) ?
                              wire17 : (wire14[(4'h9):(4'h9)] ?
                                  (~|wire16) : wire17)) ?
                          wire16[(3'h5):(3'h4)] : $signed((7'h44))));
  assign wire19 = ((8'ha5) ?
                      ({({(8'hb2), (7'h43)} ? (|(8'hb8)) : $unsigned(wire18))} ?
                          wire14 : {$unsigned((~^wire15))}) : ((wire14[(1'h0):(1'h0)] ?
                              {$signed(wire15),
                                  wire17} : wire17[(3'h4):(2'h2)]) ?
                          (+($signed(wire14) ?
                              (8'ha5) : ((8'hb8) ?
                                  wire14 : wire14))) : (!(wire14 ?
                              wire15 : wire16[(2'h3):(2'h3)]))));
  assign wire20 = $signed($signed($signed($unsigned(((8'haf) ?
                      wire15 : (8'ha4))))));
  always
    @(posedge clk) begin
      reg21 <= {wire20[(3'h5):(1'h0)]};
      reg22 <= (8'hb1);
      reg23 <= $unsigned($unsigned((({wire20} + (wire19 | wire17)) == ($signed(wire19) ?
          $unsigned((8'hb3)) : (8'h9f)))));
      if ($unsigned(((~wire14[(4'ha):(3'h6)]) ^ {(wire17[(2'h2):(1'h0)] ?
              (~^reg23) : (reg22 && wire20))})))
        begin
          reg24 <= wire15[(3'h5):(2'h2)];
          reg25 <= {(!reg21),
              ({((-reg23) > (8'ha1)),
                  {$signed(wire20),
                      {wire14}}} + $unsigned(({reg23} <= ((7'h40) & reg22))))};
          reg26 <= {($signed(((&wire17) + (reg21 >> reg21))) != ($signed($signed(wire15)) ?
                  ($unsigned(wire18) ?
                      reg21 : reg23[(1'h0):(1'h0)]) : wire19))};
          reg27 <= wire16[(4'he):(4'hd)];
        end
      else
        begin
          if (wire19[(2'h2):(1'h0)])
            begin
              reg24 <= (8'hbd);
              reg25 <= ($unsigned($unsigned(reg26[(4'h8):(2'h3)])) == wire18);
            end
          else
            begin
              reg24 <= ((8'h9d) ?
                  $signed(reg26) : (({$unsigned(reg25),
                      $signed((8'hb0))} >> $unsigned($signed((8'hbf)))) == (|(reg22[(1'h1):(1'h1)] ?
                      wire15[(1'h0):(1'h0)] : reg27[(3'h7):(3'h5)]))));
            end
          reg26 <= reg21[(4'hd):(3'h4)];
        end
    end
  assign wire28 = $unsigned((^~wire20[(2'h3):(2'h2)]));
  assign wire29 = $signed((((wire14[(4'he):(4'hd)] ?
                          (8'hb3) : $signed(reg25)) & wire14[(1'h1):(1'h0)]) ?
                      (-(-{wire18,
                          wire19})) : (($signed(wire14) >>> $signed(wire28)) <<< $unsigned(((8'hac) ?
                          wire17 : reg23)))));
endmodule

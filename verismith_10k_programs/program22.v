module top
#(parameter param56 = (8'ha3))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire48,
                 wire43,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire12,
                 wire11,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(2'h3):(1'h1)];
      if (((!wire1) >= ($unsigned(wire2) >>> {wire2, {$signed(wire1)}})))
        begin
          reg6 <= ((~$unsigned(wire3[(2'h2):(1'h0)])) > wire1[(3'h5):(2'h2)]);
          reg7 <= $unsigned($signed($signed(reg6)));
          reg8 <= wire3[(4'hf):(3'h7)];
        end
      else
        begin
          reg6 <= (~|$unsigned($unsigned(reg8)));
        end
      reg9 <= ($unsigned((+(wire1 ? wire2[(3'h4):(1'h0)] : (+(8'hbc))))) ?
          (7'h43) : (|(reg6 * reg8[(3'h5):(1'h0)])));
      reg10 <= (8'hbc);
    end
  assign wire11 = (($unsigned($unsigned((reg10 >>> reg5))) < (((^reg7) >> $signed((7'h41))) ?
                      $signed(reg7[(1'h0):(1'h0)]) : reg10)) <<< wire0);
  assign wire12 = ({(7'h43)} ?
                      reg10[(2'h2):(1'h0)] : (wire4[(2'h3):(1'h1)] - $unsigned(wire0[(2'h3):(1'h1)])));
  module13 #() modinst37 (wire36, clk, reg7, reg5, reg9, reg10);
  assign wire38 = (~&$signed({((8'h9c) <<< (reg7 == wire11))}));
  assign wire39 = ({{((|wire38) ?
                              $unsigned(reg8) : (|reg7))}} != (((8'haf) >>> wire4[(4'hb):(3'h4)]) > (+$signed((reg5 ?
                      wire4 : wire0)))));
  assign wire40 = (&(~^wire36[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg41 <= ((~reg8) * $signed(wire40[(3'h7):(2'h2)]));
      reg42 <= (8'hb9);
    end
  assign wire43 = reg8;
  always
    @(posedge clk) begin
      reg44 <= wire36;
      reg45 <= {(reg8 ?
              $signed($unsigned((wire12 ? reg44 : reg6))) : (-{((8'hb5) ?
                      (8'ha2) : reg5),
                  wire3[(3'h7):(2'h3)]})),
          {{reg44, $signed(((8'hb6) ? wire2 : wire36))},
              wire12[(1'h1):(1'h0)]}};
      reg46 <= (($signed($signed(reg10)) ~^ ((+$unsigned(wire38)) ?
          $unsigned((wire40 > wire12)) : ({reg41} * wire4))) << (((|reg8[(2'h2):(1'h0)]) ?
              (wire0 * {wire11}) : (&reg5)) ?
          wire0[(1'h0):(1'h0)] : $unsigned($unsigned((^wire40)))));
      reg47 <= reg44[(4'h8):(3'h7)];
    end
  assign wire48 = $signed({reg9});
  always
    @(posedge clk) begin
      reg49 <= {{wire38}};
      reg50 <= ({$signed(wire48[(2'h3):(2'h3)]), (!$signed(reg42))} == reg41);
      reg51 <= $unsigned((~wire11));
      reg52 <= (reg9 ?
          $signed(wire1) : ($signed($signed((reg46 <<< reg45))) ?
              reg47[(4'h9):(3'h5)] : (((~^wire36) ?
                  $signed((8'hbc)) : $signed(reg41)) + $unsigned((reg7 ?
                  wire40 : wire11)))));
    end
  assign wire53 = wire36;
  assign wire54 = (~|($unsigned(($unsigned(reg44) >>> wire43[(2'h2):(1'h1)])) ?
                      ($signed(wire11[(2'h2):(2'h2)]) + $signed($unsigned(reg45))) : reg8[(3'h6):(3'h6)]));
  assign wire55 = $signed((({(~^reg45),
                      $signed(wire3)} ^~ wire3[(4'hc):(1'h0)]) * (8'ha9)));
endmodule

module module13
#(parameter param35 = {(&({((8'ha5) >> (8'h9f)), ((8'ha5) ? (8'hb5) : (8'ha9))} ? (8'had) : (((8'hb8) ? (8'ha3) : (8'hbf)) ? ((8'hbe) ? (8'ha0) : (8'h9f)) : ((8'hb2) ? (8'h9f) : (8'haf)))))})
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire18 = $unsigned(wire15[(3'h5):(2'h2)]);
  assign wire19 = (-$unsigned((~|$signed(wire17))));
  assign wire20 = ($signed((&(~^{wire19}))) | ((wire19 >> (~^{wire14,
                          (8'ha9)})) ?
                      wire19[(3'h4):(2'h3)] : ((8'h9d) & ((wire19 ?
                          wire16 : wire17) << wire17))));
  assign wire21 = $signed((8'hac));
  assign wire22 = (($signed((wire15[(3'h4):(2'h2)] || (wire21 ?
                              wire18 : (7'h41)))) ?
                          ({wire16[(1'h0):(1'h0)]} ?
                              ((^wire17) ?
                                  wire15[(3'h7):(2'h3)] : wire14) : (8'ha1)) : wire20[(3'h7):(3'h5)]) ?
                      (((^~$signed(wire18)) == (~|$unsigned(wire14))) ?
                          wire16 : (~{$unsigned((8'hba))})) : ((wire19[(1'h1):(1'h0)] ?
                              {(^(8'ha4))} : ($unsigned(wire19) ?
                                  $unsigned(wire20) : (^wire19))) ?
                          (wire18 ?
                              wire16[(2'h2):(2'h2)] : (wire19[(3'h4):(2'h3)] ?
                                  wire16[(1'h1):(1'h1)] : (~&wire19))) : {((8'ha0) ?
                                  wire15 : (wire21 <= wire18)),
                              wire21}));
  assign wire23 = wire20[(4'hc):(1'h0)];
  assign wire24 = (^(wire14 ?
                      wire17[(2'h3):(2'h3)] : (^$signed((wire18 > wire19)))));
  always
    @(posedge clk) begin
      reg25 <= ($signed(({(^~(8'hac))} > (wire15[(3'h6):(3'h5)] << (^wire18)))) <= wire18[(1'h0):(1'h0)]);
      reg26 <= $signed($unsigned({$unsigned($unsigned((8'hbc)))}));
      reg27 <= wire19[(1'h1):(1'h1)];
      if (((-(~|$unsigned(reg26[(2'h3):(1'h1)]))) ?
          wire17 : wire21[(1'h0):(1'h0)]))
        begin
          reg28 <= ($unsigned((wire22[(3'h7):(1'h1)] ?
                  $signed((wire16 * wire20)) : ((wire23 ?
                      wire17 : (8'h9f)) ~^ $unsigned(wire21)))) ?
              reg25[(2'h3):(2'h2)] : wire17);
          reg29 <= ((~&(~&wire21[(3'h5):(2'h3)])) << {(((wire18 ~^ wire23) ?
                      (^~(8'hbe)) : wire20[(4'hc):(1'h0)]) ?
                  (~&{reg26, wire19}) : ((wire22 ? (8'hb3) : wire23) ?
                      {(8'hbc)} : $signed(wire15))),
              $unsigned(((8'haf) ? (~^wire19) : (reg25 ? (8'ha8) : wire15)))});
        end
      else
        begin
          reg28 <= {((~{(wire23 <= wire21)}) ?
                  (|reg27) : (~|wire18[(1'h0):(1'h0)])),
              (~|wire15[(3'h4):(1'h0)])};
          reg29 <= $signed({(8'ha9)});
        end
    end
  assign wire30 = wire14[(3'h7):(3'h6)];
  assign wire31 = $signed(({({wire22} ? (+(8'hbf)) : (~&wire30)),
                      wire22[(2'h2):(2'h2)]} ^~ $signed(reg25)));
  assign wire32 = (wire20 ^~ $unsigned((~&$unsigned(wire24))));
  assign wire33 = (~|wire31[(3'h4):(1'h0)]);
  assign wire34 = reg26;
endmodule

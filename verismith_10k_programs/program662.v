module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire11,
                 wire10,
                 wire9,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($unsigned($unsigned($unsigned($unsigned(wire1)))));
      reg5 <= wire1;
      reg6 <= (^~$signed($unsigned(((reg5 ?
          wire3 : wire3) ^ $signed((8'ha1))))));
      reg7 <= $unsigned(((wire3[(2'h3):(2'h2)] && reg5) ^~ (7'h44)));
      reg8 <= (^~($unsigned((wire0[(1'h0):(1'h0)] & $signed(wire2))) ?
          {reg5,
              ($unsigned(reg5) ?
                  {reg4, reg7} : wire0[(2'h3):(1'h0)])} : $signed(wire0)));
    end
  assign wire9 = (-$signed(((~|(8'hb6)) >>> $signed($signed(wire3)))));
  assign wire10 = ($unsigned(wire3[(1'h1):(1'h0)]) != ($unsigned((!$signed(wire2))) ?
                      $signed(reg4) : wire2[(4'hd):(1'h0)]));
  assign wire11 = (^~reg7[(4'hf):(4'he)]);
  module12 #() modinst71 (wire70, clk, reg8, wire1, wire9, wire0, wire10);
  assign wire72 = $unsigned(wire11);
  assign wire73 = reg4[(3'h4):(2'h3)];
  assign wire74 = {({((reg7 && wire2) * reg5[(1'h0):(1'h0)]),
                              wire9[(4'h9):(3'h5)]} ?
                          $unsigned(($unsigned(wire72) ?
                              (wire11 ?
                                  wire0 : wire9) : $signed(wire73))) : (+{wire10[(4'hc):(1'h1)]})),
                      wire9[(2'h3):(1'h1)]};
  assign wire75 = $unsigned((8'ha2));
  assign wire76 = $signed($unsigned(wire75));
endmodule

module module12
#(parameter param68 = (((~|{((8'hbc) ^ (8'ha5))}) ? {((&(8'hbf)) ? (|(8'hae)) : (+(8'hbd)))} : ((((8'ha2) ? (8'haa) : (7'h44)) ? ((7'h41) ? (8'hb6) : (8'ha7)) : (~(8'hab))) != {(^~(8'hb3))})) ? {(~|(^~((8'ha9) ? (8'haf) : (8'ha3))))} : (^~((^(8'hab)) > ({(8'hb9)} ? ((8'ha5) >>> (8'ha8)) : (~&(8'hbd)))))), 
parameter param69 = (&(~&((+((8'hbb) ^~ param68)) ? ((param68 ? param68 : param68) + {param68}) : (param68 != param68)))))
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire63;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire63,
                 (1'h0)};
  assign wire18 = (((wire14[(2'h3):(2'h3)] ?
                          (~|wire13[(3'h4):(3'h4)]) : ((~wire16) && $unsigned(wire14))) ?
                      wire16 : ($signed($signed(wire15)) ?
                          wire17 : wire13[(2'h3):(1'h1)])) + $signed(wire16[(1'h1):(1'h0)]));
  assign wire19 = (|$signed(((7'h40) >> wire15[(1'h1):(1'h1)])));
  assign wire20 = (wire19[(2'h2):(2'h2)] | wire16);
  assign wire21 = ((&$signed((|(wire13 <= wire15)))) | wire17[(3'h4):(1'h0)]);
  assign wire22 = (~(wire21 ?
                      wire15[(3'h6):(2'h3)] : (wire21 ?
                          ($signed(wire20) ^~ (-wire20)) : (~^$unsigned(wire18)))));
  assign wire23 = (|(~|$unsigned((-$signed(wire19)))));
  assign wire24 = wire13[(2'h3):(1'h0)];
  module25 #() modinst64 (wire63, clk, wire15, wire18, wire21, wire23, wire13);
  assign wire65 = $unsigned(($signed(wire24[(1'h0):(1'h0)]) <= wire22));
  assign wire66 = (7'h43);
  assign wire67 = (~&$signed(((~wire63) | {wire24})));
endmodule

module module25
#(parameter param61 = (((~|(^~(-(8'ha8)))) ? ((((7'h43) ? (7'h43) : (8'hab)) ? ((8'had) != (8'hb1)) : ((8'ha4) ? (8'h9f) : (8'ha4))) ^ (8'hb0)) : {(+(!(8'hb1)))}) ? (~^{(!((8'hbe) | (8'hbb)))}) : (~^(^~(-{(8'hbb), (8'h9e)})))), 
parameter param62 = param61)
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire31;
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  assign y = {wire60,
                 wire55,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire31,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire31 = {{$unsigned(wire30[(3'h6):(3'h6)])}, wire30[(3'h4):(1'h0)]};
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg32 <= ($unsigned($unsigned((^$unsigned(wire29)))) ?
              (~wire27[(3'h6):(1'h1)]) : $signed({wire30,
                  $signed((wire30 ? wire29 : wire26))}));
        end
      else
        begin
          if ((wire26[(4'h8):(3'h4)] & wire31[(3'h6):(1'h0)]))
            begin
              reg32 <= (^{wire28[(1'h0):(1'h0)],
                  (!$unsigned($signed(wire26)))});
            end
          else
            begin
              reg32 <= $unsigned(reg32[(1'h1):(1'h1)]);
              reg33 <= wire31[(4'h9):(4'h8)];
              reg34 <= wire31[(3'h4):(2'h3)];
            end
          reg35 <= $signed((!$signed($signed(((8'h9f) ? wire26 : wire30)))));
          reg36 <= $signed(((reg34[(4'hd):(3'h6)] ?
                  $signed($signed(reg32)) : wire27) ?
              (^$signed(reg35)) : reg35));
          reg37 <= {((8'hba) || (wire30[(3'h6):(2'h2)] > $unsigned($signed(reg32))))};
          reg38 <= ((+($unsigned((8'hb0)) - (reg33 || reg37[(5'h12):(4'hc)]))) ?
              ((reg37 ? $unsigned((-wire29)) : $unsigned($signed(wire29))) ?
                  $signed((&wire28[(4'h8):(2'h2)])) : (^~reg32[(2'h3):(2'h3)])) : wire29);
        end
      reg39 <= (+(wire30 ?
          {(!$unsigned(reg33)),
              $unsigned(reg33[(3'h5):(2'h3)])} : reg37[(2'h3):(1'h0)]));
      reg40 <= $unsigned($signed($signed(reg32)));
      reg41 <= reg37[(4'h8):(3'h4)];
    end
  assign wire42 = (wire31[(4'h9):(4'h8)] < (reg38[(2'h3):(2'h3)] ?
                      (~{$unsigned((8'hbb))}) : wire30[(3'h5):(3'h4)]));
  assign wire43 = ($signed(reg37[(5'h10):(4'hb)]) ?
                      (~&((8'hb9) ?
                          reg36 : reg37[(4'he):(4'h9)])) : (^(~|reg33)));
  assign wire44 = {$signed($unsigned((&$signed(wire27)))),
                      (({{(8'hb9)}, reg36} ?
                              $signed(wire27[(4'hb):(4'h8)]) : $unsigned(reg35[(2'h3):(2'h2)])) ?
                          $signed($unsigned((reg35 == reg38))) : (~|($unsigned((8'ha0)) ?
                              (reg37 ? reg35 : reg35) : $unsigned((8'ha4)))))};
  assign wire45 = (reg39[(4'he):(1'h0)] ?
                      ((~(wire29 ? wire29 : (wire43 ? (8'hac) : wire27))) ?
                          reg33[(1'h1):(1'h1)] : wire27[(4'h9):(1'h1)]) : reg33[(3'h5):(2'h2)]);
  assign wire46 = $unsigned(reg41);
  always
    @(posedge clk) begin
      reg47 <= ($signed(wire28) ?
          ((((^~(8'hb7)) ? (reg37 >> reg32) : (~&wire29)) ?
                  (wire42[(1'h1):(1'h1)] ?
                      {reg33} : (reg38 ?
                          (8'hbf) : wire44)) : $unsigned(reg39[(4'hc):(4'hb)])) ?
              $unsigned(wire29[(3'h7):(1'h1)]) : wire46[(4'he):(4'hd)]) : $signed({($signed((8'ha7)) ?
                  ((8'hb9) ^~ wire29) : $signed(reg32)),
              ({wire46, reg37} <= $signed(reg35))}));
      reg48 <= wire30;
      if ($unsigned(($unsigned(($unsigned(reg37) ^~ {wire45, wire27})) ?
          ($signed((wire46 <<< wire28)) ?
              $signed({reg36}) : (reg47[(1'h1):(1'h0)] ?
                  ((8'hbb) ?
                      wire28 : (8'ha7)) : (wire29 - reg40))) : $unsigned((^reg39[(4'hc):(3'h7)])))))
        begin
          reg49 <= $unsigned(wire30);
          reg50 <= wire27[(4'hc):(1'h0)];
          reg51 <= $signed($unsigned(reg40[(4'hd):(4'hc)]));
          if ((~&reg48[(3'h5):(2'h2)]))
            begin
              reg52 <= (wire28 ?
                  ((($unsigned(reg39) & wire28[(2'h3):(1'h0)]) ?
                      $signed($signed(reg47)) : (~|reg32[(2'h2):(2'h2)])) << reg39[(1'h1):(1'h0)]) : (($unsigned({reg40,
                              wire27}) ?
                          (reg39 ? (~wire28) : (7'h41)) : reg33) ?
                      (wire27 ?
                          $unsigned($unsigned(wire26)) : wire29) : (8'haa)));
              reg53 <= (^$signed((8'hb3)));
            end
          else
            begin
              reg52 <= reg51[(1'h1):(1'h0)];
            end
          reg54 <= reg41[(3'h6):(2'h2)];
        end
      else
        begin
          reg49 <= $unsigned((~&(8'hba)));
          reg50 <= ($unsigned($signed(wire31[(3'h5):(2'h3)])) >>> ((~^wire26) + {{reg51},
              (!{(8'hbe)})}));
          reg51 <= ((wire43 > {reg33, $signed($signed(reg40))}) ?
              $signed((($unsigned(wire42) ?
                      (reg34 ? (8'ha7) : reg35) : $signed(reg41)) ?
                  $unsigned(reg35) : (&$signed(reg49)))) : $signed((wire43[(1'h1):(1'h1)] ?
                  wire44[(4'h9):(1'h0)] : reg36)));
        end
    end
  assign wire55 = {reg32[(2'h3):(2'h3)], {$unsigned($unsigned((~|reg39)))}};
  always
    @(posedge clk) begin
      reg56 <= $unsigned($unsigned((+$unsigned(wire44[(3'h7):(1'h0)]))));
      reg57 <= (8'ha6);
      reg58 <= (reg56[(2'h2):(1'h1)] ^ $signed($signed((wire30 ?
          (reg57 ? reg57 : reg33) : ((8'ha8) >> wire44)))));
      reg59 <= reg49[(3'h5):(2'h3)];
    end
  assign wire60 = wire29[(1'h0):(1'h0)];
endmodule

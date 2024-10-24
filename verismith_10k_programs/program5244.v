module top
#(parameter param82 = (((!(|(8'ha3))) ? ((~&((7'h43) ? (8'hb8) : (8'ha2))) != (8'hbf)) : {({(8'hbd)} ? ((8'hab) & (8'ha2)) : (|(8'hb5)))}) ? ((((~(8'hbb)) ? (8'hb6) : {(8'ha3), (8'hba)}) ? ((~(7'h40)) ? (&(7'h42)) : {(8'hab), (8'haf)}) : (&((8'hbd) ? (8'hb0) : (7'h40)))) ? ((8'ha5) < (((7'h40) ? (8'ha0) : (8'hb7)) ? ((8'hae) ^ (7'h43)) : (8'hb5))) : {(-((8'hb1) != (7'h40))), ((&(8'h9f)) ? (~^(8'haf)) : {(8'hb9)})}) : {(|(((8'hb7) ^ (8'ha3)) ^~ ((8'hb8) ? (8'h9c) : (8'hbf)))), ((-(^(8'ha2))) != {((8'ha8) ^~ (8'hb3)), (~&(8'hb7))})}), 
parameter param83 = (~|(~{{param82}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  assign y = {wire81,
                 wire78,
                 wire76,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ($signed((^~wire5[(1'h1):(1'h1)])) >>> {(~&wire0)});
  assign wire7 = (wire5[(4'h9):(3'h5)] ?
                     {(~^{$signed(wire0), (~^(7'h41))}),
                         $unsigned($unsigned((-wire3)))} : $signed(((wire2[(1'h0):(1'h0)] * $signed((8'hae))) ?
                         $signed((wire0 < wire3)) : wire0)));
  assign wire8 = $signed({$signed($unsigned($signed((8'ha0))))});
  assign wire9 = (~^wire4[(2'h3):(1'h1)]);
  assign wire10 = (^{wire5, $unsigned({$unsigned(wire9)})});
  assign wire11 = (((^(wire3[(5'h14):(5'h12)] + (wire5 ~^ (8'hb5)))) ~^ $unsigned(wire0)) >>> $signed($signed(((&wire7) ?
                      (~&wire10) : (wire4 == wire10)))));
  assign wire12 = wire4[(1'h0):(1'h0)];
  module13 #() modinst77 (.wire14(wire4), .wire16(wire6), .wire15(wire0), .wire17(wire9), .clk(clk), .y(wire76));
  assign wire78 = ((($unsigned((wire11 >> wire5)) ?
                          $signed($unsigned(wire76)) : wire3[(2'h2):(1'h1)]) <<< (~|$unsigned(wire1[(1'h0):(1'h0)]))) ?
                      ({(&((8'ha6) ? wire3 : wire9))} >>> wire12) : wire8);
  always
    @(posedge clk) begin
      reg79 <= wire7;
      reg80 <= $signed($unsigned((^$unsigned(wire10[(3'h7):(3'h6)]))));
    end
  assign wire81 = $unsigned(reg80[(4'hd):(4'hc)]);
endmodule

module module13
#(parameter param75 = (-(-{(((8'h9d) ? (8'ha9) : (8'ha4)) ? ((8'ha1) ? (8'h9e) : (8'ha0)) : ((8'ha8) != (8'hbc)))})))
(y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire16;
  input wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire73;
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  assign y = {wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire73,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= (((($signed(wire15) ?
                      wire14[(1'h0):(1'h0)] : (wire17 & wire17)) ?
                  ((wire17 <<< wire17) && (wire16 - wire17)) : (~|wire14)) ?
              $unsigned($signed(wire17[(1'h1):(1'h1)])) : $unsigned(($unsigned(wire17) || $unsigned(wire15)))) ?
          $signed((~$unsigned($unsigned(wire14)))) : (^~wire16[(3'h5):(2'h3)]));
      reg19 <= (wire16[(4'h9):(3'h7)] ? $signed(wire16) : wire14);
    end
  assign wire20 = $unsigned((~|(reg19[(3'h6):(3'h4)] ?
                      (+(reg18 ? wire14 : reg18)) : {(wire15 & wire15)})));
  assign wire21 = ($unsigned({(wire20[(4'h9):(1'h0)] * wire17)}) != ($signed($unsigned((wire20 ?
                      wire15 : wire16))) != (~((8'h9c) ?
                      {reg19, wire15} : wire20))));
  assign wire22 = wire21[(4'hb):(4'h8)];
  assign wire23 = (((~&($signed(wire17) ?
                              (wire21 ? reg18 : wire21) : $signed(wire22))) ?
                          (wire22 ?
                              $signed((reg18 >> reg19)) : wire20[(3'h6):(2'h2)]) : (8'hba)) ?
                      wire20[(3'h5):(1'h1)] : wire22);
  assign wire24 = ((wire14[(2'h2):(2'h2)] ?
                          $unsigned($signed($signed(wire20))) : (^~$signed($unsigned((8'hb0))))) ?
                      wire21 : ({{$signed(wire16), (wire15 ? wire20 : wire22)},
                              $unsigned((wire17 >= reg18))} ?
                          ($unsigned((~&wire15)) || {(wire21 ?
                                  (8'hae) : wire17),
                              (^reg18)}) : wire14));
  assign wire25 = (wire14[(3'h7):(3'h4)] - $unsigned(wire23[(4'h9):(2'h3)]));
  module26 #() modinst74 (.wire30(reg18), .clk(clk), .y(wire73), .wire31(reg19), .wire27(wire25), .wire29(wire14), .wire28(wire21));
endmodule

module module26
#(parameter param71 = (({(((8'ha4) ? (8'hb9) : (8'hb4)) * ((8'hb8) << (8'ha7)))} ^~ (((!(8'hae)) ? ((8'hae) > (8'hb5)) : (8'ha3)) >> ({(8'hab)} ? ((7'h43) ? (8'haa) : (8'ha8)) : (|(8'hac))))) & (((((8'hb1) + (8'h9d)) ~^ ((7'h44) & (7'h43))) <<< {(-(8'ha1)), (-(8'hbc))}) ? ((^((8'hb2) <= (8'hab))) >> ((-(8'ha4)) ? ((8'hbf) ? (7'h44) : (8'hba)) : (~&(8'ha2)))) : ((~&((7'h43) ? (8'ha0) : (8'hb8))) ? (~((7'h43) >>> (8'hb2))) : ((+(8'h9d)) ? (~|(7'h41)) : ((8'hb1) ? (8'hb4) : (8'hb6)))))), 
parameter param72 = (param71 ? param71 : param71))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire32 = (~&((|((wire31 ?
                      (8'ha0) : (8'ha7)) & $unsigned(wire30))) & {$signed((7'h40))}));
  assign wire33 = wire29;
  assign wire34 = $signed(((~&wire32[(4'hc):(3'h6)]) ?
                      (^~({wire30, wire32} ?
                          ((8'hb5) ? wire32 : wire29) : (wire29 ?
                              (8'hb5) : (7'h40)))) : ((~&(-wire32)) ?
                          wire29[(2'h3):(1'h1)] : ((wire33 | wire29) ?
                              {wire33, wire29} : (wire31 ?
                                  (8'hbc) : (7'h40))))));
  assign wire35 = (~wire33);
  assign wire36 = (~^wire28);
  assign wire37 = wire33[(4'h9):(2'h2)];
  assign wire38 = $signed($unsigned(wire30[(1'h0):(1'h0)]));
  assign wire39 = $signed(wire38);
  assign wire40 = wire39;
  assign wire41 = wire31[(3'h4):(2'h3)];
  assign wire42 = $unsigned(($unsigned(wire29[(3'h6):(3'h6)]) | wire31[(4'ha):(1'h0)]));
  assign wire43 = $unsigned($signed(wire28));
  assign wire44 = $unsigned((~^wire32[(4'he):(2'h3)]));
  assign wire45 = (8'hab);
  always
    @(posedge clk) begin
      if ($signed(wire45[(3'h5):(1'h0)]))
        begin
          reg46 <= (~|{$signed((wire31[(3'h4):(1'h0)] >> $signed(wire43)))});
          reg47 <= ((~&{$unsigned(wire43[(2'h3):(1'h0)]),
                  wire34[(2'h2):(2'h2)]}) ?
              $signed((~|$signed(((8'ha7) ? wire40 : wire38)))) : wire37);
          reg48 <= wire27;
          reg49 <= $unsigned({((~&(wire32 & wire39)) ?
                  {wire35[(3'h6):(3'h4)]} : (~&(wire32 <<< wire31))),
              wire27});
        end
      else
        begin
          reg46 <= wire27;
          reg47 <= $signed($signed(wire41[(2'h2):(1'h1)]));
          if (((wire35[(2'h3):(2'h3)] + $unsigned(wire29[(1'h0):(1'h0)])) ?
              $signed((($signed(wire38) ?
                      (reg46 ? wire38 : wire28) : (wire33 ? wire33 : wire37)) ?
                  ($signed(wire27) ?
                      (wire32 ?
                          wire40 : reg47) : $signed(wire42)) : (~&(wire33 ?
                      reg46 : wire36)))) : $signed({(7'h41)})))
            begin
              reg48 <= ($unsigned({wire28, $signed($unsigned(wire36))}) ?
                  $unsigned(wire31[(2'h2):(2'h2)]) : (+((((8'ha4) && wire39) * (|(8'ha5))) ?
                      (wire32[(3'h7):(2'h3)] ~^ (^~wire36)) : wire35)));
            end
          else
            begin
              reg48 <= (({(wire43 && {wire29}), {(wire28 ^~ reg46)}} ?
                  (8'ha1) : {$signed($signed(wire33)),
                      (|{(7'h41)})}) ~^ $unsigned((((wire43 ?
                      wire41 : (8'hae)) ?
                  $signed(wire39) : reg49) ^ (!(wire31 <= (8'hb9))))));
              reg49 <= {wire42[(1'h1):(1'h0)],
                  ($signed($unsigned(wire36)) >= (~^reg48[(2'h2):(2'h2)]))};
              reg50 <= wire28[(1'h1):(1'h1)];
              reg51 <= $signed(reg50[(5'h12):(4'h9)]);
            end
          if ((^~wire31[(3'h5):(3'h4)]))
            begin
              reg52 <= wire45[(5'h12):(1'h0)];
              reg53 <= (reg47 ? wire32[(3'h7):(3'h7)] : wire34[(3'h5):(2'h2)]);
              reg54 <= (&reg47);
            end
          else
            begin
              reg52 <= wire36[(4'hd):(2'h2)];
              reg53 <= (wire38[(3'h7):(2'h2)] + wire32[(4'ha):(4'ha)]);
            end
        end
      reg55 <= (~&(&($unsigned(wire42) ?
          $signed(wire35[(2'h3):(1'h1)]) : ($unsigned(wire44) ?
              {(8'haf), wire42} : {wire32, wire32}))));
      if ((8'hbd))
        begin
          reg56 <= $unsigned(wire28);
          if ({((!{wire45}) - (!{(~&reg53), $signed(wire42)}))})
            begin
              reg57 <= (~&reg48[(2'h2):(1'h1)]);
            end
          else
            begin
              reg57 <= reg53[(3'h5):(2'h3)];
              reg58 <= $signed({$unsigned(((~|reg49) ?
                      (8'hbd) : wire33[(4'hb):(3'h5)])),
                  $signed({(wire37 ? (8'hae) : wire36)})});
              reg59 <= ((((|$signed(reg52)) >>> $unsigned({wire37, wire29})) ?
                  ($signed((wire29 >= wire31)) < wire35) : reg48) ~^ $unsigned($unsigned({$unsigned(wire33),
                  (|wire32)})));
              reg60 <= wire32[(4'h9):(2'h2)];
            end
          reg61 <= ((wire29 + ((^~$signed((8'h9e))) ?
                  (reg50 >>> (wire42 << (8'hba))) : (~&$unsigned((8'ha5))))) ?
              $unsigned({$signed((wire30 ?
                      wire39 : wire27))}) : $signed(reg46[(1'h0):(1'h0)]));
        end
      else
        begin
          if ((~(wire28[(3'h7):(3'h6)] ?
              {$unsigned((&reg52))} : $signed(wire39))))
            begin
              reg56 <= reg51[(3'h4):(3'h4)];
              reg57 <= wire32[(2'h2):(1'h0)];
              reg58 <= $unsigned({$signed((-wire36)),
                  $unsigned(wire28[(1'h1):(1'h0)])});
              reg59 <= ($unsigned(reg49[(4'h9):(2'h2)]) ?
                  $unsigned(reg58[(3'h5):(1'h1)]) : {$unsigned(((wire43 ?
                              reg52 : (8'hbc)) ?
                          $unsigned(reg61) : (reg46 ? (8'ha2) : wire31))),
                      $unsigned(reg57)});
            end
          else
            begin
              reg56 <= (~&(~^($signed(((8'hac) ? wire45 : reg46)) < (wire41 ?
                  $unsigned(wire44) : reg54[(1'h1):(1'h1)]))));
              reg57 <= $unsigned($signed($signed((reg61[(3'h6):(3'h4)] ?
                  (reg51 ? reg55 : (8'hb1)) : (8'hb1)))));
              reg58 <= reg61[(3'h4):(3'h4)];
              reg59 <= wire29;
              reg60 <= $signed(wire42[(1'h1):(1'h0)]);
            end
          reg61 <= $signed((((!$unsigned(reg49)) ?
                  wire45 : (!(wire40 | wire41))) ?
              wire29 : {$unsigned(reg46), ((8'ha9) + wire27[(4'hd):(3'h5)])}));
          reg62 <= ({{(-{reg51})}} | (((~|wire40) << (wire40 >>> (wire41 & reg50))) ^~ (|$signed(wire35[(4'h8):(2'h2)]))));
        end
      reg63 <= $unsigned($signed(reg50[(5'h13):(2'h2)]));
    end
  assign wire64 = wire33[(3'h6):(3'h4)];
  assign wire65 = reg62;
  assign wire66 = (~reg56);
  assign wire67 = (~^$signed(reg49));
  assign wire68 = reg50;
  assign wire69 = (wire66[(4'h8):(1'h0)] > $signed($signed($unsigned($signed(reg63)))));
  assign wire70 = $unsigned(($signed(reg48[(1'h0):(1'h0)]) ?
                      wire36[(4'ha):(3'h7)] : (8'hbb)));
endmodule

module top
#(parameter param88 = ((-(-{(^~(8'ha4))})) ? (^(({(8'hb7), (7'h42)} ? (~^(8'hab)) : ((7'h43) >= (8'hae))) * (((8'hb9) + (8'had)) ? {(7'h41), (8'hab)} : ((8'hb4) ? (8'hae) : (8'had))))) : ((8'hab) ? ((((8'hab) ? (8'had) : (8'hb7)) ? (+(8'ha3)) : ((8'hbb) ? (8'ha5) : (7'h40))) ? (~&(~(7'h41))) : ((&(8'ha7)) ? ((8'ha0) > (8'haa)) : (~&(8'hbe)))) : (((^(8'hac)) ? ((8'hb6) == (8'ha5)) : (~&(8'hba))) | (((8'ha8) ? (8'ha2) : (8'ha1)) ? (|(8'hb7)) : ((8'hb2) ? (8'h9c) : (8'hab)))))), 
parameter param89 = (&{(8'hb7), param88}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire7,
                 wire6,
                 wire5,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg8,
                 (1'h0)};
  assign wire5 = (!(~wire4[(3'h4):(1'h0)]));
  assign wire6 = $signed(wire1[(3'h5):(1'h0)]);
  assign wire7 = wire6[(4'hc):(3'h4)];
  always
    @(posedge clk) begin
      reg8 <= (^~((~wire6[(4'hd):(4'hc)]) ?
          wire1[(2'h3):(2'h2)] : wire5[(1'h0):(1'h0)]));
    end
  module9 #() modinst72 (wire71, clk, wire1, reg8, wire2, wire7, wire3);
  assign wire73 = $unsigned((8'ha9));
  assign wire74 = ((wire3[(4'h8):(4'h8)] ?
                      (8'h9d) : (wire5 ^~ $unsigned(wire7))) || (wire6[(3'h6):(3'h6)] ?
                      (~|((wire73 ~^ (8'ha8)) << $unsigned(wire0))) : (((^wire6) ?
                          (+reg8) : wire0) ~^ (wire7 ?
                          (wire1 ? wire71 : wire6) : (8'hbe)))));
  assign wire75 = wire1;
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire7)))
        begin
          if ((($signed(reg8) <<< ({wire2, wire4} ^~ (8'hae))) != wire4))
            begin
              reg76 <= wire75[(1'h1):(1'h0)];
              reg77 <= wire5[(1'h1):(1'h0)];
              reg78 <= wire3[(1'h0):(1'h0)];
              reg79 <= $unsigned($signed((~|(|(wire7 ? (8'hac) : reg76)))));
              reg80 <= {$unsigned((({reg77} <= $unsigned(wire0)) == $unsigned((reg78 * reg79)))),
                  ({wire3, (^~wire5)} ?
                      {wire0[(4'h8):(2'h3)]} : {$signed(wire73),
                          ($unsigned(wire1) ?
                              (~&wire1) : wire7[(4'he):(4'h8)])})};
            end
          else
            begin
              reg76 <= {reg79[(1'h0):(1'h0)]};
            end
          if ((8'h9e))
            begin
              reg81 <= $signed(reg78[(1'h0):(1'h0)]);
              reg82 <= reg80[(4'h8):(3'h5)];
            end
          else
            begin
              reg81 <= (~|($signed(wire7[(1'h1):(1'h0)]) < ((reg77 ?
                  wire73[(2'h3):(1'h1)] : (+reg77)) ^ ((wire74 <<< wire73) ?
                  (wire4 | wire6) : (wire3 ? reg82 : wire7)))));
              reg82 <= $signed(wire73[(2'h2):(2'h2)]);
              reg83 <= reg81;
              reg84 <= ((!$unsigned($unsigned(wire6[(4'hd):(3'h5)]))) ?
                  wire6 : $unsigned($unsigned((~|(wire0 ? wire6 : wire7)))));
              reg85 <= $unsigned((reg79 ^~ $unsigned($signed(wire74[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          reg76 <= (^~{(~&wire75[(1'h1):(1'h1)]),
              (($signed(reg76) ? $unsigned(reg78) : (reg81 >> (7'h43))) ?
                  $signed($signed(wire75)) : (((8'hac) ? reg79 : wire6) ?
                      (wire73 ? (8'hb9) : (7'h42)) : (wire73 ?
                          (8'hbb) : reg79)))});
          reg77 <= (wire7 ?
              (reg82[(4'h8):(3'h6)] ?
                  {(^$unsigned(reg78)),
                      {$signed(reg78)}} : (!(|reg79))) : wire73);
          if ((wire1[(2'h2):(2'h2)] ?
              $unsigned((~$unsigned((reg81 != reg83)))) : (~|wire7[(3'h4):(2'h2)])))
            begin
              reg78 <= (($signed($unsigned({wire1, (8'hb6)})) ?
                      $signed(($unsigned(reg79) ?
                          (|wire6) : (!wire3))) : reg76[(3'h5):(3'h5)]) ?
                  wire2 : (~&$unsigned(reg85)));
              reg79 <= $signed(reg77);
            end
          else
            begin
              reg78 <= (~^(wire1[(3'h4):(1'h1)] ?
                  reg81 : (wire1[(4'hc):(4'hc)] ^ ($unsigned(wire6) ?
                      $signed(wire74) : (reg77 ^ wire74)))));
            end
          reg80 <= ((~^(((^~wire7) <= $signed((8'hba))) ?
              $unsigned((+reg85)) : {{(7'h42)}})) + $signed(wire3));
        end
    end
  assign wire86 = $unsigned($unsigned(($unsigned((reg78 >> (7'h41))) - $signed(((8'hba) ?
                      reg82 : wire74)))));
  assign wire87 = {(wire73[(2'h3):(2'h2)] ?
                          (((wire0 <= wire2) ? (+reg79) : (wire1 & wire71)) ?
                              (reg82[(5'h10):(4'hf)] >= (reg78 ?
                                  (8'ha3) : wire4)) : $unsigned(wire75[(2'h3):(1'h0)])) : $signed((!{wire7,
                              wire3}))),
                      reg83[(4'hf):(1'h0)]};
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire61;
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  assign y = {wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire61,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg26,
                 (1'h0)};
  assign wire15 = $signed(wire12);
  assign wire16 = $unsigned($unsigned(wire13));
  assign wire17 = (((+(-$signed(wire16))) >> $signed(wire16)) != wire13);
  assign wire18 = (^(wire17 == ($signed((wire16 ? wire13 : wire10)) ?
                      $signed({wire12, (7'h42)}) : $unsigned({wire15,
                          wire14}))));
  assign wire19 = wire15[(3'h6):(2'h3)];
  assign wire20 = wire14;
  assign wire21 = $signed(($unsigned({(wire16 ^~ wire14)}) ?
                      $unsigned(wire19) : {$signed($signed(wire11)),
                          $signed($signed(wire13))}));
  assign wire22 = (7'h43);
  assign wire23 = (wire21[(1'h0):(1'h0)] && $signed(wire18));
  assign wire24 = wire14;
  assign wire25 = ((!wire16) == (|((~wire15[(1'h0):(1'h0)]) >= $unsigned((-wire14)))));
  always
    @(posedge clk) begin
      reg26 <= wire13;
    end
  module27 #() modinst62 (.wire28(wire16), .y(wire61), .wire29(wire10), .wire30(wire11), .wire32(wire20), .wire31(wire25), .clk(clk));
  always
    @(posedge clk) begin
      if (((~^(^~(^~(~&wire23)))) ?
          ((((-wire10) ? $signed(wire14) : wire17[(3'h7):(3'h4)]) ?
              (8'ha0) : wire21[(4'hd):(4'hb)]) | wire14[(3'h7):(2'h3)]) : ($unsigned($signed($unsigned(wire12))) * (((~^(8'ha3)) ^ $signed(wire23)) ?
              $signed((^wire21)) : (((8'hbc) ? wire22 : (8'ha2)) ?
                  (!wire21) : (wire12 * wire16))))))
        begin
          reg63 <= $unsigned($unsigned((wire18[(1'h0):(1'h0)] ?
              $unsigned((wire18 ?
                  wire24 : (8'hae))) : $unsigned($signed(wire13)))));
          reg64 <= wire61[(4'h9):(3'h7)];
          reg65 <= $signed((~&wire11));
          reg66 <= wire21;
        end
      else
        begin
          reg63 <= (wire18 ?
              (reg66[(1'h0):(1'h0)] ?
                  (^~wire20[(3'h5):(2'h3)]) : (wire14[(1'h0):(1'h0)] ?
                      (~$signed(reg64)) : $unsigned(((8'ha4) ?
                          (8'ha6) : wire24)))) : (^reg66));
          reg64 <= $unsigned((!(wire22 ?
              {$unsigned(wire16)} : $signed($unsigned(reg26)))));
          reg65 <= $signed(wire16[(2'h2):(2'h2)]);
          reg66 <= reg65;
          if ({$signed(wire18), (reg63[(3'h6):(1'h1)] ^ reg26[(5'h11):(2'h3)])})
            begin
              reg67 <= wire22;
              reg68 <= (~(+(8'hb4)));
              reg69 <= ($unsigned({wire16}) ^ {wire24});
            end
          else
            begin
              reg67 <= {(((^((8'ha7) ? wire18 : reg26)) ^~ {(!wire12),
                          wire61}) ?
                      ($signed((wire14 ? (7'h41) : reg64)) ^ ((wire18 | reg65) ?
                          (~&wire25) : $unsigned(wire12))) : $signed(((reg67 ^~ reg63) ?
                          $unsigned(wire20) : reg63))),
                  (~|$signed(((wire22 >>> wire18) ? {wire25} : wire13)))};
            end
        end
    end
  always
    @(posedge clk) begin
      reg70 <= ($unsigned($unsigned($unsigned({reg65,
          wire16}))) <<< reg63[(1'h0):(1'h0)]);
    end
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(3'h7):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire33 = (^wire31);
  assign wire34 = (($signed((-$unsigned((8'ha9)))) <= {(wire28[(3'h4):(3'h4)] || $signed((8'ha2))),
                      wire31[(3'h7):(3'h4)]}) >>> $signed(wire30[(1'h0):(1'h0)]));
  assign wire35 = $signed(wire34);
  assign wire36 = wire31[(4'ha):(3'h6)];
  assign wire37 = (8'ha3);
  assign wire38 = $signed(wire37);
  assign wire39 = $signed(($unsigned({$unsigned(wire37)}) & wire31[(4'hb):(4'h9)]));
  assign wire40 = ((8'ha1) ~^ (~&wire36));
  assign wire41 = $signed((($unsigned($signed(wire30)) ?
                          $signed($signed(wire34)) : $signed((-wire28))) ?
                      (wire39 ? wire37 : wire35) : (8'h9d)));
  assign wire42 = (8'hb8);
  assign wire43 = (((~{$unsigned(wire39),
                      $unsigned((8'ha8))}) >= (^{(wire37 + wire34)})) ^~ $signed(wire35[(1'h0):(1'h0)]));
  assign wire44 = wire43[(1'h1):(1'h1)];
  assign wire45 = wire31;
  always
    @(posedge clk) begin
      reg46 <= wire36[(3'h5):(1'h0)];
      reg47 <= (~|$unsigned((((wire44 ?
          wire35 : wire28) & (wire43 <<< wire30)) ^ wire33)));
      reg48 <= ((($signed($signed((8'haf))) >= (|(wire29 ? wire36 : wire30))) ?
              (~|wire30) : (+(wire43[(2'h3):(2'h2)] == reg46[(4'ha):(3'h7)]))) ?
          (~|(|wire37[(5'h10):(3'h6)])) : $signed((wire38[(1'h1):(1'h1)] - wire39)));
      if ((~^(^~(^~(+wire33)))))
        begin
          if ($signed((({$unsigned(wire40), wire31[(3'h5):(3'h5)]} ?
              (!(wire39 && wire44)) : $unsigned((wire45 ?
                  wire39 : wire43))) & wire29)))
            begin
              reg49 <= wire37;
              reg50 <= $signed((-$signed($unsigned((wire35 ?
                  wire29 : wire43)))));
              reg51 <= ((^~(wire28[(3'h4):(2'h2)] && wire42)) ?
                  $signed($unsigned(wire36[(1'h1):(1'h1)])) : wire31);
            end
          else
            begin
              reg49 <= wire34[(4'h8):(2'h2)];
              reg50 <= wire36;
              reg51 <= ((8'ha1) & (wire42 ? (~|wire40[(3'h6):(1'h0)]) : reg50));
            end
          if ($signed(($unsigned((!wire29[(4'hc):(2'h3)])) ?
              (&$signed($unsigned((8'hab)))) : (wire38[(2'h3):(2'h3)] ?
                  reg50 : (8'hab)))))
            begin
              reg52 <= wire35;
            end
          else
            begin
              reg52 <= (((-wire34[(3'h5):(3'h4)]) ?
                      (($unsigned(wire36) ?
                          $unsigned(wire45) : ((7'h40) ?
                              wire42 : reg52)) ^ {$unsigned(wire29),
                          (wire38 >>> wire39)}) : wire41[(1'h0):(1'h0)]) ?
                  ((&(7'h41)) ?
                      $unsigned((~$signed(wire42))) : reg46[(4'hf):(2'h3)]) : {$signed(($signed(wire35) != ((8'ha3) ?
                          wire40 : wire41))),
                      wire31});
            end
        end
      else
        begin
          reg49 <= (^~reg50);
          reg50 <= ((((&reg49) + $signed((&wire36))) <<< (7'h41)) ?
              ((($unsigned(wire29) ~^ reg50) != wire31[(4'h8):(1'h1)]) ?
                  $signed($unsigned((7'h41))) : $unsigned((reg52 ?
                      $unsigned(wire44) : (wire37 < wire41)))) : wire31);
          reg51 <= ((-$signed(wire42[(2'h3):(2'h2)])) ?
              (-wire31) : $unsigned(wire29));
        end
      reg53 <= $unsigned($signed((!$unsigned({reg50}))));
    end
  assign wire54 = wire43;
  assign wire55 = (wire34 ?
                      $unsigned($signed($unsigned((^wire28)))) : reg49[(2'h2):(1'h1)]);
  assign wire56 = ({(reg53[(3'h5):(3'h5)] ~^ (8'hae)),
                      (-$unsigned(wire37[(1'h0):(1'h0)]))} < {(((~(8'hb8)) << wire30) ?
                          (wire34[(3'h4):(3'h4)] ?
                              {wire28,
                                  reg53} : (wire35 ~^ wire31)) : wire42[(4'hb):(2'h3)]),
                      $unsigned(wire54)});
  assign wire57 = ((&reg46[(5'h14):(4'hf)]) & $signed((wire55[(3'h5):(3'h5)] ?
                      ((8'hb2) ?
                          reg50 : (wire33 ?
                              wire32 : wire37)) : {(reg53 && reg47)})));
  assign wire58 = (((wire37[(4'hd):(3'h5)] + reg52) ?
                          $unsigned(((+(8'hb3)) ^~ (wire39 >> wire54))) : $unsigned({(+wire40),
                              ((8'ha4) ? wire45 : (8'hb4))})) ?
                      {wire33[(3'h6):(3'h5)]} : reg47);
  assign wire59 = wire54[(4'h9):(1'h0)];
  assign wire60 = (wire31[(5'h14):(5'h11)] ^ reg49[(2'h2):(2'h2)]);
endmodule

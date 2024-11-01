module top
#(parameter param99 = ((8'hab) * (({((8'hac) ? (8'hab) : (8'hbf))} ? (((8'ha8) ? (8'hb3) : (8'had)) ^ ((8'h9c) - (8'ha5))) : (((8'ha2) ^ (8'ha2)) ? ((8'ha9) & (8'hb8)) : (-(8'h9c)))) <<< (^{((8'hae) & (8'ha0)), ((7'h44) ? (8'hb7) : (8'hb8))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(4'hb):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire91;
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire4,
                 wire5,
                 wire91,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire3;
  module6 #() modinst92 (wire91, clk, wire5, wire4, wire2, wire0, wire1);
  assign wire93 = {($signed(wire3) << (((~&wire4) ?
                              ((8'hbd) >>> wire4) : wire4) ?
                          ((&wire2) ~^ (wire1 ? wire2 : wire0)) : {{wire91,
                                  wire5},
                              wire5[(2'h3):(1'h0)]}))};
  assign wire94 = wire5[(2'h2):(2'h2)];
  assign wire95 = wire5;
  assign wire96 = $signed((((8'h9e) ?
                      wire1[(3'h5):(2'h2)] : $signed($signed(wire91))) < $signed((~wire2))));
  assign wire97 = ($signed(wire3[(2'h3):(2'h3)]) ?
                      (((wire91[(1'h1):(1'h1)] ?
                                  wire2[(4'h8):(3'h7)] : (^wire5)) ?
                              ({wire96} >> $signed(wire93)) : (!$signed(wire95))) ?
                          (~wire96) : $unsigned((wire3[(1'h0):(1'h0)] * (wire1 ?
                              wire4 : wire91)))) : wire93);
  assign wire98 = wire0;
endmodule

module module6
#(parameter param90 = ((((((8'hbe) ^ (8'hb3)) ^~ ((8'hb0) ? (8'hb2) : (8'hb5))) - ({(8'haa), (8'ha3)} >>> ((8'hb3) | (8'ha8)))) || ((((8'hb9) << (8'haa)) << ((8'hb7) ? (8'had) : (8'hbe))) > {(-(7'h41))})) > {((+((7'h41) ? (8'hb8) : (8'ha1))) ? ({(8'ha2), (7'h40)} - ((8'ha9) ? (8'hbc) : (8'hae))) : (((8'ha1) ? (8'hb3) : (8'hbf)) || ((8'hb9) ? (8'hb3) : (8'ha3)))), (7'h42)}))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire33;
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire81,
                 wire80,
                 wire79,
                 wire59,
                 wire57,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire33,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (!(wire10[(3'h5):(2'h2)] > $unsigned((!(wire8 <<< wire10)))));
    end
  assign wire13 = reg12[(2'h2):(1'h0)];
  assign wire14 = ((&reg12[(3'h6):(3'h5)]) != wire9);
  assign wire15 = (~|$unsigned((8'ha4)));
  assign wire16 = (wire9 * ({$unsigned((wire9 && wire14)),
                      {(wire14 ? wire11 : wire8),
                          wire8[(4'h8):(3'h5)]}} != (($unsigned((8'h9f)) | wire10[(4'h8):(2'h3)]) > wire9[(2'h2):(1'h0)])));
  assign wire17 = $signed(reg12[(2'h3):(1'h0)]);
  assign wire18 = $signed({wire13[(4'hb):(4'h9)]});
  assign wire19 = {$signed($unsigned({{wire16}})),
                      ((wire7[(3'h5):(2'h3)] >= wire14[(1'h1):(1'h0)]) | $signed((8'h9c)))};
  assign wire20 = wire11[(2'h2):(1'h1)];
  module21 #() modinst34 (.wire24(wire14), .y(wire33), .wire25(reg12), .clk(clk), .wire23(wire10), .wire22(wire17));
  module35 #() modinst58 (.y(wire57), .wire36(wire10), .wire38(wire11), .wire40(wire19), .wire37(reg12), .clk(clk), .wire39(wire18));
  assign wire59 = ($signed(wire14) ^~ wire19[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned((~^(wire18 ?
          ($unsigned(wire17) ?
              (|(7'h41)) : wire17[(5'h14):(1'h0)]) : $signed(reg12)))))
        begin
          if ({{wire59, wire15[(4'hd):(4'hb)]}})
            begin
              reg60 <= $signed(wire57[(3'h5):(3'h4)]);
            end
          else
            begin
              reg60 <= ($unsigned({wire15}) ?
                  $signed((wire9 >= ({reg60} ?
                      (-wire19) : (+wire11)))) : $unsigned($signed((+wire33[(3'h5):(3'h4)]))));
              reg61 <= {(~^($signed(((7'h42) ?
                      wire10 : wire57)) ^~ ($unsigned(wire17) ?
                      wire33 : (^wire11)))),
                  (|$signed($signed(wire15)))};
            end
          reg62 <= ((|wire20) < wire18);
          reg63 <= $unsigned({(((~^wire10) ?
                  (wire10 >= reg12) : $signed(wire33)) <<< (wire14 ?
                  {wire59} : (8'hb5))),
              $unsigned($signed((wire17 ? reg12 : reg12)))});
          reg64 <= {(reg61 ?
                  wire10[(4'he):(3'h7)] : ((^~wire9[(2'h3):(1'h1)]) ?
                      ({(8'ha8)} ?
                          (!(8'hb8)) : $unsigned((8'h9f))) : wire7[(2'h2):(1'h1)]))};
          reg65 <= ((reg60 ?
              wire19 : (~&(~^(wire11 <= wire8)))) << $unsigned(wire15[(4'h9):(4'h8)]));
        end
      else
        begin
          if ($signed($unsigned(reg63[(2'h3):(2'h2)])))
            begin
              reg60 <= wire20;
              reg61 <= {(^$unsigned(wire57[(4'h9):(3'h5)]))};
              reg62 <= wire14[(1'h1):(1'h1)];
            end
          else
            begin
              reg60 <= (|(&$unsigned(((wire18 != reg64) || (wire15 >>> reg62)))));
              reg61 <= $signed($unsigned($unsigned($unsigned(wire9))));
              reg62 <= wire11;
              reg63 <= $unsigned($signed((wire33 + {(reg63 | reg12)})));
            end
          if (((wire11[(4'hb):(1'h0)] ?
              ((reg63[(4'h8):(1'h1)] ?
                  (-reg61) : (~reg64)) >= ($signed(wire17) ?
                  (wire13 ?
                      (8'hbb) : wire17) : (wire17 << wire33))) : (wire11 >>> (~^(wire18 | (8'ha9))))) && (!(^(wire10 + $signed(wire8))))))
            begin
              reg64 <= $unsigned($signed($signed((wire16 ?
                  wire59 : reg60[(2'h2):(1'h1)]))));
              reg65 <= ((8'h9c) >= $unsigned(wire10[(4'hb):(4'ha)]));
              reg66 <= wire17[(5'h14):(5'h12)];
              reg67 <= (-((+$signed(wire7)) ?
                  $unsigned($unsigned((^~wire10))) : ($unsigned($unsigned(wire15)) ?
                      $unsigned((wire17 >> wire8)) : $unsigned(reg12[(3'h4):(2'h2)]))));
              reg68 <= wire17[(5'h13):(4'hd)];
            end
          else
            begin
              reg64 <= reg62[(4'h9):(3'h4)];
              reg65 <= {$unsigned((((wire7 ? wire18 : wire14) ?
                          $unsigned(wire19) : {reg61}) ?
                      wire57 : wire20[(2'h3):(2'h3)])),
                  (~{((~reg66) + reg61[(4'h9):(2'h3)])})};
            end
          reg69 <= ((($unsigned(reg65[(3'h6):(1'h0)]) + reg67[(3'h6):(3'h6)]) ?
                  (^~$signed(reg65)) : ($unsigned($unsigned(reg63)) ^~ (reg68 ?
                      {reg61, reg60} : (reg62 ^~ wire8)))) ?
              ($signed((reg68[(2'h2):(2'h2)] ?
                  {wire20} : $unsigned(wire8))) << {wire33[(4'hd):(4'hd)]}) : wire17);
          reg70 <= $signed(wire57);
        end
      if (wire33)
        begin
          reg71 <= (~^({$signed($signed(wire15)),
                  ((reg66 ? wire20 : reg64) >> (8'hb9))} ?
              wire9[(3'h4):(2'h3)] : wire57[(4'h8):(3'h5)]));
          if ($unsigned((~(^$unsigned({wire19, wire9})))))
            begin
              reg72 <= ((+(^({reg62, reg71} < (8'hbd)))) ?
                  $signed(wire16) : (wire10[(4'h8):(4'h8)] ?
                      {(~wire10),
                          (wire19[(5'h10):(4'hd)] ?
                              (reg63 ?
                                  wire17 : reg65) : (^wire19))} : ($unsigned((wire59 | (8'had))) <= reg63)));
              reg73 <= $signed($unsigned((($unsigned(reg65) ?
                  $signed(wire15) : (~reg63)) ^ (reg68[(3'h4):(1'h0)] ^~ $unsigned((8'h9f))))));
              reg74 <= wire15;
            end
          else
            begin
              reg72 <= wire9[(2'h2):(2'h2)];
              reg73 <= wire20;
              reg74 <= $signed(reg72[(4'he):(2'h3)]);
            end
        end
      else
        begin
          reg71 <= $unsigned((-{$unsigned((~|reg71))}));
          reg72 <= $unsigned(reg71);
        end
      reg75 <= $signed({$signed(reg61[(4'hd):(4'h9)]),
          (((wire33 >> wire57) ?
              $signed(reg71) : {wire57, (8'hbb)}) * wire13)});
    end
  always
    @(posedge clk) begin
      reg76 <= reg64;
      reg77 <= wire15;
      reg78 <= $unsigned(($unsigned(((reg73 ?
          wire59 : reg75) & wire8)) <= wire13));
    end
  assign wire79 = {reg69, $unsigned((!$unsigned(reg61[(1'h0):(1'h0)])))};
  assign wire80 = ({reg72[(4'h9):(2'h3)],
                          ($signed({wire10}) >>> (!(reg71 << wire79)))} ?
                      {(~^$signed((^~wire14))), reg69[(4'h9):(2'h3)]} : wire18);
  assign wire81 = ((^~reg73[(4'h9):(3'h7)]) ? wire8 : reg60[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg82 <= reg69[(4'hc):(3'h7)];
      reg83 <= {reg67};
      if (reg77)
        begin
          reg84 <= (!($unsigned($unsigned(reg12[(4'h8):(1'h0)])) ?
              $unsigned($signed(reg66[(1'h0):(1'h0)])) : {$unsigned(wire17)}));
        end
      else
        begin
          reg84 <= wire10;
          if ((!{(((^reg73) ? $signed((8'hb8)) : $unsigned(reg76)) ?
                  (|(!reg75)) : $unsigned((8'h9d)))}))
            begin
              reg85 <= $unsigned(wire80[(2'h3):(1'h1)]);
              reg86 <= ($signed((wire18[(3'h6):(2'h2)] ?
                      {(wire81 > reg76)} : (+(reg83 ? reg70 : (8'ha7))))) ?
                  ({reg84} ^ (8'hba)) : reg71[(3'h4):(1'h0)]);
              reg87 <= reg84[(1'h1):(1'h0)];
            end
          else
            begin
              reg85 <= $unsigned(reg87);
              reg86 <= (~$unsigned((~^((|wire20) <<< (reg70 << wire18)))));
            end
        end
    end
  assign wire88 = reg62[(4'h9):(4'h9)];
  assign wire89 = ((reg78[(3'h6):(2'h3)] ?
                      ((^~{reg73}) ?
                          reg63 : wire7[(3'h4):(1'h1)]) : $signed(reg68)) >>> $signed($signed(wire15)));
endmodule

module module35
#(parameter param55 = ((8'hbc) ? (-(((8'haf) ? ((8'ha5) ? (8'h9e) : (8'hb7)) : {(7'h41), (7'h42)}) - ((8'haa) <<< (-(8'ha0))))) : {(({(8'hb4), (8'h9e)} ? ((8'h9c) ? (8'hb0) : (8'haf)) : (^(8'hb0))) ? ((~^(8'hbd)) ? ((8'hb0) ^~ (8'hbe)) : ((8'hb7) ? (8'hba) : (8'hba))) : (((8'hb7) ? (8'hb6) : (7'h43)) ? {(8'hac)} : ((8'ha8) ? (8'hab) : (8'hb4))))}), 
parameter param56 = (~(8'hae)))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(4'he):(1'h0)] wire38;
  input wire [(3'h6):(1'h0)] wire37;
  input wire [(3'h7):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire41 = wire40[(3'h5):(2'h2)];
  assign wire42 = wire38;
  assign wire43 = wire42[(3'h5):(2'h2)];
  assign wire44 = wire36;
  assign wire45 = (wire36 && (((8'ha0) ? wire36[(2'h2):(1'h1)] : wire44) ?
                      $unsigned({(~^wire38)}) : ((~|{wire37, wire37}) ?
                          wire42 : $signed(wire40[(5'h10):(3'h5)]))));
  assign wire46 = $unsigned($unsigned($signed($unsigned((^wire45)))));
  assign wire47 = $unsigned(($signed($signed({wire45})) != (8'hac)));
  always
    @(posedge clk) begin
      reg48 <= (!(wire43 ? $unsigned(wire43[(4'hb):(4'h9)]) : wire46));
      reg49 <= wire39[(4'hf):(4'hc)];
      reg50 <= (((8'h9d) ?
          wire36[(3'h5):(2'h3)] : (($unsigned(wire38) >= $signed(wire44)) ?
              (~(|reg49)) : wire46)) >= ((wire38[(4'hc):(3'h6)] ?
          {{(8'hba), reg49},
              (8'hae)} : wire36[(3'h4):(2'h2)]) + $unsigned($signed($signed(wire40)))));
      if (wire37)
        begin
          reg51 <= wire38[(1'h0):(1'h0)];
          reg52 <= $signed(wire40);
          reg53 <= $unsigned(wire39[(2'h2):(1'h1)]);
          reg54 <= $unsigned(wire44);
        end
      else
        begin
          reg51 <= {wire47};
          reg52 <= ({{$unsigned((reg51 ? reg50 : (8'h9e))), (8'hbf)},
                  $signed(($unsigned(wire45) != {wire43}))} ?
              (wire39 ?
                  ($signed(reg49) ?
                      $unsigned(reg48) : $signed(((8'h9c) ?
                          wire44 : reg53))) : $unsigned($signed((wire36 ?
                      reg52 : (8'hb8))))) : (8'hb5));
        end
    end
endmodule

module module21
#(parameter param31 = {{((((8'ha6) >= (8'h9c)) ? ((8'hba) >>> (8'ha1)) : ((8'hac) >>> (8'ha8))) ? {((8'hb1) <<< (8'hac))} : ((~(7'h43)) ~^ ((8'h9e) ~^ (8'hb6)))), (~|((-(8'ha0)) + (|(8'hbf))))}}, 
parameter param32 = param31)
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  input wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  assign y = {wire29, wire28, wire27, wire26, reg30, (1'h0)};
  assign wire26 = $signed((+(($unsigned(wire24) ? $signed(wire25) : wire22) ?
                      wire25[(3'h7):(3'h6)] : {(+wire22)})));
  assign wire27 = ((^~$signed((^~{wire25, (8'had)}))) ?
                      $unsigned((wire24[(3'h5):(1'h0)] >>> wire23[(2'h2):(1'h0)])) : (((~|(wire26 ?
                              wire22 : wire23)) && $unsigned($unsigned(wire25))) ?
                          $signed((-(|wire22))) : $signed({(~|wire25),
                              (wire22 ? wire22 : wire24)})));
  assign wire28 = wire26[(1'h1):(1'h1)];
  assign wire29 = wire25[(4'hd):(4'h8)];
  always
    @(posedge clk) begin
      reg30 <= {(-(~&wire24[(3'h4):(3'h4)])),
          (((8'hbf) <<< (^~$unsigned(wire26))) | ((!(~&wire25)) ?
              (7'h41) : (wire24 ? ((8'ha0) || (8'hbe)) : $signed((8'hb6)))))};
    end
endmodule

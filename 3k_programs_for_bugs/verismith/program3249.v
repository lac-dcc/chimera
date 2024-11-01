module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(2'h3):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire84;
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire44,
                 wire47,
                 wire48,
                 wire49,
                 wire84,
                 reg46,
                 (1'h0)};
  module5 #() modinst45 (.wire8(wire1), .wire9(wire0), .wire7(wire4), .clk(clk), .y(wire44), .wire6(wire3), .wire10(wire2));
  always
    @(posedge clk) begin
      reg46 <= $signed((wire0 ?
          ((8'ha2) >>> (|(wire1 ?
              wire1 : wire4))) : ($signed((wire44 || wire2)) ?
              wire1[(2'h2):(1'h1)] : (+$signed(wire1)))));
    end
  assign wire47 = (reg46 | $signed($signed(wire44[(1'h0):(1'h0)])));
  assign wire48 = wire0[(4'hb):(1'h1)];
  assign wire49 = wire0;
  module50 #() modinst85 (wire84, clk, wire47, reg46, wire3, wire0);
  assign wire86 = wire49[(3'h4):(1'h1)];
  assign wire87 = (+(($unsigned(wire86) ?
                          {{reg46, wire2},
                              wire86} : $unsigned(((8'hb0) >>> (8'had)))) ?
                      ((((8'ha1) ?
                          wire49 : (8'hbd)) + wire86) & wire49) : ($unsigned($signed(wire47)) ^~ {$unsigned(wire84)})));
  assign wire88 = {$unsigned((|((wire44 ? wire4 : wire3) ?
                          $signed((8'hac)) : $signed((8'ha1))))),
                      $signed((8'hbe))};
  assign wire89 = (wire86 ? wire2 : {(!wire44), wire86});
endmodule

module module50
#(parameter param82 = (({{((8'hb2) < (8'haa)), ((8'hbb) ? (8'haf) : (8'h9d))}, {{(8'hb2)}, ((8'ha8) <= (8'ha7))}} * (|(((8'hae) ? (7'h42) : (8'had)) == {(8'ha8)}))) ? (({{(8'hae)}} ? ({(8'ha6)} ? ((7'h41) >>> (8'haf)) : ((8'ha2) ? (8'hac) : (8'hab))) : {(~(8'h9f)), ((7'h43) ? (8'ha9) : (7'h42))}) >= ((|((8'hb6) ? (8'hbb) : (8'hb9))) ? ((^~(8'h9c)) ? ((8'hbd) ~^ (8'hab)) : ((8'haf) ? (8'h9d) : (8'hb8))) : ((&(8'haf)) ? ((8'hbe) - (8'ha5)) : ((8'hbb) ? (8'hb4) : (8'h9f))))) : ({((~^(8'haa)) > ((8'ha8) <<< (8'hba)))} ? (7'h43) : (~(((8'hb9) >> (8'hb0)) ? (&(8'hbd)) : (|(8'hb5)))))), 
parameter param83 = ((|(~^param82)) >> (^~(-param82))))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire54;
  input wire signed [(5'h13):(1'h0)] wire53;
  input wire [(5'h15):(1'h0)] wire52;
  input wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire55;
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire58,
                 wire57,
                 wire55,
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
                 reg59,
                 reg56,
                 (1'h0)};
  assign wire55 = wire52[(5'h12):(4'hc)];
  always
    @(posedge clk) begin
      reg56 <= {wire55[(2'h2):(1'h0)]};
    end
  assign wire57 = (($signed((~$unsigned(wire51))) ?
                      (((wire55 ? wire53 : wire51) ?
                              (reg56 ? wire55 : wire51) : wire51) ?
                          $signed($signed((8'ha9))) : $unsigned(((8'hb9) ?
                              wire55 : wire51))) : (($signed(wire53) ?
                          $signed((7'h44)) : (wire54 ?
                              (7'h44) : wire53)) + (~&wire53[(4'h8):(2'h2)]))) == (7'h41));
  assign wire58 = wire55;
  always
    @(posedge clk) begin
      reg59 <= (($signed((^$unsigned(wire52))) <= $unsigned($unsigned(wire51[(3'h4):(1'h1)]))) | {wire51,
          ($unsigned((wire58 ? wire53 : wire58)) ?
              wire58 : reg56[(3'h6):(1'h1)])});
      reg60 <= $signed($unsigned({wire52, {$signed(wire53)}}));
      reg61 <= $signed(((wire57 >= wire55[(1'h0):(1'h0)]) >= (~^wire58[(2'h2):(2'h2)])));
      if (($signed($signed($signed((reg59 ^~ wire53)))) ?
          (wire51 - reg61) : {$signed((~&{(8'hae)}))}))
        begin
          reg62 <= ((((-{reg61}) ?
              (~|$unsigned((8'ha8))) : ($signed(wire52) * $unsigned((8'hac)))) || reg59) != wire55);
          if ((8'hb4))
            begin
              reg63 <= $unsigned(({$unsigned(wire57)} ?
                  ($signed($unsigned((8'hb4))) >>> {reg60,
                      (wire57 ? wire57 : (8'ha6))}) : {{wire58[(2'h2):(2'h2)]},
                      reg62}));
              reg64 <= $unsigned({(wire57 ?
                      $unsigned($signed(wire57)) : wire55)});
              reg65 <= (~|$signed(reg59));
              reg66 <= (((^$unsigned($unsigned(wire55))) ?
                  ($unsigned((reg59 ?
                      reg65 : reg61)) < $unsigned((!(7'h41)))) : (~&$unsigned($signed(wire58)))) && $unsigned(reg61[(3'h5):(2'h2)]));
            end
          else
            begin
              reg63 <= $signed((reg59 | reg65[(3'h4):(2'h3)]));
            end
          reg67 <= (~(~((reg60[(4'h9):(1'h0)] | (wire58 << reg61)) ?
              $signed(reg66[(3'h4):(2'h3)]) : $signed($unsigned(wire54)))));
          if (reg67[(2'h2):(1'h1)])
            begin
              reg68 <= ((wire52[(5'h15):(1'h0)] >> wire55[(1'h0):(1'h0)]) ?
                  $signed(reg59[(3'h6):(1'h1)]) : wire55);
              reg69 <= $signed($unsigned((~&((~|wire58) ?
                  $unsigned(reg56) : (+wire51)))));
            end
          else
            begin
              reg68 <= {($signed(reg62[(3'h4):(2'h3)]) >= reg61)};
              reg69 <= $unsigned($signed(($unsigned($unsigned(reg66)) ^ reg56[(2'h2):(1'h1)])));
              reg70 <= {$unsigned((~^reg63)),
                  ((+((|reg69) - (8'hac))) && $signed((+((8'hbf) & reg65))))};
              reg71 <= $unsigned($unsigned($unsigned($signed($unsigned(reg59)))));
              reg72 <= (8'hb4);
            end
          reg73 <= {(((8'hbe) + (reg60 == (8'ha3))) ?
                  (8'hb4) : (reg68[(2'h3):(1'h1)] <= (((8'ha0) ?
                          (8'h9e) : reg69) ?
                      wire57[(5'h12):(5'h10)] : ((8'ha1) <= reg63))))};
        end
      else
        begin
          reg62 <= (reg66 || {(|$signed({reg71, wire58}))});
          reg63 <= (|reg71);
        end
    end
  assign wire74 = reg62[(1'h1):(1'h0)];
  assign wire75 = (-reg73);
  assign wire76 = {wire54[(3'h7):(1'h1)]};
  assign wire77 = ($unsigned($signed(reg69)) ?
                      (reg62[(3'h6):(3'h5)] ^~ wire57) : ({{(reg64 ?
                                      (7'h42) : reg64)},
                              (^wire55[(2'h2):(1'h0)])} ?
                          (8'hac) : $signed($unsigned((&reg61)))));
  assign wire78 = $signed((wire75 ?
                      $unsigned($unsigned($unsigned(reg61))) : (reg56 < ($signed(reg69) ?
                          (wire74 ? reg63 : wire51) : wire74))));
  assign wire79 = wire57;
  assign wire80 = (&wire51[(3'h4):(2'h2)]);
  assign wire81 = $unsigned((($signed(wire75) ?
                          $signed(reg68) : wire76[(2'h2):(1'h0)]) ?
                      $unsigned(({(8'hbe),
                          reg69} >= (wire77 && reg65))) : reg56[(2'h2):(2'h2)]));
endmodule

module module5
#(parameter param42 = ({{{((8'h9e) >>> (8'ha4))}}, (!(((8'hb9) > (8'hb6)) ? {(8'haa), (8'hb3)} : {(8'hb4)}))} < {(|(((8'hac) == (8'hbd)) >= (~&(8'hb2))))}), 
parameter param43 = (~^(~^(8'h9e))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire36,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg38,
                 (1'h0)};
  assign wire11 = $unsigned($unsigned($unsigned($unsigned((~|(8'hb8))))));
  assign wire12 = ({wire8[(3'h4):(3'h4)]} < wire8[(4'h8):(3'h7)]);
  assign wire13 = {$signed(wire12[(3'h6):(2'h3)]), wire8[(1'h1):(1'h0)]};
  assign wire14 = ($signed(wire8) + $signed(wire10[(3'h4):(2'h2)]));
  assign wire15 = wire10[(3'h5):(2'h3)];
  module16 #() modinst37 (.wire18(wire9), .wire20(wire12), .wire19(wire6), .y(wire36), .clk(clk), .wire17(wire13));
  always
    @(posedge clk) begin
      reg38 <= ($unsigned(wire15[(1'h0):(1'h0)]) * wire8);
    end
  assign wire39 = wire36;
  assign wire40 = ((wire8[(1'h0):(1'h0)] || (~^(-wire8[(3'h5):(2'h2)]))) ?
                      $unsigned(($unsigned((wire11 || wire12)) ~^ ({wire13,
                              wire10} ?
                          wire11 : wire8[(1'h1):(1'h1)]))) : $unsigned(wire10));
  assign wire41 = ($unsigned(($signed((~|wire6)) >> wire40[(4'he):(4'ha)])) ?
                      wire14[(4'hd):(4'h8)] : wire8);
endmodule

module module16
#(parameter param34 = (^~(((((7'h44) | (8'h9f)) ? ((8'had) & (7'h42)) : ((7'h41) ? (7'h40) : (8'hb6))) ^ {(&(8'h9d))}) == (((+(8'hab)) > ((7'h44) || (7'h40))) ? ({(8'hbb)} ? ((7'h43) || (8'h9e)) : {(8'hae)}) : (-(|(8'hb2)))))), 
parameter param35 = ((|({(param34 || param34), param34} ? ((param34 ? param34 : (7'h43)) ? ((8'hbd) || param34) : param34) : ({param34, param34} ? param34 : (param34 ? param34 : param34)))) ^ param34))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire21 = wire20[(3'h5):(1'h1)];
  assign wire22 = (~wire18[(3'h5):(1'h0)]);
  assign wire23 = (wire17 ? wire21[(4'hb):(1'h0)] : wire22[(3'h6):(1'h0)]);
  assign wire24 = $signed($unsigned({(8'hbf)}));
  assign wire25 = wire24[(4'h8):(3'h7)];
  assign wire26 = ((+wire18) * wire24);
  assign wire27 = (wire20[(4'ha):(1'h0)] != wire19[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      if ($unsigned((~^$unsigned(wire23))))
        begin
          reg28 <= $signed(wire25);
        end
      else
        begin
          reg28 <= ($unsigned({$unsigned($signed(wire26))}) ^~ wire19[(4'ha):(3'h7)]);
          reg29 <= (~$signed(($unsigned((^wire19)) <= ((^wire25) ?
              $unsigned(wire19) : {wire22, wire23}))));
        end
      reg30 <= (^~{$signed(($signed(reg28) ? wire27 : $unsigned(wire25)))});
      reg31 <= $signed(((^(^~(&wire19))) || {$unsigned($signed(wire27))}));
      reg32 <= wire27;
      reg33 <= ($unsigned(wire22) ?
          $signed(((wire18 >> $signed(wire25)) == ((wire21 ?
              wire20 : reg32) ^~ reg32[(1'h0):(1'h0)]))) : wire24);
    end
endmodule

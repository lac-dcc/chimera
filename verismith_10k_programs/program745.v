module top
#(parameter param93 = ((((((8'hba) ? (8'hbd) : (8'ha5)) ? (~|(8'hb1)) : (^~(8'hb1))) ? ({(8'hb3), (8'hb9)} ? ((8'hb6) == (8'hb6)) : ((8'hae) ? (8'hae) : (8'haf))) : (|((8'hb9) + (8'hb4)))) ? ((~(^(8'ha1))) ? ({(8'hab), (7'h41)} ? ((8'hbb) <= (8'ha2)) : (~|(8'hb6))) : (((8'hbd) ? (8'hbe) : (8'haf)) ? (^(8'h9c)) : {(8'hbb)})) : ((^((8'hb7) & (8'h9d))) ? (-((7'h40) ? (8'hac) : (8'hb9))) : (~&((8'hab) ? (8'h9d) : (8'had))))) ? ((|(((8'hbf) ? (8'had) : (8'ha4)) ? (^(8'ha5)) : (!(7'h43)))) ^ ((^(+(8'hb4))) || (((8'hb1) ? (8'hbd) : (8'hbe)) ? (+(8'ha7)) : {(8'hbd), (7'h42)}))) : ((~(((8'hb3) & (7'h40)) ? ((8'ha8) | (8'hb2)) : ((8'h9e) ? (8'ha7) : (7'h42)))) ^ {({(8'ha0), (8'ha1)} ? ((8'hb7) | (8'hbe)) : {(8'ha1)}), (((8'hac) >= (8'hba)) <<< (^(8'hb5)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire89;
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  assign y = {wire91,
                 wire39,
                 wire6,
                 wire5,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire52,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire89,
                 reg92,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = $unsigned($unsigned(wire1));
  module7 #() modinst40 (.y(wire39), .wire10(wire5), .wire11(wire3), .clk(clk), .wire9(wire4), .wire12(wire1), .wire8(wire6));
  assign wire41 = wire5;
  assign wire42 = $unsigned((^(($signed(wire39) ?
                      ((8'h9c) - wire3) : wire0[(3'h5):(1'h0)]) ^~ (8'hba))));
  assign wire43 = $signed(wire6);
  assign wire44 = $unsigned(wire6[(5'h10):(4'h8)]);
  assign wire45 = $unsigned(wire41[(3'h6):(2'h3)]);
  assign wire46 = (~^$unsigned((wire1[(3'h6):(3'h4)] ?
                      {wire3[(4'hb):(2'h3)]} : (wire0 < (wire5 >> wire3)))));
  always
    @(posedge clk) begin
      reg47 <= (~|wire42);
      reg48 <= (wire41[(1'h0):(1'h0)] ?
          $unsigned(wire2[(2'h3):(1'h0)]) : wire44);
      if ($unsigned({((!wire1) ?
              $unsigned(((8'ha5) ? (8'hba) : wire1)) : (8'hab)),
          wire42}))
        begin
          if (($unsigned(wire45) ?
              ({$unsigned($signed(wire6)),
                      ((~reg47) ? {reg48, reg47} : $unsigned(wire3))} ?
                  (~|(~|{wire43, wire44})) : wire41) : (8'ha9)))
            begin
              reg49 <= $signed($unsigned((wire45 >> (+$signed(wire3)))));
              reg50 <= (wire3[(4'hb):(3'h7)] ?
                  (((~^$signed((8'ha6))) ^~ $unsigned(((8'hb4) - wire6))) + reg48[(3'h5):(2'h2)]) : (($signed(((8'haf) ^ (8'haf))) ?
                          wire3 : (((8'hb1) + (8'hb7)) ^ $signed(wire41))) ?
                      {(&wire41[(2'h3):(1'h1)]),
                          wire5[(3'h6):(2'h2)]} : ((8'ha1) * wire6)));
              reg51 <= {($signed((|$unsigned(reg49))) ?
                      (((&wire42) ?
                          wire4[(1'h1):(1'h0)] : $unsigned((8'hbb))) <<< ((reg50 ?
                              reg47 : wire43) ?
                          (^wire45) : $unsigned(reg49))) : wire2),
                  ((((wire5 ?
                          wire43 : reg49) ~^ $unsigned(reg48)) ~^ $signed((^~(8'hb2)))) ?
                      wire39[(3'h6):(2'h2)] : $unsigned(((~(8'ha1)) - $signed(wire46))))};
            end
          else
            begin
              reg49 <= wire3[(4'h8):(3'h7)];
            end
        end
      else
        begin
          reg49 <= wire2[(3'h7):(1'h0)];
          reg50 <= wire3[(1'h1):(1'h1)];
        end
    end
  assign wire52 = (!wire4);
  always
    @(posedge clk) begin
      reg53 <= wire45;
      if (($signed($unsigned(({reg53} ?
          $signed(reg51) : wire46[(3'h4):(1'h1)]))) >= $signed((((reg50 || reg48) ?
              ((8'ha9) + (8'ha4)) : (|wire1)) ?
          $signed({wire39}) : (~|$unsigned(wire5))))))
        begin
          reg54 <= $unsigned(wire43);
          reg55 <= $signed(reg49);
        end
      else
        begin
          if ((|$unsigned(((wire43[(4'hc):(3'h7)] >>> (wire1 == wire39)) ?
              ((wire6 >> wire44) << $signed(reg51)) : ((~&wire3) || wire6[(4'hd):(3'h7)])))))
            begin
              reg54 <= ({(wire46[(3'h4):(1'h1)] ^ $unsigned({wire1}))} ?
                  wire43 : $signed((~|$signed(reg49[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg54 <= wire46[(1'h1):(1'h1)];
              reg55 <= {(wire42 * $signed($signed((~(7'h40))))),
                  $unsigned(((~&wire2[(3'h6):(3'h4)]) ?
                      ((wire46 ? (8'hb8) : reg51) ?
                          (+reg50) : wire42[(5'h14):(1'h0)]) : ($signed(wire5) + wire45)))};
              reg56 <= {{(~&$unsigned(reg47))},
                  (~^{$unsigned(wire39[(4'h8):(3'h7)])})};
              reg57 <= reg51;
              reg58 <= wire45;
            end
          reg59 <= reg53[(4'hf):(4'hb)];
          if ((~^wire43))
            begin
              reg60 <= (8'hba);
              reg61 <= $signed(({($unsigned((8'hbc)) ^ (^~(7'h40)))} ?
                  wire2 : (-(&wire41))));
              reg62 <= ((^~(~|((~wire39) >= $unsigned(wire41)))) >= $unsigned($signed(((reg54 ?
                  reg57 : reg48) ~^ (reg51 + (8'hb6))))));
            end
          else
            begin
              reg60 <= $signed((reg50[(2'h2):(2'h2)] ?
                  ($signed($unsigned(wire0)) && ((wire42 ? reg47 : reg62) ?
                      wire2[(4'h8):(3'h6)] : (-reg48))) : wire52[(3'h5):(3'h4)]));
              reg61 <= wire52[(1'h0):(1'h0)];
            end
        end
      reg63 <= ((reg62[(3'h7):(3'h6)] == $signed((7'h43))) ?
          (^~wire41[(1'h1):(1'h0)]) : (^~(wire2 - $signed(wire6))));
      reg64 <= ($unsigned($signed(wire44)) >> $unsigned($signed(((wire45 ?
              (8'hb6) : reg48) ?
          $unsigned(reg62) : $signed(wire0)))));
      reg65 <= ($unsigned(wire43[(3'h4):(2'h2)]) ^ (wire39[(3'h4):(1'h1)] ?
          $unsigned($unsigned((8'hac))) : ($unsigned(wire5[(3'h4):(1'h0)]) ?
              reg55 : ((^reg48) * $signed(wire1)))));
    end
  assign wire66 = (({reg57} * wire4) + $unsigned($signed(($signed((8'ha2)) ?
                      $signed(wire44) : (reg64 ~^ reg48)))));
  assign wire67 = (({reg58} << (((reg58 <= wire44) ?
                          (wire42 >>> wire41) : (reg61 ? wire3 : reg47)) ?
                      $unsigned($unsigned(reg61)) : {reg57[(5'h11):(3'h4)],
                          (wire5 && wire66)})) || reg55[(4'hd):(3'h4)]);
  assign wire68 = (((wire6[(4'hc):(3'h4)] > $signed(wire1[(1'h1):(1'h0)])) ~^ reg63) ?
                      {(~&wire52[(3'h4):(2'h2)]),
                          $signed((reg61 ?
                              ((7'h41) > reg50) : wire4))} : wire2);
  assign wire69 = ((($signed((wire41 ? reg60 : (8'hb2))) >>> ($signed(reg49) ?
                          wire43[(5'h11):(4'hf)] : reg65[(1'h0):(1'h0)])) >= (~|$signed($unsigned(reg60)))) ?
                      $signed(wire2[(1'h0):(1'h0)]) : wire5[(2'h3):(2'h2)]);
  assign wire70 = ($signed((($unsigned(wire67) != (^reg58)) ^~ reg57)) != reg60);
  module71 #() modinst90 (.wire72(wire67), .wire75(wire70), .y(wire89), .wire73(wire41), .clk(clk), .wire74(reg59));
  assign wire91 = ($signed((($unsigned(wire6) ?
                          (wire42 ?
                              (8'h9c) : reg57) : reg61[(2'h3):(1'h0)]) != ($unsigned(wire89) ?
                          reg65 : (wire5 <<< wire4)))) ?
                      wire6 : (reg49[(1'h0):(1'h0)] ~^ (^~$signed($signed(wire4)))));
  always
    @(posedge clk) begin
      reg92 <= (wire3[(2'h3):(2'h3)] ?
          reg63[(3'h5):(1'h1)] : (($signed($unsigned(wire45)) ?
                  ($signed(reg48) << ((8'haa) <= wire91)) : reg49[(1'h0):(1'h0)]) ?
              {($signed(wire0) ^ (wire1 ? wire89 : reg64)),
                  ((wire42 ? wire3 : wire0) || {wire44, wire45})} : reg54));
    end
endmodule

module module71
#(parameter param88 = ((^~((|{(7'h40), (8'hbb)}) ? (((8'hbe) || (8'h9f)) && (8'hb9)) : (((7'h41) ? (8'ha7) : (7'h40)) < (~(8'hae))))) >> ((|(((8'h9d) ? (8'hbf) : (8'had)) ? ((8'had) != (7'h40)) : (^~(8'ha9)))) ~^ (-({(8'hbc)} | {(8'haf), (8'h9f)})))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire75;
  input wire signed [(3'h5):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire73;
  input wire [(3'h7):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  assign y = {wire87,
                 wire78,
                 wire77,
                 wire76,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire76 = ((~(+({wire74} == (&(8'hbf))))) < $unsigned($signed($unsigned({wire74}))));
  assign wire77 = wire75;
  assign wire78 = (^wire75);
  always
    @(posedge clk) begin
      if ($signed((({wire73[(1'h1):(1'h1)], {wire75, wire77}} && ((&wire76) ?
          $signed(wire76) : (wire74 + wire76))) <<< $unsigned($unsigned(wire75[(5'h13):(4'hf)])))))
        begin
          reg79 <= {wire76[(4'h9):(3'h7)]};
          reg80 <= ($signed($unsigned((wire76[(3'h6):(1'h1)] != (!wire77)))) > wire73);
          reg81 <= ((|wire76[(2'h3):(2'h3)]) && $unsigned(wire73[(1'h1):(1'h0)]));
          reg82 <= (wire73[(4'h9):(3'h7)] >> wire73[(3'h4):(2'h3)]);
        end
      else
        begin
          reg79 <= wire74;
          reg80 <= $signed($signed((8'ha0)));
          reg81 <= $signed($signed($unsigned((~|((8'ha8) != wire72)))));
        end
      if (({$unsigned((~(!wire78))), reg81} - wire76))
        begin
          reg83 <= wire75;
          reg84 <= wire74;
        end
      else
        begin
          reg83 <= reg84[(5'h14):(3'h4)];
        end
      reg85 <= ((^($signed($unsigned(wire72)) != {wire75})) == reg83);
      reg86 <= (((wire78[(2'h3):(2'h3)] ?
          wire76[(4'h8):(3'h5)] : reg84) || (&(~^reg84))) < reg83);
    end
  assign wire87 = (reg80 ?
                      reg80 : ($signed(reg85) ?
                          $signed(((reg83 - wire77) + (!reg81))) : (((8'hb9) + reg85[(1'h0):(1'h0)]) ?
                              $unsigned($unsigned(wire78)) : ({reg86, reg85} ?
                                  $unsigned(wire75) : $unsigned(wire73)))));
endmodule

module module7
#(parameter param37 = ((({((8'hb8) > (8'hab)), (~(8'hac))} ? ({(8'h9f), (8'had)} >= (~&(8'hb7))) : (((8'ha7) ^ (8'ha4)) ? {(8'hba)} : ((7'h40) ? (8'hb5) : (8'h9c)))) < ((~{(8'ha0)}) ? {((8'ha2) ? (7'h42) : (8'ha7))} : (8'h9e))) >= ((~^({(8'ha8)} ? ((7'h44) == (8'ha4)) : (8'ha3))) > ((8'hb1) ? {((8'had) == (8'h9f)), (^~(8'hb2))} : (8'h9f)))), 
parameter param38 = {param37})
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire13 = (((-(wire12 ? (~^wire11) : wire11)) ?
                          $unsigned($signed((|wire9))) : wire11) ?
                      $signed(wire12[(3'h4):(3'h4)]) : ($signed(($signed(wire11) <= $signed(wire8))) ?
                          {(~&(~|wire10))} : $signed({(~^wire9),
                              $unsigned(wire8)})));
  assign wire14 = {(+($unsigned((+wire8)) ?
                          $unsigned(wire9) : wire11[(4'he):(3'h7)]))};
  assign wire15 = (^~$unsigned(wire13));
  assign wire16 = $unsigned((&(((wire9 ?
                      wire8 : wire11) == (wire13 >> wire11)) - (|$unsigned(wire10)))));
  assign wire17 = $unsigned(wire13[(2'h3):(2'h3)]);
  assign wire18 = (wire10[(1'h1):(1'h1)] ?
                      ($unsigned($unsigned(wire17[(3'h6):(1'h0)])) ?
                          $signed(((wire15 * wire9) ?
                              wire17[(3'h5):(2'h3)] : (wire9 < wire12))) : (wire9[(3'h5):(2'h2)] ?
                              wire15 : ($unsigned(wire9) == $signed(wire17)))) : $signed(wire15[(4'hc):(3'h4)]));
  assign wire19 = $signed(wire14[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      if ((^{wire8[(4'hd):(3'h7)]}))
        begin
          reg20 <= wire13;
        end
      else
        begin
          reg20 <= ($unsigned(wire13[(4'h8):(3'h4)]) >> wire10[(1'h1):(1'h0)]);
          reg21 <= (wire15[(4'hb):(3'h6)] != wire19);
          reg22 <= (7'h42);
          if ($unsigned((&wire16[(4'h8):(2'h3)])))
            begin
              reg23 <= $unsigned($unsigned((wire16[(3'h6):(3'h6)] ?
                  wire19 : wire17[(4'h9):(3'h4)])));
              reg24 <= $unsigned((wire12[(3'h6):(1'h1)] - $unsigned($signed($signed(wire15)))));
              reg25 <= $signed((|(+reg23)));
              reg26 <= reg24[(4'h8):(3'h5)];
            end
          else
            begin
              reg23 <= reg22;
              reg24 <= (^(!$unsigned($unsigned($signed(wire18)))));
              reg25 <= ($signed($unsigned(((reg23 ?
                  reg25 : wire15) ^~ reg25))) || (wire16 >= $unsigned((reg24[(4'hd):(3'h4)] ?
                  {reg21} : (~^reg25)))));
              reg26 <= (&{{{(wire15 ^ reg24)}}});
              reg27 <= $unsigned($signed((reg23 == $signed(wire10[(2'h2):(2'h2)]))));
            end
        end
      if ((&({$unsigned({reg26, reg23}),
              (wire8[(3'h5):(2'h3)] ?
                  $signed(wire18) : (reg26 ? wire17 : wire13))} ?
          $signed((!wire14[(3'h7):(1'h0)])) : wire18[(4'ha):(3'h5)])))
        begin
          reg28 <= wire13[(4'hc):(3'h7)];
          reg29 <= wire17[(1'h0):(1'h0)];
          reg30 <= (~|{($unsigned((+wire17)) + wire17), (-{$unsigned(wire8)})});
          reg31 <= ($unsigned(wire19) ?
              ($unsigned($signed(((8'ha4) << reg27))) || reg26) : reg30[(5'h10):(4'h8)]);
        end
      else
        begin
          reg28 <= reg21[(3'h4):(1'h1)];
        end
      reg32 <= $unsigned(reg23);
    end
  assign wire33 = reg28[(3'h7):(3'h4)];
  assign wire34 = {(wire13 <= wire33)};
  assign wire35 = reg29;
  assign wire36 = (~^$signed({$signed((wire13 ? reg22 : wire34))}));
endmodule

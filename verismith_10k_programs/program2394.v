module top
#(parameter param48 = {({((-(8'hb9)) < ((8'hb4) ? (7'h40) : (7'h44)))} ? (((8'hb1) || (8'hb7)) ? (((8'hbc) ~^ (8'hab)) ? ((8'ha9) ? (8'hb7) : (8'hb6)) : (^~(7'h40))) : (((7'h40) ^ (7'h44)) ? ((8'hb8) ^ (8'hb6)) : {(8'hbc), (8'ha9)})) : (~|(!(+(8'hb6))))), (((^~((8'h9e) ? (8'hac) : (8'hbc))) >>> ((~|(8'hb7)) * (!(8'had)))) ? (((~^(8'hba)) ^ ((8'h9f) ~^ (8'hb2))) < ((-(8'haf)) >> ((8'haf) ? (8'hbd) : (7'h42)))) : ((((8'hb7) & (8'haa)) ? (8'hbf) : (8'hb1)) ? ({(8'hb0)} && (~(8'hb1))) : (^~((8'ha5) ? (8'haa) : (8'ha3)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 wire4,
                 reg42,
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
                 (1'h0)};
  assign wire4 = (wire3[(1'h0):(1'h0)] ?
                     $unsigned($unsigned(((wire1 ? wire1 : wire1) ?
                         wire1[(1'h1):(1'h1)] : (+wire2)))) : $unsigned(((wire3 ?
                         (-wire3) : wire1) < (~^$unsigned(wire0)))));
  module5 #() modinst16 (wire15, clk, wire2, wire4, wire3, wire1);
  assign wire17 = {(~&$signed($signed((!wire1)))),
                      $unsigned((((~&wire0) ?
                          wire1 : (~wire15)) >> {$signed(wire15), wire4}))};
  assign wire18 = wire4[(4'hd):(4'hb)];
  assign wire19 = $unsigned($signed($unsigned(((wire18 * wire17) ?
                      (wire18 >> wire3) : (8'haf)))));
  assign wire20 = wire3[(3'h7):(2'h2)];
  assign wire21 = wire1[(4'hc):(1'h1)];
  assign wire22 = wire17;
  assign wire23 = ($signed(wire22[(1'h1):(1'h0)]) ?
                      $signed(wire17) : (!$unsigned($unsigned(wire20[(3'h6):(1'h1)]))));
  assign wire24 = wire18[(3'h7):(3'h5)];
  assign wire25 = $unsigned(wire0[(4'h9):(2'h3)]);
  assign wire26 = wire4;
  assign wire27 = $unsigned({{(-wire15)},
                      ({wire20} == ($signed(wire0) ?
                          (wire1 << wire18) : $signed(wire26)))});
  assign wire28 = (wire27[(3'h6):(1'h0)] <<< wire27[(4'h8):(4'h8)]);
  assign wire29 = (wire1 + $unsigned($unsigned(wire26[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      if ((8'ha0))
        begin
          if (wire24[(3'h5):(2'h2)])
            begin
              reg30 <= $unsigned((~$signed((((8'hb7) ?
                  wire20 : (8'hb7)) || $signed(wire3)))));
            end
          else
            begin
              reg30 <= (wire22[(2'h3):(1'h1)] >= $signed((((&wire18) ~^ wire21[(3'h4):(2'h2)]) < ((|wire4) | $unsigned(wire21)))));
              reg31 <= $signed((~(8'hbd)));
              reg32 <= (+{(~^(8'had)), (&$unsigned((-wire24)))});
            end
          if (wire21)
            begin
              reg33 <= $unsigned(((({wire27,
                  wire18} - (wire2 || wire3)) & $signed((8'hb1))) <<< wire28[(2'h3):(1'h0)]));
              reg34 <= (~^wire23);
            end
          else
            begin
              reg33 <= (8'h9d);
              reg34 <= wire20;
              reg35 <= (~|(((~|(|wire4)) ?
                      wire29[(3'h4):(1'h1)] : (~&$unsigned(wire17))) ?
                  $signed(wire15) : $signed(($signed(wire23) & wire21))));
              reg36 <= $signed(((((wire28 ~^ wire4) == (~&wire18)) ?
                      ((^~reg35) > (wire2 ? wire25 : wire27)) : (7'h44)) ?
                  $signed((reg32[(2'h2):(1'h1)] ?
                      (wire24 ?
                          wire20 : reg30) : wire3[(2'h3):(1'h0)])) : wire21));
            end
          reg37 <= reg34;
          if ((~&($signed((wire21 > (&wire18))) - $unsigned($signed($signed(reg32))))))
            begin
              reg38 <= (8'ha9);
              reg39 <= reg36[(1'h0):(1'h0)];
              reg40 <= $signed($signed(wire0[(3'h4):(1'h1)]));
            end
          else
            begin
              reg38 <= ((reg31[(1'h1):(1'h0)] + wire29) ?
                  {(((~reg40) ? $signed(reg34) : $signed(wire23)) ?
                          ((&(7'h40)) ?
                              wire22[(2'h2):(1'h1)] : $unsigned(reg30)) : $unsigned(wire25[(3'h6):(2'h3)])),
                      {reg40[(4'ha):(4'ha)]}} : reg33[(1'h0):(1'h0)]);
              reg39 <= $unsigned(((wire29[(3'h5):(3'h4)] ?
                      (|reg32) : {{reg39, reg40}}) ?
                  (^wire24[(1'h0):(1'h0)]) : reg35[(1'h0):(1'h0)]));
              reg40 <= (($signed(reg32) - $unsigned($signed($signed(wire21)))) == $unsigned((^(wire21 && wire0[(4'h8):(4'h8)]))));
            end
          reg41 <= $signed(($signed($signed($signed(reg36))) - ($signed($signed(wire1)) ?
              $unsigned(reg36) : (wire0 && $signed((8'had))))));
        end
      else
        begin
          reg30 <= (|wire23);
          reg31 <= $unsigned({reg33[(1'h0):(1'h0)]});
          reg32 <= (^$unsigned((wire17 | ((~&wire26) ?
              $unsigned(wire18) : wire24[(3'h5):(1'h0)]))));
          if (($unsigned(wire15) < $signed(reg39[(3'h7):(2'h2)])))
            begin
              reg33 <= wire15;
              reg34 <= $signed({$unsigned($signed($unsigned((8'haa))))});
            end
          else
            begin
              reg33 <= (^$unsigned($signed(({wire15, reg30} >> (wire27 ?
                  wire24 : wire24)))));
              reg34 <= ((~(wire2[(2'h3):(2'h3)] ?
                  (!(-reg37)) : $unsigned({wire4, wire2}))) <<< reg36);
              reg35 <= $signed((^~(^($signed(reg34) ?
                  (wire2 && wire18) : $signed(wire1)))));
            end
        end
      reg42 <= (((~wire27) >>> $unsigned((((7'h43) ?
              wire29 : wire24) <<< (~reg41)))) ?
          (!(^~$unsigned($unsigned(reg38)))) : ((((wire15 ~^ (8'hb4)) ?
              $unsigned(wire29) : wire17[(1'h1):(1'h1)]) >= $signed(((8'hbd) ?
              wire15 : wire0))) - $signed((~^{wire2, wire20}))));
    end
  assign wire43 = $signed({(~|$signed((wire24 * reg40))),
                      wire20[(4'ha):(4'h9)]});
  assign wire44 = reg30;
  assign wire45 = (((+($signed(reg41) ? $signed(reg34) : $unsigned(reg41))) ?
                          ((reg41 > (reg36 ? wire0 : wire20)) ?
                              wire27 : $signed((|wire44))) : wire19) ?
                      $signed($signed((&(~^wire24)))) : (((~|{(7'h40)}) << $signed(wire44)) - {wire20[(2'h3):(1'h0)],
                          ((7'h44) ? (&reg42) : $signed(reg35))}));
  assign wire46 = (|reg38[(3'h7):(3'h4)]);
  assign wire47 = {($signed(($unsigned(wire44) ?
                              (~^wire27) : wire22[(1'h0):(1'h0)])) ?
                          wire1[(5'h14):(3'h5)] : {{$unsigned(wire18)},
                              $unsigned($signed(wire21))}),
                      {$signed(reg33), wire15[(1'h0):(1'h0)]}};
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  assign y = {wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire9;
  assign wire11 = (wire7 < $signed((^~wire9[(1'h1):(1'h1)])));
  assign wire12 = wire10[(4'h8):(3'h6)];
  assign wire13 = $unsigned(wire10[(4'hb):(3'h5)]);
  assign wire14 = $unsigned(($signed(wire6) & ($unsigned($unsigned(wire7)) || (&$signed(wire11)))));
endmodule

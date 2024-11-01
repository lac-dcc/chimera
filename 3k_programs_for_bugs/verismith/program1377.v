module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire3[(3'h6):(3'h4)];
  module5 #() modinst44 (wire43, clk, wire0, wire1, wire2, wire4);
  assign wire45 = $signed(((8'h9c) != wire4));
  assign wire46 = wire2[(4'hc):(1'h0)];
  assign wire47 = (wire43 || wire46[(1'h0):(1'h0)]);
  assign wire48 = (|{(8'hb8), {(+{wire47}), $unsigned(wire45)}});
  always
    @(posedge clk) begin
      if ({wire45})
        begin
          reg49 <= wire4[(4'h9):(1'h0)];
          reg50 <= (&wire43[(1'h0):(1'h0)]);
          reg51 <= $unsigned((!$signed(reg50)));
          reg52 <= (wire45[(4'h8):(4'h8)] ? (!wire2) : reg51[(3'h5):(2'h3)]);
          reg53 <= (wire3 ?
              wire43 : (((^wire47[(1'h1):(1'h1)]) ?
                      $signed($signed(reg52)) : (wire43[(2'h3):(1'h0)] ?
                          {wire2} : wire45)) ?
                  wire0 : {(~&$signed(reg52))}));
        end
      else
        begin
          reg49 <= $unsigned({wire3[(4'hf):(1'h1)]});
          reg50 <= {(^~$unsigned(reg52)), wire43};
        end
      reg54 <= {wire45[(3'h4):(1'h1)]};
      if ({wire4[(2'h3):(1'h0)]})
        begin
          reg55 <= $signed((~{$unsigned((~^wire47)), {wire47[(4'h9):(1'h1)]}}));
          reg56 <= reg51[(2'h2):(1'h1)];
          reg57 <= $unsigned((($unsigned(reg50[(1'h1):(1'h1)]) * {(wire1 >>> wire0)}) == (~^(^(^(8'hab))))));
        end
      else
        begin
          if (($unsigned($unsigned(wire0)) ^ {wire1}))
            begin
              reg55 <= $signed(($unsigned((&wire2[(4'ha):(2'h2)])) == (~^(^(~^reg49)))));
              reg56 <= $signed((reg55 && $unsigned(((wire1 ?
                  wire43 : (8'hbe)) >= $signed(reg50)))));
              reg57 <= $unsigned((~{((7'h42) ? wire48[(2'h2):(1'h0)] : reg49),
                  ($signed((7'h41)) ?
                      ((8'hb0) ? wire0 : wire1) : reg57[(5'h11):(3'h6)])}));
              reg58 <= $unsigned(reg57);
              reg59 <= $unsigned((~|$signed(reg57)));
            end
          else
            begin
              reg55 <= $unsigned(reg52[(5'h12):(3'h7)]);
              reg56 <= ($signed((((8'haa) ?
                          (wire48 ? wire1 : wire1) : $unsigned(wire4)) ?
                      ($unsigned(wire43) & $unsigned(reg57)) : $unsigned((reg57 | wire47)))) ?
                  wire47[(4'hc):(3'h4)] : $unsigned(($signed((+wire0)) ?
                      wire47[(4'hc):(4'ha)] : ($unsigned(reg54) ?
                          $unsigned(reg51) : wire1))));
              reg57 <= (~(^wire4[(4'hc):(3'h5)]));
            end
          if (($signed($signed({$unsigned((8'hab)),
              reg57})) <<< (~($unsigned(wire47) ^~ $signed($unsigned((8'hb4)))))))
            begin
              reg60 <= $unsigned({reg59,
                  (($unsigned(wire46) == (reg54 == wire45)) ^~ ((&reg53) >>> {reg53}))});
              reg61 <= reg55[(2'h3):(1'h1)];
              reg62 <= ($signed((~^(+(wire4 ? wire45 : wire43)))) ?
                  (wire4[(2'h3):(2'h3)] ?
                      $signed(reg59[(4'he):(4'h8)]) : $signed($signed($unsigned(wire3)))) : {reg54[(3'h6):(2'h2)],
                      $unsigned($unsigned(reg52))});
              reg63 <= $unsigned({((-(wire48 ?
                      (8'hb1) : reg53)) ^ (|(reg54 < reg57)))});
            end
          else
            begin
              reg60 <= $signed(wire1);
              reg61 <= (((~wire48) ^~ $unsigned($signed((~wire2)))) + $signed($unsigned(wire4[(3'h4):(1'h1)])));
              reg62 <= ((8'h9c) ?
                  $signed((^~$signed($unsigned((8'hbb))))) : wire4[(4'hb):(4'ha)]);
            end
        end
      if (wire43)
        begin
          reg64 <= $unsigned($unsigned((^~$unsigned((reg54 == wire1)))));
          reg65 <= reg53[(1'h0):(1'h0)];
          reg66 <= $signed(((~$signed({reg50,
              reg55})) & $signed((reg52[(2'h2):(1'h0)] == $signed(wire2)))));
          if ((|reg63[(4'h8):(3'h5)]))
            begin
              reg67 <= (&reg49[(2'h3):(1'h1)]);
              reg68 <= $unsigned(reg50[(3'h4):(2'h2)]);
              reg69 <= reg52;
              reg70 <= (wire1[(5'h11):(4'ha)] ?
                  $unsigned((+$signed({reg55}))) : reg55);
              reg71 <= wire4;
            end
          else
            begin
              reg67 <= {reg53,
                  ({reg57[(5'h10):(2'h3)]} ?
                      $unsigned($unsigned((~|wire0))) : (reg58 ?
                          ($signed((8'hb1)) * $signed(reg64)) : (+(wire46 ?
                              reg58 : reg51))))};
              reg68 <= $unsigned((^$unsigned(wire4[(4'hb):(2'h3)])));
              reg69 <= (&{$signed((^$unsigned(reg53)))});
              reg70 <= reg55;
            end
          reg72 <= wire47[(3'h5):(2'h3)];
        end
      else
        begin
          reg64 <= ((^~$unsigned(reg65[(3'h6):(3'h5)])) >>> (|$signed(wire4[(3'h5):(1'h0)])));
          reg65 <= $signed(wire43[(1'h1):(1'h0)]);
          reg66 <= $unsigned(({reg64[(2'h3):(2'h3)]} ?
              (((wire45 ?
                  wire48 : reg53) ^ $signed(reg69)) ^~ (reg56 <<< ((8'h9c) ?
                  reg72 : wire2))) : (reg58 * ((reg58 ? reg52 : reg57) ?
                  (&reg67) : {reg66, wire48}))));
          reg67 <= ($signed($signed($unsigned((~&reg49)))) ?
              ((|reg53[(1'h1):(1'h0)]) && reg52) : {reg52[(4'ha):(1'h1)]});
        end
      reg73 <= $unsigned($unsigned(wire0[(2'h3):(2'h2)]));
    end
  assign wire74 = (~|{$unsigned(reg54)});
  assign wire75 = (reg62[(3'h4):(1'h0)] * reg54);
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire25;
  assign y = {wire42,
                 wire41,
                 wire39,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire25,
                 (1'h0)};
  assign wire10 = wire6[(3'h4):(2'h3)];
  assign wire11 = wire9;
  assign wire12 = wire7[(2'h2):(2'h2)];
  assign wire13 = $signed($unsigned(wire9[(4'hc):(4'hc)]));
  module14 #() modinst26 (.wire15(wire10), .y(wire25), .clk(clk), .wire17(wire7), .wire19(wire8), .wire16(wire13), .wire18(wire9));
  module27 #() modinst40 (.wire31(wire11), .wire30(wire13), .y(wire39), .clk(clk), .wire29(wire9), .wire28(wire6));
  assign wire41 = (($unsigned(({wire25, wire7} >> ((8'ha2) + wire13))) ?
                          $signed((+$signed(wire13))) : wire9[(3'h5):(1'h1)]) ?
                      ((~&(&{wire11, (8'h9d)})) ?
                          (^wire9) : (wire39[(4'he):(4'hb)] ?
                              ((|wire11) >= (&(8'hbf))) : (-wire25))) : $signed($unsigned(((wire11 ?
                              wire10 : wire39) ?
                          wire13 : (wire39 <= wire6)))));
  assign wire42 = $unsigned(wire41[(2'h2):(1'h1)]);
endmodule

module module27
#(parameter param38 = (~^((8'hba) & (^~(((8'hab) != (8'h9e)) ^ (!(7'h41)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire31;
  input wire [(2'h3):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  assign y = {wire37, wire36, wire35, wire34, wire33, wire32, (1'h0)};
  assign wire32 = wire29;
  assign wire33 = ((wire31[(2'h2):(1'h1)] ?
                      $unsigned($unsigned({wire29,
                          wire31})) : (~^$unsigned((wire28 - wire31)))) <<< {wire28,
                      wire31[(3'h5):(1'h1)]});
  assign wire34 = (wire31[(1'h1):(1'h0)] * (wire33[(4'ha):(1'h1)] ?
                      (wire31 != wire29) : (!$signed($signed((8'haa))))));
  assign wire35 = $signed($unsigned({$unsigned({wire32}),
                      wire34[(4'h8):(1'h1)]}));
  assign wire36 = wire30;
  assign wire37 = (-(wire32 == $unsigned(((^wire35) ?
                      $signed(wire30) : wire36[(4'h8):(2'h3)]))));
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  assign y = {wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = wire15[(4'h8):(4'h8)];
  assign wire21 = (!wire15);
  assign wire22 = (wire17 ?
                      ((&(wire19[(1'h1):(1'h1)] < ((8'h9f) && wire20))) ?
                          (|(+((8'haa) | wire18))) : ((wire20 == (wire19 ?
                              wire19 : wire20)) >> (((8'haf) ?
                              wire20 : wire17) <<< (^~wire18)))) : {(~(wire16 ?
                              (wire18 <= wire19) : (~&(8'ha7))))});
  assign wire23 = ((wire15 != (^~$unsigned(wire15[(3'h6):(1'h0)]))) >>> wire21);
  assign wire24 = {{$signed(($signed(wire22) ?
                              $signed(wire23) : (wire20 ? (8'h9d) : wire20)))},
                      wire20[(4'h8):(1'h1)]};
endmodule

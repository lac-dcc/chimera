module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire56;
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire56,
                 (1'h0)};
  assign wire4 = {wire2};
  assign wire5 = {($signed(wire2) ? wire4 : (8'hb7)), wire3};
  assign wire6 = $unsigned($signed({wire0}));
  assign wire7 = $unsigned({(^~wire3[(2'h2):(1'h1)])});
  assign wire8 = $signed($signed($signed(((wire4 | wire0) ?
                     (wire1 ? (7'h40) : wire2) : $unsigned(wire0)))));
  assign wire9 = $unsigned(wire3);
  assign wire10 = (($signed(wire2[(3'h7):(1'h0)]) ?
                          (&wire6[(2'h2):(2'h2)]) : $signed({(8'hae)})) ?
                      wire8[(3'h6):(1'h0)] : (^wire8));
  assign wire11 = (-(^wire4));
  assign wire12 = ({$signed((((8'hb7) ? wire6 : wire7) ?
                          ((8'ha6) ? (7'h44) : wire2) : $unsigned(wire1))),
                      (8'h9f)} < wire0[(4'he):(4'hc)]);
  assign wire13 = $unsigned({wire10, (|wire1)});
  assign wire14 = wire9[(3'h6):(2'h3)];
  assign wire15 = (-$unsigned(($unsigned((~wire2)) * $unsigned((wire8 ~^ wire1)))));
  assign wire16 = $signed((~|(-(|wire11[(3'h6):(3'h5)]))));
  assign wire17 = wire1;
  module18 #() modinst57 (.wire20(wire13), .wire19(wire2), .wire23(wire3), .y(wire56), .wire21(wire11), .wire22(wire5), .clk(clk));
  assign wire58 = wire16[(3'h4):(3'h4)];
  assign wire59 = $unsigned($signed(wire17));
  assign wire60 = {wire58[(3'h6):(1'h0)]};
  assign wire61 = ($unsigned($unsigned($unsigned(wire14))) ?
                      wire11[(4'h8):(1'h0)] : ($signed(((^wire56) ?
                          ((8'hba) ? wire15 : wire9) : (wire9 ?
                              wire11 : wire3))) <<< (($signed(wire60) ^~ (wire5 >>> (8'haa))) | wire17[(2'h2):(1'h0)])));
  assign wire62 = wire15;
  assign wire63 = ($signed($unsigned($signed(((8'hab) >>> (8'haf))))) <<< (+wire15[(2'h3):(2'h3)]));
  assign wire64 = ($signed(wire7[(4'ha):(3'h6)]) * ((|wire61) ?
                      wire17[(4'h8):(1'h0)] : {((wire0 >>> wire62) ?
                              (wire58 ? wire61 : wire3) : (wire13 ?
                                  wire1 : wire12))}));
  assign wire65 = (8'hab);
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= ($unsigned($unsigned($signed((wire20 ^~ wire23)))) ?
          wire21[(1'h1):(1'h0)] : wire20[(4'ha):(1'h1)]);
      reg25 <= wire19;
      reg26 <= {{($signed((~^(8'ha9))) * {$unsigned(wire23)}),
              $unsigned(wire23[(4'h8):(2'h3)])},
          $signed((^~(wire19[(1'h0):(1'h0)] ?
              {wire20} : (reg25 ? reg25 : wire23))))};
      if ((reg25 < ((!wire21) < $unsigned($unsigned((wire23 ?
          reg25 : wire23))))))
        begin
          reg27 <= (|$unsigned($signed(($signed(reg26) <= (wire21 ?
              wire23 : reg26)))));
        end
      else
        begin
          reg27 <= (reg24[(4'h9):(2'h2)] >>> reg27);
          if ($signed(reg26))
            begin
              reg28 <= ($signed($signed($unsigned((wire21 ~^ reg26)))) ?
                  (reg25 ^~ reg25) : (^~reg25[(2'h2):(1'h0)]));
            end
          else
            begin
              reg28 <= (reg27[(1'h1):(1'h0)] ~^ reg27[(3'h4):(3'h4)]);
              reg29 <= ($signed((^($signed(wire20) ?
                      (8'ha1) : (reg24 >= wire20)))) ?
                  ({$signed((reg28 >= reg25))} ?
                      (^$unsigned({wire23})) : (^~$unsigned((wire20 ?
                          reg28 : wire20)))) : (((!(wire23 ?
                          (8'h9f) : reg25)) >= (8'hb0)) ?
                      (($unsigned(reg26) != (|(8'hb6))) <= wire23) : wire22));
              reg30 <= {(wire20 ?
                      $unsigned($signed((^reg28))) : reg26[(2'h3):(1'h1)])};
              reg31 <= $unsigned(reg28[(5'h10):(4'hb)]);
            end
          reg32 <= reg25[(3'h4):(1'h0)];
          reg33 <= $unsigned(wire22);
          reg34 <= ($signed($unsigned($unsigned(reg29[(1'h0):(1'h0)]))) ?
              $unsigned((reg29[(4'h9):(2'h2)] > {$signed(wire21)})) : wire21[(2'h3):(1'h0)]);
        end
      reg35 <= (reg26 ? $unsigned({reg34[(4'ha):(2'h2)]}) : (~|reg34));
    end
  assign wire36 = wire21;
  assign wire37 = ($unsigned(reg31) | reg25);
  assign wire38 = ($unsigned($unsigned({reg25})) ?
                      reg35 : reg24[(3'h5):(1'h1)]);
  assign wire39 = reg35[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (({(+reg24)} >>> ($signed({reg30, (~&reg34)}) > $unsigned(wire21))))
        begin
          reg40 <= (!(reg30 ?
              $unsigned((~|(~^wire38))) : $unsigned(($unsigned(reg35) ?
                  (reg26 & wire39) : (wire37 ? wire36 : reg30)))));
          if ({({wire39[(5'h11):(3'h6)]} ?
                  ($signed($signed(reg28)) ?
                      reg40 : $unsigned(reg29)) : (~((wire36 ? reg29 : reg40) ?
                      {reg24} : {reg27, reg27}))),
              $signed(reg40)})
            begin
              reg41 <= reg31[(2'h2):(2'h2)];
              reg42 <= (((-{(reg31 ? wire38 : reg35)}) ~^ $unsigned((8'hb6))) ?
                  $signed($unsigned($signed((reg40 ^~ wire39)))) : $signed((|(!reg29[(3'h5):(2'h2)]))));
              reg43 <= $signed(reg29);
            end
          else
            begin
              reg41 <= (wire38[(3'h6):(1'h1)] == wire23);
              reg42 <= $unsigned((reg41 | reg25));
              reg43 <= wire20[(1'h1):(1'h1)];
              reg44 <= $signed($unsigned(((reg43[(4'he):(4'ha)] < $unsigned(reg24)) && ((^~reg24) != $unsigned((8'ha0))))));
            end
          reg45 <= {$signed(reg34),
              ($signed({(reg41 - wire39)}) ?
                  ((&(wire39 ?
                      reg30 : (8'hbc))) << ($unsigned(wire39) == ((8'h9c) != (8'hbc)))) : wire37[(1'h1):(1'h1)])};
          if ((((8'hbf) ? reg40 : (!reg32)) & reg40[(4'hc):(3'h5)]))
            begin
              reg46 <= ($signed($unsigned(wire23)) ?
                  {reg44[(1'h0):(1'h0)]} : $unsigned(reg42));
              reg47 <= (8'hac);
              reg48 <= reg41;
            end
          else
            begin
              reg46 <= ($unsigned({$signed($unsigned(reg26))}) == $unsigned(reg29));
              reg47 <= $signed((wire37[(1'h0):(1'h0)] - $signed(reg45)));
              reg48 <= (~|((!((wire36 ? reg27 : reg27) & $signed((8'hae)))) ?
                  ($signed($unsigned(reg24)) ?
                      reg26[(1'h0):(1'h0)] : {reg40[(4'hb):(3'h4)],
                          (!(8'h9d))}) : wire39));
              reg49 <= ($signed(wire37[(3'h5):(3'h5)]) ?
                  (reg44 ?
                      (+((8'ha0) >> (&wire21))) : {{(^(8'h9d))}}) : (reg28 * ($unsigned({reg47,
                      wire39}) != reg32[(5'h13):(1'h1)])));
              reg50 <= {reg24, $signed($unsigned($signed((8'hb6))))};
            end
          reg51 <= (reg24[(1'h0):(1'h0)] && (reg50[(1'h0):(1'h0)] & ($unsigned((wire19 || reg30)) && (8'hb9))));
        end
      else
        begin
          reg40 <= (~^(wire36 | {$unsigned($unsigned((8'h9c)))}));
          reg41 <= $unsigned($unsigned({{(reg51 ? (8'ha9) : (7'h43)),
                  $signed(reg40)},
              reg50}));
          reg42 <= $unsigned($unsigned($unsigned(reg47[(1'h0):(1'h0)])));
          reg43 <= reg40;
          if (reg40[(4'hc):(1'h1)])
            begin
              reg44 <= ({reg26, reg46} ?
                  reg46[(3'h7):(2'h3)] : $signed(reg48[(1'h0):(1'h0)]));
              reg45 <= ((((reg28[(3'h7):(3'h4)] || reg25[(1'h1):(1'h0)]) ^ ((reg28 ?
                      reg49 : (8'hb5)) ?
                  (&reg25) : (reg26 | wire19))) ^ $unsigned($unsigned({wire36}))) == (^((&reg30[(3'h6):(3'h4)]) ?
                  ((wire21 ? wire38 : reg27) > $unsigned(reg30)) : (reg40 ?
                      ((8'hbf) ? reg42 : wire36) : reg43[(1'h0):(1'h0)]))));
              reg46 <= $signed(((((8'haa) >= (~&wire20)) >>> reg35[(1'h0):(1'h0)]) >>> (!($signed(reg48) ?
                  (8'ha4) : (8'haf)))));
              reg47 <= (~$unsigned(reg30[(3'h5):(1'h0)]));
            end
          else
            begin
              reg44 <= ($signed(wire21[(1'h1):(1'h1)]) ?
                  reg34 : {($unsigned({reg40}) + $signed((reg26 && wire37)))});
              reg45 <= wire36[(2'h3):(2'h2)];
              reg46 <= ({wire22,
                      (~((wire20 ? reg33 : reg34) ?
                          $signed(reg43) : (~|(8'hb5))))} ?
                  wire22 : (~|((reg27[(1'h0):(1'h0)] - wire36[(2'h2):(2'h2)]) & ((8'h9d) >> reg43))));
            end
        end
      reg52 <= $signed(wire19);
      if (reg51[(1'h1):(1'h0)])
        begin
          reg53 <= $unsigned(reg33[(4'hf):(3'h4)]);
          reg54 <= $unsigned($signed(reg49[(4'ha):(3'h5)]));
        end
      else
        begin
          reg53 <= reg33[(4'hc):(3'h7)];
        end
      reg55 <= reg54[(1'h0):(1'h0)];
    end
endmodule

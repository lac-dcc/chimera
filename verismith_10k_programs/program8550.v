module top
#(parameter param95 = (~{({((8'h9d) <= (8'ha0)), ((8'hac) * (8'ha7))} != (((7'h42) >> (8'had)) ? ((8'hb4) | (8'hb9)) : {(8'hb3), (8'hb9)}))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire90;
  assign y = {wire94, wire93, wire92, wire90, (1'h0)};
  module5 #() modinst91 (wire90, clk, wire0, wire2, wire1, wire4, wire3);
  assign wire92 = wire2[(2'h3):(1'h1)];
  assign wire93 = $unsigned(((~(8'ha9)) || $unsigned(((7'h43) ?
                      $signed(wire4) : (wire0 ? wire2 : wire3)))));
  assign wire94 = wire1;
endmodule

module module5
#(parameter param89 = (~^{(8'ha0), (8'had)}))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire79;
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire27,
                 wire28,
                 wire79,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire11 = (($signed((&(wire6 << wire9))) * (wire8 ?
                          ((|wire10) >= $unsigned(wire7)) : wire9)) ?
                      $signed($signed(wire9)) : {(((wire8 && wire7) ?
                              (-wire7) : wire7[(1'h0):(1'h0)]) + $unsigned((wire9 ^~ wire9))),
                          $signed((|$unsigned(wire6)))});
  assign wire12 = ((~(~wire8)) - wire7);
  assign wire13 = $unsigned(wire8);
  assign wire14 = wire7[(1'h0):(1'h0)];
  assign wire15 = ((($unsigned(wire11[(1'h1):(1'h1)]) ^~ (!(wire8 ?
                      wire13 : (8'ha5)))) <= (wire10[(2'h3):(1'h0)] ?
                      $unsigned($unsigned(wire7)) : (-wire7))) >> ((~^$signed({(8'hbc)})) ?
                      ($signed({wire12}) >> ((wire6 ? wire10 : wire10) ?
                          wire10 : $signed(wire6))) : $signed({wire7[(1'h0):(1'h0)],
                          wire10})));
  always
    @(posedge clk) begin
      reg16 <= $unsigned((wire14 ?
          (|{((8'ha7) ? wire15 : (8'ha5)),
              {wire9}}) : (-$unsigned($signed(wire15)))));
      if (wire15[(2'h2):(2'h2)])
        begin
          if ($signed(((wire11 ?
              $unsigned($unsigned(wire6)) : {wire14}) ^ $unsigned($signed($signed(wire10))))))
            begin
              reg17 <= $signed({wire14[(2'h3):(2'h3)],
                  {(^(wire11 + wire8)), (wire10 ? (!wire13) : wire12)}});
              reg18 <= ($signed({(reg17[(3'h5):(2'h2)] <<< wire7[(2'h2):(2'h2)])}) ?
                  wire8 : reg16[(3'h4):(1'h1)]);
              reg19 <= $unsigned($signed(wire13));
            end
          else
            begin
              reg17 <= (wire6 ?
                  (~^$unsigned(((wire11 ?
                      wire8 : (8'ha1)) < $unsigned(reg17)))) : reg19);
            end
        end
      else
        begin
          if ($signed($signed($unsigned(wire11[(2'h3):(2'h2)]))))
            begin
              reg17 <= $signed(wire10);
              reg18 <= (7'h42);
            end
          else
            begin
              reg17 <= $unsigned(reg18);
              reg18 <= $signed((^$signed((+(wire8 ? (8'hbe) : reg16)))));
              reg19 <= (&$unsigned(((^(~^wire8)) > ($signed(wire13) ?
                  wire7 : $unsigned(wire7)))));
              reg20 <= {(~($signed((reg19 ?
                      wire14 : (8'hae))) || $signed((wire6 >= wire15))))};
              reg21 <= (~&(({wire9[(1'h0):(1'h0)]} || (((8'h9f) ^~ wire7) << wire10[(2'h3):(2'h3)])) == ($unsigned(reg16[(3'h6):(2'h3)]) >> $signed((wire7 ?
                  reg17 : wire8)))));
            end
          reg22 <= {{reg21}, $unsigned($signed(reg21))};
          reg23 <= ($signed((((~|reg18) ?
                  reg21[(3'h7):(3'h7)] : (wire13 ? reg19 : reg21)) ?
              $unsigned($signed(reg16)) : ($unsigned(reg21) ?
                  (wire9 ? wire8 : reg18) : (8'hb3)))) * {(8'hbc)});
          reg24 <= (^(~^(wire6[(1'h1):(1'h1)] ?
              reg19 : (((8'hba) >>> reg19) ? (wire6 <<< wire6) : (-wire13)))));
        end
      reg25 <= $signed((((&(!wire13)) ^ ((wire12 <= wire13) ?
              (8'h9e) : $unsigned((8'hbf)))) ?
          wire7[(1'h1):(1'h0)] : $signed(($signed(wire12) ?
              {wire10} : (wire14 | (8'ha9))))));
      reg26 <= $signed(wire13);
    end
  assign wire27 = {((~|$signed(((8'hba) ? (8'hb2) : reg17))) ?
                          $signed((((8'ha5) <= (8'had)) || reg22)) : reg18)};
  assign wire28 = ((({(wire27 ? reg26 : reg18), $signed(wire10)} ?
                          $unsigned(reg23) : (wire9 * (reg26 >>> (8'hb2)))) >>> ($unsigned(wire6[(3'h4):(1'h1)]) ?
                          reg16[(3'h7):(3'h7)] : $signed((!(8'ha4))))) ?
                      ((wire7[(1'h0):(1'h0)] ?
                          reg22[(4'ha):(3'h5)] : ($signed(reg17) ?
                              $unsigned(wire11) : wire14[(2'h2):(1'h0)])) - (8'hb1)) : {$unsigned((wire15[(2'h3):(2'h2)] ?
                              (wire8 <<< reg26) : $unsigned(reg26)))});
  always
    @(posedge clk) begin
      reg29 <= reg22[(3'h4):(2'h3)];
      if (reg26[(3'h7):(1'h0)])
        begin
          reg30 <= reg29[(1'h0):(1'h0)];
        end
      else
        begin
          if (((reg19[(3'h4):(3'h4)] ?
              reg29[(4'hf):(1'h0)] : wire7) < ($unsigned($signed((wire11 >>> wire14))) ?
              (8'had) : (({wire11, wire9} && (8'h9d)) ?
                  (wire27[(1'h0):(1'h0)] ?
                      {wire15} : $unsigned((8'hbf))) : (-reg26)))))
            begin
              reg30 <= $signed($signed($unsigned((^reg26))));
            end
          else
            begin
              reg30 <= (8'ha5);
            end
          reg31 <= wire14;
          reg32 <= wire27;
          if ((&(reg21 ? $signed(reg32) : $unsigned({{reg23, wire7}}))))
            begin
              reg33 <= $signed((reg18[(3'h6):(3'h5)] ?
                  ((wire14 ?
                          (wire6 ? (8'ha4) : reg18) : (reg31 ?
                              wire10 : wire13)) ?
                      (^~((8'ha1) ? reg16 : reg21)) : ({reg17} ?
                          $unsigned((8'hbc)) : reg21)) : (~^$signed(reg23[(2'h2):(1'h0)]))));
              reg34 <= (~&$signed($unsigned(reg20)));
              reg35 <= (reg20 ?
                  ((|((wire12 + wire15) ~^ (8'ha0))) ?
                      $unsigned({{(8'ha2)}}) : $unsigned((~|{reg19,
                          wire14}))) : reg25);
            end
          else
            begin
              reg33 <= ((wire12 ?
                      (((reg19 ? reg24 : reg24) || (7'h40)) ?
                          $signed(reg30) : {(^wire14),
                              wire9}) : wire8[(5'h12):(4'hc)]) ?
                  wire14 : $signed(wire13));
              reg34 <= (~|{wire12[(4'ha):(4'h8)],
                  $signed(($signed(reg23) ?
                      {(8'h9f), reg32} : $signed((8'hab))))});
              reg35 <= $signed(($unsigned($signed($unsigned((8'ha0)))) != {wire15}));
              reg36 <= (^~reg19);
              reg37 <= ((wire7[(1'h1):(1'h0)] ?
                      reg19[(4'hd):(4'hc)] : (&($unsigned(reg30) ?
                          (reg24 != (8'ha6)) : wire27))) ?
                  $unsigned(wire12) : reg17[(2'h3):(2'h2)]);
            end
        end
    end
  module38 #() modinst80 (.wire39(wire6), .wire43(reg19), .clk(clk), .y(wire79), .wire41(reg18), .wire42(reg34), .wire40(reg30));
  assign wire81 = reg33;
  assign wire82 = reg30;
  assign wire83 = $unsigned($signed($unsigned((~&(~^wire14)))));
  assign wire84 = (wire79 ? (8'ha6) : wire28[(2'h3):(2'h2)]);
  assign wire85 = wire8[(2'h2):(2'h2)];
  assign wire86 = $signed(wire84);
  assign wire87 = (&(($unsigned({reg36}) ?
                      reg34[(2'h3):(2'h2)] : (~&(~^(8'hac)))) ^~ ($signed(((8'hae) && wire15)) & ((wire79 ~^ wire82) && ((8'h9e) >= (8'ha7))))));
  assign wire88 = $unsigned($unsigned(wire86));
endmodule

module module38
#(parameter param77 = (-(((&((8'hbf) ? (7'h44) : (8'haa))) ? {(~^(8'ha6)), (^(8'h9c))} : ((~|(8'hb4)) ? (8'hbc) : ((8'ha9) ? (8'ha1) : (8'h9f)))) << ((~|(~|(8'ha6))) ? (((8'hb7) <= (8'hae)) << ((8'hbb) ? (7'h43) : (7'h40))) : (^((7'h42) & (8'hbb)))))), 
parameter param78 = (^~{{((param77 <= param77) ? {param77, param77} : (param77 ? param77 : (8'haa))), ((&param77) * (param77 * param77))}}))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire44;
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = {wire40};
  always
    @(posedge clk) begin
      reg45 <= wire41;
      reg46 <= (~(^~(((wire41 ? wire44 : wire41) ?
              $signed(wire42) : (wire43 ? wire40 : wire40)) ?
          $signed(wire42) : wire44[(4'hb):(2'h3)])));
      reg47 <= ($signed(((wire43[(4'he):(2'h3)] && (~&reg46)) ?
          wire40 : $unsigned(wire42))) != reg46[(1'h1):(1'h0)]);
      reg48 <= ($unsigned($unsigned(((~^(8'h9d)) ?
          (wire43 >= wire39) : wire41))) * $unsigned($signed((-(wire42 ?
          wire43 : (8'hba))))));
    end
  assign wire49 = (^reg48);
  assign wire50 = reg48[(3'h5):(2'h3)];
  assign wire51 = (({((8'haa) >= $signed(reg47))} ?
                      reg48[(3'h5):(3'h4)] : reg47[(2'h3):(2'h2)]) >>> $unsigned((&wire43)));
  assign wire52 = (8'ha8);
  assign wire53 = wire44[(4'he):(2'h3)];
  assign wire54 = reg46[(2'h2):(2'h2)];
  assign wire55 = {wire51[(3'h5):(1'h0)]};
  assign wire56 = $signed((wire53[(3'h4):(2'h3)] ?
                      wire55 : (&((wire55 != wire55) >> (wire54 || wire53)))));
  assign wire57 = $signed(((8'hbb) == $signed(reg48)));
  always
    @(posedge clk) begin
      if ({{$unsigned(wire42[(3'h6):(3'h4)])},
          ($unsigned((reg46[(1'h1):(1'h1)] ?
                  wire39[(4'he):(4'h8)] : {wire55})) ?
              wire42 : wire49[(3'h4):(1'h1)])})
        begin
          reg58 <= (wire49 * wire42[(4'h9):(3'h7)]);
          reg59 <= ((($unsigned($unsigned(reg45)) <= ((~wire51) ^ reg45[(1'h1):(1'h1)])) ?
              $unsigned((wire50[(1'h1):(1'h1)] ?
                  ((8'hb3) ? (8'hb9) : wire42) : (wire40 ?
                      wire43 : wire50))) : (wire44[(4'ha):(2'h3)] ?
                  wire57[(1'h1):(1'h1)] : {(wire55 ? wire43 : reg46),
                      $signed(wire53)})) <= $unsigned((~&wire54[(3'h5):(3'h5)])));
          reg60 <= (wire52[(3'h6):(2'h3)] ^ wire43[(1'h1):(1'h0)]);
          reg61 <= $unsigned($signed({wire49}));
        end
      else
        begin
          reg58 <= ($signed($signed($signed((wire50 ?
              wire42 : wire57)))) | {(~|(~$unsigned(wire50)))});
          reg59 <= (^~(($signed(((8'ha4) + reg61)) ?
              (&{wire49, wire54}) : reg58) && wire40[(1'h0):(1'h0)]));
        end
      reg62 <= {reg47, (^~$unsigned($signed($unsigned(reg58))))};
      reg63 <= $unsigned(wire55);
      if ((reg61 ?
          ((8'ha3) == reg48[(2'h3):(1'h1)]) : $signed($signed(wire54[(1'h1):(1'h1)]))))
        begin
          if ($unsigned($unsigned($signed((~|reg63[(2'h2):(1'h1)])))))
            begin
              reg64 <= $signed($unsigned(reg63));
            end
          else
            begin
              reg64 <= wire53[(1'h0):(1'h0)];
              reg65 <= $unsigned(reg45[(1'h0):(1'h0)]);
            end
          reg66 <= $signed((~reg65));
          reg67 <= (!reg59[(5'h13):(5'h10)]);
          if ($unsigned((+(+$unsigned(wire43[(3'h6):(3'h6)])))))
            begin
              reg68 <= reg59[(4'h8):(1'h0)];
              reg69 <= ((wire57[(1'h1):(1'h1)] ?
                  $signed(wire56) : (^{reg45[(1'h1):(1'h1)],
                      {wire52}})) >> $unsigned(((reg47 && wire51) < reg68[(2'h2):(1'h0)])));
            end
          else
            begin
              reg68 <= {$unsigned($signed($unsigned(wire40))),
                  (!$signed($signed($signed(reg58))))};
              reg69 <= (~&wire53[(1'h1):(1'h0)]);
            end
          reg70 <= (($unsigned(((reg47 ~^ reg69) * (reg60 ^~ wire42))) ^~ reg60) | ($signed(wire39[(3'h5):(3'h4)]) ?
              (^$signed($unsigned(wire56))) : $unsigned(reg63)));
        end
      else
        begin
          if (wire57[(1'h0):(1'h0)])
            begin
              reg64 <= (wire50 == (~|wire53));
              reg65 <= (((+((8'ha7) ~^ $signed(reg45))) ?
                  $unsigned($signed({reg59})) : (($signed(reg67) ?
                          reg70 : (reg69 ~^ wire54)) ?
                      $signed((wire40 <<< reg70)) : reg64[(1'h0):(1'h0)])) < (wire44[(1'h0):(1'h0)] >= (~&wire49)));
            end
          else
            begin
              reg64 <= $unsigned(($signed({$unsigned(reg63),
                  (wire56 ? reg61 : reg63)}) >= reg63[(2'h3):(1'h1)]));
              reg65 <= $signed($unsigned($signed(((wire40 != wire43) ?
                  $unsigned(wire43) : (~|wire52)))));
              reg66 <= ($signed($unsigned(($unsigned(reg46) ?
                  ((8'hb9) ?
                      reg65 : (8'hb5)) : (~wire44)))) << $unsigned(reg69));
            end
          reg67 <= ((wire50 * reg60) ?
              ($signed(reg46[(1'h0):(1'h0)]) * wire52[(4'h8):(2'h3)]) : reg68);
          if ((((wire49[(4'ha):(3'h7)] ?
                  (wire54 & reg60) : ($unsigned(reg65) << $unsigned(reg48))) ?
              reg64 : (8'hb6)) == $unsigned(wire41)))
            begin
              reg68 <= wire42[(4'hf):(2'h3)];
              reg69 <= (|(reg58[(4'hb):(3'h4)] + reg62[(5'h11):(1'h1)]));
              reg70 <= reg45;
              reg71 <= ($signed($signed($unsigned((wire57 && wire57)))) - reg68);
            end
          else
            begin
              reg68 <= {(~|($unsigned(wire56) >= ((wire54 ?
                      (8'h9c) : wire39) == {reg46})))};
              reg69 <= $unsigned({wire43});
            end
        end
    end
  assign wire72 = ((8'hbd) ?
                      wire56[(2'h3):(1'h0)] : ($unsigned(reg68) ?
                          $signed(wire53[(1'h1):(1'h1)]) : (((wire44 - wire51) ?
                              $unsigned(wire54) : (8'h9d)) * (wire44 ^ {reg45}))));
  assign wire73 = (+($unsigned(reg61[(3'h7):(3'h5)]) && reg63));
  assign wire74 = wire73;
  assign wire75 = reg61;
  assign wire76 = (~((reg45 ^ $signed(wire42[(5'h12):(3'h7)])) ?
                      wire55 : $unsigned((~|(+reg63)))));
endmodule

module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire97;
  assign y = {wire102, wire101, wire100, wire99, wire97, (1'h0)};
  module4 #() modinst98 (wire97, clk, wire2, wire0, wire3, wire1);
  assign wire99 = {wire97[(5'h12):(5'h10)],
                      $unsigned((((wire2 ? wire0 : wire1) ?
                          wire97 : $unsigned(wire3)) <<< $unsigned($unsigned(wire1))))};
  assign wire100 = {wire1[(5'h13):(3'h4)],
                       $signed((-($signed(wire2) ? (7'h44) : $signed(wire2))))};
  assign wire101 = (~($signed(wire97) ?
                       ($signed($unsigned(wire97)) ?
                           wire2 : ($unsigned(wire1) ?
                               $signed(wire0) : {wire3})) : ($unsigned($signed((7'h43))) ?
                           wire99 : wire1[(4'hb):(3'h4)])));
  assign wire102 = {({(!wire99)} >>> wire3[(3'h5):(2'h3)])};
endmodule

module module4
#(parameter param95 = ((7'h40) ? ((((8'hbd) & ((8'ha8) ? (8'hbd) : (8'hac))) > ({(8'had)} && ((8'hb3) ? (8'hac) : (8'ha2)))) ? ((((7'h44) - (7'h41)) <= (|(8'hbe))) & ({(8'hb7), (8'h9c)} + (+(8'hbd)))) : (8'ha2)) : ((((&(8'ha3)) ? ((8'h9d) - (8'h9e)) : (~|(8'h9d))) ? ({(8'hb7), (8'ha2)} ? (8'ha6) : (8'hb2)) : (!((8'ha6) ? (8'ha8) : (8'hae)))) ? {(((7'h41) || (8'h9d)) >= (8'hb7))} : ((~&{(8'ha2)}) ? {(8'hb5), (-(8'hb9))} : (((8'ha3) ~^ (8'hb5)) ^~ {(8'hb4)})))), 
parameter param96 = (({{(param95 ^~ param95), param95}, (((8'hac) ? param95 : (8'ha3)) >> {param95, param95})} * ({(param95 <<< param95)} * (param95 || (|param95)))) ? ((8'hbb) + (~((param95 >>> param95) || (param95 ? param95 : param95)))) : (param95 == (+param95))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire5;
  input wire [(4'ha):(1'h0)] wire6;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire79;
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire82,
                 wire81,
                 wire9,
                 wire10,
                 wire11,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire79,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire9 = $unsigned(wire7[(4'h8):(1'h0)]);
  assign wire10 = ($signed(((wire9 ?
                      {wire9} : wire7) >>> (wire9[(1'h1):(1'h0)] ?
                      (-wire9) : {wire6,
                          wire8}))) + ($unsigned($unsigned(wire8[(4'hf):(3'h5)])) ?
                      (+$unsigned((wire6 != wire9))) : $signed(wire9)));
  assign wire11 = wire6[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= ($signed({wire9}) ?
          (wire6 > $unsigned(((wire7 ?
              wire9 : wire10) != (wire7 << wire6)))) : $unsigned($unsigned($signed($signed(wire10)))));
      if ({(+(~|$unsigned($unsigned(wire11))))})
        begin
          reg13 <= reg12[(1'h1):(1'h0)];
          reg14 <= wire5[(5'h10):(3'h6)];
          reg15 <= $unsigned((((~|wire9) ?
                  (reg14 | wire5) : ($signed(reg14) * reg12)) ?
              wire10 : wire8));
        end
      else
        begin
          reg13 <= $unsigned(((8'ha5) << (($unsigned(reg12) + wire9) && wire6[(2'h3):(1'h1)])));
        end
      if ((+{($signed(reg15[(2'h3):(1'h0)]) + $unsigned({(8'h9f)})),
          $signed($unsigned(reg15[(3'h7):(3'h5)]))}))
        begin
          if (wire10)
            begin
              reg16 <= (wire7 ?
                  reg15 : (($unsigned((&(8'hb4))) ?
                          ((|reg12) ?
                              (8'hb5) : wire5) : (reg15[(4'hd):(4'hb)] >> wire9[(2'h2):(2'h2)])) ?
                      (~&$signed({wire5, reg14})) : wire6[(1'h0):(1'h0)]));
              reg17 <= (!reg15[(4'ha):(4'h8)]);
              reg18 <= (($signed((-(reg16 ?
                  wire11 : (8'ha3)))) || (~&$signed(reg15[(3'h6):(2'h3)]))) ^~ (^wire7));
              reg19 <= ($signed((reg15[(4'ha):(3'h4)] ?
                  $unsigned($signed(wire6)) : (wire11 << $signed(reg17)))) & reg15[(4'hc):(3'h5)]);
            end
          else
            begin
              reg16 <= (^(!wire5));
              reg17 <= ({($signed((reg18 < reg17)) ? (7'h40) : (~&(^reg19))),
                      $unsigned(reg18[(3'h4):(3'h4)])} ?
                  ((reg12[(1'h1):(1'h0)] ?
                      (8'ha2) : $signed(reg17)) ^ (((|reg17) ?
                      {reg15} : $signed(reg12)) && {wire8})) : wire10[(3'h7):(3'h7)]);
              reg18 <= wire11;
              reg19 <= $signed($unsigned(wire11));
              reg20 <= $unsigned(reg18);
            end
          reg21 <= reg16;
          reg22 <= reg20[(3'h4):(1'h1)];
        end
      else
        begin
          reg16 <= ($signed((wire5 | reg16[(5'h10):(4'hd)])) - reg21[(4'h9):(3'h4)]);
          reg17 <= wire6;
          if (($signed($signed($unsigned($signed(wire10)))) ^~ $unsigned($unsigned(reg22))))
            begin
              reg18 <= (!reg18);
            end
          else
            begin
              reg18 <= {$unsigned($signed($unsigned({(8'h9c), wire10})))};
              reg19 <= reg14;
              reg20 <= $signed($signed($unsigned($unsigned($unsigned(reg21)))));
              reg21 <= (($unsigned($unsigned($unsigned(wire9))) | {$unsigned($unsigned(reg17)),
                      $signed(reg21[(2'h3):(1'h1)])}) ?
                  $signed((~^(reg18[(2'h2):(2'h2)] ?
                      reg12[(3'h5):(1'h0)] : (8'hbc)))) : $signed(reg12));
            end
          reg22 <= $signed($signed($signed(((reg17 ? (8'hb4) : wire8) ?
              $unsigned(reg20) : (wire7 ? wire11 : wire10)))));
          reg23 <= {(wire7[(2'h2):(1'h0)] ?
                  {$signed((reg13 && (7'h41)))} : $unsigned(((^(7'h42)) - (!wire5))))};
        end
      if ((!(^reg16[(2'h2):(1'h1)])))
        begin
          reg24 <= reg17;
          reg25 <= ($signed({$signed((reg21 * wire8)),
              ({wire6} >= {reg19})}) < (~^($unsigned(reg19) <= ((reg12 != wire9) ?
              wire9 : (reg24 >> (7'h40))))));
          reg26 <= wire7;
          reg27 <= {(|(((~^(8'h9f)) ?
                      reg13[(4'h9):(3'h4)] : reg24[(4'ha):(2'h3)]) ?
                  ($signed(wire8) ?
                      (-reg13) : wire6) : $unsigned(reg19[(1'h0):(1'h0)]))),
              reg18[(2'h3):(2'h3)]};
        end
      else
        begin
          reg24 <= reg14[(5'h13):(4'hb)];
          reg25 <= (8'hba);
          if ($signed((+$unsigned(reg17))))
            begin
              reg26 <= (reg16 && (^~wire10[(1'h0):(1'h0)]));
              reg27 <= {$signed(({(&wire10), (~|reg24)} ?
                      ($unsigned(reg26) || reg15[(4'hb):(4'ha)]) : reg15[(3'h7):(1'h1)]))};
              reg28 <= $signed({($unsigned((wire11 - reg15)) ?
                      (~|(reg20 ? reg24 : reg18)) : reg26[(4'h9):(3'h7)])});
              reg29 <= $unsigned((+wire7));
            end
          else
            begin
              reg26 <= {$unsigned($signed({reg23[(3'h5):(2'h2)],
                      {reg21, wire6}})),
                  $unsigned(reg15[(1'h0):(1'h0)])};
            end
          reg30 <= reg26;
        end
    end
  assign wire31 = reg28;
  assign wire32 = {$unsigned((~($signed(reg16) ?
                          (reg14 ? reg13 : reg23) : (reg13 >= reg30)))),
                      $unsigned((^~(~^((7'h44) - reg27))))};
  assign wire33 = reg18;
  assign wire34 = reg17[(1'h1):(1'h0)];
  assign wire35 = reg14;
  assign wire36 = {reg20, reg21[(4'h9):(3'h4)]};
  assign wire37 = (8'hbf);
  assign wire38 = (((-(reg28[(3'h4):(2'h3)] ?
                          wire36[(1'h1):(1'h0)] : reg29[(3'h6):(3'h4)])) ?
                      (reg21 ?
                          $signed((^wire33)) : (!$unsigned(wire10))) : ((&$unsigned(reg28)) >= (7'h43))) & ($unsigned(((reg13 ?
                      wire32 : reg21) >>> reg27)) || reg22[(1'h1):(1'h0)]));
  assign wire39 = $signed(reg16);
  module40 #() modinst80 (wire79, clk, wire35, reg24, reg13, reg14);
  assign wire81 = (&$unsigned((~|$signed((wire39 ? reg27 : reg15)))));
  assign wire82 = (~$unsigned((+$signed(reg13[(4'h9):(2'h2)]))));
  always
    @(posedge clk) begin
      reg83 <= $unsigned((+wire31));
      reg84 <= reg17;
      reg85 <= ((~|(|wire34[(3'h4):(3'h4)])) ?
          $signed(reg13[(4'h9):(2'h2)]) : (~^((8'hbf) ?
              {(|(7'h40)), ((7'h42) ? reg20 : reg23)} : reg28)));
      if ((^(&($unsigned((reg19 ? reg17 : wire11)) ?
          wire31[(1'h0):(1'h0)] : {reg17, (wire82 * reg85)}))))
        begin
          reg86 <= $signed((+$signed((&{reg30}))));
          reg87 <= $unsigned($unsigned((reg28[(3'h4):(2'h2)] ?
              wire9[(4'hd):(4'hc)] : $unsigned($signed(reg13)))));
          reg88 <= $unsigned(wire6[(4'ha):(2'h2)]);
          reg89 <= $signed($signed(reg27[(4'hf):(2'h2)]));
        end
      else
        begin
          reg86 <= (wire79[(3'h5):(1'h0)] ?
              (reg30[(1'h1):(1'h1)] - $unsigned((wire81 <= (wire36 ?
                  (8'ha3) : wire38)))) : ($unsigned((+$signed(reg22))) << $unsigned($unsigned($unsigned(reg22)))));
        end
      reg90 <= reg27;
    end
  assign wire91 = {{$signed((~&(&reg83)))},
                      $signed((|$unsigned($signed((8'ha6)))))};
  assign wire92 = reg87;
  assign wire93 = $signed(((~|reg24[(4'hb):(3'h5)]) == wire10[(2'h3):(1'h1)]));
  assign wire94 = {(|(~^$signed((wire37 || reg86)))),
                      $signed((~^{(wire91 <= reg22), $signed(reg24)}))};
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire43;
  input wire signed [(3'h7):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire56;
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire69,
                 wire68,
                 wire56,
                 reg71,
                 reg70,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= wire43;
      if ($unsigned(((^$unsigned($unsigned(wire42))) + reg45)))
        begin
          reg46 <= (7'h41);
          reg47 <= $signed($unsigned((~^reg46[(2'h2):(1'h0)])));
          reg48 <= ($unsigned((~$signed((8'hb8)))) * (-$unsigned($signed(((8'hb0) ?
              reg46 : reg45)))));
          if ((wire43[(2'h2):(2'h2)] ?
              reg46[(4'hc):(3'h7)] : (reg48[(2'h2):(2'h2)] ?
                  $unsigned(reg45) : reg48)))
            begin
              reg49 <= wire43;
              reg50 <= reg45[(1'h0):(1'h0)];
              reg51 <= wire43[(4'h9):(1'h0)];
            end
          else
            begin
              reg49 <= reg50;
              reg50 <= $unsigned((reg45 <<< {(&wire44),
                  ($unsigned(reg49) == $signed(reg46))}));
              reg51 <= reg48[(2'h2):(1'h0)];
              reg52 <= (((wire41 ?
                  ((reg48 ^ wire42) - (+reg51)) : $unsigned((reg49 ?
                      reg49 : wire44))) && {(reg49[(4'hb):(3'h6)] ^~ wire42)}) >>> {reg46[(5'h13):(1'h0)]});
              reg53 <= $signed({reg47[(3'h7):(3'h6)]});
            end
        end
      else
        begin
          if ($signed(reg50))
            begin
              reg46 <= reg48[(2'h3):(1'h1)];
              reg47 <= reg51;
              reg48 <= (+$signed(($unsigned($signed(reg53)) & ((reg51 ?
                      (8'ha6) : (8'hbc)) ?
                  $unsigned(reg48) : $signed(reg53)))));
              reg49 <= $unsigned((8'ha3));
              reg50 <= {$signed((|(reg47[(3'h4):(1'h1)] * (reg51 ?
                      (8'h9f) : reg50))))};
            end
          else
            begin
              reg46 <= reg47;
            end
        end
      reg54 <= ((8'hb9) ?
          {wire43[(3'h4):(1'h1)], {reg48}} : reg46[(2'h2):(1'h1)]);
      reg55 <= $unsigned($unsigned({((reg47 ? reg46 : reg48) ?
              (reg46 ? (8'ha4) : reg50) : $unsigned((8'hb8)))}));
    end
  assign wire56 = reg52;
  always
    @(posedge clk) begin
      if (reg45[(2'h3):(2'h3)])
        begin
          if (reg46[(1'h1):(1'h0)])
            begin
              reg57 <= reg53[(4'hf):(3'h6)];
              reg58 <= reg52[(4'hd):(4'hb)];
              reg59 <= $unsigned((+$signed((~|$signed(wire43)))));
            end
          else
            begin
              reg57 <= $signed(reg57);
              reg58 <= (({{((8'h9d) ? (8'h9d) : reg48), {wire43}},
                      wire41} >= $unsigned(((8'haf) != ((8'ha8) ?
                      (8'h9c) : reg54)))) ?
                  ($signed((8'hac)) >>> ((^~(reg47 ? (8'hbb) : wire41)) ?
                      (wire56[(3'h6):(3'h6)] ?
                          (reg45 ?
                              wire41 : reg45) : {reg54}) : reg47)) : (reg51[(4'h8):(4'h8)] ~^ $unsigned((^~(-wire43)))));
              reg59 <= (~(~&$unsigned(wire42[(2'h3):(1'h1)])));
            end
          reg60 <= wire41[(3'h7):(1'h0)];
          reg61 <= $unsigned(($unsigned((8'ha5)) ?
              reg46[(4'hf):(4'ha)] : (wire44 ?
                  (reg58 ?
                      wire43[(1'h0):(1'h0)] : ((8'hac) ~^ (8'hba))) : reg49[(4'hb):(4'h9)])));
        end
      else
        begin
          reg57 <= (wire41 * reg48[(2'h3):(2'h2)]);
          reg58 <= reg49;
          if (reg61)
            begin
              reg59 <= (((~{reg60, (+reg54)}) ?
                  (+($unsigned(reg60) ?
                      $unsigned(wire43) : (+reg49))) : $unsigned(((reg61 | (8'ha2)) ?
                      reg53 : {reg58,
                          reg59}))) ^~ $unsigned(reg60[(3'h5):(1'h0)]));
              reg60 <= $signed(((7'h40) ~^ ((reg51[(3'h5):(3'h5)] ^ (wire41 ?
                  (8'hba) : reg60)) <<< (wire43[(5'h11):(3'h4)] - (wire41 ?
                  wire41 : reg54)))));
            end
          else
            begin
              reg59 <= {$signed($signed(reg57[(1'h1):(1'h0)]))};
            end
          reg61 <= $unsigned((($signed((wire56 ? reg53 : (8'hbd))) ?
                  ((wire56 + reg55) ? (^reg60) : (8'hba)) : {(reg46 > (8'haf)),
                      ((8'ha0) ^ wire44)}) ?
              {$signed(reg54[(4'hd):(4'h9)]),
                  $signed((reg53 ? wire56 : reg47))} : reg47));
          reg62 <= (((~&reg53) ?
              (((^~reg50) ^ ((8'ha5) ? (8'hbf) : wire43)) ?
                  {$signed(reg53), $signed(wire44)} : {(reg51 ? wire43 : reg45),
                      reg55}) : $unsigned($signed({wire56,
                  wire41}))) && (({(8'hb5), $signed(wire56)} ?
                  $signed(reg46[(3'h5):(1'h0)]) : reg46) ?
              $unsigned(reg47) : ((reg53 >>> (reg49 ? reg53 : (8'hb3))) ?
                  reg60 : ((wire43 < reg60) ?
                      $signed(wire44) : reg57[(1'h0):(1'h0)]))));
        end
    end
  always
    @(posedge clk) begin
      reg63 <= reg61[(2'h2):(1'h1)];
      reg64 <= {reg52[(4'hb):(4'h8)]};
      reg65 <= $signed((((wire43 ?
          (~|wire56) : $signed(reg57)) ^~ (!((8'ha0) > reg51))) < ($unsigned((reg64 ?
              wire42 : reg45)) ?
          reg51 : (7'h41))));
      reg66 <= (((|(~&(7'h43))) > ((8'hb9) ?
          $signed($unsigned(wire43)) : $signed((wire56 ?
              reg63 : reg55)))) == wire56);
      reg67 <= reg54;
    end
  assign wire68 = (((-($unsigned((8'hbd)) & (reg51 ?
                          (7'h44) : reg62))) + wire43[(4'hb):(4'h8)]) ?
                      $unsigned($unsigned((7'h41))) : (8'hb3));
  assign wire69 = $unsigned(($signed(({wire68, (8'hb8)} ?
                          {reg45} : $signed(wire44))) ?
                      (&wire68[(2'h3):(2'h2)]) : $unsigned(((~&reg58) ?
                          $signed((8'ha9)) : {reg59, wire44}))));
  always
    @(posedge clk) begin
      reg70 <= $signed(reg62[(4'h9):(4'h9)]);
      reg71 <= wire56;
    end
  assign wire72 = (8'h9d);
  assign wire73 = (&$unsigned((+{reg62[(5'h11):(4'he)]})));
  assign wire74 = reg71;
  assign wire75 = ({(~|(reg57 ? (reg45 >> (8'haf)) : (reg51 || reg49))),
                          (|((reg52 ? reg47 : wire69) & (reg58 == (8'hbb))))} ?
                      reg54 : {$signed(($unsigned(wire43) ?
                              reg55[(3'h6):(2'h2)] : $unsigned(reg50))),
                          (~^$unsigned($signed(reg60)))});
  assign wire76 = (reg45 ?
                      $signed((~&$unsigned((wire75 ?
                          reg45 : reg48)))) : {$unsigned((reg70[(3'h5):(2'h2)] | wire43)),
                          (8'h9c)});
  assign wire77 = reg64;
  assign wire78 = ((~reg65) >= $signed(({reg59[(1'h0):(1'h0)], $signed(reg70)} ?
                      (((8'hb5) ?
                          reg54 : wire44) && $signed(wire73)) : reg52[(3'h4):(1'h0)])));
endmodule

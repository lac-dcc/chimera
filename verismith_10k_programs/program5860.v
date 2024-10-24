module top
#(parameter param89 = (({((|(8'hbc)) ? ((8'hbb) > (8'ha5)) : (8'hb3)), ({(8'haa), (8'ha7)} <= ((8'haf) ? (8'ha8) : (8'h9d)))} & (&(&{(8'hab), (8'h9d)}))) ? (8'ha1) : ((({(8'had)} ? {(8'hbf)} : ((8'haa) ? (7'h43) : (8'hbe))) ? ((+(8'hb8)) ? ((8'hae) | (8'hb3)) : ((8'hac) ? (8'hb3) : (8'hb5))) : (((8'hba) ? (8'ha5) : (8'hbd)) ? (~&(7'h44)) : (&(8'ha2)))) ? (((~^(8'ha5)) <= {(8'h9c)}) + {(~&(8'hb9))}) : (8'ha4))), 
parameter param90 = param89)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  assign y = {wire87,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg11,
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
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = wire5[(3'h5):(2'h2)];
  assign wire7 = ({(wire6[(4'hb):(1'h0)] & $signed($signed(wire2))),
                         ((wire3[(4'hb):(3'h4)] >> wire1) < ($unsigned(wire4) ?
                             $signed(wire1) : wire1[(4'h9):(3'h7)]))} ?
                     (+wire5) : {$unsigned(($unsigned(wire0) ?
                             wire5[(1'h0):(1'h0)] : (wire5 != wire3))),
                         (((+wire0) ? wire6 : (wire3 ? wire0 : wire4)) ?
                             ($unsigned((8'ha2)) > ((8'hbf) && wire0)) : ((~|wire6) <<< (wire1 || (8'h9e))))});
  assign wire8 = $unsigned($signed($signed(((8'ha3) ?
                     $unsigned(wire6) : $signed(wire5)))));
  assign wire9 = wire3;
  assign wire10 = wire2;
  always
    @(posedge clk) begin
      reg11 <= {$signed($unsigned((+$unsigned(wire5)))), {wire5}};
      reg12 <= ({$signed((((8'hbc) | reg11) >= wire1))} ^~ $unsigned(wire1));
      if (($unsigned({{wire5[(2'h3):(2'h2)], wire3[(4'h9):(2'h2)]}}) ?
          $signed(wire2[(2'h2):(1'h1)]) : wire5[(3'h6):(3'h5)]))
        begin
          if ($unsigned(wire9))
            begin
              reg13 <= $unsigned($signed($signed((~^(wire1 < (8'hb0))))));
            end
          else
            begin
              reg13 <= (($signed($unsigned($unsigned(wire9))) ^ (8'hbd)) ?
                  wire1[(2'h2):(1'h0)] : $unsigned((($unsigned((8'ha2)) ^~ reg12[(4'hd):(2'h2)]) ^~ (~^$signed(wire7)))));
              reg14 <= (wire9[(3'h5):(3'h5)] ~^ $signed($signed($signed((~reg12)))));
              reg15 <= (~&(!$unsigned({wire0, (~wire7)})));
              reg16 <= (wire8[(3'h6):(2'h2)] ?
                  (^reg15[(3'h5):(3'h5)]) : ((~|((wire5 | wire8) & $unsigned(reg15))) <= ($signed($signed(reg14)) ?
                      ($unsigned(reg13) ? $unsigned(wire3) : wire2) : {(wire4 ?
                              (8'hb8) : reg15)})));
            end
          reg17 <= (reg12 ?
              {$unsigned(((~|wire1) - reg16[(1'h1):(1'h0)]))} : wire2);
          reg18 <= (&(~&($signed((reg13 | reg17)) && wire7)));
          reg19 <= reg16;
          reg20 <= $signed(reg15);
        end
      else
        begin
          reg13 <= $unsigned((reg13[(3'h6):(2'h3)] ?
              $unsigned($unsigned((wire4 & wire6))) : {(~$unsigned(wire0))}));
          if ((($signed((^~(+wire0))) ? (^~$unsigned((!reg18))) : (^reg20)) ?
              ((~wire0) ?
                  $signed(((wire5 ? reg16 : reg16) ?
                      (-wire7) : {wire4})) : ((^$unsigned(wire4)) <= $signed(reg11))) : $signed((7'h41))))
            begin
              reg14 <= (wire4 == wire3[(4'hd):(4'hc)]);
              reg15 <= ($unsigned((|reg14[(4'h9):(1'h0)])) ?
                  (~reg13) : $unsigned((~&$signed((reg12 ^ wire10)))));
            end
          else
            begin
              reg14 <= $signed(reg14[(3'h4):(2'h2)]);
              reg15 <= $unsigned(wire2[(3'h4):(3'h4)]);
              reg16 <= reg19[(3'h6):(3'h4)];
              reg17 <= wire3[(4'hf):(3'h4)];
            end
          reg18 <= $unsigned(($signed((8'ha1)) ?
              (reg15 ?
                  (wire5[(3'h4):(3'h4)] ?
                      (reg14 ? wire9 : reg11) : {reg19,
                          (7'h41)}) : $signed($signed(wire4))) : {{{wire10,
                          wire5},
                      (reg17 ? wire4 : wire7)},
                  ((^~reg16) ^~ wire9[(3'h4):(1'h1)])}));
        end
      reg21 <= (reg14[(3'h4):(2'h3)] ?
          (!{(wire9[(2'h3):(1'h0)] ? wire6[(3'h4):(3'h4)] : $unsigned((8'h9f))),
              (~wire2)}) : {wire6[(3'h4):(1'h0)],
              {(reg19[(5'h11):(3'h4)] ? $unsigned(wire7) : $unsigned(wire1)),
                  ($unsigned(wire2) ?
                      ((8'hab) ^~ wire8) : $unsigned((8'hb2)))}});
      reg22 <= $unsigned((&$signed((wire8[(2'h3):(1'h1)] ?
          (wire3 ? (8'haf) : wire10) : (~&reg18)))));
    end
  module23 #() modinst88 (wire87, clk, wire10, wire3, wire4, wire0, reg21);
endmodule

module module23
#(parameter param85 = ({{((^~(7'h42)) ? {(8'haa), (8'hae)} : ((8'h9e) * (8'h9f)))}} ? (((((7'h40) ? (7'h44) : (7'h44)) ? ((8'haf) * (8'hac)) : (8'hbf)) ? (~((8'ha0) ? (8'hbe) : (8'h9d))) : (((8'hbb) | (8'hab)) >>> {(8'hb6)})) <= (|(((7'h40) ^ (8'hb6)) ? ((8'hae) != (7'h44)) : {(8'h9f), (7'h44)}))) : {({(8'hb8)} ? (~|((8'hb9) >> (8'hb6))) : (!((8'had) ~^ (8'hbf))))}), 
parameter param86 = (~^({((param85 ? (8'hb2) : param85) ? (param85 ? param85 : param85) : param85), ({param85, param85} ? param85 : (param85 ^~ param85))} >> (((param85 ^~ param85) * param85) & (~&{param85})))))
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire80;
  assign y = {wire84, wire83, wire82, wire29, wire30, wire31, wire80, (1'h0)};
  assign wire29 = $signed((wire28[(5'h11):(3'h5)] + ((wire24 ?
                      wire27[(3'h5):(1'h1)] : wire27[(2'h3):(2'h3)]) | $unsigned(((8'ha1) ?
                      wire27 : (8'hb5))))));
  assign wire30 = (7'h40);
  assign wire31 = (wire26 ?
                      wire26 : (^$unsigned($unsigned((wire25 >= wire26)))));
  module32 #() modinst81 (wire80, clk, wire25, wire29, wire31, wire27, wire26);
  assign wire82 = $unsigned((((~&wire31) ?
                      $signed($unsigned(wire80)) : (&(wire29 >= (8'hb5)))) | ($unsigned({wire30,
                          wire24}) ?
                      $unsigned($unsigned(wire26)) : {$unsigned(wire80),
                          (wire25 ^~ wire27)})));
  assign wire83 = (wire24[(2'h2):(2'h2)] ~^ ((wire31[(2'h2):(2'h2)] + (-(wire80 ?
                      wire28 : wire82))) > ((~^wire27[(2'h2):(1'h1)]) ?
                      wire24 : wire29)));
  assign wire84 = wire27[(1'h1):(1'h0)];
endmodule

module module32
#(parameter param79 = ((((^((8'ha7) ? (7'h44) : (8'ha7))) > (((8'ha4) > (8'hb2)) && (8'h9c))) & ({{(7'h43), (8'hb0)}, ((7'h41) ~^ (7'h43))} ? {((8'h9f) || (8'ha9)), (~|(8'hbf))} : (^((8'hba) ? (8'h9f) : (8'hb8))))) >> ((|((|(8'ha5)) * {(8'ha9), (8'hb1)})) > ((((8'hbc) ? (8'hb1) : (7'h44)) <<< ((8'ha4) == (8'ha7))) ^ ({(8'ha7), (8'ha7)} ? ((8'h9c) ? (8'hbe) : (8'h9c)) : {(8'hb6), (8'hab)})))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire37;
  input wire signed [(4'hb):(1'h0)] wire36;
  input wire signed [(4'hf):(1'h0)] wire35;
  input wire [(2'h3):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire61,
                 wire60,
                 wire56,
                 wire55,
                 wire39,
                 wire38,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg59,
                 reg58,
                 reg57,
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
                 (1'h0)};
  assign wire38 = ((8'hbd) ? wire37 : {((~wire37) * wire33[(1'h0):(1'h0)])});
  assign wire39 = $unsigned(wire37[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      reg40 <= wire36[(3'h7):(3'h6)];
      reg41 <= (&($signed(wire37[(3'h7):(3'h4)]) ?
          (-(8'hab)) : (wire37[(3'h5):(3'h4)] > wire36[(3'h5):(1'h0)])));
      if (wire38)
        begin
          reg42 <= $unsigned(wire35);
        end
      else
        begin
          reg42 <= wire34[(2'h2):(1'h1)];
          reg43 <= ({$unsigned(wire38)} ? (8'ha8) : wire34);
        end
      reg44 <= $signed($unsigned((~|$signed(reg42))));
    end
  always
    @(posedge clk) begin
      if ((^~{reg40[(2'h3):(2'h3)]}))
        begin
          reg45 <= (reg42[(4'hd):(4'h8)] <<< (^~(^wire37)));
          reg46 <= wire37[(3'h6):(3'h5)];
        end
      else
        begin
          if (wire35[(3'h7):(1'h1)])
            begin
              reg45 <= reg46[(2'h3):(2'h3)];
              reg46 <= $signed((~|reg43));
              reg47 <= {$signed({wire38, reg43})};
              reg48 <= reg45;
            end
          else
            begin
              reg45 <= ((+(((-wire34) && $signed(wire35)) ?
                      reg47[(1'h1):(1'h1)] : $unsigned(reg46))) ?
                  wire34[(2'h3):(1'h1)] : $signed(({$signed(reg48)} ?
                      $signed($unsigned(wire33)) : ((reg41 ? wire39 : wire35) ?
                          reg46 : $unsigned(wire38)))));
              reg46 <= wire39[(1'h1):(1'h1)];
              reg47 <= wire39;
              reg48 <= (~^wire39);
              reg49 <= wire35[(4'hd):(4'hb)];
            end
          reg50 <= reg47[(4'hd):(4'h9)];
          reg51 <= $signed(reg40[(3'h5):(1'h1)]);
        end
      reg52 <= reg44;
      reg53 <= (reg51[(3'h5):(3'h5)] < ((((reg47 ?
          reg47 : wire34) ~^ $unsigned(wire37)) == (-((8'h9c) * (7'h40)))) >> (8'hb4)));
      reg54 <= (($signed($unsigned((|reg50))) ?
          (+(((8'hb6) ?
              wire39 : reg48) || $signed(wire34))) : wire33[(2'h2):(1'h1)]) || (~&(~(&(reg42 != reg51)))));
    end
  assign wire55 = reg54[(3'h5):(2'h3)];
  assign wire56 = $unsigned((!reg44[(5'h10):(1'h1)]));
  always
    @(posedge clk) begin
      reg57 <= (+$unsigned(($unsigned(reg41[(1'h1):(1'h1)]) ?
          (8'ha0) : $signed($unsigned(reg40)))));
      reg58 <= $unsigned(wire34);
      reg59 <= $unsigned((|{reg45[(4'h9):(3'h5)], $unsigned(wire38)}));
    end
  assign wire60 = $signed((reg42[(4'he):(4'h8)] == {(((8'ha4) ? reg51 : reg43) ?
                          ((8'hb8) * wire39) : $signed(reg43)),
                      (reg42[(4'h9):(3'h6)] ? (^reg53) : reg43)}));
  assign wire61 = (&(7'h42));
  always
    @(posedge clk) begin
      if ((8'hae))
        begin
          if (reg50)
            begin
              reg62 <= wire38;
              reg63 <= (+reg50);
              reg64 <= $signed((|((&(wire55 ? reg40 : reg52)) ?
                  wire35 : ((^reg45) >= $unsigned(reg52)))));
            end
          else
            begin
              reg62 <= (wire36[(3'h5):(2'h2)] || ({$signed($signed(wire33))} ?
                  ($signed({wire55,
                      reg63}) == wire56[(4'ha):(3'h7)]) : $unsigned(((wire34 ?
                      wire39 : reg40) * reg50[(5'h10):(4'hd)]))));
              reg63 <= $signed((((reg59 < reg47[(3'h4):(2'h3)]) >>> $unsigned(reg51[(3'h5):(3'h4)])) * ($unsigned($unsigned(reg44)) ?
                  $signed(reg44) : reg45)));
              reg64 <= (+reg44);
            end
          reg65 <= (wire60[(4'hb):(3'h7)] != {reg54[(2'h3):(1'h0)],
              $unsigned($signed({wire56, (8'ha2)}))});
        end
      else
        begin
          reg62 <= reg57[(3'h4):(3'h4)];
          if (wire34[(2'h3):(2'h2)])
            begin
              reg63 <= (reg62[(3'h7):(1'h1)] | reg49);
            end
          else
            begin
              reg63 <= reg63[(4'ha):(4'h9)];
              reg64 <= reg59;
            end
          reg65 <= (({$unsigned((7'h43)), $unsigned($signed(wire33))} ?
                  ((|(+reg53)) ?
                      (-reg51) : $unsigned($unsigned((8'hb3)))) : (reg51 ?
                      ({(8'ha5), reg40} ?
                          (~|wire60) : $unsigned((8'hbc))) : $unsigned({reg47,
                          wire55}))) ?
              wire39 : ((&(reg57[(1'h0):(1'h0)] & reg44)) <= (reg50[(4'hb):(3'h6)] ?
                  $signed($signed(wire60)) : reg40)));
          reg66 <= $signed(reg63);
          reg67 <= wire36;
        end
      reg68 <= reg58[(1'h0):(1'h0)];
      reg69 <= $signed(wire38[(3'h5):(1'h0)]);
    end
  assign wire70 = $unsigned(($signed(((reg43 != wire36) ?
                          (reg63 < wire38) : $signed(reg68))) ?
                      {(wire38 ? reg68 : $signed(reg45)),
                          (reg41 ?
                              (reg63 ?
                                  (8'hb2) : wire55) : wire56[(4'ha):(4'h8)])} : $unsigned($unsigned(wire61))));
  assign wire71 = wire60;
  assign wire72 = (^reg66);
  assign wire73 = {(((~&(~|reg48)) ?
                          (8'ha4) : ($unsigned(wire60) ?
                              reg54 : $signed(wire72))) ^~ wire38[(3'h4):(1'h1)])};
  assign wire74 = ((~^(($signed(wire71) ?
                          (reg40 ? reg63 : wire71) : wire61[(3'h5):(2'h3)]) ?
                      ((reg51 < (8'hb5)) <= $unsigned(reg62)) : reg43)) ^ ($signed(((wire38 ?
                      reg66 : wire34) & ((8'hb2) ?
                      (8'hb4) : (8'hbb)))) && reg43[(2'h3):(1'h1)]));
  assign wire75 = $unsigned($unsigned($signed(wire38)));
  assign wire76 = ($signed($signed((~((8'h9f) ?
                      wire74 : reg41)))) == $unsigned(wire39));
  assign wire77 = $signed({($signed((wire55 ? (8'hb4) : reg51)) ?
                          wire35 : wire56[(5'h11):(3'h5)]),
                      $signed($signed($unsigned(wire73)))});
  assign wire78 = reg45;
endmodule

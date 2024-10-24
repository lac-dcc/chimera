module top
#(parameter param68 = ((+((^((8'ha3) < (8'haf))) ? {((8'ha0) ? (8'hac) : (8'ha4)), {(8'ha1)}} : (~&((8'hbe) < (8'hb4))))) ? (~^(+(((8'hb3) ? (8'hb6) : (8'ha2)) ^~ ((8'h9d) == (8'hae))))) : {(^~((&(8'h9e)) ? {(8'hbc), (8'hb7)} : (~^(8'ha1)))), (^(((8'ha7) > (8'hba)) + (~&(8'hb7))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire55,
                 wire27,
                 wire19,
                 wire18,
                 wire5,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ($unsigned(wire2) * (+({$unsigned(wire1),
                     {wire1, (8'ha5)}} <<< $signed(wire4[(3'h6):(1'h1)]))));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          reg6 <= ($unsigned(wire3) ?
              ((wire2[(3'h6):(3'h4)] ?
                      (wire3[(2'h2):(2'h2)] ?
                          wire3[(4'h8):(1'h1)] : wire4[(5'h12):(4'ha)]) : $unsigned((wire4 ?
                          wire1 : wire3))) ?
                  ((wire0[(5'h12):(5'h10)] ?
                          (wire3 < wire2) : $unsigned(wire1)) ?
                      $unsigned(wire3) : (wire3[(1'h1):(1'h0)] ?
                          wire2 : wire5)) : {({wire3} ^~ $unsigned(wire0))}) : ($unsigned((8'ha2)) ?
                  wire4[(4'he):(4'he)] : wire1[(3'h5):(1'h1)]));
        end
      else
        begin
          reg6 <= $signed($unsigned((^$signed((~&reg6)))));
          reg7 <= wire3[(4'h9):(1'h1)];
          reg8 <= (reg6[(3'h7):(1'h0)] ?
              (^($signed($unsigned(wire1)) && $unsigned((~wire5)))) : ($signed($signed($unsigned(reg6))) >>> wire1));
          reg9 <= (^~(^~(-(~^$signed(reg8)))));
          reg10 <= (~^(8'haa));
        end
      reg11 <= ((^~$signed((reg9[(3'h6):(1'h0)] >>> (wire4 == wire5)))) & (reg8[(3'h4):(1'h0)] && ((((8'hb6) != (8'had)) ?
          reg6[(2'h3):(1'h1)] : (reg7 ^~ (8'hb1))) + $signed($unsigned((8'ha2))))));
      reg12 <= wire3[(2'h3):(1'h1)];
      reg13 <= (reg9[(4'hb):(3'h5)] ^~ ($unsigned((^reg11)) == $signed(((~|reg7) ?
          reg6 : wire3))));
    end
  always
    @(posedge clk) begin
      reg14 <= ({(!wire4[(3'h5):(1'h0)]),
          $unsigned(((&wire0) ?
              (reg10 ?
                  reg9 : reg12) : $unsigned(wire3)))} || ($unsigned(reg12[(2'h2):(1'h0)]) ?
          (^~{$signed(reg12)}) : $unsigned((!$unsigned(wire2)))));
      reg15 <= $unsigned(wire3);
      reg16 <= (wire4[(1'h1):(1'h1)] ?
          (($signed(wire5) ?
                  (^~$unsigned(wire0)) : $signed((reg8 ? wire0 : reg6))) ?
              ((reg10[(2'h3):(1'h0)] >>> (^~reg14)) ^~ $signed((8'hae))) : reg8) : (($unsigned((reg14 >> reg12)) ?
                  $signed(reg15) : ((!reg12) ? reg12 : (wire4 ? reg6 : reg8))) ?
              $unsigned(((reg11 + (8'hab)) ?
                  reg12[(2'h3):(2'h2)] : reg7)) : $signed(wire1[(4'hb):(1'h0)])));
      reg17 <= (|$signed((~&$signed((&wire5)))));
    end
  assign wire18 = $unsigned({$signed($unsigned((wire1 ? reg17 : wire4))),
                      {((reg16 << reg11) > {reg15, (8'h9d)}),
                          $unsigned((~^wire4))}});
  assign wire19 = (~&reg9[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if ((~^(reg9 ? $unsigned($unsigned((8'ha6))) : reg15)))
        begin
          reg20 <= ((reg13[(1'h1):(1'h1)] ?
                  (~$signed((~|reg8))) : {{((7'h43) ? (8'haa) : reg17)},
                      ($signed(wire5) ?
                          (wire4 ? reg17 : reg16) : $unsigned(wire4))}) ?
              ($unsigned(((reg13 - reg15) ?
                  reg13[(1'h1):(1'h1)] : (^reg14))) << (-$signed({reg13}))) : (~|$signed((8'ha7))));
          reg21 <= $unsigned((($signed((reg8 <= reg14)) & (~$signed(wire4))) >>> $signed((wire18[(3'h5):(3'h4)] * wire18[(2'h3):(2'h2)]))));
        end
      else
        begin
          reg20 <= wire3[(3'h4):(2'h3)];
          reg21 <= (&(~^(+((&wire0) ?
              $signed((8'hb8)) : (wire18 ? reg21 : reg13)))));
          if ((reg6[(1'h1):(1'h1)] ?
              $unsigned((((wire19 ? reg13 : (7'h43)) - (wire4 ?
                      (8'hb5) : wire1)) ?
                  $unsigned($unsigned(wire1)) : $unsigned((wire2 < wire18)))) : ($signed($unsigned((reg9 - (8'haf)))) > $unsigned(reg11[(2'h3):(1'h1)]))))
            begin
              reg22 <= wire3;
            end
          else
            begin
              reg22 <= (reg15[(2'h3):(1'h0)] ?
                  (8'hac) : {$unsigned(wire3), (~(~((7'h44) ? reg8 : wire3)))});
              reg23 <= (wire3[(4'h9):(4'h8)] == $signed((~&(-$unsigned(wire19)))));
              reg24 <= ($unsigned(wire1) ?
                  reg6 : (|$signed((~|(reg10 ? wire5 : reg12)))));
            end
          reg25 <= ((reg16 ?
              reg24[(3'h5):(3'h4)] : $unsigned(reg10[(3'h5):(3'h5)])) <<< reg6);
        end
      reg26 <= (-$unsigned(((-(|reg7)) ?
          ($unsigned(reg9) ~^ reg6) : reg22[(3'h6):(2'h3)])));
    end
  assign wire27 = $signed({wire1[(4'h8):(3'h7)]});
  module28 #() modinst56 (wire55, clk, reg24, reg13, reg17, reg23);
  assign wire57 = $signed(reg11);
  assign wire58 = reg25;
  always
    @(posedge clk) begin
      if (wire27[(1'h0):(1'h0)])
        begin
          reg59 <= reg6[(1'h1):(1'h0)];
          reg60 <= (wire4 * ((!(^(^~(8'ha1)))) | (reg10[(3'h7):(2'h2)] <<< ($unsigned(wire27) ?
              {reg25, reg11} : (wire0 + reg7)))));
          reg61 <= wire19[(1'h1):(1'h1)];
        end
      else
        begin
          reg59 <= reg22[(3'h6):(2'h2)];
          reg60 <= reg6;
          reg61 <= ({(reg59 ?
                  reg22[(1'h1):(1'h0)] : reg17[(4'ha):(4'h8)])} <= $signed(((~|$signed(reg61)) + {{wire3,
                  wire4}})));
          reg62 <= {$signed((wire5[(2'h3):(2'h2)] ?
                  $signed($unsigned(reg25)) : (~|(reg13 ? wire55 : wire55))))};
          reg63 <= (wire18[(3'h6):(3'h4)] <= ({({wire18, reg26} ?
                      (wire19 ? reg15 : wire27) : reg61[(2'h2):(1'h1)]),
                  {(-wire57)}} ?
              (($signed(reg61) || {reg14}) ?
                  (^wire0) : reg15[(4'he):(3'h5)]) : wire55[(5'h11):(1'h1)]));
        end
      reg64 <= (+wire18[(2'h3):(1'h0)]);
      reg65 <= $unsigned(reg14[(5'h10):(4'h8)]);
      reg66 <= (|reg26[(3'h4):(2'h2)]);
      reg67 <= $signed($signed(reg9[(2'h2):(2'h2)]));
    end
endmodule

module module28
#(parameter param53 = ((^{(((8'ha8) > (8'ha5)) ? ((8'ha0) >= (8'h9e)) : ((8'ha4) <<< (8'hb9)))}) ? (({((8'ha7) >= (8'ha1)), ((8'hb0) <<< (8'h9f))} ? (~^((8'hba) >> (8'hb7))) : (!(~^(8'hb9)))) ^ (^((!(8'hb4)) << ((8'hbf) ^ (8'haf))))) : (~({(~^(8'hb9))} & (((8'hb9) ? (8'ha3) : (8'hb8)) < ((8'ha9) ? (8'ha0) : (8'ha8)))))), 
parameter param54 = param53)
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire44;
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 reg52,
                 reg49,
                 (1'h0)};
  module33 #() modinst45 (.wire34((8'hae)), .wire35(wire29), .wire37(wire30), .clk(clk), .y(wire44), .wire36(wire31), .wire38(wire32));
  assign wire46 = $signed($signed($unsigned(wire29)));
  assign wire47 = wire46[(3'h4):(1'h0)];
  assign wire48 = wire31;
  always
    @(posedge clk) begin
      reg49 <= {wire29};
    end
  assign wire50 = {{wire48[(1'h1):(1'h1)]}};
  assign wire51 = ($signed($unsigned(wire48[(3'h5):(1'h1)])) >> wire46);
  always
    @(posedge clk) begin
      reg52 <= $unsigned(wire31);
    end
endmodule

module module33
#(parameter param43 = (~|({{{(7'h44), (8'hbc)}}} ? (&(((7'h44) ? (8'hae) : (8'hbb)) * {(7'h41), (8'hb0)})) : {({(8'hb1), (8'hb5)} ? (|(8'hae)) : {(8'hab), (7'h41)})})))
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire38;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire [(4'hd):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire [(2'h3):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  assign y = {wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = (wire37 ? {{wire35}, {(~|(wire38 << wire35))}} : wire35);
  assign wire40 = $unsigned({((8'haa) * {(wire36 == (7'h40))})});
  assign wire41 = $signed($unsigned((wire34[(1'h0):(1'h0)] && wire40)));
  assign wire42 = (($unsigned(wire40[(4'ha):(1'h0)]) >= ($unsigned({wire34,
                          wire38}) >> wire41[(4'h8):(3'h4)])) ?
                      (^~{$unsigned(wire36[(1'h1):(1'h0)]), wire39}) : wire41);
endmodule

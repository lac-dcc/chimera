module top
#(parameter param85 = (~^((+(8'hbe)) <<< {(!((8'hab) ? (8'hb7) : (8'hbf)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire55;
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire55,
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
                 reg59,
                 reg58,
                 reg57,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed({wire3});
      reg5 <= $unsigned($unsigned(reg4[(1'h1):(1'h1)]));
      if ((wire3 ?
          ((($unsigned(reg4) ?
                  (reg5 ? reg4 : wire2) : (wire1 ? wire3 : wire3)) < wire1) ?
              $signed((^(wire3 ^ (8'hbd)))) : $signed($signed((wire2 <<< wire1)))) : $unsigned($unsigned(wire0))))
        begin
          reg6 <= {(^(wire1[(4'hb):(4'h8)] ?
                  ((8'ha1) ?
                      reg5 : wire0[(3'h4):(1'h1)]) : reg5[(2'h2):(1'h0)]))};
          reg7 <= {((((!reg5) >> $unsigned(wire2)) || $signed(reg4[(4'h9):(4'h8)])) > wire2)};
          reg8 <= $unsigned(reg6);
          if ($unsigned(reg8))
            begin
              reg9 <= {reg5, (~reg7[(1'h1):(1'h0)])};
              reg10 <= {({((^~wire3) ? reg6 : $unsigned(reg8))} * reg5)};
              reg11 <= wire1;
              reg12 <= {(wire3 ?
                      $unsigned(($unsigned((8'haa)) == (^~reg8))) : reg8)};
            end
          else
            begin
              reg9 <= $unsigned(reg12[(2'h3):(2'h3)]);
              reg10 <= (wire3[(2'h2):(2'h2)] ?
                  (((reg9 ? wire0[(4'h8):(2'h2)] : $signed((8'h9d))) ?
                          (reg12[(4'h8):(3'h5)] << {reg8,
                              reg11}) : (^~reg12[(1'h1):(1'h0)])) ?
                      (reg9[(2'h2):(1'h0)] ? reg4 : reg8) : wire2) : wire1);
              reg11 <= $unsigned((^~(wire2 == reg12[(1'h1):(1'h0)])));
              reg12 <= $signed((reg11[(2'h2):(2'h2)] ?
                  $unsigned($unsigned(reg7[(2'h2):(1'h1)])) : (~((wire3 ?
                      reg8 : (8'hac)) | {reg8, wire1}))));
            end
        end
      else
        begin
          reg6 <= (8'hab);
          reg7 <= {wire3[(1'h1):(1'h1)]};
        end
    end
  assign wire13 = reg12;
  assign wire14 = $unsigned(wire3[(1'h1):(1'h1)]);
  assign wire15 = reg11;
  assign wire16 = (~^$unsigned({((reg4 ? wire2 : (7'h41)) >>> {wire1})}));
  assign wire17 = ((~|wire14) ?
                      (~^(~^(wire13 ?
                          reg5[(2'h3):(1'h0)] : reg8))) : $unsigned($unsigned((reg6[(1'h1):(1'h1)] + wire0))));
  assign wire18 = (8'ha7);
  module19 #() modinst56 (wire55, clk, wire14, reg11, reg10, wire3, wire15);
  always
    @(posedge clk) begin
      reg57 <= (~&wire15[(3'h6):(3'h4)]);
      if ({$signed($unsigned((reg57 | (reg12 <<< (8'hbd))))),
          $signed({{$signed(reg9)}})})
        begin
          if (wire0[(1'h0):(1'h0)])
            begin
              reg58 <= $signed((~&wire14));
              reg59 <= (wire17[(4'ha):(3'h5)] ?
                  reg9[(1'h0):(1'h0)] : $signed(reg5[(1'h0):(1'h0)]));
              reg60 <= (8'hac);
              reg61 <= reg12;
              reg62 <= {$signed(($signed($signed((8'hb0))) ?
                      $signed((wire0 ? (8'h9e) : reg57)) : ({wire2, wire0} ?
                          (wire13 ? reg12 : reg12) : ((8'hbb) <= wire2))))};
            end
          else
            begin
              reg58 <= reg9[(3'h4):(1'h0)];
            end
          reg63 <= {$unsigned((|wire55[(2'h2):(2'h2)])),
              (-(reg61[(4'hb):(2'h3)] ?
                  (^~(wire18 << wire15)) : ($unsigned(reg61) ?
                      $unsigned((8'hae)) : (wire3 ? (8'ha0) : reg57))))};
          if (((&reg57) && reg60[(3'h4):(1'h0)]))
            begin
              reg64 <= (+{(-reg5),
                  ($unsigned((!reg11)) ?
                      $unsigned($unsigned(reg62)) : reg8[(4'h8):(3'h4)])});
              reg65 <= $signed(wire3[(1'h0):(1'h0)]);
              reg66 <= $signed((((&reg10[(4'h8):(1'h0)]) ?
                  reg62[(4'ha):(3'h7)] : (reg11[(2'h2):(1'h1)] ~^ wire16)) | $unsigned(wire13[(2'h2):(1'h1)])));
            end
          else
            begin
              reg64 <= {$unsigned(reg59)};
              reg65 <= $unsigned({(((~|wire15) ~^ (wire18 > reg57)) ?
                      ((reg59 >> reg9) ?
                          (wire17 & reg57) : (wire15 ?
                              reg58 : reg59)) : ((^(8'hbe)) ?
                          reg65 : (wire1 ? reg8 : reg65))),
                  $signed((wire2 ?
                      (~|wire15) : ((8'ha7) ? wire13 : (8'hb2))))});
              reg66 <= wire1[(4'hd):(4'h8)];
            end
          reg67 <= reg57[(1'h0):(1'h0)];
        end
      else
        begin
          reg58 <= (~^{reg11});
          if (reg58[(5'h13):(4'hb)])
            begin
              reg59 <= $unsigned(((reg65 << $signed($signed(wire17))) ?
                  {reg67[(2'h3):(2'h2)]} : (wire16 ?
                      (|$signed((8'h9d))) : ($signed(wire3) + reg57))));
              reg60 <= $unsigned(reg10[(4'h9):(3'h7)]);
              reg61 <= $signed(wire13);
              reg62 <= (!reg10[(3'h5):(2'h2)]);
            end
          else
            begin
              reg59 <= {($unsigned(((reg9 || reg9) ?
                      (^reg65) : $unsigned(reg66))) - (wire13[(1'h0):(1'h0)] >= wire14[(2'h2):(1'h0)])),
                  $signed(reg10[(3'h5):(3'h5)])};
              reg60 <= $signed({wire2[(5'h13):(4'hb)], wire13[(1'h1):(1'h1)]});
              reg61 <= (~|reg11[(4'h9):(1'h1)]);
              reg62 <= $unsigned(wire14);
            end
          reg63 <= (|($signed({$unsigned((8'hb7))}) < (|((&reg62) ?
              $signed(wire17) : wire13[(2'h2):(1'h0)]))));
          if ((($unsigned((reg12 ?
              $unsigned(wire16) : (wire55 ? reg5 : reg6))) == (reg12 ?
              $signed((wire0 < (7'h41))) : reg7)) > reg5))
            begin
              reg64 <= $unsigned(((reg5 ?
                  {(reg9 * wire15)} : $unsigned((reg65 ?
                      wire2 : reg57))) >> (~^$unsigned((~&(8'hac))))));
              reg65 <= (8'hb8);
              reg66 <= {$unsigned((~&(reg65[(4'h8):(3'h4)] ?
                      {reg63, wire2} : $signed(reg12)))),
                  $unsigned(reg11[(4'h8):(3'h5)])};
            end
          else
            begin
              reg64 <= $signed((($signed(((8'haa) ?
                      reg64 : (7'h41))) || ((wire16 && (8'hb8)) > reg63)) ?
                  $unsigned(((|(8'h9d)) >> (reg57 | reg5))) : $unsigned(((-wire18) ?
                      $signed(reg63) : (reg5 ? wire15 : reg65)))));
              reg65 <= {$unsigned(($signed($unsigned((7'h43))) + (wire2 ^~ $unsigned((8'h9c)))))};
            end
          reg67 <= ((reg7 ?
                  {((^wire14) ?
                          $unsigned(reg61) : (wire55 && reg61))} : $signed(($signed(reg9) ?
                      (7'h44) : (reg4 ? wire14 : wire0)))) ?
              (8'hbe) : $signed($signed($signed(reg59))));
        end
      if ($signed(reg6[(2'h2):(1'h1)]))
        begin
          if (reg9[(1'h1):(1'h0)])
            begin
              reg68 <= (wire0 >> wire18[(4'h8):(2'h3)]);
            end
          else
            begin
              reg68 <= wire0[(3'h6):(3'h4)];
              reg69 <= {$signed((($unsigned(wire2) ?
                          reg67[(3'h5):(2'h3)] : {reg68, reg65}) ?
                      reg11 : (reg9[(1'h0):(1'h0)] ?
                          reg5[(2'h3):(2'h2)] : (~&reg5))))};
              reg70 <= (-(&(reg65[(1'h0):(1'h0)] ?
                  $signed(wire13) : reg57[(3'h4):(2'h2)])));
            end
          reg71 <= (~$unsigned(((&$signed((8'hac))) ?
              reg6[(1'h1):(1'h1)] : $unsigned((reg58 + wire3)))));
          reg72 <= (($signed($unsigned(wire14[(4'hf):(3'h4)])) ?
                  (wire15[(3'h5):(2'h3)] ?
                      {(!reg70),
                          $unsigned(reg71)} : ($signed(wire2) + (7'h43))) : $unsigned((^~$unsigned(reg58)))) ?
              $unsigned($signed($signed({reg59,
                  reg9}))) : $unsigned({(wire3 <= reg57[(2'h2):(2'h2)]),
                  (!reg7)}));
          reg73 <= reg71[(3'h4):(2'h2)];
          reg74 <= $signed((($unsigned({reg68}) | ($unsigned(reg60) != (wire0 ?
              reg10 : reg9))) || (reg64[(1'h0):(1'h0)] ^~ reg60[(1'h1):(1'h1)])));
        end
      else
        begin
          reg68 <= (($signed(($unsigned(wire15) >= (8'hae))) < ({{reg4}} == reg73)) ?
              $signed($signed($unsigned((&reg74)))) : (&$signed($unsigned(wire18[(4'hd):(4'h9)]))));
        end
    end
  assign wire75 = $signed(reg58);
  assign wire76 = $signed(((+reg71[(1'h0):(1'h0)]) ?
                      (+$signed(reg62[(5'h13):(5'h10)])) : ($unsigned($unsigned((8'h9f))) ^~ ($unsigned(wire15) || $unsigned(reg70)))));
  assign wire77 = (wire0 ?
                      {$unsigned((^~$unsigned(wire1))),
                          ($unsigned($signed(reg69)) ?
                              reg64 : $unsigned($signed(wire1)))} : ((8'ha1) ?
                          $unsigned(reg64[(2'h3):(2'h3)]) : (&(~&(~^wire0)))));
  assign wire78 = $signed($unsigned($unsigned(((-(8'hb2)) * wire75))));
  assign wire79 = reg64;
  assign wire80 = ($signed((reg70[(2'h2):(2'h2)] ?
                          ($unsigned(reg12) << $unsigned((8'ha6))) : {(-(8'hab))})) ?
                      wire16[(3'h4):(2'h2)] : (8'hae));
  assign wire81 = ((-(wire55[(4'h8):(3'h4)] & (reg74 > wire75[(4'hb):(2'h3)]))) >>> ($unsigned($unsigned({reg5})) * $signed(($signed(reg11) ?
                      $signed(wire75) : $unsigned(wire17)))));
  assign wire82 = {((^({wire76, reg58} ^ (wire15 >>> reg68))) ?
                          ((~|$signed(wire75)) ^~ ($unsigned(reg57) ?
                              (wire13 ?
                                  reg9 : reg66) : (|(8'hac)))) : reg67[(3'h4):(2'h2)]),
                      $unsigned(reg72)};
  assign wire83 = ((wire80 ?
                      (wire18[(4'h8):(3'h4)] ?
                          (~|wire13[(1'h1):(1'h0)]) : (reg10[(3'h4):(1'h0)] ^~ wire82[(2'h3):(2'h2)])) : reg11) >= $signed(wire17));
  assign wire84 = $unsigned((~&wire76[(3'h5):(3'h4)]));
endmodule

module module19
#(parameter param54 = (^~(8'h9e)))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire47;
  assign y = {wire53, wire52, wire51, wire50, wire49, wire47, (1'h0)};
  module25 #() modinst48 (wire47, clk, wire24, wire22, wire21, wire23);
  assign wire49 = (!($signed((8'hac)) != (wire23[(3'h4):(2'h2)] ?
                      ((wire47 == wire20) <<< (wire47 ?
                          wire21 : (7'h44))) : ((wire24 > (8'ha3)) ?
                          (|wire22) : $unsigned(wire47)))));
  assign wire50 = $signed({{$unsigned((wire47 ? wire49 : wire20))}});
  assign wire51 = (wire24[(4'hf):(4'h8)] ?
                      {$signed(wire23[(3'h4):(1'h1)])} : $signed((~^$unsigned((~^(8'ha7))))));
  assign wire52 = ($unsigned((^~wire51)) * ($signed(wire50) ? wire51 : wire21));
  assign wire53 = (8'hb7);
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  input wire [(3'h5):(1'h0)] wire27;
  input wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire30 = ((($unsigned((!wire27)) | ({wire28,
                          wire29} & $signed(wire27))) ?
                      (wire29[(3'h7):(1'h1)] ?
                          ({wire26} >> {wire27,
                              wire27}) : wire26[(2'h2):(1'h1)]) : ((!wire27[(2'h3):(2'h3)]) >>> ((wire28 | wire28) > {(8'h9c),
                          wire26}))) && $signed(wire27));
  assign wire31 = (({wire27[(1'h0):(1'h0)]} ?
                          ((wire30[(3'h7):(3'h5)] << (^wire27)) >> $signed(wire27[(2'h3):(1'h1)])) : wire29[(3'h6):(3'h6)]) ?
                      (((8'hb8) ?
                          wire30 : wire28) - wire26[(4'h9):(4'h8)]) : wire30[(4'h9):(4'h9)]);
  assign wire32 = ((((+(wire29 & wire29)) ?
                              $unsigned(wire28) : (wire27 ?
                                  (~|wire27) : wire29)) ?
                          $unsigned($unsigned($unsigned((8'ha1)))) : $signed((8'hb4))) ?
                      (~|wire27[(3'h4):(1'h1)]) : wire26[(2'h3):(1'h0)]);
  assign wire33 = ($signed($signed((wire30 >= wire32))) ?
                      $unsigned((8'h9f)) : $unsigned($signed(wire26[(5'h10):(2'h3)])));
  assign wire34 = wire32;
  always
    @(posedge clk) begin
      reg35 <= wire26;
      reg36 <= (|{wire28[(3'h4):(2'h3)]});
      reg37 <= $signed((^reg35[(1'h0):(1'h0)]));
      reg38 <= wire33[(2'h3):(2'h3)];
    end
  assign wire39 = (-(({wire33} ?
                          (|(wire34 ? (8'h9c) : wire33)) : $signed({wire33,
                              wire29})) ?
                      $unsigned((8'ha6)) : $unsigned((!reg36[(4'hb):(2'h3)]))));
  assign wire40 = $signed((!((~^(-wire27)) <<< wire29)));
  assign wire41 = ((reg35 ?
                          {wire28} : ((~|(wire26 ?
                              (8'hb4) : wire26)) - $signed($unsigned(wire33)))) ?
                      wire32[(2'h2):(1'h1)] : wire30);
  assign wire42 = wire41;
  assign wire43 = $signed($unsigned(((!$unsigned(wire42)) ?
                      $signed({reg38, wire32}) : {$unsigned(wire26),
                          $signed(wire26)})));
  assign wire44 = ($unsigned(($unsigned((reg38 ?
                      wire26 : wire29)) << ((&wire27) >>> wire26[(4'hc):(4'h9)]))) << $unsigned($unsigned(wire32[(2'h2):(2'h2)])));
  assign wire45 = {wire31,
                      ($signed($unsigned($unsigned(wire28))) ?
                          (-$signed(wire40[(1'h0):(1'h0)])) : {(^((8'hbe) ?
                                  wire27 : (8'ha2))),
                              wire26[(4'h8):(3'h7)]})};
  assign wire46 = $signed((((!(wire42 ?
                      reg37 : wire33)) <= (~reg35)) << reg38[(3'h5):(2'h2)]));
endmodule

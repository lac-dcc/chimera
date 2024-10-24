module top
#(parameter param67 = (~|(!((8'hbe) == (~&(^(8'hb1)))))), 
parameter param68 = param67)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire62;
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire5,
                 wire6,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire25,
                 wire26,
                 wire27,
                 wire36,
                 wire37,
                 wire62,
                 reg7,
                 reg8,
                 reg9,
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
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  assign wire5 = ($unsigned(($unsigned($unsigned(wire4)) > (8'ha0))) ?
                     ($unsigned($unsigned($signed(wire1))) >>> $unsigned($unsigned((wire1 ^ wire1)))) : wire2[(1'h0):(1'h0)]);
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= wire5;
      reg8 <= wire3[(1'h0):(1'h0)];
      reg9 <= (!$signed(wire0));
    end
  assign wire10 = (~|{$unsigned($unsigned((reg7 < (8'ha8))))});
  assign wire11 = (wire3 ?
                      wire10 : (wire3[(3'h7):(3'h5)] ^ (~wire1[(5'h12):(3'h7)])));
  assign wire12 = $unsigned($signed((^~$signed((+wire4)))));
  assign wire13 = (($unsigned(reg8) != (^(~^reg9[(3'h6):(3'h5)]))) ?
                      wire4[(4'hb):(1'h1)] : $signed((-($signed(wire1) ?
                          (wire1 << wire5) : (8'hbe)))));
  assign wire14 = $unsigned(wire13[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      reg15 <= ((^(wire4 || wire14[(3'h7):(1'h1)])) - $signed((&reg8[(1'h1):(1'h1)])));
      if ((wire1[(2'h3):(2'h3)] <<< $unsigned((wire0 ?
          $signed($unsigned(reg8)) : $signed(reg7)))))
        begin
          if ($unsigned(((8'hac) ?
              $signed((-(|wire12))) : (wire5 ?
                  ($unsigned((7'h41)) - $signed(wire6)) : $signed(wire6[(2'h3):(1'h1)])))))
            begin
              reg16 <= $unsigned(((wire14[(2'h2):(2'h2)] <= reg7) ?
                  (~^$signed((!wire14))) : wire5[(2'h2):(1'h0)]));
              reg17 <= $unsigned(wire2);
            end
          else
            begin
              reg16 <= (-wire1);
            end
          reg18 <= {$unsigned({(~|wire10[(1'h1):(1'h1)]),
                  wire12[(4'hd):(4'hc)]}),
              {$signed($unsigned((wire5 ^~ wire14)))}};
          reg19 <= $signed($unsigned((wire11[(3'h7):(1'h1)] ?
              $unsigned(reg17) : wire0[(2'h2):(2'h2)])));
          if (reg15)
            begin
              reg20 <= reg16[(4'h8):(4'h8)];
              reg21 <= (wire14 * $signed($signed((|(~reg20)))));
            end
          else
            begin
              reg20 <= (^~((((reg20 ? reg17 : reg8) ?
                  wire4 : (wire2 ? reg7 : (8'hbf))) ^~ (+(|reg17))) ^~ reg18));
              reg21 <= ((reg20 ?
                  $unsigned(reg7[(5'h13):(4'he)]) : (-$signed((^wire13)))) < {(($unsigned(wire1) && wire6[(2'h3):(2'h3)]) ?
                      $unsigned((reg9 ? reg17 : reg16)) : $unsigned((+reg19))),
                  wire1});
              reg22 <= reg15;
              reg23 <= reg20;
            end
        end
      else
        begin
          reg16 <= $unsigned(reg22);
        end
      reg24 <= $signed(((reg18 <= {(reg16 ? reg23 : reg18),
              reg22[(3'h4):(2'h3)]}) ?
          $signed((wire14 ?
              wire5 : $signed(reg16))) : $unsigned((+(reg8 ~^ reg19)))));
    end
  assign wire25 = ($unsigned($unsigned(((|wire14) ?
                      $unsigned(reg9) : $signed(reg8)))) >= (~&(&$signed(wire14[(1'h0):(1'h0)]))));
  assign wire26 = {{{{$signed((8'h9c)), (wire5 >= reg22)},
                              $signed(wire6[(2'h3):(2'h3)])},
                          $signed(wire3[(3'h4):(3'h4)])}};
  assign wire27 = $signed(reg15);
  always
    @(posedge clk) begin
      if ($unsigned((reg21 ?
          $unsigned($unsigned(wire10[(1'h0):(1'h0)])) : wire25[(5'h12):(1'h0)])))
        begin
          reg28 <= wire10[(1'h0):(1'h0)];
          reg29 <= ((+$unsigned((+(~(8'hb5))))) >= $signed({$unsigned(wire3[(3'h5):(1'h1)]),
              {$unsigned(wire10)}}));
          if (((((!(wire0 != wire4)) ?
                      ($unsigned(wire11) ^ $signed(reg19)) : $signed($unsigned(wire6))) ?
                  (wire13[(2'h3):(2'h2)] ^~ ((~&wire14) ?
                      (wire4 ?
                          reg15 : wire10) : (wire5 ~^ wire4))) : (~&$signed((wire6 ?
                      reg24 : reg23)))) ?
              wire0[(3'h6):(2'h3)] : $unsigned((($unsigned(reg24) ?
                  $signed(wire0) : $signed(wire5)) & ($signed(wire1) ?
                  reg19 : (8'ha6))))))
            begin
              reg30 <= (8'ha7);
              reg31 <= wire1;
              reg32 <= reg22[(1'h0):(1'h0)];
              reg33 <= reg28;
              reg34 <= wire1;
            end
          else
            begin
              reg30 <= $signed({(8'hba), $unsigned($unsigned($signed(reg34)))});
              reg31 <= reg17[(3'h4):(1'h0)];
              reg32 <= reg7;
            end
        end
      else
        begin
          if ((&(reg24[(1'h1):(1'h1)] ?
              $signed($unsigned(reg33[(3'h5):(1'h0)])) : ($signed(wire0[(2'h3):(1'h1)]) + wire6[(1'h1):(1'h1)]))))
            begin
              reg28 <= {$unsigned(reg34[(1'h1):(1'h0)]),
                  ($signed(($unsigned(wire11) ?
                      (reg16 ? reg20 : reg28) : (|reg30))) == (8'ha9))};
              reg29 <= (|($unsigned(reg9[(3'h4):(2'h2)]) ?
                  ($signed($unsigned(wire1)) - wire3) : (((reg28 ?
                              reg18 : (8'hb3)) ?
                          $signed(reg18) : (wire6 == wire11)) ?
                      ((wire26 ~^ (8'h9e)) ? (~^wire12) : wire11) : reg28)));
            end
          else
            begin
              reg28 <= reg17;
              reg29 <= reg33;
            end
          reg30 <= wire27[(2'h3):(1'h0)];
        end
      reg35 <= (($signed({$unsigned(wire5),
          ((7'h44) ?
              wire2 : wire14)}) & (reg23[(3'h6):(1'h1)] ^~ ($signed(reg19) ?
          $signed(wire11) : (~(8'hb9))))) ^~ $unsigned(reg32[(1'h1):(1'h0)]));
    end
  assign wire36 = wire4;
  assign wire37 = $signed((reg31 ?
                      wire5[(4'h8):(1'h1)] : (^~($signed(reg31) < $signed(wire10)))));
  always
    @(posedge clk) begin
      reg38 <= (^(~|(((reg24 == reg31) ?
          $signed(reg33) : {(8'hbf)}) > (+(wire27 ^ reg34)))));
      reg39 <= (8'ha9);
      if ($signed(($signed(({wire0} ? $unsigned((8'h9f)) : $unsigned(reg17))) ?
          {((+(8'hbd)) ?
                  (reg9 ? wire36 : reg32) : reg15)} : wire2[(2'h2):(2'h2)])))
        begin
          reg40 <= $unsigned($signed(wire36));
          reg41 <= reg15[(1'h0):(1'h0)];
          if ($unsigned((wire11[(3'h7):(1'h0)] < (reg18[(3'h6):(3'h6)] ?
              ($unsigned(wire11) ? (^~reg17) : (reg38 >> (8'ha6))) : {reg40}))))
            begin
              reg42 <= reg21[(4'hb):(2'h3)];
            end
          else
            begin
              reg42 <= reg23[(2'h2):(1'h0)];
              reg43 <= wire14[(2'h2):(2'h2)];
              reg44 <= reg23;
              reg45 <= $signed(({{reg34}, (reg23 <= $unsigned(wire5))} ?
                  $unsigned($unsigned({wire26})) : (&wire1)));
            end
        end
      else
        begin
          reg40 <= ($signed((((wire5 < wire11) ?
                      $unsigned(wire13) : (reg16 ? (8'hb5) : reg35)) ?
                  (~&((7'h40) <= wire10)) : ($signed(reg41) ?
                      reg34[(4'he):(1'h0)] : ((8'hac) ? reg44 : reg35)))) ?
              $unsigned($signed({$unsigned(reg32),
                  {reg23, reg31}})) : (-$unsigned($unsigned(((8'h9e) ?
                  reg42 : wire11)))));
          reg41 <= $signed($unsigned(reg22));
          reg42 <= (((reg45[(4'hf):(4'ha)] ?
                      (reg15 ? reg45 : reg22[(3'h7):(3'h5)]) : reg41) ?
                  $unsigned(($unsigned(wire3) ?
                      (reg28 ?
                          reg28 : reg23) : (reg30 != reg8))) : (^~((8'ha7) ~^ (reg35 ?
                      reg21 : wire25)))) ?
              wire25 : ({(+(reg8 ? reg44 : wire1))} ?
                  {((reg33 ? reg7 : reg33) ?
                          $signed(wire0) : $unsigned(reg33))} : (8'ha0)));
          if ({$signed({$signed($unsigned(reg39))}), (8'h9f)})
            begin
              reg43 <= (wire26 ?
                  $signed((~|{(wire3 != wire4)})) : (wire4[(4'hc):(4'h9)] >>> {(reg7[(2'h2):(1'h0)] ?
                          (wire13 ^~ wire4) : (7'h40)),
                      (8'hb7)}));
            end
          else
            begin
              reg43 <= (!(((wire37 ?
                      wire36[(3'h4):(3'h4)] : reg7[(3'h4):(3'h4)]) || $unsigned({reg9})) ?
                  (+reg8[(4'hb):(3'h5)]) : reg29[(3'h6):(1'h1)]));
              reg44 <= $unsigned(wire6);
              reg45 <= (~^reg20);
            end
        end
      reg46 <= ((~|$unsigned(($unsigned(reg9) ^ reg17))) - {($signed(reg38[(4'hb):(1'h0)]) ?
              (!reg35) : ($signed(reg42) & {reg22, reg32})),
          ({$unsigned(reg28), (wire6 ? reg35 : reg24)} ?
              $signed(wire3) : (~((8'had) && reg28)))});
      reg47 <= reg44;
    end
  always
    @(posedge clk) begin
      reg48 <= reg20;
      reg49 <= (~wire2);
      reg50 <= (|(reg29[(4'hb):(2'h2)] + reg41[(2'h3):(2'h2)]));
    end
  module51 #() modinst63 (wire62, clk, reg48, reg32, reg45, wire1);
  assign wire64 = reg9;
  assign wire65 = $unsigned(wire27[(1'h0):(1'h0)]);
  assign wire66 = ((!(&reg28[(1'h0):(1'h0)])) ?
                      reg34[(4'hd):(1'h0)] : $unsigned($signed((reg18 ?
                          $signed(reg20) : (reg30 ? reg16 : (7'h41))))));
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire signed [(4'h8):(1'h0)] wire53;
  input wire [(3'h5):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  assign y = {wire61, wire60, wire59, wire58, wire57, wire56, (1'h0)};
  assign wire56 = ($unsigned(((wire53[(1'h1):(1'h0)] ^ {wire54}) | wire53)) ?
                      (!$unsigned($signed(wire54))) : {$unsigned(((wire52 ?
                                  wire54 : (8'had)) ?
                              (wire52 ? wire54 : wire52) : (&wire55))),
                          ((~&wire52) ?
                              (!$unsigned(wire55)) : (wire55[(2'h3):(1'h1)] <<< ((8'ha9) ?
                                  (8'hb9) : wire54)))});
  assign wire57 = $signed((wire53 ?
                      ((((8'had) != wire52) || $unsigned((8'hb6))) != (wire56[(1'h1):(1'h0)] ?
                          (wire56 ~^ wire55) : wire53)) : {wire55[(3'h5):(3'h4)],
                          wire52}));
  assign wire58 = $unsigned(({($signed(wire56) * $unsigned(wire55)),
                          $signed((^wire56))} ?
                      wire56[(1'h0):(1'h0)] : ((!(wire57 ^ (7'h44))) ?
                          $unsigned(wire56) : (+(wire52 ?
                              (8'hb3) : (7'h43))))));
  assign wire59 = $unsigned(({wire57[(3'h7):(2'h2)], $unsigned(wire52)} ?
                      ($unsigned($unsigned((8'hb4))) ?
                          ($signed(wire58) ?
                              wire56 : (+(8'hb9))) : $unsigned($signed((8'haf)))) : wire54));
  assign wire60 = $unsigned($signed((wire55 ~^ ($unsigned(wire54) <<< wire55))));
  assign wire61 = ($signed((wire58 - wire57[(3'h6):(1'h0)])) ~^ $signed($unsigned((~&$unsigned((8'ha4))))));
endmodule

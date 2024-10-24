module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire24;
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire160,
                 wire146,
                 wire145,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire107,
                 wire105,
                 wire24,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(((|(wire0 ?
          (8'ha9) : wire3)) + wire3[(3'h5):(3'h4)])) >>> wire3))
        begin
          reg5 <= (-$unsigned((({wire1} + {wire0}) + $unsigned((+wire4)))));
        end
      else
        begin
          reg5 <= wire2;
        end
      reg6 <= $signed($unsigned($signed((~reg5[(3'h6):(1'h0)]))));
      if ((|wire2[(3'h4):(2'h2)]))
        begin
          reg7 <= ($unsigned(($unsigned((wire0 ? (8'ha3) : (8'ha9))) ?
                  $signed($unsigned(wire1)) : $signed((~^wire2)))) ?
              $signed((($unsigned(wire2) ?
                  (wire2 + reg6) : $signed(reg6)) == (-(^~reg5)))) : ((|$unsigned(wire2[(3'h5):(3'h5)])) <<< $signed($signed(((8'hbd) ?
                  wire1 : reg6)))));
          reg8 <= ({wire4, reg5[(2'h3):(1'h0)]} ?
              ((wire0[(4'hd):(4'ha)] >> ({reg6, wire2} ?
                      (reg7 || wire3) : $signed(wire3))) ?
                  (((wire3 ? wire2 : wire3) ? $unsigned(wire0) : wire2) ?
                      (~$signed(reg6)) : $signed($unsigned(wire1))) : reg5[(1'h1):(1'h1)]) : reg6);
        end
      else
        begin
          reg7 <= wire3[(3'h4):(2'h2)];
          if (((((wire1[(3'h5):(1'h0)] ? (|wire1) : (!reg6)) ?
                      ({reg7, wire1} <= $unsigned(wire1)) : (~&(reg5 ?
                          wire4 : wire3))) ?
                  wire1 : wire0[(2'h3):(1'h0)]) ?
              ((^~{wire1}) ?
                  $unsigned((~^reg5)) : ($signed((wire3 << reg8)) ?
                      $signed((wire1 ? reg5 : (8'hb6))) : ((wire0 == wire1) ?
                          $unsigned(reg8) : (^~wire0)))) : wire0))
            begin
              reg8 <= (+wire1[(1'h1):(1'h1)]);
              reg9 <= {(($unsigned((wire3 * (7'h41))) || ((reg5 ?
                      wire2 : wire0) & (reg5 ?
                      wire3 : reg8))) ^~ (^~$signed((7'h42))))};
            end
          else
            begin
              reg8 <= wire4;
              reg9 <= {($unsigned($signed(wire1)) != (~$signed($signed(reg9)))),
                  ($signed(reg6) && (((wire0 ? wire4 : reg9) ?
                          $unsigned(reg8) : (&wire3)) ?
                      ((reg5 ? wire0 : wire3) ?
                          (reg5 == (8'hbe)) : wire3[(1'h0):(1'h0)]) : $signed((~&(8'hb8)))))};
              reg10 <= wire2;
            end
          reg11 <= (((^$signed(reg6)) ?
              (($signed(reg9) ?
                  wire3 : reg7[(4'hb):(2'h3)]) << ((~reg7) | $signed(reg7))) : (8'hab)) <<< ($unsigned(((wire4 ?
                  reg6 : reg5) ?
              $signed(reg5) : $unsigned((8'hbe)))) <<< $signed(wire1)));
          reg12 <= reg10[(3'h6):(2'h2)];
        end
      reg13 <= reg8[(2'h3):(2'h2)];
      if ({reg7})
        begin
          if (($signed(wire2[(4'h8):(4'h8)]) ?
              $unsigned($signed((^wire4))) : $signed(wire4[(3'h6):(2'h2)])))
            begin
              reg14 <= (~&(~|($unsigned(wire1[(2'h2):(1'h1)]) <<< reg6)));
              reg15 <= (~|(reg9 ?
                  (($unsigned(reg9) ? (reg14 >>> wire0) : (~^wire1)) ?
                      reg10 : {{wire3}}) : reg12[(3'h5):(1'h0)]));
            end
          else
            begin
              reg14 <= (($signed((wire2 > (8'ha6))) >>> (~|$unsigned(reg6[(4'hd):(3'h4)]))) ~^ (-$unsigned(reg14[(4'h9):(1'h0)])));
              reg15 <= ($signed(reg12[(3'h5):(2'h3)]) ?
                  $unsigned(($unsigned((reg9 | (8'hb9))) ^ reg15[(3'h4):(1'h0)])) : $signed((-$signed((8'hb0)))));
            end
          reg16 <= {reg13};
          reg17 <= ((({$unsigned(wire0),
                  reg9[(4'h8):(1'h0)]} + ($unsigned(reg15) ?
                  $signed(reg13) : (wire0 * reg8))) ?
              $unsigned(reg12) : (|reg6)) != $unsigned((reg8 ^~ ($unsigned(wire1) ^~ (reg6 >> reg5)))));
          reg18 <= $signed($signed(((wire3 >>> (&(8'haf))) * $unsigned($unsigned(reg5)))));
          reg19 <= (~^reg13);
        end
      else
        begin
          if ((~reg6[(3'h7):(3'h7)]))
            begin
              reg14 <= {$signed($unsigned(reg19))};
              reg15 <= (^$unsigned($signed((-reg8[(3'h4):(1'h0)]))));
              reg16 <= reg8[(2'h3):(1'h0)];
              reg17 <= $signed(wire3[(3'h4):(2'h2)]);
            end
          else
            begin
              reg14 <= {(((reg16 ? (&(8'ha9)) : $signed(reg17)) + {{(8'ha8),
                              wire4},
                          reg11[(3'h4):(3'h4)]}) ?
                      {reg10[(5'h11):(4'he)],
                          ({wire1} - reg6[(2'h3):(1'h0)])} : ($unsigned({reg13}) ?
                          reg11 : $unsigned(reg6[(3'h7):(1'h1)])))};
              reg15 <= $signed({$signed(({reg13} - (+(8'hac)))),
                  $signed($signed((+wire2)))});
            end
          reg18 <= ($signed(reg14) != (reg9[(4'he):(3'h5)] ?
              $unsigned($unsigned((7'h40))) : {$unsigned($unsigned((8'h9e))),
                  reg18[(4'hf):(4'hf)]}));
          reg19 <= (~^(reg14[(4'ha):(4'ha)] ?
              $unsigned(wire0[(4'hd):(4'ha)]) : reg19));
          if ((8'ha1))
            begin
              reg20 <= (wire1 ?
                  {(((8'ha9) ? (wire3 == (8'hb1)) : (wire0 ? (8'ha7) : reg18)) ?
                          (8'ha4) : ((wire0 ? wire2 : reg13) ?
                              (&wire0) : (wire1 ?
                                  (8'hb6) : wire0)))} : reg17[(3'h4):(2'h3)]);
            end
          else
            begin
              reg20 <= reg14;
              reg21 <= ({(~(wire4 ? (-(8'hb6)) : reg19[(4'ha):(1'h0)]))} ?
                  $signed(reg13[(5'h12):(4'hb)]) : ({wire3} ?
                      {(&reg18)} : $unsigned({reg9, {reg10, (8'hb9)}})));
              reg22 <= (8'hae);
              reg23 <= (((&($unsigned(reg21) ?
                  (&wire3) : reg7[(3'h4):(1'h0)])) != ({$unsigned(reg10)} ?
                  $signed({reg14}) : reg21)) > $unsigned($unsigned($signed((reg21 - reg19)))));
            end
        end
    end
  assign wire24 = ($signed($unsigned({wire2[(3'h6):(2'h3)]})) & {($unsigned({(8'ha3)}) ?
                          ($unsigned(reg20) ?
                              wire4 : (reg11 ? reg23 : reg21)) : wire0)});
  module25 #() modinst106 (wire105, clk, reg18, reg6, reg20, reg9);
  assign wire107 = $unsigned((-$unsigned(wire1[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      if ((~&$unsigned((~&reg7[(2'h2):(2'h2)]))))
        begin
          reg108 <= $unsigned(reg6);
          if ((reg12[(2'h2):(1'h1)] ?
              $signed((8'ha9)) : (+(reg6[(2'h2):(1'h0)] >> ((reg10 + reg6) >>> (reg16 ?
                  wire107 : (8'hb2)))))))
            begin
              reg109 <= $signed(wire3[(3'h6):(3'h4)]);
            end
          else
            begin
              reg109 <= (~|(~^(~^(8'ha3))));
              reg110 <= ({$signed((!(!reg15)))} ^~ $unsigned($signed($signed((~^reg9)))));
              reg111 <= wire0[(5'h10):(4'hd)];
              reg112 <= reg7;
              reg113 <= {$signed(wire3)};
            end
          reg114 <= $unsigned(wire1);
          if ($unsigned($unsigned(((reg16 ?
              (wire2 >> reg23) : (reg10 ?
                  wire4 : (8'ha8))) && {$unsigned(reg112), {reg108, wire1}}))))
            begin
              reg115 <= (^~$unsigned($signed(reg113[(3'h6):(3'h5)])));
              reg116 <= ((7'h41) ~^ reg109);
              reg117 <= wire107;
              reg118 <= (reg117[(4'hc):(4'h8)] ?
                  (&(^reg20[(2'h2):(1'h1)])) : (wire2[(3'h7):(3'h7)] ?
                      (-(8'h9c)) : {((~^wire3) >= ((8'hba) >= reg15)),
                          $signed(reg9[(4'hc):(4'ha)])}));
              reg119 <= reg20[(2'h3):(1'h0)];
            end
          else
            begin
              reg115 <= $unsigned($signed($unsigned((wire0[(4'h9):(1'h1)] ?
                  reg11 : $signed(reg113)))));
              reg116 <= (8'hb1);
              reg117 <= (reg108 < (^~reg113[(4'ha):(4'h8)]));
              reg118 <= wire105;
              reg119 <= (7'h40);
            end
          reg120 <= $signed($unsigned(reg7[(2'h3):(2'h2)]));
        end
      else
        begin
          reg108 <= reg112[(1'h1):(1'h0)];
          reg109 <= (&{reg12});
        end
      reg121 <= ((8'ha0) ?
          {reg15, $signed((|reg115[(1'h0):(1'h0)]))} : ($unsigned((^~(reg8 ?
                  reg120 : reg13))) ?
              (wire2[(4'h9):(2'h3)] ? wire1 : (+reg22)) : (+wire105)));
      if ({($unsigned(({reg13, reg117} ? wire105[(4'h8):(3'h6)] : (!reg117))) ?
              reg121[(2'h2):(1'h0)] : $signed(((reg13 ^ reg13) >>> (^(8'hbf))))),
          ({$unsigned((wire4 ? reg114 : reg17))} * wire4)})
        begin
          if (($signed({((reg121 || (8'ha6)) ? (!reg6) : (~&wire4))}) ?
              ((reg7[(5'h10):(5'h10)] ~^ $unsigned(wire0[(4'he):(2'h2)])) ?
                  $unsigned(wire3[(3'h5):(3'h4)]) : reg9[(4'hd):(3'h6)]) : ($signed($signed(reg14[(4'hc):(3'h6)])) ?
                  (|($unsigned(reg111) ?
                      wire2 : reg15)) : {reg110[(4'h8):(2'h3)], reg18})))
            begin
              reg122 <= (wire105[(5'h10):(2'h3)] == ((reg21 ?
                  reg22[(4'ha):(4'h9)] : (reg7 ?
                      (~|reg120) : (reg108 ? reg8 : reg5))) <= {((reg10 ?
                          reg115 : reg13) ?
                      reg8 : (reg20 != reg20)),
                  $signed((8'h9e))}));
              reg123 <= (|reg110[(3'h4):(2'h2)]);
            end
          else
            begin
              reg122 <= $unsigned(({(wire107 ? (reg116 & reg121) : (^~(8'hac))),
                      ((reg118 ? reg113 : reg13) <<< {reg9, (8'hb7)})} ?
                  (~{(reg109 ?
                          reg22 : reg11)}) : ($signed($signed(wire24)) || reg114)));
              reg123 <= reg7;
              reg124 <= (($signed({(-reg118),
                  $unsigned(reg123)}) <= $unsigned((wire24 * {reg5}))) & ($signed($unsigned($unsigned(reg17))) ?
                  $unsigned($signed($unsigned(wire4))) : reg14[(3'h7):(3'h6)]));
            end
          reg125 <= (reg5 | (~&reg12));
        end
      else
        begin
          reg122 <= $unsigned((reg22 ~^ {$signed($signed(reg17)),
              $signed({(8'ha3)})}));
          reg123 <= reg17[(2'h3):(1'h0)];
          reg124 <= reg118;
          reg125 <= ($unsigned($signed($signed(reg13[(5'h13):(4'hc)]))) || reg17[(4'h9):(3'h6)]);
        end
      reg126 <= (wire105[(4'hf):(1'h0)] + {$unsigned(($unsigned(reg14) ?
              reg11 : $unsigned(reg119)))});
      reg127 <= (!($unsigned(((wire0 ?
          reg22 : reg117) * $unsigned(reg10))) * (^~$signed(reg8[(2'h3):(2'h3)]))));
    end
  assign wire128 = ((^$unsigned({(~^reg112), reg124})) ? reg125 : (^(~^reg22)));
  assign wire129 = (&reg115[(1'h1):(1'h1)]);
  assign wire130 = ((wire128 > wire1[(3'h4):(2'h3)]) >>> wire128[(2'h3):(2'h3)]);
  assign wire131 = ((-(^reg127[(3'h4):(2'h3)])) - $signed($unsigned(wire24[(4'he):(2'h2)])));
  assign wire132 = $signed(((!$signed(reg14[(4'h8):(4'h8)])) ?
                       $unsigned($signed({reg8})) : $signed(reg14)));
  always
    @(posedge clk) begin
      if (({{reg111,
                  (wire1[(1'h1):(1'h1)] ?
                      reg9[(4'hb):(2'h2)] : $unsigned(reg6))}} ?
          $unsigned(reg108) : {$signed($unsigned($unsigned((8'ha8)))),
              (~|((+wire131) ? (reg8 ~^ reg124) : reg125))}))
        begin
          if (((~{($unsigned(reg19) || {reg108, (8'hbb)}),
              ($signed(reg12) << $unsigned(wire130))}) > reg15))
            begin
              reg133 <= reg118[(1'h1):(1'h0)];
              reg134 <= reg12[(2'h3):(2'h2)];
              reg135 <= wire2;
              reg136 <= (reg8[(3'h5):(3'h4)] ?
                  (($signed(reg119) ?
                      reg12 : reg113[(1'h1):(1'h0)]) - {$unsigned((!reg14))}) : $unsigned($unsigned(reg124[(2'h2):(1'h0)])));
            end
          else
            begin
              reg133 <= reg117[(3'h4):(2'h2)];
              reg134 <= reg9[(5'h13):(2'h3)];
              reg135 <= reg16[(4'h8):(2'h3)];
            end
        end
      else
        begin
          reg133 <= reg127[(4'h9):(1'h1)];
          if ($signed((((&{reg120}) ? $unsigned(reg117) : $unsigned(wire129)) ?
              (($signed(reg22) ? reg124 : (~^wire130)) ?
                  $unsigned(reg17[(3'h6):(3'h5)]) : {{reg15},
                      reg113}) : $unsigned({(8'hb0), {reg6, wire132}}))))
            begin
              reg134 <= (~|(+($signed(reg22[(4'hf):(4'hd)]) | reg111)));
              reg135 <= (+(wire3 ?
                  $unsigned((~^(reg136 ~^ reg12))) : (wire24 > (^~reg17[(4'h9):(4'h9)]))));
              reg136 <= $signed(((reg113[(3'h5):(1'h0)] != {reg123[(2'h3):(2'h2)],
                  (reg125 ? reg123 : wire107)}) * {($unsigned((8'hbc)) ?
                      reg5[(3'h6):(2'h2)] : {reg108, reg108}),
                  {$unsigned(wire4)}}));
              reg137 <= $unsigned((|reg6[(1'h1):(1'h1)]));
              reg138 <= reg18[(5'h11):(3'h6)];
            end
          else
            begin
              reg134 <= ((~^wire3[(2'h2):(2'h2)]) ?
                  (^$unsigned($unsigned($unsigned(wire1)))) : (|$signed($signed(reg14[(4'h8):(1'h1)]))));
              reg135 <= $signed((^($signed($unsigned(wire24)) < wire128[(3'h4):(3'h4)])));
              reg136 <= $signed((~^$signed($unsigned(reg115))));
              reg137 <= ($signed($signed(((^~reg23) >> wire131[(4'h8):(3'h6)]))) <= $unsigned((8'h9c)));
            end
          reg139 <= reg23;
          reg140 <= $signed(reg8[(2'h2):(2'h2)]);
          reg141 <= wire129;
        end
      reg142 <= (((^~{(8'hab)}) <<< ((^~{reg20}) >= $signed((reg22 + reg5)))) ?
          (reg20 >>> {($unsigned(reg18) ~^ (wire107 >= reg110))}) : {reg111});
      reg143 <= $signed((~reg108[(5'h12):(4'hc)]));
      reg144 <= reg16;
    end
  assign wire145 = $unsigned($signed(($unsigned(((8'hb8) - reg137)) ?
                       reg126 : $unsigned((8'ha0)))));
  assign wire146 = reg108[(5'h11):(4'ha)];
  always
    @(posedge clk) begin
      reg147 <= (~(8'hbc));
      reg148 <= $unsigned((~&(((|reg7) >>> (~reg134)) * $signed(wire146[(1'h1):(1'h1)]))));
      if ($signed(wire3))
        begin
          reg149 <= reg126;
          if (reg122)
            begin
              reg150 <= ($unsigned(($unsigned(reg147[(4'hb):(4'ha)]) ?
                  $signed({reg134,
                      reg9}) : (|$signed(reg123)))) > reg14[(1'h0):(1'h0)]);
              reg151 <= (+(((reg17[(2'h3):(1'h1)] ? (+wire132) : (&reg111)) ?
                  ((reg17 & reg21) ?
                      (wire146 <= wire105) : (reg120 != reg17)) : (!reg116)) * (((|wire130) || {wire146}) << reg122)));
              reg152 <= reg117[(3'h4):(3'h4)];
              reg153 <= (^~reg16[(1'h1):(1'h1)]);
            end
          else
            begin
              reg150 <= $unsigned((+$unsigned(reg151[(3'h5):(1'h1)])));
              reg151 <= ((~&(wire146[(1'h1):(1'h1)] ?
                      (^{wire24, wire146}) : {reg125[(4'h9):(2'h2)],
                          (+(8'hbe))})) ?
                  reg126 : (reg150 ? (^~(^wire2)) : wire131[(5'h11):(3'h7)]));
            end
          reg154 <= (((reg22[(5'h10):(4'hd)] << $signed((wire128 + reg7))) ?
                  $unsigned(reg119) : (~(reg22[(3'h6):(1'h0)] ?
                      (reg14 ^ reg117) : $signed(reg148)))) ?
              reg116 : (-$signed(reg7[(1'h0):(1'h0)])));
          if ($unsigned((~&{reg152})))
            begin
              reg155 <= ($signed({reg137, reg151}) | $unsigned(reg12));
              reg156 <= reg114;
              reg157 <= (($unsigned((((7'h44) ^~ (8'ha0)) | $unsigned((8'ha3)))) | ((~(reg124 || reg139)) ?
                      ((wire105 ? reg111 : reg12) ^ reg151) : reg110)) ?
                  reg142 : ((reg123[(4'ha):(4'ha)] ?
                          (wire3[(1'h0):(1'h0)] || (wire4 ^~ (7'h40))) : ((wire107 ?
                                  wire24 : reg6) ?
                              (wire128 ^ reg139) : $signed(reg154))) ?
                      ((~|reg15[(1'h1):(1'h0)]) && reg7) : {wire107}));
              reg158 <= ((reg134 ?
                  (+((reg21 ^ reg17) ?
                      reg111 : {wire128})) : ($signed(reg143[(4'hb):(3'h6)]) ?
                      reg136 : ($signed(reg148) >= (reg19 ?
                          wire128 : wire128)))) << reg118[(3'h4):(3'h4)]);
              reg159 <= ($signed(reg9[(4'hc):(2'h3)]) ?
                  $signed(reg12) : ($unsigned({$unsigned(wire24)}) | {(reg112 ?
                          (reg155 ? reg110 : reg134) : $signed((8'hb7))),
                      {(reg137 && wire128)}}));
            end
          else
            begin
              reg155 <= (+{(wire1 <<< wire130)});
            end
        end
      else
        begin
          if ({reg148,
              (({(reg13 ?
                      reg108 : reg158)} <<< ($unsigned((8'hab)) | (~&reg116))) < (~|(~$unsigned(reg157))))})
            begin
              reg149 <= reg124;
              reg150 <= $signed($signed($signed($unsigned(reg133[(3'h4):(2'h2)]))));
              reg151 <= (($signed(($signed(reg14) < $unsigned(reg120))) - reg7[(5'h11):(4'hd)]) != $unsigned($unsigned(reg156[(1'h0):(1'h0)])));
            end
          else
            begin
              reg149 <= $signed({reg144});
              reg150 <= (|($unsigned((^~{reg6})) ?
                  ($unsigned((~(8'ha1))) ?
                      (reg21[(4'ha):(4'h9)] ?
                          (^~(8'ha5)) : (-(8'hbb))) : (((8'hb4) ?
                          reg21 : (8'hb3)) + (wire24 ?
                          (8'h9e) : reg144))) : (wire3 ^ ($unsigned(wire107) ?
                      $signed(wire2) : (reg123 ? reg13 : reg116)))));
              reg151 <= {(~^reg147), reg6[(3'h4):(1'h0)]};
              reg152 <= (~&(wire3[(3'h4):(2'h2)] ?
                  $unsigned((reg140[(3'h7):(3'h4)] != (+(8'hb9)))) : reg133[(3'h6):(3'h5)]));
              reg153 <= ($unsigned($signed({$signed(reg134),
                      $signed((8'hb2))})) ?
                  reg138[(4'hf):(1'h1)] : (reg7 >= $unsigned((~&reg153[(3'h4):(2'h3)]))));
            end
          reg154 <= $unsigned((reg139[(3'h6):(2'h2)] ?
              (((reg151 - reg18) | (&wire3)) * (7'h41)) : reg133));
        end
    end
  assign wire160 = (|wire105[(1'h1):(1'h0)]);
endmodule

module module25
#(parameter param103 = (~|(~&((((8'ha5) >> (8'haa)) ? ((8'hbb) ? (8'haa) : (8'hbc)) : ((8'haa) ? (8'hb1) : (8'haa))) || {((8'h9f) ? (8'hb2) : (8'haa)), (8'ha6)}))), 
parameter param104 = (8'haa))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(4'h9):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  assign y = {wire101,
                 wire77,
                 wire74,
                 wire73,
                 wire71,
                 wire32,
                 wire31,
                 wire30,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire30 = (8'ha7);
  assign wire31 = $signed($signed(wire28));
  assign wire32 = $unsigned((($signed((+(7'h42))) ?
                      wire28 : (^~$signed(wire28))) != (8'hb8)));
  module33 #() modinst72 (.wire34(wire32), .clk(clk), .wire37(wire26), .y(wire71), .wire35(wire28), .wire36(wire27));
  assign wire73 = ({({wire32} ? (8'ha5) : wire30),
                      wire71[(4'h8):(2'h3)]} ~^ {(wire29[(3'h7):(2'h2)] + {$signed(wire30),
                          $signed(wire26)}),
                      wire71});
  assign wire74 = (8'hbd);
  always
    @(posedge clk) begin
      reg75 <= (8'hb3);
      reg76 <= (8'h9e);
    end
  assign wire77 = $signed((^~wire27[(1'h1):(1'h0)]));
  module78 #() modinst102 (.y(wire101), .clk(clk), .wire82(wire74), .wire80(reg75), .wire79(wire27), .wire81(reg76));
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire82;
  input wire [(2'h3):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  input wire [(4'h9):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire83;
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg84,
                 (1'h0)};
  assign wire83 = wire79[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg84 <= ({$signed($signed((wire83 << wire80)))} >= wire83[(3'h6):(3'h5)]);
    end
  assign wire85 = wire79[(1'h0):(1'h0)];
  assign wire86 = wire83;
  assign wire87 = (-($signed($signed((wire83 ? wire83 : wire82))) ?
                      wire81[(2'h3):(1'h1)] : $unsigned(wire79)));
  assign wire88 = (((~&(8'hb5)) ? wire81 : $unsigned((8'h9e))) ?
                      $signed(wire87) : reg84);
  assign wire89 = (((!(~&((8'hae) ? wire81 : wire79))) ?
                      (((^~wire85) & wire83) ?
                          ((reg84 ?
                              (8'ha9) : wire87) > $signed((8'ha8))) : (8'h9c)) : ((wire82[(5'h11):(5'h10)] ?
                          (~&(8'hba)) : (!wire82)) - $unsigned((wire79 ?
                          wire85 : (8'hae))))) + $signed($signed((|wire83[(3'h4):(3'h4)]))));
  assign wire90 = $signed(((8'hb0) ?
                      {(wire86 * $unsigned(wire83))} : $signed((^~wire85))));
  assign wire91 = $unsigned(((!((8'ha2) ?
                      {wire85,
                          (7'h42)} : $signed(wire82))) ^~ ({wire90[(4'he):(1'h1)]} << $unsigned({wire83}))));
  assign wire92 = $unsigned(wire82);
  always
    @(posedge clk) begin
      if (wire89[(5'h11):(4'h9)])
        begin
          reg93 <= wire80;
          reg94 <= wire87;
          reg95 <= {((8'hb1) ?
                  $signed($signed((wire80 ?
                      wire90 : reg94))) : wire82[(3'h6):(1'h1)])};
        end
      else
        begin
          reg93 <= wire81[(2'h2):(1'h0)];
          reg94 <= $signed($signed($signed(wire92)));
          if ((^(&{(~&wire82[(2'h2):(2'h2)]), wire92[(5'h15):(3'h7)]})))
            begin
              reg95 <= $signed($signed({(8'h9d)}));
              reg96 <= ($signed(wire79[(4'h8):(1'h1)]) ?
                  reg84[(5'h10):(4'h8)] : (&wire88[(3'h4):(2'h3)]));
            end
          else
            begin
              reg95 <= (($unsigned((~&wire80)) && $unsigned({$signed(wire80),
                  (!wire80)})) & $unsigned(reg84));
              reg96 <= $unsigned($unsigned((($signed(wire90) ?
                  (wire87 == wire90) : (!(8'hbd))) < $signed((wire79 ?
                  wire83 : wire89)))));
            end
        end
      reg97 <= wire89[(5'h10):(3'h5)];
      reg98 <= $signed({$signed((wire91[(2'h3):(2'h2)] ?
              $unsigned(wire83) : (reg93 ? wire91 : reg93))),
          {((wire92 << wire81) <<< ((8'haa) ? (8'hb5) : wire92))}});
    end
  assign wire99 = reg94;
  assign wire100 = (|({({reg97, wire89} <<< (~|(8'hb8))), $unsigned((8'hac))} ?
                       $unsigned({(wire92 ^~ wire86)}) : (wire88 ?
                           $signed(wire85) : wire90)));
endmodule

module module33
#(parameter param70 = (~|((((8'haa) ? (^~(7'h40)) : ((8'hb0) ? (8'ha0) : (8'ha5))) ? ({(8'haa), (8'hbd)} ? (~|(8'hba)) : {(8'haa)}) : (~((8'hbb) ? (8'hbe) : (8'hac)))) - {(((8'ha9) ? (8'ha8) : (8'haa)) || (!(8'ha4)))})))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire37;
  input wire [(2'h3):(1'h0)] wire36;
  input wire [(5'h12):(1'h0)] wire35;
  input wire [(4'hc):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
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
                 reg39,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= (wire34[(1'h0):(1'h0)] ?
          $signed($signed(wire37[(2'h2):(1'h1)])) : wire36);
      reg39 <= $unsigned(wire35);
    end
  assign wire40 = ((($unsigned((reg39 ? reg38 : (8'h9d))) ?
                          ($signed(wire35) ?
                              $signed(wire35) : (~^wire36)) : (8'ha2)) > $signed((!$signed((8'ha0))))) ?
                      ((&(&$signed(wire36))) ?
                          (($unsigned(wire37) < {wire36, wire37}) & {reg38,
                              $signed(wire35)}) : (($unsigned(reg38) >>> (wire36 ?
                                  wire37 : wire36)) ?
                              $signed((wire34 ?
                                  reg39 : wire35)) : ($unsigned((8'ha5)) >= $signed(reg39)))) : $signed((&wire35)));
  assign wire41 = $signed((7'h42));
  assign wire42 = (^~wire40[(2'h2):(2'h2)]);
  assign wire43 = $unsigned((($unsigned((wire34 ^~ wire37)) ?
                      (~&wire40[(1'h1):(1'h0)]) : (!(wire41 ?
                          (8'hb7) : wire41))) <<< (|(8'hb7))));
  assign wire44 = wire43[(4'h8):(3'h7)];
  assign wire45 = (8'h9c);
  assign wire46 = $signed((|wire41));
  assign wire47 = wire40[(2'h3):(2'h3)];
  assign wire48 = $unsigned(($signed({(wire41 ?
                          wire36 : reg38)}) & $signed({(wire47 ?
                          wire44 : wire47),
                      (^(8'hb6))})));
  always
    @(posedge clk) begin
      reg49 <= ((!wire40) ?
          wire44[(5'h12):(4'ha)] : $signed($signed((-$unsigned(wire45)))));
      if (($signed(($unsigned((~&wire48)) <<< wire42)) ?
          $signed((~^(&(|wire44)))) : (^($signed($signed(wire46)) ?
              $unsigned(wire41[(4'hb):(4'h9)]) : wire40))))
        begin
          if ((+(8'hb6)))
            begin
              reg50 <= wire37;
              reg51 <= (^{{wire41}});
              reg52 <= ((^((8'hb4) ?
                  (wire42 & (!wire36)) : (~(wire42 | reg38)))) >> (reg39[(2'h3):(1'h0)] ?
                  {wire44[(4'hf):(4'hf)],
                      ((^~wire47) ?
                          wire37[(3'h4):(3'h4)] : wire40)} : (((wire36 >> wire46) >>> (8'ha3)) ?
                      ((reg50 ? (8'h9f) : wire34) ?
                          reg39[(1'h0):(1'h0)] : wire42[(4'hb):(3'h6)]) : $signed((reg49 > wire34)))));
              reg53 <= $unsigned((~&wire44));
            end
          else
            begin
              reg50 <= ((|$unsigned((~|$unsigned(reg51)))) & (^~reg53[(1'h0):(1'h0)]));
              reg51 <= ((wire47 <= $unsigned((~(8'hb5)))) ?
                  $unsigned($signed(wire37[(3'h4):(2'h3)])) : $unsigned($signed(({wire35} ?
                      (^wire48) : $signed(wire37)))));
            end
          reg54 <= $signed(((^~((-wire34) >> (+wire45))) - wire41));
          reg55 <= wire34;
          reg56 <= (wire43[(4'h8):(1'h1)] ?
              ($unsigned(($signed((7'h44)) ?
                      $signed(reg54) : $unsigned(reg49))) ?
                  (wire46[(4'h8):(1'h1)] || wire35[(4'he):(1'h0)]) : (8'ha5)) : $unsigned(reg52[(3'h7):(3'h5)]));
          reg57 <= wire34[(1'h0):(1'h0)];
        end
      else
        begin
          reg50 <= wire34[(3'h5):(3'h5)];
          reg51 <= (~^$signed((reg56[(4'h8):(2'h3)] - (~&(wire48 ?
              wire37 : (8'hb2))))));
          reg52 <= $signed((((wire43[(3'h6):(3'h5)] >= wire43[(3'h6):(3'h6)]) << (reg55[(4'h8):(3'h5)] ?
              ((8'hbc) >>> wire44) : $unsigned(wire42))) - (!(^$unsigned(reg53)))));
          reg53 <= (reg54[(1'h0):(1'h0)] ?
              (8'ha4) : (~(&reg51[(4'he):(3'h6)])));
          reg54 <= (~reg52);
        end
      reg58 <= ($signed(wire40[(2'h2):(2'h2)]) ?
          $signed($unsigned($signed(reg39))) : (~^$signed(wire37[(2'h2):(2'h2)])));
      reg59 <= ($signed($signed(reg56[(3'h7):(2'h2)])) ?
          $signed((~&($unsigned(reg52) >> wire37[(1'h0):(1'h0)]))) : reg51[(4'hc):(4'hb)]);
      reg60 <= reg38;
    end
  assign wire61 = $signed((8'hae));
  assign wire62 = wire42[(4'ha):(3'h6)];
  assign wire63 = (8'hac);
  assign wire64 = ($signed((wire47 ?
                      reg50 : $unsigned($signed((8'hb2))))) && wire63);
  assign wire65 = wire63[(4'h8):(2'h2)];
  assign wire66 = $signed({$signed({$unsigned(reg56)})});
  assign wire67 = $signed($signed(wire62[(3'h4):(2'h3)]));
  assign wire68 = wire47[(2'h2):(1'h1)];
  assign wire69 = (!(&$unsigned($signed((reg55 ? wire46 : wire66)))));
endmodule

module top
#(parameter param27 = ((((((8'hb0) ? (8'hb1) : (7'h41)) ? ((8'hba) ? (8'hb2) : (8'ha1)) : {(8'h9f)}) < ((~|(8'hb2)) == {(7'h42)})) == ({{(8'hab)}, ((8'hbe) ? (8'ha1) : (8'hbb))} != (^((8'hb6) || (8'hb2))))) ? ((~|({(8'ha7), (7'h43)} ? (-(8'hbd)) : ((8'hae) ^~ (8'ha7)))) ~^ (((+(8'hab)) != {(7'h44), (8'hbf)}) ? {((8'haf) ? (8'hb1) : (7'h44))} : (8'hb6))) : (((|(8'hb9)) != ({(8'hbc)} < {(8'ha1)})) >> {((~|(8'ha0)) ? ((8'hb3) || (7'h41)) : ((8'ha8) & (8'hbf))), (((7'h44) && (8'hb8)) ^ {(8'hbc), (8'hbc)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 reg24,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire1[(3'h4):(2'h3)];
  assign wire5 = wire1;
  assign wire6 = {((($unsigned(wire5) ~^ (wire3 >>> wire3)) ?
                             ({wire2} < $unsigned((8'hbd))) : (7'h41)) ?
                         ($unsigned((wire1 >= (7'h40))) ?
                             wire1[(3'h7):(3'h6)] : ((wire5 ?
                                 wire0 : wire2) && wire4)) : wire2[(1'h0):(1'h0)]),
                     $unsigned((wire1 ?
                         ($unsigned(wire2) != (wire0 - wire1)) : $signed($signed((7'h40)))))};
  always
    @(posedge clk) begin
      reg7 <= (({{wire5[(1'h0):(1'h0)]}} ?
              (wire5[(4'he):(4'h8)] ~^ ($unsigned(wire1) ?
                  ((7'h43) != wire4) : wire3[(1'h1):(1'h1)])) : wire5) ?
          {$signed((wire3 - $unsigned(wire0)))} : $unsigned($signed(wire1)));
      reg8 <= {($signed(wire6) == wire4)};
      reg9 <= wire5;
      reg10 <= $signed((((^~(reg8 || wire4)) ?
              ($unsigned(wire6) ? (8'hb0) : {wire4, wire3}) : $unsigned((reg7 ?
                  reg9 : reg8))) ?
          {((wire0 ? reg7 : reg7) >>> {wire1}),
              (^wire6[(4'h9):(1'h1)])} : $unsigned($unsigned((~^wire0)))));
    end
  assign wire11 = $signed($signed(wire1));
  assign wire12 = ($unsigned({(wire5 << (!reg10)),
                      (~^$signed(wire6))}) <<< ($signed(wire11[(3'h6):(3'h4)]) ?
                      (($signed(wire0) ?
                              wire0[(2'h2):(1'h0)] : $unsigned(reg7)) ?
                          $signed(wire0[(2'h3):(1'h0)]) : (((8'hab) >>> wire2) ?
                              (~wire3) : (-reg8))) : $signed({$unsigned(reg10)})));
  assign wire13 = reg8[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ({wire1[(2'h2):(2'h2)]})
        begin
          if ((-($unsigned((!((8'h9d) ? (8'h9d) : (8'hb5)))) ?
              $unsigned(({wire13} || (-wire0))) : wire2[(2'h3):(1'h1)])))
            begin
              reg14 <= $signed($unsigned(wire1));
              reg15 <= wire2;
            end
          else
            begin
              reg14 <= {(wire6 > ((^$signed(wire2)) ?
                      (+wire3) : {{wire6, reg14}})),
                  wire11};
              reg15 <= wire1[(1'h1):(1'h0)];
              reg16 <= $unsigned(wire13);
              reg17 <= wire5[(4'he):(4'hd)];
              reg18 <= (^(~(($signed(wire11) ?
                      wire11[(2'h3):(1'h1)] : {reg17}) ?
                  ((reg15 ? reg15 : reg14) ?
                      {wire2,
                          wire3} : (wire0 > wire11)) : wire12[(2'h3):(2'h3)])));
            end
          if (((~$unsigned(wire4)) != ((({(8'hac)} ?
              reg10[(1'h0):(1'h0)] : ((8'ha8) - wire6)) << (~&(!wire0))) <<< reg17)))
            begin
              reg19 <= {(-($unsigned($unsigned(reg18)) ?
                      $unsigned({wire1, reg14}) : (wire3[(1'h1):(1'h1)] ?
                          (+wire1) : (8'ha8)))),
                  $signed({($signed(reg15) || (|wire11))})};
              reg20 <= $unsigned(wire4[(1'h0):(1'h0)]);
              reg21 <= ($signed(((wire2[(2'h3):(1'h1)] ?
                      $unsigned(reg16) : {reg9, (8'hb9)}) >>> (8'hb0))) ?
                  wire0 : $unsigned(reg18));
              reg22 <= {$unsigned(reg8[(4'h9):(4'h9)])};
              reg23 <= reg7[(2'h2):(1'h0)];
            end
          else
            begin
              reg19 <= $signed($unsigned(((~&((8'haa) ? reg19 : reg9)) ?
                  wire3 : $unsigned(((8'hbb) - reg15)))));
            end
        end
      else
        begin
          if (((^(+(8'hb4))) >> $signed({$unsigned({reg20, wire11}),
              (-(wire2 <= reg21))})))
            begin
              reg14 <= $unsigned({wire4[(2'h2):(1'h1)],
                  (~|(~|$signed(wire12)))});
              reg15 <= {((wire4[(1'h0):(1'h0)] ?
                      reg20 : $unsigned({wire5})) && $signed(wire6[(4'h9):(2'h3)])),
                  (~$signed(reg9))};
              reg16 <= reg21;
            end
          else
            begin
              reg14 <= ({(&{(wire13 ? reg21 : (8'hb0))})} ? wire3 : wire5);
              reg15 <= ((~|($unsigned(wire5[(3'h7):(2'h2)]) * reg22)) ?
                  {(8'hbd)} : (reg7[(1'h1):(1'h1)] >>> wire6));
              reg16 <= {$signed($unsigned($signed(((8'ha6) ^ reg10)))),
                  wire3[(1'h1):(1'h1)]};
              reg17 <= reg19;
            end
          reg18 <= $unsigned(($signed(wire0) ?
              (wire6 ?
                  {(~(8'ha5)),
                      wire1[(3'h6):(2'h3)]} : reg16) : (|($unsigned(wire6) ?
                  $signed(wire13) : (^reg21)))));
          if ($signed((($unsigned($signed(wire6)) ?
              $unsigned($signed(reg7)) : (~|$signed(wire2))) >>> wire4)))
            begin
              reg19 <= ($signed((~^(8'hb2))) | $signed(((~|(-reg20)) ?
                  (~&(reg15 ^ (8'ha4))) : wire11[(3'h5):(3'h4)])));
            end
          else
            begin
              reg19 <= (~|wire3);
            end
          reg20 <= wire3[(1'h0):(1'h0)];
        end
      reg24 <= {wire3[(1'h1):(1'h1)]};
    end
  assign wire25 = $unsigned($unsigned($unsigned({$signed(reg22)})));
  assign wire26 = reg21;
endmodule

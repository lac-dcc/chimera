module top
#(parameter param41 = (((({(8'hbd), (8'ha4)} ? ((8'hb0) ? (7'h43) : (8'ha6)) : ((8'hb5) * (8'hbd))) || (~|(~&(8'hb4)))) << (^(((8'ha8) ? (8'hbf) : (8'hb9)) && {(8'hae)}))) != {((((7'h43) ? (8'ha7) : (8'h9f)) ? ((7'h43) == (8'hb4)) : ((8'hb6) ? (8'ha3) : (8'ha8))) ? (+((8'ha9) ? (8'had) : (8'hb4))) : (8'h9c)), ({(~|(8'hbc)), ((7'h43) ? (8'hae) : (8'h9c))} ? {{(8'ha4)}, ((8'ha2) ? (8'ha1) : (8'ha7))} : ((8'hb7) ? ((8'hbe) ? (8'hab) : (8'h9f)) : {(8'hb4), (8'hb6)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire40,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire4,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
  assign wire4 = $unsigned($unsigned({$signed(wire1[(5'h12):(4'h8)])}));
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(wire4));
      reg6 <= $unsigned($unsigned(wire3[(4'h8):(2'h3)]));
      if ($signed(($unsigned($unsigned((wire1 || reg5))) ?
          $unsigned(((reg5 ? wire0 : (8'hb4)) ?
              $signed(reg5) : (wire4 ?
                  (8'hb1) : wire3))) : {$signed($signed(wire2))})))
        begin
          reg7 <= (wire2[(2'h2):(1'h0)] == wire1);
        end
      else
        begin
          if ((((wire3 >> (8'ha7)) ^ (8'h9c)) ?
              $unsigned(wire1[(4'h9):(4'h8)]) : (~wire0[(3'h4):(2'h2)])))
            begin
              reg7 <= (($signed((|$unsigned(reg6))) ?
                      $signed((wire1 ?
                          $signed(wire4) : ((8'hb7) < wire1))) : ($unsigned({(8'hb2),
                          wire0}) * (reg6 << wire3))) ?
                  $unsigned(((8'ha8) ?
                      (~(~^(8'haf))) : wire1)) : $signed($signed($signed($unsigned(reg7)))));
              reg8 <= (8'h9c);
            end
          else
            begin
              reg7 <= (&(wire0 ?
                  {((^reg6) ?
                          (reg6 ?
                              reg8 : wire2) : (reg6 <<< (8'ha7)))} : {$signed((reg7 << reg6))}));
              reg8 <= reg5[(2'h3):(1'h1)];
              reg9 <= ((reg6[(2'h2):(1'h0)] >= $unsigned({(8'h9f)})) ^ $unsigned(wire4));
              reg10 <= reg5;
            end
          reg11 <= $unsigned($unsigned((wire3 <<< ($unsigned(wire1) & reg8))));
        end
      reg12 <= wire3[(5'h13):(5'h10)];
      reg13 <= (|$signed($unsigned($unsigned((reg6 ? wire4 : wire1)))));
    end
  always
    @(posedge clk) begin
      if ((!(|$unsigned(reg7))))
        begin
          reg14 <= ($signed(wire3) & wire1);
        end
      else
        begin
          reg14 <= ($signed((^((!wire0) ? reg8[(3'h7):(2'h3)] : (~wire3)))) ?
              (wire3[(4'he):(2'h3)] && (8'haf)) : reg8);
          if (reg14[(1'h0):(1'h0)])
            begin
              reg15 <= {reg14, (8'hb2)};
              reg16 <= reg11[(5'h14):(4'hf)];
              reg17 <= $signed((wire1 < (^~(~&reg16))));
            end
          else
            begin
              reg15 <= {($unsigned(((reg6 ? reg15 : (8'ha8)) ?
                          {reg13, reg14} : (wire3 | wire2))) ?
                      {reg17,
                          wire3} : ((~^$unsigned((8'hb7))) * $unsigned($unsigned(reg8))))};
              reg16 <= ({{(7'h42),
                          ((~&reg15) ?
                              (wire1 ? reg16 : wire4) : (reg16 << reg6))},
                      $unsigned($signed(reg6[(4'hb):(3'h6)]))} ?
                  ($signed($signed($signed(reg7))) != ($signed($signed(wire0)) ?
                      wire2 : (^$signed(wire3)))) : wire3[(3'h7):(3'h4)]);
              reg17 <= reg10[(3'h6):(1'h1)];
            end
          reg18 <= reg17[(3'h5):(2'h3)];
          reg19 <= (8'hbd);
        end
      if (((|reg5[(4'hf):(3'h4)]) + reg18))
        begin
          reg20 <= reg19;
        end
      else
        begin
          reg20 <= $signed(($signed({reg6,
              (^~wire1)}) >= ($signed((reg14 != (8'ha7))) << ($unsigned(reg12) ?
              (wire3 >>> reg5) : wire0[(3'h4):(1'h0)]))));
          reg21 <= (~(8'hbf));
        end
    end
  assign wire22 = ((wire3[(4'h8):(3'h5)] || $unsigned(wire0)) == (((+(reg21 >>> (8'ha2))) + reg15) ?
                      (($unsigned(reg15) ?
                          reg21[(2'h3):(1'h0)] : reg7) ~^ (((7'h40) && reg21) * $signed(reg10))) : (~|$signed((wire4 ?
                          reg6 : reg18)))));
  assign wire23 = ({$unsigned((^(reg6 ? reg16 : reg11))),
                          {(~^(wire3 == (8'hb1)))}} ?
                      ((((8'hae) ^~ reg9) ?
                          (+$unsigned(wire4)) : $signed(reg20)) + $signed({(^~reg7),
                          (wire1 ? wire1 : reg13)})) : (reg7 ?
                          $signed((+(+(8'had)))) : reg16[(2'h2):(2'h2)]));
  assign wire24 = (reg18[(5'h11):(3'h5)] * {wire4[(1'h1):(1'h1)]});
  assign wire25 = $unsigned(reg14);
  assign wire26 = (&$unsigned(wire22));
  assign wire27 = $unsigned($unsigned(reg6));
  assign wire28 = $unsigned($signed(reg9));
  assign wire29 = (({(reg10 * (wire25 ?
                              wire24 : (7'h41)))} | $unsigned(($signed(wire28) ?
                          $unsigned(wire24) : $unsigned((8'hae))))) ?
                      (^(~&wire4)) : $unsigned(reg18[(5'h12):(4'h9)]));
  assign wire30 = (8'hbf);
  always
    @(posedge clk) begin
      reg31 <= $unsigned($unsigned($unsigned(reg21)));
      reg32 <= (-$unsigned((|($unsigned((8'hbd)) || wire2))));
      if (wire24)
        begin
          reg33 <= $signed(wire29[(4'hd):(2'h3)]);
          reg34 <= (wire28[(1'h1):(1'h0)] <= $unsigned($unsigned(reg14[(2'h2):(2'h2)])));
          reg35 <= (reg19 ?
              ($unsigned(reg16) ~^ ($signed((-reg12)) ?
                  ({(8'h9d), wire25} ?
                      (reg20 | (7'h43)) : $signed(reg21)) : reg10[(3'h5):(1'h0)])) : $signed((reg11[(4'hc):(4'h9)] <= reg5)));
          if ($unsigned(wire4))
            begin
              reg36 <= ((reg11[(5'h12):(1'h0)] ?
                      reg19[(4'h8):(3'h5)] : (-reg15[(1'h1):(1'h1)])) ?
                  reg14 : (~reg16[(1'h1):(1'h1)]));
            end
          else
            begin
              reg36 <= reg11[(3'h5):(1'h1)];
              reg37 <= ({$unsigned((8'h9d))} * $signed(reg10[(4'hc):(4'h9)]));
              reg38 <= ($signed((~|reg7)) ? reg34 : wire24[(4'hb):(1'h0)]);
            end
          reg39 <= {wire28};
        end
      else
        begin
          reg33 <= reg17[(1'h0):(1'h0)];
          reg34 <= (((~(8'hbc)) ?
                  $unsigned({$unsigned(wire3),
                      $signed((8'hb3))}) : ({wire24[(2'h2):(1'h0)]} ?
                      $signed($unsigned((8'hb5))) : ((reg34 << wire0) ?
                          {(8'hb6), (8'hb6)} : (reg19 ^ (8'hb5))))) ?
              (|wire4) : wire23[(1'h0):(1'h0)]);
        end
    end
  assign wire40 = {{(((reg8 == wire2) != $unsigned(wire23)) ?
                              (reg16 ?
                                  $signed(reg8) : reg20[(3'h7):(3'h4)]) : ((^reg31) ?
                                  $signed((7'h41)) : wire27)),
                          wire24[(4'hf):(1'h0)]}};
endmodule

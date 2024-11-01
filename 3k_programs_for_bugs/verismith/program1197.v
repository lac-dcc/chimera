module top
#(parameter param65 = (((((~|(8'hb3)) ~^ {(8'ha3), (8'hb9)}) * ((~^(8'ha0)) ? ((8'ha7) - (8'ha0)) : (-(7'h44)))) ? (((-(8'had)) ? ((7'h41) < (8'had)) : (~&(7'h44))) ? {{(8'hbd)}} : (8'hae)) : (({(7'h44)} >>> ((8'h9d) >> (8'hae))) ? (+((8'hb0) ? (8'hb7) : (8'ha5))) : (~{(8'hb4)}))) || (^~{{((8'hb8) && (8'hb2))}, (((8'hac) >> (7'h43)) ? ((8'hbd) < (8'hac)) : {(8'haa), (7'h41)})})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire61;
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire61,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
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
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4);
      reg6 <= $signed((~wire1[(3'h4):(1'h0)]));
      reg7 <= $unsigned((wire0 >>> (^~((reg6 ? wire0 : wire3) ?
          wire3[(1'h1):(1'h1)] : wire1))));
      if ($signed(wire1[(1'h0):(1'h0)]))
        begin
          reg8 <= ((^(&(^~wire4[(1'h1):(1'h0)]))) ^~ $unsigned(wire4));
          reg9 <= {$signed((((^~reg6) * (^~wire1)) * (^~reg6)))};
          reg10 <= wire2;
        end
      else
        begin
          reg8 <= {((reg8[(2'h3):(2'h2)] ?
                  reg5 : $signed((wire0 != reg9))) < wire2[(4'hc):(1'h0)]),
              $unsigned({($unsigned(reg7) ~^ (reg8 ? reg10 : wire3)),
                  ({(8'hb3), reg7} ? (wire2 ? (8'hbe) : wire4) : (+reg10))})};
        end
      if (($signed(reg5[(3'h5):(3'h5)]) ?
          $unsigned(wire4[(4'h8):(2'h2)]) : $unsigned(((+$signed((8'hb5))) == {{(8'hbc)},
              (|wire4)}))))
        begin
          reg11 <= ($unsigned({$unsigned(reg9[(4'hc):(3'h4)]),
                  $signed((wire2 ? wire1 : reg9))}) ?
              $signed((+$unsigned(reg10))) : (({reg5} ?
                  ($signed((8'ha5)) << reg5) : (|(reg7 ?
                      reg5 : (8'hbe)))) - (reg8[(2'h3):(1'h1)] ?
                  wire1 : $signed(reg9))));
          reg12 <= ($signed((8'haf)) ?
              $unsigned(reg10[(3'h7):(3'h7)]) : (+($signed(reg8[(1'h1):(1'h0)]) ?
                  $unsigned($signed(reg7)) : ($unsigned(reg6) >>> (reg9 ?
                      wire0 : reg6)))));
        end
      else
        begin
          reg11 <= wire2[(3'h7):(3'h4)];
          reg12 <= $unsigned($signed($signed((^~wire4))));
          if (reg8[(1'h0):(1'h0)])
            begin
              reg13 <= (+(~&$unsigned(($unsigned((8'hb0)) ?
                  (~|reg7) : (wire3 ? reg10 : reg6)))));
            end
          else
            begin
              reg13 <= reg7;
              reg14 <= $unsigned(reg11[(1'h1):(1'h0)]);
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire4)
        begin
          if ((reg8[(1'h0):(1'h0)] ? reg9 : $signed(reg9)))
            begin
              reg15 <= {reg9[(4'h9):(2'h3)],
                  ({$unsigned((wire3 < (8'ha8))),
                      (wire1[(4'h8):(3'h5)] >> reg12)} ^~ ($unsigned(reg12[(4'hb):(4'h8)]) < ($signed((8'hbb)) ?
                      reg6 : $signed(reg5))))};
              reg16 <= $signed((^wire2[(1'h0):(1'h0)]));
              reg17 <= (((8'hb2) - $signed((reg13[(3'h7):(3'h4)] ?
                  (8'hb8) : $unsigned(reg8)))) > ((~&$unsigned(reg8[(2'h2):(2'h2)])) ?
                  reg6 : $unsigned($unsigned({wire1, (8'ha1)}))));
            end
          else
            begin
              reg15 <= {{(~$unsigned($unsigned(reg7))),
                      $unsigned($unsigned($unsigned((8'ha5))))},
                  (&(+$signed((reg12 + reg12))))};
              reg16 <= $unsigned(reg13);
              reg17 <= $signed($signed(wire4[(4'h9):(1'h1)]));
              reg18 <= (reg13[(3'h4):(2'h2)] ?
                  $unsigned($unsigned($unsigned((7'h42)))) : (&$signed(wire1)));
              reg19 <= (&$unsigned(((((8'had) ? reg16 : wire0) ?
                      (+reg13) : wire4) ?
                  reg12 : (wire0 ?
                      reg15[(2'h3):(2'h2)] : (wire3 ? reg18 : reg17)))));
            end
          reg20 <= $signed((~$unsigned(($unsigned(wire1) <= $signed(reg5)))));
        end
      else
        begin
          reg15 <= reg13;
          reg16 <= ((^~{(~|reg18)}) ?
              (8'had) : $unsigned((($signed(reg11) ?
                      {(7'h42)} : {reg15, reg9}) ?
                  {(wire2 > reg6), reg20[(1'h1):(1'h1)]} : ($signed((7'h41)) ?
                      ((8'had) ? wire0 : wire4) : {(8'ha0)}))));
          reg17 <= (8'ha0);
        end
    end
  assign wire21 = wire4;
  assign wire22 = ($signed((8'ha2)) ?
                      (reg13[(4'hd):(3'h6)] < (-$unsigned(wire0[(4'h8):(3'h5)]))) : ($signed(reg11) ~^ reg5[(1'h0):(1'h0)]));
  assign wire23 = {(reg16[(1'h1):(1'h0)] ?
                          $unsigned($signed((reg18 ?
                              reg9 : wire2))) : reg6[(3'h4):(3'h4)]),
                      (~(((reg12 ? wire22 : wire4) != $signed(reg13)) < ((reg8 ?
                          reg7 : reg6) >= (wire0 ? reg18 : reg7))))};
  assign wire24 = reg18[(2'h3):(1'h1)];
  assign wire25 = $unsigned(wire22[(4'h8):(3'h6)]);
  assign wire26 = ((~&(((!reg16) ? $signed(wire1) : reg19) ?
                      (reg8[(3'h5):(2'h2)] ?
                          (wire1 < (8'hbc)) : (~|reg10)) : ((reg13 ?
                              reg17 : (8'hbc)) ?
                          (reg9 - wire23) : $unsigned(reg14)))) != {reg17,
                      (wire0[(3'h7):(2'h3)] ?
                          (reg16[(4'h9):(3'h5)] ? reg17 : (+reg7)) : (!(wire1 ?
                              reg18 : reg14)))});
  assign wire27 = $signed(reg6[(1'h1):(1'h1)]);
  assign wire28 = {wire22[(3'h7):(3'h7)]};
  assign wire29 = $unsigned({reg20[(1'h1):(1'h1)]});
  always
    @(posedge clk) begin
      if ($unsigned(wire24))
        begin
          reg30 <= $signed(wire2);
          reg31 <= ((((~&(reg9 ? reg12 : reg10)) ?
                  (8'ha8) : $signed({reg5, reg15})) ?
              (8'hbe) : reg5) >> $signed($signed(wire1[(1'h0):(1'h0)])));
          reg32 <= reg16;
          reg33 <= (wire4 ?
              wire2 : ($signed(reg16[(3'h6):(1'h1)]) ?
                  wire3[(1'h0):(1'h0)] : $signed(wire23)));
        end
      else
        begin
          reg30 <= $unsigned($unsigned(reg10[(3'h5):(1'h0)]));
          reg31 <= wire23[(4'hc):(1'h1)];
          if ($unsigned(wire24))
            begin
              reg32 <= (+{$signed($unsigned((reg7 < (8'ha6))))});
              reg33 <= {(wire1[(1'h0):(1'h0)] ?
                      ($unsigned((wire25 >> reg18)) & {wire24,
                          $unsigned(reg7)}) : $unsigned((~^(!reg6)))),
                  $signed(reg14[(4'hd):(3'h6)])};
            end
          else
            begin
              reg32 <= $signed(reg17);
              reg33 <= (reg33 ?
                  $signed($unsigned((reg7 ?
                      $unsigned(wire28) : {wire23}))) : $signed($signed(wire2[(3'h4):(2'h2)])));
              reg34 <= (($signed(((!(8'h9f)) ?
                  (reg17 <<< reg18) : {reg32})) * (|reg33)) == $signed($signed($signed(reg9[(3'h6):(3'h5)]))));
            end
          reg35 <= ({(8'hb1)} >> ((reg17[(4'h8):(2'h3)] ?
              reg31 : ((~&reg11) ?
                  $unsigned(reg32) : (wire3 ? reg10 : wire22))) + reg33));
        end
      reg36 <= {reg7[(3'h4):(3'h4)],
          (($signed((reg16 ? reg35 : reg31)) ?
                  wire1 : $signed((reg35 ? (8'haf) : wire23))) ?
              (wire28 ?
                  $unsigned($signed((8'ha5))) : $signed($unsigned(reg35))) : wire28)};
      reg37 <= $unsigned($unsigned(reg20[(1'h1):(1'h1)]));
      reg38 <= ($unsigned($signed(reg19[(4'h8):(2'h2)])) ? reg33 : (8'ha3));
    end
  module39 #() modinst62 (wire61, clk, wire1, reg16, reg11, reg19);
  assign wire63 = (wire28 <= ((wire26 ?
                      $unsigned({wire4}) : $signed((8'hbb))) ^ $signed((~&(reg14 || reg37)))));
  assign wire64 = {($signed(wire27[(1'h1):(1'h1)]) ?
                          wire63[(1'h1):(1'h0)] : (~($signed(reg32) ?
                              (reg15 && reg32) : (reg33 * reg12))))};
endmodule

module module39
#(parameter param60 = ((((+(!(8'ha2))) << {{(8'had)}, ((8'hb2) ? (8'hae) : (8'hab))}) && {(((8'hb0) ? (8'hbc) : (8'hae)) ? ((8'hbc) ~^ (8'ha1)) : (^(8'hb3))), {(&(7'h42))}}) ? (((((7'h40) || (8'h9e)) && ((7'h40) ? (8'hb8) : (8'ha7))) | ((8'hbc) || (!(8'hb9)))) >>> ((((7'h43) ? (8'ha5) : (8'hae)) * ((8'hac) ? (8'had) : (8'hb3))) >>> {(~^(8'hb7))})) : (~&((((8'h9d) ? (8'h9e) : (8'hac)) > ((8'hb7) ? (8'ha2) : (8'h9c))) ? (((8'hb9) + (8'hb8)) ? ((7'h43) ? (8'hb4) : (8'had)) : {(8'had), (8'hac)}) : ((~^(7'h41)) ? {(8'had)} : (+(8'hbc)))))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire43;
  input wire [(4'ha):(1'h0)] wire42;
  input wire signed [(3'h6):(1'h0)] wire41;
  input wire [(5'h10):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire44;
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire44,
                 reg59,
                 reg58,
                 reg57,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = (~^$signed(((wire43[(2'h2):(2'h2)] ?
                      (wire40 & (8'hb5)) : ((8'hba) & wire43)) * ({wire40,
                      wire43} == $signed(wire43)))));
  always
    @(posedge clk) begin
      reg45 <= wire40[(2'h2):(1'h1)];
      reg46 <= wire42[(2'h3):(2'h2)];
      reg47 <= $signed((-(({wire44} ?
          (wire40 ? wire42 : (8'hb9)) : $signed(reg45)) << {$signed(reg45),
          (wire40 < wire40)})));
    end
  assign wire48 = (reg46 ?
                      {$signed(wire44[(2'h2):(2'h2)])} : (-((wire42[(3'h4):(2'h2)] ?
                          (reg46 <<< wire43) : (wire42 ?
                              wire41 : wire42)) + $unsigned($signed(wire41)))));
  assign wire49 = wire42;
  assign wire50 = reg45;
  assign wire51 = $signed($unsigned($signed(reg47[(1'h1):(1'h1)])));
  assign wire52 = $signed(wire49[(4'h8):(3'h6)]);
  assign wire53 = (&wire48);
  assign wire54 = $unsigned(reg47);
  assign wire55 = (-($unsigned(wire49[(3'h7):(2'h3)]) ?
                      (~&(wire48 * $signed(wire51))) : ((!(wire41 ?
                              wire54 : wire40)) ?
                          (8'h9c) : reg47)));
  assign wire56 = $unsigned(((wire48[(3'h5):(1'h1)] <<< $signed({(8'hbc),
                          wire40})) ?
                      $signed($unsigned(wire55[(1'h0):(1'h0)])) : ($unsigned(reg46[(5'h15):(1'h0)]) ?
                          (8'hb3) : ((~(8'hae)) * $unsigned((8'ha6))))));
  always
    @(posedge clk) begin
      reg57 <= wire54;
      reg58 <= wire40;
      reg59 <= ({reg57} ?
          (~((reg47 ? $signed(wire53) : $signed(wire44)) ?
              ((wire43 >> wire50) ?
                  (wire55 | wire40) : (wire44 & wire41)) : ({wire55,
                  wire44} <= $unsigned(wire51)))) : wire52[(2'h3):(2'h3)]);
    end
endmodule

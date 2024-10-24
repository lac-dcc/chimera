module top
#(parameter param46 = ((~{((+(8'hac)) ? ((7'h42) <<< (8'ha5)) : ((8'hbf) ? (8'ha1) : (8'hba)))}) ? (+({((8'hb0) ~^ (8'hb7))} ? (((8'ha7) <<< (7'h42)) >= ((8'ha2) ~^ (8'hb2))) : (8'hbe))) : (((~^(^(8'hb1))) < (((8'ha6) ? (8'hbf) : (8'hb0)) << ((7'h41) || (8'hae)))) > ((!((8'ha0) ? (8'ha0) : (8'hb7))) >= ((!(8'hb8)) ~^ ((8'haf) ? (8'hb9) : (8'hb2)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire42;
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire42,
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
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire0[(1'h1):(1'h0)]);
      reg6 <= $unsigned(wire1[(3'h7):(1'h0)]);
      if ((^~((((wire4 <<< wire2) + ((7'h44) ? wire2 : wire3)) ?
              (+wire1[(5'h13):(4'he)]) : ($unsigned(reg5) ?
                  wire3 : $signed(wire3))) ?
          ((8'h9e) > wire2) : $unsigned(((|wire4) >= (reg6 > reg6))))))
        begin
          reg7 <= (7'h40);
          reg8 <= ((7'h40) ?
              $unsigned({$signed($unsigned((7'h44))),
                  ((reg7 * wire2) ? (|wire3) : (wire4 < wire0))}) : wire2);
          reg9 <= $unsigned((wire2[(4'he):(2'h2)] ?
              $signed($signed((reg6 >= (8'ha0)))) : ($signed(reg5[(2'h3):(2'h3)]) << ((+wire4) - (wire3 <<< wire4)))));
        end
      else
        begin
          if ($unsigned($signed($signed({(~(8'ha8))}))))
            begin
              reg7 <= reg9[(2'h2):(1'h1)];
              reg8 <= ($signed($signed(wire3[(3'h6):(2'h2)])) ?
                  (reg9[(3'h4):(2'h3)] ?
                      wire3 : wire0[(3'h4):(1'h0)]) : ((reg9[(3'h6):(2'h2)] ^ $unsigned((reg5 ^ reg6))) ?
                      $unsigned({reg6}) : $unsigned($signed((^~wire3)))));
              reg9 <= $unsigned((wire0 ?
                  (|{{reg8, reg6},
                      (wire0 ? reg9 : reg8)}) : reg8[(3'h6):(1'h0)]));
            end
          else
            begin
              reg7 <= $signed((-($unsigned((!(8'hb5))) ?
                  {(wire1 ? reg8 : wire1)} : $signed(((8'ha9) >= reg7)))));
              reg8 <= {(8'ha4)};
              reg9 <= {(((8'ha9) ?
                      $signed(reg5[(3'h6):(3'h5)]) : (~|$signed(wire3))) ^ (&((+wire2) ?
                      $signed(wire3) : $signed(reg9)))),
                  reg8};
            end
          reg10 <= (~{$unsigned($unsigned($signed(wire1)))});
        end
    end
  always
    @(posedge clk) begin
      if ($signed((~|reg7)))
        begin
          reg11 <= reg10[(2'h2):(2'h2)];
          if (($unsigned((reg9 ? {{wire1}} : (-((8'ha6) ? wire1 : reg10)))) ?
              (reg9 ?
                  {(reg10 ?
                          (wire4 >= (8'had)) : ((8'ha7) <<< reg5))} : (!reg11[(3'h7):(3'h6)])) : (8'ha6)))
            begin
              reg12 <= ($signed({wire2[(2'h2):(2'h2)],
                  (reg6 >>> (^~reg5))}) < reg8[(2'h2):(2'h2)]);
              reg13 <= reg12;
              reg14 <= (~($signed((8'ha5)) ?
                  ($unsigned(((8'hac) & reg9)) * reg9[(3'h6):(3'h4)]) : $unsigned((wire3[(1'h0):(1'h0)] ?
                      reg13[(5'h15):(3'h5)] : $signed(wire4)))));
            end
          else
            begin
              reg12 <= (~|(^($signed((reg14 ? reg9 : wire3)) ?
                  ((reg13 >> reg8) ? reg9 : (reg12 != reg7)) : ({wire3} ?
                      (8'hb5) : $unsigned((8'ha3))))));
            end
        end
      else
        begin
          reg11 <= (|(reg13 ?
              {$signed($unsigned((8'h9f))),
                  $signed($unsigned((8'ha2)))} : $signed((reg6[(4'ha):(3'h6)] == (wire1 <= wire2)))));
          reg12 <= $unsigned((^~($unsigned({(8'h9e)}) && ((^~reg13) ?
              reg10[(3'h7):(1'h0)] : $signed(wire1)))));
          reg13 <= reg12[(4'h8):(2'h3)];
          if ((reg5[(3'h6):(1'h1)] & reg5))
            begin
              reg14 <= (($unsigned($unsigned(wire4[(1'h1):(1'h0)])) | {$unsigned(wire1),
                      {(reg10 ? (8'ha2) : reg11)}}) ?
                  {{$unsigned((+(8'ha4)))},
                      $unsigned(((reg5 ? wire4 : reg14) ?
                          (~^reg9) : (wire4 ?
                              reg6 : reg9)))} : {$unsigned(reg11)});
              reg15 <= reg10[(1'h1):(1'h1)];
              reg16 <= {((^(reg13[(4'hd):(3'h5)] ?
                      (8'ha3) : $signed((8'hae)))) - reg6[(3'h7):(1'h0)]),
                  wire2};
            end
          else
            begin
              reg14 <= $signed((~$unsigned($signed((~|(8'ha1))))));
              reg15 <= (reg8 >>> (wire4[(1'h1):(1'h1)] ?
                  (^~{(wire3 ? wire2 : reg14)}) : (!(~|$unsigned(wire1)))));
            end
          reg17 <= reg5[(3'h5):(2'h2)];
        end
      reg18 <= {($signed(wire1) ?
              wire4[(2'h3):(2'h2)] : ($unsigned($unsigned(reg15)) ~^ $signed($unsigned((8'haf)))))};
      reg19 <= wire0[(2'h3):(2'h3)];
      if ($unsigned(((7'h41) ?
          ((~|$unsigned(wire3)) << ((reg17 ? reg9 : reg15) ?
              reg5[(1'h0):(1'h0)] : {reg10, reg8})) : reg16)))
        begin
          reg20 <= wire4;
          reg21 <= $signed(($signed(({(8'hb2), reg14} ?
                  (~&(8'hab)) : (reg17 || wire2))) ?
              (wire0[(3'h5):(2'h2)] <<< $signed($signed(reg6))) : reg14));
        end
      else
        begin
          reg20 <= $signed(((($signed(wire2) < {(7'h40), wire0}) ?
                  $signed({wire2,
                      reg15}) : ($unsigned(reg19) && $unsigned((8'had)))) ?
              $unsigned((~&(reg11 ? reg13 : reg16))) : reg13[(4'hb):(3'h4)]));
          reg21 <= wire0;
          reg22 <= reg20[(5'h13):(5'h10)];
        end
    end
  module23 #() modinst43 (wire42, clk, reg22, reg14, reg20, wire2, wire3);
  assign wire44 = ($unsigned($unsigned($unsigned({reg18, reg18}))) ?
                      ({$unsigned((&(8'hb7)))} ?
                          (~(8'hb0)) : (((reg19 ? wire2 : (8'ha3)) ?
                                  reg21[(5'h10):(1'h0)] : (wire0 ?
                                      reg16 : wire42)) ?
                              {reg17,
                                  (reg8 ?
                                      reg21 : reg16)} : (~^$signed((8'hae))))) : ({$signed((wire2 >> wire2)),
                              reg13} ?
                          $unsigned(reg22[(4'h8):(3'h6)]) : (~^reg17[(1'h1):(1'h0)])));
  assign wire45 = $signed($signed((($signed((8'hbf)) <= $unsigned(reg10)) * $signed((^wire42)))));
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 (1'h0)};
  assign wire29 = (~&(8'hac));
  assign wire30 = (wire29 << wire29);
  assign wire31 = ((8'h9c) ?
                      $signed(($unsigned((wire28 ? (8'ha8) : wire25)) ?
                          wire28[(4'hb):(4'ha)] : {(8'ha9)})) : wire27[(3'h5):(1'h0)]);
  assign wire32 = ((!(|wire29[(2'h2):(1'h0)])) && wire28);
  assign wire33 = wire28;
  assign wire34 = wire26[(4'h9):(2'h2)];
  assign wire35 = (wire27[(4'ha):(4'h9)] & wire31);
  assign wire36 = $unsigned($signed((wire31 ?
                      $signed((+wire34)) : (&(wire29 & wire32)))));
  assign wire37 = $unsigned(wire25);
  assign wire38 = $signed($unsigned($unsigned(wire29[(1'h1):(1'h0)])));
  assign wire39 = wire30[(1'h1):(1'h0)];
  assign wire40 = ({(wire27 ~^ ($unsigned(wire36) ?
                          $unsigned(wire25) : $signed(wire38))),
                      ($signed((~^wire27)) ?
                          ((wire25 == wire28) || (wire31 ?
                              wire31 : wire33)) : {$unsigned((8'hb7)),
                              $signed(wire36)})} >= (((wire33 ?
                          wire36[(3'h7):(2'h3)] : $unsigned(wire39)) >>> $unsigned(wire34[(4'h8):(2'h2)])) ?
                      wire28[(3'h5):(2'h3)] : (wire24 ?
                          (wire30[(3'h5):(3'h4)] ?
                              wire28[(4'he):(2'h2)] : wire28[(5'h13):(2'h3)]) : (wire26 ?
                              $signed(wire24) : wire26[(4'h9):(1'h1)]))));
  assign wire41 = $unsigned((~|{wire40}));
endmodule

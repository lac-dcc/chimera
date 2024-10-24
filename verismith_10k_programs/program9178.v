module top
#(parameter param45 = ((((((8'hb4) ? (8'hab) : (8'h9f)) | {(8'hb0), (8'ha0)}) == (((7'h44) < (8'h9d)) | ((7'h41) ? (8'hbd) : (8'hac)))) || {(|(&(8'hac))), (7'h41)}) ? (((~{(8'ha3)}) ? (((8'hba) - (8'ha9)) - (8'h9d)) : (((8'ha6) && (8'ha1)) << ((8'h9d) ? (8'ha1) : (8'hba)))) ? (|(((7'h44) || (8'hae)) ? ((8'h9c) ? (7'h44) : (8'ha5)) : ((8'ha1) - (8'hbe)))) : (~|(((7'h43) ? (8'h9e) : (8'hb3)) <= ((8'ha3) + (8'haf))))) : (8'ha9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire3};
      reg5 <= $unsigned(({$signed((8'hab))} ?
          (|(((8'hbc) * wire1) ?
              wire0 : (reg4 ? (8'ha9) : (8'hbb)))) : ((^(wire2 >>> (8'ha1))) ?
              $signed($signed(wire1)) : $unsigned({wire0, reg4}))));
    end
  always
    @(posedge clk) begin
      reg6 <= $unsigned((!((((8'ha2) ? wire0 : (7'h44)) >> wire2) + (&(reg5 ?
          wire2 : reg4)))));
      reg7 <= wire1;
      reg8 <= ((~^reg7[(2'h3):(1'h1)]) > $signed((|(reg5 >> $signed((8'hbe))))));
    end
  always
    @(posedge clk) begin
      reg9 <= ({($unsigned($signed((8'h9c))) || reg7[(4'h8):(3'h5)])} ?
          wire0[(4'hb):(4'hb)] : (|($unsigned((reg6 || wire3)) >= $unsigned((reg8 >> reg8)))));
      reg10 <= {((reg5[(2'h2):(2'h2)] & (!(reg4 << reg6))) & $unsigned(reg7))};
      reg11 <= {wire0[(1'h0):(1'h0)],
          (({$unsigned(reg10)} > (-wire0)) ?
              ((reg10 ? $unsigned(reg9) : reg4[(4'h8):(2'h2)]) ?
                  $unsigned(reg10) : {$signed(wire2), reg10}) : (wire0 ?
                  (~&(~&reg6)) : reg7))};
      if ($unsigned((&({((8'hb7) ? wire0 : (8'hbb)), (wire1 > wire1)} ?
          ((&reg8) ? (!wire2) : {reg7}) : reg7[(4'h9):(3'h7)]))))
        begin
          reg12 <= reg5[(4'he):(4'ha)];
          reg13 <= reg9;
        end
      else
        begin
          reg12 <= ($unsigned((reg4 ^~ ((wire2 & reg11) ?
                  (~|wire2) : {wire2}))) ?
              ({{{reg12, reg6}}, wire3[(2'h3):(1'h0)]} ?
                  (&$signed((reg10 ?
                      reg7 : reg8))) : reg12[(2'h2):(2'h2)]) : $unsigned({reg6[(3'h4):(2'h3)],
                  $signed($signed(reg11))}));
          reg13 <= $unsigned({$signed($unsigned(wire1[(1'h0):(1'h0)]))});
          reg14 <= wire1[(3'h7):(3'h6)];
          if (((~(!$unsigned($unsigned(wire0)))) ?
              $signed(wire3) : (($signed((reg9 != reg6)) ?
                  {(wire1 <<< reg11)} : {wire1,
                      reg7}) > {(~|((8'h9f) > reg6))})))
            begin
              reg15 <= (~^($signed($unsigned($signed(wire1))) ?
                  (($signed(reg8) << reg4) && (8'ha4)) : (wire1 ?
                      reg4 : $unsigned(((8'h9d) ? reg7 : reg14)))));
              reg16 <= $unsigned(reg14);
              reg17 <= $signed(reg13);
              reg18 <= reg8[(4'h9):(4'h9)];
              reg19 <= ((&$unsigned($signed((-reg4)))) | reg13);
            end
          else
            begin
              reg15 <= (-reg16);
              reg16 <= wire0[(3'h5):(1'h1)];
              reg17 <= wire1;
            end
        end
    end
  assign wire20 = {((($unsigned(reg13) <<< ((8'haa) ^ reg17)) | wire1[(1'h0):(1'h0)]) | wire2)};
  assign wire21 = $signed(((($unsigned((8'h9c)) != reg12[(2'h3):(2'h3)]) ?
                      wire0 : ((^reg4) >>> (~&reg19))) || $unsigned((wire20 == $signed(reg13)))));
  assign wire22 = ({wire21} || reg8);
  assign wire23 = reg9;
  assign wire24 = ($unsigned(reg8[(3'h6):(3'h5)]) >> (wire0[(2'h2):(1'h1)] != (+reg5[(4'h9):(3'h5)])));
  always
    @(posedge clk) begin
      reg25 <= reg11[(5'h10):(2'h2)];
      if ((^$unsigned((wire22[(1'h1):(1'h0)] ?
          (wire3[(3'h4):(2'h3)] || $signed((8'h9d))) : $unsigned({reg25,
              reg14})))))
        begin
          reg26 <= ($signed(reg11[(4'hd):(3'h5)]) ?
              $signed($unsigned(reg25[(3'h7):(2'h2)])) : reg9);
          reg27 <= $unsigned($unsigned($signed($unsigned($unsigned((8'ha3))))));
        end
      else
        begin
          reg26 <= ($signed($signed((reg12[(1'h1):(1'h0)] ~^ (!reg12)))) - (((^reg12[(1'h0):(1'h0)]) ?
                  $unsigned($signed(wire1)) : $unsigned((^~reg8))) ?
              (+{(wire2 ~^ reg10),
                  $unsigned(wire1)}) : $signed($signed($unsigned(reg11)))));
          if ((reg27 ?
              (+$unsigned(reg13)) : (((-{wire24,
                  wire3}) < ((!reg19) ^ $signed(wire3))) > $unsigned($signed(reg16)))))
            begin
              reg27 <= ($signed((reg19 <= $unsigned((reg8 ?
                  (7'h43) : reg5)))) + reg25);
              reg28 <= {reg11, reg12[(1'h1):(1'h1)]};
              reg29 <= (reg14[(1'h1):(1'h1)] ?
                  reg7 : $unsigned((((!reg11) < wire21) ?
                      $unsigned(reg9) : $signed(reg4))));
              reg30 <= (+$signed(({(wire1 & wire1)} ?
                  $signed((~^reg6)) : {(reg14 << reg16)})));
            end
          else
            begin
              reg27 <= ($signed((7'h40)) ?
                  (({$signed(reg16)} ?
                      reg16[(4'h8):(1'h1)] : reg18) >> ((~^$unsigned((8'ha9))) && reg10)) : $unsigned(reg10[(2'h2):(1'h0)]));
            end
          reg31 <= (reg5 ^ $unsigned(((-$signed(reg17)) ?
              (^reg11) : ((reg6 ? (8'h9d) : reg8) ?
                  $signed((8'hbf)) : (~&reg5)))));
          if ($unsigned($unsigned({$signed((reg30 != reg26))})))
            begin
              reg32 <= (reg30[(1'h0):(1'h0)] ?
                  $unsigned(((reg29 ?
                          wire0[(3'h6):(2'h3)] : (wire21 ? (8'haa) : reg15)) ?
                      reg6 : ($signed(reg28) ?
                          reg7[(4'ha):(4'ha)] : (!reg15)))) : wire2);
              reg33 <= {(-$unsigned(reg6))};
              reg34 <= wire21[(4'hd):(4'hb)];
            end
          else
            begin
              reg32 <= (+$signed($signed((-$signed(reg17)))));
              reg33 <= ((&(((wire21 ^~ reg18) ?
                  $signed(wire20) : (~reg7)) > ((|reg12) ^~ (reg32 || reg13)))) * (~&($signed(((8'hac) ?
                  wire2 : reg5)) >>> {reg10})));
              reg34 <= (reg33 || ((reg25[(4'hc):(3'h5)] ?
                  reg32[(2'h2):(1'h0)] : (reg11[(3'h4):(1'h1)] | $unsigned(reg27))) + ($signed((wire21 < wire21)) ?
                  $signed((~&(8'hbe))) : $unsigned((reg13 ~^ reg25)))));
              reg35 <= (&reg18[(3'h5):(3'h4)]);
              reg36 <= reg9[(2'h3):(2'h2)];
            end
          reg37 <= reg12[(1'h0):(1'h0)];
        end
      reg38 <= $unsigned(((-reg8[(4'h8):(3'h7)]) ?
          (|reg13[(3'h6):(2'h3)]) : (^~{reg17})));
      reg39 <= (~|wire20);
    end
  always
    @(posedge clk) begin
      if ((-$signed($unsigned(reg35[(2'h3):(1'h0)]))))
        begin
          reg40 <= $unsigned($unsigned({(^$signed((8'had))),
              (~|(reg18 | wire3))}));
        end
      else
        begin
          reg40 <= $signed($signed(wire20));
          reg41 <= reg30[(1'h0):(1'h0)];
        end
      reg42 <= wire21;
      reg43 <= $signed({reg17});
      reg44 <= reg25[(4'h9):(1'h0)];
    end
endmodule

module top
#(parameter param49 = ({(((8'ha7) > ((8'h9f) ? (8'ha7) : (8'h9d))) ? {((8'hb0) >>> (8'h9d)), ((7'h43) ? (8'hbd) : (8'hab))} : (((8'hbc) <= (8'had)) ? {(8'ha4), (8'h9f)} : {(8'hab)}))} != ((^~{((8'hb1) > (8'h9f)), (~(8'ha5))}) ^ ((~((8'ha5) <<< (8'hb6))) + (|((8'ha6) << (8'hab)))))), 
parameter param50 = {((8'hb2) && (((param49 ~^ param49) ? param49 : param49) <<< ((-(8'ha4)) ^ param49)))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ((^~(($signed((8'h9e)) ?
                             (wire0 ? wire1 : (7'h41)) : (wire1 ?
                                 wire3 : wire2)) ?
                         (~(!(8'hb4))) : $signed((wire0 + wire2)))) ?
                     wire4 : (~wire2[(4'h9):(3'h5)]));
  always
    @(posedge clk) begin
      if ((~^$signed(wire0[(1'h0):(1'h0)])))
        begin
          reg6 <= (wire1[(2'h2):(1'h1)] >> ($unsigned((((8'h9f) ?
              wire3 : (8'h9f)) <<< (wire2 ^ wire0))) > (wire0[(1'h1):(1'h0)] > wire3[(1'h0):(1'h0)])));
          reg7 <= wire4;
          reg8 <= ($signed({$unsigned($unsigned(wire4))}) ^ $unsigned((8'hb1)));
          if ($signed(wire4[(3'h4):(3'h4)]))
            begin
              reg9 <= (((~wire2[(3'h6):(3'h4)]) > wire1[(1'h1):(1'h1)]) ?
                  wire2[(1'h0):(1'h0)] : ((((wire1 ? (8'ha7) : reg7) & wire1) ?
                          wire3 : reg7) ?
                      wire2[(1'h1):(1'h0)] : (~&(wire5 - $signed(reg6)))));
              reg10 <= $signed((|reg7));
              reg11 <= $signed((-$signed({(8'h9e)})));
            end
          else
            begin
              reg9 <= {({$unsigned(((8'ha6) <= reg10)),
                      (|(reg9 ? reg10 : wire4))} & wire2[(2'h3):(1'h1)]),
                  ($unsigned($signed(reg8[(2'h2):(1'h0)])) + (+{(wire2 ?
                          reg10 : reg9),
                      (wire5 ? wire2 : wire1)}))};
              reg10 <= (&((($unsigned(wire2) ^ wire1[(1'h1):(1'h1)]) ?
                  $unsigned(((8'hbe) ?
                      reg9 : wire4)) : $unsigned($unsigned(wire0))) + (-$unsigned((+reg8)))));
              reg11 <= (^($unsigned({(wire1 && reg9), reg11}) ?
                  $signed((wire2[(4'ha):(3'h4)] ?
                      (wire4 & wire3) : (wire4 ?
                          wire4 : reg6))) : $signed(wire3)));
              reg12 <= wire3[(4'hd):(3'h7)];
              reg13 <= ($unsigned(((~wire2) ? $signed((~|wire0)) : wire3)) ?
                  $signed((+($signed(reg7) ^ reg8[(1'h0):(1'h0)]))) : reg10[(3'h4):(2'h2)]);
            end
        end
      else
        begin
          reg6 <= $unsigned($unsigned(($unsigned((!reg8)) <= wire2[(2'h2):(1'h1)])));
        end
      if (((~($unsigned(reg10) || (^~$unsigned(wire5)))) ^~ $signed(((+{wire5}) ?
          $signed((reg12 || wire2)) : (reg7[(4'h8):(1'h1)] ?
              $signed(wire4) : wire4[(3'h5):(3'h4)])))))
        begin
          if (reg9)
            begin
              reg14 <= {($unsigned(wire4[(2'h3):(2'h3)]) | ($unsigned($unsigned((8'hb9))) ?
                      (~(~^reg10)) : $unsigned((reg7 ? (8'ha0) : wire1))))};
            end
          else
            begin
              reg14 <= (((($signed(reg12) ?
                  (+reg14) : $unsigned((8'ha3))) != reg8[(4'hc):(4'hc)]) ~^ reg11) < (~(~reg12)));
            end
          if (reg10)
            begin
              reg15 <= ((wire0[(1'h0):(1'h0)] < $unsigned((~|reg9[(3'h4):(2'h3)]))) ?
                  (({{(8'haf), reg12}, {(8'hbe), wire4}} ?
                          $signed($signed(wire0)) : (~|wire0[(4'h8):(1'h0)])) ?
                      wire1[(3'h5):(3'h4)] : wire2) : (~^(((~wire4) ?
                          $signed(reg6) : reg7) ?
                      (8'hba) : ((^reg11) >>> $unsigned((8'ha5))))));
              reg16 <= $signed($signed(reg13[(2'h2):(2'h2)]));
              reg17 <= $unsigned(reg8[(4'hc):(4'ha)]);
              reg18 <= (|reg9);
              reg19 <= ((reg17[(1'h1):(1'h1)] ? wire4 : reg10) >= reg18);
            end
          else
            begin
              reg15 <= wire5[(3'h5):(2'h3)];
              reg16 <= $unsigned($signed({$signed((~wire0))}));
              reg17 <= ((~^(reg15 ?
                      ((reg13 ? reg19 : reg16) << reg9) : (^~$signed(wire4)))) ?
                  (~^(~^(^~$unsigned(reg7)))) : ({((^reg11) ?
                          wire1[(3'h4):(3'h4)] : (|reg11)),
                      {wire4}} >= {{{reg11, wire3}}}));
              reg18 <= (8'ha7);
              reg19 <= ($signed(((~&(reg18 ? wire2 : reg10)) ?
                  reg11 : $unsigned((wire2 ? (8'hb7) : reg10)))) | ((!({reg12,
                  reg6} < $signed((8'ha4)))) ~^ wire4[(3'h4):(1'h1)]));
            end
          reg20 <= $unsigned(reg15[(3'h4):(1'h1)]);
          reg21 <= (reg7 && $unsigned((reg14[(4'h8):(3'h7)] >= $signed(((8'hb5) ^~ wire2)))));
        end
      else
        begin
          reg14 <= reg15;
          reg15 <= (+reg12[(4'ha):(3'h6)]);
        end
      reg22 <= reg11[(4'hd):(4'h9)];
    end
  assign wire23 = $unsigned((-$unsigned((|{(8'hb9)}))));
  assign wire24 = $unsigned($signed((((wire3 ? reg18 : wire4) ?
                      reg19[(3'h6):(3'h6)] : (~^(8'ha0))) || (~|(8'hab)))));
  assign wire25 = $unsigned($unsigned(($signed($signed(wire23)) ?
                      $unsigned($signed(reg17)) : (^~(reg9 ?
                          reg10 : wire24)))));
  assign wire26 = wire2;
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg27 <= $unsigned(((!(|reg14[(3'h5):(1'h1)])) ?
              wire26[(3'h4):(1'h1)] : reg13[(3'h7):(3'h7)]));
          reg28 <= (+$signed((reg6[(1'h1):(1'h0)] ? reg17 : (~|(!(8'hbb))))));
        end
      else
        begin
          reg27 <= reg27;
          reg28 <= reg27[(1'h0):(1'h0)];
          reg29 <= {({($unsigned(wire2) - (reg10 <= wire24))} ?
                  reg27[(1'h0):(1'h0)] : $signed($unsigned((reg8 ?
                      (8'hb6) : reg18)))),
              wire26[(2'h2):(1'h0)]};
          reg30 <= ((8'hb9) <= {$unsigned($signed((reg11 & reg18)))});
        end
      if ($unsigned(((reg6 >> ((reg9 ? wire5 : wire23) ?
              reg9 : $unsigned(reg27))) ?
          (8'h9e) : wire1[(1'h0):(1'h0)])))
        begin
          reg31 <= {reg6[(4'h8):(4'h8)]};
          reg32 <= $signed($unsigned(reg30));
          reg33 <= reg12;
          reg34 <= reg18[(4'h8):(1'h0)];
        end
      else
        begin
          reg31 <= reg28;
          if ($signed($signed(wire24[(1'h0):(1'h0)])))
            begin
              reg32 <= ($unsigned(reg29) ^~ (($signed({reg33}) ?
                  reg19 : $signed((~wire26))) + ($signed((wire24 < reg7)) ?
                  $signed($unsigned(reg27)) : $unsigned($signed(reg31)))));
              reg33 <= (~reg21);
              reg34 <= $unsigned(($unsigned($signed($signed(reg32))) ^ (((!reg33) ?
                      $unsigned(wire2) : (reg21 ? (8'had) : wire4)) ?
                  reg15[(4'h8):(3'h6)] : (|reg10))));
            end
          else
            begin
              reg32 <= $signed($unsigned($signed((+(~&reg20)))));
              reg33 <= $unsigned((^~(&($unsigned((8'ha5)) ^ (reg29 ?
                  (8'hae) : reg22)))));
              reg34 <= reg34;
              reg35 <= (^((~|reg7[(3'h5):(2'h3)]) ?
                  ($signed((^~reg29)) >> (+reg20)) : reg27[(2'h3):(1'h1)]));
              reg36 <= (wire24 ?
                  $unsigned($signed((((8'hbd) ?
                      reg32 : reg33) | {reg30}))) : {({(~reg33),
                              $unsigned(reg20)} ?
                          ((^wire0) ?
                              (reg12 ?
                                  reg9 : reg8) : (reg8 && reg22)) : reg21[(3'h5):(1'h0)]),
                      $unsigned(reg30)});
            end
          reg37 <= ((!(wire26[(2'h2):(1'h0)] ? reg34[(4'h8):(1'h1)] : reg9)) ?
              wire4[(3'h4):(2'h2)] : (reg27 >>> ((-$unsigned(reg34)) ?
                  ((reg19 ~^ reg31) != $signed((8'h9f))) : (reg16 | $unsigned(reg12)))));
        end
      reg38 <= $unsigned($unsigned($signed($signed((reg32 ? reg31 : reg7)))));
      reg39 <= reg38;
    end
  assign wire40 = (wire26 > ((|(reg37[(4'hc):(3'h6)] ^~ reg18[(5'h11):(1'h1)])) | ($unsigned($signed(reg21)) < (~|(reg21 ?
                      reg10 : wire24)))));
  assign wire41 = {$signed($signed((8'haa)))};
  assign wire42 = wire41[(2'h3):(2'h2)];
  assign wire43 = ((^~(reg17 ?
                      (&(!reg17)) : ({reg29, reg35} | (reg20 ?
                          reg14 : wire41)))) >= reg6);
  assign wire44 = ($signed(((wire0[(2'h3):(2'h3)] ~^ reg38) < $signed((^wire24)))) * ($unsigned(reg21[(3'h6):(2'h3)]) ?
                      $unsigned($signed($unsigned(reg7))) : ({reg28} ?
                          reg39 : (reg7[(3'h4):(1'h0)] ?
                              {reg11, reg22} : reg17))));
  assign wire45 = $unsigned($unsigned($signed(wire40)));
  assign wire46 = reg8;
  assign wire47 = (wire0[(1'h0):(1'h0)] || ($signed(wire46) ?
                      reg38[(2'h2):(2'h2)] : (wire43[(2'h2):(2'h2)] && $unsigned((reg36 && (7'h43))))));
  assign wire48 = (wire45 != {((~^(&reg15)) ?
                          $signed((reg33 >> wire26)) : ($signed(reg39) == (!wire5))),
                      (8'had)});
endmodule

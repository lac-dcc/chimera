module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned(((~$unsigned($signed(wire3))) >> (wire0 ?
          $signed($unsigned(wire2)) : wire2)));
      if ((~|$signed($unsigned(wire1))))
        begin
          if ((wire0[(4'ha):(3'h4)] ?
              (wire1 && wire1[(3'h4):(3'h4)]) : $unsigned((^{(wire0 ^~ (8'hb1))}))))
            begin
              reg5 <= ($unsigned(($unsigned($unsigned(reg4)) | (~|$signed((8'hb7))))) ?
                  $signed(wire0) : $signed($unsigned(wire0)));
            end
          else
            begin
              reg5 <= (($unsigned(((wire1 << wire0) * (wire1 ?
                  wire0 : (8'hbc)))) > (8'hbd)) >> (wire2[(4'hd):(4'h9)] ?
                  reg5[(3'h6):(2'h2)] : (($signed(wire3) == (8'hb7)) ?
                      ($unsigned(wire2) ?
                          (wire2 >> reg4) : $signed(reg5)) : ((reg4 ?
                          reg5 : wire3) & (reg5 ? wire0 : reg5)))));
              reg6 <= reg4[(4'hd):(4'ha)];
              reg7 <= (-$signed((reg4 ?
                  (-wire0) : (wire2 ? {wire3} : (~reg5)))));
              reg8 <= $signed((~&((~&(~^reg7)) ? {(~reg7)} : {(^~reg7)})));
              reg9 <= $signed(reg5[(2'h3):(2'h2)]);
            end
          reg10 <= (+reg6);
          if (({reg4[(1'h0):(1'h0)]} ~^ $signed((|wire0[(4'h8):(4'h8)]))))
            begin
              reg11 <= (reg10[(1'h0):(1'h0)] ?
                  (reg7 <= ((!reg7[(1'h1):(1'h1)]) ?
                      $signed((wire3 + wire3)) : $signed((^~(8'hb2))))) : wire2);
            end
          else
            begin
              reg11 <= $signed(reg6[(3'h4):(2'h2)]);
            end
          reg12 <= (~&(~|(7'h41)));
          reg13 <= $unsigned($signed($unsigned((~^wire2[(3'h6):(2'h3)]))));
        end
      else
        begin
          reg5 <= reg12;
          if (reg4[(4'hc):(1'h0)])
            begin
              reg6 <= reg7;
              reg7 <= reg5[(1'h1):(1'h0)];
              reg8 <= $unsigned($signed($unsigned($signed((wire0 ?
                  reg10 : wire1)))));
              reg9 <= wire3;
              reg10 <= (8'hba);
            end
          else
            begin
              reg6 <= wire3[(2'h3):(2'h2)];
              reg7 <= reg7[(1'h1):(1'h1)];
              reg8 <= reg9;
              reg9 <= reg8;
              reg10 <= ((wire3[(1'h1):(1'h1)] ?
                  reg10[(4'hb):(3'h6)] : reg13) > $signed($signed($signed($unsigned(reg11)))));
            end
          reg11 <= reg13;
          if (((($signed((reg13 ? wire2 : reg13)) ?
              $unsigned((8'hb0)) : (~|(8'hbb))) <= (8'hb2)) - (8'hac)))
            begin
              reg12 <= (((((8'h9d) ? wire1 : {(7'h41), reg10}) ?
                  ((|(8'ha0)) < reg8) : ((!reg6) <<< {reg11})) ~^ (8'hac)) << (!($unsigned($unsigned((8'hb9))) <= {(~&reg9)})));
              reg13 <= (reg10[(3'h5):(1'h0)] ?
                  (~$unsigned(($unsigned(reg10) << $unsigned(reg4)))) : (((|wire1) ?
                          (8'hb4) : reg7) ?
                      (!(~^$signed(reg7))) : $unsigned(reg7[(2'h2):(2'h2)])));
              reg14 <= $unsigned($signed($unsigned($signed((reg6 ?
                  reg4 : (7'h40))))));
              reg15 <= reg4[(5'h10):(4'hd)];
            end
          else
            begin
              reg12 <= reg13;
              reg13 <= ($unsigned((wire0 + {reg14[(2'h3):(1'h0)],
                      $unsigned(reg14)})) ?
                  $unsigned((^~reg11)) : $signed(reg8));
              reg14 <= $signed((($unsigned($unsigned((8'h9d))) ?
                  (+reg5) : ($signed(wire3) ?
                      (reg13 ?
                          wire1 : reg11) : $signed(reg9))) | $unsigned(reg4)));
            end
          reg16 <= (wire2 ?
              ($unsigned($unsigned((&reg8))) && (+$signed($signed(reg4)))) : $unsigned(reg5));
        end
      reg17 <= (!((^($signed(reg7) >= (~^reg11))) >> ((~(reg7 ?
          reg7 : reg11)) << $signed(reg10[(3'h7):(1'h1)]))));
      if (reg4[(1'h0):(1'h0)])
        begin
          reg18 <= reg4;
          reg19 <= reg8[(4'he):(4'ha)];
        end
      else
        begin
          reg18 <= reg12;
          reg19 <= $unsigned((^($unsigned($signed(reg7)) ?
              ({reg6} ? (~&wire2) : reg7) : reg12)));
          reg20 <= ($signed(((|(reg4 != reg6)) ?
                  ((^(8'ha0)) ^ $signed(reg19)) : (~|reg6[(1'h0):(1'h0)]))) ?
              (reg10[(1'h0):(1'h0)] | ({(reg19 ? reg6 : (8'hb2)),
                  reg14[(2'h2):(1'h1)]} ^~ $unsigned((&reg6)))) : (&reg9));
          reg21 <= reg6[(1'h0):(1'h0)];
          reg22 <= $signed({(({wire0} == ((8'ha0) > reg5)) ^ (((8'ha1) + reg19) ?
                  (|reg4) : ((8'hb8) || (8'hb0)))),
              ($signed((reg7 - reg5)) ?
                  ($signed((8'h9d)) > ((8'hbc) ? (8'h9c) : (8'ha7))) : reg14)});
        end
    end
  assign wire23 = (~^$unsigned((wire1 ?
                      ($unsigned(reg5) ?
                          wire1 : $signed(reg16)) : ($unsigned(reg13) ?
                          $unsigned(wire2) : {reg11, reg5}))));
  assign wire24 = {(reg15[(3'h4):(1'h1)] == {((reg16 < reg5) & {(8'hb7)})})};
  assign wire25 = (reg17[(3'h6):(2'h3)] ?
                      (-reg16) : (((reg14 ? (reg9 ? reg6 : reg8) : (~^wire24)) ?
                          reg9 : $unsigned($unsigned(reg8))) >>> reg9[(4'hd):(4'hc)]));
  assign wire26 = $signed({(~^({reg18, (8'hb6)} ? $signed(reg22) : wire2)),
                      (((+reg7) - {wire0, wire25}) & wire24[(1'h0):(1'h0)])});
  assign wire27 = (&(($signed($signed((8'hb6))) ?
                          reg16 : $signed(reg20[(3'h7):(3'h7)])) ?
                      $signed(((wire3 & reg18) * $signed(wire3))) : reg16));
  always
    @(posedge clk) begin
      reg28 <= ((~reg19) ? reg13 : reg6[(2'h3):(1'h0)]);
      if ({$unsigned(($signed(reg8) <<< reg20[(4'hf):(4'hd)]))})
        begin
          reg29 <= $signed(reg8);
          if (reg19)
            begin
              reg30 <= reg29[(4'hd):(4'h9)];
              reg31 <= (8'hba);
              reg32 <= $signed(wire26[(4'hd):(4'h8)]);
              reg33 <= $signed($signed({(~|(+reg9))}));
              reg34 <= reg33;
            end
          else
            begin
              reg30 <= (($unsigned((~&(reg22 ~^ wire27))) ?
                  $signed($signed(reg15)) : reg4) > (^~$signed((reg7[(2'h2):(1'h1)] ?
                  (reg16 ? (8'ha4) : reg21) : $unsigned(reg11)))));
              reg31 <= (~&($unsigned((~^(7'h44))) ?
                  (~|$signed({reg11})) : ((7'h43) + ($unsigned(reg5) ?
                      {reg29} : (reg29 != wire27)))));
              reg32 <= wire0;
            end
          reg35 <= wire27[(3'h6):(1'h1)];
          if (($signed($unsigned((+(+reg8)))) ?
              (-(((-reg12) >>> (wire23 ?
                  wire23 : wire26)) <= wire3[(1'h0):(1'h0)])) : reg11))
            begin
              reg36 <= ($signed(reg5[(2'h2):(2'h2)]) ?
                  (($unsigned((reg4 ? (8'hbf) : reg10)) ?
                      (wire25 ?
                          (|reg4) : ((8'hbe) ?
                              wire26 : reg29)) : reg34[(2'h2):(1'h1)]) * (wire24[(2'h2):(1'h1)] < $signed($signed((8'hbe))))) : (^(8'hba)));
              reg37 <= $signed((($signed($signed(reg13)) ?
                      (reg22 ?
                          $signed(reg34) : reg7) : (|wire1[(2'h3):(2'h2)])) ?
                  $unsigned(($signed((8'ha2)) < (~reg20))) : ((~&$signed(wire2)) ?
                      (~^(reg16 ~^ reg5)) : $signed($signed(reg18)))));
            end
          else
            begin
              reg36 <= (reg37[(3'h6):(3'h4)] - reg11);
              reg37 <= (($signed((reg16 ?
                      (reg33 ? reg16 : reg15) : {reg14,
                          reg37})) ^~ $signed(reg7[(2'h2):(2'h2)])) ?
                  {(~(reg9 && reg33[(4'hb):(3'h4)])),
                      reg6} : $unsigned((reg14 <<< reg19[(2'h2):(1'h1)])));
              reg38 <= ($signed(reg9[(5'h11):(4'hb)]) <<< $unsigned((((~^reg9) < ((8'haa) ?
                  wire23 : wire25)) ^~ (~reg16[(1'h1):(1'h1)]))));
              reg39 <= $signed((!wire26));
            end
        end
      else
        begin
          reg29 <= $unsigned($signed(wire27));
          if ({$unsigned((({reg11, (8'h9e)} ?
                      (reg7 - reg18) : (reg38 >= reg34)) ?
                  (~|(reg8 >>> reg31)) : wire23[(2'h3):(1'h0)])),
              (($signed({(8'hab)}) <<< reg34) ?
                  $signed(((&reg34) ?
                      (reg12 ?
                          reg5 : reg14) : (reg14 - reg28))) : (~($unsigned(reg34) ?
                      reg36[(1'h1):(1'h0)] : wire2[(1'h0):(1'h0)])))})
            begin
              reg30 <= $signed($unsigned(wire24));
              reg31 <= $unsigned((-($signed($unsigned((8'h9e))) ?
                  $unsigned($signed(reg28)) : wire24[(2'h2):(1'h1)])));
              reg32 <= $signed($unsigned(reg35[(3'h6):(2'h2)]));
              reg33 <= reg14;
            end
          else
            begin
              reg30 <= (reg35 ?
                  $unsigned(((8'h9c) ?
                      ($unsigned(reg21) ?
                          (reg36 ? (8'h9f) : reg9) : ((8'hba) ?
                              reg30 : (8'hbd))) : $signed(((8'haa) >= wire0)))) : reg35);
              reg31 <= ((!$signed(reg32[(1'h0):(1'h0)])) >= {(($signed(reg9) ?
                      reg11[(2'h3):(2'h3)] : (reg38 || reg7)) >= reg20),
                  $signed($unsigned(reg11))});
              reg32 <= $unsigned(((+(&$signed(reg8))) < {$signed($unsigned(wire1)),
                  {(reg30 <<< reg9)}}));
              reg33 <= ($signed((reg13 ?
                      wire23 : (reg39[(4'h9):(3'h5)] ?
                          (reg9 ? (8'ha2) : reg18) : {reg33, reg10}))) ?
                  $unsigned({$unsigned($unsigned(reg12)),
                      (+$unsigned(wire23))}) : $signed(($unsigned(wire3) << ((reg4 ?
                      reg20 : reg7) ^~ $unsigned((7'h42))))));
              reg34 <= ($unsigned(reg7) ?
                  (wire26 ?
                      $unsigned($signed($signed(reg13))) : $unsigned(((-reg14) ?
                          reg22[(3'h5):(2'h3)] : $unsigned((8'hb2))))) : ((^~$signed(((8'hba) ^ reg13))) == reg37[(4'hb):(3'h5)]));
            end
          reg35 <= reg28;
          if ($signed(wire26))
            begin
              reg36 <= (~|(~reg33));
              reg37 <= (reg7 * (8'hbf));
              reg38 <= (reg33 ?
                  reg5[(2'h2):(1'h0)] : (^~$unsigned((!(~wire24)))));
              reg39 <= {reg33[(2'h2):(1'h0)],
                  (($unsigned(reg36) != ((reg10 ? reg18 : (8'h9e)) ?
                          (~reg6) : (wire23 ? reg34 : reg22))) ?
                      ((-(wire24 > reg12)) * reg17[(3'h5):(3'h4)]) : ({$signed((8'had)),
                              (reg21 <<< reg36)} ?
                          (wire3 ? wire0 : reg10) : reg16))};
            end
          else
            begin
              reg36 <= wire25[(3'h5):(2'h2)];
              reg37 <= wire24;
            end
        end
    end
  assign wire40 = reg10[(2'h3):(2'h2)];
  assign wire41 = ((8'hbc) || $signed(reg4));
  assign wire42 = $unsigned(reg38);
  assign wire43 = (reg37 << (8'ha1));
endmodule

module top
#(parameter param64 = (-((~|(((8'ha5) && (8'ha2)) <= (-(8'ha4)))) ? (!{{(8'hbe), (8'ha3)}}) : (({(7'h40), (8'ha6)} ? {(8'hbf)} : (&(8'hb2))) ? (^((7'h41) ? (8'hb8) : (8'hbf))) : {((8'ha4) | (8'hb5))}))), 
parameter param65 = ((param64 ? (param64 ? ({param64, (8'ha3)} ? param64 : (param64 != param64)) : (-(param64 ? param64 : param64))) : ((param64 ? {(7'h44), param64} : (^~param64)) ? ((8'had) ? (param64 >>> (8'hbb)) : param64) : ({(8'h9e)} ? ((8'hab) ? param64 : param64) : param64))) >> ((({(8'h9d), param64} ? (+param64) : (param64 ? param64 : param64)) ^ {(^~param64), (8'hb3)}) ? ((((8'hba) ? param64 : param64) ? (~param64) : (^~param64)) <= ((^~param64) ? param64 : (param64 >>> param64))) : (!(param64 * (param64 >>> (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire4,
                 reg61,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned({$signed((wire2 ? wire2 : wire3)),
                         $unsigned((^~wire1))}) ?
                     ($signed(($signed(wire1) ? wire3 : {wire3, (8'h9e)})) ?
                         wire1[(1'h0):(1'h0)] : (wire0 ~^ wire3)) : $unsigned(wire1));
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(wire4) != {(wire1[(4'he):(2'h2)] - ({wire3} ?
              (wire4 ? wire3 : wire1) : (^~wire3))),
          wire4[(4'ha):(2'h2)]});
    end
  assign wire6 = $signed(wire4);
  always
    @(posedge clk) begin
      reg7 <= (|$unsigned((($signed(reg5) ?
          (wire0 >> wire1) : (reg5 ? wire0 : wire4)) != {(wire2 | wire2),
          $signed(wire3)})));
      reg8 <= wire0[(2'h2):(1'h0)];
      reg9 <= $signed(($signed($signed(wire6[(1'h1):(1'h1)])) <= reg7));
      reg10 <= ({$unsigned((wire3 >> (wire0 ? reg5 : reg7)))} ?
          $unsigned(wire1) : wire4[(3'h6):(3'h6)]);
    end
  assign wire11 = wire4;
  assign wire12 = {((~&wire4) + $signed(reg5)),
                      ((wire11[(2'h2):(1'h1)] >= wire11) ?
                          ((reg7[(2'h3):(2'h3)] ?
                              {reg9} : (|wire2)) == (+{wire4,
                              (8'h9f)})) : $unsigned(reg5))};
  assign wire13 = $signed($unsigned({(~(|wire11))}));
  assign wire14 = ($signed((($signed(wire3) && (8'had)) ^ ($signed((8'had)) * ((8'hbb) + reg9)))) - (|(wire0 ?
                      reg10[(1'h1):(1'h0)] : {(8'hbe)})));
  always
    @(posedge clk) begin
      if ($signed(($signed($signed({wire14, wire14})) ? wire2 : reg9)))
        begin
          reg15 <= wire1;
        end
      else
        begin
          if (wire14[(5'h11):(4'h9)])
            begin
              reg15 <= {reg8};
              reg16 <= $signed(wire4[(1'h1):(1'h1)]);
              reg17 <= {($unsigned(reg10[(2'h2):(1'h1)]) ?
                      (~$unsigned($signed(wire4))) : ($unsigned($unsigned(wire2)) * (^$unsigned(reg7))))};
              reg18 <= (+wire11);
            end
          else
            begin
              reg15 <= (reg8 ?
                  {(^$unsigned({reg8, wire13})),
                      wire13[(3'h4):(3'h4)]} : (reg7 << (~$signed($signed((8'hac))))));
              reg16 <= $signed(({(!(wire11 >= reg10)),
                      (reg15[(4'he):(1'h1)] ?
                          (~wire1) : wire4[(3'h7):(3'h5)])} ?
                  ($unsigned((reg5 ^ reg17)) << ({wire11} ?
                      {reg10} : (wire1 ?
                          reg16 : (8'hae)))) : $unsigned($unsigned($unsigned(wire14)))));
              reg17 <= ($unsigned($unsigned($signed(((7'h41) == (8'hbf))))) ?
                  $signed(wire13) : $signed((8'ha7)));
            end
          reg19 <= $unsigned(wire1[(3'h7):(3'h6)]);
          if ($unsigned((reg5[(3'h6):(3'h5)] | (~&wire4[(3'h5):(1'h1)]))))
            begin
              reg20 <= (8'ha4);
              reg21 <= (^$unsigned(($unsigned((!reg16)) < wire6[(2'h2):(1'h0)])));
              reg22 <= wire12[(4'h8):(3'h6)];
            end
          else
            begin
              reg20 <= wire1;
            end
          if ((8'ha8))
            begin
              reg23 <= (|$signed(($unsigned($signed(wire2)) ?
                  (wire2[(2'h3):(1'h1)] > $signed(reg20)) : $unsigned((reg10 <<< reg19)))));
              reg24 <= ($unsigned($unsigned(((+reg23) ?
                  (reg22 ^ reg8) : ((8'ha8) ? reg18 : reg19)))) != reg9);
              reg25 <= $unsigned(reg20);
              reg26 <= (~&(|($unsigned(wire14[(3'h6):(1'h1)]) <= $unsigned($unsigned(reg16)))));
              reg27 <= (reg24[(3'h7):(3'h6)] < reg8);
            end
          else
            begin
              reg23 <= reg25;
              reg24 <= ((8'haa) >>> $unsigned({(~|wire3[(4'ha):(2'h3)])}));
              reg25 <= $unsigned((~^($signed(reg22) ?
                  $signed((|reg9)) : ((wire14 >= reg5) ?
                      reg15 : $unsigned(reg21)))));
            end
          if ($unsigned(reg21))
            begin
              reg28 <= ((wire12[(5'h12):(2'h2)] && (^~$unsigned((reg17 ?
                      (8'had) : wire11)))) ?
                  reg23[(3'h4):(2'h3)] : $signed(wire13));
              reg29 <= (reg16 ?
                  {wire4} : (reg22[(2'h3):(1'h0)] ?
                      {reg27,
                          $signed(wire3[(4'hc):(2'h2)])} : ($unsigned(reg19[(3'h6):(3'h4)]) >>> ((^reg16) ?
                          (reg18 ? reg15 : reg15) : $signed(wire1)))));
              reg30 <= reg19[(4'hf):(3'h7)];
            end
          else
            begin
              reg28 <= $unsigned((wire4[(3'h6):(1'h1)] ?
                  $signed((|{wire14, reg27})) : $signed(wire6)));
            end
        end
      if (reg8[(2'h3):(1'h0)])
        begin
          if ((8'hb6))
            begin
              reg31 <= (-$unsigned($signed(($signed(reg26) ?
                  $unsigned(wire12) : {(8'ha7), wire13}))));
              reg32 <= reg31[(2'h2):(2'h2)];
              reg33 <= (reg16 ?
                  (-(wire2 ^ $unsigned((wire14 != reg18)))) : (reg5 && (^~{reg10,
                      {reg32, reg20}})));
              reg34 <= ($unsigned(reg29[(2'h2):(1'h0)]) ^ wire1);
              reg35 <= (^reg16);
            end
          else
            begin
              reg31 <= $signed((~$unsigned(($signed(wire11) || $signed(reg35)))));
              reg32 <= (($signed($unsigned($unsigned(reg9))) < ($unsigned($signed(reg31)) ^ $unsigned({reg22}))) && reg24);
            end
          if (($unsigned($unsigned(((wire0 < reg29) && reg15))) < (8'haa)))
            begin
              reg36 <= (((reg33[(5'h10):(1'h0)] ?
                          reg19 : $signed((reg25 <<< wire2))) ?
                      $unsigned($unsigned(wire4)) : ($signed($unsigned(reg16)) ?
                          reg27[(2'h2):(1'h0)] : ($signed((8'hb7)) ?
                              (+(8'hb4)) : (~^reg8)))) ?
                  (({$unsigned(reg35)} ?
                      ((reg21 << (8'hbc)) ?
                          $unsigned(wire6) : reg22[(5'h10):(3'h5)]) : (wire13 ?
                          $unsigned(wire3) : $signed((8'h9e)))) & ($signed($signed(wire1)) ?
                      wire14[(4'hc):(3'h4)] : $signed($unsigned(reg19)))) : wire12);
              reg37 <= ((wire13 ? (^~reg27) : (~^reg7[(2'h3):(1'h0)])) ?
                  $signed((reg18 == $unsigned((^wire1)))) : ((+($unsigned(wire3) ?
                          (reg33 - wire0) : (reg5 ? wire1 : reg33))) ?
                      (((&reg32) ? (reg28 > wire14) : (^~reg23)) ?
                          {(|reg28),
                              (wire2 < reg27)} : (&(8'haf))) : {reg34[(4'hf):(1'h0)]}));
              reg38 <= $unsigned($unsigned({($signed(reg26) ?
                      ((8'hb1) == (8'hb4)) : {reg27}),
                  $unsigned(reg34[(4'ha):(3'h6)])}));
              reg39 <= $signed({$signed(($unsigned(reg36) ?
                      {wire11, (8'hb8)} : wire13))});
              reg40 <= (wire2 ?
                  ((wire2 ?
                      $unsigned($unsigned(reg26)) : reg7) >>> {((wire6 >= wire12) * (^(8'ha9))),
                      (8'hb1)}) : {reg33[(2'h2):(1'h1)]});
            end
          else
            begin
              reg36 <= $signed({(reg21[(3'h4):(2'h3)] ?
                      (^(reg16 ? wire6 : reg27)) : ({(8'ha7), wire4} ?
                          {reg27, (8'hbe)} : (~|reg32)))});
              reg37 <= (^~reg34[(3'h6):(3'h6)]);
            end
          reg41 <= $signed((^~(-wire12[(3'h7):(3'h4)])));
          if ((+reg8[(4'h9):(3'h6)]))
            begin
              reg42 <= wire4;
              reg43 <= $unsigned((wire12[(3'h7):(1'h0)] ?
                  $signed(reg10[(1'h1):(1'h0)]) : ((~&reg21[(4'h8):(3'h6)]) ?
                      (reg22[(5'h10):(1'h1)] ?
                          {reg7,
                              reg33} : (-(8'ha1))) : ((reg26 >>> (8'ha7)) & $signed(reg19)))));
              reg44 <= ((~&$unsigned($unsigned($signed(reg36)))) * (^$unsigned((reg30 < reg35))));
              reg45 <= reg44;
            end
          else
            begin
              reg42 <= $signed(reg18[(2'h3):(1'h0)]);
              reg43 <= $unsigned((8'h9e));
              reg44 <= (^reg45);
              reg45 <= ($signed((+(reg44 ?
                      (reg42 ? reg37 : reg25) : $unsigned(wire12)))) ?
                  reg42[(4'he):(4'h8)] : (reg25 ^ (8'ha7)));
              reg46 <= (^reg17[(1'h1):(1'h1)]);
            end
          if ($signed((reg5[(4'hc):(4'hc)] ?
              {((reg32 > (8'haa)) ?
                      {reg16} : {wire4})} : (wire1 ~^ ((&(8'hb0)) ?
                  reg36[(4'ha):(2'h2)] : ((8'hac) && reg31))))))
            begin
              reg47 <= reg18[(3'h5):(1'h0)];
              reg48 <= (^reg27[(2'h2):(1'h0)]);
              reg49 <= $signed(reg41);
              reg50 <= (~(8'hbb));
            end
          else
            begin
              reg47 <= (-(wire1[(3'h7):(3'h7)] ^ (reg22[(2'h2):(1'h1)] ?
                  ((reg22 <= (8'hb3)) ?
                      reg40[(3'h5):(1'h1)] : reg31) : ((reg25 ?
                      reg20 : wire3) * {reg48, reg20}))));
              reg48 <= {(+(((^reg23) >> (+reg27)) ?
                      $signed((reg33 <<< reg30)) : reg20[(5'h10):(4'ha)]))};
              reg49 <= $unsigned($signed({(&reg35)}));
              reg50 <= ($unsigned($signed((+$signed(reg10)))) ?
                  {($signed(wire2) ? reg19 : $unsigned(reg38[(5'h15):(1'h1)])),
                      $signed($signed($signed(reg5)))} : $unsigned(($signed(reg38[(3'h6):(2'h3)]) && $unsigned(reg18[(2'h3):(1'h0)]))));
            end
        end
      else
        begin
          reg31 <= reg18;
        end
      reg51 <= reg48;
      reg52 <= {(($signed({reg22, wire0}) ?
                  ((reg50 ? (8'hb8) : reg30) ?
                      $signed(reg35) : {reg24}) : ($unsigned(reg30) ?
                      $signed((8'ha4)) : $signed(reg17))) ?
              $signed(reg34[(5'h11):(2'h3)]) : reg15[(4'he):(2'h2)])};
      reg53 <= reg50;
    end
  always
    @(posedge clk) begin
      reg54 <= (({(~^reg33),
          $unsigned(((8'hb9) ?
              reg38 : (7'h43)))} < reg28) + ($unsigned({((8'ha9) ?
                  (7'h44) : reg33)}) ?
          reg35 : $signed((8'hb2))));
      reg55 <= $unsigned((((&{(7'h43)}) != $unsigned(reg51[(4'h9):(1'h0)])) <<< reg23[(2'h2):(1'h1)]));
      reg56 <= (&$unsigned(reg47));
      if (reg47)
        begin
          reg57 <= reg19;
          reg58 <= (($signed((8'hb6)) ?
                  (-{(wire1 ? reg44 : wire14)}) : $signed({reg50})) ?
              $signed((($unsigned(reg8) | $signed((8'hb1))) && {$unsigned((7'h44)),
                  (|reg29)})) : {wire6});
          reg59 <= ($unsigned(reg47) ^~ {(~^(-(reg30 ? reg18 : reg33)))});
          reg60 <= ((reg34[(4'ha):(3'h4)] & $signed((8'hae))) & (^(-(reg25 || $unsigned((8'ha3))))));
        end
      else
        begin
          reg57 <= $signed((reg18 ? $signed((+reg56)) : wire4[(3'h4):(2'h2)]));
          reg58 <= wire4[(3'h6):(3'h4)];
          reg59 <= (-(~&((8'hb5) ?
              ((^~(8'ha3)) == ((8'haa) <= reg41)) : (8'h9e))));
        end
      reg61 <= ($unsigned(reg23[(2'h2):(1'h1)]) ?
          (~($unsigned((^(8'hb5))) ?
              reg40 : $unsigned((wire4 & reg32)))) : reg8);
    end
  assign wire62 = $signed(((({reg54} || ((8'haf) >>> reg32)) ?
                      {$signed(reg24),
                          $signed(reg57)} : reg51[(3'h7):(3'h6)]) >> $unsigned(((reg29 ?
                          wire1 : reg38) ?
                      {reg7} : $signed(reg58)))));
  assign wire63 = $unsigned(reg38[(5'h10):(2'h2)]);
endmodule

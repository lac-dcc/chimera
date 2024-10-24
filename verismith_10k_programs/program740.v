module top
#(parameter param121 = (^((((8'haa) - ((8'hac) ? (8'ha2) : (8'h9d))) != ((7'h43) > ((8'haf) & (8'h9e)))) != {((~(8'h9d)) ? (8'had) : {(8'ha9), (7'h40)}), {{(8'hab), (8'haf)}}})), 
parameter param122 = ((param121 != param121) <<< param121))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire120;
  wire signed [(2'h3):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire111;
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire113,
                 wire111,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  module5 #() modinst112 (wire111, clk, wire1, wire0, wire4, wire2);
  assign wire113 = ((8'ha5) ?
                       (wire0[(3'h4):(2'h2)] < ($unsigned((wire2 ?
                               wire4 : wire0)) ?
                           {((8'ha6) ? wire1 : wire3)} : (wire2[(4'hb):(3'h6)] ?
                               (wire4 ?
                                   wire2 : wire1) : (^wire2)))) : $signed(wire3[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg114 <= wire111;
      reg115 <= wire2[(5'h12):(3'h4)];
      reg116 <= ((wire2[(2'h3):(1'h1)] < (~^$unsigned($signed(wire0)))) ?
          ((~^({reg114,
              wire1} >> $signed(wire3))) <<< $unsigned(($unsigned(wire3) ?
              wire1 : wire2[(1'h0):(1'h0)]))) : wire0[(3'h6):(3'h4)]);
      reg117 <= (&wire111);
    end
  assign wire118 = ((8'hb2) ?
                       (reg114[(1'h1):(1'h0)] == $unsigned($signed((wire1 >>> reg117)))) : ((wire113 ?
                           $unsigned((8'hb2)) : wire2) * ((~^(wire111 ?
                               reg115 : wire1)) ?
                           ($unsigned(wire0) ?
                               $unsigned(wire111) : $signed(reg115)) : $signed((~&reg114)))));
  assign wire119 = ($unsigned((~^(8'hba))) ?
                       ((~|(|(reg115 - wire111))) ?
                           (reg114[(4'hf):(1'h1)] ?
                               ({(8'hb6)} ^ wire1) : {(wire4 ?
                                       wire0 : wire1)}) : (wire118[(2'h3):(1'h0)] ?
                               ($unsigned(wire113) ?
                                   $unsigned(wire111) : wire2[(3'h5):(3'h5)]) : $unsigned((wire113 ?
                                   reg115 : wire111)))) : ((^wire0[(4'hf):(4'h8)]) ?
                           $signed($unsigned((wire1 != wire3))) : (-wire4[(1'h0):(1'h0)])));
  assign wire120 = reg116[(2'h2):(1'h1)];
endmodule

module module5
#(parameter param110 = {(((((8'h9e) << (7'h44)) ^~ {(7'h44), (8'h9c)}) << ((~&(8'hbe)) << (8'h9d))) + (!{((8'h9f) & (8'had)), {(8'haf), (8'ha4)}})), ((^{(|(8'hb3))}) ? {(((8'hb1) >= (8'hbe)) ? ((8'ha5) * (7'h43)) : (|(8'hb3))), (((8'h9f) <<< (8'ha1)) + ((8'ha9) && (8'had)))} : (({(8'ha1), (8'hb9)} ? (!(8'hbb)) : ((8'hae) ? (8'h9f) : (8'hb8))) ? ({(7'h43), (8'ha5)} <= ((8'ha2) ? (8'haa) : (7'h43))) : (|((8'hbc) || (8'haf)))))})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h2a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire11;
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire106,
                 wire61,
                 wire24,
                 wire11,
                 reg63,
                 reg62,
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
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= wire6;
    end
  assign wire11 = {wire7[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg12 <= wire7[(2'h2):(1'h1)];
      reg13 <= ($unsigned(wire9[(4'ha):(4'h9)]) ?
          (wire6 > $signed(wire7)) : ((~^$signed($signed(wire11))) ?
              $unsigned($signed((-wire11))) : $unsigned((~^((8'hbd) + wire7)))));
      reg14 <= ($unsigned($signed(reg13)) + $unsigned((((+wire7) ^ $signed(reg13)) + wire7)));
      if (reg14)
        begin
          reg15 <= reg13;
        end
      else
        begin
          reg15 <= ((($unsigned((wire7 > reg14)) ?
              {(^(8'hb4))} : $signed(reg14)) < (($signed(wire6) ?
                  $unsigned(reg15) : wire6) ?
              wire9 : (&(7'h43)))) ~^ {(^~$signed((wire11 ?
                  (8'hb3) : (8'hb9))))});
          reg16 <= {reg15,
              (((~|{reg15}) ? $signed((|(8'hb6))) : reg10[(2'h2):(1'h0)]) ?
                  {wire7[(1'h0):(1'h0)], wire8} : wire8)};
          if ($signed((wire11 + (((reg13 == reg15) >= wire6) ?
              {{wire8}} : wire9))))
            begin
              reg17 <= {$signed((8'haa))};
              reg18 <= reg10;
              reg19 <= $unsigned({reg13[(4'he):(4'h8)],
                  $signed($signed((~reg17)))});
              reg20 <= reg13;
              reg21 <= (~|$signed($unsigned($signed((+reg18)))));
            end
          else
            begin
              reg17 <= $unsigned(wire6[(2'h2):(1'h1)]);
              reg18 <= reg12[(5'h10):(3'h6)];
            end
          reg22 <= ({(~&reg20[(2'h2):(1'h1)]),
              reg17} < $signed($signed(($unsigned(reg13) == $signed(wire6)))));
          reg23 <= ($unsigned(reg20) ? reg14 : reg17[(3'h7):(2'h2)]);
        end
    end
  assign wire24 = (8'haf);
  always
    @(posedge clk) begin
      reg25 <= {{(wire6[(2'h2):(1'h0)] == {(reg22 != wire8)}),
              {(8'haf), (^~((8'hab) ? wire8 : (8'h9f)))}}};
      if (wire7[(1'h1):(1'h1)])
        begin
          reg26 <= {reg23[(1'h0):(1'h0)],
              $unsigned((reg22 ? $signed(reg15) : $signed($unsigned(reg12))))};
          reg27 <= $unsigned($unsigned($signed(wire9)));
          reg28 <= $signed(reg10);
        end
      else
        begin
          if ($unsigned(reg25))
            begin
              reg26 <= (+reg22[(1'h0):(1'h0)]);
            end
          else
            begin
              reg26 <= {wire24};
              reg27 <= $signed($unsigned((!((~|wire9) ?
                  ((8'ha2) ? reg25 : wire8) : (|reg23)))));
              reg28 <= $unsigned({$signed(reg28[(3'h4):(2'h2)])});
            end
          reg29 <= {$unsigned((|(reg21 << $signed(reg27))))};
          reg30 <= {((reg26[(4'hb):(2'h3)] ?
                  (~&$unsigned(reg20)) : $unsigned(reg13[(4'ha):(4'h9)])) & $signed(($signed((7'h44)) ^~ (|reg10)))),
              ((^reg15) && ($unsigned($unsigned(reg28)) + (|$signed(reg15))))};
          if ($signed((8'ha2)))
            begin
              reg31 <= (($unsigned((^~(^reg29))) | wire9[(4'ha):(2'h3)]) <= ((~&((7'h44) ?
                      (-reg29) : $signed(reg14))) ?
                  reg25[(3'h7):(1'h0)] : (reg28 ?
                      ({reg23, reg23} < reg17) : ((wire8 ? wire7 : wire6) ?
                          reg25 : ((8'ha4) * reg15)))));
              reg32 <= (((8'ha1) ^~ {$unsigned((wire24 ? reg27 : (8'h9e))),
                      (reg22 + (8'hbd))}) ?
                  reg21 : (~^reg27));
              reg33 <= wire6;
            end
          else
            begin
              reg31 <= $unsigned((~^$unsigned((reg14[(4'hf):(4'he)] | (reg12 >> reg14)))));
            end
          reg34 <= reg22[(1'h1):(1'h0)];
        end
      if (reg25)
        begin
          if ({reg23[(3'h4):(2'h3)]})
            begin
              reg35 <= reg31;
            end
          else
            begin
              reg35 <= ($signed((|$unsigned(wire6))) && $unsigned(reg18));
              reg36 <= ({reg28[(4'hb):(3'h5)],
                  $unsigned({$unsigned(reg31),
                      (wire7 ?
                          reg23 : (8'hb1))})} < {$signed($signed($signed(reg14))),
                  wire24});
              reg37 <= $unsigned($unsigned($unsigned((^~$signed(reg17)))));
            end
          reg38 <= $signed((~|reg25));
          reg39 <= reg28[(3'h5):(1'h1)];
          reg40 <= $unsigned(reg29);
        end
      else
        begin
          reg35 <= (reg39[(3'h4):(1'h0)] ?
              (~&$unsigned(reg39[(4'hc):(1'h1)])) : (wire11 ?
                  $unsigned((+(reg22 ?
                      wire7 : reg39))) : $unsigned(reg35[(4'hc):(4'h8)])));
          if (reg25)
            begin
              reg36 <= (((7'h42) ?
                      ((((8'hb6) ?
                          (8'hb3) : reg13) ^~ reg16) ~^ $unsigned((reg32 ?
                          reg19 : reg10))) : (~^reg25)) ?
                  ((($signed(reg13) ? $unsigned(reg10) : (reg13 || reg30)) ?
                      ($unsigned(reg19) ?
                          $unsigned(reg35) : reg19[(4'ha):(3'h5)]) : (^(~&reg16))) <<< (-((reg40 ?
                          reg10 : reg12) ?
                      $unsigned((8'hb1)) : (wire11 ?
                          reg18 : (8'hb3))))) : (-$unsigned(((reg14 == wire24) ?
                      (reg23 > reg25) : (|reg12)))));
              reg37 <= (reg33[(1'h0):(1'h0)] != (8'ha9));
              reg38 <= reg19[(4'hc):(3'h4)];
              reg39 <= (7'h42);
            end
          else
            begin
              reg36 <= (|($unsigned(reg17[(3'h4):(1'h1)]) ?
                  reg31 : (({(8'ha6), reg10} ?
                      (wire11 >= reg19) : $signed(reg22)) ~^ $signed(((8'ha4) ?
                      reg38 : reg21)))));
              reg37 <= (8'hb5);
              reg38 <= ($signed($signed((-$unsigned(wire6)))) >= ({((~reg21) ?
                          wire6[(1'h0):(1'h0)] : (reg34 || reg21)),
                      $signed({wire9, reg14})} ?
                  $signed($unsigned($unsigned(reg27))) : (^reg31)));
            end
          reg40 <= wire11;
          if ($unsigned(($signed((reg15 || {reg38})) + $signed(((reg18 || reg21) ?
              reg20[(1'h1):(1'h0)] : wire8[(3'h4):(2'h2)])))))
            begin
              reg41 <= reg21[(2'h2):(1'h0)];
              reg42 <= reg30;
            end
          else
            begin
              reg41 <= $unsigned((|$signed(((reg22 > wire11) || (reg38 ?
                  reg14 : reg36)))));
              reg42 <= {{{$signed(reg32[(2'h2):(1'h1)]), $unsigned(reg33)}}};
            end
        end
      reg43 <= reg30;
    end
  always
    @(posedge clk) begin
      if ({reg33[(2'h2):(2'h2)],
          ($signed(reg39) ? reg30 : (~|wire7[(1'h0):(1'h0)]))})
        begin
          reg44 <= $signed((reg19 + (8'hbc)));
          reg45 <= $signed(wire8[(2'h3):(1'h0)]);
          reg46 <= reg33;
          if ((((((^~reg16) ?
                  {reg13, (8'had)} : reg35[(4'h8):(1'h0)]) < ({reg14} ?
                  (wire6 ? reg39 : reg33) : (-reg30))) >>> (&($unsigned(reg45) ?
                  (^reg22) : reg25[(5'h10):(4'h8)]))) ?
              (~&(8'ha7)) : ($unsigned(($unsigned(reg42) >>> reg39[(4'h9):(4'h9)])) == (((!reg23) ~^ $unsigned(reg23)) ?
                  (~|(wire24 + (8'had))) : reg28))))
            begin
              reg47 <= $signed(reg13[(3'h5):(2'h2)]);
            end
          else
            begin
              reg47 <= $signed({reg12[(4'hd):(4'h8)], reg40[(1'h1):(1'h1)]});
              reg48 <= (~^(((!wire7[(2'h2):(1'h0)]) && $unsigned($unsigned(reg27))) ?
                  ((7'h41) ?
                      reg44[(3'h5):(2'h3)] : {((8'haa) & reg16)}) : reg22));
            end
          reg49 <= (({{$signed((8'ha1)), (!reg47)}, $signed(wire11)} ?
              {$signed((reg48 ? reg20 : reg25))} : (reg12 ?
                  (!reg12[(2'h3):(1'h0)]) : $signed($unsigned(reg27)))) ^ reg48[(3'h4):(1'h1)]);
        end
      else
        begin
          reg44 <= ((((~^(~^(8'hbc))) >> ({(8'h9f), reg39} || $signed(reg41))) ?
              $signed(reg12[(5'h11):(2'h3)]) : $signed(({reg23, reg10} ?
                  (reg19 <<< (8'hbe)) : wire7))) ^~ $signed(reg17[(3'h6):(1'h0)]));
          reg45 <= (((~|{(wire11 ? reg32 : reg44),
              (|reg49)}) > reg35[(2'h3):(1'h1)]) == ($unsigned(reg44) ?
              (-$signed((~^reg20))) : $signed($unsigned($signed(reg46)))));
          reg46 <= reg39;
        end
      reg50 <= $unsigned((reg22 == $unsigned(((reg36 & wire8) ?
          (reg39 ? reg26 : reg14) : (8'hb0)))));
      reg51 <= ((~$unsigned({(reg37 ?
              (8'ha2) : wire6)})) * (((reg44[(4'hc):(3'h6)] ?
                  (reg31 ? reg18 : reg33) : $unsigned((8'ha4))) ?
              $signed((-reg30)) : $unsigned(reg10[(1'h1):(1'h0)])) ?
          (((reg21 || reg26) + reg10[(2'h3):(2'h3)]) ?
              reg36 : (^(!reg49))) : wire24[(3'h6):(3'h4)]));
      if ({reg36[(2'h3):(2'h2)],
          ($signed((reg49 ? reg49 : reg32[(3'h6):(2'h3)])) ?
              {(~^$signed(reg50))} : (($signed(reg48) > (8'h9f)) - ($unsigned(reg27) & $unsigned(wire8))))})
        begin
          reg52 <= reg35[(2'h2):(2'h2)];
          reg53 <= (~&reg37);
          reg54 <= ($signed(((reg44[(4'hd):(2'h3)] ?
                  (reg19 >> reg14) : (reg23 == reg23)) < reg40[(3'h5):(1'h0)])) ?
              $unsigned((reg31 || $signed((reg27 ?
                  reg12 : reg14)))) : (+$unsigned(wire8[(3'h5):(2'h2)])));
          reg55 <= $signed((reg28[(4'ha):(4'h9)] >= $signed($unsigned($unsigned(reg15)))));
        end
      else
        begin
          if (reg48)
            begin
              reg52 <= reg29[(1'h0):(1'h0)];
              reg53 <= $signed(reg14);
              reg54 <= {reg44[(3'h5):(2'h3)]};
            end
          else
            begin
              reg52 <= (reg34 + {({reg45[(2'h2):(1'h0)]} ?
                      ((!reg47) || reg10[(4'h9):(4'h9)]) : (!reg51)),
                  $signed((-wire6))});
              reg53 <= {((reg30 >> reg46[(3'h7):(3'h7)]) ?
                      (&(reg23 ?
                          ((8'ha2) ^ reg15) : (~^reg35))) : (~&($signed(reg25) ?
                          (reg47 ^~ (8'hb4)) : ((8'h9d) + reg33))))};
            end
          if (wire7)
            begin
              reg55 <= reg13[(3'h7):(2'h2)];
            end
          else
            begin
              reg55 <= $signed(reg27[(3'h6):(3'h6)]);
              reg56 <= ((8'ha7) & reg14[(3'h6):(3'h5)]);
              reg57 <= ((!$signed((!$unsigned(reg13)))) ?
                  (!$signed({$unsigned(reg41),
                      (wire24 ? wire11 : (8'hb8))})) : reg12[(4'ha):(3'h6)]);
              reg58 <= $unsigned((!wire9));
              reg59 <= (!(+((~^reg16[(3'h5):(1'h0)]) <<< (-wire8[(3'h7):(3'h4)]))));
            end
        end
      reg60 <= $signed(reg49);
    end
  assign wire61 = (((((reg55 ? (8'hb6) : reg54) ?
                          {reg41, reg58} : (reg23 | (8'hbb))) ?
                      $unsigned((reg39 | reg36)) : (reg56 >> $signed(reg39))) > $unsigned(reg52)) < $signed((reg22[(1'h0):(1'h0)] ?
                      $unsigned((reg53 ?
                          reg56 : reg60)) : {$unsigned(reg36)})));
  always
    @(posedge clk) begin
      reg62 <= (~$signed($signed((+reg14))));
      reg63 <= {(&$signed(({reg16, (8'haa)} != ((8'had) ? reg45 : wire9))))};
    end
  module64 #() modinst107 (wire106, clk, reg21, reg57, reg41, reg14);
  assign wire108 = reg33;
  assign wire109 = $signed({reg42[(2'h3):(2'h3)]});
endmodule

module module64
#(parameter param105 = (8'ha3))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(2'h3):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire69;
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire82,
                 wire74,
                 wire73,
                 wire72,
                 wire69,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = (~$signed(({wire67[(4'hf):(2'h2)]} ?
                      $unsigned(wire65) : wire65[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg70 <= ($signed(($unsigned($unsigned(wire65)) & wire67[(1'h0):(1'h0)])) ?
          ((((~|wire65) ? $signed(wire67) : (wire69 >>> (8'hb9))) ?
                  (&wire67) : (!$signed(wire67))) ?
              wire67[(4'hb):(2'h3)] : wire68[(2'h2):(2'h2)]) : {(&$signed({wire65,
                  (7'h44)}))});
      reg71 <= (~^(~|reg70));
    end
  assign wire72 = (($signed($unsigned(wire65)) << {((~^wire66) ?
                          $signed(reg71) : $signed(reg70)),
                      wire69}) ^ (~&wire66[(4'ha):(2'h3)]));
  assign wire73 = (!wire65);
  assign wire74 = ((&(8'hb7)) ?
                      ((8'h9e) ?
                          (&{(!wire67)}) : (~|{(~^wire68),
                              wire66[(2'h3):(2'h2)]})) : (~wire67));
  always
    @(posedge clk) begin
      reg75 <= wire73;
      reg76 <= (~{$signed(wire69),
          ($unsigned($unsigned((8'hb8))) ? wire72 : {(wire65 != (8'hb4))})});
    end
  always
    @(posedge clk) begin
      reg77 <= (~(+$signed((~|$signed(reg76)))));
      reg78 <= (~|wire74);
      reg79 <= wire69[(2'h3):(2'h3)];
      reg80 <= $signed(wire68);
      reg81 <= reg75;
    end
  assign wire82 = ((^~(&($unsigned(reg79) ?
                      $signed(reg78) : $signed((8'hab))))) + ((wire67 ?
                      $signed((wire66 ? (8'ha0) : wire73)) : ($signed(reg76) ?
                          (-wire69) : wire68)) <<< wire67));
  always
    @(posedge clk) begin
      reg83 <= (~|reg78);
      if (wire68[(1'h0):(1'h0)])
        begin
          reg84 <= (((-$unsigned($unsigned(wire73))) ?
              $unsigned($signed((wire74 && wire65))) : wire68[(1'h1):(1'h1)]) & wire74);
          reg85 <= reg77;
        end
      else
        begin
          reg84 <= $signed(wire68);
        end
      if ({wire68[(1'h1):(1'h0)]})
        begin
          reg86 <= (&((~|{{wire66}}) <= $unsigned($unsigned($signed((8'h9f))))));
        end
      else
        begin
          reg86 <= (-$signed({$unsigned($unsigned(reg71)),
              ((|reg75) ~^ ((8'hb5) ? (8'hbf) : (8'hb8)))}));
          reg87 <= (+($signed(($signed(wire82) ?
              ((8'hb9) ?
                  reg70 : wire69) : (wire72 * reg71))) >= $unsigned(wire69)));
        end
      if ({wire82[(4'hb):(4'h9)]})
        begin
          reg88 <= (~^({(-(reg79 ? reg78 : wire69))} - wire82[(4'hd):(3'h5)]));
          reg89 <= reg88;
        end
      else
        begin
          if (reg88[(4'h8):(3'h5)])
            begin
              reg88 <= $signed((&wire73[(3'h5):(3'h5)]));
              reg89 <= (+((-$unsigned({(8'hb0), (8'hba)})) ?
                  $signed($unsigned(wire74[(1'h1):(1'h1)])) : (reg88[(3'h6):(1'h1)] ?
                      $unsigned((reg77 == (8'ha0))) : (8'haa))));
              reg90 <= {$signed(reg85[(5'h15):(3'h7)])};
              reg91 <= $signed(reg84[(2'h3):(1'h1)]);
            end
          else
            begin
              reg88 <= $signed($signed((($signed(reg87) & $signed(wire73)) | ((wire65 != reg83) >>> $unsigned((8'ha1))))));
            end
          if ((reg88 ?
              $signed($signed(($unsigned(reg78) ?
                  wire68[(1'h0):(1'h0)] : (wire69 != reg90)))) : $unsigned((-reg83[(4'hb):(3'h4)]))))
            begin
              reg92 <= (~(~&$signed($signed(wire68[(1'h0):(1'h0)]))));
              reg93 <= $signed(((((8'haf) ~^ $unsigned(reg90)) ?
                  $unsigned((reg75 * (8'ha8))) : (reg70[(3'h5):(1'h1)] ~^ (7'h42))) <<< reg76));
              reg94 <= {($unsigned((((8'hb7) ? (8'hb0) : wire65) ?
                      reg81 : (wire69 ^~ reg79))) && $unsigned((~^(reg70 ?
                      reg91 : reg93)))),
                  $signed((^~reg81[(4'h8):(3'h7)]))};
            end
          else
            begin
              reg92 <= $signed((^~(|reg89)));
              reg93 <= wire68;
            end
          if ($unsigned((reg81[(4'h8):(2'h3)] ? reg76 : reg93)))
            begin
              reg95 <= wire69;
              reg96 <= {{{(~{reg87, reg71}), ({(8'hbb)} <<< (^reg90))},
                      ($unsigned(wire68) << reg70[(3'h5):(2'h3)])},
                  ($signed(reg90[(4'h9):(4'h8)]) ?
                      (reg76 ?
                          wire82[(3'h4):(1'h0)] : (&(reg84 - (8'hbf)))) : $unsigned(($signed(reg89) ?
                          (wire73 ? reg95 : (8'hb8)) : $signed(reg91))))};
            end
          else
            begin
              reg95 <= $unsigned((($signed($signed(wire69)) ? reg84 : reg86) ?
                  {reg70[(4'ha):(3'h4)],
                      {(reg89 ?
                              reg84 : reg86)}} : ((8'h9f) >>> ($unsigned(wire73) ?
                      (!reg85) : reg88))));
              reg96 <= wire67;
              reg97 <= (!(|(+$signed((reg78 ? (8'hb0) : reg87)))));
            end
        end
    end
  assign wire98 = (~&(|$signed((reg83 ^ (~&reg88)))));
  assign wire99 = (~&reg77);
  assign wire100 = (reg96[(1'h1):(1'h1)] ?
                       $signed($signed(({(8'hab), reg76} ?
                           $signed((8'hae)) : (-reg96)))) : ((~($signed((8'h9f)) ?
                           (reg81 + reg97) : (!wire66))) & ((8'hb6) ?
                           (|(wire66 <= wire74)) : $unsigned(reg70[(4'h8):(3'h4)]))));
  assign wire101 = reg86;
  assign wire102 = ((reg76 < ($unsigned(reg71[(4'h8):(3'h5)]) == $unsigned((~&reg78)))) ?
                       $unsigned({reg85}) : {(+$unsigned((reg77 <<< wire82))),
                           (reg89 ?
                               reg83[(4'h8):(4'h8)] : reg79[(4'ha):(3'h7)])});
  assign wire103 = $signed((~(wire68[(2'h2):(2'h2)] ?
                       (~^$signed((8'hb3))) : ($signed(reg90) ?
                           $unsigned(reg84) : $unsigned(reg87)))));
  assign wire104 = (~|$signed($unsigned(($unsigned(reg85) && $signed(wire65)))));
endmodule

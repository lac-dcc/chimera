module top
#(parameter param42 = {{(~^(((8'hbd) ~^ (8'hbb)) ? ((8'hbc) <= (7'h43)) : (&(8'hbd)))), (^({(8'h9c)} || ((8'ha8) - (7'h41))))}, (({((8'had) ? (8'ha2) : (8'hbd))} <= ((~(8'h9e)) * ((8'hbb) - (8'hb6)))) ? ({(-(8'h9f)), (7'h41)} ? (((7'h43) ? (8'ha6) : (8'haf)) ? ((8'hb0) ? (8'h9c) : (8'haf)) : {(8'h9d), (8'ha8)}) : (|(!(7'h44)))) : {{(7'h44)}})}, 
parameter param43 = (param42 & ((^(~&(!param42))) ~^ (param42 ? (~^(param42 ? param42 : param42)) : ((param42 ? param42 : (8'hbb)) ~^ {param42, param42})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire28,
                 wire7,
                 wire6,
                 wire5,
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
                 reg30,
                 reg29,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $signed($unsigned($signed(($unsigned(wire2) ^ {wire1,
                     wire0}))));
  assign wire5 = {(~^((wire3[(2'h3):(2'h3)] ?
                             ((8'hab) - wire2) : $unsigned(wire4)) ?
                         $signed((|wire3)) : {(wire3 ? wire2 : wire0),
                             ((8'hb6) ~^ wire0)})),
                     (wire2 && $signed($unsigned(((8'hb6) ?
                         wire4 : (7'h43)))))};
  assign wire6 = ($unsigned((+wire0)) <= (((|$unsigned(wire3)) ?
                         (wire5 < (-wire2)) : (~|wire5[(3'h4):(1'h0)])) ?
                     $signed($unsigned(wire1[(3'h5):(2'h2)])) : wire3[(3'h7):(2'h3)]));
  assign wire7 = ((~$signed({(wire2 - wire1), wire0})) ?
                     (((+(~wire1)) ?
                         (wire0[(2'h3):(1'h1)] ?
                             wire3 : wire3) : ($signed((7'h44)) ?
                             $signed(wire3) : (wire1 && wire1))) & ((~&((8'ha4) ^ wire2)) ?
                         ((-wire1) ?
                             wire4[(3'h5):(2'h3)] : (8'hb5)) : (~^(~&(8'h9e))))) : (((8'ha9) ?
                         wire5[(3'h6):(2'h3)] : $signed((wire6 < wire6))) >> (((wire4 ?
                             wire6 : (8'ha3)) ?
                         (wire2 && wire5) : (wire2 ?
                             wire2 : wire5)) | $signed($unsigned((8'h9d))))));
  always
    @(posedge clk) begin
      reg8 <= {wire3[(3'h7):(1'h0)]};
      reg9 <= (~({($signed((7'h44)) != (wire3 ? wire0 : wire5)), wire6} ?
          ({$signed(wire3)} ?
              $signed({wire6,
                  wire1}) : $signed(wire6)) : wire5[(4'ha):(3'h6)]));
      if ($signed(($signed(($unsigned(wire6) <<< wire2[(4'h9):(3'h7)])) ?
          wire3[(3'h4):(1'h1)] : ($signed({reg9,
              wire4}) != $signed((~|wire7))))))
        begin
          if ((~^$unsigned($signed(((~^wire1) ? ((8'h9d) | reg8) : (&reg9))))))
            begin
              reg10 <= (8'hae);
              reg11 <= $unsigned(((~^wire6) <<< wire0));
              reg12 <= (~^$signed(({(wire6 ? wire0 : wire7),
                  (!reg10)} & (^~(&reg11)))));
              reg13 <= ((reg10[(4'h8):(1'h0)] ?
                      wire2 : (((reg10 < wire5) << ((8'hb6) >> wire5)) ?
                          reg11[(4'hf):(4'h8)] : (reg9 | (reg11 ?
                              wire6 : (8'hbf))))) ?
                  (({$unsigned(wire4),
                      $signed(wire3)} ~^ (~&$unsigned((8'ha7)))) >= wire3) : reg11[(4'ha):(4'h8)]);
              reg14 <= $unsigned(reg8[(3'h7):(3'h4)]);
            end
          else
            begin
              reg10 <= (&{wire3, reg8[(4'hc):(4'h9)]});
            end
        end
      else
        begin
          reg10 <= $signed(((wire3 <= (wire3[(1'h1):(1'h0)] ?
              $signed(wire3) : wire4[(2'h2):(1'h0)])) != wire7[(3'h4):(1'h1)]));
          reg11 <= reg13[(1'h0):(1'h0)];
        end
      reg15 <= (wire1[(3'h6):(2'h3)] ^ (^~wire6));
      if ((^~$signed((($unsigned(reg15) != {wire0}) ?
          reg9[(1'h1):(1'h1)] : ((~&wire0) ? (|wire0) : $unsigned((8'hbc)))))))
        begin
          reg16 <= (^{wire7, $signed($unsigned(wire5))});
          reg17 <= (~|$unsigned(reg10));
          reg18 <= (&((((|reg11) + ((8'hae) >> (8'hab))) | ((-reg17) ?
              $signed((8'hb1)) : $unsigned(reg10))) >>> ({(-reg15),
                  $signed(reg17)} ?
              $signed(wire1[(1'h0):(1'h0)]) : (^(reg13 >= wire3)))));
        end
      else
        begin
          reg16 <= wire2[(3'h6):(2'h3)];
          reg17 <= $signed($signed((($unsigned(reg17) >= {wire3}) ?
              reg13 : $signed($signed(reg9)))));
          if ($signed({($signed({wire2, wire7}) ?
                  (~$signed((8'hbd))) : (!(8'hb2)))}))
            begin
              reg18 <= $unsigned((reg14 > wire1[(3'h5):(2'h3)]));
              reg19 <= {($signed($signed({wire2})) > wire5)};
              reg20 <= (((((reg17 ? wire1 : reg9) ? reg8 : $signed(wire5)) ?
                      {wire3[(3'h6):(2'h2)],
                          {wire1}} : reg10) > ($signed((reg13 ?
                          reg9 : (8'hb5))) ?
                      $unsigned((wire0 ? reg14 : reg14)) : (reg13 ?
                          $signed(wire5) : $unsigned(reg12)))) ?
                  reg17[(2'h2):(1'h0)] : (~|(wire6[(3'h5):(1'h1)] < $signed(wire2))));
              reg21 <= (reg13 ?
                  {reg13[(3'h4):(1'h1)],
                      (reg18[(4'hc):(3'h4)] > (8'ha7))} : (((reg10[(3'h5):(1'h0)] + (reg11 ?
                      reg15 : (8'hb4))) == wire7[(1'h0):(1'h0)]) >> ($signed((wire2 ?
                          reg9 : wire6)) ?
                      wire2[(3'h5):(2'h3)] : wire0)));
              reg22 <= reg14;
            end
          else
            begin
              reg18 <= $signed((^~reg21[(3'h6):(3'h5)]));
              reg19 <= (reg20[(2'h2):(2'h2)] ?
                  (^~reg10) : (({reg11[(1'h0):(1'h0)], (8'hac)} ?
                          $signed($signed((8'ha6))) : $unsigned({reg11,
                              reg16})) ?
                      reg18 : reg19));
            end
          if ((~|$unsigned($signed(((~|reg16) ?
              wire0 : reg16[(3'h5):(2'h3)])))))
            begin
              reg23 <= $signed((wire6[(2'h2):(1'h0)] > $signed($signed((~^reg13)))));
              reg24 <= $unsigned({reg8[(3'h5):(3'h4)],
                  ($signed(reg17[(1'h0):(1'h0)]) << $unsigned(((7'h44) > wire1)))});
              reg25 <= (&wire3[(3'h5):(1'h1)]);
              reg26 <= $signed(((($signed(reg13) - $unsigned(reg8)) >= wire5) ?
                  ((8'ha4) ?
                      $signed((reg25 >> wire6)) : {$unsigned(wire3)}) : $signed({reg21[(4'h9):(3'h7)],
                      (reg10 ^ reg15)})));
              reg27 <= ({$signed($unsigned((!reg10))),
                  (&reg18)} > ((&(^~{wire4})) == (reg21 ?
                  ($signed(wire0) > $unsigned(wire3)) : (reg23[(2'h2):(1'h0)] ?
                      $signed((8'hae)) : (~^reg23)))));
            end
          else
            begin
              reg23 <= wire5[(4'he):(4'h9)];
              reg24 <= $unsigned((reg24[(1'h1):(1'h1)] ?
                  $signed((~&reg11[(4'hb):(4'h8)])) : $signed({(~|reg27),
                      $unsigned(reg23)})));
              reg25 <= $signed(reg12);
            end
        end
    end
  assign wire28 = $signed(({($unsigned(reg8) - {reg25, wire3}),
                      reg24[(1'h1):(1'h1)]} + $signed((!(8'hbb)))));
  always
    @(posedge clk) begin
      reg29 <= reg19[(1'h0):(1'h0)];
      reg30 <= {reg25};
      if ($signed(wire4))
        begin
          reg31 <= $unsigned(({(~^$signed((8'hbc))),
                  {((8'hbd) ? reg17 : reg12)}} ?
              (reg22[(2'h3):(1'h0)] ?
                  reg8[(4'h9):(3'h4)] : reg13) : ($unsigned((reg29 + reg29)) ?
                  $signed(reg8[(4'hd):(4'h9)]) : wire28)));
          reg32 <= reg13;
          reg33 <= $signed(($unsigned(wire4) <= reg11));
          if ((8'haf))
            begin
              reg34 <= (reg31 ?
                  $unsigned(reg24) : {$signed((^$signed(reg32))),
                      ($signed(((8'ha6) ? reg21 : wire0)) * (^(~|(8'ha7))))});
            end
          else
            begin
              reg34 <= (reg33 >> $unsigned($unsigned(((!reg12) ?
                  $signed(reg32) : $unsigned(reg12)))));
              reg35 <= ({wire6[(1'h0):(1'h0)],
                  ($unsigned(reg9) ?
                      $signed((reg34 | wire7)) : (wire3 >= (wire4 ?
                          reg24 : (8'hb2))))} + reg22[(4'h8):(3'h5)]);
            end
          reg36 <= ({reg8,
                  (($signed(reg22) ^~ (+reg30)) ?
                      $signed((wire0 ^ reg21)) : reg19)} ?
              ((~^{(wire6 - wire5),
                  $unsigned(wire1)}) << reg9[(3'h5):(1'h0)]) : $unsigned(((reg11 ?
                  (reg8 ? reg34 : reg29) : (reg10 * wire7)) + ((|(8'hbf)) ?
                  reg8 : wire0[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg31 <= $unsigned((~^reg18));
          if ((~&(((|$signed(reg8)) ^~ (&(-reg31))) - (((reg35 ?
                  reg19 : (8'h9e)) ?
              (reg8 ? (8'had) : reg13) : $unsigned((8'ha3))) >= reg15))))
            begin
              reg32 <= reg14;
              reg33 <= (wire2 ?
                  $signed($unsigned($unsigned(reg25))) : (~|(~$signed($unsigned(wire6)))));
              reg34 <= reg19[(1'h1):(1'h0)];
              reg35 <= (($unsigned((-(reg34 ? reg34 : reg16))) ?
                      reg31[(2'h3):(1'h0)] : (^(reg18[(4'he):(3'h5)] ~^ {wire5}))) ?
                  {($unsigned($signed((8'haa))) ?
                          ($unsigned(reg34) ?
                              (wire1 ?
                                  reg10 : reg11) : (~reg16)) : (reg32[(4'hb):(3'h7)] >= (wire6 ^ reg32)))} : $unsigned((^(~$unsigned(wire2)))));
            end
          else
            begin
              reg32 <= (~&(wire7 + {wire5, (+$unsigned(wire7))}));
              reg33 <= $signed({reg20[(2'h2):(1'h0)],
                  (~|{(reg11 * wire2), (reg13 < reg12)})});
              reg34 <= $signed((-(~^(^~$unsigned(reg36)))));
              reg35 <= (reg33 ?
                  {$signed(reg20[(1'h1):(1'h1)]),
                      $unsigned((!(reg20 ?
                          reg17 : reg15)))} : (|(^~((|reg31) != $signed(reg35)))));
            end
          reg36 <= (^{(&$unsigned({wire5, (8'ha7)})), (~$unsigned({wire6}))});
          reg37 <= ($signed(reg35) ^~ $signed(wire2[(2'h2):(2'h2)]));
        end
      reg38 <= $signed(reg22);
      reg39 <= $signed((~(reg22 - $unsigned($unsigned(reg35)))));
    end
  assign wire40 = (~^reg36);
  assign wire41 = wire3;
endmodule

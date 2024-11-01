module top
#(parameter param81 = (8'hb2), 
parameter param82 = (~&(param81 ~^ param81)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h393):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire59,
                 wire58,
                 wire52,
                 wire36,
                 wire7,
                 wire6,
                 wire5,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire4[(5'h11):(4'hb)];
  assign wire6 = ({{$signed(wire0)},
                     $unsigned(wire0[(3'h4):(2'h2)])} || wire1[(2'h2):(1'h1)]);
  assign wire7 = wire3;
  always
    @(posedge clk) begin
      reg8 <= wire5;
      reg9 <= (^({$signed($signed(wire5))} ?
          $unsigned(((wire2 ^~ wire6) << (-wire3))) : wire2[(3'h4):(2'h2)]));
      reg10 <= (~|((reg9[(3'h4):(1'h1)] > $signed(reg8)) >= wire4[(5'h11):(2'h3)]));
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned($unsigned(((8'hb6) == wire4))))))
        begin
          if ((reg8 ?
              $signed(wire6[(4'hf):(2'h2)]) : (-{($signed(wire1) ^ (reg9 ?
                      reg8 : (8'haa))),
                  $signed((reg9 ? (8'ha3) : (8'had)))})))
            begin
              reg11 <= (~&$unsigned(({$signed(reg10)} | {$signed(wire4)})));
              reg12 <= {$unsigned((~^{(reg11 <<< wire2)}))};
              reg13 <= wire0;
              reg14 <= {reg12[(3'h4):(1'h1)], reg12[(4'h8):(3'h5)]};
              reg15 <= $unsigned($unsigned($signed((~^wire0))));
            end
          else
            begin
              reg11 <= (($unsigned(wire6[(3'h4):(1'h1)]) ?
                      (|$unsigned((~|wire5))) : (($unsigned(reg8) ?
                              $unsigned((8'ha9)) : (reg11 ? (8'ha2) : reg11)) ?
                          ($signed(reg10) & (reg13 <= wire7)) : wire7[(2'h2):(1'h1)])) ?
                  wire7[(2'h3):(2'h3)] : {wire6, (8'ha5)});
              reg12 <= (8'hb2);
            end
          reg16 <= (~|$signed((((wire7 + wire3) ?
                  (reg8 < reg10) : (wire2 | wire0)) ?
              (&$signed(wire0)) : ((wire1 << reg11) ?
                  (~|wire0) : $unsigned(wire0)))));
          reg17 <= $unsigned((|reg14));
        end
      else
        begin
          reg11 <= $unsigned((reg9 ? reg9 : reg9[(2'h2):(1'h1)]));
          reg12 <= {wire6};
          reg13 <= $signed(($signed($unsigned({wire1,
              wire1})) ^~ (wire3[(2'h3):(1'h0)] == wire1)));
        end
      reg18 <= ({reg15[(2'h3):(1'h1)]} ?
          reg16 : ((8'hba) ?
              reg8[(4'he):(3'h7)] : $unsigned($signed(reg17[(1'h0):(1'h0)]))));
      if ((~^reg10[(2'h3):(1'h1)]))
        begin
          reg19 <= $signed(reg12[(3'h4):(1'h1)]);
          reg20 <= $unsigned((($unsigned((reg16 | reg15)) ?
              ((wire7 != (8'ha9)) ?
                  (~^reg19) : wire3) : ($unsigned((8'hb2)) <<< {reg19})) ~^ (~^(~^{reg15,
              reg15}))));
          reg21 <= wire4[(3'h6):(3'h5)];
          reg22 <= reg21;
          reg23 <= ((reg22 != reg9) ? wire2 : $unsigned(reg15));
        end
      else
        begin
          reg19 <= reg14[(3'h4):(3'h4)];
          if (({($signed((!reg17)) >>> ($signed(wire3) >> $signed(wire0))),
              (&reg14[(5'h13):(3'h5)])} - (^$signed($unsigned($unsigned(reg16))))))
            begin
              reg20 <= wire3;
              reg21 <= $signed(reg20);
              reg22 <= reg21;
              reg23 <= ($unsigned((((wire1 <<< reg21) | (~&reg16)) >= ((reg8 != reg16) != (wire4 ?
                  wire7 : wire5)))) || reg21);
            end
          else
            begin
              reg20 <= ((reg20[(4'he):(2'h3)] > (reg10[(3'h5):(2'h3)] ?
                  {(-wire5),
                      $signed(reg13)} : ($unsigned((8'ha9)) * (~|wire6)))) < reg8);
              reg21 <= $signed((reg13[(3'h6):(3'h5)] << $unsigned((reg11 >= (reg11 >>> (8'hba))))));
              reg22 <= $unsigned($unsigned((8'hbf)));
              reg23 <= ((+((~|(^wire7)) + $signed(reg21))) ~^ reg23);
              reg24 <= $signed(((+$signed(((8'ha1) ^ reg18))) + $unsigned(reg12[(4'ha):(3'h6)])));
            end
          reg25 <= $signed(($signed((wire2[(3'h5):(2'h3)] >= (~^reg10))) <= wire6));
          if ($signed(((^$signed($signed(reg19))) ~^ {$signed($signed(wire2))})))
            begin
              reg26 <= $unsigned((+wire0));
              reg27 <= $unsigned(wire1);
              reg28 <= ((~^wire2) ?
                  $unsigned($unsigned((8'h9c))) : $unsigned($signed((((8'h9e) > wire2) >= {reg16}))));
              reg29 <= $signed({reg15[(4'h9):(1'h0)],
                  $unsigned($unsigned(reg22[(1'h0):(1'h0)]))});
            end
          else
            begin
              reg26 <= reg18;
            end
          if (($signed({($signed(wire7) & reg13), (~&reg28[(2'h3):(1'h0)])}) ?
              ($unsigned(({reg29, wire5} ?
                  reg16[(1'h1):(1'h1)] : (reg20 + reg12))) <<< wire4[(3'h5):(3'h4)]) : wire3))
            begin
              reg30 <= $signed(($unsigned({reg13}) <= $unsigned(reg18)));
              reg31 <= (^$signed(reg9));
              reg32 <= $unsigned({$signed($signed($unsigned(reg8)))});
            end
          else
            begin
              reg30 <= reg32[(2'h2):(1'h0)];
              reg31 <= $signed(reg17[(3'h4):(3'h4)]);
              reg32 <= wire0[(3'h4):(2'h2)];
              reg33 <= $unsigned((~^$unsigned(((!(8'ha4)) << {reg22}))));
            end
        end
      reg34 <= (!$signed(reg15[(4'hb):(4'ha)]));
      reg35 <= reg12[(3'h5):(2'h2)];
    end
  assign wire36 = (reg17[(4'h9):(3'h4)] <= reg25);
  always
    @(posedge clk) begin
      reg37 <= reg27[(3'h4):(1'h1)];
      reg38 <= (7'h40);
    end
  always
    @(posedge clk) begin
      reg39 <= $unsigned((^~({reg17[(4'ha):(3'h6)]} ~^ wire7[(1'h1):(1'h0)])));
      if (reg17[(2'h2):(1'h1)])
        begin
          if (({reg21[(3'h4):(1'h1)],
              (|{reg31, reg8})} | $unsigned(reg24[(3'h4):(2'h2)])))
            begin
              reg40 <= $unsigned((reg19[(1'h0):(1'h0)] >> $unsigned((8'hbb))));
              reg41 <= (^~(~|(reg24[(3'h5):(3'h4)] ?
                  {reg34[(4'h8):(3'h6)]} : (-reg27[(3'h4):(3'h4)]))));
              reg42 <= (reg31 ?
                  (!{((wire36 ~^ reg11) || (reg33 ? reg26 : wire5)),
                      reg35[(3'h5):(3'h5)]}) : {((reg25 ?
                          $signed((8'ha7)) : reg40) + reg34)});
              reg43 <= {(($unsigned((reg18 ?
                      reg29 : (8'h9d))) * wire1) >= {(~&$unsigned((7'h41)))}),
                  reg12[(2'h3):(1'h0)]};
            end
          else
            begin
              reg40 <= (~^(((-(reg15 ? reg37 : reg35)) ?
                  $signed($signed(reg10)) : $signed($unsigned(reg42))) > wire3[(2'h2):(2'h2)]));
            end
          if ({{reg23[(2'h2):(2'h2)],
                  ((~&(reg8 ? (7'h42) : (8'hbb))) ?
                      $signed((reg19 << reg18)) : reg26[(3'h4):(3'h4)])}})
            begin
              reg44 <= (reg31 ?
                  ({$signed((~^wire5))} > $signed(((|(8'hb6)) ?
                      (~|reg40) : (&reg24)))) : $unsigned($unsigned((!reg34))));
              reg45 <= (~{(^~reg38[(3'h4):(1'h0)])});
              reg46 <= (^((!$unsigned({(8'hba), wire7})) ?
                  reg22 : {(((7'h42) ? reg14 : (8'haf)) ?
                          {reg44} : $unsigned(reg23))}));
            end
          else
            begin
              reg44 <= reg45[(4'h9):(4'h8)];
              reg45 <= {reg33[(4'h8):(2'h2)],
                  ($signed(((&reg30) ? (~^reg29) : {reg43, reg25})) + reg32)};
              reg46 <= (((+($unsigned(reg45) ?
                      $signed(reg40) : $unsigned(reg9))) ?
                  (~|((-wire1) && $signed(reg25))) : reg24[(3'h6):(1'h1)]) ^ (wire4 ?
                  reg14 : $unsigned($signed(reg41))));
              reg47 <= reg34;
            end
        end
      else
        begin
          reg40 <= reg33;
        end
      reg48 <= (($unsigned((~|$signed(wire3))) ?
              $unsigned($signed(reg20)) : ((!(reg35 || reg22)) ?
                  ((!reg31) ^~ (reg28 ?
                      reg8 : wire3)) : $unsigned($unsigned(reg12)))) ?
          ((^~reg38) ?
              ($unsigned($unsigned(reg29)) ?
                  ($unsigned(reg11) ?
                      reg45 : (reg39 ?
                          (8'haf) : reg19)) : reg13[(4'ha):(3'h4)]) : $signed(((~&reg9) < (^~reg18)))) : (reg12 <<< $unsigned(($unsigned((8'hbd)) << $unsigned(reg33)))));
      if (((!wire36) <<< ((^~wire4) ?
          $unsigned({{reg46, reg14}}) : reg28[(1'h0):(1'h0)])))
        begin
          reg49 <= wire4;
          reg50 <= ($signed($unsigned(($unsigned(wire6) ?
              (reg44 <<< reg34) : (reg32 ?
                  (8'ha2) : reg37)))) < reg22[(1'h1):(1'h1)]);
        end
      else
        begin
          reg49 <= $signed(($unsigned((~^reg45[(1'h1):(1'h1)])) ?
              wire2[(3'h5):(3'h4)] : $signed({(^~reg8)})));
          reg50 <= $signed(reg28[(3'h6):(1'h0)]);
          reg51 <= (({(^{wire5,
                  reg8})} & $signed((~^{(7'h42)}))) ^ (^{(~^(reg46 * (8'had))),
              reg12[(5'h10):(5'h10)]}));
        end
    end
  assign wire52 = (~|(~^(&($signed((7'h43)) | (~|reg19)))));
  always
    @(posedge clk) begin
      if ((+$unsigned(reg15)))
        begin
          reg53 <= $unsigned(reg17[(3'h6):(2'h2)]);
          reg54 <= (^reg12);
          reg55 <= $signed((^wire52[(1'h0):(1'h0)]));
          reg56 <= (+(~&reg24));
        end
      else
        begin
          reg53 <= $unsigned(reg27);
          reg54 <= (($signed(($signed(reg49) >>> (reg13 ~^ reg37))) >= reg14) < {$unsigned($signed((reg30 ?
                  reg39 : reg40))),
              (^$signed((~|reg51)))});
        end
      reg57 <= $signed((^(~|reg9[(3'h5):(1'h1)])));
    end
  assign wire58 = ({{$signed(reg35), (reg9 + $signed(reg25))}} ?
                      ((~&reg21) ?
                          reg50[(1'h0):(1'h0)] : ((wire7[(2'h2):(2'h2)] ?
                              $unsigned(reg40) : wire52[(1'h0):(1'h0)]) * ((reg20 ~^ reg50) * (^reg25)))) : reg56);
  assign wire59 = ($signed($unsigned($unsigned(reg16[(2'h2):(1'h1)]))) >>> $signed((wire2[(4'h9):(3'h6)] ?
                      ($signed(reg20) ? wire5 : reg46) : {(reg49 ?
                              reg56 : (8'h9c))})));
  always
    @(posedge clk) begin
      reg60 <= (($unsigned((reg43 ?
          (~&reg24) : (|reg43))) || (($unsigned(reg39) ?
          reg41[(5'h10):(4'hf)] : (reg12 > wire52)) <= (((8'ha4) ?
              reg34 : reg46) ?
          (wire36 ? reg42 : reg35) : (reg47 ?
              wire1 : reg37)))) + ((reg51[(4'hd):(4'h8)] > ($unsigned(reg17) ?
          (reg11 << reg50) : {reg41})) << reg25));
    end
  always
    @(posedge clk) begin
      if (((reg25 ?
              $unsigned({(reg20 <<< reg47)}) : ((reg32 ~^ (8'ha7)) < ($unsigned(reg47) ?
                  {reg35} : (+(8'hb5))))) ?
          $signed(reg57[(1'h1):(1'h1)]) : $signed((^~$unsigned(wire4[(4'h9):(4'h8)])))))
        begin
          if ($signed($unsigned(reg32)))
            begin
              reg61 <= {($unsigned(wire1) && reg13[(4'h9):(4'h9)]),
                  {reg31, reg57}};
              reg62 <= wire1[(2'h2):(1'h1)];
              reg63 <= {reg13};
              reg64 <= $signed(reg39);
              reg65 <= reg27[(3'h7):(2'h3)];
            end
          else
            begin
              reg61 <= $signed(((7'h44) - ($signed($unsigned(reg39)) <= {((8'hb2) > (7'h42)),
                  reg19})));
              reg62 <= reg53;
              reg63 <= reg63;
              reg64 <= $signed((+reg44[(3'h7):(1'h1)]));
              reg65 <= $signed($signed(($unsigned(reg31[(4'hb):(4'hb)]) != $signed(reg24))));
            end
          reg66 <= ($unsigned(reg35) ^~ (&(^(^~$unsigned(reg51)))));
          reg67 <= $unsigned((8'hac));
        end
      else
        begin
          reg61 <= ({reg44[(4'h8):(1'h0)],
                  $unsigned((&(reg47 ? (8'hab) : reg57)))} ?
              (reg19[(3'h4):(2'h3)] ?
                  (7'h42) : (^~reg26)) : $unsigned(({(wire5 ?
                      reg46 : (8'ha0))} ^ (~|$unsigned(reg49)))));
        end
      if ($signed((~|$unsigned($unsigned($signed(wire5))))))
        begin
          if (reg24[(4'h8):(3'h7)])
            begin
              reg68 <= $unsigned($unsigned(reg38));
              reg69 <= (8'ha6);
            end
          else
            begin
              reg68 <= (~reg44);
              reg69 <= $signed(((reg56[(2'h2):(1'h1)] ?
                      (~&wire58) : $unsigned((reg30 ? (8'ha5) : reg47))) ?
                  ((&(8'ha5)) < wire52[(1'h1):(1'h0)]) : ($signed((~|reg9)) ?
                      wire5 : ((^~reg17) ? (^~(7'h43)) : $unsigned((8'hb5))))));
              reg70 <= wire1[(1'h0):(1'h0)];
              reg71 <= ($unsigned((-reg33[(1'h0):(1'h0)])) ?
                  ((8'hbe) <<< $signed($signed($signed(wire59)))) : ({(((8'haf) ?
                          reg19 : reg23) < $signed(reg50)),
                      (-{reg19})} ~^ reg18[(3'h4):(2'h3)]));
            end
        end
      else
        begin
          reg68 <= $unsigned(($unsigned(({wire3} ?
              $unsigned(reg47) : (|reg15))) != {((reg11 ?
                  reg22 : reg71) && $unsigned(reg26))}));
          if (reg43)
            begin
              reg69 <= reg57;
              reg70 <= reg63[(2'h3):(1'h0)];
            end
          else
            begin
              reg69 <= reg28;
              reg70 <= (^reg51[(3'h7):(1'h0)]);
              reg71 <= (((reg60[(3'h5):(3'h4)] - ((reg39 ?
                      reg68 : wire58) ^ $signed(reg62))) ?
                  (((wire58 ? reg44 : (8'h9f)) ?
                          (&(8'ha3)) : (wire2 ? reg70 : (8'h9f))) ?
                      (~&(reg10 ^ reg65)) : wire7[(3'h4):(3'h4)]) : {{(reg40 == reg62),
                          $unsigned(wire0)}}) <<< $unsigned(wire59));
            end
          reg72 <= reg42;
          reg73 <= reg19[(2'h3):(1'h0)];
          reg74 <= (^(!$unsigned({reg64[(2'h3):(1'h1)]})));
        end
      reg75 <= (+reg64[(1'h1):(1'h0)]);
      reg76 <= $unsigned(({reg74, $signed((reg71 ^~ reg56))} ?
          $signed((7'h42)) : reg56));
    end
  assign wire77 = (^~reg17);
  assign wire78 = {wire36};
  assign wire79 = wire52[(2'h2):(1'h0)];
  assign wire80 = (^$signed($signed($unsigned((wire59 >>> reg26)))));
endmodule

module top
#(parameter param158 = (~&{(((~&(8'ha2)) ? ((7'h40) ? (7'h43) : (8'h9d)) : ((7'h40) ? (8'hba) : (8'haa))) ? {((8'hb3) ? (8'hb4) : (8'ha8)), (~|(8'hba))} : (((8'hb1) <= (8'hb3)) ? ((8'hb0) != (8'ha2)) : {(8'haf)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h25d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire157;
  wire [(4'h9):(1'h0)] wire156;
  wire signed [(4'h8):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire27,
                 wire5,
                 wire4,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0[(3'h4):(1'h0)];
  assign wire5 = $unsigned(((wire2 >>> wire4) ?
                     {$signed((wire2 & wire1)),
                         ((wire3 ? wire2 : wire0) ?
                             wire2 : $unsigned(wire2))} : $unsigned(wire1)));
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned($signed((|wire4))));
      reg7 <= (|wire1);
      reg8 <= (^reg7);
      if ((+$signed(($unsigned((reg7 | wire1)) ?
          ((wire2 + wire3) + (wire2 + wire1)) : wire1[(4'ha):(2'h3)]))))
        begin
          reg9 <= (~&(($unsigned((-(8'hb4))) || $unsigned((reg6 | wire2))) ?
              (~|(-(-wire3))) : (!$unsigned($unsigned((8'hac))))));
          reg10 <= $signed((8'ha0));
          reg11 <= (~&wire3[(2'h2):(2'h2)]);
          if ((($unsigned(wire4[(3'h6):(2'h2)]) ?
                  $unsigned((wire1 ?
                      reg8[(2'h3):(2'h3)] : reg8)) : $unsigned($unsigned($unsigned((8'ha5))))) ?
              {(~reg10[(2'h3):(1'h0)])} : $unsigned((8'haf))))
            begin
              reg12 <= reg8;
              reg13 <= ((($unsigned((reg9 ?
                      reg12 : reg12)) << wire2[(1'h0):(1'h0)]) * (&$signed((~(8'hbf))))) ?
                  {$unsigned($unsigned(wire4[(3'h7):(2'h3)]))} : reg8[(4'h9):(3'h4)]);
            end
          else
            begin
              reg12 <= $unsigned(wire3);
              reg13 <= ($unsigned($signed(reg10)) > reg9);
              reg14 <= reg10;
              reg15 <= reg10[(4'hf):(3'h5)];
              reg16 <= reg6[(3'h7):(3'h6)];
            end
        end
      else
        begin
          if (((((~|(~reg8)) | $unsigned(reg7[(1'h0):(1'h0)])) ?
                  ((((8'ha9) ? wire3 : reg11) ? (^reg14) : $unsigned(reg7)) ?
                      $unsigned($signed((8'hab))) : (wire1[(4'ha):(2'h3)] ?
                          $unsigned(wire4) : $unsigned(wire4))) : reg11[(5'h10):(1'h1)]) ?
              ((reg9 ^ wire1) ? wire1[(2'h2):(1'h0)] : reg13) : {(8'hbb)}))
            begin
              reg9 <= reg12[(3'h5):(2'h3)];
              reg10 <= $signed((8'hb9));
              reg11 <= $signed(($signed({{reg7}}) ?
                  $unsigned($unsigned((|reg11))) : $unsigned($signed(reg15[(3'h5):(2'h2)]))));
              reg12 <= $signed({wire1[(4'hc):(3'h7)], $unsigned(reg13)});
              reg13 <= {$signed((reg14 ^~ $signed((~&reg15)))), reg10};
            end
          else
            begin
              reg9 <= reg10;
              reg10 <= $unsigned((^$unsigned(wire2)));
            end
          reg14 <= (($unsigned($unsigned({(8'h9e)})) ?
              $signed($unsigned({reg15, reg8})) : (^~((reg12 << (8'hbd)) ?
                  $unsigned(wire5) : reg7[(1'h1):(1'h1)]))) ^~ wire2[(1'h0):(1'h0)]);
          reg15 <= (~&reg9[(5'h10):(3'h4)]);
          reg16 <= wire1;
          reg17 <= (8'ha9);
        end
      if ({reg12})
        begin
          reg18 <= (~&(!($signed(reg17) || reg9)));
          reg19 <= reg9[(5'h12):(3'h5)];
        end
      else
        begin
          if ((8'hac))
            begin
              reg18 <= reg9;
              reg19 <= $unsigned(wire1[(4'ha):(3'h5)]);
            end
          else
            begin
              reg18 <= (8'ha5);
              reg19 <= ($signed({reg18,
                  (wire2[(1'h1):(1'h1)] ^ (~^wire4))}) == ((&$unsigned(reg14)) ?
                  reg18[(4'hd):(4'hc)] : (^~{{wire5}})));
              reg20 <= wire1[(4'hc):(2'h2)];
              reg21 <= ($unsigned((~|$unsigned((+reg14)))) - (~{reg10[(4'h8):(3'h6)],
                  ((~|reg12) >>> wire4)}));
              reg22 <= $unsigned(reg17[(1'h1):(1'h0)]);
            end
          reg23 <= {reg15[(4'he):(4'h8)],
              ((8'h9c) | {$unsigned(reg8), $signed($signed((8'ha7)))})};
          reg24 <= $unsigned((-$signed($signed(reg14[(4'h8):(3'h7)]))));
          reg25 <= (7'h44);
          reg26 <= reg17;
        end
    end
  assign wire27 = {$signed($unsigned((((8'ha6) << wire2) & (reg9 ?
                          wire4 : reg22)))),
                      wire3[(2'h2):(1'h1)]};
  always
    @(posedge clk) begin
      reg28 <= (($signed(($unsigned(reg8) ?
          reg6[(4'ha):(3'h5)] : $unsigned(reg15))) < (({reg6,
          (8'hac)} ~^ {wire27}) >>> $signed($signed(reg14)))) ^ $unsigned(reg11));
      reg29 <= (^~reg26[(4'hd):(4'hb)]);
      if ({({((wire27 ? reg22 : reg16) ^~ (wire2 - reg6)), reg28} ?
              $signed((8'ha2)) : reg9)})
        begin
          reg30 <= $unsigned({($signed($unsigned(reg18)) + ((reg20 ?
                  (7'h44) : reg29) ~^ (wire3 + wire1)))});
          reg31 <= {(~&$signed($signed({(7'h41)}))), reg12};
          if ((($signed($unsigned((~&reg30))) | (reg13 <<< ($signed(reg20) <= (reg9 < reg19)))) < (|(^~$signed(reg25)))))
            begin
              reg32 <= {((^~reg31) ?
                      reg23[(1'h0):(1'h0)] : $unsigned($signed((8'h9e))))};
            end
          else
            begin
              reg32 <= $unsigned($signed($unsigned((((8'ha9) ? reg21 : reg18) ?
                  (reg30 ? reg23 : reg26) : $signed(reg19)))));
              reg33 <= reg18[(4'ha):(3'h6)];
              reg34 <= $signed(reg8);
              reg35 <= (((8'hae) ?
                  (^~reg30[(5'h10):(4'hf)]) : ($unsigned($signed(reg8)) ?
                      ($signed(reg23) >= $signed((8'ha8))) : (~{wire5}))) <<< {{{$unsigned(reg33),
                          $signed(reg29)}},
                  ((-wire4) ~^ (((8'ha2) >>> (8'hb0)) ?
                      reg18[(4'he):(3'h6)] : $signed((8'h9e))))});
            end
        end
      else
        begin
          reg30 <= reg13;
          reg31 <= (~^$signed((((wire3 ?
              reg21 : (8'hba)) ~^ (^~reg21)) && $signed(((8'hb3) ?
              reg6 : (8'hba))))));
          if ((($unsigned((&reg7[(2'h2):(1'h1)])) ?
                  (8'ha4) : (&(+(reg33 != reg12)))) ?
              (+(wire5[(3'h7):(3'h7)] ?
                  (reg34[(4'h9):(4'h8)] ?
                      {reg29, wire1} : (reg22 == reg9)) : ((reg18 ?
                          reg34 : reg15) ?
                      $unsigned(reg30) : wire5))) : wire2[(2'h2):(1'h1)]))
            begin
              reg32 <= (reg24 ?
                  wire27[(1'h0):(1'h0)] : $unsigned(reg7[(1'h1):(1'h0)]));
            end
          else
            begin
              reg32 <= (|(reg26 && {reg33, reg19[(3'h4):(2'h2)]}));
              reg33 <= (reg24[(1'h0):(1'h0)] ?
                  (-(reg11 ^ ((reg14 < wire5) > {(8'hb1)}))) : $unsigned(reg8[(5'h12):(4'h8)]));
              reg34 <= ($unsigned((~^$unsigned((reg25 ? (8'ha8) : reg34)))) ?
                  (8'h9f) : ($unsigned(reg21) ?
                      {$unsigned((!reg34))} : ({reg30, {reg25, (8'hbb)}} ?
                          (8'hae) : $unsigned((reg10 * reg13)))));
              reg35 <= ((^~(8'hbd)) || ($unsigned($signed((8'ha9))) == {wire27[(3'h4):(3'h4)]}));
            end
          reg36 <= (&wire3);
          reg37 <= (reg29 ?
              ((~^(-$unsigned((8'ha2)))) ?
                  $unsigned($signed($unsigned((8'ha3)))) : ((((8'h9f) ?
                      reg23 : (8'hbe)) | $unsigned(reg20)) < reg31)) : reg26[(1'h0):(1'h0)]);
        end
      reg38 <= ($unsigned($unsigned((reg6[(3'h7):(3'h4)] <= reg31[(2'h3):(2'h3)]))) | ({{(~|reg10)}} ?
          ($unsigned($signed(reg21)) ?
              {(reg12 ^ reg7), (|reg21)} : reg28) : reg10));
      reg39 <= $signed(reg32[(3'h4):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((~^$unsigned((reg20 ^ reg21))))))
        begin
          reg40 <= $signed((+($signed({reg36}) ?
              ((reg32 >= reg26) ?
                  $signed(reg15) : (+(8'hbd))) : $unsigned((wire5 ?
                  reg28 : reg17)))));
          reg41 <= ($signed($unsigned(reg28)) >= ($unsigned(reg38) && (|(~^((8'h9e) ?
              reg13 : (8'ha9))))));
          reg42 <= ($signed(($signed((~|reg39)) <= ((reg30 ?
                  wire1 : reg23) > (wire4 ? reg39 : reg13)))) ?
              $unsigned(reg8) : $unsigned(wire2[(2'h3):(2'h2)]));
          reg43 <= reg38[(4'he):(3'h4)];
        end
      else
        begin
          reg40 <= wire4[(4'h8):(3'h6)];
          reg41 <= reg26;
          reg42 <= (+$unsigned(reg38));
          reg43 <= reg12;
        end
      reg44 <= $signed((($unsigned($signed(wire27)) ?
          ((|reg8) ?
              $signed(reg34) : $signed(wire0)) : $unsigned($signed(wire2))) != reg23));
      reg45 <= $unsigned(($unsigned($signed((!(8'hac)))) < (~|reg30[(3'h5):(1'h1)])));
      reg46 <= (&$signed($signed(reg45[(1'h1):(1'h0)])));
      reg47 <= {{(~&((8'hb9) | (~reg7)))}};
    end
  module48 #() modinst153 (.wire52(reg37), .clk(clk), .y(wire152), .wire50(reg16), .wire49(reg38), .wire51(reg21));
  assign wire154 = $signed($signed((~|{$unsigned(reg37)})));
  assign wire155 = (^{{($signed(wire3) == (reg24 == reg28)),
                           (~^((8'ha9) ? reg21 : reg18))}});
  assign wire156 = $signed(($signed(reg8) ~^ (((reg9 ? reg6 : reg29) ?
                           (^wire2) : reg38[(1'h1):(1'h1)]) ?
                       ((reg32 ? wire0 : (8'h9e)) ?
                           reg35[(4'hd):(4'ha)] : ((8'hb6) ?
                               reg11 : reg6)) : {(8'hab),
                           reg32[(2'h3):(1'h0)]})));
  assign wire157 = ((8'haa) == reg36);
endmodule

module module48  (y, clk, wire49, wire50, wire51, wire52);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire [(4'hc):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire150;
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  assign y = {wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire77,
                 wire122,
                 wire150,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 (1'h0)};
  assign wire53 = $signed({{$signed($signed(wire49)), $signed((|wire49))}});
  assign wire54 = {{{(-wire49[(2'h3):(2'h2)]), $unsigned($unsigned(wire52))}}};
  assign wire55 = wire50[(4'ha):(4'h9)];
  assign wire56 = (($unsigned($unsigned(wire52[(4'h9):(3'h4)])) != wire52[(2'h3):(2'h2)]) ?
                      ({wire49, ((wire51 ? wire53 : wire52) ^~ wire55)} ?
                          {$unsigned(wire50)} : (8'ha5)) : wire53);
  always
    @(posedge clk) begin
      if (wire54)
        begin
          if ($unsigned((~|wire55)))
            begin
              reg57 <= $unsigned(wire50);
            end
          else
            begin
              reg57 <= ($unsigned(($signed((wire49 ?
                      (8'haf) : wire55)) + {(&wire51),
                      (wire52 ? wire51 : wire53)})) ?
                  $signed((wire52[(4'ha):(1'h0)] || (~&(^wire50)))) : (!{(+$unsigned((8'hb0))),
                      wire49[(4'ha):(3'h7)]}));
              reg58 <= (wire54[(1'h1):(1'h0)] ?
                  $signed((^$unsigned($signed(wire50)))) : (~|wire56));
              reg59 <= ((~&($signed($unsigned((8'ha0))) ?
                      (+$unsigned((8'hb2))) : wire56[(4'hc):(4'h8)])) ?
                  ((&($signed(wire51) ?
                      $unsigned(reg58) : (wire54 || reg57))) != wire51[(3'h7):(3'h4)]) : wire55[(4'he):(3'h7)]);
              reg60 <= (wire56[(3'h4):(3'h4)] > ((~&$signed(reg59[(3'h5):(3'h4)])) << wire55));
            end
          reg61 <= wire54[(4'hb):(1'h0)];
          if ((|wire51[(4'h8):(3'h5)]))
            begin
              reg62 <= wire53[(1'h0):(1'h0)];
              reg63 <= wire53[(3'h4):(2'h2)];
            end
          else
            begin
              reg62 <= (((wire54 + (&$unsigned(wire49))) >> reg62) ~^ $signed(reg60));
              reg63 <= wire54[(3'h5):(2'h2)];
              reg64 <= reg62;
            end
          if ({reg57, $unsigned(wire50)})
            begin
              reg65 <= {$unsigned({{(reg64 ? reg59 : reg61)}, (^~{wire54})}),
                  {$signed((wire54[(4'h8):(1'h0)] ? wire49 : {reg58}))}};
              reg66 <= reg60;
              reg67 <= {{($unsigned({(8'ha9)}) != reg62[(4'h8):(3'h7)])},
                  $signed(((~(wire49 ? wire54 : (8'hb5))) ?
                      wire56[(4'he):(1'h1)] : {(reg59 ? wire50 : (8'hb2))}))};
              reg68 <= (reg62[(4'hb):(3'h6)] ? wire49 : $unsigned(reg57));
            end
          else
            begin
              reg65 <= $unsigned({(((reg66 <<< (8'hab)) ?
                          (!reg68) : reg60[(1'h0):(1'h0)]) ?
                      wire49[(4'hd):(4'h9)] : $signed($unsigned(wire49))),
                  $unsigned($signed(reg65[(3'h6):(2'h2)]))});
              reg66 <= reg67[(4'hb):(4'h9)];
            end
          if ({(-reg59), wire55})
            begin
              reg69 <= (~^$signed(reg63));
              reg70 <= wire51[(4'h9):(3'h6)];
              reg71 <= {{wire49[(4'h9):(1'h0)],
                      $unsigned(((reg66 ?
                          wire50 : reg69) >= $unsigned(wire54)))}};
              reg72 <= ($signed(wire50[(4'h8):(2'h2)]) | ((!{(reg63 ?
                          reg59 : (8'hb8))}) ?
                  (&((^wire54) ?
                      {reg63, (8'h9e)} : (wire53 ? reg69 : reg64))) : (reg60 ?
                      (reg64 ? reg59 : (8'ha9)) : {(~^wire56),
                          {(7'h44), (8'hb5)}})));
              reg73 <= (((^wire52[(3'h5):(3'h5)]) ?
                      {{$unsigned((8'hba)),
                              $signed(reg59)}} : (($signed(reg71) | (7'h41)) ?
                          $unsigned(reg62) : $unsigned($signed(wire50)))) ?
                  ($unsigned(reg57[(1'h1):(1'h0)]) ?
                      (+({reg60, reg65} ^~ (reg69 ?
                          wire55 : reg65))) : {wire50}) : {(~&$signed($unsigned(reg70))),
                      reg70[(2'h3):(1'h1)]});
            end
          else
            begin
              reg69 <= ((|$signed(($unsigned(wire50) - (reg70 ?
                      reg71 : (8'hb5))))) ?
                  $unsigned((8'hb3)) : $unsigned(reg58[(3'h6):(2'h2)]));
              reg70 <= $signed({($unsigned(reg57) ?
                      $unsigned(wire50) : wire52)});
              reg71 <= $signed((^~($signed(reg61[(2'h2):(1'h1)]) & $unsigned((wire49 ^~ reg66)))));
              reg72 <= reg73[(3'h4):(1'h0)];
              reg73 <= ((reg66 ^~ {($signed(wire55) ? reg57 : $unsigned(reg65)),
                      (reg72[(1'h1):(1'h0)] || $signed(reg57))}) ?
                  $unsigned((reg64[(1'h1):(1'h0)] ?
                      wire53 : $signed((reg70 >> wire52)))) : (~|reg69[(3'h6):(3'h6)]));
            end
        end
      else
        begin
          reg57 <= wire51[(3'h4):(2'h2)];
          reg58 <= wire49;
          if ((^(!$unsigned((&wire52)))))
            begin
              reg59 <= {reg58, $signed(reg68)};
            end
          else
            begin
              reg59 <= reg69;
              reg60 <= ({wire55[(4'hc):(2'h3)]} - ((~(8'hac)) > ($signed(reg59[(2'h2):(1'h1)]) > (8'hb3))));
              reg61 <= reg70[(1'h0):(1'h0)];
              reg62 <= reg60;
            end
          reg63 <= {{(((^~wire51) <<< (reg59 <= reg59)) != reg65[(3'h6):(2'h2)]),
                  (wire54 ? {wire53, (reg66 <<< wire50)} : (reg60 >>> reg73))}};
          reg64 <= reg58[(2'h2):(2'h2)];
        end
      reg74 <= (({((8'hab) ? $unsigned(wire54) : reg67)} <= reg67) ?
          (reg63 ?
              reg70[(2'h3):(2'h3)] : wire54) : ($unsigned((reg59[(1'h0):(1'h0)] ^ (reg72 ?
                  reg67 : reg66))) ?
              reg58 : reg62));
      reg75 <= reg60[(1'h0):(1'h0)];
      reg76 <= reg62[(4'hc):(4'ha)];
    end
  assign wire77 = (~|$signed(((reg67 ?
                      reg61[(2'h3):(1'h1)] : reg61[(2'h2):(2'h2)]) << (^wire50[(4'hc):(3'h6)]))));
  module78 #() modinst123 (.wire82(reg62), .wire83(wire77), .clk(clk), .wire79(reg73), .y(wire122), .wire80(wire55), .wire81(reg74));
  module124 #() modinst151 (wire150, clk, reg57, reg59, reg60, wire55, reg61);
endmodule

module module124  (y, clk, wire129, wire128, wire127, wire126, wire125);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire129;
  input wire signed [(2'h3):(1'h0)] wire128;
  input wire signed [(4'h8):(1'h0)] wire127;
  input wire signed [(5'h14):(1'h0)] wire126;
  input wire [(3'h5):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 (1'h0)};
  assign wire130 = ((wire128[(2'h2):(1'h0)] ?
                       wire127 : wire125) + (wire127[(2'h2):(1'h1)] >= $unsigned(wire129)));
  assign wire131 = (-$signed($unsigned($unsigned(wire125[(1'h1):(1'h1)]))));
  assign wire132 = $signed($unsigned($unsigned({(wire126 ?
                           wire131 : wire125)})));
  assign wire133 = wire125[(2'h3):(1'h0)];
  assign wire134 = (wire126[(3'h7):(1'h1)] >= ($signed($signed((!wire130))) >> $unsigned({(-(7'h44)),
                       $signed(wire133)})));
  assign wire135 = ($unsigned((wire126 ? wire131 : $signed($signed(wire127)))) ?
                       (wire127 ?
                           (~^(wire133[(2'h2):(2'h2)] ?
                               (wire130 >> wire129) : wire127[(4'h8):(3'h7)])) : wire133) : (|({$unsigned(wire134),
                           (wire133 ?
                               wire130 : wire133)} || $signed((^wire128)))));
  assign wire136 = (wire129[(2'h2):(2'h2)] <= wire134[(1'h0):(1'h0)]);
  assign wire137 = $signed((~wire133[(2'h3):(1'h0)]));
  assign wire138 = $signed((wire128 ?
                       wire135[(5'h13):(4'hc)] : (wire137[(3'h6):(3'h5)] || wire136[(3'h4):(2'h2)])));
  assign wire139 = ((((((8'hb6) ^~ wire130) | wire130[(3'h4):(1'h0)]) != $signed(wire126)) * $signed(((wire127 <= wire127) ?
                           wire127 : $unsigned(wire126)))) ?
                       $signed($signed($unsigned($unsigned(wire125)))) : wire129[(2'h3):(2'h3)]);
  assign wire140 = $unsigned(wire127[(3'h4):(2'h3)]);
  assign wire141 = wire128[(2'h3):(1'h0)];
  assign wire142 = wire125[(1'h1):(1'h0)];
  assign wire143 = $unsigned({({(wire130 >> wire127),
                           wire141[(3'h4):(2'h3)]} & $unsigned({wire139}))});
  assign wire144 = (!(wire127[(4'h8):(3'h7)] ?
                       $signed($unsigned(wire135)) : (((wire127 ?
                               wire126 : wire125) * wire139[(3'h5):(1'h0)]) ?
                           (-$unsigned(wire143)) : {$signed(wire131),
                               $unsigned((8'hb6))})));
  assign wire145 = (wire132[(3'h7):(1'h1)] - {($signed((wire128 ?
                               wire144 : wire142)) ?
                           (wire129[(1'h1):(1'h1)] ?
                               $signed((7'h42)) : (wire138 ?
                                   wire141 : (8'hbc))) : ((wire136 ?
                               wire130 : wire128) * (wire142 && wire130))),
                       wire141[(4'h8):(3'h6)]});
  assign wire146 = ($unsigned(($unsigned(wire136) && ((^wire131) ?
                       $unsigned(wire139) : wire130))) <= {(($signed(wire130) ?
                           (|wire128) : (~&wire135)) < ($unsigned(wire136) > (~&wire138))),
                       {(((8'ha5) <<< wire144) ? wire141 : {wire129, wire142}),
                           $unsigned(wire136[(2'h3):(1'h1)])}});
  assign wire147 = wire145[(4'hd):(1'h0)];
  assign wire148 = ($signed($signed($unsigned($signed(wire133)))) && (({wire146} ?
                       ((~wire142) < $unsigned(wire133)) : {(wire143 | wire135)}) | (wire128 >= (+$unsigned(wire134)))));
  assign wire149 = {wire148};
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire83;
  input wire [(4'hb):(1'h0)] wire82;
  input wire [(4'h8):(1'h0)] wire81;
  input wire signed [(3'h4):(1'h0)] wire80;
  input wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  assign y = {wire121,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg90,
                 reg88,
                 (1'h0)};
  assign wire84 = wire81[(4'h8):(2'h3)];
  assign wire85 = (&$signed((!(wire83 != wire80[(3'h4):(2'h3)]))));
  assign wire86 = $unsigned(wire81);
  assign wire87 = wire83[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg88 <= (^~{{({wire84, wire85} ?
                  wire85[(3'h4):(1'h0)] : $unsigned(wire82)),
              $unsigned($signed((8'hab)))}});
    end
  assign wire89 = wire84[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg90 <= wire89[(4'h8):(3'h4)];
    end
  assign wire91 = (|($signed($unsigned((reg90 > wire89))) >> wire87[(3'h4):(3'h4)]));
  assign wire92 = wire85[(3'h6):(3'h4)];
  assign wire93 = $signed(wire91[(4'ha):(3'h6)]);
  assign wire94 = $unsigned((!((8'ha2) ? ({wire91} | (~^wire84)) : wire93)));
  assign wire95 = (-(~|$unsigned(wire89[(3'h4):(3'h4)])));
  assign wire96 = wire93;
  assign wire97 = (&wire85);
  assign wire98 = wire81[(3'h7):(2'h3)];
  assign wire99 = reg90;
  assign wire100 = ((wire95 ^ wire83[(1'h0):(1'h0)]) ~^ (wire98[(1'h0):(1'h0)] ?
                       $signed({(wire93 ? wire80 : wire96),
                           {wire95}}) : $signed(((wire98 > wire89) ?
                           (-wire84) : $signed(reg90)))));
  assign wire101 = ((^$unsigned(($signed(wire85) != (wire82 ^~ (8'hbf))))) ?
                       $signed({$unsigned((-(7'h40))),
                           (|wire80[(2'h3):(2'h2)])}) : $unsigned($unsigned((|(-reg88)))));
  assign wire102 = (wire100[(1'h1):(1'h0)] >>> wire85);
  assign wire103 = (((((~|wire84) && $signed(wire84)) && (-(8'hb0))) || wire94[(4'ha):(3'h7)]) ?
                       wire93 : {$unsigned($signed($unsigned(wire86))),
                           wire84[(3'h6):(1'h0)]});
  assign wire104 = {wire99[(3'h5):(3'h5)], wire102};
  always
    @(posedge clk) begin
      reg105 <= (8'h9c);
      if (wire94[(2'h2):(1'h0)])
        begin
          if (wire85)
            begin
              reg106 <= ($unsigned((|$signed((-wire93)))) ^ (-wire85[(2'h2):(2'h2)]));
              reg107 <= wire99[(1'h1):(1'h1)];
              reg108 <= ((-wire84[(5'h11):(3'h5)]) > (wire94[(1'h0):(1'h0)] >>> (-{(~&wire79)})));
              reg109 <= wire82[(4'h8):(1'h0)];
            end
          else
            begin
              reg106 <= $unsigned($unsigned(((^~$signed(wire86)) - $unsigned({reg106}))));
              reg107 <= {(~^($unsigned($signed(wire94)) || {wire91}))};
            end
          if (wire80[(1'h0):(1'h0)])
            begin
              reg110 <= wire100[(2'h3):(1'h0)];
            end
          else
            begin
              reg110 <= reg90[(4'h9):(2'h2)];
            end
          reg111 <= wire89;
          reg112 <= ((((~reg105) + ($unsigned(wire102) ?
                      (wire102 ^~ wire92) : (reg108 ? (8'ha8) : wire81))) ?
                  $unsigned($unsigned((wire98 <<< wire97))) : reg110) ?
              ((|{(~wire85)}) ?
                  $signed((~|(wire97 - wire93))) : (~$unsigned((wire97 | reg109)))) : reg105);
        end
      else
        begin
          reg106 <= (7'h41);
          reg107 <= reg111[(2'h2):(2'h2)];
          reg108 <= wire80;
          if (wire104)
            begin
              reg109 <= (reg90[(4'hc):(3'h4)] < reg88[(4'ha):(1'h1)]);
              reg110 <= wire91;
              reg111 <= {(&(~$signed((reg106 & reg112)))),
                  wire83[(3'h6):(2'h2)]};
              reg112 <= {(8'ha2)};
              reg113 <= wire102[(3'h7):(3'h7)];
            end
          else
            begin
              reg109 <= $signed(wire100);
              reg110 <= (wire84 ?
                  {(8'haa),
                      ((!$signed(reg90)) ?
                          {$signed(wire83)} : {$unsigned(wire79)})} : ($unsigned((~&$unsigned(reg90))) ?
                      wire86 : (8'hb3)));
              reg111 <= (8'haa);
            end
          reg114 <= (-$signed($signed($unsigned(reg113))));
        end
      reg115 <= $signed((wire102[(1'h1):(1'h1)] || (8'hbc)));
      reg116 <= $unsigned(((wire96[(3'h7):(2'h3)] ?
          $signed(reg115) : (~|(reg90 <<< wire83))) && {reg110[(1'h1):(1'h1)]}));
      if (wire83)
        begin
          reg117 <= wire81[(2'h2):(2'h2)];
          reg118 <= (~&wire80);
        end
      else
        begin
          reg117 <= (wire86 ?
              $signed(reg113) : ((^~$signed({reg105, wire102})) ?
                  $signed(wire82) : reg109[(4'h8):(1'h1)]));
          reg118 <= $signed({(reg115 ?
                  (!reg116[(4'hb):(3'h5)]) : ((+wire85) != reg116))});
          reg119 <= (~&((|{reg114[(3'h6):(1'h0)],
              $signed(reg116)}) | $signed($signed((wire79 ?
              reg110 : wire104)))));
          reg120 <= (8'h9f);
        end
    end
  assign wire121 = ((((~&$unsigned(reg119)) ?
                               $unsigned(((8'hb9) ~^ wire87)) : ($signed(wire87) * $signed(wire86))) ?
                           $unsigned((wire101[(1'h1):(1'h1)] > (8'haa))) : wire82[(3'h6):(3'h6)]) ?
                       ($unsigned((wire91[(4'hf):(2'h2)] ?
                           ((8'hbf) >= reg113) : $signed(wire101))) * reg110) : wire103);
endmodule

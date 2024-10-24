module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire29;
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire76,
                 wire49,
                 wire48,
                 wire47,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
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
                 (1'h0)};
  module4 #() modinst30 (.wire6(wire0), .wire7(wire1), .wire8(wire3), .clk(clk), .y(wire29), .wire9(wire2), .wire5((8'ha4)));
  assign wire31 = (^~wire29[(5'h13):(3'h7)]);
  assign wire32 = ($signed(($signed((wire3 * wire31)) + (+{wire29}))) > $signed(((wire2[(4'h8):(2'h3)] ^~ wire3) + wire1)));
  assign wire33 = wire3;
  assign wire34 = $unsigned(({$unsigned($signed(wire29))} ^~ $unsigned(wire29)));
  assign wire35 = wire32[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ($unsigned(($signed(wire0) ?
          $unsigned({wire3[(2'h2):(1'h1)],
              (wire35 ^~ (8'h9e))}) : (wire29[(4'hf):(4'hc)] < (~&wire29[(4'ha):(4'h9)])))))
        begin
          reg36 <= ((|$signed($unsigned((wire1 ? wire33 : (7'h43))))) ?
              (^~($signed((wire3 == wire1)) >>> {wire33,
                  ((8'hbc) ? wire2 : wire2)})) : (wire2 ?
                  wire34 : (wire3 <<< $signed({wire0}))));
        end
      else
        begin
          reg36 <= $signed($signed((~&(((7'h44) ? reg36 : wire29) | wire1))));
          reg37 <= $unsigned((({(wire31 < wire33),
              (-wire0)} <<< $unsigned((wire29 ?
              wire29 : wire0))) >>> wire31[(3'h7):(1'h0)]));
          reg38 <= reg36;
          reg39 <= (wire33 ? wire2[(5'h13):(4'ha)] : $signed((!(8'ha2))));
          if (({reg37, reg37} > {((~^((8'hbe) ? reg39 : reg39)) ?
                  $unsigned(wire29) : (+(^wire31))),
              ((|wire35) ?
                  ({wire31, wire3} ?
                      $signed(wire31) : wire29[(4'hc):(4'ha)]) : $signed((reg37 - wire0)))}))
            begin
              reg40 <= $signed(((~^($signed(wire33) ?
                      wire2[(3'h6):(3'h6)] : (reg37 & reg37))) ?
                  ((~&(wire35 ?
                      wire32 : wire29)) >> reg36[(4'h8):(2'h2)]) : (($signed(wire33) ?
                          (^wire32) : reg38) ?
                      $unsigned((wire0 ?
                          wire34 : wire2)) : $unsigned(wire32[(3'h5):(3'h5)]))));
              reg41 <= ({(!$unsigned((reg39 ? (8'h9d) : reg36)))} ?
                  $signed((reg38[(1'h1):(1'h1)] != $signed((wire33 ?
                      (8'hac) : reg37)))) : $unsigned($signed($signed($signed(reg39)))));
            end
          else
            begin
              reg40 <= wire32;
            end
        end
      reg42 <= ((~^wire32[(1'h0):(1'h0)]) >= wire29);
      if ((~|($signed(($unsigned(wire33) ?
              (|reg41) : (wire35 ? wire33 : wire1))) ?
          wire35 : ($signed($unsigned(wire1)) ?
              $unsigned(reg38[(4'h8):(4'h8)]) : (~^wire34[(4'hb):(3'h5)])))))
        begin
          reg43 <= {{(wire29 <<< (!reg38)),
                  ($unsigned((-reg38)) ?
                      {$signed(wire3), {reg37, reg38}} : $unsigned(wire31))}};
          reg44 <= wire35;
        end
      else
        begin
          reg43 <= {{reg42, {$unsigned(((7'h41) - (8'ha9)))}}};
          if (($signed(wire2) == wire32))
            begin
              reg44 <= wire2;
              reg45 <= wire34;
            end
          else
            begin
              reg44 <= (8'ha5);
            end
          reg46 <= $unsigned($unsigned(((~&(~^wire2)) && reg44)));
        end
    end
  assign wire47 = reg42[(3'h7):(3'h4)];
  assign wire48 = {$signed({{(reg42 ? wire2 : reg45)}, (8'ha3)})};
  assign wire49 = (-{{$unsigned($unsigned(wire0)),
                          (reg39[(3'h7):(2'h2)] ?
                              wire3[(4'h9):(3'h7)] : (wire31 == reg38))}});
  always
    @(posedge clk) begin
      if (($signed(reg37) ?
          ((!wire47) <<< (reg43 ?
              $signed($signed(wire29)) : $signed(reg37))) : $unsigned(($signed($signed(wire32)) ?
              $unsigned((wire33 <= (8'hb4))) : wire35))))
        begin
          reg50 <= $unsigned(reg38);
          reg51 <= (+($unsigned(($unsigned(reg46) ?
                  (|(8'hb7)) : $signed(wire32))) ?
              {$signed(reg44)} : ($unsigned($signed((7'h40))) != ((wire47 > reg44) ?
                  $signed(wire2) : {wire34}))));
          reg52 <= ($unsigned(((~((7'h42) ~^ reg42)) ?
              (&{wire31, reg40}) : ((reg50 ?
                  wire49 : wire31) + $signed(wire32)))) - reg42);
        end
      else
        begin
          if (reg45)
            begin
              reg50 <= reg52[(1'h0):(1'h0)];
            end
          else
            begin
              reg50 <= ((reg46 || reg41) && $unsigned($signed($signed((^reg46)))));
              reg51 <= $unsigned($unsigned({$unsigned(((7'h42) << (8'ha6))),
                  $unsigned(wire2)}));
              reg52 <= $signed((reg40 ^~ $signed($signed($signed((7'h43))))));
            end
          reg53 <= (reg44[(3'h4):(2'h3)] ? wire29[(1'h0):(1'h0)] : wire0);
          if (((+$unsigned(((~&reg51) + $signed((8'hb5))))) ?
              $signed($unsigned(((reg51 <= wire49) < reg38[(3'h4):(2'h3)]))) : wire31[(4'he):(4'h9)]))
            begin
              reg54 <= reg37;
              reg55 <= ({(((~(8'hbf)) * (reg36 >= reg42)) ?
                      (wire48 ?
                          $signed(wire33) : {wire1}) : $unsigned((reg45 | reg53))),
                  ($unsigned(reg51) ?
                      wire49[(5'h10):(4'h9)] : wire33[(4'hd):(4'h9)])} ^~ $signed((wire47[(2'h2):(2'h2)] <= ($signed(wire49) > {reg44}))));
              reg56 <= $signed((~|((^$signed(wire1)) << $signed((reg51 ?
                  reg37 : reg38)))));
              reg57 <= ($unsigned((8'hbf)) == reg37);
            end
          else
            begin
              reg54 <= $unsigned((reg54 ?
                  ((8'had) ?
                      wire32[(2'h2):(1'h0)] : (~|wire49[(1'h0):(1'h0)])) : $signed(((8'hb4) ?
                      (^wire2) : (&wire34)))));
              reg55 <= ((!$signed((^~$unsigned(wire31)))) ?
                  $unsigned(((~(8'ha2)) == reg43[(4'he):(4'h8)])) : reg39[(4'he):(4'ha)]);
            end
          reg58 <= {(wire3[(4'he):(3'h5)] ?
                  $signed(reg51[(1'h1):(1'h0)]) : (~((reg44 ? reg54 : reg50) ?
                      (reg53 ? wire33 : wire35) : $unsigned((8'ha8)))))};
        end
      reg59 <= ((8'ha9) != reg53[(1'h1):(1'h0)]);
      if ($unsigned(wire48[(2'h2):(1'h1)]))
        begin
          reg60 <= (~^(~|(8'hab)));
          reg61 <= ((($unsigned(wire32[(2'h3):(2'h2)]) >>> reg37) >> (~|reg39[(4'h9):(2'h2)])) <<< (8'ha6));
          reg62 <= {$signed(wire33),
              {{(~&(wire49 < wire29)), wire47},
                  ({$unsigned((8'hb6)), $unsigned(wire2)} ?
                      ((wire2 ? reg36 : (8'hbd)) ?
                          (reg53 >> wire1) : reg36[(4'h9):(3'h4)]) : (reg52[(4'h8):(3'h7)] != wire47[(4'hf):(3'h4)]))}};
        end
      else
        begin
          reg60 <= $unsigned($signed(({reg36} >>> $signed((reg46 ?
              wire29 : (7'h43))))));
          reg61 <= wire33;
          reg62 <= $unsigned((reg41[(5'h10):(3'h6)] < {($signed(reg52) < reg38)}));
        end
      reg63 <= {reg57,
          {((reg42 >> ((8'ha6) != reg41)) <<< (reg46 & $signed(reg59)))}};
      if ((!reg37))
        begin
          reg64 <= (~(((wire35[(1'h1):(1'h0)] ? reg56[(3'h6):(1'h0)] : wire49) ?
                  {$unsigned(reg62)} : $signed((^~reg37))) ?
              $signed(reg57[(1'h1):(1'h0)]) : (($signed(reg42) ^~ $signed((7'h44))) >> reg36)));
          reg65 <= reg36[(2'h3):(2'h3)];
          reg66 <= $unsigned($signed((wire29 != (-(reg39 | wire31)))));
        end
      else
        begin
          reg64 <= {reg64};
          reg65 <= reg41[(3'h6):(3'h4)];
          reg66 <= (((($unsigned(reg42) <= wire49[(4'hc):(3'h7)]) == ({reg51,
                      reg63} ~^ reg54[(3'h6):(1'h1)])) ?
                  (8'hb1) : $signed((!((8'ha8) * reg54)))) ?
              ((((+reg56) << (!reg44)) && $signed($signed(reg60))) ?
                  wire35 : ((~^(wire47 << wire48)) ?
                      ((reg66 ? reg51 : reg50) ? (~|reg59) : reg59) : (reg39 ?
                          (wire31 ? reg40 : wire31) : (reg43 ?
                              wire47 : reg62)))) : reg55);
        end
    end
  module67 #() modinst77 (wire76, clk, wire49, wire32, wire34, wire35);
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire71;
  input wire [(4'ha):(1'h0)] wire70;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire signed [(2'h2):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  assign y = {wire75, wire74, wire73, wire72, (1'h0)};
  assign wire72 = wire69[(3'h6):(2'h2)];
  assign wire73 = wire71;
  assign wire74 = ($unsigned((+({(8'ha7), wire72} <<< $signed(wire70)))) ?
                      $unsigned((|$signed($unsigned(wire69)))) : $unsigned((~(wire70 && wire68))));
  assign wire75 = {({wire71} ?
                          {wire69[(1'h1):(1'h1)],
                              ((&wire69) ?
                                  $signed(wire71) : $signed(wire70))} : (^(7'h40)))};
endmodule

module module4
#(parameter param28 = {(7'h44), (({((8'hac) ? (8'hbb) : (8'hb5)), ((7'h42) ? (7'h41) : (8'hb0))} | {((8'haa) >= (8'hb3)), ((8'hb7) - (7'h40))}) ? (~|(((8'hb2) ? (8'hb6) : (8'hbe)) ? (+(8'hb8)) : (~|(8'hbb)))) : ((+((8'hb9) ? (8'hab) : (8'ha2))) ? (((8'hac) ? (7'h43) : (8'h9e)) ? ((8'ha2) < (8'hb5)) : ((8'ha1) & (7'h42))) : (8'hbb)))})
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire11,
                 wire10,
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
                 (1'h0)};
  assign wire10 = ({(+(!(wire9 <<< wire9)))} ?
                      (&wire6[(3'h4):(2'h3)]) : (((wire8 ?
                              {(7'h42), wire6} : (wire6 ?
                                  wire8 : wire9)) <= wire5) ?
                          ($unsigned(wire5) ?
                              $unsigned($signed(wire6)) : wire6[(3'h5):(2'h2)]) : (~$unsigned(wire6))));
  assign wire11 = {(8'ha5),
                      $unsigned(((wire10 ?
                              $unsigned(wire7) : wire9[(4'h9):(4'h8)]) ?
                          (~^(~&wire9)) : $signed(wire5[(3'h7):(1'h0)])))};
  always
    @(posedge clk) begin
      reg12 <= {wire5[(4'he):(1'h1)]};
      if ((wire10 ?
          $signed($unsigned(wire10[(4'hf):(4'h9)])) : $unsigned($signed(wire11[(1'h1):(1'h1)]))))
        begin
          reg13 <= (wire9 ~^ wire6[(3'h4):(1'h0)]);
          reg14 <= (((~^((wire7 ? wire6 : wire6) * wire9[(4'hb):(4'ha)])) ?
                  {((wire10 ? wire9 : wire9) ? $signed(wire9) : (&(8'ha9))),
                      $unsigned(reg12[(2'h2):(1'h0)])} : ($unsigned($unsigned(wire6)) ?
                      wire8 : (8'hb0))) ?
              wire11[(2'h2):(1'h0)] : $signed($signed($signed((^wire8)))));
          if ((|((~^(((8'ha6) || reg12) ? $unsigned(wire11) : wire6)) ?
              wire6[(3'h5):(1'h1)] : (($signed(reg14) ? wire8 : wire11) ?
                  ((wire6 ?
                      wire5 : reg14) >> (reg13 <<< wire11)) : ((wire7 << wire9) ?
                      $signed(reg14) : ((8'hbb) ^ (8'hb3)))))))
            begin
              reg15 <= wire5;
            end
          else
            begin
              reg15 <= ((($signed($unsigned(wire7)) <= wire7[(4'h8):(3'h5)]) ?
                  (^($signed(reg13) != $signed(wire6))) : $unsigned(($signed(reg13) != $unsigned(wire10)))) & (~(~^wire8)));
            end
          reg16 <= $signed((8'ha3));
          if ({$signed(wire8[(4'he):(4'hb)]), (~$unsigned((|wire5)))})
            begin
              reg17 <= $unsigned((|($unsigned({wire9, (8'hae)}) ?
                  $unsigned(wire8[(4'hd):(3'h7)]) : $signed((&reg16)))));
              reg18 <= $signed((!wire10));
              reg19 <= wire5;
              reg20 <= $signed((reg16 && reg17[(4'h8):(1'h1)]));
              reg21 <= wire10;
            end
          else
            begin
              reg17 <= $signed((!((wire11[(1'h0):(1'h0)] ?
                  $signed((8'hbb)) : (wire10 ?
                      (8'ha9) : wire6)) + ((reg17 > wire5) ?
                  (-wire5) : {reg19}))));
              reg18 <= (($signed($signed((^wire9))) ?
                      ((reg15 - reg13[(2'h2):(2'h2)]) << reg14[(1'h1):(1'h0)]) : reg13) ?
                  $unsigned(({(reg20 <= reg14),
                      (reg15 || wire10)} >>> $signed(reg19))) : $signed($unsigned(((-reg15) ?
                      {reg14} : (reg12 & (8'hba))))));
              reg19 <= (((~&$unsigned(((8'hb3) > wire9))) ?
                  ($unsigned((reg17 << reg21)) ?
                      ((&wire11) > (^wire5)) : ((wire6 ?
                          reg18 : reg19) > $signed((8'h9e)))) : $signed(((reg17 << wire7) > wire10[(2'h3):(1'h1)]))) * ($signed(reg20) + reg12));
            end
        end
      else
        begin
          reg13 <= (((8'ha9) != $unsigned(($signed((8'h9d)) >= $signed(reg16)))) < ($unsigned(wire7[(4'hf):(3'h4)]) ?
              {{$unsigned(reg13)}, reg18} : reg21));
          reg14 <= ((reg17[(1'h1):(1'h1)] + (reg13[(3'h7):(3'h7)] ?
              $unsigned((&(8'h9e))) : ({reg19} <<< (+(8'haa))))) || ($signed(((+reg17) ?
              (^~reg17) : $unsigned(wire10))) == $signed(reg12)));
        end
      reg22 <= {reg17,
          (reg16[(2'h3):(2'h2)] ?
              {(reg20[(2'h3):(1'h1)] ?
                      (8'haa) : (reg18 ? wire8 : reg18))} : (8'hb8))};
      reg23 <= $unsigned((wire6[(1'h0):(1'h0)] >>> reg12[(4'he):(4'hd)]));
    end
  assign wire24 = reg16;
  assign wire25 = $unsigned(reg13[(1'h1):(1'h0)]);
  assign wire26 = {reg20[(4'hb):(4'hb)],
                      $unsigned({{(wire6 < (8'hb3))}, wire5[(4'he):(4'h9)]})};
  assign wire27 = wire11;
endmodule

module top
#(parameter param76 = (~^(((((8'hbe) != (8'haa)) ? ((8'hb4) + (8'hba)) : ((8'ha5) < (8'ha6))) ? {(^(8'ha6)), ((7'h40) ? (8'hac) : (8'h9e))} : (+((8'ha2) ? (8'ha4) : (8'h9d)))) ? ((((8'h9c) ? (8'had) : (8'haf)) | ((8'hb8) || (8'hb3))) ? ((|(7'h44)) < ((8'ha4) * (8'ha2))) : (+{(8'haf)})) : ({(8'hb1), (+(8'ha9))} ^ {((8'ha4) ^ (8'h9f))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire73;
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire75,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire73,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {($signed(((wire2 ? wire4 : (7'h42)) ?
                  wire2[(2'h3):(1'h0)] : {(8'hbd)})) ?
              ((^(-(8'h9c))) ?
                  {((7'h43) ? wire3 : wire1)} : (wire4[(2'h3):(1'h1)] ?
                      (^~(8'ha2)) : wire1)) : ((wire4[(1'h0):(1'h0)] && wire4[(3'h6):(3'h4)]) != ((wire0 & wire0) | $signed(wire1))))};
      reg6 <= $signed((8'hb0));
    end
  assign wire7 = (wire2 == wire0[(1'h1):(1'h0)]);
  assign wire8 = (wire2 ? {$unsigned(reg6[(1'h1):(1'h1)])} : wire4);
  assign wire9 = $unsigned((wire8 & $unsigned(wire4[(2'h2):(2'h2)])));
  assign wire10 = wire2;
  assign wire11 = wire4[(3'h6):(2'h3)];
  assign wire12 = {$unsigned((wire11[(1'h1):(1'h0)] | wire2[(3'h6):(1'h1)]))};
  assign wire13 = ($unsigned($signed(reg5)) ? wire0 : $unsigned(wire8));
  assign wire14 = (~($signed(((!wire4) ?
                      (|reg5) : (wire8 & (8'hbb)))) | (7'h43)));
  assign wire15 = ($signed(($signed(wire4[(4'hd):(3'h5)]) ?
                      (-$unsigned(wire1)) : $unsigned((wire4 - wire4)))) ^ wire13);
  assign wire16 = $signed(wire7);
  assign wire17 = {wire3};
  assign wire18 = $signed({((~(wire4 == (8'hbc))) * (&$signed(wire4))),
                      ((wire16[(2'h2):(2'h2)] ? $unsigned(wire4) : (-(8'hbe))) ?
                          wire16[(1'h1):(1'h0)] : (^wire4[(4'hd):(1'h0)]))});
  assign wire19 = $signed(((+$unsigned($unsigned(wire8))) ?
                      (wire0[(2'h2):(2'h2)] ?
                          wire2[(4'h8):(3'h4)] : wire15[(1'h0):(1'h0)]) : (!reg6)));
  module20 #() modinst74 (.wire25(wire18), .wire23(wire14), .clk(clk), .wire24(wire3), .wire22(wire1), .y(wire73), .wire21(wire19));
  assign wire75 = $unsigned(wire15);
endmodule

module module20
#(parameter param71 = (~(((|(&(7'h44))) ? {((8'hac) ? (8'hb9) : (8'h9c))} : {((8'h9f) | (8'hbe)), ((8'ha1) ? (8'hb1) : (7'h40))}) ? ((&((8'ha9) ? (8'hbc) : (7'h42))) == (^~((8'ha6) ? (8'h9e) : (8'hae)))) : {(-{(8'h9e), (8'hb8)}), (-((8'ha6) ? (8'hbb) : (7'h40)))})), 
parameter param72 = (!(-param71)))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire24;
  input wire [(2'h3):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire26;
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire39,
                 wire26,
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
                 (1'h0)};
  assign wire26 = wire21;
  always
    @(posedge clk) begin
      reg27 <= $unsigned(((~|wire22[(1'h1):(1'h1)]) ?
          (wire22[(2'h2):(1'h0)] << (|(wire24 ?
              (8'ha2) : wire21))) : wire25[(2'h2):(1'h0)]));
      reg28 <= $signed(($signed((wire26 ? ((8'hb6) <= wire24) : (8'ha2))) ?
          (!wire26[(2'h3):(2'h3)]) : (^~wire25[(4'h8):(3'h6)])));
      if (wire26[(4'hf):(4'h9)])
        begin
          reg29 <= $signed(wire22);
          if ($signed($unsigned({(reg28 || wire26)})))
            begin
              reg30 <= (((~&{$signed((8'ha0)), (reg28 == wire25)}) ?
                      (!reg28) : (wire25[(4'h8):(4'h8)] + reg28[(1'h0):(1'h0)])) ?
                  wire25[(3'h4):(1'h1)] : wire23[(1'h0):(1'h0)]);
              reg31 <= $unsigned((reg30 ?
                  ((+(^wire24)) ^~ (reg29[(2'h2):(1'h0)] * wire24)) : wire25[(4'ha):(3'h7)]));
              reg32 <= (reg31 ? reg31 : (&(~^reg31[(2'h3):(2'h2)])));
              reg33 <= $unsigned(reg32[(3'h6):(1'h0)]);
            end
          else
            begin
              reg30 <= $signed({(&reg29[(1'h0):(1'h0)]), $signed(reg32)});
              reg31 <= (({reg33} == reg31[(3'h5):(3'h5)]) ?
                  (reg27 ?
                      (((+(8'hb6)) & $signed(wire24)) ^ (^~reg33)) : ($signed($signed(reg28)) - ($unsigned(reg27) ?
                          reg32[(3'h4):(2'h2)] : $signed(reg33)))) : ({$unsigned(((8'h9c) ?
                          wire24 : wire26)),
                      $signed(wire24[(3'h5):(2'h2)])} ^ reg31[(2'h2):(2'h2)]));
              reg32 <= ($signed($signed($signed((~&reg31)))) ?
                  reg30[(3'h5):(2'h3)] : {(&{((8'ha9) & reg29),
                          (reg28 ? reg32 : (8'h9f))}),
                      (+$unsigned($unsigned(reg29)))});
              reg33 <= wire26;
            end
          reg34 <= (8'hba);
          if (reg34)
            begin
              reg35 <= ((reg34 ?
                  (reg29[(1'h0):(1'h0)] >>> $unsigned((reg30 < (8'ha8)))) : $unsigned((reg31[(4'h8):(2'h2)] ?
                      (+reg29) : (8'hb9)))) ~^ $unsigned((&reg27[(4'hc):(4'hb)])));
              reg36 <= wire25;
            end
          else
            begin
              reg35 <= $signed($unsigned($signed(($unsigned((8'ha4)) ^~ ((7'h42) ?
                  reg29 : reg35)))));
              reg36 <= ($unsigned(reg32[(1'h0):(1'h0)]) ?
                  {(reg34[(3'h7):(3'h6)] <= ((|reg33) <<< $unsigned((8'hb1)))),
                      $unsigned((reg31[(3'h7):(1'h1)] ^~ $unsigned(reg29)))} : ({reg28[(1'h1):(1'h1)],
                          reg31} ?
                      reg33 : $signed(((wire23 ?
                          wire24 : (8'ha7)) + wire22[(4'hb):(3'h6)]))));
              reg37 <= ((8'ha6) >> (~reg34));
              reg38 <= reg27;
            end
        end
      else
        begin
          reg29 <= (|((reg29[(2'h2):(1'h1)] ?
              $signed((reg30 ?
                  wire21 : reg36)) : $unsigned($signed(wire26))) | wire26));
          reg30 <= $signed((8'ha7));
          reg31 <= {($unsigned($unsigned($signed(reg34))) ?
                  $unsigned(({wire23} ?
                      $unsigned(reg28) : (wire24 && reg33))) : reg34[(4'hb):(2'h3)]),
              (~wire22[(4'ha):(3'h4)])};
        end
    end
  assign wire39 = $unsigned((&(reg37 || ((reg30 ? (8'hb4) : wire24) ?
                      $unsigned(reg29) : wire26))));
  always
    @(posedge clk) begin
      reg40 <= wire26[(4'hc):(3'h6)];
      if (((wire25 == $unsigned(reg29[(1'h0):(1'h0)])) ?
          ($unsigned((-wire23)) < (^reg31[(1'h0):(1'h0)])) : ((~^($unsigned(reg27) <<< $signed(reg35))) != $signed({$unsigned(reg27),
              (wire26 < (8'hb0))}))))
        begin
          reg41 <= ({((7'h44) ?
                      (reg40 ?
                          (reg29 > reg30) : reg38[(4'hb):(4'h9)]) : reg40)} ?
              reg27 : (((reg36[(1'h1):(1'h1)] ?
                      ((8'hbe) ?
                          wire39 : reg37) : $signed(wire23)) == ($signed(reg27) - reg33)) ?
                  ({reg33} > (!((8'ha6) << reg29))) : reg38));
          reg42 <= ($unsigned(((~&wire25) ?
              reg33 : wire26[(3'h7):(3'h7)])) >> reg36[(1'h1):(1'h0)]);
          if ($signed($signed((($unsigned(reg32) < (~&wire39)) ?
              (-$unsigned(reg28)) : ((|reg30) ? reg28 : $signed(reg30))))))
            begin
              reg43 <= reg28[(3'h4):(2'h3)];
              reg44 <= $unsigned({({wire22[(2'h3):(2'h2)]} ?
                      (^~(reg31 ? (8'hb8) : reg41)) : ($signed(reg32) ?
                          (&(7'h40)) : reg29)),
                  {((wire25 <= wire39) >= (~|(8'ha4))),
                      $unsigned((reg28 ^~ wire39))}});
            end
          else
            begin
              reg43 <= $unsigned(((~|(~|(^reg34))) ?
                  (reg43 != $unsigned($signed(reg36))) : $signed(reg34[(3'h5):(3'h5)])));
              reg44 <= (~^(8'ha4));
              reg45 <= ((7'h44) ?
                  (8'hb6) : (&(((reg35 ? wire25 : reg32) ?
                          (reg35 == reg36) : ((8'hb1) | reg36)) ?
                      $signed(wire26) : reg37[(2'h3):(1'h1)])));
              reg46 <= $unsigned(reg44);
              reg47 <= $unsigned(((&reg27) && (~(~|$signed(wire39)))));
            end
        end
      else
        begin
          reg41 <= $unsigned((~&reg30[(4'hc):(4'h8)]));
          if ((wire21 >= $unsigned(reg27[(4'hc):(3'h6)])))
            begin
              reg42 <= $signed((~^reg44));
              reg43 <= reg27;
              reg44 <= ((|$unsigned((reg42[(4'hd):(4'hb)] ?
                      $unsigned(reg45) : reg36[(2'h2):(1'h1)]))) ?
                  reg47[(4'hb):(4'ha)] : $signed(reg47));
            end
          else
            begin
              reg42 <= {reg47[(2'h2):(2'h2)]};
              reg43 <= $unsigned((((!$signed(reg34)) ?
                      (|$unsigned(wire39)) : wire23) ?
                  {((|reg38) << $unsigned((8'hab)))} : (reg28 * (&$signed((8'ha0))))));
              reg44 <= $signed((((&$signed(reg41)) && ((reg44 ?
                  reg35 : wire24) >> $signed(wire25))) & $signed(wire39[(3'h6):(1'h1)])));
              reg45 <= $signed(((~|(reg31 ?
                      (&wire39) : (wire26 ? reg33 : reg42))) ?
                  ((reg41 ? {wire26, reg46} : {wire23, (8'hb0)}) ?
                      ($signed(wire22) == (reg29 ~^ reg32)) : reg30) : reg30[(4'h8):(1'h0)]));
              reg46 <= (7'h42);
            end
          if ((~&wire26[(4'hd):(4'h8)]))
            begin
              reg47 <= ((-$unsigned(($signed(reg30) >= $signed(wire25)))) ?
                  reg44[(4'h9):(2'h2)] : (~|(8'hbf)));
              reg48 <= ((~$signed(reg36)) && (reg43 ?
                  reg46[(1'h0):(1'h0)] : (reg29 ?
                      {(8'haa), {reg40}} : $signed($unsigned(reg33)))));
              reg49 <= (reg28[(4'h9):(3'h7)] ? reg43 : $signed(reg28));
              reg50 <= ($unsigned((~wire21)) ?
                  ((^reg40[(1'h0):(1'h0)]) ?
                      $signed((~^(reg45 <= reg45))) : ((reg36 != $unsigned((8'ha5))) ?
                          (8'hb8) : $unsigned($unsigned(reg45)))) : (reg41 ?
                      $unsigned(reg47[(4'hd):(1'h0)]) : $unsigned(reg49)));
              reg51 <= ({((reg46[(4'h8):(3'h5)] ? wire25 : (+reg48)) ?
                          (^~(reg30 ? reg35 : reg38)) : reg35[(2'h2):(1'h1)])} ?
                  reg41 : (reg36[(3'h4):(1'h0)] | {(~|{reg44, reg40})}));
            end
          else
            begin
              reg47 <= ($signed(({wire23} ~^ ((wire24 << wire39) != $unsigned(reg36)))) == reg50[(3'h7):(2'h2)]);
              reg48 <= (&(~&$unsigned(reg42[(2'h2):(1'h0)])));
              reg49 <= $unsigned($signed((!((+reg40) ?
                  $unsigned(wire24) : (wire21 ^~ reg28)))));
              reg50 <= {$signed((reg29[(1'h1):(1'h1)] ?
                      $signed($signed(reg37)) : $unsigned((reg33 ?
                          reg38 : reg43))))};
            end
          if (((~|(|$unsigned($unsigned(reg31)))) < $signed(reg45)))
            begin
              reg52 <= (~$signed(((wire25 | wire24[(1'h0):(1'h0)]) ?
                  reg43 : {reg44, (~reg31)})));
              reg53 <= (wire22 == (~^($signed((~^reg44)) > reg41[(2'h3):(2'h3)])));
              reg54 <= $unsigned($signed((|$unsigned(wire21))));
              reg55 <= (&reg42[(4'hb):(1'h1)]);
              reg56 <= ((+($signed((wire25 ? reg28 : reg45)) ^~ {(reg49 ?
                          reg52 : reg42)})) ?
                  $unsigned((((&reg48) ?
                          reg37[(2'h3):(2'h2)] : $signed((7'h43))) ?
                      $unsigned((!reg49)) : $signed(wire24))) : ((reg53 ?
                          ((reg43 ?
                              reg53 : reg34) << reg54) : $signed($signed(reg44))) ?
                      $unsigned(((~|reg29) ?
                          reg30 : $signed(wire24))) : reg40[(2'h3):(2'h2)]));
            end
          else
            begin
              reg52 <= $unsigned(reg36);
            end
          if ($unsigned(({reg34[(4'hb):(2'h2)]} ?
              (+reg48) : (+($unsigned((8'hb7)) ?
                  ((8'h9e) ? wire23 : reg41) : reg38[(4'hb):(3'h6)])))))
            begin
              reg57 <= reg34;
              reg58 <= reg28;
              reg59 <= $unsigned((|$unsigned($signed((reg37 != reg28)))));
            end
          else
            begin
              reg57 <= reg56;
              reg58 <= reg55[(2'h2):(2'h2)];
              reg59 <= (((~|{(8'had)}) + wire23[(1'h1):(1'h0)]) ?
                  (~&reg27[(1'h0):(1'h0)]) : wire23[(1'h0):(1'h0)]);
            end
        end
      reg60 <= ($unsigned($unsigned((8'hbd))) ?
          (~|(~(reg31 ? reg29 : $signed((8'ha1))))) : (~|($signed((&reg57)) ?
              (^$unsigned(reg58)) : reg53[(3'h6):(3'h4)])));
      reg61 <= (reg58[(1'h0):(1'h0)] ?
          $unsigned((~$unsigned($unsigned(reg40)))) : (-$signed($signed(reg32))));
      if ((($unsigned($signed(wire39[(4'ha):(2'h2)])) ^ {({(8'had)} >= (^reg30))}) ?
          $signed($signed(((reg27 ?
              reg51 : (8'ha3)) + (~reg55)))) : {(^~$signed($unsigned(reg51)))}))
        begin
          reg62 <= reg47;
          reg63 <= (^~(((8'hb6) ? $unsigned(reg59) : $signed(reg30)) ?
              (~|$signed((reg46 >>> reg38))) : (&(8'had))));
          reg64 <= (^{$signed(((+reg29) ?
                  (reg63 >>> reg29) : ((8'h9c) + (8'ha0)))),
              ($unsigned((reg53 >> (8'hba))) ?
                  $signed((reg32 ?
                      reg51 : reg30)) : ($unsigned(reg31) >> (^~reg58)))});
        end
      else
        begin
          reg62 <= reg30;
          reg63 <= reg40[(1'h1):(1'h1)];
          reg64 <= $unsigned(($unsigned(wire24) >= reg38));
          reg65 <= reg27;
          reg66 <= (8'had);
        end
    end
  assign wire67 = reg31;
  assign wire68 = reg37[(1'h1):(1'h1)];
  assign wire69 = $unsigned(reg56[(3'h7):(1'h0)]);
  assign wire70 = $signed({$signed(reg28[(4'ha):(3'h5)]),
                      {reg66[(3'h4):(2'h2)]}});
endmodule

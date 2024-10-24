module top
#(parameter param76 = ({(8'haa), (!({(7'h44), (7'h42)} ? ((7'h44) ? (8'hb7) : (8'hb5)) : (+(8'ha2))))} ? (({((8'hb1) < (8'hb9)), (&(8'h9d))} ? (-((8'hbf) ~^ (8'hab))) : (^((8'hb6) <<< (8'h9d)))) ^~ (~|(^((8'ha8) < (8'ha5))))) : ((&((^~(8'hbf)) ? (|(8'hb2)) : ((8'ha1) ~^ (8'ha4)))) ? (+(&(!(8'hb5)))) : ({((8'hb8) > (8'hb0))} ? {((8'h9d) ? (7'h42) : (7'h40))} : (8'hac)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire73;
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire75,
                 wire14,
                 wire73,
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
      reg4 <= ($signed((^((~|wire3) ^ (wire1 ?
          wire2 : wire0)))) + $unsigned($signed($signed(((8'hb8) <= wire0)))));
      reg5 <= $unsigned(($signed({wire2,
          $signed(wire2)}) >>> $unsigned(reg4[(4'hf):(2'h3)])));
      reg6 <= $signed($signed(reg4));
      if (($signed((wire3[(2'h3):(2'h2)] ? (8'hab) : wire3)) ?
          (reg5 == $unsigned(reg4)) : (+reg4)))
        begin
          reg7 <= ($signed(((~^(reg4 ? reg4 : wire1)) ?
              (wire3[(5'h11):(3'h7)] * (8'hb0)) : $signed((wire1 - wire2)))) << (reg6[(1'h1):(1'h0)] ?
              $signed(wire0) : wire2));
          reg8 <= (((((~&reg7) ~^ reg6[(4'hf):(4'h8)]) ?
              $unsigned($unsigned(reg6)) : ({reg4} ^~ (wire0 != (8'hbb)))) <= $signed($signed($signed(reg5)))) <<< (|($signed((wire3 ?
                  (8'ha6) : wire3)) ?
              reg7[(1'h0):(1'h0)] : wire0[(2'h3):(2'h3)])));
          reg9 <= $signed((^(reg5[(3'h4):(3'h4)] ^~ wire3)));
          if ((reg6 ?
              reg8[(4'hb):(4'h8)] : ($unsigned($unsigned((reg5 ?
                      wire2 : reg4))) ?
                  (((wire1 ? wire3 : wire0) ? $unsigned(reg6) : (|reg9)) ?
                      $signed($signed(reg7)) : $signed((reg8 ?
                          wire1 : (8'hac)))) : ((!(wire0 ? reg9 : wire3)) ?
                      $unsigned({reg7}) : $unsigned($unsigned(wire0))))))
            begin
              reg10 <= reg7;
              reg11 <= ((8'hb9) > (({(reg5 ? wire0 : wire1), $unsigned(reg4)} ?
                  $unsigned(reg8) : (~|$unsigned(wire2))) >= {{((8'haa) * wire0)},
                  $signed((~|reg5))}));
            end
          else
            begin
              reg10 <= $signed((|reg5));
              reg11 <= (~^reg11[(5'h13):(3'h4)]);
              reg12 <= (wire0 ?
                  wire2[(1'h0):(1'h0)] : (reg11[(4'hd):(3'h5)] ?
                      ($unsigned((wire2 ? (8'hb8) : wire0)) ?
                          (((8'ha5) ? reg9 : reg6) ?
                              (reg4 << reg6) : (reg9 + wire1)) : (~&(8'h9f))) : (~|((~|reg4) ?
                          (reg10 - (7'h44)) : $signed((8'hae))))));
            end
        end
      else
        begin
          reg7 <= reg11;
        end
      reg13 <= $unsigned(reg12[(1'h0):(1'h0)]);
    end
  assign wire14 = ($unsigned((((~|reg13) <<< (8'hbb)) <<< reg12[(3'h4):(2'h3)])) ?
                      ({{wire2},
                          (wire2[(3'h6):(3'h5)] & reg10[(4'hb):(2'h3)])} >>> reg9[(1'h1):(1'h1)]) : (~reg5[(3'h4):(2'h3)]));
  module15 #() modinst74 (wire73, clk, wire3, wire2, wire1, reg6, reg8);
  assign wire75 = ({((~|reg5) ?
                              (&reg7[(4'hd):(3'h5)]) : ({(8'hba), reg7} ?
                                  (wire0 ? wire1 : reg5) : (&wire73))),
                          ((reg8 ~^ (reg12 == reg8)) ^~ (+{wire3, reg11}))} ?
                      reg12 : $unsigned((((8'hb7) >> $signed(reg9)) ?
                          $signed({wire0}) : wire2)));
endmodule

module module15
#(parameter param72 = {((+(((8'h9f) != (8'hbc)) ? ((8'haf) <<< (8'hb3)) : ((8'hb1) ^ (8'ha7)))) ? ((+((8'ha2) && (8'ha5))) ^~ ({(8'h9d), (8'ha4)} ? (~&(8'hb4)) : ((8'hb2) ~^ (8'h9d)))) : ({((7'h44) ? (8'ha8) : (8'hab)), ((8'hb3) ? (8'ha3) : (8'hb4))} * (((8'ha8) ? (7'h44) : (8'ha9)) >>> ((8'hb4) >> (8'ha1))))), ((((8'hae) - ((8'hbd) >>> (8'hb3))) && (((8'hbd) ~^ (8'ha8)) <<< {(8'ha7), (8'hbd)})) + (^{((8'ha9) >>> (8'h9d))}))})
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire68;
  assign y = {wire71,
                 wire70,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire68,
                 (1'h0)};
  assign wire21 = $signed(wire20[(3'h4):(3'h4)]);
  assign wire22 = ($unsigned(((wire21 ?
                          {wire17} : (!wire17)) + $unsigned(wire16))) ?
                      $unsigned((8'hb1)) : (($signed($signed(wire19)) ?
                          {(~^wire18)} : wire21[(1'h1):(1'h0)]) >> (((wire19 & wire16) << {(8'hb5),
                          wire17}) == $unsigned((!wire18)))));
  assign wire23 = $signed(wire21);
  assign wire24 = ((wire23 ? wire16 : (|$signed(wire21[(2'h2):(1'h1)]))) ?
                      (8'hb6) : wire23[(4'h8):(2'h2)]);
  assign wire25 = wire24;
  assign wire26 = (wire17 ?
                      wire19 : ($signed(wire24) ~^ $signed($signed({wire16}))));
  assign wire27 = ((8'hb6) + (wire21 - $signed(wire21[(1'h0):(1'h0)])));
  assign wire28 = wire24;
  module29 #() modinst69 (wire68, clk, wire19, wire26, wire28, wire21, wire27);
  assign wire70 = (wire20[(4'h8):(3'h5)] ?
                      $signed((^$unsigned(wire25[(4'hb):(1'h0)]))) : $unsigned($signed((((8'ha1) ?
                              wire22 : (8'hb4)) ?
                          $signed(wire27) : $unsigned((7'h44))))));
  assign wire71 = ((($unsigned($unsigned(wire20)) ?
                              (~^wire19[(3'h5):(2'h3)]) : wire17) ?
                          wire28[(1'h0):(1'h0)] : $unsigned(wire17)) ?
                      wire25[(2'h2):(2'h2)] : (~|(($unsigned(wire25) <<< wire19[(4'hd):(3'h5)]) ?
                          $unsigned((~^wire17)) : {$unsigned(wire28),
                              (wire16 & wire68)})));
endmodule

module module29
#(parameter param66 = ((~(|(|(^(7'h44))))) ? {(~|(+(|(8'hb5)))), ({((8'hbd) ? (8'hbf) : (8'h9e))} != (~|((8'hb3) ? (8'hb1) : (8'hae))))} : (^(((+(8'had)) ? ((8'ha1) ? (7'h43) : (8'hbd)) : (^~(7'h42))) ? (((8'haa) << (8'hbd)) == ((8'hbf) ? (8'ha5) : (7'h44))) : {((8'haa) <= (8'ha2))}))), 
parameter param67 = ({(((8'hbc) ? {param66} : (param66 <<< param66)) == ((-param66) - (param66 ? param66 : (8'ha1))))} ? param66 : ((~^(|param66)) ^~ (^(^param66)))))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire signed [(5'h14):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((|({$signed((^~wire30)), wire32[(1'h0):(1'h0)]} ^~ ((^{wire32,
              (8'ha1)}) ?
          wire31[(5'h12):(3'h4)] : (8'hb6)))))
        begin
          if (($signed((wire34 ?
                  ($signed(wire34) == (~^wire32)) : ($signed(wire31) ^~ wire30[(2'h3):(1'h0)]))) ?
              $signed((wire32[(2'h3):(1'h0)] != wire33)) : $unsigned((8'ha9))))
            begin
              reg35 <= wire32[(4'he):(4'hb)];
            end
          else
            begin
              reg35 <= $signed(wire32[(3'h4):(3'h4)]);
            end
          if ($signed($unsigned((wire31[(1'h0):(1'h0)] ^~ ((~|wire34) ^~ $unsigned(reg35))))))
            begin
              reg36 <= reg35;
              reg37 <= $signed($unsigned((((reg35 < wire34) ?
                      $unsigned(wire32) : (&wire34)) ?
                  ((reg35 ? (8'ha1) : (8'ha7)) ?
                      $signed(wire32) : reg35) : ({wire32,
                      wire34} + $unsigned(wire34)))));
            end
          else
            begin
              reg36 <= reg37;
            end
          if ({($signed((^~$signed(wire32))) ^ ((^(wire34 ?
                  wire31 : wire30)) ~^ (reg36 >> (wire33 ? wire30 : wire32)))),
              $unsigned($unsigned(reg36[(3'h7):(1'h0)]))})
            begin
              reg38 <= $signed((~(wire30[(1'h1):(1'h0)] ?
                  (!reg37[(3'h5):(3'h4)]) : wire32)));
              reg39 <= (^~$unsigned(wire30));
              reg40 <= (wire33[(1'h0):(1'h0)] ?
                  (~^(wire30 * {(-reg38)})) : (|(wire32 <= (|(|(8'hb6))))));
              reg41 <= reg38;
              reg42 <= (~|(~|((~&$unsigned(wire32)) != $signed($unsigned(wire32)))));
            end
          else
            begin
              reg38 <= {($unsigned($unsigned(reg42[(2'h2):(1'h0)])) ^~ {reg38,
                      ((wire33 ? wire32 : (8'hb4)) ?
                          $signed(wire32) : $unsigned(reg38))})};
              reg39 <= {(^~(reg42[(1'h1):(1'h0)] ?
                      {wire31[(5'h13):(5'h12)]} : (reg37[(3'h6):(1'h1)] ?
                          ((8'ha7) < reg38) : $signed(wire34))))};
              reg40 <= $signed((({{reg39}} ?
                  (8'had) : reg38) < (-(reg40[(2'h2):(1'h1)] ?
                  {reg37, reg36} : $unsigned(wire33)))));
              reg41 <= (~{{(-wire34[(4'hc):(4'h9)]), {reg35[(4'h9):(3'h5)]}}});
              reg42 <= $signed({reg35[(2'h3):(1'h0)],
                  $unsigned(($unsigned(wire33) ?
                      $unsigned(wire34) : $unsigned(wire32)))});
            end
          reg43 <= wire33;
        end
      else
        begin
          reg35 <= $signed($signed(((7'h44) == $signed($unsigned(reg41)))));
          if ((8'h9f))
            begin
              reg36 <= $signed(reg38);
            end
          else
            begin
              reg36 <= (!reg35[(1'h1):(1'h0)]);
              reg37 <= ($unsigned(reg36[(3'h4):(3'h4)]) ?
                  $unsigned(((^(^wire30)) ?
                      ({(8'hba), reg43} ?
                          $signed((8'hbc)) : (~&reg35)) : $signed($signed(wire30)))) : $unsigned((((~^wire33) ?
                      reg42 : {(8'ha9),
                          wire34}) >> $signed($unsigned(reg37)))));
              reg38 <= {(reg36[(2'h3):(1'h0)] ?
                      (8'ha4) : (wire33 ?
                          {$unsigned((7'h40)),
                              (reg42 * reg39)} : ($signed((8'haf)) ?
                              (reg36 ? wire33 : (8'ha6)) : {reg40}))),
                  ((reg38[(2'h3):(2'h3)] ?
                      reg37 : (reg35 >>> wire30[(1'h1):(1'h0)])) >= (|{wire32[(2'h3):(2'h3)]}))};
              reg39 <= wire33;
            end
          reg40 <= $unsigned(reg41[(2'h3):(1'h0)]);
        end
      reg44 <= $signed({($unsigned(wire32) ? reg43[(4'h9):(3'h4)] : reg43)});
    end
  assign wire45 = $unsigned(wire30[(2'h2):(1'h0)]);
  assign wire46 = $signed(reg43[(4'hc):(4'h9)]);
  assign wire47 = wire34[(4'h8):(2'h2)];
  assign wire48 = ((^(reg38[(3'h4):(1'h1)] ?
                      reg42 : $signed((wire32 ?
                          reg44 : wire30)))) >= (&wire32[(4'hb):(3'h6)]));
  assign wire49 = (($unsigned(($signed(wire32) ?
                      $unsigned((8'hbf)) : wire46[(4'hd):(1'h1)])) >= $signed(wire32)) >= {wire34[(4'hf):(4'hb)],
                      $signed($unsigned((reg36 ? reg44 : reg42)))});
  assign wire50 = reg35[(4'ha):(4'ha)];
  assign wire51 = ($unsigned(reg35) || (~|(reg40[(3'h6):(3'h6)] ?
                      ($signed(wire46) ?
                          $signed(wire48) : reg36) : $signed(wire47))));
  assign wire52 = $unsigned($unsigned(((~^wire34[(4'h8):(4'h8)]) ?
                      reg38 : $unsigned((reg39 > reg35)))));
  assign wire53 = $unsigned(wire32[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      if ((&$signed(reg42)))
        begin
          reg54 <= ((-($unsigned(wire32) ?
              wire48[(1'h1):(1'h1)] : $signed(wire50))) != $signed($unsigned(reg38[(1'h1):(1'h1)])));
          reg55 <= wire30[(1'h0):(1'h0)];
          if (wire49[(4'hb):(4'h9)])
            begin
              reg56 <= wire34[(2'h2):(1'h1)];
              reg57 <= (8'ha4);
              reg58 <= (+(reg54[(1'h1):(1'h1)] ?
                  wire52[(1'h1):(1'h0)] : $unsigned((~((8'haf) ?
                      (7'h41) : reg55)))));
              reg59 <= (^~{$signed(($signed(reg37) < $unsigned((8'hb5))))});
              reg60 <= ($signed(wire53[(4'hf):(2'h2)]) ?
                  (!$signed(((wire34 || reg42) || (~|wire48)))) : (wire34 ?
                      (wire30[(1'h1):(1'h1)] << (reg36[(4'h8):(2'h3)] ?
                          (reg56 ^~ reg44) : (wire32 >> (7'h43)))) : {$unsigned($signed(wire46))}));
            end
          else
            begin
              reg56 <= wire47[(1'h0):(1'h0)];
              reg57 <= (~|wire31);
              reg58 <= $signed(({wire45[(2'h3):(2'h2)]} ?
                  $unsigned(reg60[(3'h4):(1'h1)]) : $signed($signed((wire46 ?
                      reg60 : wire30)))));
              reg59 <= (~|reg36[(3'h5):(3'h4)]);
            end
          reg61 <= (~^{($signed((wire32 ?
                  (8'h9e) : wire50)) >= (reg59[(5'h14):(5'h11)] ?
                  (-wire49) : (!reg40)))});
          reg62 <= (($unsigned(((8'hb7) >>> (reg42 ?
                  wire52 : wire47))) == (wire51[(3'h7):(1'h0)] << reg37[(3'h7):(2'h3)])) ?
              wire32 : {$signed((~&$signed(reg38))),
                  ({reg58[(4'hb):(3'h6)]} ^ ($signed((8'hac)) >> $signed((8'hb9))))});
        end
      else
        begin
          reg54 <= {(reg43 ?
                  (7'h40) : (wire33[(1'h1):(1'h0)] + ($unsigned(reg38) < $unsigned((8'ha5)))))};
          reg55 <= (reg57[(1'h0):(1'h0)] ?
              $unsigned(reg61) : wire53[(4'ha):(2'h2)]);
          reg56 <= ($unsigned(reg40) < {reg35,
              (~$signed((wire32 ? wire52 : (8'hb6))))});
          if ($unsigned($signed($signed(reg62[(3'h6):(3'h4)]))))
            begin
              reg57 <= ($unsigned($signed(wire30[(1'h1):(1'h0)])) | $signed(reg35));
              reg58 <= $unsigned($unsigned((^~$unsigned({(8'had)}))));
              reg59 <= ((&wire51[(1'h0):(1'h0)]) ?
                  wire46 : (~^(reg41 ? reg39 : $signed(((8'ha0) || reg36)))));
            end
          else
            begin
              reg57 <= reg56;
              reg58 <= (|{($signed(wire53[(1'h1):(1'h0)]) >>> (8'ha7)),
                  (+((reg41 || reg57) ? (~^wire49) : wire45[(1'h0):(1'h0)]))});
              reg59 <= reg56;
              reg60 <= wire31[(2'h2):(1'h1)];
              reg61 <= (wire48 + (~|(($unsigned(wire32) ?
                      (reg43 | (7'h42)) : reg58) ?
                  (reg59[(5'h13):(3'h7)] ?
                      ((8'ha2) ?
                          wire47 : wire34) : reg62) : (~^$unsigned(wire53)))));
            end
          reg62 <= $signed(wire33[(2'h2):(1'h1)]);
        end
      reg63 <= ((!wire31[(5'h13):(5'h10)]) || wire46[(3'h4):(1'h0)]);
    end
  assign wire64 = $unsigned($unsigned((reg55[(1'h1):(1'h0)] & reg38[(4'hb):(4'h8)])));
  assign wire65 = (((((+wire47) & $signed(reg57)) ?
                          $unsigned({reg60}) : (8'haa)) || ($signed($unsigned(reg43)) ^ $unsigned(reg58))) ?
                      $signed((^(^~reg61))) : (wire50[(2'h2):(1'h1)] && ($signed(wire46[(3'h5):(1'h1)]) ?
                          wire33[(2'h2):(2'h2)] : (wire33 | (!reg59)))));
endmodule

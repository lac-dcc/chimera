module top
#(parameter param90 = (((~(((8'hbc) + (8'hb0)) ? ((8'ha3) >> (8'hbf)) : ((8'ha2) ^~ (8'ha8)))) ? ((((8'haa) ? (8'hae) : (8'hb9)) != (~&(8'ha7))) ? (^~((8'ha6) != (8'hb7))) : {(-(7'h43)), ((8'hbf) ? (8'hb7) : (8'hbc))}) : ((((8'ha3) ? (8'hb8) : (7'h42)) ? ((8'ha9) ? (8'hb3) : (8'hb7)) : ((8'ha8) ? (8'hbd) : (8'hb0))) ? (~|(~&(8'hb8))) : (((8'hbd) ? (8'ha5) : (8'hbb)) ? {(8'ha1)} : ((8'ha1) ? (7'h42) : (8'hac))))) ? (({((8'hbd) * (8'hb7)), (-(8'ha6))} ? (((8'ha0) <= (8'ha2)) >>> ((8'had) || (7'h40))) : {(&(8'haf)), (+(8'haa))}) && ({{(8'ha5), (8'haa)}, (8'ha4)} ? ((~(8'h9c)) ? ((8'ha0) >> (8'ha3)) : (~|(8'ha5))) : ({(8'hb3), (7'h43)} ? {(8'hb0), (8'ha2)} : (!(8'ha9))))) : (((~^{(8'hbb)}) - (^~{(8'hb4)})) ? {(((8'hac) ? (8'hb5) : (8'hb7)) < (~^(7'h44)))} : ({(+(8'hb9)), ((8'ha0) > (8'hb9))} << ((|(8'ha2)) >> {(8'hb0)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  assign y = {wire89,
                 wire62,
                 wire60,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg18,
                 reg17,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = ((~|$unsigned((-(wire2 + wire2)))) ?
                     wire0 : $signed({wire1[(3'h4):(1'h0)],
                         ((wire1 ? wire3 : wire3) ?
                             $signed(wire0) : $unsigned(wire1))}));
  assign wire5 = $signed($signed(wire3));
  assign wire6 = wire4[(5'h11):(4'hd)];
  assign wire7 = wire0;
  assign wire8 = $signed(({wire7, (|(wire3 >> wire5))} * (~$unsigned((wire3 ?
                     wire7 : wire5)))));
  assign wire9 = {(~|wire3)};
  assign wire10 = wire2;
  assign wire11 = {wire9};
  always
    @(posedge clk) begin
      reg12 <= (|(($unsigned(wire3[(1'h0):(1'h0)]) ?
              (^~(wire5 & wire5)) : wire1) ?
          (wire10[(1'h0):(1'h0)] ?
              (|{wire1}) : ($unsigned(wire7) ^ $unsigned(wire0))) : wire6[(3'h7):(1'h1)]));
      reg13 <= $unsigned(($signed({(~^wire8)}) + $signed((&$signed(reg12)))));
    end
  always
    @(posedge clk) begin
      reg14 <= (^~(!$signed(wire1[(3'h6):(1'h0)])));
      reg15 <= (~wire3[(3'h4):(1'h0)]);
    end
  assign wire16 = reg15[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg17 <= $unsigned($unsigned($unsigned(($unsigned(wire10) ?
          (wire9 > wire0) : $unsigned(wire16)))));
      reg18 <= $signed(($unsigned(wire6) ^~ wire16[(4'he):(4'he)]));
    end
  module19 #() modinst61 (.wire20(wire1), .clk(clk), .y(wire60), .wire23(reg13), .wire22(wire6), .wire21(reg14));
  assign wire62 = (8'hb0);
  always
    @(posedge clk) begin
      if ({reg18[(1'h1):(1'h1)]})
        begin
          if ((wire1[(3'h5):(3'h4)] >>> (~^$unsigned(wire62))))
            begin
              reg63 <= ((|$unsigned({$unsigned(reg15)})) ?
                  wire9[(2'h3):(1'h1)] : reg14[(2'h2):(2'h2)]);
              reg64 <= (wire60 ?
                  ((&((~^reg17) ?
                      (&reg15) : wire2)) > $unsigned($unsigned($signed(reg12)))) : (~|(((wire4 ?
                          reg12 : (8'h9c)) ?
                      wire7[(1'h0):(1'h0)] : $unsigned(wire16)) < wire16)));
              reg65 <= (~|$unsigned((!((wire60 ?
                  (8'hb7) : reg17) + $signed(reg18)))));
              reg66 <= ($signed(reg14) ? reg65 : wire2[(2'h2):(1'h0)]);
            end
          else
            begin
              reg63 <= wire60;
            end
          reg67 <= wire16;
          reg68 <= $signed($signed((~^$signed((reg65 != wire60)))));
          if ((($signed(wire1[(1'h0):(1'h0)]) ?
              wire10[(4'ha):(4'ha)] : $signed(wire3)) ^ $unsigned($signed(wire6[(5'h13):(1'h0)]))))
            begin
              reg69 <= (reg67[(4'he):(4'ha)] ?
                  (^reg14[(3'h4):(1'h1)]) : {(^~(~^(reg13 && reg67)))});
              reg70 <= (7'h44);
              reg71 <= (((-wire8[(2'h3):(2'h3)]) ?
                      (wire0[(3'h4):(3'h4)] ?
                          ((wire1 ? wire6 : reg17) ?
                              {reg13} : wire16) : wire11) : {(wire9[(4'hc):(4'hc)] & ((8'hb5) ?
                              reg17 : wire7)),
                          $signed((reg14 >>> reg64))}) ?
                  reg12 : $unsigned((|$unsigned($unsigned(reg67)))));
              reg72 <= wire9[(2'h3):(2'h2)];
              reg73 <= reg13;
            end
          else
            begin
              reg69 <= wire3[(4'h9):(2'h3)];
              reg70 <= ((($unsigned(reg64[(3'h4):(2'h3)]) >> $unsigned((wire7 >>> reg18))) <= (+$signed(reg18))) <<< (8'hb0));
              reg71 <= $signed($signed($signed({$unsigned((8'ha8)),
                  (wire62 + (8'hb7))})));
              reg72 <= reg66;
              reg73 <= $unsigned(((wire2 ?
                  (wire7 ~^ $signed(reg66)) : (~&wire6[(5'h10):(2'h2)])) >> (((wire2 ?
                  reg64 : (8'hae)) | (reg68 != reg68)) * {wire1[(2'h3):(2'h3)]})));
            end
          reg74 <= reg12;
        end
      else
        begin
          if ($signed(wire62))
            begin
              reg63 <= $unsigned(((8'ha3) ?
                  ((reg63 != ((8'ha8) ? reg72 : reg65)) ?
                      reg73 : (reg13[(4'hb):(3'h4)] - (wire6 + reg13))) : (~|{(reg65 ?
                          (8'hb3) : reg74),
                      (^reg72)})));
              reg64 <= {$unsigned($signed((8'ha1))), wire6[(2'h3):(1'h0)]};
              reg65 <= (~|(((&wire62[(2'h3):(1'h0)]) >> (wire4 && {reg71})) && $unsigned(wire16)));
            end
          else
            begin
              reg63 <= (|(reg73 ?
                  $signed(reg13[(2'h2):(1'h0)]) : (&($signed(reg66) >>> $unsigned(wire4)))));
              reg64 <= $unsigned($unsigned(wire1));
              reg65 <= $unsigned((wire3[(3'h7):(1'h0)] <<< $signed(((~|(7'h43)) ?
                  ((8'hae) && reg72) : (wire4 ? reg68 : wire16)))));
            end
          reg66 <= ((~reg65) ?
              (^$unsigned(((reg64 <= wire16) ?
                  reg66 : $signed(reg71)))) : wire62[(1'h0):(1'h0)]);
          reg67 <= $unsigned((!(wire11 ? (8'ha1) : ((~^(8'hb0)) + {reg69}))));
          reg68 <= (+$unsigned(((7'h43) ?
              ((wire4 ? wire9 : reg66) <<< (reg14 ?
                  reg72 : wire60)) : (reg66[(3'h5):(3'h5)] ?
                  reg12[(1'h0):(1'h0)] : $signed(reg12)))));
          if ((|reg17[(1'h1):(1'h1)]))
            begin
              reg69 <= ((+((8'hb2) <= ((&wire62) >> (reg65 ? wire2 : wire7)))) ?
                  wire3[(4'hc):(1'h0)] : $signed($unsigned(((^~wire16) <= $signed(reg72)))));
              reg70 <= {wire62};
              reg71 <= wire62[(2'h3):(1'h1)];
              reg72 <= {(($unsigned((reg66 ^ reg64)) >> $unsigned($signed(wire1))) ~^ $signed(((wire3 >>> wire7) ~^ (^~reg15))))};
              reg73 <= (~|$signed($unsigned((|{wire9}))));
            end
          else
            begin
              reg69 <= (wire62 << (-$unsigned($unsigned($unsigned(wire4)))));
              reg70 <= $signed(((((wire0 ? wire2 : reg12) ?
                      (reg64 ~^ reg13) : (reg69 > reg67)) | ((reg74 ?
                          wire0 : reg64) ?
                      (wire1 ? reg73 : wire16) : (reg68 + (8'hb2)))) ?
                  reg18 : {reg69[(2'h3):(2'h2)],
                      ({reg15} ? reg12 : (wire60 != reg72))}));
              reg71 <= wire2;
              reg72 <= ($signed((((reg71 ? wire4 : wire9) ?
                      (reg15 ? wire60 : wire5) : (wire0 | reg18)) ?
                  $unsigned((wire62 ? reg18 : reg66)) : (&((8'ha3) ?
                      (8'hae) : reg14)))) <<< reg65[(3'h5):(2'h2)]);
              reg73 <= $signed($signed(reg69[(3'h7):(3'h6)]));
            end
        end
      if (wire3)
        begin
          if (wire62)
            begin
              reg75 <= $unsigned((reg66[(3'h7):(2'h2)] <<< $unsigned((~(wire4 * wire2)))));
              reg76 <= reg72;
            end
          else
            begin
              reg75 <= (8'hb6);
              reg76 <= wire11;
              reg77 <= (|$signed(((|(wire4 ? wire16 : reg14)) ?
                  ($unsigned(reg74) >= $signed(reg72)) : reg18)));
            end
          reg78 <= (8'hb3);
          reg79 <= wire9;
          reg80 <= reg79;
          reg81 <= wire6;
        end
      else
        begin
          reg75 <= {(8'hae), reg76};
        end
      if ({{wire9}, $unsigned(reg64[(4'ha):(2'h2)])})
        begin
          reg82 <= (&(wire0[(1'h1):(1'h1)] ? wire4 : {$unsigned({reg65})}));
          reg83 <= wire9[(4'hc):(4'h9)];
          if ($unsigned($signed(wire60[(4'h8):(2'h3)])))
            begin
              reg84 <= {(wire8 ?
                      ((reg18[(4'ha):(4'h8)] ?
                          wire7[(4'he):(4'hc)] : wire7) == (+{reg74,
                          wire1})) : $signed({reg77[(1'h0):(1'h0)]}))};
            end
          else
            begin
              reg84 <= (reg70[(4'h9):(3'h4)] ?
                  wire0 : (~|{(wire3[(3'h7):(2'h3)] ?
                          wire10 : reg71[(3'h7):(2'h2)]),
                      $signed(reg79)}));
              reg85 <= wire10[(5'h11):(3'h5)];
              reg86 <= $unsigned(((8'ha8) ?
                  ({$unsigned((7'h41))} ?
                      (7'h43) : wire62[(3'h4):(1'h0)]) : reg79[(3'h5):(1'h0)]));
              reg87 <= reg13;
            end
        end
      else
        begin
          reg82 <= (8'ha6);
          reg83 <= (~^{(~(+(8'h9d))), $signed((~&$signed(wire0)))});
          reg84 <= (reg79 < $signed(reg87[(1'h0):(1'h0)]));
          reg85 <= (reg12[(3'h7):(3'h6)] && {$signed((!(-reg70))), wire60});
        end
      reg88 <= (+reg15[(4'hd):(3'h6)]);
    end
  assign wire89 = reg73;
endmodule

module module19
#(parameter param58 = (^(8'ha4)), 
parameter param59 = (8'ha4))
(y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire45;
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  assign y = {wire24,
                 wire25,
                 wire26,
                 wire45,
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
                 (1'h0)};
  assign wire24 = (~&$signed(($signed((wire23 << wire21)) * (wire21 >= $signed(wire23)))));
  assign wire25 = (((wire22 <<< wire24[(4'hd):(1'h0)]) == $unsigned(wire24[(4'hb):(4'h8)])) ?
                      wire21[(1'h1):(1'h0)] : wire24[(1'h1):(1'h1)]);
  assign wire26 = $unsigned(wire21[(3'h6):(3'h5)]);
  module27 #() modinst46 (.clk(clk), .y(wire45), .wire30(wire24), .wire31(wire20), .wire28(wire25), .wire29(wire21), .wire32(wire26));
  always
    @(posedge clk) begin
      reg47 <= ((~^($unsigned($signed(wire45)) ?
              (~&(^~wire25)) : $unsigned($unsigned(wire45)))) ?
          wire26 : (($signed({wire26}) < wire20[(3'h4):(1'h1)]) >> $unsigned(($signed(wire21) ?
              wire26[(3'h7):(1'h1)] : (&wire22)))));
      reg48 <= ($unsigned((^~(wire23 ?
          $signed(reg47) : (8'h9f)))) == $signed(({reg47,
          $unsigned(wire23)} - {(wire23 ? (8'h9d) : wire21)})));
      reg49 <= $unsigned({(+$unsigned({(8'hba), wire25})),
          (reg47 >> {(~&reg48)})});
      if (({wire25[(4'hb):(4'h8)],
              ((wire26[(4'hb):(2'h2)] ? (&reg49) : ((8'hbf) & wire21)) ?
                  (|(~wire45)) : ((~wire20) >> {(8'ha2)}))} ?
          $unsigned($unsigned($unsigned((reg47 ?
              (8'hb8) : reg48)))) : $unsigned(reg47)))
        begin
          reg50 <= (~&((~&(8'hb3)) ? reg48 : reg47));
          reg51 <= ($signed($signed(((wire45 ? reg48 : wire26) ?
                  wire45 : (reg47 ? reg48 : (7'h43))))) ?
              (wire26[(4'h9):(1'h0)] ?
                  (reg49[(2'h2):(2'h2)] | reg50[(3'h5):(1'h0)]) : $signed(((-wire26) && reg48))) : reg49);
          if (wire23[(3'h7):(3'h5)])
            begin
              reg52 <= ($signed($signed(wire45)) ?
                  {$unsigned(wire22[(4'h8):(1'h0)]),
                      $signed((+reg48[(4'h8):(3'h4)]))} : $unsigned($signed(wire23)));
            end
          else
            begin
              reg52 <= $unsigned((wire23 >= wire45[(4'h8):(1'h1)]));
              reg53 <= wire22[(4'hb):(3'h7)];
              reg54 <= $signed($signed($unsigned(wire26[(4'hb):(3'h4)])));
              reg55 <= $signed($signed((($signed(wire20) ^ $signed(wire20)) <= $unsigned($unsigned(wire45)))));
            end
        end
      else
        begin
          reg50 <= ($signed(reg55) << (^~(wire20[(3'h5):(3'h5)] ?
              ($signed(wire23) ?
                  (reg54 ^ wire45) : $unsigned(reg49)) : wire26)));
          reg51 <= wire21[(3'h5):(2'h3)];
        end
      reg56 <= wire26;
    end
  always
    @(posedge clk) begin
      reg57 <= ((-$unsigned($unsigned(reg48[(3'h7):(1'h1)]))) ?
          ((&reg56[(3'h4):(3'h4)]) ?
              $signed($signed((7'h43))) : (reg56[(2'h3):(1'h1)] || reg49)) : ($signed($unsigned(wire26[(3'h6):(2'h2)])) || $signed(reg49)));
    end
endmodule

module module27
#(parameter param44 = ((~^{(|(~|(8'h9f)))}) * (((((8'h9c) ? (8'hac) : (8'ha3)) ? ((8'hb2) || (8'hac)) : ((8'ha0) && (8'hb9))) >= {((8'hab) + (7'h44))}) ~^ ((((8'ha6) & (7'h44)) > ((8'hae) ? (8'ha1) : (8'hb5))) ? {{(8'hb8), (8'hbd)}, ((7'h41) ? (8'ha0) : (7'h42))} : (((8'hbd) == (8'ha0)) ? ((8'hb7) != (8'h9e)) : ((8'ha9) ^~ (8'hb0)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire33;
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire33,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = $signed(wire29[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg34 <= $signed(wire33);
      reg35 <= $unsigned(wire33);
      reg36 <= (((~&(8'hb0)) ?
          {wire30} : ({$unsigned(wire29), (^~wire32)} ?
              (wire29[(3'h5):(2'h3)] ?
                  (wire29 * wire32) : (wire30 ?
                      reg34 : (8'haf))) : ((^~wire31) ?
                  (reg35 ?
                      wire31 : (8'hb0)) : wire32[(2'h3):(2'h3)]))) & {$signed((+(wire33 * wire29))),
          $unsigned((~(wire30 ^~ wire31)))});
      reg37 <= (+reg34[(4'hc):(4'hb)]);
      reg38 <= {wire32[(3'h6):(3'h6)],
          ((|(+(reg36 ? reg34 : (8'hb9)))) ?
              (~|((reg35 >> wire33) ?
                  $signed(reg35) : $signed(wire28))) : (($unsigned(wire29) ^~ $unsigned(reg36)) > (~^wire32[(1'h0):(1'h0)])))};
    end
  assign wire39 = (&reg38);
  assign wire40 = $unsigned($signed((8'hbe)));
  assign wire41 = {(^(reg34 ?
                          {wire30,
                              reg38[(2'h2):(1'h0)]} : $signed((reg35 >> wire32))))};
  assign wire42 = wire28[(2'h3):(1'h1)];
  assign wire43 = ($unsigned((wire28 ?
                          $signed((wire28 >>> wire42)) : ((wire30 - reg36) <<< wire33))) ?
                      (($unsigned((-wire32)) - $signed(reg34)) >> (($signed(wire32) ?
                              (wire32 + wire40) : $signed(wire31)) ?
                          {(reg34 + wire33),
                              $signed(wire30)} : $signed((wire28 ?
                              wire42 : wire28)))) : $signed(($signed($signed((8'hbf))) >= $unsigned($signed(wire32)))));
endmodule

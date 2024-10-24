module top
#(parameter param123 = ((8'ha4) ? (8'ha2) : ({{((8'hb6) ? (8'ha2) : (8'hac))}, ((7'h40) ^ (~^(8'hbb)))} ? ((((8'ha8) ? (8'hbd) : (8'ha3)) ? ((8'ha4) ? (8'hb7) : (8'h9d)) : ((8'hbc) != (8'haf))) ? ({(8'ha3), (8'hb0)} && ((7'h41) ? (8'hbe) : (8'ha9))) : ((7'h40) < (^~(8'hab)))) : (((~&(7'h41)) ? (8'hb1) : (|(8'hbf))) ? (((7'h43) >= (8'hb0)) ~^ {(8'hbb)}) : ({(8'hb2)} ? ((8'hb2) ? (8'hb8) : (8'hb5)) : ((8'hb8) <<< (8'h9d)))))), 
parameter param124 = (|(~|(|param123))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire99,
                 wire97,
                 wire27,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg4,
                 reg5,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire0;
      reg5 <= ($unsigned(reg4[(4'hc):(4'h9)]) >> $signed({wire2[(3'h7):(3'h6)]}));
    end
  assign wire6 = $signed({$signed(wire3)});
  assign wire7 = $signed((($unsigned(wire1[(3'h4):(2'h2)]) ?
                         ((wire2 >= wire6) ?
                             (wire1 <= wire0) : wire0[(3'h4):(1'h0)]) : ((wire3 ?
                                 wire2 : reg4) ?
                             $signed(reg4) : {wire6})) ?
                     $signed(wire6) : {reg4}));
  assign wire8 = ($signed(wire0) >= (wire7 >= reg4[(1'h0):(1'h0)]));
  assign wire9 = wire6;
  assign wire10 = $unsigned($signed($signed(wire3)));
  assign wire11 = $unsigned(wire7[(3'h5):(3'h5)]);
  assign wire12 = (!reg4[(4'hf):(1'h0)]);
  assign wire13 = $signed($signed((wire1[(1'h1):(1'h1)] ~^ ((8'haf) ^ $signed((8'ha9))))));
  assign wire14 = ($unsigned((((wire1 || wire13) ?
                          (-wire10) : wire9[(1'h0):(1'h0)]) ?
                      $unsigned(((8'ha5) ?
                          wire10 : wire12)) : reg5[(5'h14):(1'h0)])) ~^ wire1);
  assign wire15 = wire1;
  assign wire16 = (({(wire1[(2'h2):(1'h0)] && {wire9}), wire2[(1'h1):(1'h1)]} ?
                          (^(wire11[(3'h4):(1'h1)] ?
                              $unsigned(wire6) : (wire7 != wire0))) : (~$signed((|wire11)))) ?
                      wire3[(4'h8):(3'h6)] : (wire3 ?
                          (^~(|(wire6 - wire10))) : ({wire12} != {wire1[(4'hd):(4'h8)]})));
  assign wire17 = $signed((~&reg4));
  assign wire18 = (wire10 ^ $signed((($signed(wire10) ?
                      $signed(wire0) : $signed(wire13)) * ({wire8} >> $unsigned(wire6)))));
  assign wire19 = ($unsigned((wire6[(1'h0):(1'h0)] != reg4)) | wire3);
  always
    @(posedge clk) begin
      if (wire10)
        begin
          reg20 <= $signed(wire6);
          reg21 <= (|(wire10 ?
              (((wire11 <= (8'hbe)) ? (wire19 ? wire9 : (8'hbc)) : (~wire6)) ?
                  wire14 : ((7'h41) ?
                      (wire6 ?
                          wire1 : wire8) : (wire17 | reg4))) : wire19[(4'h9):(3'h4)]));
          reg22 <= (((~^wire14) ?
                  $signed($unsigned(reg5[(4'h9):(3'h6)])) : $unsigned($unsigned({wire19,
                      wire12}))) ?
              $signed(wire17) : $unsigned($unsigned($unsigned((~^(8'hbf))))));
          reg23 <= wire10;
          reg24 <= wire11;
        end
      else
        begin
          reg20 <= ((reg22[(3'h7):(2'h2)] ?
                  $signed({{wire13, (8'hbb)}, $unsigned(reg5)}) : wire16) ?
              $unsigned((8'h9f)) : $signed(wire6[(2'h2):(1'h1)]));
        end
      reg25 <= (^~($unsigned(reg4[(4'hd):(3'h4)]) != ($unsigned($unsigned((8'had))) ?
          ((wire0 ? (8'ha5) : wire12) && wire3[(3'h5):(3'h5)]) : {(wire8 ?
                  reg20 : (8'hb4))})));
      reg26 <= wire2[(3'h5):(1'h1)];
    end
  assign wire27 = {(+reg4[(1'h0):(1'h0)])};
  module28 #() modinst98 (.wire30(wire14), .clk(clk), .y(wire97), .wire31(reg25), .wire29(wire18), .wire32(wire9), .wire33(wire13));
  assign wire99 = reg24;
  always
    @(posedge clk) begin
      if (reg21)
        begin
          reg100 <= ((^(($unsigned(wire13) == wire2) <= (~(wire11 | wire18)))) ^ ($unsigned($signed($signed(wire8))) ?
              reg5 : ((reg26 ? $unsigned(wire11) : (wire16 + wire13)) ?
                  reg23[(3'h7):(3'h4)] : $unsigned((^wire15)))));
          reg101 <= wire17[(4'ha):(3'h5)];
        end
      else
        begin
          if ({($signed(($signed(wire97) ?
                  wire1[(4'hd):(4'ha)] : wire3[(4'he):(4'ha)])) || (^(8'hb0))),
              (!$unsigned(reg25[(4'ha):(1'h0)]))})
            begin
              reg100 <= ($signed(($unsigned((reg20 & reg25)) * (&(~^wire1)))) ?
                  ($unsigned($signed(reg25)) ?
                      $unsigned($unsigned(reg24[(1'h0):(1'h0)])) : $unsigned(($signed(wire17) || {wire6,
                          wire18}))) : $signed($signed($signed($signed(reg23)))));
            end
          else
            begin
              reg100 <= $unsigned({wire2});
              reg101 <= reg100;
              reg102 <= ({(8'hac),
                  (wire18[(4'ha):(3'h4)] - $unsigned($unsigned(reg24)))} * wire17);
            end
          reg103 <= $signed((8'hb7));
          reg104 <= wire0;
          if (({$signed($signed((~|reg103)))} | $signed((-wire0[(2'h2):(2'h2)]))))
            begin
              reg105 <= wire18[(5'h11):(4'hd)];
            end
          else
            begin
              reg105 <= reg24[(3'h5):(2'h3)];
              reg106 <= (^~(wire19 == wire16[(3'h4):(1'h0)]));
              reg107 <= wire17[(1'h0):(1'h0)];
              reg108 <= ((|($signed((wire2 != (8'hbe))) ^ ($signed(reg22) >> $signed(reg104)))) < wire19);
              reg109 <= $unsigned($unsigned((wire13 <<< {reg25[(4'hd):(4'hc)],
                  (reg26 <<< reg25)})));
            end
          reg110 <= $signed((+(($signed(wire14) <= $signed(reg21)) >>> reg100[(4'h8):(3'h5)])));
        end
      if (({($unsigned((reg5 ? wire11 : reg106)) ?
                  (reg23 ~^ reg5[(4'hc):(2'h3)]) : {reg106[(2'h2):(1'h1)],
                      ((8'hab) ^~ reg23)}),
              (({reg106, wire9} ? (&wire16) : $signed((7'h42))) ?
                  ((reg101 > reg104) && (^(8'hb4))) : reg105)} ?
          reg102 : $unsigned({{$signed((8'hb5)), $unsigned(reg108)},
              (^~(reg4 == reg107))})))
        begin
          reg111 <= ((($unsigned({wire3,
                  wire8}) || $signed({reg100})) ~^ reg26[(3'h5):(3'h5)]) ?
              (((^~(wire2 ? reg20 : reg5)) == $unsigned($unsigned(wire3))) ?
                  reg26[(2'h2):(2'h2)] : (($signed(reg23) << (wire6 ?
                      wire8 : wire15)) || $unsigned(((8'hbf) ~^ reg24)))) : $unsigned((&$unsigned(((8'ha8) ?
                  reg103 : reg106)))));
          reg112 <= reg21;
          if ($signed($unsigned(($signed($unsigned(reg110)) ?
              wire14 : (reg26[(1'h0):(1'h0)] && (^(8'ha7)))))))
            begin
              reg113 <= (+$unsigned(reg106));
              reg114 <= (-({$signed(((8'hb7) ? reg110 : (8'ha4))),
                      $unsigned(reg112)} ?
                  $unsigned($signed((wire19 ^ (8'hb5)))) : wire18));
              reg115 <= reg100[(2'h3):(1'h1)];
              reg116 <= $signed((&{{$signed(reg110), $unsigned(reg103)},
                  (~$unsigned(wire9))}));
            end
          else
            begin
              reg113 <= (8'hae);
            end
        end
      else
        begin
          if (reg100[(2'h3):(2'h3)])
            begin
              reg111 <= reg110;
              reg112 <= {(-wire12)};
            end
          else
            begin
              reg111 <= $unsigned((8'had));
              reg112 <= ($unsigned(($signed(reg116) ?
                  (|(reg23 >= (7'h44))) : $signed((wire10 ?
                      (7'h42) : reg109)))) & $unsigned($signed($signed($unsigned(wire13)))));
              reg113 <= {reg115, wire2};
              reg114 <= (8'hb1);
            end
          reg115 <= $signed(reg100);
          if ((8'ha0))
            begin
              reg116 <= $unsigned((|(({reg20} ?
                  reg106 : $signed(reg5)) * ((wire9 ?
                  reg104 : reg109) | wire27))));
              reg117 <= $signed($unsigned((($signed(wire8) || $unsigned(reg110)) ?
                  (+{reg113}) : (reg116 | wire6))));
              reg118 <= ((^reg104[(1'h1):(1'h0)]) ?
                  $unsigned(reg102) : (wire11 ?
                      $unsigned($signed(wire10)) : reg113));
              reg119 <= ($unsigned((~|(^~wire16[(1'h1):(1'h0)]))) ?
                  ({(~&(wire12 ? reg25 : reg104)),
                      (reg114 ?
                          (reg112 < wire2) : (wire18 ?
                              reg111 : wire9))} ^~ (!reg5)) : (+$unsigned(wire97[(4'h8):(2'h3)])));
            end
          else
            begin
              reg116 <= $signed(reg22[(1'h1):(1'h0)]);
              reg117 <= reg20;
              reg118 <= $signed(($signed($unsigned(wire27)) ?
                  reg24[(4'hb):(3'h4)] : ($unsigned(reg116) ?
                      $unsigned(wire10) : {(|wire9)})));
              reg119 <= ({(~^wire2)} >> (($signed((^~wire19)) > reg118[(1'h1):(1'h1)]) >> $signed($signed({reg101}))));
            end
          reg120 <= wire97;
        end
    end
  assign wire121 = (~reg23);
  assign wire122 = $signed((~&reg110));
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  assign y = {wire96,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire46,
                 wire35,
                 wire34,
                 reg95,
                 reg94,
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
                 (1'h0)};
  assign wire34 = ((((^~wire32[(3'h4):(2'h3)]) ?
                          $unsigned((wire32 ?
                              wire32 : wire32)) : (^~(wire29 + wire29))) ?
                      wire31 : wire30[(4'hc):(4'h8)]) - ((^wire30) ?
                      ($unsigned({(8'hb6), wire30}) ?
                          ((8'hbb) ?
                              wire29[(5'h10):(3'h6)] : wire30) : $signed((~&wire29))) : ($unsigned((8'ha9)) ?
                          $unsigned((~&(8'ha1))) : {$unsigned(wire32),
                              $signed(wire33)})));
  assign wire35 = ($signed($signed((((8'hb6) != wire30) <<< $unsigned(wire32)))) ^~ ($unsigned($unsigned($unsigned(wire34))) ^ $signed(($signed((8'ha6)) * {wire31,
                      (7'h43)}))));
  module36 #() modinst47 (wire46, clk, wire31, wire32, wire29, wire30);
  module48 #() modinst68 (.wire51(wire29), .wire52(wire34), .wire49(wire30), .wire50(wire46), .y(wire67), .clk(clk));
  assign wire69 = $signed(wire46);
  assign wire70 = {($signed({$signed(wire33), $signed(wire35)}) >>> (8'ha5)),
                      $signed((wire29 <= wire32[(2'h3):(2'h2)]))};
  assign wire71 = $unsigned((&({wire46, $signed((8'ha7))} ~^ {(wire46 > wire70),
                      wire46[(2'h2):(2'h2)]})));
  always
    @(posedge clk) begin
      reg72 <= {$unsigned({$unsigned((wire35 ? wire29 : wire32))})};
      reg73 <= ($unsigned(($signed(wire32[(3'h4):(3'h4)]) ?
          $signed({wire30, wire32}) : ($unsigned(reg72) ?
              (wire31 ?
                  wire46 : wire30) : (|wire71)))) & (wire31[(4'hd):(3'h5)] ?
          wire69[(3'h6):(2'h3)] : (^~wire30[(4'hb):(3'h7)])));
      if ((wire67 ?
          (!$unsigned((((8'had) >>> wire35) ?
              reg72 : wire69[(1'h1):(1'h1)]))) : (+$unsigned((|wire33[(3'h7):(3'h5)])))))
        begin
          reg74 <= $unsigned((reg72 + wire34));
          reg75 <= $signed($signed(($unsigned((|wire32)) != (-(wire32 ?
              (8'ha9) : (8'ha7))))));
          if (({wire70, (^(!(&wire29)))} ?
              $unsigned($signed(((~wire69) || wire31[(2'h2):(1'h1)]))) : (~&(^wire46))))
            begin
              reg76 <= wire33;
              reg77 <= $unsigned((((~|(wire71 >>> wire31)) > (~^$signed(wire31))) ?
                  $unsigned(((reg73 ?
                      reg72 : wire30) * (8'hbb))) : wire46[(3'h6):(2'h2)]));
              reg78 <= (8'ha8);
              reg79 <= (reg78 ?
                  ($unsigned($signed($signed(wire69))) ?
                      (wire46[(3'h4):(2'h2)] << $signed($signed(reg74))) : ($signed(wire67[(4'hb):(2'h2)]) ?
                          ((^~wire70) < $signed(wire70)) : ({wire30,
                              reg78} == (reg78 + wire69)))) : $unsigned({reg73[(2'h2):(1'h0)],
                      $unsigned($unsigned(reg74))}));
            end
          else
            begin
              reg76 <= ({((reg75[(1'h0):(1'h0)] ?
                      reg76[(1'h0):(1'h0)] : (~^wire69)) & ($signed(reg72) ?
                      $signed(reg72) : (|wire31)))} <<< ({wire33[(4'hf):(3'h4)]} >>> ((reg78 ?
                      $unsigned(wire31) : (wire29 ? wire29 : wire31)) ?
                  $unsigned($signed((8'hbb))) : (&(-reg73)))));
              reg77 <= ($unsigned(wire31) | (|(~&reg75)));
              reg78 <= {((~^$signed(reg77)) ?
                      ({{(8'hb4)}} || reg78) : $signed(reg72))};
              reg79 <= wire32;
            end
          reg80 <= $signed((($signed((-wire32)) ?
                  wire33 : ((reg78 <<< reg77) ?
                      $signed(reg79) : reg74[(2'h2):(1'h1)])) ?
              reg74[(4'ha):(3'h4)] : reg76));
        end
      else
        begin
          reg74 <= reg77[(4'h9):(3'h4)];
          reg75 <= $signed(((~(^(~^(8'hbf)))) + (~&($signed((8'h9c)) >>> reg79[(1'h1):(1'h1)]))));
          if (wire46[(1'h0):(1'h0)])
            begin
              reg76 <= (8'ha9);
            end
          else
            begin
              reg76 <= wire33[(4'h9):(4'h9)];
            end
        end
      reg81 <= reg76[(2'h3):(2'h2)];
    end
  assign wire82 = ($signed((wire31[(4'hd):(4'h9)] ?
                      reg80[(4'h8):(2'h2)] : (~&{reg73,
                          reg73}))) > $unsigned(reg72));
  assign wire83 = $signed(wire32[(1'h1):(1'h1)]);
  assign wire84 = (~&((($unsigned(wire71) ?
                          $unsigned(reg74) : (wire32 ? wire29 : reg75)) ?
                      (((8'hb7) ? (8'hb3) : wire69) && (wire67 ?
                          wire32 : reg79)) : $signed($signed(wire29))) >>> $unsigned({(wire83 ?
                          reg78 : reg73)})));
  assign wire85 = $signed(reg78);
  assign wire86 = wire30[(5'h12):(4'hb)];
  assign wire87 = wire86[(4'hb):(1'h0)];
  assign wire88 = (~{((^{wire83}) ? $signed($unsigned(reg80)) : wire69)});
  assign wire89 = reg75;
  assign wire90 = {wire29,
                      ((^wire30[(5'h11):(4'ha)]) - (^((wire33 == (8'had)) ?
                          $unsigned(wire69) : (~|wire82))))};
  assign wire91 = (({wire34, wire30} ?
                          reg72 : (reg73 == $signed($signed(wire30)))) ?
                      (+$signed((-wire35[(4'h8):(3'h7)]))) : wire89[(3'h6):(3'h6)]);
  assign wire92 = (wire35[(3'h7):(3'h6)] ?
                      $signed({reg72[(3'h4):(1'h0)],
                          wire70[(3'h4):(1'h1)]}) : ({$signed({(8'h9f)}),
                          (wire67 - wire87[(4'h9):(1'h1)])} << wire82));
  assign wire93 = (wire35 >= {(^~$unsigned(wire85[(1'h0):(1'h0)])),
                      reg76[(1'h1):(1'h0)]});
  always
    @(posedge clk) begin
      reg94 <= $signed(($unsigned((&reg74[(3'h4):(1'h1)])) <= ((wire34[(5'h15):(2'h3)] ^~ $unsigned((8'ha7))) ?
          wire89 : $signed((wire71 >>> wire83)))));
      reg95 <= ((&reg80[(4'h9):(4'h8)]) || reg77[(3'h7):(3'h7)]);
    end
  assign wire96 = $signed($signed(reg81));
endmodule

module module48  (y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire signed [(4'h8):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg66,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire53 = ((^wire52[(4'hf):(2'h3)]) - $signed($signed(((wire49 == wire50) && wire49))));
  assign wire54 = wire51[(1'h0):(1'h0)];
  assign wire55 = ((wire49 ?
                      ({$unsigned((8'hb2))} ?
                          wire52 : $unsigned($signed(wire54))) : $signed(wire49)) | (~|wire51[(1'h1):(1'h0)]));
  assign wire56 = ((7'h42) ^ (8'ha4));
  assign wire57 = $unsigned($signed({(((8'ha3) <<< wire50) ?
                          (wire56 <<< wire49) : $unsigned(wire55)),
                      (8'hbf)}));
  always
    @(posedge clk) begin
      reg58 <= wire54[(1'h1):(1'h0)];
      reg59 <= wire52;
      reg60 <= ({($unsigned($unsigned(wire56)) * $signed(wire54[(1'h0):(1'h0)])),
          (^wire52)} != (^~(~|(|(reg59 + wire57)))));
      reg61 <= reg58;
    end
  assign wire62 = (&wire50);
  assign wire63 = $signed(wire50[(2'h3):(2'h2)]);
  assign wire64 = (({(|wire63[(3'h7):(3'h7)])} ?
                      (8'hbd) : wire53) != $unsigned((wire54[(1'h0):(1'h0)] ?
                      $signed({wire56, (8'ha4)}) : $unsigned(wire52))));
  assign wire65 = $unsigned(((((^wire52) ? (-wire52) : {reg59, wire54}) ?
                      wire57 : {(~wire54),
                          $unsigned(wire56)}) ~^ $unsigned(((&wire49) ?
                      (wire54 || wire56) : $unsigned(wire53)))));
  always
    @(posedge clk) begin
      reg66 <= $unsigned($signed({wire65[(3'h7):(3'h7)]}));
    end
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire signed [(4'ha):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  assign y = {wire45, wire44, wire43, wire42, wire41, (1'h0)};
  assign wire41 = (8'hbd);
  assign wire42 = (~&(|$signed(wire38[(3'h6):(3'h6)])));
  assign wire43 = $signed($signed((~^$unsigned((8'hac)))));
  assign wire44 = {(^($unsigned($unsigned(wire37)) ^~ wire38[(3'h4):(1'h0)]))};
  assign wire45 = wire39[(3'h5):(2'h3)];
endmodule

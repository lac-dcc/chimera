module top
#(parameter param104 = {{((-(~|(8'hb2))) * ((~^(8'hb4)) >> (+(8'ha7))))}}, 
parameter param105 = (|(param104 + (param104 ^~ ((param104 ~^ param104) + {param104})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire87;
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire92,
                 wire91,
                 wire89,
                 wire28,
                 wire30,
                 wire31,
                 wire32,
                 wire87,
                 reg103,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg90,
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
                 (1'h0)};
  module4 #() modinst29 (.wire6(wire1), .y(wire28), .wire9(wire0), .wire8(wire3), .wire5((8'hb5)), .wire7(wire2), .clk(clk));
  assign wire30 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire31 = (((wire30 ? (~|(!(8'hbd))) : wire0[(3'h7):(3'h4)]) ?
                          $signed(((wire30 ?
                              wire28 : wire2) >= (wire30 > (8'hba)))) : $unsigned(wire28)) ?
                      $unsigned((&{(wire2 ^~ wire30),
                          {wire30,
                              wire30}})) : (((~(wire0 ^ wire3)) <<< ((wire28 ?
                              wire30 : wire1) ?
                          (wire3 <<< wire2) : wire28[(1'h0):(1'h0)])) != wire0[(2'h2):(1'h0)]));
  assign wire32 = (wire0[(4'h9):(1'h0)] != (({(~&(8'hb5))} ?
                          $unsigned($unsigned(wire0)) : ($unsigned(wire2) == ((8'hb4) >> wire28))) ?
                      (((wire0 ^ (8'hbf)) != $unsigned(wire1)) && $unsigned((wire28 ~^ wire28))) : (wire2 <= wire28[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      if ((((+((+wire30) ?
          wire0 : {(8'hab),
              wire1})) == wire1[(5'h10):(4'ha)]) * ({wire2[(4'hd):(3'h6)],
          (8'hbb)} && (((-wire28) + (wire3 ? wire31 : wire3)) ?
          (&$unsigned(wire31)) : wire0))))
        begin
          reg33 <= (&wire3[(1'h0):(1'h0)]);
          reg34 <= $signed((reg33[(1'h0):(1'h0)] ?
              (&wire2) : (wire0 ?
                  wire32[(5'h11):(5'h10)] : ((wire1 ? (8'h9e) : wire28) ?
                      (~^wire31) : (reg33 ? wire2 : wire2)))));
        end
      else
        begin
          reg33 <= $signed(wire30);
          if (({wire3[(2'h2):(1'h0)]} <<< ((wire32[(4'hc):(1'h1)] + ((wire3 ?
              wire2 : wire30) ~^ (wire32 == wire0))) && (wire28[(4'hd):(4'h9)] ?
              ({(8'hb0)} ?
                  wire30[(2'h2):(2'h2)] : (wire30 ?
                      wire1 : wire30)) : $unsigned((wire2 ?
                  wire28 : wire28))))))
            begin
              reg34 <= $unsigned($signed((^$signed($unsigned(reg34)))));
              reg35 <= (wire32[(3'h6):(3'h4)] ?
                  (reg33[(1'h0):(1'h0)] | (((-(8'h9c)) ?
                      $unsigned(wire31) : reg33) ^~ $signed(wire32))) : wire30);
              reg36 <= wire30[(4'h8):(3'h6)];
              reg37 <= (+$unsigned(wire32));
            end
          else
            begin
              reg34 <= {reg36[(4'h9):(3'h5)],
                  (wire28 ? wire0 : (|(wire2 ? (wire1 < reg34) : {(8'hb9)})))};
              reg35 <= wire31;
              reg36 <= (wire2 && ($signed($unsigned((~|(8'ha1)))) ?
                  wire31[(3'h6):(2'h3)] : wire30[(4'hd):(4'hc)]));
            end
          reg38 <= $signed(wire2);
        end
      reg39 <= $signed({$unsigned(reg36)});
      if ($unsigned($signed((reg38[(3'h5):(3'h4)] ?
          $signed((reg39 * wire30)) : $unsigned((wire3 | reg39))))))
        begin
          reg40 <= (&$unsigned((8'hb4)));
          reg41 <= reg40[(4'hb):(1'h0)];
          reg42 <= (-($unsigned(wire3) >>> $signed((8'ha9))));
        end
      else
        begin
          if ($unsigned(((~^$signed($signed(reg40))) ?
              ((|(wire3 & wire30)) ~^ ((wire1 != wire2) ?
                  (reg34 ? (8'hb8) : reg36) : $signed(reg41))) : (|(8'hae)))))
            begin
              reg40 <= (($signed((~&(+reg40))) > (-wire28)) ?
                  $signed(wire2) : (({$unsigned(wire3), $unsigned(reg33)} ?
                          $unsigned($signed(reg36)) : reg37[(5'h10):(4'h8)]) ?
                      reg36 : (wire30 ?
                          (((7'h42) <= reg40) ?
                              (^~reg42) : wire32) : $signed((8'ha5)))));
              reg41 <= wire32;
              reg42 <= (((((~wire28) ? $unsigned(reg35) : (~&reg34)) >> reg33) ?
                  reg40 : $signed(wire3)) <<< (^wire30[(5'h13):(4'he)]));
              reg43 <= (~(wire3 ?
                  (~^((reg38 ? reg40 : (8'hbd)) ?
                      $unsigned(reg33) : $signed(wire31))) : wire2[(5'h10):(4'ha)]));
            end
          else
            begin
              reg40 <= (((reg41[(1'h0):(1'h0)] >> $signed((+reg34))) <<< ($signed(wire0) ?
                  wire28 : $signed(reg43[(3'h7):(1'h1)]))) - $signed(reg38[(3'h4):(2'h2)]));
            end
          reg44 <= ($unsigned(($signed($signed(reg43)) ?
              (~|{wire32}) : ($signed(reg38) ?
                  reg33 : {reg36, reg36}))) != (~|wire0[(4'ha):(1'h1)]));
          if ((&((+((-(8'ha9)) ?
              (reg34 ?
                  reg36 : wire32) : reg38[(3'h7):(3'h4)])) >>> ((reg41[(2'h3):(2'h3)] < $unsigned(wire2)) >>> ($unsigned((8'hb5)) && (wire28 * (7'h42)))))))
            begin
              reg45 <= wire3[(4'h8):(3'h4)];
              reg46 <= wire2[(5'h11):(2'h2)];
              reg47 <= $unsigned(reg43[(2'h3):(2'h2)]);
            end
          else
            begin
              reg45 <= (~|(!$unsigned((8'hbd))));
            end
        end
      reg48 <= reg34;
    end
  module49 #() modinst88 (wire87, clk, wire3, reg44, reg35, reg46, reg48);
  assign wire89 = (-{$unsigned($signed($unsigned((8'h9d))))});
  always
    @(posedge clk) begin
      reg90 <= ($signed(reg33[(3'h4):(3'h4)]) ?
          ((wire89[(2'h2):(1'h1)] ?
                  $signed(((8'ha3) ^~ wire30)) : $signed((reg46 ?
                      reg34 : wire28))) ?
              $signed({reg44[(3'h6):(3'h4)]}) : {reg37}) : wire0[(1'h1):(1'h1)]);
    end
  assign wire91 = $unsigned(reg35[(3'h5):(1'h1)]);
  assign wire92 = (8'hb6);
  always
    @(posedge clk) begin
      reg93 <= (8'haf);
      reg94 <= ($unsigned($unsigned((wire28[(1'h0):(1'h0)] < {wire30}))) || (~reg34[(3'h4):(2'h3)]));
      reg95 <= $signed(wire28[(3'h5):(2'h2)]);
      reg96 <= ((|$signed($unsigned($signed(wire0)))) ?
          {reg43[(4'h9):(2'h2)]} : $signed({(!wire87[(2'h3):(2'h2)])}));
    end
  assign wire97 = $signed($signed(wire2));
  assign wire98 = (~|(({reg96, $unsigned(wire89)} ?
                      $signed(((7'h40) ?
                          wire1 : (8'hac))) : ($signed((8'hb5)) * $signed(reg96))) && reg34[(2'h3):(2'h2)]));
  assign wire99 = ($signed($unsigned({reg35,
                      (reg33 == reg96)})) ~^ $signed((reg94[(1'h0):(1'h0)] ^~ ((~^wire98) >>> $unsigned(reg35)))));
  assign wire100 = ((wire31 | (8'hba)) > ({reg38[(2'h2):(1'h0)],
                       reg43[(3'h4):(2'h3)]} >= {(reg45 ?
                           (~|reg94) : $signed(wire2)),
                       ((reg93 ? (8'ha0) : reg34) == reg45)}));
  assign wire101 = (|(&$signed($signed((!reg39)))));
  assign wire102 = wire30[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg103 <= (($signed((~^wire98[(5'h10):(3'h5)])) ?
          (reg35[(4'h8):(2'h2)] ?
              ((reg90 ?
                  wire98 : (8'ha6)) == {reg94}) : (&$signed(reg40))) : (wire87[(1'h1):(1'h1)] ?
              (wire28 == {wire1}) : {(&reg95),
                  $unsigned(wire28)})) ^ (~^$signed($unsigned(reg93))));
    end
endmodule

module module49  (y, clk, wire50, wire51, wire52, wire53, wire54);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire [(3'h7):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire52;
  input wire signed [(5'h15):(1'h0)] wire53;
  input wire [(5'h12):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire84;
  assign y = {wire86,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire84,
                 (1'h0)};
  assign wire55 = ((8'ha9) >= (($unsigned((wire53 >> wire53)) ?
                      (wire54 ?
                          ((8'ha8) ?
                              (8'ha7) : wire53) : $unsigned(wire54)) : wire51[(3'h7):(1'h1)]) != wire50));
  assign wire56 = $signed((wire50 ?
                      $signed(wire52[(3'h4):(1'h0)]) : (|wire54[(4'hc):(3'h5)])));
  assign wire57 = (((wire50 > {((7'h43) ? wire53 : (8'haf))}) ?
                      wire54 : $signed((^wire55))) > $signed((($unsigned(wire53) <= wire54[(3'h7):(3'h4)]) ?
                      (((8'ha7) + wire51) ?
                          (wire53 ^~ wire54) : (&wire55)) : (wire50 ?
                          $signed(wire53) : (~|wire51)))));
  assign wire58 = {(7'h44),
                      (wire53 ?
                          $signed(((wire56 ? wire57 : (7'h40)) ?
                              (wire53 ?
                                  wire53 : wire51) : (wire55 ~^ wire52))) : $signed(wire57[(1'h0):(1'h0)]))};
  assign wire59 = {(wire51 ? $signed((wire57 ^~ $unsigned(wire58))) : (8'had))};
  assign wire60 = $signed(wire59);
  assign wire61 = $signed(($unsigned($unsigned(wire54[(2'h2):(1'h0)])) ?
                      {((+wire59) ^~ $signed(wire60))} : $unsigned((wire53 ?
                          (~^wire57) : $signed(wire51)))));
  module62 #() modinst85 (wire84, clk, wire52, wire55, wire54, wire53, wire59);
  assign wire86 = $signed(wire50[(2'h2):(1'h1)]);
endmodule

module module4
#(parameter param26 = ({((((8'hb1) ? (7'h43) : (8'h9f)) ? ((8'hb2) == (8'hb9)) : ((8'ha8) ~^ (8'hba))) ? ({(8'hb4)} ? (~^(8'ha5)) : ((8'h9e) <= (8'hb1))) : (((8'ha5) ? (8'ha8) : (8'hb6)) ? {(7'h41), (8'hbb)} : ((8'haf) || (8'hb8)))), (~&(~((8'hb3) ? (8'ha4) : (8'ha8))))} ? (((((7'h44) >>> (8'ha0)) ? ((8'hb5) ? (8'hac) : (8'ha9)) : (!(8'haf))) ? (^~((8'hb6) ? (8'ha5) : (8'h9e))) : ((-(8'hb7)) ? (8'haa) : (|(7'h44)))) ? {{{(7'h40)}, (^(8'ha9))}} : (({(8'hb0)} ^~ {(8'ha9)}) ? ((-(8'hb5)) ? ((8'h9c) - (8'h9c)) : (|(8'hb4))) : ({(7'h43), (8'hae)} <<< ((8'hb2) ? (8'hb6) : (8'haf))))) : ((!(-(8'hbd))) <<< (~(((7'h41) <<< (8'ha2)) ^ ((8'had) ~^ (8'hb4)))))), 
parameter param27 = (|param26))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = wire5;
  assign wire11 = (wire6[(2'h3):(2'h2)] ?
                      (~^$signed(((wire6 ? wire8 : wire8) ?
                          wire7[(4'hf):(2'h3)] : {wire6}))) : (wire6[(3'h6):(2'h2)] ~^ ((~&wire9[(3'h7):(3'h6)]) + {(wire7 ?
                              wire7 : wire8),
                          wire8[(2'h2):(1'h1)]})));
  assign wire12 = $unsigned(((+{(^~wire11)}) || wire6[(1'h0):(1'h0)]));
  assign wire13 = $unsigned(wire8[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg14 <= $signed(((((wire9 <= wire6) ? (-wire13) : wire6[(4'hd):(3'h4)]) ?
          wire11[(4'h8):(2'h2)] : (-((8'had) | wire10))) || $signed((8'hbc))));
      reg15 <= $unsigned(($unsigned($signed($signed(wire7))) < (wire10 ^~ (7'h44))));
    end
  always
    @(posedge clk) begin
      reg16 <= (wire12[(3'h4):(2'h2)] ?
          wire6[(2'h3):(2'h2)] : (wire7[(3'h7):(3'h5)] || {$signed({wire9,
                  wire5}),
              wire12[(1'h0):(1'h0)]}));
      reg17 <= wire7;
      if (wire13[(4'ha):(3'h6)])
        begin
          if ((~&{wire9[(4'ha):(3'h6)], $unsigned($unsigned((!(8'ha6))))}))
            begin
              reg18 <= wire10;
            end
          else
            begin
              reg18 <= $signed((reg17[(3'h4):(2'h3)] ?
                  $unsigned((((8'had) ? (7'h44) : wire5) ?
                      reg18[(2'h2):(1'h0)] : $signed(wire10))) : wire11[(4'hb):(3'h7)]));
              reg19 <= {(&{$signed((wire9 << reg15))})};
              reg20 <= wire10;
            end
          reg21 <= ($signed(wire12[(2'h2):(2'h2)]) ?
              (&$signed($unsigned(wire13))) : (8'ha3));
        end
      else
        begin
          reg18 <= $unsigned(wire8);
        end
    end
  assign wire22 = $unsigned(reg14[(3'h5):(1'h0)]);
  assign wire23 = $signed(((~^reg17) ?
                      wire8[(2'h3):(1'h0)] : (reg18[(2'h2):(1'h0)] ?
                          (~|(&reg16)) : ({reg15} + (8'ha2)))));
  assign wire24 = ((^wire7[(4'hb):(3'h6)]) ?
                      (wire6 ^~ reg15[(3'h4):(2'h3)]) : $signed((((wire10 > wire5) ~^ $signed(reg18)) ?
                          ($unsigned(wire8) ?
                              $signed(reg15) : (!reg16)) : (&(!wire12)))));
  assign wire25 = wire7[(1'h1):(1'h1)];
endmodule

module module62  (y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire67;
  input wire [(4'ha):(1'h0)] wire66;
  input wire signed [(4'hb):(1'h0)] wire65;
  input wire [(5'h10):(1'h0)] wire64;
  input wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg81,
                 (1'h0)};
  assign wire68 = ((wire63[(4'hd):(3'h4)] + $unsigned(((!wire65) ?
                          $signed((8'hac)) : ((8'hb7) ? wire64 : wire65)))) ?
                      $signed($signed((^wire63))) : (wire66[(1'h1):(1'h1)] ?
                          wire67[(4'hd):(4'hb)] : wire65));
  assign wire69 = wire68;
  assign wire70 = $unsigned(($unsigned((wire68[(4'h8):(2'h3)] - $signed(wire69))) == $unsigned(((wire64 ?
                          wire64 : wire65) ?
                      $unsigned(wire69) : wire63))));
  assign wire71 = $unsigned({$signed(wire63)});
  assign wire72 = ((~^wire67[(5'h12):(3'h4)]) <= $signed(($unsigned($unsigned(wire67)) == ((wire70 ?
                      wire67 : wire63) <= wire64[(4'h8):(1'h0)]))));
  assign wire73 = ($signed($unsigned(wire65[(4'h8):(2'h2)])) < (wire68 ^ wire64));
  assign wire74 = $signed((wire69 >>> (~({wire69} <= wire73[(1'h1):(1'h0)]))));
  assign wire75 = $signed(wire69);
  assign wire76 = wire73;
  assign wire77 = ($signed((wire63[(3'h5):(1'h0)] ?
                          $unsigned((wire70 > wire76)) : (~|(!wire71)))) ?
                      $unsigned($unsigned(((wire75 || wire74) ?
                          wire74 : ((8'hb6) >> wire65)))) : (!wire67[(4'h8):(1'h1)]));
  assign wire78 = wire65[(3'h4):(2'h3)];
  assign wire79 = $unsigned(($unsigned($signed(wire75)) ?
                      (($signed((8'haa)) <= {(8'ha8)}) && (~|{wire67})) : wire70));
  assign wire80 = (~{wire79[(1'h0):(1'h0)],
                      $unsigned(($signed(wire74) & $unsigned(wire66)))});
  always
    @(posedge clk) begin
      reg81 <= {{$unsigned($unsigned((wire78 ? (8'hb3) : wire77))),
              {(|{(8'ha6), wire66})}},
          (^(^$unsigned((|wire66))))};
    end
  assign wire82 = $unsigned(wire71[(4'ha):(3'h7)]);
  assign wire83 = wire79;
endmodule

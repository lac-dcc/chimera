module top #(parameter param49 = (8'ha2)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire47,
                 wire24,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = $signed($unsigned({(8'hbc), (+(-wire2))}));
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= ($unsigned(wire2[(4'h9):(4'h8)]) ? wire3 : $signed((8'hb3)));
    end
  assign wire8 = {$signed(wire4[(4'hd):(4'hd)]), wire4};
  assign wire9 = $signed($unsigned($unsigned($unsigned(wire8[(3'h5):(2'h3)]))));
  assign wire10 = ((8'hb3) ?
                      ((~(wire1[(1'h1):(1'h0)] ~^ (wire9 & wire3))) ?
                          (7'h40) : $unsigned($unsigned((-wire3)))) : $signed(($unsigned(reg7) ?
                          $signed(reg7[(4'ha):(4'h8)]) : wire2)));
  assign wire11 = $unsigned($unsigned($unsigned((wire9[(3'h6):(1'h1)] ?
                      (wire6 ? wire9 : wire9) : wire8[(1'h0):(1'h0)]))));
  assign wire12 = ((-(~&$signed($unsigned(wire11)))) ?
                      wire10[(2'h3):(2'h3)] : ((8'h9f) << wire6));
  always
    @(posedge clk) begin
      if (({{{(wire12 ? wire11 : wire4), (wire4 ? wire0 : wire11)},
              $signed(wire12)}} || ((~|(wire8 ?
          (wire10 - wire1) : $unsigned(wire12))) < $signed($signed($unsigned(wire8))))))
        begin
          if ($unsigned({$signed((-$signed((8'h9e)))), wire0[(3'h7):(3'h5)]}))
            begin
              reg13 <= ((!(~{{wire5, wire1},
                  wire5[(4'ha):(2'h2)]})) + $unsigned((~$signed(wire9))));
              reg14 <= (8'hbc);
              reg15 <= reg13[(4'hc):(4'ha)];
              reg16 <= $unsigned((^(((reg7 ? wire5 : wire0) ?
                  ((8'hbb) ?
                      wire6 : reg7) : ((8'hbb) != (7'h43))) * $unsigned(reg14))));
              reg17 <= $unsigned(wire0[(1'h0):(1'h0)]);
            end
          else
            begin
              reg13 <= (wire10 == $signed(reg13));
              reg14 <= ($unsigned(wire3[(2'h2):(1'h0)]) >> wire12[(2'h3):(2'h3)]);
              reg15 <= (wire8[(2'h3):(2'h3)] ?
                  wire5[(4'he):(3'h4)] : ($unsigned($unsigned((reg15 ?
                          wire5 : wire2))) ?
                      $signed({wire9}) : wire11));
            end
          reg18 <= $signed(reg13);
        end
      else
        begin
          if ($unsigned($signed($signed(wire12))))
            begin
              reg13 <= reg17;
              reg14 <= wire4[(4'he):(4'hc)];
              reg15 <= wire3[(2'h3):(1'h1)];
            end
          else
            begin
              reg13 <= $unsigned(reg15[(3'h4):(2'h2)]);
              reg14 <= ((wire0[(2'h3):(2'h2)] ?
                  (^{$unsigned((8'hbf))}) : (|(^~(reg14 < reg18)))) >= reg16);
              reg15 <= $unsigned($unsigned({(~^wire11),
                  (wire5[(1'h0):(1'h0)] ?
                      ((8'ha3) == wire4) : $signed(wire3))}));
              reg16 <= $signed($unsigned($unsigned($signed($signed(wire10)))));
              reg17 <= $unsigned(reg18[(4'hb):(1'h0)]);
            end
          reg18 <= $unsigned((wire3 ?
              wire12 : ($signed({(8'had), (8'hb1)}) ?
                  reg15[(5'h13):(4'h9)] : wire3[(3'h7):(3'h6)])));
          if ($unsigned($signed($unsigned(wire8))))
            begin
              reg19 <= (({reg16[(2'h2):(1'h1)],
                  (+$unsigned((8'hb0)))} || $unsigned($unsigned((|wire1)))) >= {wire10});
              reg20 <= (!wire3);
            end
          else
            begin
              reg19 <= ((8'ha1) <= (($signed(wire4[(4'hb):(3'h5)]) <<< (^~((8'hb0) ?
                      wire2 : reg20))) ?
                  (((&reg13) ?
                      ((8'hb1) ? wire2 : reg17) : (wire3 ?
                          wire12 : reg17)) <= ($unsigned((8'hbe)) == $unsigned((8'hba)))) : ($unsigned($unsigned((8'h9c))) ?
                      (!reg15[(1'h0):(1'h0)]) : {(wire1 ? wire9 : wire11)})));
              reg20 <= {(($unsigned((wire4 ?
                      wire11 : wire5)) <<< $signed($signed((7'h40)))) - ($signed((+(8'h9c))) | ((8'hac) ?
                      ((8'h9e) - (8'had)) : ((8'hba) ? wire5 : wire2)))),
                  (wire9 < (reg18 ?
                      ($unsigned(reg14) ?
                          reg20 : wire2[(4'h8):(3'h6)]) : {(reg14 >> (8'h9e)),
                          $unsigned(wire3)}))};
              reg21 <= (reg13[(4'hf):(4'he)] ? reg15 : reg14);
              reg22 <= $signed(($signed((~wire0)) >> (reg20[(3'h7):(3'h6)] < reg14[(3'h7):(2'h2)])));
              reg23 <= ($unsigned(reg7) ? (-(^~({wire2} > reg17))) : wire10);
            end
        end
    end
  assign wire24 = (-$unsigned(wire2));
  always
    @(posedge clk) begin
      reg25 <= $signed({($unsigned($signed(reg16)) < ((wire6 ?
              (8'haa) : wire4) + (reg16 || reg7)))});
      reg26 <= $signed({(-(~^{reg14, wire8}))});
    end
  module27 #() modinst48 (wire47, clk, wire12, wire11, reg21, wire4, wire5);
endmodule

module module27
#(parameter param46 = {(({(8'ha0), {(8'hb2)}} == (7'h44)) > ({((7'h41) <<< (8'ha1)), (~(8'hbc))} ? (((8'h9e) ? (7'h40) : (8'hae)) >> (~&(8'h9f))) : (((8'h9f) ? (8'h9e) : (7'h42)) ? ((8'ha7) ? (8'hb1) : (8'hbc)) : ((8'ha9) && (7'h43))))), {(((^~(8'ha8)) || {(8'hb5), (8'ha2)}) && (-((8'hb9) <= (8'hbd))))}})
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
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
  assign wire33 = $signed(wire31);
  assign wire34 = ($signed($signed(wire28)) ^~ (+wire32));
  assign wire35 = (8'hbb);
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire35[(3'h7):(2'h3)]) >= (8'had))))
        begin
          if ((wire30 ? wire30 : $unsigned((~&(!(+wire32))))))
            begin
              reg36 <= $unsigned($unsigned(wire34[(3'h4):(2'h3)]));
              reg37 <= $unsigned(wire34);
              reg38 <= ((~|wire32[(2'h2):(2'h2)]) == ((~&{(reg37 ?
                          (8'ha6) : wire28)}) ?
                  $unsigned(($unsigned(wire35) ^~ {wire32})) : ($unsigned(wire32[(3'h7):(1'h1)]) ^ ({wire34,
                          reg36} ?
                      wire31 : ((8'hb5) ? (8'ha6) : wire34)))));
              reg39 <= (^~(reg37 ? reg37 : reg37[(2'h3):(2'h2)]));
              reg40 <= $unsigned((wire31 ~^ ((8'h9e) ?
                  $signed((&reg36)) : wire34)));
            end
          else
            begin
              reg36 <= $unsigned(((8'hb6) == $unsigned(((^reg39) ?
                  $signed(wire34) : (&reg36)))));
              reg37 <= ($signed($signed($signed(wire35))) - {(~&$signed((^reg37))),
                  ((|(^~wire29)) ? reg36[(4'h8):(1'h0)] : wire30)});
              reg38 <= reg37[(3'h6):(3'h6)];
              reg39 <= $unsigned(reg36[(1'h0):(1'h0)]);
              reg40 <= (|$signed((((8'hb9) ?
                      ((8'haa) ? (8'hb1) : (8'had)) : ((8'ha7) + wire32)) ?
                  ($unsigned((8'hb4)) ?
                      wire35[(4'ha):(1'h1)] : (reg36 & wire34)) : ((reg38 ?
                      reg38 : wire33) >>> reg38[(4'ha):(3'h5)]))));
            end
          reg41 <= $unsigned(($unsigned(wire35) ?
              (($unsigned(wire30) ? (wire28 + wire35) : reg39) ?
                  ((wire29 <= (7'h43)) * wire29[(1'h0):(1'h0)]) : wire32) : wire35));
          reg42 <= ({$signed({wire29[(1'h1):(1'h1)],
                  {wire34}})} <<< $signed(wire33));
          reg43 <= ($signed(reg42) ?
              $unsigned(((-(8'hb5)) >= reg37[(3'h4):(1'h0)])) : $signed({(~|$unsigned(wire31))}));
        end
      else
        begin
          if ((((+$signed(reg42)) >= {(reg41[(1'h1):(1'h1)] == (~&reg38))}) | {(^((reg39 >>> (8'ha4)) >= reg36)),
              ({$unsigned(reg42), {reg37, reg36}} ~^ wire30)}))
            begin
              reg36 <= wire28[(4'h8):(1'h1)];
              reg37 <= $signed($signed($unsigned($unsigned(wire28[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg36 <= wire30;
            end
          reg38 <= $unsigned(($unsigned({(wire31 ? reg42 : reg41),
                  $unsigned(reg36)}) ?
              (((~&wire30) == $signed(wire33)) ^~ $unsigned(((8'hb1) ~^ reg37))) : (~((reg42 ?
                  (7'h42) : reg37) << $unsigned(wire32)))));
        end
      reg44 <= $unsigned(wire29);
    end
  always
    @(posedge clk) begin
      reg45 <= ($signed($signed({(wire35 ? (8'haf) : reg36),
              $unsigned(reg44)})) ?
          (reg39[(3'h5):(2'h3)] ?
              $unsigned(((~|wire31) ?
                  (wire29 ^~ wire32) : {wire28})) : (reg42 ^~ $signed(wire33[(1'h1):(1'h0)]))) : {{reg37},
              $signed((wire28 ? ((8'ha6) | reg42) : {reg39}))});
    end
endmodule

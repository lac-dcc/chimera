module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire71;
  assign y = {wire73, wire4, wire5, wire71, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire1;
  module6 #() modinst72 (.wire8(wire5), .wire9(wire3), .wire7(wire1), .wire10(wire4), .y(wire71), .wire11(wire2), .clk(clk));
  assign wire73 = $unsigned(((~wire1[(4'hf):(3'h5)]) ?
                      wire1[(3'h5):(3'h4)] : {$signed(wire0[(3'h5):(1'h1)]),
                          ((wire5 ? wire0 : wire71) > $unsigned(wire3))}));
endmodule

module module6
#(parameter param69 = {({((^~(8'h9e)) < ((7'h42) & (8'ha8))), (((8'ha5) <<< (8'hbe)) ? ((8'hb7) < (8'hb2)) : ((8'ha9) & (8'hb0)))} ? ((((8'had) ? (8'hb9) : (8'ha5)) << {(8'hbd)}) >> {(-(8'h9c))}) : (!((^~(7'h40)) ? ((8'hb5) > (7'h43)) : ((7'h40) ? (8'hb6) : (8'h9e)))))}, 
parameter param70 = (!(((~&{param69, param69}) ? ((~|param69) >= (~(8'hbd))) : ((~&param69) >= (!(8'hb1)))) >> (((&param69) ? param69 : (param69 < param69)) ? ((~param69) ? (!param69) : param69) : param69))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = ($unsigned((&$unsigned($unsigned(wire7)))) ?
                      (wire10 ~^ wire8) : (wire11[(2'h2):(1'h1)] ?
                          (+{(8'ha5), wire10}) : (-wire11)));
  assign wire13 = $unsigned((~wire10[(1'h1):(1'h0)]));
  module14 #() modinst61 (wire60, clk, wire7, wire12, wire10, wire13);
  assign wire62 = $unsigned((wire7 || (wire9 <<< ($unsigned(wire60) ?
                      (wire12 * wire9) : {wire9, wire10}))));
  assign wire63 = (-$unsigned(wire60));
  assign wire64 = wire9;
  assign wire65 = wire60;
  assign wire66 = wire64;
  assign wire67 = wire66[(1'h0):(1'h0)];
  assign wire68 = $unsigned($unsigned($signed(wire8[(3'h7):(1'h1)])));
endmodule

module module14
#(parameter param58 = (((~|{{(8'ha6)}, (~(7'h40))}) ? ((!{(7'h40), (8'h9e)}) ? {((8'ha2) || (8'ha4)), (8'hbb)} : {((8'ha4) <<< (8'hbc)), ((8'h9f) ? (8'hbd) : (8'hb0))}) : {(|{(8'h9c), (7'h44)}), {{(8'hb9)}}}) ? ((((8'ha1) ? ((8'ha1) ? (8'hb9) : (8'hb5)) : (~(8'ha9))) ? (((7'h41) ? (8'ha6) : (8'hae)) ? ((8'h9f) ? (8'ha2) : (8'hb6)) : (&(7'h44))) : ((+(8'haa)) ? ((8'hb4) ? (8'hac) : (8'hab)) : ((8'hbf) ? (8'haa) : (8'hac)))) >>> (((|(8'hbc)) > ((8'hbb) ? (8'h9c) : (8'ha6))) ? (~|((8'ha2) != (8'hbd))) : (((8'had) ? (8'hab) : (8'h9f)) ^~ (+(8'hbd))))) : ({((!(8'had)) ? {(8'hb1)} : ((7'h42) ? (8'ha8) : (8'hae))), (((8'hbe) & (8'haf)) - (8'ha2))} ? (({(8'hb5)} ? ((8'ha0) <= (8'ha3)) : {(8'hab), (8'ha6)}) ? (~&(&(8'had))) : (((8'had) ? (8'ha3) : (8'ha1)) ^ ((8'hb0) ? (8'ha4) : (8'ha0)))) : (~|({(8'hb5)} & (~(8'hb4)))))), 
parameter param59 = (((~param58) | param58) > (((param58 ? (param58 ? (8'ha7) : param58) : (param58 != param58)) ? (8'hb5) : param58) * (8'ha1))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire49,
                 wire48,
                 wire47,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= $signed($signed(wire18));
      reg20 <= wire15[(1'h0):(1'h0)];
      reg21 <= wire15[(2'h2):(1'h0)];
      reg22 <= $signed(wire15[(1'h1):(1'h0)]);
      reg23 <= wire18[(3'h6):(2'h2)];
    end
  assign wire24 = (reg19[(4'h9):(3'h4)] ?
                      $unsigned(wire18[(3'h5):(1'h0)]) : $signed({(^(reg22 ?
                              reg20 : reg21))}));
  assign wire25 = (reg19 < $signed(((8'h9c) ?
                      (wire17 & $signed(reg21)) : {(!wire16), (~^wire18)})));
  assign wire26 = ({($unsigned(wire18[(3'h7):(3'h6)]) ?
                          $unsigned({(8'ha4)}) : (^(reg23 ^ reg23)))} >= reg20[(3'h6):(2'h2)]);
  assign wire27 = reg21[(3'h6):(1'h0)];
  assign wire28 = ($unsigned(((|(wire16 * wire15)) || $unsigned({reg23}))) ?
                      (!$signed((~^$unsigned(reg19)))) : wire18[(1'h1):(1'h0)]);
  assign wire29 = $unsigned($signed((((reg20 & (8'h9d)) ?
                          wire15 : (reg19 || wire15)) ?
                      {((8'hb4) || wire28)} : ($signed(wire15) ?
                          (wire28 != reg21) : reg20[(2'h2):(1'h1)]))));
  assign wire30 = reg21[(4'hc):(4'h9)];
  assign wire31 = (8'h9c);
  always
    @(posedge clk) begin
      if ($unsigned(((reg19[(1'h1):(1'h0)] ^~ reg23[(1'h0):(1'h0)]) != $signed({(~(8'had))}))))
        begin
          if ((reg21[(3'h7):(1'h1)] || (+($unsigned((reg23 ?
              wire27 : wire26)) * (7'h42)))))
            begin
              reg32 <= (wire25[(1'h1):(1'h1)] == (^~((wire24 ?
                      $unsigned((8'h9d)) : ((8'haf) ^~ wire31)) ?
                  $signed(wire25[(3'h6):(3'h4)]) : (^$unsigned(reg23)))));
            end
          else
            begin
              reg32 <= ($unsigned($unsigned(wire16)) ?
                  wire16 : $unsigned((reg22 << (~&reg32[(2'h2):(1'h1)]))));
              reg33 <= reg23[(3'h6):(1'h0)];
              reg34 <= (8'hbc);
              reg35 <= $signed({(((wire26 > wire18) ?
                      (~wire30) : (!wire17)) * $unsigned($unsigned(wire29))),
                  reg34});
            end
        end
      else
        begin
          reg32 <= (&($unsigned($signed({wire27})) ?
              wire17 : {$signed($signed((7'h42)))}));
          reg33 <= ($signed($unsigned(wire26)) <<< (^~wire18));
          reg34 <= ($signed((|(^~(wire29 ? reg22 : reg32)))) ?
              (wire25 <= {(~(~^(8'haa)))}) : {(reg20 == wire31)});
        end
      if (((reg19 ?
          (({wire30} ? reg34 : (reg33 ? wire25 : wire29)) ?
              $unsigned({reg35}) : {(reg34 == (8'hb4)),
                  reg22[(2'h3):(1'h0)]}) : (^~wire28)) ~^ (|wire16[(3'h6):(1'h0)])))
        begin
          reg36 <= (^~wire18);
          reg37 <= (~&reg35[(3'h7):(3'h7)]);
        end
      else
        begin
          reg36 <= (wire16[(3'h5):(3'h4)] ?
              reg36[(3'h5):(3'h4)] : {reg37[(3'h7):(1'h0)],
                  (~&$unsigned(reg36[(3'h7):(3'h5)]))});
          reg37 <= (-wire18);
          reg38 <= {{wire25}, $unsigned((8'had))};
          reg39 <= $signed(wire27[(4'h8):(3'h5)]);
        end
      reg40 <= (~|reg35);
      if (wire28[(4'hc):(4'hb)])
        begin
          reg41 <= (($unsigned(reg22) >>> (wire27[(3'h6):(2'h2)] ?
              $unsigned({reg39}) : wire25[(4'h8):(4'h8)])) - (^$signed($unsigned(reg39[(3'h4):(3'h4)]))));
          reg42 <= $unsigned(wire31[(2'h2):(2'h2)]);
          reg43 <= ({$signed((((7'h44) || reg23) ?
                  (wire29 >>> wire31) : (~|(7'h40))))} << $signed($signed((((8'ha2) ~^ reg42) ?
              $unsigned((8'ha9)) : wire24))));
          reg44 <= reg41[(3'h5):(1'h0)];
        end
      else
        begin
          reg41 <= $signed((reg19[(3'h5):(2'h3)] * reg23));
          if ($signed((reg38[(1'h1):(1'h0)] <= {(~&(reg21 ? reg35 : reg19))})))
            begin
              reg42 <= wire15;
            end
          else
            begin
              reg42 <= {((wire26 ? reg43 : $signed(((8'h9e) ? reg37 : reg41))) ?
                      $unsigned($signed(reg34)) : (~|((reg20 ?
                          reg21 : (8'hac)) ~^ $unsigned(reg38)))),
                  ((((wire30 ^~ (8'ha1)) ^~ (wire18 * wire16)) >> $signed(wire30[(4'h9):(3'h7)])) ?
                      wire17 : ($signed((wire26 ? (8'ha6) : (8'h9c))) ?
                          (wire30[(3'h5):(1'h1)] * (wire17 * wire18)) : ({reg36,
                              reg36} ~^ reg20)))};
              reg43 <= {(($signed(reg38[(4'hb):(3'h5)]) ?
                      $signed(wire28) : wire25[(4'h8):(1'h1)]) >> wire18),
                  $unsigned($unsigned((+(wire16 ? wire24 : wire17))))};
            end
          reg44 <= $unsigned(({$signed((wire15 * reg42))} ?
              (+{reg19}) : (((wire17 + (8'hb1)) ?
                  (reg41 ~^ reg23) : $signed((8'hb0))) - wire15[(2'h2):(1'h0)])));
          reg45 <= (((8'ha8) >> $unsigned((reg35[(3'h5):(3'h4)] ?
                  (!(7'h40)) : ((8'ha7) ? reg32 : (8'hb9))))) ?
              $signed($signed((wire15 <= (&reg42)))) : (^(((+reg35) <= (reg40 ?
                  wire25 : reg39)) | ($signed(wire18) ?
                  $signed(reg34) : wire30[(3'h4):(1'h0)]))));
        end
      reg46 <= (^$unsigned(wire29));
    end
  assign wire47 = (reg43[(3'h4):(1'h0)] || reg19[(5'h11):(3'h7)]);
  assign wire48 = ($unsigned(reg36[(5'h14):(4'he)]) > $unsigned(wire24[(4'ha):(3'h4)]));
  assign wire49 = (!$unsigned($signed(((reg20 > reg40) & {(8'hae)}))));
  always
    @(posedge clk) begin
      reg50 <= $unsigned($signed(reg21));
      reg51 <= {{$unsigned($signed((reg22 ? reg37 : (8'hbb))))}, reg38};
      reg52 <= $unsigned(reg33[(2'h2):(1'h1)]);
      reg53 <= $unsigned(wire24);
    end
  assign wire54 = (!(((wire16[(2'h3):(1'h1)] + reg42[(5'h14):(1'h0)]) ^ ((reg43 ?
                          reg44 : wire47) ?
                      $signed(reg35) : reg51[(4'ha):(3'h5)])) << $unsigned($signed((reg51 ?
                      reg46 : wire25)))));
  assign wire55 = $unsigned($signed(reg40[(3'h4):(3'h4)]));
  assign wire56 = ((|(reg36 ? (^~wire54) : $unsigned(reg32))) ? wire18 : reg51);
  assign wire57 = wire27[(2'h2):(2'h2)];
endmodule

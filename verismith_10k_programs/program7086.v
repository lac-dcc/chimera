module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire66;
  assign y = {wire68, wire5, wire6, wire7, wire66, (1'h0)};
  assign wire5 = (^~(($signed((wire1 ?
                     (7'h44) : wire4)) < $signed(wire2)) * $unsigned(wire0[(3'h5):(1'h1)])));
  assign wire6 = $signed((~^$unsigned((~|(wire0 ? (7'h40) : wire4)))));
  assign wire7 = $unsigned(((^~wire0[(2'h3):(1'h1)]) ^ wire2));
  module8 #() modinst67 (.wire9(wire3), .wire11(wire2), .wire13(wire1), .wire10(wire0), .wire12(wire5), .clk(clk), .y(wire66));
  assign wire68 = ((($signed((wire3 ? (8'hb0) : wire6)) ?
                              ((wire4 ?
                                  wire7 : wire66) | $unsigned(wire4)) : ({wire4,
                                      wire1} ?
                                  (~|(8'ha2)) : wire2[(3'h6):(3'h6)])) ?
                          wire6[(1'h0):(1'h0)] : $unsigned(wire2[(5'h11):(4'h9)])) ?
                      (^~(~{wire3[(3'h4):(2'h3)],
                          (wire7 + wire4)})) : wire1[(5'h12):(5'h11)]);
endmodule

module module8
#(parameter param64 = (&{((&((8'ha2) >= (8'hb3))) ? (|{(8'hb1), (8'ha2)}) : {{(8'h9e)}, {(8'hb4)}})}), 
parameter param65 = (8'ha3))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire34;
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire56,
                 wire55,
                 wire14,
                 wire15,
                 wire34,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire14 = $unsigned((8'had));
  assign wire15 = (+wire11[(3'h6):(1'h0)]);
  module16 #() modinst35 (wire34, clk, wire15, wire9, wire12, wire10, wire13);
  always
    @(posedge clk) begin
      if ((wire9[(2'h3):(2'h3)] - wire11))
        begin
          reg36 <= $signed(wire13);
          reg37 <= wire11;
          reg38 <= wire9;
          reg39 <= ($signed(($unsigned(wire15) ?
              reg37 : $unsigned({(8'ha7)}))) ^~ $signed($unsigned($unsigned((^wire9)))));
          reg40 <= $unsigned($signed((&(&wire34))));
        end
      else
        begin
          reg36 <= (wire34[(1'h0):(1'h0)] ?
              ($unsigned(wire34) ?
                  {$signed((~|wire15))} : (!wire13)) : reg37[(2'h2):(2'h2)]);
          reg37 <= (~|{$signed($unsigned(reg37)), wire14});
          if (((+(+((reg36 ? (7'h44) : reg37) ?
              ((8'hab) || reg39) : $signed(wire15)))) >= wire15[(1'h1):(1'h0)]))
            begin
              reg38 <= (~|$unsigned(((wire9[(2'h2):(2'h2)] >= (wire15 & wire11)) ?
                  (~^wire15) : wire12[(1'h0):(1'h0)])));
            end
          else
            begin
              reg38 <= (reg37 | $unsigned(reg36));
              reg39 <= $signed((reg37[(3'h6):(3'h6)] ?
                  ((+(wire15 >= wire13)) & $unsigned(wire13)) : (&({reg36,
                          reg37} ?
                      reg39[(1'h1):(1'h0)] : $unsigned(wire15)))));
              reg40 <= $unsigned(reg38);
            end
          reg41 <= wire11;
        end
      reg42 <= ((wire15 == wire12) & (~^{(|wire9),
          (reg36[(1'h1):(1'h1)] ? reg41 : $unsigned(reg37))}));
      reg43 <= wire11[(4'h9):(1'h0)];
      reg44 <= $signed(reg43);
      if ({wire34})
        begin
          if (((8'hb5) < (($signed((reg37 * reg37)) ?
                  ($signed(reg36) ~^ wire13[(5'h11):(4'h8)]) : $signed(wire34[(1'h1):(1'h1)])) ?
              (!wire10) : $unsigned(reg40))))
            begin
              reg45 <= ((~(reg37[(3'h4):(1'h1)] ? wire14 : $signed((-wire9)))) ?
                  (^reg42[(4'h8):(4'h8)]) : $unsigned($unsigned($unsigned($unsigned(reg36)))));
              reg46 <= (&reg39[(4'hc):(1'h0)]);
              reg47 <= reg44;
              reg48 <= wire9;
              reg49 <= (!$unsigned(({$unsigned(reg45),
                  wire11} != (reg38[(2'h3):(2'h3)] | wire34))));
            end
          else
            begin
              reg45 <= {$unsigned($signed($signed($signed(reg40)))), reg48};
              reg46 <= (~$unsigned(reg46[(4'h8):(4'h8)]));
              reg47 <= reg37;
              reg48 <= reg41;
            end
          reg50 <= ((+(+(!$unsigned(reg42)))) ?
              (({(^wire11), $signed(wire9)} ?
                  $signed((wire9 | wire12)) : wire34[(2'h2):(1'h1)]) - $signed($signed($unsigned(reg46)))) : (wire10[(4'hb):(2'h3)] >> ((8'hbf) ?
                  ($signed(reg42) && $unsigned(reg47)) : (wire15 || $unsigned(reg45)))));
          if ($signed(reg47))
            begin
              reg51 <= reg37;
              reg52 <= $unsigned({(&(-(~&reg40)))});
            end
          else
            begin
              reg51 <= (~&(wire11 ~^ (~(~|reg45))));
              reg52 <= $unsigned((8'hb0));
            end
          reg53 <= {reg51, $unsigned(reg36[(4'h9):(3'h6)])};
          reg54 <= (8'ha8);
        end
      else
        begin
          reg45 <= $unsigned((~{$signed($unsigned((8'haa)))}));
          reg46 <= (8'hb0);
          reg47 <= {$signed((~&{(+reg53), $signed(reg36)})),
              $unsigned({reg42[(3'h7):(1'h1)]})};
        end
    end
  assign wire55 = ($signed(((reg37 <<< {(8'ha6)}) ~^ ($unsigned(wire15) && wire11[(3'h5):(2'h2)]))) ?
                      $signed(((8'h9e) >= (^~(reg48 >= reg44)))) : reg45[(2'h3):(2'h3)]);
  assign wire56 = reg51;
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire10[(2'h2):(2'h2)])))
        begin
          reg57 <= $unsigned((-{{wire56, $unsigned(wire10)},
              wire10[(3'h4):(1'h0)]}));
        end
      else
        begin
          reg57 <= wire9[(1'h1):(1'h0)];
          reg58 <= $signed(((reg45[(4'h8):(1'h0)] ?
              ((reg51 ? wire55 : reg54) ?
                  (+wire9) : $unsigned(wire9)) : {$unsigned(reg42)}) ^ $signed(($unsigned(wire12) ?
              $unsigned(reg36) : reg50))));
          reg59 <= wire34[(1'h1):(1'h1)];
          reg60 <= $signed(reg59);
          reg61 <= (8'hb0);
        end
    end
  assign wire62 = (!reg52);
  assign wire63 = (reg43 - {(^~$signed(reg54[(1'h0):(1'h0)])),
                      $unsigned(reg38)});
endmodule

module module16
#(parameter param33 = (((~^((8'hbe) ? ((8'hb0) ? (8'hba) : (7'h40)) : (8'h9c))) - {((~&(8'hbc)) ? ((8'hb7) - (8'haa)) : ((8'ha4) << (8'hbe))), (((8'ha8) ? (7'h44) : (8'ha4)) >= ((7'h40) + (8'hb7)))}) >>> (({(|(8'hbc))} ? (8'hb9) : {((8'hb8) ? (8'hb7) : (8'ha1)), {(8'hb2)}}) ~^ (&((!(8'hbe)) <<< ((8'hb1) ? (8'hba) : (8'hbd)))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire21;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg30,
                 (1'h0)};
  assign wire22 = wire18;
  assign wire23 = wire21[(1'h0):(1'h0)];
  assign wire24 = wire21[(1'h0):(1'h0)];
  assign wire25 = (+($signed(wire23) ?
                      ($unsigned({wire24}) ?
                          (~&(8'hb2)) : $unsigned($unsigned(wire24))) : wire18[(3'h7):(3'h7)]));
  assign wire26 = wire17;
  assign wire27 = ($signed(wire26[(4'ha):(3'h6)]) ?
                      wire22 : (!$signed(wire17)));
  assign wire28 = (({((wire24 >> wire22) || (wire19 ? wire25 : wire24))} ?
                          (((wire22 << wire17) ? (8'h9d) : (~wire27)) ?
                              $signed($signed((8'hae))) : (wire18[(1'h0):(1'h0)] ?
                                  (wire17 ?
                                      (8'h9e) : (8'haf)) : wire21)) : wire20[(4'h9):(2'h3)]) ?
                      (($unsigned($unsigned(wire19)) ?
                          ((wire25 ? wire25 : wire17) ?
                              (wire26 ?
                                  (8'ha0) : wire21) : $signed(wire22)) : ($unsigned(wire26) ?
                              (!wire17) : (wire17 - wire23))) < ($signed($unsigned(wire20)) != $signed($signed(wire25)))) : wire24[(3'h4):(3'h4)]);
  assign wire29 = (((wire24 - wire19[(3'h6):(3'h6)]) ?
                      $signed($signed({wire23})) : (^wire17)) >> $unsigned((wire20[(1'h1):(1'h1)] || wire23[(3'h5):(2'h2)])));
  always
    @(posedge clk) begin
      reg30 <= (&(|($signed($unsigned(wire25)) >= $unsigned((wire22 ?
          wire19 : wire21)))));
    end
  assign wire31 = ((&($unsigned($signed(wire21)) ?
                      $unsigned({wire25,
                          wire29}) : wire25)) ~^ (^~$unsigned(wire20[(3'h6):(3'h4)])));
  assign wire32 = ($unsigned($signed((8'ha9))) ?
                      ($unsigned(((wire24 <<< wire25) >> (+wire20))) & wire21) : (|$unsigned(wire29[(2'h2):(1'h1)])));
endmodule

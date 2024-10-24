module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire52;
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 reg62,
                 (1'h0)};
  module4 #() modinst53 (wire52, clk, wire3, wire0, wire2, wire1, (8'hb9));
  assign wire54 = wire0[(2'h3):(2'h2)];
  assign wire55 = ($signed({wire2, wire2}) >>> $signed(((wire2 ?
                          $signed(wire2) : wire54) ?
                      ($signed(wire0) & (~wire1)) : wire0[(3'h5):(1'h0)])));
  assign wire56 = (~|($unsigned({$unsigned(wire0), (~^wire2)}) ?
                      ({$signed(wire54)} ?
                          ((wire1 & wire52) != (^~wire1)) : wire3[(5'h10):(4'hd)]) : wire3[(4'hc):(2'h2)]));
  assign wire57 = $unsigned((wire2[(4'h8):(3'h7)] ?
                      wire56 : wire54[(3'h6):(1'h0)]));
  assign wire58 = wire3[(4'h9):(3'h6)];
  assign wire59 = wire57;
  assign wire60 = $signed({$signed(wire59), wire0[(3'h7):(3'h4)]});
  assign wire61 = (8'haa);
  always
    @(posedge clk) begin
      reg62 <= ((|($signed(((8'hac) + wire0)) > ({wire2,
          wire59} >> ((7'h42) >= wire2)))) - wire58);
    end
  assign wire63 = ($unsigned(wire52) ?
                      wire54 : ($signed($signed((wire60 <= (8'ha1)))) ?
                          ((-wire3[(2'h3):(2'h2)]) < $signed(wire55[(5'h11):(2'h3)])) : $unsigned(((wire60 >> wire59) ?
                              (wire59 && wire2) : $unsigned(wire0)))));
  assign wire64 = $signed($signed((wire56 ?
                      {wire56[(3'h5):(3'h4)], (8'ha1)} : {(wire58 ?
                              (7'h42) : (8'hae)),
                          wire56[(2'h3):(2'h2)]})));
endmodule

module module4
#(parameter param51 = (^(((-((8'ha9) ? (8'hbf) : (8'ha5))) ? ({(8'hb6), (8'h9f)} ? {(8'hb2)} : ((8'hba) <= (8'hb9))) : (((8'ha4) << (8'hbc)) ? ((8'hbd) ^ (8'hab)) : {(8'hb7)})) ? ((((7'h43) ? (8'hbb) : (8'hbb)) < ((8'ha2) ? (8'hb5) : (8'hbe))) ? (((8'h9f) ? (8'ha3) : (8'h9d)) == ((8'haf) <= (8'haf))) : (-((8'hb6) ? (8'hb6) : (8'h9d)))) : (8'ha6))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire5;
  input wire [(4'ha):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire44;
  assign y = {wire50, wire49, wire48, wire47, wire46, wire10, wire44, (1'h0)};
  assign wire10 = {$unsigned($signed($signed((wire5 >= wire8)))),
                      $signed((&wire6[(3'h4):(2'h3)]))};
  module11 #() modinst45 (.wire15(wire6), .y(wire44), .clk(clk), .wire13(wire5), .wire12(wire7), .wire16(wire9), .wire14(wire8));
  assign wire46 = $signed($unsigned({{(wire7 <<< (8'hbe))},
                      $signed((wire44 ? wire5 : wire7))}));
  assign wire47 = ($unsigned($signed(((wire5 * wire9) <<< (wire6 ?
                          wire10 : (8'hbc))))) ?
                      (|$signed((~(8'hae)))) : $signed($unsigned($signed((wire44 ?
                          wire6 : wire46)))));
  assign wire48 = wire46;
  assign wire49 = wire8;
  assign wire50 = $signed((($signed($unsigned((8'ha3))) >> wire8) ?
                      $unsigned(wire8[(3'h5):(2'h3)]) : ($unsigned({wire48,
                          wire48}) >= wire46[(1'h1):(1'h0)])));
endmodule

module module11
#(parameter param42 = (((^~((^(8'ha8)) | ((8'hb5) ? (8'ha2) : (8'hb9)))) ? ((~|((8'haf) ~^ (8'hae))) && ({(8'hab), (7'h41)} ? ((7'h41) ? (8'h9d) : (8'hbf)) : (+(8'h9c)))) : {(((8'ha2) ? (8'hb4) : (8'hae)) ? (+(8'hb8)) : ((8'hb0) ? (8'h9e) : (8'ha5)))}) ? (!(((~^(8'ha4)) > (!(8'had))) ? (((8'ha9) ? (8'h9c) : (8'hb1)) ? ((8'ha0) ? (8'hba) : (8'hae)) : ((8'ha6) ? (8'ha6) : (7'h42))) : {((8'hab) || (8'had))})) : {(({(8'hab)} ? ((8'h9e) ? (8'ha9) : (8'h9e)) : ((8'ha5) ~^ (8'hb9))) && {(~^(8'ha8)), ((7'h40) ? (8'hb8) : (8'haf))}), (({(7'h42), (8'ha8)} ? ((8'ha1) ? (8'haf) : (8'hb2)) : ((8'haa) < (7'h41))) ? {((8'hbd) >= (8'hbd))} : ((~|(8'hb5)) + ((8'had) ? (8'hb4) : (8'hb4))))}), 
parameter param43 = {(param42 ? (|((8'h9c) >= (^param42))) : (-((&param42) ? (param42 * param42) : (param42 || param42)))), (!param42)})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire17;
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire17,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire17 = ($signed($unsigned(wire13)) + wire15);
  always
    @(posedge clk) begin
      reg18 <= {(~&((wire17 - (8'h9e)) ?
              wire14[(1'h0):(1'h0)] : ({wire12} ?
                  wire13 : (wire13 != (8'h9f))))),
          (($signed(wire16) ~^ ($unsigned(wire15) ?
              ((8'ha0) ? wire15 : wire12) : (~|wire14))) >= $unsigned(wire16))};
      reg19 <= (wire17 ?
          ((!(wire14[(1'h0):(1'h0)] ? $unsigned(wire12) : $signed(reg18))) ?
              ($signed(((8'ha9) != wire12)) ?
                  (|$signed(wire14)) : $signed((reg18 << wire15))) : wire14[(2'h2):(1'h1)]) : ({({(8'ha5)} ?
                  wire15[(2'h2):(2'h2)] : wire12)} <= (7'h43)));
      reg20 <= $signed({$unsigned($signed(wire13)), wire15});
    end
  assign wire21 = wire14;
  assign wire22 = (wire13 <= wire13);
  always
    @(posedge clk) begin
      if (wire14)
        begin
          if (($signed($unsigned($signed(wire13[(1'h0):(1'h0)]))) ?
              {(^(7'h40)),
                  (~&(wire16 ?
                      wire22[(2'h3):(1'h0)] : $unsigned(wire15)))} : ($signed(($signed(reg20) ^ $signed(reg20))) ?
                  wire21 : $unsigned(($signed(wire12) ?
                      wire16[(4'h8):(3'h6)] : reg20[(5'h15):(5'h14)])))))
            begin
              reg23 <= reg20[(5'h12):(1'h0)];
            end
          else
            begin
              reg23 <= {{wire15[(3'h7):(3'h7)],
                      {wire21[(4'ha):(3'h7)], {$signed((8'hbe))}}}};
              reg24 <= $unsigned(reg19);
            end
          reg25 <= {reg19[(2'h2):(1'h0)]};
        end
      else
        begin
          reg23 <= wire16[(2'h2):(2'h2)];
          if ((-(|$signed(((~^reg18) * (8'ha9))))))
            begin
              reg24 <= $signed((~((~{wire15, (7'h40)}) + (&(+wire15)))));
              reg25 <= (wire17 ?
                  {(($signed(reg24) >= (wire13 ^~ reg20)) | {(reg23 ?
                              wire15 : reg23),
                          $unsigned(wire12)})} : (reg25[(3'h6):(1'h1)] ?
                      reg24 : $signed({reg20})));
              reg26 <= wire21;
              reg27 <= reg20[(5'h13):(4'hf)];
            end
          else
            begin
              reg24 <= wire13;
              reg25 <= $unsigned((wire22[(1'h1):(1'h1)] ?
                  ((^{(8'hb5), wire12}) ?
                      $signed(((8'hb0) ?
                          reg25 : (8'ha7))) : wire16[(5'h12):(4'h8)]) : wire15));
              reg26 <= $unsigned((&($unsigned((wire21 * reg23)) ?
                  reg25 : wire14)));
            end
          if ((^~(~&$signed((&reg19[(2'h2):(2'h2)])))))
            begin
              reg28 <= wire12[(3'h7):(2'h2)];
              reg29 <= (wire13 ?
                  ($unsigned((((8'hbc) && wire13) > {reg19, reg28})) ?
                      ({reg20[(2'h2):(1'h0)], $signed(reg23)} ?
                          reg18 : (~(reg24 | wire12))) : $signed(reg23[(2'h3):(1'h1)])) : ($signed(((!reg18) ?
                          wire17 : (|(7'h41)))) ?
                      wire12[(3'h5):(1'h0)] : (-(reg24 << (~|wire16)))));
              reg30 <= ($unsigned($signed($signed($unsigned(reg24)))) >>> (reg23[(2'h3):(1'h0)] ?
                  wire16[(4'h8):(3'h5)] : $signed((reg23[(4'hc):(3'h4)] ?
                      $signed((8'hb7)) : $unsigned(reg28)))));
              reg31 <= (8'hab);
              reg32 <= (8'hba);
            end
          else
            begin
              reg28 <= $signed($unsigned(reg27));
              reg29 <= {(reg27 ?
                      $unsigned((8'hb8)) : (wire21 ?
                          reg24 : ({reg31} ?
                              $signed(reg27) : $unsigned(reg32)))),
                  ($unsigned(reg29) ^~ reg20)};
              reg30 <= reg29;
            end
          if (((($unsigned((&reg31)) ?
                  $unsigned((reg20 ?
                      reg25 : reg26)) : $unsigned($signed(wire22))) && ((-$unsigned(reg32)) ?
                  $unsigned($unsigned(reg23)) : $signed((~wire12)))) ?
              reg32[(3'h6):(1'h0)] : (wire17 || reg27)))
            begin
              reg33 <= reg32;
              reg34 <= reg31[(2'h2):(2'h2)];
              reg35 <= ((~^(~|$unsigned($unsigned(wire13)))) ?
                  $unsigned(((8'hbf) ?
                      (reg23 <<< {wire14}) : reg30)) : wire21[(3'h4):(2'h3)]);
              reg36 <= $signed((reg28 ?
                  (wire14 ? reg18[(2'h3):(1'h1)] : (8'ha7)) : reg19));
            end
          else
            begin
              reg33 <= ((~&wire15[(1'h1):(1'h1)]) ^ $signed((~{(-reg30)})));
              reg34 <= reg36[(2'h3):(2'h3)];
              reg35 <= reg25[(4'hc):(3'h5)];
            end
        end
      if (($unsigned(((reg29[(2'h2):(1'h0)] - reg23) == wire13)) < $unsigned((^~{(wire13 || reg30)}))))
        begin
          reg37 <= (&reg24);
          reg38 <= wire17;
        end
      else
        begin
          if ((reg26 ^ {$signed((reg26 == ((8'hb6) ? reg32 : reg37)))}))
            begin
              reg37 <= $unsigned((~&(reg38[(1'h1):(1'h0)] ?
                  (reg35 && (reg28 ? reg23 : reg37)) : ((reg37 - wire16) ?
                      $unsigned(reg32) : $unsigned(wire13)))));
            end
          else
            begin
              reg37 <= $signed(wire17);
              reg38 <= ($signed(wire16[(5'h14):(4'he)]) ?
                  (-((((8'hbe) <<< (8'ha7)) - (reg36 ? reg34 : wire16)) ?
                      $signed($unsigned(wire14)) : (8'hba))) : ({reg32[(3'h4):(1'h1)]} > $unsigned($signed((reg33 <= reg25)))));
              reg39 <= wire22[(2'h2):(2'h2)];
            end
          reg40 <= ($unsigned(wire12) ?
              (({reg34, (reg32 ^ (7'h44))} ?
                      reg31[(1'h0):(1'h0)] : reg20[(3'h4):(2'h3)]) ?
                  (8'ha8) : (reg18 ?
                      {((8'h9c) ? reg31 : wire16),
                          {(8'hbb),
                              reg25}} : {(~|reg36)})) : $signed($signed(wire13[(3'h7):(3'h5)])));
        end
      reg41 <= $signed($unsigned(reg36));
    end
endmodule

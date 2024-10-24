module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire66,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 (1'h0)};
  assign wire4 = (~|{(($signed(wire3) & {wire0, (8'ha2)}) ?
                         (~^(wire2 << wire0)) : ((wire1 & wire3) <<< wire0[(3'h4):(2'h3)])),
                     {(wire1 <= {(8'hbc), wire3}), $signed($signed(wire3))}});
  assign wire5 = ({(~^wire4)} ?
                     {(8'ha4)} : (($signed((-wire4)) <<< ({(8'ha1)} && {wire2,
                             wire0})) ?
                         (wire4[(4'hb):(2'h2)] ~^ ((wire3 == wire3) << {wire4,
                             wire0})) : (wire3[(2'h3):(1'h1)] | $signed((~^(8'ha8))))));
  assign wire6 = {(&{$unsigned(wire1[(4'hc):(2'h2)])})};
  always
    @(posedge clk) begin
      reg7 <= {(~|$unsigned(wire4[(4'hb):(3'h5)])),
          ($signed($signed($unsigned(wire1))) ~^ (^~(8'ha1)))};
    end
  assign wire8 = $unsigned($signed((&reg7)));
  assign wire9 = (+wire3[(4'hd):(4'h8)]);
  module10 #() modinst67 (.wire11(wire3), .wire14(wire5), .y(wire66), .wire13(wire2), .clk(clk), .wire12(wire8));
  assign wire68 = wire5;
  assign wire69 = $signed($signed((wire3[(4'hf):(2'h2)] + $unsigned(wire0))));
endmodule

module module10
#(parameter param65 = {(((((8'ha7) ? (8'ha1) : (8'haa)) ? ((8'hb7) ? (8'h9d) : (8'ha2)) : (~&(7'h42))) & (((8'hb7) ? (8'hb0) : (8'ha7)) <= (~|(8'ha4)))) ? (~&(~&{(8'hb9), (8'had)})) : (~|(&{(8'hbf)})))})
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
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
                 reg26,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire11)
        begin
          reg15 <= (|(({$signed(wire13), (~&wire12)} ?
                  wire11[(2'h3):(1'h0)] : $signed((8'hb3))) ?
              (wire13 >> $signed($unsigned(wire12))) : $signed($signed({wire11}))));
        end
      else
        begin
          if ($unsigned((8'ha6)))
            begin
              reg15 <= $unsigned(($signed((wire13[(4'ha):(4'ha)] <= (reg15 ?
                      wire13 : wire11))) ?
                  (~$unsigned((~reg15))) : $unsigned($unsigned(((8'hb5) || (8'hbf))))));
              reg16 <= wire14[(1'h1):(1'h1)];
              reg17 <= $signed(($unsigned($signed($signed(reg16))) ^ wire11[(3'h4):(1'h0)]));
              reg18 <= (^$unsigned($signed({(~|wire14), reg17})));
              reg19 <= reg15[(3'h5):(3'h4)];
            end
          else
            begin
              reg15 <= wire14;
              reg16 <= ({(+{(|(8'hb1))})} * $unsigned($signed(((reg18 ?
                      (8'h9e) : reg19) ?
                  ((8'h9d) ? (8'hb2) : reg15) : {reg18, reg18}))));
              reg17 <= reg19;
            end
        end
      if ((^~$unsigned((reg19 & $unsigned(reg16[(2'h3):(2'h2)])))))
        begin
          reg20 <= reg19;
          reg21 <= (~|wire14);
          reg22 <= ($unsigned((reg17[(1'h1):(1'h0)] || {{reg19}})) < ((~^$unsigned((wire11 > reg20))) + ((8'hbd) + ((~^wire14) != (|reg17)))));
          reg23 <= {((^~((8'hb8) ?
                  $unsigned(reg21) : reg22)) == $unsigned(reg20))};
        end
      else
        begin
          reg20 <= (&(((^~(wire14 ?
              reg22 : reg18)) > $signed((8'ha8))) && $unsigned($unsigned($signed(wire12)))));
          reg21 <= (~^reg23[(1'h0):(1'h0)]);
          reg22 <= {($unsigned(reg15) ?
                  wire12[(4'hf):(1'h1)] : $unsigned({reg21[(1'h0):(1'h0)],
                      (reg16 ? reg22 : reg20)})),
              $unsigned($unsigned((~reg23)))};
          reg23 <= $signed($unsigned($unsigned((^(wire13 ^ wire11)))));
        end
    end
  assign wire24 = $signed((~$signed((~reg17))));
  assign wire25 = reg23[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg26 <= ($signed({(~^$signed(reg18)),
          ((&reg19) & {reg19, reg22})}) + ((~&({reg18} ?
              $unsigned(wire25) : (reg17 ? reg16 : wire11))) ?
          (!wire25) : {(^$signed(reg17)), $signed(reg16[(5'h11):(4'hd)])}));
    end
  assign wire27 = reg18[(1'h1):(1'h0)];
  assign wire28 = {reg21};
  assign wire29 = $signed((!reg17[(4'hc):(3'h7)]));
  assign wire30 = $unsigned($unsigned(reg20));
  assign wire31 = reg22;
  assign wire32 = wire11[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg33 <= $signed(reg15[(4'hd):(3'h6)]);
      reg34 <= $signed($unsigned((^~(reg20 <<< $unsigned(reg16)))));
      if ((8'hbc))
        begin
          reg35 <= (~|((~^wire29[(1'h1):(1'h0)]) && $unsigned((^~(reg26 > wire31)))));
          reg36 <= reg15;
          reg37 <= ({wire24[(1'h1):(1'h1)]} ?
              ($signed((~$unsigned(reg16))) ?
                  ({{wire32, reg19}} ?
                      wire12 : ($signed((8'haa)) != reg26[(4'ha):(1'h1)])) : (&wire25[(4'h8):(1'h0)])) : reg20);
        end
      else
        begin
          reg35 <= $unsigned((({wire31} ?
              reg18 : $signed((wire12 && reg34))) <<< wire13));
          reg36 <= reg34;
          if ((^~$signed((^$unsigned(wire13[(3'h5):(2'h2)])))))
            begin
              reg37 <= $signed({(reg15 ~^ $signed(((8'hb0) ?
                      wire27 : wire28)))});
              reg38 <= reg17[(4'hb):(2'h2)];
              reg39 <= $signed($signed(reg16[(5'h11):(5'h11)]));
            end
          else
            begin
              reg37 <= (~^(8'ha0));
              reg38 <= $unsigned(reg22);
            end
        end
      reg40 <= reg26[(4'h9):(3'h7)];
      reg41 <= $signed((wire32 ?
          {reg40[(3'h7):(1'h0)],
              $signed(reg19)} : $unsigned($unsigned(reg26))));
    end
  always
    @(posedge clk) begin
      reg42 <= $signed($signed((($signed(reg26) ?
              wire31[(3'h4):(1'h0)] : ((8'hb2) ^~ reg26)) ?
          (8'ha7) : wire28)));
      reg43 <= ((^~($unsigned($unsigned((8'ha7))) * (&(&reg34)))) ?
          ({((wire12 ? reg19 : wire27) ?
                      reg34[(3'h7):(3'h4)] : ((8'hbc) ? wire13 : reg23))} ?
              (!wire32) : $unsigned((reg19 * (|(8'hbb))))) : $unsigned(($unsigned((reg33 ?
              wire28 : wire30)) != reg35[(4'hc):(1'h0)])));
      reg44 <= reg23[(4'hb):(4'hb)];
    end
  assign wire45 = ((~(reg39[(1'h1):(1'h1)] <<< ((~reg35) ?
                          reg44[(1'h1):(1'h0)] : {(8'h9d)}))) ?
                      ($unsigned($signed($unsigned(reg37))) >> reg36) : $signed(wire30[(1'h0):(1'h0)]));
  assign wire46 = ($unsigned($unsigned(({wire24, wire30} | reg17))) ?
                      reg35 : (&$signed((|$unsigned((8'hae))))));
  assign wire47 = ($signed($signed({(~(8'hb8)),
                      wire13})) & reg38[(2'h2):(1'h0)]);
  assign wire48 = $unsigned(reg33);
  assign wire49 = (~|reg38);
  assign wire50 = wire11[(1'h1):(1'h0)];
  assign wire51 = ($unsigned(((((8'ha1) | wire24) ?
                              $signed(reg26) : $unsigned(reg40)) ?
                          $signed(reg35) : reg35)) ?
                      reg42[(4'h8):(3'h6)] : $unsigned(($signed((reg16 >> wire29)) ?
                          $signed($unsigned((8'haf))) : $signed(wire14[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg52 <= ({$signed($unsigned((reg16 != reg26)))} ?
          reg36[(3'h4):(2'h2)] : {reg34[(2'h2):(1'h0)],
              ((reg20 >> reg43) - (reg17 || (&reg15)))});
      reg53 <= reg33[(2'h3):(1'h0)];
      if ($signed((($unsigned((~&reg43)) + $signed(reg17)) ?
          reg18 : reg35[(4'hb):(4'h9)])))
        begin
          reg54 <= ($unsigned((reg15[(4'h8):(4'h8)] ? (8'hb4) : reg42)) ?
              (($unsigned({wire31, (8'hbb)}) ? $unsigned((|reg18)) : reg40) ?
                  $unsigned(reg35[(5'h10):(1'h1)]) : (reg16[(1'h1):(1'h0)] ?
                      $unsigned($unsigned(reg17)) : ($unsigned(wire31) - reg53[(3'h7):(1'h0)]))) : {$signed(wire24[(2'h2):(1'h0)]),
                  wire47[(4'h9):(2'h3)]});
          reg55 <= $signed(reg53);
          if (wire50[(1'h0):(1'h0)])
            begin
              reg56 <= (^({(wire11 - reg37)} ^~ ($unsigned((reg36 == reg17)) ?
                  $signed((~(8'hb6))) : wire29)));
              reg57 <= $unsigned({(~^reg19)});
              reg58 <= wire50;
              reg59 <= {(((reg19 ?
                      ((8'had) < wire32) : (reg23 ?
                          wire12 : wire50)) ^ ({reg58} >>> reg33)) <<< {wire12[(4'h9):(2'h3)]})};
            end
          else
            begin
              reg56 <= ((~|(~wire46)) ?
                  ($unsigned($unsigned((reg19 + wire51))) ?
                      (((wire13 > reg42) ?
                              reg26[(4'he):(4'hd)] : wire24[(1'h1):(1'h1)]) ?
                          $signed($unsigned(wire13)) : reg56) : {((wire31 ^ wire12) >>> $signed((8'ha2))),
                          $signed($signed(wire31))}) : reg58);
              reg57 <= $unsigned(reg26);
              reg58 <= reg56;
              reg59 <= (((wire31[(1'h0):(1'h0)] ^~ $unsigned(wire51[(2'h3):(2'h2)])) ?
                  wire11[(2'h3):(1'h1)] : (((reg17 ? wire28 : wire45) ?
                      (wire50 ?
                          reg15 : reg17) : (|wire45)) << (((8'hbd) >>> (8'ha2)) >>> (~&wire46)))) ^ $signed(wire50[(1'h1):(1'h0)]));
              reg60 <= $signed(wire32[(5'h13):(4'hb)]);
            end
          reg61 <= ({$unsigned($signed(reg19)),
              $signed(((~^reg22) ?
                  reg52[(3'h5):(2'h2)] : reg41[(2'h3):(2'h3)]))} >= (&reg17));
          reg62 <= reg52[(4'h8):(3'h6)];
        end
      else
        begin
          reg54 <= (+$unsigned($signed(reg26)));
          reg55 <= (^~((reg18[(2'h3):(1'h0)] ?
                  $unsigned({reg16, wire13}) : $signed({reg36})) ?
              $unsigned(reg34[(3'h7):(1'h1)]) : {reg57[(3'h5):(2'h2)]}));
        end
      reg63 <= wire12;
      reg64 <= (^$signed(reg36));
    end
endmodule

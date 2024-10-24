module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire63;
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  assign y = {wire68,
                 wire65,
                 wire9,
                 wire63,
                 reg67,
                 reg66,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3[(2'h3):(2'h2)];
      reg5 <= (8'had);
      reg6 <= $unsigned(wire3[(2'h2):(1'h0)]);
      reg7 <= {({($signed((8'hb9)) ? (reg5 | (8'hb1)) : (reg5 ? wire1 : wire1)),
                  ($unsigned(wire0) ? (~wire2) : (wire0 ? reg6 : wire0))} ?
              (~^wire3) : (((wire0 + wire0) ?
                  (wire2 != reg4) : $signed(wire2)) ^~ $unsigned((reg6 ^ (8'hbf)))))};
      reg8 <= ($unsigned($unsigned(reg6[(3'h5):(3'h5)])) ~^ $signed({{(reg7 ?
                  wire1 : reg7)}}));
    end
  assign wire9 = (|$unsigned($unsigned((((8'hbd) ?
                     reg4 : reg6) <<< (~wire1)))));
  module10 #() modinst64 (wire63, clk, wire3, reg4, reg5, reg6);
  assign wire65 = ((|$unsigned(((^reg4) ?
                      (^wire2) : $signed(reg7)))) <<< wire2[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg66 <= (reg8[(2'h2):(1'h0)] ?
          (wire63[(2'h3):(1'h0)] | $signed((~^{reg5, wire9}))) : wire65);
      reg67 <= $signed(wire0);
    end
  assign wire68 = {$unsigned(wire1), reg67[(1'h0):(1'h0)]};
endmodule

module module10
#(parameter param62 = {((~^{{(7'h40)}, {(8'ha3), (8'hbf)}}) - ((((8'haf) ? (8'ha0) : (8'hbd)) ? ((8'hbe) - (8'h9c)) : {(8'ha8), (8'hba)}) * {((8'hb1) == (8'hb0))}))})
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire16,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= wire14;
    end
  assign wire16 = wire11[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if (reg15)
        begin
          if ((wire14[(2'h2):(1'h1)] ?
              {((wire12[(5'h10):(3'h4)] != wire13[(4'h9):(3'h5)]) >>> ((|(8'hb7)) ^ $signed(wire13))),
                  wire13} : $signed(wire13[(3'h6):(1'h0)])))
            begin
              reg17 <= {$unsigned({$signed($unsigned((8'hbb)))})};
            end
          else
            begin
              reg17 <= {{$unsigned($unsigned($unsigned(reg15)))}};
              reg18 <= wire14[(1'h1):(1'h0)];
              reg19 <= ($unsigned({reg17, (~|(wire14 + wire13))}) ?
                  (wire16[(4'ha):(4'ha)] ?
                      ({$signed(reg15)} - $signed((!(8'hb0)))) : ((~wire11[(1'h1):(1'h1)]) ?
                          reg17 : wire13[(2'h3):(1'h0)])) : {$signed({$signed(wire12),
                          (wire14 ? wire13 : wire11)}),
                      $signed(wire14)});
            end
          reg20 <= ($signed({$unsigned($signed(wire13))}) ?
              reg18[(4'hd):(4'ha)] : ({wire16,
                  $signed((~^(8'ha3)))} >> (($unsigned(wire11) ?
                  $unsigned(wire11) : $signed(wire16)) && {(~|reg15)})));
          if (wire13[(3'h5):(3'h4)])
            begin
              reg21 <= ({reg17[(3'h4):(1'h1)]} ?
                  $unsigned((reg18 ^ ($unsigned(wire14) ?
                      (!(8'hb3)) : reg17))) : ($signed($signed($unsigned(reg20))) >>> wire16[(3'h6):(1'h1)]));
              reg22 <= $unsigned(($unsigned(reg15[(4'h8):(1'h0)]) ?
                  (~^((wire13 ? wire14 : reg15) ?
                      {reg19} : $unsigned(reg18))) : (wire11 != ((reg15 ?
                          wire14 : reg15) ?
                      reg20 : reg18[(3'h6):(3'h4)]))));
            end
          else
            begin
              reg21 <= (^wire14);
              reg22 <= reg20[(1'h0):(1'h0)];
              reg23 <= $unsigned($signed((reg18[(4'hf):(2'h3)] ?
                  {$unsigned(wire14), wire16} : reg22[(1'h0):(1'h0)])));
              reg24 <= (($unsigned((((8'hab) >>> (8'hbf)) - $unsigned(wire14))) + (reg17 == (reg17[(3'h6):(3'h5)] ?
                  $signed(reg17) : {reg22, reg20}))) >= wire13);
              reg25 <= $unsigned((wire11[(2'h2):(1'h1)] ~^ $signed((wire14 * $unsigned(reg18)))));
            end
          reg26 <= $signed((~|((reg25[(1'h1):(1'h1)] | (wire14 ?
                  reg25 : reg21)) ?
              $unsigned(((8'ha1) >>> reg23)) : (8'hbf))));
          reg27 <= ((!(8'h9e)) - (wire12[(2'h2):(1'h0)] ?
              (~^{(^reg22)}) : ((8'ha2) - reg19)));
        end
      else
        begin
          reg17 <= wire12[(5'h10):(2'h2)];
          reg18 <= (($signed(((wire14 < (8'hbe)) == (8'ha9))) + $unsigned((~&(wire11 ?
                  reg19 : wire11)))) ?
              (($signed($unsigned(wire16)) + ({reg25} >>> reg25[(3'h6):(1'h0)])) ?
                  $signed(({reg24} ?
                      wire11 : (+reg25))) : reg24[(2'h3):(2'h3)]) : (^~$signed((wire11[(1'h1):(1'h1)] * ((7'h44) ?
                  wire14 : reg23)))));
          reg19 <= $unsigned(wire11);
          reg20 <= ($unsigned(wire11) || ((~|reg17) ?
              reg15 : $unsigned(reg22[(5'h10):(5'h10)])));
          if ({((($unsigned(reg18) ~^ $unsigned(reg20)) ?
                      (~&$unsigned(reg25)) : wire12[(1'h0):(1'h0)]) ?
                  $signed({wire11[(3'h5):(2'h2)],
                      reg17[(4'hb):(4'h9)]}) : ($signed((reg20 ?
                      reg15 : wire13)) || (reg25[(4'h8):(1'h0)] + $signed((8'ha2))))),
              (((^~reg24) != $unsigned(reg22[(4'h9):(3'h4)])) ?
                  $unsigned($signed((wire14 <<< reg17))) : (reg26 ?
                      (reg23 | {(8'h9d), reg15}) : (8'hbd)))})
            begin
              reg21 <= ((~(-(&wire13[(2'h3):(2'h2)]))) * $unsigned(($signed($signed(reg19)) ?
                  $signed(((8'h9e) ? reg27 : wire16)) : reg24[(3'h6):(2'h2)])));
              reg22 <= (((($signed(reg26) ? (~&wire14) : (8'hbd)) ?
                          reg21[(3'h4):(1'h1)] : reg26) ?
                      (({wire16, wire11} ?
                              (reg19 ? reg24 : reg27) : $unsigned(reg17)) ?
                          (((8'hb9) && wire13) <<< $unsigned(reg24)) : $unsigned((wire13 ^ wire14))) : $signed(reg25[(3'h4):(1'h0)])) ?
                  {(^reg20)} : ((+$signed((reg21 > reg23))) < reg27));
              reg23 <= (wire13[(2'h3):(1'h1)] ?
                  ((8'ha6) || $signed($unsigned((~&reg27)))) : (8'hb6));
            end
          else
            begin
              reg21 <= $signed({wire16});
              reg22 <= reg27[(4'h8):(3'h7)];
            end
        end
      if ({(wire13 ?
              ((~wire13) ?
                  $signed(((8'ha7) ?
                      reg18 : reg26)) : {(|reg23)}) : $unsigned(($unsigned(reg24) ?
                  {reg22, reg15} : reg22))),
          reg20})
        begin
          reg28 <= ((8'hab) ?
              wire14 : $unsigned($unsigned(((wire13 ? wire14 : reg23) ?
                  (&wire14) : (wire12 ? wire11 : reg26)))));
          reg29 <= ((((^{reg24,
              reg19}) & $unsigned($signed(wire11))) <= $unsigned(($unsigned((7'h43)) < (reg22 ?
              reg23 : reg15)))) >> reg22[(5'h10):(5'h10)]);
          if (($signed(((!reg15[(4'hb):(3'h7)]) ?
                  reg20[(1'h1):(1'h1)] : $signed(reg17[(4'he):(3'h6)]))) ?
              ((8'hbe) ?
                  {(wire13 ?
                          (reg18 ?
                              (8'hba) : wire14) : reg23[(1'h0):(1'h0)])} : $unsigned($unsigned(reg28))) : $unsigned(reg20)))
            begin
              reg30 <= (~|$signed((~^(reg24[(3'h4):(2'h3)] ?
                  $signed(wire13) : (~(8'ha7))))));
            end
          else
            begin
              reg30 <= (reg21[(5'h12):(1'h1)] ?
                  reg20[(1'h0):(1'h0)] : $signed((!reg17[(5'h11):(4'ha)])));
              reg31 <= reg29[(3'h4):(2'h2)];
              reg32 <= $signed($unsigned((reg19 | reg22)));
            end
          reg33 <= {wire13[(3'h5):(1'h0)],
              (~((~|{reg17}) >> $signed((reg26 ~^ wire14))))};
          if (reg19)
            begin
              reg34 <= $signed(((((reg18 ? reg29 : (8'ha8)) ?
                      reg15 : (8'ha4)) | ({reg29,
                      reg18} != reg33[(1'h1):(1'h0)])) ?
                  (&reg17[(4'he):(2'h2)]) : wire14[(3'h4):(2'h2)]));
              reg35 <= $unsigned(((wire12 & ((~reg32) || (^~reg28))) * (|$unsigned((reg34 | (8'haf))))));
              reg36 <= (+((^reg34) << (~&reg25)));
              reg37 <= $unsigned($unsigned(reg17));
            end
          else
            begin
              reg34 <= (reg23 ? (8'h9f) : (~|reg15));
              reg35 <= $signed(wire14);
              reg36 <= $signed((reg18 ^ $signed({reg31, reg37})));
              reg37 <= ((^reg24[(2'h2):(1'h1)]) ?
                  reg32 : $signed((^~{(reg37 ? wire12 : reg15)})));
            end
        end
      else
        begin
          reg28 <= ((-(reg37 ? reg32 : (~|$unsigned(reg37)))) ?
              (~(((reg22 ? (8'hbc) : reg36) ? (reg24 ? reg26 : reg18) : reg30) ?
                  {(~reg15), (reg21 - (8'hbc))} : ($signed((8'ha2)) ?
                      reg28 : reg24))) : (!(^~reg29[(3'h6):(3'h6)])));
          if ($unsigned({(wire12[(4'hd):(3'h4)] | ($signed(reg22) ^ (reg24 ?
                  (7'h42) : wire11))),
              {(-$unsigned(reg23))}}))
            begin
              reg29 <= $unsigned(reg32[(1'h1):(1'h1)]);
              reg30 <= $signed({(-(+(~^wire14))), reg17[(4'hd):(3'h4)]});
              reg31 <= reg27[(5'h15):(4'hd)];
              reg32 <= (^~wire16);
              reg33 <= (+reg26[(3'h7):(3'h6)]);
            end
          else
            begin
              reg29 <= $unsigned($signed(((((8'ha7) + reg28) ?
                      (8'hb9) : reg15) ?
                  $unsigned(((8'ha9) ? reg35 : reg34)) : {(~|reg32),
                      (reg20 ? reg22 : wire13)})));
            end
          reg34 <= reg37[(1'h1):(1'h0)];
          reg35 <= (^~$unsigned(({$signed(reg15), $signed(reg18)} ?
              (reg19 ? $signed(reg21) : {reg22}) : reg36[(4'h9):(2'h3)])));
          reg36 <= $signed(reg28[(3'h7):(3'h5)]);
        end
      reg38 <= (7'h43);
      reg39 <= reg33[(2'h3):(1'h0)];
    end
  module40 #() modinst53 (wire52, clk, reg30, reg35, reg29, reg17);
  assign wire54 = reg21[(3'h4):(1'h1)];
  assign wire55 = ({(~&$unsigned($unsigned(reg39))),
                      reg27} <<< ($unsigned({(reg27 ? reg24 : (8'haa)),
                          (wire54 >>> (8'hbf))}) ?
                      reg24 : $signed($signed((reg25 ? wire12 : wire13)))));
  assign wire56 = $unsigned($unsigned((|(~(reg35 << reg33)))));
  assign wire57 = wire11;
  assign wire58 = reg17;
  assign wire59 = $unsigned((($unsigned((wire13 <<< reg29)) * reg25) >= (($signed((8'hb1)) | $signed(reg33)) ?
                      reg38 : (wire14[(2'h2):(2'h2)] >>> {wire57, reg34}))));
  assign wire60 = wire13;
  assign wire61 = (8'ha8);
endmodule

module module40
#(parameter param51 = (8'hbb))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire44;
  input wire signed [(4'ha):(1'h0)] wire43;
  input wire [(3'h6):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  assign y = {wire50, wire49, wire48, wire47, wire46, wire45, (1'h0)};
  assign wire45 = (($unsigned(((wire42 <<< wire44) ~^ (wire42 && wire41))) ?
                          wire41[(4'hf):(4'ha)] : {$signed(wire41)}) ?
                      wire42 : $signed($signed($signed(wire43[(1'h0):(1'h0)]))));
  assign wire46 = $unsigned((^~(wire41[(4'hf):(4'hf)] ^ (8'hab))));
  assign wire47 = wire45[(1'h0):(1'h0)];
  assign wire48 = {wire41,
                      ({wire46, wire44} ?
                          (!$unsigned($signed(wire47))) : $signed(wire45[(4'hb):(3'h5)]))};
  assign wire49 = wire41[(4'hf):(4'ha)];
  assign wire50 = ($signed($unsigned($signed((wire44 * wire49)))) ?
                      $unsigned(wire48) : ((^~($unsigned(wire42) ?
                              ((8'ha8) ? (8'ha6) : wire42) : (wire41 ?
                                  wire43 : (8'ha9)))) ?
                          (wire47 ?
                              (|(wire46 & (8'haf))) : {((8'ha1) > wire46),
                                  wire47[(2'h3):(2'h2)]}) : (wire48[(4'h9):(4'h8)] || ((wire49 ?
                                  wire43 : (8'hae)) ?
                              (wire41 - wire49) : {wire48, wire49}))));
endmodule

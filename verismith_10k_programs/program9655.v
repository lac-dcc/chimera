module top
#(parameter param136 = {(&(~|((~(8'hb3)) ? ((8'hbe) | (8'hbf)) : (+(7'h42)))))}, 
parameter param137 = ((param136 ? ((~&(param136 ? param136 : param136)) ? param136 : (param136 ? param136 : (^param136))) : (({param136} ? (param136 ? param136 : (8'ha5)) : (-param136)) ? (~(~^param136)) : {(~|param136)})) ? param136 : ({((param136 * (8'haf)) >>> (|(8'ha6))), ((8'hb1) || {param136, param136})} > param136)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire134;
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire77,
                 wire9,
                 wire4,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire134,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = {wire1};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg5 <= $unsigned(wire3[(3'h6):(3'h4)]);
        end
      else
        begin
          reg5 <= ($unsigned(wire3[(1'h1):(1'h0)]) ?
              $unsigned($signed(($signed(wire1) <<< $unsigned(wire0)))) : {{($signed(wire3) == wire2[(3'h5):(1'h0)]),
                      $signed(wire2)},
                  wire0});
          reg6 <= $signed((!(+((~^wire0) != reg5[(4'h8):(3'h6)]))));
          reg7 <= wire4[(3'h7):(3'h4)];
        end
      reg8 <= $signed(reg7);
    end
  assign wire9 = $unsigned($signed($unsigned({reg7, $signed(wire0)})));
  module10 #() modinst78 (wire77, clk, wire9, wire2, wire0, reg6);
  assign wire79 = ($signed($signed(((+reg5) * (wire0 < wire0)))) ?
                      (!($signed($unsigned(reg5)) ?
                          (-{wire77}) : (8'ha5))) : $unsigned(((+(wire0 != (8'hb8))) ?
                          ((~^wire2) << $unsigned(wire77)) : (wire3[(2'h2):(1'h1)] || (wire3 - wire2)))));
  assign wire80 = reg6[(2'h2):(1'h1)];
  assign wire81 = reg5;
  assign wire82 = $unsigned($unsigned($signed($signed(reg7))));
  assign wire83 = $signed(wire77);
  assign wire84 = $unsigned($unsigned((-(reg6[(4'hf):(4'ha)] <<< (~|reg5)))));
  assign wire85 = reg8[(4'hc):(3'h5)];
  assign wire86 = $signed({$signed($unsigned((wire80 == (8'ha7))))});
  module87 #() modinst135 (.wire88(reg8), .wire89(wire2), .wire90(reg6), .wire91(wire0), .clk(clk), .y(wire134), .wire92(wire82));
endmodule

module module87
#(parameter param132 = (^(!(8'ha1))), 
parameter param133 = ((~|(param132 ? ((param132 ? param132 : param132) ? (param132 >> (8'h9f)) : (param132 ? param132 : param132)) : (8'hbe))) ^~ ((param132 ? (&{param132}) : ({param132, param132} && (^~param132))) ^ param132)))
(y, clk, wire88, wire89, wire90, wire91, wire92);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire88;
  input wire signed [(3'h4):(1'h0)] wire89;
  input wire signed [(3'h4):(1'h0)] wire90;
  input wire [(3'h7):(1'h0)] wire91;
  input wire signed [(5'h14):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire131;
  wire [(5'h11):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(3'h7):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire [(5'h11):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire121;
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire121,
                 (1'h0)};
  module93 #() modinst122 (.wire98(wire90), .wire95(wire92), .wire96(wire88), .wire94(wire91), .y(wire121), .clk(clk), .wire97(wire89));
  assign wire123 = wire121[(3'h4):(1'h0)];
  assign wire124 = $signed({$signed(((^(8'ha2)) ?
                           $signed(wire123) : {wire92}))});
  assign wire125 = ($unsigned($unsigned(($unsigned(wire88) << wire123[(1'h0):(1'h0)]))) - ({(8'hab)} ^ $unsigned(((7'h43) - $unsigned(wire92)))));
  assign wire126 = (~&wire92);
  assign wire127 = $unsigned((^$unsigned(((wire123 ^ (8'ha0)) ?
                       $signed(wire124) : $unsigned(wire124)))));
  assign wire128 = $unsigned((wire126 ?
                       wire91[(1'h0):(1'h0)] : $unsigned(((wire88 ?
                           wire92 : wire121) ~^ {wire91, wire92}))));
  assign wire129 = wire88;
  assign wire130 = $signed(wire129[(3'h4):(2'h3)]);
  assign wire131 = $signed(wire121);
endmodule

module module10
#(parameter param75 = ((({{(8'hb3), (8'hb4)}, ((8'hba) == (8'hb7))} < (((8'hab) ? (8'hb9) : (8'had)) ? ((8'ha9) | (8'hbe)) : (+(8'hac)))) * (~^({(8'ha2)} & ((8'hbb) ? (8'h9d) : (7'h40))))) ? (^(~|{((8'hb5) ? (8'ha7) : (8'ha4))})) : (~|{((8'ha8) ? (~|(7'h41)) : ((8'ha4) >= (7'h44)))})), 
parameter param76 = param75)
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire71;
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire71,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~(8'ha8)) ? (~|wire12[(1'h1):(1'h0)]) : $unsigned(wire14)))
        begin
          reg15 <= ((($signed((-wire13)) + $unsigned((wire12 * wire12))) || {wire12[(5'h10):(3'h5)],
              wire12}) & (~|($unsigned(wire11) ? wire13 : $unsigned(wire14))));
        end
      else
        begin
          reg15 <= reg15;
          reg16 <= reg15;
          reg17 <= (8'hb3);
          reg18 <= (({$signed((wire13 ? reg15 : (8'h9c))),
              $unsigned((wire12 >= (8'h9c)))} >= $unsigned((8'hbf))) ^ (reg15[(4'hb):(3'h6)] * wire11[(1'h0):(1'h0)]));
        end
      reg19 <= $unsigned((reg15[(4'h8):(4'h8)] ?
          reg16[(1'h1):(1'h0)] : ((|reg17) ? wire12 : wire14)));
      reg20 <= ($signed((-reg17)) | wire11);
      reg21 <= reg20;
      reg22 <= (&wire13[(4'hd):(3'h7)]);
    end
  always
    @(posedge clk) begin
      reg23 <= {(~&reg20[(3'h4):(1'h1)]), reg19};
      if (wire11[(3'h5):(1'h0)])
        begin
          reg24 <= ($signed($unsigned((~^reg23[(4'h9):(1'h1)]))) ?
              (((-(wire12 ? reg16 : reg15)) ?
                  $unsigned(reg22[(3'h4):(2'h2)]) : ((wire13 ? reg15 : reg22) ?
                      (reg21 & reg22) : $signed(reg23))) <= $unsigned({reg23[(4'hd):(3'h6)]})) : $signed($unsigned($signed($unsigned((8'hb7))))));
          reg25 <= (!(|($unsigned(reg24) >> reg17[(4'h8):(2'h3)])));
          if ((-$unsigned(wire14[(1'h1):(1'h1)])))
            begin
              reg26 <= $signed(reg25);
              reg27 <= (^reg22[(2'h3):(2'h2)]);
              reg28 <= $unsigned($unsigned($unsigned(((reg25 | reg17) <= (reg23 >= wire11)))));
              reg29 <= $signed(reg17[(2'h2):(2'h2)]);
              reg30 <= (reg28 >>> (reg17[(3'h6):(3'h4)] <<< (reg23 ?
                  ((^~(7'h44)) <<< $signed(reg29)) : $signed(reg24))));
            end
          else
            begin
              reg26 <= wire14;
              reg27 <= reg15[(1'h0):(1'h0)];
              reg28 <= $signed(wire13);
              reg29 <= ($signed($signed({$unsigned(reg24),
                  $unsigned(wire11)})) > reg28);
            end
          reg31 <= reg21;
        end
      else
        begin
          reg24 <= $signed({(({reg17} ?
                  (reg27 >= (8'had)) : (reg29 * reg18)) < (!reg22))});
        end
      if (reg30[(3'h4):(1'h1)])
        begin
          reg32 <= wire12[(4'hc):(2'h3)];
          if (($unsigned((((reg20 ^ (8'hae)) ?
                  reg27[(3'h7):(2'h3)] : (~&reg15)) ?
              reg20 : reg19)) == wire11))
            begin
              reg33 <= $signed(wire14[(3'h4):(2'h2)]);
              reg34 <= (^(reg15[(4'h9):(2'h3)] ?
                  ($unsigned(wire13) ?
                      ($signed(reg24) < (reg29 ?
                          reg25 : reg33)) : ($signed(reg26) + reg29[(3'h5):(1'h0)])) : (~&reg32)));
              reg35 <= {((-((wire13 & reg28) ?
                          (reg20 | wire12) : $unsigned(reg22))) ?
                      wire11[(1'h0):(1'h0)] : reg18)};
              reg36 <= (((reg21 <= reg30[(2'h2):(1'h1)]) <<< ((-reg31[(1'h0):(1'h0)]) >>> reg25)) ?
                  {wire14[(1'h0):(1'h0)],
                      (reg28 <= (^$unsigned(reg28)))} : (&(reg30[(3'h4):(2'h2)] ?
                      reg22 : $unsigned((8'ha1)))));
            end
          else
            begin
              reg33 <= reg29;
              reg34 <= ($unsigned(($unsigned(reg15[(4'h9):(4'h8)]) ?
                      reg20[(5'h14):(1'h1)] : $signed((|reg35)))) ?
                  $unsigned((^~$unsigned(reg27[(4'hf):(4'he)]))) : $signed(reg36));
              reg35 <= reg22;
            end
          reg37 <= {reg36};
          if ((reg30 ?
              {reg32[(4'he):(4'hc)]} : ((reg27 ?
                      $unsigned(((8'ha9) < reg35)) : (reg21 >= reg16[(4'hc):(4'h9)])) ?
                  {(|(8'hb2)), reg18} : ($unsigned((~reg16)) ?
                      reg25[(5'h10):(2'h2)] : ($signed(reg21) ?
                          (reg18 & reg21) : $unsigned(reg33))))))
            begin
              reg38 <= reg18[(3'h7):(2'h3)];
              reg39 <= {(8'hbe), {reg37, $signed(reg24)}};
              reg40 <= ((8'ha9) ?
                  (reg17[(3'h7):(1'h0)] ?
                      (~|(~(^reg31))) : reg35[(4'h8):(1'h0)]) : (~$unsigned(((~reg20) < (reg23 ?
                      (7'h40) : reg26)))));
              reg41 <= wire13;
            end
          else
            begin
              reg38 <= reg40;
            end
        end
      else
        begin
          reg32 <= $signed($signed($signed(reg39)));
          reg33 <= ($signed($signed((reg28[(1'h0):(1'h0)] ?
                  (|(8'h9e)) : reg23))) ?
              $signed((~$unsigned((8'hbf)))) : ($unsigned($unsigned(reg38)) ?
                  reg21 : wire13));
          if ({wire13, reg29[(4'h8):(1'h1)]})
            begin
              reg34 <= reg29[(3'h5):(2'h2)];
              reg35 <= $unsigned(reg34[(2'h2):(1'h1)]);
              reg36 <= (reg39[(3'h5):(1'h1)] <= reg19);
              reg37 <= ($unsigned((^~(~|wire12))) ?
                  $unsigned($signed(reg26[(2'h2):(2'h2)])) : (8'ha7));
            end
          else
            begin
              reg34 <= ($signed(reg25[(5'h11):(2'h2)]) ^ $unsigned(reg28));
            end
          reg38 <= (^(^{$unsigned($unsigned(reg27))}));
          reg39 <= ({($signed({reg37, reg31}) ? $unsigned(reg19) : wire11),
              $signed(wire13[(4'h8):(2'h3)])} * {$unsigned((^~$unsigned(reg21))),
              $signed(((reg34 == reg29) >> reg19[(2'h2):(1'h1)]))});
        end
      reg42 <= reg23[(2'h2):(2'h2)];
    end
  module43 #() modinst72 (wire71, clk, reg35, reg37, reg39, wire13);
  assign wire73 = reg23;
  assign wire74 = (~reg16[(3'h5):(3'h4)]);
endmodule

module module43  (y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire [(5'h14):(1'h0)] wire46;
  input wire [(3'h4):(1'h0)] wire45;
  input wire signed [(4'h8):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire48;
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire48,
                 reg65,
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
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire48 = wire47[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire45[(2'h2):(1'h1)])
        begin
          if (wire44)
            begin
              reg49 <= $signed(((wire47 < ((wire44 >>> wire48) - wire46[(2'h2):(2'h2)])) ?
                  $signed((wire44[(3'h4):(2'h3)] + (wire46 ?
                      wire48 : (8'hb4)))) : $signed(wire48[(2'h3):(2'h3)])));
              reg50 <= wire44;
              reg51 <= $unsigned(wire46[(5'h10):(4'hd)]);
            end
          else
            begin
              reg49 <= ($unsigned((((!wire47) ?
                      (+(8'hb9)) : (reg50 - (7'h43))) ?
                  wire48 : (wire47 ~^ $signed(wire47)))) * $signed(reg49[(1'h1):(1'h1)]));
              reg50 <= (~&{$unsigned(((~&(8'hbc)) ^ wire47))});
              reg51 <= {reg50};
              reg52 <= (&(wire48 ^~ (~&(wire45[(1'h0):(1'h0)] ?
                  (wire47 ? (8'hb4) : wire44) : {wire48}))));
              reg53 <= (~^(~^wire44));
            end
          reg54 <= wire44[(3'h6):(1'h1)];
        end
      else
        begin
          reg49 <= ({$signed(reg54[(3'h5):(3'h5)])} || wire44[(1'h0):(1'h0)]);
          reg50 <= reg51[(1'h1):(1'h0)];
          if ($signed($unsigned({$signed($signed(wire47)),
              (wire47[(1'h0):(1'h0)] || (wire48 <<< reg50))})))
            begin
              reg51 <= $signed($unsigned(wire44));
              reg52 <= $unsigned((wire45 ?
                  ((reg51[(2'h2):(1'h0)] ?
                          reg54[(4'he):(4'h9)] : reg51[(2'h2):(1'h1)]) ?
                      (+$unsigned(wire46)) : wire45) : reg50[(3'h6):(1'h1)]));
              reg53 <= (reg52[(4'he):(3'h7)] ?
                  ($signed($unsigned($signed(reg51))) ?
                      (~wire45) : ((reg53[(1'h1):(1'h0)] ?
                              (wire46 != reg54) : reg49[(2'h3):(2'h3)]) ?
                          reg53 : ((reg54 >= reg52) ^~ (8'h9f)))) : {reg50});
            end
          else
            begin
              reg51 <= {(~$unsigned((~|$signed(wire46)))),
                  $unsigned((^wire46))};
              reg52 <= $signed(wire46[(3'h4):(2'h3)]);
            end
        end
      if (wire48)
        begin
          reg55 <= reg53;
          if (reg51)
            begin
              reg56 <= (~|(~^reg55));
            end
          else
            begin
              reg56 <= ($signed((wire44 - (~&(wire47 << reg51)))) ^~ ($signed(($signed(reg53) <= (reg51 <<< (8'ha7)))) != (reg50 < wire47)));
              reg57 <= reg49[(1'h0):(1'h0)];
            end
          reg58 <= (({reg56[(5'h11):(3'h4)],
                  $signed(reg50[(5'h10):(4'h9)])} >> ((reg55 ?
                      $signed((8'hb1)) : ((8'haf) ? reg53 : reg56)) ?
                  {reg57} : $signed($signed((8'h9d))))) ?
              (wire47[(2'h2):(1'h0)] ?
                  {$signed(reg50[(3'h7):(2'h2)])} : (wire45[(2'h3):(1'h1)] ~^ ($unsigned(reg57) != (wire44 + reg57)))) : $signed($signed($unsigned((-reg56)))));
          reg59 <= reg56[(3'h7):(2'h2)];
        end
      else
        begin
          reg55 <= $signed($signed($signed((~&(-wire48)))));
          if (($unsigned((($unsigned(wire44) < ((8'hb5) ? (8'haa) : wire46)) ?
                  reg51[(4'h9):(3'h7)] : ((wire47 >> wire45) ?
                      (~&reg52) : $signed(wire44)))) ?
              ($signed(($unsigned(reg51) <<< reg54[(3'h5):(2'h3)])) ?
                  reg59 : {({reg53} ? reg55 : (8'hbe))}) : reg51))
            begin
              reg56 <= {((^~(^(~&(8'hb0)))) == (((!reg58) != (~^reg57)) ?
                      (-$signed((8'hb3))) : (~reg59[(4'hd):(3'h4)])))};
              reg57 <= $unsigned({(-(reg54 ? reg58[(3'h5):(1'h1)] : reg52)),
                  (((reg53 ? reg50 : (8'h9f)) ?
                          {reg57, (8'hbd)} : {reg54, (8'hb7)}) ?
                      $signed($signed(reg49)) : (8'ha7))});
              reg58 <= (~{reg56});
            end
          else
            begin
              reg56 <= ($signed((($signed(reg56) * $unsigned(reg56)) >>> $signed(reg51))) ~^ (wire44 * (reg50[(5'h10):(4'ha)] ?
                  reg55[(2'h3):(1'h0)] : (~^(~&reg56)))));
              reg57 <= wire44;
              reg58 <= {$signed($unsigned(wire48[(3'h7):(3'h6)]))};
            end
          if ($signed(((((~&reg51) ? reg55[(1'h0):(1'h0)] : (^~reg55)) ?
                  $unsigned((reg53 ? wire44 : wire46)) : (reg57 ?
                      (reg54 ? (8'h9e) : reg55) : wire45[(2'h2):(1'h1)])) ?
              reg58[(3'h6):(3'h6)] : $unsigned((^~$signed((8'hae)))))))
            begin
              reg59 <= reg53;
              reg60 <= {reg56};
            end
          else
            begin
              reg59 <= $unsigned(wire45);
            end
          reg61 <= (($signed(reg60) ^ $signed($signed($unsigned(reg51)))) ?
              (!$unsigned(((8'ha5) <= reg60))) : ({((|wire46) || $unsigned(reg58))} ?
                  $unsigned({(8'hb6)}) : $signed(($unsigned(reg57) ?
                      reg51 : $signed(reg55)))));
          reg62 <= (~^reg59);
        end
      reg63 <= ({$unsigned((7'h41))} <<< ($unsigned($signed($unsigned(reg52))) >= reg61));
      reg64 <= reg56[(3'h6):(3'h4)];
      reg65 <= reg58[(1'h0):(1'h0)];
    end
  assign wire66 = $signed(wire44);
  assign wire67 = $unsigned(reg65);
  assign wire68 = (~(wire44 >>> reg65[(3'h4):(1'h1)]));
  assign wire69 = (~&$unsigned(reg64));
  assign wire70 = {wire47[(3'h4):(2'h2)], reg54[(2'h3):(1'h0)]};
endmodule

module module93
#(parameter param119 = (~|(((~((8'hb1) ? (8'ha4) : (8'h9e))) & {(^~(8'hbc)), (~^(8'hb5))}) | (~^(((8'hb1) == (8'ha3)) ? ((8'hb6) + (8'ha4)) : ((8'hb5) ? (8'hb8) : (8'haa)))))), 
parameter param120 = param119)
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire [(2'h2):(1'h0)] wire97;
  input wire [(5'h12):(1'h0)] wire96;
  input wire [(5'h14):(1'h0)] wire95;
  input wire [(3'h7):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire99;
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  assign y = {wire118,
                 wire100,
                 wire99,
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
                 (1'h0)};
  assign wire99 = wire96[(4'h8):(3'h6)];
  assign wire100 = ((-{$unsigned((wire95 - wire99)), wire96}) ?
                       (($unsigned((wire98 ? wire94 : wire98)) ?
                               wire97 : (wire95 ?
                                   $signed(wire96) : (wire96 + wire97))) ?
                           wire94[(3'h4):(2'h3)] : wire98[(2'h3):(1'h0)]) : (wire98 + (wire98[(3'h4):(2'h2)] * (~$signed(wire96)))));
  always
    @(posedge clk) begin
      reg101 <= {(-wire100[(4'h8):(4'h8)])};
      reg102 <= (wire94[(1'h1):(1'h0)] + $signed(wire97));
      if (reg101[(1'h0):(1'h0)])
        begin
          if ($signed({wire98[(2'h3):(2'h3)]}))
            begin
              reg103 <= reg101;
            end
          else
            begin
              reg103 <= (reg101[(4'ha):(2'h2)] ?
                  wire97[(1'h0):(1'h0)] : wire100);
              reg104 <= (+(wire100 < wire95[(5'h14):(3'h5)]));
              reg105 <= ($unsigned((~&reg103[(2'h3):(2'h2)])) ?
                  ((~reg101) ?
                      ((reg103 ? $unsigned((8'hae)) : $unsigned((8'ha6))) ?
                          {$signed(reg101)} : $unsigned(reg104[(3'h6):(1'h0)])) : wire94[(1'h0):(1'h0)]) : wire98);
              reg106 <= {wire95[(5'h11):(2'h3)]};
              reg107 <= wire96;
            end
          if ((($unsigned(reg102) & (8'hbc)) ?
              {(((+wire94) || (wire96 ~^ wire99)) ?
                      $unsigned(wire100) : $unsigned((+wire98))),
                  wire94[(3'h7):(1'h0)]} : ($signed(((wire100 ?
                      (8'hb8) : wire100) < reg106[(2'h2):(2'h2)])) ?
                  wire99[(4'h9):(4'h9)] : ($signed({reg103}) ?
                      (|$signed(wire95)) : {(^(8'hb2)),
                          ((8'ha1) ? wire99 : reg107)}))))
            begin
              reg108 <= wire98[(1'h0):(1'h0)];
            end
          else
            begin
              reg108 <= $unsigned({$signed($signed(wire99))});
              reg109 <= ((^~$unsigned(({reg103} ~^ (reg106 <<< wire98)))) ?
                  $unsigned({(reg106[(1'h1):(1'h1)] + reg104[(4'he):(2'h2)]),
                      reg103}) : {$unsigned(wire98[(1'h0):(1'h0)]),
                      ($unsigned(wire95) ?
                          $unsigned((wire97 ?
                              reg105 : reg101)) : $signed((!reg106)))});
              reg110 <= reg107[(1'h0):(1'h0)];
              reg111 <= ((wire98 - (reg108 ?
                      (8'ha7) : ($unsigned(wire99) ?
                          {reg110} : (wire96 ? reg102 : wire96)))) ?
                  (wire95 ~^ $signed((~|(-(8'haf))))) : ((|(8'ha9)) | (($signed(reg109) >>> reg102) - $unsigned(wire97[(2'h2):(2'h2)]))));
              reg112 <= $unsigned($signed(((8'hba) <= ((reg101 ?
                  reg102 : reg108) << (^reg111)))));
            end
          if (reg110[(2'h2):(1'h1)])
            begin
              reg113 <= $signed(($unsigned($unsigned((wire95 ?
                      (8'haf) : wire99))) ?
                  wire99 : $signed(wire95[(4'h8):(1'h1)])));
            end
          else
            begin
              reg113 <= (^(-((~$unsigned(reg112)) <<< $signed(reg113[(2'h3):(1'h1)]))));
              reg114 <= ($unsigned((wire94[(3'h5):(3'h4)] > $signed($unsigned(reg104)))) != (|reg105));
              reg115 <= $unsigned(wire95);
              reg116 <= (((7'h41) ?
                      ($signed(((8'hb2) ? reg104 : reg104)) ?
                          (|(wire99 | reg112)) : ((+reg107) ?
                              (wire95 ?
                                  reg109 : wire100) : (~reg107))) : reg101) ?
                  ($signed((~|(8'hb5))) <= (reg103[(2'h3):(2'h2)] - ($signed(reg102) ?
                      {reg103} : reg115[(4'hb):(1'h1)]))) : $unsigned(($signed((wire94 ?
                          reg108 : wire98)) ?
                      (reg115 ?
                          {(8'hbd)} : (wire94 ? (7'h40) : reg107)) : (^(reg108 ?
                          wire96 : wire95)))));
            end
        end
      else
        begin
          if ($signed(((~|$signed((reg113 ?
              reg116 : reg112))) & $unsigned((~(~reg103))))))
            begin
              reg103 <= {(!wire98[(3'h4):(2'h3)])};
              reg104 <= $unsigned((^reg105));
              reg105 <= wire99;
              reg106 <= reg111[(3'h4):(1'h1)];
            end
          else
            begin
              reg103 <= $signed($unsigned(($signed(((8'hac) ?
                      reg110 : wire99)) ?
                  {(reg105 || wire96)} : (reg114 ?
                      (reg110 ? reg102 : reg114) : $signed((8'hb1))))));
              reg104 <= $signed((&((wire97 == reg106[(1'h1):(1'h1)]) ?
                  (-wire96) : $unsigned((reg109 <= (8'ha1))))));
            end
          reg107 <= ((|reg111[(1'h0):(1'h0)]) ?
              ($unsigned(((reg109 ?
                  reg114 : reg115) - ((8'ha1) >> reg104))) <= reg109) : ((($unsigned((8'ha2)) ^~ (wire96 ?
                  wire96 : (8'ha9))) <= (+reg107)) < (&$unsigned((reg102 >>> wire96)))));
          reg108 <= $signed(reg114);
          reg109 <= (reg114 >>> {reg106});
        end
      reg117 <= (7'h44);
    end
  assign wire118 = {$unsigned(reg105[(2'h2):(2'h2)]),
                       ((8'hae) ~^ $signed({$signed(wire100)}))};
endmodule

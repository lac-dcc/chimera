module top
#(parameter param154 = ((~&(~|(((8'h9e) & (8'hb9)) <= ((8'hb3) + (8'hb0))))) ^ (((~((8'ha9) * (8'ha5))) <<< ((-(8'hac)) ? (8'ha9) : ((8'hbb) || (7'h44)))) >= (+{{(8'hb4), (8'ha1)}, ((8'hb4) ? (8'ha5) : (8'h9c))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire110;
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  assign y = {wire143,
                 wire125,
                 wire124,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire79,
                 wire58,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire110,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg60,
                 reg61,
                 reg62,
                 reg85,
                 (1'h0)};
  module5 #() modinst59 (.wire8(wire3), .wire9(wire1), .wire7(wire4), .wire6(wire0), .y(wire58), .clk(clk));
  always
    @(posedge clk) begin
      reg60 <= wire1[(2'h3):(2'h2)];
      reg61 <= (wire58 - ($unsigned((+wire2[(1'h0):(1'h0)])) <= (((!(7'h42)) << (wire0 >= reg60)) ~^ {reg60,
          reg60})));
      reg62 <= {((+(reg60 ?
              $unsigned((8'hb1)) : {wire4})) >= (|wire1[(3'h5):(2'h2)])),
          $unsigned((-({wire1} <= reg60[(3'h4):(1'h1)])))};
    end
  module63 #() modinst80 (wire79, clk, wire1, wire0, wire2, reg60, reg61);
  assign wire81 = ((8'hb3) << (8'hbf));
  assign wire82 = $signed($signed(reg61));
  assign wire83 = ((^($unsigned($unsigned(wire0)) ?
                          wire2 : ($signed(wire1) << $signed(reg61)))) ?
                      $unsigned($unsigned((~(~reg61)))) : {(^~(+$unsigned(reg60))),
                          reg60[(2'h2):(1'h0)]});
  assign wire84 = (wire79 || (^$unsigned((wire79[(4'hd):(3'h4)] && $signed((8'hac))))));
  always
    @(posedge clk) begin
      reg85 <= wire58[(2'h2):(1'h0)];
    end
  module86 #() modinst111 (.wire87(reg62), .wire88(wire1), .clk(clk), .wire90(wire83), .y(wire110), .wire89(wire3));
  assign wire112 = reg61;
  assign wire113 = (~^$signed(wire79[(3'h7):(1'h1)]));
  assign wire114 = reg61;
  assign wire115 = ($unsigned($signed((wire113[(2'h3):(2'h2)] & ((8'hba) >>> reg62)))) <= wire81);
  always
    @(posedge clk) begin
      if (($unsigned($signed(reg85[(2'h3):(2'h3)])) ?
          ((((~&wire82) ? (^wire4) : ((8'ha0) - wire3)) ?
                  (wire83[(2'h3):(2'h2)] ?
                      $unsigned(wire1) : {wire114}) : wire84[(5'h13):(5'h13)]) ?
              wire2 : $signed((~^(!wire83)))) : wire58))
        begin
          reg116 <= (&(wire4[(1'h1):(1'h1)] && wire115));
          reg117 <= $unsigned(($signed({wire4[(4'h8):(3'h6)],
              wire2}) >>> (8'hab)));
          if (wire3)
            begin
              reg118 <= reg60[(3'h5):(3'h4)];
              reg119 <= wire79[(4'h8):(3'h6)];
              reg120 <= (wire110 ?
                  {(~^(~&(wire0 < (8'hb6)))),
                      ((-$unsigned(reg85)) ?
                          (^~(reg61 ?
                              wire114 : (8'hab))) : wire83[(1'h1):(1'h0)])} : (reg119[(4'ha):(4'h9)] & ({$unsigned(wire114),
                      (wire81 ? reg116 : (8'hb7))} || (8'ha9))));
            end
          else
            begin
              reg118 <= ({$unsigned($signed($unsigned(wire83))), wire58} ?
                  {{wire0}} : wire4[(3'h6):(2'h3)]);
              reg119 <= ((($signed(reg117[(2'h2):(1'h1)]) ?
                      wire114 : (~^$signed(wire82))) ?
                  $signed(wire58[(2'h2):(1'h1)]) : (reg62 ?
                      $unsigned(wire79[(3'h6):(3'h4)]) : {(wire113 ?
                              (8'ha2) : wire2),
                          reg119[(4'he):(4'ha)]})) <<< $unsigned($unsigned({(reg120 ?
                      (8'ha4) : reg119)})));
            end
          reg121 <= $signed((~$signed((+wire1))));
          reg122 <= (^reg61);
        end
      else
        begin
          reg116 <= (($unsigned((+$unsigned(wire4))) ?
                  {($unsigned(reg61) ?
                          wire112[(3'h4):(1'h1)] : (wire84 * reg60))} : reg118[(2'h3):(2'h2)]) ?
              wire112[(1'h0):(1'h0)] : $unsigned($unsigned(wire58[(1'h0):(1'h0)])));
          reg117 <= ((reg60[(5'h10):(4'h9)] ?
                  {$signed((8'hbd)),
                      wire84[(2'h3):(1'h1)]} : reg61[(2'h3):(1'h1)]) ?
              reg61[(4'h9):(3'h7)] : (~&((^(reg117 ? wire82 : reg117)) ?
                  wire84[(3'h5):(2'h2)] : $signed(((8'ha2) ?
                      reg119 : reg120)))));
          reg118 <= ($unsigned(($unsigned((~|wire2)) <= ($unsigned(wire84) ?
                  (8'ha6) : $unsigned(wire115)))) ?
              wire113 : (|((reg118 ? $unsigned((7'h41)) : (wire2 != wire81)) ?
                  (~^wire82[(4'hc):(1'h1)]) : (~^wire84))));
          if ((^~$unsigned(wire84)))
            begin
              reg119 <= (($unsigned(reg117) <<< (~$unsigned($unsigned(wire82)))) ?
                  wire58[(2'h3):(2'h3)] : $unsigned((8'ha8)));
              reg120 <= wire58;
              reg121 <= $signed((wire0 + {((~&(8'h9e)) != (wire4 < wire1)),
                  $signed((wire79 == wire0))}));
            end
          else
            begin
              reg119 <= $unsigned(reg121);
              reg120 <= $unsigned($unsigned($signed(wire114[(1'h1):(1'h1)])));
            end
          reg122 <= (wire115[(1'h1):(1'h1)] ?
              (wire112[(3'h5):(3'h4)] ?
                  (wire4[(2'h2):(1'h1)] != ((reg117 ?
                      reg61 : wire84) == (~|wire1))) : $unsigned(($unsigned(wire3) <= reg60[(4'he):(3'h7)]))) : (~&$signed(((8'hb8) ?
                  (wire79 ? wire0 : wire81) : $signed(reg85)))));
        end
      reg123 <= $unsigned((+(&wire0)));
    end
  assign wire124 = ($signed((wire1 ?
                           (8'ha9) : ($unsigned(wire83) ?
                               (&(8'hac)) : (reg118 ? wire79 : wire4)))) ?
                       $unsigned((~|{$unsigned(reg117)})) : $unsigned((wire110[(1'h0):(1'h0)] ?
                           $unsigned($signed(wire112)) : $signed((~|wire1)))));
  assign wire125 = wire84[(4'he):(3'h5)];
  always
    @(posedge clk) begin
      reg126 <= $unsigned(wire81);
      reg127 <= $unsigned($unsigned((wire0[(5'h13):(4'h9)] | $unsigned(reg117))));
      if (($signed((~^(~|(-reg117)))) | ((~((wire3 ? wire110 : reg126) ?
          reg60 : (wire114 <= reg61))) == $unsigned(wire79))))
        begin
          reg128 <= (^reg62);
          reg129 <= (^~reg120);
        end
      else
        begin
          reg128 <= $unsigned(wire83[(2'h2):(1'h0)]);
          reg129 <= (~^(7'h41));
          reg130 <= reg120[(1'h0):(1'h0)];
          reg131 <= $unsigned(((wire79 + {$unsigned(wire81), reg120}) ?
              wire58 : $signed($signed($unsigned(wire113)))));
          reg132 <= (((((~^reg117) - reg116) ?
              $signed((wire4 || reg118)) : $unsigned($unsigned(wire1))) << ($signed((!reg119)) == $signed((wire3 - reg129)))) < reg120);
        end
      reg133 <= $signed(reg62[(3'h5):(3'h4)]);
      reg134 <= reg133[(4'he):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg135 <= $unsigned(((!reg120[(1'h1):(1'h1)]) ?
          $signed(($signed((8'h9e)) > wire114[(1'h0):(1'h0)])) : {wire82[(4'hb):(2'h3)]}));
      if ((-{(8'hb1),
          (wire114 ? $unsigned($unsigned(wire2)) : $signed($unsigned(wire0)))}))
        begin
          reg136 <= {wire110};
        end
      else
        begin
          reg136 <= wire83[(3'h5):(2'h2)];
          reg137 <= (~$signed(reg133[(5'h12):(4'hb)]));
          reg138 <= (!($unsigned((8'ha9)) ?
              $unsigned((~|(reg120 >= wire1))) : (|(~$unsigned(wire2)))));
          reg139 <= {$unsigned($unsigned((wire113[(2'h2):(2'h2)] ^~ wire79))),
              $unsigned((reg60[(4'hb):(3'h5)] && reg117))};
          reg140 <= ((reg60 > $signed((wire2 * $signed(wire1)))) ?
              (reg131[(3'h6):(3'h4)] * (^~reg60)) : {($unsigned(reg118) ?
                      reg121[(4'ha):(3'h7)] : wire2[(2'h2):(1'h1)])});
        end
      reg141 <= reg140[(3'h4):(1'h1)];
      reg142 <= wire125[(4'h9):(3'h7)];
    end
  assign wire143 = (wire79[(1'h0):(1'h0)] ?
                       $unsigned($unsigned({(wire115 >>> reg122)})) : $unsigned((reg116 ?
                           (8'hb0) : $unsigned((~&reg136)))));
  always
    @(posedge clk) begin
      reg144 <= ($signed(($signed($unsigned(wire0)) ?
              $unsigned((~wire82)) : $unsigned((~|wire115)))) ?
          $signed($unsigned(wire124)) : {{(^wire113[(2'h3):(2'h3)]), reg60},
              (((wire124 ? reg136 : wire83) ?
                  (~|reg136) : $unsigned(reg139)) ^~ $signed((~wire124)))});
      if ((reg135[(4'hc):(3'h5)] != (~&(8'ha0))))
        begin
          reg145 <= $signed(wire2[(2'h3):(1'h1)]);
          reg146 <= $unsigned({($unsigned(reg62) ?
                  (reg60 ~^ reg128) : reg132[(4'hb):(1'h1)])});
          reg147 <= $unsigned((~|$unsigned((reg60[(3'h6):(2'h3)] ?
              ((8'hbb) <<< reg85) : reg118[(4'hb):(3'h5)]))));
          if ($signed(reg127[(3'h7):(3'h5)]))
            begin
              reg148 <= (|$signed(reg147));
              reg149 <= ($unsigned(wire84[(2'h3):(2'h3)]) ?
                  reg140[(2'h3):(2'h2)] : ((wire0[(5'h10):(2'h2)] ?
                          {(reg137 ? wire1 : wire4),
                              {reg144, wire110}} : wire79) ?
                      reg138 : (~wire114)));
              reg150 <= $signed($signed($unsigned($signed(wire112))));
              reg151 <= reg61[(3'h7):(3'h7)];
            end
          else
            begin
              reg148 <= (^~$unsigned(($signed(((8'hb0) ^~ wire84)) ?
                  wire0[(4'hd):(3'h6)] : reg135[(3'h6):(3'h6)])));
              reg149 <= reg146[(3'h5):(1'h1)];
              reg150 <= reg149[(3'h6):(3'h6)];
            end
          reg152 <= $signed($signed(wire125[(4'h9):(3'h6)]));
        end
      else
        begin
          reg145 <= reg121[(4'h8):(3'h5)];
        end
      reg153 <= reg127;
    end
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire [(5'h15):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire91;
  assign y = {wire109, wire108, wire107, wire105, wire91, (1'h0)};
  assign wire91 = (+$signed((^$unsigned(wire88))));
  module92 #() modinst106 (wire105, clk, wire91, wire87, wire90, wire89);
  assign wire107 = {wire88[(5'h10):(3'h5)]};
  assign wire108 = wire90;
  assign wire109 = $signed((wire88[(5'h11):(4'hc)] ?
                       wire90 : (!(~&(wire108 ? (8'had) : wire107)))));
endmodule

module module63
#(parameter param78 = (((&(8'hbe)) >> (~^(~^((8'h9d) | (8'hb1))))) | (((~^{(8'hac)}) << (~(+(8'ha1)))) ? (({(7'h40), (8'hbc)} ? (~|(8'h9f)) : ((8'hb0) == (8'ha8))) <= (^~(-(8'h9c)))) : (((~|(8'ha3)) * (+(8'ha3))) ? ({(8'ha3), (8'hb8)} >= ((7'h44) ? (8'hb9) : (8'hbc))) : (^((8'hbe) ? (8'ha6) : (7'h44)))))))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire signed [(2'h3):(1'h0)] wire66;
  input wire signed [(3'h7):(1'h0)] wire65;
  input wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire68[(2'h2):(1'h0)])
        begin
          reg69 <= $signed($unsigned((wire68[(3'h7):(3'h6)] ?
              $unsigned(wire68) : ((^wire68) + (7'h42)))));
          reg70 <= (|{wire64[(3'h6):(3'h4)], (&wire68[(4'h9):(3'h5)])});
          reg71 <= reg70;
          reg72 <= ($signed($unsigned(wire67)) ?
              (!$unsigned($unsigned($unsigned(wire66)))) : {{(~&(wire65 ?
                          wire64 : reg71)),
                      ((wire68 ? wire66 : (8'h9d)) ?
                          wire64[(4'ha):(3'h6)] : $signed(wire67))},
                  {$unsigned((reg70 ? wire65 : wire64)),
                      {wire65[(3'h7):(2'h3)], (^~wire64)}}});
          reg73 <= $unsigned($unsigned(wire67));
        end
      else
        begin
          reg69 <= wire67;
        end
      reg74 <= (reg69[(2'h3):(2'h2)] <= $signed($signed(reg69)));
    end
  assign wire75 = ({(wire68[(4'h8):(3'h6)] >> $signed($signed(reg69))),
                          reg74[(4'ha):(4'h9)]} ?
                      (($unsigned(wire68) | (((8'hae) < (8'ha3)) | (~wire66))) ?
                          reg72 : (reg72 > wire65[(2'h3):(1'h0)])) : ({reg73,
                          reg71[(1'h1):(1'h1)]} == $unsigned(((reg74 > wire67) < $signed(reg70)))));
  assign wire76 = $unsigned(wire67[(4'hd):(1'h0)]);
  assign wire77 = (($unsigned(wire75[(4'hd):(4'ha)]) + $signed(((wire64 >> reg74) ?
                          $signed((8'h9c)) : ((8'ha9) != wire67)))) ?
                      $signed((!($signed((8'hb0)) | (!(7'h42))))) : reg71[(2'h2):(1'h1)]);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h289):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
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
                 reg16,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $signed((wire8 == wire9[(1'h0):(1'h0)]));
      reg11 <= {(({(8'hae)} ?
                  $unsigned(wire7[(4'hd):(4'hb)]) : $signed($signed((8'ha0)))) ?
              {wire8} : ($signed((!wire7)) || (~$signed(wire6))))};
    end
  assign wire12 = wire7[(3'h5):(3'h5)];
  assign wire13 = {reg10,
                      (reg11 ?
                          wire6[(1'h0):(1'h0)] : (^((wire8 ?
                              wire9 : wire9) || $unsigned(reg10))))};
  assign wire14 = (wire7 != wire13[(2'h3):(2'h2)]);
  assign wire15 = $signed($signed((~|((wire6 >= wire6) ?
                      wire13[(1'h0):(1'h0)] : (wire12 <= reg10)))));
  always
    @(posedge clk) begin
      reg16 <= ($signed(wire6[(3'h4):(2'h3)]) ?
          $signed((!reg11)) : $unsigned(wire8));
      reg17 <= reg16;
      reg18 <= $unsigned(reg16[(4'ha):(3'h4)]);
      reg19 <= (reg10[(4'hb):(1'h1)] ?
          $signed(wire9[(2'h3):(1'h1)]) : (reg11[(1'h0):(1'h0)] - $signed($unsigned({wire6,
              reg18}))));
    end
  always
    @(posedge clk) begin
      if (wire14[(4'h8):(1'h0)])
        begin
          reg20 <= (reg19 ?
              $signed($unsigned((~((8'ha5) * wire6)))) : wire6[(4'h8):(4'h8)]);
          reg21 <= (reg20 ?
              {$unsigned($signed(wire15[(1'h0):(1'h0)]))} : $unsigned((&((~&wire7) + ((8'ha4) ^ (7'h43))))));
          if ((-reg20[(3'h6):(1'h0)]))
            begin
              reg22 <= $unsigned({wire6, wire14[(5'h10):(4'ha)]});
            end
          else
            begin
              reg22 <= {wire9, $signed($signed(reg17[(4'h9):(3'h5)]))};
              reg23 <= ($signed(((reg22 ?
                      $unsigned(wire8) : (wire12 << reg17)) || (reg17[(2'h2):(1'h0)] ?
                      $unsigned((8'ha5)) : (&(8'ha9))))) ?
                  $unsigned(($signed((wire8 ? wire14 : reg21)) ?
                      ((^~reg20) && (~^reg22)) : reg20)) : $signed({(~|$unsigned(wire12)),
                      ((^wire6) ^~ (wire6 ? wire7 : wire15))}));
              reg24 <= ((+{$signed(((8'haa) || wire6)),
                  $signed($unsigned(wire14))}) - $unsigned(((8'ha6) >= ($unsigned(wire15) | {reg11,
                  reg10}))));
              reg25 <= $unsigned({(~^$signed((wire12 ? wire6 : wire7)))});
              reg26 <= ((((8'ha1) * $unsigned(wire6[(3'h7):(2'h2)])) ?
                  $unsigned(reg17) : $signed(($signed(wire7) + (wire8 <<< wire6)))) >> (((^~(&reg25)) ?
                      ((-(8'hb7)) < $signed(reg10)) : ({(8'hbe),
                          (8'hb9)} << (reg23 ? reg17 : reg21))) ?
                  (+reg16[(4'h8):(1'h1)]) : (reg22[(2'h2):(1'h1)] & reg21[(4'hc):(1'h0)])));
            end
        end
      else
        begin
          reg20 <= $unsigned(wire12);
        end
      if (($unsigned(((8'hbe) + (reg26 ?
              reg11[(2'h3):(1'h1)] : reg26[(5'h12):(2'h3)]))) ?
          (8'ha4) : ((^(~|wire9[(4'h8):(3'h4)])) ?
              ($unsigned((wire7 ? reg24 : wire8)) ?
                  reg11[(3'h6):(3'h5)] : reg17) : ($unsigned((~reg26)) == ((wire15 & reg16) ?
                  (&wire15) : (wire12 ? (8'h9d) : reg25))))))
        begin
          reg27 <= $unsigned($unsigned((~&$signed(reg20[(3'h7):(3'h6)]))));
        end
      else
        begin
          if (reg26)
            begin
              reg27 <= reg25;
              reg28 <= reg19;
              reg29 <= ((((!$signed((8'hb7))) > $signed((&wire14))) >= (&$unsigned(wire15))) ?
                  (-$unsigned(((reg25 - (8'hb9)) == reg18[(4'ha):(4'ha)]))) : wire7);
              reg30 <= reg22[(4'h9):(4'h9)];
            end
          else
            begin
              reg27 <= (|$signed(($signed($unsigned(reg18)) & (reg24 >= {reg28}))));
              reg28 <= reg30;
            end
          if ((reg25 ?
              {(!$signed((reg23 ? (8'haf) : wire12)))} : $unsigned((8'h9c))))
            begin
              reg31 <= $signed($signed(reg26));
            end
          else
            begin
              reg31 <= reg18;
            end
          reg32 <= (~wire15);
        end
      reg33 <= $unsigned((~^((~{wire6, reg17}) - {wire8,
          reg25[(3'h6):(2'h2)]})));
      if (reg31)
        begin
          if ($signed($signed($unsigned((reg11 ? {reg16} : $signed(reg21))))))
            begin
              reg34 <= reg24;
            end
          else
            begin
              reg34 <= $signed((^$unsigned($unsigned(((8'ha2) ?
                  reg26 : (8'hb2))))));
              reg35 <= (|($signed(wire6[(4'h8):(3'h5)]) ?
                  ({$unsigned(wire9)} * $signed({reg30,
                      wire8})) : (wire13[(3'h4):(1'h0)] ?
                      wire6[(1'h1):(1'h1)] : reg27)));
              reg36 <= reg34[(5'h12):(1'h0)];
              reg37 <= (~|($unsigned((^~$unsigned(reg10))) ?
                  (((-reg28) >> (-reg21)) ?
                      reg28 : reg29) : $signed($unsigned(reg24))));
            end
          if ({$signed($unsigned($signed((reg20 ? wire8 : wire15))))})
            begin
              reg38 <= wire15;
              reg39 <= ($unsigned((($unsigned(reg30) ?
                          ((7'h44) <= reg25) : (reg28 ? (7'h43) : reg19)) ?
                      wire8[(2'h2):(2'h2)] : {(reg31 || reg20), (8'ha3)})) ?
                  $unsigned((^((7'h40) ?
                      ((8'hbc) + (7'h43)) : $unsigned(reg10)))) : reg36);
              reg40 <= reg21[(3'h4):(1'h0)];
            end
          else
            begin
              reg38 <= reg10[(4'hd):(2'h2)];
              reg39 <= ((($signed(reg10) ~^ $signed((wire15 ? reg31 : reg17))) ?
                  $signed((reg29[(5'h12):(4'ha)] * $unsigned(reg11))) : ((((8'hb8) ^ reg23) ^~ $signed(reg40)) ?
                      wire7[(4'ha):(2'h2)] : (reg10[(2'h2):(1'h1)] <= (reg20 ?
                          reg10 : wire12)))) - reg32);
              reg40 <= (8'hb8);
              reg41 <= (~|(^~(~^reg20)));
            end
          if ($signed((!(^{(wire9 ? reg21 : wire7),
              ((8'hb7) ? reg41 : reg34)}))))
            begin
              reg42 <= ((~&(^reg21)) ?
                  ($unsigned(wire13[(3'h5):(3'h5)]) ?
                      (reg11[(4'he):(4'hb)] ?
                          (!(^~reg11)) : (reg31 ?
                              (^~reg22) : $signed(reg28))) : reg36) : reg11);
            end
          else
            begin
              reg42 <= $unsigned($unsigned($unsigned(wire14)));
              reg43 <= wire8;
              reg44 <= $unsigned((8'hb5));
              reg45 <= reg28;
              reg46 <= wire7[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg34 <= reg42[(2'h2):(2'h2)];
        end
    end
  always
    @(posedge clk) begin
      reg47 <= reg19[(3'h5):(3'h5)];
      reg48 <= (((!(~|$signed(wire6))) == ($unsigned(((7'h44) ?
              wire15 : reg11)) ?
          reg41 : (reg20[(3'h7):(2'h3)] ?
              $signed(reg27) : $signed(reg45)))) << (($signed((+reg20)) ?
          (!(+wire9)) : {((8'haa) >> (8'hb6)),
              (+reg27)}) >= ($unsigned((reg32 << reg16)) <= (wire14[(5'h11):(3'h6)] ?
          reg11[(2'h3):(2'h3)] : (^~reg39)))));
      if ((8'haf))
        begin
          reg49 <= {(((reg35[(3'h7):(1'h1)] || $signed(reg27)) * (+reg38[(3'h5):(2'h3)])) ?
                  (((reg27 ? reg26 : reg42) ?
                          $signed(wire14) : $signed(reg17)) ?
                      wire6[(4'ha):(4'ha)] : $signed((reg16 - wire15))) : $signed((reg29 ?
                      (&(8'h9c)) : $unsigned(reg46)))),
              (~((~^$signed(reg35)) ? $signed((reg37 != reg38)) : reg31))};
          reg50 <= (reg32[(4'h9):(1'h1)] ?
              (~^($signed($unsigned(reg37)) ?
                  $signed(reg24[(3'h6):(3'h4)]) : $unsigned(((8'ha9) ?
                      wire14 : wire7)))) : (+$unsigned($unsigned({(8'hb6)}))));
          if ($signed(reg11[(4'ha):(2'h3)]))
            begin
              reg51 <= reg35[(3'h6):(3'h6)];
              reg52 <= reg36;
              reg53 <= ({{((reg44 ~^ reg10) >= (~^(7'h41)))},
                  reg37} & $signed(reg21));
            end
          else
            begin
              reg51 <= (reg36 ? $signed(reg27[(1'h0):(1'h0)]) : (8'haf));
              reg52 <= reg26;
              reg53 <= reg32[(3'h6):(2'h3)];
              reg54 <= $signed(reg44[(3'h7):(2'h2)]);
              reg55 <= (~^{($unsigned((+reg51)) ?
                      $unsigned((-reg21)) : (reg51[(1'h1):(1'h1)] ?
                          (reg17 ^~ (8'hb2)) : (reg46 ? reg35 : reg25)))});
            end
        end
      else
        begin
          reg49 <= (+$unsigned($unsigned(((reg25 ? wire9 : reg47) >= (reg48 ?
              reg18 : reg23)))));
        end
      reg56 <= $unsigned($unsigned(reg19));
      reg57 <= (|reg19[(3'h7):(3'h4)]);
    end
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire96;
  input wire signed [(4'hb):(1'h0)] wire95;
  input wire [(5'h11):(1'h0)] wire94;
  input wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 (1'h0)};
  assign wire97 = ((&(~$signed($unsigned(wire93)))) ^ (wire94 & wire93[(4'h9):(2'h3)]));
  assign wire98 = (^~(wire93[(3'h7):(2'h2)] ?
                      {wire93, wire93[(2'h3):(1'h0)]} : ({((8'hac) ?
                                  wire93 : wire94),
                              wire97[(4'hb):(3'h6)]} ?
                          ((wire94 ?
                              wire96 : wire94) ^ (~^wire96)) : (((8'hb9) ?
                              (8'h9e) : wire96) || (&(8'had))))));
  assign wire99 = (~wire97);
  assign wire100 = wire99;
  assign wire101 = $signed((+(wire96 ^ {(wire100 ? wire99 : wire96),
                       wire96[(1'h0):(1'h0)]})));
  assign wire102 = (&((-(8'hb0)) ?
                       $signed(((^wire99) ?
                           (wire94 ? (8'h9c) : wire93) : (wire93 ?
                               wire98 : (8'hb0)))) : ($unsigned((wire100 ?
                               (8'ha2) : wire99)) ?
                           $unsigned((7'h40)) : $unsigned(wire93[(2'h3):(1'h1)]))));
  assign wire103 = (((^~(wire93 ?
                               $signed(wire96) : ((8'hba) ? wire95 : wire93))) ?
                           wire101[(3'h7):(3'h6)] : ({$unsigned(wire102)} >>> $signed($unsigned(wire97)))) ?
                       $unsigned((wire94 <<< wire94)) : (&wire97[(5'h11):(3'h4)]));
  assign wire104 = ({wire95[(4'h9):(1'h1)],
                           $unsigned((wire97 ?
                               $unsigned(wire96) : (wire101 == wire97)))} ?
                       ((-($signed(wire99) ?
                           $signed(wire96) : $unsigned(wire102))) || $unsigned(($unsigned(wire95) ?
                           (wire99 ?
                               wire94 : wire95) : (wire103 <<< wire98)))) : $signed($unsigned(wire102[(3'h7):(1'h1)])));
endmodule

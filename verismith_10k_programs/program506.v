module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire140;
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire52,
                 wire5,
                 wire54,
                 wire58,
                 wire122,
                 wire124,
                 wire126,
                 wire127,
                 wire138,
                 wire139,
                 wire140,
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
                 reg125,
                 reg57,
                 reg56,
                 reg55,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (-$unsigned($unsigned((~(wire1 ? wire2 : wire3)))));
  always
    @(posedge clk) begin
      reg6 <= ((+(~&wire4[(3'h6):(1'h1)])) ?
          $signed(((wire3 ? (wire4 ^~ wire2) : (wire1 < wire1)) && {(wire5 ?
                  wire4 : wire4)})) : ((|((|wire2) ?
                  (wire0 ? wire2 : wire3) : (-wire4))) ?
              $unsigned((|wire4[(3'h6):(3'h6)])) : (-(^wire1[(2'h2):(2'h2)]))));
      reg7 <= (8'hbb);
      reg8 <= $unsigned(((|wire4) ?
          $unsigned(((wire0 > wire0) ?
              $unsigned(wire2) : {reg7,
                  wire3})) : (~|$unsigned(wire5[(4'h9):(3'h6)]))));
      reg9 <= $unsigned(wire0[(1'h0):(1'h0)]);
      reg10 <= $unsigned((8'h9c));
    end
  module11 #() modinst53 (.wire16(wire4), .clk(clk), .wire15(wire3), .wire13(wire0), .y(wire52), .wire12(reg9), .wire14(reg8));
  assign wire54 = $signed((reg6[(3'h5):(1'h0)] ?
                      reg9[(1'h0):(1'h0)] : $signed(reg6[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg55 <= (wire4 && wire0);
      if (wire52[(4'hc):(2'h2)])
        begin
          reg56 <= (wire3[(4'ha):(2'h2)] >> reg10[(4'h8):(2'h3)]);
          reg57 <= ({(7'h42)} ~^ reg56[(2'h2):(1'h1)]);
        end
      else
        begin
          reg56 <= (8'hb4);
        end
    end
  assign wire58 = wire4;
  module59 #() modinst123 (wire122, clk, wire3, reg57, wire0, reg8);
  assign wire124 = $unsigned(((-reg57) << ((&$signed((7'h40))) ^~ (wire1[(1'h1):(1'h0)] >= (~|reg10)))));
  always
    @(posedge clk) begin
      reg125 <= wire0;
    end
  assign wire126 = wire4[(3'h7):(3'h6)];
  assign wire127 = wire126;
  always
    @(posedge clk) begin
      reg128 <= ((8'hb9) < $signed($unsigned({wire2})));
      if (wire122)
        begin
          reg129 <= ((^~(reg7[(1'h1):(1'h0)] ?
                  (^~wire4) : $signed({(8'ha5), wire54}))) ?
              reg9[(4'he):(4'h8)] : $signed($unsigned((7'h40))));
          if ($unsigned($unsigned((wire127 ?
              wire3 : ((wire126 ? wire5 : wire5) ?
                  $unsigned(wire54) : (wire1 ? wire2 : reg8))))))
            begin
              reg130 <= $unsigned((!$signed($unsigned({wire54, wire3}))));
            end
          else
            begin
              reg130 <= $signed(wire1);
              reg131 <= ($unsigned($signed($signed($signed(reg129)))) != (wire4[(4'ha):(1'h1)] * (wire122[(4'h8):(2'h2)] ?
                  wire127[(1'h1):(1'h0)] : reg129)));
              reg132 <= (((-{reg125[(1'h1):(1'h0)], reg56}) ?
                      (~&$signed((reg125 * reg128))) : $signed($unsigned(wire52))) ?
                  (reg10[(4'h9):(1'h0)] <= (((reg6 ? reg129 : (8'ha4)) ?
                      {reg8} : $unsigned(reg10)) >= (-(wire127 && wire54)))) : reg9[(4'he):(4'hb)]);
            end
          if (($unsigned($unsigned($signed(((8'hb0) ?
              reg7 : reg57)))) ^~ (~^{$unsigned((wire54 ? (8'ha3) : reg55))})))
            begin
              reg133 <= (|$signed(wire2));
              reg134 <= $signed(($unsigned(wire126) ?
                  reg6[(3'h5):(1'h0)] : $signed($unsigned((reg10 ?
                      reg10 : wire52)))));
              reg135 <= wire3[(3'h6):(3'h6)];
              reg136 <= (~|reg135);
            end
          else
            begin
              reg133 <= reg125[(2'h3):(1'h0)];
            end
        end
      else
        begin
          if ((reg136 ? $unsigned(reg133) : wire2[(3'h4):(2'h3)]))
            begin
              reg129 <= $signed($unsigned((+(&((7'h41) ~^ wire4)))));
              reg130 <= wire3;
            end
          else
            begin
              reg129 <= ($unsigned($unsigned($signed(reg128[(2'h2):(1'h0)]))) && (reg135 + wire0));
              reg130 <= (reg125[(1'h1):(1'h0)] == ((({(8'hb7),
                      reg9} >> (wire3 ^ (8'haa))) != ($unsigned((8'hbe)) ?
                      $signed(reg57) : $signed(wire2))) ?
                  reg131[(4'h9):(2'h2)] : $unsigned(reg129)));
            end
          if ($signed($unsigned($signed($signed(wire2)))))
            begin
              reg131 <= (($unsigned($unsigned((|wire58))) ?
                      reg129[(2'h3):(1'h1)] : wire58) ?
                  $unsigned(reg57[(4'hc):(4'hc)]) : ($signed($unsigned(reg57)) && (((8'ha5) ?
                          reg9[(5'h11):(4'hd)] : $signed(reg7)) ?
                      (reg129[(1'h1):(1'h0)] >> wire2) : $signed((reg125 & reg56)))));
            end
          else
            begin
              reg131 <= {(-((~|wire54[(2'h2):(2'h2)]) ?
                      {$unsigned(wire4), wire0} : $unsigned((8'ha4)))),
                  (($signed((reg8 ? reg136 : wire1)) >> $signed((|reg134))) ?
                      (8'hae) : {reg6[(2'h2):(2'h2)]})};
              reg132 <= ($unsigned({$signed((wire58 ? reg125 : wire127)),
                  $unsigned($unsigned((8'hbc)))}) <<< (^~($unsigned((wire127 ?
                  wire0 : (8'had))) >= reg8)));
              reg133 <= wire3[(1'h1):(1'h1)];
              reg134 <= (^(({wire4[(5'h12):(4'ha)]} >> $signed(reg132[(4'hc):(2'h2)])) ?
                  $signed(reg9) : $unsigned(reg133)));
              reg135 <= (($signed(((reg130 ?
                  reg7 : (8'hb7)) - reg9)) ^ $unsigned($signed((^~wire0)))) ~^ reg135);
            end
          reg136 <= (reg7[(3'h5):(3'h5)] ?
              $unsigned($unsigned($unsigned(wire54[(1'h0):(1'h0)]))) : ($signed({reg136[(3'h5):(2'h2)],
                      (reg125 ? (8'h9d) : reg56)}) ?
                  reg128 : ($unsigned($signed(wire127)) ?
                      $unsigned($signed(reg128)) : $unsigned(wire124[(3'h5):(3'h4)]))));
          reg137 <= ($unsigned(wire126[(3'h4):(1'h0)]) & reg55);
        end
    end
  assign wire138 = $signed($signed((({(8'hb3)} <<< (reg133 ?
                       wire5 : (8'ha6))) <<< {$unsigned(wire126), {wire52}})));
  assign wire139 = (wire3 * ($signed(wire5[(1'h0):(1'h0)]) ?
                       ($signed($signed((8'had))) & ($unsigned(wire3) << {reg10,
                           wire52})) : (((wire127 >> reg133) != (wire2 ^ wire127)) ?
                           $signed(reg7) : reg136[(3'h6):(3'h5)])));
  module11 #() modinst141 (wire140, clk, reg56, wire139, reg55, wire1, wire5);
  assign wire142 = reg130[(2'h2):(1'h0)];
  assign wire143 = $signed(({(reg132[(4'ha):(1'h0)] > (wire142 < (7'h41)))} ?
                       (reg137 ? reg134[(1'h0):(1'h0)] : wire142) : wire54));
  assign wire144 = $signed($unsigned($unsigned($unsigned((wire124 ?
                       reg57 : reg128)))));
  assign wire145 = $signed(reg137);
  assign wire146 = ((+$unsigned(($unsigned(wire138) >> ((8'hb2) ?
                           wire126 : wire2)))) ?
                       $signed(wire142[(1'h0):(1'h0)]) : reg6[(2'h3):(1'h0)]);
endmodule

module module59
#(parameter param120 = ((~|((((8'hb1) ? (8'hb2) : (8'hba)) + {(8'ha7), (8'hae)}) ? (^~(&(7'h44))) : (((7'h43) ? (8'ha9) : (8'hbc)) | {(8'hbb)}))) >> (8'ha1)), 
parameter param121 = param120)
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire63;
  input wire [(4'hf):(1'h0)] wire62;
  input wire signed [(4'ha):(1'h0)] wire61;
  input wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire119;
  wire signed [(4'ha):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire64;
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 wire64,
                 (1'h0)};
  assign wire64 = wire63;
  module65 #() modinst92 (wire91, clk, wire62, wire64, wire61, wire60);
  assign wire93 = (-wire63[(5'h14):(3'h4)]);
  assign wire94 = wire93;
  assign wire95 = wire62[(4'hb):(2'h2)];
  assign wire96 = $unsigned(wire91[(4'h9):(3'h4)]);
  assign wire97 = $signed((+(wire94[(4'h8):(4'h8)] ?
                      ((wire61 ? wire61 : wire64) ?
                          (wire60 ? wire62 : wire91) : wire61) : ({(8'hbc),
                          wire95} - {wire64, wire63}))));
  module98 #() modinst113 (wire112, clk, wire93, wire62, wire95, wire63);
  assign wire114 = ($unsigned({{$signed(wire93), $signed(wire112)},
                           (((8'hac) ? wire93 : wire64) ?
                               $unsigned(wire62) : (wire62 ?
                                   wire93 : wire62))}) ?
                       (!{$unsigned(wire93[(3'h7):(3'h5)])}) : wire62[(4'h9):(4'h9)]);
  assign wire115 = (~|($signed($unsigned((wire93 ? wire63 : wire112))) ?
                       $signed({$signed(wire97)}) : wire91[(1'h0):(1'h0)]));
  assign wire116 = (wire91 | (($unsigned(wire60[(4'he):(4'h8)]) ?
                           $unsigned((wire93 ? wire62 : wire93)) : wire60) ?
                       wire115 : wire63));
  assign wire117 = (^$signed($unsigned((wire116 ?
                       wire61 : {wire116, (8'ha0)}))));
  assign wire118 = $unsigned(({$unsigned((wire94 | wire95))} * $unsigned($signed((wire91 >> wire64)))));
  assign wire119 = (wire93 >> $unsigned($unsigned((((8'hab) && wire63) ?
                       (wire115 <<< wire63) : wire96[(4'hf):(3'h4)]))));
endmodule

module module11
#(parameter param51 = {(((((8'ha7) >= (8'had)) | ((8'hbb) + (8'hb6))) ? (8'h9f) : (+(8'h9d))) | (8'hb0))})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  assign y = {wire50, wire48, wire18, wire17, (1'h0)};
  assign wire17 = wire16[(4'hd):(1'h1)];
  assign wire18 = $unsigned(wire17);
  module19 #() modinst49 (wire48, clk, wire13, wire15, wire14, wire18);
  assign wire50 = {(((~&$unsigned(wire16)) ?
                          (^wire15) : wire14[(3'h7):(1'h0)]) & $unsigned(((wire16 ?
                              wire18 : wire12) ?
                          (wire48 != wire16) : wire12[(4'hc):(1'h0)])))};
endmodule

module module19
#(parameter param47 = ({(((^(8'hb2)) >= (|(7'h42))) | {((8'ha4) <= (8'hb2))}), ({{(7'h41)}, ((8'hbd) ? (8'hb5) : (8'hb4))} ^~ (+(^~(8'hb0))))} ? (~^((((8'haa) ? (8'ha3) : (8'ha7)) ? ((8'hb8) ? (8'hae) : (8'ha6)) : ((7'h44) ? (8'hb0) : (8'haf))) ? (8'hbe) : (((7'h44) ? (8'hb4) : (8'hbb)) ? ((7'h42) ? (8'hbd) : (8'hb0)) : (7'h40)))) : (|(({(7'h40)} ? {(7'h40)} : ((7'h42) ? (8'hac) : (8'hb2))) < (((8'ha7) < (8'hb7)) ? ((8'hb5) ^ (8'ha3)) : ((7'h40) ? (8'ha4) : (8'ha2)))))))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire25;
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  assign y = {wire46,
                 wire25,
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
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= $signed($signed(wire21));
    end
  assign wire25 = $unsigned((wire23 ?
                      $unsigned((((8'hab) ? wire23 : wire20) ?
                          $unsigned(wire20) : (reg24 ?
                              wire22 : wire21))) : wire21[(4'ha):(3'h7)]));
  always
    @(posedge clk) begin
      reg26 <= (8'h9c);
      if (wire22[(4'hb):(1'h0)])
        begin
          reg27 <= $signed((|wire23[(5'h10):(4'hc)]));
          reg28 <= wire21[(3'h4):(2'h2)];
          if ($unsigned((&wire25[(2'h3):(1'h0)])))
            begin
              reg29 <= $unsigned($signed(reg26));
              reg30 <= {$signed(((~^$signed(wire23)) ?
                      ($unsigned(wire25) && (8'hb9)) : wire22)),
                  wire23[(4'he):(3'h5)]};
              reg31 <= (~&{($signed(((8'h9c) ^ reg24)) ?
                      ((reg24 ^~ (8'hb2)) >= (wire20 ?
                          reg30 : wire23)) : wire20[(4'h8):(1'h0)]),
                  (+$signed($unsigned(wire21)))});
            end
          else
            begin
              reg29 <= {$unsigned($unsigned((wire23 ?
                      $signed(wire21) : reg29[(1'h1):(1'h1)]))),
                  (8'haf)};
            end
          reg32 <= (-((~&$signed(((8'hbb) - wire22))) < wire20[(4'hc):(3'h6)]));
          reg33 <= (($unsigned($signed($signed(reg29))) ?
                  $unsigned($signed((~^reg27))) : $unsigned((~wire21[(3'h7):(2'h3)]))) ?
              ($unsigned({reg29[(1'h1):(1'h1)],
                  $signed(reg31)}) || wire20[(4'hc):(2'h3)]) : (~^{({reg26} == (reg24 + reg27)),
                  reg24[(1'h0):(1'h0)]}));
        end
      else
        begin
          reg27 <= $signed($signed(wire25));
        end
    end
  always
    @(posedge clk) begin
      reg34 <= $signed(reg30[(3'h6):(2'h3)]);
      reg35 <= {$unsigned(($unsigned((reg33 ? wire22 : reg26)) <= reg29))};
      if (((!(~|(reg29[(2'h2):(1'h1)] == $unsigned((8'hae))))) | (~^(((^reg28) ?
          reg27[(2'h3):(2'h3)] : $signed(reg30)) << $signed($signed(reg34))))))
        begin
          reg36 <= (8'hbe);
          reg37 <= ((~&reg27) ?
              ((reg33[(2'h3):(1'h0)] <<< (^(~&wire20))) ?
                  ($unsigned($unsigned((8'ha2))) ?
                      reg30[(3'h5):(1'h1)] : (+$unsigned(reg29))) : reg26[(4'he):(4'h9)]) : ($signed((~^$signed(wire23))) ?
                  ($signed($signed((8'ha9))) ?
                      $signed(((8'ha0) & wire21)) : (+wire21[(3'h4):(2'h3)])) : (reg32 ?
                      $unsigned(reg32) : $signed($unsigned((8'hb6))))));
          reg38 <= $unsigned((~$signed(wire22[(4'ha):(3'h4)])));
          if ((wire25[(3'h4):(2'h3)] ?
              {$unsigned(wire21[(3'h6):(3'h4)])} : (+({wire21} == reg26[(3'h6):(3'h4)]))))
            begin
              reg39 <= $unsigned(($unsigned(((reg27 ?
                      reg28 : wire25) < $signed(reg29))) ?
                  reg33 : (^~reg28[(4'h8):(4'h8)])));
            end
          else
            begin
              reg39 <= {reg36[(2'h3):(2'h2)]};
              reg40 <= (&reg39[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg36 <= $unsigned(reg24);
          reg37 <= reg40[(3'h5):(3'h5)];
          if ((($unsigned($unsigned({reg32, reg32})) ?
                  (~{(wire22 >>> wire23),
                      (reg29 ?
                          reg39 : (7'h41))}) : $signed((reg24[(2'h2):(2'h2)] ?
                      (reg32 >> wire25) : (&reg29)))) ?
              {reg32} : (~^reg33)))
            begin
              reg38 <= ($unsigned(reg28) ?
                  wire25[(1'h0):(1'h0)] : $unsigned(wire21[(3'h6):(3'h5)]));
              reg39 <= $unsigned(reg39);
              reg40 <= $signed(reg38);
              reg41 <= wire23;
              reg42 <= (($unsigned($signed($signed((8'ha4)))) ?
                      {$signed((wire22 > (8'hbc))),
                          $unsigned((~&reg32))} : {(~$unsigned((8'hb4))),
                          ($signed(reg30) ^~ $signed(wire23))}) ?
                  ((!{$signed((8'hbe))}) || ($signed(reg26[(1'h1):(1'h0)]) ?
                      $signed((^~reg33)) : $signed($signed(reg26)))) : (reg36 | ((((8'hbe) << reg35) ?
                      (wire23 ? (8'hb2) : reg36) : wire22) + ((-(8'hb8)) ?
                      $unsigned(reg24) : reg31))));
            end
          else
            begin
              reg38 <= ((!$signed($unsigned($signed(reg29)))) ?
                  wire23[(4'hc):(1'h1)] : $unsigned((!$signed($unsigned(wire25)))));
              reg39 <= (|wire22[(5'h15):(5'h11)]);
            end
          reg43 <= $unsigned($signed({wire20[(4'h8):(1'h0)]}));
          reg44 <= wire23;
        end
      reg45 <= ({$unsigned(reg38)} ?
          reg39 : (($unsigned($unsigned((8'hbe))) ?
                  reg29[(1'h0):(1'h0)] : $signed($unsigned(reg34))) ?
              wire21 : $unsigned($unsigned((8'hb9)))));
    end
  assign wire46 = $unsigned($unsigned((($signed(reg42) ?
                          $signed(wire20) : $signed((8'had))) ?
                      reg24[(1'h1):(1'h1)] : {(^reg29)})));
endmodule

module module98
#(parameter param111 = ((~^{(&{(8'hb7)})}) == (((^~{(8'hac)}) ? (((8'ha5) ~^ (7'h40)) ? ((8'hb8) * (8'hb5)) : (|(8'ha9))) : ((^(8'hba)) ? ((8'ha9) != (8'ha2)) : {(8'hb5)})) * (^~(((8'hb3) ^ (8'hb5)) ? ((8'hbd) > (8'h9c)) : ((8'hb4) >= (8'ha0)))))))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire102;
  input wire signed [(4'hf):(1'h0)] wire101;
  input wire signed [(5'h15):(1'h0)] wire100;
  input wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 (1'h0)};
  assign wire103 = wire102[(3'h6):(2'h3)];
  assign wire104 = ($signed(((wire100 || (wire103 ?
                           wire100 : wire99)) != $signed((wire102 ^ wire101)))) ?
                       $signed(wire101) : wire103[(2'h3):(1'h1)]);
  assign wire105 = (+wire101[(2'h2):(1'h1)]);
  assign wire106 = wire101;
  assign wire107 = (wire103[(2'h2):(1'h1)] ? wire104[(2'h3):(2'h3)] : (8'h9d));
  assign wire108 = ($signed(((!wire105[(2'h2):(1'h1)]) - wire100)) ?
                       (^~wire99[(4'h8):(3'h4)]) : (wire103[(2'h2):(1'h0)] ?
                           (($signed(wire102) ?
                                   $signed(wire100) : wire100[(4'hd):(4'h9)]) ?
                               {(wire102 ?
                                       wire99 : wire101)} : {$unsigned((8'hab)),
                                   wire104}) : (wire100[(3'h6):(3'h5)] < $unsigned(wire100))));
  assign wire109 = (wire107[(2'h3):(1'h0)] ?
                       {(~^((wire106 & wire105) ?
                               $unsigned(wire102) : {wire105, wire100})),
                           wire103} : {(!(7'h41))});
  assign wire110 = $signed((~|((wire107 ?
                       wire107[(1'h1):(1'h0)] : (wire106 <= wire105)) ^~ wire103[(2'h2):(2'h2)])));
endmodule

module module65
#(parameter param89 = (~&(~&((!((8'hb4) * (8'ha7))) && ((~|(8'h9c)) ? ((8'ha5) ? (8'ha2) : (8'hb9)) : ((8'ha5) ? (8'ha7) : (8'hae)))))), 
parameter param90 = (~((~|(param89 >>> (param89 ? param89 : param89))) ? param89 : param89)))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire69;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire [(2'h3):(1'h0)] wire67;
  input wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  assign y = {wire88,
                 wire83,
                 wire82,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire71,
                 wire70,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg73,
                 (1'h0)};
  assign wire70 = (~$signed($signed({wire69, {wire68, wire69}})));
  assign wire71 = wire67[(2'h3):(1'h1)];
  assign wire72 = (wire66[(3'h4):(3'h4)] || $signed({(((8'hb5) ?
                              wire66 : wire69) ?
                          wire71 : (~^wire70)),
                      $unsigned(wire68)}));
  always
    @(posedge clk) begin
      reg73 <= wire68;
    end
  assign wire74 = (wire66 ?
                      (wire69[(4'ha):(3'h4)] ?
                          (|$signed((~(8'hbc)))) : $signed($signed((reg73 ?
                              (8'ha4) : wire67)))) : (|(wire66[(2'h3):(1'h1)] ?
                          wire71[(1'h0):(1'h0)] : $unsigned(wire71))));
  assign wire75 = {{(wire66 + {wire67[(1'h0):(1'h0)]}), wire66[(4'hf):(1'h1)]},
                      (wire67 ? wire70 : wire72)};
  assign wire76 = wire74;
  always
    @(posedge clk) begin
      reg77 <= (8'hb7);
      reg78 <= (8'ha7);
      reg79 <= $signed(wire70);
      reg80 <= (~(reg78[(4'hd):(3'h7)] <<< $unsigned((wire72 ?
          {wire72} : (~wire69)))));
      reg81 <= ($unsigned((~&$signed(reg78))) ?
          $signed(((((8'hb8) ^ wire70) < (wire70 ^~ reg78)) ?
              $unsigned((&wire70)) : ($signed((7'h43)) == $unsigned(wire67)))) : (~^($signed((^~reg79)) >> (wire69 ?
              $unsigned(reg73) : (reg79 ? wire76 : reg80)))));
    end
  assign wire82 = ((+reg80) && reg80[(2'h2):(2'h2)]);
  assign wire83 = wire74[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg84 <= (((+{reg73[(3'h6):(1'h0)], (wire83 >> reg79)}) ?
              $unsigned((((8'h9f) ?
                  (8'hab) : reg78) ^ (wire71 ^~ reg79))) : $unsigned(wire75)) ?
          $signed($signed((reg79[(2'h2):(1'h0)] >> (~&reg77)))) : reg77[(2'h3):(1'h1)]);
      if ($unsigned(($signed((((8'hbe) == reg81) ?
              wire72 : reg80[(2'h2):(1'h0)])) ?
          $signed({{wire68}}) : $unsigned($unsigned((wire74 ?
              wire67 : wire75))))))
        begin
          reg85 <= ((~{(8'hb1), ((-wire72) == reg78)}) ?
              wire82[(1'h1):(1'h1)] : $signed($unsigned(((wire70 ?
                      (8'ha2) : wire72) ?
                  $signed(wire68) : reg73[(1'h1):(1'h0)]))));
          reg86 <= ((wire82[(3'h4):(2'h2)] ?
                  (($signed(wire71) ? $unsigned(reg81) : {wire69}) ?
                      $unsigned((&wire66)) : (~|$signed(wire72))) : $unsigned($unsigned((8'h9e)))) ?
              (8'ha0) : (8'ha6));
        end
      else
        begin
          reg85 <= ((8'ha1) ?
              (reg77[(5'h12):(3'h4)] & {{wire68}}) : reg73[(3'h6):(1'h1)]);
        end
      reg87 <= $signed(((7'h40) | $signed(wire76[(5'h14):(5'h12)])));
    end
  assign wire88 = wire68[(2'h2):(1'h0)];
endmodule

module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(2'h3):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire123;
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
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
                 reg143,
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
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= $unsigned(wire1[(3'h5):(3'h5)]);
      reg7 <= (+(wire4 >>> reg6));
    end
  module8 #() modinst124 (wire123, clk, reg5, wire1, wire3, reg7);
  assign wire125 = wire2[(4'h8):(4'h8)];
  assign wire126 = $signed($signed($unsigned(wire2)));
  assign wire127 = (reg6 && (&wire125[(4'hf):(4'hb)]));
  always
    @(posedge clk) begin
      reg128 <= (wire127[(1'h0):(1'h0)] ^~ $signed(wire125[(1'h0):(1'h0)]));
      reg129 <= wire123[(5'h10):(2'h3)];
      if (((~$unsigned(($unsigned((8'ha8)) ?
          reg6 : wire2[(4'hc):(4'h8)]))) & $signed(wire126[(2'h3):(2'h2)])))
        begin
          reg130 <= ($unsigned({wire3, wire125}) >> {{(-(wire3 && wire125))}});
          if ((|wire1))
            begin
              reg131 <= $signed({$signed((^reg130)), (+$signed({reg5}))});
              reg132 <= $unsigned({reg130[(3'h7):(2'h3)]});
              reg133 <= wire126[(1'h0):(1'h0)];
            end
          else
            begin
              reg131 <= wire2[(4'hb):(3'h4)];
              reg132 <= wire2;
              reg133 <= $signed((^~(^((wire123 >>> wire0) | (8'hb9)))));
              reg134 <= ($signed(wire126[(2'h2):(2'h2)]) >>> $signed(reg7[(4'ha):(3'h4)]));
              reg135 <= ($unsigned((((^reg130) ?
                          (wire2 ? (8'hbc) : reg132) : ((8'hac) ?
                              reg134 : wire1)) ?
                      $signed({(8'hbd), wire3}) : wire127[(2'h3):(2'h2)])) ?
                  $signed((({wire2, reg5} ?
                          $signed(reg6) : (reg130 ? reg134 : reg132)) ?
                      wire0 : $signed($signed(reg128)))) : ({wire1} ?
                      reg132[(1'h1):(1'h1)] : $unsigned($signed($signed((7'h41))))));
            end
        end
      else
        begin
          reg130 <= $unsigned((wire127 ?
              reg133 : (({wire0} >>> (wire2 ^ wire123)) ?
                  $signed((8'hac)) : ((wire4 ? (8'hbd) : wire4) ?
                      wire3 : $unsigned(wire0)))));
          if (wire3)
            begin
              reg131 <= ((reg7 ? wire2[(4'hc):(1'h0)] : wire2) ?
                  reg129[(2'h2):(1'h1)] : wire2[(4'ha):(3'h5)]);
              reg132 <= wire4;
              reg133 <= ($signed(({(|reg135)} + reg133)) ?
                  (((!reg134[(2'h3):(2'h2)]) >>> (reg130 ?
                          wire0[(4'hf):(4'hf)] : $unsigned((8'hb5)))) ?
                      {wire2[(4'hf):(3'h7)]} : (wire1 >>> {$signed(reg5),
                          $unsigned(reg129)})) : (8'hbc));
              reg134 <= reg129[(3'h7):(3'h5)];
            end
          else
            begin
              reg131 <= $unsigned(((((wire2 & reg130) ?
                  (wire126 ?
                      reg6 : (8'hbf)) : $signed(wire125)) & $signed((wire125 + wire125))) > {(-{(8'hb9)})}));
              reg132 <= ($signed({((reg133 <<< (7'h40)) ~^ $unsigned(wire125))}) - $unsigned((!$signed(wire4))));
              reg133 <= $signed(((wire1 < $signed((~^reg132))) ?
                  $signed(({reg132,
                      (8'h9f)} - reg6)) : $signed($unsigned((^~wire4)))));
            end
          reg135 <= reg5[(3'h4):(2'h2)];
        end
      reg136 <= reg134;
    end
  always
    @(posedge clk) begin
      reg137 <= $unsigned(wire3[(4'h9):(3'h7)]);
      reg138 <= ((^~$signed($signed(reg132))) << $unsigned({(8'hac)}));
      reg139 <= ((^~{reg136, reg7}) - ((^~$unsigned((reg128 ?
              reg137 : wire123))) ?
          (~^(reg5 ? wire126[(2'h2):(2'h2)] : (~^wire123))) : (8'ha9)));
      if ((wire126 ?
          ({((~^reg137) ^ $unsigned(reg133)), $unsigned($signed(wire125))} ?
              ((((8'hb8) & reg128) ?
                  $unsigned(wire123) : $signed(wire2)) >> reg7) : reg133) : (wire2 ?
              $unsigned((8'hab)) : wire123[(3'h6):(3'h4)])))
        begin
          reg140 <= {$unsigned(reg6)};
          reg141 <= (((((wire2 ? (8'hb6) : wire0) ?
              wire1[(2'h3):(1'h1)] : reg132[(1'h1):(1'h0)]) ^ reg133) ^~ $unsigned($signed($signed(wire4)))) ^ wire127);
          reg142 <= (^(&{{(wire123 & reg135), wire0}}));
          reg143 <= reg130;
        end
      else
        begin
          reg140 <= $unsigned(reg5[(4'hb):(1'h0)]);
        end
      reg144 <= {reg133[(1'h1):(1'h0)]};
    end
  always
    @(posedge clk) begin
      if (($signed($signed(reg140)) ?
          {(~^wire125[(4'hd):(4'ha)])} : (({(reg5 ^~ reg137)} ?
                  $signed(wire2[(4'hf):(3'h5)]) : (reg136[(1'h0):(1'h0)] > (~^reg130))) ?
              (^~$unsigned((~&reg135))) : ($signed($signed(wire3)) && reg139))))
        begin
          if (($signed((reg5[(2'h3):(1'h0)] ?
                  ((reg128 ? reg135 : reg144) != {reg141,
                      reg6}) : {reg144[(1'h1):(1'h0)],
                      reg139[(1'h1):(1'h1)]})) ?
              wire127[(1'h0):(1'h0)] : (^(wire2[(2'h2):(1'h0)] ?
                  (&(reg144 ? reg142 : reg136)) : wire3))))
            begin
              reg145 <= $unsigned((reg141 != (~&$unsigned(reg128[(3'h5):(3'h4)]))));
              reg146 <= (~^(($unsigned($unsigned(reg132)) ?
                  $signed((reg7 ? reg140 : reg130)) : {(+wire127),
                      (wire3 > wire1)}) <<< (~^{$unsigned(reg144)})));
            end
          else
            begin
              reg145 <= reg142[(2'h3):(1'h0)];
              reg146 <= (+$unsigned($unsigned(((reg137 && wire0) ?
                  reg145[(2'h2):(2'h2)] : $signed(wire126)))));
              reg147 <= reg139[(1'h0):(1'h0)];
              reg148 <= $signed(wire0);
              reg149 <= reg146;
            end
          reg150 <= $unsigned(reg6);
          if (reg143)
            begin
              reg151 <= reg133[(4'h8):(4'h8)];
              reg152 <= (($unsigned((|$unsigned(reg141))) ?
                  (^$unsigned(reg143)) : reg146[(4'hd):(3'h4)]) <= (+reg137));
            end
          else
            begin
              reg151 <= $signed(({$unsigned($signed(reg5)),
                      ((reg135 + wire1) ?
                          (wire1 != (8'ha1)) : (reg134 | wire4))} ?
                  (!(8'hba)) : ($unsigned(reg135) ?
                      (reg150[(5'h12):(5'h10)] << (reg6 ?
                          wire125 : reg151)) : (~|(reg143 ?
                          (8'hbb) : reg142)))));
            end
        end
      else
        begin
          reg145 <= ($unsigned(((~&reg140[(1'h0):(1'h0)]) ?
              (~&reg144[(1'h0):(1'h0)]) : reg7)) >> ({reg150[(4'hd):(3'h7)],
                  $signed($signed(reg144))} ?
              (((!(8'h9d)) ~^ {reg145}) == wire1[(3'h5):(1'h0)]) : ($signed((reg133 + (8'hbd))) ?
                  ((reg141 ^ reg137) ?
                      $unsigned(reg148) : $unsigned(reg147)) : reg133[(1'h0):(1'h0)])));
        end
      reg153 <= wire0[(3'h6):(1'h1)];
    end
  assign wire154 = {$signed($unsigned($unsigned((+reg140)))),
                       $signed(($unsigned(wire125) ?
                           ($unsigned(reg137) ?
                               reg5[(3'h4):(3'h4)] : $signed(wire127)) : $unsigned($unsigned(wire1))))};
  assign wire155 = (wire126[(2'h2):(1'h1)] ?
                       ($unsigned($unsigned(wire127[(1'h1):(1'h1)])) ?
                           ($unsigned(((8'had) >> wire126)) ?
                               $signed($unsigned(wire126)) : ((reg5 - reg141) ?
                                   (^reg128) : $signed(reg130))) : $unsigned(((8'ha7) ?
                               (~|reg150) : (reg144 || reg145)))) : reg141[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      if ((($unsigned($unsigned(wire125)) ?
              reg7[(3'h4):(2'h2)] : $signed(($signed(wire3) >= reg6))) ?
          $unsigned({((reg133 < reg7) > $signed((8'hb7))),
              reg146}) : $signed($unsigned($unsigned((8'hb4))))))
        begin
          reg156 <= ((8'ha4) ?
              wire154[(2'h3):(1'h0)] : (!(~&reg145[(5'h10):(4'ha)])));
          reg157 <= {(^~(reg133 ?
                  $unsigned({reg143, reg131}) : $signed((reg152 ?
                      reg5 : reg134))))};
          reg158 <= ($unsigned(reg157[(4'hc):(3'h5)]) ?
              (($signed(reg133) > ((reg150 ?
                      reg156 : (7'h40)) <<< (&wire123))) ?
                  wire126[(1'h0):(1'h0)] : reg129) : ((reg129[(4'h9):(3'h5)] ?
                      (reg135 ?
                          (reg142 ?
                              reg136 : reg133) : (reg141 && reg131)) : (reg144 < reg143[(4'hf):(4'hf)])) ?
                  $signed(((~&reg141) ?
                      reg148 : $unsigned(wire123))) : reg150));
          reg159 <= (-$unsigned((^$unsigned((~&reg137)))));
        end
      else
        begin
          reg156 <= ($signed($signed((-$unsigned(wire0)))) - wire125);
          reg157 <= $signed(reg151);
          reg158 <= (!wire154[(1'h1):(1'h1)]);
        end
      reg160 <= (reg151[(2'h3):(1'h1)] ?
          (reg153 || reg147) : (|reg5[(3'h6):(2'h3)]));
    end
endmodule

module module8
#(parameter param122 = {(((((8'ha8) >> (7'h42)) ? ((7'h42) ? (8'hbe) : (8'ha8)) : (|(8'hba))) << ((^~(8'ha0)) ^~ ((8'haa) != (8'h9e)))) ? ((((8'hbe) ? (8'hb2) : (8'hab)) == ((8'hbb) <<< (8'h9d))) ^ {((8'hb2) <= (8'hb8))}) : (((|(8'ha7)) ? {(8'h9c), (8'h9e)} : ((8'hba) >= (7'h40))) ? ((-(8'had)) ? ((7'h42) ? (8'ha1) : (8'hbb)) : (^(8'hbf))) : ((^(8'hb6)) << (~^(8'ha4))))), ((((~^(8'h9f)) ? ((8'ha4) ? (7'h40) : (8'hbb)) : ((7'h44) ? (7'h42) : (7'h41))) >>> {((7'h43) ? (8'ha0) : (8'hac)), (-(8'hbc))}) * {({(8'hb0), (8'hbb)} * ((8'hb0) ? (8'ha9) : (8'ha9))), (~&((8'hb6) ? (8'ha9) : (8'ha5)))})})
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire117;
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire13,
                 wire14,
                 wire64,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire117,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 (1'h0)};
  assign wire13 = ((!((((8'hba) * wire10) && ((7'h44) ? wire10 : wire9)) ?
                      ($signed(wire12) ?
                          (wire12 ?
                              (8'hbc) : wire10) : wire12[(3'h4):(2'h3)]) : wire10)) & ($signed($signed($unsigned(wire11))) ?
                      wire10 : ((~&(+wire9)) >= (|(wire10 >>> wire10)))));
  assign wire14 = wire12;
  module15 #() modinst65 (wire64, clk, wire13, wire11, wire10, wire12);
  assign wire66 = ((wire11[(2'h2):(1'h1)] | (^(wire14[(4'hb):(3'h4)] ?
                      (wire64 ?
                          wire14 : wire64) : (wire64 <= wire11)))) == $signed($signed(wire14)));
  assign wire67 = (wire14[(3'h7):(3'h6)] ?
                      $unsigned((~&$unsigned((8'hb1)))) : $signed((!wire9[(1'h1):(1'h1)])));
  assign wire68 = $signed(wire64[(2'h2):(1'h0)]);
  assign wire69 = $signed(($unsigned(wire12) >> wire66[(2'h3):(1'h0)]));
  assign wire70 = wire13[(2'h3):(1'h0)];
  assign wire71 = (~wire13[(2'h3):(2'h2)]);
  assign wire72 = $unsigned(((!($signed(wire66) ?
                      (|wire11) : ((8'hbc) ?
                          wire10 : wire10))) ^~ (-$unsigned((7'h43)))));
  assign wire73 = ((-wire67) ^ ((~&{wire9, $signed(wire66)}) ?
                      $signed((^~$signed(wire70))) : wire10[(2'h2):(2'h2)]));
  assign wire74 = {$unsigned((^~($signed(wire12) ? {wire64} : (~&(7'h41)))))};
  always
    @(posedge clk) begin
      reg75 <= (&wire72[(2'h3):(2'h3)]);
      if ((~^wire74[(4'ha):(2'h3)]))
        begin
          reg76 <= $unsigned((~((8'hae) ~^ wire71[(4'h9):(1'h0)])));
          reg77 <= $unsigned((~&wire69));
          reg78 <= reg76[(3'h5):(3'h4)];
          reg79 <= (+wire73);
          reg80 <= $unsigned(wire68);
        end
      else
        begin
          reg76 <= wire67[(2'h3):(1'h0)];
          reg77 <= $unsigned((+wire14[(2'h2):(2'h2)]));
        end
      if (reg75)
        begin
          reg81 <= reg78[(1'h0):(1'h0)];
          if ($signed($unsigned($signed((wire67 | (wire67 ?
              wire14 : (8'hba)))))))
            begin
              reg82 <= (wire9 ?
                  (reg80[(3'h4):(3'h4)] & wire10) : $unsigned(({(-reg75),
                      (|wire68)} < $unsigned($unsigned(wire70)))));
              reg83 <= wire9;
              reg84 <= (((((wire72 ? wire69 : (8'hbc)) >= reg81) ?
                      $unsigned($signed(reg82)) : $unsigned({reg79})) == $unsigned(wire68)) ?
                  ({(&$unsigned(wire71))} >> {wire13}) : $unsigned(reg80[(3'h5):(1'h1)]));
            end
          else
            begin
              reg82 <= $signed(({((|wire72) >> reg75[(4'hc):(3'h4)]),
                  ({wire71,
                      wire13} | (wire14 >> wire9))} & wire67[(4'he):(3'h5)]));
              reg83 <= (wire67[(4'h8):(4'h8)] >= ((|$signed($unsigned(reg83))) ?
                  ($unsigned((reg83 ? wire9 : reg82)) ?
                      (wire14[(3'h4):(3'h4)] ?
                          (!(8'hb6)) : $unsigned((7'h43))) : ($signed(reg81) && wire70)) : wire72));
              reg84 <= ((8'ha9) | wire67[(1'h1):(1'h0)]);
              reg85 <= ($signed(wire74[(4'h8):(4'h8)]) >= {((!(wire64 || wire10)) ^ ($signed(wire74) == {wire11})),
                  wire64[(4'he):(4'hd)]});
              reg86 <= $unsigned(reg85[(4'he):(1'h0)]);
            end
          reg87 <= ($unsigned(($unsigned(wire10) ?
              $unsigned(wire66[(2'h3):(1'h0)]) : $signed((~^(8'hae))))) || ((wire10[(4'h8):(3'h5)] + $signed($unsigned(wire66))) & $signed(($unsigned(wire10) > $unsigned((8'h9e))))));
          reg88 <= (+reg80[(1'h1):(1'h0)]);
        end
      else
        begin
          if ($unsigned((&$unsigned({$unsigned(wire13), $signed(reg84)}))))
            begin
              reg81 <= {($signed($unsigned((reg79 ? wire67 : reg88))) ?
                      (+wire74) : wire12)};
            end
          else
            begin
              reg81 <= ((wire66[(1'h1):(1'h1)] ?
                  (~|(&$unsigned(wire66))) : ((-(~|wire14)) <= ((wire67 ?
                      (8'ha0) : reg78) && ((8'hba) >>> (8'had))))) ~^ (&reg76));
              reg82 <= $signed($signed(((!(~|wire72)) ?
                  $signed((+reg84)) : reg88)));
              reg83 <= $unsigned((((-(wire14 ?
                      (8'ha9) : wire67)) & $signed({reg75, reg77})) ?
                  reg84 : (((wire68 ? wire73 : reg77) ?
                          (reg84 + (8'ha9)) : wire70) ?
                      $unsigned($signed(reg88)) : {(reg88 + reg81),
                          (reg81 * (7'h41))})));
              reg84 <= reg88[(4'ha):(3'h6)];
              reg85 <= (!{$unsigned(reg81[(4'ha):(3'h5)]), reg88});
            end
          reg86 <= {$signed(((+(+wire69)) ~^ ((^~reg82) > ((8'hab) ?
                  wire70 : wire74))))};
          reg87 <= {wire14, $unsigned(wire67[(1'h0):(1'h0)])};
          reg88 <= $unsigned(((wire74 ?
              $signed(reg79) : wire11[(3'h5):(3'h5)]) <<< ({(+wire73)} ?
              reg88 : reg76)));
          reg89 <= $signed({$unsigned(reg86)});
        end
    end
  assign wire90 = $signed(wire13[(4'h9):(4'h8)]);
  assign wire91 = ($signed((&$signed((wire67 * (8'had))))) & (((~&(wire90 ?
                          wire66 : (8'haf))) ?
                      ($signed(wire64) ?
                          (-reg81) : {reg89}) : ($signed(wire10) > reg78[(4'h9):(3'h7)])) - wire90));
  assign wire92 = ($signed(wire64[(4'he):(2'h2)]) >> wire9);
  assign wire93 = $signed(reg89[(3'h4):(1'h0)]);
  assign wire94 = wire74[(4'h8):(3'h4)];
  assign wire95 = {(($signed(wire11[(4'hf):(4'ha)]) != $unsigned(wire64[(4'he):(4'hc)])) <= $unsigned(reg83[(3'h7):(1'h1)]))};
  module96 #() modinst118 (wire117, clk, wire90, wire70, reg78, wire10);
  assign wire119 = wire69[(2'h3):(2'h2)];
  assign wire120 = $signed($signed((~^reg89)));
  assign wire121 = $unsigned({($signed($signed((8'ha4))) * (~&reg86)),
                       $signed($signed(reg85))});
endmodule

module module96
#(parameter param116 = (((((~|(8'hbe)) ? ((8'h9c) & (7'h42)) : {(8'hbf)}) ? (-{(8'hac)}) : (((8'ha2) ? (8'h9f) : (8'hb8)) ? ((8'ha0) ^ (8'ha4)) : ((8'hbb) ? (8'hb9) : (8'hb1)))) ? (~(|(^(8'hbd)))) : (~|(((8'ha0) ? (8'ha1) : (8'hae)) ? ((8'ha9) ? (8'ha0) : (8'hae)) : ((8'hbb) != (8'hbb))))) ? (((((8'ha4) ^~ (7'h40)) | ((8'hb9) || (7'h44))) ? ({(7'h43)} >= {(8'hb8), (8'hb4)}) : (((8'hbf) - (8'ha5)) ? ((8'ha9) ~^ (8'hba)) : (^~(8'ha6)))) <<< ((8'h9d) ? {(~(8'ha8)), ((8'ha7) != (8'ha2))} : (-{(8'h9d)}))) : {{((8'haa) ? ((8'h9c) | (8'h9c)) : ((8'h9e) ~^ (8'hb8))), (~&((8'hb3) ? (8'h9c) : (8'hb4)))}}))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire100;
  input wire signed [(5'h15):(1'h0)] wire99;
  input wire signed [(5'h13):(1'h0)] wire98;
  input wire signed [(4'hb):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire101 = ((!({{wire97, wire100}} * ((wire98 ? wire98 : wire100) ?
                       ((7'h41) ? (8'hbd) : (8'ha4)) : (wire97 ?
                           wire99 : wire100)))) >>> (((8'hab) && ($unsigned(wire98) ?
                       (~^(8'ha5)) : $signed(wire100))) < (|(!$unsigned(wire98)))));
  assign wire102 = $unsigned((-(!($unsigned(wire97) ? wire99 : wire99))));
  assign wire103 = (wire97[(4'h9):(2'h3)] & $signed(($signed($signed((8'hbd))) ?
                       $unsigned((|wire99)) : (~&wire97[(4'ha):(3'h5)]))));
  assign wire104 = $signed({(($signed(wire98) ?
                           wire100 : wire103) && wire98[(1'h0):(1'h0)])});
  assign wire105 = $signed((~(|$unsigned(wire102))));
  assign wire106 = $signed((7'h44));
  assign wire107 = (8'hb7);
  assign wire108 = {wire107[(1'h1):(1'h0)], {wire103}};
  assign wire109 = wire106[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg110 <= wire104;
      reg111 <= wire102[(2'h3):(1'h1)];
      reg112 <= (~|(wire108 != (!$signed((wire105 << reg111)))));
    end
  assign wire113 = $signed($unsigned(wire99[(5'h10):(1'h0)]));
  assign wire114 = $signed($signed(wire97));
  assign wire115 = wire101;
endmodule

module module15
#(parameter param63 = ((8'ha3) ? ({(((8'ha6) & (8'hba)) < (+(8'ha8)))} & (8'h9c)) : (8'had)))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 (1'h0)};
  assign wire20 = (|(|(wire17 ? wire19 : wire16)));
  assign wire21 = wire16;
  assign wire22 = {$unsigned(($signed(wire16) ~^ ((~&wire20) >= (wire16 | wire20)))),
                      wire21[(4'hd):(1'h0)]};
  assign wire23 = ((~&wire16) >> ((!wire17[(3'h4):(3'h4)]) > ($unsigned($unsigned(wire20)) | wire19)));
  assign wire24 = ($unsigned((^$unsigned((wire21 ?
                      (8'h9c) : wire23)))) > ((^$signed($unsigned(wire20))) || $unsigned((((8'ha6) ?
                      wire17 : (8'hac)) >> (wire19 <= wire23)))));
  assign wire25 = wire18;
  always
    @(posedge clk) begin
      if ((^(wire24 ? $unsigned($signed((~&wire18))) : (&(8'ha5)))))
        begin
          if ($signed($unsigned($unsigned((wire17 <= (wire16 - wire22))))))
            begin
              reg26 <= $unsigned(wire16);
              reg27 <= (wire24 ^~ wire19);
              reg28 <= wire17[(1'h1):(1'h1)];
            end
          else
            begin
              reg26 <= $signed($unsigned(reg27));
              reg27 <= wire25[(4'h9):(1'h0)];
              reg28 <= (8'hae);
            end
          reg29 <= $signed(($unsigned(reg28) ?
              $unsigned(((reg26 ? (8'ha6) : reg26) ?
                  (reg28 ?
                      wire21 : wire23) : (8'ha5))) : (wire16[(3'h6):(2'h2)] ?
                  wire24[(2'h3):(1'h0)] : wire18)));
          reg30 <= wire20[(3'h5):(1'h0)];
          if (((^~wire17) << $signed({(~&{wire24})})))
            begin
              reg31 <= (wire21 ? wire19 : wire23);
              reg32 <= (&$signed($unsigned(wire16)));
              reg33 <= {$unsigned($unsigned(wire23)), wire20[(3'h5):(2'h3)]};
              reg34 <= $unsigned($unsigned(reg28[(4'hb):(2'h2)]));
              reg35 <= (reg31 ?
                  {(reg27[(3'h5):(3'h4)] * ($unsigned(wire18) ?
                          (wire19 >>> (8'hb7)) : {wire16}))} : wire18);
            end
          else
            begin
              reg31 <= reg35[(3'h5):(2'h3)];
              reg32 <= (^~((~^(wire23[(4'hb):(2'h3)] ?
                  (-wire18) : $signed(reg32))) < ($signed($unsigned((7'h41))) <<< (~|(&(8'haf))))));
            end
        end
      else
        begin
          if ((&{(((reg28 ? wire22 : reg32) & $unsigned(wire23)) ?
                  wire17 : wire24)}))
            begin
              reg26 <= reg32;
              reg27 <= $signed($signed((^~$signed(wire18[(3'h5):(2'h2)]))));
              reg28 <= wire19;
              reg29 <= reg29[(2'h3):(1'h0)];
            end
          else
            begin
              reg26 <= $signed(wire23[(4'h8):(2'h2)]);
              reg27 <= $signed($signed((-((~&reg32) >> (!reg26)))));
              reg28 <= (~&{reg30[(2'h2):(1'h1)]});
              reg29 <= wire18;
            end
        end
      reg36 <= $signed(wire23);
      reg37 <= wire24;
      reg38 <= wire19;
      reg39 <= (~^(wire22 ?
          (reg37[(4'hc):(3'h5)] ?
              $signed((~reg33)) : $unsigned($signed(reg28))) : {($unsigned(reg35) << $unsigned(reg35))}));
    end
  assign wire40 = (-{(8'ha8), wire20[(3'h6):(1'h0)]});
  assign wire41 = wire21[(5'h12):(1'h1)];
  assign wire42 = $unsigned((8'had));
  assign wire43 = (&$signed((8'ha9)));
  assign wire44 = {{(((~|wire41) ^ (+reg28)) ?
                              $unsigned(reg38[(2'h2):(1'h1)]) : (reg38 ?
                                  reg28 : reg28[(4'hf):(3'h6)])),
                          reg26[(3'h5):(1'h1)]},
                      reg30[(4'hf):(4'hf)]};
  assign wire45 = reg30;
  assign wire46 = $signed(((((wire25 & wire20) ^ wire41[(1'h0):(1'h0)]) ?
                      reg30 : ({reg32, wire40} ?
                          {wire18} : (&wire21))) <= {((wire44 < reg31) ?
                          wire40[(2'h2):(1'h1)] : wire20),
                      $signed(wire44[(4'hb):(2'h2)])}));
  always
    @(posedge clk) begin
      reg47 <= (8'hb7);
      reg48 <= (reg47[(3'h5):(3'h5)] | $unsigned($unsigned(wire45[(2'h2):(1'h0)])));
      if (wire21[(5'h10):(1'h1)])
        begin
          reg49 <= ($unsigned((($signed(reg33) ? $unsigned(reg29) : {reg39}) ?
                  ($signed(reg26) <= wire45[(3'h7):(1'h0)]) : reg32)) ?
              (reg33 ?
                  (($unsigned((7'h42)) == $signed(wire42)) && (|(^~wire20))) : $signed($unsigned((wire21 <<< reg32)))) : reg36);
          reg50 <= wire44;
        end
      else
        begin
          reg49 <= $unsigned((&((reg33 ?
              (reg31 ^ wire44) : reg38) <<< $unsigned({wire16}))));
          reg50 <= reg34;
        end
      if (((|($unsigned((wire22 && wire24)) << (~&(wire17 && reg49)))) ?
          $signed((&wire19[(2'h2):(2'h2)])) : $unsigned($unsigned(reg36[(2'h3):(2'h3)]))))
        begin
          reg51 <= reg28;
          reg52 <= reg29[(2'h3):(2'h2)];
          if (({(~&$unsigned((^~(8'hab)))), $unsigned(reg50)} <<< {reg35,
              reg35[(4'ha):(1'h1)]}))
            begin
              reg53 <= reg35[(4'hf):(4'hd)];
              reg54 <= (^~(~&(({wire16, (8'hbc)} >>> (reg32 == reg26)) ?
                  $signed((-reg27)) : reg32)));
            end
          else
            begin
              reg53 <= reg47;
              reg54 <= reg36[(4'hf):(2'h3)];
              reg55 <= $unsigned($unsigned((|(reg38 ?
                  (reg47 ? wire17 : (8'hbc)) : $unsigned(reg50)))));
              reg56 <= reg39[(4'h8):(3'h6)];
            end
        end
      else
        begin
          reg51 <= {(+(~^((wire41 << reg35) != (wire19 + (8'hac))))),
              (reg37[(4'hf):(4'hb)] * (reg37 ?
                  {(reg30 << reg49), reg27} : ($signed(reg30) ?
                      reg36 : (reg38 ? reg39 : reg51))))};
        end
      reg57 <= reg54;
    end
  assign wire58 = (wire43 ?
                      wire43 : (reg49[(2'h3):(1'h0)] ?
                          (~^(-(!reg31))) : (reg48 + wire45[(2'h2):(1'h1)])));
  assign wire59 = wire22[(4'hb):(4'h9)];
  assign wire60 = (-$signed($unsigned($unsigned((-wire23)))));
  assign wire61 = $signed($unsigned($unsigned(wire25)));
  assign wire62 = $signed((reg36 * wire43));
endmodule

module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire151,
                 wire141,
                 wire139,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire3[(3'h4):(1'h0)];
  assign wire5 = ((~|wire0[(3'h4):(3'h4)]) >>> wire4[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg6 <= wire1;
      reg7 <= wire5[(2'h2):(2'h2)];
    end
  assign wire8 = (((!reg7) * (+$signed((8'hbf)))) << wire5);
  assign wire9 = ({$signed($signed($signed(wire5)))} > ($signed($signed((wire0 ?
                     reg7 : wire3))) - reg7));
  assign wire10 = ((^$unsigned(reg6[(1'h1):(1'h1)])) >>> $unsigned($signed($signed(wire2[(3'h6):(3'h6)]))));
  module11 #() modinst140 (wire139, clk, wire0, wire4, wire5, wire2);
  assign wire141 = $signed($signed($signed({(&wire10)})));
  always
    @(posedge clk) begin
      reg142 <= wire9[(4'hc):(1'h0)];
      if ((~^(~(^($unsigned(wire2) + (8'hb2))))))
        begin
          reg143 <= $unsigned((reg6[(3'h4):(2'h2)] ?
              $unsigned(reg6[(2'h3):(2'h2)]) : ((^~$unsigned(wire141)) ?
                  (reg142 ? (~&wire2) : (wire2 | wire8)) : ((|wire3) ?
                      (^(8'hb0)) : $unsigned(reg6)))));
          reg144 <= (!$signed($unsigned($signed(reg143[(4'h8):(1'h1)]))));
        end
      else
        begin
          reg143 <= $unsigned(wire1[(3'h7):(1'h0)]);
          if ($unsigned(reg142))
            begin
              reg144 <= (((~&(~|((8'hae) ^~ wire141))) ?
                  (reg142 < ((~&wire2) ^ wire141[(1'h0):(1'h0)])) : (~((reg144 ?
                          wire2 : (8'hba)) ?
                      ((8'ha3) ^ wire3) : (~|(8'ha4))))) * $unsigned((|($unsigned(reg142) ?
                  (wire5 ? reg142 : (8'h9e)) : {wire3, wire5}))));
              reg145 <= wire1;
              reg146 <= $signed({(!wire5[(4'hd):(2'h2)])});
              reg147 <= wire4;
              reg148 <= $unsigned((8'ha1));
            end
          else
            begin
              reg144 <= wire3;
              reg145 <= (~|(8'ha6));
              reg146 <= (($unsigned((~^(^wire2))) ?
                  ((-$signed(wire3)) <= $signed((7'h41))) : (8'hba)) + $unsigned((&((wire5 == (8'h9f)) ?
                  (reg145 + (8'h9c)) : (wire5 ? reg148 : wire8)))));
              reg147 <= (wire141[(1'h1):(1'h0)] ?
                  ({((^~(7'h41)) << (wire9 ?
                          wire2 : (8'ha9)))} | reg148[(4'h8):(3'h4)]) : (($signed($signed(wire9)) >> {(~|reg145),
                      $signed(wire8)}) ^~ wire2));
              reg148 <= wire1[(2'h3):(2'h3)];
            end
          reg149 <= reg146[(2'h3):(2'h3)];
          reg150 <= (^~(+{wire3}));
        end
    end
  assign wire151 = $unsigned($signed(((~(~&wire2)) & $unsigned(wire139))));
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire136;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire127;
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire68,
                 wire45,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire70,
                 wire127,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg43,
                 reg44,
                 (1'h0)};
  assign wire16 = (~^$unsigned(wire12[(4'h9):(1'h0)]));
  assign wire17 = ($unsigned({$unsigned(wire16[(2'h2):(1'h1)]), wire15}) ?
                      (!$unsigned($unsigned(wire12))) : {wire15});
  assign wire18 = (^$signed((&$unsigned($signed(wire17)))));
  assign wire19 = ((wire15[(2'h2):(2'h2)] ?
                      ($signed(wire15) ?
                          ($unsigned(wire12) * $signed(wire15)) : ($signed(wire16) ?
                              (~wire17) : $unsigned(wire16))) : ({(wire13 << wire16)} * wire15)) - (&(((8'hbe) >= wire18) * (^~$unsigned(wire13)))));
  assign wire20 = wire17;
  assign wire21 = $signed($signed(({wire13, $unsigned(wire18)} ?
                      wire15 : ($signed(wire13) >>> (|wire20)))));
  always
    @(posedge clk) begin
      reg22 <= $signed(wire18[(1'h1):(1'h0)]);
      reg23 <= wire13;
      if (wire16)
        begin
          reg24 <= $signed($unsigned(wire15[(3'h5):(2'h3)]));
          reg25 <= (($unsigned(((wire14 + wire21) ?
              wire14[(5'h11):(4'h8)] : (reg23 && wire18))) | $signed(((wire18 ?
              reg22 : wire14) && $unsigned(reg23)))) * ((-((reg22 <= wire18) ?
              $unsigned(wire21) : reg23[(2'h3):(2'h3)])) + $unsigned(wire20[(1'h0):(1'h0)])));
          if ({(wire16[(4'ha):(4'h8)] ?
                  ({{wire13, (8'hba)}, (wire19 ? wire12 : wire14)} ?
                      {(wire14 ^~ (8'haf)),
                          (reg23 && wire21)} : (!$unsigned(wire21))) : ((((8'hab) ?
                      reg22 : wire17) * $unsigned(reg22)) ^~ $signed({wire16,
                      wire20}))),
              ((wire14[(4'hc):(1'h0)] ? reg23 : $signed((^~wire20))) ?
                  $unsigned((^~$signed(wire21))) : reg25[(3'h5):(3'h5)])})
            begin
              reg26 <= ((&$unsigned($unsigned((!wire13)))) ?
                  $signed({wire18,
                      (|{reg22,
                          wire16})}) : $unsigned((|$unsigned(wire20[(3'h6):(2'h2)]))));
              reg27 <= ($signed(wire18) != ($unsigned(wire12) ?
                  {reg24} : ($signed($signed(wire18)) >> wire21)));
              reg28 <= $signed({{($signed(reg26) == {(8'hb9)}), wire12},
                  ($signed((reg23 && reg26)) ?
                      (8'had) : (wire13 ?
                          $unsigned(reg23) : {wire20, (8'ha3)}))});
              reg29 <= $unsigned((wire12[(4'ha):(3'h4)] ~^ wire16));
              reg30 <= (-$signed(wire14));
            end
          else
            begin
              reg26 <= (reg23 ?
                  ($unsigned($signed($signed(wire13))) + reg28[(2'h3):(2'h3)]) : reg30);
              reg27 <= ((((wire17 ?
                      (reg28 >= wire15) : ((8'h9c) ?
                          wire16 : (8'hbb))) >>> $signed(reg25)) << wire16) ?
                  ((&reg24) ?
                      $unsigned((|(wire12 * reg24))) : $signed(wire15[(3'h5):(1'h1)])) : ((!wire15) ?
                      $unsigned(reg23) : ($unsigned(wire12[(2'h3):(2'h2)]) ?
                          $signed($signed(reg23)) : wire13)));
            end
        end
      else
        begin
          if (((-(((+wire19) ?
                      (wire20 >= (8'hb6)) : (reg26 ? wire13 : wire17)) ?
                  {(+(8'ha1)), (reg29 ^~ reg23)} : (wire17 == (8'ha1)))) ?
              (($signed($unsigned(wire14)) && {$signed(reg23)}) ?
                  (^(wire16 ?
                      reg22[(1'h1):(1'h1)] : (wire13 ?
                          reg22 : (8'ha1)))) : $unsigned($signed($unsigned(reg28)))) : reg26))
            begin
              reg24 <= reg25;
              reg25 <= $unsigned((^$unsigned(wire20)));
              reg26 <= reg27;
              reg27 <= ($signed(((reg27[(1'h1):(1'h0)] && (wire19 ?
                  wire13 : wire12)) <<< reg26[(3'h4):(1'h1)])) ^~ ((reg27[(3'h5):(1'h1)] ^~ (wire19[(4'he):(4'h8)] ?
                  $signed(reg30) : $unsigned(wire12))) + (-(reg28 ^ $signed((8'h9d))))));
            end
          else
            begin
              reg24 <= (-$unsigned($signed($unsigned((~^wire18)))));
              reg25 <= ((wire14 ?
                  wire21 : (~|($signed(wire18) | {reg22,
                      wire19}))) <= $unsigned(reg26[(3'h4):(2'h2)]));
            end
          if (((((((8'hb2) ? wire19 : (8'hb4)) ?
                  $unsigned((7'h43)) : wire18) & wire20) ~^ wire15) ?
              (^~(+($signed(wire19) & (wire13 << (8'haa))))) : wire19[(3'h4):(3'h4)]))
            begin
              reg28 <= wire17;
              reg29 <= $signed($signed(reg26));
              reg30 <= $signed((-(+(~wire20[(3'h5):(3'h4)]))));
            end
          else
            begin
              reg28 <= wire15[(1'h0):(1'h0)];
              reg29 <= (reg27 ? $signed(reg22) : reg30);
              reg30 <= reg25;
              reg31 <= reg22[(2'h2):(1'h0)];
              reg32 <= {$unsigned($signed($signed($signed(wire20)))), reg23};
            end
        end
      if ((^~({reg22[(2'h2):(1'h0)], (|$signed(wire12))} ?
          (~$signed({reg29,
              reg29})) : ($unsigned(reg26[(1'h0):(1'h0)]) || ((reg30 ?
              wire13 : wire12) || (8'ha4))))))
        begin
          reg33 <= $unsigned(((!$signed(wire18[(2'h3):(2'h3)])) ?
              reg27[(3'h6):(1'h0)] : ($unsigned((-reg22)) << (^$unsigned(wire21)))));
          reg34 <= ((~^wire17) != ({{$unsigned(reg25),
                  (wire19 * reg29)}} << $signed(wire12)));
        end
      else
        begin
          reg33 <= {wire12[(4'h9):(1'h1)]};
          if ((reg31 >>> (wire15[(4'hb):(2'h2)] ?
              (reg29[(1'h1):(1'h0)] ?
                  (8'ha7) : (~&(^~(8'hb9)))) : (((~^reg26) & (|reg23)) ^~ $signed(reg26[(1'h1):(1'h1)])))))
            begin
              reg34 <= $signed(wire17[(2'h3):(2'h2)]);
            end
          else
            begin
              reg34 <= ((^~(8'hac)) <<< ((($signed(reg22) ^ $unsigned(reg24)) << reg34) ?
                  $unsigned(wire21[(3'h6):(2'h3)]) : (8'hac)));
              reg35 <= reg30[(4'h9):(1'h0)];
            end
          reg36 <= (!$unsigned(($unsigned((~|reg29)) ?
              reg26[(1'h0):(1'h0)] : (&(reg35 ? reg25 : reg27)))));
        end
      if ((7'h41))
        begin
          reg37 <= (8'hab);
          if ((8'hb4))
            begin
              reg38 <= $signed(($signed((~{reg26, reg30})) ?
                  $signed(((^~(8'hab)) + reg32)) : {reg22}));
              reg39 <= $signed(reg33);
            end
          else
            begin
              reg38 <= {$signed(wire21), {(wire17 + $signed($signed(reg23)))}};
              reg39 <= reg31[(4'ha):(3'h6)];
            end
          reg40 <= reg34;
          reg41 <= {(~reg29[(3'h4):(1'h0)])};
          if ($unsigned($unsigned((((~^reg26) >= (+wire17)) ?
              $signed((^~wire12)) : {(reg33 ? wire13 : reg32),
                  (reg26 || (8'hb6))}))))
            begin
              reg42 <= ((-{(~&wire14)}) ?
                  $signed($signed(reg32[(3'h5):(1'h1)])) : reg26);
              reg43 <= $unsigned((^~($unsigned(reg23) < {(8'hae),
                  wire20[(1'h0):(1'h0)]})));
              reg44 <= (reg34[(4'hd):(3'h4)] | (wire19 << reg34));
            end
          else
            begin
              reg42 <= ($signed($unsigned({{(7'h44),
                      wire16}})) << $signed((^$unsigned((8'haa)))));
              reg43 <= (($unsigned($unsigned((^reg26))) | (reg24 >>> ({wire17,
                  (8'hbf)} << reg36))) << reg28[(4'hf):(4'hb)]);
              reg44 <= reg32[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg37 <= ($unsigned({(^reg23[(2'h3):(1'h1)])}) ?
              wire21[(2'h3):(2'h2)] : ((-(reg24 >> (reg35 ? (8'ha8) : reg32))) ?
                  (reg35[(4'ha):(4'h8)] == $unsigned((reg31 >>> reg41))) : $unsigned(((reg26 ?
                          (7'h41) : (8'hba)) ?
                      (reg30 ? reg37 : wire21) : (reg44 ? wire12 : (8'h9c))))));
          reg38 <= (~wire20);
          reg39 <= ($unsigned($unsigned(wire20[(1'h0):(1'h0)])) ?
              ((~&((~&reg28) ? (|wire19) : (reg32 ? reg30 : wire16))) ?
                  {(!reg39),
                      $unsigned(reg23)} : (($unsigned(reg36) ^ (reg23 - wire20)) >= ((+reg32) || (!wire15)))) : $signed((((wire19 <<< (8'hab)) <= reg37[(2'h2):(1'h0)]) ?
                  reg25[(3'h4):(1'h1)] : $signed(reg29[(3'h4):(1'h0)]))));
          reg40 <= reg39[(2'h3):(2'h2)];
          reg41 <= wire18;
        end
    end
  assign wire45 = $signed($signed(reg41));
  module46 #() modinst69 (wire68, clk, reg28, reg41, wire17, reg34, reg26);
  assign wire70 = (&wire17);
  module71 #() modinst128 (wire127, clk, reg28, reg35, wire16, reg23);
  always
    @(posedge clk) begin
      if ((8'ha1))
        begin
          reg129 <= reg37[(2'h2):(1'h0)];
          reg130 <= (({((reg33 > reg25) ^ reg33),
                  ((reg27 ? wire68 : reg34) && (reg44 ?
                      wire127 : reg25))} << (({wire45, wire45} && {(8'hb9)}) ?
                  $signed($signed(reg29)) : (7'h42))) ?
              (~^($unsigned((wire20 + reg35)) ?
                  (-wire45) : (~^(wire15 ? reg33 : (8'ha7))))) : reg43);
        end
      else
        begin
          if (((^{$signed((reg42 == (8'hb3)))}) - $unsigned((^~(~&(+wire127))))))
            begin
              reg129 <= $signed(reg34);
              reg130 <= $signed(reg25);
              reg131 <= reg33;
            end
          else
            begin
              reg129 <= (+reg130);
              reg130 <= $signed({(8'hab),
                  ({{reg33}} ?
                      (reg34[(5'h13):(1'h0)] ?
                          reg22 : $unsigned(reg24)) : ({reg28} ?
                          reg37 : $signed(reg24)))});
              reg131 <= wire14[(4'hb):(4'h9)];
              reg132 <= {({$signed((wire127 & wire21)), $unsigned(reg33)} ?
                      (^wire20[(1'h1):(1'h1)]) : $unsigned({$signed((8'hb9))}))};
            end
        end
      reg133 <= $signed(((|(reg23 <<< reg25[(1'h1):(1'h1)])) ?
          ($unsigned((reg29 ^ reg36)) ?
              {reg27[(2'h2):(2'h2)], $signed(wire70)} : ((8'ha5) ?
                  {reg131,
                      reg130} : wire17[(1'h1):(1'h0)])) : (reg42[(4'hb):(4'h9)] <<< $signed(wire12))));
    end
  assign wire134 = $signed({(|(7'h42)), {reg37[(2'h2):(2'h2)]}});
  assign wire135 = $unsigned({$unsigned($signed($unsigned((8'hbf)))),
                       reg130[(4'h8):(2'h3)]});
  assign wire136 = (~&$unsigned((&reg42)));
  assign wire137 = (!(($signed({reg41}) ?
                       (|(~wire18)) : (&(reg131 != reg28))) <<< reg43[(1'h0):(1'h0)]));
  assign wire138 = $unsigned((^~$unsigned(($signed((8'hbe)) == $signed(wire136)))));
endmodule

module module71
#(parameter param126 = (~^((((^~(8'h9d)) ? (^~(8'ha3)) : (&(8'hb8))) ? (((8'hb3) ? (8'ha8) : (8'hbc)) && ((8'ha6) & (8'hba))) : (^~{(8'ha7)})) ? {(|{(8'ha6), (8'hb7)}), ((^~(8'ha9)) ? ((8'hb5) <= (8'hb0)) : {(8'ha0)})} : ((!(8'hb9)) ? ((~&(8'h9c)) <= ((8'h9e) ^ (8'had))) : (|(8'hac))))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire75;
  input wire signed [(3'h5):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire73;
  input wire signed [(3'h7):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire76;
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire78,
                 wire76,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg81,
                 reg80,
                 reg79,
                 reg77,
                 (1'h0)};
  assign wire76 = {($signed((!(~^wire74))) ?
                          (8'hbb) : $unsigned(($signed(wire73) ?
                              wire73 : wire73))),
                      wire75[(3'h4):(2'h3)]};
  always
    @(posedge clk) begin
      reg77 <= $unsigned((+(!wire76)));
    end
  assign wire78 = $signed(((wire75 | wire74[(2'h3):(2'h2)]) ?
                      (wire74[(3'h4):(2'h2)] ?
                          $unsigned((^~(8'hba))) : (wire72 ?
                              (wire75 >> (7'h41)) : wire74[(3'h5):(1'h1)])) : (~$signed(wire73))));
  always
    @(posedge clk) begin
      reg79 <= {$unsigned(wire74[(1'h1):(1'h1)]), {reg77}};
      reg80 <= $signed(($unsigned((reg79[(1'h0):(1'h0)] & reg79)) ^~ {($unsigned(wire78) | ((7'h41) >>> wire78))}));
      reg81 <= (($unsigned(($signed((8'hab)) > $unsigned(reg80))) ^~ wire76) + reg79[(2'h2):(1'h0)]);
    end
  assign wire82 = {$unsigned((~{(reg81 >= wire73), ((8'ha9) << wire73)}))};
  assign wire83 = (wire73[(3'h5):(1'h0)] <= (~$signed(((reg81 ?
                      reg81 : wire78) * (reg80 >>> wire76)))));
  assign wire84 = $signed(reg80[(1'h0):(1'h0)]);
  assign wire85 = (({(wire73[(4'ha):(2'h3)] ?
                          $signed(reg79) : (wire72 ? reg80 : wire75)),
                      wire76[(1'h0):(1'h0)]} <= ((8'ha1) != reg79[(3'h5):(3'h4)])) >>> (((^~(8'hb0)) >> wire75) ?
                      wire84 : reg80));
  assign wire86 = $unsigned((($unsigned(wire83) ?
                      $unsigned((wire82 == wire76)) : (|(wire82 ?
                          wire75 : wire72))) && $signed(reg77[(1'h1):(1'h0)])));
  assign wire87 = reg80;
  assign wire88 = wire78;
  assign wire89 = $unsigned($unsigned(((^~$signed(wire84)) < wire86)));
  assign wire90 = ((~(7'h41)) ?
                      $signed((((~&wire84) <= $signed(wire75)) ?
                          ((8'ha7) <= $signed(wire89)) : wire86)) : reg80);
  always
    @(posedge clk) begin
      if ($unsigned(reg81[(3'h6):(2'h2)]))
        begin
          if (wire78[(1'h1):(1'h0)])
            begin
              reg91 <= ((^(((wire78 >>> wire85) > $signed(wire82)) != {(wire75 ^ wire82),
                  wire87})) & $unsigned({($unsigned((8'hbc)) != reg79)}));
              reg92 <= {$signed(wire85),
                  (wire86 ?
                      $unsigned(($signed(wire86) || (wire87 ^ wire76))) : wire90)};
            end
          else
            begin
              reg91 <= $signed(((wire72[(2'h2):(2'h2)] <= ({wire90} ~^ $unsigned(wire73))) * (~^wire86[(4'ha):(1'h1)])));
              reg92 <= wire72[(3'h4):(3'h4)];
              reg93 <= {$signed(reg79[(2'h2):(1'h0)]),
                  $unsigned((wire83 != $unsigned($signed(reg79))))};
              reg94 <= $signed((!(($signed(wire88) & $signed(wire90)) <= (((8'ha3) ?
                      wire90 : reg93) ?
                  (wire82 ? reg81 : wire83) : wire82[(3'h7):(1'h1)]))));
              reg95 <= (($unsigned((wire82 ^ $signed(reg94))) >= wire86[(4'hc):(3'h4)]) > ((!((^(8'ha8)) ?
                      reg77 : reg80[(4'h9):(2'h3)])) ?
                  wire86 : (~wire76[(2'h2):(2'h2)])));
            end
          reg96 <= (~&wire76);
          reg97 <= $signed(reg92);
          if (wire72)
            begin
              reg98 <= {reg79};
              reg99 <= (8'had);
              reg100 <= {wire73[(4'h9):(3'h4)]};
            end
          else
            begin
              reg98 <= ($signed($unsigned(reg100)) & reg98[(3'h7):(1'h1)]);
              reg99 <= wire72;
              reg100 <= (~|$unsigned(wire87));
              reg101 <= (~|(~&(~|{$unsigned(reg100), $unsigned(reg96)})));
              reg102 <= {wire72[(3'h7):(2'h3)],
                  $unsigned({((^~(7'h44)) ?
                          (reg95 ? reg96 : (7'h42)) : ((8'hb2) == wire83))})};
            end
        end
      else
        begin
          reg91 <= reg99[(2'h2):(1'h0)];
          reg92 <= ($unsigned((^~(wire88 ?
                  wire75[(1'h0):(1'h0)] : reg79[(3'h5):(2'h3)]))) ?
              {($unsigned(reg92[(3'h5):(1'h0)]) ?
                      reg81[(3'h4):(2'h2)] : $signed($unsigned(reg97)))} : reg93);
          reg93 <= (~^((reg95[(3'h6):(3'h6)] << wire78) ?
              ($signed(reg101) && ((wire83 ? (8'hba) : wire90) ?
                  $signed(reg100) : $unsigned(wire85))) : wire87));
        end
      reg103 <= $signed((reg91 > $signed((|reg99))));
      if ($unsigned($unsigned((~($signed((8'hbd)) ?
          $signed(wire82) : (+wire82))))))
        begin
          if (wire76)
            begin
              reg104 <= {($unsigned((~&(wire73 || wire89))) ?
                      (8'hac) : $unsigned(reg92[(4'h9):(3'h5)]))};
              reg105 <= $unsigned($signed((((wire88 ?
                  reg77 : reg101) + $signed((8'ha3))) > $unsigned($unsigned((8'had))))));
            end
          else
            begin
              reg104 <= {(8'ha4), $unsigned(wire83[(2'h3):(1'h0)])};
              reg105 <= {(8'ha3), wire75};
              reg106 <= $unsigned(((reg105 ?
                  ($signed(wire85) << {reg81,
                      reg80}) : reg81) || (~|wire90[(5'h12):(3'h6)])));
              reg107 <= wire73;
              reg108 <= ($signed($unsigned($signed(wire88[(3'h5):(2'h2)]))) | wire72[(2'h2):(1'h0)]);
            end
          if ($unsigned($signed($signed(wire83[(2'h3):(2'h3)]))))
            begin
              reg109 <= (((((reg98 ? reg93 : reg96) ?
                              $unsigned(reg97) : (~reg107)) ?
                          reg80[(4'h8):(4'h8)] : (&reg94)) ?
                      $signed(reg107) : (~reg95)) ?
                  (wire82 & reg79) : (8'ha4));
              reg110 <= (~&$signed(reg104[(4'hc):(2'h2)]));
              reg111 <= $signed({($signed({(8'hac)}) ?
                      reg77[(4'h9):(1'h0)] : $signed((~|reg99)))});
            end
          else
            begin
              reg109 <= reg80[(1'h1):(1'h0)];
              reg110 <= wire82[(4'h8):(3'h6)];
              reg111 <= $unsigned(reg99);
              reg112 <= (~&$unsigned($signed(reg96[(3'h6):(1'h1)])));
              reg113 <= (+reg99[(4'h9):(3'h4)]);
            end
          reg114 <= {$unsigned({(wire84[(3'h6):(3'h5)] ?
                      (wire72 && (8'ha4)) : $unsigned(wire73)),
                  ((reg96 ? wire88 : (8'hbd)) - {reg99})}),
              (reg103 & $unsigned($signed($signed(reg103))))};
        end
      else
        begin
          reg104 <= (!reg112);
        end
      reg115 <= $unsigned($unsigned({$unsigned($unsigned(reg102)),
          $signed(reg92)}));
      reg116 <= reg81;
    end
  assign wire117 = wire89;
  assign wire118 = ({$signed(((reg108 | wire74) ?
                           $signed(reg102) : (wire72 ?
                               reg109 : reg101)))} + (reg102[(1'h1):(1'h1)] ?
                       $unsigned(reg80) : ($signed(wire117[(1'h1):(1'h1)]) ?
                           $signed((-wire117)) : ((~&wire74) || (~|wire72)))));
  assign wire119 = (~$signed(reg92));
  assign wire120 = $signed(reg107[(1'h0):(1'h0)]);
  assign wire121 = wire75;
  assign wire122 = (!wire75[(4'hd):(4'hc)]);
  assign wire123 = wire89[(2'h3):(2'h2)];
  assign wire124 = ($unsigned($unsigned(($unsigned((8'hb9)) == (-wire75)))) ?
                       (+($unsigned((~|reg93)) ?
                           reg116[(1'h1):(1'h1)] : ((reg81 << reg98) >> {(8'ha4),
                               wire75}))) : reg116);
  assign wire125 = (reg112 ?
                       (^$signed(reg80[(1'h1):(1'h0)])) : {(~^$unsigned($signed((8'ha0))))});
endmodule

module module46
#(parameter param67 = (~^((((~(8'hab)) ? ((7'h43) ? (8'hbc) : (8'h9c)) : {(8'hbf)}) < ({(8'hb9), (8'hb2)} != {(8'hbf)})) & (({(8'h9f), (8'ha9)} ? ((8'ha1) * (8'hbc)) : ((8'h9d) ? (8'ha7) : (8'hae))) <= ({(7'h44)} && (~|(8'hbe)))))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire [(3'h7):(1'h0)] wire48;
  input wire [(4'ha):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire52 = $unsigned($unsigned(wire51));
  assign wire53 = wire47;
  assign wire54 = (~|(7'h43));
  assign wire55 = $signed(((wire50[(4'h8):(4'h8)] ?
                      $signed((wire53 ?
                          wire50 : wire48)) : (~{wire52})) * ((wire49 * (|wire50)) ?
                      ($unsigned(wire47) ?
                          (wire54 ~^ (8'ha3)) : (~&(8'hac))) : {(|(8'hb3)),
                          (~&(8'hac))})));
  always
    @(posedge clk) begin
      reg56 <= $unsigned($signed((8'hb4)));
      reg57 <= (wire50[(4'hb):(2'h2)] ~^ {{$signed(wire49)}});
      if ((^~((~$signed(wire48)) ^~ $signed($signed((reg56 ?
          wire47 : (8'hb1)))))))
        begin
          reg58 <= ((-{(wire50[(4'he):(1'h1)] != $unsigned(reg57)),
              $signed((reg56 ?
                  (8'haa) : wire50))}) >>> (+(~(wire50[(4'hd):(4'h8)] ^ wire55[(1'h0):(1'h0)]))));
          reg59 <= {$unsigned($signed((!$signed(wire50)))),
              {({{wire55, reg56}, (&wire55)} ~^ reg58[(5'h12):(4'hf)]),
                  $signed((~&$unsigned(wire49)))}};
          reg60 <= ($signed(($unsigned($signed(reg58)) ?
                  $unsigned((~(8'haa))) : (!(wire53 ? reg58 : (8'hb5))))) ?
              $signed(({$unsigned(reg58)} ~^ wire47)) : reg58[(4'ha):(3'h6)]);
        end
      else
        begin
          reg58 <= $signed($unsigned(wire52[(4'ha):(2'h3)]));
          reg59 <= $unsigned(reg58[(4'ha):(1'h1)]);
          reg60 <= $signed({(wire54 || {reg56, $signed((8'hb6))})});
          reg61 <= ((8'h9c) >>> (wire52 ^ $signed({(&wire53)})));
          reg62 <= ((({$unsigned(wire52),
              reg59} ^ wire55[(1'h0):(1'h0)]) < $signed($unsigned({wire47}))) >= wire47[(3'h7):(3'h5)]);
        end
      reg63 <= (~|(reg60[(4'h9):(3'h5)] << wire47));
      reg64 <= (&(~(~^$unsigned($unsigned(wire50)))));
    end
  assign wire65 = ((+reg61) && $unsigned($signed((7'h44))));
  assign wire66 = $unsigned(reg63);
endmodule

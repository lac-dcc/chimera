module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire106;
  assign y = {wire110, wire109, wire108, wire4, wire5, wire6, wire106, (1'h0)};
  assign wire4 = (+wire1[(1'h0):(1'h0)]);
  assign wire5 = ($signed($unsigned($unsigned((wire2 ?
                     wire2 : wire4)))) ^ (((8'ha8) >= ($unsigned(wire0) ?
                     wire1 : $unsigned(wire1))) < ((+(^wire4)) <= ((wire0 ?
                         wire1 : wire0) ?
                     (wire0 < (8'hbb)) : (wire4 ? (8'hab) : wire0)))));
  assign wire6 = wire5[(2'h2):(1'h0)];
  module7 #() modinst107 (.wire11(wire4), .wire10(wire3), .wire8(wire2), .wire12(wire5), .y(wire106), .wire9(wire0), .clk(clk));
  assign wire108 = $unsigned((~|{{(wire2 || wire106)}}));
  assign wire109 = (!(wire106 ?
                       (wire4[(4'h8):(3'h6)] >>> wire0[(4'hb):(2'h3)]) : $signed($unsigned((^~wire5)))));
  assign wire110 = ($unsigned($signed(($signed(wire106) ?
                       (wire109 << wire6) : {wire6, wire2}))) - (8'hbd));
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire101;
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire13,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire45,
                 wire46,
                 wire101,
                 reg14,
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
                 reg43,
                 reg44,
                 (1'h0)};
  assign wire13 = ($signed($signed({(&wire12)})) ?
                      wire10[(3'h5):(2'h3)] : (-wire12[(4'hc):(4'h8)]));
  always
    @(posedge clk) begin
      reg14 <= (8'hb7);
    end
  assign wire15 = $signed(wire12);
  assign wire16 = (^~$signed($signed((&(wire10 - (8'ha8))))));
  assign wire17 = (&$unsigned((($signed((8'haa)) > (~|wire16)) ?
                      $unsigned((wire11 ? wire12 : wire15)) : ($signed(wire9) ?
                          (wire15 ? reg14 : wire15) : (wire9 ?
                              (8'ha2) : reg14)))));
  assign wire18 = ((~&$unsigned(wire15)) ?
                      (&$signed($signed((^~(8'hb5))))) : reg14[(4'hf):(4'hb)]);
  assign wire19 = {{wire11[(4'hf):(4'hb)], wire11[(2'h3):(1'h0)]},
                      wire13[(2'h3):(2'h3)]};
  assign wire20 = wire8[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if ({(wire12 > $unsigned(({wire16} ? wire18 : $signed(wire10)))),
          wire8[(3'h6):(2'h2)]})
        begin
          reg21 <= ($signed({wire12[(4'he):(3'h5)]}) <= wire9[(2'h3):(1'h0)]);
          if ($signed($signed({(8'hbf), wire9})))
            begin
              reg22 <= (wire18 + wire18[(2'h2):(1'h1)]);
              reg23 <= $signed((~(((wire15 <<< wire15) && {wire20, reg21}) ?
                  ($unsigned(reg14) || wire20[(2'h3):(1'h1)]) : $signed(wire19[(3'h6):(3'h4)]))));
              reg24 <= $unsigned((wire19 << reg21));
              reg25 <= $signed($unsigned($signed((reg14 ? (8'ha8) : wire10))));
              reg26 <= $signed($unsigned(({wire16} ^ {$unsigned(wire19)})));
            end
          else
            begin
              reg22 <= wire19;
              reg23 <= (reg23[(1'h0):(1'h0)] ?
                  $signed((8'h9f)) : $unsigned(($unsigned(wire11[(4'hf):(1'h1)]) ?
                      $unsigned({reg14, wire17}) : wire16[(2'h2):(2'h2)])));
            end
        end
      else
        begin
          reg21 <= wire8;
          reg22 <= reg26;
          reg23 <= reg26[(1'h0):(1'h0)];
          reg24 <= $signed(reg24[(2'h3):(2'h2)]);
        end
      reg27 <= (~|$signed(((8'had) | ($unsigned(wire18) && (~wire13)))));
      reg28 <= ((wire10[(4'h8):(2'h3)] > ((8'ha6) >>> wire11)) ?
          wire9[(2'h3):(2'h2)] : reg27);
      if ((^reg28))
        begin
          reg29 <= $unsigned($unsigned($unsigned($signed((reg24 + wire17)))));
          reg30 <= wire12[(4'hb):(3'h5)];
          reg31 <= (+{$signed(wire16), reg14});
        end
      else
        begin
          if (((wire16[(1'h1):(1'h1)] ?
                  (($unsigned(wire10) ?
                      wire13[(2'h3):(1'h0)] : wire8[(3'h6):(2'h3)]) ~^ ($signed(wire10) ?
                      $unsigned((8'h9d)) : (~|wire16))) : ((reg27[(3'h7):(3'h4)] ?
                          $unsigned(wire12) : wire11[(4'hf):(3'h4)]) ?
                      reg22 : reg24[(2'h3):(1'h1)])) ?
              reg25[(3'h4):(2'h3)] : wire11[(2'h2):(2'h2)]))
            begin
              reg29 <= $unsigned((~(^~{((8'ha1) ? (8'ha6) : wire10)})));
              reg30 <= reg14;
              reg31 <= (reg27 ?
                  $unsigned($signed(reg23[(3'h4):(3'h4)])) : $signed(((reg22[(4'h8):(3'h6)] ?
                          $signed(reg26) : (~|wire11)) ?
                      wire8 : wire20[(4'ha):(4'h8)])));
              reg32 <= {($signed(((~&(8'hb0)) ?
                      $unsigned(reg29) : (reg23 ^~ wire11))) > (wire15 < reg29))};
            end
          else
            begin
              reg29 <= wire20[(4'h8):(4'h8)];
              reg30 <= wire18;
            end
          reg33 <= {{(8'ha6)},
              ((~|(~|$unsigned(reg30))) ?
                  {wire13} : ($unsigned($signed(wire12)) ?
                      reg22 : ((^reg29) == (~wire10))))};
          reg34 <= wire13[(2'h3):(2'h2)];
          reg35 <= (wire13 * wire15);
          reg36 <= (!(~reg30));
        end
      if ((|(^~reg30)))
        begin
          reg37 <= $signed($signed(wire16[(2'h3):(2'h3)]));
        end
      else
        begin
          reg37 <= (~(((reg32 ?
                  reg33 : {reg22, reg22}) >> $signed($signed(reg30))) ?
              (({(8'ha1), wire16} ? wire17 : $signed(reg23)) ?
                  ((wire20 <<< wire15) ?
                      reg24 : ((8'hbf) ?
                          wire13 : (8'haa))) : ((wire19 ~^ reg34) ?
                      wire12 : $unsigned(reg23))) : (^~$signed((reg23 != wire17)))));
          reg38 <= (!(!$signed(reg33)));
          if ($unsigned(($unsigned(($signed(reg29) == $signed((8'ha3)))) ?
              (reg23 <= reg24) : (reg31 ?
                  ((wire13 ?
                      (8'haf) : reg14) - (-reg32)) : reg37[(4'hc):(2'h2)]))))
            begin
              reg39 <= (&$unsigned($signed((reg38 != $signed(reg26)))));
            end
          else
            begin
              reg39 <= ($signed(reg22) ?
                  ($unsigned(reg31) ?
                      ($unsigned((reg25 || reg21)) * $unsigned($signed(wire19))) : (~&($signed((8'ha6)) && reg35))) : ($unsigned({reg22,
                          $unsigned(reg25)}) ?
                      $unsigned((reg30 | wire17)) : (wire12[(1'h1):(1'h1)] >= $signed((reg38 ?
                          reg37 : wire9)))));
              reg40 <= $signed(reg21);
              reg41 <= wire13[(2'h2):(2'h2)];
              reg42 <= $signed($unsigned((reg37[(3'h5):(3'h4)] ?
                  $unsigned(reg28) : reg27[(4'hb):(4'h9)])));
            end
          reg43 <= $unsigned(wire10);
          reg44 <= $signed((($signed($signed(wire12)) >= {$unsigned(wire17),
                  ((7'h40) + reg27)}) ?
              $unsigned((wire11[(3'h4):(1'h1)] ?
                  ((8'hb5) ? reg26 : wire8) : (~wire10))) : wire9));
        end
    end
  assign wire45 = ($unsigned(reg23[(4'hb):(3'h7)]) ?
                      (^~{($unsigned(reg33) ?
                              reg25[(3'h4):(2'h3)] : {reg29, reg35}),
                          reg34[(1'h0):(1'h0)]}) : ((&(~|$signed(wire19))) < (^~(^~$signed(reg33)))));
  assign wire46 = ((-((wire11[(3'h5):(3'h5)] && (+reg24)) ?
                      (|reg27[(4'hb):(4'ha)]) : $unsigned(wire11[(1'h1):(1'h0)]))) << reg43);
  module47 #() modinst102 (wire101, clk, reg34, wire17, reg30, reg44);
  assign wire103 = $unsigned(wire8[(3'h5):(1'h1)]);
  assign wire104 = ((&$signed((^((8'hb8) <<< (8'hb2))))) || wire103);
  assign wire105 = reg26[(2'h2):(1'h0)];
endmodule

module module47
#(parameter param100 = (&(8'hbe)))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  input wire [(4'h9):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire67,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire52 = ((~&$signed(wire48)) > {wire51[(4'h8):(2'h2)],
                      {$unsigned($unsigned(wire48))}});
  assign wire53 = $unsigned(($signed({(~|wire51), (wire50 ? wire50 : wire50)}) ?
                      wire49[(4'h8):(1'h1)] : ((&((8'ha1) ^ wire52)) ?
                          {(wire50 ?
                                  wire52 : wire50)} : $unsigned($signed(wire50)))));
  assign wire54 = $unsigned($unsigned($signed(($unsigned(wire51) ?
                      (8'had) : wire52[(1'h0):(1'h0)]))));
  assign wire55 = $signed($signed($signed(wire50[(1'h0):(1'h0)])));
  assign wire56 = $unsigned(wire49);
  assign wire57 = $unsigned(wire56[(4'hd):(4'hb)]);
  assign wire58 = $signed(wire57);
  assign wire59 = wire52[(4'ha):(2'h2)];
  assign wire60 = $unsigned(wire49[(2'h3):(2'h3)]);
  assign wire61 = (~((~(^wire57)) ? (~|wire48) : wire60));
  assign wire62 = ($unsigned($signed(wire58[(4'ha):(3'h6)])) ?
                      (($unsigned(wire48[(4'h9):(1'h1)]) ?
                              (wire50[(1'h1):(1'h0)] ?
                                  (!wire61) : (~&(8'ha7))) : $signed(wire54[(4'hc):(4'hc)])) ?
                          wire52[(3'h4):(2'h2)] : $unsigned($signed({wire55,
                              wire58}))) : wire54);
  assign wire63 = (($unsigned($unsigned((wire62 ?
                      wire53 : wire53))) >> wire57) || $unsigned(((wire60 ?
                          (wire57 ? wire58 : wire61) : {wire62}) ?
                      {(wire61 >>> wire57)} : (^wire55))));
  always
    @(posedge clk) begin
      reg64 <= (wire61[(1'h1):(1'h1)] ?
          wire50 : (!({{wire59}, {wire60, wire55}} ?
              $signed((wire57 ? wire57 : (8'hb8))) : wire59)));
      if (($unsigned((($unsigned(wire63) >> $signed(wire60)) || (~$signed(wire49)))) ?
          (8'hb5) : $unsigned((((wire63 > wire55) >> (-reg64)) ?
              (|(!wire48)) : $unsigned((wire55 ? wire63 : wire55))))))
        begin
          reg65 <= wire62[(2'h3):(1'h0)];
          reg66 <= (-$unsigned(((wire58[(4'h8):(3'h7)] ?
              (wire61 ?
                  (8'haa) : wire53) : wire63[(5'h12):(4'ha)]) * {$signed(wire60),
              wire61})));
        end
      else
        begin
          reg65 <= {$signed((wire53[(3'h7):(1'h1)] ? reg65 : {wire56}))};
        end
    end
  assign wire67 = (({{wire59}, $signed((8'hb8))} ?
                      (wire52 ?
                          wire55[(3'h7):(3'h6)] : $signed((wire63 >= reg65))) : wire50) > $unsigned($signed(($unsigned((7'h42)) & wire59[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg68 <= {(+(^~($unsigned((8'had)) ~^ $signed(wire56)))),
          (-(((^wire55) ?
              wire56[(4'ha):(1'h0)] : (8'hb2)) > $unsigned($unsigned((8'ha8)))))};
      reg69 <= (($unsigned(wire59[(2'h3):(1'h0)]) ?
          (8'ha8) : (($unsigned(wire61) >= $signed(wire56)) >>> {wire48[(2'h3):(1'h1)]})) == $unsigned($signed(wire63)));
      reg70 <= $unsigned($unsigned(reg64[(4'ha):(4'ha)]));
      reg71 <= wire49;
    end
  always
    @(posedge clk) begin
      if ({wire62})
        begin
          if ((wire61 ?
              (8'hb8) : $unsigned($signed((~wire51[(5'h11):(4'hc)])))))
            begin
              reg72 <= $signed($signed(wire52));
            end
          else
            begin
              reg72 <= wire57[(2'h2):(1'h0)];
            end
          reg73 <= $unsigned(($signed($unsigned($unsigned((8'hbc)))) ^ (~&reg72)));
        end
      else
        begin
          if (wire49)
            begin
              reg72 <= reg70;
              reg73 <= (7'h43);
              reg74 <= (-$unsigned((8'hab)));
            end
          else
            begin
              reg72 <= (wire62 ?
                  wire60[(1'h1):(1'h0)] : $signed(wire52[(4'h8):(2'h3)]));
              reg73 <= $signed((+($unsigned($unsigned(wire52)) == wire51)));
              reg74 <= (+(reg65 ?
                  (reg70 ?
                      $signed((^~reg72)) : (reg73[(4'h9):(4'h9)] ?
                          (wire50 - reg73) : (wire63 || reg68))) : wire54[(3'h6):(2'h2)]));
              reg75 <= wire52[(3'h6):(3'h5)];
            end
          reg76 <= $signed(($unsigned((wire48[(4'h8):(2'h2)] && reg66)) ?
              (|((wire48 ? reg70 : reg65) ?
                  wire55 : (wire49 ? wire57 : wire55))) : {(((8'ha6) > reg75) ?
                      (7'h44) : $unsigned(reg68))}));
          reg77 <= (-(-$signed((!$unsigned((8'h9d))))));
        end
      if ((-reg69))
        begin
          if (wire58[(3'h7):(3'h6)])
            begin
              reg78 <= reg71[(4'hb):(3'h5)];
              reg79 <= $signed(wire52);
              reg80 <= ((|$signed((~|(wire58 & wire67)))) ?
                  $signed((($signed(wire48) ?
                          $signed((8'ha0)) : (reg71 ? wire58 : wire49)) ?
                      ($signed(wire63) ?
                          (reg70 && wire48) : (wire59 ^~ wire67)) : (8'hac))) : (8'hae));
              reg81 <= $signed($signed(((+wire49[(3'h6):(3'h4)]) & $unsigned({wire55}))));
            end
          else
            begin
              reg78 <= $unsigned($unsigned(wire57));
              reg79 <= $unsigned((~^reg69[(1'h1):(1'h0)]));
            end
          if (wire63[(4'hb):(3'h4)])
            begin
              reg82 <= reg68[(4'h8):(2'h3)];
              reg83 <= {(^$unsigned(reg68)), reg81};
              reg84 <= $signed(($signed(($signed((8'ha3)) && reg79)) + (($signed(wire56) >= ((8'hab) == wire48)) ?
                  $signed((wire63 - (8'hb0))) : (~|$unsigned(reg82)))));
            end
          else
            begin
              reg82 <= {wire62, {wire57[(1'h0):(1'h0)], wire57[(2'h2):(1'h1)]}};
              reg83 <= $signed(reg82[(2'h3):(1'h0)]);
              reg84 <= $unsigned(($signed((&reg80[(4'hb):(3'h4)])) ?
                  wire58 : $signed(({wire58, (8'h9f)} ? reg83 : wire63))));
              reg85 <= $signed($signed(($unsigned({reg84}) ?
                  (((8'had) == reg69) ?
                      $signed(wire58) : $signed(reg83)) : (~|$signed(reg78)))));
            end
          reg86 <= $unsigned($unsigned(wire62[(2'h2):(1'h1)]));
        end
      else
        begin
          reg78 <= ($signed(reg85) ~^ (~$signed($unsigned($signed((8'hab))))));
          reg79 <= (reg66 | {($unsigned($unsigned(wire61)) & ($signed(reg80) ?
                  (!wire53) : (!reg86)))});
          reg80 <= $unsigned((8'had));
        end
      reg87 <= (~&wire57);
      reg88 <= reg85;
    end
  assign wire89 = reg71[(1'h0):(1'h0)];
  assign wire90 = ($unsigned((-((~&(8'ha8)) ?
                      $signed(reg80) : $signed(wire53)))) && ((((wire61 & (8'hb0)) ~^ {reg77,
                              (8'h9f)}) ?
                          (reg74 << (reg70 * wire63)) : $unsigned(wire61)) ?
                      (|($signed(reg81) >> (reg75 ?
                          wire51 : wire57))) : reg86[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      if (reg85[(3'h7):(3'h5)])
        begin
          reg91 <= {reg76, $signed($signed((((8'hb6) || reg83) ^~ reg80)))};
          reg92 <= ($unsigned($unsigned((^~(!reg78)))) && (~|$unsigned({(reg76 ?
                  reg69 : wire61),
              wire51})));
          reg93 <= ((~&$unsigned(reg83[(1'h1):(1'h0)])) <= (($unsigned(wire58) ?
              ((reg84 ? reg77 : wire53) <= {wire89,
                  wire61}) : wire58[(4'ha):(1'h0)]) >= reg82));
          reg94 <= $unsigned(((8'ha7) ?
              $signed(($signed(reg80) << (reg77 - wire53))) : (+reg68[(3'h6):(1'h0)])));
        end
      else
        begin
          reg91 <= $unsigned(wire49[(1'h0):(1'h0)]);
          reg92 <= $unsigned(($unsigned(reg91[(4'h8):(4'h8)]) != $signed($unsigned($unsigned(reg70)))));
          reg93 <= reg86;
          reg94 <= ($signed($signed(($unsigned(reg80) & (reg85 ?
                  wire67 : reg78)))) ?
              (&(((reg87 << (8'hb9)) ~^ (7'h41)) >= {(!reg93),
                  (wire52 || reg88)})) : (-(|((reg84 ? wire89 : wire67) ?
                  wire67 : reg75[(5'h10):(3'h6)]))));
          reg95 <= reg83[(4'hf):(4'h8)];
        end
      reg96 <= $unsigned((wire61 < $unsigned($unsigned({wire53, reg64}))));
      reg97 <= reg73[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg98 <= (($signed((^~(~&wire90))) && $unsigned((!$unsigned(reg83)))) && $signed((&$unsigned(reg85))));
      reg99 <= wire50;
    end
endmodule

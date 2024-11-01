module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire115;
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire4,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire115,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = ($signed(($signed((~wire2)) ?
                     $unsigned(wire3[(4'hc):(4'h8)]) : (wire2 | (wire1 > wire0)))) ~^ (wire2[(1'h1):(1'h1)] <= {wire0[(2'h2):(2'h2)],
                     $signed((8'hac))}));
  always
    @(posedge clk) begin
      if ((($unsigned(wire3) ? (8'haf) : $unsigned(wire0[(3'h5):(3'h4)])) ?
          (wire1 << wire3) : $unsigned(((+(wire1 | wire1)) ?
              $unsigned((wire3 ? wire0 : wire4)) : $signed((wire3 ?
                  wire4 : wire1))))))
        begin
          reg5 <= $signed($signed(wire1));
          reg6 <= $signed(wire4);
          reg7 <= reg6;
        end
      else
        begin
          reg5 <= $signed({$signed(reg6[(4'h9):(3'h7)])});
          if ((~($unsigned($signed(wire0[(4'he):(4'hb)])) - $signed(reg7))))
            begin
              reg6 <= (~reg5[(3'h6):(2'h2)]);
            end
          else
            begin
              reg6 <= wire2[(3'h4):(2'h3)];
            end
          reg7 <= (($unsigned(({wire3, wire2} ^~ $unsigned((8'hb0)))) ?
                  (^$unsigned(reg7[(3'h7):(3'h6)])) : $unsigned(reg7[(4'h8):(3'h4)])) ?
              reg6[(1'h1):(1'h1)] : (&(((&reg6) ^ wire2[(1'h0):(1'h0)]) ?
                  $signed($unsigned(wire3)) : ((wire4 >>> wire1) > ((8'ha1) ?
                      reg7 : (8'hb4))))));
          reg8 <= (^($unsigned($signed($unsigned(wire0))) ?
              (wire1[(4'ha):(2'h2)] ?
                  wire1[(1'h1):(1'h1)] : (~|(reg6 ?
                      (8'ha6) : wire3))) : reg6[(3'h7):(3'h6)]));
        end
    end
  assign wire9 = $signed({{(~&$unsigned(reg8)), wire3},
                     (~(~$signed((8'hb0))))});
  assign wire10 = wire3[(4'ha):(2'h2)];
  assign wire11 = ({wire3[(1'h0):(1'h0)],
                          (+$unsigned((wire4 ? wire9 : wire2)))} ?
                      reg7[(3'h4):(1'h1)] : $unsigned($signed(reg6[(4'h9):(3'h6)])));
  assign wire12 = wire4[(4'h8):(4'h8)];
  assign wire13 = (((&(wire2 - $unsigned(wire3))) * (!((wire3 ? wire12 : reg8) ?
                          (^reg7) : (wire9 & (8'ha5))))) ?
                      reg8[(3'h4):(2'h3)] : $signed(reg6));
  module14 #() modinst116 (wire115, clk, wire4, reg6, wire0, wire11);
  assign wire117 = (wire1[(1'h1):(1'h0)] > (^~$unsigned(((wire1 ^ reg6) ?
                       reg6[(4'ha):(4'h8)] : (wire4 || wire3)))));
  assign wire118 = ({{wire11, (~&reg6)}} ?
                       $signed(($signed((+reg6)) ?
                           $unsigned((^wire4)) : wire4[(1'h1):(1'h1)])) : (8'h9e));
  assign wire119 = $unsigned(($unsigned($unsigned($signed((8'h9f)))) ?
                       ((wire1 > reg8[(2'h3):(1'h1)]) && ($unsigned(reg7) >> $signed(wire11))) : reg8[(1'h0):(1'h0)]));
  assign wire120 = wire118;
  assign wire121 = (wire115[(4'h9):(3'h5)] ?
                       (+(8'haf)) : ((($unsigned((8'hac)) ?
                               wire10[(3'h6):(1'h0)] : $unsigned(wire12)) ?
                           (wire119[(2'h3):(2'h3)] ?
                               $signed(wire9) : (+wire0)) : ($signed(reg8) ^~ (^~(8'hb2)))) != {($signed(reg5) | $unsigned(wire117)),
                           $unsigned((reg6 && reg5))}));
  assign wire122 = ((^{wire1}) ?
                       $unsigned(wire11[(3'h5):(3'h5)]) : (wire4 || ((wire12[(1'h0):(1'h0)] ?
                               wire118[(3'h4):(2'h2)] : $unsigned(wire4)) ?
                           wire117 : {$unsigned(wire1)})));
  always
    @(posedge clk) begin
      reg123 <= $signed(((~|(((8'hb5) & (8'hac)) ?
          (wire119 ? wire118 : (8'ha1)) : reg6[(4'hf):(1'h1)])) > wire13));
      if ((~reg8))
        begin
          reg124 <= wire122[(3'h7):(3'h5)];
          reg125 <= (|reg7);
          reg126 <= $signed((+(wire122[(3'h6):(2'h3)] ?
              wire121[(1'h0):(1'h0)] : ((~&wire2) << (wire122 ?
                  wire0 : wire115)))));
          if ((^~reg6[(3'h6):(3'h4)]))
            begin
              reg127 <= wire4;
              reg128 <= ($signed((~&{wire121, $unsigned(reg6)})) ?
                  ({($unsigned(wire115) ?
                          (reg7 ? (7'h41) : wire3) : (wire118 ?
                              wire121 : reg6))} < $unsigned($signed($signed(wire9)))) : {reg6});
              reg129 <= (~(wire12 ? reg124 : wire9));
              reg130 <= (+reg125);
            end
          else
            begin
              reg127 <= (8'ha4);
              reg128 <= {wire9[(2'h2):(2'h2)], (~|wire3[(1'h0):(1'h0)])};
              reg129 <= $unsigned((($unsigned(reg129) >>> $signed(reg8[(3'h5):(3'h5)])) ?
                  (wire118 + $unsigned((wire121 ^ wire4))) : (reg123 >> $unsigned((wire11 ?
                      wire2 : wire13)))));
              reg130 <= (reg128 ?
                  ($signed(((wire115 ? wire117 : reg123) ?
                      $unsigned(wire9) : reg8[(1'h0):(1'h0)])) ^ ((wire2[(3'h4):(1'h0)] ?
                      wire11[(4'hc):(3'h5)] : reg128[(1'h0):(1'h0)]) >= $signed((|wire3)))) : reg128[(4'h8):(3'h5)]);
              reg131 <= wire11;
            end
        end
      else
        begin
          reg124 <= $signed((wire0 && (|(8'haf))));
        end
    end
  assign wire132 = (~&$unsigned($unsigned($unsigned((wire3 ?
                       reg130 : reg130)))));
  assign wire133 = ($signed((wire1 && ((^~wire10) ^ $unsigned(wire117)))) && wire120[(2'h2):(2'h2)]);
  assign wire134 = {wire3};
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire62;
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire76,
                 wire64,
                 wire19,
                 wire20,
                 wire21,
                 wire45,
                 wire46,
                 wire47,
                 wire62,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 (1'h0)};
  assign wire19 = (7'h41);
  assign wire20 = $unsigned((+(^((wire16 ? wire17 : wire15) ?
                      $signed(wire16) : $signed(wire16)))));
  assign wire21 = {(~&$signed((wire20 >>> $signed(wire16)))),
                      wire20[(4'hc):(3'h5)]};
  always
    @(posedge clk) begin
      if ((wire20 ?
          ({$signed(((8'hbb) << wire15)), (~|(wire16 ? wire15 : wire21))} ?
              ($unsigned((wire20 && wire21)) ?
                  {wire18[(1'h0):(1'h0)], $unsigned(wire17)} : {wire21,
                      ((8'hb9) && wire21)}) : wire16[(4'hc):(1'h0)]) : wire20))
        begin
          reg22 <= $signed((^~$unsigned($signed($signed(wire21)))));
          reg23 <= (~^((wire16[(3'h6):(3'h4)] >>> ((wire20 ? reg22 : wire17) ?
                  (wire21 >> wire19) : (^wire18))) ?
              ((8'hbe) != $signed(wire16)) : $unsigned(($signed(wire17) - $unsigned(wire20)))));
        end
      else
        begin
          reg22 <= ({wire17[(3'h6):(3'h4)],
              (8'ha8)} ^ ((!$unsigned($signed(wire16))) ?
              wire19[(4'h8):(3'h7)] : wire17));
          reg23 <= reg23[(1'h1):(1'h0)];
          reg24 <= $signed({$unsigned((^~$signed(wire16)))});
        end
    end
  always
    @(posedge clk) begin
      if ({reg22[(2'h2):(1'h1)]})
        begin
          reg25 <= wire16;
          reg26 <= $unsigned({(|$unsigned(reg23[(2'h3):(1'h1)]))});
          reg27 <= $unsigned($unsigned(((8'ha8) ?
              $unsigned((reg25 ? reg24 : reg24)) : $signed({wire16}))));
          reg28 <= ($unsigned((~((wire17 ? wire21 : wire20) ?
                  {(8'ha6), (8'hb6)} : $unsigned(reg22)))) ?
              reg24[(4'ha):(2'h3)] : $signed((({wire16} ?
                  ((8'h9c) + reg25) : (8'hb6)) >>> ($signed(wire15) - reg22[(2'h2):(2'h2)]))));
          reg29 <= wire18[(3'h7):(1'h0)];
        end
      else
        begin
          reg25 <= wire19;
          reg26 <= wire16;
        end
      if (reg24)
        begin
          reg30 <= $signed($signed((^~$signed(reg27))));
          reg31 <= reg29;
          reg32 <= (8'hbf);
          reg33 <= $signed((($signed($unsigned(reg22)) ?
              (((8'hb9) != reg31) && (wire17 << wire20)) : reg30) || (reg24[(3'h6):(1'h0)] ?
              (wire21 ?
                  (reg22 ? reg27 : reg23) : (|wire20)) : {reg25[(2'h3):(2'h3)],
                  (reg23 ~^ reg29)})));
          reg34 <= ($unsigned(wire16[(4'hd):(2'h3)]) || (((!reg24[(4'hd):(1'h1)]) ^ $unsigned(reg33)) > $signed(($unsigned(wire15) ?
              $signed((8'ha5)) : reg32[(4'hd):(2'h3)]))));
        end
      else
        begin
          if (reg24)
            begin
              reg30 <= reg22[(1'h0):(1'h0)];
              reg31 <= {(+reg23[(1'h0):(1'h0)])};
              reg32 <= $unsigned($signed($unsigned((~&$signed((8'ha6))))));
              reg33 <= (^((-$signed({wire21, reg27})) ?
                  $unsigned(($signed(wire19) ?
                      (reg23 - reg31) : $signed(reg22))) : $unsigned(reg27)));
            end
          else
            begin
              reg30 <= $unsigned(reg33);
              reg31 <= (reg27 ~^ {{wire15[(2'h3):(1'h1)]},
                  $unsigned(({reg30, wire17} ?
                      {wire17} : (wire19 ? (8'hbb) : wire18)))});
              reg32 <= wire21[(4'hb):(3'h5)];
              reg33 <= (-(wire15[(1'h0):(1'h0)] & $unsigned(($unsigned(wire18) || {wire21,
                  (8'ha6)}))));
              reg34 <= {$unsigned(wire20), reg31};
            end
          if (wire16)
            begin
              reg35 <= $unsigned(($unsigned((reg33 <<< ((8'ha7) & wire19))) ?
                  (~(reg31 ? wire18 : (8'hb8))) : ((~|reg27[(2'h3):(1'h1)]) ?
                      reg33 : ($signed(reg22) ?
                          $unsigned(wire18) : $signed(wire17)))));
              reg36 <= reg31;
              reg37 <= reg34[(2'h2):(1'h1)];
            end
          else
            begin
              reg35 <= ((-$unsigned(reg37[(4'hf):(1'h0)])) ?
                  $signed(($unsigned((reg24 ?
                      wire17 : reg32)) & $signed((-reg28)))) : $unsigned((((8'ha8) << reg37[(2'h3):(1'h0)]) == ($signed(wire15) ~^ (wire16 != reg32)))));
            end
          if (({(~$unsigned(reg32[(4'h8):(2'h2)])),
                  ($signed($unsigned(wire15)) ?
                      {reg37} : (reg23[(1'h0):(1'h0)] + reg30))} ?
              $signed((reg36 >>> (reg30 - (reg27 & reg29)))) : (~|{((reg34 & reg28) ?
                      reg23 : (+wire16)),
                  $unsigned((~(8'hb4)))})))
            begin
              reg38 <= wire20[(1'h0):(1'h0)];
              reg39 <= ($unsigned($signed((7'h40))) + $signed(reg26));
              reg40 <= $signed($unsigned($unsigned($signed(wire18))));
              reg41 <= (((~^reg26) - $unsigned({(+reg22)})) ?
                  (~|$unsigned((~((8'hb0) ?
                      reg39 : reg36)))) : ($signed(((wire19 + (8'hbc)) ?
                      (reg22 ?
                          (8'hb9) : (8'h9f)) : reg35)) >>> $signed((reg37[(2'h3):(1'h0)] ?
                      {reg22, wire21} : $unsigned(reg29)))));
              reg42 <= ((~&(((wire19 ? wire15 : reg38) ?
                      (reg32 - reg23) : $unsigned(reg31)) >= $unsigned((reg23 + reg39)))) ?
                  $signed($signed(($signed(reg28) ?
                      (&wire17) : reg37[(1'h1):(1'h0)]))) : ($unsigned((reg35[(2'h2):(1'h0)] < $signed(wire18))) ?
                      $signed(((reg23 ?
                          (8'hac) : wire16) >>> (~&reg26))) : $unsigned((~(^~reg38)))));
            end
          else
            begin
              reg38 <= reg33;
            end
          reg43 <= {{((reg35 & (reg27 <= reg32)) & {reg28[(4'h8):(3'h4)]})}};
        end
      reg44 <= $unsigned($unsigned($signed($unsigned(reg38))));
    end
  assign wire45 = reg35;
  assign wire46 = wire17[(3'h5):(3'h5)];
  assign wire47 = reg30[(1'h0):(1'h0)];
  module48 #() modinst63 (.clk(clk), .y(wire62), .wire52(reg23), .wire50(wire16), .wire53(reg43), .wire51(reg27), .wire49(reg34));
  assign wire64 = (~|(({$signed((8'hbe))} > (~reg26)) ?
                      reg22[(1'h1):(1'h1)] : $unsigned($unsigned($unsigned(reg23)))));
  always
    @(posedge clk) begin
      reg65 <= (!(^(+$unsigned((reg25 ? reg40 : (8'hbf))))));
      reg66 <= $signed((($signed($unsigned(reg36)) ?
          reg33[(1'h1):(1'h1)] : $unsigned($signed(wire16))) * reg27));
      if ((~$signed((~|reg24))))
        begin
          if ((~(((7'h40) << (~|$signed((8'hae)))) ?
              ((8'hb0) ?
                  wire46 : wire19[(5'h14):(5'h10)]) : {((reg28 >= wire62) > reg26[(2'h3):(1'h1)])})))
            begin
              reg67 <= $unsigned($unsigned($signed(reg24)));
              reg68 <= {wire18[(4'h8):(3'h6)]};
            end
          else
            begin
              reg67 <= wire21[(4'h9):(4'h8)];
            end
          reg69 <= $signed(wire16[(5'h10):(4'hc)]);
          if ($unsigned($signed($signed($unsigned((!wire16))))))
            begin
              reg70 <= {(reg37 + ((-reg65) == reg36[(1'h1):(1'h1)])), wire20};
              reg71 <= ((reg24[(3'h7):(3'h6)] ?
                      $unsigned(((|reg38) ?
                          wire16 : reg38[(4'hd):(4'hd)])) : reg23) ?
                  $unsigned($unsigned((reg24 > (wire19 < (8'hae))))) : reg31);
              reg72 <= $signed(($unsigned($signed((wire47 <= reg38))) ?
                  ($signed((reg66 != reg40)) >>> (~|wire20)) : (~($unsigned(reg71) > $unsigned(wire21)))));
              reg73 <= (8'ha3);
            end
          else
            begin
              reg70 <= (&(-wire17[(1'h1):(1'h1)]));
              reg71 <= ($unsigned(wire16) + (8'h9c));
              reg72 <= reg71[(4'h9):(3'h7)];
              reg73 <= ((^~reg40) ?
                  $signed($signed((reg72[(1'h0):(1'h0)] ^ (8'h9e)))) : (8'ha2));
            end
        end
      else
        begin
          reg67 <= ($signed({((~|(8'hb4)) ?
                      reg40[(4'hb):(4'ha)] : $unsigned(reg24))}) ?
              ((|($unsigned(reg32) ? (^~reg26) : {(8'ha0)})) ?
                  ($unsigned((reg71 * reg44)) < $signed($signed(reg69))) : {({(8'ha4),
                              reg70} ?
                          {reg44,
                              reg43} : $signed(reg65))}) : reg34[(3'h4):(1'h1)]);
          reg68 <= (($unsigned((!(8'ha0))) ?
              wire17 : $unsigned((~^((8'hae) ^ reg36)))) ^~ $unsigned((($unsigned(reg32) & $signed((8'ha2))) ?
              $unsigned((reg35 ? reg72 : reg27)) : ((8'hbe) ?
                  (reg43 != reg73) : reg35))));
          reg69 <= reg69[(4'h9):(1'h1)];
          reg70 <= (reg32 ?
              ((reg26 == $unsigned((+wire20))) >>> (~(~(-reg34)))) : $signed((&$signed((reg38 ^ reg32)))));
        end
      reg74 <= (($signed($unsigned($signed(wire16))) ?
              reg36 : $signed(reg71[(4'hd):(4'ha)])) ?
          (~|reg40) : (^~(((8'hbd) | {wire45}) <= ((wire15 || reg29) ?
              (&(8'hb2)) : reg26))));
      reg75 <= wire18;
    end
  assign wire76 = ($unsigned((($unsigned(reg23) - wire20[(5'h12):(4'hc)]) || reg40)) * (reg36[(2'h3):(1'h1)] - reg25));
  module77 #() modinst111 (wire110, clk, reg25, wire16, reg30, wire21);
  assign wire112 = $unsigned((!((^(^(8'hb6))) - (reg70[(4'h9):(3'h6)] ?
                       (reg27 ? reg42 : reg44) : $unsigned(reg68)))));
  assign wire113 = (~&(^$unsigned(reg72[(1'h0):(1'h0)])));
  assign wire114 = $signed(reg74[(1'h1):(1'h0)]);
endmodule

module module77
#(parameter param108 = (^(^{(^((8'hac) ? (8'hb9) : (8'h9e)))})), 
parameter param109 = (({(&{param108, param108}), param108} >> ({(param108 < param108)} ? (~(~^param108)) : (~param108))) ? param108 : param108))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(4'he):(1'h0)] wire79;
  input wire [(5'h10):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  assign y = {wire107,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire83,
                 wire82,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire82 = ({(~^wire78[(4'h9):(1'h1)]),
                      ((-wire79) & {(wire78 - wire78),
                          wire79})} * wire81[(1'h0):(1'h0)]);
  assign wire83 = $signed(($unsigned((!(~wire82))) ?
                      $signed(wire81[(1'h1):(1'h0)]) : $unsigned($unsigned((~&wire79)))));
  always
    @(posedge clk) begin
      reg84 <= wire83[(3'h7):(3'h5)];
      if (reg84[(1'h1):(1'h0)])
        begin
          if (wire78)
            begin
              reg85 <= wire78[(4'hd):(4'h8)];
              reg86 <= {(8'ha1)};
            end
          else
            begin
              reg85 <= $signed($signed(reg85[(3'h7):(1'h0)]));
              reg86 <= ((reg84 ?
                      {wire82[(3'h5):(1'h1)],
                          reg84[(4'ha):(2'h2)]} : $unsigned(($signed(wire78) ?
                          {reg84, wire80} : $signed(wire81)))) ?
                  (reg84 << ($unsigned((wire80 ~^ reg85)) ?
                      wire80 : $unsigned((reg84 >>> wire81)))) : ($unsigned(reg85) || wire79[(2'h3):(1'h1)]));
              reg87 <= ($unsigned((wire82[(3'h7):(1'h1)] >>> ($unsigned(wire78) ?
                      {wire78} : {wire79, (8'hb6)}))) ?
                  reg84 : ((^{$signed(wire79), reg86}) ?
                      (({wire83} - {(8'hb2)}) ?
                          ({reg85} || (^~reg85)) : ($unsigned(wire80) >= (wire82 ?
                              reg86 : (8'hb1)))) : (wire79 ?
                          wire78 : ((|wire82) ~^ {reg85, wire79}))));
              reg88 <= wire80[(3'h5):(2'h2)];
              reg89 <= (($signed((+reg84[(3'h4):(2'h3)])) ?
                      ({{wire78, reg87}} ?
                          $signed((^reg88)) : $unsigned($unsigned(reg86))) : reg86) ?
                  (~^$unsigned({(!reg86)})) : reg88);
            end
          reg90 <= (8'h9e);
        end
      else
        begin
          reg85 <= (7'h40);
          reg86 <= (~&wire83);
        end
    end
  always
    @(posedge clk) begin
      reg91 <= $signed(wire83);
      reg92 <= {$signed(wire81), wire81[(1'h1):(1'h1)]};
      reg93 <= ((reg85 ?
          ((7'h40) ?
              ((-wire83) << reg90[(4'h8):(1'h0)]) : $signed($signed(reg88))) : wire80) || (-wire83));
      reg94 <= wire81[(1'h1):(1'h0)];
      reg95 <= wire83[(2'h2):(1'h1)];
    end
  assign wire96 = ($unsigned($unsigned({(reg88 ^ reg86)})) ^~ reg89[(3'h5):(2'h3)]);
  assign wire97 = (wire79[(4'ha):(1'h1)] ? $unsigned((7'h41)) : (8'hbb));
  assign wire98 = {wire96};
  assign wire99 = $signed($signed({$signed({reg91, wire98}), wire80}));
  assign wire100 = {((8'ha4) ? wire81[(2'h3):(2'h3)] : {wire82[(3'h5):(2'h3)]}),
                       (8'h9f)};
  assign wire101 = $unsigned($unsigned((~|$signed((reg85 ?
                       (8'hba) : wire80)))));
  always
    @(posedge clk) begin
      reg102 <= (wire99[(3'h4):(3'h4)] >= $signed({(8'ha4)}));
      reg103 <= ($unsigned(($signed(wire81[(2'h3):(2'h3)]) ^~ reg86)) ?
          (wire78[(4'ha):(3'h7)] << (+wire79[(1'h1):(1'h0)])) : (-$unsigned(reg92)));
      reg104 <= $unsigned($unsigned((^~(reg87 ? {(8'hbb), reg93} : wire78))));
      reg105 <= wire81;
      reg106 <= reg105;
    end
  assign wire107 = reg84;
endmodule

module module48
#(parameter param61 = ((&(~^(((8'ha7) ? (8'h9c) : (8'ha1)) >>> {(8'ha9)}))) == (-((^~(~^(8'had))) <= (!((8'hb6) ? (8'hb0) : (8'haa)))))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire53;
  input wire [(4'hf):(1'h0)] wire52;
  input wire [(3'h7):(1'h0)] wire51;
  input wire signed [(2'h2):(1'h0)] wire50;
  input wire signed [(5'h11):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  assign y = {wire60, wire59, wire57, wire56, wire55, wire54, reg58, (1'h0)};
  assign wire54 = (~|wire52);
  assign wire55 = wire51[(2'h2):(2'h2)];
  assign wire56 = (&wire55);
  assign wire57 = ((^wire55) ?
                      $signed(wire55) : ({{wire51, (^~wire54)}} > wire49));
  always
    @(posedge clk) begin
      reg58 <= wire51[(3'h7):(1'h0)];
    end
  assign wire59 = (((wire53 >> $unsigned((wire49 == wire57))) == (((|wire51) ~^ (&wire57)) ?
                          ((|wire50) && (wire51 != wire56)) : (&wire50[(1'h0):(1'h0)]))) ?
                      (wire51[(2'h3):(1'h1)] >= (^wire55[(4'h8):(1'h0)])) : ($unsigned(wire54[(5'h10):(3'h4)]) & ($unsigned((wire56 ?
                              wire56 : wire55)) ?
                          (&(|wire49)) : {$signed(wire51),
                              wire51[(3'h4):(3'h4)]})));
  assign wire60 = ((wire57[(4'hd):(4'hc)] ?
                      $signed(reg58) : (wire56[(4'hc):(4'ha)] == $signed($unsigned((8'ha8))))) ^ $signed(wire59[(4'he):(4'hc)]));
endmodule

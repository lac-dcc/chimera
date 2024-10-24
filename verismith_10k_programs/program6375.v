module top #(parameter param144 = (8'hbf)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire52;
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire121,
                 wire118,
                 wire116,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg120,
                 reg119,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed((wire2[(3'h4):(3'h4)] <= $signed($unsigned((wire3 ?
          wire3 : wire0)))));
    end
  module5 #() modinst53 (.wire8(wire0), .y(wire52), .wire9(reg4), .clk(clk), .wire7(wire2), .wire6(wire3));
  assign wire54 = (8'hb8);
  assign wire55 = ((~&($signed(wire52) < (reg4 != (^~wire0)))) == wire52[(4'h8):(2'h3)]);
  assign wire56 = (8'ha6);
  assign wire57 = (wire55 != ((^wire52) == ((^$unsigned((8'hb1))) - wire55)));
  module58 #() modinst117 (wire116, clk, wire55, wire1, wire54, wire0);
  assign wire118 = ($unsigned(reg4) ?
                       wire55[(5'h13):(1'h0)] : (!$signed((^~(wire3 ?
                           wire55 : wire54)))));
  always
    @(posedge clk) begin
      reg119 <= $unsigned(wire57);
      reg120 <= (~&(8'ha3));
    end
  assign wire121 = reg4;
  always
    @(posedge clk) begin
      reg122 <= (!$unsigned((((wire56 ?
          wire3 : (8'haa)) && $signed(wire116)) << $signed(wire52[(1'h0):(1'h0)]))));
      if (wire0[(3'h5):(2'h2)])
        begin
          reg123 <= ($unsigned((wire56[(1'h1):(1'h1)] && $signed((8'ha5)))) ?
              $unsigned($signed((8'hb3))) : ((!((8'hbb) ^~ $unsigned(wire57))) ^~ $signed((((8'ha6) ?
                  reg119 : reg120) + wire56[(4'hc):(4'hb)]))));
        end
      else
        begin
          reg123 <= (-$unsigned((^~wire54)));
          reg124 <= (wire0 ? $signed(wire52) : (8'hb9));
          reg125 <= $signed((wire56[(4'ha):(1'h1)] >= reg122[(3'h6):(3'h5)]));
          reg126 <= reg125;
        end
      reg127 <= ($signed($signed(((wire54 * (8'hb2)) ?
          $unsigned(reg126) : wire116))) >>> $unsigned((-(reg125[(4'hc):(2'h3)] ?
          wire118[(4'hd):(2'h2)] : (reg120 - (7'h43))))));
    end
  always
    @(posedge clk) begin
      reg128 <= $unsigned($unsigned(({(~wire116)} == (wire56 | reg125))));
      reg129 <= ((($unsigned((wire0 ? wire56 : reg126)) ?
          (~^$unsigned(wire3)) : ((reg122 ?
              reg124 : wire56) - (+wire3))) && (!(~|(~|reg124)))) + (^~(+reg122)));
      reg130 <= (reg123[(2'h3):(1'h1)] ?
          $signed(reg122) : $unsigned(((~^(~|reg123)) ~^ (~|$unsigned(reg4)))));
      reg131 <= (!(~&$unsigned(reg119[(1'h0):(1'h0)])));
    end
  assign wire132 = $signed((((!$unsigned(reg124)) ?
                       ((+reg125) ?
                           (8'ha4) : wire3) : $signed(wire3)) & {reg119[(2'h3):(2'h2)],
                       ((wire3 - wire0) ? wire56 : (~^wire118))}));
  assign wire133 = ($signed(reg130[(2'h3):(2'h2)]) ?
                       {$unsigned($unsigned((reg127 ? (8'h9c) : wire55))),
                           {($signed(reg123) ?
                                   (8'h9e) : (reg124 ? reg120 : reg128)),
                               {{wire56}}}} : $unsigned(wire0[(1'h0):(1'h0)]));
  assign wire134 = ($signed((($unsigned(wire56) + (wire52 ^~ wire56)) ?
                       reg4[(1'h0):(1'h0)] : ((^reg120) > (-wire54)))) ~^ wire1[(3'h6):(1'h1)]);
  assign wire135 = ($signed($unsigned(({wire54, reg126} ?
                           (reg4 < wire52) : {reg130, wire132}))) ?
                       $signed((reg122 ?
                           (reg131 < (reg131 ?
                               reg4 : (8'hbe))) : wire2[(3'h7):(3'h4)])) : wire0[(3'h6):(1'h0)]);
  assign wire136 = ($signed($signed($unsigned((wire55 ^ wire116)))) & ((8'hbe) ?
                       (((wire116 ? reg123 : reg129) && ((8'hb3) ?
                               reg124 : reg129)) ?
                           wire56[(2'h2):(1'h1)] : (^~$unsigned(reg127))) : (~|($signed((8'hba)) ?
                           $unsigned((8'ha7)) : ((7'h43) ?
                               (8'h9d) : wire134)))));
  assign wire137 = $unsigned(((8'hb1) >= (((~^reg130) <= (reg119 ?
                       reg126 : (7'h43))) <= $signed($signed(reg128)))));
  always
    @(posedge clk) begin
      if (($unsigned(((((8'ha5) ? reg119 : reg125) ?
                  ((8'hb8) ? reg120 : wire1) : (reg127 ? wire1 : wire137)) ?
              {(wire135 < reg130), {reg124}} : $signed((^~wire2)))) ?
          wire1 : (reg131[(3'h4):(3'h4)] >= wire0)))
        begin
          if ((({{(^wire132)}} ^~ ((reg129 * (reg120 ?
              (8'hbf) : wire2)) | (~|(wire133 == wire132)))) == wire137[(4'hc):(1'h0)]))
            begin
              reg138 <= ((^~wire52) & reg126[(3'h6):(2'h3)]);
              reg139 <= ((($unsigned(((8'hb6) ? reg131 : reg124)) ?
                      $unsigned((wire121 || reg119)) : (|wire3[(5'h11):(2'h2)])) >> (-((+wire116) <= wire116[(2'h3):(1'h1)]))) ?
                  wire57 : (!($unsigned(wire55) ?
                      $signed((~&(8'haa))) : $unsigned(wire0))));
            end
          else
            begin
              reg138 <= (^~(+reg4));
              reg139 <= reg130;
              reg140 <= wire135;
            end
        end
      else
        begin
          reg138 <= $unsigned(reg139[(5'h12):(4'h8)]);
          reg139 <= $signed($unsigned({(-(-reg126))}));
          reg140 <= ($unsigned(reg122[(4'h8):(1'h1)]) ?
              (8'hbf) : $unsigned(({(wire2 <= wire136)} ?
                  {wire133[(1'h0):(1'h0)],
                      wire56} : (wire55 || (reg120 == wire56)))));
        end
      reg141 <= $signed($signed((|reg122[(4'h9):(3'h7)])));
    end
  assign wire142 = reg128;
  assign wire143 = wire121[(1'h1):(1'h1)];
endmodule

module module58
#(parameter param115 = (~|(((|((7'h42) >> (8'h9e))) * (-(~^(8'had)))) || ((((8'h9e) > (8'hb6)) ? (|(8'hac)) : ((8'hac) + (8'hbf))) ? (((8'hb5) ? (8'h9d) : (8'hbe)) >>> ((8'hb4) ? (8'hbb) : (8'h9f))) : (~(~&(8'hbd)))))))
(y, clk, wire59, wire60, wire61, wire62);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire59;
  input wire signed [(5'h14):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire61;
  input wire [(3'h7):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire113;
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  assign y = {wire63,
                 wire65,
                 wire113,
                 reg64,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
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
  assign wire63 = ((~wire62[(3'h6):(3'h6)]) ?
                      $signed(wire61) : ((-wire62[(3'h4):(2'h2)]) ?
                          ($signed(wire59[(1'h1):(1'h1)]) ?
                              $signed((~wire60)) : (-(wire62 ?
                                  wire59 : wire59))) : ($unsigned(wire60) ?
                              ((wire59 ? wire60 : wire59) ?
                                  (wire62 ?
                                      wire61 : wire62) : (^wire62)) : (wire60[(2'h2):(2'h2)] ?
                                  wire60 : ((8'h9e) - wire62)))));
  always
    @(posedge clk) begin
      reg64 <= wire62;
    end
  assign wire65 = wire62[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      if (wire61[(4'hd):(4'hb)])
        begin
          reg66 <= $signed((8'ha5));
          reg67 <= wire65;
        end
      else
        begin
          reg66 <= (((wire63[(2'h2):(2'h2)] ^~ $unsigned((+wire65))) > wire60[(4'ha):(4'h8)]) == wire61[(2'h2):(1'h0)]);
          reg67 <= {{wire59[(1'h0):(1'h0)]}, reg66[(3'h4):(3'h4)]};
          if ($unsigned($signed(reg64[(2'h2):(2'h2)])))
            begin
              reg68 <= (~($unsigned(wire60) * $unsigned($signed($unsigned(reg66)))));
              reg69 <= ((~$unsigned(($unsigned(reg68) ?
                  (wire61 ?
                      reg66 : reg64) : $signed((8'hb3))))) << reg64[(5'h12):(1'h0)]);
            end
          else
            begin
              reg68 <= (|wire61[(4'ha):(4'h8)]);
              reg69 <= (reg64 >> ((^$signed({(8'haf)})) ?
                  (8'ha2) : $unsigned((&{wire65}))));
              reg70 <= (reg69[(3'h7):(3'h5)] ?
                  reg68 : (~|(^~(reg66 << reg67))));
              reg71 <= ((^~{$signed($unsigned(reg69)), $signed(wire59)}) ?
                  ($unsigned({(reg67 <<< reg69), $unsigned(wire65)}) ?
                      ($unsigned($signed(wire65)) ?
                          (^~$signed((8'hbb))) : (8'ha4)) : {(7'h42),
                          wire60[(5'h13):(5'h10)]}) : wire59[(3'h7):(2'h2)]);
              reg72 <= (((~&$unsigned(wire60[(4'hf):(4'h9)])) ?
                  {(wire62 >> {wire59}),
                      wire65[(4'he):(1'h1)]} : (+(+$unsigned(wire63)))) >>> wire60);
            end
          reg73 <= ((|$signed((&$signed(wire61)))) + $unsigned(wire65));
          if ((&$signed((&reg67[(3'h6):(1'h0)]))))
            begin
              reg74 <= wire62[(2'h2):(1'h0)];
              reg75 <= reg64;
              reg76 <= ((|($signed($unsigned(reg66)) <= reg72[(3'h7):(2'h3)])) ?
                  (+(($signed(wire61) >>> ((8'hb8) + reg71)) + reg66[(3'h5):(2'h2)])) : $unsigned((reg72 ?
                      ($unsigned(reg70) & reg70[(1'h1):(1'h0)]) : $unsigned(((8'hb7) ?
                          wire60 : (8'ha8))))));
            end
          else
            begin
              reg74 <= ((~^$unsigned({(~^wire63), (reg64 & reg66)})) ?
                  reg70[(3'h4):(2'h2)] : wire61[(4'h9):(2'h2)]);
              reg75 <= reg71;
              reg76 <= (^~((|wire65) && ((~|(-wire60)) <= $signed((-reg67)))));
              reg77 <= $unsigned(reg64[(1'h0):(1'h0)]);
            end
        end
      reg78 <= $unsigned(wire60[(4'hb):(3'h4)]);
      if ($signed((8'hb4)))
        begin
          reg79 <= $signed((8'h9c));
          reg80 <= $unsigned(wire63);
        end
      else
        begin
          if ((($unsigned(reg72) < reg71) <<< wire65[(3'h6):(3'h5)]))
            begin
              reg79 <= $unsigned(($unsigned(reg67[(1'h0):(1'h0)]) <<< {reg74[(4'h8):(3'h6)],
                  (|wire59)}));
              reg80 <= (^~reg74[(2'h2):(1'h1)]);
              reg81 <= $signed(($signed(($signed(reg75) ?
                  $signed(reg77) : wire63[(1'h1):(1'h1)])) > reg77));
              reg82 <= (~|wire61[(4'h9):(4'h9)]);
            end
          else
            begin
              reg79 <= ((($unsigned((wire59 ~^ reg68)) ?
                      reg73 : ((!wire63) * reg69[(1'h0):(1'h0)])) >= $unsigned({(wire59 < reg82),
                      wire65[(3'h7):(2'h2)]})) ?
                  $signed(reg78) : (reg75 & wire63));
              reg80 <= $unsigned($signed($unsigned(({reg82, reg80} ?
                  (reg64 ^ wire59) : $unsigned(reg82)))));
              reg81 <= (($signed((^~reg70[(3'h4):(1'h1)])) > reg64[(4'hc):(4'hc)]) ?
                  $unsigned((((wire65 ? reg78 : reg66) & reg81[(4'hc):(4'hb)]) ?
                      $unsigned({reg70}) : ($unsigned(reg68) >= {reg82,
                          reg66}))) : $signed($signed(reg64)));
            end
          reg83 <= $signed(reg80);
          if ((-reg75[(2'h2):(1'h1)]))
            begin
              reg84 <= (reg78[(2'h2):(2'h2)] ?
                  wire61[(2'h2):(1'h1)] : wire61[(3'h6):(1'h1)]);
            end
          else
            begin
              reg84 <= $signed($unsigned($signed($unsigned((reg68 << reg84)))));
              reg85 <= reg79[(4'h9):(4'h8)];
              reg86 <= reg78[(1'h1):(1'h0)];
              reg87 <= {$unsigned($signed(($unsigned((8'ha2)) ^ $unsigned((8'ha8))))),
                  $unsigned((($signed(wire63) ?
                      reg68[(4'ha):(4'h8)] : reg68[(4'h9):(2'h2)]) && ((wire59 ?
                          wire65 : reg84) ?
                      $unsigned(reg68) : (reg74 ~^ reg70))))};
              reg88 <= (($signed(((wire59 ?
                      reg67 : reg81) ~^ reg76[(3'h7):(1'h0)])) ?
                  (reg71 ?
                      reg69[(4'ha):(4'ha)] : reg84) : reg71) * {(~&($unsigned(reg67) - {wire63})),
                  reg72[(4'h9):(3'h6)]});
            end
        end
      reg89 <= $unsigned(reg64[(4'hf):(4'hf)]);
    end
  module90 #() modinst114 (wire113, clk, wire59, reg76, reg75, reg64);
endmodule

module module5
#(parameter param51 = {(((((8'hab) ? (8'ha1) : (8'hbf)) ? ((8'ha8) > (8'ha3)) : ((8'hb5) | (7'h40))) > ({(8'hb9)} && (8'ha3))) ? (8'hb4) : (8'ha2))})
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire41;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 (1'h0)};
  module10 #() modinst42 (wire41, clk, wire7, wire9, wire8, wire6, (8'ha7));
  assign wire43 = $unsigned({({wire9[(3'h5):(1'h0)]} ?
                          {$signed(wire7),
                              {wire8,
                                  (8'ha8)}} : ((wire6 <<< wire9) <= ((7'h44) ^~ wire6)))});
  assign wire44 = $signed((($unsigned((~&wire41)) <<< wire6[(1'h1):(1'h0)]) ?
                      (-(^wire9[(4'h9):(2'h2)])) : $signed(((wire7 || wire8) >>> wire43[(1'h1):(1'h1)]))));
  assign wire45 = ((!wire43[(1'h0):(1'h0)]) >>> {(wire43 ?
                          (wire44[(4'h8):(4'h8)] || $signed((8'ha7))) : (wire41 ?
                              $unsigned(wire9) : $unsigned(wire7))),
                      ((8'hbb) >= (8'hb4))});
  assign wire46 = $signed($unsigned((~|((|wire7) ?
                      $signed(wire45) : $unsigned((8'hb7))))));
  assign wire47 = (-{wire41});
  assign wire48 = $signed(wire41);
  assign wire49 = {(~(($signed(wire44) >> wire48[(2'h2):(1'h1)]) ?
                          ($signed((8'h9c)) <= wire47[(2'h3):(1'h0)]) : wire45)),
                      wire41[(1'h1):(1'h0)]};
  assign wire50 = ((({wire41[(4'hd):(4'h9)], $signed(wire44)} ?
                          $signed($unsigned(wire47)) : $unsigned(wire6)) + wire47) ?
                      {((((8'hbf) ?
                              wire6 : wire45) | (wire41 && wire7)) ^~ wire48)} : $unsigned($signed($signed($unsigned(wire48)))));
endmodule

module module10
#(parameter param39 = (((~((^~(8'hae)) ~^ ((8'haa) ? (8'ha6) : (8'haf)))) >>> (((-(8'hba)) == (8'ha3)) ? (^~(^~(8'ha9))) : (((8'hb2) ? (8'hbe) : (8'hab)) ? (~^(7'h40)) : ((8'h9f) ? (8'ha6) : (8'hac))))) >= (~^((~(~(8'ha5))) ? {((8'hba) ? (8'had) : (8'ha8)), ((7'h42) ? (8'ha6) : (8'hb4))} : {(~|(8'h9c))}))), 
parameter param40 = ((((7'h41) ? ((param39 ? (8'hb4) : param39) ? param39 : (param39 << param39)) : ((8'ha4) ~^ (param39 < (8'haf)))) ? (({(7'h43)} + (~|param39)) <= ((param39 ? (7'h41) : param39) >>> ((8'h9d) > param39))) : (((param39 & (8'hbb)) && (-param39)) << {(param39 ? param39 : param39), {(8'hbb)}})) ? (!{param39}) : ((param39 | param39) ? ((7'h43) ? (-param39) : (param39 ? param39 : (|param39))) : ((((8'haa) ? param39 : param39) ? (param39 ? param39 : param39) : (~^param39)) + (|(param39 <<< param39))))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire16,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire16 = wire14;
  always
    @(posedge clk) begin
      reg17 <= {$signed(wire12),
          ($signed($signed((wire11 ^~ wire12))) ?
              $unsigned(wire12[(1'h1):(1'h1)]) : ($signed($signed(wire11)) ?
                  ((wire13 ? (8'ha8) : wire13) ?
                      (|wire12) : $unsigned(wire13)) : ($signed(wire12) ?
                      $signed(wire12) : (|wire12))))};
      reg18 <= {{(wire16[(5'h14):(1'h1)] ? $unsigned((|(8'haf))) : reg17),
              {wire14, $signed(wire12)}},
          ($unsigned(({wire11} ? (wire15 ? wire16 : reg17) : {(8'ha0)})) ?
              (7'h43) : {{$unsigned(wire16), reg17}})};
    end
  assign wire19 = ($unsigned(reg17[(1'h1):(1'h0)]) ? wire14 : reg17);
  assign wire20 = wire19[(2'h3):(1'h0)];
  assign wire21 = $signed(({wire20, $unsigned((wire13 ? wire16 : wire11))} ?
                      reg18[(1'h0):(1'h0)] : reg18));
  assign wire22 = $signed($signed((!{$signed(reg17)})));
  assign wire23 = ((!wire11[(3'h6):(3'h6)]) * (-{(^~(wire21 + wire14)),
                      {wire21[(2'h3):(2'h3)], wire14[(3'h5):(3'h4)]}}));
  always
    @(posedge clk) begin
      reg24 <= (((^((8'hae) * $signed((8'ha9)))) * wire13) ?
          ({{(wire19 ? (8'hba) : reg17)}, reg17[(1'h0):(1'h0)]} ?
              wire22[(5'h14):(3'h7)] : $unsigned($unsigned((wire20 ?
                  (8'hbb) : reg17)))) : $unsigned((8'hba)));
      if (wire20)
        begin
          reg25 <= $unsigned(((!((wire11 + wire11) ?
              wire13 : (reg17 & wire11))) ^ (((|(7'h43)) || (reg24 >>> (8'hab))) ?
              wire14 : $unsigned((reg17 ? wire13 : wire19)))));
          reg26 <= ($unsigned(((|(wire20 ? wire15 : reg17)) ?
                  ((wire11 >= wire12) > wire13) : ({wire16} ?
                      wire14 : $signed(reg25)))) ?
              {$signed($unsigned((~^(8'hb2))))} : $unsigned(wire11));
        end
      else
        begin
          reg25 <= (|$unsigned($signed(($unsigned((8'hb9)) ^ $unsigned(wire11)))));
          reg26 <= {$unsigned(reg24[(4'h9):(4'h8)]),
              $signed($unsigned(wire13))};
          reg27 <= wire11[(3'h5):(1'h1)];
          reg28 <= wire19;
        end
    end
  assign wire29 = wire21[(3'h6):(3'h5)];
  assign wire30 = $signed((!$unsigned((wire21 ?
                      $unsigned(wire16) : (reg17 >= (8'ha1))))));
  assign wire31 = (({{reg28}} ?
                      wire12 : $unsigned({((8'hbf) >= (7'h40)),
                          (reg25 ?
                              reg28 : wire19)})) >> {($signed((wire20 == wire19)) ?
                          (((8'ha3) ? (8'hbb) : wire30) ?
                              {wire11,
                                  wire22} : wire22[(4'h9):(2'h3)]) : (wire22[(2'h3):(2'h2)] ?
                              $signed(wire14) : (reg27 != wire13)))});
  assign wire32 = ($unsigned(($unsigned((~^reg28)) & wire14[(1'h0):(1'h0)])) > wire22);
  assign wire33 = wire30[(2'h3):(1'h1)];
  assign wire34 = (($unsigned({$signed(wire11)}) == ((wire15 * $signed(wire19)) != $signed(wire33[(3'h6):(3'h5)]))) ?
                      reg24[(2'h3):(1'h0)] : wire30);
  assign wire35 = $signed($unsigned((-wire34)));
  assign wire36 = (($unsigned((-(~&wire32))) - {$unsigned((wire12 * wire23))}) ?
                      ($signed((((8'ha9) && wire31) && {wire14})) ^ $signed((8'h9c))) : wire31);
  assign wire37 = wire23[(4'h9):(4'h9)];
  assign wire38 = $unsigned({$signed($unsigned($unsigned(wire20))),
                      $unsigned({{wire37}})});
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire94;
  input wire signed [(5'h12):(1'h0)] wire93;
  input wire [(4'hb):(1'h0)] wire92;
  input wire [(4'ha):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  assign y = {wire112,
                 wire109,
                 wire108,
                 reg111,
                 reg110,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg95 <= $signed((wire93 * $unsigned(((wire93 ?
          (8'ha8) : (8'ha3)) > wire91))));
      reg96 <= wire93;
      reg97 <= $signed((($unsigned(wire91) ?
          wire94[(1'h0):(1'h0)] : $unsigned((wire93 ?
              wire93 : reg96))) << ($signed(wire92) ?
          reg96 : $unsigned((|(8'hb3))))));
      reg98 <= (({{$signed(wire94)},
          $unsigned(wire94[(3'h7):(2'h2)])} && {reg96,
          ($unsigned(wire91) >> $unsigned(wire94))}) <= ({$signed($unsigned(reg95))} - $signed(((wire93 ?
              (8'hb6) : reg97) ?
          ((8'hbd) ? reg96 : reg96) : wire91))));
      if (reg95)
        begin
          reg99 <= $unsigned((|(~^$signed($signed(wire94)))));
        end
      else
        begin
          if ({(((reg97 ?
                  reg95 : (|reg99)) | ($signed(reg96) & reg96[(3'h6):(3'h5)])) | ((^((8'ha6) ?
                      reg97 : (7'h44))) ?
                  ((reg98 ? reg99 : wire92) ?
                      ((8'hb9) != reg96) : $unsigned(reg95)) : (&wire93[(5'h11):(3'h6)])))})
            begin
              reg99 <= ($signed((^~($signed((8'hb1)) && wire92[(4'hb):(2'h2)]))) && (!(!(8'hbd))));
              reg100 <= (reg99[(1'h0):(1'h0)] ?
                  (~|(|((8'hb4) << $signed(wire94)))) : (reg98[(2'h2):(1'h1)] != wire93[(1'h0):(1'h0)]));
              reg101 <= $unsigned(reg96);
              reg102 <= $unsigned((wire93[(2'h2):(2'h2)] ~^ reg96[(4'hb):(1'h0)]));
              reg103 <= wire91[(3'h7):(1'h1)];
            end
          else
            begin
              reg99 <= $signed(((8'hb4) ^~ wire92));
              reg100 <= $signed(($unsigned($unsigned(reg101)) != (^reg101[(1'h1):(1'h0)])));
            end
          reg104 <= reg103;
          reg105 <= reg95;
          reg106 <= reg103;
          reg107 <= (wire93[(1'h0):(1'h0)] ? (|wire91) : reg106[(2'h2):(2'h2)]);
        end
    end
  assign wire108 = wire91;
  assign wire109 = reg95;
  always
    @(posedge clk) begin
      reg110 <= wire94[(3'h5):(2'h2)];
      reg111 <= wire92;
    end
  assign wire112 = $unsigned(reg110[(3'h4):(1'h0)]);
endmodule

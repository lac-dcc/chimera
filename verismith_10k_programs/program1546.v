module top
#(parameter param156 = ((|(~&{((7'h40) || (8'ha9))})) >>> ((^~(((8'hab) ? (7'h41) : (8'hbb)) ? ((8'had) ~^ (8'ha4)) : ((8'ha9) <= (8'ha3)))) ? (+({(8'ha7), (8'hba)} >> ((8'hb4) ? (8'hac) : (8'hb1)))) : (-{(~^(8'hb6)), ((8'h9e) ? (8'hab) : (8'had))}))), 
parameter param157 = (~&param156))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(4'hf):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire155,
                 wire153,
                 wire38,
                 wire34,
                 wire6,
                 wire5,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
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
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire5 = $signed($signed((~|((!wire1) + {wire4, wire2}))));
  assign wire6 = (wire2[(2'h3):(2'h3)] ?
                     (wire2[(4'h9):(4'h9)] ?
                         ($unsigned($unsigned(wire1)) ?
                             $signed((wire0 ?
                                 (8'hbf) : wire5)) : wire4[(4'hd):(4'hd)]) : $signed($unsigned(wire3))) : wire4);
  always
    @(posedge clk) begin
      if ((!{wire5, wire4[(3'h4):(3'h4)]}))
        begin
          reg7 <= $signed($unsigned(wire0[(4'h9):(2'h3)]));
        end
      else
        begin
          if (wire3[(3'h6):(1'h1)])
            begin
              reg7 <= $signed((((wire3 >= (wire0 ~^ wire1)) >= wire5) ?
                  wire4 : $signed(wire3)));
            end
          else
            begin
              reg7 <= $signed(((((wire3 ? (8'ha1) : wire2) ?
                  wire0[(4'h9):(2'h3)] : wire6[(5'h12):(4'he)]) > wire5[(2'h2):(2'h2)]) > ($signed({(8'hbb)}) ?
                  {{(8'hb2)}, (&wire1)} : ((^reg7) ~^ wire1[(4'he):(3'h7)]))));
              reg8 <= ((!((|{wire1, wire5}) ?
                  $unsigned(((8'ha8) | wire5)) : $signed(wire0[(3'h7):(1'h1)]))) & (($signed(wire3[(1'h1):(1'h0)]) ?
                  ($unsigned(wire1) >= reg7) : ((wire6 ? wire6 : wire1) ?
                      (wire5 ?
                          (8'hb4) : wire3) : (-(8'ha8)))) ~^ (wire1[(2'h3):(2'h2)] ?
                  wire1 : $signed(wire1))));
              reg9 <= wire1;
              reg10 <= {reg8[(4'he):(4'ha)]};
              reg11 <= (|$signed((8'haf)));
            end
          reg12 <= {((8'ha5) ?
                  $signed((~(wire6 ? (8'ha1) : (8'hb2)))) : $unsigned(wire6))};
          if ((~^((((wire4 ^~ wire6) >>> $signed(reg11)) ?
              (reg9 >>> ((7'h43) & (8'ha8))) : ($signed(reg8) | reg9)) >>> $signed($signed($signed((8'h9f)))))))
            begin
              reg13 <= {wire4[(4'hb):(4'h8)]};
            end
          else
            begin
              reg13 <= wire5;
              reg14 <= {reg13};
            end
        end
      if ($signed(($signed(wire1[(4'hd):(3'h4)]) | {reg9[(3'h6):(2'h3)]})))
        begin
          if (reg12[(5'h13):(5'h10)])
            begin
              reg15 <= (8'ha6);
              reg16 <= reg11[(1'h1):(1'h1)];
              reg17 <= $unsigned({(($signed(reg9) ?
                      (wire5 << (8'hb2)) : (wire4 ?
                          reg12 : (8'ha2))) * reg11)});
              reg18 <= wire5;
            end
          else
            begin
              reg15 <= ((-(((wire4 ? wire3 : (8'hb1)) ?
                      (~(8'ha2)) : (!wire6)) && {(&reg11)})) ?
                  (!(~|reg12[(2'h2):(1'h0)])) : (-($signed($signed(reg17)) ?
                      $unsigned(wire6) : (8'haa))));
              reg16 <= $unsigned((reg12 ? reg8 : {{$unsigned(reg12)}, wire2}));
              reg17 <= ($unsigned(reg18[(5'h10):(2'h2)]) >>> ($unsigned($unsigned($signed(reg7))) >>> wire4[(1'h1):(1'h0)]));
              reg18 <= $unsigned($signed(reg12));
            end
          if ($signed(wire4[(4'ha):(1'h0)]))
            begin
              reg19 <= (wire4[(4'h9):(3'h4)] && $signed(reg16));
              reg20 <= $signed((8'hbc));
              reg21 <= {((8'ha4) ? $signed(reg9) : wire3[(5'h13):(1'h1)]),
                  $signed(reg12)};
              reg22 <= wire6;
              reg23 <= ((&$signed(reg9)) | (reg11[(1'h0):(1'h0)] != {($unsigned((8'ha6)) ?
                      wire5 : $signed(wire4))}));
            end
          else
            begin
              reg19 <= reg18[(2'h2):(1'h0)];
              reg20 <= {wire0[(4'hb):(4'ha)]};
              reg21 <= reg16[(4'h9):(4'h8)];
              reg22 <= reg11[(3'h4):(1'h0)];
            end
          if ($unsigned((((+reg18[(4'hc):(4'ha)]) <<< wire4[(4'h8):(3'h4)]) <= (wire3[(4'h9):(3'h5)] ?
              (~(reg14 > reg14)) : (reg17 ^ (reg13 ? reg20 : reg8))))))
            begin
              reg24 <= $signed((~&wire4[(4'he):(2'h2)]));
            end
          else
            begin
              reg24 <= {$signed((^~(reg9[(4'h9):(2'h2)] != (-reg18)))),
                  ($signed(reg7) << wire3)};
              reg25 <= reg12;
              reg26 <= (reg8 || (-wire6));
            end
          if ($unsigned(reg23[(1'h1):(1'h0)]))
            begin
              reg27 <= (8'hb9);
            end
          else
            begin
              reg27 <= $unsigned($unsigned($unsigned({(!wire6),
                  wire6[(5'h12):(1'h0)]})));
              reg28 <= $unsigned($unsigned($unsigned($unsigned((reg12 ?
                  reg16 : reg9)))));
              reg29 <= $signed(((&(~&reg23[(4'hc):(3'h4)])) <<< ({$signed(reg13),
                      $unsigned(reg10)} ?
                  ((^~reg16) ?
                      (~wire2) : (reg23 ?
                          (8'hb4) : wire0)) : reg15[(4'hb):(2'h2)])));
              reg30 <= $unsigned(reg23);
              reg31 <= (wire4[(4'h9):(2'h3)] ?
                  $signed($signed((!(reg13 - reg13)))) : (|(~^wire2[(3'h5):(1'h0)])));
            end
        end
      else
        begin
          if (reg23[(4'hb):(1'h0)])
            begin
              reg15 <= ($unsigned(reg11[(3'h4):(2'h3)]) ?
                  $signed($unsigned($unsigned($unsigned(reg13)))) : $unsigned((reg7[(4'h8):(3'h6)] ~^ reg14[(2'h2):(1'h0)])));
              reg16 <= reg20;
              reg17 <= (8'h9d);
              reg18 <= (reg28 >>> reg11);
            end
          else
            begin
              reg15 <= (~((~^$signed(reg30)) * reg25));
            end
          reg19 <= reg10;
          reg20 <= reg12[(4'h9):(4'h9)];
          reg21 <= (|(({{(8'h9f)},
                  reg15[(4'hb):(4'h9)]} + reg14[(1'h0):(1'h0)]) ?
              $unsigned(reg21) : wire5));
          reg22 <= {$signed({(reg12 ?
                      {reg16, reg15} : (wire0 ? (8'h9c) : reg28)),
                  wire2}),
              ($signed(reg10) ?
                  ((^$signed((8'ha7))) + reg13[(3'h6):(3'h6)]) : (~&($unsigned(reg26) ?
                      {reg24} : reg17)))};
        end
      reg32 <= (reg12 ? reg17 : wire1[(4'hd):(4'ha)]);
      reg33 <= (^((wire0 ?
              (reg24[(5'h12):(1'h0)] ? (~&reg10) : $signed((7'h40))) : wire5) ?
          $unsigned(reg12) : {(-(~&reg32))}));
    end
  assign wire34 = (reg29[(1'h0):(1'h0)] ^ $unsigned(($unsigned((8'h9f)) ?
                      $unsigned(reg10[(2'h2):(1'h1)]) : $signed(wire2[(2'h2):(1'h0)]))));
  always
    @(posedge clk) begin
      reg35 <= reg7;
      reg36 <= reg12[(4'hc):(3'h7)];
      reg37 <= reg8[(1'h0):(1'h0)];
    end
  assign wire38 = (|(!$unsigned(({reg12, wire0} < (reg19 ? reg37 : reg28)))));
  module39 #() modinst154 (.wire43(reg23), .wire40(reg7), .wire44(reg14), .wire42(reg22), .wire41(reg11), .y(wire153), .clk(clk));
  assign wire155 = $unsigned((&reg24));
endmodule

module module39  (y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire44;
  input wire [(5'h13):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  input wire [(4'h8):(1'h0)] wire41;
  input wire signed [(5'h12):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire150;
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  assign y = {wire152,
                 wire103,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire45,
                 wire105,
                 wire106,
                 wire107,
                 wire112,
                 wire150,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire45 = wire41;
  module46 #() modinst62 (wire61, clk, wire44, wire40, wire41, wire43);
  assign wire63 = (|$signed($signed(($signed(wire40) && wire42))));
  assign wire64 = (|$unsigned($unsigned(($signed((8'ha0)) <<< wire61))));
  assign wire65 = {$unsigned(($signed($unsigned((8'hb3))) && {wire61})),
                      $signed(((8'ha2) - ((&wire61) | $signed((8'hb5)))))};
  assign wire66 = $signed(wire42);
  assign wire67 = (&wire40[(1'h0):(1'h0)]);
  module68 #() modinst104 (wire103, clk, wire43, wire45, wire64, wire40, wire66);
  assign wire105 = (8'hb1);
  assign wire106 = $unsigned(wire43);
  assign wire107 = (((~|{$signed(wire67)}) == wire64) == wire64);
  always
    @(posedge clk) begin
      reg108 <= ((((-wire67[(5'h10):(3'h6)]) ?
              {wire45, wire45} : $signed(wire41)) ?
          $unsigned((wire41 ?
              (wire64 <= wire107) : $unsigned(wire45))) : wire65[(3'h5):(1'h1)]) ~^ wire42);
      reg109 <= wire43;
      reg110 <= (+wire107);
      reg111 <= {((($unsigned(wire66) ?
              (8'ha4) : {wire63}) | (~|wire43)) ~^ ($signed($unsigned(wire105)) & ({wire45,
              wire65} & $unsigned(wire42))))};
    end
  assign wire112 = (8'hbb);
  module113 #() modinst151 (wire150, clk, wire65, wire43, wire63, wire105, wire61);
  assign wire152 = $signed((~^(({wire106, (8'hbc)} + {wire67,
                       wire107}) * $unsigned(wire150))));
endmodule

module module113
#(parameter param149 = ({((((8'h9c) ^~ (8'ha2)) ? (~^(7'h42)) : {(8'ha3)}) ? (((8'hbf) ? (8'hbb) : (8'ha5)) * ((7'h42) ? (8'hb3) : (7'h44))) : {(-(8'ha4))})} ? ({(((7'h41) ? (7'h41) : (8'ha0)) >>> {(8'hae), (8'ha9)}), ((-(7'h43)) ? {(8'hae)} : (+(8'ha3)))} || ((!(8'haf)) * (((8'h9e) ? (7'h40) : (8'hb3)) + (8'ha0)))) : ((|{(~|(8'hb1))}) ? {(^~((8'hb3) ? (7'h41) : (8'ha5)))} : ((((8'hb0) + (8'h9d)) ? ((8'hb9) ? (8'hac) : (8'hac)) : ((8'ha2) - (8'hb4))) ^ (((8'hbb) ? (8'ha7) : (8'h9f)) + (8'ha2))))))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire118;
  input wire [(5'h11):(1'h0)] wire117;
  input wire signed [(5'h10):(1'h0)] wire116;
  input wire [(2'h2):(1'h0)] wire115;
  input wire signed [(4'he):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(2'h2):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire120,
                 wire119,
                 reg148,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire119 = wire115;
  assign wire120 = wire118[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg121 <= ($unsigned(wire116) ?
          (($signed(wire115[(2'h2):(2'h2)]) | $signed($unsigned(wire118))) ?
              ((wire117[(3'h6):(3'h5)] ~^ (wire115 ?
                  wire117 : wire117)) | (wire115[(1'h1):(1'h1)] ?
                  wire116[(4'he):(3'h6)] : (wire119 ?
                      wire120 : wire114))) : (-$signed($unsigned(wire114)))) : (wire115[(1'h0):(1'h0)] && (!(!((8'ha7) ?
              wire120 : wire120)))));
      if ((wire120[(5'h11):(2'h2)] - $unsigned((&$signed($signed(wire119))))))
        begin
          reg122 <= ((reg121 ? $signed(wire119) : {wire120, reg121}) ?
              $signed(reg121[(1'h0):(1'h0)]) : (((~&wire114) == $signed((reg121 ?
                      wire116 : (7'h44)))) ?
                  wire119[(2'h2):(1'h1)] : (wire118[(3'h7):(3'h4)] || $unsigned($unsigned(wire115)))));
          reg123 <= wire117[(4'he):(4'he)];
        end
      else
        begin
          reg122 <= $unsigned((^((|{wire116, (7'h44)}) ?
              wire116 : $signed({reg122, wire118}))));
          reg123 <= reg121;
          reg124 <= (|(wire117[(5'h10):(3'h4)] || (wire114[(4'h9):(1'h1)] != wire116)));
          reg125 <= $signed(wire119[(1'h1):(1'h1)]);
          reg126 <= $signed(((8'hb1) + reg122));
        end
    end
  assign wire127 = $unsigned($unsigned(wire116[(3'h7):(3'h6)]));
  assign wire128 = (8'hb8);
  assign wire129 = (($signed($signed($unsigned(wire116))) ^~ $signed(($signed(wire116) - (~|wire115)))) == ((~|wire115) ?
                       (($signed(reg122) || wire119) ?
                           ((|wire117) != $signed(wire116)) : wire119[(2'h2):(1'h0)]) : $unsigned($signed(reg122[(3'h5):(2'h2)]))));
  assign wire130 = {($unsigned({(^~wire114), (wire118 | reg125)}) ?
                           reg126[(4'h8):(2'h2)] : wire117[(2'h2):(1'h1)]),
                       (|((wire118 ?
                           (reg121 ? wire118 : wire128) : ((7'h40) ?
                               wire120 : wire129)) <= $unsigned($signed(wire119))))};
  assign wire131 = $unsigned((($signed((reg126 + (8'had))) ?
                           wire130 : $unsigned(wire115)) ?
                       (wire130[(4'h9):(4'h8)] ?
                           wire115[(1'h0):(1'h0)] : (~&wire117[(3'h7):(1'h1)])) : ($signed((wire118 && wire120)) <<< ((wire115 ?
                               (8'ha1) : wire114) ?
                           {reg124, wire118} : (8'hb7)))));
  assign wire132 = ({$signed($signed($signed(reg121))),
                           (wire115 << $signed((wire114 > wire120)))} ?
                       (reg126 > wire127[(3'h7):(3'h5)]) : $unsigned(($unsigned($unsigned((7'h42))) ?
                           ((8'hba) > $signed(reg124)) : reg121[(3'h6):(3'h6)])));
  assign wire133 = $unsigned($signed((^~((~&wire127) & wire118[(3'h7):(3'h5)]))));
  assign wire134 = (&wire116);
  always
    @(posedge clk) begin
      reg135 <= $unsigned((reg121[(3'h7):(1'h0)] && (((wire119 ?
          reg123 : reg122) << (8'ha0)) ^~ wire132[(4'hc):(3'h5)])));
      reg136 <= {wire120};
      reg137 <= (({{(8'hbb)}} ?
          wire114 : {$unsigned(reg124[(1'h1):(1'h0)]),
              (reg125 == (wire133 ?
                  wire129 : wire117))}) >> (($signed(((8'hb0) ?
                  reg125 : wire131)) ?
              (&(+wire132)) : ((8'ha8) - {reg126, reg121})) ?
          $unsigned(((8'ha2) || ((8'h9c) ^ wire130))) : $unsigned({(reg124 == wire129),
              (7'h42)})));
      reg138 <= (!({$signed({(8'hae)}),
          $unsigned($unsigned(reg122))} >= wire128[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      if (wire132[(4'h8):(3'h6)])
        begin
          reg139 <= wire114[(2'h3):(2'h3)];
          reg140 <= $signed((+($unsigned((reg126 == wire117)) ?
              $unsigned($unsigned(wire133)) : {(wire128 <<< wire133),
                  (wire129 ? reg125 : wire131)})));
          reg141 <= (wire133 ?
              ($unsigned($unsigned($signed(wire134))) <= (reg140[(3'h6):(2'h2)] ^~ (8'hab))) : $unsigned(((^$signed(wire127)) ?
                  (!reg135[(1'h1):(1'h0)]) : {reg137})));
        end
      else
        begin
          reg139 <= ($signed((wire118[(1'h0):(1'h0)] <= (reg138 ?
              {wire130} : wire131[(2'h2):(1'h0)]))) << $unsigned((7'h43)));
        end
    end
  assign wire142 = ((~(reg123 ?
                           {$unsigned(wire127),
                               $unsigned(reg122)} : ($unsigned((7'h41)) ?
                               (reg138 ? reg124 : reg136) : {wire116}))) ?
                       $signed({reg136}) : reg123);
  assign wire143 = reg139[(4'hc):(2'h2)];
  assign wire144 = {(~|(reg126[(4'h8):(3'h4)] ?
                           $unsigned($signed((8'hb2))) : $unsigned((reg124 || reg141))))};
  assign wire145 = {reg126};
  assign wire146 = reg126;
  assign wire147 = ($unsigned(({$signed(wire131)} ?
                           (!reg123[(4'h9):(4'h9)]) : $signed({reg140,
                               reg138}))) ?
                       (wire120 >> reg124) : ((reg136[(4'h8):(1'h1)] - ((reg141 << wire134) ?
                               reg140 : reg135)) ?
                           ((wire114[(4'hc):(3'h5)] != reg139[(5'h12):(4'ha)]) ?
                               (wire130[(3'h4):(2'h2)] >> (wire119 ?
                                   wire146 : (8'hb4))) : $unsigned((|wire127))) : wire128[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      reg148 <= $signed(wire116);
    end
endmodule

module module68
#(parameter param102 = (~^((8'hbb) | ((!{(7'h44), (8'ha6)}) - (((8'ha4) ? (8'ha5) : (8'hb1)) ? {(8'hb8)} : {(8'ha7)})))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire73;
  input wire signed [(4'he):(1'h0)] wire72;
  input wire [(5'h14):(1'h0)] wire71;
  input wire [(5'h12):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(4'ha):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg96,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= ($unsigned(wire73) <<< (^~(+wire71[(5'h10):(4'he)])));
      if ((wire71 ?
          ($signed(wire72[(1'h0):(1'h0)]) ? wire71 : wire69) : wire71))
        begin
          if ($signed(wire73[(1'h0):(1'h0)]))
            begin
              reg75 <= wire73[(2'h2):(1'h1)];
              reg76 <= ((^~$unsigned((wire69 >= (reg74 ?
                  (8'hbb) : wire71)))) - $unsigned((!reg74)));
            end
          else
            begin
              reg75 <= wire72[(3'h6):(2'h2)];
              reg76 <= wire73;
              reg77 <= ($unsigned((~&reg76[(4'h8):(3'h5)])) ?
                  ((wire69[(4'he):(4'hb)] >= (-wire69)) <<< (wire72[(3'h6):(1'h0)] ?
                      ({wire70,
                          wire72} ~^ $unsigned(wire71)) : {wire73[(1'h1):(1'h0)]})) : (&(((reg74 * (7'h43)) ?
                      $signed((8'hb9)) : wire69) ^ {$signed((8'h9d))})));
            end
          reg78 <= $signed((!wire73));
          reg79 <= (~(wire71 + (^(~&$unsigned(reg74)))));
        end
      else
        begin
          reg75 <= $unsigned($signed((reg79[(3'h4):(2'h3)] + reg75)));
          if (($unsigned(wire71) <= (!$signed(reg75[(2'h2):(1'h1)]))))
            begin
              reg76 <= $signed({wire70});
              reg77 <= reg75[(1'h0):(1'h0)];
              reg78 <= ((^$unsigned((~^$unsigned(reg77)))) ?
                  {$unsigned(wire70[(2'h3):(2'h2)])} : wire70[(4'hd):(3'h7)]);
              reg79 <= (~|(~&$unsigned({(8'hb3), wire71})));
              reg80 <= $signed($unsigned((reg74[(3'h6):(2'h2)] ?
                  {reg76[(1'h1):(1'h0)]} : wire73)));
            end
          else
            begin
              reg76 <= $signed(wire73[(2'h2):(1'h0)]);
              reg77 <= reg75[(3'h6):(1'h1)];
              reg78 <= ((wire71 ?
                      reg80[(4'h9):(3'h5)] : ((8'hbd) ?
                          (reg78 ?
                              (reg79 ^~ wire70) : $unsigned(wire73)) : (reg79 ?
                              (reg79 ? reg74 : reg77) : reg79))) ?
                  ((8'hb4) ?
                      $signed((~&reg79[(4'ha):(2'h3)])) : (reg77[(1'h1):(1'h0)] > $unsigned(reg78))) : reg77[(1'h1):(1'h0)]);
              reg79 <= wire69;
              reg80 <= $signed(wire70);
            end
          reg81 <= $unsigned($signed((~&($unsigned(reg78) ?
              {reg79, reg80} : reg76[(3'h6):(1'h1)]))));
          reg82 <= {(8'hac),
              (reg75 ?
                  ({{(8'hb5)}} ?
                      reg81 : $signed((wire73 ?
                          wire71 : (8'hbd)))) : (|(|wire70[(2'h3):(2'h3)])))};
        end
      if ((wire70 == $unsigned((~|reg81))))
        begin
          reg83 <= $signed(({(~&reg76[(2'h2):(1'h0)])} ?
              (($unsigned(reg81) ?
                      reg74[(4'hc):(1'h1)] : ((8'hac) >>> wire72)) ?
                  ($unsigned(wire69) ?
                      wire69 : (reg81 <= reg78)) : (|((8'ha6) - reg78))) : {((reg80 >= reg75) ~^ reg74)}));
          reg84 <= (reg77 ?
              ($unsigned((-reg81[(2'h2):(2'h2)])) ?
                  ($unsigned($unsigned(wire70)) < (^reg81[(3'h6):(1'h1)])) : wire73[(1'h0):(1'h0)]) : (-$unsigned((!$signed(reg81)))));
          if ($unsigned(reg79[(3'h6):(3'h4)]))
            begin
              reg85 <= ((~reg82) ?
                  ((~&$signed((reg78 >>> reg84))) ?
                      (reg75 ^ ((reg78 ? reg77 : reg82) ?
                          (wire70 <= (7'h43)) : wire73)) : $unsigned(wire72)) : (reg75[(2'h2):(2'h2)] || (wire71[(4'h9):(3'h7)] ?
                      wire71 : $signed($signed(reg79)))));
              reg86 <= $signed((($signed(reg81) ^ ((reg78 ^ wire71) ?
                      reg81[(2'h3):(2'h2)] : $unsigned((8'hb1)))) ?
                  $unsigned($unsigned((wire72 ?
                      wire69 : wire71))) : wire73[(1'h1):(1'h0)]));
              reg87 <= {$signed(reg82), wire71[(5'h10):(4'hf)]};
              reg88 <= $unsigned(($unsigned(wire72[(4'hd):(3'h5)]) << {$unsigned((reg80 & reg78)),
                  (~&(reg87 ? reg81 : reg80))}));
              reg89 <= ((reg79[(3'h4):(2'h2)] ?
                  reg84 : wire70) >> $unsigned(reg83[(3'h4):(2'h3)]));
            end
          else
            begin
              reg85 <= (-(((~{reg80, reg83}) & ($unsigned(reg84) < {reg83,
                      reg76})) ?
                  (((~reg80) ?
                      (wire70 ?
                          (8'ha6) : reg88) : wire69[(2'h2):(1'h0)]) * reg87[(3'h7):(3'h7)]) : {(~&$unsigned(reg76)),
                      ((!reg79) ? reg76 : (reg77 ? wire72 : reg74))}));
              reg86 <= reg84[(4'hd):(2'h3)];
              reg87 <= wire73;
            end
        end
      else
        begin
          reg83 <= $signed((((wire71 | (reg78 ?
              reg79 : reg82)) + wire70) != reg77));
          reg84 <= ($unsigned(($signed($unsigned(reg74)) ^~ $unsigned(reg89[(4'hc):(2'h2)]))) < (~^wire70));
          reg85 <= ($signed(($unsigned($unsigned(reg76)) ?
                  (wire70[(1'h1):(1'h0)] ?
                      $signed((8'had)) : $unsigned(reg81)) : $signed(reg80[(4'h9):(4'h9)]))) ?
              (reg84 << (~|($signed(reg88) ?
                  $signed((8'ha1)) : wire72))) : reg77[(2'h3):(2'h3)]);
          reg86 <= $unsigned(reg78);
          reg87 <= $signed(reg82[(1'h0):(1'h0)]);
        end
      if ($signed((($signed({(8'ha7)}) ?
              ($unsigned(reg81) ? (reg84 < reg87) : reg82) : (|((8'ha5) ?
                  (8'h9d) : reg84))) ?
          ((~&(^~reg79)) <<< $unsigned((reg80 > reg77))) : $signed($unsigned((wire70 * reg88))))))
        begin
          reg90 <= $unsigned((&reg86));
          if ((!wire70))
            begin
              reg91 <= (((-$signed((&reg76))) ? reg84[(4'hb):(2'h2)] : wire69) ?
                  reg87[(3'h6):(2'h2)] : $signed((^(&$signed(reg75)))));
              reg92 <= (8'hbb);
              reg93 <= $signed({(^($signed(wire72) ?
                      (&reg86) : $signed(reg86))),
                  ({$signed(reg87),
                      $unsigned(reg76)} <= $unsigned($signed(reg86)))});
            end
          else
            begin
              reg91 <= (-((reg75 ? $unsigned((reg92 ? reg83 : reg85)) : reg80) ?
                  reg83 : $unsigned((((8'h9f) ~^ (8'hb1)) ^~ (!(8'haa))))));
              reg92 <= (($signed((|$signed(reg84))) ?
                      $unsigned((^~(!reg91))) : $signed(reg88[(3'h5):(3'h4)])) ?
                  $signed(({$unsigned((8'hbf)),
                      ((8'hb2) ?
                          (8'hbf) : reg82)} ~^ $signed((+reg85)))) : (({{reg84},
                          {(8'ha2), (8'ha9)}} ?
                      (8'hba) : $signed(reg78)) > wire70[(5'h10):(4'hf)]));
              reg93 <= wire69;
              reg94 <= (8'had);
              reg95 <= ($signed(reg86) >>> reg88[(4'ha):(1'h1)]);
            end
          reg96 <= $signed($unsigned($signed(wire70)));
        end
      else
        begin
          if (reg79)
            begin
              reg90 <= (^reg75[(3'h5):(1'h0)]);
            end
          else
            begin
              reg90 <= ((+reg90[(4'hf):(3'h5)]) ?
                  ({((~^wire71) ? {wire73} : reg79), ((+reg77) <= reg88)} ?
                      (^~((~^reg77) ~^ reg74[(4'hf):(4'hd)])) : reg79[(2'h3):(1'h1)]) : (~|(-reg94)));
              reg91 <= (&wire71);
              reg92 <= reg83[(2'h2):(2'h2)];
            end
          reg93 <= (~|((^~(+reg81)) << $signed((^(wire72 ? reg77 : reg87)))));
          reg94 <= reg96[(2'h2):(1'h1)];
        end
    end
  assign wire97 = $unsigned(reg76);
  assign wire98 = (&(($unsigned((reg79 ?
                      reg92 : (8'hae))) >>> reg94) != reg94[(1'h0):(1'h0)]));
  assign wire99 = {$signed(reg83[(2'h3):(1'h0)]),
                      (~({((8'hab) ?
                              (8'hbb) : wire73)} << (reg94[(1'h0):(1'h0)] ^~ {reg86})))};
  assign wire100 = $signed((reg84 ?
                       ($signed(wire71[(4'he):(4'he)]) >= wire73) : {$unsigned(reg83[(3'h4):(1'h0)])}));
  assign wire101 = (-$signed(reg92[(1'h1):(1'h0)]));
endmodule

module module46  (y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire50;
  input wire [(4'h9):(1'h0)] wire49;
  input wire [(4'h8):(1'h0)] wire48;
  input wire [(4'hb):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire [(2'h3):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 (1'h0)};
  assign wire51 = {wire48[(4'h8):(4'h8)], wire50[(3'h6):(3'h4)]};
  assign wire52 = (+(^wire50));
  assign wire53 = wire47[(1'h0):(1'h0)];
  assign wire54 = wire47[(1'h1):(1'h1)];
  assign wire55 = $unsigned($signed(wire48[(3'h7):(1'h1)]));
  assign wire56 = $unsigned(($unsigned(({wire55} ?
                      (^~(8'h9e)) : $signed(wire51))) || {wire50[(3'h4):(2'h2)],
                      $signed({wire48})}));
  assign wire57 = wire47;
  assign wire58 = (~|$unsigned(((wire47 >= (wire57 * wire51)) ?
                      {(wire55 <<< wire49),
                          {wire48, wire49}} : wire51[(5'h11):(5'h10)])));
  assign wire59 = $unsigned($signed(wire51[(4'hd):(3'h4)]));
  assign wire60 = (wire51[(5'h11):(4'he)] <= (((-$unsigned(wire47)) ?
                          ($unsigned(wire52) == (&wire51)) : $signed((wire55 || wire56))) ?
                      (~&wire58[(2'h3):(1'h1)]) : $signed((wire54[(2'h2):(1'h0)] & wire54[(3'h7):(3'h4)]))));
endmodule

module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire14;
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(3'h5):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire134,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 wire14,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
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
                 reg133,
                 reg132,
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
                 reg121,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire1[(4'ha):(1'h1)] > wire2[(3'h6):(3'h6)]);
      if ((~^($signed(wire2[(3'h6):(1'h0)]) << (wire0[(2'h3):(2'h3)] >= ($unsigned(wire2) ?
          reg4 : (wire0 << reg4))))))
        begin
          reg5 <= (~&wire0);
          if (((+wire2[(3'h5):(3'h4)]) - reg5))
            begin
              reg6 <= ($unsigned((+(-(~&wire2)))) ?
                  wire3 : (~|$unsigned($signed($unsigned(reg4)))));
              reg7 <= (~^((((!wire2) ? reg6 : wire3[(2'h2):(1'h1)]) ?
                  $unsigned($signed(wire3)) : wire0) << $unsigned((|reg6))));
              reg8 <= (^((&(~&(8'hbe))) << (|{(reg6 ? reg5 : (8'ha7))})));
            end
          else
            begin
              reg6 <= wire1;
              reg7 <= $unsigned(wire1);
            end
          reg9 <= $signed(reg5[(3'h4):(1'h0)]);
          if ((&wire2[(3'h6):(2'h3)]))
            begin
              reg10 <= (reg8 ?
                  reg6 : ((wire3[(1'h0):(1'h0)] >= reg9[(1'h1):(1'h1)]) ^~ $signed((8'hab))));
              reg11 <= ((~|reg9) ?
                  (-(wire0[(3'h5):(1'h0)] ?
                      wire3[(2'h2):(1'h0)] : ((8'ha1) ?
                          (reg5 ? reg9 : wire3) : $signed(wire2)))) : reg4);
              reg12 <= wire1;
            end
          else
            begin
              reg10 <= $signed($signed($unsigned((wire1[(4'h8):(2'h3)] != $signed(reg8)))));
            end
        end
      else
        begin
          reg5 <= $unsigned((wire3[(2'h2):(1'h0)] <<< $signed({reg7})));
          reg6 <= $signed({reg4,
              ($signed((~&reg5)) ?
                  reg11[(2'h3):(2'h3)] : (reg11 >= ((8'ha6) <<< reg4)))});
          reg7 <= (~{{reg9, ((8'hb5) != {reg8})}});
          reg8 <= {wire0,
              ((!($signed(wire0) ? reg5[(3'h4):(2'h3)] : (wire3 | reg11))) ?
                  $unsigned(((wire1 ? reg4 : reg12) ?
                      (^reg9) : (reg8 > (8'hab)))) : ($unsigned(wire1[(4'h9):(4'h9)]) ?
                      (8'hbb) : $unsigned(wire2[(1'h0):(1'h0)])))};
        end
      reg13 <= ((!({$signed(reg5)} && (~^wire3[(1'h0):(1'h0)]))) ?
          (~|reg7[(4'h9):(4'h9)]) : reg4[(2'h2):(1'h0)]);
    end
  assign wire14 = reg8;
  module15 #() modinst116 (wire115, clk, wire2, reg5, reg10, wire14, reg12);
  assign wire117 = $unsigned((|$unsigned((wire2 >> wire0[(1'h1):(1'h0)]))));
  assign wire118 = reg6[(3'h6):(3'h4)];
  assign wire119 = (wire115[(2'h3):(2'h2)] || $signed($signed(reg13[(2'h2):(1'h0)])));
  assign wire120 = $signed($unsigned(($unsigned(((8'ha5) ?
                       wire1 : reg7)) ~^ $signed(wire118[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg121 <= wire119;
      reg122 <= $signed((^~{$unsigned(((8'hb1) * reg12))}));
      if (reg9[(3'h7):(3'h6)])
        begin
          reg123 <= reg5[(3'h6):(3'h6)];
          if ($signed($signed(($unsigned((wire120 - reg121)) ?
              ({wire0} || $unsigned(wire1)) : {wire0}))))
            begin
              reg124 <= $unsigned(wire119);
            end
          else
            begin
              reg124 <= (&wire119[(2'h2):(2'h2)]);
              reg125 <= wire3[(1'h0):(1'h0)];
              reg126 <= ((^({(reg5 <<< reg10)} ?
                      wire120[(4'hf):(4'hd)] : $signed($unsigned(wire2)))) ?
                  $signed(wire2[(4'hb):(2'h2)]) : ({(&{wire120})} && ((wire14 < reg6[(3'h5):(1'h1)]) ?
                      wire3 : (!(^~wire118)))));
              reg127 <= $signed({((wire0 ?
                          wire1[(4'h8):(3'h7)] : $signed(reg6)) ?
                      $unsigned((reg121 ?
                          reg8 : (8'hb1))) : $unsigned($unsigned(reg124)))});
            end
          if (wire0[(4'hb):(4'h8)])
            begin
              reg128 <= wire3;
              reg129 <= $signed((reg11 ?
                  $unsigned((~|$signed(wire3))) : reg5[(4'ha):(3'h7)]));
              reg130 <= $unsigned(reg8);
              reg131 <= reg130;
              reg132 <= ((({(&wire0)} ?
                      $signed((reg124 ? reg12 : wire117)) : {(reg126 & wire115),
                          (8'hb9)}) ?
                  reg125[(3'h5):(2'h3)] : $unsigned((^(~wire0)))) * (8'hb2));
            end
          else
            begin
              reg128 <= reg127[(4'hb):(4'hb)];
            end
          reg133 <= reg125;
        end
      else
        begin
          reg123 <= $signed(($signed(reg8) <<< (~^$signed($unsigned(reg132)))));
          reg124 <= ((^wire119) & (~&$unsigned({(~reg7), (reg4 + reg121)})));
          reg125 <= $unsigned(wire120);
          reg126 <= ($signed(($unsigned(reg128[(3'h6):(3'h6)]) ?
              $unsigned((reg10 ? reg4 : wire120)) : ((wire1 ^~ reg128) ?
                  (wire2 ?
                      wire1 : wire115) : $signed(reg126)))) > ((((~&(8'hb2)) ?
              (~^reg8) : (~^wire117)) ^ $unsigned((~&reg5))) == (((8'hbf) ?
              $unsigned(reg12) : ((8'hae) ^ reg126)) ~^ reg13)));
        end
    end
  assign wire134 = {($unsigned($unsigned((^reg127))) || $unsigned((~^$signed(wire14))))};
  always
    @(posedge clk) begin
      reg135 <= wire3[(1'h1):(1'h1)];
      reg136 <= $signed((&{(8'hb0)}));
      if ($unsigned(wire117))
        begin
          reg137 <= reg128[(1'h1):(1'h1)];
          reg138 <= $unsigned($unsigned($unsigned(reg135)));
          if ($signed($signed(((wire120[(2'h2):(1'h1)] ?
                  $unsigned(reg5) : (8'hb2)) ?
              {{reg6, reg133}, (reg128 * reg10)} : (^$signed(wire118))))))
            begin
              reg139 <= (reg138[(5'h14):(4'h8)] ?
                  (8'ha6) : {reg6[(3'h7):(3'h6)]});
              reg140 <= reg122;
              reg141 <= wire2;
            end
          else
            begin
              reg139 <= (~^(($unsigned($signed((8'ha1))) ?
                  (~$signed(reg136)) : ((!wire115) < reg137[(3'h5):(1'h0)])) << (&((reg11 ?
                  (7'h40) : wire1) ^~ (wire117 << reg128)))));
            end
          if (reg5)
            begin
              reg142 <= reg137[(3'h6):(2'h2)];
            end
          else
            begin
              reg142 <= $unsigned(reg135[(1'h0):(1'h0)]);
              reg143 <= reg122;
              reg144 <= ($signed($signed(($signed((8'hb6)) ^~ $unsigned((8'hb4))))) ?
                  (($unsigned((~&(8'h9e))) ?
                      $signed({reg8}) : reg5[(3'h4):(2'h3)]) <<< $signed((reg13[(1'h1):(1'h0)] * (+wire120)))) : (reg126 || $signed({wire118[(2'h2):(1'h0)],
                      reg139})));
              reg145 <= (~&$unsigned({((wire115 == wire14) <= {reg135,
                      (8'hb4)}),
                  reg137}));
            end
        end
      else
        begin
          if (($unsigned(reg142) ^~ $unsigned((!{$signed(reg141),
              (wire117 ? (7'h42) : wire117)}))))
            begin
              reg137 <= wire117[(2'h2):(1'h0)];
              reg138 <= reg4[(4'ha):(3'h4)];
              reg139 <= ($unsigned(wire118[(1'h1):(1'h1)]) ?
                  reg131 : ((reg136 ?
                      $unsigned((reg127 ?
                          reg140 : reg127)) : reg136[(2'h2):(2'h2)]) || ($unsigned($signed((8'hb9))) * ((wire1 && wire119) ^~ $unsigned(reg122)))));
              reg140 <= (~reg141);
              reg141 <= reg139;
            end
          else
            begin
              reg137 <= reg138[(4'he):(3'h4)];
            end
          reg142 <= ((reg133[(2'h2):(1'h1)] | (8'h9c)) < ({reg10[(3'h6):(1'h0)]} << ((reg133 - wire0[(4'hc):(4'ha)]) && (reg123 ?
              {reg6, reg6} : $unsigned((7'h41))))));
          reg143 <= reg138;
        end
      if (reg139[(1'h0):(1'h0)])
        begin
          reg146 <= $signed({($unsigned(reg11) ?
                  reg137[(2'h3):(1'h0)] : $signed((^~reg132))),
              (8'h9f)});
          reg147 <= $unsigned(((+$unsigned($unsigned(reg136))) <<< reg136));
          reg148 <= $signed({(!((|reg123) ^~ (reg144 ? reg4 : wire115))),
              $unsigned(($signed(reg122) ? reg133 : (reg129 <<< reg143)))});
          reg149 <= (~^reg131[(1'h0):(1'h0)]);
        end
      else
        begin
          reg146 <= (-$signed({$unsigned($signed((8'hba))), wire118}));
          reg147 <= {((&(8'h9d)) != (reg125 << ((wire134 + reg128) ?
                  (reg122 ? wire134 : (8'ha4)) : reg148)))};
          if (($signed((!$signed(reg123[(2'h3):(2'h2)]))) ^ ((7'h42) ?
              $unsigned((reg131[(1'h0):(1'h0)] ^ (wire118 ~^ reg138))) : ($unsigned(reg131[(1'h1):(1'h0)]) ?
                  (&{reg12, reg4}) : $unsigned((+reg11))))))
            begin
              reg148 <= (+$unsigned(($signed(wire0[(2'h2):(1'h1)]) < $signed($unsigned((8'ha3))))));
              reg149 <= reg137[(2'h3):(1'h0)];
              reg150 <= ({(|(&$unsigned(reg7)))} ?
                  $signed((((+reg13) ?
                          $signed(reg135) : reg123[(1'h0):(1'h0)]) ?
                      (8'hb5) : ((reg130 + reg10) || reg132[(5'h10):(3'h6)]))) : (({(~&reg127),
                          reg131[(1'h0):(1'h0)]} ?
                      reg135 : $signed($unsigned(wire0))) != (~&(7'h40))));
              reg151 <= wire3;
            end
          else
            begin
              reg148 <= reg11[(4'h9):(3'h4)];
            end
          reg152 <= (wire2 - ({({reg137} ?
                      (reg11 ? reg146 : reg141) : $unsigned(wire118)),
                  $signed($signed(reg4))} ?
              reg121[(4'h8):(1'h0)] : $unsigned(((-reg144) - $signed(reg11)))));
          reg153 <= wire117;
        end
      if ({reg125})
        begin
          reg154 <= reg142;
          if (reg138)
            begin
              reg155 <= reg143;
              reg156 <= (-(wire1 >>> (reg154[(3'h5):(2'h3)] ?
                  (((8'h9c) == reg143) ?
                      wire134 : (reg153 * reg136)) : (-wire118))));
              reg157 <= reg141;
              reg158 <= (&$signed((^(!((8'haf) == reg156)))));
              reg159 <= ({reg13[(1'h1):(1'h0)]} <<< (~^((~|(!reg122)) > reg143[(1'h0):(1'h0)])));
            end
          else
            begin
              reg155 <= {(^{(wire14[(3'h6):(1'h1)] >= $unsigned(reg12))}),
                  $signed($signed($unsigned(reg159)))};
              reg156 <= $unsigned((8'h9d));
            end
          if ({$signed(wire14[(2'h3):(2'h3)]), wire1[(5'h13):(2'h3)]})
            begin
              reg160 <= reg138;
              reg161 <= wire0;
              reg162 <= reg128;
              reg163 <= {$signed({$unsigned($signed(wire0))}), reg6};
            end
          else
            begin
              reg160 <= $signed(reg159);
              reg161 <= (reg123[(3'h5):(3'h4)] ?
                  $unsigned(($signed(reg143[(3'h4):(2'h2)]) ~^ $unsigned($signed(reg148)))) : (~&(reg152[(2'h3):(2'h2)] ?
                      (reg127 & (!reg143)) : wire117)));
              reg162 <= (reg13 >>> $unsigned((8'h9e)));
              reg163 <= $unsigned((reg145 * $signed(reg137)));
              reg164 <= (reg151[(1'h1):(1'h0)] < (&{$signed(reg132)}));
            end
          reg165 <= (8'had);
        end
      else
        begin
          if (reg129[(4'h9):(3'h7)])
            begin
              reg154 <= wire119[(2'h3):(2'h3)];
              reg155 <= reg165[(3'h5):(3'h4)];
              reg156 <= reg148[(3'h7):(3'h5)];
              reg157 <= ($signed($signed(($signed(reg124) ?
                  (reg130 ?
                      reg124 : reg122) : reg154[(4'hc):(2'h2)]))) | ((reg131 | {(reg129 | reg131),
                  (reg154 ? reg129 : reg122)}) || {wire1[(4'he):(4'he)],
                  {reg132}}));
            end
          else
            begin
              reg154 <= $signed(reg129);
            end
        end
    end
endmodule

module module15
#(parameter param114 = (({(8'ha5), {(~&(8'had)), ((8'ha2) ? (8'ha5) : (8'had))}} ? ((((8'hba) ~^ (8'hab)) ? ((8'hbe) ? (8'ha6) : (8'hac)) : (&(8'hb1))) < {(~(8'hbc))}) : ((~&{(8'hbc)}) ? (^~((8'haf) ? (8'hbc) : (8'haf))) : (8'hb6))) ? ((8'hb5) >= (8'haf)) : (~|(+(~&(8'hbc))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire signed [(4'he):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire21;
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire96,
                 wire66,
                 wire64,
                 wire21,
                 (1'h0)};
  assign wire21 = wire20;
  module22 #() modinst65 (.clk(clk), .wire26(wire18), .wire25(wire19), .wire24(wire16), .wire23(wire20), .y(wire64));
  assign wire66 = wire64;
  module67 #() modinst97 (wire96, clk, wire17, wire16, wire19, wire18);
  module98 #() modinst110 (wire109, clk, wire20, wire16, wire21, wire64);
  assign wire111 = $signed(wire109[(1'h0):(1'h0)]);
  assign wire112 = wire96[(2'h3):(1'h0)];
  assign wire113 = $unsigned(wire111[(3'h6):(3'h5)]);
endmodule

module module98
#(parameter param107 = {((({(8'hbf), (8'hac)} - ((8'hb7) <= (8'ha1))) || (((8'hb4) - (8'hb6)) >> {(7'h44)})) ? ((^~(!(8'ha0))) ? ({(8'hb9), (8'hb7)} ? {(8'hb2)} : {(8'ha7), (8'hae)}) : ((+(8'hba)) ? ((7'h40) < (8'hb6)) : ((8'hb0) | (8'hab)))) : (~&{(~^(8'haf)), {(8'hbc)}}))}, 
parameter param108 = param107)
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire102;
  input wire [(4'hb):(1'h0)] wire101;
  input wire [(4'hb):(1'h0)] wire100;
  input wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire103;
  assign y = {wire106, wire105, wire104, wire103, (1'h0)};
  assign wire103 = $signed((wire100[(1'h0):(1'h0)] ?
                       (~&wire101[(3'h4):(1'h1)]) : wire101[(3'h4):(2'h2)]));
  assign wire104 = ((((wire101[(4'ha):(1'h1)] ^ (wire102 + wire101)) ?
                           wire100 : $signed($unsigned(wire99))) ^~ (8'haf)) ?
                       wire101[(4'h9):(4'h9)] : (8'h9e));
  assign wire105 = {($signed($signed({wire99, wire103})) ^~ (($signed(wire100) ?
                               wire100 : $signed(wire100)) ?
                           wire104[(5'h11):(3'h7)] : $signed(wire104[(4'hc):(3'h6)])))};
  assign wire106 = ($unsigned(({$unsigned((8'ha9)), (|wire104)} ?
                           (wire99 >= (wire103 ?
                               wire101 : wire104)) : ((wire101 & wire99) ?
                               (wire103 ? wire99 : wire104) : (8'ha3)))) ?
                       $signed(($signed((wire104 ?
                           wire104 : wire102)) > {$signed(wire104),
                           (^~wire100)})) : ((wire105 ?
                           wire102[(3'h4):(1'h1)] : (~|$unsigned(wire105))) <<< {($signed(wire103) && wire105),
                           $unsigned((^~wire103))}));
endmodule

module module67  (y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire71;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire [(3'h5):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire74,
                 wire73,
                 wire72,
                 reg86,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire72 = ({((wire68[(1'h0):(1'h0)] ?
                              (wire69 << wire70) : $unsigned(wire68)) ?
                          wire70 : {(^~wire69)}),
                      (wire71[(1'h1):(1'h1)] == ((wire69 ? wire71 : wire68) ?
                          (wire71 < wire70) : wire71))} | (wire71[(3'h6):(2'h3)] ?
                      wire68[(3'h4):(2'h2)] : ($signed({(8'ha8)}) ?
                          {(wire70 + (8'h9f))} : $signed((wire70 ?
                              wire70 : wire68)))));
  assign wire73 = $unsigned($unsigned($unsigned(wire70)));
  assign wire74 = ((($unsigned((wire69 ? wire69 : wire70)) ?
                              (|(wire73 < wire73)) : $unsigned($unsigned(wire71))) ?
                          ($unsigned({wire73, (8'ha6)}) <<< wire72) : wire71) ?
                      $unsigned(wire68[(2'h2):(1'h0)]) : {wire73,
                          {{(wire70 < wire72)},
                              ((wire70 ? wire73 : wire71) > wire71)}});
  always
    @(posedge clk) begin
      reg75 <= (((wire73[(4'h9):(4'h9)] ?
              wire70 : ((^~wire71) ?
                  wire70[(2'h2):(2'h2)] : $signed(wire73))) >= (wire68 ?
              ($unsigned(wire73) ? wire71 : $unsigned(wire68)) : (~(wire73 ?
                  wire71 : wire72)))) ?
          (wire71[(3'h5):(3'h4)] ^~ {(^$signed((7'h43)))}) : (|((wire71[(2'h2):(1'h0)] ?
              (8'hb1) : (wire68 ? wire68 : wire69)) || $signed((wire73 ?
              wire68 : wire73)))));
      reg76 <= $signed(wire70[(1'h1):(1'h1)]);
      reg77 <= (($unsigned((^~$unsigned(wire73))) ~^ $signed((8'ha7))) ?
          wire73[(2'h3):(2'h3)] : (wire68 & ((!$unsigned(wire73)) ?
              ($unsigned(wire68) <<< wire74) : $signed(((8'hab) ^ wire71)))));
    end
  assign wire78 = wire68;
  assign wire79 = (reg75 ?
                      (~&(reg76[(4'hc):(2'h3)] ?
                          $unsigned($unsigned((8'ha3))) : ((wire68 ?
                                  (8'hbf) : reg76) ?
                              wire74[(4'hb):(3'h5)] : (~|(8'hb1))))) : {(~|wire72)});
  assign wire80 = ((($unsigned((wire79 || wire78)) ?
                      {(wire74 ?
                              (8'hbf) : wire78)} : wire68) <<< (~$signed((8'h9e)))) << reg75);
  assign wire81 = (($unsigned(wire68[(1'h0):(1'h0)]) ^~ wire68[(1'h0):(1'h0)]) > {(wire79 ?
                          ((~|(8'hab)) & (wire79 ?
                              wire73 : (8'ha0))) : (-$signed(wire69)))});
  assign wire82 = (reg77 >>> wire81[(1'h1):(1'h1)]);
  assign wire83 = wire78;
  assign wire84 = $signed((^((wire74 >= (wire69 ^ reg77)) && (~((8'ha0) ~^ wire70)))));
  assign wire85 = $signed((~^wire80));
  always
    @(posedge clk) begin
      reg86 <= wire79;
    end
  assign wire87 = $signed((wire81 ?
                      $unsigned(($unsigned(wire69) > {wire70})) : $signed(($signed(wire74) ?
                          (^wire80) : (~^wire70)))));
  assign wire88 = wire84[(4'h8):(1'h0)];
  assign wire89 = (!(^~reg77[(1'h0):(1'h0)]));
  assign wire90 = $signed($signed((&(reg76 ^ (wire74 <<< wire74)))));
  assign wire91 = wire79;
  assign wire92 = $signed($signed($unsigned(wire74)));
  assign wire93 = reg86;
  assign wire94 = (wire91[(4'hc):(4'ha)] ?
                      $signed($unsigned((+$unsigned((8'ha5))))) : ((8'hac) ?
                          $unsigned($unsigned({wire91,
                              wire85})) : $unsigned(reg77[(1'h0):(1'h0)])));
  assign wire95 = (wire92 <<< $signed(wire93));
endmodule

module module22
#(parameter param62 = (|(((-((8'h9d) && (7'h42))) ? {((7'h40) ? (7'h40) : (8'ha1))} : ({(8'had), (8'hb6)} & ((8'hbb) ? (7'h44) : (8'haf)))) >>> ({((8'hb6) ? (8'hba) : (8'ha5)), (8'ha4)} ? {((8'hae) << (8'hbf)), (|(8'haa))} : ((-(8'ha8)) > ((8'hb7) + (8'ha7)))))), 
parameter param63 = ({(((param62 ? param62 : param62) ? {param62} : param62) ^ ((param62 ? param62 : param62) & (param62 >= param62)))} >> (^(((param62 ~^ param62) * (~^param62)) ? (~(~&param62)) : (^(param62 ? param62 : param62))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  input wire [(3'h4):(1'h0)] wire24;
  input wire [(4'h8):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire45,
                 wire44,
                 wire37,
                 wire36,
                 wire28,
                 wire27,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire27 = (8'haa);
  assign wire28 = $unsigned($signed($signed(wire26[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire25)
        begin
          reg29 <= wire24;
          reg30 <= ((~|$unsigned($signed({reg29, wire25}))) ?
              (&$signed(((~&wire25) ?
                  wire26[(3'h5):(2'h3)] : {wire24}))) : wire24);
          reg31 <= (~&(^wire27));
          reg32 <= $unsigned(((((wire23 ? (8'hb0) : wire24) ?
                  wire26[(3'h5):(2'h3)] : {wire26, reg29}) ?
              {(^(8'haa))} : (wire24[(2'h3):(1'h0)] ?
                  reg29[(2'h2):(1'h1)] : (|wire26))) ^ (wire25 >= {(wire27 >> reg30)})));
          reg33 <= wire26;
        end
      else
        begin
          reg29 <= ((&reg33) ?
              $unsigned($unsigned(((~&wire26) >>> (reg29 ?
                  reg30 : reg33)))) : (($unsigned(reg31) && $signed((wire28 <<< reg31))) || ($unsigned({reg30,
                      wire25}) ?
                  wire26 : $signed($unsigned(reg33)))));
          if ($signed(wire27[(3'h7):(3'h6)]))
            begin
              reg30 <= $unsigned({(~^$signed((|wire28))),
                  $unsigned($unsigned({reg30}))});
              reg31 <= (~^(((reg32 <= (reg31 + (8'hbf))) ?
                      wire24[(1'h1):(1'h0)] : $unsigned((reg31 ?
                          reg33 : reg30))) ?
                  (~^wire26[(4'hd):(2'h2)]) : reg33[(1'h1):(1'h0)]));
            end
          else
            begin
              reg30 <= reg33;
              reg31 <= $unsigned({(+(wire28[(3'h4):(2'h3)] ?
                      (wire27 ? reg31 : wire28) : {wire24}))});
            end
          reg32 <= $unsigned({(($unsigned(wire27) ?
                      (wire27 ? wire23 : reg31) : (wire25 ? (8'hb3) : wire28)) ?
                  (~&(wire25 ?
                      reg33 : wire27)) : (reg29[(1'h0):(1'h0)] - wire27))});
          reg33 <= reg31[(1'h1):(1'h0)];
          reg34 <= ((wire28[(4'hb):(4'ha)] >> $unsigned(reg32[(1'h0):(1'h0)])) ?
              {reg30[(1'h0):(1'h0)],
                  (^~(~^$signed(reg31)))} : ((~^wire24[(2'h3):(2'h3)]) * reg32));
        end
      reg35 <= ($signed(wire24[(1'h0):(1'h0)]) ?
          reg30[(4'hd):(2'h3)] : $unsigned($unsigned(wire24[(3'h4):(2'h2)])));
    end
  assign wire36 = reg32;
  assign wire37 = (7'h44);
  always
    @(posedge clk) begin
      reg38 <= (-$unsigned(wire27));
      if ((reg38[(2'h2):(1'h1)] <<< ($signed((wire28[(3'h5):(1'h0)] > (reg31 ~^ wire36))) | ($unsigned((reg29 ?
              reg34 : wire36)) ?
          $signed(reg34) : {(reg33 < wire25)}))))
        begin
          reg39 <= (reg31 ?
              reg38[(3'h6):(3'h6)] : $unsigned(reg35[(4'hd):(3'h5)]));
          reg40 <= wire25;
          reg41 <= reg30;
          reg42 <= ($unsigned((&{$signed((8'hbc)),
              reg33})) == $unsigned({$unsigned((wire27 ? wire23 : wire23)),
              $unsigned(reg33[(1'h0):(1'h0)])}));
          reg43 <= reg38[(3'h7):(3'h5)];
        end
      else
        begin
          reg39 <= (^{$unsigned($signed($unsigned((8'ha1)))),
              ((^$signed((8'ha1))) ^~ wire26[(1'h0):(1'h0)])});
          reg40 <= wire25[(4'h9):(4'h8)];
          reg41 <= ((reg30[(1'h0):(1'h0)] ?
                  reg41[(4'ha):(1'h0)] : reg32[(2'h2):(2'h2)]) ?
              ({($signed(wire28) ? reg29 : (~&wire23)),
                  $unsigned({reg34, wire28})} != ({(!(8'hbb))} ?
                  reg43 : ($unsigned(reg39) >= $unsigned(reg43)))) : $unsigned($unsigned((!(+(8'ha4))))));
          reg42 <= $signed(reg42);
        end
    end
  assign wire44 = $unsigned($unsigned(reg32[(2'h3):(1'h0)]));
  assign wire45 = (8'hb6);
  always
    @(posedge clk) begin
      reg46 <= (wire26 & reg31);
      if ($unsigned($unsigned(((((8'hb5) | wire27) > $unsigned((8'hbe))) <= reg33))))
        begin
          reg47 <= (~&(reg35 ?
              (reg35 ?
                  $signed(((8'hbf) & wire25)) : (wire27[(3'h7):(2'h3)] ?
                      reg29 : ((8'hb2) && reg43))) : wire26[(2'h3):(1'h1)]));
        end
      else
        begin
          reg47 <= wire45;
        end
      reg48 <= $unsigned(($unsigned(($signed(wire27) ?
              (reg41 && reg39) : (~&wire28))) ?
          $unsigned((reg42 + reg38[(2'h2):(2'h2)])) : ($signed(((8'hb8) ?
              (7'h44) : reg43)) >>> (wire36[(1'h0):(1'h0)] ?
              (reg41 & (8'ha3)) : (reg35 <<< reg35)))));
      reg49 <= {(($unsigned((reg39 ? wire28 : (8'hb3))) ? reg32 : (^(~reg41))) ?
              wire23[(4'h8):(2'h2)] : {($signed(wire26) * $signed((8'hba))),
                  ((reg29 <= wire24) < $signed(reg32))})};
      reg50 <= ($signed((|wire27)) ? reg42[(2'h3):(1'h1)] : (8'hb7));
    end
  assign wire51 = (($signed(reg41) || reg42) ?
                      ((~|($unsigned(reg32) > wire37)) ?
                          (^~(^~$signed(reg33))) : ((|reg33[(1'h1):(1'h0)]) ?
                              $unsigned((!reg35)) : reg31)) : (~|wire23));
  assign wire52 = (($signed((-(reg38 ?
                          wire45 : reg31))) != wire28[(2'h2):(1'h0)]) ?
                      $unsigned(reg42) : reg35[(1'h0):(1'h0)]);
  assign wire53 = $unsigned($signed(reg31[(4'h9):(1'h1)]));
  assign wire54 = wire26;
  assign wire55 = reg48[(4'hb):(4'hb)];
  assign wire56 = (wire28[(1'h0):(1'h0)] || wire24[(3'h4):(2'h3)]);
  assign wire57 = $unsigned({$unsigned($signed($unsigned(wire27)))});
  assign wire58 = reg49;
  assign wire59 = ($signed($signed(((reg41 >>> reg48) ?
                          {reg50} : $unsigned((8'ha0))))) ?
                      wire55 : wire45);
  assign wire60 = reg30;
  assign wire61 = $unsigned($signed(reg31[(2'h3):(1'h1)]));
endmodule

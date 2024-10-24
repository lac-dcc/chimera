module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire159;
  wire signed [(4'ha):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire162;
  wire [(2'h3):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire164;
  wire [(3'h7):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire186;
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  assign y = {wire188,
                 wire5,
                 wire122,
                 wire130,
                 wire131,
                 wire137,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire165,
                 wire186,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 reg136,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 (1'h0)};
  assign wire5 = $unsigned(((wire4[(2'h3):(1'h1)] ?
                     ((wire1 ^~ (8'ha5)) >> wire4) : ($unsigned(wire3) >> {wire2,
                         wire2})) == wire0));
  module6 #() modinst123 (wire122, clk, wire3, wire4, wire5, wire1);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(((wire122 <<< {wire0}) ?
          wire5 : (-(wire0 ? wire1 : wire0))))))
        begin
          reg124 <= wire3[(4'hb):(2'h2)];
          reg125 <= ((&wire5[(4'ha):(3'h4)]) >> (wire0[(3'h5):(3'h4)] < (wire2[(1'h1):(1'h1)] ?
              wire122[(1'h0):(1'h0)] : ($unsigned(reg124) ?
                  $unsigned(wire3) : $signed(reg124)))));
          if ({wire3[(4'hc):(1'h1)],
              (~|($signed(wire0[(3'h4):(1'h0)]) ?
                  $unsigned((^wire3)) : $signed(((8'ha5) < wire5))))})
            begin
              reg126 <= (wire5[(3'h5):(2'h3)] ?
                  (&(8'hba)) : ((|(!{(8'hbd),
                      wire4})) + (!$signed($unsigned(wire4)))));
            end
          else
            begin
              reg126 <= (|{(reg125[(3'h5):(3'h4)] <<< (~&(^~wire3))),
                  reg126[(3'h4):(2'h2)]});
              reg127 <= $signed($unsigned(wire122[(4'hd):(3'h6)]));
            end
          reg128 <= ($signed((~^wire0[(1'h1):(1'h0)])) && wire5[(5'h10):(5'h10)]);
          reg129 <= ((((^$signed(wire5)) ?
                  (8'hbb) : (~reg124[(5'h11):(3'h4)])) ^ ({$signed(wire3),
                      reg128[(2'h3):(1'h0)]} ?
                  $unsigned(((8'hbb) ? wire5 : wire0)) : $signed({wire0,
                      wire2}))) ?
              (|(~&((~wire122) <= wire0))) : (wire0[(3'h5):(2'h3)] ?
                  (~|($unsigned((8'hbf)) && wire122)) : ($unsigned(reg126[(3'h5):(2'h2)]) || {((8'hb1) ?
                          wire3 : reg124),
                      (~wire3)})));
        end
      else
        begin
          reg124 <= $signed(wire1);
          reg125 <= (|{($signed(wire4[(4'hb):(4'hb)]) ?
                  reg129 : (|$signed(wire4)))});
          reg126 <= wire1;
          reg127 <= $signed((~&reg129[(1'h0):(1'h0)]));
          reg128 <= wire0[(3'h4):(2'h2)];
        end
    end
  assign wire130 = reg125;
  assign wire131 = ($signed(reg129[(4'hd):(4'hb)]) ?
                       $unsigned((((reg125 | (8'hb8)) >> (^~(8'hb9))) == (!((8'hb4) ?
                           wire130 : (8'ha8))))) : $unsigned(wire2[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg132 <= $unsigned(wire2[(3'h4):(3'h4)]);
      reg133 <= (reg128[(4'h8):(3'h4)] * wire4);
      reg134 <= ((-{{(+wire4)}}) ?
          $signed($unsigned(wire0[(3'h4):(1'h1)])) : reg133[(4'hb):(2'h3)]);
      reg135 <= (^((reg133[(3'h4):(1'h1)] == $unsigned($signed(wire131))) ?
          (~&reg128) : (^reg128[(4'he):(3'h5)])));
      reg136 <= (!reg128);
    end
  assign wire137 = ((wire5 - (reg129[(3'h5):(3'h4)] ?
                           $unsigned(reg127[(4'ha):(1'h0)]) : ((wire0 ?
                               reg135 : reg133) || (wire130 * reg127)))) ?
                       reg133 : (~|$unsigned(wire130)));
  always
    @(posedge clk) begin
      reg138 <= (~|(({$signed(wire4)} ?
          ({wire4} * (wire130 ? wire137 : reg133)) : ($signed(reg129) ?
              {wire137, reg127} : (wire137 + wire5))) << (((-reg136) ?
              $signed(wire131) : $unsigned(wire130)) ?
          (reg128 >>> {wire130, wire1}) : $unsigned({wire3}))));
      if ($unsigned((^~({{wire5}} ?
          (~(8'ha3)) : $signed(wire122[(4'hb):(3'h7)])))))
        begin
          if (wire137)
            begin
              reg139 <= (($signed(reg136) ?
                      $signed(((wire122 < reg125) <= $signed(reg138))) : $unsigned({$signed(wire4)})) ?
                  {(-($unsigned(reg134) ?
                          reg126[(4'ha):(3'h4)] : reg124[(4'h9):(4'h8)])),
                      $signed($signed((wire122 ^ (8'ha4))))} : ((~|$signed((+wire4))) <<< $signed(wire137)));
            end
          else
            begin
              reg139 <= {$signed((8'ha5))};
              reg140 <= {reg135, reg138};
              reg141 <= ($signed((^$signed((wire5 != reg134)))) && $unsigned($signed({$unsigned((8'ha3)),
                  $signed(wire122)})));
              reg142 <= $unsigned(reg125[(3'h7):(3'h7)]);
            end
          reg143 <= ((^~(((~^reg135) && wire3) == (wire5[(3'h6):(1'h0)] == reg139))) > (-$signed($unsigned((+wire5)))));
          if (($unsigned(wire2) << reg140[(2'h3):(1'h0)]))
            begin
              reg144 <= ($unsigned((wire0 == wire1[(2'h2):(2'h2)])) ^ (~^$signed($unsigned((~&(8'hb5))))));
            end
          else
            begin
              reg144 <= (^wire5);
              reg145 <= ((reg129 ?
                  {wire5,
                      (!((8'hb4) ?
                          reg139 : wire0))} : reg124) >> wire0[(2'h3):(2'h2)]);
              reg146 <= wire137[(2'h3):(2'h2)];
              reg147 <= $signed($unsigned((wire137[(1'h0):(1'h0)] ^ (-$signed((8'hbb))))));
              reg148 <= (8'hac);
            end
        end
      else
        begin
          reg139 <= ($unsigned(({(reg125 ? reg124 : reg147)} ?
              (reg129[(3'h7):(3'h6)] < (wire5 ?
                  reg148 : reg125)) : $unsigned((reg136 | wire122)))) >>> {(8'haa)});
          reg140 <= $unsigned($signed((((^reg140) ?
                  $signed((8'h9c)) : (reg133 ? reg146 : (8'ha4))) ?
              (~&{reg125}) : $unsigned((!wire0)))));
          if ($unsigned((~^{reg125[(3'h4):(1'h0)]})))
            begin
              reg141 <= wire131;
              reg142 <= (($signed($unsigned(reg139)) ?
                      wire137[(1'h1):(1'h1)] : ((~(&wire4)) ?
                          (|(!wire130)) : (((8'had) >> reg136) ?
                              $signed(reg125) : (~(8'hbb))))) ?
                  (|$signed($unsigned($unsigned(wire4)))) : reg145);
            end
          else
            begin
              reg141 <= $unsigned({$unsigned((!reg125[(3'h4):(2'h3)]))});
              reg142 <= (reg128[(4'hc):(4'h8)] >>> $unsigned((wire3[(4'hc):(4'h8)] ~^ {wire130,
                  ((8'h9d) || reg126)})));
              reg143 <= ($unsigned(reg133[(4'h9):(1'h1)]) - $signed(wire0));
              reg144 <= (-reg133[(4'h8):(4'h8)]);
              reg145 <= wire3[(3'h6):(1'h1)];
            end
        end
      if (reg134)
        begin
          reg149 <= $unsigned(reg148);
          reg150 <= (reg126 ? reg125[(4'h9):(1'h1)] : reg144);
          reg151 <= {(($unsigned($signed(reg138)) ?
                  $unsigned((reg132 & reg144)) : ($unsigned(wire5) ?
                      reg132 : ((8'hbc) >= reg124))) - reg149[(5'h12):(4'hc)]),
              (^~$signed(wire137[(3'h5):(2'h3)]))};
          if ({$signed(((~(8'ha8)) || ($signed(reg125) && (|reg136)))),
              ($unsigned(reg142[(3'h7):(3'h7)]) - $unsigned({reg134,
                  (~&wire0)}))})
            begin
              reg152 <= $signed((8'h9e));
              reg153 <= $signed((|{($unsigned(reg149) <<< (wire4 ~^ wire5)),
                  $unsigned((reg149 ? reg143 : wire5))}));
            end
          else
            begin
              reg152 <= ((~^((~(+reg151)) ?
                  ({reg145} ?
                      (~&reg147) : (reg147 ^~ reg135)) : ((|reg135) > $unsigned((8'h9f))))) << (~((8'ha8) ?
                  $signed(reg145) : (7'h41))));
              reg153 <= (({((^~(8'h9f)) && {reg146}),
                  ($signed(wire2) ^~ reg126[(1'h1):(1'h1)])} < reg140[(4'h8):(2'h2)]) <<< (($unsigned((reg124 || reg129)) ?
                      ({wire137} | (^~reg151)) : ((reg135 && reg141) ?
                          wire3 : reg140)) ?
                  {($signed(wire2) ?
                          (reg127 ? wire130 : reg151) : (wire130 ?
                              reg132 : (7'h41)))} : ($signed({reg149}) ?
                      (reg134[(2'h3):(1'h0)] > (!wire131)) : $signed((-reg143)))));
              reg154 <= $unsigned(wire0);
            end
          reg155 <= $signed(((&$signed(reg141[(3'h5):(2'h3)])) ?
              (~|wire130) : ((~|$unsigned(reg145)) < $signed((~reg153)))));
        end
      else
        begin
          reg149 <= $unsigned($signed(reg127));
          reg150 <= $signed((^~{$unsigned(reg152[(1'h0):(1'h0)])}));
          if (reg127)
            begin
              reg151 <= $unsigned($signed((^~reg124)));
            end
          else
            begin
              reg151 <= $unsigned((8'hbd));
              reg152 <= (8'ha1);
            end
          if ({((8'hb3) == (reg147[(1'h1):(1'h1)] < (reg142 >> reg147))),
              $unsigned(($unsigned(reg138[(3'h5):(3'h5)]) >>> reg146[(1'h0):(1'h0)]))})
            begin
              reg153 <= $signed(((reg155[(1'h0):(1'h0)] ?
                  $signed((^wire5)) : reg145) != ((|{reg151, wire0}) ?
                  reg153[(4'ha):(3'h4)] : ((reg143 << (8'hb6)) ?
                      $unsigned(reg125) : $signed(wire2)))));
              reg154 <= (8'ha3);
            end
          else
            begin
              reg153 <= (reg132[(3'h4):(3'h4)] ? reg155 : reg125);
              reg154 <= (wire122[(3'h6):(2'h2)] ?
                  $signed((!(|$signed(reg124)))) : (reg124 != (reg136 ?
                      (wire2[(2'h2):(1'h0)] ?
                          reg141 : ((8'h9f) <<< reg126)) : (&$signed(wire0)))));
              reg155 <= reg148[(4'h8):(1'h0)];
            end
        end
      reg156 <= wire2;
    end
  assign wire157 = ({(|reg148)} ?
                       ((~((reg124 * (7'h42)) ?
                           reg126[(4'h8):(1'h1)] : $signed(wire3))) >= wire130[(2'h3):(1'h0)]) : (~&((+{reg128,
                           reg146}) && wire137)));
  assign wire158 = $signed($unsigned(reg129));
  assign wire159 = reg142;
  assign wire160 = ($signed(reg126[(4'h8):(2'h3)]) <<< (~^$unsigned(reg128[(5'h11):(1'h1)])));
  assign wire161 = (&$unsigned(($unsigned((reg153 ^~ (8'hb6))) && $unsigned((~|wire3)))));
  assign wire162 = ($signed((reg154 - (((8'hb5) ? reg139 : reg153) ?
                       (reg145 ^ reg133) : {reg150}))) * reg140[(3'h6):(1'h0)]);
  assign wire163 = reg136[(2'h3):(2'h2)];
  assign wire164 = (~^reg154);
  assign wire165 = $unsigned(({$unsigned($signed(wire164)), wire158} ?
                       {$unsigned((wire131 < reg134))} : $signed($unsigned($signed(wire131)))));
  module166 #() modinst187 (wire186, clk, wire131, reg149, reg151, reg145);
  assign wire188 = wire131[(3'h4):(2'h3)];
endmodule

module module166  (y, clk, wire170, wire169, wire168, wire167);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire170;
  input wire signed [(5'h15):(1'h0)] wire169;
  input wire [(4'h8):(1'h0)] wire168;
  input wire signed [(4'ha):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire172;
  wire signed [(4'he):(1'h0)] wire171;
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(4'hb):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  reg [(4'hb):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  assign y = {wire185,
                 wire172,
                 wire171,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire171 = {$signed(((8'hb0) != $signed((wire169 >>> wire168)))),
                       (-wire169)};
  assign wire172 = {(wire168 < (^wire168[(3'h7):(3'h6)]))};
  always
    @(posedge clk) begin
      if ((8'ha1))
        begin
          reg173 <= $unsigned({$signed((wire168[(3'h7):(2'h2)] < (8'ha9))),
              $unsigned($signed($signed(wire170)))});
          reg174 <= $unsigned(wire171[(2'h2):(2'h2)]);
          reg175 <= $unsigned({$signed((8'ha9))});
          reg176 <= wire167;
        end
      else
        begin
          if (wire172[(4'h9):(4'h8)])
            begin
              reg173 <= reg174;
            end
          else
            begin
              reg173 <= $unsigned(($signed(((~^wire170) ?
                      $unsigned(wire168) : (wire170 ? reg174 : wire167))) ?
                  $unsigned($unsigned((wire167 + (8'h9d)))) : reg174));
              reg174 <= reg173;
            end
          if (reg174)
            begin
              reg175 <= ($signed($signed((-wire170))) ?
                  {reg173} : (~^wire169[(3'h7):(3'h4)]));
              reg176 <= (^~(reg175[(4'h8):(1'h1)] >= $signed(((+wire172) ?
                  wire172 : $signed(wire172)))));
              reg177 <= reg174[(4'h8):(3'h5)];
              reg178 <= $unsigned((+reg174[(4'ha):(3'h4)]));
              reg179 <= ($unsigned(reg175[(2'h3):(2'h2)]) ?
                  (^~(({reg177,
                      wire169} == (&(8'hb5))) ^ $signed(wire169[(3'h5):(1'h1)]))) : (!(wire169[(4'h9):(3'h5)] ?
                      reg173[(3'h5):(1'h1)] : ($signed((8'hb3)) << wire167))));
            end
          else
            begin
              reg175 <= $signed(reg179[(4'hd):(4'hb)]);
              reg176 <= $signed((~&(~^((reg175 > reg175) ?
                  $unsigned((8'h9d)) : (wire169 ? (8'ha5) : wire169)))));
              reg177 <= reg175;
              reg178 <= (!$unsigned((((!wire169) <= $signed((8'ha4))) ?
                  wire170[(3'h4):(3'h4)] : $signed(wire170[(4'h9):(1'h0)]))));
            end
          reg180 <= {{(((^~wire167) ?
                      {(8'ha9),
                          reg175} : $unsigned((7'h43))) <= (^$unsigned(wire170)))}};
        end
      reg181 <= $signed($signed(reg179[(3'h6):(2'h3)]));
      reg182 <= $unsigned($unsigned((~&reg180)));
      reg183 <= ($unsigned($unsigned(reg174)) << $unsigned(($unsigned($signed((8'hbc))) ?
          (&(reg181 * reg174)) : reg173[(4'hf):(4'hf)])));
      reg184 <= reg183[(4'hd):(4'hd)];
    end
  assign wire185 = (~&wire167);
endmodule

module module6
#(parameter param121 = ((^{(((8'hb9) >> (8'ha7)) ? ((8'hb4) + (8'hb3)) : ((8'hae) | (7'h41))), (((8'hb4) < (8'hb0)) >>> (!(8'h9e)))}) ? ((8'hb5) ^ (({(8'hb2), (8'ha7)} || (^~(8'ha4))) ^~ (((8'ha8) ? (8'hb0) : (8'ha4)) ~^ (~|(8'hb8))))) : ((|(((8'hbe) << (7'h40)) ? {(8'hb9), (7'h43)} : (~&(8'h9e)))) ? (~|((^(8'hb5)) - (|(8'h9d)))) : {(((7'h40) ? (8'hb4) : (8'hba)) ? (&(8'hb1)) : ((8'ha9) << (8'hb5)))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire109;
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire111,
                 wire47,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire12,
                 wire11,
                 wire49,
                 wire109,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = (~^wire10);
  assign wire12 = $unsigned($unsigned($unsigned(wire7[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg13 <= $signed((^({{(7'h43), wire8}, (+wire7)} >>> ((wire7 ?
              wire7 : wire10) ?
          wire9 : (wire9 ? wire11 : wire9)))));
      reg14 <= (+(reg13[(2'h3):(1'h0)] > ($signed((wire12 && wire10)) >>> wire12)));
      reg15 <= (wire12[(3'h7):(3'h4)] ?
          {(&((8'h9f) ?
                  $signed(wire9) : (wire12 ? (8'ha5) : wire7)))} : (8'hbf));
      reg16 <= $signed(((^~reg13[(3'h6):(1'h1)]) >>> (~^$signed((wire8 > wire8)))));
      reg17 <= ((~({(reg16 ? wire7 : wire10), (wire11 <<< (8'hb0))} ?
              {$signed(wire12),
                  (wire7 ? reg14 : wire11)} : $signed($unsigned(reg13)))) ?
          wire7[(1'h1):(1'h1)] : reg14[(4'h8):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg18 <= wire10;
      reg19 <= (wire7[(3'h5):(2'h2)] ?
          $unsigned(reg13[(3'h7):(1'h1)]) : $signed(reg16[(1'h1):(1'h0)]));
      if ($signed(({$signed({wire8, wire12})} >> ($unsigned((wire10 ?
              wire11 : reg14)) ?
          $signed((reg18 ?
              (8'haa) : reg16)) : (wire9[(3'h7):(3'h4)] == $signed((8'haa)))))))
        begin
          reg20 <= ($signed($signed((reg16[(3'h5):(1'h0)] ?
                  $signed(wire9) : (reg17 ^~ reg18)))) ?
              $unsigned({($signed(wire11) >= (wire10 ? wire9 : reg17)),
                  (+(wire9 >>> wire10))}) : {wire7[(1'h0):(1'h0)]});
        end
      else
        begin
          reg20 <= $unsigned(((reg13 ?
              ({reg13} >>> $signed((8'ha0))) : (~^wire7[(3'h5):(1'h1)])) <= {$signed($unsigned(wire8)),
              $unsigned({reg13})}));
          reg21 <= ($signed(({reg18, $signed(reg16)} >= reg16)) ?
              reg20[(3'h4):(2'h3)] : (|(wire8[(2'h2):(1'h1)] != ((wire11 >>> reg17) ?
                  (reg14 & reg17) : (reg20 < wire12)))));
          reg22 <= (8'hb5);
          reg23 <= $signed($unsigned((($signed(reg19) >= $unsigned((8'hb2))) << reg16[(5'h10):(4'hb)])));
        end
      reg24 <= (^(~|$signed(reg17[(1'h0):(1'h0)])));
    end
  assign wire25 = {({$unsigned(wire7[(3'h4):(2'h2)])} ?
                          (+reg15) : (wire12[(3'h6):(3'h6)] ?
                              reg15[(4'h8):(3'h4)] : {((8'hb8) ?
                                      wire7 : reg15)})),
                      (reg15 | $signed(((&reg13) < $unsigned(wire11))))};
  assign wire26 = wire10;
  assign wire27 = ({{reg15, {(reg14 ? wire7 : reg19)}}} ?
                      ((~^((wire12 && reg20) + (reg17 ? wire7 : wire25))) ?
                          reg20[(2'h3):(1'h0)] : (((~^reg24) >> (wire10 ?
                                  (7'h43) : (8'hbc))) ?
                              reg24 : wire10[(2'h2):(2'h2)])) : $signed(wire26));
  assign wire28 = (|$signed((~$unsigned($unsigned(wire8)))));
  assign wire29 = $signed(reg19[(4'hb):(1'h1)]);
  assign wire30 = wire10[(3'h5):(3'h4)];
  module31 #() modinst48 (.wire35(reg13), .wire32(reg17), .wire33(wire8), .clk(clk), .wire34(wire11), .y(wire47), .wire36(wire27));
  assign wire49 = {$unsigned($unsigned((~|(~^reg18))))};
  module50 #() modinst110 (.wire55(reg20), .y(wire109), .wire51(reg22), .wire54(wire27), .wire52(reg19), .wire53(reg18), .clk(clk));
  assign wire111 = $unsigned((~reg24));
  always
    @(posedge clk) begin
      reg112 <= {{$signed((^wire11[(1'h1):(1'h1)])),
              (wire109[(5'h11):(4'hf)] & {$signed(reg19)})}};
      if ((($unsigned((wire11[(1'h0):(1'h0)] ?
                  {wire29, wire109} : reg23[(4'hd):(4'h9)])) ?
              wire27 : ({(reg24 ? wire7 : wire25), (reg19 || reg18)} ?
                  (^~(wire47 ?
                      (8'h9f) : wire8)) : $signed(wire11[(3'h4):(2'h3)]))) ?
          $unsigned(wire30) : $unsigned($signed((7'h44)))))
        begin
          reg113 <= ($signed((reg112[(4'hb):(4'ha)] < $signed((reg16 & wire11)))) ?
              wire49 : {({(wire11 ? reg15 : reg16)} ?
                      (~(~|wire109)) : $unsigned((wire29 ? wire12 : reg13))),
                  (wire49 ?
                      (wire25[(2'h2):(2'h2)] ^~ wire8) : {$signed(wire11),
                          (wire109 ~^ wire47)})});
          reg114 <= wire30[(4'ha):(3'h5)];
          reg115 <= reg114;
          reg116 <= wire28[(1'h1):(1'h0)];
        end
      else
        begin
          reg113 <= $signed({((+((8'ha0) == reg115)) ?
                  reg23[(1'h0):(1'h0)] : wire12[(3'h6):(2'h2)]),
              {$signed($unsigned(wire30)), reg22[(4'hd):(3'h6)]}});
          reg114 <= ($signed(wire25) <= $signed($unsigned(wire49)));
          reg115 <= $unsigned((8'ha4));
          reg116 <= (8'hb3);
        end
      reg117 <= reg17[(5'h10):(4'hb)];
    end
  assign wire118 = reg114[(4'hb):(2'h3)];
  assign wire119 = ($unsigned(($signed({(7'h40)}) ?
                       (!(reg19 ~^ reg117)) : (~|$signed(wire27)))) <= wire47);
  assign wire120 = (reg112 == reg15[(3'h4):(3'h4)]);
endmodule

module module50
#(parameter param108 = ((+((^~((8'ha3) ? (8'h9d) : (8'hb2))) | (!(~(8'hb7))))) && (~({(^(8'hb9)), ((8'ha2) ? (8'ha0) : (8'hb7))} ? (~|((8'hbc) ? (8'ha2) : (8'ha7))) : (+((8'ha3) ? (7'h43) : (8'hb8)))))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h273):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire55;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire [(4'h8):(1'h0)] wire53;
  input wire [(4'hc):(1'h0)] wire52;
  input wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire78,
                 wire75,
                 wire74,
                 wire73,
                 wire60,
                 wire57,
                 wire56,
                 reg99,
                 reg98,
                 reg97,
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
                 reg77,
                 reg76,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire56 = (+wire52);
  assign wire57 = wire55;
  always
    @(posedge clk) begin
      reg58 <= $signed($unsigned(wire57));
      reg59 <= ((8'haa) < (wire52 <= wire54));
    end
  assign wire60 = wire55;
  always
    @(posedge clk) begin
      reg61 <= $unsigned($signed(wire56));
      if ($signed(reg58[(3'h7):(3'h5)]))
        begin
          if ((reg61 ?
              $signed((wire56[(4'he):(4'hc)] ?
                  $signed((reg59 ? wire60 : wire60)) : (wire60 << {wire52,
                      wire57}))) : $signed(reg59)))
            begin
              reg62 <= (8'ha4);
              reg63 <= wire51;
              reg64 <= ((reg61[(1'h1):(1'h1)] ?
                      ({((8'hb9) >> wire53), (~&wire56)} ?
                          $unsigned((~^reg61)) : (wire55 ?
                              reg62[(1'h0):(1'h0)] : (~(8'ha2)))) : ($unsigned($unsigned(wire60)) ?
                          wire57 : (~|(~&reg63)))) ?
                  (-$unsigned($unsigned({reg59,
                      wire60}))) : (reg58[(4'hc):(2'h3)] ?
                      (wire53[(3'h5):(3'h4)] < $signed((wire60 ^ (8'h9f)))) : reg59[(3'h4):(1'h1)]));
              reg65 <= $unsigned((((8'hbd) ?
                      $unsigned({reg62}) : reg64[(3'h7):(3'h6)]) ?
                  (8'hb7) : $signed(($signed(reg63) ?
                      (wire54 != reg58) : (wire60 ? reg59 : reg61)))));
              reg66 <= $unsigned($unsigned((reg59 + wire53)));
            end
          else
            begin
              reg62 <= {reg58, $unsigned({(8'hb1)})};
              reg63 <= reg58[(4'h9):(2'h3)];
              reg64 <= wire54[(2'h2):(2'h2)];
              reg65 <= ((8'hba) * $signed(reg66[(2'h3):(2'h2)]));
              reg66 <= reg66;
            end
          reg67 <= (8'hb4);
          if (wire57)
            begin
              reg68 <= $signed(wire54[(2'h3):(1'h1)]);
            end
          else
            begin
              reg68 <= reg61;
              reg69 <= (+((($signed(reg64) ?
                  reg58 : reg61[(4'h9):(2'h3)]) ~^ (reg66[(4'h8):(1'h1)] >> wire53)) >>> (wire56[(4'hd):(4'h8)] ?
                  $unsigned($signed(wire53)) : wire60)));
              reg70 <= reg69[(2'h2):(2'h2)];
              reg71 <= reg67;
            end
          reg72 <= (wire53 ?
              (({wire55, (reg58 ? reg69 : reg59)} ?
                  wire55 : $unsigned((wire52 ^~ reg66))) <= wire57) : {(-((reg70 ?
                          wire57 : reg71) ?
                      (+reg65) : wire54[(1'h1):(1'h1)]))});
        end
      else
        begin
          if (reg70[(1'h1):(1'h0)])
            begin
              reg62 <= {wire55[(1'h1):(1'h0)]};
              reg63 <= (wire56 ?
                  $signed((wire55[(1'h0):(1'h0)] | $unsigned(((8'ha8) != reg67)))) : ((7'h42) ?
                      wire60 : (&(&(wire52 != reg58)))));
              reg64 <= $signed((!$signed({((8'hba) && reg69)})));
            end
          else
            begin
              reg62 <= $signed({reg66[(4'hd):(3'h5)],
                  (reg63[(2'h3):(1'h1)] > $signed((reg71 ?
                      (8'haa) : (8'hb3))))});
              reg63 <= $unsigned(((~|(reg63[(1'h1):(1'h1)] ?
                      (reg59 ? reg66 : wire55) : $unsigned(reg58))) ?
                  (~wire52[(3'h5):(3'h5)]) : $unsigned((~&{reg67}))));
              reg64 <= $unsigned((((~^(reg65 ? reg67 : reg68)) ?
                  (~|$signed(reg61)) : (reg69 || $signed(reg65))) << reg71));
              reg65 <= $signed({$signed(($unsigned(wire55) <= (wire54 ?
                      reg61 : reg63)))});
              reg66 <= $unsigned({reg66[(4'h8):(1'h1)]});
            end
          reg67 <= $unsigned($signed(wire52));
          reg68 <= $signed({$signed($unsigned((wire60 ? wire56 : (8'hb2)))),
              (~$unsigned(wire52))});
          reg69 <= reg63;
          reg70 <= {(^~{reg58[(3'h4):(3'h4)], wire56})};
        end
    end
  assign wire73 = (reg68 ? wire51[(4'ha):(3'h5)] : reg69);
  assign wire74 = (-reg59[(1'h1):(1'h1)]);
  assign wire75 = (reg69[(1'h0):(1'h0)] ?
                      {(((wire51 ~^ reg63) ?
                              {reg66,
                                  wire53} : (reg58 && reg63)) - ($signed(wire73) <= $signed(reg66))),
                          {wire60, $signed((~|reg66))}} : (reg62 && wire55));
  always
    @(posedge clk) begin
      reg76 <= ($signed($signed(reg65)) ?
          wire57[(1'h1):(1'h1)] : $signed($signed($unsigned((reg64 ~^ wire53)))));
      reg77 <= {wire55[(2'h3):(2'h2)], reg65[(3'h6):(2'h2)]};
    end
  assign wire78 = (reg77 < $unsigned(reg61));
  always
    @(posedge clk) begin
      reg79 <= $unsigned((8'ha5));
      if (($signed((((reg67 != reg70) ?
          ((8'hbd) ? wire52 : wire55) : $signed(reg70)) >> ((reg68 >>> reg64) ?
          $signed(reg72) : $unsigned(reg62)))) | (wire78 ?
          reg71 : ($unsigned(reg72) ?
              wire56[(5'h10):(2'h3)] : ($unsigned(reg72) ?
                  (reg65 <<< reg65) : reg67[(4'h9):(1'h1)])))))
        begin
          reg80 <= (wire55 ?
              $unsigned((reg68[(4'he):(2'h3)] ?
                  $unsigned($unsigned(wire55)) : (wire74[(5'h14):(3'h4)] ?
                      wire78 : wire57[(2'h2):(1'h1)]))) : {{$signed($unsigned(wire57)),
                      ((~^wire52) > reg71)}});
          reg81 <= reg72[(4'he):(1'h1)];
          reg82 <= ((reg72[(3'h7):(3'h6)] ^ (({reg68, reg67} ?
                  (+reg61) : (wire53 >= wire75)) + {reg59, (~|reg69)})) ?
              ($signed(($signed((8'ha0)) ?
                  reg69 : {reg65})) | reg72) : $signed(reg68[(4'hf):(4'he)]));
          reg83 <= (((8'hb0) ?
                  ((-{reg65}) ?
                      {wire57[(3'h4):(2'h2)]} : ((wire74 + wire73) ?
                          wire56[(4'hf):(1'h0)] : wire78)) : wire51[(2'h2):(1'h1)]) ?
              ((wire53 | reg62) ^ ($unsigned($unsigned(reg69)) ?
                  (((7'h41) >>> reg77) < $signed(reg71)) : (~|(^reg76)))) : (^~wire55));
          reg84 <= $unsigned(reg77);
        end
      else
        begin
          reg80 <= $unsigned(reg64[(3'h4):(1'h0)]);
          reg81 <= reg68;
          if ($signed($unsigned((($unsigned(reg72) || $signed(reg63)) ?
              wire53[(4'h8):(3'h7)] : wire56))))
            begin
              reg82 <= (reg77 ?
                  reg82[(1'h0):(1'h0)] : ((((reg83 ?
                      (8'hba) : (8'hb0)) << wire54[(1'h1):(1'h1)]) >> reg59) + reg69));
              reg83 <= (!(reg77 | {(~(8'hbf)),
                  $signed(((8'hae) ? reg81 : reg71))}));
              reg84 <= (((({reg61,
                      reg65} ^~ (wire56 >> reg65)) < {$unsigned(reg67)}) ^ (($unsigned(reg81) ^~ (reg70 | reg58)) == reg70)) ?
                  ($unsigned(wire52[(3'h5):(3'h4)]) ?
                      $unsigned(wire52) : wire54[(2'h2):(1'h1)]) : reg79);
              reg85 <= $unsigned((~^{$signed(reg68[(4'hf):(4'he)]),
                  reg66[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg82 <= wire73[(3'h6):(3'h5)];
              reg83 <= (-wire74);
              reg84 <= $unsigned(wire53);
              reg85 <= $unsigned(($unsigned((wire56 ? (~^reg82) : (!wire57))) ?
                  reg58[(4'hb):(3'h4)] : $unsigned(reg76[(2'h2):(2'h2)])));
            end
        end
      reg86 <= ($unsigned(reg68[(4'hd):(4'h9)]) ?
          wire52[(3'h4):(2'h3)] : $unsigned((reg81[(5'h10):(5'h10)] < reg71)));
      reg87 <= (+(~reg58));
      if ((^~$unsigned({$signed((wire74 ^ reg65))})))
        begin
          reg88 <= $signed((wire75 ?
              (((wire53 >>> wire51) == $signed((8'hae))) >> ((reg63 ?
                      (8'ha2) : wire78) ?
                  reg72 : (reg80 ? reg87 : reg84))) : reg61));
          reg89 <= {$unsigned($unsigned(($unsigned(reg70) >> reg66[(4'h8):(1'h0)]))),
              ((7'h41) + {{{reg86}}, {{reg76, wire73}}})};
          reg90 <= {(+{(8'ha3), wire74}),
              (-(((^(8'hba)) ?
                  (&(8'ha4)) : reg59[(4'h9):(2'h2)]) ^ ((reg69 >= reg71) - reg88)))};
          reg91 <= $signed($signed((((!wire74) == reg79[(2'h3):(1'h1)]) ?
              reg71[(3'h7):(3'h7)] : ((reg58 ?
                  reg67 : reg82) >= reg90[(2'h3):(1'h1)]))));
        end
      else
        begin
          reg88 <= reg71[(3'h5):(1'h1)];
          if (($signed((!(~^wire75))) == ((&$unsigned((~&reg64))) != $unsigned($unsigned((reg71 ?
              reg69 : wire57))))))
            begin
              reg89 <= (wire53 >>> (reg86[(1'h1):(1'h0)] <= (((reg82 ?
                          reg63 : reg84) ?
                      (!reg66) : $unsigned(wire52)) ?
                  $unsigned((reg87 >> reg63)) : ($unsigned(reg65) * (-wire55)))));
              reg90 <= ((reg76 && {(reg87 >> $unsigned(reg77))}) ?
                  ((((reg87 >> reg91) ~^ $signed((8'h9c))) == $unsigned((wire57 ?
                          reg72 : (8'hb3)))) ?
                      $signed($signed(reg83[(1'h1):(1'h1)])) : ($signed($signed(reg70)) << (^~{wire75,
                          (8'ha2)}))) : (-$unsigned(reg59[(1'h0):(1'h0)])));
              reg91 <= $unsigned($unsigned(wire55[(2'h3):(1'h0)]));
              reg92 <= reg81[(5'h15):(4'hb)];
            end
          else
            begin
              reg89 <= reg92;
              reg90 <= wire78[(2'h3):(1'h0)];
            end
          reg93 <= $unsigned((reg71 ?
              (^~$unsigned($unsigned(wire52))) : $signed(($signed(reg67) ?
                  $signed((8'hbd)) : wire74[(3'h7):(2'h2)]))));
          reg94 <= (~&$signed(reg68[(3'h7):(3'h7)]));
          if (reg59[(1'h1):(1'h0)])
            begin
              reg95 <= ((((!$unsigned(reg70)) != (|{wire52, wire56})) ?
                  $unsigned((~&(^~reg94))) : {$signed($signed(reg76)),
                      reg58}) <= reg82);
              reg96 <= reg90[(3'h6):(3'h4)];
              reg97 <= $signed((wire54 ?
                  (~$unsigned((reg64 <= reg58))) : reg92[(3'h7):(1'h0)]));
            end
          else
            begin
              reg95 <= $unsigned($unsigned((($unsigned(reg64) ?
                      (wire56 >= (8'hae)) : $signed(wire75)) ?
                  $unsigned(reg96[(1'h0):(1'h0)]) : (-$signed(reg68)))));
              reg96 <= reg79[(1'h1):(1'h0)];
              reg97 <= {reg82[(3'h4):(2'h3)],
                  (^~($signed((reg83 + reg59)) ?
                      (|$unsigned(reg66)) : ((reg87 && reg67) == {reg97,
                          (8'hac)})))};
              reg98 <= wire52;
              reg99 <= ((($unsigned($unsigned(wire74)) ?
                          reg69 : wire60[(4'h9):(2'h2)]) ?
                      $unsigned($signed((reg68 ?
                          reg63 : reg58))) : (((^reg72) - $unsigned(reg87)) ?
                          reg61 : reg86)) ?
                  $unsigned((|{$signed(reg89),
                      (&reg83)})) : {$unsigned((reg90[(3'h4):(2'h3)] ?
                          reg92 : wire52))});
            end
        end
    end
  assign wire100 = reg93[(2'h2):(1'h0)];
  assign wire101 = $unsigned(((($signed(reg66) == reg90) ?
                       reg68 : (-$signed(reg84))) << ($unsigned(reg66[(4'hd):(4'h8)]) || (~^(~|reg87)))));
  assign wire102 = reg92[(3'h6):(1'h1)];
  assign wire103 = ($signed(($signed((wire56 ?
                           reg87 : wire78)) < {$signed(reg79),
                           $signed(wire55)})) ?
                       $signed(($signed(reg72[(4'he):(2'h3)]) ?
                           (^(wire60 ? reg94 : (8'h9f))) : ((reg82 ?
                               reg80 : reg66) >= $unsigned(reg71)))) : reg79[(2'h2):(2'h2)]);
  assign wire104 = ((((|reg85[(4'h9):(4'h9)]) ^~ reg90) >= $signed($signed($unsigned(reg96)))) ?
                       {wire103[(1'h1):(1'h1)],
                           reg72[(4'hb):(4'h8)]} : $unsigned((((~|(7'h43)) < (reg83 > (8'hb6))) ?
                           ((reg84 << reg79) <<< {reg71}) : ((reg90 || reg59) ?
                               (~^wire75) : $signed(reg94)))));
  assign wire105 = ((|reg76) ?
                       ((wire75 ?
                               reg95[(4'ha):(3'h4)] : ($unsigned(reg91) ?
                                   wire74[(4'hc):(3'h7)] : $signed(reg58))) ?
                           ((-(wire52 ? reg93 : wire73)) ?
                               $unsigned({wire53}) : ($signed(wire51) * {reg81,
                                   (8'hbe)})) : (^~$unsigned((~reg97)))) : wire100);
  assign wire106 = (wire100 <= reg65[(4'ha):(4'h9)]);
  assign wire107 = ((~|({reg62} ?
                       $unsigned($signed(reg63)) : ((wire57 >> reg59) ?
                           (wire60 ? wire103 : wire101) : (reg58 ?
                               reg62 : reg89)))) ~^ wire101);
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire [(4'hc):(1'h0)] wire35;
  input wire [(2'h3):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire37 = wire34;
  assign wire38 = $signed($signed({wire36[(3'h6):(1'h0)],
                      $signed(wire36[(3'h7):(3'h7)])}));
  assign wire39 = (~&$unsigned(($unsigned(wire34[(1'h0):(1'h0)]) ?
                      (~|$signed(wire36)) : wire32)));
  assign wire40 = (!wire34);
  assign wire41 = wire39;
  assign wire42 = $unsigned(wire33[(2'h3):(1'h0)]);
  assign wire43 = (wire42[(2'h3):(1'h0)] | (~wire36[(4'ha):(3'h7)]));
  always
    @(posedge clk) begin
      reg44 <= wire36[(4'hd):(2'h3)];
      reg45 <= (8'hb3);
      reg46 <= (+{($unsigned(wire43) >>> {wire39})});
    end
endmodule

module top
#(parameter param167 = (^((~|(&((8'hb9) || (8'had)))) ? (({(8'hac)} ? ((8'hb0) == (8'ha6)) : ((8'ha3) + (8'h9c))) & ({(8'ha0)} ? {(8'ha2), (8'hb8)} : {(8'haf), (8'ha3)})) : ((+{(8'hb7)}) == ({(8'hbf)} ? {(8'hb6), (8'ha8)} : {(8'hb8)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h28d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire144,
                 wire133,
                 wire132,
                 wire130,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg5,
                 reg6,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({wire2, wire0} ?
          ({$signed(wire4)} ?
              wire0 : (wire1 ?
                  (~(wire3 - wire4)) : wire4[(2'h3):(2'h2)])) : wire2[(1'h0):(1'h0)]))
        begin
          reg5 <= wire0;
          if (wire4[(2'h3):(2'h3)])
            begin
              reg6 <= $signed($signed({(wire3 ? $signed(reg5) : (~wire2))}));
              reg7 <= $unsigned((~&$unsigned(wire3)));
              reg8 <= ($unsigned(wire3[(2'h2):(2'h2)]) == $signed(reg5[(4'hf):(4'h9)]));
              reg9 <= wire4;
            end
          else
            begin
              reg6 <= $signed($signed($unsigned(wire1)));
              reg7 <= $signed($unsigned(((8'h9e) & wire2)));
            end
        end
      else
        begin
          reg5 <= ((8'ha4) ?
              reg9[(4'hc):(1'h0)] : $signed((reg9 <<< wire3[(1'h0):(1'h0)])));
          reg6 <= {reg6,
              ({(~|(7'h40))} ? reg7[(3'h6):(2'h3)] : (|(wire1 << reg9)))};
          reg7 <= reg6;
          reg8 <= $unsigned(((~wire3[(3'h6):(1'h1)]) ^~ wire2));
          reg9 <= {(|reg6[(4'hc):(3'h6)])};
        end
      reg10 <= $unsigned(({((reg8 + wire2) | wire1[(4'h8):(3'h6)])} || reg9[(2'h2):(2'h2)]));
      if ($signed({$signed({$unsigned(reg5)}),
          ((-reg10[(1'h1):(1'h0)]) ?
              reg6 : ((wire0 | reg6) <<< $signed(reg6)))}))
        begin
          if (reg9)
            begin
              reg11 <= ($unsigned({{(reg5 ? (8'ha9) : (8'ha8))},
                  $signed(wire0)}) << ((wire4[(2'h2):(1'h1)] ?
                      $unsigned($unsigned(wire4)) : wire0[(1'h1):(1'h1)]) ?
                  {(wire1[(5'h14):(5'h14)] ?
                          wire1[(5'h10):(3'h7)] : $signed(wire1))} : {($unsigned(wire0) ?
                          reg6[(4'hf):(4'hf)] : (wire2 ? reg6 : reg6))}));
            end
          else
            begin
              reg11 <= (8'h9c);
              reg12 <= $unsigned((($unsigned($signed(reg9)) ?
                      ((reg9 != wire3) & ((8'hb8) ?
                          reg6 : reg7)) : $signed(reg11[(3'h6):(2'h2)])) ?
                  (+{(reg6 ? wire0 : reg6),
                      (wire2 ?
                          (8'h9c) : wire2)}) : $unsigned(($signed(wire1) && (wire4 == reg6)))));
              reg13 <= reg9[(2'h2):(1'h1)];
            end
          reg14 <= {($unsigned((&$signed(reg9))) ?
                  $unsigned((8'h9f)) : (reg13[(2'h2):(1'h1)] | (reg8[(2'h3):(1'h1)] > {wire4,
                      reg5})))};
          reg15 <= $signed(wire2);
        end
      else
        begin
          if ($signed(((($unsigned((8'haf)) ?
              $unsigned((8'ha0)) : ((8'had) ?
                  wire3 : wire4)) <<< ($unsigned(wire4) ?
              reg8[(2'h2):(1'h0)] : (wire4 >> wire1))) & wire1[(2'h3):(2'h3)])))
            begin
              reg11 <= {$unsigned(wire4), $signed(reg9[(4'ha):(3'h4)])};
              reg12 <= wire2;
            end
          else
            begin
              reg11 <= {(8'hbc)};
              reg12 <= $signed(($signed($signed((^~wire1))) ?
                  {reg5, (+wire2)} : (-$unsigned({wire2}))));
              reg13 <= {{(~|(~&$signed(reg11))), wire1}};
              reg14 <= $signed($signed($signed(((reg12 >> wire3) ?
                  {reg6, (8'hba)} : $signed(wire1)))));
            end
          reg15 <= {$unsigned(reg13[(2'h2):(2'h2)])};
          reg16 <= ((|(wire1 <<< $signed((reg9 ^ wire2)))) > $signed(((((8'haf) ?
              wire2 : wire1) > reg15) >> (|$signed(reg10)))));
        end
      reg17 <= wire1;
    end
  always
    @(posedge clk) begin
      reg18 <= ((~^(wire2[(4'hb):(1'h1)] ? {reg5} : (^~reg12[(1'h1):(1'h1)]))) ?
          $unsigned($signed(($signed(reg14) | (reg5 < reg7)))) : {($unsigned((wire3 >> wire1)) ?
                  (8'haf) : (|{reg17}))});
      if (wire3)
        begin
          reg19 <= $signed(reg11);
          reg20 <= ((((reg8 ? {reg11, reg15} : (&reg18)) ?
                  {wire0[(3'h5):(3'h5)],
                      (reg6 <<< reg12)} : ((reg13 >> (8'ha1)) - (8'ha9))) && ((wire0[(4'h8):(2'h2)] - $signed(reg9)) ?
                  $signed((reg19 == reg19)) : $unsigned(reg10[(1'h1):(1'h0)]))) ?
              (wire2 ?
                  reg6[(5'h11):(3'h7)] : {((wire1 <= (8'h9d)) << ((8'ha6) - wire0)),
                      ({reg19, wire3} | reg15)}) : (^~reg13));
          reg21 <= ($signed((~&{reg10[(2'h2):(2'h2)], (!wire1)})) ?
              (reg9[(3'h7):(2'h2)] ?
                  ($signed({reg11}) < ((~reg20) ?
                      $signed(reg5) : $unsigned(reg9))) : reg17) : $signed(wire1));
          reg22 <= wire2[(1'h1):(1'h0)];
        end
      else
        begin
          reg19 <= ($unsigned($unsigned($signed(reg9))) >> (!$signed(((reg22 < reg15) - $unsigned(reg10)))));
          reg20 <= $signed(reg6[(2'h2):(1'h0)]);
          reg21 <= wire3;
          if ($signed((~^($unsigned(reg13) ?
              {(!wire4),
                  reg17[(5'h15):(4'ha)]} : (wire3[(3'h4):(3'h4)] * $signed(reg16))))))
            begin
              reg22 <= reg6[(5'h14):(3'h6)];
            end
          else
            begin
              reg22 <= reg17[(5'h13):(3'h7)];
            end
        end
      reg23 <= reg11[(4'h8):(3'h4)];
      if ((reg6 & wire3))
        begin
          reg24 <= ((!($signed(reg9[(1'h0):(1'h0)]) != ((reg10 >>> (8'ha6)) ?
                  (reg15 ^ reg14) : $unsigned((8'hbc))))) ?
              {wire2[(4'hb):(4'ha)], reg15} : ((~&$unsigned({wire4,
                  (8'hb2)})) ^~ (reg21[(5'h13):(4'hd)] ?
                  reg10 : ($unsigned(wire2) ? (^reg10) : wire0))));
          if (reg18[(3'h6):(2'h2)])
            begin
              reg25 <= (reg21[(2'h2):(1'h0)] ?
                  reg9[(4'ha):(3'h7)] : $unsigned((~^$unsigned($signed((8'hbf))))));
              reg26 <= $unsigned(reg5);
              reg27 <= ((reg15[(3'h5):(2'h3)] ?
                  reg20[(1'h0):(1'h0)] : wire1[(1'h1):(1'h0)]) != (reg11 <= ((reg21 ?
                      (reg7 ? reg10 : reg11) : $unsigned((8'hb8))) ?
                  reg24[(2'h3):(1'h0)] : ((8'hb9) >>> (~wire0)))));
              reg28 <= reg23;
              reg29 <= (((!(-$signed(reg9))) - (^~reg19[(3'h4):(2'h2)])) != ((|((8'hb7) || $signed(reg25))) ?
                  (&(reg7[(1'h0):(1'h0)] ?
                      (reg19 ?
                          (8'hbc) : reg8) : reg17)) : $signed(reg14[(3'h4):(1'h1)])));
            end
          else
            begin
              reg25 <= ((-(&$signed((reg6 ?
                  (8'ha1) : reg29)))) & ($signed(reg11) ?
                  (reg17 ?
                      ($unsigned(reg19) ?
                          (reg21 ?
                              wire1 : wire4) : $unsigned((8'hb4))) : ({reg14,
                          reg26} == $unsigned(reg21))) : (({reg10,
                      reg13} | $unsigned(reg18)) * {$unsigned(reg25),
                      (~&wire0)})));
              reg26 <= reg26[(3'h5):(2'h2)];
            end
        end
      else
        begin
          reg24 <= $unsigned(reg21[(4'h8):(3'h4)]);
        end
      if ($unsigned((reg14 ?
          reg10[(2'h2):(2'h2)] : (reg15 ? reg12 : $unsigned((!(8'hb5)))))))
        begin
          reg30 <= reg9[(4'h8):(1'h1)];
        end
      else
        begin
          reg30 <= ({reg15[(1'h0):(1'h0)]} >= {(|(!(reg24 ? reg30 : reg14)))});
          reg31 <= ($unsigned(((^~(|reg25)) < reg6[(5'h12):(5'h12)])) ?
              (+reg21) : (~^(^~$unsigned($signed(reg29)))));
        end
    end
  assign wire32 = $unsigned($signed(reg11[(3'h4):(1'h0)]));
  assign wire33 = reg17[(3'h6):(2'h3)];
  assign wire34 = reg15;
  assign wire35 = $unsigned((-$signed(reg10[(1'h1):(1'h1)])));
  module36 #() modinst131 (wire130, clk, reg10, reg31, wire3, reg9, wire35);
  assign wire132 = ($signed($signed((&reg7))) ^~ reg25);
  assign wire133 = reg22[(4'h9):(2'h3)];
  module134 #() modinst145 (.wire135(reg10), .clk(clk), .wire137(reg20), .y(wire144), .wire138(wire130), .wire136(wire2));
  always
    @(posedge clk) begin
      if ((($unsigned(reg20[(4'ha):(2'h3)]) == ($signed(wire144[(2'h3):(2'h2)]) ?
              (~$unsigned(wire130)) : $signed((reg27 ^~ reg6)))) ?
          $signed($unsigned(reg8)) : $signed({$unsigned(wire144)})))
        begin
          if ((8'hae))
            begin
              reg146 <= reg7[(4'hd):(4'hc)];
              reg147 <= (|reg146[(1'h0):(1'h0)]);
              reg148 <= reg5;
              reg149 <= reg22;
              reg150 <= $signed((((reg27 ?
                      (reg13 ? reg27 : reg11) : reg146) != $unsigned((8'h9d))) ?
                  $unsigned(reg149[(3'h4):(1'h1)]) : (reg23[(5'h13):(3'h5)] ?
                      ({reg8, reg19} >>> {reg31}) : (|(reg147 ^ wire1)))));
            end
          else
            begin
              reg146 <= $signed(reg21[(3'h4):(3'h4)]);
              reg147 <= ($unsigned(wire133) ^ wire144[(4'h9):(4'h9)]);
              reg148 <= reg18[(3'h7):(2'h2)];
            end
          if ((8'hb9))
            begin
              reg151 <= {$unsigned($signed(($signed(reg24) * (reg12 ?
                      reg15 : wire33))))};
              reg152 <= $signed(reg29[(1'h0):(1'h0)]);
              reg153 <= $unsigned(((reg12[(2'h3):(1'h1)] ?
                  $unsigned({(8'h9e)}) : reg28) == ($unsigned((reg23 ?
                      wire133 : reg23)) ?
                  (~&reg21) : (&$unsigned(wire1)))));
            end
          else
            begin
              reg151 <= (+(^(reg20[(4'h9):(4'h8)] || $signed((~reg15)))));
              reg152 <= (-(reg152[(1'h1):(1'h0)] < $signed({(8'hbf)})));
            end
        end
      else
        begin
          reg146 <= (+$signed(reg19));
          reg147 <= ($signed((8'hb6)) ?
              ((~^$unsigned($signed((8'hb9)))) ~^ (^~{$unsigned((8'hb9)),
                  reg11})) : ((reg28[(1'h1):(1'h1)] ?
                  wire34 : (~&(8'ha3))) & (|((-reg6) ? reg21 : (^~wire3)))));
          reg148 <= (~^$unsigned($signed((((8'ha6) * reg25) ?
              (^(8'had)) : wire35[(4'hf):(4'hf)]))));
          reg149 <= (((reg12[(3'h6):(3'h6)] ? (~|$unsigned(reg26)) : wire35) ?
              $unsigned(wire0[(3'h5):(1'h1)]) : {{(^reg148)},
                  (-reg5[(5'h11):(1'h0)])}) == $signed(wire133));
        end
      reg154 <= (~^$signed({(&(^reg28)), ((|(8'hb2)) + $signed((8'ha2)))}));
    end
  always
    @(posedge clk) begin
      reg155 <= wire0[(2'h3):(2'h2)];
      if (reg22[(4'h8):(3'h5)])
        begin
          reg156 <= {(^(((reg26 ~^ reg11) >> (reg14 | reg30)) >>> reg30[(1'h1):(1'h1)])),
              (reg16[(4'ha):(3'h6)] >>> $unsigned((~&(reg155 >> reg7))))};
          reg157 <= {$unsigned((!reg29))};
          reg158 <= (~$signed((8'haf)));
          reg159 <= (reg28[(1'h1):(1'h0)] ~^ ($signed((~^$unsigned(reg148))) + (~^reg19[(1'h0):(1'h0)])));
        end
      else
        begin
          reg156 <= $unsigned(($signed($signed((~&reg22))) ?
              {{reg26[(1'h0):(1'h0)],
                      $unsigned(reg31)}} : (~|{reg31[(4'h8):(2'h3)]})));
        end
      if ($signed((8'hba)))
        begin
          reg160 <= $signed($signed($signed((wire133[(3'h6):(2'h2)] ?
              (reg153 || reg30) : (reg25 + reg15)))));
          reg161 <= {reg5, reg11};
          reg162 <= $unsigned(((!((~|reg152) ?
              (&reg19) : (reg8 == reg158))) ~^ reg152[(2'h2):(2'h2)]));
        end
      else
        begin
          reg160 <= ({$signed(($signed(reg25) ? $signed(wire0) : {reg28}))} ?
              reg147[(1'h0):(1'h0)] : {(^$unsigned((reg147 >= reg162))),
                  ($signed((wire4 ? reg30 : (8'hac))) ^~ (+(reg14 ?
                      reg16 : wire4)))});
        end
      reg163 <= (+reg162[(2'h3):(1'h1)]);
      reg164 <= $unsigned(reg31[(4'hf):(2'h3)]);
    end
  assign wire165 = ({{reg6[(5'h11):(3'h4)]},
                       (&((reg159 && wire34) ?
                           wire0[(2'h3):(2'h3)] : $signed(reg147)))} < (|($unsigned($signed(reg10)) << (~^(reg7 | reg27)))));
  assign wire166 = $signed(($signed(((reg159 ? (8'hbe) : reg20) ?
                       {wire132} : {reg5,
                           wire1})) || (($signed(reg153) > (reg28 ?
                           (8'ha3) : reg30)) ?
                       (reg162[(2'h2):(2'h2)] ? reg22 : reg5) : (8'hbe))));
endmodule

module module134
#(parameter param143 = ({(&(((8'hb3) > (8'hbb)) ? (-(8'hbf)) : ((8'ha0) ? (8'hb4) : (8'h9e))))} ? (((~|(|(7'h40))) ? ((^~(7'h41)) ? ((8'ha2) != (8'hb3)) : ((8'hb1) ? (8'hb3) : (8'hb1))) : (-((8'ha0) ? (7'h44) : (8'hb7)))) ? ((^((8'hbe) && (8'hb1))) && (!((8'hb8) ? (8'hb5) : (8'ha4)))) : (8'hba)) : ((+(((8'ha6) ? (8'ha5) : (8'hae)) >= (|(8'ha9)))) ? (8'hae) : (^~{((8'ha1) ? (8'had) : (8'ha8)), ((8'ha8) ? (8'hbb) : (8'hb0))}))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire138;
  input wire [(4'ha):(1'h0)] wire137;
  input wire signed [(5'h14):(1'h0)] wire136;
  input wire signed [(4'hd):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  assign y = {wire142, wire141, wire140, wire139, (1'h0)};
  assign wire139 = $unsigned((($signed(wire135[(3'h5):(2'h3)]) >>> (wire138[(4'h8):(3'h4)] ?
                           wire137[(3'h4):(1'h1)] : $unsigned(wire136))) ?
                       wire138 : wire136));
  assign wire140 = $signed(wire136);
  assign wire141 = $signed((^wire140[(2'h3):(2'h3)]));
  assign wire142 = ({wire138[(4'ha):(3'h4)]} ^ $unsigned((-wire138)));
endmodule

module module36
#(parameter param129 = {(~&(((+(8'hbd)) ? ((8'hbf) ~^ (8'ha2)) : ((8'ha7) ? (8'h9c) : (8'ha0))) ? {{(8'haa)}, ((8'hbe) ^ (8'h9c))} : (+((8'hbe) - (8'hb7)))))})
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire [(3'h7):(1'h0)] wire39;
  input wire signed [(4'he):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire119;
  wire signed [(3'h6):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire103;
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire119,
                 wire118,
                 wire56,
                 wire103,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg120,
                 reg117,
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
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= $signed($unsigned($signed($signed(((8'hb1) >= wire37)))));
    end
  module43 #() modinst57 (wire56, clk, wire39, wire40, wire37, wire41, wire38);
  module58 #() modinst104 (wire103, clk, wire40, reg42, wire38, wire39);
  always
    @(posedge clk) begin
      if ((wire40[(3'h4):(1'h0)] > $unsigned($signed((((8'hb0) << wire56) ?
          wire41 : $signed(wire56))))))
        begin
          reg105 <= $signed({(((~&wire37) + $signed(wire40)) >>> (+(~^wire40)))});
          if ({reg105,
              (wire56[(3'h4):(1'h1)] ?
                  (wire56 ?
                      $unsigned(wire41) : $unsigned(wire56)) : wire37[(5'h10):(2'h3)])})
            begin
              reg106 <= wire38;
            end
          else
            begin
              reg106 <= $signed($signed(wire37[(4'he):(4'h8)]));
              reg107 <= wire38;
              reg108 <= (wire38 ?
                  wire37[(4'hc):(4'ha)] : (wire37[(4'hb):(4'h8)] + (~|((wire37 || reg106) || reg42))));
              reg109 <= $signed(reg42[(3'h7):(3'h5)]);
              reg110 <= $unsigned((~(wire56[(2'h2):(1'h0)] ?
                  (-((7'h43) < wire38)) : wire41)));
            end
          reg111 <= (&wire56);
          if (($unsigned(reg108) * $signed(($signed((wire103 <<< wire40)) <<< wire56[(2'h3):(1'h1)]))))
            begin
              reg112 <= (reg109 * (|$unsigned(($unsigned(wire40) ?
                  $unsigned(wire38) : ((7'h42) ? reg111 : reg111)))));
              reg113 <= $signed(reg109[(2'h3):(2'h2)]);
              reg114 <= wire39;
              reg115 <= reg110[(1'h0):(1'h0)];
            end
          else
            begin
              reg112 <= $signed($signed(reg111));
              reg113 <= ((wire41[(5'h14):(4'h9)] <= wire56) ?
                  $signed(wire40[(4'ha):(4'h9)]) : $unsigned(((!{reg110,
                      (8'ha9)}) ^~ {(&wire38)})));
              reg114 <= reg107[(3'h7):(3'h5)];
              reg115 <= (+($unsigned((&{reg114})) ?
                  reg105 : ((~^reg110) ?
                      $unsigned((reg114 >> wire37)) : wire37[(4'he):(3'h4)])));
              reg116 <= wire37[(4'he):(3'h5)];
            end
        end
      else
        begin
          reg105 <= (-$signed(($unsigned($unsigned(wire39)) ?
              $unsigned($signed((8'hbd))) : (((8'hbd) ?
                  wire39 : wire40) != {reg105, (8'ha7)}))));
          reg106 <= ($unsigned(($signed((wire39 ^~ wire103)) ?
              $unsigned((^reg112)) : ($unsigned(reg42) ^~ $unsigned(reg114)))) > $unsigned($signed(wire103[(3'h5):(2'h2)])));
          if ({(~|(wire56[(2'h3):(1'h1)] < ($signed(wire41) ?
                  (reg111 ? reg115 : reg42) : $unsigned(wire41)))),
              (~({(reg114 ?
                      reg110 : wire56)} ^ ({wire37} << $unsigned(reg112))))})
            begin
              reg107 <= $signed((-wire103[(3'h7):(1'h1)]));
              reg108 <= ($signed(reg105) ?
                  $signed((reg106 ~^ ((wire56 > reg107) ?
                      (8'ha3) : reg109))) : (reg109[(2'h2):(1'h0)] ?
                      {{reg109[(2'h3):(1'h1)], (reg107 ? reg108 : reg106)},
                          ({reg113} ?
                              $signed(reg108) : (&reg116))} : {$unsigned(reg110),
                          ((^~(8'ha1)) ?
                              wire56[(2'h2):(1'h0)] : (reg114 ?
                                  wire37 : reg110))}));
              reg109 <= (-{(~(|{reg113, reg114}))});
              reg110 <= (~^((+((^reg115) ? (~&reg42) : {reg114, wire40})) ?
                  ({wire103,
                      reg42} | $unsigned(wire103[(3'h6):(3'h6)])) : wire103[(3'h5):(2'h2)]));
            end
          else
            begin
              reg107 <= $unsigned(($unsigned(reg108[(4'he):(2'h3)]) * reg106));
              reg108 <= ({{$signed(((7'h42) & reg105))}} ?
                  $signed((reg115 ?
                      {wire40,
                          $unsigned(reg108)} : wire40[(1'h0):(1'h0)])) : wire38);
              reg109 <= ($signed(((reg107[(2'h3):(1'h0)] == (wire56 - wire40)) >>> reg109[(1'h0):(1'h0)])) * $unsigned((-(~&(reg111 >>> (8'hac))))));
            end
          if ($signed((~|reg108)))
            begin
              reg111 <= ($unsigned(reg115[(3'h4):(1'h0)]) != (+((&((8'ha5) ?
                  wire41 : reg105)) >>> reg109)));
              reg112 <= (~^reg115);
              reg113 <= (reg109[(3'h4):(1'h0)] - (|$unsigned($unsigned(wire103))));
              reg114 <= reg112[(3'h7):(1'h0)];
            end
          else
            begin
              reg111 <= {(|$signed((+reg109[(3'h4):(1'h0)])))};
              reg112 <= (($unsigned((&$unsigned(reg111))) ?
                  (~reg116[(3'h4):(2'h2)]) : reg109) >> (wire41 < reg42));
              reg113 <= ((8'hb2) ~^ reg105[(4'h9):(4'h9)]);
              reg114 <= $signed((reg113[(3'h6):(2'h2)] == (reg109[(1'h0):(1'h0)] ?
                  $unsigned((reg110 | reg106)) : $signed(reg112))));
            end
        end
      reg117 <= {$unsigned(reg110)};
    end
  assign wire118 = reg117;
  assign wire119 = (8'h9c);
  always
    @(posedge clk) begin
      reg120 <= (-(reg117 ~^ reg105[(4'ha):(3'h6)]));
    end
  assign wire121 = $unsigned(reg42[(3'h4):(1'h0)]);
  assign wire122 = (reg106[(1'h1):(1'h0)] ^~ reg113[(3'h6):(3'h4)]);
  assign wire123 = (reg112 ?
                       (8'ha8) : $unsigned($signed($unsigned(((8'hb7) == reg120)))));
  always
    @(posedge clk) begin
      reg124 <= wire103;
      reg125 <= reg106;
      reg126 <= reg120[(1'h1):(1'h1)];
      reg127 <= (|(reg105 ~^ wire122[(3'h6):(3'h6)]));
      reg128 <= wire122;
    end
endmodule

module module58
#(parameter param102 = ((((((8'hac) ? (7'h41) : (8'ha2)) ? (&(8'ha8)) : ((8'h9f) ? (8'hb8) : (7'h41))) ? (((8'hbc) ? (7'h43) : (8'ha6)) == (^~(8'hbd))) : (((8'hb6) == (7'h44)) ? ((7'h41) ? (8'hba) : (8'ha7)) : ((8'hb3) < (8'ha2)))) ? ((((8'ha3) ? (8'hb7) : (8'haa)) ? ((8'hb6) ? (8'had) : (8'ha4)) : (&(8'had))) ? ((~|(7'h44)) ? ((8'hb3) ^~ (7'h41)) : (+(8'haa))) : ({(8'had), (8'hb6)} ? {(8'ha6), (8'haa)} : ((7'h43) > (8'h9c)))) : (({(8'h9e), (7'h43)} - (~^(8'hab))) <= {((8'haa) + (8'hb9)), ((8'hb3) <= (8'hbe))})) & ((~|(+{(8'hac), (8'ha9)})) | ((!(~|(8'hbc))) ^~ {(-(8'ha3)), (~&(8'hb5))}))))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire62;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire [(4'hb):(1'h0)] wire60;
  input wire signed [(3'h4):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  assign y = {wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire72,
                 wire71,
                 wire70,
                 wire64,
                 wire63,
                 reg100,
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
                 reg73,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire63 = {{$unsigned(($signed(wire62) ? wire59 : (&wire62)))}};
  assign wire64 = (8'hb8);
  always
    @(posedge clk) begin
      reg65 <= $signed($signed((wire63[(3'h6):(1'h0)] ?
          ($unsigned((8'hac)) ? $signed(wire61) : wire59) : wire59)));
      reg66 <= $unsigned((($signed({(8'ha7), wire62}) || {(~&(8'hb3)),
          $unsigned(wire61)}) ^~ (~&reg65[(1'h0):(1'h0)])));
      reg67 <= (^~((-$signed((~&wire64))) >> wire64[(1'h0):(1'h0)]));
      reg68 <= (wire61 ?
          wire64[(1'h1):(1'h0)] : $unsigned((reg65[(1'h0):(1'h0)] >= {{wire60},
              $unsigned((8'ha0))})));
      reg69 <= (reg67 == $unsigned({wire61}));
    end
  assign wire70 = reg68;
  assign wire71 = (~|$signed($unsigned(reg67[(4'h8):(3'h5)])));
  assign wire72 = $unsigned((+$unsigned({(-wire63)})));
  always
    @(posedge clk) begin
      reg73 <= $signed((reg66 ~^ reg65[(1'h1):(1'h0)]));
      reg74 <= reg73;
      reg75 <= $unsigned({($unsigned((~^reg74)) ?
              ($signed(wire59) && (wire61 & wire63)) : ({wire59, reg73} ?
                  reg69[(2'h2):(2'h2)] : wire72)),
          $unsigned(((reg67 ? (8'hbb) : wire71) ?
              (wire59 != wire70) : (reg73 ? reg69 : reg69)))});
      reg76 <= $unsigned(((wire70 >= ((wire62 && (8'hb1)) <<< $unsigned(wire62))) > $signed((+{(8'hb8)}))));
      reg77 <= reg67;
    end
  always
    @(posedge clk) begin
      reg78 <= wire70[(1'h0):(1'h0)];
      reg79 <= ((8'hb9) < (~|((wire60[(4'h8):(3'h7)] < $unsigned(wire64)) <<< ((reg68 <<< wire61) ?
          {reg66} : (wire70 ? wire71 : reg68)))));
      if ((wire70[(2'h2):(1'h0)] ?
          ($unsigned(((wire61 ? wire59 : reg79) ? reg75 : reg69)) ?
              ($signed($signed((8'ha5))) - (^reg65)) : wire62) : ($signed(((reg69 + (8'hbb)) >>> (~|reg76))) ?
              (^$unsigned($signed(wire63))) : $unsigned(((wire61 ?
                      (8'hbe) : reg67) ?
                  (reg67 ? wire62 : (8'ha1)) : (reg79 * reg76))))))
        begin
          if (((-$unsigned($signed($unsigned(wire70)))) ^ ((reg79[(4'h8):(3'h7)] > ((reg65 ?
                      (8'hb7) : wire71) ?
                  $signed(wire61) : reg67)) ?
              $signed($signed(wire62[(3'h6):(3'h4)])) : {((reg65 == wire59) + (reg73 > wire63))})))
            begin
              reg80 <= $unsigned((!reg74[(3'h6):(3'h5)]));
              reg81 <= $signed($signed($unsigned((~^(+reg67)))));
            end
          else
            begin
              reg80 <= {$unsigned($unsigned((wire61[(2'h2):(2'h2)] ?
                      $signed(reg67) : $unsigned(reg78)))),
                  wire72[(3'h5):(3'h4)]};
              reg81 <= (($signed(reg75) ?
                  (((!wire63) && (~reg73)) + wire62[(3'h5):(1'h0)]) : reg69[(2'h3):(1'h1)]) == (8'h9e));
              reg82 <= wire59;
              reg83 <= $signed(wire72[(2'h3):(2'h2)]);
              reg84 <= (~&{{{reg74[(1'h0):(1'h0)]}},
                  ($signed({wire59, reg82}) - reg79[(4'hf):(4'hd)])});
            end
          reg85 <= reg82;
        end
      else
        begin
          reg80 <= {$signed($signed((~|$unsigned(reg66))))};
          reg81 <= reg74;
          if ((8'hba))
            begin
              reg82 <= {wire64[(3'h5):(3'h5)]};
              reg83 <= (((reg74[(3'h4):(3'h4)] ?
                      reg66 : reg73[(1'h1):(1'h0)]) * $signed(wire61[(1'h0):(1'h0)])) ?
                  $unsigned(((8'ha8) << reg85)) : (~|wire72));
              reg84 <= $unsigned(wire62);
              reg85 <= {{wire63[(3'h5):(2'h2)],
                      $unsigned(((reg78 ? reg75 : (8'ha7)) <<< (&reg84)))},
                  reg76};
              reg86 <= reg81[(5'h12):(2'h2)];
            end
          else
            begin
              reg82 <= (((reg66[(1'h0):(1'h0)] ?
                  ((~|(8'hb3)) ?
                      $unsigned(reg76) : ((8'hae) - reg69)) : (~|(~|wire64))) + {wire72,
                  ($unsigned(reg83) ?
                      (&wire72) : (reg81 ?
                          wire61 : wire59))}) == (~$unsigned($signed(reg74))));
              reg83 <= $unsigned(reg68);
              reg84 <= ({({(reg82 ~^ reg81),
                          (wire70 ?
                              reg81 : reg77)} - (reg84[(1'h1):(1'h1)] || wire70))} ?
                  (wire59[(1'h1):(1'h1)] == (-((8'hb2) ?
                      (8'hbe) : (wire62 ?
                          reg73 : (8'hae))))) : $signed($unsigned(reg83)));
              reg85 <= ($unsigned($unsigned($unsigned((&reg73)))) ?
                  (reg85[(1'h0):(1'h0)] & (|(reg76[(3'h5):(1'h0)] >= reg80[(3'h6):(1'h1)]))) : (((~((8'ha4) * (7'h44))) ?
                      (~$unsigned(reg75)) : {((8'hb2) ? reg80 : reg86),
                          (reg73 || reg76)}) < reg81));
            end
        end
    end
  always
    @(posedge clk) begin
      reg87 <= ((wire71[(3'h6):(2'h3)] ^ {$signed(reg83[(3'h6):(3'h5)])}) < $unsigned($signed($unsigned({reg85}))));
      reg88 <= (~$unsigned((&$signed(reg75))));
      reg89 <= ({($unsigned(reg86[(3'h7):(2'h3)]) ?
                  (8'ha4) : wire63[(2'h3):(1'h1)]),
              reg82} ?
          $signed(reg88) : wire70[(2'h3):(2'h3)]);
      if ($unsigned(((^~((wire64 <= wire62) ? {reg87} : ((8'ha6) != reg87))) ?
          reg80[(4'h9):(1'h1)] : $signed((^~(reg75 ? wire71 : reg76))))))
        begin
          reg90 <= $signed($signed({({reg79} ?
                  reg89[(4'h9):(1'h0)] : wire60[(4'h9):(1'h1)])}));
          if ($unsigned((~^$signed($unsigned(wire70[(2'h3):(1'h0)])))))
            begin
              reg91 <= {(((&$unsigned(reg65)) <= $signed(reg67)) + (~|$unsigned(reg66))),
                  $unsigned($unsigned((+$unsigned(reg78))))};
              reg92 <= (reg75[(3'h4):(2'h3)] ?
                  (8'ha6) : (-(reg85[(3'h4):(1'h0)] ?
                      $signed(((7'h41) ?
                          reg73 : wire70)) : ((wire59 <= reg83) > reg74))));
              reg93 <= (({$unsigned($unsigned(reg80)),
                      ({reg90} ?
                          $signed((8'ha2)) : ((8'hb2) ?
                              reg69 : wire60))} >>> (+$signed(wire63))) ?
                  ($unsigned($signed($signed(reg79))) == (reg84[(3'h4):(2'h2)] & ((|(8'hb2)) ?
                      $signed(wire59) : (^~reg80)))) : $unsigned($unsigned(reg83[(3'h7):(3'h6)])));
              reg94 <= $signed((~|$unsigned((!$signed(reg92)))));
            end
          else
            begin
              reg91 <= $signed((~&$signed((|reg68[(1'h0):(1'h0)]))));
            end
        end
      else
        begin
          reg90 <= $signed(reg65[(4'hd):(3'h6)]);
          if (reg68)
            begin
              reg91 <= (~reg65[(1'h0):(1'h0)]);
              reg92 <= ($unsigned(reg83[(1'h0):(1'h0)]) >> ((((reg78 ?
                          reg89 : wire63) ?
                      (wire63 ? reg73 : reg88) : (|wire72)) ?
                  $signed(reg67[(3'h5):(1'h0)]) : $signed((reg89 | reg68))) || $signed(wire71[(3'h4):(3'h4)])));
              reg93 <= {(reg91 ~^ ($unsigned($signed(wire70)) ^ {reg87[(2'h2):(1'h1)]})),
                  (|(reg81[(4'hd):(4'hc)] ?
                      $unsigned($unsigned((8'hbb))) : (^~(reg81 - wire60))))};
              reg94 <= (+reg74[(2'h3):(1'h1)]);
            end
          else
            begin
              reg91 <= $signed((($signed((reg67 ? reg84 : wire62)) ?
                  {wire70,
                      ((8'hb4) && wire63)} : (~|(8'ha0))) + $unsigned((^(reg77 != reg81)))));
              reg92 <= (+(~(($unsigned(reg88) ? reg93 : reg85) ?
                  (wire60[(3'h6):(3'h5)] ^~ {reg90}) : $unsigned((wire59 ?
                      reg90 : reg74)))));
              reg93 <= reg89;
              reg94 <= reg90;
            end
          reg95 <= (~^((+((reg67 ? (8'haf) : reg65) ?
              (+reg80) : (wire70 ? reg65 : reg87))) || reg91));
        end
    end
  assign wire96 = reg83[(2'h2):(1'h1)];
  assign wire97 = $unsigned(reg65);
  assign wire98 = ($unsigned(($unsigned($unsigned(wire97)) ^~ $signed((reg94 + reg73)))) ^ $signed((&(&{reg79}))));
  assign wire99 = ($unsigned((wire98[(1'h1):(1'h1)] ?
                          (((8'hb1) ? reg66 : wire64) ?
                              reg87 : (reg79 ? reg86 : wire97)) : (8'ha5))) ?
                      (-(~(+(-(8'haa))))) : $unsigned((|(~|wire97))));
  always
    @(posedge clk) begin
      reg100 <= ((reg80 & {reg86}) >= $signed((reg94 ?
          $signed((reg80 ^~ (8'hac))) : {(reg85 ? reg87 : reg66),
              wire70[(2'h3):(1'h0)]})));
    end
  assign wire101 = (((($unsigned((8'hbd)) ?
                       {wire72,
                           reg77} : reg89[(3'h6):(2'h3)]) == $unsigned(((8'ha6) || reg84))) * {wire71[(4'he):(4'hc)],
                       ({reg79,
                           wire61} + $signed(wire96))}) >= reg92[(3'h6):(1'h1)]);
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire48;
  input wire [(4'h8):(1'h0)] wire47;
  input wire signed [(5'h15):(1'h0)] wire46;
  input wire [(4'hb):(1'h0)] wire45;
  input wire [(2'h2):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  assign y = {wire55, wire54, wire53, wire52, wire51, wire50, wire49, (1'h0)};
  assign wire49 = $signed($signed(wire47));
  assign wire50 = $signed(wire49[(4'hc):(1'h1)]);
  assign wire51 = $signed((!(~|(+$signed(wire49)))));
  assign wire52 = $unsigned({(wire45 - (~(wire47 ? wire51 : (8'hb4))))});
  assign wire53 = (^~(^~wire52));
  assign wire54 = wire51[(4'hf):(4'ha)];
  assign wire55 = ((~|$unsigned($unsigned(wire52))) ?
                      (8'hb0) : {{{$unsigned(wire53), $unsigned(wire53)},
                              wire52[(5'h11):(4'hc)]}});
endmodule

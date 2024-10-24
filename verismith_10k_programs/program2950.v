module top
#(parameter param174 = ((({((8'hb7) + (8'h9f)), ((8'hb9) * (8'hbd))} ^ ((8'h9e) ^~ (8'haa))) ? ((8'hb0) & {(~^(8'hbd))}) : {(((8'hba) << (7'h44)) ? (8'hb2) : (8'haa))}) ? (((~^(~(8'ha4))) <<< ((~&(7'h40)) << ((7'h40) ? (8'hbc) : (8'ha7)))) ? (~&((~|(7'h42)) ? ((7'h41) ? (8'ha1) : (8'ha2)) : ((8'h9e) - (8'h9d)))) : ((~&((8'ha0) ? (8'hbe) : (8'hac))) ~^ (((8'ha8) << (8'hab)) >= (+(8'hb9))))) : ((((|(8'hbc)) && ((8'h9e) ? (8'ha7) : (8'ha1))) >>> (((8'hab) + (7'h44)) ? ((8'hb7) ? (8'hbf) : (8'hba)) : (!(7'h41)))) | ((&((8'hb7) >>> (8'hb3))) ? (-((8'ha3) - (8'ha3))) : (8'h9c)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire173;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire171;
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg4 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  assign y = {wire173,
                 wire6,
                 wire7,
                 wire8,
                 wire112,
                 wire114,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire122,
                 wire171,
                 reg5,
                 reg4,
                 reg119,
                 reg120,
                 reg121,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {(|(8'hba)), $signed($signed($signed((wire3 ^~ wire0))))};
      reg5 <= wire0;
    end
  assign wire6 = {(&($signed(((8'hb1) ? reg5 : reg4)) ?
                         reg4 : (wire0[(3'h5):(1'h0)] << (wire1 != wire0))))};
  assign wire7 = $unsigned(wire6[(2'h2):(2'h2)]);
  assign wire8 = ((8'ha4) || (wire0[(2'h2):(1'h0)] <<< (~&$signed((wire3 > wire7)))));
  module9 #() modinst113 (.clk(clk), .wire10(wire3), .wire14(wire7), .wire13(wire6), .wire11(wire2), .y(wire112), .wire12(reg5));
  assign wire114 = wire7;
  assign wire115 = (&($signed(wire112[(1'h0):(1'h0)]) ?
                       (($unsigned((8'had)) - $signed(wire8)) ^ $signed(wire3[(3'h6):(2'h3)])) : (-wire114[(1'h1):(1'h1)])));
  assign wire116 = wire115[(1'h0):(1'h0)];
  assign wire117 = wire7;
  assign wire118 = ((~((reg5[(2'h2):(2'h2)] | $signed(wire115)) + ((wire115 == wire0) == {(8'ha4),
                           wire112}))) ?
                       (wire112[(4'h8):(4'h8)] ?
                           $unsigned(((wire8 - wire0) ?
                               {wire7} : {wire8})) : $unsigned(((^wire1) ?
                               (~wire2) : wire3))) : $signed(wire3[(5'h10):(2'h2)]));
  always
    @(posedge clk) begin
      reg119 <= wire1;
      reg120 <= ({((wire1[(2'h3):(2'h3)] <<< (8'ha5)) - (|(!wire0)))} ?
          $unsigned((wire114 ?
              {(wire8 * wire116), $unsigned(wire8)} : (~&{wire115,
                  wire118}))) : ($signed($signed(wire118)) ?
              ({$unsigned(wire7), wire7[(3'h5):(2'h3)]} <<< wire2) : reg4));
    end
  always
    @(posedge clk) begin
      reg121 <= $signed((-($signed($unsigned(wire117)) + wire2[(2'h3):(1'h1)])));
    end
  assign wire122 = (~|wire115);
  module123 #() modinst172 (.y(wire171), .wire126(wire3), .wire125(reg120), .wire124(wire0), .wire127(wire122), .clk(clk));
  assign wire173 = {wire118[(2'h2):(1'h0)]};
endmodule

module module123  (y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire126;
  input wire signed [(5'h14):(1'h0)] wire125;
  input wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire170;
  wire [(4'h9):(1'h0)] wire169;
  wire signed [(3'h7):(1'h0)] wire168;
  wire [(3'h7):(1'h0)] wire167;
  wire [(3'h4):(1'h0)] wire138;
  wire [(3'h5):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire128;
  reg signed [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire138,
                 wire132,
                 wire128,
                 reg166,
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
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire128 = wire124;
  always
    @(posedge clk) begin
      reg129 <= wire126[(3'h6):(2'h3)];
      reg130 <= (~^(8'ha1));
      reg131 <= $signed($unsigned($signed(wire126[(3'h4):(3'h4)])));
    end
  assign wire132 = wire126[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg133 <= $signed($unsigned(reg131));
      reg134 <= ((7'h41) ?
          $unsigned($signed((wire128[(4'hc):(2'h3)] ?
              reg133 : (8'h9c)))) : wire132[(2'h3):(2'h2)]);
      reg135 <= (^~$signed(reg129[(4'hb):(4'h8)]));
      reg136 <= $signed((reg131 ?
          (wire132 ?
              (wire132[(3'h4):(2'h2)] ^ $unsigned(reg134)) : (~&((8'hb9) * (8'haa)))) : (|wire128)));
      reg137 <= wire128[(3'h4):(1'h0)];
    end
  assign wire138 = wire124[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed(reg129))
        begin
          if ({($signed(wire125) < (wire132[(1'h1):(1'h0)] ?
                  $unsigned($unsigned(reg130)) : $unsigned($unsigned(wire124)))),
              (^(^~$unsigned($signed(reg133))))})
            begin
              reg139 <= wire128;
            end
          else
            begin
              reg139 <= (&reg129);
              reg140 <= $signed((~(reg136[(1'h0):(1'h0)] ?
                  wire125 : reg136[(5'h13):(1'h1)])));
              reg141 <= ($signed($unsigned((|reg131))) >= $signed($signed(((wire126 == reg134) - $signed(reg135)))));
              reg142 <= $unsigned(wire132);
              reg143 <= reg129;
            end
          reg144 <= (&reg134[(4'h9):(3'h4)]);
          reg145 <= (+reg129);
          if ({(~|(!$unsigned((-reg143)))), reg143})
            begin
              reg146 <= $signed(($unsigned((+((8'ha1) ?
                  reg135 : reg142))) ~^ $signed((!reg130))));
            end
          else
            begin
              reg146 <= reg135[(4'hb):(1'h0)];
            end
        end
      else
        begin
          reg139 <= $signed(reg140[(3'h7):(3'h7)]);
          reg140 <= reg134;
          reg141 <= (((^~({wire138, wire126} ?
              (reg137 <= reg137) : (-wire138))) == ({reg130[(5'h13):(4'h9)],
              {(8'ha3)}} || $signed(reg140))) != reg146[(1'h0):(1'h0)]);
          reg142 <= {(8'h9c)};
        end
      reg147 <= (($unsigned($signed((reg135 ? reg144 : wire124))) ?
              $signed((reg142 ?
                  $unsigned(wire138) : (reg139 <= reg142))) : (-((+reg140) ?
                  $unsigned(wire125) : (reg140 ? reg134 : reg140)))) ?
          (~^$unsigned((&{wire124, reg135}))) : {$unsigned(reg139)});
      if ((|$signed($unsigned((reg141[(2'h2):(1'h1)] ?
          (+(8'hbd)) : wire125[(5'h12):(4'hf)])))))
        begin
          reg148 <= $unsigned((reg139[(1'h1):(1'h0)] ?
              (7'h44) : $unsigned($signed(wire125))));
          reg149 <= wire125;
          reg150 <= (&$unsigned($signed($unsigned((8'hb6)))));
          if ((~^$signed({((reg141 ? reg143 : reg139) - ((8'hb7) ?
                  reg150 : reg145)),
              $signed(reg149)})))
            begin
              reg151 <= (8'hac);
              reg152 <= ($unsigned((8'hb5)) ?
                  {((wire126[(5'h10):(3'h4)] << (reg134 > wire125)) ?
                          $signed(reg136) : reg144)} : $signed({(+$unsigned((8'hb0)))}));
              reg153 <= ($signed((+(!$signed((8'ha5))))) - (^~reg140));
              reg154 <= reg145[(4'he):(4'hc)];
              reg155 <= (8'hbe);
            end
          else
            begin
              reg151 <= (reg129[(5'h10):(4'he)] && $signed((+(8'hb7))));
              reg152 <= (8'ha4);
              reg153 <= wire124[(3'h7):(2'h3)];
            end
        end
      else
        begin
          reg148 <= $signed($signed(((-$unsigned(wire128)) ?
              (~&$unsigned(wire124)) : (~|(reg147 & reg131)))));
        end
    end
  always
    @(posedge clk) begin
      if (reg149[(3'h5):(3'h5)])
        begin
          reg156 <= (8'h9d);
          reg157 <= (reg147 ?
              $unsigned((!$signed(reg149))) : $unsigned(({(reg129 & (8'haa)),
                  reg154[(2'h3):(2'h2)]} > ((|reg136) ?
                  (wire124 << reg141) : $signed(reg151)))));
          reg158 <= ($unsigned($unsigned((reg149 ?
              (^reg144) : $unsigned(reg137)))) ~^ (wire132 ?
              $signed($signed({wire125})) : (($unsigned(reg140) ?
                  (reg152 <= reg145) : $signed((7'h41))) ^ wire128[(4'hf):(1'h0)])));
        end
      else
        begin
          reg156 <= $unsigned(reg139);
          reg157 <= (reg154[(1'h1):(1'h1)] * reg154[(4'ha):(4'h9)]);
          reg158 <= $unsigned(wire124);
          reg159 <= (~&(reg141[(2'h2):(2'h2)] <= reg142));
          if ({reg154[(1'h1):(1'h0)]})
            begin
              reg160 <= (^~$signed(wire127[(4'hc):(1'h1)]));
              reg161 <= ($unsigned((^((reg140 ?
                  (7'h44) : reg133) & {reg145}))) || (^~((+(^~reg147)) >> {(reg144 ?
                      reg136 : (8'h9f))})));
              reg162 <= ((~|$unsigned((wire124 ?
                  $unsigned((8'ha2)) : reg159))) | (^~((reg156 ?
                      $unsigned(reg159) : reg133[(1'h1):(1'h0)]) ?
                  ($unsigned(reg145) ~^ $unsigned(reg160)) : (~(reg161 ?
                      reg144 : (8'had))))));
              reg163 <= (reg151[(3'h6):(2'h2)] != $unsigned((!$unsigned((^reg161)))));
              reg164 <= (reg139[(3'h5):(2'h2)] ?
                  ((reg134 | $unsigned({reg135})) == reg156) : reg150[(1'h0):(1'h0)]);
            end
          else
            begin
              reg160 <= (reg129 + $signed(((7'h44) ?
                  {(~(7'h42)), (~reg129)} : ({(8'hab)} ?
                      (reg161 < reg131) : reg134))));
            end
        end
      reg165 <= {(-(^~reg135[(3'h6):(3'h4)])),
          (!$unsigned($signed($unsigned(reg144))))};
      reg166 <= ({{(wire132 & ((8'hbf) | wire128))},
          (~(^$signed((8'hbf))))} != (8'hba));
    end
  assign wire167 = $unsigned(reg158[(3'h6):(3'h5)]);
  assign wire168 = reg136[(4'hf):(3'h6)];
  assign wire169 = (($signed(wire138) < ((|$signed(reg154)) ?
                           wire168 : ((reg137 ? wire125 : wire128) <= (wire124 ?
                               reg155 : reg147)))) ?
                       reg142 : ((wire138 ?
                           ((reg143 << reg151) < (~|reg143)) : reg145) * ((&(reg134 ?
                           reg163 : reg131)) * $unsigned(reg161[(4'hb):(4'ha)]))));
  assign wire170 = wire127[(4'h9):(1'h0)];
endmodule

module module9
#(parameter param110 = ({((((7'h42) && (8'ha3)) ^~ ((8'ha1) ? (8'hb0) : (7'h44))) ? ((~&(8'hbb)) ? (~^(8'had)) : (^(8'ha4))) : ((^(7'h41)) ? (~&(8'hbd)) : (&(8'ha5))))} * (~&((^~{(8'ha7), (8'hab)}) > (((8'hb7) ? (8'h9d) : (7'h42)) ? {(8'hb5)} : ((8'ha4) * (8'h9d)))))), 
parameter param111 = {({{(param110 ? param110 : param110), param110}, param110} ? (+(-(~(8'h9f)))) : (((^param110) * param110) ? (param110 == {param110}) : (~|param110))), (param110 << param110)})
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire15;
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire106,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire59,
                 wire57,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire15,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg61,
                 (1'h0)};
  assign wire15 = $signed($unsigned($signed($signed(wire10[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($signed(($signed(wire14) >= $signed((8'hb7)))))
        begin
          reg16 <= (-$unsigned($signed((^~wire10[(1'h1):(1'h0)]))));
          reg17 <= (!wire15[(4'he):(3'h4)]);
        end
      else
        begin
          reg16 <= wire11;
        end
    end
  always
    @(posedge clk) begin
      reg18 <= (~{$signed((~^(wire10 <<< wire15))), (|$signed((~reg16)))});
      reg19 <= $unsigned(({(8'hac), (8'ha0)} ~^ reg18[(4'hb):(1'h0)]));
      if (wire15)
        begin
          reg20 <= reg19;
          reg21 <= (^wire10);
          reg22 <= $signed({wire14});
          if ($signed(($unsigned((reg20[(3'h7):(2'h2)] ~^ (8'hab))) ~^ ($unsigned({wire11}) <= reg21))))
            begin
              reg23 <= wire13;
              reg24 <= $unsigned($signed(($unsigned((^reg21)) ?
                  wire10 : $signed({reg17}))));
              reg25 <= wire13;
            end
          else
            begin
              reg23 <= reg21[(4'h8):(2'h3)];
              reg24 <= {$unsigned(((-$signed((7'h43))) ?
                      $unsigned($unsigned((8'ha1))) : (~|$unsigned((8'hb0))))),
                  (($unsigned((wire11 ? wire13 : wire10)) ?
                      $signed({reg25}) : $signed($unsigned((8'h9e)))) >>> (^$signed(wire13)))};
              reg25 <= (~&($unsigned(((^wire13) ? reg18 : (8'ha3))) ?
                  $signed($unsigned((reg19 > wire11))) : reg18[(4'hf):(4'hf)]));
              reg26 <= ((~&($signed((wire14 ?
                  reg18 : wire13)) ^ {$unsigned(wire13)})) + ($signed(wire14) ?
                  (reg22[(3'h5):(2'h2)] ? (~reg23) : wire14) : reg20));
            end
          reg27 <= (wire15 ?
              reg21 : ($unsigned($unsigned(wire10[(4'hf):(4'h9)])) ?
                  reg16[(5'h13):(5'h10)] : reg23[(3'h5):(2'h2)]));
        end
      else
        begin
          reg20 <= $signed($unsigned($unsigned($unsigned(wire11[(4'h8):(2'h3)]))));
          reg21 <= ($signed($signed(((8'hbf) > reg27[(2'h2):(1'h1)]))) ?
              $signed($unsigned(({reg17} && $signed(reg27)))) : $signed(wire12));
          reg22 <= (8'hb6);
        end
    end
  assign wire28 = $signed((-reg23));
  assign wire29 = (!$unsigned($signed(((reg17 >> reg23) | {reg25}))));
  assign wire30 = {$unsigned((wire28 >> reg17[(3'h6):(3'h6)]))};
  assign wire31 = $unsigned((^~{reg26[(4'ha):(4'h9)],
                      (wire11 ? {wire29, wire15} : $signed(reg24))}));
  assign wire32 = ($signed((!$unsigned((&wire15)))) ?
                      ({((+wire10) < (reg17 <<< reg21)),
                          $signed(((8'ha1) ?
                              reg18 : wire29))} && {reg22}) : {wire28,
                          {($signed((8'ha5)) ^~ (^~reg20))}});
  assign wire33 = reg16[(3'h7):(3'h6)];
  module34 #() modinst58 (.wire37(reg24), .wire38(reg20), .wire35(reg19), .y(wire57), .wire36(reg21), .wire39(reg25), .clk(clk));
  assign wire59 = $unsigned(($unsigned((wire33[(3'h4):(1'h0)] ?
                          reg16 : $signed(reg22))) ?
                      wire11[(4'he):(4'h8)] : $unsigned(($unsigned(wire29) ?
                          (wire57 && wire13) : {(8'ha9)}))));
  assign wire60 = $unsigned($signed($unsigned($signed($signed(wire13)))));
  always
    @(posedge clk) begin
      reg61 <= {(wire29 ?
              $unsigned((~$signed((7'h42)))) : {({reg17,
                      wire29} <<< (reg20 ^~ wire11)),
                  $unsigned((wire32 - reg19))})};
    end
  assign wire62 = ($signed(($signed((wire60 ? wire28 : wire15)) ?
                          $unsigned({reg24}) : (8'hbb))) ?
                      ((+$unsigned(reg25)) ~^ ($unsigned(((8'hb0) ?
                          wire57 : reg61)) | (wire57[(2'h2):(1'h1)] != (wire28 <<< reg17)))) : ($signed($unsigned((reg19 <<< reg26))) ?
                          $unsigned(({reg25} | $signed(wire28))) : reg19[(3'h7):(3'h4)]));
  assign wire63 = wire31;
  assign wire64 = $unsigned(((~&$signed(wire14)) ?
                      ({$unsigned(reg21)} >>> (((8'h9e) >> wire30) ?
                          reg20 : {reg21})) : wire33));
  module65 #() modinst107 (.wire69(wire32), .clk(clk), .y(wire106), .wire66(reg18), .wire70(wire14), .wire67(wire31), .wire68(wire62));
  assign wire108 = reg61[(1'h1):(1'h0)];
  assign wire109 = wire31[(4'h9):(1'h0)];
endmodule

module module65
#(parameter param104 = (+((-{((8'haa) ? (8'hbc) : (8'haa))}) & {(((8'ha1) ? (8'hab) : (8'haa)) ? (~(8'hb5)) : ((8'ha2) ? (8'ha0) : (8'h9f))), (((7'h44) ? (8'h9d) : (8'hac)) ? (^~(8'hba)) : ((8'hb4) || (8'hb6)))})), 
parameter param105 = (param104 ? (-(~(!(param104 >> param104)))) : (+((param104 ? (+param104) : (~^param104)) ? ((param104 < (8'hb6)) | (param104 ? param104 : (8'ha7))) : ((param104 ? (8'ha1) : (7'h44)) >>> (|(8'hb7)))))))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire70;
  input wire [(2'h2):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire [(5'h11):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire74;
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire74,
                 reg97,
                 reg96,
                 reg95,
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
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg71 <= (~$signed($unsigned($unsigned((wire66 ? wire69 : wire68)))));
      reg72 <= (^~$signed(({(wire67 >> wire70), (!wire70)} ?
          wire69 : $unsigned((^wire68)))));
      reg73 <= (wire67 ?
          (~(wire69 ?
              (wire69[(1'h0):(1'h0)] << $signed(wire69)) : $signed(wire66))) : {$unsigned(($signed(wire68) ?
                  ((8'hb2) >>> wire68) : wire70[(3'h6):(3'h6)]))});
    end
  assign wire74 = $unsigned($signed(wire66));
  always
    @(posedge clk) begin
      reg75 <= $unsigned(($unsigned({(~&(8'ha5)), (reg73 && (8'hba))}) ?
          (-$unsigned({reg71})) : (8'ha6)));
      if ($unsigned({{{$signed(reg72), (!wire70)}}}))
        begin
          reg76 <= $signed(reg73);
          reg77 <= $signed((^$unsigned($signed((~|wire68)))));
          if ($unsigned((((^~(-reg73)) ?
              ($unsigned(reg75) ?
                  $unsigned(reg72) : (reg71 * wire66)) : wire70) - $signed(reg73[(3'h7):(2'h2)]))))
            begin
              reg78 <= $signed((7'h43));
            end
          else
            begin
              reg78 <= (wire67[(1'h0):(1'h0)] ^~ $signed({$signed((-reg77))}));
              reg79 <= ((|reg75) >= reg78);
              reg80 <= $unsigned(($signed(((~(8'hb9)) ?
                  wire66 : wire68[(4'h8):(3'h5)])) > (~|$signed((8'ha0)))));
              reg81 <= (wire70 ?
                  $signed(((+wire68) >> (wire68[(4'he):(4'ha)] < wire68[(3'h5):(3'h4)]))) : $signed(reg78));
              reg82 <= wire70[(2'h2):(1'h1)];
            end
          if (($signed((reg80 && reg81[(3'h5):(3'h5)])) - {$signed(reg79[(5'h10):(4'h9)]),
              (^$unsigned($signed((8'ha3))))}))
            begin
              reg83 <= $unsigned(reg73[(2'h2):(1'h1)]);
              reg84 <= $unsigned((reg75[(3'h6):(2'h2)] >> $unsigned(($unsigned((8'h9d)) ?
                  (reg75 ? reg73 : reg75) : ((8'hae) ? reg83 : reg72)))));
              reg85 <= $signed({$unsigned(($unsigned(wire68) | wire69))});
              reg86 <= $unsigned($signed($signed(((~reg82) < $signed((8'hbb))))));
              reg87 <= ((reg76 >> $unsigned(wire69)) >> $signed((wire67[(3'h7):(3'h7)] ?
                  (~^$unsigned(reg86)) : wire69)));
            end
          else
            begin
              reg83 <= reg85[(1'h1):(1'h1)];
              reg84 <= wire74;
            end
          reg88 <= ((&((reg75[(1'h1):(1'h0)] <= {reg75}) > ((~|reg72) ?
                  reg79[(4'h8):(3'h4)] : reg79[(4'h9):(4'h9)]))) ?
              {{(~&{wire66, reg71})},
                  ($signed($signed(wire70)) ^ reg81[(4'hb):(4'hb)])} : wire66);
        end
      else
        begin
          reg76 <= reg78;
          if ((^~(((reg87 ?
                  $unsigned(wire68) : (reg79 ?
                      reg76 : reg71)) != (~|(reg85 > reg75))) ?
              $signed($signed((|reg88))) : $signed({(!wire70), (^(8'had))}))))
            begin
              reg77 <= $signed(reg80[(5'h13):(4'hf)]);
              reg78 <= reg73[(3'h7):(1'h0)];
              reg79 <= {{(~|$signed((reg79 ^~ reg87)))}};
              reg80 <= (~reg76);
              reg81 <= reg73[(3'h4):(2'h3)];
            end
          else
            begin
              reg77 <= $signed(wire66);
              reg78 <= $unsigned((reg72 + (reg77 ?
                  ((~^(8'h9d)) ?
                      (wire74 >>> (8'hb9)) : reg78) : $signed(wire68))));
              reg79 <= ((reg86 ?
                  ((&(&reg82)) ?
                      ((+reg83) ?
                          $unsigned(reg84) : reg78[(1'h1):(1'h0)]) : reg77[(4'hc):(2'h3)]) : $signed((((8'haf) && reg79) ?
                      reg82[(2'h3):(2'h2)] : reg77))) - $unsigned((-(8'ha0))));
              reg80 <= (reg71[(4'ha):(1'h0)] ?
                  (~{{(reg72 >>> (8'h9d))}, (|(-reg77))}) : (($signed({wire67,
                      reg85}) - $signed(((8'hb1) * reg81))) >> (((wire74 >= reg77) ?
                      {reg75, reg82} : (~^reg73)) * reg83)));
            end
          reg82 <= (&((reg78[(1'h0):(1'h0)] ?
              reg76[(3'h4):(2'h3)] : (-(reg75 ?
                  reg79 : wire66))) <= (-(&wire67[(4'h8):(1'h0)]))));
          reg83 <= wire69[(2'h2):(1'h0)];
        end
      reg89 <= reg79[(3'h5):(1'h1)];
    end
  assign wire90 = $signed(((({reg78} ?
                      (!wire74) : {reg73}) | $signed((&reg82))) > (~|((^reg87) >>> (reg84 ?
                      reg84 : reg77)))));
  assign wire91 = $unsigned((wire66[(3'h7):(3'h7)] ?
                      {(reg77[(2'h3):(1'h1)] ? (+reg71) : (-reg87)),
                          ($unsigned(wire70) > $unsigned(reg77))} : reg85));
  assign wire92 = $signed((^{wire91, wire67[(3'h6):(2'h2)]}));
  assign wire93 = wire70[(2'h2):(1'h1)];
  assign wire94 = (reg76 ?
                      reg80[(4'hd):(4'hd)] : $signed((((wire91 <= reg83) ?
                          (~^reg83) : $unsigned(reg85)) < ($signed((7'h41)) >> (wire67 + wire90)))));
  always
    @(posedge clk) begin
      reg95 <= $signed(reg89[(2'h2):(2'h2)]);
      reg96 <= ((-reg80[(3'h4):(2'h3)]) ? wire94 : $unsigned({reg72}));
      reg97 <= reg95[(2'h3):(1'h1)];
    end
  assign wire98 = ((wire68 ?
                      $signed(wire94) : ($unsigned(reg84[(1'h1):(1'h1)]) <<< reg97[(1'h0):(1'h0)])) != ((!reg80) * reg81));
  assign wire99 = $unsigned((8'hb8));
  assign wire100 = ((|(reg88 ?
                       ({reg72,
                           reg72} ^ (^~wire93)) : (~^wire70[(4'ha):(3'h6)]))) || {{reg79,
                           $unsigned((wire99 * (8'ha0)))},
                       $unsigned(reg71)});
  assign wire101 = ($unsigned($unsigned(wire70[(3'h4):(3'h4)])) && (((~|reg96[(2'h3):(2'h3)]) ?
                       ((|(8'ha3)) <<< ((8'hbe) ?
                           reg75 : wire94)) : $unsigned(reg71)) - wire74));
  assign wire102 = (~&(^~wire67));
  assign wire103 = reg75[(3'h4):(1'h1)];
endmodule

module module34
#(parameter param56 = ((^~(-((~|(8'h9c)) ? {(8'h9d)} : ((8'ha0) + (8'hb7))))) ? (((((8'hbd) ? (7'h44) : (8'hbf)) * ((8'haa) != (7'h43))) && (!(-(8'hb4)))) ? {({(8'had), (8'haa)} << ((8'hb2) != (8'hae)))} : (({(8'hb3), (8'hbe)} ? ((8'ha6) ? (8'hb4) : (8'hae)) : ((8'hb1) >>> (8'hba))) == (8'had))) : (~&((^(&(8'ha0))) ? {(-(8'hbe)), (-(7'h40))} : (&((8'hbf) ? (8'ha0) : (7'h40)))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire39;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire [(4'hb):(1'h0)] wire36;
  input wire [(4'ha):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire40 = {wire36[(1'h0):(1'h0)]};
  assign wire41 = (wire35[(3'h4):(2'h2)] ^ (($unsigned($unsigned((8'ha7))) ?
                          wire35 : $signed(wire36)) ?
                      wire37[(1'h0):(1'h0)] : ((wire36[(3'h7):(1'h0)] ?
                          (!wire38) : $unsigned((8'hab))) - $signed((^~wire38)))));
  assign wire42 = ($signed((wire35 <<< $signed({(8'ha4)}))) > wire38[(4'he):(3'h7)]);
  assign wire43 = {wire36, wire38};
  always
    @(posedge clk) begin
      reg44 <= ({$unsigned(((8'hb6) ? wire38 : (wire41 ? wire42 : wire40)))} ?
          ($unsigned($unsigned((~^wire36))) ?
              wire41 : $unsigned($unsigned($signed(wire41)))) : {wire41});
      if ($signed((($signed((wire41 >> wire42)) ? wire39 : wire43) ?
          ((~&(wire43 << wire37)) ?
              wire43 : $unsigned({reg44})) : {wire37[(2'h2):(1'h1)]})))
        begin
          reg45 <= wire39[(1'h0):(1'h0)];
        end
      else
        begin
          if (wire37)
            begin
              reg45 <= (wire38[(5'h12):(3'h6)] ? reg45 : reg44);
              reg46 <= $signed(((((wire43 >> (8'hb4)) ?
                  (!wire37) : (reg45 ?
                      wire36 : wire37)) ^ $signed((wire37 >= wire39))) << reg45));
              reg47 <= $unsigned(reg45[(2'h3):(1'h0)]);
            end
          else
            begin
              reg45 <= (~{(wire42[(2'h2):(2'h2)] || reg45[(3'h4):(2'h2)])});
              reg46 <= $unsigned((reg47 * wire35[(3'h5):(2'h2)]));
            end
          reg48 <= (^($signed(($unsigned(wire35) << $signed((8'hb0)))) - $signed(wire40)));
          reg49 <= $signed($signed(reg47[(4'he):(4'he)]));
          reg50 <= $unsigned((({$unsigned(reg49)} + $signed(wire35[(3'h6):(1'h1)])) ^ {wire40}));
          reg51 <= ($signed($unsigned(wire37)) + (|(!$unsigned($signed(wire35)))));
        end
      reg52 <= (~&(8'hbe));
      reg53 <= (8'hab);
    end
  assign wire54 = $signed(wire37[(3'h6):(1'h1)]);
  assign wire55 = $signed($signed((($unsigned(reg49) ?
                          reg47[(3'h7):(2'h3)] : (~|(8'h9e))) ?
                      $unsigned(reg51) : wire41)));
endmodule

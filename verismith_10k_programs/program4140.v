module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire18;
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  assign y = {wire159,
                 wire30,
                 wire29,
                 wire18,
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
                 reg14,
                 reg15,
                 reg16,
                 reg17,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(($signed(wire0[(4'hb):(3'h5)]) + ((wire1 > wire2) - (~&wire2)))) ?
          (~&({$unsigned(wire0), (wire0 >>> wire3)} ?
              $unsigned(wire0[(3'h6):(1'h1)]) : (wire3[(4'h8):(2'h2)] ?
                  (+wire3) : (wire0 ? wire3 : (8'hbb))))) : wire1))
        begin
          reg4 <= $unsigned(($signed((+$signed(wire3))) ^~ $signed((wire2[(2'h3):(2'h2)] ?
              (~|wire3) : (wire1 | wire3)))));
          reg5 <= $unsigned((wire1[(2'h2):(2'h2)] ?
              (8'ha2) : ((^$signed(wire0)) ? $unsigned(reg4) : wire1)));
        end
      else
        begin
          reg4 <= ($unsigned(wire2) ?
              ($signed(wire3[(4'hd):(4'h9)]) >> $signed((-(wire1 >= (8'h9e))))) : wire0);
        end
      if ($unsigned((((8'ha4) ? $unsigned($signed(wire2)) : (-wire0)) & wire1)))
        begin
          if ($signed($unsigned(wire0[(4'hb):(1'h1)])))
            begin
              reg6 <= wire0[(4'h9):(2'h3)];
              reg7 <= $signed(wire0[(5'h14):(5'h12)]);
              reg8 <= ($signed(($signed(wire3[(3'h7):(3'h4)]) != (((8'h9f) == reg4) ?
                  wire3 : (~|reg5)))) != wire2);
              reg9 <= $unsigned(reg7[(4'hb):(1'h0)]);
              reg10 <= (wire1 << {$unsigned(reg6[(3'h4):(3'h4)])});
            end
          else
            begin
              reg6 <= {($unsigned(wire3[(3'h5):(1'h0)]) ?
                      reg5[(4'he):(3'h4)] : wire1),
                  (8'hba)};
              reg7 <= (($signed(wire1) || {reg10, $signed((-wire0))}) ?
                  (reg4 >= $unsigned(((wire1 >> reg8) ?
                      ((8'hb2) ?
                          reg6 : wire3) : wire2))) : $unsigned($unsigned((^~$unsigned(reg10)))));
              reg8 <= $signed($signed($unsigned({{(8'h9c)}})));
              reg9 <= $unsigned(($unsigned(reg10) < $signed((!reg6))));
            end
          reg11 <= wire1[(3'h6):(3'h5)];
        end
      else
        begin
          reg6 <= $unsigned((reg10 ?
              ({wire0, $unsigned(wire0)} - $unsigned((reg4 ?
                  reg11 : reg11))) : (($unsigned(reg6) ?
                  (wire0 ?
                      (8'hba) : reg11) : reg10[(4'ha):(4'h9)]) >> (^wire3))));
          reg7 <= (8'hb6);
          reg8 <= reg6[(3'h5):(1'h1)];
          if (((reg6 ?
              reg4[(1'h1):(1'h1)] : reg7[(2'h3):(1'h1)]) <= reg7[(4'ha):(4'h8)]))
            begin
              reg9 <= (($signed($signed((reg5 >> reg11))) ?
                  wire1 : ((&reg4) ?
                      $unsigned({reg8}) : $signed(((8'hbf) ?
                          wire2 : wire1)))) << ($signed(((|(8'h9d)) ?
                      $signed(reg4) : ((8'hab) ? reg6 : wire2))) ?
                  $unsigned(((!wire1) ^ reg8[(3'h4):(1'h0)])) : $signed(reg5)));
              reg10 <= $unsigned(wire1);
              reg11 <= $unsigned(reg9[(3'h5):(1'h1)]);
              reg12 <= (-({($signed(wire1) & (wire3 ?
                      wire1 : reg10))} & (!($signed(reg9) < reg5))));
            end
          else
            begin
              reg9 <= wire2[(3'h4):(3'h4)];
              reg10 <= ($signed(reg9) ?
                  ($unsigned(($unsigned(reg8) == $signed(reg8))) << $signed(((reg4 ?
                      reg10 : (8'hb3)) == reg9))) : (7'h41));
              reg11 <= $signed($unsigned($signed(reg6)));
            end
          if ((wire1[(2'h3):(1'h1)] ?
              ((~^{$unsigned(reg5)}) << ($signed(reg12) ?
                  ((reg5 - reg10) < (wire0 && reg11)) : ((wire1 > (8'ha1)) ?
                      (reg12 * reg10) : ((8'ha8) ~^ reg5)))) : wire2))
            begin
              reg13 <= (|($signed((~|$signed(reg12))) & {{(~|wire0),
                      (reg12 ? reg12 : reg11)},
                  $signed(reg4[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg13 <= reg7;
              reg14 <= {(8'hac), reg13};
              reg15 <= reg14;
            end
        end
      reg16 <= ((~$unsigned(reg11[(1'h0):(1'h0)])) < (~$unsigned((^{reg11,
          wire1}))));
      reg17 <= $signed((^$unsigned(($unsigned(reg7) <= $unsigned(reg4)))));
    end
  assign wire18 = $signed(reg15);
  always
    @(posedge clk) begin
      reg19 <= $signed(reg10[(4'h8):(3'h6)]);
      reg20 <= $unsigned(reg14[(2'h3):(2'h2)]);
      if (($unsigned(reg4[(2'h3):(2'h3)]) ?
          ($signed($signed(wire2[(1'h0):(1'h0)])) ?
              ((~^((8'hb6) ?
                  reg12 : reg20)) && $signed(wire2[(2'h3):(1'h1)])) : (~^($signed(reg14) ?
                  $signed((8'h9e)) : (reg7 ?
                      (8'hb7) : (8'hb7))))) : (reg16[(3'h6):(2'h2)] ?
              (reg20 + ((wire2 < wire2) > wire1[(1'h0):(1'h0)])) : (^(^$unsigned(reg16))))))
        begin
          reg21 <= (reg17[(1'h1):(1'h1)] ? $unsigned((&(7'h44))) : (-wire3));
        end
      else
        begin
          reg21 <= $signed(((((reg16 >>> wire3) > reg15[(4'h8):(1'h0)]) ?
                  $signed($unsigned(reg14)) : ((~&wire0) && ((8'h9d) ?
                      reg15 : reg16))) ?
              reg6 : $unsigned($signed((+reg14)))));
        end
      if (wire0[(5'h13):(3'h4)])
        begin
          reg22 <= reg6[(4'hb):(4'h8)];
          reg23 <= $signed($signed((((reg9 <<< wire0) ?
                  {reg15} : (wire1 ? reg10 : reg15)) ?
              reg16[(1'h0):(1'h0)] : $signed((reg17 ? reg22 : reg10)))));
          if ((+(~^(^{(reg19 ? (7'h41) : reg8)}))))
            begin
              reg24 <= (-(8'ha1));
            end
          else
            begin
              reg24 <= {(^reg21[(1'h1):(1'h1)])};
              reg25 <= $unsigned(($signed($unsigned({wire3})) ?
                  (&$unsigned((~|(8'had)))) : reg4));
              reg26 <= (^{reg20[(1'h0):(1'h0)]});
              reg27 <= ($signed(($unsigned(reg14[(3'h6):(3'h6)]) && ($signed(reg23) >= reg11[(1'h1):(1'h0)]))) ?
                  ({reg24[(3'h4):(2'h2)]} * $signed((^~reg17))) : (((&(~|reg20)) + $unsigned((~reg24))) ?
                      reg17[(1'h1):(1'h1)] : (reg14[(4'hd):(2'h2)] == {(reg6 == reg7),
                          (~&reg26)})));
              reg28 <= $unsigned(reg6);
            end
        end
      else
        begin
          reg22 <= reg26[(1'h0):(1'h0)];
          reg23 <= (reg7[(4'h8):(3'h7)] <= $signed(wire1));
        end
    end
  assign wire29 = (($unsigned((reg23[(3'h5):(1'h1)] ? reg19 : (^~reg21))) ?
                      reg23 : ((((8'ha7) ? reg12 : reg23) >>> (~^reg21)) ?
                          $unsigned((reg13 ?
                              reg8 : reg26)) : (8'hbd))) != ($signed((reg17 ?
                          $signed(wire18) : $signed((8'ha9)))) ?
                      reg14[(3'h7):(3'h4)] : (|reg21)));
  assign wire30 = (~^reg6);
  module31 #() modinst160 (.y(wire159), .wire35(reg20), .wire32(reg11), .wire34(reg12), .clk(clk), .wire36(reg8), .wire33(reg21));
endmodule

module module31
#(parameter param157 = (+((-((&(7'h42)) ? (&(8'haa)) : (&(7'h40)))) + ((+((8'ha3) ~^ (8'hbd))) ? (8'h9d) : (((8'hb1) ~^ (8'h9c)) && ((7'h41) ? (8'hba) : (8'hb1)))))), 
parameter param158 = (~^(((^{(7'h43)}) ^~ (~&(~&(7'h42)))) ? (&((&(7'h43)) ? (8'ha5) : (&param157))) : ((param157 ? (param157 ? param157 : param157) : (!param157)) ? (param157 ? (7'h40) : param157) : (8'ha5)))))
(y, clk, wire32, wire33, wire34, wire35, wire36);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire34;
  input wire [(4'ha):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire106;
  assign y = {wire155, wire37, wire38, wire39, wire40, wire106, (1'h0)};
  assign wire37 = (8'hac);
  assign wire38 = wire37;
  assign wire39 = ({(wire35[(1'h0):(1'h0)] == $unsigned(wire37[(2'h3):(2'h3)]))} ?
                      ($unsigned(wire32) <= $signed(wire35[(2'h3):(1'h1)])) : wire38);
  assign wire40 = $unsigned(((!(^$unsigned((8'haa)))) ?
                      $unsigned((((8'hb1) == (8'ha4)) ?
                          wire37 : (~|wire36))) : $signed(wire34)));
  module41 #() modinst107 (wire106, clk, wire40, wire38, wire39, wire32, wire37);
  module108 #() modinst156 (.wire112(wire36), .clk(clk), .wire109(wire32), .wire111(wire35), .wire110(wire38), .y(wire155));
endmodule

module module108
#(parameter param154 = (8'hbc))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire112;
  input wire [(4'ha):(1'h0)] wire111;
  input wire [(3'h6):(1'h0)] wire110;
  input wire signed [(5'h13):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(2'h2):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(4'hb):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire [(2'h2):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  assign y = {wire153,
                 wire151,
                 wire150,
                 wire149,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 reg152,
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
                 reg127,
                 reg126,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire113 = $unsigned(((!$signed($signed(wire112))) < wire110[(2'h3):(1'h1)]));
  assign wire114 = $signed($signed(((wire111 ? (-(8'hbd)) : (^~wire110)) ?
                       (~|{wire109}) : (-$signed((8'hb4))))));
  assign wire115 = {$unsigned($unsigned($signed({wire109})))};
  assign wire116 = $signed((-wire109));
  assign wire117 = $unsigned($unsigned((^wire109)));
  always
    @(posedge clk) begin
      reg118 <= (+((&$signed((wire109 | wire116))) ?
          {wire111,
              $signed((wire117 ?
                  wire110 : wire115))} : $unsigned(((~wire117) && (wire114 ?
              wire114 : (8'hba))))));
      reg119 <= $signed(wire117);
      reg120 <= $signed({{wire111}});
      reg121 <= ({wire109[(3'h6):(3'h4)], reg120} != (-reg119));
    end
  assign wire122 = {{$signed((~^$signed(wire114))), wire116[(3'h4):(3'h4)]},
                       $unsigned(reg121[(1'h0):(1'h0)])};
  assign wire123 = ($signed(wire112[(4'h8):(1'h0)]) ?
                       $signed((^~{wire115[(5'h12):(4'hd)],
                           $signed(reg118)})) : (8'hb9));
  assign wire124 = $unsigned($unsigned(($signed({wire111}) ?
                       wire115 : (|(wire117 >>> (8'hb8))))));
  assign wire125 = $signed((reg120 ?
                       (~|$unsigned(((8'ha6) ?
                           wire110 : wire117))) : $signed((~(reg118 ?
                           reg120 : wire116)))));
  always
    @(posedge clk) begin
      reg126 <= $signed($signed(((~^(|(8'hb2))) ?
          wire125[(4'h9):(3'h7)] : (~|(reg121 ? wire124 : wire111)))));
      reg127 <= wire123;
      reg128 <= (+($signed(wire109) ?
          ($unsigned($unsigned(reg118)) || ((reg118 - wire113) == (|reg118))) : {wire110}));
      reg129 <= (wire112 ?
          wire124[(5'h13):(4'hd)] : (!($unsigned(wire125[(3'h4):(2'h3)]) >> wire109[(5'h13):(5'h12)])));
      reg130 <= (wire114[(1'h0):(1'h0)] ~^ (wire109 & (reg120[(4'ha):(4'h8)] < $signed((wire122 > wire123)))));
    end
  always
    @(posedge clk) begin
      reg131 <= wire116[(1'h1):(1'h1)];
      if (reg121)
        begin
          reg132 <= wire114;
          if ($signed($unsigned(wire122[(1'h1):(1'h0)])))
            begin
              reg133 <= reg126;
            end
          else
            begin
              reg133 <= $unsigned(($signed($signed((reg133 ?
                  reg126 : reg120))) << wire124));
              reg134 <= $unsigned(wire125);
              reg135 <= $signed(wire112[(4'hf):(4'hd)]);
            end
          reg136 <= (($signed((!reg121[(3'h6):(3'h5)])) ?
                  ((~|wire116[(5'h12):(3'h7)]) ?
                      ({reg118,
                          wire113} == $unsigned(wire114)) : wire123) : reg121[(1'h1):(1'h1)]) ?
              ($unsigned((reg131[(3'h5):(2'h3)] <<< wire110)) ?
                  wire122[(2'h3):(2'h3)] : {{(reg118 ? reg127 : reg135)},
                      (+(^wire114))}) : reg134);
          reg137 <= (~wire117[(5'h12):(2'h2)]);
          reg138 <= ((-wire123) * wire116[(4'hf):(3'h5)]);
        end
      else
        begin
          reg132 <= (~(((wire123 <<< (&wire125)) >= reg137[(1'h0):(1'h0)]) ?
              (|{wire117[(4'he):(4'h9)]}) : ($unsigned(wire111[(3'h7):(2'h2)]) ?
                  ($unsigned(reg131) * $unsigned(wire124)) : wire122)));
          reg133 <= reg133[(4'h8):(3'h5)];
          reg134 <= $signed($signed(reg128[(4'hf):(4'hb)]));
          reg135 <= (8'ha1);
        end
      reg139 <= $signed((8'ha3));
      if (($unsigned((((reg120 ?
          wire117 : reg126) * wire125[(4'h9):(2'h2)]) && reg131[(4'hb):(4'ha)])) >>> (~&reg120)))
        begin
          if (reg126)
            begin
              reg140 <= $signed($unsigned($unsigned((~&{reg136}))));
              reg141 <= ($signed($unsigned($signed($unsigned(wire111)))) ?
                  reg132 : reg130[(3'h7):(3'h5)]);
            end
          else
            begin
              reg140 <= $unsigned((reg133 ?
                  ((((8'hb7) >= wire109) != wire110) ?
                      {reg138[(1'h0):(1'h0)]} : {(8'hbf)}) : (!$unsigned({reg136}))));
              reg141 <= ((((8'hb9) ? wire123 : $signed((^(8'hb4)))) ?
                  (~^(reg126 ?
                      (-wire122) : (wire115 ?
                          reg138 : reg139))) : reg128[(3'h6):(3'h5)]) + (wire117[(1'h0):(1'h0)] ?
                  (~|$unsigned(wire125[(1'h0):(1'h0)])) : $signed((8'haa))));
              reg142 <= ($signed((7'h41)) >>> $unsigned(((|$unsigned(wire114)) & $signed(wire115))));
              reg143 <= reg118;
            end
          reg144 <= reg118[(1'h0):(1'h0)];
          reg145 <= reg132;
          reg146 <= reg143;
          reg147 <= $signed($unsigned($signed(reg144)));
        end
      else
        begin
          reg140 <= ({reg120,
              reg139} ^ (~^(reg133[(3'h6):(2'h2)] * reg118[(2'h2):(1'h0)])));
          reg141 <= $signed($signed($unsigned(($signed(wire113) ?
              {reg135, (8'hb1)} : (reg136 ? reg132 : reg138)))));
        end
      reg148 <= wire110[(3'h6):(2'h2)];
    end
  assign wire149 = $signed(reg142[(1'h0):(1'h0)]);
  assign wire150 = reg148[(3'h4):(2'h2)];
  assign wire151 = (~($unsigned(wire110[(2'h2):(1'h0)]) ?
                       (8'hb8) : (wire123[(3'h7):(2'h2)] ?
                           ((reg119 < reg121) ^~ reg144[(4'hc):(2'h3)]) : reg144)));
  always
    @(posedge clk) begin
      reg152 <= reg127;
    end
  assign wire153 = reg128;
endmodule

module module41
#(parameter param104 = (({(8'hbf)} ? (~^(((8'hbf) + (8'hbe)) * (~&(8'ha3)))) : (((~(8'hb9)) ? {(8'hb8)} : {(8'hac)}) * ((8'hb9) + (^~(8'h9e))))) >> (!((((8'ha6) >> (8'hbe)) ? ((8'h9c) != (8'hae)) : ((8'hb2) == (8'hb6))) ^~ (~^((8'ha6) != (7'h43)))))), 
parameter param105 = (~&param104))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire46;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire [(3'h6):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire47;
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  assign y = {wire103,
                 wire99,
                 wire98,
                 wire91,
                 wire83,
                 wire69,
                 wire68,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 reg102,
                 reg101,
                 reg100,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg54,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire47 = wire42;
  always
    @(posedge clk) begin
      reg48 <= ($signed(($signed(wire47) ^~ $signed((~wire43)))) + (~|(8'hb2)));
      reg49 <= (^~wire45[(4'hc):(3'h4)]);
      reg50 <= reg49[(4'h9):(1'h0)];
    end
  assign wire51 = {{($signed(wire44[(2'h3):(2'h2)]) ?
                              (wire43[(2'h3):(1'h0)] ?
                                  wire46 : $signed(reg48)) : ((wire45 ?
                                      reg50 : reg50) ?
                                  $unsigned(wire46) : (+wire42))),
                          $signed(wire42[(4'ha):(1'h1)])},
                      $unsigned((-((+wire46) ?
                          (reg50 * wire47) : reg48[(4'hf):(3'h4)])))};
  assign wire52 = wire47[(4'he):(2'h3)];
  assign wire53 = {$unsigned((wire45 ?
                          ($unsigned((8'haa)) - wire43) : wire44))};
  always
    @(posedge clk) begin
      reg54 <= (8'hba);
    end
  assign wire55 = reg49;
  assign wire56 = $signed($signed(reg54));
  assign wire57 = wire43[(3'h4):(3'h4)];
  assign wire58 = ((^$unsigned(reg48[(3'h7):(3'h7)])) ?
                      (-{($unsigned(wire56) ?
                              (wire56 ?
                                  wire46 : wire51) : (wire55 >> reg48))}) : ((|($signed(reg54) << wire51)) | (-($signed(wire55) ?
                          ((8'hb7) ^ wire51) : (wire45 & wire52)))));
  always
    @(posedge clk) begin
      if (wire45[(3'h4):(3'h4)])
        begin
          reg59 <= ({wire46[(2'h2):(1'h1)]} != wire51);
          reg60 <= (&{$signed($unsigned($signed(wire57)))});
          reg61 <= reg60;
          reg62 <= ($unsigned(((reg60 ^~ wire53) > (reg50[(4'hc):(3'h7)] << (reg48 >= reg49)))) ?
              $signed((wire58[(2'h2):(2'h2)] == (wire52[(1'h0):(1'h0)] ?
                  $signed(wire43) : $unsigned(reg50)))) : $unsigned({reg59,
                  (|wire42[(4'h8):(3'h7)])}));
          if (wire53)
            begin
              reg63 <= $unsigned((!wire55));
              reg64 <= $signed($signed($unsigned(((reg61 || wire52) != (wire55 ?
                  wire57 : wire58)))));
              reg65 <= ($unsigned(wire51[(3'h4):(2'h2)]) <= $unsigned((|$unsigned({reg61}))));
            end
          else
            begin
              reg63 <= reg50;
              reg64 <= $signed({({reg60[(1'h1):(1'h1)]} < $signed((&wire58)))});
              reg65 <= $signed($unsigned($signed($unsigned({(8'hbb)}))));
            end
        end
      else
        begin
          reg59 <= (wire43[(3'h6):(1'h0)] ? (-reg65) : wire53);
          reg60 <= {reg60};
          reg61 <= wire58;
        end
      reg66 <= {reg64[(1'h1):(1'h1)]};
      reg67 <= ((((reg65 && (reg61 ?
          wire43 : reg50)) && $unsigned(wire53[(1'h1):(1'h1)])) || (wire56 ~^ (-wire47))) << reg63[(2'h2):(2'h2)]);
    end
  assign wire68 = reg54[(4'hd):(4'hc)];
  assign wire69 = reg62[(5'h10):(2'h3)];
  always
    @(posedge clk) begin
      if (reg59[(3'h4):(2'h2)])
        begin
          reg70 <= (wire58 ?
              $unsigned(wire68) : {wire47[(4'hb):(4'h8)], reg59});
          reg71 <= $signed(reg54[(3'h4):(2'h2)]);
        end
      else
        begin
          if ($unsigned(({($signed(wire68) && (wire44 >>> reg49)), wire45} ?
              (8'hb8) : ((reg60 != wire58[(1'h0):(1'h0)]) ?
                  $unsigned((reg64 ? wire56 : wire53)) : $signed((~wire44))))))
            begin
              reg70 <= reg49[(4'hf):(4'h9)];
              reg71 <= $unsigned(wire56[(1'h0):(1'h0)]);
              reg72 <= (wire69 ?
                  $signed((-(^(~|reg60)))) : $unsigned((($unsigned(reg50) | ((8'haa) ?
                          reg60 : wire58)) ?
                      ((~^reg65) ~^ wire51[(4'ha):(4'h8)]) : $unsigned({wire51,
                          reg70}))));
            end
          else
            begin
              reg70 <= $signed((~|reg63[(1'h1):(1'h0)]));
              reg71 <= (^~({reg63, $signed((wire58 ~^ (8'hba)))} ?
                  wire57[(1'h0):(1'h0)] : $signed(((reg48 ?
                      (8'hab) : wire52) < $unsigned((8'haa))))));
            end
        end
      reg73 <= $unsigned(reg71[(4'hd):(4'h9)]);
      reg74 <= (~^wire52);
      if ($signed(((7'h42) ?
          (reg59 ?
              (!(8'hb1)) : (+(reg49 ?
                  (8'hbf) : wire45))) : ($unsigned(reg61) >>> reg65[(1'h0):(1'h0)]))))
        begin
          reg75 <= (8'hb8);
          reg76 <= (~^({((8'ha1) > wire52[(3'h7):(2'h2)]),
                  (!$unsigned((8'ha1)))} ?
              wire43[(2'h2):(1'h0)] : (reg75[(1'h0):(1'h0)] ?
                  $unsigned((reg66 ^~ reg62)) : $signed({reg63}))));
          reg77 <= (($unsigned($signed(reg67)) >>> (+$unsigned((reg62 ?
                  (8'hbd) : wire53)))) ?
              $signed((wire45 ?
                  (((8'hbb) ? reg60 : reg63) ?
                      (^~(8'hbd)) : wire55) : ((reg70 << wire56) ?
                      (-reg76) : $unsigned(reg62)))) : reg62[(4'hf):(4'he)]);
          reg78 <= ((wire55[(3'h4):(1'h1)] << (~^(((8'ha9) ? wire43 : (8'hb3)) ?
                  reg49[(4'he):(2'h2)] : $signed(reg59)))) ?
              (~^wire44[(4'h8):(3'h4)]) : ($signed(($signed(reg60) ?
                      $unsigned(reg77) : wire43)) ?
                  {wire43[(2'h2):(1'h1)]} : (($unsigned((8'ha5)) ?
                          $signed((8'hbc)) : $unsigned((7'h41))) ?
                      wire68[(4'ha):(1'h1)] : (~^wire44))));
          reg79 <= ((8'ha3) + reg50[(1'h1):(1'h1)]);
        end
      else
        begin
          reg75 <= ((reg74[(4'hf):(4'hf)] <= (~&$unsigned(reg66[(2'h3):(2'h2)]))) <= (({$signed(wire44)} ~^ {$unsigned(reg54),
                  $unsigned(wire56)}) ?
              (($signed(wire56) ^ {wire43}) ?
                  (~$signed(wire45)) : reg62[(4'ha):(3'h7)]) : wire69));
          if ((|reg72))
            begin
              reg76 <= {(~&reg74[(4'h8):(2'h2)]),
                  ((+$unsigned((reg76 * (7'h40)))) ?
                      $signed(wire57) : $unsigned((8'hbe)))};
              reg77 <= (wire43[(3'h6):(1'h1)] ?
                  reg48[(4'he):(4'h8)] : (-$unsigned($signed({wire43}))));
            end
          else
            begin
              reg76 <= (!(reg64 ?
                  (reg78[(2'h3):(2'h2)] == reg48[(4'hf):(4'hd)]) : $signed(($unsigned(reg64) ?
                      $unsigned(reg73) : $signed(wire47)))));
            end
          reg78 <= (((8'hbc) ?
              ({(wire68 ? wire46 : reg74),
                  (reg72 ? reg60 : wire47)} & wire58) : $unsigned(((reg64 ?
                      reg48 : reg75) ?
                  (reg61 ? (8'hbb) : reg54) : reg48))) <= reg75[(1'h0):(1'h0)]);
          reg79 <= $signed(reg77);
          reg80 <= wire44[(1'h1):(1'h0)];
        end
      if ($signed(((reg59 | $unsigned(reg75[(1'h0):(1'h0)])) >>> reg65[(4'ha):(1'h1)])))
        begin
          reg81 <= $signed((~({(+reg80)} ?
              wire58 : $unsigned((reg48 - reg54)))));
          reg82 <= $signed(reg74[(1'h1):(1'h0)]);
        end
      else
        begin
          reg81 <= reg71[(3'h4):(1'h0)];
        end
    end
  assign wire83 = (wire55[(3'h5):(3'h4)] ?
                      wire58 : $unsigned((($unsigned(reg54) ?
                          wire52 : (reg74 >= reg80)) == $unsigned((~&reg62)))));
  always
    @(posedge clk) begin
      reg84 <= $signed((reg80[(4'h8):(4'h8)] ?
          (~|reg82[(3'h7):(2'h2)]) : wire69));
      if (reg79[(1'h1):(1'h0)])
        begin
          reg85 <= ({(wire69 * (~&$unsigned(reg50)))} - $signed(wire68[(3'h5):(3'h5)]));
        end
      else
        begin
          reg85 <= (~|reg80[(3'h7):(2'h2)]);
          reg86 <= $unsigned(wire53);
          reg87 <= (+{$signed(({wire68, wire42} >= $unsigned(reg81)))});
          reg88 <= (($signed((~|(~reg85))) ^ (((|wire46) ?
                  wire83 : (+(8'hb2))) || (((8'ha9) ? reg79 : wire45) ?
                  {reg87} : (reg85 ? (7'h44) : wire57)))) ?
              $signed(reg85[(4'hb):(4'hb)]) : $signed({wire57[(2'h3):(1'h0)],
                  (^$unsigned(wire69))}));
          reg89 <= reg61;
        end
      reg90 <= reg84;
    end
  assign wire91 = ({(wire56[(4'h9):(3'h7)] < ($signed(wire51) ?
                              (wire43 ?
                                  (8'ha5) : reg49) : (wire52 * (8'ha4))))} ?
                      reg65 : $unsigned((~|$unsigned((wire52 ~^ reg64)))));
  always
    @(posedge clk) begin
      reg92 <= ($unsigned(wire69) >>> reg75[(1'h0):(1'h0)]);
      if ($unsigned((!{$unsigned(wire45)})))
        begin
          reg93 <= $signed((~($signed(reg81) > (~&reg80[(3'h5):(1'h1)]))));
        end
      else
        begin
          reg93 <= $unsigned($unsigned(reg74));
          reg94 <= {(wire51[(4'h8):(3'h6)] ?
                  ($unsigned({wire51}) <= reg75) : reg85)};
          reg95 <= $unsigned((+(($signed(reg78) ?
                  $unsigned(reg85) : reg71[(3'h7):(2'h2)]) ?
              {((7'h41) + reg85), $signed(reg78)} : ({reg76,
                  reg88} << wire69[(2'h3):(1'h1)]))));
        end
      reg96 <= wire58;
      reg97 <= $signed((-(7'h40)));
    end
  assign wire98 = {($signed(reg87[(4'h9):(2'h3)]) || ($signed($signed(reg93)) ~^ (^reg81[(1'h1):(1'h1)])))};
  assign wire99 = wire53;
  always
    @(posedge clk) begin
      reg100 <= ((wire83 ?
          (8'ha1) : $signed((8'h9c))) != $signed({($signed(reg72) - (^~reg84)),
          ($unsigned(reg75) & {reg66})}));
      reg101 <= reg86[(2'h2):(1'h1)];
      reg102 <= ((|(($signed(wire91) ~^ $unsigned(reg49)) * reg70)) ?
          (!$signed((wire91[(4'h9):(2'h2)] ?
              (reg71 ?
                  reg66 : (8'hb0)) : $signed(reg78)))) : (reg67[(4'hc):(3'h6)] & $signed(($signed(reg85) << (reg74 ?
              wire57 : (8'ha8))))));
    end
  assign wire103 = $signed(($unsigned(reg48[(3'h6):(3'h6)]) ~^ ((~^$unsigned(wire47)) ?
                       $unsigned((8'ha9)) : reg94)));
endmodule

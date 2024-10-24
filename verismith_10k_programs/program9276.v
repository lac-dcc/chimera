module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire187;
  wire signed [(3'h6):(1'h0)] wire186;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire157;
  wire [(4'hd):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire184;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire5,
                 wire6,
                 wire7,
                 wire155,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire184,
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
                 (1'h0)};
  assign wire5 = wire4[(2'h3):(2'h3)];
  assign wire6 = $unsigned(wire3[(4'hd):(3'h5)]);
  assign wire7 = ((8'h9d) ?
                     $unsigned(wire5[(3'h4):(3'h4)]) : (($unsigned($unsigned(wire5)) ?
                             ($signed(wire4) < (wire3 ?
                                 wire2 : (8'hbb))) : (~&$signed(wire1))) ?
                         wire3 : (((wire3 != wire2) < $signed((8'hbf))) && {(wire0 ?
                                 wire5 : wire2)})));
  always
    @(posedge clk) begin
      reg8 <= wire7;
      if ({$unsigned((wire2 > (wire1[(2'h2):(1'h1)] ?
              wire6 : (reg8 > (8'hb8))))),
          (|$signed({(~|wire7)}))})
        begin
          reg9 <= wire7;
        end
      else
        begin
          if ((+(~&((&(wire6 ? reg8 : wire7)) ?
              (wire5 ? (8'ha2) : $unsigned(wire0)) : wire7[(3'h6):(1'h1)]))))
            begin
              reg9 <= (8'hae);
              reg10 <= $signed($unsigned($signed(((wire1 << reg9) ?
                  (~|wire7) : $signed(wire2)))));
              reg11 <= {($unsigned({wire1[(3'h5):(2'h3)], $signed(wire1)}) ?
                      ($unsigned(wire1) ?
                          $unsigned(wire2[(4'hd):(4'h9)]) : (^$unsigned(reg8))) : $signed($unsigned({wire3,
                          wire0}))),
                  ((|$unsigned(wire6[(2'h3):(2'h3)])) + ((((8'ha1) >>> reg9) >= $signed(wire4)) ?
                      ($signed(wire6) + $unsigned((8'hb3))) : (~|(8'ha2))))};
              reg12 <= ($signed(((~&wire2[(2'h2):(1'h0)]) << ((reg11 ?
                      wire1 : wire0) ?
                  $signed(wire3) : wire0[(3'h4):(1'h1)]))) == wire6);
              reg13 <= ($signed($unsigned($unsigned(wire7[(3'h4):(3'h4)]))) && {(~$unsigned($unsigned(reg10)))});
            end
          else
            begin
              reg9 <= (reg10 ?
                  reg12 : $signed((&((8'hb4) ? reg10 : (^~reg8)))));
              reg10 <= $unsigned($signed((((7'h41) ? {wire7} : reg11) ?
                  wire2 : ((^~(8'hbc)) ? (^~reg13) : wire7[(3'h7):(3'h4)]))));
              reg11 <= (~&wire0[(3'h4):(3'h4)]);
              reg12 <= ($signed(($unsigned((wire3 ? reg8 : wire5)) ?
                      (~(wire5 <<< reg13)) : wire3[(4'h9):(3'h7)])) ?
                  (reg11[(1'h0):(1'h0)] ?
                      $unsigned(($unsigned(wire3) ?
                          wire6 : (reg8 ^~ reg8))) : $signed(reg10)) : $unsigned($unsigned((~$signed((8'hba))))));
              reg13 <= reg9[(4'h9):(4'h8)];
            end
          if (reg13[(4'he):(3'h4)])
            begin
              reg14 <= (~|reg13);
              reg15 <= reg8[(1'h1):(1'h1)];
              reg16 <= reg15[(1'h1):(1'h0)];
              reg17 <= $unsigned($signed($signed(reg9)));
            end
          else
            begin
              reg14 <= $unsigned((!reg8));
              reg15 <= wire0[(1'h1):(1'h1)];
              reg16 <= (|(!(8'hba)));
              reg17 <= (|{wire0[(1'h1):(1'h1)], (8'hb2)});
            end
        end
    end
  module18 #() modinst156 (wire155, clk, wire7, wire0, reg9, reg13);
  assign wire157 = {$signed((8'ha6))};
  assign wire158 = wire2;
  assign wire159 = ($signed((8'hb6)) == $unsigned(reg11[(2'h2):(2'h2)]));
  assign wire160 = $unsigned((~$signed((-(~&(8'hbf))))));
  module161 #() modinst185 (.wire164(wire158), .wire165(wire159), .clk(clk), .wire162(reg10), .y(wire184), .wire163(wire155));
  assign wire186 = $unsigned(wire157);
  assign wire187 = $unsigned((-$unsigned((+(~|wire159)))));
endmodule

module module161
#(parameter param183 = ((^~((((8'hbe) ? (8'hbc) : (8'h9d)) <<< ((8'hac) ? (8'ha6) : (8'hb7))) > (^(&(7'h43))))) ? (((((8'hab) - (8'ha7)) ? ((8'ha6) ? (8'hb0) : (8'ha6)) : ((8'hb1) == (8'hbd))) ? (((8'haa) >> (8'hbe)) ~^ ((8'ha2) ? (8'h9d) : (8'hbd))) : ((~&(8'ha0)) >= (8'hb3))) ^ (({(8'hbb)} || (+(8'hba))) ? (((8'hb8) ? (7'h44) : (8'hb3)) >>> ((8'ha2) && (8'hba))) : (8'hbb))) : (-((&(&(8'ha4))) >= (|(!(8'ha6)))))))
(y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire165;
  input wire [(4'hd):(1'h0)] wire164;
  input wire signed [(4'he):(1'h0)] wire163;
  input wire [(5'h13):(1'h0)] wire162;
  wire [(3'h4):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire166;
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg171 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(3'h6):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg167 = (1'h0);
  assign y = {wire182,
                 wire176,
                 wire175,
                 wire166,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire166 = $signed($unsigned((7'h43)));
  always
    @(posedge clk) begin
      if ($signed($signed({((!wire164) || $unsigned((7'h43))),
          $unsigned(wire162)})))
        begin
          reg167 <= (wire164 ?
              ({$unsigned($signed((7'h42))),
                      ($unsigned(wire162) ? (+(8'ha7)) : (~&wire164))} ?
                  (((-wire165) ? wire165 : $signed(wire165)) ?
                      wire165 : $unsigned($unsigned(wire165))) : $signed($unsigned({wire163,
                      wire162}))) : (^~(&wire164[(4'hd):(4'hd)])));
          if (((&reg167[(3'h5):(2'h3)]) ?
              (~^{(+wire166[(4'he):(1'h1)]),
                  (wire165 ^~ (wire162 != wire162))}) : $signed($unsigned(((wire164 ?
                      (7'h43) : wire164) ?
                  ((8'hb1) ? wire165 : (8'ha5)) : $signed(wire164))))))
            begin
              reg168 <= ((wire166[(3'h5):(2'h3)] ?
                      $signed(((wire166 ? wire166 : wire163) ?
                          {wire162} : wire162[(3'h7):(3'h4)])) : reg167[(1'h1):(1'h0)]) ?
                  $unsigned($signed((!wire163[(4'ha):(3'h6)]))) : wire164[(4'hd):(3'h5)]);
              reg169 <= $signed((8'ha0));
              reg170 <= (!$signed(wire163[(3'h7):(1'h0)]));
              reg171 <= (($signed($unsigned({reg170})) ~^ (&({reg167, reg167} ?
                      ((8'haf) ? (8'ha1) : wire165) : wire163))) ?
                  ((8'hb2) ?
                      ($unsigned({wire165, wire163}) && ($signed(reg168) ?
                          (reg170 <<< wire163) : (reg168 ?
                              wire163 : reg167))) : (&wire165)) : reg169[(2'h3):(1'h1)]);
            end
          else
            begin
              reg168 <= $signed(($unsigned(($unsigned((8'hae)) && $unsigned(wire164))) ?
                  wire166[(2'h3):(1'h1)] : ($signed((wire162 ?
                      wire163 : wire163)) >= ($signed(wire162) >>> (-reg169)))));
              reg169 <= reg167;
            end
          reg172 <= $unsigned($unsigned(wire163[(4'h9):(2'h2)]));
        end
      else
        begin
          if (reg170)
            begin
              reg167 <= (~^reg167);
            end
          else
            begin
              reg167 <= (8'ha4);
              reg168 <= ((8'hbb) & (|wire163[(4'ha):(4'h8)]));
              reg169 <= reg167;
              reg170 <= $signed($signed(wire164));
            end
        end
      if (reg172[(4'hd):(4'hc)])
        begin
          reg173 <= wire163;
          reg174 <= reg168[(2'h2):(1'h1)];
        end
      else
        begin
          reg173 <= wire165;
          reg174 <= ((^$unsigned($unsigned($signed(reg167)))) >>> wire165);
        end
    end
  assign wire175 = (&reg174);
  assign wire176 = (~&reg169);
  always
    @(posedge clk) begin
      reg177 <= $unsigned((!wire176));
      reg178 <= {reg174};
      if ($unsigned(reg174[(2'h3):(1'h1)]))
        begin
          reg179 <= wire175;
          reg180 <= $unsigned((8'hae));
        end
      else
        begin
          reg179 <= (^~wire163);
        end
      reg181 <= wire175;
    end
  assign wire182 = $unsigned($unsigned(reg179));
endmodule

module module18
#(parameter param153 = ({(^(~|(^~(8'hae))))} | (((&(8'h9d)) ? ((!(8'h9c)) ? (~|(8'h9e)) : {(7'h44)}) : (((8'hb5) > (8'hb5)) - ((8'hbf) ? (8'ha4) : (7'h44)))) ? {(((7'h44) == (8'hb0)) ? ((8'hbc) ? (8'hb5) : (8'h9c)) : (~^(8'hac))), ((~^(8'hb9)) ? {(8'hb2), (8'ha0)} : ((8'hae) ? (8'hb2) : (8'ha8)))} : ((-((8'hbf) + (8'hb8))) ? {((7'h44) + (8'hb0)), {(7'h44)}} : (((8'hb9) ? (8'ha3) : (8'h9f)) < (!(8'h9f)))))), 
parameter param154 = {(+{(8'h9e), ((param153 + param153) + (&param153))}), ((((+param153) > (^(8'hbb))) ? {param153, (+param153)} : (&(^~param153))) ? ((+{param153, param153}) ? (-(param153 ? param153 : param153)) : (param153 ? {param153, param153} : (param153 ? param153 : param153))) : param153)})
(y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire36;
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire128,
                 wire63,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire23,
                 wire36,
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
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire23 = {$unsigned((^$signed({wire22, wire21}))),
                      wire22[(4'hf):(4'h9)]};
  module24 #() modinst37 (.clk(clk), .wire29(wire23), .wire26(wire19), .wire25(wire21), .y(wire36), .wire28(wire20), .wire27(wire22));
  assign wire38 = $unsigned((((^~(wire21 ?
                          wire36 : wire20)) ~^ wire23[(1'h1):(1'h1)]) ?
                      wire21[(4'hc):(4'h9)] : (wire23 ?
                          $unsigned({wire21, wire23}) : wire21)));
  assign wire39 = (wire21 ^ $unsigned((wire21[(2'h3):(1'h1)] ?
                      wire38 : wire19[(1'h0):(1'h0)])));
  assign wire40 = {wire39[(2'h3):(1'h0)]};
  assign wire41 = $signed($signed($signed((&$signed(wire40)))));
  assign wire42 = {({(wire21[(4'ha):(3'h4)] - (^~wire19))} ^~ (~$signed((8'hb0)))),
                      {(!$unsigned((~&wire40)))}};
  assign wire43 = wire41;
  assign wire44 = (^$unsigned(wire42[(3'h6):(1'h1)]));
  assign wire45 = wire19;
  always
    @(posedge clk) begin
      reg46 <= wire20;
      reg47 <= wire40;
      reg48 <= {$signed($signed(($signed(wire41) ? (-wire38) : (-wire20))))};
    end
  assign wire49 = (~^($signed((reg48[(4'h8):(3'h6)] ?
                          $unsigned(wire22) : $unsigned(wire19))) ?
                      $unsigned(wire43[(2'h3):(2'h3)]) : {wire23}));
  assign wire50 = $signed($signed(wire42[(4'h9):(4'h8)]));
  assign wire51 = $signed(($signed($unsigned({reg47, (8'h9d)})) ?
                      $unsigned(((!wire49) + wire45)) : $unsigned($signed((wire21 > wire42)))));
  assign wire52 = reg46;
  module53 #() modinst64 (wire63, clk, wire43, wire21, wire45, reg48, wire40);
  module65 #() modinst129 (wire128, clk, wire39, wire45, wire49, reg46, wire38);
  always
    @(posedge clk) begin
      reg130 <= wire52[(3'h5):(2'h3)];
      reg131 <= wire49;
      reg132 <= wire45[(3'h7):(1'h0)];
      reg133 <= wire51[(1'h0):(1'h0)];
      reg134 <= reg130[(1'h0):(1'h0)];
    end
  assign wire135 = (~&wire43);
  assign wire136 = $signed($unsigned($unsigned(reg134)));
  assign wire137 = (wire49[(3'h5):(2'h2)] >= $unsigned((^((wire44 || wire23) ?
                       wire42[(1'h1):(1'h0)] : $unsigned(wire128)))));
  assign wire138 = ((~(~&$signed({reg131}))) + $unsigned(($unsigned(wire39[(4'h9):(4'h8)]) ?
                       ($unsigned(wire42) << (reg47 + wire128)) : wire50[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      if ($signed((8'hbd)))
        begin
          if ({(|reg47)})
            begin
              reg139 <= wire39;
            end
          else
            begin
              reg139 <= $signed(((|(~^$unsigned(wire138))) == (wire40[(5'h12):(3'h6)] | wire22)));
              reg140 <= ($signed(wire63) ?
                  {reg139} : $signed((&reg131[(1'h1):(1'h0)])));
              reg141 <= reg131[(1'h0):(1'h0)];
              reg142 <= $signed(wire51);
            end
          reg143 <= (8'hb1);
        end
      else
        begin
          reg139 <= (((+wire51) * reg142[(4'hf):(4'ha)]) > (^~wire137));
        end
      reg144 <= ((~((8'ha5) - ($unsigned(reg46) * $unsigned(wire137)))) ?
          wire19[(4'he):(2'h2)] : $unsigned(wire52));
      reg145 <= ((8'had) ? $signed((8'hb4)) : wire42[(2'h3):(1'h0)]);
      if ((wire51[(1'h0):(1'h0)] ?
          $signed({($signed(wire45) ?
                  wire63 : {wire38})}) : ($unsigned(wire36[(1'h0):(1'h0)]) ?
              $unsigned($unsigned($unsigned(wire50))) : $signed($unsigned(wire63[(4'h9):(3'h5)])))))
        begin
          reg146 <= ((8'hb5) * wire41);
          reg147 <= {((wire51 ?
                      ((~^wire45) || wire39) : wire43[(3'h7):(3'h6)]) ?
                  (~^(~^(wire19 + reg131))) : $unsigned(({reg145,
                      wire136} ~^ reg145[(4'hb):(4'h9)])))};
          reg148 <= wire19[(3'h7):(3'h6)];
        end
      else
        begin
          reg146 <= $unsigned((!((8'ha8) || (((8'hb9) != wire39) ?
              $unsigned(wire38) : wire136))));
          if ((^~$signed($unsigned({wire39[(4'h8):(3'h4)], wire40}))))
            begin
              reg147 <= $signed($unsigned($signed(((~&reg141) <= $unsigned(reg134)))));
              reg148 <= wire136[(3'h7):(3'h7)];
              reg149 <= wire23[(1'h0):(1'h0)];
              reg150 <= wire23[(1'h1):(1'h0)];
              reg151 <= reg46[(5'h10):(4'hf)];
            end
          else
            begin
              reg147 <= (wire128[(1'h1):(1'h1)] ?
                  $unsigned($signed((~^$signed(wire41)))) : ($signed(($unsigned(reg133) ?
                      (reg146 > reg149) : (reg134 ?
                          reg133 : reg139))) & $unsigned(((wire19 * reg147) ?
                      {wire50, reg46} : $unsigned(reg139)))));
              reg148 <= ($signed(reg142[(5'h12):(4'hc)]) ^~ $signed(((^reg141) << $signed($signed(wire52)))));
              reg149 <= (~&({$unsigned((reg144 ? wire20 : wire135))} * reg130));
              reg150 <= ($unsigned({$signed((wire45 ? wire136 : wire20)),
                  ((wire42 ^ reg132) ?
                      wire51 : (reg47 + wire44))}) > (^(~$unsigned($signed(wire41)))));
            end
          reg152 <= wire36[(1'h1):(1'h0)];
        end
    end
endmodule

module module65
#(parameter param126 = ((((^~((8'hbd) ? (8'hb5) : (8'hb7))) ? (8'hb6) : ((|(7'h41)) > ((8'hb4) >>> (8'hbe)))) * (8'ha0)) ? ((|{((8'hb9) ^ (8'hba))}) ? ((~^((8'hb7) >> (8'haa))) | (((8'h9f) & (8'hb0)) >> ((7'h40) ? (8'h9e) : (7'h43)))) : ((~^{(8'hbd), (8'ha0)}) >>> ((+(8'hb6)) >> ((8'ha6) * (7'h42))))) : ((-((~(7'h43)) >>> ((8'h9d) | (8'hbc)))) * ((((8'hb8) ? (7'h41) : (8'hb5)) <<< ((7'h42) ? (8'hb7) : (8'hb9))) < (+((8'hbf) ? (8'ha6) : (8'hbd)))))), 
parameter param127 = (((param126 ? ((param126 * (8'hbc)) + param126) : (~|(8'h9f))) ~^ (~|param126)) ? (param126 | ((^~param126) ? (param126 > param126) : param126)) : param126))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h26d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire [(4'hc):(1'h0)] wire69;
  input wire [(4'hd):(1'h0)] wire68;
  input wire signed [(5'h13):(1'h0)] wire67;
  input wire [(2'h2):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(4'ha):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire85,
                 wire84,
                 wire76,
                 wire73,
                 wire72,
                 wire71,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire71 = (~^$signed(wire66));
  assign wire72 = wire69[(1'h1):(1'h1)];
  assign wire73 = ({$unsigned((8'haa))} ?
                      {(~|$unsigned((wire72 | (8'hb0))))} : (!(($unsigned((8'hbb)) ?
                              (wire72 ? wire67 : (8'ha8)) : wire68) ?
                          $unsigned($unsigned(wire72)) : (wire69 ?
                              (~|(8'h9d)) : wire70))));
  always
    @(posedge clk) begin
      reg74 <= wire67;
      reg75 <= {(~|$signed(wire73[(1'h0):(1'h0)])), wire70};
    end
  assign wire76 = $signed(reg74);
  always
    @(posedge clk) begin
      reg77 <= reg74;
      if ((reg75 ?
          (({wire69[(3'h5):(2'h2)], ((8'hb8) & (8'hb3))} ?
              (~wire67) : ($unsigned(reg74) >= wire70)) && $signed((wire67[(3'h6):(1'h0)] + (wire76 - (8'hb5))))) : (($unsigned({wire66}) * ($signed(wire67) ?
                  reg75 : (^wire67))) ?
              $signed($signed($unsigned(wire66))) : (wire76[(2'h2):(1'h1)] | wire76[(4'he):(4'he)]))))
        begin
          reg78 <= reg74[(4'hb):(4'ha)];
          reg79 <= wire67;
          reg80 <= $signed((wire71[(3'h7):(3'h4)] | (^~wire72[(2'h3):(1'h1)])));
        end
      else
        begin
          if (wire73)
            begin
              reg78 <= (-$signed($signed(((wire72 ?
                  reg79 : reg80) << (wire66 & reg77)))));
              reg79 <= $signed(reg79[(2'h2):(2'h2)]);
            end
          else
            begin
              reg78 <= (!$unsigned(wire69));
              reg79 <= {wire67};
            end
        end
      reg81 <= ($unsigned(reg79) ?
          ((~^$unsigned(((8'had) != wire68))) * (8'hb7)) : (~wire71));
      reg82 <= $unsigned($unsigned($signed(reg81)));
      reg83 <= $signed($unsigned((!wire68[(3'h6):(3'h5)])));
    end
  assign wire84 = $unsigned(($signed($unsigned((!reg82))) ?
                      ($signed(reg74) ?
                          ((reg80 | (8'hb4)) <= wire69[(1'h0):(1'h0)]) : reg77[(4'h9):(1'h0)]) : (+$signed((reg83 ^~ (7'h42))))));
  assign wire85 = reg74;
  always
    @(posedge clk) begin
      reg86 <= $signed($signed(($unsigned((reg75 ? wire68 : wire69)) & reg79)));
      reg87 <= wire68[(4'h8):(1'h0)];
      reg88 <= ($unsigned(((reg79 != (~wire70)) * (wire72[(2'h2):(2'h2)] ?
              reg79[(3'h5):(3'h4)] : (8'hbf)))) ?
          wire72 : reg80[(3'h6):(2'h3)]);
      reg89 <= $unsigned(reg75);
      if ($signed($unsigned({{{reg87, wire68}}, {$signed((8'ha8))}})))
        begin
          reg90 <= (((reg78 ?
                  reg80[(3'h6):(1'h1)] : ((~^reg83) ?
                      wire73 : $signed(reg83))) > (reg81 ?
                  ($unsigned(reg81) ?
                      wire85 : $unsigned(wire68)) : $signed(wire68))) ?
              (^~$unsigned(($unsigned((8'hb1)) <= (8'hb9)))) : ({(-{(8'hab),
                          (8'hbe)}),
                      reg78} ?
                  wire76[(3'h7):(2'h2)] : {$unsigned({wire84, reg81}),
                      wire68[(3'h5):(1'h0)]}));
          reg91 <= ((+(((reg78 + wire67) ?
              (reg90 ?
                  wire71 : wire69) : $unsigned((8'haf))) >= wire66[(2'h2):(1'h0)])) > reg86);
          reg92 <= $signed({reg83, reg87[(1'h0):(1'h0)]});
        end
      else
        begin
          if ($unsigned((reg81[(3'h7):(3'h6)] > (wire71[(4'hb):(3'h4)] ?
              ({reg75, reg88} != (reg77 ?
                  reg83 : wire66)) : ($signed((7'h43)) <<< (reg82 ?
                  wire71 : wire67))))))
            begin
              reg90 <= (!((~$signed((|reg74))) >> (^$signed(reg80))));
              reg91 <= (~$unsigned($unsigned($signed($signed(reg83)))));
              reg92 <= (reg88[(2'h3):(2'h3)] | reg75);
              reg93 <= (-(($signed((reg91 >= wire66)) <<< $signed((wire73 ~^ reg92))) & reg75[(2'h3):(2'h2)]));
              reg94 <= ($unsigned({wire70}) ?
                  ((-(~|$unsigned(wire70))) && ((wire85 ^~ reg74[(4'hd):(3'h4)]) ?
                      ((~&reg87) ?
                          wire69 : $signed(wire73)) : ($signed(wire72) ?
                          reg86[(4'h8):(1'h0)] : reg86[(4'hc):(4'hc)]))) : wire71);
            end
          else
            begin
              reg90 <= ((({reg88, reg83[(2'h3):(2'h3)]} <<< {(reg83 ?
                          wire66 : (8'ha8)),
                      (reg81 ?
                          reg88 : reg83)}) == ($unsigned($unsigned(wire76)) ?
                      {{wire85}, (~|wire67)} : $unsigned($unsigned(reg86)))) ?
                  (+($unsigned({reg80}) ?
                      reg91[(1'h0):(1'h0)] : ((reg94 <<< reg88) && $unsigned(reg92)))) : $signed($signed(wire69)));
              reg91 <= reg83;
              reg92 <= ($signed(reg91) ?
                  $signed(($signed(reg88) ?
                      $unsigned((wire84 ?
                          reg75 : wire70)) : (~|$signed(wire68)))) : $unsigned(reg75));
            end
          reg95 <= ((($unsigned((wire72 <= (8'hb2))) && (^$signed(wire84))) ?
                  (((~wire76) <= reg87[(2'h2):(2'h2)]) ?
                      wire84[(1'h1):(1'h1)] : ({reg79} ?
                          wire85 : $unsigned(reg77))) : wire85) ?
              (~{{(reg88 ^ reg88), (reg94 >>> reg82)}}) : reg90);
          if ({wire66[(2'h2):(1'h0)],
              (wire68 < {(8'h9d), (|$unsigned((7'h43)))})})
            begin
              reg96 <= $signed(reg89);
              reg97 <= (+(wire68[(4'hd):(4'h9)] >>> $signed((reg91 ?
                  $unsigned(wire68) : (7'h41)))));
              reg98 <= wire71;
            end
          else
            begin
              reg96 <= {wire72,
                  ({$unsigned((reg97 || reg87)),
                      (reg95 <= (~|reg81))} + reg80)};
              reg97 <= reg92[(5'h13):(3'h5)];
              reg98 <= wire85;
            end
          if ((reg86 <= (reg98 ^~ wire76)))
            begin
              reg99 <= (reg96[(1'h1):(1'h1)] ?
                  (reg79[(1'h0):(1'h0)] ?
                      (~reg98[(2'h2):(2'h2)]) : wire72) : $unsigned($unsigned(($signed(reg82) ?
                      wire84 : $signed((7'h41))))));
              reg100 <= {((((reg80 ^~ (8'ha1)) ? {wire73} : $unsigned(wire72)) ?
                      $signed((wire70 ? reg94 : reg99)) : ($unsigned(reg93) ?
                          reg75 : (^~reg80))) || ((wire67[(4'hf):(4'h8)] - (reg98 ?
                      reg88 : wire68)) * wire69[(4'ha):(4'h9)])),
                  $unsigned((($signed((8'hbe)) ~^ (reg79 && wire66)) ?
                      reg99 : (~&(wire76 ? reg93 : wire73))))};
              reg101 <= ({(((-wire66) >>> $signed(reg78)) && (-(reg82 >>> reg77))),
                  reg86[(3'h6):(1'h0)]} >>> $signed($unsigned($signed((&reg89)))));
            end
          else
            begin
              reg99 <= (+(8'hb4));
              reg100 <= {wire85};
            end
          reg102 <= ((&$signed($signed({(8'ha7),
              reg88}))) > (~&$unsigned($unsigned((8'hb4)))));
        end
    end
  always
    @(posedge clk) begin
      if ($signed({($signed((reg91 ? wire69 : (8'h9e))) <<< reg74),
          $signed((8'hb0))}))
        begin
          reg103 <= (^~{reg87, reg81[(4'ha):(1'h1)]});
          reg104 <= ($signed($unsigned({(reg90 ^~ wire85),
              (+reg78)})) ~^ wire71);
        end
      else
        begin
          reg103 <= reg80;
          reg104 <= $signed($signed($unsigned($unsigned((!reg74)))));
          reg105 <= reg102;
          reg106 <= ((&$signed(((wire66 != (7'h42)) && (wire66 <<< (8'hba))))) ?
              (reg75[(2'h3):(1'h0)] ?
                  $unsigned($signed((reg101 < wire72))) : $signed(wire73)) : ($signed((reg87[(1'h1):(1'h0)] ?
                  {(8'hbf)} : (reg104 ^ (8'hbd)))) >> (^~(reg102 ^~ reg77))));
        end
    end
  assign wire107 = wire66;
  assign wire108 = reg78;
  assign wire109 = (reg74[(4'hd):(1'h1)] > (reg89[(1'h1):(1'h0)] << ((!(reg74 ?
                       wire85 : reg95)) || (-reg96[(1'h1):(1'h0)]))));
  assign wire110 = wire107[(4'hd):(3'h7)];
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire110)))
        begin
          reg111 <= {$unsigned(((~^(wire85 ? reg95 : reg92)) ?
                  (reg81[(4'h8):(1'h0)] ^ (reg86 ?
                      (8'ha5) : wire108)) : {$signed(wire66),
                      (reg103 == wire107)})),
              (~&(reg94 >> $unsigned(reg89[(2'h3):(1'h1)])))};
          reg112 <= ((~&{(reg87 ? wire67[(4'h8):(3'h7)] : (^reg106))}) ?
              $unsigned(wire76) : reg101[(4'h8):(4'h8)]);
          reg113 <= (8'hb6);
          reg114 <= $unsigned({$unsigned((wire109[(2'h2):(1'h1)] ?
                  $signed(reg98) : wire85))});
          if (reg87)
            begin
              reg115 <= $unsigned((~&$signed((~|(+reg105)))));
              reg116 <= reg91;
            end
          else
            begin
              reg115 <= reg74;
              reg116 <= reg81;
              reg117 <= wire107[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg111 <= $signed($signed(((((8'hb3) ? reg102 : reg89) ~^ (wire85 ?
                  reg86 : reg117)) ?
              $unsigned(reg101[(1'h0):(1'h0)]) : {reg116})));
          reg112 <= $unsigned(reg96);
          reg113 <= $unsigned(reg95[(2'h3):(1'h0)]);
          if ($signed(reg104))
            begin
              reg114 <= reg94;
              reg115 <= $unsigned({reg111[(3'h7):(2'h2)]});
              reg116 <= $signed(reg82[(3'h6):(1'h1)]);
            end
          else
            begin
              reg114 <= $unsigned((~^$unsigned($unsigned($unsigned((8'ha1))))));
              reg115 <= ((+$unsigned($signed($unsigned(reg97)))) ?
                  (~|reg102) : $signed(reg79[(4'hd):(4'hc)]));
              reg116 <= (|($unsigned(((wire85 & wire66) & (reg117 || reg104))) == (reg83 ?
                  (reg99 ?
                      $unsigned((8'h9f)) : reg95[(3'h7):(2'h3)]) : {$signed((8'ha1)),
                      wire71})));
              reg117 <= (~|(^($unsigned(((8'hb6) + wire84)) ?
                  (-(8'hb1)) : $unsigned((^reg94)))));
            end
        end
      reg118 <= $unsigned($unsigned(((reg111[(4'h8):(3'h6)] >> (+wire107)) - (wire66 && reg96[(2'h2):(1'h1)]))));
      reg119 <= wire72[(3'h4):(1'h1)];
      reg120 <= reg83;
    end
  assign wire121 = wire107;
  assign wire122 = (~&$signed(((^wire72[(3'h7):(2'h2)]) ?
                       (reg114 == $signed(reg87)) : $unsigned(reg104))));
  assign wire123 = {$signed((~&reg78)), $signed(wire72[(1'h1):(1'h1)])};
  assign wire124 = {$signed((^~((^reg86) ?
                           $unsigned(reg120) : wire69[(3'h4):(2'h2)]))),
                       (~&reg88)};
  assign wire125 = (reg86[(4'hc):(1'h1)] << (-reg96[(2'h2):(2'h2)]));
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire [(4'hf):(1'h0)] wire57;
  input wire [(4'hd):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire55;
  input wire [(3'h7):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  assign y = {wire62, wire61, wire60, wire59, (1'h0)};
  assign wire59 = $signed($signed({wire54[(1'h1):(1'h0)]}));
  assign wire60 = wire56;
  assign wire61 = (~|$signed(wire57[(4'h8):(2'h2)]));
  assign wire62 = $signed($unsigned((^($unsigned(wire55) ^ (8'h9f)))));
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  assign y = {wire35, wire34, wire33, wire32, wire31, wire30, (1'h0)};
  assign wire30 = (^(($unsigned((wire26 ? (8'ha4) : wire26)) ?
                          wire27[(3'h5):(3'h5)] : $signed($signed(wire27))) ?
                      wire28[(2'h3):(1'h0)] : $unsigned(((+wire27) ^ (~^wire28)))));
  assign wire31 = (!((wire29 ? wire26 : (~|$unsigned((8'ha1)))) - wire25));
  assign wire32 = $signed(wire29);
  assign wire33 = wire31[(3'h4):(1'h0)];
  assign wire34 = {($signed($signed((wire28 < wire27))) <<< wire25[(4'h8):(3'h4)])};
  assign wire35 = ({wire27,
                          ({{(8'haf)},
                              (~&wire31)} == (!wire33[(2'h3):(2'h2)]))} ?
                      (&($unsigned(wire25) ?
                          (!wire29) : ((wire28 ? (8'hbb) : wire25) ?
                              $unsigned(wire32) : wire29))) : {$unsigned($signed(((8'hb9) && wire33)))});
endmodule

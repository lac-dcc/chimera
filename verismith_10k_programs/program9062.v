module top
#(parameter param170 = ((((((8'ha7) ? (8'hb5) : (8'hb5)) & {(8'ha6), (8'ha1)}) > (((8'h9d) || (8'hb2)) ? ((8'hb6) >= (8'hbf)) : ((7'h43) ? (8'hb2) : (8'hb6)))) ? (&({(8'ha8), (8'hbc)} & ((8'h9e) < (8'hbc)))) : (|{((8'hb5) >= (8'ha6))})) ? {(~|(((7'h41) ? (8'ha9) : (8'hbb)) >> (-(7'h41))))} : ((|({(8'hb2)} == ((8'hb9) ? (8'hbc) : (8'ha4)))) ? {(~&((8'hb5) >> (8'hac))), (((8'hbe) > (8'ha3)) - {(8'ha8)})} : ((~&((8'hb1) * (8'hb9))) ? (^~(!(8'ha4))) : ({(7'h40), (8'hb3)} ? ((7'h42) ^ (8'hbb)) : (~|(7'h40)))))), 
parameter param171 = (^(+param170)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire163;
  wire [(3'h5):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire168;
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire37,
                 wire39,
                 wire40,
                 wire48,
                 wire163,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  assign wire4 = $unsigned((~(8'hac)));
  assign wire5 = wire4[(4'he):(4'ha)];
  assign wire6 = (wire0 ? wire5 : (7'h40));
  assign wire7 = $signed(($unsigned(wire4[(3'h4):(1'h0)]) ?
                     {{{wire0}}, wire0[(3'h6):(1'h1)]} : (wire4 ?
                         $unsigned(wire0[(4'hd):(4'hb)]) : $signed((|wire3)))));
  assign wire8 = wire5[(2'h2):(1'h1)];
  assign wire9 = (|(($unsigned((+wire4)) >>> (^(wire6 * (8'ha8)))) * (wire6 + $unsigned({wire3}))));
  module10 #() modinst38 (wire37, clk, wire3, wire1, wire2, wire0);
  assign wire39 = ($unsigned(($signed(wire2[(3'h4):(2'h3)]) ?
                          ($unsigned(wire4) ^~ (8'hbc)) : (8'h9e))) ?
                      wire4[(4'ha):(3'h5)] : {wire37[(1'h1):(1'h0)], (8'ha2)});
  assign wire40 = wire9;
  always
    @(posedge clk) begin
      if ($signed(((+({(8'ha2), wire0} ? wire1 : ((8'h9e) * (7'h42)))) ?
          $unsigned((&wire0)) : $unsigned(wire39[(1'h0):(1'h0)]))))
        begin
          if ($signed($unsigned((wire3 ?
              wire40[(5'h11):(1'h0)] : (-$unsigned(wire3))))))
            begin
              reg41 <= $signed({(~|$unsigned({wire3, (8'ha9)})), (7'h41)});
              reg42 <= ($signed($unsigned($unsigned((wire1 * wire5)))) >> reg41);
            end
          else
            begin
              reg41 <= ((^~wire39) ~^ $unsigned({(^(~^wire5))}));
            end
          reg43 <= $signed((wire1 - (-wire6)));
        end
      else
        begin
          reg41 <= {$unsigned($signed((!$signed(wire7)))),
              (^reg42[(4'h8):(4'h8)])};
          reg42 <= ((8'hb5) || wire9[(2'h3):(1'h0)]);
          reg43 <= $unsigned((((wire7[(2'h2):(1'h1)] == (wire1 ?
                  wire3 : wire5)) ?
              $unsigned((wire1 ? wire37 : (8'ha5))) : ((-wire5) ?
                  wire7[(1'h0):(1'h0)] : {wire39, wire39})) + ((wire1 ?
              (wire9 ? wire7 : wire3) : $signed(wire1)) <= {$unsigned(wire40),
              (wire4 ? wire37 : wire37)})));
          reg44 <= wire1[(4'ha):(3'h5)];
        end
      reg45 <= $unsigned($signed((($signed(wire7) + $signed(wire8)) ?
          wire39 : $unsigned((wire4 + wire1)))));
      reg46 <= $signed(reg44[(1'h0):(1'h0)]);
      reg47 <= $unsigned(($unsigned((wire2[(1'h1):(1'h0)] << (wire1 ?
          wire2 : wire37))) - ((reg41 ?
              reg45[(3'h6):(1'h1)] : $unsigned(wire5)) ?
          $unsigned($signed(wire39)) : $signed($signed(wire39)))));
    end
  assign wire48 = ((&{wire37,
                          ((wire9 ? wire3 : reg46) ?
                              $unsigned(wire0) : $unsigned((7'h42)))}) ?
                      (8'hb2) : $unsigned($unsigned(reg45)));
  module49 #() modinst164 (.wire54(wire8), .y(wire163), .wire51(wire2), .wire53(reg42), .clk(clk), .wire52(wire1), .wire50(wire48));
  assign wire165 = (!wire7);
  assign wire166 = (wire40 ?
                       (wire165 | ((8'hba) && (reg41[(5'h12):(5'h12)] ?
                           (^~wire1) : $unsigned((8'ha4))))) : wire2[(4'ha):(4'h9)]);
  assign wire167 = wire3[(4'h8):(3'h7)];
  module49 #() modinst169 (wire168, clk, wire4, wire5, reg46, wire40, reg42);
endmodule

module module49
#(parameter param162 = ((~|({(!(8'hae)), ((7'h40) ? (8'had) : (8'ha1))} ? (~^((8'hac) ? (8'hbf) : (8'ha9))) : {((8'ha4) || (8'ha6)), (~^(8'hb3))})) + (((((8'hb1) <= (8'hb4)) ? ((8'hb3) ? (8'h9e) : (7'h44)) : (~&(8'ha5))) != {(&(8'hbe)), (7'h41)}) && ({((8'hb0) ? (8'hbe) : (8'hb3)), {(8'hbe), (8'haf)}} ? (((8'ha8) <= (8'hb0)) >= (~&(8'ha9))) : (((8'h9e) << (8'hac)) ? ((8'hb5) | (8'hb1)) : ((8'ha4) ? (8'hbc) : (8'h9c)))))))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire [(5'h12):(1'h0)] wire53;
  input wire [(3'h6):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire51;
  input wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire [(3'h4):(1'h0)] wire128;
  wire [(5'h13):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire55;
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(4'he):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire128,
                 wire83,
                 wire55,
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
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire55 = (&$unsigned($unsigned(($unsigned(wire50) <<< {(8'hb5)}))));
  module56 #() modinst84 (wire83, clk, wire50, wire53, wire55, wire51);
  module85 #() modinst129 (.y(wire128), .wire86(wire53), .wire87(wire52), .wire88(wire51), .wire89(wire83), .clk(clk));
  always
    @(posedge clk) begin
      reg130 <= wire52[(3'h5):(1'h1)];
      if (((7'h42) & (((~wire51[(3'h7):(2'h2)]) ?
              (^~wire51) : ($signed(wire53) & wire51)) ?
          (^~(^~(reg130 * (8'ha0)))) : (7'h40))))
        begin
          reg131 <= $unsigned(wire55);
          reg132 <= (-$unsigned((~&$unsigned($signed((8'hba))))));
          reg133 <= reg130[(4'he):(4'ha)];
          reg134 <= $signed({($unsigned((~|wire128)) ?
                  ({reg132, wire83} ?
                      (reg131 ?
                          (8'ha4) : (8'hb5)) : wire54[(5'h12):(4'hf)]) : $signed($unsigned(wire54)))});
        end
      else
        begin
          reg131 <= wire55;
          if ({$unsigned($unsigned($signed($unsigned(reg132))))})
            begin
              reg132 <= $signed({wire53});
            end
          else
            begin
              reg132 <= $signed($unsigned(reg130[(4'hf):(2'h3)]));
              reg133 <= wire55[(3'h5):(3'h4)];
            end
        end
      reg135 <= {$signed(wire55), wire128};
    end
  assign wire136 = ($unsigned(reg131[(4'hf):(4'hd)]) ?
                       $unsigned(reg132[(3'h7):(2'h2)]) : ($unsigned(($unsigned(reg135) ?
                           (wire54 << wire50) : ((8'ha5) ?
                               reg131 : wire52))) * ($unsigned((8'ha0)) ?
                           ((reg133 ?
                               wire128 : wire50) >>> wire53) : wire53[(5'h10):(4'hf)])));
  assign wire137 = $unsigned(wire50);
  assign wire138 = $unsigned(wire52[(2'h3):(2'h2)]);
  assign wire139 = ((wire53[(4'hf):(4'h8)] <<< $signed({$unsigned(reg134),
                           (^~reg134)})) ?
                       $signed(wire128[(2'h3):(2'h2)]) : $unsigned(($unsigned(reg133[(2'h3):(1'h0)]) | ((wire52 || wire52) + wire136))));
  assign wire140 = $signed(wire53);
  assign wire141 = ((|(!$signed((^~reg135)))) >> (~&(&(~|(reg133 <= wire83)))));
  assign wire142 = {($signed(wire140[(3'h4):(1'h1)]) ^ $signed((~&reg130[(1'h0):(1'h0)]))),
                       wire137};
  always
    @(posedge clk) begin
      if (($signed($unsigned($unsigned((wire53 ?
          reg130 : wire53)))) ^ (~^($signed($unsigned(wire136)) ?
          ((8'hb8) ?
              reg135[(3'h4):(3'h4)] : (|(8'hb9))) : wire140[(3'h4):(2'h2)]))))
        begin
          reg143 <= ($signed($signed((~^{wire53, (8'hae)}))) ?
              ($signed($signed($signed((8'ha4)))) ?
                  ({$unsigned(wire83),
                      reg134[(4'h9):(4'h8)]} ^~ reg131[(3'h7):(1'h1)]) : ((reg130 ?
                          {wire141, reg135} : $signed(reg132)) ?
                      reg135 : (-(^~wire54)))) : $unsigned(((wire52 ?
                  reg131[(3'h4):(3'h4)] : $signed((8'hb5))) > wire141)));
          if (wire128[(1'h0):(1'h0)])
            begin
              reg144 <= ($signed((&(-$signed(wire128)))) == $unsigned(($signed((wire83 ?
                      wire50 : wire54)) ?
                  reg143[(3'h7):(2'h3)] : {{wire52, wire83}, (&wire138)})));
              reg145 <= wire136;
              reg146 <= ((&(&(reg131[(3'h6):(3'h6)] ^~ (reg144 ^ reg134)))) ?
                  ($signed(($unsigned(wire139) <<< (|wire138))) >= $signed((~^wire141[(3'h5):(1'h0)]))) : $signed(($signed((reg134 >= wire136)) || $signed(wire52[(2'h2):(1'h1)]))));
              reg147 <= wire55;
            end
          else
            begin
              reg144 <= (!$signed($unsigned(reg146)));
              reg145 <= ((reg133 ? $signed({$signed(wire50)}) : {reg134}) ?
                  (((~^$signed(wire138)) < $signed({wire136})) ?
                      wire136[(4'hb):(3'h6)] : (wire55 ?
                          $unsigned((~|wire142)) : (reg132 ?
                              wire50[(4'h8):(3'h7)] : reg130))) : $unsigned((+wire128[(1'h1):(1'h1)])));
              reg146 <= ($unsigned(((8'ha2) ?
                  ((reg130 ?
                      wire51 : reg130) >= (reg146 <= (8'hbb))) : $unsigned($unsigned(wire138)))) <<< $signed($signed(({wire51} & $unsigned((8'hbe))))));
              reg147 <= $unsigned({{(reg134[(3'h5):(2'h2)] ?
                          $unsigned(wire51) : wire138[(4'h9):(3'h7)]),
                      wire136[(4'h9):(2'h3)]}});
            end
          reg148 <= $signed((wire54 * (^~wire83)));
        end
      else
        begin
          reg143 <= (reg131[(2'h3):(2'h3)] == (^$signed(wire140)));
          if (((8'hbd) ?
              (&(reg133[(3'h4):(1'h1)] ?
                  wire136 : (8'hb4))) : reg135[(2'h3):(2'h2)]))
            begin
              reg144 <= reg146;
              reg145 <= $unsigned(wire128);
              reg146 <= (reg132[(4'ha):(1'h1)] ?
                  wire137 : (reg147 == $signed((~^(wire55 || wire51)))));
              reg147 <= wire136;
            end
          else
            begin
              reg144 <= {((($unsigned(reg145) ? (-reg133) : $unsigned(wire83)) ?
                      wire136[(3'h7):(3'h6)] : reg147[(2'h2):(1'h1)]) ^~ $unsigned((reg144[(4'h8):(3'h4)] ?
                      $unsigned(reg134) : (wire52 >= wire83)))),
                  (wire142 ?
                      $unsigned($signed($signed(reg135))) : (!((wire52 ?
                          reg132 : wire139) > (wire139 && reg145))))};
              reg145 <= reg148[(3'h4):(2'h2)];
              reg146 <= wire139;
              reg147 <= (^{(^~$signed($signed(reg133))),
                  ((^~{reg132}) * (((8'ha5) || wire52) ?
                      {reg133} : (~reg148)))});
            end
          reg148 <= wire55[(1'h0):(1'h0)];
        end
      reg149 <= $unsigned((wire53[(4'hb):(4'hb)] ?
          (8'h9f) : ((^~$signed(wire55)) ?
              {wire53[(1'h1):(1'h0)], $unsigned(reg134)} : $signed((reg147 ?
                  (8'ha1) : wire51)))));
      if ({(($unsigned($signed((7'h44))) ?
              $signed(reg144[(4'hc):(3'h7)]) : (~|(wire137 ?
                  (8'ha8) : wire50))) >> (({wire140, wire139} ^~ {wire83}) ?
              reg130 : (reg145[(4'hd):(3'h4)] ^ (wire50 ? reg133 : (8'hac)))))})
        begin
          reg150 <= (reg132[(4'hb):(2'h3)] ?
              $signed({wire140, {(!(8'hbc))}}) : wire83);
          reg151 <= $unsigned((wire140 || reg146));
          if (reg131)
            begin
              reg152 <= (reg131 > $signed((wire53[(3'h6):(3'h4)] ^~ $unsigned(wire83[(1'h0):(1'h0)]))));
              reg153 <= (~^($signed($signed((!(8'hb3)))) ?
                  wire55[(3'h6):(3'h6)] : $signed((~|(wire140 ?
                      wire138 : wire83)))));
              reg154 <= (~&(7'h43));
              reg155 <= wire128;
              reg156 <= (^~reg147);
            end
          else
            begin
              reg152 <= $signed((8'hb2));
              reg153 <= $signed($signed((8'ha0)));
              reg154 <= wire83;
            end
          if ($signed((|wire83)))
            begin
              reg157 <= (wire83 < {$signed(($signed(wire140) ?
                      $unsigned(wire53) : wire136))});
              reg158 <= $signed({reg134[(1'h0):(1'h0)],
                  ($unsigned((wire140 ? reg156 : (7'h41))) ?
                      (~&(reg143 ?
                          reg149 : wire139)) : $signed($unsigned(reg132)))});
              reg159 <= $signed(wire140[(1'h1):(1'h1)]);
            end
          else
            begin
              reg157 <= wire54;
              reg158 <= ((+reg132) << $signed((wire83 != wire55[(2'h3):(1'h0)])));
            end
          reg160 <= ($unsigned($unsigned(reg134[(3'h5):(1'h1)])) ?
              reg133 : $unsigned((^~wire138[(4'hf):(3'h5)])));
        end
      else
        begin
          reg150 <= reg146;
          reg151 <= reg155;
          reg152 <= ($unsigned($signed({{wire140}})) || reg157);
          reg153 <= wire137;
        end
      reg161 <= $signed((^(($unsigned(wire139) ?
              $signed(reg148) : (reg148 ? wire140 : reg135)) ?
          (~((8'h9c) ? wire139 : reg132)) : (~|(&(8'hb9))))));
    end
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  assign y = {wire36,
                 wire34,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 (1'h0)};
  assign wire15 = (wire14 ?
                      $signed($unsigned(wire13)) : $signed((((wire12 ?
                              wire14 : wire14) ?
                          (^~wire11) : wire11) && wire11[(3'h4):(2'h3)])));
  assign wire16 = $signed(wire14[(2'h3):(1'h1)]);
  assign wire17 = ($signed((^$unsigned((^~wire13)))) * $signed($signed({$unsigned((8'hb5)),
                      $signed(wire11)})));
  assign wire18 = (wire17[(1'h0):(1'h0)] | wire15[(5'h10):(4'he)]);
  assign wire19 = (!$unsigned(((&$signed((8'hb2))) & $unsigned(wire18))));
  assign wire20 = (~|$signed($unsigned({wire19[(4'hd):(4'hc)]})));
  module21 #() modinst35 (wire34, clk, wire16, wire20, wire15, wire13);
  assign wire36 = wire17[(1'h0):(1'h0)];
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 (1'h0)};
  assign wire26 = wire24[(1'h1):(1'h0)];
  assign wire27 = wire24[(1'h1):(1'h0)];
  assign wire28 = wire25[(4'ha):(3'h7)];
  assign wire29 = (wire23[(2'h2):(1'h1)] ^ $signed($signed($signed($unsigned((8'ha8))))));
  assign wire30 = wire28;
  assign wire31 = wire27[(2'h2):(2'h2)];
  assign wire32 = wire22[(2'h3):(1'h0)];
  assign wire33 = ($unsigned(wire32) || (wire30 ? wire32 : wire29));
endmodule

module module85
#(parameter param127 = ((~(^~(8'hbe))) | (~((~|((8'hbb) ? (7'h42) : (7'h42))) & (!(^(8'hb8)))))))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire [(2'h2):(1'h0)] wire87;
  input wire signed [(2'h2):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  assign y = {wire126,
                 wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg100,
                 (1'h0)};
  assign wire90 = {($unsigned($signed(wire88[(4'h9):(1'h0)])) | (~&wire86)),
                      (wire88[(4'hd):(4'ha)] ?
                          ((~^(wire87 <= wire88)) ?
                              $unsigned((wire86 << (8'ha5))) : {(~^wire89)}) : (wire89 > ((+wire86) ^~ $signed(wire86))))};
  assign wire91 = ((((~^{wire89}) ? $signed({wire89, wire86}) : wire88) ?
                      $unsigned({((8'ha3) ?
                              wire87 : (8'hac))}) : $unsigned((wire87[(1'h1):(1'h0)] ?
                          $signed(wire88) : {wire87}))) << $signed(wire88));
  assign wire92 = (~^($unsigned(({(8'hb4)} ? wire86 : (wire86 | wire87))) ?
                      ((~wire91[(2'h2):(1'h0)]) ^ wire91[(4'he):(1'h1)]) : (((wire87 ?
                              wire86 : (7'h44)) ?
                          $unsigned((8'hb9)) : (|wire89)) ~^ (~&(~wire91)))));
  assign wire93 = wire92;
  assign wire94 = wire91;
  assign wire95 = wire88[(4'hc):(3'h4)];
  assign wire96 = (wire94[(3'h4):(1'h0)] ?
                      (~$unsigned((-$signed(wire88)))) : $signed(($unsigned($signed((8'ha3))) > (wire86 + wire89))));
  assign wire97 = $unsigned($signed(wire88));
  assign wire98 = ((8'hb3) ^~ $signed($unsigned($unsigned($unsigned(wire90)))));
  assign wire99 = wire96;
  always
    @(posedge clk) begin
      reg100 <= (({$unsigned(((8'hbf) & wire88)), {(^wire93)}} ?
          ({$unsigned(wire87)} | $signed($unsigned(wire87))) : (((wire96 << wire93) && {wire94,
              wire89}) < wire92[(4'hf):(3'h4)])) != {(+wire99)});
    end
  assign wire101 = wire88[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg102 <= (wire98 >>> ($signed(((wire93 ? wire90 : wire99) ?
          wire93 : (wire88 ? wire96 : wire99))) ^~ reg100[(3'h6):(1'h1)]));
      reg103 <= (^~(wire93[(3'h5):(2'h3)] ?
          $unsigned(({wire89} ?
              (wire98 ?
                  wire99 : reg100) : wire96[(4'hc):(1'h1)])) : $signed({(reg100 >= wire91)})));
      reg104 <= wire98;
      if ($unsigned((|$unsigned($signed(((8'hb9) ? wire92 : wire101))))))
        begin
          reg105 <= {(~^(8'hb2)),
              $unsigned({{(&wire86), (wire92 ? wire98 : wire96)}})};
          if ((wire92 ?
              wire89 : (^((wire97[(1'h0):(1'h0)] & (wire96 ?
                  wire86 : reg105)) ^~ (^wire92)))))
            begin
              reg106 <= ($signed($signed(($unsigned(wire86) - (wire90 == wire98)))) + reg105[(4'h8):(3'h7)]);
              reg107 <= $signed(((~$signed(reg103)) ?
                  (|((~wire90) + (^~(8'ha0)))) : $signed(wire93[(1'h1):(1'h1)])));
            end
          else
            begin
              reg106 <= $signed(wire98);
              reg107 <= $signed(wire91[(4'hf):(4'hf)]);
              reg108 <= wire97;
              reg109 <= (wire95[(2'h3):(2'h3)] ?
                  reg108[(4'h9):(4'h9)] : (^wire93[(3'h6):(2'h3)]));
              reg110 <= ((-wire87) ?
                  ($signed($unsigned(wire92)) ?
                      {$unsigned((wire90 >> reg105)),
                          ($signed(reg105) < reg102[(4'hb):(1'h1)])} : (wire93 >> ((wire95 * wire88) ?
                          $signed(wire93) : wire99))) : ((8'h9f) * (wire87[(2'h2):(1'h1)] == ((reg104 ?
                      wire94 : reg104) <<< (wire99 ? reg107 : wire90)))));
            end
          reg111 <= reg100;
        end
      else
        begin
          if ($signed(((wire96 ?
                  {$signed(wire92)} : (wire94[(4'h8):(1'h0)] < (wire91 ?
                      (8'ha9) : wire88))) ?
              reg107 : wire90)))
            begin
              reg105 <= ((wire89[(1'h0):(1'h0)] <= reg109) ?
                  $signed(reg105[(1'h0):(1'h0)]) : ($signed((wire88[(4'h8):(2'h3)] ?
                          (wire87 ? wire89 : wire101) : wire101)) ?
                      {wire101[(2'h2):(1'h0)]} : {$signed((8'hb5))}));
              reg106 <= wire99;
            end
          else
            begin
              reg105 <= $signed(($signed((-$signed(reg107))) ?
                  reg107[(1'h0):(1'h0)] : reg109));
            end
          reg107 <= $signed($signed((((&reg102) + $unsigned(wire99)) ^ (!(&reg106)))));
          if ($signed(reg105[(2'h3):(1'h0)]))
            begin
              reg108 <= reg104;
              reg109 <= $unsigned(wire87);
            end
          else
            begin
              reg108 <= {$unsigned(($unsigned($unsigned(reg107)) * (~|{(8'hac)})))};
              reg109 <= ($unsigned((|$unsigned(wire99[(3'h4):(2'h3)]))) <<< ($signed(wire89[(3'h4):(2'h3)]) ?
                  $unsigned((~(^(8'hbd)))) : wire94[(4'h9):(3'h4)]));
              reg110 <= ($unsigned((~&(!$signed(reg102)))) - (!$signed($signed(reg108[(2'h3):(1'h0)]))));
              reg111 <= (wire96[(5'h13):(4'h8)] ~^ (wire92[(4'h8):(3'h7)] * $unsigned(({reg107,
                      (8'ha7)} ?
                  (reg100 ? reg108 : wire86) : (wire88 ? (8'hb6) : reg111)))));
              reg112 <= (~&{(wire97[(1'h0):(1'h0)] ? wire89 : (7'h44))});
            end
        end
      if (((reg109 ?
              ($unsigned((reg110 | wire96)) ~^ ((wire98 ?
                  wire90 : reg103) || $unsigned(wire89))) : ($unsigned({wire94}) ?
                  wire95[(1'h1):(1'h0)] : wire98[(3'h6):(3'h6)])) ?
          $signed($signed(((wire89 ? (8'h9f) : wire88) ?
              $unsigned(wire90) : $signed(reg100)))) : (8'ha0)))
        begin
          reg113 <= ((+((^~(wire97 ? reg104 : reg111)) ?
              wire95[(4'hb):(2'h3)] : wire99[(5'h11):(3'h5)])) ^~ reg102);
          reg114 <= (~$signed((((wire89 ? wire90 : wire88) ?
                  (wire95 ? wire95 : reg103) : (reg100 ~^ (7'h41))) ?
              reg110[(3'h5):(2'h3)] : reg100)));
          if ($signed(reg114))
            begin
              reg115 <= (wire95 == $unsigned(wire96[(5'h12):(2'h3)]));
              reg116 <= (reg105[(1'h1):(1'h0)] ?
                  reg105 : {reg113[(3'h6):(1'h0)], reg103});
              reg117 <= (8'ha1);
              reg118 <= reg114;
            end
          else
            begin
              reg115 <= (8'hb9);
              reg116 <= (!$signed(reg104));
              reg117 <= $signed((!reg109[(1'h1):(1'h1)]));
              reg118 <= wire97;
              reg119 <= (~$unsigned((^$signed(reg117[(3'h4):(2'h2)]))));
            end
          reg120 <= ((($unsigned({reg111}) ?
                  (reg108 & (reg115 ?
                      wire96 : reg104)) : $unsigned(wire93)) < reg114) ?
              (^(^~reg112)) : ($signed(($unsigned(wire95) && (wire91 ?
                      reg115 : reg117))) ?
                  (reg100[(3'h6):(3'h5)] || $signed(wire99)) : wire87));
          if (((wire92 ?
              $unsigned((|$signed(wire98))) : (&reg107)) > $signed(reg117)))
            begin
              reg121 <= (((reg100[(3'h4):(1'h1)] > $signed((wire91 ?
                          wire95 : (8'hac)))) ?
                      (|{reg120[(1'h0):(1'h0)]}) : $unsigned((&$unsigned(reg112)))) ?
                  {reg120} : ((|wire87) >> (reg111 <= $signed(reg113))));
            end
          else
            begin
              reg121 <= wire88;
              reg122 <= (8'hb5);
              reg123 <= wire91;
              reg124 <= {reg116};
              reg125 <= (~|(($unsigned(((8'ha1) <= (8'hbe))) ?
                      wire91 : ($signed(reg100) ?
                          (8'hb9) : (reg113 ? wire86 : reg100))) ?
                  ((~&(wire90 ? (8'ha4) : (8'hb5))) ?
                      ($unsigned(reg113) ?
                          reg117 : (reg117 ^ reg103)) : reg105[(2'h2):(2'h2)]) : $signed(((reg113 ?
                      (8'hbe) : wire98) < wire90))));
            end
        end
      else
        begin
          reg113 <= ((^(+reg125)) < (wire92 ?
              (($unsigned(wire97) <<< reg109) && ($signed(wire89) >> (~^reg112))) : {$signed(wire89)}));
          reg114 <= (reg111 ?
              ($signed($unsigned($signed(reg109))) ?
                  $unsigned(reg106) : ((8'ha8) ?
                      wire93 : $unsigned(wire97[(1'h1):(1'h0)]))) : reg115[(3'h5):(2'h3)]);
        end
    end
  assign wire126 = ($signed($unsigned((((8'hbc) ^ reg121) || ((8'hb8) & reg114)))) ~^ (!($signed(reg102) ~^ reg119[(2'h3):(2'h3)])));
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire60;
  input wire [(5'h10):(1'h0)] wire59;
  input wire [(2'h3):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  assign y = {wire82,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg81,
                 reg80,
                 reg79,
                 reg75,
                 (1'h0)};
  assign wire61 = (~&wire57[(1'h0):(1'h0)]);
  assign wire62 = wire59;
  assign wire63 = $unsigned($signed(wire60[(3'h4):(3'h4)]));
  assign wire64 = $signed((-{wire61[(1'h1):(1'h1)], wire63}));
  assign wire65 = $unsigned($unsigned(wire58[(1'h0):(1'h0)]));
  assign wire66 = $signed({$signed($unsigned(wire59[(4'he):(3'h5)]))});
  assign wire67 = $unsigned((wire66 <<< $signed(wire66[(1'h1):(1'h1)])));
  assign wire68 = $unsigned($signed({(wire66 ~^ ((8'hb1) <<< wire60)),
                      ($unsigned((8'hb7)) && wire57)}));
  assign wire69 = {$signed(((wire67 ?
                              (wire67 ?
                                  wire64 : wire66) : wire65[(3'h4):(2'h3)]) ?
                          wire60[(1'h1):(1'h1)] : $signed(((8'hbc) ?
                              (8'hb1) : wire61)))),
                      ((wire57[(1'h0):(1'h0)] == $signed($signed((8'h9c)))) ?
                          wire63 : $signed(($unsigned(wire66) != {wire67})))};
  assign wire70 = {$unsigned(wire69), wire66[(3'h4):(1'h1)]};
  assign wire71 = {{(wire64[(3'h4):(1'h1)] ?
                              ({wire68, wire57} ?
                                  (!wire57) : $signed(wire66)) : (!$signed(wire57)))},
                      ($unsigned((^~(!wire70))) | (($unsigned(wire62) ?
                          wire66 : wire69) & $unsigned({wire60})))};
  assign wire72 = {$unsigned((+($unsigned(wire63) ?
                          (wire69 ? wire62 : (8'ha5)) : $unsigned((8'hbe)))))};
  assign wire73 = $unsigned($signed($signed((&$signed(wire71)))));
  assign wire74 = ((&$unsigned($unsigned($signed(wire58)))) ?
                      (8'hb7) : $unsigned($signed($unsigned((8'hba)))));
  always
    @(posedge clk) begin
      reg75 <= wire68[(3'h5):(1'h1)];
    end
  assign wire76 = ((~wire61) ?
                      $unsigned($unsigned(($unsigned(wire73) || $signed(wire57)))) : $signed(wire65));
  assign wire77 = (^~($unsigned($unsigned((wire69 ? wire70 : wire73))) ?
                      ((wire72 ?
                          (wire63 ^~ wire62) : wire58) >= $signed((-wire70))) : (wire62[(3'h4):(1'h1)] ?
                          $signed(((8'haf) * wire76)) : {wire69, wire73})));
  assign wire78 = wire70[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg79 <= ({$unsigned($unsigned((!(8'ha1))))} ?
          $unsigned((!wire58[(2'h3):(2'h3)])) : ($unsigned((8'hb2)) ?
              (wire77[(4'hf):(3'h7)] == wire66) : {(wire65[(2'h3):(1'h1)] ?
                      {wire77} : $signed(wire62)),
                  $unsigned((wire62 ? wire58 : (8'had)))}));
      reg80 <= ((wire64 ^ $unsigned({(8'hb3)})) ?
          wire76 : $signed((({wire74} ?
              $unsigned(wire68) : $signed(wire66)) != (+(^wire67)))));
      reg81 <= ((wire71 ? wire58 : ({(&wire69), (wire70 ^ wire77)} < wire64)) ?
          ((+(~^wire67[(4'h8):(4'h8)])) ?
              $signed((+wire72)) : ((((7'h42) ~^ wire73) ?
                  wire57[(2'h3):(1'h1)] : wire63) ^~ wire74[(2'h3):(2'h2)])) : $unsigned(($signed((8'ha9)) == {wire69[(1'h0):(1'h0)],
              reg80})));
    end
  assign wire82 = ((wire66[(1'h0):(1'h0)] & $unsigned($unsigned((reg79 ?
                      wire62 : wire61)))) ^~ $unsigned({$signed((wire63 >= wire57)),
                      reg81}));
endmodule

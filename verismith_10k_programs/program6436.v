module top
#(parameter param207 = (((7'h41) ? (-(~^((8'hb6) >>> (8'ha9)))) : ((((8'ha5) | (8'hb4)) && ((8'ha4) << (8'haa))) + (((7'h43) ? (8'hb5) : (8'hbb)) ? ((8'hb7) ? (7'h40) : (8'hb4)) : (^~(8'hbc))))) & (~(^(((7'h44) ? (8'ha9) : (8'hb1)) ? ((8'ha0) >> (8'hb6)) : ((8'hb1) ? (8'hb0) : (8'ha5)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire206;
  wire [(4'h8):(1'h0)] wire205;
  wire signed [(5'h11):(1'h0)] wire204;
  wire [(4'hf):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire202;
  wire signed [(5'h11):(1'h0)] wire201;
  wire [(3'h4):(1'h0)] wire200;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire192;
  reg [(5'h15):(1'h0)] reg199 = (1'h0);
  reg [(4'hf):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire25,
                 wire26,
                 wire122,
                 wire124,
                 wire125,
                 wire192,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ((~^wire1) ?
                     ((~&(8'hb2)) ?
                         {$signed($unsigned(wire2)),
                             wire0[(3'h7):(1'h0)]} : ((+wire1) ?
                             $signed((wire5 >>> wire1)) : (~(wire0 ?
                                 (8'h9f) : wire0)))) : $unsigned(($signed((wire5 ?
                             wire4 : wire1)) ?
                         $unsigned($signed(wire2)) : $signed((|wire5)))));
  assign wire7 = wire6;
  assign wire8 = {wire4[(4'he):(3'h7)]};
  always
    @(posedge clk) begin
      reg9 <= {$unsigned($unsigned(wire2)),
          (($unsigned({wire0}) || ((!wire1) <<< $unsigned(wire4))) + $signed($signed($signed(wire2))))};
      if ({wire3[(2'h3):(1'h1)], wire6[(4'h8):(3'h5)]})
        begin
          if (wire5)
            begin
              reg10 <= ((8'hbf) ~^ wire8[(1'h0):(1'h0)]);
              reg11 <= (-reg9[(4'hf):(4'hc)]);
              reg12 <= (wire2 ?
                  (^~(($unsigned(wire1) == (wire2 >= (8'h9d))) < wire0[(4'hd):(2'h3)])) : (((8'h9d) >>> ($signed(wire8) ?
                          wire6 : $signed(wire8))) ?
                      reg9[(4'h8):(3'h4)] : (8'hbe)));
              reg13 <= ((reg10 ?
                  $unsigned(((+wire7) ?
                      ((8'hb8) - wire0) : (wire7 ?
                          (7'h44) : wire2))) : $signed(($unsigned((8'ha3)) ?
                      wire8 : (8'hb1)))) ^~ reg10[(4'he):(3'h4)]);
              reg14 <= $signed((+$unsigned(((reg13 ^~ (8'ha1)) ?
                  (~^wire3) : $signed(reg12)))));
            end
          else
            begin
              reg10 <= wire6[(4'hc):(2'h2)];
              reg11 <= wire3;
              reg12 <= (^$signed({(^(wire3 ? wire1 : reg14)),
                  wire0[(3'h7):(3'h4)]}));
              reg13 <= ($unsigned((wire2 ?
                      reg9 : ((wire6 ? wire5 : reg14) ?
                          {reg13} : (wire2 ? wire6 : wire3)))) ?
                  (reg9[(3'h6):(3'h4)] ?
                      $unsigned(($unsigned(wire1) ?
                          (wire3 ? wire5 : wire4) : $signed(reg13))) : ((wire8 ?
                          (wire7 ^~ wire1) : $unsigned((7'h42))) * {(-wire5)})) : $signed((^(^~wire2))));
              reg14 <= $signed(reg13);
            end
          reg15 <= {reg13[(4'ha):(2'h2)],
              {$unsigned(($signed(wire5) ? $unsigned(wire4) : wire0)),
                  $unsigned($unsigned({reg9, wire3}))}};
          reg16 <= $unsigned({(((~wire2) ? (8'hba) : {wire8}) ?
                  ($signed(reg11) <= $unsigned(wire0)) : $unsigned(reg13[(4'hb):(3'h7)]))});
          reg17 <= reg15[(2'h2):(1'h0)];
          reg18 <= reg9[(4'h9):(3'h6)];
        end
      else
        begin
          if (((($unsigned($unsigned(wire4)) ?
                      ($unsigned(wire8) ?
                          {wire7,
                              (8'ha1)} : (wire8 & reg15)) : {wire2[(3'h4):(1'h0)],
                          ((8'h9f) ? (8'hac) : wire3)}) ?
                  $signed({((7'h44) <= wire2),
                      ((8'hb5) ? reg16 : wire0)}) : reg15) ?
              $unsigned($unsigned((wire1[(2'h3):(2'h2)] ?
                  $unsigned((8'haa)) : $signed((8'ha1))))) : reg9[(4'h8):(2'h3)]))
            begin
              reg10 <= {$signed($signed((wire6 ^~ {(8'ha6)})))};
              reg11 <= $signed($unsigned({((reg10 ? reg14 : wire1) - wire8)}));
              reg12 <= reg9[(3'h6):(3'h4)];
              reg13 <= (&$unsigned(((8'ha6) ?
                  $signed({reg11, reg18}) : ((reg17 >> reg17) ~^ {wire8,
                      wire1}))));
              reg14 <= reg10;
            end
          else
            begin
              reg10 <= wire7;
              reg11 <= $signed($signed(reg11));
              reg12 <= (wire7 ? (&wire1[(3'h7):(1'h1)]) : reg17);
              reg13 <= (~^((wire7[(4'he):(4'he)] ?
                  ($signed(wire5) != reg18) : $unsigned((&(8'hb2)))) <<< (($unsigned((8'ha6)) ?
                      $unsigned(reg11) : {wire2, wire2}) ?
                  (((8'haa) ? wire0 : reg12) < $signed(reg15)) : (~(wire7 ?
                      wire4 : reg12)))));
            end
          reg15 <= ((|{$unsigned((&reg15))}) ?
              $signed(wire2[(3'h4):(1'h1)]) : $signed(($unsigned(reg12[(4'h8):(3'h6)]) ?
                  wire7 : reg11)));
          reg16 <= reg17[(3'h5):(1'h1)];
          if ($signed((&$unsigned(({reg15, reg14} ?
              (wire0 >>> wire3) : wire6)))))
            begin
              reg17 <= reg13[(1'h0):(1'h0)];
            end
          else
            begin
              reg17 <= reg14;
              reg18 <= $unsigned({$unsigned(((wire8 ? reg14 : reg10) ?
                      $unsigned((8'hb2)) : reg14[(2'h3):(2'h3)]))});
              reg19 <= reg14[(3'h6):(2'h3)];
            end
        end
      if (wire1[(4'ha):(3'h5)])
        begin
          reg20 <= reg16;
          reg21 <= {(($signed((wire2 ?
                      wire8 : wire7)) > $unsigned(wire1[(3'h4):(2'h3)])) ?
                  wire1 : reg13),
              {(reg17[(2'h3):(2'h2)] && reg14), $unsigned(reg10)}};
          reg22 <= $signed((!$signed({(^~wire2)})));
        end
      else
        begin
          reg20 <= reg9;
        end
      reg23 <= wire2[(1'h0):(1'h0)];
      reg24 <= $signed(wire2);
    end
  assign wire25 = $unsigned($signed(wire4));
  assign wire26 = {((&(~^(~^(8'hb8)))) | (reg9[(1'h0):(1'h0)] > $signed(reg21)))};
  module27 #() modinst123 (wire122, clk, wire1, wire6, reg10, reg23);
  assign wire124 = (8'hbf);
  assign wire125 = ($unsigned(reg20[(3'h4):(2'h2)]) ?
                       reg12[(4'h9):(3'h6)] : ((reg22[(3'h4):(1'h1)] != wire122) ?
                           $signed((8'hb4)) : (({wire5} ?
                                   $unsigned(reg16) : wire122) ?
                               (&wire122[(3'h4):(3'h4)]) : (^~(reg18 >>> wire8)))));
  module126 #() modinst193 (.y(wire192), .wire129(reg24), .wire128(reg10), .clk(clk), .wire131(wire5), .wire127(reg14), .wire130(reg9));
  always
    @(posedge clk) begin
      reg194 <= (|$signed((~|(((8'hb8) ? wire3 : reg24) ?
          $signed(reg15) : (!(8'ha2))))));
      reg195 <= $signed($signed(($unsigned(reg24) & {wire2[(2'h3):(1'h1)]})));
      reg196 <= (|$signed(reg14[(2'h3):(1'h0)]));
      reg197 <= (+(~^wire5[(1'h1):(1'h1)]));
      if ((reg21 ?
          $signed(wire6) : ($unsigned(reg18[(2'h3):(2'h3)]) + reg19[(1'h0):(1'h0)])))
        begin
          reg198 <= reg9;
          reg199 <= reg194;
        end
      else
        begin
          reg198 <= wire192;
        end
    end
  assign wire200 = reg21[(1'h1):(1'h0)];
  assign wire201 = (|reg17[(4'h8):(3'h4)]);
  assign wire202 = ({(8'hba)} ?
                       (!$signed(({reg17, reg20} ?
                           $unsigned(reg15) : reg198))) : (~^(&((~reg16) ?
                           $unsigned(wire5) : $unsigned(wire5)))));
  assign wire203 = $unsigned(reg21);
  assign wire204 = reg12;
  assign wire205 = {wire7[(5'h10):(4'hd)]};
  assign wire206 = ((+(~(~{reg17, wire25}))) ?
                       reg194[(4'hd):(4'h8)] : ((&($signed(wire5) ?
                               $unsigned(reg197) : wire3)) ?
                           {$signed($signed((8'ha3))),
                               $signed($unsigned(reg12))} : {($signed(reg18) * (^(8'ha3))),
                               $signed($signed(wire125))}));
endmodule

module module126
#(parameter param190 = {(~&((|(-(8'ha7))) ? {((8'ha8) ? (7'h44) : (7'h40))} : (((8'hbb) ? (8'ha4) : (7'h41)) ^ ((7'h44) ? (8'hb1) : (7'h44)))))}, 
parameter param191 = ({((param190 <<< {param190, param190}) ~^ ((param190 ^ param190) > {param190, param190}))} ^ (~&{param190})))
(y, clk, wire127, wire128, wire129, wire130, wire131);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire128;
  input wire [(5'h10):(1'h0)] wire129;
  input wire signed [(4'h9):(1'h0)] wire130;
  input wire signed [(3'h4):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire189;
  wire signed [(2'h3):(1'h0)] wire188;
  wire signed [(4'hf):(1'h0)] wire187;
  wire signed [(3'h4):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire185;
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire132,
                 wire140,
                 wire185,
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
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire132 = $unsigned(($unsigned($signed(wire128[(5'h13):(3'h5)])) ?
                       wire128[(1'h1):(1'h0)] : wire127[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg133 <= ({wire129} ?
          (&$signed((wire132[(2'h2):(2'h2)] <<< $unsigned(wire131)))) : ({wire129} * ($unsigned({wire132}) ?
              (&(-wire130)) : wire129[(2'h3):(1'h1)])));
      reg134 <= {wire128};
      if (wire132)
        begin
          reg135 <= $signed((+(~&$signed($signed((8'hb3))))));
        end
      else
        begin
          if (reg134)
            begin
              reg135 <= reg133;
              reg136 <= wire129[(4'he):(3'h4)];
            end
          else
            begin
              reg135 <= ((~^({(-wire130)} ?
                  $signed((wire131 << wire129)) : ((wire128 ? reg133 : reg136) ?
                      wire132 : (reg134 ?
                          wire127 : wire132)))) && ((|(wire130[(3'h7):(3'h6)] ?
                      reg136 : (^reg133))) ?
                  reg133 : wire130));
              reg136 <= (-$unsigned($unsigned((!$signed(reg135)))));
            end
          if ((!wire132[(2'h3):(2'h2)]))
            begin
              reg137 <= (|wire131[(3'h4):(1'h0)]);
              reg138 <= $signed($signed(wire132[(1'h0):(1'h0)]));
            end
          else
            begin
              reg137 <= ({(reg133[(3'h6):(1'h1)] ?
                      ((7'h44) ?
                          $unsigned(reg136) : (wire130 ?
                              reg133 : reg138)) : $unsigned($unsigned(wire127))),
                  wire132} > reg135[(4'hf):(1'h1)]);
              reg138 <= {reg135[(3'h6):(3'h5)]};
              reg139 <= {(($unsigned((reg135 ? wire129 : wire132)) >>> reg138) ?
                      $signed((!(~^reg138))) : ($unsigned({(8'ha2)}) >= ((^~reg138) ?
                          $signed(wire129) : ((8'ha5) ? reg135 : (8'hb5))))),
                  (~|reg134)};
            end
        end
    end
  assign wire140 = reg133[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg141 <= $unsigned(wire132);
      reg142 <= reg136;
      if ((&reg133[(1'h0):(1'h0)]))
        begin
          if ($signed((-$unsigned($signed((reg141 + wire132))))))
            begin
              reg143 <= reg135[(3'h4):(1'h1)];
              reg144 <= (reg138 << wire128[(3'h7):(2'h3)]);
            end
          else
            begin
              reg143 <= (({$signed($unsigned(reg137)),
                      (((8'ha6) && wire127) <= reg134)} >> ((reg134[(2'h3):(1'h0)] ?
                      $signed((8'h9c)) : $signed((8'hb1))) >= reg137[(4'hc):(4'h8)])) ?
                  $unsigned({{reg137}}) : (reg136[(5'h13):(4'ha)] > $signed($signed($unsigned((7'h41))))));
              reg144 <= $signed(reg142[(2'h2):(2'h2)]);
              reg145 <= $unsigned(reg138[(2'h2):(2'h2)]);
              reg146 <= $unsigned(reg142);
              reg147 <= $signed($signed(reg138[(2'h2):(1'h0)]));
            end
          reg148 <= (^$unsigned($unsigned(wire132[(2'h2):(1'h1)])));
          reg149 <= ((reg144 == wire130[(3'h4):(2'h2)]) ?
              {(((reg137 ? (8'hac) : wire130) ?
                      $signed(reg134) : $unsigned(wire127)) < $signed((reg144 + reg136))),
                  $unsigned({(reg145 ?
                          reg139 : (8'ha0))})} : ($unsigned($signed((~|reg143))) ?
                  $unsigned($unsigned($signed(wire140))) : reg133[(3'h7):(3'h4)]));
          if ((7'h42))
            begin
              reg150 <= reg145[(1'h1):(1'h1)];
              reg151 <= (8'hb8);
              reg152 <= reg138;
              reg153 <= $unsigned({(((^reg151) >> wire129) ^~ ((wire130 ?
                          reg147 : reg151) ?
                      reg134[(3'h4):(1'h1)] : (reg133 ? reg145 : reg133)))});
              reg154 <= reg148[(3'h7):(2'h2)];
            end
          else
            begin
              reg150 <= reg139;
              reg151 <= ((reg154[(2'h3):(2'h3)] ?
                  (reg135[(1'h0):(1'h0)] ?
                      $unsigned((7'h44)) : wire130) : (~(~^reg144[(1'h0):(1'h0)]))) > reg137[(3'h6):(3'h6)]);
              reg152 <= $signed($signed($unsigned($unsigned($signed(reg133)))));
              reg153 <= (~^(|{(~((8'hbc) ? reg148 : reg153))}));
            end
        end
      else
        begin
          if ((($signed($signed(reg147)) ?
                  ((^~(wire128 ?
                      reg153 : reg141)) ^~ $signed((|wire131))) : ((8'hbf) ?
                      (~$signed(reg133)) : (^(8'hbf)))) ?
              (reg144[(2'h2):(2'h2)] + reg133) : ((~|{$signed(wire128)}) < (reg135 << {reg152}))))
            begin
              reg143 <= $unsigned(((-reg143[(3'h5):(2'h3)]) ~^ (~^$signed($signed(wire127)))));
              reg144 <= {wire131[(2'h3):(1'h0)],
                  {({{reg136, reg135},
                          $signed(reg149)} ~^ (~reg135[(4'hd):(3'h4)])),
                      ($signed($unsigned(reg137)) ?
                          $unsigned($signed(reg141)) : ((^~reg146) ^~ (^reg138)))}};
              reg145 <= wire128[(4'he):(4'hb)];
              reg146 <= (reg137 + wire127);
            end
          else
            begin
              reg143 <= ((^reg138) ?
                  reg143 : $unsigned(((~|((8'haa) >>> wire140)) ^ $unsigned((^~reg153)))));
              reg144 <= reg153[(4'hc):(3'h7)];
            end
          if (((~^((~&(|(8'hb7))) ?
                  ((reg134 ~^ wire132) < (wire130 ?
                      reg136 : reg135)) : $unsigned($signed((8'hb5))))) ?
              (wire129 ?
                  $signed((~^(reg151 + reg142))) : ($unsigned(((8'hac) ?
                      reg134 : reg146)) < $unsigned({reg134,
                      reg137}))) : (reg136[(5'h11):(4'h9)] ?
                  $signed(reg141[(3'h5):(1'h1)]) : reg146[(5'h10):(4'he)])))
            begin
              reg147 <= {$signed(reg139)};
              reg148 <= $signed(((reg139[(2'h3):(1'h0)] ?
                  {(reg151 << wire127)} : wire140[(2'h3):(1'h1)]) | (&$signed($signed(reg150)))));
              reg149 <= {reg137[(2'h3):(1'h0)],
                  $unsigned(reg139[(4'h8):(4'h8)])};
              reg150 <= (reg150[(4'he):(1'h0)] ?
                  reg141 : $unsigned(((reg153 || $unsigned(reg142)) ?
                      (-$unsigned(wire129)) : ((|(8'hb7)) != ((8'hb0) > reg150)))));
              reg151 <= reg143;
            end
          else
            begin
              reg147 <= (!$signed(wire127[(1'h1):(1'h0)]));
            end
        end
      reg155 <= $unsigned($signed($unsigned($unsigned($signed(reg142)))));
    end
  module156 #() modinst186 (.wire161(reg144), .wire159(reg147), .y(wire185), .wire160(wire129), .wire158(reg149), .wire157(reg150), .clk(clk));
  assign wire187 = $unsigned(wire185[(5'h10):(4'he)]);
  assign wire188 = $signed((!(reg139[(3'h5):(2'h3)] ?
                       (wire130 & {wire185, reg139}) : reg152)));
  assign wire189 = ($signed(($unsigned(wire187) ?
                           (reg133 ?
                               (!wire188) : {reg154,
                                   reg147}) : reg136[(4'h9):(2'h2)])) ?
                       $unsigned($signed($unsigned(wire187[(4'hf):(1'h1)]))) : reg155);
endmodule

module module27
#(parameter param120 = (((+(|(~(8'haa)))) ? ({((7'h40) ? (7'h40) : (8'hae))} & (~(|(8'hab)))) : ((((8'hac) != (8'h9d)) >= {(8'hb3)}) ? ((-(8'hb6)) ? ((8'ha4) + (8'ha9)) : ((8'hb2) ? (8'ha9) : (8'hb7))) : {(|(8'haa)), ((8'h9f) ? (7'h40) : (8'hb9))})) ~^ {{(((8'hab) == (8'hb3)) ? (7'h43) : (~(8'hbb)))}, (-(8'ha7))}), 
parameter param121 = {((+param120) ^~ (param120 ? (((8'ha8) ? param120 : param120) ^~ param120) : (param120 & (param120 >> param120)))), ((param120 | ((~&param120) | (-param120))) ? {(param120 ? {param120} : (8'hae)), ((^~param120) <<< (+param120))} : (~|((param120 > param120) <<< ((8'hbf) ? param120 : param120))))})
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire31;
  input wire [(2'h2):(1'h0)] wire30;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire116,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 wire59,
                 wire56,
                 wire55,
                 wire54,
                 wire43,
                 wire42,
                 wire41,
                 wire34,
                 wire33,
                 wire32,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg57,
                 reg58,
                 (1'h0)};
  assign wire32 = $unsigned((~(^wire30[(1'h0):(1'h0)])));
  assign wire33 = {wire31[(3'h7):(1'h0)], $signed(wire28)};
  assign wire34 = wire30[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ({(+$unsigned(wire28))})
        begin
          reg35 <= ({{wire31, $signed({wire34})},
              $signed(wire30)} & {wire32[(4'h8):(3'h4)],
              (wire33[(5'h10):(2'h3)] ?
                  $unsigned($unsigned(wire28)) : (!{wire28}))});
          reg36 <= $unsigned((~&($unsigned(wire30) + $signed((!(8'haa))))));
          reg37 <= (^wire30);
          if (wire28[(3'h5):(1'h1)])
            begin
              reg38 <= (~|wire30[(2'h2):(1'h0)]);
              reg39 <= wire28;
            end
          else
            begin
              reg38 <= $unsigned((~&$signed(wire32)));
              reg39 <= ($unsigned(((-(wire33 ? (8'hb4) : wire33)) ?
                      ((reg38 >= reg35) ?
                          (wire29 & (8'ha6)) : wire29) : $unsigned($signed((8'had))))) ?
                  ((8'ha7) ?
                      {(~&$unsigned((8'hbb)))} : (wire33[(5'h10):(4'hc)] < ((reg38 >> (8'hb3)) < (wire30 ?
                          (8'had) : wire30)))) : {wire33[(3'h7):(3'h7)],
                      {$signed($signed(reg39))}});
              reg40 <= $signed(((~|$unsigned($signed(wire29))) ?
                  wire28 : wire31));
            end
        end
      else
        begin
          reg35 <= $signed((^~{wire29}));
          reg36 <= $signed(((~|(wire31[(4'hc):(1'h1)] ?
                  $signed((8'hb5)) : $signed(wire33))) ?
              wire31 : reg39));
        end
    end
  assign wire41 = ((&reg40[(2'h2):(1'h1)]) ?
                      {reg35, (^$unsigned($signed(wire34)))} : (~&((~(reg40 ?
                          reg38 : wire29)) >>> wire33)));
  assign wire42 = (($signed(({wire41, wire41} ?
                          (8'h9e) : (wire32 > reg36))) ^ ((^~reg37[(4'ha):(4'ha)]) ?
                          (^~$unsigned((8'ha2))) : (reg36 <= {wire28}))) ?
                      $unsigned($unsigned((+wire30))) : wire32[(4'hb):(4'h8)]);
  assign wire43 = $signed({wire42[(3'h7):(2'h3)]});
  always
    @(posedge clk) begin
      reg44 <= reg37;
      reg45 <= reg40[(2'h2):(2'h2)];
      reg46 <= (~($signed((reg37 ?
          (wire42 ?
              reg44 : reg44) : (wire29 < wire34))) <= $unsigned(reg44[(3'h6):(3'h6)])));
      reg47 <= ($unsigned(reg46) ?
          $signed(((wire30[(1'h1):(1'h1)] > $unsigned((8'hab))) ?
              (^~wire34) : ($unsigned(wire42) == (|reg45)))) : {(($signed(wire30) * (~^reg36)) ?
                  {$unsigned(reg46)} : (reg40 >= $unsigned((8'ha2)))),
              (reg38 ?
                  wire32[(1'h0):(1'h0)] : {$signed(reg36),
                      reg36[(3'h7):(3'h7)]})});
      if (reg40)
        begin
          if ($unsigned(wire41[(2'h3):(2'h3)]))
            begin
              reg48 <= $signed(($signed(($signed(wire30) << wire28[(3'h4):(3'h4)])) ?
                  reg44 : (wire28[(2'h2):(1'h0)] | {wire34[(5'h10):(5'h10)]})));
              reg49 <= ($signed((|reg35)) ?
                  reg38 : $signed((wire32[(4'hb):(2'h3)] ?
                      (8'ha0) : $unsigned(reg44[(3'h6):(1'h0)]))));
              reg50 <= $unsigned((~$unsigned($signed(reg39))));
              reg51 <= (reg35[(4'h8):(4'h8)] ?
                  wire43[(1'h1):(1'h0)] : {($signed($signed(reg37)) ?
                          (wire31 - (wire43 ?
                              wire32 : reg44)) : $unsigned(reg35))});
              reg52 <= $unsigned($unsigned(wire29));
            end
          else
            begin
              reg48 <= $unsigned($unsigned((&((|reg35) ?
                  reg48[(5'h11):(4'ha)] : (wire30 ? reg48 : wire30)))));
              reg49 <= (~&wire41);
            end
          reg53 <= wire29;
        end
      else
        begin
          reg48 <= $signed(reg49[(4'hb):(4'ha)]);
          reg49 <= (8'ha0);
          reg50 <= ($signed((~^reg47[(4'h8):(3'h7)])) <<< ($signed($unsigned({reg47,
              wire42})) && (wire33[(4'hf):(4'hd)] ?
              ($signed(reg53) == $unsigned(wire33)) : (!$signed(reg47)))));
          reg51 <= $signed((&wire32));
        end
    end
  assign wire54 = (~(((reg38 ? (reg52 > reg36) : (reg49 ? (8'hb5) : reg35)) ?
                          wire33 : $unsigned((8'hbf))) ?
                      wire29 : ((~&wire42[(2'h2):(2'h2)]) || reg47[(3'h6):(2'h3)])));
  assign wire55 = (((+(reg37 ? (^~reg40) : ((8'ha0) > wire30))) ?
                          wire43 : $unsigned(((-reg46) + reg35))) ?
                      $unsigned({$signed(wire31)}) : $unsigned($unsigned($unsigned((reg49 ?
                          reg53 : wire34)))));
  assign wire56 = (reg36[(2'h2):(1'h1)] ~^ $unsigned($unsigned(($unsigned(wire43) && $unsigned(reg45)))));
  always
    @(posedge clk) begin
      reg57 <= $unsigned(reg35);
      reg58 <= (-wire56[(1'h0):(1'h0)]);
    end
  assign wire59 = reg47[(3'h6):(3'h6)];
  module60 #() modinst101 (wire100, clk, reg39, reg37, reg57, reg48);
  assign wire102 = (wire32 ?
                       $unsigned(wire54[(1'h1):(1'h1)]) : $signed(reg50[(1'h0):(1'h0)]));
  assign wire103 = $unsigned($unsigned($signed((~|(reg40 ? reg46 : wire33)))));
  assign wire104 = ((-$unsigned($signed($unsigned(wire54)))) >> (8'ha0));
  assign wire105 = $unsigned(wire43);
  module106 #() modinst117 (.clk(clk), .y(wire116), .wire110(wire43), .wire109(wire32), .wire111(reg45), .wire108(reg35), .wire107(reg53));
  assign wire118 = wire30[(2'h2):(1'h0)];
  assign wire119 = wire43[(4'h9):(3'h7)];
endmodule

module module106  (y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire111;
  input wire signed [(2'h2):(1'h0)] wire110;
  input wire [(4'hc):(1'h0)] wire109;
  input wire [(5'h15):(1'h0)] wire108;
  input wire [(4'hf):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  assign y = {wire115, wire114, wire113, wire112, (1'h0)};
  assign wire112 = ($signed((wire110 != (8'hbe))) ?
                       $signed($unsigned({wire111,
                           $signed(wire107)})) : $signed($unsigned((8'hba))));
  assign wire113 = wire110[(2'h2):(1'h1)];
  assign wire114 = $signed($unsigned({(-(wire113 ? wire107 : wire108))}));
  assign wire115 = $signed((~|{(-(|wire110))}));
endmodule

module module60
#(parameter param98 = ((~{(-((8'haf) ? (8'h9e) : (8'hb6))), ({(8'h9d), (7'h40)} ? ((8'hb4) ? (8'hbe) : (8'hbb)) : ((8'ha0) ? (7'h41) : (8'h9c)))}) ? (((!((8'hae) ^~ (8'ha6))) + (((8'hb0) ? (8'h9d) : (8'hb2)) ? {(8'hbb), (8'ha1)} : ((8'ha4) ? (8'hb8) : (8'hbe)))) ? ({{(8'hbe)}, {(8'ha1), (8'hbf)}} * ((8'ha9) ? ((8'hbc) <= (8'ha0)) : {(8'hb7), (8'hbd)})) : (-({(8'hbd), (8'ha2)} ? {(8'ha5), (8'hac)} : ((8'had) ^ (7'h43))))) : (^((((8'ha2) ~^ (8'hb5)) ? {(8'hb1)} : ((8'ha2) | (8'hae))) ? (((8'hae) ? (8'hb6) : (8'ha6)) - {(8'hb5)}) : (7'h44)))), 
parameter param99 = (8'hab))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire64;
  input wire [(5'h14):(1'h0)] wire63;
  input wire [(3'h4):(1'h0)] wire62;
  input wire [(4'ha):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire65;
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
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
                 reg78,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire65 = ($signed((wire63[(3'h6):(2'h2)] < ($signed((8'ha2)) ^~ wire63[(4'hb):(4'h8)]))) * ({wire63} ~^ {(wire63[(5'h14):(2'h3)] ?
                          {wire61} : {wire62, wire62})}));
  assign wire66 = $signed(((wire63[(5'h10):(4'hf)] >> $unsigned((^~wire62))) && ($unsigned(wire63[(4'he):(4'h9)]) >> {$unsigned(wire62),
                      wire64[(1'h1):(1'h1)]})));
  assign wire67 = $signed(wire62);
  assign wire68 = {((~|$signed((^~wire67))) ?
                          $unsigned((~|(|wire62))) : ((wire61 ?
                                  (-wire64) : (!wire64)) ?
                              ((wire62 ^ wire66) ?
                                  ((8'hb6) ?
                                      (8'hb0) : wire67) : $unsigned(wire66)) : ((~|wire66) || wire67[(3'h5):(3'h4)])))};
  always
    @(posedge clk) begin
      if ($signed($unsigned((8'hb0))))
        begin
          reg69 <= $signed((~&($unsigned($signed(wire68)) ^ wire68[(2'h2):(1'h1)])));
          reg70 <= $signed((|(((~&wire64) ? (reg69 & wire65) : (~^wire63)) ?
              (!((8'hb1) ? (8'ha8) : wire62)) : (!$unsigned(wire63)))));
          reg71 <= $unsigned(wire67[(3'h6):(1'h1)]);
          reg72 <= (+reg71[(3'h5):(3'h5)]);
        end
      else
        begin
          reg69 <= reg71[(3'h4):(2'h2)];
          if ((~{$unsigned(wire61),
              (((wire64 ? reg69 : wire68) ? wire68[(3'h4):(2'h2)] : {wire64}) ?
                  ($unsigned((8'hae)) >>> (reg72 << (8'haf))) : wire66)}))
            begin
              reg70 <= ($signed((reg70 - (wire63 ?
                  {reg69} : (|wire63)))) || $signed(wire63));
            end
          else
            begin
              reg70 <= wire67[(1'h0):(1'h0)];
              reg71 <= reg71;
              reg72 <= {(wire61[(1'h0):(1'h0)] <<< ($signed(reg71) ?
                      ($signed((8'ha0)) ?
                          (~&(8'ha2)) : (8'ha2)) : wire64[(3'h4):(3'h4)]))};
            end
          reg73 <= $signed(wire64[(1'h1):(1'h0)]);
          reg74 <= $signed(((8'hbb) * (^(8'ha2))));
          reg75 <= $signed((~(8'hb0)));
        end
    end
  assign wire76 = (^~{$unsigned(($unsigned(reg75) ?
                          (wire62 ? wire62 : reg72) : (reg74 ?
                              (8'ha5) : wire61))),
                      ({((8'ha7) & (7'h44)),
                          {reg73, reg72}} ^ $signed(wire68))});
  assign wire77 = wire76[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg78 <= reg73[(1'h0):(1'h0)];
      reg79 <= reg75[(3'h4):(1'h1)];
      if (((!({(wire68 ? reg75 : reg71)} ?
          reg79[(3'h5):(2'h3)] : (+((8'ha6) || reg71)))) >> wire63))
        begin
          reg80 <= ((&(((wire77 || reg78) >> reg70) >>> ((reg69 ~^ (8'ha5)) >> (reg78 < (8'hb5))))) + $signed((-(reg78 + (reg69 ?
              reg73 : reg74)))));
          reg81 <= wire61;
          if ((reg75 <= ({(wire64 ~^ reg73[(4'h9):(2'h3)])} ?
              {(reg73 ^ (wire76 ? wire65 : wire62)),
                  $unsigned(((8'h9f) ?
                      wire66 : (8'ha6)))} : $signed(((reg78 > reg78) ?
                  (~^(8'hb4)) : (~^(7'h40)))))))
            begin
              reg82 <= reg69[(2'h3):(2'h3)];
              reg83 <= (&(reg80[(3'h7):(1'h1)] >>> ({$unsigned(wire65), reg71} ?
                  (8'hb9) : reg79)));
              reg84 <= wire61;
              reg85 <= $signed(($unsigned({(reg80 ? (8'hb4) : wire66), reg78}) ?
                  {wire64} : ((~^(!wire66)) ?
                      $unsigned(reg84[(2'h2):(1'h0)]) : (((7'h42) ?
                          wire63 : reg69) >= (wire62 - (8'h9c))))));
              reg86 <= {(^~{$signed(wire68), reg75[(3'h4):(1'h1)]}),
                  (~$signed((wire67[(1'h0):(1'h0)] ^ $signed(reg80))))};
            end
          else
            begin
              reg82 <= $unsigned(wire65);
              reg83 <= (~^((reg72 ?
                  {{reg86, reg74},
                      $signed(wire67)} : reg81) >>> {$signed((wire68 << (8'hb8)))}));
              reg84 <= $signed(reg83[(3'h5):(1'h0)]);
              reg85 <= {wire65, $signed(reg69)};
              reg86 <= wire61[(4'h9):(3'h6)];
            end
          if ($signed(wire65[(1'h0):(1'h0)]))
            begin
              reg87 <= $unsigned(((|{(|reg85), reg71[(1'h0):(1'h0)]}) ?
                  $signed({(reg75 ? reg86 : wire65),
                      (reg73 ? reg78 : wire68)}) : reg71[(1'h1):(1'h1)]));
            end
          else
            begin
              reg87 <= ($signed((^{(|wire63)})) ?
                  {(($signed((8'hb8)) + reg84[(3'h4):(1'h0)]) || reg86),
                      {(-$signed(reg84)),
                          reg78[(2'h2):(2'h2)]}} : ($unsigned((((8'ha7) - reg87) << $signed(reg74))) ?
                      {$unsigned((+reg82))} : reg78));
              reg88 <= (($signed((-(wire62 >= (8'ha0)))) >> reg72) | reg81);
              reg89 <= reg88[(4'hd):(3'h7)];
              reg90 <= reg83[(1'h1):(1'h0)];
              reg91 <= (~^$signed((($signed(wire67) ?
                      (!reg84) : $unsigned(reg83)) ?
                  ((-reg86) ? (-reg81) : $signed(reg79)) : ($signed(wire64) ?
                      $signed(reg86) : $unsigned(reg72)))));
            end
          if ($unsigned((^~$unsigned((&$unsigned(wire68))))))
            begin
              reg92 <= $signed($unsigned($signed(((reg74 + reg82) ?
                  $signed(reg81) : wire63[(2'h3):(1'h0)]))));
              reg93 <= ((wire68[(2'h3):(1'h1)] - (|$signed((&reg86)))) == (+(($unsigned(wire65) >= (reg72 ~^ wire68)) ^~ (-reg75))));
              reg94 <= {reg69};
              reg95 <= ((|{(wire67 <<< (reg90 ?
                      reg74 : (8'ha3)))}) <= (wire61[(4'h9):(2'h2)] ?
                  {$signed((wire61 ? wire64 : wire61)),
                      $unsigned(reg75)} : $unsigned(wire65[(3'h4):(2'h3)])));
              reg96 <= $unsigned(wire62[(2'h3):(1'h0)]);
            end
          else
            begin
              reg92 <= reg89;
            end
        end
      else
        begin
          if ($unsigned($unsigned((~|reg84))))
            begin
              reg80 <= $unsigned(((reg95[(2'h2):(1'h0)] >= reg72[(3'h5):(1'h0)]) ^ $signed(wire66)));
              reg81 <= reg94;
              reg82 <= reg95[(1'h0):(1'h0)];
            end
          else
            begin
              reg80 <= $unsigned((reg87[(4'ha):(3'h5)] ?
                  reg95[(1'h0):(1'h0)] : reg72[(2'h2):(1'h1)]));
            end
          reg83 <= {$signed(reg71),
              (wire66[(3'h4):(1'h0)] ?
                  $signed($signed($unsigned(reg90))) : (~|reg83))};
          reg84 <= (reg93 > (-$unsigned($signed(((8'ha3) ? reg90 : reg70)))));
          reg85 <= reg91;
        end
      reg97 <= $signed((~&((~&$signed(reg72)) << reg86[(4'ha):(3'h7)])));
    end
endmodule

module module156
#(parameter param183 = ((((~^((8'hb4) - (8'hb9))) ? (|(~(7'h40))) : {(+(8'h9d)), ((8'hbf) ? (8'hbf) : (8'hbb))}) && ({((8'hab) ? (8'hbe) : (8'hb6))} ? (^~{(8'hb7), (8'hbf)}) : ({(8'ha0)} * ((8'ha3) ? (7'h42) : (8'ha2))))) && {(((|(7'h43)) ? {(8'hb8)} : (~(8'ha1))) ? (((8'hb3) ? (8'ha3) : (7'h42)) ? (~&(8'hb9)) : (+(8'ha4))) : (((8'ha5) ? (8'h9f) : (8'h9e)) >> (~^(8'hbc))))}), 
parameter param184 = (!param183))
(y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire161;
  input wire [(4'hf):(1'h0)] wire160;
  input wire [(4'hd):(1'h0)] wire159;
  input wire signed [(3'h7):(1'h0)] wire158;
  input wire signed [(3'h6):(1'h0)] wire157;
  wire signed [(3'h5):(1'h0)] wire182;
  wire [(4'h8):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire [(3'h7):(1'h0)] wire179;
  wire [(3'h7):(1'h0)] wire178;
  wire [(5'h15):(1'h0)] wire177;
  wire [(4'h8):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(2'h3):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire162;
  reg [(4'h9):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg172 = (1'h0);
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire162 = wire157[(1'h0):(1'h0)];
  assign wire163 = wire159;
  assign wire164 = ((wire159 ?
                           (+($unsigned(wire160) ?
                               wire157[(1'h1):(1'h0)] : wire159)) : ($unsigned((wire163 ?
                                   wire163 : wire161)) ?
                               $unsigned((~&(8'hb5))) : $signed(((8'ha7) ?
                                   wire158 : wire160)))) ?
                       (wire157[(2'h3):(1'h0)] ?
                           wire163 : wire161[(3'h5):(3'h4)]) : $signed((^~wire158)));
  assign wire165 = wire159[(4'hb):(3'h7)];
  assign wire166 = $signed((|$signed({{wire160}, (wire162 <= wire160)})));
  assign wire167 = (8'hbb);
  assign wire168 = wire159[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg169 <= $unsigned($unsigned($signed(((8'haf) >= (~&wire162)))));
      if ((~^{wire160, wire164[(4'ha):(2'h2)]}))
        begin
          reg170 <= reg169;
          reg171 <= wire158[(2'h2):(2'h2)];
        end
      else
        begin
          reg170 <= $unsigned(wire164);
          reg171 <= ((reg170[(1'h1):(1'h1)] * $signed((8'h9d))) != wire160);
          reg172 <= {reg171, wire161[(3'h5):(2'h2)]};
          reg173 <= reg169[(3'h4):(2'h2)];
        end
      reg174 <= ($signed(reg170) ? wire161 : wire164[(4'ha):(4'ha)]);
      reg175 <= ((^(^(reg173[(2'h2):(1'h1)] ?
              reg173[(4'hd):(3'h7)] : $unsigned(reg171)))) ?
          (($signed($unsigned(wire165)) ?
              (~&$unsigned(wire163)) : (8'had)) ^ {$unsigned(wire162)}) : wire164);
      reg176 <= (wire165 ?
          {(wire161 ?
                  (~&$unsigned(reg175)) : $unsigned((wire159 ?
                      wire166 : reg173))),
              {((-(8'ha7)) ? reg175 : wire165)}} : reg170);
    end
  assign wire177 = (($signed(reg171) ?
                       {(~(wire158 ?
                               wire166 : wire165))} : $unsigned(wire166)) && {reg171,
                       $signed(((wire161 - wire163) ?
                           (reg175 > wire168) : (^~wire157)))});
  assign wire178 = $unsigned((~^(-(^(wire167 | (8'h9c))))));
  assign wire179 = ((&(&(8'hb8))) + $unsigned(wire178[(2'h2):(1'h1)]));
  assign wire180 = $unsigned(({wire157[(3'h4):(2'h2)]} ?
                       (^~$signed($signed((8'hb5)))) : (wire164 ?
                           {$signed(wire177)} : $signed(wire157))));
  assign wire181 = (^$signed(wire164[(4'hb):(3'h5)]));
  assign wire182 = $unsigned(reg174);
endmodule

module top
#(parameter param150 = ((8'hab) ? ((+(|((8'hac) ? (8'hb2) : (8'hb9)))) <<< ({{(8'hb9), (8'ha4)}, ((8'hbc) >> (7'h44))} - (((8'hbc) ? (8'ha5) : (8'hb7)) & (~&(8'ha5))))) : ((((8'hbd) ^~ (8'ha8)) - ({(8'ha7)} <<< ((8'had) + (7'h44)))) ? (&(+((8'ha6) ? (8'hb5) : (7'h41)))) : {(-((8'h9c) ? (8'hbf) : (8'hae)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire149;
  wire [(3'h4):(1'h0)] wire148;
  wire signed [(4'hb):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire140;
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire97,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire140,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
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
  assign wire5 = $unsigned((wire4[(2'h3):(2'h2)] || (wire3[(4'h8):(3'h4)] ?
                     wire1 : (wire4[(2'h3):(2'h3)] ?
                         (wire0 ? wire2 : (8'hb7)) : $unsigned(wire1)))));
  assign wire6 = (wire4 == wire3[(4'ha):(4'ha)]);
  assign wire7 = (&{wire2});
  assign wire8 = (^((+{$signed(wire5)}) ? wire1 : wire5));
  always
    @(posedge clk) begin
      reg9 <= (8'ha9);
      if ((-((^~wire3) ~^ (^~$unsigned((^~wire2))))))
        begin
          reg10 <= wire5[(3'h7):(3'h4)];
          reg11 <= wire1[(3'h5):(3'h4)];
          if ($unsigned({reg9,
              ((^wire3[(2'h2):(2'h2)]) ?
                  (|$signed(reg10)) : reg11[(1'h0):(1'h0)])}))
            begin
              reg12 <= ((8'ha5) >>> wire7);
              reg13 <= (((&({wire6,
                  reg12} == $signed(wire4))) ^ (^(wire3[(2'h2):(2'h2)] != (wire8 >>> wire3)))) || (~^({wire4[(3'h4):(2'h2)]} ~^ reg12)));
            end
          else
            begin
              reg12 <= (((~&({(8'ha3)} ?
                      ((8'hb5) ? wire2 : reg13) : reg12[(4'h8):(4'h8)])) ?
                  {wire8[(1'h0):(1'h0)],
                      reg12[(4'h9):(3'h5)]} : wire8[(1'h1):(1'h1)]) < ($signed((wire3[(1'h1):(1'h1)] < wire5)) ?
                  (^$unsigned(reg10)) : (wire1 ?
                      $unsigned($signed(wire0)) : (7'h43))));
            end
          reg14 <= (($signed((8'ha8)) << (+wire0)) ?
              (~|reg11[(2'h3):(1'h1)]) : wire8);
        end
      else
        begin
          reg10 <= reg14[(3'h7):(3'h5)];
          reg11 <= (wire4 ?
              $unsigned(wire7) : (-(((~^wire1) && {reg12}) ?
                  ($signed(reg13) ?
                      {wire5} : wire0[(3'h4):(3'h4)]) : $unsigned($signed(reg14)))));
          if (wire0)
            begin
              reg12 <= ((wire5[(5'h11):(4'hc)] ?
                  $signed((reg10 ?
                      ((8'haa) && (8'hae)) : (reg11 >>> wire6))) : (^((reg14 < wire8) >>> (reg9 ?
                      reg13 : reg14)))) <<< wire8[(1'h1):(1'h0)]);
            end
          else
            begin
              reg12 <= (reg13[(4'h8):(3'h7)] ?
                  ((~wire4[(3'h4):(2'h2)]) ?
                      $unsigned(reg14[(4'hd):(1'h1)]) : $signed(((|wire5) || (+(8'hba))))) : (~|reg10));
              reg13 <= reg9;
              reg14 <= (wire4 ?
                  (+(!((~|wire3) <= (reg10 >= wire6)))) : reg12[(4'ha):(2'h3)]);
              reg15 <= $signed(wire0[(4'he):(2'h3)]);
              reg16 <= $unsigned((({$signed(wire2)} ?
                  ((wire1 ? reg12 : wire0) || (wire3 ?
                      wire6 : reg14)) : wire5) << (~$unsigned($unsigned(reg14)))));
            end
        end
      if ($signed($signed(($signed((-wire7)) <<< ($unsigned((8'ha6)) ?
          (wire4 ~^ wire8) : $signed(wire6))))))
        begin
          reg17 <= $signed((^reg10[(2'h3):(2'h2)]));
          if (wire3)
            begin
              reg18 <= (~((^reg16) <= $unsigned(reg13)));
            end
          else
            begin
              reg18 <= wire0;
              reg19 <= (reg15 ?
                  (($signed(reg11) > $signed($unsigned(wire1))) ?
                      (~$unsigned((^wire2))) : $signed($signed((reg10 | wire8)))) : (&(~^reg13[(5'h12):(4'h8)])));
              reg20 <= (wire1[(4'hf):(3'h6)] >> {(wire6 > {{wire1}})});
              reg21 <= ($unsigned((~wire7[(3'h4):(3'h4)])) ^ $signed((reg9 >= {$signed(wire5)})));
              reg22 <= (&{((reg16[(3'h7):(1'h1)] ?
                          (!wire1) : $unsigned((7'h43))) ?
                      $signed((wire5 <= wire6)) : wire5[(1'h1):(1'h0)]),
                  wire6});
            end
          reg23 <= reg14[(3'h4):(1'h1)];
        end
      else
        begin
          reg17 <= (((|$unsigned($unsigned(reg14))) ?
              wire4 : wire7[(3'h5):(2'h3)]) << $unsigned(((reg10 ~^ (reg13 ?
                  wire0 : wire3)) ?
              ($signed(reg18) ~^ $signed(reg16)) : $signed((~|reg19)))));
          if (((($unsigned({(8'ha0)}) < reg12) ?
              $signed(reg15[(3'h6):(2'h3)]) : $signed(reg15)) >= ({($signed(wire0) - reg20[(2'h2):(1'h1)])} ^ (|wire8))))
            begin
              reg18 <= ((($signed((wire3 <<< (8'haa))) ?
                      (reg14[(4'hc):(3'h7)] ?
                          $unsigned(reg18) : (&reg10)) : $unsigned($unsigned(reg14))) >>> $signed(reg22)) ?
                  $signed(wire5[(5'h14):(5'h13)]) : $unsigned($unsigned($unsigned({wire5,
                      reg10}))));
              reg19 <= (wire2 ?
                  {$signed(($unsigned((8'hbd)) <= reg11[(2'h2):(2'h2)])),
                      $signed((^~$unsigned(wire8)))} : {(-(reg17 != reg10))});
              reg20 <= ((reg23[(2'h2):(2'h2)] + $unsigned({$unsigned((8'h9f)),
                      (wire2 | reg11)})) ?
                  $signed(reg9) : (^~{$signed((~&wire6))}));
            end
          else
            begin
              reg18 <= (&{($signed(reg17[(4'h8):(2'h2)]) ^ wire4[(2'h3):(1'h1)]),
                  wire5[(4'hd):(1'h1)]});
              reg19 <= $signed($signed(reg17));
              reg20 <= $unsigned(((reg9 ?
                  wire4[(3'h4):(1'h0)] : ((reg13 ?
                      reg23 : reg11) == $unsigned(reg19))) && $unsigned($unsigned($unsigned(reg14)))));
              reg21 <= $signed($signed((((wire3 ?
                  (8'hb7) : reg18) > {wire8}) & (!$unsigned(reg22)))));
              reg22 <= ((wire3[(1'h0):(1'h0)] ?
                  wire2 : $unsigned($unsigned(reg20))) ^~ (reg10[(1'h1):(1'h1)] + reg16));
            end
        end
    end
  module24 #() modinst98 (wire97, clk, reg12, reg16, reg21, reg19, reg23);
  assign wire99 = $unsigned((&(^reg20)));
  assign wire100 = wire4;
  assign wire101 = wire6[(3'h5):(1'h0)];
  assign wire102 = {wire2[(4'hf):(4'hf)]};
  assign wire103 = reg13[(3'h4):(3'h4)];
  module104 #() modinst141 (wire140, clk, wire6, reg15, reg13, reg17);
  always
    @(posedge clk) begin
      if ((wire8 ?
          (($signed((8'ha1)) + $unsigned((reg19 << (8'hb3)))) ?
              {$unsigned(wire103[(3'h7):(2'h3)]),
                  reg13[(4'hc):(4'hb)]} : $signed($signed((reg22 >>> reg17)))) : reg10[(3'h5):(1'h1)]))
        begin
          reg142 <= {((($signed(wire2) < reg21[(1'h1):(1'h0)]) ?
                      reg19[(4'ha):(3'h4)] : $unsigned(reg14[(5'h10):(4'h8)])) ?
                  ($unsigned((+reg14)) <<< $signed(wire97)) : ((((8'h9f) ?
                              reg22 : reg17) ?
                          $signed(reg15) : (8'hb7)) ?
                      $unsigned(reg11[(2'h3):(1'h0)]) : ((wire2 ?
                          wire103 : reg12) ~^ $unsigned(wire99)))),
              ($signed(reg18) | wire97)};
        end
      else
        begin
          reg142 <= (|wire97[(2'h3):(1'h0)]);
          reg143 <= reg17;
          reg144 <= wire6[(3'h6):(3'h5)];
        end
      reg145 <= ((!(((reg10 <= reg143) <= wire0) ?
              (reg11 + $signed(reg21)) : $unsigned((reg17 | wire102)))) ?
          ($unsigned((8'ha4)) ?
              $signed((8'hba)) : {(8'hb8),
                  {(|(8'ha0)),
                      wire4[(3'h4):(1'h0)]}}) : {$signed({$unsigned(wire1)}),
              (8'haf)});
    end
  assign wire146 = ((reg11[(2'h2):(2'h2)] ?
                           ((wire7 << reg16) ?
                               $unsigned(wire8[(1'h1):(1'h1)]) : reg21) : reg20) ?
                       $unsigned($unsigned(reg9[(4'he):(4'h8)])) : (~|$unsigned($signed(wire0))));
  assign wire147 = reg22[(3'h7):(1'h1)];
  assign wire148 = reg15[(1'h1):(1'h1)];
  assign wire149 = $signed((((~|wire101) | wire4[(2'h2):(1'h0)]) <<< wire148));
endmodule

module module104
#(parameter param139 = ((((((8'ha0) ? (7'h42) : (8'hbb)) ~^ ((8'ha6) ? (8'ha1) : (8'hb2))) ? (((8'hb5) ? (8'ha1) : (8'hb7)) ? {(8'had), (8'hb6)} : ((8'ha0) ? (8'hb3) : (8'haf))) : ({(8'had)} ? ((8'hbf) ? (8'hbf) : (8'ha6)) : ((8'hbf) > (8'hb0)))) ? ((|(~|(8'h9c))) - (7'h43)) : (8'hbd)) ? (((!(+(8'haa))) ~^ (8'ha4)) ? {(((8'hb3) ? (8'hb1) : (8'hab)) ? ((8'hba) ? (8'ha4) : (8'hb1)) : ((8'ha3) ? (8'hac) : (8'h9c)))} : ((((7'h41) ? (8'ha2) : (8'ha8)) ^~ ((8'ha7) ? (8'h9e) : (7'h44))) >> ((~|(8'ha3)) * ((8'ha2) == (8'ha3))))) : (&({{(8'h9c)}, ((8'ha5) ? (8'hb9) : (8'hb7))} ^ (-(!(8'hbb)))))))
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire108;
  input wire signed [(5'h11):(1'h0)] wire107;
  input wire [(5'h13):(1'h0)] wire106;
  input wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire129;
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire129,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  module109 #() modinst130 (wire129, clk, wire105, wire107, wire108, wire106);
  always
    @(posedge clk) begin
      reg131 <= {wire107[(1'h1):(1'h0)],
          ($unsigned((-wire107)) >= (-(+wire108[(1'h1):(1'h0)])))};
      reg132 <= $unsigned((^(((8'hb1) ? $unsigned((8'hb3)) : (+reg131)) ?
          (wire107[(3'h4):(1'h1)] <<< wire105) : ((~&wire107) || reg131[(3'h6):(1'h0)]))));
      reg133 <= (~^wire108[(3'h7):(3'h6)]);
      reg134 <= $signed((8'hb6));
    end
  assign wire135 = $signed($unsigned(wire105));
  assign wire136 = reg131;
  assign wire137 = reg131;
  assign wire138 = wire135[(4'ha):(2'h3)];
endmodule

module module24
#(parameter param96 = {(((&((8'hb9) ? (8'haa) : (8'h9f))) <= (((7'h40) ? (8'hac) : (8'hb5)) ? ((8'ha8) ^~ (8'h9c)) : (!(8'ha8)))) ? ((^{(8'haf), (8'hb6)}) | ((8'hbe) || ((8'hb4) ? (8'ha4) : (8'h9c)))) : (({(8'h9c)} >= ((8'ha4) | (8'ha5))) ^ (((8'hbb) | (8'ha0)) ? {(8'h9f)} : (&(7'h40)))))})
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire94;
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  assign y = {wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire57,
                 wire58,
                 wire94,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= (wire26[(2'h3):(1'h0)] == wire25[(4'hc):(3'h7)]);
      reg31 <= {$signed(wire28[(4'hd):(2'h2)]),
          $signed((wire25 ^ $signed($signed((8'h9c)))))};
      reg32 <= $unsigned($unsigned($unsigned((~|(reg30 ^ reg31)))));
      if (wire29)
        begin
          reg33 <= $unsigned((($unsigned($unsigned(reg31)) ?
              $unsigned((reg31 << wire27)) : $signed(((7'h40) == wire26))) ~^ (wire27[(2'h3):(1'h1)] ?
              reg32[(1'h0):(1'h0)] : (wire26[(1'h1):(1'h1)] ?
                  wire27 : {(8'hae)}))));
          if ({$unsigned(wire27),
              (((^~(reg31 ? wire28 : reg31)) ?
                      ($signed(reg32) <= (reg31 ^~ wire28)) : $unsigned($unsigned(reg33))) ?
                  ($unsigned($unsigned(reg32)) << ((+wire25) ^~ {reg32})) : ($unsigned((8'ha9)) != $signed(wire27)))})
            begin
              reg34 <= wire27[(2'h2):(1'h0)];
            end
          else
            begin
              reg34 <= (~&($unsigned(wire25[(4'h9):(3'h7)]) ?
                  (~(!{reg30, (8'ha9)})) : $unsigned(reg32[(2'h2):(2'h2)])));
              reg35 <= $unsigned($unsigned(wire27[(2'h2):(1'h1)]));
              reg36 <= $unsigned($signed(((wire26 ^~ reg32) << (&reg33))));
            end
          if ((reg34 ? $unsigned($signed((^~$signed(wire26)))) : reg32))
            begin
              reg37 <= {$signed((wire27[(3'h5):(1'h1)] >>> (~|(wire29 ?
                      reg34 : wire27))))};
              reg38 <= {$unsigned($unsigned(reg30[(2'h2):(2'h2)]))};
              reg39 <= ((((~&(reg31 != reg32)) <= wire26) ?
                      $unsigned(({wire28} ?
                          $unsigned(reg31) : (wire26 ?
                              (8'h9c) : wire29))) : $unsigned($signed($signed(reg31)))) ?
                  $signed((($unsigned(reg37) ?
                      reg34[(3'h7):(1'h1)] : ((8'ha8) ~^ reg35)) << reg33)) : reg33);
            end
          else
            begin
              reg37 <= (7'h44);
              reg38 <= reg38;
            end
          reg40 <= {wire29,
              (($signed((~|reg30)) ?
                      ((wire29 ^~ wire29) ?
                          {wire25} : $signed(reg34)) : reg33[(3'h5):(3'h4)]) ?
                  wire26 : reg33[(2'h2):(1'h0)])};
          reg41 <= (^~$signed((7'h44)));
        end
      else
        begin
          reg33 <= $signed(((-(wire28 ?
              reg34 : (wire28 ? wire26 : wire26))) << ($signed($signed(reg41)) ?
              $signed($signed(reg30)) : reg38[(2'h2):(2'h2)])));
          reg34 <= $unsigned(($unsigned(((wire28 - reg38) == (~^reg35))) ?
              reg34[(4'hd):(4'hb)] : ((~((8'hb6) ?
                  reg34 : (8'hb6))) >>> wire29[(3'h5):(2'h2)])));
          reg35 <= (~^$unsigned(reg32[(1'h1):(1'h1)]));
        end
      reg42 <= $signed((^~(~^$unsigned($signed(reg40)))));
    end
  assign wire43 = $unsigned(wire25[(4'ha):(3'h5)]);
  assign wire44 = ((reg30[(3'h5):(2'h3)] ?
                      (!(~&(reg33 >= reg36))) : (&$unsigned((-wire25)))) & $unsigned($unsigned($unsigned({wire28,
                      wire26}))));
  assign wire45 = $signed(((wire44[(4'h9):(2'h2)] ? reg30 : (8'ha1)) ?
                      $signed((8'ha4)) : {$unsigned(((8'hb6) ?
                              (8'ha4) : reg38)),
                          (((8'hbe) ? reg31 : reg37) ?
                              $unsigned(reg35) : {reg36})}));
  assign wire46 = wire26;
  assign wire47 = $unsigned((!wire43));
  assign wire48 = $unsigned((-((8'ha4) ?
                      wire46 : $signed(wire29[(3'h5):(1'h1)]))));
  assign wire49 = {wire47};
  assign wire50 = wire26[(1'h0):(1'h0)];
  assign wire51 = {{$unsigned({(reg38 ? wire48 : reg35), $signed(reg41)})},
                      (((~wire29) == ((reg42 ? (8'hb0) : reg31) ?
                          (wire29 != reg39) : {(7'h43),
                              reg41})) ^ ((+$unsigned(wire50)) ?
                          {$signed(reg35),
                              $unsigned(reg31)} : (~|wire44[(4'hf):(2'h2)])))};
  assign wire52 = ($signed((((wire48 << reg41) >= wire26[(2'h2):(1'h1)]) ?
                      reg30[(1'h0):(1'h0)] : wire51[(5'h10):(1'h1)])) << wire27[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg53 <= (~|wire29[(3'h4):(2'h2)]);
      reg54 <= wire47;
      reg55 <= $signed(($signed(reg31) & $signed(((^~wire51) ?
          $unsigned((7'h42)) : reg35))));
      if ((reg39 ? $signed($signed((~^$unsigned(wire43)))) : {$signed(reg41)}))
        begin
          reg56 <= ((+$signed((!$unsigned(reg30)))) ? (+{wire45}) : (^wire49));
        end
      else
        begin
          reg56 <= wire29;
        end
    end
  assign wire57 = ($unsigned(reg30) ?
                      (~(8'hb5)) : ((($unsigned((8'h9c)) ^~ $signed(wire50)) << $signed((^reg40))) == reg37));
  assign wire58 = wire45[(3'h5):(3'h5)];
  module59 #() modinst95 (wire94, clk, wire25, reg38, reg31, wire51, wire45);
endmodule

module module59  (y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  input wire signed [(5'h14):(1'h0)] wire61;
  input wire signed [(5'h12):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire89,
                 wire88,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg91,
                 reg90,
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
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire65 = {wire60};
  assign wire66 = wire64[(4'h9):(1'h0)];
  assign wire67 = $unsigned(wire64[(4'ha):(3'h7)]);
  assign wire68 = $unsigned((~^{(^$unsigned(wire64))}));
  assign wire69 = ((+$signed($unsigned($signed(wire64)))) >= ((|(wire62[(3'h5):(3'h4)] < wire64)) ?
                      (|$signed((wire64 ? wire60 : wire60))) : wire65));
  assign wire70 = $unsigned(wire62);
  always
    @(posedge clk) begin
      reg71 <= ((wire68[(3'h4):(3'h4)] > $signed((wire68[(2'h2):(2'h2)] ?
          (~|wire70) : wire67))) >> $unsigned(wire70));
      if (wire62[(1'h0):(1'h0)])
        begin
          reg72 <= ($unsigned({($signed(wire66) ?
                      $signed(wire64) : wire69[(2'h3):(2'h2)]),
                  (&{wire66})}) ?
              ($signed((~|wire67[(4'hb):(4'ha)])) ~^ ((+$signed(wire68)) ?
                  ($unsigned(wire64) ?
                      $signed(wire61) : wire70) : reg71)) : (-$unsigned($unsigned((&wire62)))));
          reg73 <= wire70;
        end
      else
        begin
          reg72 <= ($signed($unsigned($unsigned(wire68[(4'h8):(4'h8)]))) ^~ ({(reg71 ?
                  (wire64 != reg73) : (-(8'hb3)))} ^~ (|wire62)));
          reg73 <= $unsigned({(8'haa),
              {$unsigned((reg73 ? (8'ha8) : wire65))}});
          reg74 <= wire62;
          reg75 <= $unsigned(((({wire60, wire63} ?
              $unsigned(reg71) : {(7'h42), wire65}) * ((-wire63) ?
              (wire60 ? reg73 : reg73) : (reg74 ?
                  wire68 : wire60))) >>> wire68[(1'h0):(1'h0)]));
          reg76 <= wire68;
        end
      reg77 <= $unsigned(wire69[(4'hb):(4'h8)]);
      reg78 <= $unsigned(wire63);
      if ((~$unsigned($signed(wire70))))
        begin
          reg79 <= $signed(reg71[(3'h7):(1'h1)]);
        end
      else
        begin
          reg79 <= wire64[(3'h5):(2'h2)];
          reg80 <= $signed(wire65[(4'h9):(4'h9)]);
          if (($signed((reg80[(2'h2):(2'h2)] ?
                  reg77[(3'h4):(2'h3)] : ($signed(reg78) ?
                      $unsigned((8'ha2)) : wire65))) ?
              {$signed(($signed(wire68) ?
                      wire64 : wire66[(3'h5):(2'h3)]))} : {{(((7'h44) ?
                          wire62 : reg77) ~^ (-wire70)),
                      $signed($signed(reg77))},
                  $signed((((8'hae) ? (8'hb1) : reg78) ?
                      (wire70 ? (8'ha8) : wire66) : reg72[(2'h2):(1'h0)]))}))
            begin
              reg81 <= ((^($unsigned(wire66[(3'h4):(2'h2)]) ?
                      $unsigned($signed(wire68)) : $signed({wire60, wire70}))) ?
                  (8'hb1) : ($unsigned((8'h9c)) ?
                      ((~|(wire70 || reg71)) | (~&(reg73 ?
                          (8'hb0) : wire64))) : $signed((wire65 ?
                          wire69 : (^~wire70)))));
              reg82 <= (&($unsigned((8'hb5)) & $unsigned($signed((reg76 | (8'ha6))))));
              reg83 <= (reg80 ?
                  $unsigned((+$signed({(8'hb4)}))) : reg82[(3'h4):(2'h3)]);
              reg84 <= (reg81[(1'h0):(1'h0)] * $signed(({(~&(8'ha0)),
                      (!reg77)} ?
                  (!$unsigned(reg75)) : (~&$signed((7'h41))))));
              reg85 <= $unsigned({reg80, reg84[(2'h2):(1'h1)]});
            end
          else
            begin
              reg81 <= (!(wire61 >>> reg85[(1'h0):(1'h0)]));
              reg82 <= $signed(({wire69} >>> $signed((~&reg71[(4'hc):(4'hc)]))));
            end
          reg86 <= $signed({wire61[(4'hf):(1'h0)], reg73});
          reg87 <= $unsigned((^~{$unsigned($unsigned(wire62))}));
        end
    end
  assign wire88 = $unsigned({reg74[(3'h7):(3'h4)], wire61});
  assign wire89 = $signed(reg74[(4'h8):(1'h1)]);
  always
    @(posedge clk) begin
      reg90 <= {$signed($signed($signed($unsigned(wire63))))};
      reg91 <= $unsigned(($signed(reg81) ?
          ((reg86[(5'h11):(3'h5)] ?
              wire61 : (reg73 ?
                  wire88 : (8'ha7))) * $unsigned($signed(reg74))) : wire69));
    end
  assign wire92 = {wire70};
  assign wire93 = (~reg79[(1'h0):(1'h0)]);
endmodule

module module109
#(parameter param127 = (~^((8'ha3) ? ((((7'h40) ? (8'hb9) : (8'hb9)) ? (+(8'hb5)) : (8'ha4)) <<< ((!(8'hb8)) | (!(8'hb9)))) : ((((8'hb6) <<< (8'hb1)) ~^ {(8'ha5), (8'ha8)}) ~^ ((~(8'hb6)) ? ((8'hb7) ? (8'hb8) : (8'hb5)) : (8'hbf))))), 
parameter param128 = ({(param127 ? (~&param127) : ((8'hb8) >= param127)), (!{{param127, param127}})} ? param127 : (param127 ~^ (param127 ? param127 : (~|(param127 <= param127))))))
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire113;
  input wire [(5'h11):(1'h0)] wire112;
  input wire [(4'ha):(1'h0)] wire111;
  input wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire116,
                 wire115,
                 wire114,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire114 = wire110;
  assign wire115 = wire112[(3'h4):(2'h3)];
  assign wire116 = ((~^(~&{$unsigned(wire114),
                       wire114[(3'h6):(2'h3)]})) ~^ $signed($signed((wire110 ?
                       (wire110 ? wire110 : wire114) : (+(8'hb6))))));
  always
    @(posedge clk) begin
      reg117 <= $unsigned(wire114);
      reg118 <= wire113[(3'h6):(2'h3)];
    end
  assign wire119 = wire116;
  assign wire120 = $signed($signed((reg118 ?
                       $signed((reg118 >>> (8'hb8))) : ((&reg118) ^~ $signed((7'h42))))));
  assign wire121 = (8'hb2);
  assign wire122 = {$signed((reg118[(1'h0):(1'h0)] - $unsigned(wire113)))};
  assign wire123 = wire116[(4'hc):(4'h8)];
  assign wire124 = wire114[(1'h0):(1'h0)];
  assign wire125 = {{wire119, $unsigned((~$unsigned(wire112)))},
                       $unsigned(((|$signed(wire115)) ^ wire114[(1'h1):(1'h1)]))};
  assign wire126 = wire121[(3'h4):(2'h3)];
endmodule

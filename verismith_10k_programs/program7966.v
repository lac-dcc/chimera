module top
#(parameter param177 = ((((^(+(8'hb7))) + (!((8'ha7) ? (8'hbf) : (8'hb1)))) ? {(((8'h9f) << (8'hbf)) ? ((8'hb8) ? (8'ha6) : (8'ha4)) : (~|(8'ha7)))} : ((((8'h9e) ? (8'hbe) : (7'h42)) ^~ ((8'hb7) <= (8'haf))) ? (+((8'had) ? (8'hb3) : (8'hb8))) : {(^~(7'h41))})) ~^ (((((8'hab) <<< (7'h43)) ? (~^(8'h9d)) : ((8'hb6) <= (8'ha0))) && ((^~(8'hb2)) > ((8'hb5) ? (8'hb8) : (8'haa)))) == ((((8'ha6) & (7'h40)) << ((8'hb0) ? (8'ha8) : (8'hb6))) ? (~&((8'hbe) ? (8'hbe) : (8'hb1))) : {((8'hac) <<< (7'h40))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire176;
  wire [(3'h4):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire173;
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg4 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire173,
                 reg30,
                 reg29,
                 reg28,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((!{($signed($signed(wire2)) ?
              $unsigned($signed(wire1)) : ($unsigned(wire2) ?
                  $signed(wire1) : (wire2 ? wire2 : wire2))),
          (wire2[(3'h6):(3'h6)] ?
              (wire0 ? wire1 : $signed(wire3)) : (wire0[(3'h6):(2'h2)] ?
                  {wire2} : wire2))}))
        begin
          reg4 <= (wire2[(3'h7):(3'h7)] ? (|wire3[(4'h8):(3'h5)]) : wire1);
          reg5 <= (wire1[(1'h1):(1'h1)] ?
              $signed(((wire1 ?
                  ((8'ha7) - wire3) : {wire2}) - wire1)) : ($signed((wire1[(2'h2):(2'h2)] ?
                  (reg4 ?
                      reg4 : wire2) : reg4[(2'h3):(2'h3)])) > ((wire1[(2'h2):(1'h0)] << $unsigned(reg4)) ?
                  wire2 : ((^wire2) ~^ wire3))));
          reg6 <= (&$signed((($unsigned(wire0) ?
                  $signed(wire3) : (wire2 & wire1)) ?
              $signed((~|wire1)) : ((wire2 > wire2) ?
                  wire3[(4'hd):(4'hb)] : wire0))));
          reg7 <= ($signed($unsigned((~&$signed(wire0)))) ?
              (^({$unsigned(wire3)} && (wire1 ?
                  $signed((7'h40)) : (8'hbc)))) : (^~wire2[(2'h2):(2'h2)]));
          reg8 <= (($unsigned(reg7) & reg6) ?
              $unsigned(($unsigned(reg5[(4'h9):(1'h0)]) ?
                  (^reg4) : wire3)) : reg7[(2'h2):(1'h0)]);
        end
      else
        begin
          reg4 <= (wire2[(4'h9):(2'h3)] < wire2[(3'h7):(1'h1)]);
          reg5 <= reg7;
          reg6 <= (~^({(|(reg7 <= reg7))} ? wire2 : reg4[(3'h7):(1'h0)]));
          if ($unsigned(($unsigned(($signed(reg6) ?
              wire0[(3'h6):(1'h0)] : $unsigned(reg7))) > wire2)))
            begin
              reg7 <= (7'h43);
              reg8 <= $signed((reg8[(4'he):(2'h3)] ?
                  reg5[(3'h6):(2'h2)] : (reg5[(4'hb):(3'h5)] ?
                      reg4[(2'h3):(1'h0)] : ((wire2 ?
                          wire3 : wire0) <= reg5))));
              reg9 <= $signed(reg6);
              reg10 <= $signed(((^~wire1) ?
                  {(((7'h41) << reg6) <= $signed(reg8))} : (~$signed((reg9 ?
                      reg6 : reg4)))));
              reg11 <= reg9[(4'h8):(2'h3)];
            end
          else
            begin
              reg7 <= (~&$signed(wire3[(4'he):(3'h6)]));
            end
        end
      if ($signed($signed({(8'hbe)})))
        begin
          reg12 <= wire0;
          reg13 <= (~|reg6[(1'h0):(1'h0)]);
          reg14 <= $signed(reg5);
          reg15 <= (((((+reg10) <= (^~reg4)) < (+$unsigned(reg5))) ?
                  $signed(reg5[(1'h1):(1'h1)]) : reg9[(3'h4):(2'h2)]) ?
              reg12 : ($unsigned(wire1) ?
                  ((+$signed(wire3)) ?
                      (~(^~(8'hbb))) : reg10) : $signed((reg7[(2'h2):(1'h1)] ?
                      $signed(reg13) : ((7'h41) << reg5)))));
          reg16 <= reg15[(1'h1):(1'h1)];
        end
      else
        begin
          reg12 <= wire0;
          reg13 <= reg6[(2'h2):(1'h0)];
          reg14 <= (&{((!{reg11, reg14}) ?
                  (wire0 ?
                      (8'hb4) : {(7'h43),
                          reg10}) : $unsigned($unsigned(reg15))),
              $signed((reg16 ? {reg10} : $signed(reg16)))});
        end
      reg17 <= reg9[(1'h1):(1'h1)];
      reg18 <= reg9;
      reg19 <= (^~wire3[(3'h5):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg20 <= (({($signed(wire2) ? $signed(reg9) : $signed((8'haa)))} ?
              $signed(((reg19 ?
                  wire1 : reg8) >>> reg7)) : (wire3[(3'h7):(1'h1)] || (~|$signed(reg16)))) ?
          reg13 : reg15[(2'h3):(1'h0)]);
      if ((!(({(+wire3), $unsigned((8'ha5))} >= ($unsigned(reg18) ^~ wire1)) ?
          $unsigned($unsigned((reg14 ? reg5 : reg6))) : {reg8})))
        begin
          reg21 <= (&reg7);
          reg22 <= reg10[(3'h6):(3'h6)];
          reg23 <= {(!(!$unsigned(reg15[(1'h0):(1'h0)])))};
        end
      else
        begin
          reg21 <= $signed({$signed(wire0[(3'h6):(1'h1)])});
          reg22 <= $signed((!(+wire1[(1'h0):(1'h0)])));
          reg23 <= reg16;
        end
      reg24 <= (reg22 ?
          wire2 : ((~reg23) ?
              (($unsigned((8'had)) >>> $unsigned(wire2)) ?
                  reg22[(4'hb):(2'h2)] : ($signed(reg4) < reg12)) : ($signed($unsigned(reg7)) ?
                  reg7[(5'h10):(3'h5)] : reg4)));
      if ($signed(reg14))
        begin
          reg25 <= {(($unsigned((reg16 == reg12)) >> {reg14[(2'h3):(2'h2)],
                  (reg5 * (8'hae))}) ^~ reg9),
              (($unsigned(reg22) ?
                      $unsigned($unsigned(reg18)) : (^~(reg23 ?
                          reg5 : reg24))) ?
                  (($signed(reg20) ?
                      (~&reg8) : (~|(8'ha2))) && reg17[(2'h3):(2'h2)]) : (~(^$unsigned(reg23))))};
          reg26 <= reg16[(3'h5):(2'h2)];
          reg27 <= $signed((!($unsigned({reg20}) ?
              $signed($signed(wire1)) : $signed($unsigned(reg26)))));
          reg28 <= (reg21 ?
              ($unsigned(reg5[(4'hf):(1'h1)]) << reg10[(2'h2):(2'h2)]) : ({($signed(reg22) ?
                      (~^reg12) : $signed(reg17))} ^ (reg26[(2'h3):(2'h3)] ?
                  $unsigned({(8'hbe)}) : $unsigned((-reg7)))));
          reg29 <= ((-(reg13 || (8'ha2))) ?
              {$unsigned(reg19[(1'h1):(1'h1)]),
                  (-($signed((8'hb4)) >> (reg23 << (7'h41))))} : (^$unsigned($unsigned(reg8[(3'h4):(1'h1)]))));
        end
      else
        begin
          reg25 <= ($unsigned(reg28) ^~ (({reg28[(3'h5):(1'h0)]} ?
                  (reg18 ? (&wire0) : $signed(reg14)) : wire0[(4'ha):(3'h6)]) ?
              (8'ha9) : (-(8'ha2))));
          reg26 <= ($unsigned((~|((reg25 ? reg6 : reg29) ?
                  $unsigned(reg5) : reg14[(1'h1):(1'h0)]))) ?
              reg19 : ($signed(reg16) ?
                  $unsigned(wire0) : ($signed(reg9[(3'h7):(1'h0)]) >>> {(reg10 ?
                          reg11 : (8'hbb))})));
          reg27 <= ({($signed(wire0[(2'h3):(1'h1)]) ?
                  ((!reg21) ? (reg29 + reg23) : $unsigned(reg17)) : ((reg12 ?
                      reg8 : reg21) * $unsigned(reg28)))} ^ reg17);
        end
      reg30 <= reg21[(4'h9):(1'h1)];
    end
  assign wire31 = (~reg16[(3'h5):(3'h4)]);
  assign wire32 = $signed((({reg4[(2'h3):(2'h3)]} >= $unsigned($unsigned(reg27))) ?
                      reg21 : ((^wire3) ?
                          $signed(reg25[(4'hd):(2'h3)]) : $unsigned($unsigned(reg18)))));
  assign wire33 = reg28;
  assign wire34 = (reg15[(3'h6):(3'h5)] ?
                      $unsigned(reg30) : ($signed($signed($signed(reg17))) || wire32[(1'h0):(1'h0)]));
  assign wire35 = reg18;
  module36 #() modinst174 (wire173, clk, wire31, reg18, reg6, reg13, reg29);
  assign wire175 = (^$signed(reg5));
  assign wire176 = (~^wire33[(1'h1):(1'h1)]);
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire172;
  wire [(2'h2):(1'h0)] wire171;
  wire [(4'ha):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire100;
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(3'h6):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire164,
                 wire162,
                 wire159,
                 wire138,
                 wire102,
                 wire57,
                 wire44,
                 wire43,
                 wire42,
                 wire59,
                 wire100,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg163,
                 reg161,
                 reg160,
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
                 (1'h0)};
  assign wire42 = ((((8'hbd) ? wire41 : (~|(wire37 ? wire38 : (8'h9e)))) ?
                      (wire38[(1'h1):(1'h0)] * $unsigned((|wire40))) : {{{wire39}}}) > wire40);
  assign wire43 = wire38;
  assign wire44 = $unsigned((^~wire40));
  module45 #() modinst58 (.wire48(wire43), .wire49(wire42), .wire47(wire44), .clk(clk), .wire46(wire41), .wire50(wire38), .y(wire57));
  assign wire59 = {wire43, wire40};
  module60 #() modinst101 (.clk(clk), .wire61(wire41), .wire64(wire59), .y(wire100), .wire63(wire42), .wire65(wire38), .wire62(wire40));
  assign wire102 = ($signed(wire100) != wire59[(3'h5):(2'h2)]);
  module103 #() modinst139 (.wire106(wire43), .wire107(wire39), .y(wire138), .wire105(wire37), .clk(clk), .wire104(wire41));
  always
    @(posedge clk) begin
      reg140 <= $signed((~^($signed({wire57, wire100}) ?
          ((wire42 ? wire138 : wire43) ?
              wire100 : ((8'hac) < wire39)) : ($signed(wire43) ?
              $signed(wire39) : $unsigned(wire100)))));
      reg141 <= (~|$signed($unsigned(wire100[(4'ha):(3'h6)])));
      if ((wire59 | (!$signed((wire40 + {wire44, (8'haf)})))))
        begin
          reg142 <= wire37;
          if (wire100[(4'h8):(1'h0)])
            begin
              reg143 <= {(~&wire102[(1'h0):(1'h0)])};
              reg144 <= ((^((&(wire102 ? wire41 : wire102)) << wire42)) ?
                  $signed(((!(&wire41)) ?
                      ($unsigned(reg142) ?
                          (wire102 <<< wire138) : wire59) : ({wire41,
                          reg143} == wire41[(3'h4):(2'h2)]))) : $unsigned(reg140));
              reg145 <= $signed({$signed({(wire40 | wire59)})});
            end
          else
            begin
              reg143 <= reg144[(2'h3):(1'h0)];
              reg144 <= (^~wire38);
              reg145 <= reg140;
            end
          if (wire59[(1'h1):(1'h1)])
            begin
              reg146 <= wire39[(4'h9):(3'h4)];
              reg147 <= (~^$signed(reg140[(3'h5):(1'h1)]));
              reg148 <= $unsigned(wire138[(2'h2):(1'h1)]);
              reg149 <= ($signed((reg142[(1'h1):(1'h1)] >> ($unsigned(wire100) ?
                      (8'ha5) : $signed(wire42)))) ?
                  $unsigned($unsigned((+$unsigned(wire44)))) : wire100[(3'h5):(2'h3)]);
              reg150 <= reg144[(4'ha):(2'h2)];
            end
          else
            begin
              reg146 <= $signed(((($unsigned(reg142) ^~ {wire100}) ?
                      ($signed(wire37) <<< (wire42 >= wire100)) : (~^$signed(wire100))) ?
                  reg145 : $unsigned((~|$signed(wire41)))));
              reg147 <= wire42;
              reg148 <= wire43;
            end
        end
      else
        begin
          reg142 <= wire100;
        end
    end
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(wire138[(3'h5):(1'h1)])) > $unsigned(({(reg149 ?
                  reg145 : wire38)} ?
          wire102[(3'h6):(1'h0)] : (7'h42)))))
        begin
          reg151 <= (((((wire37 ? (8'hb3) : wire40) ?
                      {reg147} : $signed((8'h9d))) ?
                  (wire40 ?
                      (reg150 + reg149) : reg146) : $unsigned(reg149)) == (8'ha9)) ?
              {wire43[(4'hb):(4'ha)]} : ($signed((reg144[(3'h6):(2'h3)] ?
                      (^~(8'hb5)) : $signed(reg146))) ?
                  wire59[(3'h6):(1'h1)] : $signed({$signed(wire57),
                      $unsigned((8'h9c))})));
          reg152 <= ({((&wire59) ? wire43 : wire42)} ?
              ($signed(($signed(reg148) ? (8'had) : wire57)) ?
                  reg148[(5'h11):(4'h8)] : $signed((|$signed(reg141)))) : reg144[(3'h5):(2'h3)]);
          reg153 <= reg145[(4'h8):(1'h0)];
          if ((reg145 ?
              (+{(wire41 > wire43[(3'h6):(2'h2)]),
                  ((reg153 <<< wire59) ?
                      reg143 : (+wire138))}) : reg153[(4'he):(4'he)]))
            begin
              reg154 <= $signed($signed((-wire37[(4'h8):(2'h2)])));
              reg155 <= (~|reg148[(4'he):(4'hd)]);
              reg156 <= $unsigned({$unsigned(wire57)});
              reg157 <= (reg146 || wire43);
              reg158 <= reg145;
            end
          else
            begin
              reg154 <= $signed(($unsigned(({(8'hb8)} ?
                  wire138[(1'h1):(1'h1)] : $signed(reg144))) && $unsigned(wire59[(3'h4):(1'h0)])));
              reg155 <= $unsigned((^reg149[(3'h4):(1'h0)]));
              reg156 <= $signed($signed($signed(wire41)));
              reg157 <= ($signed($signed((8'hbb))) ?
                  {((~&(~(8'ha7))) & wire43[(4'hc):(4'hc)]),
                      $signed(reg145[(4'h8):(3'h7)])} : (reg144 <<< (~wire43[(5'h10):(4'hc)])));
              reg158 <= {reg145[(3'h4):(2'h2)]};
            end
        end
      else
        begin
          if (reg156[(4'hc):(3'h5)])
            begin
              reg151 <= (wire43 >>> ((~(reg140 ?
                  {wire44, reg148} : (|reg158))) >= wire44));
              reg152 <= (wire44 ?
                  {$signed(wire100[(2'h3):(2'h3)])} : $signed((((~|wire100) >> (~wire44)) + $signed($signed(wire138)))));
              reg153 <= (~|((($signed((8'hb7)) + wire102[(3'h6):(1'h1)]) ?
                  reg144[(2'h3):(2'h3)] : {wire42,
                      $signed(wire138)}) + (8'hab)));
              reg154 <= reg147[(2'h3):(1'h0)];
            end
          else
            begin
              reg151 <= (~^wire43);
            end
          reg155 <= (!$unsigned(wire42[(2'h2):(1'h0)]));
          reg156 <= $signed((^~$unsigned((+(reg140 ? (7'h44) : reg144)))));
          reg157 <= wire43[(4'h9):(2'h2)];
          reg158 <= (reg140 <<< (&reg156));
        end
    end
  assign wire159 = $signed($unsigned((8'hbc)));
  always
    @(posedge clk) begin
      reg160 <= (7'h43);
    end
  always
    @(posedge clk) begin
      reg161 <= reg150[(1'h0):(1'h0)];
    end
  assign wire162 = $unsigned({($signed((reg143 - reg150)) < ({reg150} ?
                           (reg154 <= (8'ha8)) : {reg148}))});
  always
    @(posedge clk) begin
      reg163 <= reg151;
    end
  assign wire164 = $signed(reg149);
  always
    @(posedge clk) begin
      reg165 <= (~|wire38[(5'h11):(4'he)]);
      if ((((~^$unsigned((wire159 ? wire57 : reg152))) ?
              reg146[(1'h1):(1'h0)] : reg144) ?
          ($signed($signed((!reg145))) ?
              $unsigned($signed($unsigned(reg145))) : $signed($signed((8'hb1)))) : reg141))
        begin
          reg166 <= reg151[(1'h1):(1'h0)];
          if ($unsigned(wire138))
            begin
              reg167 <= reg140[(2'h3):(1'h1)];
              reg168 <= $signed(reg150[(2'h2):(1'h0)]);
            end
          else
            begin
              reg167 <= $signed(reg151[(4'h8):(3'h4)]);
            end
        end
      else
        begin
          reg166 <= (~|wire39[(3'h5):(3'h4)]);
        end
      reg169 <= reg168[(3'h4):(1'h1)];
    end
  assign wire170 = $unsigned(reg148[(3'h6):(2'h3)]);
  assign wire171 = $signed(({$signed({reg147})} ?
                       ($unsigned((reg160 & wire162)) ?
                           reg150 : (reg157 << (reg153 ?
                               (8'hac) : wire159))) : reg163));
  assign wire172 = (^$signed((8'hb3)));
endmodule

module module103
#(parameter param137 = (((((^~(7'h41)) && ((8'h9e) != (8'haf))) ? (((8'hbb) ? (8'h9f) : (8'hb4)) ? ((8'hbf) >>> (8'ha9)) : ((8'hbb) >>> (8'hac))) : {(^(8'had))}) ? ((((8'ha3) <<< (8'ha6)) <<< ((7'h44) >> (8'ha4))) ? (((8'ha8) ? (8'ha6) : (8'h9d)) ? ((8'hb9) && (8'ha7)) : ((8'hb0) ? (8'ha2) : (8'ha5))) : (((8'hb6) ? (8'haa) : (8'h9c)) && ((8'h9e) ? (8'hac) : (8'hba)))) : (-(((8'haf) <= (8'ha0)) >= (-(8'hbc))))) == {{((~|(7'h43)) ? (+(8'h9d)) : ((8'h9e) ? (8'hb2) : (8'hbc))), (|((8'ha2) ? (8'hb5) : (8'hb7)))}}))
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire107;
  input wire [(5'h10):(1'h0)] wire106;
  input wire [(5'h15):(1'h0)] wire105;
  input wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire108;
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire108,
                 reg127,
                 reg126,
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
                 (1'h0)};
  assign wire108 = (~|$signed($unsigned(wire104[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg109 <= {(&$signed($signed(wire104[(1'h1):(1'h1)]))),
          $signed($signed((~^$signed(wire104))))};
      if ((((-$signed((wire105 < wire104))) ?
              ((&(&wire107)) ?
                  ($unsigned(wire105) ?
                      (reg109 ?
                          wire105 : wire105) : (~wire107)) : ($unsigned(wire107) ?
                      $unsigned(wire105) : (^wire108))) : reg109) ?
          (wire106 ?
              $signed($unsigned((^~wire108))) : $signed(wire108)) : (!reg109)))
        begin
          reg110 <= (!{reg109, wire107});
          reg111 <= $signed(($signed(wire104[(3'h6):(3'h6)]) ?
              (^~$signed(reg109)) : (wire108 ?
                  (wire108[(4'hb):(4'h9)] | (wire106 && wire108)) : ({wire106,
                          wire107} ?
                      reg110 : (^~wire104)))));
          if ($signed({wire105,
              $unsigned({wire107[(4'ha):(3'h6)], $signed(reg110)})}))
            begin
              reg112 <= wire106[(4'h8):(2'h3)];
              reg113 <= (reg110[(4'ha):(1'h0)] < wire104[(4'hb):(4'ha)]);
              reg114 <= reg110[(1'h1):(1'h0)];
              reg115 <= (8'hae);
              reg116 <= (((&$signed($unsigned(reg113))) ?
                  wire104 : wire108) >> reg111);
            end
          else
            begin
              reg112 <= (((reg112 ?
                      ((reg110 ? wire104 : reg114) ?
                          (wire104 <= reg113) : {reg110}) : $unsigned($unsigned(wire106))) >> (!{(wire104 >= wire104),
                      wire108})) ?
                  reg116[(1'h0):(1'h0)] : ((({(8'h9c)} ?
                          $signed(wire105) : (&reg110)) && $unsigned((-reg116))) ?
                      $signed(($signed(wire107) ?
                          (reg114 > wire108) : $unsigned(reg114))) : $unsigned(reg112)));
              reg113 <= (+reg113[(2'h2):(2'h2)]);
            end
          reg117 <= {(+{wire105[(5'h11):(5'h10)]}),
              $signed((wire107[(1'h1):(1'h1)] ?
                  {(reg116 ? reg114 : wire108)} : ((reg110 ?
                      reg112 : reg110) ~^ ((8'h9e) ? wire106 : wire105))))};
          reg118 <= $unsigned((~&wire106[(1'h1):(1'h0)]));
        end
      else
        begin
          reg110 <= (+wire106[(3'h4):(1'h0)]);
          reg111 <= ($unsigned({(+$signed(reg114))}) >= ($unsigned((wire105[(4'hf):(1'h0)] ?
                  (wire105 ~^ wire107) : {wire106})) ?
              ($signed((~^reg112)) << ((wire105 <= (8'hba)) * $signed(reg110))) : $unsigned((~reg115))));
          if ($unsigned((^(~&reg109))))
            begin
              reg112 <= reg117[(3'h6):(3'h5)];
              reg113 <= reg115;
              reg114 <= (!(+(reg110[(2'h2):(1'h0)] ?
                  ((^~reg111) >> (wire108 ~^ (8'h9e))) : (reg113[(2'h3):(1'h0)] ?
                      $signed((8'hbd)) : {reg111, reg118}))));
              reg115 <= (reg117[(4'hd):(4'hc)] | reg114[(1'h1):(1'h0)]);
              reg116 <= $unsigned(reg114);
            end
          else
            begin
              reg112 <= (({$unsigned(reg113[(3'h5):(3'h4)])} >> wire108[(1'h1):(1'h1)]) ?
                  ($unsigned((((8'ha8) <<< reg113) ?
                      reg115[(2'h2):(1'h1)] : $signed(wire106))) | {{(~&reg109),
                          (reg115 * (8'hbb))}}) : $signed((~^((wire105 > (7'h41)) ?
                      (+reg109) : $unsigned(reg117)))));
              reg113 <= $unsigned(reg117);
            end
        end
      if (wire104[(4'hd):(4'hd)])
        begin
          reg119 <= wire107;
          if ($unsigned(((reg117[(2'h2):(1'h1)] ?
                  $unsigned((|reg118)) : {((8'hb8) - (8'ha1))}) ?
              $unsigned(reg110) : $signed($signed(reg109)))))
            begin
              reg120 <= (wire105[(4'h8):(3'h5)] <<< wire108[(1'h0):(1'h0)]);
              reg121 <= ($unsigned(reg111) != (wire106[(3'h7):(1'h1)] + (!(7'h42))));
              reg122 <= wire107[(1'h1):(1'h0)];
              reg123 <= (8'ha8);
              reg124 <= ({($signed((~&(8'ha0))) << (wire105 ?
                          reg110[(3'h7):(3'h7)] : $signed((8'hb9)))),
                      reg118[(2'h2):(2'h2)]} ?
                  (^~$signed($signed(reg109[(4'he):(1'h0)]))) : ((~&(reg113[(4'hb):(4'h9)] ?
                          wire108 : reg115[(1'h0):(1'h0)])) ?
                      wire108 : reg122[(4'h9):(1'h1)]));
            end
          else
            begin
              reg120 <= reg123;
              reg121 <= (-reg113);
              reg122 <= $unsigned(reg123[(4'hc):(2'h3)]);
            end
          reg125 <= wire105[(4'hb):(4'hb)];
        end
      else
        begin
          if ((~&$unsigned((({wire105} ?
              (-(7'h42)) : wire106[(2'h2):(1'h1)]) > ((!(8'hbe)) > wire106)))))
            begin
              reg119 <= reg110[(2'h2):(2'h2)];
              reg120 <= {reg121[(3'h5):(3'h5)],
                  (wire107 | (((reg120 ?
                      wire105 : reg120) + (wire108 ^~ reg111)) <<< wire107[(4'ha):(4'h9)]))};
              reg121 <= (~&$unsigned(($unsigned($signed((8'haf))) & $signed((reg114 ~^ wire106)))));
              reg122 <= reg119;
              reg123 <= ((($signed((wire104 ? wire104 : wire105)) | ({(7'h42),
                              reg110} ?
                          ((7'h41) ^~ reg125) : (reg111 ? (8'hbf) : (8'ha2)))) ?
                      (reg120[(3'h7):(2'h2)] ?
                          $signed(reg118[(1'h0):(1'h0)]) : $signed({wire108})) : (|($signed(reg115) * reg111))) ?
                  reg109 : (((^~(reg125 <= reg109)) | wire108) <<< (((reg114 <= reg125) * {reg117}) ?
                      reg110 : ((reg125 ? (7'h44) : reg119) ?
                          wire107[(4'h9):(4'h9)] : (reg110 ?
                              (8'h9f) : (8'hb1))))));
            end
          else
            begin
              reg119 <= (wire107 == {reg112[(4'h8):(1'h0)],
                  (reg121 + (reg116[(2'h2):(1'h1)] ? (-reg110) : (8'h9d)))});
            end
          reg124 <= $signed(reg122[(1'h0):(1'h0)]);
        end
      reg126 <= $unsigned($signed((7'h44)));
      reg127 <= $signed(wire106[(4'h9):(2'h2)]);
    end
  assign wire128 = ($unsigned(reg109) ?
                       (~|(({(7'h41)} ?
                           reg111[(1'h1):(1'h0)] : $signed(reg117)) > $unsigned($signed(wire105)))) : reg112);
  assign wire129 = (((((-reg113) >= (7'h43)) ? reg117 : reg110) ?
                           wire128[(2'h3):(2'h2)] : $unsigned($signed((~&reg116)))) ?
                       {wire106,
                           $unsigned((reg117[(4'he):(3'h6)] ?
                               (|wire105) : ((8'hbf) == reg109)))} : (($unsigned({reg123,
                               (7'h42)}) == ($unsigned((8'ha2)) | (wire105 ?
                               reg126 : reg127))) ?
                           $signed((^reg115[(2'h2):(1'h0)])) : reg118[(4'hd):(4'hc)]));
  assign wire130 = ((!(^$signed($signed(wire106)))) <= (8'ha2));
  assign wire131 = (((($signed((8'hb8)) || (~(8'hbb))) - $signed($signed(wire129))) ?
                       $signed((((8'hb9) ? (8'hae) : reg111) ?
                           (8'hbc) : reg127)) : (8'ha3)) ~^ {reg111[(1'h1):(1'h0)]});
  assign wire132 = (|$unsigned((($signed(reg126) ~^ (reg118 ^~ reg122)) ?
                       {(|(8'hbf))} : {$signed((8'hbf)), $signed(reg112)})));
  assign wire133 = $signed(wire106);
  assign wire134 = $unsigned((((+$signed(wire133)) ?
                           ($unsigned((8'haa)) ?
                               (reg114 ? (8'hb0) : (8'hae)) : (wire106 ?
                                   wire131 : wire128)) : $unsigned($signed(reg127))) ?
                       $signed($unsigned((wire128 << wire130))) : ((wire130[(3'h5):(1'h0)] ?
                               $signed(reg121) : (wire133 | reg127)) ?
                           {(^~wire107)} : reg114)));
  assign wire135 = (8'ha6);
  assign wire136 = ($unsigned(reg113[(2'h3):(1'h1)]) ?
                       {(((wire107 | reg127) ?
                                   $signed(reg117) : (reg118 ?
                                       reg109 : reg119)) ?
                               reg120[(3'h4):(2'h3)] : ((~reg117) << reg121)),
                           wire131[(2'h2):(1'h0)]} : wire106);
endmodule

module module60
#(parameter param99 = (((+(~|((8'ha6) ? (8'ha8) : (8'hb8)))) >= {((^~(8'ha3)) && {(8'ha7)}), (~|(8'h9f))}) ^~ ((|(^~((8'hb9) ? (8'h9e) : (8'hb2)))) ? (8'ha9) : ((((8'hbd) + (7'h40)) ? (^~(8'ha0)) : (+(8'h9f))) ? {(~(8'ha6))} : {((8'ha3) <= (8'hbd))}))))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire65;
  input wire signed [(2'h3):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire signed [(4'ha):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire75,
                 wire74,
                 wire73,
                 wire67,
                 wire66,
                 reg98,
                 reg97,
                 reg96,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire66 = $unsigned(($unsigned(wire63) ?
                      $unsigned((7'h41)) : wire64[(2'h3):(2'h3)]));
  assign wire67 = ((wire61 ?
                      {$signed((wire61 | wire66))} : wire65) > ($signed({(^~wire66),
                      wire62}) | $signed({$signed(wire63),
                      (wire63 ? wire61 : wire61)})));
  always
    @(posedge clk) begin
      reg68 <= (~&({{(wire61 ? wire61 : wire65)},
          $signed({wire62})} > (8'hbb)));
      reg69 <= (wire66[(1'h1):(1'h0)] ?
          $unsigned($unsigned((~|(wire63 ? wire61 : (8'hb2))))) : {(reg68 ?
                  {wire65} : ((wire61 >= wire67) + (wire63 ? wire65 : wire64))),
              (~wire62)});
      reg70 <= (wire63[(4'hc):(2'h3)] ^ {$signed((^(~&wire65)))});
      reg71 <= ($signed($unsigned((^wire65[(3'h7):(3'h6)]))) != ((^($unsigned(wire63) ?
          $unsigned(reg68) : (wire62 == (7'h42)))) <<< ($unsigned(wire61[(3'h7):(3'h5)]) ?
          (wire62 >> wire66[(3'h4):(1'h0)]) : {wire64})));
      reg72 <= {(^reg68[(5'h13):(5'h10)])};
    end
  assign wire73 = {reg72, {$signed($unsigned((-reg72)))}};
  assign wire74 = {$signed($unsigned(((reg70 ? wire73 : wire64) ?
                          (|(8'ha0)) : {(8'ha6)}))),
                      ($unsigned($signed((wire66 ? (8'hb0) : reg70))) ?
                          (($signed(reg72) == wire67) * (-(!wire63))) : reg69[(3'h6):(3'h6)])};
  assign wire75 = reg71;
  always
    @(posedge clk) begin
      if ((~($signed($signed($signed(reg71))) ?
          (|$unsigned((reg72 ? wire65 : wire75))) : (wire75[(1'h1):(1'h1)] ?
              reg68[(3'h6):(3'h5)] : (!(~^wire73))))))
        begin
          reg76 <= (|reg71);
          reg77 <= (8'h9e);
          reg78 <= ((reg72[(4'h8):(2'h3)] ?
              $unsigned((+wire63[(4'hf):(2'h2)])) : ($unsigned($signed(wire62)) <<< reg70[(1'h0):(1'h0)])) | wire65);
          reg79 <= (wire73 ?
              (wire63[(2'h2):(2'h2)] == $signed(reg70[(1'h1):(1'h1)])) : {$unsigned(((reg77 ?
                          wire67 : wire74) ?
                      (~|wire67) : $unsigned(reg68)))});
          reg80 <= wire63;
        end
      else
        begin
          if (reg69)
            begin
              reg76 <= $signed(reg69);
              reg77 <= reg71;
            end
          else
            begin
              reg76 <= (~(~reg68[(4'h8):(2'h2)]));
              reg77 <= $unsigned((~&$signed(wire74)));
              reg78 <= $signed($unsigned(reg80));
              reg79 <= $signed(wire75);
            end
          reg80 <= (($unsigned(reg68) << $unsigned((&$unsigned(wire74)))) ?
              reg71 : (((~|$unsigned(wire74)) ?
                      (wire67[(1'h1):(1'h1)] ?
                          $unsigned(reg68) : (8'hb1)) : ((^~reg71) ?
                          $signed(wire66) : reg68[(3'h7):(2'h2)])) ?
                  {($signed(wire74) ?
                          reg68[(5'h10):(4'h8)] : (~^wire64))} : {$signed((wire65 ?
                          wire61 : reg72)),
                      $signed($unsigned(wire61))}));
          if (reg71[(3'h4):(2'h3)])
            begin
              reg81 <= (~&($signed(reg69) ?
                  $unsigned($unsigned((reg69 ?
                      reg69 : reg70))) : $signed((|$unsigned(reg76)))));
              reg82 <= wire62;
              reg83 <= reg76[(3'h5):(3'h5)];
              reg84 <= wire62[(1'h0):(1'h0)];
              reg85 <= {$signed(reg82)};
            end
          else
            begin
              reg81 <= (~&reg71[(2'h2):(2'h2)]);
              reg82 <= (($unsigned(reg79[(4'he):(3'h4)]) != $unsigned(reg83)) & reg77[(5'h12):(4'hd)]);
              reg83 <= {$unsigned(reg76),
                  ((!((~&reg82) ? $unsigned(reg85) : (reg79 >> wire65))) ?
                      $signed($unsigned((wire63 ? reg85 : reg85))) : wire73)};
              reg84 <= ((^~$unsigned($unsigned($unsigned(wire74)))) ?
                  (~&({$signed((8'haf)),
                      {reg70,
                          reg84}} ^~ reg78[(3'h7):(3'h4)])) : wire66[(1'h1):(1'h1)]);
            end
          if ((((&((~&wire73) ? (reg84 < (8'hb2)) : $signed((8'haa)))) ?
              wire67[(2'h2):(1'h0)] : (reg77 ?
                  reg81[(2'h3):(2'h3)] : ((reg85 > reg78) ?
                      (reg82 ?
                          (8'h9e) : wire74) : reg71[(1'h0):(1'h0)]))) * {(!wire65[(1'h1):(1'h0)]),
              $signed(reg77)}))
            begin
              reg86 <= $unsigned(reg85);
              reg87 <= $unsigned((8'ha0));
            end
          else
            begin
              reg86 <= (^~$signed(reg71));
              reg87 <= ({(reg77 ?
                          (^{wire66, (8'hb4)}) : (reg78 ?
                              reg82[(1'h1):(1'h0)] : $signed((8'haf)))),
                      reg87} ?
                  $signed({(~^$unsigned(reg70)),
                      (^~$signed(reg87))}) : (wire73 ?
                      ($signed((reg78 <<< (8'ha4))) ~^ reg86) : $unsigned({$signed(wire73),
                          wire64[(1'h0):(1'h0)]})));
              reg88 <= reg69;
            end
        end
    end
  assign wire89 = wire75;
  assign wire90 = $unsigned((8'ha0));
  assign wire91 = reg68[(4'hf):(4'hc)];
  assign wire92 = ({$unsigned($signed({reg85}))} >> reg83[(2'h2):(1'h1)]);
  assign wire93 = (~&$signed(wire65[(3'h4):(3'h4)]));
  assign wire94 = wire63[(1'h0):(1'h0)];
  assign wire95 = reg83[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg96 <= (^~reg72);
      reg97 <= $signed($signed(reg80[(1'h1):(1'h0)]));
      reg98 <= reg77[(2'h3):(1'h0)];
    end
endmodule

module module45
#(parameter param56 = (({(~^{(8'hbd), (8'hb6)})} != (((~(8'hac)) == (^(8'ha8))) >> (((8'haa) && (8'hac)) <<< {(8'ha3)}))) != {((8'h9d) ? (~^((8'ha9) ? (8'haf) : (7'h44))) : (((8'h9e) && (8'hb1)) ? ((8'haf) ? (7'h40) : (8'hb3)) : (8'hba))), ((((8'hbc) + (8'hba)) <<< (8'h9e)) >> ({(7'h42), (8'ha0)} ? (^(8'hab)) : (8'hb9)))}))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire50;
  input wire [(5'h12):(1'h0)] wire49;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  assign y = {wire55, wire54, wire53, wire52, wire51, (1'h0)};
  assign wire51 = (((|(~$unsigned(wire48))) ^ wire48[(3'h5):(3'h4)]) >>> (wire47[(3'h5):(2'h3)] ~^ (wire49 ^ (wire47 >= wire47[(4'hf):(2'h2)]))));
  assign wire52 = (|($signed(({wire48} & (+wire47))) ?
                      {wire49[(4'hf):(4'h8)]} : {wire48[(2'h2):(1'h0)]}));
  assign wire53 = $signed($signed(((wire52 ?
                      wire46[(2'h3):(2'h3)] : $signed(wire47)) > {(wire49 <<< (8'ha4))})));
  assign wire54 = ($unsigned($unsigned((!(!(8'hb3))))) && wire47[(2'h3):(2'h2)]);
  assign wire55 = wire47;
endmodule

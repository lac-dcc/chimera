module top
#(parameter param270 = (~&(((&((8'h9f) ? (7'h42) : (8'ha0))) >>> (|{(8'hb8), (7'h42)})) ? {(((8'h9e) ? (8'ha1) : (8'hbb)) ? ((8'h9e) ? (8'hb9) : (8'hbd)) : ((7'h40) ? (8'hb6) : (8'haf))), {{(8'ha1), (8'hb9)}}} : (8'ha4))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire255;
  wire [(2'h2):(1'h0)] wire254;
  wire [(4'h8):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire252;
  reg [(3'h5):(1'h0)] reg269 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg267 = (1'h0);
  reg [(4'hc):(1'h0)] reg266 = (1'h0);
  reg [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(3'h7):(1'h0)] reg264 = (1'h0);
  reg [(5'h12):(1'h0)] reg263 = (1'h0);
  reg [(4'ha):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg261 = (1'h0);
  reg [(4'he):(1'h0)] reg260 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg259 = (1'h0);
  reg [(4'h9):(1'h0)] reg258 = (1'h0);
  reg [(3'h4):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  assign y = {wire255,
                 wire254,
                 wire31,
                 wire32,
                 wire33,
                 wire47,
                 wire49,
                 wire50,
                 wire252,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3;
      if (($unsigned((((wire0 ? (8'hbe) : wire2) ^~ $signed(wire1)) ?
              wire3 : ($signed(wire2) ? $unsigned(wire3) : $signed(wire0)))) ?
          reg5[(3'h4):(2'h2)] : $unsigned($signed(wire4))))
        begin
          reg6 <= (({$signed($signed(wire0))} ?
                  wire2[(1'h0):(1'h0)] : $unsigned($signed(((8'hb3) ?
                      (8'ha4) : wire3)))) ?
              wire3 : $signed({$unsigned({wire2, wire4}), (wire2 <= (7'h43))}));
        end
      else
        begin
          if ((wire2 ^ $signed(({{reg5}, (wire3 ? wire2 : (8'haa))} ?
              reg5[(1'h0):(1'h0)] : $unsigned(wire3[(2'h2):(2'h2)])))))
            begin
              reg6 <= wire2[(3'h7):(1'h1)];
              reg7 <= reg6;
              reg8 <= (wire1[(4'ha):(1'h1)] ?
                  wire2[(3'h7):(1'h0)] : $signed(((-wire0[(2'h3):(2'h3)]) >= wire1)));
              reg9 <= ((((7'h42) <<< {(~|wire0), (wire0 ? wire1 : wire2)}) ?
                      wire4[(4'hc):(2'h2)] : (7'h44)) ?
                  {{{{reg7}},
                          $unsigned(reg6[(4'he):(2'h3)])}} : $unsigned(reg5[(1'h1):(1'h1)]));
              reg10 <= (^~$unsigned(reg5[(1'h1):(1'h0)]));
            end
          else
            begin
              reg6 <= reg8;
              reg7 <= (wire1 ^~ (^~$signed({$unsigned(reg10)})));
              reg8 <= $signed((~|(wire1[(2'h2):(1'h0)] ?
                  $signed(reg5) : wire4[(3'h7):(3'h4)])));
            end
          reg11 <= {$unsigned(reg5[(2'h2):(2'h2)]),
              ($signed($signed({wire4, (8'ha7)})) ?
                  wire1[(2'h3):(2'h3)] : $signed(($unsigned(wire1) ?
                      (reg7 <= (8'haa)) : (|reg7))))};
          reg12 <= ($unsigned($unsigned($signed($signed(wire0)))) != wire2[(2'h2):(1'h0)]);
        end
      if (reg7)
        begin
          if ((8'h9d))
            begin
              reg13 <= $unsigned({wire1[(2'h2):(1'h0)], reg8});
            end
          else
            begin
              reg13 <= ({($signed((reg5 + reg5)) ?
                          $unsigned(reg6) : {$signed(reg8),
                              ((7'h42) ^~ (7'h40))})} ?
                  reg11[(3'h6):(2'h3)] : $unsigned($signed(({reg11} >> wire0))));
              reg14 <= wire4[(3'h7):(3'h5)];
              reg15 <= reg8;
            end
          reg16 <= (-(|((8'hb0) ? reg8 : $signed($unsigned(wire2)))));
          if ((((((reg16 + wire3) ? {reg12, reg13} : reg14[(2'h3):(2'h2)]) ?
                      $unsigned(reg15) : {(reg7 ^~ wire3),
                          (wire1 ? reg8 : reg14)}) ?
                  ({$unsigned((7'h43))} ^~ (-(reg10 & (8'hbe)))) : (wire4 ^~ ($signed(reg8) ?
                      (wire1 ? reg9 : reg13) : wire1[(4'hd):(3'h6)]))) ?
              reg16 : wire2))
            begin
              reg17 <= (((-$signed((&reg14))) ?
                      $signed(wire3) : (+{$unsigned(reg11)})) ?
                  reg10 : $signed((reg8 ~^ reg16[(5'h14):(2'h2)])));
              reg18 <= $unsigned(reg13[(1'h1):(1'h0)]);
            end
          else
            begin
              reg17 <= $signed((reg5[(1'h1):(1'h0)] * (reg13[(1'h1):(1'h0)] ~^ $signed({reg5}))));
            end
          reg19 <= $unsigned($signed(reg15[(3'h4):(3'h4)]));
        end
      else
        begin
          reg13 <= (((reg15 ?
                  $signed(reg6[(4'hb):(4'hb)]) : (^reg10[(2'h3):(1'h1)])) && ($signed(((8'had) > reg18)) ?
                  $signed({wire3}) : (8'ha5))) ?
              ((^((wire0 ? reg10 : reg13) ?
                  reg6[(5'h14):(3'h6)] : (reg15 < reg6))) >>> ((~^wire0[(4'h8):(1'h0)]) ?
                  (|$signed(wire0)) : ((^wire4) <= reg16[(4'h9):(3'h7)]))) : reg19);
          if (((^(-reg13[(1'h0):(1'h0)])) > (|reg15[(2'h3):(2'h3)])))
            begin
              reg14 <= reg16;
              reg15 <= $unsigned({reg8[(3'h4):(2'h2)]});
              reg16 <= $unsigned($signed((^((^~wire2) ?
                  reg18[(4'ha):(3'h7)] : wire4[(4'hd):(2'h2)]))));
              reg17 <= ({(((~&reg14) > $signed(wire0)) > {reg15})} <= $unsigned((((reg8 <= (8'ha8)) ?
                      reg8 : $signed(reg11)) ?
                  reg17 : ($signed((8'hb7)) - (^~reg18)))));
              reg18 <= reg14;
            end
          else
            begin
              reg14 <= (|$signed((!$unsigned(reg12[(2'h2):(1'h1)]))));
              reg15 <= (~&(reg8[(3'h5):(3'h4)] == reg19));
            end
          reg19 <= $signed((reg18[(1'h1):(1'h0)] & ($signed(reg9[(3'h7):(3'h5)]) >>> $signed({reg12}))));
        end
      reg20 <= (8'ha9);
      reg21 <= (!{(-$unsigned($signed(reg8)))});
    end
  always
    @(posedge clk) begin
      reg22 <= {{reg8}};
      reg23 <= $signed(reg18);
      reg24 <= $signed($unsigned($unsigned(reg11[(4'h8):(3'h4)])));
      if ({({(reg8 ? $unsigned(reg22) : reg11[(4'ha):(1'h1)]),
              (7'h41)} >= $unsigned($signed(reg10[(4'h8):(2'h2)]))),
          $unsigned(reg22)})
        begin
          reg25 <= $unsigned(reg24);
          reg26 <= reg20[(4'hb):(2'h3)];
        end
      else
        begin
          if (reg18)
            begin
              reg25 <= ($unsigned((8'h9c)) <<< ($signed(($unsigned(reg5) ?
                  $signed(reg13) : (8'hae))) <= reg22[(1'h1):(1'h1)]));
              reg26 <= (reg6[(3'h5):(3'h5)] == reg26);
              reg27 <= reg16[(5'h11):(4'hf)];
            end
          else
            begin
              reg25 <= $unsigned($unsigned(reg11));
              reg26 <= ($unsigned($unsigned(reg23[(4'h8):(2'h3)])) ?
                  (^{({(8'hb6)} ? $signed((8'ha7)) : reg6),
                      $unsigned((^~reg16))}) : wire3[(2'h2):(1'h1)]);
              reg27 <= {(8'hb7)};
              reg28 <= reg12;
              reg29 <= ($unsigned($unsigned((|$signed((8'h9d))))) ?
                  (8'hbb) : reg23[(3'h4):(2'h2)]);
            end
        end
      reg30 <= $unsigned((^~$unsigned((reg28[(1'h1):(1'h1)] ^ (-reg27)))));
    end
  assign wire31 = (((reg17 || $unsigned(reg6[(4'hc):(4'hc)])) >= {(reg20 ?
                              $signed((8'hbb)) : $unsigned(reg16))}) ?
                      $unsigned((7'h42)) : reg20);
  assign wire32 = (8'hab);
  assign wire33 = $signed($unsigned(wire1[(4'h8):(1'h1)]));
  module34 #() modinst48 (wire47, clk, wire32, wire31, reg27, reg25, reg8);
  assign wire49 = ((+($unsigned((wire2 ?
                      reg16 : reg26)) > ({wire0} <= reg25[(4'he):(4'hc)]))) ^ (($unsigned({reg16}) ^ {(-(8'had))}) ?
                      (^~(&(reg11 ?
                          (8'ha2) : (8'hbe)))) : reg17[(2'h3):(2'h2)]));
  assign wire50 = $unsigned((^~$signed(wire1)));
  module51 #() modinst253 (wire252, clk, reg27, wire4, reg28, reg14, reg8);
  assign wire254 = (($unsigned($signed($unsigned((8'h9e)))) + ({{wire1, reg18},
                           reg9} ?
                       reg8[(3'h4):(1'h1)] : (~$unsigned(wire47)))) | $signed(({(7'h41),
                       $unsigned(reg27)} | (~&(&wire32)))));
  assign wire255 = {($signed({$signed(reg11)}) != reg8[(4'hf):(4'ha)]),
                       {(~(~|reg27))}};
  always
    @(posedge clk) begin
      if ($signed(((+(reg27[(4'ha):(3'h7)] < $signed(reg24))) < (((~|(8'ha9)) >= (reg15 ~^ reg20)) + wire255[(3'h4):(2'h2)]))))
        begin
          reg256 <= $signed($signed((^~$signed((reg11 & reg12)))));
          reg257 <= reg23[(3'h7):(1'h0)];
          reg258 <= ($unsigned((wire31[(2'h3):(2'h3)] ?
              $unsigned(reg21[(3'h6):(1'h0)]) : (wire31[(3'h4):(1'h0)] ~^ (reg6 ?
                  (8'ha8) : reg256)))) != wire255);
        end
      else
        begin
          reg256 <= reg10;
        end
      if (((&$signed(reg17)) ? reg13 : wire2[(3'h5):(2'h3)]))
        begin
          reg259 <= (|reg8);
          reg260 <= {$signed($unsigned($unsigned($signed(reg29)))),
              {(|reg15),
                  (reg17[(4'hd):(4'hb)] ?
                      ({wire2} <= (reg16 ?
                          (8'hab) : wire3)) : reg16[(5'h10):(3'h7)])}};
          reg261 <= reg20[(3'h7):(3'h6)];
          reg262 <= {$signed(reg14),
              ((+wire252[(2'h2):(2'h2)]) ?
                  (wire4 < $signed(wire50[(4'h9):(1'h1)])) : wire32)};
          reg263 <= ($unsigned((wire252 ?
              (8'hba) : ((reg11 & wire47) >= wire254))) ^ (+$unsigned((^$signed(reg30)))));
        end
      else
        begin
          reg259 <= ((^~({(reg16 ? wire47 : reg27), reg11} <<< wire49)) ?
              ((wire31[(2'h2):(1'h0)] ?
                      reg7[(2'h3):(1'h0)] : (+reg23[(3'h7):(3'h4)])) ?
                  $unsigned((reg8 >> (~&reg20))) : ({reg14[(1'h0):(1'h0)],
                      reg8} >>> $unsigned($unsigned(wire255)))) : (reg13 ?
                  wire255[(2'h2):(1'h1)] : (reg19[(4'hd):(2'h3)] * $unsigned(wire254[(1'h1):(1'h1)]))));
          reg260 <= (($unsigned(({reg14} * {(8'ha3),
              reg29})) <<< $unsigned({reg256[(3'h5):(3'h5)],
              $signed((8'hb2))})) == reg23[(4'h9):(2'h2)]);
          reg261 <= (reg261[(4'hd):(4'h8)] ?
              $signed((^(~reg261))) : reg12[(1'h1):(1'h1)]);
          if (({$unsigned(((-reg19) ?
                  $signed(reg7) : (&wire252)))} * $signed($signed(($unsigned(reg17) ?
              ((7'h44) ? reg8 : reg258) : (reg21 ? wire1 : reg262))))))
            begin
              reg262 <= (((^wire49) ?
                      (wire255[(3'h6):(3'h5)] > (|{wire49,
                          reg260})) : reg16[(4'hd):(4'hb)]) ?
                  $signed(reg18[(4'ha):(3'h5)]) : $unsigned((((reg12 & reg5) ?
                          {wire47} : $unsigned(wire255)) ?
                      (wire33 > $signed(reg25)) : wire1)));
              reg263 <= {({(~|reg24)} ? wire49 : reg7),
                  $signed(((7'h42) == reg256[(3'h4):(1'h1)]))};
              reg264 <= {reg7};
              reg265 <= (-reg8);
            end
          else
            begin
              reg262 <= (^~$unsigned((~&reg265[(3'h4):(1'h0)])));
              reg263 <= $signed($signed($unsigned($signed($unsigned((8'h9f))))));
              reg264 <= (reg18 >= wire47[(4'hb):(3'h7)]);
            end
        end
      reg266 <= wire47[(4'ha):(1'h1)];
      reg267 <= $signed((($unsigned({(8'haf), reg30}) ?
              $signed(reg12) : ({reg16, reg27} ?
                  wire0[(3'h4):(1'h1)] : ((8'hbd) ? reg28 : reg21))) ?
          {($unsigned(reg266) ?
                  (wire32 ? reg7 : (8'hb6)) : ((8'hb3) ?
                      reg260 : reg259))} : (8'hb0)));
      if ((!($signed(wire47) ? reg15[(1'h1):(1'h1)] : reg29[(3'h6):(3'h5)])))
        begin
          reg268 <= {wire254[(2'h2):(2'h2)]};
          reg269 <= (8'hab);
        end
      else
        begin
          reg268 <= $unsigned($unsigned(($unsigned({reg29, wire2}) ?
              wire252 : ({reg269, reg29} * (!reg25)))));
          reg269 <= $unsigned(reg259);
        end
    end
endmodule

module module51  (y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire56;
  input wire signed [(5'h12):(1'h0)] wire55;
  input wire [(5'h11):(1'h0)] wire54;
  input wire [(5'h10):(1'h0)] wire53;
  input wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire250;
  assign y = {wire143,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire58,
                 wire57,
                 wire145,
                 wire159,
                 wire250,
                 (1'h0)};
  assign wire57 = ({$signed((((8'ha3) ? wire53 : (7'h42)) != $signed(wire56))),
                      ($unsigned($signed(wire54)) ^ ((wire53 >> wire52) ?
                          (wire53 ?
                              wire54 : (8'h9c)) : {wire53}))} ^~ (~|{((~wire55) ?
                          (&wire56) : wire55)}));
  assign wire58 = (wire53[(4'hf):(4'ha)] ? (^(|$unsigned(wire57))) : (8'haa));
  module59 #() modinst91 (wire90, clk, wire54, wire55, wire56, wire52);
  assign wire92 = $signed($unsigned(wire58[(2'h2):(1'h0)]));
  assign wire93 = (((&(8'ha4)) - $signed(wire55[(3'h5):(3'h5)])) == $signed({((wire53 ?
                          wire54 : wire55) & {wire53}),
                      {wire92, (~(8'hb0))}}));
  assign wire94 = (-wire53[(3'h6):(3'h5)]);
  assign wire95 = {($unsigned(($signed(wire92) | (&wire53))) ?
                          (&$unsigned(((8'hb9) ?
                              wire54 : wire55))) : $signed((-{wire93,
                              (8'hb7)})))};
  assign wire96 = $signed(wire57[(4'h8):(4'h8)]);
  assign wire97 = wire93;
  module98 #() modinst144 (wire143, clk, wire93, wire55, wire94, wire95, wire97);
  assign wire145 = ((((wire54 <<< wire97) ?
                       $unsigned(wire143) : (^~(-wire143))) == wire93) + $signed($signed(wire95)));
  module146 #() modinst160 (wire159, clk, wire56, wire96, wire55, wire97);
  module161 #() modinst251 (wire250, clk, wire145, wire95, wire57, wire96, wire159);
endmodule

module module34
#(parameter param46 = ({((&((8'ha3) ? (8'ha5) : (8'hbc))) ? (((8'haf) < (8'hb3)) ? ((8'ha7) ? (7'h44) : (8'hae)) : ((8'had) ? (7'h44) : (8'haa))) : {((8'ha6) + (8'hb0)), ((8'hb5) >= (8'ha7))})} ? {(+(-((8'hac) <<< (8'h9e))))} : {((8'ha2) ? (+((8'ha1) ? (8'ha5) : (8'hbe))) : (!((8'h9d) ? (8'hbb) : (8'hac))))}))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire [(2'h2):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  assign y = {wire43, wire42, wire41, wire40, reg45, reg44, (1'h0)};
  assign wire40 = wire35[(1'h0):(1'h0)];
  assign wire41 = $unsigned(($unsigned((~&wire35[(1'h1):(1'h0)])) ?
                      (8'haf) : wire36));
  assign wire42 = $signed(wire37);
  assign wire43 = ((~|((wire36[(4'he):(4'h8)] ?
                          (wire35 & wire41) : (wire42 >> wire37)) ?
                      (((8'hae) | wire39) ?
                          wire36 : {wire42, wire38}) : wire39)) || (8'ha1));
  always
    @(posedge clk) begin
      reg44 <= ((+((^wire40) ?
              wire40[(3'h6):(3'h6)] : ((wire43 ^ wire37) ?
                  $unsigned(wire35) : (~^wire42)))) ?
          wire42[(1'h1):(1'h1)] : wire35);
      reg45 <= {{((wire42 ?
                  (^wire37) : (wire39 ?
                      wire39 : wire37)) > $unsigned((reg44 && (7'h40)))),
              wire37},
          $unsigned(((wire36 ? $unsigned(wire39) : $signed((8'ha2))) ?
              (^~wire43) : (~$signed(wire36))))};
    end
endmodule

module module161
#(parameter param249 = (^((8'hb0) >>> (~&{(&(8'hbf))}))))
(y, clk, wire166, wire165, wire164, wire163, wire162);
  output wire [(32'h3c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire166;
  input wire [(4'he):(1'h0)] wire165;
  input wire [(4'ha):(1'h0)] wire164;
  input wire [(5'h13):(1'h0)] wire163;
  input wire [(4'hb):(1'h0)] wire162;
  wire [(5'h15):(1'h0)] wire248;
  wire [(5'h15):(1'h0)] wire247;
  wire [(4'hd):(1'h0)] wire246;
  wire [(5'h11):(1'h0)] wire245;
  wire signed [(5'h15):(1'h0)] wire244;
  wire signed [(4'he):(1'h0)] wire243;
  wire [(3'h5):(1'h0)] wire238;
  wire [(5'h13):(1'h0)] wire193;
  wire [(5'h11):(1'h0)] wire192;
  wire signed [(3'h5):(1'h0)] wire191;
  wire signed [(4'h9):(1'h0)] wire190;
  wire signed [(3'h7):(1'h0)] wire171;
  wire signed [(4'hf):(1'h0)] wire170;
  wire signed [(3'h7):(1'h0)] wire169;
  wire signed [(4'ha):(1'h0)] wire168;
  wire [(4'h8):(1'h0)] wire167;
  reg [(5'h10):(1'h0)] reg242 = (1'h0);
  reg [(4'hd):(1'h0)] reg241 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg240 = (1'h0);
  reg [(3'h6):(1'h0)] reg239 = (1'h0);
  reg [(5'h13):(1'h0)] reg237 = (1'h0);
  reg [(4'h8):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg235 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg232 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg231 = (1'h0);
  reg [(4'hc):(1'h0)] reg230 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg229 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg228 = (1'h0);
  reg [(4'hc):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg224 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg221 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg220 = (1'h0);
  reg [(4'ha):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg218 = (1'h0);
  reg [(4'hb):(1'h0)] reg217 = (1'h0);
  reg [(4'hb):(1'h0)] reg216 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg213 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg212 = (1'h0);
  reg [(3'h5):(1'h0)] reg211 = (1'h0);
  reg [(3'h5):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg209 = (1'h0);
  reg [(4'hb):(1'h0)] reg208 = (1'h0);
  reg [(3'h7):(1'h0)] reg207 = (1'h0);
  reg [(5'h11):(1'h0)] reg206 = (1'h0);
  reg [(5'h15):(1'h0)] reg205 = (1'h0);
  reg [(3'h4):(1'h0)] reg204 = (1'h0);
  reg [(5'h15):(1'h0)] reg203 = (1'h0);
  reg [(3'h7):(1'h0)] reg202 = (1'h0);
  reg [(5'h13):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg195 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg189 = (1'h0);
  reg [(5'h13):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(4'hf):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  assign y = {wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire238,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
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
                 reg172,
                 (1'h0)};
  assign wire167 = wire165[(1'h0):(1'h0)];
  assign wire168 = $unsigned(wire163);
  assign wire169 = ($signed((((~&wire163) > (wire165 - wire168)) | ((wire165 | wire162) ?
                       $unsigned(wire163) : wire162))) + wire164);
  assign wire170 = wire166;
  assign wire171 = (~|(!({$signed(wire165)} ?
                       $signed({wire168}) : (~(wire168 ? (8'ha4) : wire170)))));
  always
    @(posedge clk) begin
      if ((wire168[(4'h9):(2'h2)] - ($unsigned($signed($unsigned(wire162))) ?
          $unsigned($unsigned({wire169, wire166})) : wire163)))
        begin
          reg172 <= wire165[(3'h7):(3'h5)];
          reg173 <= (8'h9d);
          reg174 <= ((~^({(reg173 && (8'hb1))} >>> {$signed(wire163)})) ?
              $unsigned(($signed((|reg172)) ^~ ((wire170 | wire163) << (-wire162)))) : (!wire164));
          reg175 <= $signed(({{(wire166 ? wire163 : (7'h42))},
              $unsigned(reg172)} != wire167[(1'h0):(1'h0)]));
          if (wire165[(1'h0):(1'h0)])
            begin
              reg176 <= {reg175, (wire168 << reg175)};
              reg177 <= ($signed({(~|((8'ha7) ? (8'haa) : wire168))}) ?
                  wire166[(4'hf):(4'hc)] : ($unsigned(($unsigned(wire171) == (wire164 ?
                          wire171 : wire167))) ?
                      ($signed(reg174[(4'hf):(2'h2)]) >>> $unsigned((-wire164))) : ($unsigned($signed(reg173)) ?
                          (~&(wire169 >>> wire164)) : $unsigned($unsigned(wire162)))));
              reg178 <= (-($signed(wire165) ?
                  ((8'hbb) ?
                      {wire164[(3'h4):(2'h2)],
                          wire168[(4'ha):(3'h6)]} : $unsigned(((8'had) == wire169))) : (wire162 ?
                      ((reg173 ? wire169 : (8'ha3)) ?
                          ((8'ha0) ?
                              reg172 : reg174) : $signed(wire166)) : ((8'hb6) ?
                          (wire162 == wire162) : $unsigned(wire169)))));
              reg179 <= $signed(reg172[(3'h6):(3'h5)]);
              reg180 <= ($signed(($unsigned((reg175 ?
                      reg179 : wire169)) >>> reg172[(3'h7):(1'h1)])) ?
                  $unsigned($unsigned(wire166[(3'h7):(1'h1)])) : ((8'h9e) << (8'haf)));
            end
          else
            begin
              reg176 <= {((^$signed($signed(reg173))) ?
                      $signed($unsigned($signed(wire167))) : (reg175 ?
                          (~|$signed((8'hb1))) : $unsigned(reg178)))};
              reg177 <= $unsigned($signed(((^~{reg173}) ?
                  reg174[(3'h5):(1'h1)] : (~(reg179 ? reg177 : wire164)))));
              reg178 <= ((8'hac) ^ ({$unsigned(reg177[(3'h4):(2'h2)])} ?
                  reg174[(3'h5):(3'h5)] : {$unsigned($unsigned(reg174))}));
              reg179 <= (($unsigned({$signed((8'hac)),
                          wire168[(3'h4):(2'h2)]}) ?
                      ($signed($signed(wire163)) ?
                          $unsigned({wire168}) : (-((8'hb7) && reg173))) : $unsigned($unsigned($signed(reg176)))) ?
                  wire169 : (+((~&wire171[(3'h7):(3'h6)]) ?
                      {$signed(reg175), $unsigned(reg179)} : $signed((wire165 ?
                          wire163 : reg172)))));
              reg180 <= $signed((wire165[(4'hb):(2'h3)] == {{wire165}}));
            end
        end
      else
        begin
          reg172 <= $unsigned(reg176[(2'h3):(1'h0)]);
        end
      if ($unsigned({wire167, $unsigned(wire164)}))
        begin
          reg181 <= wire163[(3'h4):(1'h0)];
          reg182 <= ($unsigned($unsigned((~^{wire170}))) >= (({((8'hac) ?
                          (8'h9c) : reg176)} ?
                  $unsigned(reg180[(1'h1):(1'h0)]) : ((!reg177) ?
                      $unsigned(wire165) : {(8'ha1)})) ?
              reg173[(4'hb):(3'h7)] : reg178[(3'h6):(1'h1)]));
          reg183 <= reg176;
          reg184 <= (+{reg175[(3'h7):(3'h4)]});
          if ($signed(((($signed(wire168) << wire166) & {reg182[(2'h2):(2'h2)]}) ?
              (-wire164[(4'h9):(1'h0)]) : wire168)))
            begin
              reg185 <= wire171;
            end
          else
            begin
              reg185 <= (~^reg176);
            end
        end
      else
        begin
          reg181 <= reg183[(3'h4):(2'h3)];
          if ((^~(wire170[(1'h0):(1'h0)] ?
              $unsigned((^~{wire164, (8'hbc)})) : ((8'ha8) ?
                  (^(wire164 ? (8'hab) : wire164)) : ($unsigned(wire166) ?
                      {reg172, wire163} : {reg183, wire167})))))
            begin
              reg182 <= (-reg172);
              reg183 <= $unsigned((reg173 * {(~$signed(wire165)),
                  $unsigned($signed(wire168))}));
              reg184 <= ($signed(wire167[(3'h6):(3'h4)]) ?
                  $unsigned($signed(($unsigned((8'hb4)) && (~^wire170)))) : $signed(wire165));
            end
          else
            begin
              reg182 <= reg175;
              reg183 <= $unsigned(wire168);
            end
          if (((+reg177) ?
              {(~|($unsigned(wire163) ~^ ((8'hb1) && wire171))),
                  ((|(~|wire163)) > (&{(8'hb2),
                      (8'hb0)}))} : {$signed($signed((reg179 | wire165)))}))
            begin
              reg185 <= wire163[(5'h13):(4'he)];
            end
          else
            begin
              reg185 <= reg185[(4'h9):(3'h5)];
              reg186 <= wire168[(4'ha):(3'h6)];
            end
          reg187 <= ((reg174[(5'h11):(4'hb)] ?
              (reg180 >>> wire170[(2'h2):(2'h2)]) : {wire165[(3'h5):(1'h1)],
                  $unsigned((reg174 <= reg180))}) >>> (|$signed(wire167[(1'h0):(1'h0)])));
          reg188 <= $signed(($signed({reg179, $signed((8'hb7))}) ?
              $unsigned({(+wire169)}) : reg173[(3'h4):(1'h0)]));
        end
      reg189 <= $unsigned(($signed({(reg183 ^~ reg187), $unsigned(reg176)}) ?
          (~(^wire170[(4'h9):(2'h2)])) : (|reg177[(1'h0):(1'h0)])));
    end
  assign wire190 = reg181[(2'h2):(2'h2)];
  assign wire191 = $signed($unsigned((-$unsigned(wire167[(1'h1):(1'h1)]))));
  assign wire192 = ((((|(~^reg186)) ~^ ((wire164 ?
                       (7'h41) : reg177) ^ (~reg184))) >>> ($signed({reg179,
                       reg175}) != $signed((reg187 ?
                       (8'ha5) : reg184)))) == $signed({($unsigned(wire170) && (reg175 ?
                           wire191 : wire190))}));
  assign wire193 = ($unsigned(reg187) ^ $signed({{(reg176 || reg189)},
                       $signed({(8'haf), reg176})}));
  always
    @(posedge clk) begin
      if (($unsigned(wire191) ?
          (^~(($signed((8'ha5)) ? (+reg186) : $signed(wire193)) < ({wire193} ?
              $unsigned((8'hb4)) : (~^wire193)))) : (((-((8'ha0) < reg183)) * (wire192 <= wire164[(3'h5):(1'h0)])) & {(~|reg181[(4'h9):(2'h2)])})))
        begin
          reg194 <= $unsigned((&wire171));
          reg195 <= $unsigned(($signed($unsigned({wire169, reg174})) ?
              wire167 : (8'hae)));
          reg196 <= wire170[(2'h3):(1'h0)];
          reg197 <= {(~(($signed((8'hae)) <= (~reg182)) ?
                  (8'had) : $signed((reg188 ? wire162 : wire169)))),
              ($unsigned(wire170) != {(reg175[(4'ha):(3'h4)] ?
                      $unsigned(reg196) : $unsigned(wire166))})};
          if ((((^wire165[(2'h3):(1'h1)]) ~^ $unsigned($signed((reg181 ?
              reg187 : reg196)))) >>> (reg195 < (!{{reg178}}))))
            begin
              reg198 <= ($unsigned(($unsigned($unsigned(reg175)) ^~ $signed(wire168[(4'h8):(4'h8)]))) & reg194[(3'h5):(1'h1)]);
              reg199 <= $signed(reg177[(4'h8):(2'h2)]);
              reg200 <= $signed(($signed(((~reg173) >> {reg195})) ?
                  {$signed(wire170[(1'h1):(1'h1)]), reg182} : (reg197 ?
                      (8'ha9) : wire193[(1'h0):(1'h0)])));
            end
          else
            begin
              reg198 <= reg179;
              reg199 <= $unsigned({(~|(&(~wire170)))});
              reg200 <= (^$signed(((((8'hb5) ^ reg194) ?
                      $signed(wire165) : (wire192 ^ wire167)) ?
                  $unsigned($signed(wire191)) : reg189[(2'h2):(1'h0)])));
              reg201 <= (reg175 ?
                  (($unsigned((reg183 - wire193)) || (((7'h41) ?
                              reg183 : wire191) ?
                          $signed(wire171) : wire193[(3'h5):(1'h1)])) ?
                      (reg184 ?
                          (|$unsigned((7'h41))) : (~^reg195[(2'h3):(2'h2)])) : {reg176[(1'h0):(1'h0)]}) : (~|{(8'hb7),
                      reg173}));
              reg202 <= reg185;
            end
        end
      else
        begin
          if ((|(!(($signed(reg200) | (wire170 <<< reg198)) ?
              ((~^reg200) ?
                  $unsigned(reg194) : ((8'hb2) ~^ wire163)) : (wire192 >>> reg181[(4'h9):(4'h9)])))))
            begin
              reg194 <= reg182[(2'h2):(1'h1)];
            end
          else
            begin
              reg194 <= ((+(^$unsigned((wire190 && reg186)))) ?
                  $unsigned(reg178) : $signed(((7'h40) ^~ wire168[(1'h0):(1'h0)])));
              reg195 <= $signed((reg183 ?
                  ($unsigned((reg199 + reg184)) ?
                      $signed(wire170[(4'h8):(3'h6)]) : ({reg175,
                          wire167} > (~&reg177))) : wire170[(1'h1):(1'h1)]));
              reg196 <= $signed(($unsigned($unsigned(wire171[(3'h6):(2'h2)])) | wire190[(2'h3):(1'h1)]));
              reg197 <= $unsigned(reg187[(4'hc):(3'h5)]);
              reg198 <= (reg174 ?
                  $unsigned($unsigned((&wire191[(1'h1):(1'h1)]))) : (reg174 ?
                      $signed($unsigned(reg180)) : reg188));
            end
          if ((((wire170 ?
                      (|(wire169 >> wire170)) : ((wire171 ^~ wire168) == ((8'hb7) >= wire193))) ?
                  ((reg185 <<< reg183) ?
                      ((&wire170) ? $signed(reg194) : {(8'hb9)}) : {(wire166 ?
                              wire169 : reg185),
                          reg202}) : wire168) ?
              reg188[(2'h2):(2'h2)] : ({($unsigned(reg198) > (reg176 - wire166))} > (($signed(reg174) ?
                      $signed(reg187) : reg180[(3'h4):(3'h4)]) ?
                  $signed($signed((8'h9e))) : ({reg181, reg181} ?
                      (reg201 ? wire166 : reg180) : (wire162 ?
                          reg186 : reg180))))))
            begin
              reg199 <= reg181;
              reg200 <= ($unsigned(reg177) ?
                  reg184[(3'h4):(1'h0)] : (+$signed($unsigned(wire191))));
              reg201 <= (8'ha6);
              reg202 <= {wire164};
              reg203 <= (8'hab);
            end
          else
            begin
              reg199 <= wire171[(3'h6):(1'h0)];
              reg200 <= ($unsigned(reg202) + $signed((~|(~reg182))));
              reg201 <= $signed((reg187 ?
                  $signed($signed($signed(wire191))) : reg174));
            end
        end
    end
  always
    @(posedge clk) begin
      reg204 <= (&(((-reg189) + (reg186 ?
          (~&reg177) : $unsigned(reg178))) ^ reg180[(4'he):(4'he)]));
      if ($unsigned((&$signed($unsigned(reg176[(1'h0):(1'h0)])))))
        begin
          if ((wire162[(1'h0):(1'h0)] != ($unsigned(wire190[(1'h0):(1'h0)]) ?
              (8'ha2) : ((8'h9c) ?
                  (7'h40) : (wire162[(3'h6):(2'h2)] ?
                      (reg177 >>> reg175) : (~|(8'hac)))))))
            begin
              reg205 <= $unsigned(wire168);
              reg206 <= (!($signed($unsigned((reg180 ?
                  reg185 : reg178))) * (((-wire168) >>> reg199[(2'h2):(1'h0)]) ?
                  {(wire190 | (8'hbc)), $unsigned(reg185)} : wire162)));
              reg207 <= $signed((~&$signed(reg189[(3'h5):(2'h2)])));
              reg208 <= ((+{(wire167 ?
                          $signed(reg186) : (reg179 >>> reg174))}) ?
                  $unsigned($signed(reg182)) : reg200);
              reg209 <= wire166;
            end
          else
            begin
              reg205 <= (((($unsigned(wire162) >= (wire171 ? reg206 : reg202)) ?
                      {(reg207 << reg208),
                          wire167} : ({(8'hb2)} == {wire170})) ?
                  reg181 : (|((reg200 ^~ reg175) ~^ (reg205 >>> reg176)))) == {reg187,
                  $unsigned((8'hbe))});
              reg206 <= {$signed($unsigned(((-reg186) ?
                      reg202[(1'h0):(1'h0)] : (8'ha4))))};
              reg207 <= $unsigned((-reg178[(3'h4):(3'h4)]));
              reg208 <= ({($unsigned(reg175) ?
                      $unsigned((reg204 ^~ reg206)) : ((wire164 != wire168) & {reg203,
                          wire168}))} <= ({((reg208 ? wire171 : reg205) ?
                          reg172[(1'h1):(1'h1)] : (reg203 > wire193)),
                      $unsigned((reg209 ? reg189 : (8'ha6)))} ?
                  $unsigned($signed(((8'hb8) ?
                      wire165 : reg197))) : $signed(($unsigned(reg196) ?
                      ((8'hab) ^ reg207) : $unsigned(reg203)))));
            end
          reg210 <= $signed($signed($unsigned((8'haa))));
          reg211 <= (reg175[(3'h5):(1'h1)] ?
              $signed($unsigned((+reg207))) : reg210);
          reg212 <= (^~(!(~&$unsigned((^~reg201)))));
        end
      else
        begin
          reg205 <= $signed({$signed((wire166 ?
                  $signed((8'h9f)) : reg206[(3'h6):(3'h6)])),
              ((reg178 ? (reg208 ? (7'h40) : reg181) : ((8'ha1) * reg204)) ?
                  $signed(reg210[(2'h2):(1'h1)]) : $signed({(8'hbf)}))});
          reg206 <= ((8'ha8) & $unsigned(reg176));
          reg207 <= $unsigned((reg206[(4'h9):(4'h8)] || (8'ha8)));
          reg208 <= wire167;
          if ((~|wire166))
            begin
              reg209 <= $unsigned($unsigned($unsigned($signed($unsigned((8'hb9))))));
              reg210 <= (($unsigned(reg194) || (~&reg194)) ?
                  (&(reg194 ?
                      $signed((reg211 > (8'ha0))) : (reg205[(3'h7):(3'h7)] ?
                          reg173[(2'h3):(2'h2)] : {(8'h9c),
                              wire167}))) : wire169[(3'h7):(3'h7)]);
              reg211 <= (+{reg196, reg173[(4'h9):(3'h5)]});
              reg212 <= $unsigned((~^reg200));
            end
          else
            begin
              reg209 <= ({reg201[(1'h0):(1'h0)], $signed(reg179)} ?
                  (reg173 ?
                      $signed(reg197[(1'h0):(1'h0)]) : reg212[(1'h0):(1'h0)]) : $unsigned($unsigned((~&(8'hb6)))));
              reg210 <= ((wire168[(4'h8):(2'h2)] & {(reg188 ^ wire171)}) && ((($signed(reg189) - ((8'hbe) ^ reg177)) ?
                  wire167[(3'h6):(1'h1)] : ((reg186 < wire169) ?
                      wire165[(3'h7):(1'h1)] : (reg183 ?
                          reg186 : (8'h9e)))) >>> ((8'had) ?
                  (~&reg200[(3'h6):(2'h3)]) : $signed(((8'h9f) > (8'hb3))))));
              reg211 <= ($signed($unsigned((reg196[(3'h7):(3'h7)] > reg184))) ?
                  (~&wire190[(2'h3):(2'h3)]) : ($unsigned(((reg180 ?
                      wire171 : reg174) != reg198[(4'h9):(3'h5)])) == $signed(reg200[(2'h2):(1'h1)])));
              reg212 <= ((~&((reg186[(2'h2):(2'h2)] | (reg196 ?
                          reg184 : reg179)) ?
                      ((wire169 ? reg178 : reg187) > (wire192 ?
                          reg206 : reg204)) : $signed(reg199[(2'h3):(2'h3)]))) ?
                  $unsigned((^$unsigned(reg172))) : reg185[(2'h2):(1'h0)]);
            end
        end
      if ($signed(reg188[(4'h8):(3'h5)]))
        begin
          reg213 <= $signed($signed((|reg203[(5'h13):(3'h4)])));
          if ((|((((wire169 + reg201) >= (8'hbf)) ?
              {(reg199 ?
                      reg180 : wire166)} : $unsigned((~wire192))) + $signed(reg198))))
            begin
              reg214 <= reg200[(4'ha):(3'h6)];
            end
          else
            begin
              reg214 <= wire170[(4'hb):(1'h1)];
            end
          if (reg199[(1'h0):(1'h0)])
            begin
              reg215 <= (^~(reg195[(1'h1):(1'h0)] ?
                  ((~|(reg174 ?
                      reg187 : reg194)) ~^ reg188) : reg184[(2'h3):(1'h1)]));
            end
          else
            begin
              reg215 <= (!$unsigned($unsigned(wire192)));
              reg216 <= $unsigned(wire193[(4'hd):(4'h8)]);
              reg217 <= reg173[(3'h5):(3'h5)];
              reg218 <= reg205;
              reg219 <= (^$unsigned((~&(reg185 * reg208))));
            end
          reg220 <= $signed((!($signed(reg197[(4'h9):(1'h1)]) > $unsigned((wire163 ?
              reg180 : (8'h9f))))));
          reg221 <= ((-{wire190[(3'h7):(3'h4)],
              (~$signed(reg180))}) & wire192[(2'h2):(1'h1)]);
        end
      else
        begin
          if ((reg205 ~^ wire165[(4'ha):(3'h4)]))
            begin
              reg213 <= (reg178 <= $signed((-reg184[(3'h4):(3'h4)])));
            end
          else
            begin
              reg213 <= (8'ha3);
              reg214 <= (({(reg184 ? (reg174 + reg203) : $unsigned(reg214)),
                      $signed(reg217)} || (wire165 != (reg200 ?
                      $unsigned(reg188) : wire191))) ?
                  {((reg207[(3'h5):(3'h5)] ?
                          $unsigned(reg212) : wire192) <<< $signed(((7'h41) ?
                          reg196 : reg212)))} : reg213);
              reg215 <= (({(^((8'h9f) ? reg201 : reg213)),
                      reg187[(5'h11):(1'h1)]} == reg181) ?
                  $signed($signed((reg219[(1'h1):(1'h0)] ^~ {reg179}))) : reg181[(2'h2):(2'h2)]);
              reg216 <= $signed((wire167[(2'h3):(1'h0)] ?
                  (~^reg221) : $signed(((~^reg206) + reg215))));
            end
          reg217 <= $unsigned(reg172);
          reg218 <= {(reg173[(4'hd):(4'h9)] >> (({wire193,
                  reg206} - $signed(reg211)) >> $unsigned($unsigned(wire192)))),
              {((((8'ha0) ? (8'hb0) : reg175) ?
                      (7'h43) : reg189[(3'h4):(2'h3)]) || reg187[(2'h2):(1'h1)]),
                  ((^(+(8'hb5))) >> ((!reg203) ?
                      {reg204} : (reg196 != wire170)))}};
          if ({((8'hb4) ?
                  ($unsigned({reg216,
                      reg210}) << reg218[(3'h7):(1'h1)]) : {reg213[(1'h1):(1'h1)]}),
              ($signed((+(8'ha4))) == $unsigned((~|$signed(reg208))))})
            begin
              reg219 <= reg174[(4'hd):(2'h3)];
              reg220 <= $signed(($unsigned($signed($unsigned(wire191))) ?
                  reg198 : (((&reg213) ?
                          (reg209 ~^ (8'hbe)) : $signed((8'hab))) ?
                      ((reg196 ?
                          reg212 : reg203) >>> $unsigned(reg184)) : (reg206[(4'hc):(3'h5)] ?
                          (reg183 ?
                              reg214 : reg189) : reg209[(1'h0):(1'h0)]))));
              reg221 <= reg207;
              reg222 <= $unsigned(reg209);
              reg223 <= reg187[(1'h1):(1'h1)];
            end
          else
            begin
              reg219 <= wire167;
              reg220 <= ($signed((^~wire163[(3'h7):(1'h0)])) ?
                  ({$unsigned($unsigned((8'ha1))),
                      (8'hae)} * $signed(($unsigned(wire166) & $unsigned(reg208)))) : wire171);
            end
          reg224 <= $unsigned({$unsigned({(8'hb6)})});
        end
      if ((8'ha4))
        begin
          reg225 <= (!(~^reg216[(3'h5):(1'h0)]));
          reg226 <= ($unsigned((8'h9d)) ?
              wire190 : $unsigned({((~&(8'hbe)) ?
                      reg189[(3'h6):(3'h5)] : (+reg189)),
                  ($signed(wire165) ? $signed(wire192) : (reg201 < reg175))}));
          reg227 <= reg221[(1'h1):(1'h1)];
          reg228 <= $signed($signed((~$signed(((7'h44) ^ wire171)))));
          if (reg172)
            begin
              reg229 <= reg216[(1'h0):(1'h0)];
              reg230 <= $unsigned(reg223);
              reg231 <= (8'ha4);
              reg232 <= {(reg189 ^ {reg207, (~(reg198 ? reg214 : reg227))})};
              reg233 <= $unsigned($signed((^(8'h9f))));
            end
          else
            begin
              reg229 <= reg178;
              reg230 <= $signed(reg231[(2'h2):(2'h2)]);
              reg231 <= (+($signed(($unsigned(reg232) != reg233)) ?
                  $signed($signed((reg187 ?
                      reg174 : (8'hb2)))) : reg188[(4'he):(2'h3)]));
              reg232 <= $signed({($signed((~reg173)) ?
                      $signed(reg208[(3'h7):(2'h2)]) : $unsigned((~|wire163)))});
            end
        end
      else
        begin
          reg225 <= ({{(&{reg213})},
              (($signed(reg209) ? $unsigned(reg223) : (~|(8'hae))) ?
                  reg202[(3'h5):(3'h4)] : $signed($unsigned(reg189)))} ~^ reg218[(2'h3):(2'h3)]);
          reg226 <= $unsigned(reg199);
          reg227 <= $unsigned((~&{reg205}));
          reg228 <= (^reg182[(1'h1):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      if ((|reg194[(4'ha):(3'h5)]))
        begin
          reg234 <= (&$unsigned($unsigned((^~$signed(reg207)))));
          reg235 <= {(reg211[(3'h5):(1'h1)] >>> ((|$signed(reg210)) ?
                  reg208 : (((8'ha1) >>> reg187) ?
                      {reg206} : $signed(wire169))))};
          reg236 <= (~&(({reg180} ?
              {$signed(reg188),
                  (reg210 | reg187)} : reg220) >>> {(wire166[(4'h9):(1'h1)] ?
                  reg222[(1'h0):(1'h0)] : $unsigned(wire163)),
              reg209}));
          reg237 <= reg177;
        end
      else
        begin
          reg234 <= $signed(reg179);
        end
    end
  assign wire238 = ((~^{reg195,
                       reg221}) ~^ ($unsigned($signed(reg189[(2'h2):(1'h1)])) ?
                       (reg208 != (~&(reg225 ? reg226 : reg178))) : (|reg218)));
  always
    @(posedge clk) begin
      reg239 <= $unsigned((wire171[(3'h7):(3'h5)] ?
          $unsigned($signed(reg207[(1'h0):(1'h0)])) : $unsigned($unsigned(reg178[(2'h3):(2'h2)]))));
      if (wire165)
        begin
          reg240 <= ($signed((((wire191 ? reg184 : (8'h9f)) ?
                      (reg213 == (8'h9e)) : $signed(wire169)) ?
                  $unsigned($unsigned(reg208)) : (7'h43))) ?
              (reg208 == $unsigned(reg216)) : $unsigned($unsigned(($signed(reg210) <<< wire171[(3'h4):(2'h2)]))));
          reg241 <= reg222[(2'h2):(1'h1)];
          reg242 <= reg237[(4'hd):(2'h2)];
        end
      else
        begin
          reg240 <= $unsigned($unsigned($signed(reg240[(4'hc):(4'ha)])));
        end
    end
  assign wire243 = reg185;
  assign wire244 = {reg203[(4'ha):(1'h1)]};
  assign wire245 = reg180[(2'h3):(2'h2)];
  assign wire246 = wire193[(5'h13):(4'h8)];
  assign wire247 = wire167[(2'h3):(1'h0)];
  assign wire248 = reg226[(5'h13):(3'h5)];
endmodule

module module146
#(parameter param158 = (~&((-(((8'ha9) >> (8'ha0)) ? (~(8'ha2)) : (~^(8'ha4)))) > {({(8'hb0), (8'hae)} << ((7'h40) < (8'hb9)))})))
(y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire150;
  input wire [(2'h3):(1'h0)] wire149;
  input wire signed [(5'h12):(1'h0)] wire148;
  input wire signed [(5'h13):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire151;
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  assign y = {wire157,
                 wire152,
                 wire151,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire151 = ($unsigned(wire147[(5'h11):(4'hc)]) == $signed(wire147[(3'h6):(1'h1)]));
  assign wire152 = (~^$signed($signed($signed((wire149 ? wire151 : wire151)))));
  always
    @(posedge clk) begin
      if ({$unsigned(wire149), {$signed(wire150), $signed(wire151)}})
        begin
          reg153 <= (|{$signed((wire152[(3'h4):(1'h0)] ?
                  (wire148 ? wire148 : wire149) : $signed((8'hae))))});
        end
      else
        begin
          reg153 <= wire149;
          reg154 <= {{wire150[(3'h4):(1'h1)], (!wire147[(4'h8):(3'h4)])},
              (reg153[(4'hb):(3'h5)] ?
                  $unsigned($signed(wire147[(2'h2):(1'h0)])) : (($signed((8'hb0)) * (&reg153)) != (~^(wire147 * wire151))))};
          reg155 <= $unsigned(reg154[(5'h11):(4'he)]);
          reg156 <= wire149[(2'h3):(2'h3)];
        end
    end
  assign wire157 = $signed($unsigned(wire148[(1'h1):(1'h1)]));
endmodule

module module98  (y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire103;
  input wire signed [(3'h4):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  input wire signed [(5'h11):(1'h0)] wire100;
  input wire signed [(4'ha):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire139;
  wire [(3'h5):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  reg signed [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire121,
                 wire116,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
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
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg115,
                 reg114,
                 reg113,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg104 <= $signed(wire99[(4'h8):(1'h1)]);
      if ((^(8'hab)))
        begin
          if ((($unsigned((~&$signed(wire100))) && (wire101 != wire102[(1'h0):(1'h0)])) - wire100))
            begin
              reg105 <= ({{((reg104 == (8'hb4)) ?
                              $signed(wire99) : $unsigned(wire101))}} ?
                  $unsigned((($signed(wire99) ?
                          reg104[(1'h1):(1'h1)] : reg104[(1'h1):(1'h0)]) ?
                      ($signed((8'ha4)) ?
                          (reg104 ? wire99 : (8'h9d)) : (wire101 ?
                              wire103 : (8'ha8))) : wire102[(1'h0):(1'h0)])) : wire103);
              reg106 <= ($unsigned(($unsigned($unsigned(wire99)) | $signed(wire100[(5'h10):(4'hf)]))) ^ $signed({reg105[(3'h4):(2'h2)],
                  wire101[(3'h4):(2'h2)]}));
              reg107 <= $unsigned(reg105);
            end
          else
            begin
              reg105 <= $signed(wire103[(4'hb):(2'h3)]);
              reg106 <= (7'h42);
              reg107 <= ($signed((!((reg104 ?
                  reg104 : reg107) >= (wire102 || wire100)))) != $signed((({reg107} ?
                  (!reg104) : (-wire99)) && reg105[(2'h3):(1'h1)])));
            end
        end
      else
        begin
          reg105 <= (-wire100);
        end
      reg108 <= wire99[(4'ha):(3'h5)];
    end
  assign wire109 = $unsigned($unsigned($signed(((8'hbc) ^ (+wire100)))));
  assign wire110 = (~|$signed(($signed($signed(reg107)) ?
                       wire100[(5'h11):(4'h8)] : ((reg107 ^~ reg105) ?
                           $signed(wire99) : $unsigned((8'hb1))))));
  assign wire111 = $unsigned((($signed(((8'h9f) ?
                           reg105 : wire103)) + reg104[(2'h3):(1'h0)]) ?
                       (((wire100 ^ reg106) ? wire110 : $unsigned(reg104)) ?
                           ((wire109 ?
                               reg105 : wire109) & $unsigned(reg108)) : ($unsigned(reg107) ?
                               wire103 : (&reg104))) : $signed((wire103[(4'ha):(3'h5)] || wire100))));
  assign wire112 = ((8'hbd) ?
                       reg104[(3'h7):(3'h5)] : $unsigned((reg106 ?
                           ((~|(8'ha1)) > $unsigned(reg107)) : wire99[(4'ha):(3'h5)])));
  always
    @(posedge clk) begin
      reg113 <= (({wire111} ? reg107[(4'hd):(4'hc)] : (|wire110)) * wire99);
      reg114 <= $unsigned($signed(($unsigned({(8'ha4), reg106}) ?
          ((wire110 ? reg105 : reg108) && reg105) : $unsigned(wire109))));
      reg115 <= (^~$signed($unsigned(wire99)));
    end
  assign wire116 = $unsigned(wire100[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      reg117 <= $signed($unsigned((^~$signed({reg115}))));
      reg118 <= ((reg114[(3'h4):(1'h0)] || wire103[(3'h7):(3'h4)]) ?
          ((($unsigned(wire110) ?
              (8'ha3) : (reg115 ?
                  wire101 : (8'ha8))) || wire99[(4'ha):(3'h7)]) + ((^{reg106,
                  reg113}) ?
              {(^reg108)} : $signed(((8'ha2) ?
                  reg104 : wire101)))) : {$signed(wire103[(3'h7):(3'h6)]),
              {(8'hb5), $signed(reg114)}});
      reg119 <= (-$unsigned((!reg105[(3'h7):(3'h6)])));
      reg120 <= ($unsigned((^{(~&reg105)})) != $signed($signed($signed((^~reg117)))));
    end
  assign wire121 = wire102[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg122 <= ((($unsigned((wire111 ?
          wire112 : reg104)) * wire110) - reg108[(4'h9):(1'h0)]) + ($unsigned(reg107[(3'h6):(3'h4)]) ?
          wire102 : $unsigned($signed(wire102))));
      reg123 <= $signed(reg122[(3'h4):(1'h1)]);
      reg124 <= $signed($unsigned($unsigned(({reg117,
          reg117} != $unsigned(wire121)))));
      if ($unsigned(wire121))
        begin
          reg125 <= reg107;
        end
      else
        begin
          reg125 <= $unsigned(reg104[(3'h5):(2'h3)]);
          if ({wire112,
              ((reg108 ?
                  (~&$unsigned(wire112)) : reg115[(4'ha):(3'h5)]) | (^~(reg122[(3'h5):(1'h0)] >= (reg113 ?
                  reg113 : reg123))))})
            begin
              reg126 <= $unsigned((reg122[(2'h3):(2'h3)] >> ($unsigned($unsigned(wire101)) ?
                  reg105 : reg104[(1'h0):(1'h0)])));
              reg127 <= ((~&wire112) <= {wire110[(2'h2):(1'h1)]});
            end
          else
            begin
              reg126 <= {(^reg104), $unsigned(wire111[(3'h5):(1'h1)])};
              reg127 <= $signed((!($unsigned($signed(reg125)) ?
                  wire109 : $unsigned({reg115}))));
              reg128 <= (-($signed(reg122) ?
                  wire101[(3'h4):(2'h3)] : (^(|(+(8'ha6))))));
            end
          reg129 <= wire111;
          if ((((($signed(wire121) | wire99) ?
                  {((8'hb2) >= wire112)} : ($unsigned(wire121) ?
                      $signed(reg129) : (reg125 >> (7'h42)))) ~^ {reg107[(3'h6):(3'h5)],
                  (((8'h9d) ? (8'hb4) : wire121) ?
                      reg128[(3'h5):(2'h2)] : (~&(8'hba)))}) ?
              (-wire121[(2'h3):(1'h0)]) : reg123[(4'ha):(3'h4)]))
            begin
              reg130 <= ((~(reg115[(3'h5):(2'h2)] ?
                  (reg123 << reg120) : reg105[(2'h3):(2'h3)])) == wire99[(4'h9):(4'h9)]);
              reg131 <= (+wire99[(3'h7):(3'h4)]);
              reg132 <= ((($unsigned(wire100) != ((reg108 || reg130) >> (&reg107))) & {{{reg108,
                              wire102},
                          wire100},
                      wire99[(2'h3):(2'h2)]}) ?
                  $signed(wire103[(4'h9):(3'h6)]) : {(({reg113,
                              (7'h43)} && wire121[(2'h2):(1'h1)]) ?
                          reg127[(2'h2):(2'h2)] : ($signed(reg107) ?
                              $unsigned(reg105) : (reg104 - reg115))),
                      ((reg117 > reg119[(2'h3):(1'h1)]) ?
                          (reg118[(3'h6):(1'h1)] ?
                              (reg115 || reg113) : (8'ha1)) : reg106)});
              reg133 <= (wire111 >> $signed($signed(reg105)));
            end
          else
            begin
              reg130 <= reg117[(4'h8):(3'h7)];
              reg131 <= reg114[(4'he):(4'he)];
              reg132 <= {(wire110 < (((reg113 >> wire121) ?
                      (&wire121) : $signed(reg117)) >= wire121[(1'h0):(1'h0)])),
                  reg125};
              reg133 <= (8'hb4);
            end
          if ((~&$signed(($signed((reg119 | wire101)) || reg123[(4'hb):(4'ha)]))))
            begin
              reg134 <= wire111;
              reg135 <= ($unsigned($signed(reg118)) == wire100[(4'he):(4'ha)]);
              reg136 <= wire116;
              reg137 <= $unsigned(($unsigned(((&reg130) - wire121[(2'h2):(1'h1)])) * reg107));
            end
          else
            begin
              reg134 <= (~|(wire102[(1'h0):(1'h0)] > reg128[(3'h5):(2'h3)]));
            end
        end
      reg138 <= (&(!(^~$unsigned((reg137 ? reg129 : wire112)))));
    end
  assign wire139 = (((reg113[(2'h2):(1'h0)] < ($signed(reg125) ?
                           ((8'h9c) != reg120) : reg137)) ~^ reg113[(3'h7):(3'h4)]) ?
                       wire109[(4'ha):(2'h3)] : (|(((reg115 <<< reg125) + $signed(reg124)) <<< $signed((+reg129)))));
  assign wire140 = $unsigned($signed((8'hb3)));
  assign wire141 = $unsigned((|reg118[(4'ha):(4'h9)]));
  assign wire142 = (~^(reg131[(3'h6):(3'h5)] * $unsigned({$unsigned(wire121)})));
endmodule

module module59
#(parameter param88 = ((({{(8'hbc), (8'haa)}, (^~(8'h9e))} ? (((8'ha1) ? (8'hb0) : (8'ha1)) <<< ((8'h9c) ? (8'ha6) : (8'hbc))) : (((8'h9c) ? (8'haa) : (8'h9d)) & ((8'hbf) == (8'hbe)))) >= (+(8'hbb))) + (((~|(-(8'h9d))) + ((^~(8'hac)) > (~(7'h41)))) != ((^((8'hab) ? (8'had) : (7'h40))) >> ({(8'hb4)} ? ((8'hac) & (8'hbd)) : {(8'hb0)})))), 
parameter param89 = (param88 ? {param88} : param88))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire63;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire [(4'hc):(1'h0)] wire61;
  input wire signed [(5'h12):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire78;
  wire [(4'hc):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire64 = (wire61[(1'h1):(1'h1)] || wire62);
  assign wire65 = wire63[(2'h3):(2'h2)];
  assign wire66 = {$unsigned(($signed(wire63[(3'h6):(2'h2)]) ?
                          wire64[(1'h1):(1'h1)] : $signed({wire64}))),
                      ({(wire61 >= wire60)} | {$unsigned(wire63[(4'ha):(3'h5)]),
                          $unsigned($signed((8'ha9)))})};
  assign wire67 = wire60[(4'hf):(1'h1)];
  assign wire68 = ((8'ha6) ?
                      (~|$signed({wire65,
                          $signed(wire60)})) : ($unsigned(wire67) ^~ wire67));
  assign wire69 = $signed((8'hb5));
  assign wire70 = $signed(wire69);
  assign wire71 = (($signed(({(8'ha9)} ?
                              $unsigned((8'hb5)) : (wire70 != wire69))) ?
                          (~&((~(8'ha4)) ? wire66 : (~&wire63))) : (({wire60} ?
                              wire69[(1'h0):(1'h0)] : (~&wire68)) - $unsigned((wire67 ?
                              wire65 : wire60)))) ?
                      ((~&(wire62 - (wire67 ? wire64 : wire60))) ?
                          (+$signed((+wire65))) : wire61[(4'hb):(3'h5)]) : (^wire62[(1'h1):(1'h1)]));
  assign wire72 = {$signed(wire60)};
  assign wire73 = $unsigned(wire72[(4'hc):(3'h6)]);
  assign wire74 = wire62;
  assign wire75 = ($unsigned(wire61) ? (8'ha3) : (^~(|wire68[(3'h6):(2'h3)])));
  assign wire76 = $signed((wire67 ^ ({((8'haf) ? wire68 : wire67)} ?
                      wire63[(1'h0):(1'h0)] : $signed((8'hba)))));
  assign wire77 = $unsigned((wire75[(2'h2):(1'h1)] ?
                      {(wire68 >>> wire70),
                          (!wire60[(5'h11):(4'hd)])} : wire75[(2'h2):(2'h2)]));
  assign wire78 = ({((~^{wire68}) ? wire71 : $signed(wire76[(5'h11):(2'h3)])),
                          wire76} ?
                      ((~^(|$unsigned(wire70))) << $unsigned(((wire66 ?
                              wire68 : wire77) ?
                          wire65[(3'h4):(1'h1)] : (8'hb1)))) : (wire75[(3'h6):(3'h6)] > (+(!(wire67 ?
                          wire73 : (7'h43))))));
  always
    @(posedge clk) begin
      reg79 <= $signed(wire60[(5'h11):(5'h10)]);
      if ($unsigned(wire62))
        begin
          reg80 <= ((~&({(wire77 ? wire66 : wire74)} ?
              $signed($unsigned(wire72)) : {wire75,
                  (wire64 <<< wire78)})) | wire69);
          if ($unsigned(wire75))
            begin
              reg81 <= reg79[(4'hb):(1'h1)];
            end
          else
            begin
              reg81 <= ($signed($unsigned(((wire77 > wire78) <= wire73[(2'h2):(2'h2)]))) ?
                  ($unsigned($signed((wire76 ? (8'hbd) : reg80))) ?
                      $signed({reg81[(2'h3):(2'h3)]}) : wire68[(3'h4):(3'h4)]) : ($unsigned((~^(wire73 || wire73))) == (~($signed(wire65) ?
                      $signed((8'ha6)) : $unsigned(wire64)))));
            end
          if ($unsigned((8'ha2)))
            begin
              reg82 <= wire66[(1'h0):(1'h0)];
              reg83 <= (8'hbd);
              reg84 <= (~&$unsigned((-$signed($unsigned(wire64)))));
            end
          else
            begin
              reg82 <= ($unsigned($unsigned((+(reg84 <= wire67)))) | wire77[(4'hc):(2'h2)]);
              reg83 <= wire60;
            end
        end
      else
        begin
          reg80 <= wire69[(2'h3):(2'h2)];
          reg81 <= $unsigned({((^$unsigned(reg80)) ?
                  wire70 : ((wire77 ? wire75 : (8'hb2)) ?
                      (wire74 < (7'h42)) : $unsigned(wire63)))});
        end
    end
  assign wire85 = (-{$unsigned($signed((wire62 ? (8'ha8) : wire76)))});
  assign wire86 = (($unsigned((~&wire66[(2'h3):(2'h2)])) ?
                          $signed($signed(wire63)) : ($signed($unsigned(wire74)) < wire70[(1'h0):(1'h0)])) ?
                      ((($unsigned(wire70) & $unsigned(wire77)) <= ($unsigned(wire61) || {wire75})) ~^ wire60[(1'h0):(1'h0)]) : (^~(~^(-$signed(wire63)))));
  assign wire87 = $unsigned($unsigned(((~(reg80 ? wire85 : wire85)) ?
                      $signed((~&reg82)) : (wire71[(3'h4):(1'h1)] >> {wire78}))));
endmodule

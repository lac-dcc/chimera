module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire133,
                 wire131,
                 wire24,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (&((wire0[(2'h3):(1'h1)] ?
                         $signed(wire2[(4'h9):(2'h3)]) : wire4[(4'he):(2'h3)]) ?
                     ($unsigned({wire4}) ?
                         ({wire0} ?
                             $signed((8'ha8)) : (wire0 ^ wire1)) : wire1[(3'h6):(1'h0)]) : wire0[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire4[(4'hd):(4'h9)])
        begin
          reg6 <= wire2[(3'h5):(3'h4)];
        end
      else
        begin
          reg6 <= $signed(wire4[(3'h7):(2'h3)]);
          reg7 <= wire2;
        end
      if (($unsigned(wire0) ?
          $unsigned((|$signed($unsigned(wire2)))) : $unsigned(wire3)))
        begin
          reg8 <= $signed(($signed(wire4[(4'h8):(3'h4)]) <= wire3));
          reg9 <= $signed($signed((!{wire4})));
        end
      else
        begin
          if (((^~$signed(wire3[(4'ha):(3'h5)])) * (~&$signed({(wire2 - reg9),
              reg9}))))
            begin
              reg8 <= (($signed($signed((reg7 ? (8'hbf) : reg7))) ?
                  (reg9 <<< wire5) : ({$signed((8'ha0)),
                          (reg7 ? wire4 : reg8)} ?
                      $signed($signed((8'hbf))) : $signed({wire3,
                          wire0}))) & $signed((~$unsigned($signed(reg8)))));
              reg9 <= $unsigned($unsigned((wire0[(3'h4):(1'h0)] | (^~(&reg6)))));
              reg10 <= (~{($unsigned((wire1 ?
                      reg7 : reg9)) || (|(wire3 <= wire2))),
                  (($unsigned(reg9) + $unsigned(wire5)) ?
                      $signed((wire0 ? reg9 : reg8)) : wire4[(4'he):(4'hc)])});
              reg11 <= wire0;
              reg12 <= (((((wire1 > wire4) ?
                          (wire2 ? wire3 : reg8) : $signed(reg7)) ?
                      ((^~wire4) ?
                          $unsigned(wire4) : (reg11 ?
                              (8'hb6) : wire0)) : wire5) ?
                  $signed((wire2 ? {wire1} : (-reg6))) : (-(reg7 ?
                      ((8'hb2) ?
                          reg7 : wire4) : wire2))) >= (reg7[(3'h5):(3'h5)] ?
                  wire1[(3'h6):(2'h3)] : ($unsigned({wire0}) ?
                      wire2 : $signed((wire2 && reg11)))));
            end
          else
            begin
              reg8 <= reg12;
            end
          reg13 <= $signed({$signed((+reg9))});
        end
      if ((~|(~|{reg12[(4'hc):(4'ha)],
          ($signed(reg11) ? $unsigned(wire2) : $unsigned(reg6))})))
        begin
          if ({(($signed((~^wire4)) ?
                  $signed((wire2 != wire0)) : $unsigned((!(8'h9e)))) >>> reg10)})
            begin
              reg14 <= wire3;
              reg15 <= (($signed({$unsigned(reg6),
                      ((7'h43) ? (8'haf) : reg8)}) ?
                  ((8'hb0) ~^ reg10) : $unsigned(reg12[(2'h2):(2'h2)])) >= $signed($signed((~|$signed(wire4)))));
              reg16 <= (($unsigned(reg15[(1'h0):(1'h0)]) | reg8) + (-reg6[(3'h6):(1'h1)]));
            end
          else
            begin
              reg14 <= wire4[(4'he):(4'ha)];
              reg15 <= reg9[(1'h0):(1'h0)];
              reg16 <= wire5[(4'hb):(3'h5)];
            end
          if (reg9)
            begin
              reg17 <= reg12;
              reg18 <= reg17[(1'h0):(1'h0)];
              reg19 <= ($unsigned($unsigned($signed({wire1, (8'ha0)}))) ?
                  $unsigned($signed(($signed(wire4) <= $signed(reg17)))) : $signed(($signed($signed(reg9)) >>> $unsigned((~|(8'hb3))))));
              reg20 <= $unsigned(reg18[(3'h5):(2'h2)]);
            end
          else
            begin
              reg17 <= reg10;
            end
          reg21 <= $unsigned({reg7[(1'h1):(1'h1)], {$unsigned((-reg14))}});
          reg22 <= (+reg9);
        end
      else
        begin
          if (reg15)
            begin
              reg14 <= {{(((&reg9) == $signed(reg7)) <<< $unsigned($unsigned((8'h9e)))),
                      reg15}};
              reg15 <= (({$signed((~&wire5)),
                      (((8'hbf) ?
                          reg8 : wire5) <= reg22[(2'h2):(1'h1)])} == (+((reg15 ?
                      (8'h9d) : (8'hb9)) | wire2[(3'h6):(3'h6)]))) ?
                  (((reg15[(3'h7):(1'h0)] >= reg19[(5'h13):(4'ha)]) | (reg14 ?
                      ((8'hab) ~^ reg13) : (wire3 <<< reg8))) < (8'hb6)) : (reg9 ?
                      ((~^{reg16}) ?
                          $unsigned((+(8'ha4))) : (~^(reg9 ?
                              reg8 : reg21))) : $unsigned((|(reg7 + wire1)))));
              reg16 <= {$unsigned((reg6[(1'h1):(1'h0)] ?
                      {{reg13},
                          ((8'ha6) | (8'hae))} : $unsigned($signed(reg20))))};
              reg17 <= (reg19 ?
                  reg14[(2'h3):(1'h0)] : ((($signed(reg22) >> reg15[(3'h4):(2'h3)]) & $signed(reg20)) ?
                      (wire3[(4'ha):(4'ha)] ?
                          reg17 : reg6[(3'h6):(2'h3)]) : reg15[(3'h4):(3'h4)]));
            end
          else
            begin
              reg14 <= $signed(((reg17 ?
                  reg14 : (((8'ha9) - (8'hb8)) ^~ reg20)) | {$signed(reg7[(2'h2):(2'h2)])}));
              reg15 <= wire3;
              reg16 <= ($signed(reg8[(5'h11):(1'h1)]) ?
                  (($unsigned(reg7[(2'h3):(2'h2)]) << {{reg7}, $signed(reg7)}) ?
                      reg11 : reg12) : reg17);
            end
          reg18 <= $unsigned((reg12 > reg13));
          reg19 <= (~&((reg13 ? (~^$signed(reg20)) : wire0) ~^ ((|(reg17 ?
                  wire4 : wire4)) ?
              reg20[(4'hd):(3'h4)] : reg11[(3'h4):(2'h2)])));
        end
      reg23 <= $unsigned((&$unsigned(((reg22 ? wire3 : (8'h9e)) ?
          (^reg7) : $signed(reg17)))));
    end
  assign wire24 = $unsigned(reg9[(2'h2):(1'h1)]);
  module25 #() modinst132 (.clk(clk), .y(wire131), .wire27(reg16), .wire26(reg14), .wire29(reg13), .wire28(reg6));
  assign wire133 = $unsigned($unsigned(reg16[(1'h1):(1'h0)]));
endmodule

module module25
#(parameter param129 = {(|{(~&(|(8'h9f)))})}, 
parameter param130 = ({{(-{param129})}, ((param129 ? (param129 ? param129 : param129) : (param129 >> param129)) != (8'hb5))} <= {(~&((param129 ? param129 : param129) ? (param129 ? param129 : param129) : {param129, param129})), param129}))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire105;
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire112,
                 wire53,
                 wire31,
                 wire30,
                 wire66,
                 wire67,
                 wire68,
                 wire105,
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
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire30 = (^$signed(($signed($signed(wire28)) | wire28)));
  assign wire31 = (-(~&($signed(wire29) ^~ wire29)));
  module32 #() modinst54 (.clk(clk), .wire37(wire27), .y(wire53), .wire36(wire29), .wire34(wire30), .wire33(wire26), .wire35(wire31));
  always
    @(posedge clk) begin
      reg55 <= wire27;
      reg56 <= {(~(8'hb2)), (|$signed($signed($signed(wire31))))};
      if (wire26[(4'h9):(2'h2)])
        begin
          reg57 <= (((+(reg55 ? (+wire28) : (wire31 ? reg55 : reg56))) ?
                  (+{wire31[(3'h4):(1'h0)],
                      $signed(wire28)}) : (+$unsigned(reg56))) ?
              {(~|$signed($unsigned(wire53)))} : $unsigned(($unsigned($unsigned(wire28)) ?
                  reg55[(5'h15):(4'hd)] : (^~wire31[(3'h5):(1'h0)]))));
          reg58 <= $unsigned((~|$unsigned(($signed((8'ha1)) ?
              $signed(wire29) : wire29[(4'hc):(3'h5)]))));
          reg59 <= wire31;
          reg60 <= $signed({wire31, $signed((~|(reg55 ? wire53 : reg59)))});
          reg61 <= (reg60[(1'h1):(1'h0)] || $unsigned($unsigned((~reg57[(3'h7):(3'h7)]))));
        end
      else
        begin
          reg57 <= ({((+(8'hbe)) ^ $signed($unsigned(wire30)))} >= {(({(8'hb4),
                      wire30} <= (~^reg56)) ?
                  reg55 : $signed((reg57 ? (8'haa) : reg55))),
              reg61[(4'ha):(4'h9)]});
          if ($signed($unsigned(wire28)))
            begin
              reg58 <= reg57[(4'h8):(3'h4)];
              reg59 <= ($unsigned(((((8'ha8) < reg55) ?
                      $unsigned(reg59) : reg59) > ((wire27 ?
                      reg59 : reg57) ^ (reg58 ? wire30 : (8'hb5))))) ?
                  (^$signed({(^~reg58), (reg57 ? reg56 : wire31)})) : {(8'hba),
                      (~|((reg57 ? wire28 : wire53) ?
                          (reg58 ?
                              (8'ha6) : (8'hb8)) : wire27[(3'h4):(3'h4)]))});
              reg60 <= $signed(({reg56,
                  ((reg61 ? (8'hac) : (8'ha3)) ?
                      ((8'ha4) ?
                          reg56 : reg56) : (reg60 == (8'ha9)))} + ({(wire27 + reg57),
                      {wire53}} ?
                  (^~(~&reg56)) : ($signed(reg61) ?
                      wire31[(2'h2):(1'h0)] : (wire53 <<< reg55)))));
            end
          else
            begin
              reg58 <= (((!((~&(7'h43)) ~^ (wire27 ?
                  wire53 : reg56))) ^ (wire53 ?
                  (^~(wire28 ?
                      reg59 : reg59)) : $signed((^~reg60)))) >= (^~reg57));
              reg59 <= $unsigned(($signed($unsigned((reg55 ?
                  (8'hbf) : wire53))) - $unsigned({(!reg60), (|(8'hb0))})));
            end
          reg61 <= wire29[(4'ha):(3'h7)];
        end
      reg62 <= $signed(($signed($unsigned(wire26)) > ($unsigned($signed((8'hb8))) * ((&reg59) ?
          (|reg61) : reg58))));
      if (($signed(reg57[(4'h8):(2'h3)]) != wire26))
        begin
          reg63 <= $signed($signed({$signed($unsigned(reg61)),
              (^~(reg57 ? wire31 : (8'ha8)))}));
          reg64 <= ({(-(reg58 ?
                  reg55[(4'h9):(3'h6)] : reg63))} | (({reg55} ~^ $unsigned((8'had))) ?
              wire26 : ((~|(wire31 >> reg59)) != ((reg62 ? wire29 : wire53) ?
                  {wire31, reg59} : reg56))));
          reg65 <= $signed((~$signed((~$unsigned(reg56)))));
        end
      else
        begin
          reg63 <= reg64[(3'h7):(1'h0)];
          reg64 <= (~&((~^$unsigned((~|reg55))) - (~$signed((~reg61)))));
        end
    end
  assign wire66 = (~^(~(8'hab)));
  assign wire67 = (!reg61[(4'he):(4'hb)]);
  assign wire68 = reg64[(3'h7):(2'h2)];
  module69 #() modinst106 (wire105, clk, reg59, wire66, reg64, reg65);
  always
    @(posedge clk) begin
      reg107 <= $signed((reg61 ? $unsigned($unsigned($signed(reg61))) : reg62));
      if (((($signed($unsigned((8'h9d))) ? (-{wire26}) : wire29) ?
              {$unsigned((reg63 | wire31)),
                  reg59[(4'he):(2'h3)]} : $signed($unsigned(wire68))) ?
          (7'h43) : wire30[(4'hc):(4'hc)]))
        begin
          reg108 <= ((reg62[(4'hb):(4'ha)] ?
                  reg61 : $signed($signed((reg107 ? wire67 : reg65)))) ?
              $signed(wire67) : ((-(reg64 ?
                  $signed(wire66) : (~&reg57))) >= reg58[(3'h7):(2'h2)]));
        end
      else
        begin
          reg108 <= reg64;
          if ($unsigned(((wire27 >>> (^~$signed(wire28))) & (~|$unsigned((~^wire26))))))
            begin
              reg109 <= reg55[(3'h5):(2'h3)];
              reg110 <= wire105;
            end
          else
            begin
              reg109 <= reg58;
              reg110 <= $signed((wire68 ? wire67[(4'hf):(4'hd)] : reg107));
              reg111 <= (($signed($unsigned({wire29})) ?
                  wire105[(1'h1):(1'h0)] : reg108) + ($signed(($unsigned(reg57) ?
                      wire29 : (wire31 ? reg110 : reg57))) ?
                  $unsigned(($signed((8'hbf)) ?
                      ((8'ha7) != wire31) : $unsigned((8'had)))) : $unsigned((reg63[(1'h1):(1'h1)] + (reg107 ?
                      reg62 : reg55)))));
            end
        end
    end
  assign wire112 = reg59[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      reg113 <= reg65[(2'h3):(1'h1)];
      if (({reg109, (+(&reg111[(3'h7):(3'h5)]))} ?
          ($unsigned((reg56[(4'h9):(4'h9)] ? {reg111} : $signed(wire112))) ?
              reg55 : (reg109[(3'h6):(2'h2)] ^~ ((wire112 <<< reg108) ?
                  (wire112 ? wire66 : wire26) : $unsigned(wire31)))) : reg113))
        begin
          reg114 <= $signed($unsigned($signed(((reg59 ? reg55 : (8'hbc)) ?
              (|(8'hb3)) : reg110[(4'hb):(2'h3)]))));
          reg115 <= (reg114[(4'h9):(1'h0)] ?
              {((~&$unsigned(reg111)) ?
                      ({reg58} ?
                          (8'ha9) : wire27) : reg110[(3'h7):(3'h5)])} : $unsigned($unsigned($unsigned((+reg110)))));
        end
      else
        begin
          reg114 <= $unsigned((~reg58[(4'hc):(1'h1)]));
          if (wire28)
            begin
              reg115 <= $signed(reg61[(4'he):(3'h7)]);
            end
          else
            begin
              reg115 <= wire67;
              reg116 <= {(|$signed(reg57))};
              reg117 <= $signed($unsigned((reg59[(4'hf):(1'h1)] ?
                  $signed((wire53 << wire105)) : reg65)));
              reg118 <= wire27[(2'h3):(2'h3)];
            end
          reg119 <= wire30[(1'h0):(1'h0)];
          if ($unsigned((({{reg65},
              reg113[(2'h3):(1'h1)]} << $unsigned((+reg64))) & (8'hb3))))
            begin
              reg120 <= ($signed(((wire105[(3'h4):(1'h0)] ?
                          (-wire30) : reg113) ?
                      ((reg58 || reg64) & {wire66, reg116}) : $unsigned((reg55 ?
                          wire30 : reg65)))) ?
                  $unsigned(({wire31[(2'h3):(2'h2)],
                      (^(7'h43))} << $signed({(8'hb4)}))) : ((reg58[(3'h6):(1'h0)] && {(reg109 << (8'hb5))}) ?
                      wire27 : ($signed($signed(reg110)) ? reg65 : (~reg119))));
              reg121 <= ((~&(wire112 ?
                  ($unsigned(wire29) >= $unsigned((8'hba))) : reg109[(3'h7):(2'h3)])) ^~ (~reg114));
              reg122 <= (-$unsigned($signed(wire105[(1'h1):(1'h0)])));
              reg123 <= $unsigned((reg62[(4'h9):(3'h6)] - $unsigned((~&(wire112 >> wire31)))));
            end
          else
            begin
              reg120 <= {($unsigned(($signed(reg116) | (reg57 ?
                          reg121 : (8'ha0)))) ?
                      reg108[(1'h1):(1'h0)] : (reg108[(2'h2):(1'h0)] ?
                          $unsigned(reg108[(2'h2):(1'h0)]) : $unsigned(reg55[(1'h1):(1'h0)]))),
                  $signed($unsigned((~&(^~reg111))))};
              reg121 <= (wire53[(1'h0):(1'h0)] <<< reg116[(1'h0):(1'h0)]);
              reg122 <= $unsigned(reg110);
              reg123 <= (-(~(7'h44)));
              reg124 <= {((((~&reg58) && $signed(wire28)) ^ ((reg58 >> wire31) ?
                      reg64 : $unsigned((8'hb7)))) | ((((8'h9c) ?
                      (8'hb6) : wire112) == reg60) > wire26[(4'hf):(2'h3)]))};
            end
        end
      reg125 <= $signed((wire31[(3'h4):(1'h0)] ?
          (wire66[(3'h5):(3'h5)] <<< (|reg124[(1'h1):(1'h1)])) : $signed((-((7'h40) ~^ reg57)))));
      reg126 <= ($signed((|wire67)) ?
          $unsigned(($unsigned($signed(wire105)) == (reg121 ?
              $signed(wire53) : reg61))) : (($unsigned((reg64 ^ wire29)) ?
                  (~^$signed(reg117)) : $unsigned((wire26 ? reg63 : reg124))) ?
              ($signed($unsigned(reg115)) ?
                  wire31 : {$unsigned(reg108),
                      (^~reg117)}) : (&$unsigned($signed(wire27)))));
    end
  assign wire127 = (&(~|(|reg117)));
  assign wire128 = {$unsigned(reg62[(2'h3):(1'h0)]),
                       $signed($unsigned(wire27[(4'ha):(4'h8)]))};
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire73;
  input wire [(5'h13):(1'h0)] wire72;
  input wire [(5'h11):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire74;
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire83,
                 wire74,
                 reg100,
                 reg99,
                 reg87,
                 reg86,
                 reg84,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire74 = $unsigned($signed(($unsigned((wire72 ? wire71 : wire70)) ?
                      $signed($unsigned(wire71)) : ((wire71 ~^ wire70) | wire73))));
  always
    @(posedge clk) begin
      if (wire72[(2'h2):(1'h1)])
        begin
          reg75 <= ({((~|$signed(wire72)) != wire73[(4'ha):(4'h9)])} ?
              wire72 : wire71[(4'hd):(4'hc)]);
        end
      else
        begin
          reg75 <= $signed((!(((^~wire72) ?
              (wire74 < wire72) : reg75[(2'h2):(2'h2)]) >>> (wire73[(4'h8):(3'h6)] ?
              wire73 : $signed(wire71)))));
          if ((^~{{({wire74, wire72} ? reg75[(3'h5):(1'h0)] : (~^wire71)),
                  ((reg75 ? wire71 : wire71) || wire73[(4'hb):(1'h0)])}}))
            begin
              reg76 <= wire74;
            end
          else
            begin
              reg76 <= ((wire71 ?
                      ((+$unsigned((8'hab))) ?
                          ((reg75 ? (8'hb6) : wire70) ?
                              wire74[(2'h3):(2'h2)] : (wire72 ?
                                  wire73 : wire71)) : reg76[(1'h0):(1'h0)]) : wire72[(4'hf):(4'hd)]) ?
                  (($unsigned((wire71 ?
                      (8'hb2) : reg75)) >>> wire70[(3'h4):(3'h4)]) - $signed(((~wire70) == (wire71 ?
                      reg75 : reg75)))) : (wire71[(4'hf):(3'h5)] ?
                      $unsigned(wire73[(4'hb):(1'h1)]) : wire71[(3'h6):(3'h6)]));
              reg77 <= $signed(($unsigned($signed((wire70 ? wire73 : wire71))) ?
                  $unsigned($signed(wire71[(2'h3):(1'h0)])) : $unsigned($unsigned((^~(8'hb7))))));
              reg78 <= $unsigned(reg76[(3'h4):(1'h0)]);
            end
          reg79 <= ($signed(($signed($unsigned(wire72)) ?
              (reg78[(1'h0):(1'h0)] ?
                  (-reg77) : $signed((8'had))) : ({reg77} ^~ (8'h9d)))) < reg75);
          reg80 <= (!reg75);
          reg81 <= $unsigned((|reg79));
        end
      reg82 <= (+$signed(($unsigned((reg79 ?
          (8'hbb) : reg79)) != wire71[(4'h8):(3'h7)])));
    end
  assign wire83 = $signed((-$unsigned($signed((reg82 ? wire73 : reg77)))));
  always
    @(posedge clk) begin
      reg84 <= (($signed((wire74[(1'h0):(1'h0)] << (wire72 ?
              wire73 : reg79))) > $signed(reg79)) ?
          (reg77[(4'hb):(1'h0)] ?
              (-((wire73 ? wire74 : reg80) ?
                  {reg75} : (wire70 + reg78))) : $signed(reg82[(1'h1):(1'h0)])) : $signed((reg81[(5'h14):(1'h1)] || reg75[(2'h3):(2'h3)])));
    end
  assign wire85 = $unsigned($signed((^~$unsigned({wire72}))));
  always
    @(posedge clk) begin
      reg86 <= ($unsigned($unsigned(wire83[(1'h1):(1'h0)])) < ($unsigned(reg84[(5'h10):(3'h5)]) >= (8'hbc)));
      reg87 <= $signed($signed(($signed(wire73) & {(~reg82)})));
    end
  assign wire88 = (({reg82} ? wire72 : (~&reg82[(1'h0):(1'h0)])) ?
                      reg80[(4'h8):(4'h8)] : $signed($unsigned((&$unsigned(reg78)))));
  assign wire89 = {((&(wire88 ?
                          reg76[(3'h5):(3'h4)] : wire74)) == $unsigned((~$unsigned(reg80)))),
                      wire70[(3'h7):(1'h0)]};
  assign wire90 = $signed($signed(({reg80} ?
                      $unsigned($signed(wire88)) : $signed((~reg81)))));
  assign wire91 = $unsigned($unsigned($signed($unsigned(((8'ha6) ?
                      wire71 : (8'hb8))))));
  assign wire92 = $signed(reg77[(1'h1):(1'h0)]);
  assign wire93 = (|(&$signed($unsigned(reg76))));
  assign wire94 = {$unsigned((+({(8'hac), (8'h9f)} >>> (reg79 <= reg82))))};
  assign wire95 = (reg82[(2'h3):(1'h1)] & (!$unsigned(reg75)));
  assign wire96 = (8'hbd);
  assign wire97 = ($signed({{wire88[(4'ha):(4'h8)], {wire88}},
                      (^wire94[(5'h11):(5'h11)])}) & ($unsigned({wire89}) ?
                      reg84 : wire83[(2'h3):(1'h0)]));
  assign wire98 = wire93;
  always
    @(posedge clk) begin
      reg99 <= ($unsigned($signed($signed((reg79 ?
          wire92 : reg79)))) >> (($unsigned({wire85}) ?
              ((wire97 ? wire95 : wire89) | (wire71 ?
                  reg80 : wire91)) : (8'hba)) ?
          wire89 : {{(!wire71), (wire96 * reg87)}}));
      reg100 <= wire96;
    end
  assign wire101 = $signed((^$unsigned(wire97[(4'h9):(3'h4)])));
  assign wire102 = ((^(^~{(reg77 ? wire85 : wire85),
                       (reg82 < (8'ha9))})) * (reg76 ?
                       $signed(((wire91 ? reg75 : wire85) ?
                           {(8'ha4)} : wire74)) : $unsigned(($signed((8'hb3)) >> (~&reg87)))));
  assign wire103 = {((wire88 ? (wire90 ~^ $signed(wire88)) : wire83) ?
                           (~wire74[(3'h4):(2'h2)]) : {reg77[(1'h1):(1'h1)]}),
                       ((&($signed(wire70) != reg99[(3'h6):(2'h3)])) ?
                           wire96 : $signed(({(7'h43), wire73} ?
                               (wire102 ?
                                   wire92 : wire98) : reg99[(4'he):(3'h6)])))};
  assign wire104 = {(~|{(wire91 << (8'h9f)), wire95[(3'h4):(2'h2)]})};
endmodule

module module32
#(parameter param51 = ((~(!(((8'hbb) ? (8'haa) : (7'h43)) ? ((7'h44) ? (8'ha1) : (8'h9e)) : ((8'hac) << (8'hb7))))) >= ({(((7'h40) ? (8'hbf) : (8'hab)) && {(8'h9e), (7'h42)})} ? (^((^(8'ha8)) ? (|(8'hb7)) : {(8'hac), (8'hb9)})) : (^~(|((7'h41) ? (8'hb9) : (8'ha7)))))), 
parameter param52 = ({((~|((8'hac) ? param51 : param51)) ? {param51, param51} : param51), (8'hb8)} ~^ (param51 ? ({{param51, param51}, {param51, param51}} ^ ({param51, param51} ? (!param51) : {param51})) : ((~|(|param51)) ? (-(param51 ? param51 : param51)) : param51))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire37;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire39,
                 wire38,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire38 = (wire36 ?
                      $unsigned(wire35[(2'h2):(1'h1)]) : ({({wire36} ?
                                  $unsigned(wire37) : (wire35 == wire35)),
                              {{(8'had), wire37}, (wire33 ? wire36 : wire36)}} ?
                          wire37 : $signed($unsigned((&wire37)))));
  assign wire39 = (wire38[(5'h12):(4'h9)] ?
                      wire36 : ((^$signed((wire37 ? wire36 : wire34))) ?
                          wire34[(3'h6):(3'h5)] : ($signed(wire37) ?
                              (wire38[(1'h1):(1'h0)] && wire36[(3'h5):(3'h5)]) : ((~|(8'ha3)) ?
                                  (-wire38) : (wire36 || (8'hb9))))));
  always
    @(posedge clk) begin
      reg40 <= (8'ha4);
      reg41 <= wire36;
      reg42 <= $unsigned(reg40[(4'ha):(4'ha)]);
      if ((^({(wire37 ? ((8'hb5) ? wire35 : wire39) : wire33),
          ((|reg40) ? (reg42 << reg41) : (-reg42))} - (wire37[(4'hb):(3'h4)] ?
          (8'hb5) : reg42))))
        begin
          reg43 <= (+reg40[(4'hc):(3'h6)]);
        end
      else
        begin
          reg43 <= $unsigned($unsigned(((7'h41) * wire37[(2'h2):(2'h2)])));
          reg44 <= (~(((-$signed(wire37)) ?
              wire33 : (!wire36[(3'h6):(3'h6)])) ~^ (-$signed({wire36}))));
          reg45 <= (-($signed(((reg40 <= (8'h9c)) <= (wire36 ?
                  wire38 : wire37))) ?
              {((reg40 ? wire37 : (8'hb4)) ?
                      wire36[(3'h4):(3'h4)] : (wire35 + reg40))} : (+$signed((reg40 == wire34)))));
          reg46 <= {(reg40[(2'h3):(1'h1)] * ({$signed(wire34)} >>> {wire37[(4'h8):(4'h8)],
                  $signed(reg41)}))};
        end
      reg47 <= $signed((8'hab));
    end
  always
    @(posedge clk) begin
      reg48 <= ({reg47, $signed((^reg41[(3'h6):(1'h1)]))} ^~ wire34);
    end
  assign wire49 = $signed($signed(reg47));
  assign wire50 = wire33[(4'hc):(3'h6)];
endmodule

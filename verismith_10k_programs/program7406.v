module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire194;
  wire signed [(4'he):(1'h0)] wire193;
  wire signed [(4'he):(1'h0)] wire192;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire190;
  reg [(3'h5):(1'h0)] reg4 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire192,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire40,
                 wire165,
                 wire190,
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
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~((^~{(wire3 - wire0), $signed(wire2)}) ?
          (8'hb5) : ({(wire0 ? wire2 : wire0), (&(8'ha5))} && ({wire1, wire3} ?
              ((8'hae) + (8'ha3)) : $unsigned(wire3))))))
        begin
          if (wire3)
            begin
              reg4 <= $unsigned(wire0);
              reg5 <= ((~&{reg4[(1'h0):(1'h0)]}) ?
                  $unsigned($signed((wire1 ?
                      (reg4 ?
                          wire2 : wire1) : $signed(wire2)))) : $unsigned($signed(wire3[(3'h7):(3'h5)])));
            end
          else
            begin
              reg4 <= $unsigned((&(!$signed($unsigned((8'ha8))))));
              reg5 <= {($signed(((wire1 ^ wire1) ?
                      {reg4} : reg4)) < (~&(wire0[(1'h1):(1'h0)] ?
                      (wire3 ? reg4 : wire0) : (wire3 || reg5)))),
                  ((7'h41) && (+wire0))};
              reg6 <= ({wire3[(5'h14):(3'h6)]} ?
                  (reg5[(4'h9):(2'h2)] ?
                      (wire3[(5'h12):(5'h10)] || (wire0[(5'h12):(2'h3)] == {reg5})) : $signed(($unsigned(reg5) ?
                          wire2 : $signed(reg4)))) : $signed((wire0[(1'h1):(1'h1)] - wire1[(2'h2):(1'h1)])));
              reg7 <= ((wire0 == wire3[(5'h11):(4'hf)]) ?
                  ($unsigned($signed($unsigned(reg4))) ?
                      $signed($signed((!wire2))) : $unsigned(({wire3,
                          wire2} & reg5[(4'hb):(4'ha)]))) : reg4[(2'h3):(2'h3)]);
            end
          reg8 <= wire3[(4'hf):(4'ha)];
          reg9 <= (($unsigned((+((8'h9c) || wire3))) ?
                  (+$signed((wire2 ?
                      (8'hb0) : reg5))) : $signed(reg6[(1'h1):(1'h0)])) ?
              (^(8'hb5)) : ((reg8[(4'ha):(2'h3)] << $signed(wire3[(4'h8):(3'h5)])) == ($unsigned($signed(reg4)) <= reg8[(1'h0):(1'h0)])));
        end
      else
        begin
          reg4 <= (reg4 ?
              ($unsigned(({wire2, wire0} ? $unsigned(reg6) : $signed(reg9))) ?
                  reg8[(4'hf):(4'h8)] : reg4) : $unsigned($unsigned($unsigned((wire0 ~^ reg6)))));
          reg5 <= ($unsigned((($unsigned(wire3) | (wire1 ?
              reg5 : reg9)) * wire0[(3'h6):(1'h0)])) | ((($signed(reg5) ?
                      {(7'h40), reg6} : wire1[(1'h0):(1'h0)]) ?
                  (~|$signed((7'h40))) : (+{(8'ha6)})) ?
              $signed({reg6[(2'h3):(2'h3)]}) : wire2[(1'h1):(1'h1)]));
          if ((~|$signed(reg4[(2'h3):(2'h3)])))
            begin
              reg6 <= reg6[(1'h1):(1'h1)];
              reg7 <= reg4;
              reg8 <= $signed($signed((^~(~reg5))));
            end
          else
            begin
              reg6 <= wire2;
              reg7 <= $signed(reg8[(2'h3):(1'h0)]);
            end
          reg9 <= reg8;
          reg10 <= $signed(wire2[(1'h0):(1'h0)]);
        end
      reg11 <= (($unsigned(reg6[(3'h5):(2'h2)]) != $unsigned(((wire3 < reg4) ?
              $unsigned(reg10) : (reg10 > (7'h41))))) ?
          wire0 : (-(wire2[(3'h5):(2'h3)] << (~&(&wire1)))));
      reg12 <= reg8;
      reg13 <= reg10;
    end
  always
    @(posedge clk) begin
      reg14 <= (-{wire0[(4'ha):(2'h3)], ((reg7 < (!(7'h41))) ^ (8'hac))});
    end
  assign wire15 = (reg11 || {$unsigned((+(~^wire1)))});
  assign wire16 = wire15;
  assign wire17 = reg10[(1'h0):(1'h0)];
  assign wire18 = $unsigned((8'hb4));
  assign wire19 = (~^(8'ha4));
  always
    @(posedge clk) begin
      reg20 <= ((wire2[(2'h3):(2'h2)] ^~ wire17[(3'h4):(3'h4)]) ?
          $unsigned(($unsigned((!reg10)) * {$signed((8'hbe)),
              reg11[(2'h3):(2'h3)]})) : (~reg5));
      reg21 <= (8'hb7);
    end
  always
    @(posedge clk) begin
      if ((({((wire18 ? wire1 : reg21) * reg10[(2'h2):(2'h2)]),
          wire15} < {$unsigned((reg5 ? reg21 : (8'hb1))),
          reg5}) & (reg8[(4'hd):(4'hc)] << {$signed((reg8 <<< wire0)),
          $signed({reg9, (8'hba)})})))
        begin
          reg22 <= (~&(reg13 ?
              (($signed(wire19) ?
                  (wire0 ? reg20 : wire3) : $signed(reg14)) != $signed({reg6,
                  reg8})) : ((((8'hb4) ? reg10 : reg10) < (reg6 && reg10)) ?
                  $unsigned((wire15 ? reg4 : reg20)) : reg7[(1'h0):(1'h0)])));
          reg23 <= (&wire0[(3'h6):(1'h0)]);
          reg24 <= ((((~&$unsigned(wire1)) >>> ((reg8 <= wire18) ?
                  $signed(reg14) : $unsigned(reg13))) || (8'h9c)) ?
              $unsigned($signed(reg21)) : $unsigned($signed(($unsigned(reg12) ?
                  wire0 : (wire18 ? reg23 : wire18)))));
          reg25 <= ($signed((~|(((8'hae) ?
              reg8 : reg21) - reg7))) ^ ({(wire3[(1'h1):(1'h1)] * $signed(reg6))} ?
              reg4 : (-reg23)));
          reg26 <= reg21;
        end
      else
        begin
          if (((reg12 ?
              reg22[(4'hd):(2'h2)] : $unsigned(((reg25 ?
                  reg6 : reg22) + wire15[(2'h3):(1'h1)]))) || reg8[(1'h1):(1'h1)]))
            begin
              reg22 <= $signed(reg10);
              reg23 <= $unsigned($signed({reg21[(3'h5):(2'h2)],
                  $unsigned(wire15[(3'h4):(3'h4)])}));
            end
          else
            begin
              reg22 <= reg5;
            end
          reg24 <= reg20[(1'h1):(1'h0)];
          reg25 <= $signed(reg6[(1'h1):(1'h1)]);
          reg26 <= ((~&wire2[(2'h2):(1'h0)]) <= (reg9 > $signed(reg7)));
          reg27 <= ((8'ha6) == reg23);
        end
      reg28 <= (($unsigned(((reg20 * reg14) | $signed((8'ha3)))) << reg21[(1'h1):(1'h1)]) ?
          ($signed((^~{wire3})) * ((&{wire2}) ^ wire16)) : (~&((-(wire1 * reg27)) + ((reg27 ?
              (8'hba) : reg10) * (reg27 ? wire18 : wire18)))));
      if (((-(reg4 ^ ((wire16 ?
          wire0 : (8'hba)) ^ $signed(reg28)))) > $signed((-({reg25,
          wire17} ~^ wire17[(1'h0):(1'h0)])))))
        begin
          reg29 <= ((~^$unsigned($unsigned((wire18 == wire1)))) - ((8'hb5) + $signed(($signed((8'hb0)) < (!reg26)))));
          reg30 <= (~|((wire0[(4'hb):(2'h3)] == wire3[(4'ha):(1'h0)]) <<< (~&wire17[(4'h8):(3'h7)])));
          if (wire16[(1'h0):(1'h0)])
            begin
              reg31 <= (reg21[(3'h4):(3'h4)] ?
                  $signed((({reg22,
                      reg25} == $unsigned((8'h9e))) << reg25[(4'h8):(3'h7)])) : $signed(reg14[(2'h2):(2'h2)]));
              reg32 <= ($unsigned(wire16) - (((wire17[(4'h9):(1'h1)] & {wire16,
                          reg28}) ?
                      wire1 : ((reg31 <<< wire1) ?
                          (reg14 ^ reg28) : $unsigned(reg11))) ?
                  $unsigned(wire0) : ({reg21[(3'h4):(2'h3)]} ?
                      $unsigned(wire18) : (~&wire19[(1'h1):(1'h0)]))));
              reg33 <= (((({reg21} ?
                  $signed(reg21) : reg26) | {reg9[(4'hb):(2'h2)],
                  reg30}) <<< ({(wire0 ^ reg13)} < reg13[(3'h6):(2'h3)])) | ($signed(reg6) ~^ ({{reg31}} <<< (reg31 + (~|(8'hb9))))));
              reg34 <= wire3;
            end
          else
            begin
              reg31 <= reg23[(1'h1):(1'h1)];
              reg32 <= reg8;
              reg33 <= $unsigned(({reg7} ?
                  $signed($signed(wire3[(5'h13):(5'h11)])) : reg29));
              reg34 <= $signed(({{reg34[(3'h6):(2'h3)],
                          (reg11 ? reg6 : reg11)}} ?
                  $signed((-$unsigned(reg32))) : {((reg29 ~^ reg6) != (reg25 ?
                          wire1 : wire0)),
                      $unsigned(reg21[(1'h0):(1'h0)])}));
            end
          if ($unsigned($signed($unsigned({{reg12, (7'h41)},
              wire0[(3'h7):(3'h6)]}))))
            begin
              reg35 <= ((|$unsigned({$unsigned(reg13), $signed(wire15)})) ?
                  $signed(reg33) : wire15);
            end
          else
            begin
              reg35 <= (^(((8'hba) ?
                  $unsigned($signed(reg23)) : $unsigned((reg26 ?
                      reg27 : reg12))) > (8'hb0)));
              reg36 <= reg27[(2'h2):(1'h1)];
              reg37 <= ((|wire15) ?
                  $unsigned({reg36[(4'hd):(2'h2)]}) : (wire19[(1'h0):(1'h0)] && (reg10 > $signed((wire3 + wire1)))));
            end
          reg38 <= (8'haa);
        end
      else
        begin
          reg29 <= ((-reg14[(3'h5):(2'h3)]) ? reg37[(5'h13):(2'h2)] : reg26);
          if ($signed((reg27[(2'h3):(1'h0)] < reg9)))
            begin
              reg30 <= $signed(wire15);
              reg31 <= $signed({(8'ha8),
                  ($unsigned((~reg9)) ?
                      ($signed((8'hbd)) ?
                          (reg11 == (8'hb6)) : (wire19 ?
                              wire2 : (7'h43))) : ((8'h9d) + {reg23}))});
              reg32 <= (reg26[(5'h15):(4'ha)] ?
                  ($signed((^~$unsigned(reg6))) ?
                      wire18 : $unsigned($unsigned((reg20 ?
                          reg8 : (8'hac))))) : $unsigned((((reg37 ?
                          reg28 : (8'hbb)) & $unsigned(wire15)) ?
                      $unsigned((~&(8'had))) : (reg34 ? reg34 : reg13))));
            end
          else
            begin
              reg30 <= (reg14 ?
                  (8'h9e) : (($unsigned({reg31}) | (^~reg12[(1'h1):(1'h1)])) ?
                      (((wire18 ~^ reg30) - $signed(reg10)) - (~(reg22 || reg32))) : (|reg25[(3'h4):(1'h1)])));
            end
        end
      reg39 <= (reg23 ? $unsigned((8'ha1)) : reg6);
    end
  assign wire40 = $unsigned((8'had));
  always
    @(posedge clk) begin
      reg41 <= wire15;
      if ({reg12[(1'h0):(1'h0)],
          (~&{(reg10[(2'h3):(1'h0)] ?
                  (reg32 ? reg27 : reg37) : $unsigned(reg29))})})
        begin
          reg42 <= $unsigned(reg12[(2'h3):(2'h3)]);
          reg43 <= reg29;
          reg44 <= $signed((8'ha7));
          if ((({$unsigned($signed(reg22)), (&(wire18 ? (7'h44) : reg7))} ?
                  $unsigned(((reg22 <<< reg10) ?
                      (reg7 ?
                          reg27 : reg20) : reg26[(4'h9):(3'h5)])) : (~(reg14 ?
                      reg34[(1'h0):(1'h0)] : (^(8'hbc))))) ?
              (^$signed((((8'h9d) && reg6) ?
                  (reg23 && reg29) : (reg6 & wire18)))) : (8'hb9)))
            begin
              reg45 <= ({$signed(($signed(reg33) < reg8[(3'h4):(1'h1)]))} ?
                  ((7'h42) ?
                      reg7[(4'hb):(3'h6)] : (^(^~(reg36 ?
                          reg33 : reg38)))) : {$unsigned($unsigned($unsigned(wire19)))});
            end
          else
            begin
              reg45 <= reg23;
              reg46 <= (~&{wire2, wire19[(3'h6):(1'h0)]});
            end
        end
      else
        begin
          reg42 <= $unsigned(((reg13[(3'h4):(1'h0)] == $unsigned(wire2)) - reg34[(1'h1):(1'h0)]));
          reg43 <= reg45[(2'h2):(1'h0)];
          reg44 <= $signed(reg37[(4'h8):(3'h6)]);
          reg45 <= ($unsigned(reg6[(3'h5):(3'h5)]) ?
              ($signed(reg38[(4'hd):(4'h9)]) ?
                  $signed($unsigned(reg45)) : ($signed($signed(reg13)) << {((8'hb6) > reg11)})) : ((wire3 >>> reg7) | $unsigned(((~reg37) ?
                  (^(8'hab)) : (reg5 <= reg36)))));
          reg46 <= (((~|(!{reg37})) ?
                  (wire40[(2'h2):(1'h1)] + ($unsigned((8'hb3)) ?
                      reg4[(1'h0):(1'h0)] : ((8'ha3) ?
                          reg34 : wire18))) : reg41[(4'hf):(3'h6)]) ?
              (-{reg25, {$unsigned(reg25)}}) : reg14[(1'h0):(1'h0)]);
        end
      reg47 <= $signed(reg25[(4'h9):(2'h2)]);
      reg48 <= $signed(((^$signed({(8'ha3), reg11})) ^ ($signed((reg33 ?
              reg26 : reg22)) ?
          ($unsigned(reg43) >= {(8'hab)}) : $signed($signed(reg12)))));
    end
  module49 #() modinst166 (.clk(clk), .y(wire165), .wire50(reg34), .wire52(reg9), .wire51(reg23), .wire53(reg36));
  module167 #() modinst191 (wire190, clk, reg24, reg28, reg46, wire19);
  assign wire192 = $unsigned(reg10[(2'h3):(1'h0)]);
  assign wire193 = (^~$unsigned((~|($unsigned(reg23) ?
                       reg23[(3'h7):(1'h1)] : {reg6}))));
  assign wire194 = (~^reg22);
endmodule

module module167
#(parameter param188 = (~{((!{(8'hbb), (8'h9c)}) ? (((8'ha2) ? (8'hbe) : (8'ha8)) ? ((8'hb8) ^ (8'haa)) : ((8'hb1) * (7'h42))) : (~^(8'hb9)))}), 
parameter param189 = ((((((8'ha1) > param188) >>> (param188 ? param188 : param188)) ? (8'hb2) : param188) && ((param188 ? (param188 != param188) : (param188 || param188)) - {(-(7'h43))})) ~^ (param188 - ({(!(8'hb6)), (param188 ? param188 : (8'had))} && (param188 ? {param188} : (param188 <= param188))))))
(y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire171;
  input wire [(4'hd):(1'h0)] wire170;
  input wire [(5'h10):(1'h0)] wire169;
  input wire signed [(5'h11):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire187;
  wire [(5'h12):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire183;
  assign y = {wire187, wire186, wire185, wire183, (1'h0)};
  module172 #() modinst184 (wire183, clk, wire168, wire169, wire170, wire171, (8'ha3));
  assign wire185 = (wire183 ?
                       (&(~^{{wire170}})) : ($signed(((~wire168) ?
                           wire168[(4'h9):(3'h7)] : (-wire169))) - (((~&wire183) + (wire168 ?
                           wire171 : wire169)) | $signed((wire170 ?
                           wire171 : wire169)))));
  assign wire186 = $signed(wire185);
  assign wire187 = wire185;
endmodule

module module49
#(parameter param164 = (((^~(|(|(8'h9e)))) ? (({(8'hbb), (8'ha1)} ? ((8'ha6) && (8'hbc)) : ((7'h43) | (8'hb9))) * (-((8'hbb) <= (8'ha5)))) : ((((8'hb0) ? (7'h44) : (8'hac)) | {(8'ha3), (8'had)}) ^ ((7'h41) == (!(8'ha5))))) & {(((!(8'hbb)) || ((7'h43) & (8'hbd))) - (((8'hbf) ? (8'hac) : (8'hb1)) > ((8'hb1) ? (8'ha4) : (8'hbe))))}))
(y, clk, wire50, wire51, wire52, wire53);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire51;
  input wire signed [(4'h9):(1'h0)] wire52;
  input wire [(3'h7):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire162;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire87;
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  assign y = {wire162,
                 wire134,
                 wire89,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire64,
                 wire87,
                 reg63,
                 (1'h0)};
  assign wire54 = ($unsigned({(^$unsigned(wire51)),
                      (~(wire50 * wire52))}) ~^ wire52);
  assign wire55 = wire54[(1'h1):(1'h1)];
  assign wire56 = $unsigned(($unsigned(wire50[(3'h5):(1'h0)]) ^ (^(wire53[(3'h7):(2'h3)] ?
                      (wire51 ? (8'haa) : (8'ha7)) : (wire53 * (8'ha2))))));
  assign wire57 = wire51[(3'h6):(2'h3)];
  assign wire58 = (wire57 + wire51[(1'h1):(1'h0)]);
  assign wire59 = wire50;
  assign wire60 = {$unsigned($unsigned(({wire50, wire54} ?
                          ((8'hb2) ? (8'ha9) : wire57) : {wire50, wire51}))),
                      {$unsigned(wire56[(1'h1):(1'h1)])}};
  assign wire61 = (^~((^~{$unsigned((8'hab)), (wire60 | wire55)}) <<< wire56));
  assign wire62 = (wire50 ?
                      $signed($unsigned($unsigned(wire57[(2'h3):(2'h3)]))) : $unsigned({$signed($unsigned(wire58))}));
  always
    @(posedge clk) begin
      reg63 <= wire59[(2'h3):(1'h0)];
    end
  assign wire64 = {wire54, {wire53}};
  module65 #() modinst88 (wire87, clk, wire58, wire57, wire59, wire55, wire51);
  assign wire89 = wire58;
  module90 #() modinst135 (wire134, clk, wire87, wire59, wire55, wire57);
  module136 #() modinst163 (wire162, clk, wire51, wire134, wire87, wire61);
endmodule

module module136
#(parameter param161 = (((~|{(|(8'hb3))}) ? ((8'hb1) ^~ ((7'h43) * {(8'hae)})) : ({(-(8'hb2)), (~&(8'hb9))} ^~ {(~^(7'h43)), ((8'had) ? (8'ha4) : (7'h40))})) ? (8'h9f) : ((((!(7'h40)) ? {(8'hb5), (8'ha8)} : (&(8'hb4))) ^~ {{(8'h9c)}, ((8'hb1) | (8'ha9))}) ^ (&{(~|(8'h9f)), ((8'hbd) ? (8'hb6) : (7'h40))}))))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire140;
  input wire [(4'he):(1'h0)] wire139;
  input wire [(3'h6):(1'h0)] wire138;
  input wire [(4'ha):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(3'h7):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire signed [(4'hb):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire141;
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire141 = $signed($unsigned(({(wire140 ? wire140 : wire137),
                           (&(8'h9e))} ?
                       (|((8'hb9) ? wire137 : wire137)) : (&(wire140 ?
                           wire139 : (8'ha3))))));
  assign wire142 = ({$signed(wire137[(3'h6):(3'h4)]),
                       $unsigned((&$unsigned(wire137)))} ~^ ((+$unsigned($signed((8'hb0)))) ?
                       wire139[(4'ha):(1'h0)] : (8'hb3)));
  assign wire143 = $unsigned($signed(wire138[(2'h3):(2'h2)]));
  assign wire144 = wire140[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg145 <= ((wire144 > ((~^(^wire142)) ?
              (^wire138[(3'h5):(1'h0)]) : (8'hbc))) ?
          $unsigned({(wire137 ?
                  (wire139 & (8'hab)) : wire139)}) : wire142[(3'h5):(2'h2)]);
      reg146 <= wire141;
    end
  assign wire147 = (!((~^($unsigned(wire143) & reg145)) ?
                       $unsigned(($unsigned(wire140) * wire143[(3'h6):(1'h1)])) : (wire139[(3'h4):(2'h2)] <= ($unsigned(wire143) ?
                           $unsigned(wire137) : (wire138 ^ wire138)))));
  assign wire148 = $signed((8'ha0));
  assign wire149 = wire140[(1'h1):(1'h0)];
  assign wire150 = (($signed((^$unsigned(wire148))) ?
                       wire141[(4'h9):(4'h9)] : ($unsigned($unsigned(wire140)) & wire147[(4'ha):(4'h9)])) & {(^~((reg145 | wire137) >>> (wire143 ?
                           wire140 : wire149))),
                       ((^~(~&wire140)) ?
                           (wire141[(3'h5):(3'h5)] | wire148) : $signed((wire139 ?
                               wire147 : reg146)))});
  assign wire151 = ({wire140, $unsigned(wire141[(3'h4):(3'h4)])} ?
                       (reg145[(2'h3):(2'h3)] <= wire138) : wire141[(4'he):(3'h4)]);
  assign wire152 = {wire149};
  assign wire153 = (wire143 ^ wire151[(1'h0):(1'h0)]);
  assign wire154 = $signed(wire141[(4'hd):(4'hc)]);
  assign wire155 = $signed($signed($unsigned((((8'hbe) || wire144) ?
                       ((8'h9e) ? wire144 : wire147) : (wire141 || (8'hb0))))));
  assign wire156 = ({$signed($signed(reg146[(4'h8):(3'h4)])),
                       $unsigned((^(wire147 ?
                           wire154 : wire138)))} || $unsigned(({(wire144 ?
                               wire140 : (7'h42)),
                           wire154} ?
                       {{wire148, wire144}, $signed(wire148)} : ((~(8'ha6)) ?
                           $signed(wire142) : (wire149 ? wire147 : wire144)))));
  assign wire157 = ($signed({wire139, $signed(wire153)}) ?
                       $signed($signed(wire141[(4'hd):(2'h3)])) : (wire142[(2'h2):(1'h0)] && (($unsigned((8'haa)) ?
                           (!wire141) : $signed(wire153)) > ($signed(reg146) ?
                           reg146 : $signed(reg145)))));
  assign wire158 = (((((!wire149) && (wire142 && wire151)) ?
                           ((^wire157) == wire142[(3'h4):(1'h0)]) : (~|(wire152 ?
                               wire150 : wire153))) << wire142[(3'h6):(1'h1)]) ?
                       (wire154[(2'h3):(2'h3)] >> (wire141 < (wire138 < wire151[(4'h9):(1'h0)]))) : $signed((wire149[(4'h8):(1'h0)] ?
                           $signed(((7'h40) << wire139)) : $signed($unsigned(wire139)))));
  assign wire159 = $signed(($signed((wire149 ?
                       (wire153 <<< wire153) : wire138[(2'h2):(1'h1)])) > $signed($signed($signed(reg146)))));
  assign wire160 = wire155[(3'h5):(3'h4)];
endmodule

module module90
#(parameter param133 = (8'hae))
(y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire94;
  input wire signed [(5'h12):(1'h0)] wire93;
  input wire signed [(5'h13):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  assign y = {wire132,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire96,
                 wire95,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire95 = $unsigned($unsigned(wire92[(4'he):(4'hc)]));
  assign wire96 = {wire95[(1'h0):(1'h0)], (+wire93[(5'h12):(4'he)])};
  always
    @(posedge clk) begin
      reg97 <= $unsigned($unsigned(wire91));
      if ($unsigned(wire93))
        begin
          reg98 <= ($unsigned((wire92[(4'hd):(4'hd)] | $signed($unsigned(wire94)))) ?
              wire92 : {$unsigned((~^(wire91 ? (8'ha2) : wire92)))});
          if (($unsigned(wire93) ?
              (wire94[(2'h2):(1'h0)] ?
                  wire93[(1'h0):(1'h0)] : ($signed(wire91) && ((&wire93) ?
                      $unsigned(wire96) : (~|wire93)))) : $signed($signed((wire93[(5'h11):(2'h3)] ?
                  (wire96 ? wire91 : (8'hbf)) : (|reg98))))))
            begin
              reg99 <= $unsigned((((!(~|reg97)) ?
                      {(wire95 <<< wire92), (8'hbe)} : (wire96 <= (wire93 ?
                          wire92 : reg97))) ?
                  reg98 : wire91[(1'h1):(1'h0)]));
              reg100 <= wire96;
              reg101 <= {wire94[(2'h2):(1'h0)],
                  ({$signed((wire92 || wire92))} & (8'had))};
              reg102 <= reg97[(3'h4):(3'h4)];
              reg103 <= $signed(wire93);
            end
          else
            begin
              reg99 <= (((!{reg101[(2'h2):(2'h2)]}) ?
                  (^reg100[(2'h2):(1'h0)]) : $signed(((8'hab) >>> $unsigned(wire95)))) <<< (8'hb1));
            end
          reg104 <= reg102;
        end
      else
        begin
          if ({$unsigned($unsigned(reg104))})
            begin
              reg98 <= wire93[(4'hf):(4'he)];
              reg99 <= (($signed(reg101) ?
                      wire91[(3'h4):(3'h4)] : (($unsigned((8'hb2)) ?
                          (wire95 ^~ wire95) : {wire96}) ^ (8'ha4))) ?
                  $signed((((wire96 ? reg104 : (8'had)) ?
                          $signed(wire95) : (wire91 ? reg101 : (8'hb0))) ?
                      wire91[(1'h1):(1'h0)] : (reg102[(4'hb):(4'h9)] ~^ {reg98}))) : wire96[(4'hd):(4'h9)]);
              reg100 <= ($signed((((~(8'ha4)) << (wire93 ?
                  reg98 : (7'h41))) && (~(wire95 ^~ wire91)))) - {((reg101 ?
                          wire94[(3'h7):(1'h0)] : wire94[(3'h4):(1'h1)]) ?
                      ((8'hb5) ^~ (wire94 ?
                          (8'ha0) : reg101)) : reg103[(5'h10):(3'h4)]),
                  reg101[(4'h8):(3'h4)]});
            end
          else
            begin
              reg98 <= {$signed(reg99[(1'h1):(1'h1)])};
              reg99 <= wire96;
              reg100 <= reg98[(3'h4):(2'h2)];
              reg101 <= (({((wire95 ? reg100 : wire93) ?
                              wire92 : (wire94 ^~ wire96))} ?
                      ((wire93[(5'h10):(1'h1)] >> (reg100 & reg100)) >> wire91) : $unsigned(wire92[(3'h7):(2'h2)])) ?
                  reg98[(4'hc):(4'ha)] : reg101[(3'h6):(2'h3)]);
            end
          reg102 <= reg97;
        end
      reg105 <= $signed(({$unsigned((~|reg101)),
          (~|(reg99 > reg98))} >>> {(reg97[(2'h2):(1'h0)] ?
              $signed(reg103) : wire92)}));
    end
  assign wire106 = ((^~$signed(reg98[(1'h1):(1'h0)])) ?
                       $unsigned(reg104[(2'h3):(1'h0)]) : wire92[(4'hb):(4'hb)]);
  assign wire107 = $signed({$unsigned((&(-wire91))),
                       (reg97 ? reg100 : reg102[(3'h4):(3'h4)])});
  assign wire108 = $signed((~|$unsigned((wire107[(3'h7):(3'h6)] > $unsigned(reg97)))));
  assign wire109 = reg98[(4'h8):(3'h7)];
  assign wire110 = (wire109 ?
                       $signed(wire109[(3'h4):(3'h4)]) : (wire93[(4'he):(4'hb)] < wire94));
  assign wire111 = (&wire109);
  assign wire112 = wire106[(1'h0):(1'h0)];
  assign wire113 = (((({reg102, reg104} <<< (^wire107)) == $unsigned(wire107)) ?
                       ((^~(wire107 + (8'hac))) ?
                           (reg100[(1'h1):(1'h1)] ?
                               (-reg104) : wire91[(3'h5):(3'h5)]) : (8'haf)) : $unsigned((wire106 != wire107[(4'ha):(1'h1)]))) * {$signed($signed($signed(reg99))),
                       (8'ha1)});
  always
    @(posedge clk) begin
      reg114 <= (7'h43);
      reg115 <= $signed((wire106[(3'h4):(1'h0)] || (|(wire107 ?
          $signed(wire111) : (reg98 ? reg100 : reg100)))));
      if ((!{wire94}))
        begin
          reg116 <= $signed(reg104[(3'h7):(3'h4)]);
          reg117 <= {(^(wire112[(4'hf):(4'h9)] <= reg103)), wire111};
        end
      else
        begin
          reg116 <= ((!$unsigned(((8'ha2) >> wire91[(3'h5):(3'h5)]))) ?
              ($unsigned((((8'ha8) ? reg97 : reg100) | (~wire110))) ?
                  {reg116,
                      $unsigned((wire106 ?
                          reg103 : wire108))} : wire111) : wire94);
          if (wire113[(2'h2):(1'h0)])
            begin
              reg117 <= {(&(reg116[(4'h9):(3'h7)] ?
                      wire94[(4'h8):(2'h3)] : (wire94 >>> wire96))),
                  $signed({wire108})};
              reg118 <= ($unsigned({reg99, ($unsigned(reg102) ^ reg117)}) ?
                  {(($signed(reg103) ^ wire96) ?
                          $signed((reg100 ?
                              wire93 : reg103)) : $unsigned((wire92 ?
                              reg105 : reg97))),
                      (^~((^~wire93) ?
                          reg98 : (wire106 ?
                              reg100 : reg103)))} : $signed($signed((wire95[(2'h3):(2'h2)] ?
                      $signed(wire93) : $unsigned(wire108)))));
            end
          else
            begin
              reg117 <= wire96;
              reg118 <= reg116;
              reg119 <= ((($unsigned(wire112) != ((!wire111) ?
                      (^~reg114) : $unsigned(wire112))) ?
                  (($unsigned(wire112) - (-reg102)) ?
                      {(reg97 ? reg101 : wire109),
                          $unsigned(wire111)} : {wire113,
                          (reg105 ?
                              wire113 : (8'ha7))}) : $signed(wire93[(3'h5):(1'h0)])) & (~&$unsigned(((|wire110) != (wire106 ^ reg100)))));
              reg120 <= {$unsigned((((reg99 <= (8'hb3)) | wire112[(3'h6):(2'h3)]) >>> $signed($signed(reg114))))};
            end
          if ({(reg115 ^~ reg102), reg119})
            begin
              reg121 <= {(^~(reg118[(1'h0):(1'h0)] ?
                      ((reg102 ? wire93 : (8'ha0)) <= (reg99 ?
                          reg116 : wire106)) : reg103))};
              reg122 <= reg117[(1'h0):(1'h0)];
              reg123 <= reg114;
              reg124 <= ($signed(reg105) ?
                  ((7'h43) * (|{((8'hb6) >>> wire111),
                      $unsigned(reg105)})) : $unsigned(($signed((~|reg115)) ?
                      ((wire94 >> wire94) ?
                          (~reg115) : reg102) : ((reg97 == reg103) << wire107[(3'h5):(1'h0)]))));
              reg125 <= {((^~($unsigned((8'hae)) ?
                      $unsigned(reg116) : $unsigned(reg102))) >>> $unsigned($unsigned({(8'had)})))};
            end
          else
            begin
              reg121 <= ($unsigned(reg97) ? wire95 : $unsigned(reg122));
              reg122 <= $signed($unsigned(reg102[(3'h4):(1'h0)]));
              reg123 <= (~|($unsigned($unsigned(((8'hac) && wire108))) ?
                  (-wire113[(2'h2):(2'h2)]) : $signed(((+(8'hbb)) ?
                      wire112 : reg97[(3'h7):(2'h3)]))));
            end
          if ($unsigned($unsigned($unsigned(($unsigned(wire108) > (reg116 ?
              (8'h9d) : reg125))))))
            begin
              reg126 <= (reg97[(3'h5):(1'h1)] <= $signed({reg105}));
              reg127 <= (8'hb3);
            end
          else
            begin
              reg126 <= $signed((~(($unsigned(reg122) ?
                      $unsigned((8'ha9)) : (reg123 ? wire108 : wire94)) ?
                  (&{wire92, reg114}) : (((8'hb4) | reg121) * wire95))));
              reg127 <= reg114;
              reg128 <= $unsigned(wire92);
            end
          reg129 <= reg121[(4'h8):(3'h5)];
        end
      reg130 <= $signed(((($signed(wire96) ?
              ((8'ha5) ? reg129 : reg98) : (|reg115)) ?
          (&$signed(reg117)) : ($signed(wire107) ?
              $unsigned((8'hb5)) : $signed(reg119))) >> wire113));
      reg131 <= $unsigned(reg101[(3'h7):(1'h1)]);
    end
  assign wire132 = reg119[(5'h13):(3'h5)];
endmodule

module module65
#(parameter param86 = {{{(8'haf), ((8'hb3) ? ((8'hb3) ? (8'h9e) : (8'hab)) : ((8'ha4) - (8'ha1)))}, (((!(7'h43)) ? ((8'ha9) ? (8'hbf) : (8'ha3)) : ((8'hb9) ? (8'ha9) : (8'hbb))) - ((8'hab) | (!(7'h43))))}, (({((8'ha3) ? (7'h42) : (8'hac))} ? ((8'hb7) ? (~(8'ha1)) : ((8'hb0) ~^ (8'hb4))) : ({(8'hb2)} > ((8'hb6) | (8'hbc)))) || (((^(8'hba)) ? ((7'h40) & (8'ha4)) : {(8'hb1), (8'ha5)}) ? ((^~(8'hb8)) - (8'hab)) : {((8'hb5) ~^ (8'hb9))}))})
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire [(2'h3):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire71;
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire71,
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
                 (1'h0)};
  assign wire71 = wire67[(4'hb):(1'h1)];
  always
    @(posedge clk) begin
      if (wire68)
        begin
          if ((+wire66[(2'h2):(1'h0)]))
            begin
              reg72 <= ($unsigned((&((wire69 ?
                  (8'hb7) : (8'ha9)) <<< $signed((8'hbd))))) | (wire71 <= (wire68[(3'h6):(3'h6)] ?
                  $unsigned((|wire69)) : wire67[(4'ha):(2'h3)])));
              reg73 <= (|$unsigned((-(|reg72[(4'h9):(3'h7)]))));
              reg74 <= $signed(wire71);
              reg75 <= ($unsigned($signed(({wire67} > wire67[(2'h2):(1'h0)]))) <<< wire67[(4'h8):(2'h2)]);
            end
          else
            begin
              reg72 <= wire70[(1'h0):(1'h0)];
              reg73 <= (wire67 != wire68[(4'h8):(2'h3)]);
              reg74 <= ($signed(($unsigned((wire68 ? wire68 : wire71)) ?
                  reg72 : wire67)) ^ (wire70 + ((~^(reg74 ?
                  (8'hb8) : (8'hbf))) >> $unsigned((wire68 || reg73)))));
              reg75 <= {($unsigned(((wire71 ^ (8'ha8)) - (reg74 == wire71))) ?
                      ($unsigned($signed(wire67)) ?
                          ({reg72, reg72} ?
                              wire66 : wire67[(3'h4):(3'h4)]) : (+reg74)) : reg72[(5'h11):(2'h2)]),
                  reg73};
              reg76 <= $signed(($unsigned((wire66[(2'h2):(1'h0)] ^ $unsigned((8'hb6)))) <= ((-(wire69 ?
                  reg73 : wire69)) ^ (8'ha7))));
            end
          reg77 <= (~&(8'ha4));
          reg78 <= reg77;
          reg79 <= $signed($unsigned(($signed((~(8'hbf))) >>> (reg74[(4'hb):(3'h4)] <<< reg74[(3'h4):(1'h0)]))));
          reg80 <= $signed(wire68);
        end
      else
        begin
          if ({wire66[(1'h1):(1'h0)]})
            begin
              reg72 <= $unsigned(reg78[(2'h3):(2'h2)]);
              reg73 <= wire71[(1'h0):(1'h0)];
            end
          else
            begin
              reg72 <= $unsigned(($signed($unsigned($signed(reg75))) ?
                  (~^reg78) : ($unsigned(wire71[(2'h2):(1'h1)]) + reg78[(1'h1):(1'h1)])));
              reg73 <= (~&$signed((!((wire71 ?
                  wire67 : wire69) + $signed((8'ha4))))));
              reg74 <= {(wire66 >= wire69)};
              reg75 <= wire70[(4'hb):(4'h9)];
            end
          if ($unsigned(reg78[(1'h0):(1'h0)]))
            begin
              reg76 <= reg73;
              reg77 <= reg77;
              reg78 <= ((~|(reg77 ?
                  reg73[(3'h7):(3'h4)] : (wire68[(3'h4):(3'h4)] - $unsigned(wire67)))) - (reg78[(1'h1):(1'h0)] ^~ reg75));
              reg79 <= (^~reg74[(4'hb):(3'h5)]);
            end
          else
            begin
              reg76 <= reg75;
              reg77 <= (wire68[(2'h3):(2'h3)] ?
                  $unsigned((~^wire66)) : ($signed(wire69[(1'h0):(1'h0)]) ?
                      $unsigned((~|wire68[(3'h4):(2'h3)])) : reg73[(4'h9):(3'h4)]));
              reg78 <= (+wire69);
            end
          reg80 <= reg77;
          reg81 <= $signed($unsigned($unsigned($signed((reg78 >> wire71)))));
        end
    end
  assign wire82 = wire68;
  assign wire83 = reg74;
  assign wire84 = reg77[(4'hb):(3'h4)];
  assign wire85 = (reg78 ?
                      {$unsigned(((reg79 > reg73) ?
                              (8'h9c) : (~wire68)))} : $unsigned(($unsigned($unsigned(wire84)) ?
                          (-(reg78 ? reg76 : wire69)) : reg80[(1'h0):(1'h0)])));
endmodule

module module172  (y, clk, wire177, wire176, wire175, wire174, wire173);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire177;
  input wire [(5'h10):(1'h0)] wire176;
  input wire signed [(3'h4):(1'h0)] wire175;
  input wire [(2'h2):(1'h0)] wire174;
  input wire signed [(5'h13):(1'h0)] wire173;
  wire signed [(5'h10):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire signed [(5'h14):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire178;
  assign y = {wire182, wire181, wire180, wire179, wire178, (1'h0)};
  assign wire178 = (((~wire175[(2'h2):(1'h0)]) ?
                       {wire174[(1'h0):(1'h0)],
                           (~^(|wire174))} : $unsigned(wire175[(3'h4):(3'h4)])) ^~ ((wire176[(4'ha):(3'h5)] == wire173) ?
                       (wire176 ?
                           wire175[(2'h2):(1'h0)] : $unsigned(wire174)) : wire177[(3'h7):(3'h5)]));
  assign wire179 = {wire176[(4'hc):(2'h3)]};
  assign wire180 = $signed(wire174[(2'h2):(2'h2)]);
  assign wire181 = wire178;
  assign wire182 = $unsigned(wire179[(4'he):(4'h8)]);
endmodule

module top
#(parameter param95 = ({{(((8'hbe) ? (8'haa) : (8'ha2)) ? ((8'hba) ? (8'h9c) : (8'ha4)) : ((8'hb6) ^ (8'ha3)))}} < ({(((8'hb8) ? (8'haa) : (8'ha0)) ? (&(8'hae)) : {(7'h43)})} & ({((8'hb2) <= (8'hac)), ((8'ha4) ? (8'haf) : (8'haa))} == ((8'ha0) & {(8'ha5)})))), 
parameter param96 = param95)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire91;
  wire [(4'hc):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire17,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (&wire4);
  always
    @(posedge clk) begin
      reg6 <= wire4[(5'h12):(5'h10)];
      reg7 <= $unsigned((wire3[(3'h5):(2'h2)] ?
          {$signed($signed(wire0)),
              $unsigned((wire1 ? (8'hb6) : wire5))} : (wire3 < (wire3 ?
              (wire0 ? reg6 : wire0) : (wire4 ? wire1 : wire1)))));
    end
  always
    @(posedge clk) begin
      reg8 <= (|wire0[(4'ha):(1'h1)]);
      if ({(!$unsigned(wire0[(3'h7):(3'h4)]))})
        begin
          reg9 <= {wire2[(4'ha):(3'h4)]};
          if (reg6[(3'h4):(2'h2)])
            begin
              reg10 <= ($signed(reg9) ^~ ($signed($signed((wire2 ~^ wire5))) ?
                  {reg8[(4'h9):(4'h9)]} : wire3));
              reg11 <= $unsigned(((~&reg9) <<< {wire1[(1'h1):(1'h1)]}));
              reg12 <= (~^({((~&wire1) ?
                      wire3 : $signed(reg9))} < $signed((^~$unsigned(reg11)))));
              reg13 <= reg9[(4'hb):(2'h3)];
              reg14 <= wire5;
            end
          else
            begin
              reg10 <= reg9;
              reg11 <= ($unsigned(reg9[(2'h2):(1'h1)]) ~^ {wire1[(4'hc):(4'h8)],
                  (((reg10 * (8'ha4)) + (8'hb3)) + $unsigned({reg14, reg7}))});
              reg12 <= reg6[(2'h2):(2'h2)];
              reg13 <= (-(^~reg12));
              reg14 <= wire1[(4'hd):(4'hb)];
            end
          reg15 <= $unsigned((reg8[(4'hb):(1'h0)] ?
              ($unsigned((wire5 >= reg13)) ?
                  (8'hae) : (((8'hb0) != wire2) ?
                      (wire2 ?
                          wire2 : reg11) : {reg9})) : reg10[(4'ha):(4'h8)]));
        end
      else
        begin
          reg9 <= ($unsigned((&{(~&(8'hb3))})) <= (reg7 << (((wire2 ?
                  reg13 : reg11) ?
              reg14[(4'ha):(3'h4)] : $signed(reg13)) == reg11[(5'h13):(4'h8)])));
          reg10 <= (((((reg7 ?
                      reg7 : reg13) ^ (~wire3)) ^ (reg13[(1'h0):(1'h0)] ?
                      wire0[(3'h6):(1'h1)] : reg12[(2'h3):(2'h3)])) ?
                  (wire5 > {reg9[(3'h4):(2'h2)]}) : (^~($signed(reg14) > (wire4 >> reg12)))) ?
              ($unsigned($unsigned(wire4)) ?
                  (wire5[(3'h6):(1'h1)] | reg15) : wire0[(4'h9):(3'h6)]) : (~&($signed((7'h42)) ?
                  ((^reg11) ^~ $unsigned(wire0)) : $unsigned((^reg9)))));
          reg11 <= $signed((wire0 ?
              ($signed($signed(wire1)) ?
                  $signed((|wire3)) : ((reg7 ? wire5 : reg11) ?
                      reg14[(2'h2):(1'h1)] : wire1[(3'h7):(3'h6)])) : (~reg13[(2'h2):(1'h0)])));
          if (reg6)
            begin
              reg12 <= $signed(($signed(wire0) || reg12[(2'h2):(2'h2)]));
              reg13 <= $unsigned($signed({wire0[(3'h6):(3'h4)]}));
              reg14 <= ((((8'h9e) ?
                      reg9 : (reg6 ? (reg14 ? reg8 : reg8) : reg6)) ^~ reg6) ?
                  {(reg13[(1'h0):(1'h0)] ?
                          wire1[(4'hc):(4'hb)] : ((reg6 ? reg9 : wire3) ?
                              $signed(reg8) : wire5[(4'h8):(2'h3)])),
                      $signed({(wire3 ?
                              wire3 : wire1)})} : ({(wire5[(4'he):(3'h6)] ?
                              {reg7, wire3} : (wire5 > reg14))} ?
                      reg8 : (~$unsigned($signed(wire1)))));
              reg15 <= reg8[(2'h2):(2'h2)];
            end
          else
            begin
              reg12 <= wire4[(4'hf):(4'h8)];
              reg13 <= ($signed((8'h9f)) ?
                  (reg12[(3'h7):(1'h0)] ?
                      reg13 : (((+(7'h41)) ?
                              wire2[(4'h9):(3'h6)] : $signed(reg15)) ?
                          reg9 : (^~reg7[(1'h0):(1'h0)]))) : ($signed((~^((8'hb4) ?
                          wire2 : reg10))) ?
                      $signed($signed(wire5)) : wire3[(2'h3):(2'h2)]));
              reg14 <= (8'had);
              reg15 <= $signed($signed(($unsigned({wire1,
                  reg6}) * $unsigned(reg11[(4'hd):(4'h9)]))));
              reg16 <= $unsigned(wire1);
            end
        end
    end
  assign wire17 = wire0;
  module18 #() modinst86 (.clk(clk), .wire20(wire1), .wire19(reg12), .wire21(reg11), .y(wire85), .wire23(wire3), .wire22(reg14));
  assign wire87 = (({{reg8[(4'h9):(2'h2)]}} ?
                      (^(&(wire85 ?
                          wire2 : (8'h9f)))) : (~|wire85)) + $signed((&$signed(wire1[(3'h7):(2'h3)]))));
  assign wire88 = ((&reg15[(3'h7):(1'h1)]) ^ {(&(((8'hb1) ?
                          wire4 : (8'hb9)) & wire0)),
                      (~|wire3[(4'he):(3'h6)])});
  assign wire89 = $signed($unsigned((~reg15)));
  assign wire90 = {$signed($unsigned($signed($unsigned(wire0)))),
                      (-$unsigned(reg8))};
  assign wire91 = wire3[(3'h7):(3'h5)];
  assign wire92 = ($unsigned(wire17) != {$unsigned(reg12[(4'h9):(4'h9)]),
                      $signed(wire17[(3'h7):(3'h6)])});
  assign wire93 = (reg15 ?
                      $signed($signed((wire0[(3'h7):(3'h6)] ?
                          $signed((8'h9c)) : (wire2 >>> reg15)))) : reg13[(1'h0):(1'h0)]);
  assign wire94 = ((~$signed((((8'hb9) ? reg7 : (7'h40)) ?
                          reg10 : (wire88 ? reg9 : reg12)))) ?
                      (^(~&$unsigned((reg10 ?
                          wire5 : wire0)))) : wire1[(4'h8):(3'h5)]);
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire23;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire75,
                 wire73,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg76,
                 (1'h0)};
  assign wire24 = wire21[(4'h8):(2'h2)];
  assign wire25 = $unsigned({wire23[(3'h4):(2'h3)],
                      ({{wire22, wire19}} ?
                          (!(8'hb4)) : $signed($signed(wire21)))});
  assign wire26 = (((~^((^~wire24) ^~ {(8'ha4), wire22})) ?
                          ({wire22} ~^ ($unsigned(wire24) ?
                              wire23[(3'h4):(2'h2)] : $unsigned(wire24))) : (~^wire20[(3'h7):(3'h6)])) ?
                      (&(~|wire21)) : (8'hba));
  assign wire27 = (~^wire26[(3'h5):(3'h5)]);
  assign wire28 = wire25[(2'h2):(1'h0)];
  assign wire29 = ($unsigned((~^wire22[(3'h5):(2'h3)])) ^~ (7'h44));
  assign wire30 = {$unsigned(wire29)};
  assign wire31 = $unsigned($signed($signed(wire30)));
  assign wire32 = (wire22 < $unsigned((((wire22 ?
                      wire19 : (8'ha6)) || wire19[(3'h4):(1'h1)]) < $unsigned((wire27 && wire24)))));
  assign wire33 = $signed($signed((7'h43)));
  module34 #() modinst74 (wire73, clk, wire30, wire31, wire25, wire19);
  assign wire75 = {{(!((wire26 ? wire25 : (8'hb8)) | (~(7'h43))))},
                      (wire73[(1'h1):(1'h0)] ?
                          wire27 : $unsigned($unsigned((~&wire31))))};
  always
    @(posedge clk) begin
      reg76 <= wire24[(3'h6):(2'h2)];
    end
  assign wire77 = $signed($signed(wire27));
  assign wire78 = ((~&$unsigned(wire27)) ?
                      wire31 : $unsigned((~|$signed((&wire27)))));
  always
    @(posedge clk) begin
      reg79 <= wire75;
      if ((&wire24[(1'h0):(1'h0)]))
        begin
          if (wire27[(2'h2):(2'h2)])
            begin
              reg80 <= {$signed(((~^(~wire28)) && ((wire78 ? wire29 : wire26) ?
                      wire26[(2'h3):(1'h0)] : ((8'hbd) ? wire20 : reg79))))};
            end
          else
            begin
              reg80 <= $signed($signed((~|(+((7'h43) ? wire25 : wire73)))));
              reg81 <= $signed((-(wire22[(2'h3):(1'h0)] * {(8'hb6),
                  (wire25 >> wire20)})));
            end
          reg82 <= ({wire77} ?
              ($signed({(wire29 ? reg80 : wire32)}) ?
                  wire32 : wire75) : $signed($signed($unsigned((wire31 ?
                  wire25 : wire73)))));
        end
      else
        begin
          reg80 <= (wire30[(2'h3):(1'h0)] ?
              $signed(({$unsigned(wire20), (wire25 ? reg79 : reg81)} ?
                  $unsigned({reg76}) : (~|$unsigned(wire73)))) : (|reg76[(1'h1):(1'h1)]));
          reg81 <= ($signed($signed((-(~wire20)))) ?
              ((~^wire31[(4'he):(4'ha)]) <<< wire30) : ($signed((wire27 * $signed(wire25))) & ($unsigned(wire73) == wire26[(1'h1):(1'h1)])));
        end
      reg83 <= (-$signed($signed({(reg80 + wire24)})));
      reg84 <= reg83[(1'h1):(1'h1)];
    end
endmodule

module module34
#(parameter param72 = {(^~({((8'h9f) >> (7'h43)), (^(8'hae))} << (((8'h9c) ? (8'h9e) : (8'hb8)) << (~^(8'hac)))))})
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire38;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire39;
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  assign y = {wire71,
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
                 wire60,
                 wire53,
                 wire39,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
  assign wire39 = $unsigned($signed($signed((-wire37[(4'hb):(4'ha)]))));
  always
    @(posedge clk) begin
      reg40 <= {{wire38}};
      reg41 <= {(^{wire37[(1'h0):(1'h0)]}),
          (($unsigned(wire36[(1'h0):(1'h0)]) ?
              {$unsigned(reg40),
                  (-wire36)} : ((+(7'h44)) >> (wire37 && wire39))) + (wire38[(1'h1):(1'h0)] <= $signed((wire39 && wire36))))};
      reg42 <= $signed($unsigned(wire35));
      if (reg40[(1'h0):(1'h0)])
        begin
          reg43 <= (~|($unsigned(reg42[(3'h5):(1'h1)]) >> {(reg40 ?
                  ((8'hb7) ? reg40 : wire39) : wire37),
              ((wire39 ? reg40 : reg42) ?
                  wire37[(5'h10):(3'h5)] : (wire39 ? (8'hb5) : wire37))}));
          reg44 <= {wire38[(3'h7):(1'h0)]};
          if ((~|$unsigned((($unsigned(wire39) ? (&wire35) : (~|(8'ha9))) ?
              {(reg40 ? reg43 : wire37)} : (|((8'hbe) >= wire37))))))
            begin
              reg45 <= $signed($unsigned(reg43[(1'h1):(1'h1)]));
              reg46 <= $signed(((&$unsigned($signed(wire38))) ?
                  (((^(7'h40)) ?
                      (reg42 ?
                          reg43 : wire35) : $unsigned((8'hbe))) ^~ reg45[(4'hf):(4'he)]) : $unsigned(reg42[(4'h9):(1'h0)])));
              reg47 <= wire37;
              reg48 <= ((~{reg41[(5'h10):(2'h3)], reg45[(4'h9):(3'h4)]}) ?
                  ((-reg42) ?
                      {(-((8'haa) <= reg41)),
                          $unsigned({wire38,
                              wire38})} : $signed($unsigned(reg43[(4'h8):(3'h5)]))) : $signed($unsigned((~|(^~wire39)))));
              reg49 <= $signed(reg47);
            end
          else
            begin
              reg45 <= wire37[(5'h13):(4'ha)];
              reg46 <= $signed((~^$signed(($signed(reg40) ^~ $unsigned(reg44)))));
            end
          reg50 <= ($signed($signed(($unsigned(reg43) >>> $unsigned(wire39)))) ?
              $unsigned((+{((8'hb5) ? reg40 : reg47)})) : {{$signed((wire37 ?
                          reg41 : reg43))}});
          reg51 <= $unsigned((~|$signed($signed((wire39 <<< reg46)))));
        end
      else
        begin
          if (reg45)
            begin
              reg43 <= reg46;
            end
          else
            begin
              reg43 <= $signed(($signed(((reg47 ?
                      reg40 : reg40) * reg46[(3'h6):(3'h5)])) ?
                  (reg43[(4'he):(4'he)] ?
                      ((reg45 || wire37) ?
                          $signed(reg48) : reg47) : $unsigned(reg48[(2'h2):(1'h0)])) : reg44[(1'h0):(1'h0)]));
            end
          reg44 <= ($signed((8'hb3)) * $unsigned($unsigned((^reg48))));
          reg45 <= $unsigned(reg41[(3'h6):(1'h1)]);
          reg46 <= (reg48[(1'h1):(1'h0)] + (&reg45));
        end
      reg52 <= (~|$unsigned(({$signed(reg48), {reg40, reg46}} ?
          (reg42 && (reg48 ? (8'hba) : reg47)) : ((wire38 ? reg47 : (8'hb9)) ?
              (^~wire35) : $unsigned(reg49)))));
    end
  assign wire53 = wire35;
  always
    @(posedge clk) begin
      if ({(wire39[(3'h4):(2'h3)] <= reg51)})
        begin
          reg54 <= $unsigned($unsigned($unsigned({wire53[(2'h3):(2'h3)]})));
          reg55 <= (~reg51);
          reg56 <= (reg52[(4'he):(4'hc)] ?
              wire36[(3'h6):(3'h4)] : ({$unsigned(reg41[(5'h12):(4'hc)])} ?
                  ($signed((+reg43)) && $unsigned($signed((8'hb7)))) : (~&(^~{(7'h42),
                      wire39}))));
        end
      else
        begin
          reg54 <= (^~$unsigned({(~|reg48)}));
        end
      reg57 <= reg55[(2'h3):(2'h2)];
      reg58 <= $signed(({(reg44[(2'h2):(1'h1)] <= reg45[(2'h2):(2'h2)]),
          reg52} - $signed($signed($unsigned(reg49)))));
      reg59 <= $unsigned((~&{$signed((~|(8'ha7))), $unsigned($signed(reg44))}));
    end
  assign wire60 = (|$unsigned($signed($signed({reg40, reg42}))));
  assign wire61 = wire38[(3'h5):(2'h2)];
  assign wire62 = (~&($unsigned(((wire53 && reg52) ?
                          $signed(wire35) : (-reg46))) ?
                      $signed($signed((reg47 ? reg50 : reg48))) : reg40));
  assign wire63 = reg49;
  assign wire64 = (~|((&wire35[(3'h6):(2'h2)]) ?
                      reg43[(3'h4):(2'h2)] : reg41[(4'h8):(2'h2)]));
  assign wire65 = (!reg56[(3'h5):(3'h4)]);
  assign wire66 = $unsigned((+($signed($signed(reg57)) ^ $unsigned($signed(reg49)))));
  assign wire67 = $signed((((((8'ha0) ~^ (8'had)) ~^ $unsigned(wire64)) ?
                          {$unsigned(reg56),
                              ((8'hb2) ?
                                  (8'h9d) : wire36)} : reg56[(3'h6):(2'h3)]) ?
                      reg52 : ($unsigned(reg41) >>> ((reg42 <<< wire38) ?
                          (~&wire66) : (wire38 ? wire64 : wire38)))));
  assign wire68 = $unsigned((!((~reg54[(4'h8):(1'h0)]) ?
                      $signed((reg58 ?
                          reg54 : wire60)) : (reg52[(3'h6):(1'h1)] ?
                          $unsigned((8'h9c)) : $signed(reg47)))));
  assign wire69 = (($signed(wire68[(2'h3):(1'h1)]) ?
                          ($unsigned((reg49 ? wire61 : wire36)) ?
                              $signed($signed(reg42)) : reg56) : $unsigned(reg45[(3'h5):(2'h2)])) ?
                      ($unsigned(wire66[(4'h9):(3'h7)]) ?
                          {(!wire68[(2'h3):(2'h3)])} : reg54[(4'he):(4'h8)]) : ({($signed(wire39) ?
                                  (reg51 + wire36) : (~wire64)),
                              (((8'haa) ^~ reg50) != (reg45 ? reg46 : reg58))} ?
                          {(|wire39)} : (|wire64)));
  assign wire70 = ($signed(reg49[(1'h1):(1'h0)]) * (($unsigned(wire61) ?
                      ($signed(wire67) * $signed(wire61)) : ((reg40 || reg47) ^ (wire37 ?
                          reg56 : reg59))) ~^ $unsigned({reg48})));
  assign wire71 = {$unsigned(reg49[(4'h9):(3'h5)])};
endmodule

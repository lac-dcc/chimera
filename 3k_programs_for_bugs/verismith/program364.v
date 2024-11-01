module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire24,
                 wire23,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire2[(2'h2):(1'h0)])))
        begin
          reg5 <= $signed($unsigned(wire4));
          if ((wire0[(2'h2):(1'h0)] ?
              {($unsigned($unsigned((8'hbd))) >>> wire1),
                  $unsigned($unsigned((~(8'ha3))))} : reg5[(1'h1):(1'h1)]))
            begin
              reg6 <= $signed(wire0[(1'h1):(1'h0)]);
              reg7 <= wire0[(2'h3):(1'h1)];
              reg8 <= wire2;
              reg9 <= $signed(wire1);
            end
          else
            begin
              reg6 <= (reg7[(3'h7):(3'h7)] ?
                  $signed((&(reg5 <= (reg6 >> wire4)))) : (wire4 | (~|((reg9 >>> (8'h9d)) ?
                      {reg5, reg6} : ((7'h44) ? wire2 : reg6)))));
              reg7 <= reg9;
              reg8 <= (reg7 || $unsigned((|($unsigned(reg7) && {(8'ha7)}))));
              reg9 <= (-(wire0 ?
                  (^(~^(reg6 + wire4))) : $unsigned($signed($signed(wire4)))));
              reg10 <= (8'hbb);
            end
          reg11 <= (wire2 ?
              ($signed(wire0[(2'h3):(2'h2)]) ?
                  $signed((8'h9d)) : $unsigned($signed($unsigned(reg8)))) : $signed((wire2 ^ $unsigned($signed(wire1)))));
        end
      else
        begin
          reg5 <= reg5;
          reg6 <= (^$signed(($unsigned($unsigned((8'ha2))) ?
              $unsigned((reg11 < wire0)) : reg11)));
          reg7 <= $unsigned((({$unsigned(reg6),
                  (wire1 ? reg10 : wire2)} * (-(wire3 ? reg11 : wire0))) ?
              $signed({(wire1 ? reg6 : (8'hb6)),
                  {reg6, wire3}}) : reg6[(2'h2):(2'h2)]));
          reg8 <= (^~$unsigned(wire1));
        end
      if (($signed((|reg8)) ?
          reg5[(3'h5):(1'h0)] : (reg10[(1'h0):(1'h0)] << reg5[(4'h9):(4'h8)])))
        begin
          reg12 <= ({(~|((~|reg6) ? wire1 : (~^reg5))),
                  ($unsigned(((8'haf) ^~ wire0)) ?
                      ($signed(reg6) ?
                          (wire3 ? reg9 : (8'haa)) : (wire4 ?
                              wire0 : reg9)) : ((^reg7) ?
                          reg10[(1'h0):(1'h0)] : (reg7 ? reg11 : reg7)))} ?
              (!{wire4[(2'h3):(2'h3)], reg6[(2'h2):(1'h0)]}) : (^~(wire4 ?
                  reg5 : $unsigned(((8'hbd) ? wire4 : wire3)))));
          reg13 <= reg7;
        end
      else
        begin
          if ($signed($unsigned((reg10[(2'h2):(2'h2)] > $unsigned((^wire4))))))
            begin
              reg12 <= reg6;
              reg13 <= (($signed(reg7) ?
                      ((!(wire2 ? wire2 : wire2)) > $unsigned((wire2 ?
                          reg13 : wire4))) : reg11) ?
                  ($unsigned($signed($unsigned(reg10))) ?
                      wire3 : reg5[(3'h5):(3'h5)]) : wire3);
              reg14 <= ((reg6 ~^ (($unsigned(reg13) ?
                          (wire4 ? reg8 : wire4) : $signed(reg12)) ?
                      (8'haa) : (-wire4))) ?
                  reg10[(2'h3):(2'h3)] : reg6[(1'h0):(1'h0)]);
            end
          else
            begin
              reg12 <= (^~$unsigned($unsigned((8'h9e))));
            end
          reg15 <= ((~|wire1[(3'h5):(1'h1)]) ^ ($unsigned(((wire3 ?
              reg7 : reg13) ^~ (reg7 ?
              (8'hb1) : wire0))) >= $signed((reg6 >> $unsigned(reg6)))));
          reg16 <= $signed($unsigned({$signed($signed(reg12))}));
          if ($unsigned(wire3))
            begin
              reg17 <= ($unsigned((reg14 ?
                  ((~|reg13) > (reg15 ?
                      reg15 : (8'hae))) : reg8[(4'h8):(3'h6)])) > $signed(wire2));
              reg18 <= (+({$signed((reg7 ?
                      reg17 : reg5))} * $unsigned($signed((reg8 & wire1)))));
            end
          else
            begin
              reg17 <= ($unsigned($unsigned(($signed(reg9) ^~ {reg18,
                  wire4}))) && (^~$signed($unsigned($unsigned(reg10)))));
              reg18 <= reg7;
              reg19 <= $unsigned((reg8[(2'h3):(2'h2)] ~^ (!(^(wire3 & (8'hbb))))));
            end
        end
      reg20 <= {(!$unsigned(reg13)), reg12};
      reg21 <= reg11;
      reg22 <= reg14[(3'h4):(3'h4)];
    end
  assign wire23 = reg9[(3'h6):(2'h2)];
  assign wire24 = (!wire0[(1'h1):(1'h0)]);
  module25 #() modinst85 (wire84, clk, wire4, reg19, wire2, reg15);
  assign wire86 = ($signed(((8'hb7) ?
                      reg12[(3'h4):(1'h0)] : (|{(8'hbb)}))) | reg9);
  assign wire87 = (-wire1);
  assign wire88 = (($unsigned((reg18[(4'hb):(1'h1)] < {reg18,
                      wire87})) <= (-((reg5 && wire1) ?
                      reg22[(5'h10):(4'he)] : (!(8'ha5))))) << {reg11,
                      (&(~&wire84))});
  assign wire89 = reg18;
  assign wire90 = reg21[(1'h0):(1'h0)];
  assign wire91 = $unsigned((reg16[(2'h2):(1'h0)] <= (wire2[(3'h5):(2'h3)] ?
                      ((reg20 ? wire88 : reg16) >>> (wire87 ?
                          reg17 : reg8)) : reg9[(1'h0):(1'h0)])));
endmodule

module module25
#(parameter param82 = {(!(^({(8'ha8)} * ((8'hb1) <= (7'h42))))), ((8'hbd) ? (((8'ha8) ? ((7'h41) != (8'ha0)) : ((8'hbf) * (7'h41))) - ((+(8'haa)) ? (^~(8'hb0)) : ((8'hb5) << (8'hbd)))) : (^{(&(7'h44))}))}, 
parameter param83 = ((param82 ? param82 : ({(param82 > (8'ha0))} == param82)) ? (((-(-param82)) >> ((param82 ? param82 : param82) >> (!param82))) ~^ {{(param82 ? param82 : (7'h40)), (8'hac)}, param82}) : ((param82 - ((param82 ? param82 : (8'hbf)) ? param82 : (param82 ^~ param82))) ~^ (-param82))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(5'h11):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire74;
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  assign y = {wire80, wire79, wire77, wire76, wire74, reg81, reg78, (1'h0)};
  module30 #() modinst75 (.wire31(wire26), .clk(clk), .y(wire74), .wire34(wire28), .wire33(wire29), .wire32(wire27));
  assign wire76 = ($unsigned(wire26) <<< wire27);
  assign wire77 = $unsigned((wire28[(4'hd):(1'h0)] ?
                      (wire29[(4'h9):(1'h1)] >= {(wire74 + wire28)}) : wire26));
  always
    @(posedge clk) begin
      reg78 <= $unsigned($unsigned(wire74));
    end
  assign wire79 = wire26;
  assign wire80 = (wire79[(1'h1):(1'h1)] < $signed(wire74[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg81 <= (-reg78);
    end
endmodule

module module30
#(parameter param73 = (((8'haf) < {(((7'h43) >>> (8'hbd)) ? ((8'h9e) ? (8'ha6) : (8'ha6)) : {(8'hba), (8'hbd)})}) != (({((8'hbc) <= (8'haf)), (8'ha9)} - {((8'ha3) ? (7'h44) : (8'hbe))}) ? (({(7'h42), (8'hb2)} ? ((7'h43) && (8'hbc)) : (~&(8'hb4))) ? ({(7'h43)} ? {(8'haa)} : ((8'hb1) >> (8'haa))) : (~^((8'hb3) ? (8'hba) : (8'hb2)))) : {(~^((8'hab) ? (8'h9d) : (8'hbe)))})))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(3'h7):(1'h0)] wire32;
  input wire [(4'hb):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire68,
                 wire67,
                 wire60,
                 wire59,
                 wire45,
                 wire44,
                 wire36,
                 wire35,
                 reg70,
                 reg69,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire35 = ($unsigned($signed((-$unsigned(wire32)))) <<< $signed((~^$signed((wire34 ^~ wire31)))));
  assign wire36 = ($signed(wire35) ?
                      {{wire33},
                          wire32[(1'h1):(1'h1)]} : $unsigned(($signed($unsigned(wire32)) >> {wire32,
                          wire31[(3'h5):(3'h4)]})));
  always
    @(posedge clk) begin
      reg37 <= wire34[(4'ha):(1'h0)];
      reg38 <= (&$unsigned((((wire35 ? (8'haf) : wire33) >>> (reg37 ?
          wire33 : reg37)) + $signed(wire35))));
    end
  always
    @(posedge clk) begin
      reg39 <= (~&wire36);
      reg40 <= $signed((+(8'h9f)));
      reg41 <= {($unsigned(reg38[(2'h2):(1'h1)]) >= ((reg37 ?
                  reg40[(5'h11):(4'ha)] : wire35) ?
              $unsigned((wire32 ? wire35 : reg38)) : reg40)),
          (~&wire33[(4'hc):(2'h2)])};
      reg42 <= $signed((reg37 >= reg37));
      reg43 <= (wire33 || $unsigned((reg37 ?
          {(^~wire35)} : ($unsigned(wire33) ?
              {wire35} : wire36[(1'h1):(1'h0)]))));
    end
  assign wire44 = wire36[(1'h0):(1'h0)];
  assign wire45 = $signed((&wire36[(3'h5):(2'h3)]));
  always
    @(posedge clk) begin
      reg46 <= (|($unsigned((reg42 ? {wire36, wire32} : $unsigned(reg42))) ?
          $unsigned($unsigned($signed(reg41))) : (~&wire44)));
      reg47 <= ({(~&{(!wire36)}),
          $unsigned({(wire32 ?
                  wire44 : reg43)})} - $signed((!reg46[(5'h13):(1'h1)])));
      reg48 <= (($signed(reg46[(4'ha):(4'h8)]) <= ((wire31[(3'h4):(1'h1)] ^ (reg37 >= wire33)) ?
          reg41[(3'h5):(1'h1)] : ((reg46 >> reg47) == $unsigned(reg47)))) >>> $unsigned(reg43));
      if ((reg40[(5'h14):(5'h10)] - (reg40 ?
          {{$unsigned((8'hb8))},
              ((reg42 + wire45) | (reg41 ?
                  wire44 : (8'h9c)))} : $signed(wire36))))
        begin
          if ($unsigned((((wire31 > (wire36 <= wire33)) ?
              ((reg37 ? (8'haf) : wire36) ?
                  reg38[(2'h3):(1'h0)] : (wire34 && wire31)) : ((wire35 | wire45) >= reg39[(1'h1):(1'h0)])) && (!($signed(wire35) ^~ reg39)))))
            begin
              reg49 <= {(wire33[(2'h2):(1'h0)] ?
                      $unsigned((-$signed((8'hbc)))) : ((reg48[(4'h9):(3'h4)] ?
                          (wire36 >= wire33) : reg48[(2'h2):(1'h1)]) | ((+reg39) ?
                          wire35[(1'h0):(1'h0)] : $signed(wire36))))};
              reg50 <= (wire34[(4'h9):(2'h2)] ? (^~reg42) : reg38);
              reg51 <= wire35;
            end
          else
            begin
              reg49 <= (reg50[(3'h4):(3'h4)] ?
                  (({reg43[(4'h9):(3'h6)], ((8'ha0) ? wire44 : reg43)} ?
                          (~|(~^reg41)) : reg51) ?
                      (wire31[(4'ha):(3'h6)] ~^ $signed((|wire35))) : (^(7'h40))) : $signed($unsigned((|((7'h40) ?
                      wire45 : (8'hbf))))));
              reg50 <= ($signed(((!(8'h9d)) ^~ $signed($unsigned((8'hb0))))) >>> (^(|reg48)));
              reg51 <= wire36;
              reg52 <= ({wire45[(1'h1):(1'h0)]} || wire32);
              reg53 <= ($signed(wire34) ?
                  (-(+(((8'hb8) & reg38) - (reg42 != reg43)))) : {((8'hbb) ?
                          reg43[(4'hb):(3'h5)] : $unsigned($signed(reg40)))});
            end
          reg54 <= (-reg46[(3'h6):(2'h3)]);
          reg55 <= $unsigned((reg46[(5'h12):(1'h0)] && $unsigned(((reg41 ?
                  wire33 : reg48) ?
              $unsigned(reg47) : wire32[(3'h6):(2'h3)]))));
          reg56 <= reg43;
          reg57 <= reg40;
        end
      else
        begin
          if ($unsigned(reg53))
            begin
              reg49 <= $signed($unsigned((~wire32[(3'h6):(1'h1)])));
              reg50 <= $unsigned(wire45[(1'h0):(1'h0)]);
            end
          else
            begin
              reg49 <= $unsigned({(^~$signed((|reg42))), reg52[(4'hb):(3'h5)]});
              reg50 <= reg53[(2'h3):(1'h1)];
              reg51 <= ($signed($unsigned($unsigned($unsigned(reg51)))) ?
                  (reg48 - wire32) : ((($unsigned(reg46) ^~ (wire45 ?
                              reg49 : wire44)) ?
                          ((&reg38) ?
                              $unsigned(reg39) : (reg52 - reg48)) : $unsigned(((8'h9d) ^ reg38))) ?
                      $unsigned($signed((-wire45))) : $unsigned($unsigned({reg38}))));
              reg52 <= (wire35 - $unsigned($signed({reg47, (&(8'hb5))})));
              reg53 <= $signed($signed(reg57[(1'h1):(1'h0)]));
            end
          reg54 <= ({{wire32[(1'h1):(1'h0)], (-$signed((8'hb9)))}} ?
              wire36[(4'ha):(3'h4)] : (|(~|(8'ha0))));
        end
      reg58 <= $unsigned(wire34[(1'h1):(1'h0)]);
    end
  assign wire59 = $signed({$signed({$signed(reg40)})});
  assign wire60 = {reg54, $unsigned($unsigned({(wire45 << (8'h9d))}))};
  always
    @(posedge clk) begin
      reg61 <= (~^wire36);
      if ($unsigned(wire36))
        begin
          reg62 <= $unsigned((|$signed((wire35 ?
              reg47[(3'h5):(3'h4)] : (reg46 + wire60)))));
          reg63 <= ((|($unsigned($unsigned(reg51)) != $unsigned($unsigned((8'h9e))))) ?
              (reg50[(2'h3):(1'h0)] <= (~&($unsigned((8'h9c)) ?
                  (reg49 + wire59) : ((8'haf) ?
                      reg61 : wire44)))) : $signed(((+(7'h40)) ?
                  (((7'h40) <<< reg38) ?
                      (reg54 || wire45) : (wire36 ?
                          wire36 : reg48)) : ((~|reg46) ?
                      {reg38, reg49} : (+reg37)))));
          reg64 <= (reg40 ?
              reg55 : $signed((reg55 ?
                  wire35 : ((~reg37) ?
                      reg41[(4'he):(4'he)] : {wire35, (8'ha1)}))));
          reg65 <= $signed(((|$unsigned((reg51 ? reg47 : (8'ha5)))) & reg43));
        end
      else
        begin
          reg62 <= reg48[(4'h8):(4'h8)];
        end
      reg66 <= ($unsigned((^~$signed($signed(reg50)))) ^ ((($unsigned(reg46) ?
          $unsigned(reg64) : $signed((8'had))) <<< (~$unsigned(wire33))) ~^ {({reg39} ?
              (reg53 == reg58) : wire45)}));
    end
  assign wire67 = {((((wire33 ? reg40 : reg48) >>> reg42) ?
                              reg47 : (-{reg39, wire45})) ?
                          (-{reg43}) : $signed($unsigned({reg46, (8'hb1)})))};
  assign wire68 = ($signed({{(wire32 & reg48)}}) >> (^($signed(wire59) >>> $unsigned($signed(wire32)))));
  always
    @(posedge clk) begin
      reg69 <= wire68;
      reg70 <= (($unsigned(reg49[(2'h2):(1'h0)]) ?
          {$signed($signed(reg65))} : wire34[(1'h0):(1'h0)]) && wire67);
    end
  assign wire71 = ($signed(({$signed(wire45)} + ((wire31 ? reg37 : reg57) ?
                      (wire34 ? reg58 : (7'h41)) : (reg52 ?
                          (8'ha7) : reg57)))) + (~|({wire34[(3'h4):(1'h1)]} ?
                      reg55[(4'hb):(3'h7)] : wire45[(1'h0):(1'h0)])));
  assign wire72 = wire45[(2'h2):(2'h2)];
endmodule

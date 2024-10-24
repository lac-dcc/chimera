module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire70;
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire4,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire70,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= (-$unsigned((wire0 ?
          $signed((~^(8'hb9))) : ($signed(wire2) ? wire1 : (wire2 << wire0)))));
      if ({$signed(wire3),
          $signed($signed((wire4[(3'h5):(2'h2)] ? {wire3} : (!reg5))))})
        begin
          reg6 <= (~^$signed((wire2 > wire3[(2'h2):(1'h0)])));
          reg7 <= (-$signed($unsigned(wire1)));
          reg8 <= (&(^~$unsigned((|$signed(wire3)))));
        end
      else
        begin
          reg6 <= $unsigned(reg8[(4'h8):(1'h1)]);
          reg7 <= $unsigned((reg5[(4'hd):(3'h5)] ?
              ($signed((~|wire1)) || (7'h42)) : (reg8[(1'h1):(1'h0)] ?
                  wire3[(3'h7):(2'h2)] : reg5[(5'h10):(4'hd)])));
          if (($signed($unsigned(({wire1} ?
              ((8'hb9) << (8'haa)) : wire4))) ~^ ((&(~^(wire1 ?
              (8'haf) : (8'hb3)))) - (($unsigned(wire0) ?
                  (wire4 || reg5) : (reg8 << reg7)) ?
              ($unsigned((8'hae)) & $unsigned(reg8)) : {$signed(wire1)}))))
            begin
              reg8 <= (+((wire4[(3'h6):(1'h1)] ?
                  reg5[(1'h1):(1'h0)] : ((reg6 & reg7) ?
                      (!reg6) : $signed(wire1))) + reg7[(5'h11):(4'he)]));
            end
          else
            begin
              reg8 <= $signed($unsigned(reg7[(4'hb):(3'h4)]));
              reg9 <= reg8[(2'h3):(2'h2)];
            end
        end
      if ($unsigned((((reg7 ~^ reg7) <<< wire3[(4'ha):(3'h5)]) ?
          ($unsigned((reg5 ^~ wire2)) || ((-wire1) << (~|reg6))) : wire3[(3'h5):(2'h3)])))
        begin
          reg10 <= (8'ha7);
          if (($signed($unsigned((~wire4[(2'h3):(2'h2)]))) ?
              wire3 : ($signed(((!reg10) ^~ ((8'hb8) <<< reg9))) ?
                  $unsigned($unsigned((wire3 ?
                      reg8 : (8'h9f)))) : (reg5[(5'h10):(4'hc)] * $unsigned(reg10)))))
            begin
              reg11 <= (($unsigned(reg10[(3'h6):(2'h3)]) ?
                  {reg8[(2'h2):(1'h1)]} : $signed($signed($unsigned(wire2)))) >= wire1[(3'h4):(1'h0)]);
              reg12 <= ($unsigned(wire1[(3'h4):(2'h2)]) ^~ $unsigned((-(reg6[(5'h13):(2'h3)] || wire4[(4'h8):(1'h1)]))));
              reg13 <= $signed((7'h42));
              reg14 <= $signed(($signed(($signed(reg10) >= ((8'ha5) ?
                      reg5 : reg9))) ?
                  wire0[(2'h3):(2'h3)] : (8'hb6)));
              reg15 <= $unsigned(reg10[(4'hc):(2'h2)]);
            end
          else
            begin
              reg11 <= $unsigned((reg10[(1'h1):(1'h1)] ?
                  ($signed(reg11) ? reg10 : (wire0 ? reg8 : {reg7})) : reg6));
            end
          reg16 <= (reg5 >>> $unsigned(({$unsigned(wire1),
              $signed(reg13)} >= $unsigned((wire3 >>> wire3)))));
          if ($signed($unsigned($signed($signed({wire3})))))
            begin
              reg17 <= reg5;
            end
          else
            begin
              reg17 <= ($signed((($signed(reg16) ?
                  reg14[(2'h3):(2'h3)] : (-reg12)) * $signed($unsigned(wire2)))) ~^ (&wire3[(2'h3):(2'h3)]));
              reg18 <= (({{reg5,
                      reg8[(3'h7):(1'h0)]}} ~^ $signed($unsigned(reg5[(1'h0):(1'h0)]))) && $unsigned((($signed((8'ha8)) ?
                  reg11 : $signed(reg12)) & reg16)));
              reg19 <= $signed((&$signed({$signed(reg18)})));
              reg20 <= $unsigned((~$signed((&$unsigned((8'hb5))))));
            end
        end
      else
        begin
          reg10 <= reg8;
          reg11 <= (~|(reg8 > {reg5[(1'h0):(1'h0)],
              ((~^reg9) ? (-wire2) : (reg14 ? reg5 : reg13))}));
          reg12 <= reg13[(4'hc):(1'h1)];
          if (wire4)
            begin
              reg13 <= reg7[(1'h1):(1'h1)];
              reg14 <= wire3[(1'h1):(1'h0)];
              reg15 <= ($unsigned(((((8'hbe) ^ reg10) ?
                  (reg13 ?
                      reg13 : wire0) : reg5[(4'h8):(3'h6)]) >> (8'ha6))) ^~ reg8);
            end
          else
            begin
              reg13 <= ($signed((-((wire4 ?
                  (8'hb2) : reg20) * (+reg6)))) || (({(reg17 ^ reg19)} ?
                  {(reg9 >>> reg18), {reg20, reg8}} : (~|{reg8,
                      wire2})) | (~^$unsigned((wire0 ? wire0 : wire2)))));
              reg14 <= $signed(reg20);
              reg15 <= (($unsigned((wire4 ?
                      $signed(reg18) : $unsigned(reg13))) ?
                  reg20[(3'h6):(3'h6)] : {$unsigned(wire2[(1'h0):(1'h0)])}) >> $signed((reg17[(2'h3):(1'h1)] ~^ wire1)));
              reg16 <= wire3[(1'h1):(1'h0)];
            end
          if ($unsigned(reg6))
            begin
              reg17 <= (|($signed(($signed(reg12) >> $unsigned(wire3))) | (~^(wire1[(3'h6):(1'h1)] >>> (reg14 << wire3)))));
              reg18 <= $signed(($signed($signed((~|wire2))) ?
                  reg11 : (wire2 ?
                      (!(wire1 > reg15)) : {wire1[(3'h4):(3'h4)],
                          (|(8'hb7))})));
              reg19 <= ($unsigned(reg17) && ((reg17 ?
                  (reg11[(2'h3):(1'h1)] ?
                      $unsigned(reg14) : (^(8'hb5))) : (-$signed(reg16))) && (((wire3 >> reg10) - $unsigned((8'hac))) ?
                  (-wire4) : (!((8'hbb) << wire1)))));
            end
          else
            begin
              reg17 <= reg12;
              reg18 <= $unsigned(reg12);
            end
        end
      reg21 <= ($signed(reg20[(3'h4):(1'h1)]) * wire2[(2'h2):(1'h0)]);
      reg22 <= $unsigned(wire1);
    end
  assign wire23 = {wire3[(4'h9):(3'h4)]};
  assign wire24 = (~$unsigned($unsigned((reg19[(2'h2):(2'h2)] ?
                      wire0[(4'he):(4'hb)] : ((8'hbe) ^ reg13)))));
  assign wire25 = $unsigned($signed((((-(8'hb3)) | {reg20}) ?
                      $signed(reg21[(4'hf):(1'h0)]) : ((wire0 <= reg5) == (8'hae)))));
  assign wire26 = ($signed((((reg13 ?
                      reg18 : reg18) || $signed(reg8)) ^~ ((reg6 ?
                          reg5 : wire23) ?
                      wire1 : wire2[(2'h3):(2'h3)]))) || ((($signed(reg14) ?
                          (8'hb6) : (wire3 ?
                              reg7 : reg11)) >>> ((!reg19) * reg7)) ?
                      (((+wire1) <<< $signed(wire24)) + ((+(8'hb8)) ?
                          $unsigned(wire23) : reg20)) : ((~reg5) ?
                          (~(reg21 ? reg19 : reg12)) : (~(reg9 < wire0)))));
  assign wire27 = wire2[(3'h4):(3'h4)];
  assign wire28 = $unsigned((wire3 ?
                      reg8[(2'h2):(1'h0)] : ($signed((-reg22)) <= ((-wire24) ?
                          $signed(wire25) : reg17))));
  assign wire29 = ((reg15 ?
                          (|(~((8'hb7) ?
                              wire27 : reg19))) : wire28[(3'h7):(3'h7)]) ?
                      (reg22[(1'h1):(1'h1)] ^ reg6[(3'h4):(2'h2)]) : reg6);
  assign wire30 = wire1;
  assign wire31 = (8'hbb);
  assign wire32 = (8'ha6);
  module33 #() modinst71 (.wire35(reg12), .wire34(wire26), .wire36(wire30), .clk(clk), .wire37(wire0), .y(wire70));
  assign wire72 = $signed((((~|reg9[(3'h4):(2'h3)]) * ($signed(reg18) >>> (reg12 ?
                          reg13 : wire28))) ?
                      {((wire1 == reg19) ?
                              wire26[(4'hc):(4'hc)] : {reg5})} : $unsigned({(~^(8'hb3))})));
  assign wire73 = wire0[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      reg74 <= $signed(wire3[(4'h9):(3'h7)]);
      reg75 <= $signed(reg7);
      if (((+((+(reg21 ? wire4 : reg22)) ?
          (|(reg13 ? wire28 : wire24)) : ((~|reg16) ?
              (!wire73) : wire24[(4'ha):(3'h4)]))) || wire29))
        begin
          reg76 <= reg6[(5'h12):(3'h7)];
          reg77 <= $signed(((reg12[(4'hc):(4'hb)] ?
                  wire4 : $signed($unsigned(wire28))) ?
              $signed($signed((wire26 ?
                  wire31 : wire30))) : (!((reg15 < wire4) ?
                  reg11 : wire72[(2'h2):(1'h1)]))));
          if (wire70)
            begin
              reg78 <= ($unsigned((8'hb7)) ~^ wire1[(3'h7):(3'h7)]);
              reg79 <= $signed($signed((^wire27[(4'h8):(3'h6)])));
              reg80 <= (($unsigned({wire0[(5'h10):(4'h8)],
                  (|reg5)}) | reg13[(4'hd):(4'hd)]) - $signed($unsigned((~^(wire23 & wire32)))));
              reg81 <= reg21;
              reg82 <= wire29[(3'h5):(3'h4)];
            end
          else
            begin
              reg78 <= reg6[(5'h11):(3'h5)];
              reg79 <= ($unsigned((^$signed({(8'ha1), reg21}))) <<< {({wire23} ?
                      ((~^reg20) ^~ $signed(reg10)) : reg19[(3'h6):(3'h5)])});
              reg80 <= reg15[(1'h1):(1'h1)];
              reg81 <= ($unsigned($unsigned(reg8[(3'h7):(1'h0)])) >>> (-($signed($signed((7'h40))) ?
                  reg22 : ((-reg8) <<< (!reg22)))));
              reg82 <= (!$signed(reg9));
            end
        end
      else
        begin
          reg76 <= $signed(((((reg14 && reg9) ? $unsigned(reg9) : (|(8'ha4))) ?
                  $signed($signed(wire0)) : $signed($signed((8'h9c)))) ?
              $unsigned(($unsigned(reg77) ?
                  $signed((8'hb4)) : $unsigned(reg20))) : {$unsigned((wire31 ?
                      reg74 : reg17)),
                  $signed(reg82[(1'h1):(1'h0)])}));
          reg77 <= $unsigned(reg12[(4'hc):(4'hb)]);
          reg78 <= $signed($unsigned(wire29[(3'h7):(2'h2)]));
          reg79 <= (^(-(~$unsigned($unsigned((8'hb3))))));
        end
    end
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire signed [(5'h15):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire64;
  assign y = {wire69, wire68, wire67, wire66, wire64, (1'h0)};
  module38 #() modinst65 (.wire40(wire34), .wire41(wire36), .wire43(wire37), .clk(clk), .y(wire64), .wire42(wire35), .wire39((8'ha9)));
  assign wire66 = wire34[(4'hd):(4'ha)];
  assign wire67 = (|((wire37[(2'h3):(1'h0)] ^ (wire66[(2'h3):(2'h3)] ?
                          (+wire36) : (^wire66))) ?
                      (wire34[(3'h5):(1'h0)] ?
                          {(wire37 ?
                                  wire37 : wire66)} : $unsigned($signed(wire34))) : {wire37[(4'hd):(3'h6)],
                          $unsigned(wire35)}));
  assign wire68 = wire67;
  assign wire69 = wire64;
endmodule

module module38
#(parameter param63 = (~&(((((8'hb2) << (8'haf)) ? (+(7'h42)) : ((8'ha8) ? (8'h9f) : (8'hbf))) ? (+((8'ha3) ? (8'ha1) : (8'ha4))) : (((8'hbd) ? (8'h9e) : (8'hb7)) * {(8'h9f)})) != ({((7'h44) ? (7'h40) : (7'h42)), ((8'had) <= (8'h9f))} + (((8'hbe) ? (8'hbb) : (8'hb0)) + ((8'hbb) ? (8'hab) : (8'ha5)))))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire43;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire44 = wire40[(4'he):(4'hb)];
  assign wire45 = wire41;
  assign wire46 = (+$unsigned((~&wire45)));
  assign wire47 = wire45;
  assign wire48 = (8'hb0);
  assign wire49 = (+((+(-wire41)) ? (wire39 << (-$signed(wire48))) : wire45));
  assign wire50 = {((~&$signed($signed(wire43))) ?
                          ($signed($signed(wire47)) ?
                              $signed((wire41 >= wire45)) : $unsigned((~&wire45))) : {({wire39} > $unsigned(wire45)),
                              {wire44}}),
                      wire44[(3'h6):(3'h4)]};
  always
    @(posedge clk) begin
      reg51 <= (^$signed($signed(((8'ha5) ?
          (wire40 ? wire49 : wire45) : (wire48 ? wire50 : wire46)))));
      reg52 <= wire44[(1'h1):(1'h0)];
      if ((wire40 ^ wire48[(1'h0):(1'h0)]))
        begin
          reg53 <= reg52[(1'h0):(1'h0)];
          reg54 <= $signed($signed((8'ha4)));
        end
      else
        begin
          reg53 <= reg53[(1'h0):(1'h0)];
          reg54 <= $signed((^$signed(wire45)));
        end
      reg55 <= {{$unsigned({{wire40, wire44}, $signed(wire46)}),
              $signed((!$unsigned(reg52)))},
          wire45[(3'h4):(1'h0)]};
    end
  assign wire56 = (&((^((wire48 + wire39) < $signed(reg55))) >>> $unsigned($signed($signed(wire39)))));
  assign wire57 = $signed(reg53);
  assign wire58 = $signed($unsigned((reg53 ?
                      wire43[(3'h4):(1'h1)] : ((|reg51) ? wire46 : wire47))));
  assign wire59 = (~&wire43[(3'h6):(2'h2)]);
  assign wire60 = {wire58, wire40[(3'h7):(1'h0)]};
  assign wire61 = {$signed($unsigned($signed((reg52 ? reg55 : wire42))))};
  assign wire62 = $signed({(($unsigned(reg52) - $unsigned(wire47)) ?
                          wire39 : $unsigned(wire48[(4'ha):(4'h9)]))});
endmodule

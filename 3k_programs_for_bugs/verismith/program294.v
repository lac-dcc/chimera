module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire75;
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  assign y = {wire4, wire60, wire62, wire75, reg79, reg78, reg77, (1'h0)};
  assign wire4 = wire3[(4'h9):(1'h0)];
  module5 #() modinst61 (.y(wire60), .wire8(wire0), .clk(clk), .wire9(wire4), .wire6(wire2), .wire7(wire3));
  assign wire62 = $signed(wire4);
  module63 #() modinst76 (wire75, clk, wire3, wire4, wire0, wire1, wire2);
  always
    @(posedge clk) begin
      reg77 <= (wire1[(1'h0):(1'h0)] | ($unsigned((8'ha9)) != wire60[(5'h10):(1'h1)]));
      reg78 <= wire62[(5'h14):(3'h7)];
      reg79 <= ((wire75[(3'h4):(1'h1)] ?
          (~{wire1[(2'h3):(1'h0)],
              (reg78 >> (8'hb4))}) : wire1[(4'h9):(4'h8)]) == wire3[(4'hb):(3'h4)]);
    end
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire [(5'h12):(1'h0)] wire67;
  input wire [(5'h12):(1'h0)] wire66;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(4'hc):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire69;
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  assign y = {wire74, wire73, wire69, reg72, reg71, reg70, (1'h0)};
  assign wire69 = (~$signed((wire67[(4'he):(4'hb)] - ((wire67 > (8'hbb)) <<< (|wire65)))));
  always
    @(posedge clk) begin
      reg70 <= {$signed(wire65),
          ($unsigned(((8'haf) >>> $signed(wire65))) <= $unsigned($unsigned($unsigned(wire68))))};
      reg71 <= (+($unsigned((8'hb7)) ?
          (($unsigned(wire65) ? $unsigned((8'hb4)) : (8'ha5)) ?
              ($unsigned(wire68) < (wire69 ? wire64 : wire66)) : (wire65 ?
                  (wire65 >= wire68) : (wire68 ?
                      wire64 : wire68))) : {wire67[(4'hf):(4'he)]}));
      reg72 <= (((8'h9f) ?
          (wire66 != ($signed(wire69) ?
              wire68 : (^~reg70))) : {wire69}) * $signed(wire64[(4'ha):(2'h2)]));
    end
  assign wire73 = (&(^(((reg72 ?
                      wire66 : wire68) >> $unsigned((8'had))) && $signed(reg72))));
  assign wire74 = (^({($unsigned(wire69) || $unsigned(wire68)),
                          wire66[(5'h12):(5'h10)]} ?
                      (^~reg71) : ((+(wire65 ?
                          wire65 : reg70)) * $signed($unsigned(wire65)))));
endmodule

module module5
#(parameter param59 = (8'ha5))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire10;
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire57,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire27,
                 wire10,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 (1'h0)};
  assign wire10 = ({wire7[(3'h5):(3'h4)]} - wire8[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg11 <= $unsigned(wire9[(2'h3):(2'h2)]);
      reg12 <= reg11[(4'hd):(2'h2)];
      if ($signed((~&(&reg12[(2'h2):(2'h2)]))))
        begin
          reg13 <= wire8[(1'h0):(1'h0)];
        end
      else
        begin
          reg13 <= (((|wire6) || $signed(((wire7 - wire7) << $unsigned(wire10)))) || $unsigned((wire9[(4'h9):(2'h2)] < ((8'hb5) ?
              (wire6 ? wire9 : reg13) : $signed(wire7)))));
          reg14 <= ((^~reg11[(1'h0):(1'h0)]) ?
              wire10[(2'h3):(2'h3)] : $signed((wire9 | wire6)));
          if ($unsigned((!reg14)))
            begin
              reg15 <= ({wire7,
                  {$signed({reg13, wire9}),
                      $unsigned((reg12 ?
                          wire8 : reg13))}} | (wire6[(2'h2):(1'h0)] ?
                  wire7 : ($unsigned($unsigned((8'ha2))) ? reg12 : wire9)));
              reg16 <= ($signed(((wire10[(2'h3):(2'h3)] == wire7[(3'h6):(3'h5)]) ?
                  $signed((~|reg14)) : ({(8'hba),
                      (8'had)} <<< $signed(wire10)))) ^ (((reg11 ~^ wire7) ?
                      (~|reg14[(3'h5):(3'h4)]) : ($signed(wire8) ?
                          (reg15 ? (8'ha8) : wire8) : {wire9})) ?
                  wire9 : $unsigned(reg14[(4'hf):(4'h9)])));
              reg17 <= $unsigned({wire6[(1'h0):(1'h0)]});
              reg18 <= $unsigned($unsigned((wire6[(1'h1):(1'h1)] ?
                  {$unsigned(wire8),
                      $signed(reg13)} : $signed($unsigned(reg15)))));
              reg19 <= $signed((+wire10));
            end
          else
            begin
              reg15 <= $unsigned(wire7[(3'h5):(2'h2)]);
              reg16 <= $unsigned(wire10[(2'h3):(1'h0)]);
              reg17 <= (8'had);
              reg18 <= wire10;
            end
          reg20 <= reg15;
        end
      if ($signed($signed({((8'hb6) ? reg11 : {wire10, wire9}), (~|reg16)})))
        begin
          if ({(reg18 ?
                  $signed(((~&reg20) ? (-reg14) : (reg11 << reg17))) : reg14),
              $signed(($signed($signed((8'haa))) >= (reg15[(3'h5):(2'h3)] ?
                  (wire8 ? reg16 : (8'ha1)) : wire10[(1'h0):(1'h0)])))})
            begin
              reg21 <= (reg12 ^~ (~^reg18[(4'h9):(3'h6)]));
              reg22 <= $unsigned((8'hae));
              reg23 <= (reg12[(1'h0):(1'h0)] - (({reg18[(2'h3):(2'h3)]} ?
                      $unsigned(reg11[(4'hd):(3'h4)]) : (^~reg18)) ?
                  (~&reg21[(1'h0):(1'h0)]) : ((~&(~|(8'hbb))) != (reg11[(4'hb):(4'hb)] <= $unsigned(wire9)))));
            end
          else
            begin
              reg21 <= $unsigned({reg19[(3'h6):(3'h4)]});
              reg22 <= (-{{wire8}});
              reg23 <= $unsigned($signed(reg13));
              reg24 <= $signed({(~|{$signed(reg11)}), reg13[(2'h3):(2'h2)]});
              reg25 <= $signed(({reg15, reg17} - (reg17 ?
                  ($signed(wire7) ? {reg24} : $unsigned((8'hbc))) : reg18)));
            end
          reg26 <= reg13[(3'h5):(1'h1)];
        end
      else
        begin
          if ((((&$signed(reg20)) ?
              reg22 : wire10) > $signed($unsigned(reg23))))
            begin
              reg21 <= reg21;
              reg22 <= $unsigned(reg15[(1'h1):(1'h0)]);
              reg23 <= $unsigned(((-reg15[(3'h7):(3'h6)]) & reg15));
            end
          else
            begin
              reg21 <= wire8[(4'h8):(3'h7)];
              reg22 <= ((!(8'hb4)) ~^ (reg16 ^~ ((|$unsigned(reg17)) >> $signed(wire8))));
            end
        end
    end
  assign wire27 = $signed((^~$signed({$signed((8'hb7)), wire9})));
  always
    @(posedge clk) begin
      if ($unsigned({$signed((reg25[(4'h9):(3'h4)] | reg12))}))
        begin
          reg28 <= $signed($signed(((((8'hb4) * (8'ha3)) == (reg11 - reg24)) && reg18[(1'h0):(1'h0)])));
          reg29 <= $unsigned({($signed($signed(reg14)) ?
                  wire27[(4'h8):(1'h1)] : ((~reg16) ?
                      reg28 : $unsigned(reg17)))});
          reg30 <= reg24;
        end
      else
        begin
          if ({($signed($signed($signed((8'ha0)))) ^~ $signed((reg18 ?
                  (~reg26) : $signed(reg23)))),
              (reg18 ~^ ($signed((reg12 | wire27)) ^~ reg18[(3'h4):(2'h3)]))})
            begin
              reg28 <= ($unsigned($unsigned($signed($signed(wire9)))) ?
                  $signed($signed(reg14)) : (^~($signed($signed(reg17)) ?
                      wire8 : $signed({reg20, reg16}))));
              reg29 <= $signed(((((-reg22) < $signed(wire6)) << ((reg13 >>> reg23) & (8'ha9))) <= $signed((7'h41))));
              reg30 <= reg28;
            end
          else
            begin
              reg28 <= $signed({$unsigned(((reg15 < reg17) ?
                      (reg29 ? reg29 : reg12) : (reg16 ? reg15 : reg29))),
                  $signed($signed((-reg26)))});
              reg29 <= wire9[(4'hf):(3'h7)];
            end
          reg31 <= reg26;
          reg32 <= (7'h41);
          reg33 <= {reg30[(3'h4):(1'h1)], (8'haf)};
          reg34 <= reg14[(3'h5):(3'h5)];
        end
    end
  assign wire35 = (~|reg33[(4'h9):(3'h5)]);
  assign wire36 = reg19[(2'h2):(1'h0)];
  assign wire37 = {$unsigned((reg21[(1'h0):(1'h0)] ~^ wire8[(1'h1):(1'h0)])),
                      $unsigned(($unsigned($signed((7'h40))) ?
                          $signed((reg29 >> reg26)) : ({reg12, reg19} ?
                              {(8'hb0), wire9} : (wire35 ? (8'hac) : reg17))))};
  assign wire38 = (8'hac);
  assign wire39 = ($unsigned((8'hb3)) ?
                      ({$unsigned(wire37), reg15[(3'h4):(1'h0)]} ?
                          (7'h40) : ((((8'ha1) != reg29) ?
                                  $signed(reg33) : $signed(reg16)) ?
                              ($unsigned(wire6) && reg13) : (^~(~^reg19)))) : (~&(((reg26 ?
                              reg20 : (7'h43)) ?
                          $unsigned(reg24) : $unsigned(reg22)) - $signed((reg26 ?
                          wire9 : reg26)))));
  module40 #() modinst58 (wire57, clk, reg22, wire7, reg17, wire36);
endmodule

module module40
#(parameter param56 = (((8'hb2) ? (((8'hac) | ((8'ha1) <<< (8'h9d))) != ({(8'ha0), (8'haf)} == ((8'h9e) + (8'ha0)))) : ((((8'haa) >> (7'h41)) || ((8'hae) >= (8'hb4))) ~^ (((8'ha0) & (8'hbe)) + (7'h40)))) ? (+(&{((7'h42) ? (8'hb2) : (8'ha8))})) : (^~(&(^((8'hb2) ? (8'ha5) : (8'ha4)))))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire44;
  input wire [(5'h10):(1'h0)] wire43;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire46,
                 wire45,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire45 = $unsigned($unsigned((^$unsigned(wire44[(1'h0):(1'h0)]))));
  assign wire46 = (^~(wire41[(2'h2):(1'h0)] ?
                      {(wire42 ? $signed(wire44) : (wire41 ? wire44 : wire43)),
                          wire43[(4'he):(4'hb)]} : wire41[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg47 <= (($signed($signed((wire42 ? wire45 : (8'ha9)))) != {(&{wire42,
              wire44}),
          ($signed(wire43) ? (&wire46) : wire42)}) & wire46);
      reg48 <= wire41[(2'h2):(1'h1)];
      reg49 <= reg48[(4'hf):(4'hf)];
      reg50 <= ($signed(($signed($unsigned((8'hbe))) ?
              (+reg49[(2'h3):(1'h0)]) : $unsigned((-wire44)))) ?
          $signed($unsigned($signed($signed(wire42)))) : $unsigned(((~|$unsigned(wire41)) ?
              {wire42[(3'h6):(2'h2)]} : (8'hb4))));
      reg51 <= $unsigned({$unsigned((wire44[(2'h3):(2'h3)] ?
              (wire44 ? wire42 : wire42) : (wire43 ? reg47 : reg50)))});
    end
  assign wire52 = {$unsigned((7'h43)),
                      (($unsigned((~|wire45)) << {{wire44, reg51}}) ~^ wire44)};
  assign wire53 = (wire44[(2'h3):(1'h0)] ?
                      ($unsigned(wire44) ?
                          $unsigned((~^$unsigned(reg50))) : $unsigned($unsigned($unsigned(reg51)))) : ($unsigned((+wire41[(2'h3):(2'h2)])) ?
                          {$unsigned($signed(wire46)),
                              (reg48 - (reg47 ? reg47 : wire46))} : (~wire52)));
  assign wire54 = $unsigned(wire46);
  assign wire55 = wire41[(2'h3):(1'h1)];
endmodule

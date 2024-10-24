module top
#(parameter param88 = (({(&((7'h44) | (8'ha3)))} ? ((((8'haa) ? (8'hbb) : (8'haa)) ? ((8'hb7) >= (8'hb6)) : ((8'ha3) << (8'haa))) ? (((8'hb8) >>> (8'hbc)) >>> ((8'ha2) - (8'hbd))) : (((8'h9f) ? (8'h9e) : (8'hae)) * (~|(8'h9e)))) : {{((7'h44) >> (8'hba))}}) ? (-(7'h41)) : (|(((!(8'h9f)) ^~ ((7'h44) ? (8'ha1) : (8'hb2))) ? ((~(7'h40)) ^ {(8'hbf), (8'ha4)}) : (((8'ha3) ? (8'hbd) : (8'haf)) << (~(8'haf)))))), 
parameter param89 = param88)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire16,
                 wire15,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg32,
                 reg31,
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
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed((((~|(8'hb5)) == wire1[(3'h4):(2'h3)]) <<< wire1));
  assign wire6 = {$unsigned(wire3[(4'ha):(4'h9)]),
                     ((8'hb7) > $unsigned((^$signed(wire0))))};
  assign wire7 = $unsigned((~|({(-wire3), (-wire0)} ?
                     $unsigned((wire5 <= (8'hb6))) : (((8'ha1) ?
                             wire2 : wire3) ?
                         $unsigned(wire3) : wire6))));
  assign wire8 = wire7[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg9 <= ((-$signed((wire6[(3'h6):(1'h1)] & $signed(wire0)))) ^~ $signed($signed(wire2[(4'h9):(3'h7)])));
      reg10 <= $signed($signed({reg9}));
    end
  assign wire11 = ((reg9[(1'h0):(1'h0)] ?
                          ({((8'hb2) ? (7'h41) : wire4),
                              ((8'hb2) ~^ wire7)} ^ {$signed(wire3)}) : {$signed((&wire6)),
                              reg10[(2'h2):(1'h1)]}) ?
                      $signed((&wire5)) : $unsigned($unsigned(wire0)));
  always
    @(posedge clk) begin
      reg12 <= (wire5[(3'h4):(2'h2)] ?
          {wire11[(1'h1):(1'h1)],
              (((wire3 && (8'hae)) ? reg10[(1'h1):(1'h0)] : wire11) ?
                  ($unsigned(wire5) | (wire4 ?
                      wire6 : wire1)) : $signed((wire2 ?
                      wire2 : wire7)))} : $signed(reg9[(3'h4):(1'h1)]));
      reg13 <= ($signed($signed($unsigned((wire1 << (8'h9e))))) - wire3[(1'h0):(1'h0)]);
      reg14 <= $signed(($signed($unsigned((8'ha7))) ?
          (($signed(reg10) ?
              $signed((8'h9d)) : (wire8 <= wire2)) ~^ ((wire2 <= wire6) ?
              reg12 : wire11)) : {wire3, $unsigned(wire1)}));
    end
  assign wire15 = (~^(~^((!(reg13 ? reg10 : reg10)) * wire8[(4'h8):(1'h1)])));
  assign wire16 = wire2;
  always
    @(posedge clk) begin
      reg17 <= (($signed($unsigned($signed(wire16))) != ($unsigned((+wire15)) ^ $unsigned(wire15))) > ({(~^wire8),
          ((reg14 * reg12) * wire0)} || reg9[(2'h2):(2'h2)]));
      reg18 <= wire3;
      reg19 <= $unsigned((~&(($signed(reg9) & $unsigned(wire11)) ?
          (~(wire6 ? reg9 : reg17)) : ({wire5, wire0} <= reg14))));
      reg20 <= (~|(^({{(8'ha8), wire0}, reg17[(3'h4):(3'h4)]} ?
          (wire2[(1'h1):(1'h0)] ?
              (reg19 && wire0) : wire2[(2'h2):(1'h1)]) : (+$signed((8'ha6))))));
      if (({{(^~(wire3 - reg10)), ($unsigned(reg14) || reg14[(1'h1):(1'h1)])},
              $unsigned(({(8'hb0), reg17} >> wire8[(5'h10):(1'h0)]))} ?
          wire6 : ((~|($signed(wire4) | $signed((8'hba)))) ?
              (^($unsigned(wire3) ?
                  {reg18} : $unsigned(wire11))) : $signed((reg20[(4'hb):(4'h9)] ?
                  $unsigned(wire6) : wire3)))))
        begin
          if (reg17)
            begin
              reg21 <= (&(|wire15[(3'h7):(2'h2)]));
              reg22 <= (~wire3);
              reg23 <= ($signed($signed((wire11[(3'h5):(2'h3)] ^ $signed((8'hb4))))) & $unsigned(($signed($unsigned(wire2)) ?
                  (~(wire5 ?
                      (8'hae) : reg10)) : ($unsigned(wire4) && (8'hb1)))));
              reg24 <= $unsigned($signed($signed($signed(wire1[(3'h4):(3'h4)]))));
              reg25 <= {$unsigned(reg13[(4'h8):(3'h5)]),
                  $signed(reg9[(2'h3):(1'h1)])};
            end
          else
            begin
              reg21 <= wire15[(3'h7):(3'h6)];
              reg22 <= (reg18 || (~$unsigned(($unsigned(reg22) ?
                  reg13[(3'h7):(2'h3)] : $unsigned(reg17)))));
              reg23 <= $unsigned(wire4[(1'h1):(1'h0)]);
              reg24 <= (reg18 << (reg18 * $unsigned(wire4)));
              reg25 <= wire1[(3'h7):(1'h0)];
            end
          reg26 <= $signed(wire0);
          reg27 <= ($signed($signed(((wire4 >>> wire2) != (~&wire8)))) ?
              {(reg10 >= wire4[(1'h0):(1'h0)]),
                  wire11[(4'h8):(3'h6)]} : wire16[(2'h2):(1'h1)]);
          reg28 <= $unsigned((&(8'ha6)));
          if ((reg14[(3'h6):(3'h5)] ^~ (^~((&wire16[(2'h3):(2'h2)]) ?
              ((reg18 <= reg26) ?
                  (!reg25) : $signed(wire3)) : ($signed((8'hb9)) ?
                  wire2 : (~^wire7))))))
            begin
              reg29 <= $unsigned(reg13[(1'h1):(1'h0)]);
              reg30 <= ((((+$unsigned(reg21)) != (-wire11[(4'hc):(3'h4)])) <<< ((wire5 ?
                          $unsigned(reg22) : reg25) ?
                      $signed((reg26 > reg24)) : $unsigned($signed(wire8)))) ?
                  (reg28[(2'h2):(2'h2)] ^~ reg12) : $signed({(wire16 ?
                          (wire5 ? wire0 : reg19) : $unsigned(reg14)),
                      wire5[(4'h8):(3'h6)]}));
              reg31 <= (wire5[(2'h2):(2'h2)] ?
                  ($signed($unsigned($signed(wire1))) ^ reg29) : ($signed(((-wire5) || (+reg21))) ~^ wire7[(2'h2):(1'h0)]));
              reg32 <= $unsigned(wire15);
            end
          else
            begin
              reg29 <= ((~|($unsigned(((8'ha0) ?
                      wire2 : (8'hbc))) << (^~wire3[(4'hb):(4'h8)]))) ?
                  {((+$unsigned(reg19)) ? $signed(reg28) : reg31),
                      (wire7[(2'h2):(1'h0)] ?
                          (reg10[(1'h0):(1'h0)] ?
                              (reg9 ? wire16 : (8'hac)) : (wire5 ?
                                  reg31 : reg26)) : reg20[(3'h5):(2'h3)])} : $signed(((+reg32[(4'hc):(2'h3)]) & ((reg31 || wire6) ?
                      ((8'hae) ? reg25 : reg28) : (~^wire11)))));
              reg30 <= ((wire8 ?
                  reg18 : (reg14[(2'h2):(2'h2)] ?
                      ((reg32 ? wire16 : wire7) ?
                          (wire6 ?
                              reg31 : reg29) : $unsigned(reg18)) : ((wire15 ?
                          wire8 : (8'ha7)) >> reg14))) >>> (8'ha1));
            end
        end
      else
        begin
          reg21 <= reg31[(3'h5):(2'h2)];
          if ((reg10[(2'h2):(1'h1)] || $signed(($unsigned(((8'haf) <<< wire15)) + $signed((~&reg29))))))
            begin
              reg22 <= reg20[(4'h9):(4'h9)];
            end
          else
            begin
              reg22 <= (wire11[(3'h7):(3'h4)] ?
                  (~&($unsigned($signed(reg19)) ?
                      $unsigned(((8'had) - reg29)) : $signed($signed(reg18)))) : ($unsigned((reg27[(4'he):(4'hc)] >= (reg25 >>> wire0))) << $signed($signed(reg13[(3'h7):(3'h5)]))));
            end
          reg23 <= ((wire3[(4'h8):(1'h1)] ?
                  $signed(((~wire2) + (reg20 ^ wire0))) : ((~^wire7) <<< ($unsigned((8'h9f)) <<< {wire16}))) ?
              $unsigned(reg30[(1'h1):(1'h1)]) : (reg21[(1'h0):(1'h0)] & $unsigned(reg28[(3'h6):(3'h6)])));
          reg24 <= ($signed($unsigned({reg24[(3'h7):(1'h1)]})) ?
              reg12 : reg31[(3'h6):(3'h4)]);
        end
    end
  module33 #() modinst80 (wire79, clk, reg18, reg9, reg26, reg14);
  assign wire81 = reg12;
  assign wire82 = (+reg19);
  assign wire83 = (($unsigned($signed((wire16 ? wire2 : reg23))) ?
                      reg14 : $signed(((8'h9d) ?
                          (reg21 ? reg12 : reg29) : ((7'h44) ?
                              reg30 : wire1)))) < ((^~wire1) ?
                      $signed((8'hb2)) : {reg14}));
  assign wire84 = {(((&(reg18 ? wire79 : wire82)) ?
                          wire81 : $signed((~reg27))) ~^ (((wire16 << reg12) * (~^reg12)) ~^ ((^wire4) ?
                          (wire6 ? reg21 : reg26) : (+wire5)))),
                      reg12[(1'h0):(1'h0)]};
  assign wire85 = ((^~(($signed((8'hb0)) && wire5) ?
                      reg13[(1'h1):(1'h0)] : reg32[(4'hc):(3'h5)])) < (~(8'haa)));
  assign wire86 = wire8[(4'hd):(1'h1)];
  assign wire87 = (8'ha4);
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire37;
  input wire signed [(4'hb):(1'h0)] wire36;
  input wire [(3'h7):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire55;
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire55,
                 reg77,
                 (1'h0)};
  module38 #() modinst56 (.wire39(wire34), .y(wire55), .clk(clk), .wire40(wire36), .wire41(wire35), .wire42(wire37));
  module57 #() modinst70 (.wire60(wire36), .wire59(wire34), .clk(clk), .wire58(wire55), .y(wire69), .wire61(wire37));
  assign wire71 = {$signed($signed($signed(wire69)))};
  assign wire72 = (wire36[(2'h2):(1'h1)] ?
                      wire36 : (^~(($unsigned(wire35) ^ (wire37 | wire34)) ?
                          wire34 : wire69[(1'h0):(1'h0)])));
  assign wire73 = (^~{wire37[(4'he):(2'h3)], (~wire69[(2'h3):(1'h1)])});
  assign wire74 = wire36[(4'ha):(3'h7)];
  assign wire75 = $unsigned($unsigned(wire71));
  assign wire76 = (~&({((wire75 ? wire73 : wire75) >> ((8'ha7) != wire37))} ?
                      $signed((7'h41)) : (&($unsigned(wire36) ^ wire75[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg77 <= (wire76[(1'h1):(1'h0)] <<< $signed(wire76));
    end
  assign wire78 = wire55;
endmodule

module module57
#(parameter param67 = (({{((8'hbe) ? (8'hbf) : (8'hb4))}, ((~&(8'ha3)) ? ((7'h43) ? (7'h42) : (8'ha9)) : ((8'ha8) && (8'hbf)))} ^~ (({(8'ha9)} ? (8'hb6) : (~&(8'ha7))) ? ({(8'ha4)} ? ((8'h9f) ? (8'haa) : (8'hb5)) : {(8'hb6)}) : (~&(~&(8'haf))))) <<< ({(((8'hb1) ^~ (8'ha2)) * (^~(8'ha5)))} ? ((((8'hb3) ? (8'hb8) : (8'hb2)) ? (^(7'h41)) : ((8'ha6) <<< (8'hba))) ? (~((8'hb4) * (8'hbc))) : (((8'ha7) ? (8'hbc) : (7'h41)) * ((8'ha9) ? (8'h9d) : (8'ha4)))) : {(8'ha0), ((8'hbf) ~^ ((8'hb8) ? (8'haf) : (8'hbd)))})), 
parameter param68 = ((|{({param67} * param67), ({param67} >= ((8'haf) ? (8'ha9) : param67))}) ? {((-param67) ^~ (^~((8'hbe) ^~ param67))), param67} : (7'h40)))
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire61;
  input wire [(4'hb):(1'h0)] wire60;
  input wire signed [(5'h11):(1'h0)] wire59;
  input wire signed [(5'h12):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  assign y = {wire66, wire65, wire64, wire63, reg62, (1'h0)};
  always
    @(posedge clk) begin
      reg62 <= $signed(wire61[(1'h1):(1'h0)]);
    end
  assign wire63 = $unsigned((~{reg62}));
  assign wire64 = $unsigned(($signed(wire60) || (8'hbe)));
  assign wire65 = $signed($signed($signed($signed(((8'h9d) * wire60)))));
  assign wire66 = (wire59 ^ wire64[(3'h4):(2'h3)]);
endmodule

module module38
#(parameter param54 = (((-(~&((8'ha7) > (7'h43)))) ? (^(8'hb4)) : ({(+(7'h42)), {(8'haa)}} < ((+(8'ha2)) && ((8'hb8) == (8'hb5))))) ? (((&(-(8'hb0))) ? (((8'hb4) - (8'hb4)) ? {(8'ha8)} : ((8'ha3) ? (8'hb0) : (8'hbc))) : (8'hb1)) - (~&(((7'h40) + (8'hbe)) == ((8'h9c) ? (8'hb1) : (8'hb7))))) : (8'ha9)))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = $unsigned((-(!wire40)));
  assign wire44 = $signed(wire39[(4'h9):(1'h1)]);
  assign wire45 = wire42[(3'h7):(1'h0)];
  assign wire46 = (wire44 << wire41);
  assign wire47 = $unsigned((wire43[(3'h4):(2'h3)] ? (8'ha4) : wire40));
  assign wire48 = ((8'ha8) & wire47[(1'h0):(1'h0)]);
  assign wire49 = wire43;
  assign wire50 = $signed(($unsigned($signed($signed((7'h41)))) * $signed(wire45)));
  assign wire51 = (|$unsigned(wire46[(2'h3):(2'h3)]));
  assign wire52 = $signed({(|$signed(((8'ha8) && wire45)))});
  assign wire53 = wire39[(5'h11):(4'he)];
endmodule

module top
#(parameter param89 = (~|(((((8'hba) ? (8'h9d) : (8'hb1)) ? ((8'hb7) | (8'ha3)) : (|(8'ha6))) + {((8'hb1) ? (8'hba) : (8'had)), ((8'hb8) - (8'ha0))}) == ((((8'hbd) ? (8'hbf) : (8'h9c)) ~^ ((8'hba) ? (8'hab) : (8'ha5))) - (&(~(8'ha1)))))), 
parameter param90 = ((param89 || (8'hb3)) ~^ ((((param89 ? param89 : param89) & (param89 < param89)) && {(^param89)}) | ({(|param89), param89} >>> ({param89} ? param89 : param89)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire65,
                 wire51,
                 wire7,
                 wire6,
                 wire5,
                 reg83,
                 reg82,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire5 = (wire1[(1'h0):(1'h0)] ^~ $signed(wire0[(3'h7):(3'h4)]));
  assign wire6 = $unsigned(wire0);
  assign wire7 = ($unsigned((-wire4[(3'h7):(3'h5)])) << wire2[(3'h6):(2'h3)]);
  module8 #() modinst52 (wire51, clk, wire4, wire6, wire5, wire2);
  module53 #() modinst66 (wire65, clk, wire3, wire2, wire1, wire5);
  always
    @(posedge clk) begin
      reg67 <= $unsigned(({wire2[(3'h5):(3'h5)]} ?
          (wire65 ?
              {wire6[(4'he):(1'h1)]} : ({wire7} >> $unsigned(wire5))) : wire6[(4'he):(3'h4)]));
      if (wire6[(5'h10):(4'hd)])
        begin
          reg68 <= ($unsigned({{wire6[(2'h2):(2'h2)]},
              wire4}) & $signed((~&reg67[(3'h6):(2'h2)])));
          if (reg67[(3'h5):(3'h5)])
            begin
              reg69 <= ((wire2[(4'h8):(1'h1)] * wire3[(4'h9):(3'h6)]) * ((+wire2) >> {$signed(((7'h43) ?
                      (8'ha2) : wire7)),
                  $signed($signed((8'ha5)))}));
              reg70 <= $unsigned(reg69[(4'hc):(4'hc)]);
              reg71 <= {(^reg67[(2'h3):(1'h1)])};
              reg72 <= (~|(wire7 != reg68[(1'h1):(1'h0)]));
              reg73 <= ($signed({(wire1 && wire1[(3'h5):(3'h5)])}) > reg67[(3'h5):(3'h4)]);
            end
          else
            begin
              reg69 <= $signed((~^$unsigned($unsigned((reg69 >= wire2)))));
              reg70 <= reg69[(3'h6):(3'h5)];
            end
          reg74 <= reg71;
          reg75 <= $signed(wire4[(5'h10):(3'h6)]);
        end
      else
        begin
          reg68 <= wire5[(4'ha):(1'h1)];
          reg69 <= (reg73[(2'h3):(1'h0)] ?
              (~$signed($signed(wire1))) : (8'ha3));
          reg70 <= $unsigned({{(|(+wire3))},
              $signed({$signed(wire65), {reg72}})});
          reg71 <= reg72;
          reg72 <= $signed(reg68[(2'h3):(2'h2)]);
        end
      reg76 <= {{{{(wire51 == wire2), wire6[(3'h7):(3'h4)]}, wire6}}};
    end
  assign wire77 = wire6[(2'h3):(1'h0)];
  assign wire78 = $signed($signed($unsigned(reg69[(4'hb):(4'ha)])));
  assign wire79 = ((^(^~(&$signed(reg71)))) ?
                      $signed((8'ha3)) : (wire0[(5'h10):(4'hd)] << (($signed(wire1) <<< {(8'ha7)}) ?
                          reg69 : $unsigned($unsigned(wire3)))));
  assign wire80 = reg76[(4'h9):(3'h4)];
  assign wire81 = wire51[(4'h8):(3'h4)];
  always
    @(posedge clk) begin
      if (reg73[(1'h0):(1'h0)])
        begin
          reg82 <= ((|{reg74}) ? wire65 : reg76[(1'h1):(1'h0)]);
        end
      else
        begin
          reg82 <= (reg68[(3'h4):(2'h3)] ?
              {(reg82[(1'h0):(1'h0)] ?
                      $signed(wire3) : reg76)} : (+$unsigned({(^wire3)})));
        end
      reg83 <= wire1[(1'h1):(1'h0)];
    end
  assign wire84 = $signed((^~{{wire79[(3'h6):(1'h0)]}}));
  assign wire85 = reg69[(3'h7):(2'h3)];
  assign wire86 = $unsigned($signed((^~((wire6 ? reg74 : wire85) ?
                      (~&wire80) : (wire3 ^~ reg75)))));
  assign wire87 = $unsigned(wire78);
  assign wire88 = ($signed((wire80[(1'h1):(1'h1)] ?
                          wire77[(1'h0):(1'h0)] : reg73[(1'h0):(1'h0)])) ?
                      (~^$signed((&{wire87}))) : (!{reg68[(1'h0):(1'h0)],
                          (reg67 > reg68)}));
endmodule

module module53
#(parameter param64 = ((^((((8'hbc) ? (8'hbf) : (8'hb0)) ? (8'ha0) : (8'haa)) & (((8'ha3) & (8'hba)) ? ((7'h40) ? (8'hb6) : (8'h9c)) : ((8'h9e) ? (8'hba) : (8'ha3))))) ? (8'hbe) : ((((+(8'hb2)) - (|(8'h9d))) ? ((7'h41) != {(8'h9c), (8'ha5)}) : {((8'ha2) ? (8'hbb) : (8'hbe)), ((7'h43) ? (8'hb9) : (8'ha6))}) ^ (8'hbe))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire57;
  input wire [(2'h2):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  input wire [(2'h3):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  assign y = {wire63, wire59, wire58, reg62, reg61, reg60, (1'h0)};
  assign wire58 = (wire54[(2'h2):(2'h2)] ?
                      $signed(wire54[(1'h0):(1'h0)]) : ($signed($signed({wire56,
                              wire55})) ?
                          $signed($signed(wire54[(1'h1):(1'h1)])) : wire54[(1'h1):(1'h0)]));
  assign wire59 = (^~(-$signed(wire56)));
  always
    @(posedge clk) begin
      reg60 <= (wire57 ?
          (wire54 ?
              ((+((8'haf) ^ wire57)) && wire59[(2'h2):(1'h0)]) : (+wire58)) : wire59);
      reg61 <= (8'hbf);
      reg62 <= (((~^$signed((|(8'ha8)))) ? wire59 : wire57) ?
          reg60[(2'h2):(1'h0)] : $signed({((wire55 * wire54) ?
                  $signed(wire56) : $unsigned(wire57)),
              reg60[(1'h1):(1'h0)]}));
    end
  assign wire63 = (wire54[(2'h3):(1'h1)] >> (~|wire56[(1'h0):(1'h0)]));
endmodule

module module8
#(parameter param49 = (~(&{((~&(7'h41)) <= ((8'hbb) ? (8'haa) : (8'hb1)))})), 
parameter param50 = (((((param49 ? param49 : param49) ? (-param49) : {(8'hb1), param49}) >>> (((8'ha6) ? param49 : param49) ? ((8'h9d) ? param49 : param49) : param49)) ? {(~|{(8'ha3)})} : param49) ? (&(~&(+(^~param49)))) : (!((param49 << (param49 >> param49)) ? {(7'h44), (&param49)} : (+(param49 + (8'h9e)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire44;
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire44,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= {((wire12 ?
              ($signed(wire9) ?
                  (wire12 ?
                      (8'hb1) : wire10) : wire9) : wire12) * $signed($signed($unsigned((8'hb9))))),
          (&$signed(((wire9 <<< wire12) ? (8'hb8) : (|wire10))))};
      reg14 <= $unsigned({(wire12[(1'h1):(1'h0)] ?
              ((wire11 ? wire12 : wire12) ?
                  wire12 : wire11[(5'h10):(1'h0)]) : ((wire10 && wire11) <= wire11[(5'h10):(4'hf)])),
          wire9});
      reg15 <= (^~(wire11[(2'h3):(1'h0)] * ($signed(wire12) >= ($signed((8'h9c)) * (^~wire11)))));
      if (reg13[(3'h6):(2'h3)])
        begin
          reg16 <= (&reg14);
          reg17 <= ($unsigned(((wire11[(2'h2):(2'h2)] >>> $unsigned(wire10)) ?
              $unsigned((+reg14)) : $unsigned((reg15 << wire11)))) >> ((^({reg13} | (~&reg13))) | (reg15[(3'h7):(1'h0)] ?
              $signed((wire9 ?
                  reg13 : wire10)) : ((+reg13) == $signed(wire11)))));
          reg18 <= (~^(~$signed(wire10)));
        end
      else
        begin
          reg16 <= (8'hac);
          if ($signed($signed($signed(($unsigned(reg15) ? (|wire10) : reg17)))))
            begin
              reg17 <= wire11[(4'he):(3'h7)];
              reg18 <= reg14;
              reg19 <= ((($unsigned((+wire9)) ?
                      ($signed((8'ha8)) * ((8'h9f) ?
                          wire11 : wire11)) : wire11) + $unsigned({{wire12}})) ?
                  ((^~(reg14 ? (^(8'hb5)) : ((8'hae) && reg15))) ?
                      reg17[(4'hb):(2'h3)] : ($unsigned($signed(wire9)) ?
                          ($signed(wire9) + wire12) : reg18[(3'h6):(3'h4)])) : {({(~&reg14),
                              $unsigned(wire12)} ?
                          (reg15 - wire9[(1'h1):(1'h0)]) : wire9[(3'h5):(3'h4)]),
                      $signed($signed(reg18))});
              reg20 <= wire10;
              reg21 <= ($unsigned((^~reg19[(3'h7):(1'h0)])) ?
                  wire12 : $unsigned($unsigned(reg15)));
            end
          else
            begin
              reg17 <= ((^((wire12[(2'h2):(1'h0)] ?
                      (reg20 <= (8'hb2)) : wire9) ?
                  $unsigned({wire10}) : $signed(reg15))) >= $unsigned({reg13}));
              reg18 <= wire12[(3'h7):(3'h7)];
              reg19 <= $unsigned($signed((((!reg16) * (reg17 ^~ reg20)) ?
                  wire10[(4'h8):(1'h1)] : reg21)));
              reg20 <= reg17[(5'h10):(3'h4)];
            end
          if (((8'hb4) < ($signed(wire12) ?
              $unsigned($signed((8'ha8))) : $unsigned((reg18[(2'h2):(1'h0)] ?
                  wire11 : {(8'ha6), reg15})))))
            begin
              reg22 <= $unsigned($unsigned(wire10));
              reg23 <= ($signed((reg15[(3'h4):(2'h3)] - {{wire12}})) * $unsigned(reg17[(4'ha):(4'ha)]));
              reg24 <= reg20[(2'h2):(2'h2)];
              reg25 <= $unsigned((^reg18[(4'hc):(3'h6)]));
              reg26 <= reg15[(4'hd):(3'h6)];
            end
          else
            begin
              reg22 <= (^(reg23[(4'ha):(3'h6)] ~^ (~(8'hbe))));
              reg23 <= $unsigned(reg21[(4'h9):(4'h8)]);
            end
        end
      reg27 <= reg19[(4'h9):(3'h5)];
    end
  module28 #() modinst45 (wire44, clk, reg19, reg13, reg22, reg17, reg26);
  assign wire46 = $signed($signed($unsigned($unsigned(reg26[(1'h0):(1'h0)]))));
  assign wire47 = (8'haf);
  assign wire48 = (8'hb0);
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned({(!wire33[(1'h0):(1'h0)]), $signed(wire31[(3'h4):(3'h4)])}))
        begin
          reg34 <= (wire33 >= ((wire32[(4'hd):(4'hb)] >> (wire33[(3'h7):(3'h7)] == wire32[(5'h10):(4'h8)])) * wire31));
          if ({($signed((!(wire32 >= (8'hb9)))) ?
                  reg34[(1'h1):(1'h1)] : (~^wire32)),
              (wire31[(3'h5):(3'h5)] ?
                  $unsigned((wire30[(2'h2):(2'h2)] ?
                      (wire29 | wire30) : wire31[(3'h4):(1'h1)])) : ((~|{wire31,
                          reg34}) ?
                      ($signed(wire29) - $signed(wire31)) : ({(8'hb7), wire32} ?
                          $signed(wire30) : wire33)))})
            begin
              reg35 <= wire29[(3'h6):(3'h5)];
              reg36 <= reg35[(3'h4):(1'h0)];
              reg37 <= (reg34 || $unsigned($signed(((wire29 * wire30) >>> ((8'h9f) && wire29)))));
            end
          else
            begin
              reg35 <= reg35[(4'h9):(1'h0)];
              reg36 <= $signed($signed(reg36));
              reg37 <= $signed(reg35);
              reg38 <= (!(wire30[(1'h0):(1'h0)] ?
                  reg37[(3'h6):(2'h2)] : $unsigned($signed($unsigned(reg35)))));
            end
          reg39 <= reg35;
          reg40 <= $signed($signed(wire29[(3'h5):(2'h2)]));
        end
      else
        begin
          reg34 <= (wire33 ? $signed(wire32[(4'hf):(4'h8)]) : reg35);
          reg35 <= wire30[(2'h2):(1'h0)];
          if (wire33[(1'h0):(1'h0)])
            begin
              reg36 <= $signed({(8'hbc),
                  ({(reg40 ? reg37 : wire31),
                      $signed((8'hb0))} >> $signed(wire31))});
              reg37 <= {((|$signed(reg36[(1'h1):(1'h0)])) <= (wire29[(1'h1):(1'h0)] & reg39[(4'h8):(1'h0)])),
                  (~&$unsigned(({(8'h9d), reg40} ?
                      (reg39 - reg38) : $signed((8'hb7)))))};
              reg38 <= (((-({(7'h43)} == $unsigned((7'h40)))) ?
                      $unsigned((wire29[(3'h5):(1'h1)] ?
                          (wire29 ? wire30 : reg38) : (reg35 ?
                              (8'hba) : wire29))) : (+($unsigned(reg38) <= (~^reg38)))) ?
                  {($unsigned((8'hb3)) << $unsigned((reg35 == (8'hbd))))} : reg37);
              reg39 <= ((&(wire32 | (wire31[(3'h5):(1'h1)] ?
                  (reg36 ? reg38 : wire29) : $signed(wire33)))) ~^ {wire31});
              reg40 <= wire33[(3'h5):(2'h3)];
            end
          else
            begin
              reg36 <= ($unsigned(reg38[(2'h3):(1'h1)]) << $signed($unsigned((wire32 > (reg38 ^ wire32)))));
              reg37 <= reg40;
            end
        end
    end
  assign wire41 = wire30[(1'h0):(1'h0)];
  assign wire42 = ((($signed({wire33, wire31}) ? reg37 : (~&{wire41})) ?
                      wire29 : wire41) > ((wire41[(4'h9):(3'h4)] <= wire32[(3'h5):(1'h0)]) ^ reg39));
  assign wire43 = (8'hb5);
endmodule

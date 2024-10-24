module top #(parameter param152 = (8'hbb)) (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire148;
  wire signed [(4'h9):(1'h0)] wire150;
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  assign y = {wire130,
                 wire86,
                 wire85,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire13,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire83,
                 wire132,
                 wire148,
                 wire150,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire4 = {$signed((|wire1))};
  assign wire5 = $unsigned((^~((wire2 ? ((8'hb4) ? wire0 : wire0) : (8'hb4)) ?
                     $signed({wire2, wire1}) : (~^$signed(wire3)))));
  assign wire6 = $signed(wire1);
  assign wire7 = (~|wire4[(4'h8):(2'h2)]);
  assign wire8 = wire5;
  always
    @(posedge clk) begin
      reg9 <= {($unsigned($signed($unsigned(wire3))) ?
              wire1 : $unsigned(wire1)),
          ($unsigned(wire3) ?
              (wire3 ?
                  (~|(wire2 | wire3)) : wire5[(1'h1):(1'h0)]) : $unsigned(wire6))};
      reg10 <= $signed((($signed($unsigned(wire0)) ?
              $signed(wire8[(2'h3):(2'h3)]) : ((wire0 | wire1) ?
                  ((8'hae) ? wire6 : wire5) : (wire8 ? wire5 : (8'hb4)))) ?
          {$unsigned(wire7[(3'h5):(3'h5)])} : $signed(((wire7 ?
                  wire1 : (8'hb1)) ?
              (reg9 ^ wire4) : $unsigned(wire4)))));
      reg11 <= ((wire2 && (~^(^~(wire7 >> wire4)))) ? wire1 : wire4);
      reg12 <= wire4[(3'h6):(2'h3)];
    end
  assign wire13 = (8'haa);
  always
    @(posedge clk) begin
      reg14 <= ((7'h40) & wire4[(4'h9):(2'h3)]);
      reg15 <= reg10;
      if ({reg12, {{(~|(-(7'h40)))}}})
        begin
          reg16 <= (reg12 ?
              $unsigned($unsigned($unsigned(reg10))) : $unsigned(wire2[(4'h8):(1'h0)]));
          reg17 <= (+$unsigned(wire6));
          reg18 <= wire3;
          reg19 <= {wire6[(1'h0):(1'h0)]};
          reg20 <= wire4[(3'h5):(1'h0)];
        end
      else
        begin
          reg16 <= (^(8'hb3));
          reg17 <= reg12[(4'h8):(3'h5)];
          reg18 <= (reg11 != ((reg18 ?
                  wire5[(3'h6):(2'h3)] : ($signed(wire7) ?
                      {wire3} : (wire3 ? reg10 : (7'h41)))) ?
              reg18 : $signed((reg18 ? (&reg17) : (&wire2)))));
          reg19 <= ((~^($signed(reg14) ?
                  ((wire3 ^~ reg9) & {wire0}) : ($unsigned(reg12) ?
                      (wire8 ? reg16 : wire1) : (wire0 - (8'hb6))))) ?
              reg15[(3'h7):(1'h0)] : (wire0 ?
                  reg19 : $unsigned({$signed(reg17), $unsigned(wire0)})));
        end
    end
  assign wire21 = reg19;
  assign wire22 = ((wire4[(3'h5):(2'h2)] != $unsigned(reg10[(1'h1):(1'h1)])) == reg14);
  assign wire23 = (^(|((((8'ha4) <<< reg15) - $signed(reg16)) - ($unsigned(reg17) ?
                      (8'hab) : (reg18 ? wire6 : reg12)))));
  assign wire24 = $unsigned((~^(+$signed((wire6 ? wire21 : wire3)))));
  assign wire25 = (~&$signed((wire13 << (wire23[(5'h10):(4'ha)] ?
                      (~reg17) : $signed(wire1)))));
  assign wire26 = $signed((^~reg14));
  assign wire27 = {{((^~wire0) ?
                              $unsigned(wire7[(2'h2):(1'h0)]) : (!(+(8'ha0)))),
                          (|wire25[(2'h3):(2'h3)])},
                      reg19[(4'h8):(3'h6)]};
  module28 #() modinst84 (wire83, clk, wire8, wire6, wire23, reg10);
  assign wire85 = $signed({(wire83[(2'h2):(2'h2)] ?
                          ($unsigned(wire26) == $signed(wire27)) : wire27),
                      $signed($unsigned(reg19))});
  assign wire86 = wire21;
  module87 #() modinst131 (.wire89(wire24), .wire88(reg11), .wire91(wire85), .wire90(wire0), .y(wire130), .clk(clk));
  assign wire132 = (|((&wire3[(4'ha):(3'h7)]) & (~^wire8)));
  module133 #() modinst149 (wire148, clk, wire21, wire0, reg10, wire130, wire85);
  module98 #() modinst151 (.wire99(wire7), .wire103(wire2), .wire102(wire25), .wire101(wire130), .clk(clk), .wire100(wire3), .y(wire150));
endmodule

module module133
#(parameter param147 = (((&({(8'haf)} >>> ((8'had) ? (7'h43) : (8'ha6)))) + (!(~((7'h42) ? (8'hb6) : (8'ha6))))) ? (((!((8'hae) | (8'ha2))) >>> {((8'ha6) ? (8'hb7) : (8'hb5)), ((8'ha3) ? (8'ha9) : (8'hbb))}) >= {(((8'hb6) < (8'hb3)) ? ((8'had) ? (8'hb5) : (7'h44)) : (~^(8'had)))}) : (&(((8'hb2) ? (~(8'hb3)) : ((8'h9e) | (8'hb8))) ^~ (^~((8'ha5) ? (8'haa) : (8'h9c)))))))
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire138;
  input wire signed [(5'h11):(1'h0)] wire137;
  input wire [(5'h10):(1'h0)] wire136;
  input wire signed [(4'ha):(1'h0)] wire135;
  input wire [(4'hf):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire145;
  wire [(5'h12):(1'h0)] wire144;
  wire [(4'hf):(1'h0)] wire143;
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg139 <= $signed(wire135[(3'h6):(2'h3)]);
      reg140 <= $unsigned(({(-(wire136 ? reg139 : reg139))} ?
          (-{(wire135 >> wire137)}) : wire136));
      reg141 <= (|(^~wire137[(4'h8):(4'h8)]));
      reg142 <= $signed(wire135[(2'h2):(1'h1)]);
    end
  assign wire143 = (($signed(wire136) ^~ reg142[(4'h8):(3'h7)]) ?
                       ({(wire134[(2'h2):(1'h0)] ?
                               (~&reg139) : (reg139 ? reg140 : wire138)),
                           (~|wire136[(4'h8):(2'h3)])} >>> wire134[(4'h9):(4'h8)]) : $unsigned(($unsigned((reg142 ?
                           reg142 : reg142)) != $signed((^~wire135)))));
  assign wire144 = $unsigned({({reg140[(3'h4):(3'h4)]} >>> (((8'hb0) ?
                               wire135 : wire138) ?
                           $unsigned(reg142) : $signed(wire134))),
                       $signed(((^(8'hae)) ? {reg139} : wire138))});
  assign wire145 = $unsigned(wire143[(4'hc):(3'h5)]);
  assign wire146 = (|wire144[(4'h8):(3'h7)]);
endmodule

module module87
#(parameter param129 = ((^~{((8'h9c) ? ((8'hb3) & (8'hb8)) : (^(8'hb6))), (((8'ha5) ? (8'hb4) : (8'hba)) ^ {(8'hbe)})}) * ((((|(8'hbf)) ? (~&(8'hb5)) : ((8'hb8) > (8'ha6))) > ((8'hb2) ? {(8'hbe), (8'h9e)} : ((8'hb9) == (8'hb8)))) ? ((&((8'h9f) ? (8'h9d) : (8'ha6))) != ({(8'haf)} ~^ ((8'ha2) ? (8'h9d) : (8'ha5)))) : (({(7'h40), (8'hae)} ? ((8'hb4) <<< (7'h43)) : ((8'hbd) ? (8'ha0) : (8'hbe))) - (((8'hbe) ? (8'hb4) : (8'haf)) && ((8'hb7) ? (8'hae) : (8'ha5)))))))
(y, clk, wire88, wire89, wire90, wire91);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire [(5'h11):(1'h0)] wire89;
  input wire signed [(4'ha):(1'h0)] wire90;
  input wire [(5'h13):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire127;
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  assign y = {wire92, wire93, wire95, wire96, wire97, wire127, reg94, (1'h0)};
  assign wire92 = $signed((8'hb5));
  assign wire93 = (~$unsigned($unsigned(wire90)));
  always
    @(posedge clk) begin
      reg94 <= ({wire92} ? wire90[(4'h8):(1'h0)] : (8'h9e));
    end
  assign wire95 = wire92[(3'h7):(1'h1)];
  assign wire96 = wire91[(4'hf):(4'hb)];
  assign wire97 = wire88;
  module98 #() modinst128 (.wire101(wire97), .wire102(wire91), .wire100(wire89), .y(wire127), .clk(clk), .wire103(wire92), .wire99(wire88));
endmodule

module module28
#(parameter param81 = ((8'hbb) >= ((+(~((7'h42) <= (8'h9f)))) | ({{(8'hab), (8'ha5)}, ((8'ha4) ? (8'hae) : (8'hb3))} <<< (((8'ha5) ^~ (8'h9e)) ? {(8'hab)} : (-(8'hbf)))))), 
parameter param82 = {{(param81 <= (param81 != (param81 ? param81 : param81))), (({(8'hb5), (8'hb8)} ? {param81, param81} : param81) ? param81 : param81)}, ({(8'hbd), (param81 ^~ (&param81))} <<< (+param81))})
(y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire78;
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire80,
                 wire33,
                 wire34,
                 wire57,
                 wire78,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = ($unsigned((wire32 ?
                          $signed(wire31[(1'h1):(1'h0)]) : ((+wire30) <= (&wire30)))) ?
                      ((8'hbb) ^ $signed(((~&wire29) <<< (wire32 ?
                          (7'h42) : wire30)))) : $signed((($unsigned(wire31) ?
                              {(8'ha6)} : wire31) ?
                          $signed({(7'h40)}) : wire29)));
  assign wire34 = ($unsigned((wire31[(3'h5):(3'h4)] ?
                      $unsigned($unsigned(wire30)) : (((8'ha9) & wire31) >>> {wire30,
                          (8'ha6)}))) != {{wire32[(4'h9):(4'h9)]}});
  always
    @(posedge clk) begin
      reg35 <= (wire29[(4'h9):(4'h8)] + ((!$signed($unsigned(wire34))) & wire30));
      reg36 <= reg35;
      reg37 <= $unsigned($unsigned((+((wire33 + wire31) ?
          wire29 : $unsigned(reg36)))));
      reg38 <= (|$signed((((&wire34) == $unsigned(reg37)) ?
          ($signed(wire33) ?
              (wire30 ? wire30 : wire33) : reg37[(4'h8):(1'h1)]) : (&(wire30 ?
              reg36 : reg36)))));
      if (wire33[(3'h5):(3'h4)])
        begin
          reg39 <= (wire34[(1'h0):(1'h0)] ? (!wire32) : wire31[(2'h3):(1'h0)]);
          reg40 <= (&((wire29 > wire31[(1'h0):(1'h0)]) ?
              (~(~&(^reg37))) : (($signed(reg35) ?
                  ((8'haf) < (8'h9c)) : {(8'hbf), reg37}) - wire32)));
          if ($signed($unsigned(wire30[(1'h1):(1'h1)])))
            begin
              reg41 <= reg38;
            end
          else
            begin
              reg41 <= (|wire29[(4'hd):(2'h2)]);
            end
          reg42 <= reg37;
        end
      else
        begin
          if (reg38)
            begin
              reg39 <= $unsigned($signed(wire32));
              reg40 <= wire34;
              reg41 <= $unsigned((reg39[(3'h7):(3'h7)] * (!{$signed(wire33),
                  (reg39 <= wire32)})));
            end
          else
            begin
              reg39 <= reg41[(2'h3):(1'h0)];
              reg40 <= (!reg40[(2'h3):(2'h2)]);
              reg41 <= reg39[(3'h6):(3'h4)];
            end
          if ((reg35[(3'h4):(1'h1)] ? $signed((^(~|{reg41}))) : wire32))
            begin
              reg42 <= (({{{(8'ha7), wire30}}} >> (reg41 & (~&(reg36 ?
                  reg37 : reg35)))) && (^wire32[(4'h9):(3'h4)]));
              reg43 <= $unsigned(((^~wire32) ?
                  (|{$signed(reg39)}) : (~^wire32[(4'hd):(4'hc)])));
              reg44 <= (8'hbc);
              reg45 <= reg36;
              reg46 <= $signed((((wire29 ?
                      (wire32 != reg36) : (wire32 ?
                          reg39 : reg43)) >>> $signed($unsigned(reg40))) ?
                  reg41[(3'h5):(1'h0)] : (&((reg40 ? reg40 : wire30) ?
                      reg38 : {reg42, reg39}))));
            end
          else
            begin
              reg42 <= reg38;
              reg43 <= {reg45[(1'h0):(1'h0)], (-(+(~&$signed(reg46))))};
              reg44 <= ($unsigned(({(8'ha1)} != $signed(wire32[(4'h8):(3'h5)]))) ?
                  $signed((~((reg36 ~^ wire33) << (reg40 >= wire29)))) : {(8'hb7)});
            end
          reg47 <= $signed(wire30[(2'h2):(1'h1)]);
          reg48 <= (~&reg41[(4'hc):(2'h2)]);
          reg49 <= wire33[(2'h2):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg50 <= ((({(reg38 ? reg45 : reg35),
              (8'hb8)} * reg37[(3'h6):(1'h1)]) <= ($signed((~&reg36)) == reg38)) ?
          reg45 : $unsigned({(^~(reg40 ? reg46 : reg43))}));
      reg51 <= (($signed(wire29) >= $signed(reg41[(2'h3):(1'h0)])) ?
          (reg47[(1'h0):(1'h0)] ?
              ((!reg36[(3'h4):(2'h3)]) ?
                  (wire30[(3'h6):(1'h1)] ^ (^reg36)) : reg39) : $unsigned((-reg36[(4'hb):(1'h0)]))) : reg37[(1'h1):(1'h1)]);
      reg52 <= $unsigned((+reg38));
      if ({wire30,
          ((reg37[(2'h3):(2'h3)] ?
              reg38[(1'h0):(1'h0)] : $signed((reg50 > reg51))) < $signed((8'hae)))})
        begin
          reg53 <= reg49;
          reg54 <= (~|({(-$unsigned(reg50)),
              $signed(((8'hb0) & reg50))} + (^reg40[(3'h4):(1'h0)])));
          reg55 <= {((reg48[(3'h5):(1'h1)] ?
                      {reg42, (reg42 ? reg44 : reg44)} : $signed((reg45 ?
                          reg43 : wire31))) ?
                  ($signed((reg37 >> reg40)) >> (~^(reg38 || (8'hbe)))) : reg36[(3'h4):(3'h4)])};
          reg56 <= (($unsigned(($unsigned(reg48) ^ $unsigned(reg45))) ?
                  (&reg54) : (reg47[(3'h7):(3'h7)] == $signed(reg43))) ?
              ($signed(reg42) ?
                  reg55 : ({reg39} && $signed($unsigned(reg52)))) : reg46[(4'he):(2'h2)]);
        end
      else
        begin
          reg53 <= (~(wire29[(4'h9):(3'h6)] ? reg47 : reg49));
          reg54 <= (-(reg35[(4'h9):(2'h3)] ?
              ((~&reg54) ?
                  reg55[(1'h1):(1'h1)] : wire33[(3'h5):(3'h5)]) : ($signed($unsigned((8'hbd))) ?
                  ((reg43 == (8'ha7)) >> (reg38 - (8'hb0))) : (^$unsigned(reg45)))));
        end
    end
  assign wire57 = ({(((reg35 ? reg42 : reg45) ? (+reg50) : (8'had)) ?
                              $unsigned((reg38 ? reg46 : reg48)) : (((8'hb8) ?
                                  (8'ha4) : wire31) + (8'ha1))),
                          $signed(reg51)} ?
                      ((-$unsigned((reg49 * reg45))) ?
                          (reg41[(3'h7):(2'h2)] + (^~$unsigned(reg38))) : {$signed(reg37)}) : (^(^~(reg51 ?
                          (reg52 ? reg50 : reg43) : {reg36, wire31}))));
  module58 #() modinst79 (.clk(clk), .wire62(reg50), .wire60(wire34), .wire59(reg47), .y(wire78), .wire63(reg43), .wire61(reg52));
  assign wire80 = $signed((!reg40));
endmodule

module module58
#(parameter param76 = ({((((8'h9e) ? (8'had) : (8'hb1)) ? ((8'h9f) - (8'hb9)) : ((8'h9d) ? (8'hbf) : (8'hbd))) ? ((~|(8'hac)) ? ((7'h42) - (8'hbf)) : ((8'hb4) ? (8'ha0) : (7'h44))) : (((8'h9f) ? (8'haf) : (8'ha8)) ? (~(7'h42)) : (^~(8'hbe)))), (~{{(8'ha1)}})} ? (((~^((7'h41) ? (8'ha8) : (8'h9c))) ? (((8'hb1) ? (8'hbb) : (8'hac)) ~^ ((8'ha2) ^ (8'h9d))) : (!(8'h9c))) == {(~&(!(7'h44))), (!{(8'ha4)})}) : (((~((8'h9f) ? (8'hb3) : (7'h44))) <= (&(&(8'hbf)))) ? (~&((^~(8'ha9)) ? {(8'hbf)} : (8'hb5))) : {(((8'hac) ~^ (8'h9c)) ? ((8'hb5) ? (8'hba) : (8'ha2)) : ((8'hbe) ? (8'h9c) : (8'ha0))), (((8'ha4) ? (8'ha8) : (8'hb0)) ? (~(8'hbf)) : ((8'hb0) ? (8'h9d) : (7'h40)))})), 
parameter param77 = ((~&(~|(((8'ha8) >>> param76) ? param76 : (^~param76)))) ? ({param76, param76} ? ((param76 ? (param76 ^ param76) : (8'hb2)) >= ((^param76) ? (param76 ? param76 : (8'ha1)) : param76)) : param76) : {(~^((!(7'h40)) ? (param76 & param76) : (param76 ? param76 : param76)))}))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire63;
  input wire [(4'hf):(1'h0)] wire62;
  input wire signed [(3'h4):(1'h0)] wire61;
  input wire [(5'h13):(1'h0)] wire60;
  input wire signed [(4'h9):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire64;
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire64,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire64 = (wire59[(2'h3):(2'h3)] && ((~^wire63) << (!{$signed((8'haa))})));
  always
    @(posedge clk) begin
      reg65 <= wire60;
      reg66 <= $signed(((wire62[(2'h2):(2'h2)] ?
          ({wire64,
              (8'had)} ^~ (!(8'hb7))) : (!wire60)) ^ $signed(wire59[(1'h1):(1'h1)])));
      if (((wire63 | (&wire63[(2'h2):(2'h2)])) ? $unsigned(wire60) : wire61))
        begin
          if ({{(~&reg65[(3'h4):(3'h4)]), reg66[(3'h4):(2'h2)]}})
            begin
              reg67 <= (~&(($signed((reg65 ?
                      wire63 : wire60)) >= ($signed(wire59) + $signed(wire60))) ?
                  $signed($signed({(7'h40), (8'hbf)})) : (|(~&(wire60 ?
                      wire61 : (8'hac))))));
              reg68 <= (((((8'hb8) ?
                      {reg65} : $unsigned(wire61)) <= wire63[(3'h5):(1'h0)]) * (+(!(~&wire63)))) ?
                  wire62 : reg67[(4'hc):(3'h5)]);
            end
          else
            begin
              reg67 <= ((reg65[(3'h4):(1'h1)] || (+(!$signed(reg65)))) ?
                  reg68 : (8'hb0));
              reg68 <= {(((&(^~wire61)) & $unsigned($signed((7'h42)))) ?
                      $signed(wire64[(2'h2):(1'h0)]) : reg67[(1'h1):(1'h1)]),
                  wire60[(4'hf):(3'h5)]};
              reg69 <= (wire62[(4'he):(4'hb)] <<< ($signed($signed((reg67 ?
                      wire59 : reg67))) ?
                  $unsigned($unsigned((wire64 > wire61))) : (~&reg65)));
              reg70 <= ((($unsigned((reg69 || reg66)) + $signed((reg66 << reg69))) ~^ ($signed($unsigned(wire62)) ?
                      wire64 : $signed(wire59))) ?
                  ((8'hbb) << $unsigned(reg65)) : (wire59 ?
                      wire63[(4'ha):(2'h3)] : {reg69, {$unsigned(wire64)}}));
              reg71 <= (~|reg70[(2'h2):(1'h0)]);
            end
          if ($signed(($signed(((+reg68) | reg71[(1'h1):(1'h0)])) ?
              (~^$signed($signed(reg70))) : ((&reg67) ?
                  reg71 : $unsigned({wire59})))))
            begin
              reg72 <= (~&({$signed($unsigned((7'h43))),
                      ($unsigned(wire60) + reg67)} ?
                  (^$unsigned($signed(wire64))) : $signed($signed($signed((8'hb5))))));
            end
          else
            begin
              reg72 <= ({$unsigned({$signed(wire63), $unsigned(reg70)}),
                  $signed(wire59[(1'h0):(1'h0)])} | ((~&wire62) ?
                  ((8'hb2) ?
                      wire59 : {$signed(wire59),
                          (+reg70)}) : $signed(wire64[(1'h1):(1'h0)])));
              reg73 <= reg66;
            end
        end
      else
        begin
          reg67 <= (({$signed((reg70 - wire59))} <<< $unsigned($signed(reg70))) && wire63);
          reg68 <= ((~&(8'hba)) | (~|reg68[(1'h1):(1'h1)]));
          reg69 <= (((^$signed((~&wire61))) != (+(|$signed(reg68)))) >= wire64[(3'h5):(2'h2)]);
        end
    end
  assign wire74 = (^~$unsigned((reg72 - $signed((^~reg70)))));
  assign wire75 = (^~{$signed(($signed((8'hb9)) ^~ (wire64 ?
                          (7'h42) : reg66)))});
endmodule

module module98
#(parameter param126 = {((^(+((8'ha6) - (7'h40)))) ? ((&((8'ha7) > (7'h44))) ? (&((8'hac) ? (8'ha2) : (8'ha4))) : (~{(8'hba), (7'h40)})) : (((^(7'h42)) >>> {(8'h9f), (8'h9d)}) >>> (~|(~(8'ha0)))))})
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire103;
  input wire signed [(4'he):(1'h0)] wire102;
  input wire signed [(3'h6):(1'h0)] wire101;
  input wire signed [(5'h11):(1'h0)] wire100;
  input wire [(3'h7):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire104 = $signed((($signed($signed(wire99)) != ((wire99 * (8'hae)) ^~ $unsigned(wire99))) ?
                       (($signed(wire103) ? (~|wire99) : $unsigned(wire101)) ?
                           ($signed(wire99) ?
                               $unsigned((7'h40)) : $unsigned(wire99)) : (wire102 << wire101[(1'h1):(1'h1)])) : wire100));
  assign wire105 = (wire102[(4'he):(2'h2)] ?
                       (wire100 >= (~|$unsigned(wire100))) : {wire100,
                           ($signed({wire101}) >= wire104[(3'h4):(1'h1)])});
  assign wire106 = (wire104[(4'ha):(4'ha)] ? $signed((7'h42)) : wire103);
  assign wire107 = (!(wire105[(1'h0):(1'h0)] ?
                       $unsigned($unsigned(wire105)) : $unsigned((~|wire106))));
  assign wire108 = $unsigned($signed(((wire99[(3'h4):(3'h4)] >>> $signed(wire101)) ?
                       (wire99[(3'h5):(3'h5)] >>> (!wire105)) : (wire100 >= (wire105 + wire101)))));
  assign wire109 = (~&($unsigned(wire102) ?
                       $unsigned(wire100) : wire105[(5'h12):(4'h8)]));
  assign wire110 = wire107[(2'h2):(1'h0)];
  assign wire111 = (8'haa);
  assign wire112 = wire100[(4'h9):(4'h8)];
  assign wire113 = ((8'hb6) ^~ wire109);
  assign wire114 = (($signed(wire111) & (wire112 ?
                           (wire101 >>> (+wire111)) : $unsigned((wire99 ?
                               wire101 : wire109)))) ?
                       wire110[(3'h5):(1'h1)] : (($signed((wire102 ?
                           wire113 : (8'ha7))) - wire104[(4'hd):(3'h6)]) & {{(+wire110),
                               $signed(wire104)},
                           (~&(!wire105))}));
  assign wire115 = (7'h44);
  always
    @(posedge clk) begin
      reg116 <= (wire112 >>> (8'ha2));
      if (wire114)
        begin
          reg117 <= $signed(wire104);
          reg118 <= wire112;
          reg119 <= $unsigned((+$unsigned((~|(wire110 | wire110)))));
          reg120 <= (+$signed(wire103));
          reg121 <= (wire107[(4'h8):(3'h4)] >> $signed((^~{(&reg117)})));
        end
      else
        begin
          if (wire100[(2'h3):(1'h0)])
            begin
              reg117 <= ((8'hae) <<< $unsigned(($unsigned($signed((8'hae))) >= $signed((wire107 && wire100)))));
            end
          else
            begin
              reg117 <= (((^~$unsigned((wire110 ? reg116 : (8'hba)))) ?
                  $unsigned(((reg121 ? wire112 : wire107) ?
                      $signed(wire101) : (reg116 ?
                          (8'ha7) : (8'hb5)))) : wire107) > reg116);
              reg118 <= (wire100[(5'h10):(1'h1)] ?
                  $unsigned($unsigned(wire110[(4'hc):(3'h7)])) : reg117);
            end
        end
      reg122 <= ((wire114 ?
              $signed(wire112[(1'h1):(1'h1)]) : $unsigned(((wire108 ?
                      wire115 : reg119) ?
                  (wire110 ? wire100 : wire112) : wire101))) ?
          (wire114[(5'h10):(5'h10)] * (($signed(wire110) < (wire99 ?
                  (8'ha6) : reg116)) ?
              {wire102[(4'he):(3'h5)]} : $signed($unsigned(reg119)))) : $signed((~wire112[(2'h2):(1'h1)])));
      reg123 <= (8'hae);
    end
  assign wire124 = (((&(|(wire111 ?
                       reg119 : wire105))) ^ ((!wire103) ^~ (|(&wire110)))) <<< (8'hb1));
  assign wire125 = wire99[(3'h4):(2'h2)];
endmodule

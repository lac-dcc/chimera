module top
#(parameter param117 = ({((((7'h44) ? (8'hb0) : (8'ha6)) ? {(8'hb9)} : (~|(8'hbf))) * (8'hb5)), (^~((+(7'h40)) ? {(8'haa)} : ((7'h40) >> (8'ha5))))} ? {({((8'hbc) && (8'hba)), {(8'hb8), (8'ha0)}} ? (~&((8'hbf) < (7'h44))) : (|((8'hbc) ? (8'haf) : (8'hac)))), ((((8'h9d) <<< (8'hab)) == ((8'hbe) * (8'h9e))) << ((~|(8'h9c)) ? ((8'h9d) ? (8'ha1) : (7'h40)) : (8'hb9)))} : (((8'hae) ? ((&(8'hba)) ? ((8'haa) ^~ (8'ha1)) : (-(8'ha4))) : {((8'hb4) | (8'h9d)), ((8'haa) ? (8'hab) : (8'ha2))}) * (|(~((8'ha8) != (8'hac)))))), 
parameter param118 = param117)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire116;
  wire signed [(4'hc):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire113;
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire69,
                 wire35,
                 wire33,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire71,
                 wire72,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire113,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire4 = ($unsigned($signed(($unsigned(wire1) ?
                         (^(8'hb4)) : {wire0, (8'ha7)}))) ?
                     wire2 : (($unsigned(wire3) - $unsigned({wire1})) ?
                         wire2 : wire3));
  assign wire5 = ((&$signed($unsigned($unsigned(wire3)))) || {((^~wire2) <= wire2)});
  assign wire6 = (+$signed($unsigned(wire5)));
  assign wire7 = ({(wire0 ? wire6[(3'h4):(2'h2)] : $signed(wire1)),
                     wire4} < (+wire3[(3'h6):(2'h3)]));
  module8 #() modinst34 (.wire9(wire5), .wire12(wire1), .wire10(wire3), .clk(clk), .y(wire33), .wire11(wire2));
  assign wire35 = (8'ha5);
  always
    @(posedge clk) begin
      if (wire5)
        begin
          reg36 <= wire6[(3'h5):(2'h2)];
          if ((-(~{$unsigned(((8'ha8) ? wire3 : wire2))})))
            begin
              reg37 <= (~&$unsigned(wire33[(4'ha):(3'h4)]));
            end
          else
            begin
              reg37 <= $unsigned(wire35[(2'h3):(1'h1)]);
            end
          reg38 <= $unsigned(($signed($signed($signed(wire2))) || $unsigned($signed((wire7 ?
              wire33 : wire1)))));
          reg39 <= (wire6[(4'h8):(3'h4)] + (reg37[(3'h6):(3'h4)] ?
              $signed($signed(wire3[(1'h1):(1'h1)])) : (~^wire0)));
        end
      else
        begin
          reg36 <= wire3;
        end
      reg40 <= (&$unsigned($unsigned(reg39)));
      reg41 <= wire0[(1'h1):(1'h0)];
    end
  module42 #() modinst70 (wire69, clk, wire6, reg39, wire35, wire4);
  assign wire71 = wire5[(3'h5):(3'h5)];
  assign wire72 = $unsigned((reg39 != wire6[(4'he):(3'h6)]));
  always
    @(posedge clk) begin
      reg73 <= ($signed(wire1) ?
          $signed((reg37 ^ $signed($unsigned(wire1)))) : (wire72 ?
              (|wire3[(5'h13):(2'h3)]) : (~&wire7)));
      reg74 <= wire72;
    end
  assign wire75 = $signed($signed($signed((wire72[(1'h1):(1'h0)] ?
                      (reg41 + reg38) : (+wire1)))));
  assign wire76 = (~|($signed($signed($signed(wire33))) ?
                      reg74 : (wire2[(5'h12):(4'ha)] || wire33[(5'h11):(3'h7)])));
  assign wire77 = wire4;
  assign wire78 = (+(|wire2));
  module79 #() modinst114 (wire113, clk, reg39, reg73, wire7, reg41);
  assign wire115 = (|wire7[(4'hf):(2'h2)]);
  assign wire116 = ($unsigned({$signed({wire78, (8'ha9)})}) ?
                       $unsigned(wire1[(2'h3):(1'h0)]) : {(^~wire76),
                           (-(-reg39))});
endmodule

module module79
#(parameter param112 = ((((((8'ha3) * (8'hb8)) ^~ (8'h9e)) && (((8'ha1) ? (8'hb0) : (8'had)) * (-(7'h40)))) && ((((8'h9c) && (7'h41)) != {(8'ha2), (8'hbd)}) ? (((8'h9c) >>> (8'hac)) + (+(8'hbd))) : (~^((7'h41) << (8'hb9))))) != (8'hb2)))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire83;
  input wire [(5'h14):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire86,
                 wire85,
                 wire84,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire84 = ((~^$signed(($unsigned(wire80) ? (|wire81) : wire82))) ?
                      (-$unsigned((~&$signed(wire80)))) : (&$signed(($signed(wire82) ?
                          (wire81 >>> wire82) : (wire81 ? wire82 : wire80)))));
  assign wire85 = (!(+$signed((~((8'hb6) ? (8'hbf) : (7'h42))))));
  assign wire86 = $signed($unsigned($signed({$signed(wire82),
                      (wire83 ? (8'ha8) : wire84)})));
  module87 #() modinst99 (wire98, clk, wire80, wire82, wire81, wire86);
  assign wire100 = (-wire82);
  assign wire101 = wire85[(3'h5):(1'h1)];
  assign wire102 = wire98[(4'h8):(3'h6)];
  assign wire103 = $signed(($signed($signed(wire83)) == $unsigned((&((8'ha8) ?
                       (8'haa) : wire100)))));
  always
    @(posedge clk) begin
      reg104 <= ((({((8'h9d) ? wire80 : wire80), wire80} ?
                  ((wire85 ? (8'hae) : wire85) ?
                      wire98[(4'hb):(2'h2)] : wire81) : wire85) ?
              $unsigned((wire101 * wire85[(3'h6):(3'h6)])) : (~&$signed($unsigned((8'ha4))))) ?
          wire86 : wire85[(3'h5):(1'h1)]);
      reg105 <= wire82;
      reg106 <= (((&wire81[(1'h0):(1'h0)]) ?
              $unsigned((^$signed(wire81))) : {$unsigned($signed(wire101)),
                  ($signed(wire85) + (wire101 ? wire100 : wire81))}) ?
          $signed($unsigned(reg105[(1'h1):(1'h0)])) : $unsigned({$signed($unsigned(wire86))}));
      if (((-{wire102, ((wire98 || wire80) ^~ {wire80})}) >= wire81))
        begin
          reg107 <= ((wire80 ? wire98 : wire83) ?
              $unsigned({((wire85 ?
                      wire85 : wire100) >> wire86[(1'h0):(1'h0)])}) : reg105);
          reg108 <= $signed({reg106});
        end
      else
        begin
          reg107 <= {wire101, $unsigned(reg107[(4'ha):(3'h5)])};
        end
    end
  assign wire109 = (!$signed(($signed($signed(wire100)) <= ($signed(wire80) ?
                       {(7'h42), (8'hb6)} : (wire103 ? wire82 : wire82)))));
  assign wire110 = wire82;
  assign wire111 = (({(wire86[(2'h2):(1'h0)] || wire83[(3'h4):(2'h2)]),
                       $signed($signed(reg107))} <= $signed(($signed(wire102) ?
                       (wire84 <<< wire110) : reg104))) && wire80);
endmodule

module module42
#(parameter param67 = (&(!{(((8'hb3) ^~ (8'hbc)) ? (!(7'h43)) : ((8'hbf) <<< (8'hbb)))})), 
parameter param68 = param67)
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire46;
  input wire [(5'h13):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  input wire [(5'h14):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire59;
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  assign y = {wire66, wire65, wire61, wire59, reg64, reg63, reg62, (1'h0)};
  module47 #() modinst60 (wire59, clk, wire45, wire46, wire44, wire43);
  assign wire61 = (~|$unsigned($unsigned($signed($signed((8'ha8))))));
  always
    @(posedge clk) begin
      reg62 <= wire61;
      reg63 <= ($signed(($unsigned((wire46 >>> wire46)) ?
          $signed({wire43}) : $unsigned($signed(wire44)))) <= ($unsigned({$unsigned(wire61),
          (wire44 <<< wire59)}) && reg62[(3'h6):(1'h1)]));
      reg64 <= (^$signed(reg63[(3'h6):(2'h2)]));
    end
  assign wire65 = wire46[(5'h11):(4'hf)];
  assign wire66 = (!(($unsigned({(8'hab), wire59}) * $signed((7'h40))) ?
                      $unsigned({(reg62 + reg62)}) : $signed({wire61[(1'h1):(1'h0)],
                          (wire45 * wire65)})));
endmodule

module module8
#(parameter param31 = (((((~(8'haf)) ? ((8'ha9) & (8'hbb)) : ((7'h42) + (8'hb5))) << (8'hb9)) < {{(~|(8'hae))}}) ? (~^(({(8'hab), (8'ha2)} << ((8'ha0) ? (8'hb4) : (8'hb6))) ? ({(8'hb3)} | ((8'hba) ? (8'hbb) : (8'ha1))) : {(!(8'had)), (~(8'haf))})) : ((8'hb5) ? ((~&((8'ha5) ^ (7'h42))) ? (((8'haf) > (7'h44)) == {(8'hb3)}) : (~&(+(8'hb4)))) : {((~(7'h40)) ? (!(8'hbe)) : ((7'h43) ? (8'ha9) : (8'ha4)))})), 
parameter param32 = param31)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire18;
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire18,
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
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire12[(4'ha):(1'h1)])
        begin
          reg13 <= (-wire9[(1'h1):(1'h1)]);
          reg14 <= ($unsigned($signed($signed((wire9 >> wire12)))) ?
              ($signed($signed(((8'ha2) << wire10))) ^ $signed({{wire10,
                      reg13}})) : ($signed((+wire12)) || (((+wire9) ?
                      (wire9 ? wire10 : reg13) : $unsigned(wire11)) ?
                  $signed((wire12 && (8'hb3))) : wire9)));
          reg15 <= (&({({wire11, wire11} << reg13)} <= (wire10[(1'h1):(1'h1)] ?
              wire9 : wire9[(2'h3):(1'h1)])));
        end
      else
        begin
          reg13 <= $signed(((~^reg15) || (((^~wire12) ?
              (wire10 ? wire10 : wire10) : {(8'hbc)}) == reg14)));
        end
      if ((+(reg14[(2'h3):(2'h2)] ?
          (|$unsigned(wire11[(2'h3):(2'h3)])) : {$unsigned(wire12[(1'h0):(1'h0)]),
              ((8'ha5) ? (|wire9) : (+(8'hb9)))})))
        begin
          reg16 <= $unsigned($signed(reg15));
          reg17 <= ($signed(($unsigned((reg13 ? wire11 : reg13)) ?
                  ((reg16 ? (8'hac) : (8'hbf)) ?
                      {wire10, wire9} : (~^wire10)) : {$signed(reg15),
                      $signed((8'ha6))})) ?
              $signed($signed(($signed(wire12) ?
                  wire12 : {wire9, wire10}))) : reg16);
        end
      else
        begin
          reg16 <= $signed($unsigned((^reg15)));
          reg17 <= ($unsigned((((8'had) ? {wire9} : $unsigned(wire12)) ?
              reg16[(3'h6):(3'h4)] : (+{(8'ha5), reg17}))) != $unsigned(reg15));
        end
    end
  assign wire18 = $unsigned(wire12);
  always
    @(posedge clk) begin
      reg19 <= $signed(wire9);
      reg20 <= reg16[(4'h8):(3'h6)];
    end
  always
    @(posedge clk) begin
      if (wire12[(4'h9):(4'h9)])
        begin
          reg21 <= $unsigned(wire10[(3'h4):(2'h2)]);
          reg22 <= (^reg15);
          reg23 <= {($signed(({reg20} ?
                      (reg17 ? wire12 : wire12) : $signed(wire12))) ?
                  (8'hb5) : reg19),
              $signed($signed((&$unsigned(wire11))))};
          if (reg16[(1'h0):(1'h0)])
            begin
              reg24 <= (&reg17[(1'h1):(1'h0)]);
              reg25 <= (&(reg13[(4'hf):(3'h6)] <<< (reg21[(3'h6):(3'h4)] || wire18[(1'h1):(1'h1)])));
              reg26 <= ($signed({reg25[(2'h2):(1'h0)]}) ?
                  $signed((!reg21[(2'h3):(1'h1)])) : (reg17[(4'h8):(2'h3)] == $unsigned(($unsigned(wire18) <= (reg23 ?
                      reg14 : reg23)))));
              reg27 <= $signed(reg24[(3'h4):(2'h2)]);
            end
          else
            begin
              reg24 <= ($unsigned((!reg14)) <= (8'ha2));
              reg25 <= ((~|reg22) ?
                  (&$signed({reg17[(4'h9):(2'h3)],
                      (reg13 ? reg13 : wire12)})) : (8'hb8));
              reg26 <= $signed({$unsigned({reg20, reg13[(4'hb):(4'h9)]})});
            end
        end
      else
        begin
          reg21 <= reg14[(1'h1):(1'h1)];
          reg22 <= $unsigned(((reg13[(4'h8):(3'h7)] ?
                  {(reg16 | wire9), reg16} : {$signed(reg23)}) ?
              $signed($signed((reg23 ?
                  (8'hb7) : wire9))) : (~&reg20[(4'h8):(1'h1)])));
          if (reg21[(1'h1):(1'h0)])
            begin
              reg23 <= (^((8'haa) ^~ $signed($signed(reg13[(4'hc):(3'h5)]))));
              reg24 <= (|$unsigned(wire11));
            end
          else
            begin
              reg23 <= ((((^reg23[(1'h1):(1'h0)]) ^ $signed((~&(8'hb3)))) ?
                  {($signed((8'hb0)) ? reg13 : {reg25}),
                      $unsigned((wire10 & reg20))} : reg14[(2'h3):(2'h3)]) <= (~|$unsigned(reg27[(3'h7):(3'h7)])));
              reg24 <= $unsigned($unsigned($unsigned($signed($signed(reg26)))));
              reg25 <= wire11[(2'h2):(2'h2)];
              reg26 <= $signed(((~|reg27[(3'h5):(2'h3)]) >= (+(reg15 > $unsigned((8'hb4))))));
            end
        end
      reg28 <= ($signed(wire10[(2'h3):(2'h3)]) == $unsigned((($unsigned(reg15) ?
              (reg23 | reg23) : (!wire9)) ?
          {(wire10 ^~ (8'h9e))} : (((8'hb3) ^~ reg22) >>> (|reg23)))));
    end
  assign wire29 = reg16;
  assign wire30 = reg20[(1'h1):(1'h0)];
endmodule

module module47
#(parameter param57 = (-(!(({(7'h44)} <<< (8'h9d)) ? {(~&(8'ha3)), ((8'haf) ? (8'ha5) : (8'hb5))} : {((8'ha2) ? (8'ha9) : (8'hb9)), (~^(8'h9f))}))), 
parameter param58 = (~&(~&{param57, (((8'hbd) ? param57 : param57) || (&param57))})))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire51;
  input wire [(5'h13):(1'h0)] wire50;
  input wire signed [(5'h13):(1'h0)] wire49;
  input wire [(5'h14):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  assign y = {wire56, wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = (~(+wire49[(3'h6):(1'h0)]));
  assign wire53 = $signed((^~((wire49[(4'ha):(1'h0)] & {wire48}) == ((7'h44) ?
                      $unsigned(wire49) : (wire49 ? wire49 : wire51)))));
  assign wire54 = wire51[(2'h3):(1'h0)];
  assign wire55 = $signed(wire48[(1'h1):(1'h0)]);
  assign wire56 = $signed((&$signed({wire50})));
endmodule

module module87
#(parameter param96 = (^((~|((8'haa) < {(8'haf), (8'hb7)})) ^ ({{(8'hbb)}, ((8'ha9) ? (8'haf) : (8'hbe))} ? {{(8'hb4)}, (~^(8'hb3))} : {((8'hbe) ? (8'hab) : (8'hb8))}))), 
parameter param97 = (|(param96 ? ((~|param96) == (param96 ? (8'ha6) : ((8'ha4) ^~ param96))) : param96)))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire [(5'h14):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire signed [(4'h9):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  assign y = {wire95, wire94, wire93, wire92, (1'h0)};
  assign wire92 = $unsigned((|$signed((((8'hbc) <= wire89) >>> ((8'ha8) < wire88)))));
  assign wire93 = wire89;
  assign wire94 = (wire93 ^~ $signed((($unsigned((8'ha8)) & (~^wire91)) < $unsigned((wire91 || wire91)))));
  assign wire95 = (^~(wire90[(3'h5):(2'h3)] + wire93));
endmodule

module top
#(parameter param120 = ((^~((8'hb1) + (((8'hb2) | (8'hbf)) <= (~^(8'hb6))))) ? (+({(8'h9e), {(8'hb0)}} ? ((-(8'h9f)) < ((8'haf) ? (8'hb5) : (8'h9d))) : (&((8'hae) ? (8'hbf) : (8'hb3))))) : ({{((8'hba) ? (8'ha2) : (8'hb7))}} ? ((((8'haf) * (8'hae)) ? ((8'ha8) | (8'ha9)) : ((8'ha7) >>> (8'hb9))) <= (((8'hab) ? (8'h9e) : (8'ha8)) ? {(8'ha4), (8'hb8)} : (8'hb0))) : (&(&((8'hae) ? (8'haf) : (8'ha5)))))), 
parameter param121 = ({(+param120)} >= (((param120 ? param120 : (param120 - param120)) < {param120}) ? (+(8'hb4)) : (({(8'ha5), param120} ? {param120} : param120) ? (((8'h9d) * param120) == (^param120)) : ((param120 ? param120 : param120) ? (param120 ? param120 : param120) : ((8'hbb) ~^ param120))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire116;
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire5,
                 wire6,
                 wire7,
                 wire116,
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
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (8'ha8);
  assign wire6 = wire4;
  assign wire7 = wire3;
  always
    @(posedge clk) begin
      if (((wire4 ?
              {$signed($unsigned(wire5))} : $signed(($unsigned(wire0) ?
                  $signed((8'hb1)) : ((8'ha9) ? wire1 : wire0)))) ?
          wire0 : wire1))
        begin
          reg8 <= (+wire6[(3'h6):(2'h2)]);
          reg9 <= reg8[(4'hc):(4'h9)];
          reg10 <= wire3[(4'he):(2'h3)];
        end
      else
        begin
          if (($unsigned((reg8[(4'hf):(2'h3)] <<< $signed((wire4 ?
                  wire7 : reg10)))) ?
              (~^reg9[(4'h9):(2'h3)]) : (|wire3[(3'h7):(2'h2)])))
            begin
              reg8 <= ((((^~wire1[(3'h6):(3'h4)]) ?
                          $signed(wire2) : wire0[(2'h2):(2'h2)]) ?
                      ($unsigned($signed(wire0)) ?
                          (&(|wire3)) : (8'ha7)) : (((wire1 && wire6) && $unsigned(wire7)) <= (^(&wire7)))) ?
                  {(7'h42), (^~{(|wire2)})} : wire4);
              reg9 <= (wire4[(3'h7):(3'h5)] ?
                  ((~(^~(reg9 ?
                      wire0 : (8'ha0)))) | (-reg8)) : $signed($unsigned(((wire6 || wire5) ?
                      (&wire5) : (^~reg9)))));
              reg10 <= (~$unsigned(wire1[(5'h10):(4'h8)]));
            end
          else
            begin
              reg8 <= ((8'ha2) ?
                  (reg8[(3'h4):(1'h0)] + (~^{(reg9 ^ wire1)})) : wire5);
              reg9 <= $unsigned($unsigned({(wire5[(2'h3):(1'h0)] * (wire3 * wire1)),
                  $signed($unsigned(wire2))}));
              reg10 <= $signed({$signed(((8'hb7) >= (wire2 ?
                      (8'hab) : wire0)))});
            end
        end
      if ($signed((($unsigned((wire5 << wire7)) ?
          ((wire5 * (8'ha3)) ?
              $unsigned(reg10) : {reg9,
                  (8'hac)}) : wire7) + $signed(wire1[(1'h0):(1'h0)]))))
        begin
          if (($unsigned(wire3[(4'hd):(1'h0)]) <= ($unsigned(wire1) ?
              (($signed(wire4) ^ (wire7 | reg10)) ?
                  wire5[(3'h5):(2'h3)] : $unsigned((wire2 ?
                      wire3 : (8'ha3)))) : $signed(((8'hb4) ?
                  (8'hb4) : $signed(reg8))))))
            begin
              reg11 <= ((^wire6) + (wire5[(3'h6):(2'h3)] ?
                  wire3[(4'h8):(1'h0)] : {((reg9 <<< (8'ha3)) ?
                          ((7'h42) ? wire0 : (8'hbb)) : $unsigned(wire2)),
                      $signed(wire7)}));
              reg12 <= (({$signed(reg11[(4'hd):(1'h1)]), reg10[(1'h0):(1'h0)]} ?
                      ((wire7[(1'h0):(1'h0)] ?
                              $unsigned(wire3) : ((8'had) << wire7)) ?
                          {reg11} : {$signed(wire1)}) : $signed($signed((wire3 ?
                          (8'hb5) : (8'hb6))))) ?
                  wire4 : ((($signed((8'hb8)) ?
                          (wire0 ? wire3 : (8'ha0)) : (wire3 ?
                              (8'hb0) : reg10)) ?
                      (~^{(8'haf),
                          wire2}) : ((~|wire4) | wire2)) <<< $unsigned({$unsigned(wire5)})));
              reg13 <= ($unsigned(wire0) == (+$signed(wire4)));
              reg14 <= (-($unsigned(((reg8 ? reg11 : reg12) != {(8'had),
                  wire7})) != reg10[(4'ha):(3'h6)]));
            end
          else
            begin
              reg11 <= (wire7[(2'h2):(1'h0)] ?
                  (($unsigned(reg9[(3'h6):(3'h5)]) == (-wire7[(2'h2):(1'h0)])) ?
                      $signed(((wire4 ? wire5 : wire0) ?
                          wire5[(3'h5):(3'h5)] : (reg12 >= (8'haa)))) : ((wire2 ^~ (wire4 * wire0)) & $unsigned($signed((8'h9c))))) : (((8'hb4) ?
                          (|wire0[(3'h5):(2'h3)]) : ((|wire7) >= (reg13 == wire1))) ?
                      {{$unsigned(wire7)}} : (wire3 <= $signed((wire6 || reg12)))));
              reg12 <= (~(^reg12));
            end
          reg15 <= $unsigned(reg9);
          reg16 <= (~&(((((8'hbf) >= wire3) ^ (~&(8'hb8))) < ((^~reg13) * $signed(reg11))) ?
              $unsigned({reg12}) : $signed(({reg15, wire3} ?
                  (reg8 ? (8'h9c) : wire7) : (reg13 ? wire7 : wire5)))));
        end
      else
        begin
          reg11 <= (~|{$unsigned(((~&(8'hba)) ? (7'h41) : $unsigned(reg12)))});
          reg12 <= wire5[(2'h2):(1'h1)];
          reg13 <= (+$signed({(wire7 == wire1)}));
        end
      reg17 <= reg13[(4'hb):(4'h8)];
      if (reg14)
        begin
          reg18 <= reg11;
          reg19 <= reg12[(3'h6):(3'h6)];
        end
      else
        begin
          reg18 <= reg13[(3'h5):(1'h0)];
        end
      if ($unsigned(wire5))
        begin
          reg20 <= wire5[(1'h1):(1'h1)];
          reg21 <= reg12[(1'h0):(1'h0)];
          reg22 <= ($unsigned(((!(~(8'ha1))) ?
              {{reg17,
                      reg11}} : ((|(8'ha3)) * $signed(wire6)))) < reg10[(4'h9):(4'h9)]);
        end
      else
        begin
          reg20 <= reg13;
          reg21 <= wire3;
        end
    end
  always
    @(posedge clk) begin
      reg23 <= $unsigned($unsigned($unsigned((+wire4[(4'hd):(3'h4)]))));
      reg24 <= reg11;
    end
  module25 #() modinst117 (.wire27(wire6), .y(wire116), .wire30(reg18), .wire26(reg16), .wire29(reg22), .wire28(reg21), .clk(clk));
  assign wire118 = $signed(reg14[(1'h0):(1'h0)]);
  assign wire119 = $unsigned(reg20[(2'h2):(1'h0)]);
endmodule

module module25
#(parameter param115 = {(((8'hb4) ? {{(8'haa), (8'hbc)}, (-(8'hba))} : {{(8'ha3), (8'ha4)}}) ? (((~&(7'h44)) ? (~&(8'hbe)) : ((8'ha0) + (8'hab))) ^ {((7'h43) ? (8'ha7) : (8'ha1)), ((7'h44) ~^ (8'hbe))}) : ((((8'hb9) ? (8'ha2) : (8'haf)) ? (!(8'hb3)) : {(8'hbc), (8'hb2)}) > ({(7'h41)} >>> (+(7'h42))))), (~^(^((-(8'hb0)) ? ((8'hb9) ? (7'h41) : (8'hb2)) : ((8'hac) ? (8'h9d) : (8'hae)))))})
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire [(2'h3):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire77,
                 wire76,
                 wire75,
                 wire70,
                 wire63,
                 wire32,
                 wire31,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire31 = $unsigned(wire27);
  assign wire32 = (wire27 > (^(($unsigned((8'hb8)) <<< wire31[(2'h3):(2'h2)]) < {(^~wire28)})));
  module33 #() modinst64 (wire63, clk, wire27, wire26, wire31, wire30);
  always
    @(posedge clk) begin
      reg65 <= wire30[(4'h9):(3'h4)];
      reg66 <= wire27[(2'h3):(1'h1)];
      reg67 <= $signed(($unsigned(wire32[(3'h5):(2'h3)]) ?
          $unsigned(($unsigned((8'h9f)) ?
              (wire30 ? wire30 : wire29) : (!wire26))) : $signed(reg66)));
      reg68 <= ((wire27[(3'h6):(1'h1)] ?
              $signed(wire30) : ($signed((wire27 | wire30)) ?
                  ($signed(wire26) ^~ $unsigned(wire32)) : ((wire26 ?
                      wire63 : wire27) & wire27[(4'he):(3'h7)]))) ?
          ((^~wire26[(4'hc):(1'h1)]) >> ((&(~&wire30)) | (~|(wire27 < (8'hb6))))) : (~(wire26[(5'h12):(4'he)] ?
              (^~$signed(wire27)) : wire28[(1'h1):(1'h0)])));
      reg69 <= $unsigned((reg65[(3'h4):(1'h0)] ?
          (!(&$unsigned(reg67))) : wire63[(1'h1):(1'h0)]));
    end
  assign wire70 = (8'hb2);
  always
    @(posedge clk) begin
      reg71 <= {wire31,
          ({({reg66} ? $signed(wire27) : $unsigned((8'haf)))} ?
              $unsigned((!(^wire70))) : ($unsigned((+(8'h9e))) ?
                  reg66 : wire28))};
      reg72 <= (8'ha7);
    end
  always
    @(posedge clk) begin
      reg73 <= wire32;
      reg74 <= wire32;
    end
  assign wire75 = $unsigned((($signed($signed(wire70)) >= (8'hbc)) && $unsigned((&(wire63 ?
                      wire63 : wire28)))));
  assign wire76 = {(($unsigned(wire63[(2'h3):(1'h1)]) + (-(wire26 | (8'hb8)))) ?
                          $signed($signed($signed(wire30))) : {((8'ha3) ?
                                  $unsigned(wire31) : (reg65 ^ reg68))})};
  assign wire77 = (-wire63);
  module78 #() modinst108 (wire107, clk, wire31, wire63, wire26, wire28);
  assign wire109 = (($unsigned(reg66) ?
                       $signed((+$signed(wire107))) : {$unsigned($signed(wire27))}) && (reg66[(3'h5):(2'h3)] * (reg72[(1'h1):(1'h1)] ?
                       (^$unsigned(wire27)) : ((reg67 ?
                           wire27 : reg74) && {(8'ha0)}))));
  assign wire110 = reg69[(3'h7):(1'h0)];
  assign wire111 = (^~$signed({({wire27, wire107} * (reg72 >> reg72))}));
  assign wire112 = reg67;
  assign wire113 = reg72[(3'h5):(3'h4)];
  assign wire114 = $signed(reg74);
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire82;
  input wire signed [(5'h12):(1'h0)] wire81;
  input wire signed [(4'h8):(1'h0)] wire80;
  input wire [(4'ha):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire84,
                 wire83,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire83 = ($signed(wire80) == wire80[(2'h3):(2'h3)]);
  assign wire84 = ((wire79[(4'ha):(3'h4)] | $signed(((wire83 ?
                      wire83 : (8'ha2)) == $signed(wire80)))) <<< {(wire81[(4'hf):(4'h9)] ?
                          ($unsigned(wire79) ?
                              wire79 : {wire82,
                                  wire79}) : wire83[(5'h10):(4'he)])});
  always
    @(posedge clk) begin
      if ($signed({$unsigned($signed(wire81)),
          {(+(wire84 ? (8'ha5) : (8'ha6))), (^~$signed(wire80))}}))
        begin
          reg85 <= ($signed($signed($unsigned(wire80))) ?
              wire84 : $unsigned((wire84 >> ((wire84 << wire82) ?
                  $unsigned(wire84) : wire79[(4'ha):(2'h3)]))));
          reg86 <= $unsigned($signed(wire81));
          reg87 <= (~&(~&(($signed(wire81) * (wire84 ?
              wire79 : reg86)) >>> {$unsigned(wire84),
              (reg85 ? wire82 : (8'hb7))})));
        end
      else
        begin
          reg85 <= ($unsigned(reg85) + (7'h40));
          reg86 <= $signed({(((8'hac) ? wire83 : ((8'hb5) ? wire84 : wire82)) ?
                  reg87 : wire82)});
          reg87 <= ({(((^wire80) ? wire84[(4'ha):(2'h3)] : reg87) ?
                      $signed((reg86 << reg87)) : $signed(wire83[(2'h2):(2'h2)]))} ?
              reg85 : reg87);
        end
    end
  assign wire88 = reg87;
  assign wire89 = $unsigned((reg85 ^~ (~(wire83 >= reg86[(3'h5):(1'h1)]))));
  assign wire90 = (reg85 ?
                      ($signed($signed((~(8'hb7)))) ?
                          (reg86 ?
                              $unsigned(wire88[(2'h3):(2'h2)]) : ((-wire83) ?
                                  (wire81 ?
                                      (8'hac) : (8'haa)) : (wire89 >> reg86))) : (|{wire83[(3'h4):(2'h2)]})) : {reg85[(4'hd):(3'h6)],
                          (-wire89[(1'h1):(1'h0)])});
  assign wire91 = $signed((&(8'ha3)));
  assign wire92 = $signed(wire82);
  assign wire93 = (wire81 <<< {(reg87 ? wire89 : wire91[(1'h0):(1'h0)]),
                      reg86[(4'h8):(3'h7)]});
  assign wire94 = $unsigned($signed(wire82[(1'h0):(1'h0)]));
  assign wire95 = wire93;
  assign wire96 = (8'hbb);
  assign wire97 = $signed(({((~^wire93) ?
                          (wire90 >= wire95) : wire92[(4'h9):(3'h7)]),
                      $signed((reg86 & wire93))} <<< ($unsigned($unsigned(wire83)) ?
                      (reg86[(1'h0):(1'h0)] ?
                          (wire83 >= wire92) : $signed(reg85)) : $unsigned($unsigned(wire95)))));
  always
    @(posedge clk) begin
      reg98 <= wire95[(1'h0):(1'h0)];
      reg99 <= $unsigned(wire96);
    end
  always
    @(posedge clk) begin
      reg100 <= ((+$signed(((~reg86) ?
              (wire84 <<< wire97) : $signed(wire95)))) ?
          wire96 : (~$unsigned(($signed((8'haa)) ?
              {reg86, reg86} : (^wire89)))));
      reg101 <= wire88;
      reg102 <= (-wire80[(1'h1):(1'h0)]);
      reg103 <= wire88[(4'h9):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg104 <= $unsigned(wire96);
      reg105 <= ($signed($signed({$unsigned(reg86)})) - {(wire91[(3'h5):(3'h5)] ?
              {$unsigned(wire89), (reg87 >>> wire94)} : {(reg104 * wire89)})});
      reg106 <= ((wire83 << $unsigned(((reg103 ?
              wire92 : (8'hb5)) + (wire90 >= wire80)))) ?
          $signed($unsigned(wire97)) : (wire79[(1'h0):(1'h0)] ?
              (!reg87[(3'h4):(2'h3)]) : (!$unsigned({reg98}))));
    end
endmodule

module module33
#(parameter param61 = ((~(!((8'ha7) ? (!(8'hbf)) : (&(8'hbd))))) ? (((~^(~&(8'hae))) ? {((8'ha1) ? (8'had) : (8'h9d))} : (((8'hbf) ^ (8'ha8)) ? ((8'hb9) >= (8'ha1)) : (-(8'hae)))) ? ((((8'h9c) || (8'hac)) >>> (~^(8'h9f))) ? (8'ha3) : (((8'h9e) | (8'hb4)) >= ((8'hb5) ~^ (7'h40)))) : (|((&(8'ha5)) ? (|(7'h40)) : ((8'ha0) ? (8'hac) : (8'hbd))))) : ((({(8'ha1), (8'hac)} != (7'h43)) ? {(!(8'hb0)), ((8'ha6) == (8'h9f))} : (+((8'hb4) || (8'hbc)))) | (|(((8'hb2) ? (8'hb5) : (8'haf)) && {(8'hb1), (8'ha3)})))), 
parameter param62 = (|(((((8'hab) ? param61 : param61) ? (param61 ? (8'hb1) : param61) : {param61, param61}) ? param61 : param61) ? param61 : ({param61, param61} ? ((~&param61) ? (^~(8'hb5)) : (param61 <<< (8'h9d))) : param61))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  input wire signed [(3'h7):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire39;
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire39,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= (({(wire35[(2'h3):(1'h0)] - wire34[(3'h4):(1'h0)])} ~^ ((~|wire35[(2'h3):(2'h2)]) == ((wire34 ?
              wire34 : wire36) ?
          wire34 : (+wire36)))) + (wire36[(4'h8):(1'h0)] >> $unsigned(((wire34 ^~ wire37) ?
          wire34[(3'h5):(3'h4)] : wire37))));
    end
  assign wire39 = (((reg38 ? reg38[(1'h0):(1'h0)] : $signed((^wire35))) ?
                          wire37[(3'h5):(1'h0)] : $signed((&(reg38 ?
                              wire35 : (8'h9c))))) ?
                      wire37 : ((($signed((8'h9c)) ?
                              (reg38 ?
                                  wire36 : reg38) : $unsigned(wire37)) < $signed(wire36)) ?
                          ((8'ha6) ?
                              $unsigned($signed((8'ha8))) : wire36[(4'ha):(3'h4)]) : (((8'ha5) ?
                              {wire37,
                                  wire36} : reg38) >= ((wire36 + wire36) ~^ $unsigned((7'h44))))));
  always
    @(posedge clk) begin
      reg40 <= (($unsigned($unsigned(((8'hb3) ?
          wire37 : wire37))) || wire37) >> reg38[(3'h6):(1'h0)]);
      reg41 <= $signed(($unsigned(wire35[(2'h3):(1'h1)]) ?
          $signed(wire34) : ((&reg40[(2'h2):(1'h1)]) ^~ wire36)));
      reg42 <= {{{{{(7'h43)}}}, (+wire39[(3'h4):(3'h4)])}};
      reg43 <= wire39;
    end
  assign wire44 = reg41[(1'h1):(1'h1)];
  assign wire45 = wire35;
  assign wire46 = (&reg38[(3'h5):(2'h3)]);
  assign wire47 = ($signed($unsigned(wire34)) ?
                      (((reg42[(2'h2):(1'h0)] << $signed(wire46)) ^~ (wire35 ?
                          (+wire36) : reg40)) + reg40) : wire44);
  assign wire48 = {reg40[(3'h6):(2'h3)]};
  assign wire49 = wire47;
  always
    @(posedge clk) begin
      reg50 <= (8'ha5);
      if (wire49)
        begin
          reg51 <= (^~reg50[(2'h3):(2'h2)]);
        end
      else
        begin
          reg51 <= $unsigned(wire36[(4'hf):(4'h8)]);
          reg52 <= wire44;
          reg53 <= (-(+($unsigned($unsigned(reg52)) << reg42[(3'h6):(3'h5)])));
        end
      reg54 <= wire48;
    end
  assign wire55 = ((((-wire44) + ((wire36 - reg51) ^~ $signed(reg38))) ?
                      wire37 : (!reg42)) ^~ wire45[(1'h0):(1'h0)]);
  assign wire56 = {reg51[(2'h3):(2'h2)]};
  assign wire57 = $unsigned($signed((^wire56)));
  assign wire58 = reg50;
  assign wire59 = (+(!((~&wire46[(5'h11):(4'h8)]) ?
                      $unsigned((reg54 ?
                          reg38 : reg50)) : $signed($signed(wire55)))));
  assign wire60 = $unsigned(((reg54 < $unsigned((8'hb5))) || (8'haa)));
endmodule

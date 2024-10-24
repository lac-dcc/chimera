module top
#(parameter param103 = {(~^(8'had))}, 
parameter param104 = (|((((param103 >= (8'ha2)) << (param103 ? param103 : param103)) ? ((^~(8'hb2)) <<< (+param103)) : (~(param103 ? param103 : param103))) ? (((param103 << param103) ? (param103 ? (8'h9e) : param103) : (&param103)) ~^ (((8'hbe) ? (8'h9d) : param103) ? param103 : ((8'h9d) ? param103 : (8'hb4)))) : ({param103, param103} ? ((^param103) * param103) : ((~&param103) ? (param103 ? param103 : param103) : (-param103))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire62;
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire62,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  module5 #() modinst63 (wire62, clk, wire2, wire1, wire0, wire4, wire3);
  always
    @(posedge clk) begin
      reg64 <= $unsigned(wire3[(4'hc):(1'h0)]);
      reg65 <= reg64;
      reg66 <= $unsigned(wire62);
      reg67 <= $unsigned(wire1[(4'ha):(2'h3)]);
    end
  assign wire68 = (~^($signed((wire4 ? wire3 : {(8'ha8), wire2})) ?
                      ((8'ha0) ^ {(reg64 | wire1)}) : (((8'ha1) ?
                          wire2[(1'h0):(1'h0)] : reg67) && ($unsigned(reg66) ?
                          reg67[(1'h1):(1'h1)] : $signed((8'hb0))))));
  assign wire69 = (8'hb1);
  assign wire70 = ($unsigned(reg67[(2'h3):(1'h1)]) >> (!wire4[(3'h6):(3'h6)]));
  assign wire71 = $unsigned((7'h42));
  assign wire72 = (8'h9e);
  assign wire73 = $unsigned(reg65);
  assign wire74 = $unsigned(($signed(wire71) ?
                      wire71 : (wire68[(4'hc):(4'hc)] | wire69[(3'h4):(1'h0)])));
  assign wire75 = (~^{(8'h9c), (-reg67)});
  module76 #() modinst96 (wire95, clk, wire74, wire69, wire73, wire62, reg67);
  assign wire97 = ($signed($signed((&wire68))) ?
                      {$unsigned($unsigned(wire1))} : {{wire74[(4'h9):(2'h2)]},
                          wire74});
  assign wire98 = (({$signed((&wire69))} ^~ (((wire69 ?
                          wire68 : wire73) ^ ((8'hb2) <= reg67)) ?
                      $signed((^~(8'hb1))) : (wire3[(1'h1):(1'h1)] ?
                          $unsigned(wire3) : (reg65 ~^ (8'hb0))))) <= (^$unsigned((wire71[(4'h8):(3'h4)] <= $unsigned(reg65)))));
  assign wire99 = $unsigned(wire0[(4'h8):(3'h7)]);
  assign wire100 = ($unsigned($signed((~|wire99))) | ($unsigned(wire62) ?
                       $signed(reg64[(1'h0):(1'h0)]) : (^~(~&{wire4, wire0}))));
  assign wire101 = ($unsigned(wire69[(4'he):(1'h1)]) ?
                       (&wire2) : (($signed(((8'hbe) == wire3)) << wire2[(2'h2):(2'h2)]) ?
                           ($unsigned(reg64[(1'h0):(1'h0)]) ?
                               (~|reg64[(1'h0):(1'h0)]) : wire1) : $unsigned((-(wire71 >> wire62)))));
  assign wire102 = wire100;
endmodule

module module76
#(parameter param94 = ((+(~|(!((8'hae) & (8'ha9))))) ? (|{{((8'h9c) <<< (8'h9c))}}) : (^~((((8'haf) ? (8'hbc) : (8'hb8)) ? ((8'ha2) << (8'hbd)) : (!(8'hba))) ? (((8'hb8) || (8'hb2)) ? ((8'hb8) || (7'h43)) : {(8'ha4), (8'ha3)}) : ((~&(8'ha2)) - ((7'h42) == (8'ha6)))))))
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire81;
  input wire [(3'h4):(1'h0)] wire80;
  input wire signed [(5'h11):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire82 = $signed(($signed($unsigned((wire81 * wire80))) ?
                      (+wire77[(4'hf):(4'ha)]) : ({((8'hb4) >= wire80),
                          wire79[(4'h9):(3'h5)]} == $signed(wire81[(2'h2):(2'h2)]))));
  assign wire83 = $unsigned((8'hb4));
  assign wire84 = wire79[(4'h8):(2'h3)];
  assign wire85 = (~^($signed(wire84[(1'h1):(1'h1)]) ?
                      $signed(wire83[(3'h7):(2'h2)]) : (~|(~|$unsigned(wire78)))));
  assign wire86 = (~|wire85);
  assign wire87 = wire77;
  always
    @(posedge clk) begin
      if ($unsigned((^(wire82[(4'h8):(2'h2)] ?
          $unsigned((wire87 ? (8'hb7) : (8'ha7))) : ($unsigned(wire78) ?
              (wire79 ? wire83 : wire87) : (wire85 ? wire80 : wire77))))))
        begin
          reg88 <= (8'hb6);
          reg89 <= (~^$signed({$signed(wire77), (|{(8'hbe)})}));
        end
      else
        begin
          reg88 <= $signed(wire79[(5'h11):(2'h2)]);
        end
      reg90 <= (&wire81);
    end
  assign wire91 = $signed(({$signed($signed(reg89))} >>> (($unsigned((8'ha5)) ?
                          (&wire86) : $signed((8'hb5))) ?
                      $signed(reg88[(4'he):(4'hb)]) : (reg90[(3'h4):(1'h1)] ?
                          (wire80 ^ (8'hbc)) : wire87[(2'h3):(1'h0)]))));
  assign wire92 = wire78;
  assign wire93 = ($signed($signed(wire86[(1'h0):(1'h0)])) ?
                      $signed((((reg88 >> wire85) ?
                              {wire82} : wire82[(4'hf):(4'he)]) ?
                          $signed($unsigned(wire84)) : (wire81 >= {wire77}))) : $signed($signed((&(wire82 ^ (8'h9f))))));
endmodule

module module5
#(parameter param61 = ((-(((&(8'ha9)) ^ (+(8'hb2))) || ((-(8'hbd)) ? (~^(8'hb5)) : {(8'ha7)}))) >= ((((8'h9c) != ((7'h43) & (7'h41))) ? {(!(8'hba)), (8'hb7)} : ((!(8'ha8)) ? {(8'ha6), (8'hb4)} : (+(8'hb7)))) & {(((8'h9e) + (8'h9e)) == ((7'h44) || (8'ha9)))})))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire11 = $unsigned(($unsigned(wire7) ?
                      (~&(wire8 >>> wire9[(2'h3):(1'h0)])) : (8'ha3)));
  assign wire12 = wire9[(5'h10):(3'h4)];
  assign wire13 = $signed({(wire10[(2'h2):(1'h1)] | {$signed(wire9), wire11})});
  assign wire14 = $signed(wire7);
  assign wire15 = (wire10 ?
                      ((&$unsigned((wire14 ?
                          wire13 : wire8))) + $unsigned($signed((+wire14)))) : (wire11[(3'h4):(3'h4)] + $unsigned({(&wire10)})));
  assign wire16 = $unsigned(($signed(wire11) | (8'ha2)));
  module17 #() modinst44 (.wire18(wire6), .clk(clk), .wire21(wire9), .wire19(wire8), .y(wire43), .wire20(wire14));
  assign wire45 = $unsigned((~(7'h42)));
  assign wire46 = $signed($signed(wire8[(4'h9):(4'h8)]));
  assign wire47 = {wire15, (+wire43[(4'h9):(3'h5)])};
  assign wire48 = $unsigned($signed($unsigned(((wire15 ?
                      (8'ha7) : (8'hbc)) != $signed(wire10)))));
  always
    @(posedge clk) begin
      if ((wire46 ?
          $unsigned(((wire13 ? (-wire47) : (~^wire6)) ?
              wire46[(3'h4):(1'h1)] : ({wire16} ?
                  (wire10 ? wire48 : wire47) : wire9[(1'h0):(1'h0)]))) : wire6))
        begin
          reg49 <= {$signed(((wire47[(1'h1):(1'h1)] ?
                      ((8'ha2) && wire48) : (^~wire15)) ?
                  wire14 : ((wire15 ? wire6 : wire43) ? wire43 : (^~wire43)))),
              (|wire8[(4'ha):(2'h3)])};
          reg50 <= $unsigned(wire7[(3'h5):(1'h1)]);
          reg51 <= $unsigned(($unsigned({$signed(wire9)}) ?
              $signed(wire48[(2'h3):(1'h1)]) : ($unsigned((wire16 ?
                      wire47 : (8'ha2))) ?
                  ((wire48 * (8'ha7)) ?
                      $signed(wire12) : wire48[(3'h4):(2'h3)]) : (&wire43[(4'hf):(4'ha)]))));
          reg52 <= wire13[(4'h9):(4'h8)];
          if (wire47)
            begin
              reg53 <= (~{$signed($signed($unsigned(wire13))),
                  $signed((wire43 || (wire12 >>> wire14)))});
              reg54 <= wire15;
            end
          else
            begin
              reg53 <= ($unsigned(reg53[(4'ha):(2'h3)]) ?
                  (^~$signed(((~|wire6) ?
                      wire10 : (wire12 + wire9)))) : (-wire10));
            end
        end
      else
        begin
          reg49 <= $signed(($unsigned($unsigned(reg50)) ?
              wire16 : (~|{(wire46 ? wire47 : (8'ha2))})));
        end
      reg55 <= $signed((^~($signed(wire10[(1'h0):(1'h0)]) > (&(reg54 ~^ wire6)))));
      reg56 <= reg55[(4'ha):(3'h4)];
      reg57 <= $signed({$signed(reg51)});
    end
  assign wire58 = wire45[(3'h6):(2'h3)];
  assign wire59 = wire46;
  assign wire60 = (~|((reg56[(3'h5):(1'h1)] & $signed($signed((8'hb2)))) ?
                      ((8'ha4) == (wire14[(1'h1):(1'h0)] > $signed(wire15))) : $unsigned((+wire6))));
endmodule

module module17
#(parameter param42 = (^((((^~(8'h9e)) | ((8'ha3) ? (8'hb5) : (8'hab))) ? (((8'hbf) ? (8'ha9) : (7'h44)) ~^ (^(8'haa))) : ((7'h44) ? (~&(8'hb2)) : (-(8'hb4)))) >>> {((&(8'ha5)) ? {(8'hba), (8'ha6)} : {(8'hb2)}), (!((8'haa) != (8'hb8)))})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire26;
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  assign y = {wire41,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= $signed(wire19);
      reg23 <= wire21[(1'h0):(1'h0)];
      reg24 <= {wire18, wire19};
      reg25 <= ($signed($unsigned(wire18[(1'h1):(1'h1)])) - wire19);
    end
  assign wire26 = (~(8'hba));
  always
    @(posedge clk) begin
      reg27 <= (^wire18);
      reg28 <= (wire21 & (~reg27[(4'h8):(2'h3)]));
      reg29 <= $signed((^~reg22[(4'ha):(3'h6)]));
      reg30 <= ($signed(($signed(wire20) ?
          (~((8'h9e) ?
              reg23 : wire18)) : $signed((wire19 ^~ reg25)))) && (8'ha1));
      reg31 <= reg24;
    end
  assign wire32 = $signed(reg23);
  assign wire33 = {wire26[(1'h1):(1'h0)]};
  assign wire34 = reg27;
  always
    @(posedge clk) begin
      if ({{wire26,
              (({reg24, reg28} ? {(8'ha3), reg30} : wire33[(1'h1):(1'h0)]) ?
                  ((reg29 >>> wire21) ?
                      $unsigned(reg28) : (reg24 ~^ reg27)) : reg28)}})
        begin
          if ($unsigned((~|(~|$signed(reg27[(4'hf):(2'h3)])))))
            begin
              reg35 <= $signed({({$unsigned((8'h9f))} ? reg24 : wire34)});
            end
          else
            begin
              reg35 <= (!{$unsigned(reg28[(3'h7):(1'h1)])});
              reg36 <= wire32;
              reg37 <= ((&(+wire33)) > $signed(reg23[(1'h1):(1'h0)]));
              reg38 <= $signed(reg24[(3'h5):(1'h0)]);
            end
          reg39 <= (&(8'hb4));
          reg40 <= ($unsigned({$signed($signed((8'hbb)))}) <= $signed($signed($signed((wire34 >= reg35)))));
        end
      else
        begin
          reg35 <= wire32[(3'h5):(1'h0)];
          reg36 <= reg25[(1'h0):(1'h0)];
          reg37 <= reg30;
          reg38 <= reg25;
        end
    end
  assign wire41 = ($unsigned(((8'ha1) != reg40)) >= {$unsigned((reg23[(1'h0):(1'h0)] ?
                          reg25 : $unsigned(reg36)))});
endmodule

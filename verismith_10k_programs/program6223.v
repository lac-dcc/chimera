module top
#(parameter param145 = ({(~((~|(8'hb6)) * {(8'hbf)}))} ? (8'hab) : (8'ha3)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(4'hc):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire139;
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire50,
                 wire52,
                 wire53,
                 wire54,
                 wire81,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire91,
                 wire139,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  module4 #() modinst51 (wire50, clk, wire3, wire0, wire1, wire2, (8'ha3));
  assign wire52 = (8'ha2);
  assign wire53 = (~|($unsigned($unsigned({wire50})) << $unsigned(wire2)));
  assign wire54 = {{(8'ha5)}, ((~|wire0) >> (~^$unsigned((~&wire0))))};
  module55 #() modinst82 (wire81, clk, wire0, wire50, wire3, wire54);
  assign wire83 = ({$signed(wire3[(4'hb):(2'h2)])} ?
                      (^~(~|(wire3[(3'h4):(2'h3)] ?
                          $unsigned(wire50) : (^~wire53)))) : (~|(+($unsigned(wire2) ?
                          (wire50 ? wire0 : wire81) : (wire0 ?
                              wire0 : wire3)))));
  assign wire84 = wire1[(2'h3):(2'h2)];
  assign wire85 = wire50[(2'h2):(2'h2)];
  assign wire86 = (8'ha2);
  always
    @(posedge clk) begin
      reg87 <= $unsigned(wire0);
      reg88 <= wire54;
      reg89 <= (($unsigned((wire83 ? $signed(wire0) : (~&(8'ha5)))) ?
          $signed(wire84[(2'h3):(2'h3)]) : wire81) > $signed(wire54[(1'h0):(1'h0)]));
      reg90 <= wire84[(2'h3):(1'h1)];
    end
  assign wire91 = {(^((wire54 == ((8'hbc) ?
                          wire52 : wire2)) ^ ((|wire85) >> (wire85 ?
                          wire2 : reg88))))};
  module92 #() modinst140 (.wire97(reg90), .y(wire139), .wire95(wire81), .wire96(reg88), .wire94(wire0), .clk(clk), .wire93(wire50));
  assign wire141 = (~|$unsigned($unsigned(wire83)));
  assign wire142 = $signed($signed($signed($unsigned(wire85[(5'h15):(4'h9)]))));
  assign wire143 = $unsigned(wire54);
  assign wire144 = $signed(wire53[(3'h7):(1'h1)]);
endmodule

module module92
#(parameter param138 = (((7'h41) - (~^(((8'ha0) ? (8'ha3) : (8'ha2)) ^~ (^~(8'had))))) ? (-(({(7'h43), (8'hbc)} ? {(8'hbe), (8'h9e)} : ((8'h9e) ? (8'hb2) : (8'ha1))) << ({(8'hb5), (7'h41)} > ((8'h9e) ? (8'ha3) : (8'ha6))))) : ((((~(8'ha0)) ? ((8'hb0) ? (8'hb0) : (8'hb4)) : (&(8'hb8))) != (((8'hb6) ? (8'hb2) : (7'h44)) & (!(8'hbb)))) * ((((8'hb8) ? (8'hb6) : (8'hbd)) ? (8'ha2) : {(7'h43)}) ? ((^~(8'hba)) | ((8'hba) ~^ (8'hb6))) : {((8'h9d) ? (8'h9e) : (8'ha8))}))))
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire97;
  input wire signed [(5'h10):(1'h0)] wire96;
  input wire [(3'h5):(1'h0)] wire95;
  input wire [(4'hc):(1'h0)] wire94;
  input wire [(4'h9):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire124;
  wire signed [(4'hf):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire124,
                 wire99,
                 wire98,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire98 = (wire94 ?
                      $unsigned(wire95) : ({(-(~wire93)), wire96} ?
                          $unsigned($unsigned(wire96[(4'he):(3'h6)])) : (($signed(wire93) << wire95[(2'h3):(2'h2)]) ?
                              wire93[(3'h7):(3'h5)] : wire94[(4'h8):(3'h7)])));
  assign wire99 = (~wire94);
  module100 #() modinst125 (wire124, clk, wire99, wire98, wire97, wire93);
  always
    @(posedge clk) begin
      if (wire96)
        begin
          reg126 <= (~$unsigned(($unsigned({wire95}) ?
              (~|(8'ha8)) : $unsigned((^~wire93)))));
          reg127 <= ((~|wire124) == wire95);
          reg128 <= $unsigned({wire99, (&$signed((8'haf)))});
        end
      else
        begin
          reg126 <= wire124;
        end
      reg129 <= wire94;
      reg130 <= (|$signed(wire99[(3'h4):(2'h2)]));
    end
  assign wire131 = (((($signed(wire124) ?
                           $unsigned(reg129) : $unsigned(reg129)) >= {reg127[(4'hf):(2'h3)]}) ?
                       reg130[(1'h1):(1'h0)] : wire124) & ((wire93[(1'h1):(1'h1)] || wire94) ?
                       (+$signed($signed(wire95))) : (~&reg130)));
  assign wire132 = $unsigned(reg129[(1'h1):(1'h1)]);
  assign wire133 = wire97;
  assign wire134 = ((wire131 | (wire98 ^ {wire94[(4'h8):(2'h3)],
                       $signed(reg130)})) != reg127[(2'h2):(2'h2)]);
  assign wire135 = (~^$unsigned(wire124));
  assign wire136 = wire93[(1'h1):(1'h0)];
  assign wire137 = {(~&wire134[(4'h8):(4'h8)])};
endmodule

module module55
#(parameter param80 = (^~((7'h44) ? {((-(8'h9c)) <<< ((8'h9f) <= (8'haa))), {{(8'ha2)}, (8'hb6)}} : {(((8'ha6) || (8'hb4)) ? {(8'ha6), (8'h9d)} : ((8'hbf) >>> (8'ha1))), (((8'ha9) ~^ (8'h9c)) ? ((8'hbc) == (7'h40)) : {(8'hb2)})})))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire59;
  input wire signed [(3'h4):(1'h0)] wire58;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire [(4'hc):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire60;
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg61,
                 (1'h0)};
  assign wire60 = $signed(wire58);
  always
    @(posedge clk) begin
      reg61 <= (~&(wire59 ? wire59 : wire60));
    end
  assign wire62 = wire60[(3'h6):(3'h6)];
  assign wire63 = (|$unsigned(wire62[(2'h2):(1'h0)]));
  assign wire64 = $signed(wire62);
  always
    @(posedge clk) begin
      if (($signed($signed((7'h44))) ?
          $unsigned(($unsigned((8'hb2)) ?
              wire57[(3'h5):(3'h4)] : $signed($signed((8'had))))) : (wire57 && ($unsigned((wire58 + wire59)) ?
              wire64 : wire59[(4'ha):(2'h3)]))))
        begin
          if (($signed($signed(($signed(reg61) + (wire64 ? wire60 : wire58)))) ?
              wire59 : ($unsigned((~$unsigned(wire62))) && $unsigned($unsigned(wire63)))))
            begin
              reg65 <= (wire59[(4'hc):(2'h3)] ? wire62 : wire62);
            end
          else
            begin
              reg65 <= (^(~&$unsigned((!{wire60}))));
            end
          if ((!(((-(wire58 ? reg65 : (8'hb4))) ?
                  (^~(!(8'hba))) : $unsigned((+reg65))) ?
              {$signed((^wire64))} : ($unsigned($unsigned(wire56)) ?
                  ($unsigned(wire64) | {wire62, wire64}) : wire58))))
            begin
              reg66 <= ((wire60[(3'h5):(1'h1)] ?
                  wire56 : (~|wire56)) ~^ wire58[(3'h4):(1'h0)]);
              reg67 <= (reg61[(3'h6):(1'h0)] ?
                  (^~(wire62 ?
                      ($unsigned(reg65) ?
                          $unsigned(wire62) : ((8'h9f) ?
                              wire62 : wire58)) : $unsigned(((8'h9d) > (8'hb4))))) : $unsigned((((~^wire56) ?
                          (wire63 >> wire59) : wire57[(3'h4):(1'h1)]) ?
                      (wire58[(1'h1):(1'h1)] ?
                          $signed(wire60) : reg61[(3'h4):(2'h3)]) : $unsigned(wire60[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg66 <= (~($signed($unsigned(((8'hb9) ? reg65 : reg61))) ?
                  ((~^(-wire62)) & (~(wire58 != reg61))) : $signed($signed($signed(wire56)))));
            end
          if ($signed((^$unsigned(((wire64 ? (7'h44) : (8'ha0)) > reg61)))))
            begin
              reg68 <= (reg61 ?
                  (~reg61) : (wire57 ?
                      wire60 : {($signed((8'hb4)) ?
                              (wire57 >= wire63) : (^~wire56))}));
              reg69 <= $unsigned((reg66[(3'h7):(2'h3)] ?
                  (^$signed($unsigned(reg65))) : wire58));
              reg70 <= $unsigned((wire57 ? wire57 : (8'h9f)));
            end
          else
            begin
              reg68 <= reg66;
              reg69 <= reg70;
              reg70 <= $signed(reg61);
              reg71 <= $unsigned((~&(((!wire62) ^ $unsigned((8'ha8))) ?
                  $signed($signed((8'ha9))) : $signed((wire63 ?
                      (8'hae) : wire63)))));
            end
        end
      else
        begin
          reg65 <= (~&(&$unsigned((8'hbc))));
          reg66 <= reg68[(4'he):(2'h3)];
          reg67 <= (!((($signed(wire58) ^ wire57[(2'h3):(1'h0)]) != $unsigned((~wire62))) <= (~^wire64)));
        end
      reg72 <= reg66[(2'h3):(1'h1)];
      reg73 <= wire63;
    end
  assign wire74 = reg73[(4'hd):(3'h6)];
  assign wire75 = {$unsigned(reg67[(2'h3):(1'h1)]), $unsigned(wire57)};
  assign wire76 = (((8'ha6) ?
                          {({(8'hae), wire75} ?
                                  (&reg70) : (wire63 >= wire59))} : wire63) ?
                      reg67[(4'ha):(1'h1)] : $unsigned(($signed((wire64 << wire63)) ^ ((reg73 ?
                              reg66 : reg69) ?
                          $unsigned(reg72) : reg66))));
  assign wire77 = $unsigned(reg72[(4'hb):(1'h0)]);
  assign wire78 = wire63;
  assign wire79 = (($signed($signed($unsigned(wire74))) ?
                          $signed((&wire60[(1'h1):(1'h0)])) : (~|($unsigned(wire59) ?
                              {reg70} : reg67))) ?
                      ($unsigned(((wire59 ? wire77 : wire75) ?
                          (reg71 ?
                              reg70 : wire57) : $signed((8'ha4)))) <= (reg72 ?
                          $unsigned($signed(reg72)) : (7'h41))) : reg72[(3'h5):(2'h3)]);
endmodule

module module4
#(parameter param48 = ((((((8'had) + (7'h43)) ? ((7'h41) <<< (8'hb0)) : ((8'hac) < (8'hb6))) ? (((8'hb1) || (8'ha8)) ? ((8'hbd) - (8'ha5)) : (^~(7'h42))) : (((8'ha2) <<< (8'ha4)) * ((8'ha1) ? (7'h44) : (8'ha7)))) ? ((-{(8'haa), (8'ha5)}) ? ((8'hbc) << (&(7'h40))) : (!((8'hb3) ? (8'ha8) : (8'ha7)))) : (((^(8'hb9)) ? (~(8'ha4)) : ((8'hbe) != (8'ha1))) ? {(+(7'h41))} : ({(8'ha8)} <= (~^(8'haa))))) ? {(8'haf)} : (&((((8'hb0) ? (8'hb5) : (8'ha1)) ? (!(8'haf)) : ((8'h9d) <<< (8'hac))) ? ((~|(8'hb8)) ? (8'hbe) : {(8'hb3), (8'hb4)}) : {((8'hbb) ? (8'ha9) : (8'hae)), {(8'had)}}))), 
parameter param49 = (&{{((param48 << param48) << (^~param48))}, (param48 && param48)}))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire6 || wire6[(3'h6):(3'h6)]))
        begin
          reg10 <= wire5[(4'hd):(1'h1)];
          reg11 <= $signed($signed((wire5[(4'ha):(1'h1)] <<< ($unsigned(wire7) ?
              (wire6 ^ wire6) : reg10))));
        end
      else
        begin
          reg10 <= $signed(((reg10 | wire8) & (~({wire8, wire7} ?
              ((8'hb7) || wire7) : {wire5}))));
        end
    end
  assign wire12 = $signed(wire9[(3'h4):(1'h1)]);
  assign wire13 = {(wire7 ?
                          wire8 : {wire6[(4'he):(4'h8)],
                              (-wire9[(2'h3):(1'h0)])})};
  assign wire14 = (reg11 >= wire12);
  assign wire15 = ($signed($unsigned(wire7[(3'h6):(2'h2)])) - $unsigned((+(~reg10[(3'h4):(1'h0)]))));
  assign wire16 = $unsigned((^$unsigned($unsigned($unsigned(wire9)))));
  module17 #() modinst41 (.wire18(wire8), .wire20(wire15), .wire19(wire12), .wire21(wire7), .y(wire40), .clk(clk));
  assign wire42 = (8'h9d);
  assign wire43 = ((&$signed($signed(wire40[(3'h7):(2'h2)]))) || (((8'haa) ~^ (8'hb3)) || (wire40[(3'h6):(2'h3)] || $signed(wire9))));
  assign wire44 = wire12[(3'h5):(3'h4)];
  assign wire45 = $unsigned({$unsigned((!(wire6 ~^ wire12)))});
  assign wire46 = wire43[(3'h5):(2'h3)];
  assign wire47 = (^((wire16 ? wire13 : (&(wire44 - (8'hac)))) ?
                      $unsigned($signed(((8'h9f) ^ wire46))) : (^$unsigned((^~wire7)))));
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire22 = $unsigned(wire20[(4'ha):(1'h0)]);
  assign wire23 = (-(wire18[(2'h3):(2'h3)] << ({wire20[(4'hd):(4'hc)],
                      (wire19 ? wire21 : wire20)} >> (7'h43))));
  assign wire24 = $unsigned(wire21[(1'h1):(1'h1)]);
  assign wire25 = (8'hb5);
  assign wire26 = wire23;
  assign wire27 = $unsigned(($signed(($unsigned(wire19) < $unsigned(wire19))) ?
                      (wire21 >> wire26) : wire24[(4'hb):(4'h8)]));
  assign wire28 = wire20;
  assign wire29 = $signed((~&($unsigned(wire25[(3'h5):(2'h3)]) ?
                      {$signed((8'hb9)),
                          $signed(wire22)} : (-$signed(wire23)))));
  assign wire30 = (wire28[(3'h7):(2'h3)] ?
                      wire21 : {$signed(wire29[(5'h10):(4'h9)])});
  assign wire31 = wire28;
  assign wire32 = $unsigned((!$signed($signed(wire25))));
  assign wire33 = {wire32, $signed($signed($signed(wire20[(4'ha):(3'h5)])))};
  always
    @(posedge clk) begin
      reg34 <= (8'ha5);
      reg35 <= {(~^({wire23[(3'h4):(2'h3)]} ^ ((~wire30) > $signed(wire32)))),
          wire33[(4'hb):(2'h2)]};
      if ((((8'ha0) + (((reg35 - wire20) * $unsigned(wire19)) ?
          {$unsigned((8'h9c)), (~^wire30)} : (~|{wire22}))) * wire24))
        begin
          reg36 <= $unsigned(wire28[(3'h5):(1'h0)]);
          if (reg36[(4'he):(4'hd)])
            begin
              reg37 <= $unsigned($unsigned(($signed($unsigned(reg35)) ?
                  $signed((+(8'hbc))) : ((reg35 * reg36) ?
                      {wire19, wire19} : $signed(wire30)))));
              reg38 <= $unsigned($signed((~&(&$signed(wire20)))));
              reg39 <= {($unsigned($unsigned(wire27)) ?
                      {$signed($unsigned(reg36))} : wire21[(2'h2):(1'h1)]),
                  (^{$signed((!wire31))})};
            end
          else
            begin
              reg37 <= $signed((wire22 ?
                  ((~$signed(wire32)) - $signed(wire26)) : reg36[(3'h5):(1'h0)]));
            end
        end
      else
        begin
          reg36 <= ($signed((+((wire27 ? wire28 : wire27) ?
              (reg36 != reg37) : wire24[(4'ha):(3'h6)]))) * (~^reg39[(3'h7):(3'h5)]));
        end
    end
endmodule

module module100  (y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  input wire [(4'ha):(1'h0)] wire102;
  input wire [(2'h3):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire105 = {(~|$signed($unsigned((wire102 >= wire104))))};
  assign wire106 = (+{(wire105[(3'h5):(1'h1)] ?
                           wire105 : (wire103[(4'h8):(2'h2)] ?
                               $signed((8'hae)) : (wire102 ?
                                   wire105 : wire104))),
                       ((&(wire103 ^ wire102)) ?
                           (&{wire101,
                               wire102}) : ({(8'hae)} != (wire105 ^ wire101)))});
  assign wire107 = wire103[(5'h10):(1'h0)];
  assign wire108 = wire103;
  always
    @(posedge clk) begin
      if ($unsigned(wire103))
        begin
          if ($signed(wire107[(1'h1):(1'h0)]))
            begin
              reg109 <= ($signed(wire101) && wire107);
              reg110 <= $signed((^wire108[(5'h13):(4'hf)]));
              reg111 <= wire105;
            end
          else
            begin
              reg109 <= ($unsigned(wire105) >= wire107[(1'h1):(1'h1)]);
              reg110 <= (~&$unsigned((~({wire108,
                  wire106} * $signed(wire107)))));
            end
          reg112 <= $unsigned((wire104[(4'hf):(4'hd)] ?
              $signed((reg110 ?
                  (wire102 ?
                      wire101 : wire103) : (^~(8'haf)))) : wire107[(2'h2):(1'h1)]));
          reg113 <= (wire104[(2'h2):(1'h0)] + wire108[(3'h5):(3'h5)]);
        end
      else
        begin
          reg109 <= $signed($unsigned({$unsigned((wire101 ? wire102 : reg109)),
              (~^(~&wire104))}));
          reg110 <= ((reg110 >>> wire105[(5'h11):(2'h3)]) <= $unsigned(((|{wire105,
                  reg111}) ?
              $signed((^~reg111)) : wire102[(3'h6):(2'h2)])));
        end
      reg114 <= ({(reg112[(1'h1):(1'h0)] ?
              ((wire107 - reg113) ?
                  wire101[(1'h0):(1'h0)] : (&wire104)) : $signed((8'hbd)))} <<< $signed(((|{wire106,
          wire106}) - (8'ha5))));
      reg115 <= $signed(wire103);
      reg116 <= $signed($signed($unsigned(wire103)));
    end
  always
    @(posedge clk) begin
      reg117 <= ((^~(+(((8'hb5) >= wire106) * (reg110 ? wire102 : wire101)))) ?
          reg111 : reg116[(3'h4):(2'h2)]);
      reg118 <= ($signed((!reg116[(4'hd):(4'h9)])) ? wire101 : wire106);
      reg119 <= reg117;
    end
  assign wire120 = $signed((+$signed(wire102)));
  assign wire121 = reg111[(4'h8):(4'h8)];
  assign wire122 = ($signed($unsigned(($signed(wire107) ?
                       $signed(reg117) : $signed(reg116)))) * $unsigned(($signed($signed(wire107)) ?
                       $signed(wire121) : $signed(((8'ha8) ~^ reg113)))));
  assign wire123 = wire103;
endmodule

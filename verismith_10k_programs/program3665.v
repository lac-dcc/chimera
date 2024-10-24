module top
#(parameter param132 = (&(|{(((8'ha7) ? (8'h9f) : (8'hbe)) ? ((8'h9d) ? (8'hbf) : (7'h42)) : ((7'h41) ? (8'hb7) : (8'ha5))), (&{(8'ha8)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire125;
  assign y = {wire130, wire129, wire128, wire127, wire125, (1'h0)};
  module4 #() modinst126 (.clk(clk), .wire6(wire2), .wire9(wire0), .wire5((8'hbc)), .wire8(wire3), .wire7(wire1), .y(wire125));
  assign wire127 = wire125;
  assign wire128 = {$signed((wire0 ?
                           wire127[(4'hb):(4'h8)] : (!(wire125 ?
                               wire3 : wire3)))),
                       ($unsigned(($unsigned(wire1) & (wire1 ?
                           wire125 : wire127))) <= (!wire127))};
  assign wire129 = wire3;
  module71 #() modinst131 (.wire73(wire1), .y(wire130), .clk(clk), .wire75(wire2), .wire72(wire128), .wire74(wire125));
endmodule

module module4
#(parameter param124 = (~^(((~|(^(8'hb1))) ? ((~(7'h42)) == ((8'ha1) ? (8'hab) : (7'h43))) : (&((8'hb2) ? (8'hb7) : (8'ha1)))) ? ({((8'ha9) ? (7'h40) : (8'hba))} ^~ ((!(7'h40)) | ((8'hab) ? (8'hb7) : (8'hbd)))) : {((~&(8'hb2)) ? {(7'h41), (7'h44)} : {(8'ha5), (8'hb7)})})))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h26e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  assign y = {wire123,
                 wire121,
                 wire106,
                 wire93,
                 wire70,
                 wire69,
                 wire67,
                 wire47,
                 wire46,
                 wire32,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  assign wire10 = ((^$signed((wire9 & wire6))) && wire9[(1'h1):(1'h1)]);
  assign wire11 = wire8;
  assign wire12 = (wire9[(3'h7):(3'h5)] ^ (wire5[(2'h3):(2'h2)] + $signed(wire6[(1'h0):(1'h0)])));
  assign wire13 = (8'hb3);
  assign wire14 = (wire9 ?
                      wire5 : $signed(($signed($unsigned(wire13)) ?
                          wire11 : $unsigned(wire10))));
  assign wire15 = wire11;
  assign wire16 = (^~{(~|($signed(wire7) ?
                          (wire7 ^ wire8) : (wire11 ? wire10 : wire6)))});
  always
    @(posedge clk) begin
      reg17 <= ((8'h9d) ?
          {wire15[(1'h1):(1'h1)]} : (^~(wire14 ? wire5 : (8'ha4))));
      reg18 <= ((wire12 << ($signed(wire10[(1'h0):(1'h0)]) ?
              (!((8'hb9) ? wire9 : wire9)) : wire14[(4'hd):(1'h1)])) ?
          wire9 : $unsigned((wire9[(3'h5):(1'h0)] ?
              $unsigned((wire11 - wire5)) : ((wire12 >= wire5) ?
                  (wire10 ? reg17 : wire11) : (~&wire12)))));
      reg19 <= $unsigned($unsigned((&wire16[(2'h2):(1'h0)])));
      if ((!$unsigned(wire14)))
        begin
          reg20 <= $unsigned((^wire16[(3'h5):(2'h2)]));
          if (wire11)
            begin
              reg21 <= (reg17 + (^reg17[(1'h1):(1'h0)]));
            end
          else
            begin
              reg21 <= wire6[(2'h2):(1'h0)];
            end
          reg22 <= wire14;
          reg23 <= ((-reg17) ?
              $unsigned($signed(($unsigned(wire16) >>> (reg21 ?
                  reg21 : wire12)))) : wire5);
          reg24 <= wire16;
        end
      else
        begin
          reg20 <= (|($signed(reg20) ?
              (wire14 ?
                  (wire14[(4'hc):(4'hb)] ^ (wire14 - wire11)) : $unsigned(reg17[(2'h3):(1'h0)])) : $signed(((wire5 || reg17) && $unsigned(wire11)))));
          reg21 <= (8'hb2);
        end
    end
  always
    @(posedge clk) begin
      reg25 <= wire7;
      if (wire8[(4'hc):(4'hc)])
        begin
          reg26 <= $unsigned($unsigned($signed(wire16)));
          reg27 <= ($unsigned(reg18) - reg26);
          reg28 <= wire13[(2'h2):(1'h1)];
          reg29 <= wire6;
          reg30 <= $unsigned($signed(reg20[(3'h7):(3'h7)]));
        end
      else
        begin
          reg26 <= ({(|reg22),
              reg30[(1'h0):(1'h0)]} == $signed((wire5[(2'h3):(2'h3)] ?
              wire14[(2'h2):(1'h1)] : reg24[(3'h5):(3'h4)])));
          reg27 <= $signed($signed($unsigned($signed($signed(wire13)))));
        end
      reg31 <= (^~reg27[(3'h5):(1'h1)]);
    end
  assign wire32 = wire13;
  always
    @(posedge clk) begin
      if ((+((+({reg30} < wire11[(1'h1):(1'h0)])) ?
          wire32[(3'h4):(2'h3)] : $signed($signed((~&(8'had)))))))
        begin
          reg33 <= ({$unsigned({$signed(reg25)}),
              reg26} - ($unsigned((!(^wire9))) >> wire9));
          if (($signed((wire7 | {{(8'ha1), wire12}})) <<< wire16))
            begin
              reg34 <= (^~$unsigned($signed((~$signed(wire15)))));
              reg35 <= (^~wire15);
              reg36 <= $signed(($signed(reg29[(1'h1):(1'h1)]) ^ reg33[(4'hc):(3'h6)]));
              reg37 <= reg28;
            end
          else
            begin
              reg34 <= wire12;
              reg35 <= (+reg21);
            end
          reg38 <= (~&$unsigned(reg19[(1'h1):(1'h1)]));
          reg39 <= reg27[(4'hc):(3'h7)];
          reg40 <= ($signed(($signed(reg22[(3'h4):(1'h0)]) ?
                  ((wire7 ? reg27 : wire7) ?
                      reg21 : (reg18 << reg21)) : ((reg17 & reg30) ?
                      $signed((8'hab)) : $signed((8'hac))))) ?
              wire15[(3'h5):(2'h3)] : reg30);
        end
      else
        begin
          if ((wire6[(1'h1):(1'h0)] ?
              (~^(+{((8'hb7) ?
                      reg40 : reg29)})) : {(-$signed($signed(wire13)))}))
            begin
              reg33 <= (($signed(reg25[(4'he):(4'h8)]) < (((~&reg26) ?
                  (8'hb4) : reg22) >>> {(reg26 ?
                      reg29 : wire14)})) * $signed($unsigned((reg21[(1'h0):(1'h0)] && reg36[(3'h5):(3'h4)]))));
            end
          else
            begin
              reg33 <= $unsigned(wire11);
              reg34 <= (~^reg35[(1'h0):(1'h0)]);
              reg35 <= (~($signed((reg19 && (!reg29))) > (wire15 && $unsigned($unsigned(reg21)))));
              reg36 <= ($signed($unsigned((wire15 * $unsigned(reg33)))) ?
                  wire5[(4'h8):(1'h1)] : (^reg35[(1'h0):(1'h0)]));
            end
          reg37 <= (^~reg20[(3'h5):(2'h3)]);
          if (reg23)
            begin
              reg38 <= $signed(reg21);
              reg39 <= $unsigned($unsigned(($signed(wire10) >= $unsigned($signed(reg25)))));
              reg40 <= $unsigned(reg31[(1'h1):(1'h1)]);
              reg41 <= $signed(($unsigned(wire12) ?
                  (reg36 ?
                      wire9 : (^~$unsigned(wire9))) : reg39[(2'h3):(1'h0)]));
            end
          else
            begin
              reg38 <= $unsigned($unsigned((^reg18)));
              reg39 <= $unsigned($signed($unsigned(((reg37 ? reg22 : reg36) ?
                  wire14[(1'h0):(1'h0)] : wire6))));
              reg40 <= wire10;
            end
          reg42 <= $signed(reg40[(5'h10):(4'h8)]);
          reg43 <= $signed($unsigned(wire14[(1'h0):(1'h0)]));
        end
      reg44 <= $unsigned($unsigned({(wire7[(4'hf):(3'h6)] ?
              $unsigned(wire5) : wire15),
          ($signed(reg41) <<< {wire9, reg17})}));
      reg45 <= $unsigned($unsigned(reg44));
    end
  assign wire46 = $signed(reg23);
  assign wire47 = reg31;
  module48 #() modinst68 (.wire51(reg22), .y(wire67), .wire52(reg27), .clk(clk), .wire50(reg26), .wire53(reg41), .wire49(reg29));
  assign wire69 = reg43;
  assign wire70 = reg18;
  module71 #() modinst94 (wire93, clk, wire12, reg38, wire6, reg45);
  module95 #() modinst107 (.wire97(wire11), .wire98(wire93), .y(wire106), .wire96(reg33), .wire99(reg18), .clk(clk));
  module108 #() modinst122 (.wire109(wire5), .wire112(reg44), .y(wire121), .clk(clk), .wire111(wire46), .wire110(reg41));
  assign wire123 = reg39[(3'h5):(2'h2)];
endmodule

module module108
#(parameter param120 = ({{((8'h9c) ? ((8'hbf) ^~ (8'ha5)) : ((8'hb7) == (8'hae)))}, ((~&((8'hb5) != (8'ha6))) ? (((8'ha8) ? (8'hba) : (8'hab)) ? (^~(8'ha7)) : ((8'hae) ? (8'hac) : (8'hbd))) : {((8'ha7) ? (8'hbe) : (8'hab))})} ? ({(((7'h43) ? (8'h9e) : (8'ha7)) ? ((7'h40) <= (8'hac)) : ((8'h9c) & (8'hac))), ((~|(8'hbc)) >> (~|(8'hb1)))} ? (-(^((8'ha5) && (8'hab)))) : (((|(8'hbd)) ? {(8'hae), (8'hbe)} : (^~(8'hac))) ? {((8'hae) ? (8'hb3) : (8'hae)), ((8'hbb) ^ (8'h9e))} : {((7'h44) ? (8'hb0) : (8'hb2)), {(8'hb6)}})) : ({((7'h42) ? (~^(8'haa)) : ((8'hb9) || (7'h43)))} > (8'hab))))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire112;
  input wire signed [(4'he):(1'h0)] wire111;
  input wire signed [(4'hf):(1'h0)] wire110;
  input wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  assign y = {wire119,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 reg118,
                 (1'h0)};
  assign wire113 = (wire110[(3'h5):(2'h3)] + {$signed(((wire111 <<< wire110) ^ $unsigned((8'hb4)))),
                       (~^(-(8'hb6)))});
  assign wire114 = (^$unsigned({(wire112 ?
                           (wire112 ? wire112 : wire111) : wire109),
                       ($unsigned(wire109) >> $signed((8'hb6)))}));
  assign wire115 = wire109[(3'h4):(1'h0)];
  assign wire116 = wire112;
  assign wire117 = wire112;
  always
    @(posedge clk) begin
      reg118 <= {wire114[(2'h3):(1'h1)]};
    end
  assign wire119 = (wire109[(3'h5):(2'h3)] ?
                       ($unsigned(($unsigned(reg118) != $unsigned(wire116))) || $signed(wire112)) : wire117[(4'h8):(3'h4)]);
endmodule

module module95  (y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  input wire signed [(4'he):(1'h0)] wire97;
  input wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  assign y = {wire105, wire104, wire103, wire102, wire101, wire100, (1'h0)};
  assign wire100 = ((($signed($unsigned(wire96)) && $unsigned(wire96[(3'h6):(3'h6)])) ^ wire99) ?
                       wire96 : wire97);
  assign wire101 = $signed((wire97 ?
                       $unsigned(({wire96} ?
                           (~|wire96) : {wire99, (8'haa)})) : (8'ha0)));
  assign wire102 = (wire100 ?
                       $signed(((wire99[(1'h1):(1'h0)] | wire99) + $unsigned($signed(wire98)))) : wire98[(4'ha):(1'h0)]);
  assign wire103 = $unsigned((+(^wire96[(4'h8):(1'h0)])));
  assign wire104 = wire100;
  assign wire105 = ((~$unsigned(($signed(wire104) * (~^wire97)))) ?
                       $unsigned(wire103) : wire98);
endmodule

module module71
#(parameter param92 = (((~^(&((8'hb4) ~^ (8'h9d)))) < ((((8'hbf) < (8'ha0)) ? (+(8'hb8)) : ((7'h43) ? (8'hb7) : (7'h43))) <= ((&(8'hbd)) | (!(8'hb3))))) ? ({(~{(8'hbf)}), {(^(8'ha7)), ((8'hab) >>> (8'ha3))}} < ((^(~|(8'hb9))) + (~^((8'hae) | (8'ha9))))) : ({((^~(7'h44)) ? (~(8'hb0)) : ((8'h9c) & (8'hb6))), (~&(~|(8'hb4)))} == (8'ha9))))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire75;
  input wire [(5'h15):(1'h0)] wire74;
  input wire [(5'h13):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire77,
                 wire76,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire76 = {(~&(~|(~wire74[(4'h9):(2'h3)]))),
                      ((^($unsigned(wire75) ?
                              ((8'hbf) ? wire75 : (8'ha0)) : (+(8'hac)))) ?
                          wire73[(1'h1):(1'h1)] : $unsigned((|wire72)))};
  assign wire77 = wire72[(4'ha):(4'h9)];
  always
    @(posedge clk) begin
      reg78 <= ((~|wire72[(4'h9):(2'h2)]) ?
          (($unsigned($signed(wire76)) ?
              {wire73} : ($signed(wire72) ?
                  (wire75 < wire75) : $unsigned(wire72))) >= (((wire76 <<< wire74) >> {wire75}) ?
              wire76[(2'h2):(2'h2)] : wire76[(1'h1):(1'h1)])) : {wire73,
              ($signed((wire73 | wire75)) == (wire76 ?
                  $signed(wire77) : $unsigned(wire77)))});
      reg79 <= (^((^reg78[(2'h2):(1'h1)]) * ({wire75[(4'he):(2'h3)],
              $signed((8'hb1))} ?
          wire74 : wire72)));
    end
  assign wire80 = wire72;
  assign wire81 = reg79[(3'h7):(3'h4)];
  assign wire82 = reg79;
  assign wire83 = wire76;
  assign wire84 = ({(&($signed(wire83) == wire81[(2'h2):(2'h2)])),
                      ((~reg78) ~^ reg78)} << $unsigned($unsigned(wire72[(3'h7):(2'h3)])));
  assign wire85 = ($signed((7'h41)) * (($signed(wire73[(1'h1):(1'h1)]) | (|(8'ha5))) * ({(wire81 & wire84),
                          $signed(wire77)} ?
                      wire77 : $unsigned({(8'hb3), (8'hae)}))));
  assign wire86 = {$signed(wire84[(3'h4):(2'h3)])};
  assign wire87 = (&$signed($signed((wire73 - (+(8'ha8))))));
  assign wire88 = wire82[(1'h0):(1'h0)];
  assign wire89 = {$unsigned(({(wire82 < wire73), $signed((8'h9d))} ?
                          (8'hb8) : (8'ha7))),
                      (+(!((wire74 ? wire88 : wire84) ?
                          $signed(wire75) : (+wire77))))};
  assign wire90 = (~|{$signed((wire73[(5'h10):(4'hb)] ?
                          (8'hbd) : $unsigned(reg78)))});
  assign wire91 = ((wire86[(2'h3):(2'h3)] ?
                          $signed(($signed(wire87) ^~ (wire76 ?
                              wire86 : (7'h42)))) : (!wire77[(4'he):(3'h7)])) ?
                      (7'h44) : $unsigned($unsigned(($signed(reg79) > $unsigned(wire77)))));
endmodule

module module48
#(parameter param66 = (((8'ha0) <= ((((8'ha3) * (8'ha8)) ? ((7'h41) & (8'ha0)) : ((8'hb4) || (8'h9d))) ? {(&(8'hb1)), ((7'h43) ~^ (8'hba))} : (!((8'hab) ? (8'ha0) : (8'hba))))) <= ((~|(((8'hbd) ? (8'hae) : (8'hbe)) ? (8'ha4) : {(8'haf), (8'h9f)})) >> {(((8'ha6) ^ (8'haf)) ? ((8'ha0) >> (8'hb0)) : ((7'h42) - (8'hbc))), (((8'hb6) ? (8'h9c) : (8'ha3)) ? (~^(8'hbc)) : ((8'hbc) ? (8'hbb) : (8'h9e)))})))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire53;
  input wire [(4'hc):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  input wire [(4'hf):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire55,
                 wire54,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire54 = wire49;
  assign wire55 = wire51;
  always
    @(posedge clk) begin
      reg56 <= wire50[(1'h0):(1'h0)];
      reg57 <= $unsigned(wire54);
      reg58 <= {wire53[(4'h9):(3'h4)],
          ((~|wire54[(2'h2):(1'h1)]) ?
              wire54[(3'h4):(3'h4)] : (wire52 ?
                  wire49 : ($unsigned(wire52) ?
                      wire53[(5'h10):(3'h6)] : wire53)))};
      reg59 <= {wire51[(4'he):(1'h1)], wire50};
    end
  assign wire60 = ((8'hbe) <= ({((reg59 ? wire53 : wire51) >>> $signed(reg57)),
                          wire52[(3'h4):(2'h2)]} ?
                      ($signed((-wire55)) ?
                          {wire50[(4'he):(4'h8)]} : wire54[(2'h2):(1'h1)]) : ($unsigned(wire54) ?
                          reg56[(2'h3):(2'h2)] : $signed((wire49 >>> wire55)))));
  assign wire61 = ({(wire52 != (~|reg58[(1'h1):(1'h0)])),
                          (wire54[(2'h3):(1'h1)] ?
                              wire53 : $unsigned((wire55 <<< wire60)))} ?
                      $signed({wire50[(2'h2):(1'h1)],
                          (&wire49[(1'h0):(1'h0)])}) : {(^~$signed((wire60 ?
                              (8'hbd) : wire49))),
                          $signed($unsigned(wire51))});
  assign wire62 = ({((~^(wire60 ? wire55 : wire55)) < wire50),
                          wire60[(1'h0):(1'h0)]} ?
                      reg56[(4'hc):(4'ha)] : (~^$signed((wire53 ^~ ((8'ha5) * (7'h42))))));
  assign wire63 = wire53;
  assign wire64 = $signed($signed((8'hbc)));
  assign wire65 = $unsigned($signed((((wire52 + wire64) ?
                      wire55[(2'h3):(2'h2)] : (wire61 == reg56)) ~^ $unsigned(((8'hb9) ?
                      wire61 : reg56)))));
endmodule

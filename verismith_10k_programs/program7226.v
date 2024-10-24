module top
#(parameter param113 = ((~&{{((7'h42) == (7'h42))}}) ? (~|(^~((~&(8'hb3)) ? (~^(8'hab)) : ((8'h9d) ? (8'hb2) : (7'h44))))) : (((~(!(8'hac))) << {(7'h43), {(8'had), (8'hbc)}}) ? (+{{(8'hb4), (8'ha6)}, {(8'had), (8'haa)}}) : (-(((8'ha3) * (8'ha6)) >= ((8'haf) ? (8'had) : (8'hac)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire1[(4'h9):(3'h7)];
  assign wire5 = wire2[(1'h1):(1'h1)];
  module6 #() modinst108 (.wire7(wire2), .clk(clk), .y(wire107), .wire10(wire1), .wire8(wire3), .wire9(wire4));
  assign wire109 = {$signed((wire5[(3'h7):(2'h2)] ?
                           $signed((~&wire2)) : ($signed((7'h43)) ?
                               (wire3 <= (8'hac)) : $unsigned(wire1))))};
  assign wire110 = $unsigned(wire4[(4'hc):(1'h1)]);
  assign wire111 = (((~^$unsigned(((8'hba) & wire1))) >>> (((!wire107) ?
                           $signed(wire109) : wire5[(3'h4):(2'h2)]) >= $unsigned(((8'ha5) ?
                           wire4 : wire2)))) ?
                       $signed($unsigned($signed(wire1))) : (wire1[(4'hb):(4'hb)] ~^ wire109[(1'h1):(1'h0)]));
  assign wire112 = $signed((wire0 ?
                       $unsigned($signed((wire3 ? wire1 : wire5))) : wire1));
endmodule

module module6
#(parameter param106 = ((~|({((8'hbe) ? (7'h43) : (8'hae))} && (((8'hb9) ? (8'h9c) : (8'hb3)) ? ((8'ha1) | (8'ha0)) : (&(8'hbc))))) * ((((+(8'ha3)) > ((8'ha7) < (8'ha1))) >= (8'hae)) ? ((((8'ha1) ? (8'hab) : (8'hac)) < ((8'hac) ? (8'h9f) : (8'hab))) ? (+((8'hbe) ? (8'haf) : (8'ha6))) : (((8'hbf) ? (8'haa) : (7'h43)) + ((8'ha7) || (7'h43)))) : (((~|(8'haf)) == (|(7'h40))) << ((!(8'haa)) >= ((8'hbe) ? (8'hbd) : (8'ha3)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire104, wire71, wire13, wire12, reg11, (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed((wire10 ?
          $signed({wire9[(4'h8):(2'h2)],
              wire8[(4'h8):(1'h1)]}) : wire7[(3'h6):(3'h6)]));
    end
  assign wire12 = ((wire7[(3'h7):(3'h5)] ?
                      wire8[(3'h5):(3'h5)] : wire10) || ($signed((!(wire9 ?
                      wire7 : (8'ha6)))) == (wire8[(5'h12):(5'h12)] ?
                      reg11 : ($signed(wire10) ?
                          (reg11 ?
                              (8'hb0) : wire7) : wire8[(5'h14):(5'h11)]))));
  assign wire13 = wire10;
  module14 #() modinst72 (wire71, clk, wire8, reg11, wire13, wire7, wire10);
  module73 #() modinst105 (wire104, clk, wire71, wire9, wire13, wire10, reg11);
endmodule

module module73
#(parameter param102 = ((~&((((8'hbb) ? (8'hbb) : (8'ha1)) ? ((8'hb8) ? (8'ha9) : (8'ha2)) : (^(8'hb9))) ? (!((8'ha5) ? (7'h40) : (8'h9c))) : (((8'hbf) ? (8'hba) : (8'ha2)) ? (~(8'hbe)) : ((8'h9f) ? (8'hbd) : (8'hbc))))) ^~ ({(8'hae), (((8'ha3) ? (8'hb5) : (8'hbd)) >>> (8'had))} ? (({(8'hb5), (8'ha1)} ? (!(8'h9c)) : ((8'h9f) ? (8'hb6) : (8'h9f))) ? (((8'ha6) ? (7'h40) : (8'hbe)) < (^~(8'ha5))) : (((8'ha9) ? (8'hb1) : (7'h43)) + {(8'haf), (8'hb0)})) : (8'ha7))), 
parameter param103 = {param102, {param102, (param102 ? ((8'hb0) | (param102 ? param102 : (8'hb8))) : ((param102 ? (8'ha7) : param102) << {param102, param102}))}})
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire78;
  input wire [(5'h13):(1'h0)] wire77;
  input wire [(4'hb):(1'h0)] wire76;
  input wire [(4'hd):(1'h0)] wire75;
  input wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire81;
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire81,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg79 <= wire78;
      reg80 <= (($signed((wire75 <<< {wire75})) ?
              $unsigned(wire78) : ($signed($unsigned(reg79)) ?
                  wire76 : $signed($signed((8'hac))))) ?
          reg79 : wire76);
    end
  assign wire81 = (^~wire78);
  always
    @(posedge clk) begin
      if ($signed({($signed((^~reg79)) ?
              ((7'h43) ?
                  ((8'haa) ?
                      reg80 : wire77) : $signed((7'h40))) : $signed((wire77 & reg80)))}))
        begin
          reg82 <= wire75;
        end
      else
        begin
          if (((~^(({(8'hbd), reg82} ? (wire78 ? reg79 : reg79) : reg80) ?
              $signed((reg80 + wire81)) : wire74)) == wire78))
            begin
              reg82 <= reg82[(3'h7):(2'h3)];
              reg83 <= $unsigned($signed(reg80));
            end
          else
            begin
              reg82 <= (!$unsigned((wire74[(3'h4):(1'h1)] + reg80[(2'h3):(1'h0)])));
            end
        end
      reg84 <= ((reg79 ?
              ((-(wire78 ? reg79 : wire77)) * wire78) : (wire78[(1'h1):(1'h1)] ?
                  $unsigned({reg80, wire78}) : $unsigned($signed(wire81)))) ?
          ($unsigned((^wire81)) >= wire76) : reg79[(4'h9):(3'h4)]);
      if ($unsigned(((^(&(~&wire75))) <= (8'h9f))))
        begin
          reg85 <= wire75[(4'h8):(2'h2)];
          reg86 <= (wire74 ?
              $unsigned(reg85[(4'hb):(1'h1)]) : $signed(((~^wire76) ?
                  wire76[(1'h0):(1'h0)] : $signed(wire75))));
        end
      else
        begin
          reg85 <= $signed((+($unsigned($signed(reg80)) ?
              $unsigned(wire81[(1'h0):(1'h0)]) : (((8'h9d) ? reg82 : wire76) ?
                  $unsigned(wire76) : $signed(reg84)))));
          if ((wire74 ?
              ((wire81[(3'h5):(2'h2)] ? wire75 : reg84[(1'h1):(1'h0)]) ?
                  $signed(((wire81 || (8'ha4)) >= ((8'hac) <<< wire75))) : $signed(($signed(wire78) ?
                      (wire78 ^ wire81) : (reg83 < reg85)))) : $signed((wire76[(1'h0):(1'h0)] ?
                  (~(wire76 ^ (8'hbb))) : $unsigned({wire78})))))
            begin
              reg86 <= $unsigned(wire81[(1'h0):(1'h0)]);
            end
          else
            begin
              reg86 <= (wire75 ? $signed($signed(reg82)) : wire74);
              reg87 <= $signed($unsigned({({wire78, wire78} ?
                      (reg83 ? wire75 : reg83) : wire77),
                  $unsigned({wire75, reg80})}));
              reg88 <= wire75[(2'h2):(1'h0)];
              reg89 <= $unsigned(reg84[(3'h6):(3'h6)]);
              reg90 <= wire81[(4'h8):(1'h0)];
            end
          reg91 <= $signed(($unsigned(($signed((8'hb5)) ^ ((7'h43) ~^ reg87))) << (|$unsigned((wire74 ?
              (8'hac) : wire75)))));
        end
      reg92 <= $signed((~^$unsigned(((~|(8'h9c)) ?
          $signed(wire74) : $signed(reg89)))));
    end
  always
    @(posedge clk) begin
      reg93 <= ((~wire81[(3'h6):(3'h5)]) << ((reg83 ?
              {(^reg79)} : reg85[(4'h8):(2'h2)]) ?
          reg83 : reg82));
    end
  assign wire94 = (reg87[(2'h3):(1'h0)] >>> $signed(($signed(reg92) ?
                      {(reg91 ? reg79 : reg79)} : reg84[(1'h1):(1'h0)])));
  assign wire95 = wire75;
  assign wire96 = wire81;
  assign wire97 = ((reg91 ?
                      (+$unsigned((-wire96))) : $signed($signed((wire74 ?
                          wire96 : reg79)))) << $signed((((wire74 + (8'hae)) == {reg82}) ?
                      reg91[(4'h9):(4'h8)] : $unsigned((wire95 ^ (8'h9e))))));
  assign wire98 = $unsigned((~&(wire78 > {(wire95 ? wire81 : wire74)})));
  assign wire99 = reg83;
  assign wire100 = ($signed((|reg93)) ?
                       (reg84 ?
                           $signed(($signed(wire75) ^~ (reg85 ?
                               (8'haa) : reg93))) : (reg89[(1'h1):(1'h1)] ?
                               {$unsigned(wire99)} : $signed($unsigned(wire78)))) : reg79[(3'h7):(3'h6)]);
  assign wire101 = (&reg79);
endmodule

module module14
#(parameter param69 = ((+{((^(8'hb8)) < ((7'h41) ? (8'h9d) : (8'ha4))), (((8'h9f) != (8'hbb)) >>> {(8'ha1)})}) ? ((({(8'hb0), (8'hb7)} ? {(8'ha7), (8'hbf)} : (+(8'hb9))) ? (((8'h9c) >>> (8'hb1)) ^~ ((8'hae) >> (8'ha6))) : ((+(8'hb9)) ? (~^(8'ha5)) : ((7'h41) <= (8'hbd)))) * {(((8'ha4) != (8'hac)) ? {(7'h41)} : ((7'h40) >> (8'hbb)))}) : (((+((8'hbd) >>> (8'hb8))) ? (((8'ha1) >= (8'hbb)) >> {(8'hb7)}) : ((!(8'haa)) * ((8'hb7) << (8'h9e)))) ? {(~&(!(8'h9e))), (~(^~(7'h41)))} : ((&((8'h9c) ^ (8'h9f))) ? (7'h41) : (((8'hbf) ? (8'ha2) : (8'hb7)) ? ((8'haf) ? (8'h9d) : (8'hb4)) : ((7'h41) ^~ (8'hbf)))))), 
parameter param70 = (param69 * param69))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h264):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire22,
                 wire21,
                 wire20,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg34,
                 reg33,
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
                 (1'h0)};
  assign wire20 = $signed(wire16[(3'h5):(1'h1)]);
  assign wire21 = $signed(((($signed((7'h43)) <<< (wire19 ? (8'hb8) : wire16)) ?
                          (!(~wire19)) : (wire19 + (8'hb9))) ?
                      (8'hb4) : $unsigned(wire19[(3'h4):(2'h2)])));
  assign wire22 = (~|$unsigned(({wire15} ?
                      ((wire18 ?
                          wire20 : (8'hbc)) ^ $signed(wire21)) : $unsigned(wire16))));
  always
    @(posedge clk) begin
      if (((~^wire20[(3'h4):(2'h3)]) ?
          (8'ha8) : (($signed($unsigned(wire20)) ?
                  (wire20 ?
                      {wire16,
                          (8'ha8)} : $signed(wire22)) : $unsigned(((8'ha1) ?
                      wire17 : (8'ha3)))) ?
              (wire16 | ({wire21} <= $signed(wire20))) : $signed($signed((wire17 ?
                  wire21 : (8'ha0)))))))
        begin
          if (((~|$signed(($signed(wire16) && (7'h42)))) ?
              (^(8'haa)) : (-$unsigned(wire21))))
            begin
              reg23 <= $signed((|wire17));
              reg24 <= ($signed(($signed((wire18 << reg23)) || (^~$signed(reg23)))) ?
                  $signed($unsigned({$unsigned((8'hb5))})) : $signed(wire16));
              reg25 <= ((reg23[(3'h5):(1'h0)] >>> wire18) ?
                  wire21[(4'hb):(3'h4)] : ((~^wire18) != $signed(($signed(reg23) * reg23[(1'h1):(1'h1)]))));
              reg26 <= ((~&$unsigned($unsigned(wire21[(2'h3):(2'h2)]))) ^ (~|wire15[(3'h7):(2'h2)]));
            end
          else
            begin
              reg23 <= {{{$signed($unsigned(reg24))}},
                  ($unsigned(wire20) ?
                      $signed(reg24) : ($signed((reg23 ?
                          (7'h43) : wire18)) && wire22))};
              reg24 <= {wire15[(1'h1):(1'h1)], wire22};
              reg25 <= wire19;
              reg26 <= ($signed($unsigned({reg24[(4'ha):(1'h0)],
                  ((7'h42) != wire15)})) - $unsigned(wire15));
            end
          reg27 <= (8'ha0);
          reg28 <= wire15;
        end
      else
        begin
          reg23 <= $signed(wire16[(2'h2):(1'h1)]);
        end
      if ($signed($signed(wire15)))
        begin
          reg29 <= (^~$unsigned(wire19));
          if (reg28[(2'h2):(1'h1)])
            begin
              reg30 <= {((reg25[(4'hb):(4'hb)] ?
                      (~&$unsigned(reg25)) : wire15) >> wire22),
                  $unsigned((~|reg26))};
              reg31 <= ($signed({wire20}) ?
                  ($signed((8'h9c)) != reg25) : {wire22[(1'h1):(1'h1)]});
              reg32 <= wire17;
              reg33 <= (wire22[(4'hf):(4'h8)] ? wire21 : wire19[(4'hf):(3'h4)]);
              reg34 <= (&($unsigned((!$signed(reg25))) ?
                  $signed(wire19) : wire16[(3'h6):(2'h3)]));
            end
          else
            begin
              reg30 <= (+(~|wire21));
              reg31 <= $unsigned($unsigned((^~(~&(~&wire18)))));
              reg32 <= $signed((~^$signed((reg30[(4'h9):(3'h4)] >> (~&wire21)))));
              reg33 <= $unsigned($unsigned((wire18[(3'h4):(1'h0)] * reg28[(4'ha):(3'h4)])));
            end
        end
      else
        begin
          reg29 <= $signed((wire17 >>> wire17));
          if ((reg23 == ((~^((reg32 ?
              reg30 : (8'hb2)) == {(7'h42)})) < wire17[(4'hf):(2'h3)])))
            begin
              reg30 <= $signed($unsigned({$unsigned(reg31[(2'h2):(1'h1)])}));
              reg31 <= {(^(-reg31))};
              reg32 <= $signed(wire21[(3'h5):(3'h4)]);
              reg33 <= $unsigned((8'ha9));
              reg34 <= (((reg31[(1'h0):(1'h0)] ?
                          ($signed(wire17) ?
                              wire15 : (~|reg25)) : (reg29[(4'ha):(2'h2)] != ((8'hb3) ?
                              reg26 : reg33))) ?
                      $signed($signed((reg24 ? reg25 : wire17))) : {(^reg25),
                          $unsigned($unsigned(wire17))}) ?
                  (reg32 ?
                      $signed(($unsigned(reg27) | (reg23 ?
                          reg27 : reg33))) : wire21[(4'hd):(1'h1)]) : (|((^{wire17,
                          reg23}) ?
                      reg29 : $signed(wire18[(3'h6):(3'h6)]))));
            end
          else
            begin
              reg30 <= reg30[(3'h7):(3'h4)];
              reg31 <= ((^($signed($unsigned(wire20)) * reg32)) | (^~$signed(((&reg26) ?
                  $signed(reg28) : wire20[(1'h0):(1'h0)]))));
              reg32 <= (((({wire16, wire17} ?
                          {wire15} : $unsigned(wire20)) + ((7'h40) ?
                          (wire16 << (8'ha9)) : {wire19})) ?
                      wire20[(1'h0):(1'h0)] : ({reg26[(2'h3):(1'h1)],
                          (+reg24)} == (wire15 ?
                          wire19[(2'h3):(1'h0)] : wire15))) ?
                  reg23[(4'h8):(3'h6)] : reg28);
              reg33 <= $signed((&(($unsigned(reg30) >> $unsigned(wire15)) ?
                  $unsigned($unsigned(reg29)) : ((wire15 ? reg31 : reg27) ?
                      reg27[(5'h15):(4'hf)] : $signed((8'haf))))));
            end
          if ((+($signed(wire20[(3'h7):(2'h3)]) ?
              $signed(($unsigned(reg24) < (reg27 ?
                  reg24 : reg26))) : (^reg32[(4'h9):(2'h3)]))))
            begin
              reg35 <= ($signed(((reg34 ? reg26 : (8'haf)) - wire16)) ?
                  {wire18} : reg33[(5'h11):(4'h8)]);
              reg36 <= ((~|{wire22[(1'h0):(1'h0)],
                  $signed($unsigned(reg25))}) <<< $signed({$unsigned($signed(reg32))}));
              reg37 <= wire16;
              reg38 <= $unsigned({$unsigned((&(8'haf))), $signed(wire15)});
              reg39 <= reg25[(4'he):(4'ha)];
            end
          else
            begin
              reg35 <= (((reg32[(3'h7):(2'h3)] ?
                      $signed(reg37) : ($signed(reg35) ?
                          $unsigned(reg27) : reg29)) ?
                  {wire16} : (reg37 ?
                      $signed((reg32 != (8'hb6))) : (^~reg25[(2'h2):(2'h2)]))) << (((8'h9e) ?
                  reg25 : wire18[(3'h4):(2'h3)]) >>> $unsigned((~&$unsigned(reg26)))));
              reg36 <= (reg33[(5'h12):(3'h5)] < (wire18[(3'h6):(3'h5)] ?
                  $signed(reg36[(4'h9):(4'h8)]) : (!$signed({reg23}))));
              reg37 <= ((((((8'hb5) ~^ wire19) | (reg39 ? reg30 : reg28)) ?
                          reg24 : $signed(reg26[(4'h8):(1'h0)])) ?
                      ($unsigned($signed(reg36)) <= ({wire20, wire15} ?
                          ((8'h9c) >> wire17) : reg27)) : (^~reg28)) ?
                  (wire18[(3'h7):(2'h3)] ?
                      reg29 : ((reg32[(4'ha):(4'ha)] ?
                              (~^(8'ha3)) : $unsigned(wire22)) ?
                          ($unsigned((8'hbb)) ?
                              (^~reg24) : {reg32,
                                  reg36}) : (((8'ha3) > reg34) <<< $unsigned(reg33)))) : $signed($unsigned(($signed(reg33) >> $signed(reg24)))));
              reg38 <= wire16[(3'h4):(1'h0)];
              reg39 <= $signed($unsigned(reg25));
            end
        end
      reg40 <= reg39;
      if (reg40)
        begin
          reg41 <= $unsigned(((8'ha0) || $signed($unsigned(reg23))));
          reg42 <= reg35[(1'h1):(1'h0)];
        end
      else
        begin
          if ((7'h43))
            begin
              reg41 <= $signed((-$signed({$unsigned(wire21),
                  reg27[(5'h11):(4'hb)]})));
              reg42 <= reg42[(3'h4):(1'h0)];
            end
          else
            begin
              reg41 <= (wire20[(1'h1):(1'h0)] != wire15[(3'h6):(1'h1)]);
              reg42 <= reg33[(2'h2):(1'h0)];
              reg43 <= $signed(reg23[(4'h8):(3'h4)]);
              reg44 <= ($unsigned((~&((reg24 ? reg32 : reg27) ?
                  reg41[(4'he):(4'h8)] : (&reg30)))) >> $signed((&($signed(reg24) >> (wire21 ?
                  reg34 : wire21)))));
            end
          reg45 <= {reg31[(1'h0):(1'h0)],
              {$signed(reg27[(1'h1):(1'h1)]), reg40}};
          reg46 <= {$signed((8'hb2))};
          reg47 <= $unsigned((|wire15[(3'h4):(2'h2)]));
        end
    end
  always
    @(posedge clk) begin
      reg48 <= $unsigned((~|{({reg44} ? (8'hb3) : (reg28 | reg39)),
          ((-(8'hae)) + $unsigned(wire20))}));
      reg49 <= $signed($unsigned($unsigned(reg30)));
    end
  assign wire50 = (~&$signed(wire20[(3'h6):(1'h1)]));
  assign wire51 = $signed($unsigned(reg49[(1'h0):(1'h0)]));
  assign wire52 = {{reg25[(1'h0):(1'h0)]}};
  assign wire53 = (reg47 ?
                      (|$unsigned((~reg29[(4'hd):(3'h5)]))) : reg33[(4'h8):(3'h7)]);
  assign wire54 = ($unsigned($signed($signed(wire20[(3'h6):(3'h5)]))) < wire19[(5'h10):(4'hf)]);
  assign wire55 = ((wire20 < (wire20 ?
                          {$unsigned(wire20),
                              wire50[(3'h6):(1'h0)]} : reg48[(1'h0):(1'h0)])) ?
                      $signed(reg30[(5'h10):(4'he)]) : (+(~&{((8'hb6) - reg23)})));
  assign wire56 = (&{((((8'hb6) ? wire20 : (8'haf)) ?
                              reg44[(3'h7):(1'h1)] : reg29[(3'h6):(2'h3)]) ?
                          $unsigned($signed(wire22)) : $signed((8'hbf))),
                      {(~^$signed(wire16)),
                          ((wire54 >= reg45) ?
                              (wire19 ? reg49 : reg23) : (^~reg29))}});
  always
    @(posedge clk) begin
      if ((wire50 ?
          $signed({wire17,
              ((wire21 ? reg26 : (8'ha0)) != (reg28 ?
                  reg29 : reg26))}) : (($signed((reg39 ?
              reg43 : reg34)) << (reg23[(4'h9):(3'h4)] ?
              $unsigned(wire18) : reg45)) > reg41)))
        begin
          reg57 <= reg44;
        end
      else
        begin
          reg57 <= ((((reg38 ^ (~wire50)) == (+$unsigned(wire20))) >>> $unsigned(($signed(wire21) & (reg42 != reg34)))) ?
              reg44[(2'h3):(1'h0)] : wire21[(4'ha):(3'h7)]);
        end
      if ($signed($signed({reg23, ($signed(reg42) == wire19)})))
        begin
          reg58 <= $unsigned((($unsigned($signed(wire50)) ~^ wire53[(2'h3):(2'h2)]) ?
              (wire52[(2'h2):(2'h2)] * {(wire52 >= reg44),
                  reg33[(5'h10):(4'h8)]}) : reg47[(4'ha):(4'h9)]));
          if (($unsigned($unsigned($signed({reg31, (8'hbd)}))) ?
              $signed({$unsigned({wire54, reg30}),
                  ((~wire18) ?
                      (wire21 < wire19) : $signed(reg40))}) : reg43[(2'h2):(1'h0)]))
            begin
              reg59 <= reg25;
              reg60 <= $signed(($signed(reg27) >> (7'h44)));
            end
          else
            begin
              reg59 <= $unsigned((wire55[(2'h2):(2'h2)] < $unsigned(((reg47 ?
                      reg29 : reg28) ?
                  (!reg23) : {reg48}))));
            end
          reg61 <= $signed({reg44[(4'h8):(4'h8)]});
        end
      else
        begin
          if (($signed(reg36) >>> (wire55[(2'h3):(2'h2)] ?
              reg58[(5'h10):(3'h4)] : $unsigned({(reg31 < wire19),
                  {reg57, (8'hab)}}))))
            begin
              reg58 <= $signed(reg28[(4'h9):(4'h9)]);
              reg59 <= $signed($signed((wire16[(3'h4):(1'h0)] ?
                  (~&{reg49}) : reg25)));
            end
          else
            begin
              reg58 <= {((~((~wire22) ?
                      (+reg49) : reg57[(1'h0):(1'h0)])) + reg59)};
              reg59 <= (-$signed((~^{(reg58 ? wire54 : wire52)})));
              reg60 <= (((~|(reg24 ? (!reg48) : $signed(reg47))) ?
                      (+$signed((reg48 ?
                          wire17 : reg32))) : reg39[(3'h4):(1'h0)]) ?
                  $signed($signed($unsigned(reg35[(1'h0):(1'h0)]))) : (8'hae));
            end
          if ({((((~^reg33) ? (wire50 >>> wire54) : (reg29 ? reg33 : reg37)) ?
                  (|(wire55 ?
                      (8'hbb) : (8'hba))) : $signed($signed(reg42))) >>> (~|(^$unsigned(reg57))))})
            begin
              reg61 <= $signed($unsigned((($signed(wire18) >> $unsigned(reg47)) ?
                  wire50 : $signed(reg48[(3'h7):(1'h1)]))));
              reg62 <= {((~&$signed((wire56 ?
                      reg31 : reg58))) ^ $signed(reg29[(4'ha):(3'h4)])),
                  reg26};
            end
          else
            begin
              reg61 <= reg29;
              reg62 <= ((((wire53 < $signed((8'h9f))) <= (^~(~&reg33))) ?
                      $unsigned((reg34[(3'h4):(2'h3)] != reg38)) : wire18[(2'h3):(1'h1)]) ?
                  ($unsigned(reg41[(4'h8):(2'h2)]) ?
                      reg24 : (8'hbe)) : (^~$signed(wire16)));
              reg63 <= reg48[(4'hc):(1'h0)];
            end
        end
    end
  assign wire64 = wire21[(4'h9):(4'h8)];
  assign wire65 = ((wire17[(4'ha):(1'h0)] <= $unsigned($signed($unsigned(reg43)))) > $signed((&$signed(reg31))));
  assign wire66 = $unsigned(((|((reg49 >= (8'h9f)) ? {wire56} : (~&(8'haf)))) ?
                      $unsigned((!((8'hb0) || reg31))) : $unsigned(wire55[(3'h7):(3'h5)])));
  assign wire67 = $signed(({reg31[(1'h1):(1'h1)],
                      {(|reg34)}} << wire65[(3'h4):(1'h1)]));
  assign wire68 = reg62;
endmodule

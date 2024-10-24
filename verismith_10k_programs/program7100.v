module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire89;
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire89,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire5 = (^~(+({$unsigned((8'ha5))} ^~ (wire3[(1'h1):(1'h0)] < wire1[(4'ha):(4'h8)]))));
  assign wire6 = ({(~&wire3[(1'h1):(1'h1)])} > (~&((+wire3[(1'h1):(1'h0)]) | (~wire2[(5'h12):(5'h12)]))));
  assign wire7 = (8'hab);
  assign wire8 = wire5[(4'h9):(3'h4)];
  module9 #() modinst90 (wire89, clk, wire8, wire3, wire2, wire6, wire5);
  assign wire91 = $unsigned($signed(wire4[(4'h9):(1'h0)]));
  assign wire92 = ((8'ha3) + ($unsigned(($unsigned(wire0) - wire5)) > {($signed((8'hae)) ^~ (~wire8))}));
  assign wire93 = ((+wire91) + ($signed(($signed(wire3) - (!wire92))) ?
                      (~(wire1 ?
                          (|(7'h42)) : wire3[(4'hf):(3'h5)])) : wire0[(5'h13):(1'h1)]));
  assign wire94 = wire2;
  assign wire95 = {wire1[(3'h6):(1'h0)]};
  always
    @(posedge clk) begin
      if ({(~|wire5)})
        begin
          reg96 <= $unsigned((wire95 || (((wire92 ? wire89 : wire91) * (wire5 ?
                  (8'hb3) : (8'hbb))) ?
              wire93 : $unsigned((wire91 ? (8'ha5) : wire7)))));
          reg97 <= $signed((!(($unsigned(wire4) & $signed(wire7)) && wire91)));
          if ({(((~{wire95, reg97}) ?
                      wire8[(5'h11):(4'ha)] : wire5[(3'h6):(3'h6)]) ?
                  (8'hb1) : $signed((wire5[(3'h7):(3'h6)] || reg96[(3'h5):(1'h1)])))})
            begin
              reg98 <= reg97[(1'h1):(1'h1)];
            end
          else
            begin
              reg98 <= ({wire92, $signed({wire2})} ?
                  wire89[(3'h4):(3'h4)] : wire6[(1'h0):(1'h0)]);
              reg99 <= $unsigned(wire3);
            end
          reg100 <= $unsigned(reg96);
          reg101 <= ($signed(wire94) ?
              ({(wire1[(4'h8):(1'h1)] ?
                      wire93[(4'hc):(1'h1)] : wire89[(1'h0):(1'h0)])} >>> (~^wire94[(4'hd):(3'h7)])) : $unsigned((({wire94} ?
                      wire1[(1'h0):(1'h0)] : wire1) ?
                  (~^(reg97 < wire7)) : (~&reg99[(2'h2):(2'h2)]))));
        end
      else
        begin
          if ((wire89[(3'h6):(1'h1)] >> wire3[(3'h5):(3'h4)]))
            begin
              reg96 <= (&$unsigned($signed(($unsigned(wire4) ?
                  wire93[(3'h4):(2'h2)] : $unsigned(wire6)))));
              reg97 <= {(~(~wire8))};
            end
          else
            begin
              reg96 <= wire94;
            end
          reg98 <= $unsigned(((7'h42) && ({(~^wire93), $signed(wire8)} ?
              (~|$unsigned(wire91)) : $unsigned(wire4))));
          if ($signed($signed($signed((~|(wire94 ? wire89 : reg101))))))
            begin
              reg99 <= ($signed(({{reg98},
                  $signed(wire1)} || wire1[(1'h0):(1'h0)])) == $signed((reg101 || $unsigned({wire89,
                  wire3}))));
              reg100 <= ((7'h43) ?
                  (^wire6) : $unsigned((!$signed($signed(wire3)))));
              reg101 <= $signed((wire93 >= (^(reg100[(1'h1):(1'h1)] >= $signed((8'haa))))));
            end
          else
            begin
              reg99 <= ((8'h9f) ?
                  (8'hb3) : (($unsigned((~reg96)) || reg98) | $signed(wire92[(2'h3):(1'h0)])));
              reg100 <= wire89[(5'h10):(2'h3)];
              reg101 <= ((7'h41) ?
                  $signed(reg101[(2'h3):(1'h1)]) : (~|($signed((reg99 ?
                          (8'had) : wire95)) ?
                      wire94[(2'h3):(1'h1)] : (^~$unsigned(wire91)))));
              reg102 <= ($signed(reg99[(2'h2):(2'h2)]) ~^ wire92[(4'hb):(3'h4)]);
              reg103 <= reg101;
            end
          reg104 <= wire4;
        end
      reg105 <= reg102[(3'h6):(3'h5)];
      reg106 <= $unsigned(wire89);
      reg107 <= ($unsigned(($signed($signed(wire0)) ?
              ({reg101} ? $signed(wire7) : (~|(8'hb7))) : ($unsigned(reg98) ?
                  {reg106} : reg99[(2'h2):(1'h1)]))) ?
          (~&reg100[(2'h2):(1'h0)]) : reg103);
      reg108 <= $unsigned(reg101[(4'hc):(2'h2)]);
    end
  assign wire109 = reg108;
  assign wire110 = (^(!$signed(((wire5 && reg96) | (reg106 - reg104)))));
endmodule

module module9
#(parameter param87 = (~&{(((+(8'ha1)) ? ((8'hb1) ? (8'hb3) : (8'hbd)) : ((8'ha1) & (8'ha1))) ? (((8'ha6) ? (8'had) : (8'hab)) ^ ((8'ha4) ? (8'haf) : (8'hb3))) : (((7'h40) ? (8'hac) : (8'hb3)) + (~^(8'hbb))))}), 
parameter param88 = {(param87 || param87)})
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire72;
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire74,
                 wire15,
                 wire72,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire15 = wire11[(4'he):(4'h9)];
  module16 #() modinst73 (.wire21(wire11), .wire18(wire12), .clk(clk), .wire17(wire13), .y(wire72), .wire19(wire14), .wire20(wire10));
  assign wire74 = (wire13 ?
                      wire72 : ({$signed((wire13 == wire12))} ?
                          {(wire13 == (~|wire13))} : $unsigned({{wire14,
                                  wire72},
                              {wire72, wire12}})));
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg75 <= {$signed($signed((wire72[(4'hf):(1'h0)] - (^~wire13)))),
              $signed($unsigned(({wire12, (8'hac)} | (wire11 ?
                  wire12 : wire74))))};
          reg76 <= wire14;
        end
      else
        begin
          reg75 <= wire11;
        end
      reg77 <= $unsigned($unsigned(wire74));
      reg78 <= wire14[(4'h8):(3'h4)];
      reg79 <= wire15[(2'h2):(2'h2)];
    end
  assign wire80 = (wire12 ?
                      $signed({{wire12[(4'he):(3'h6)], reg76},
                          ({wire15, reg78} ? wire12 : (!reg76))}) : (~wire10));
  assign wire81 = {(^$unsigned($unsigned($unsigned(wire11))))};
  assign wire82 = reg77;
  assign wire83 = ({reg75, (-wire12)} ?
                      $unsigned((!reg76)) : $unsigned((reg78[(4'he):(3'h4)] >> ((^~wire81) | (8'hb9)))));
  assign wire84 = reg75;
  assign wire85 = (-$unsigned({$unsigned((reg75 ? (8'hb3) : (8'hb1))),
                      $unsigned($signed(wire10))}));
  assign wire86 = wire14;
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire71,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg38,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hbf))
        begin
          reg22 <= (~|(8'h9c));
        end
      else
        begin
          if ($unsigned($signed((8'hb6))))
            begin
              reg22 <= {$unsigned(({wire21,
                      $unsigned(wire19)} >> wire19[(4'h9):(1'h0)])),
                  $unsigned((((wire17 & wire20) + wire19[(4'hb):(3'h7)]) ?
                      wire18 : (8'ha3)))};
              reg23 <= (^(wire18 ?
                  (^~$unsigned((wire20 ?
                      wire18 : wire20))) : wire17[(3'h7):(3'h7)]));
              reg24 <= wire20[(1'h0):(1'h0)];
              reg25 <= ((reg23 < reg24) ?
                  ((!$signed(reg24[(1'h0):(1'h0)])) <<< reg22) : (&(((reg22 >= wire19) ?
                      wire20 : $unsigned(wire20)) >= $signed((reg23 ?
                      reg23 : (8'hbb))))));
            end
          else
            begin
              reg22 <= {reg23};
              reg23 <= (wire18 ?
                  $signed((((8'hb5) >= ((8'hba) || wire18)) ^ ($signed(reg22) ?
                      (|wire17) : $signed((8'h9c))))) : (~|{($signed(wire19) ?
                          $unsigned(wire21) : reg25)}));
              reg24 <= ($unsigned((&wire21[(1'h0):(1'h0)])) ?
                  wire19[(4'h9):(3'h6)] : (reg25[(2'h2):(1'h0)] ?
                      wire17[(4'ha):(3'h5)] : $signed(($unsigned(reg22) ?
                          reg24 : (wire19 ? wire20 : wire21)))));
              reg25 <= reg22;
              reg26 <= reg25[(1'h0):(1'h0)];
            end
        end
      reg27 <= $unsigned(reg22[(5'h11):(1'h0)]);
      reg28 <= $signed(reg25[(1'h1):(1'h1)]);
      reg29 <= wire20[(2'h2):(1'h0)];
    end
  assign wire30 = (^~reg28[(4'h9):(3'h6)]);
  assign wire31 = $signed(({$signed((reg25 ? wire19 : (8'haf))),
                          ({reg28, reg25} ?
                              $signed(wire19) : ((8'hbc) ? reg23 : reg26))} ?
                      (~^reg29) : reg24));
  assign wire32 = ($unsigned($unsigned($unsigned((wire20 > reg28)))) || reg26);
  assign wire33 = (($signed((((8'ha8) || reg24) + (wire18 >>> wire17))) + reg28[(4'hb):(3'h4)]) ?
                      reg26[(2'h2):(1'h0)] : $unsigned(reg28));
  assign wire34 = reg26[(4'ha):(1'h0)];
  assign wire35 = reg28[(2'h3):(2'h2)];
  assign wire36 = (reg24 ? {wire33[(4'hb):(3'h4)]} : reg27);
  assign wire37 = {((!{(reg24 == wire36)}) ?
                          ($signed({wire21, wire31}) ?
                              reg27[(4'hb):(4'h9)] : $signed($signed(wire34))) : wire18[(3'h6):(2'h2)]),
                      ((^$signed((~reg24))) ?
                          (+wire31[(4'hd):(1'h0)]) : wire30[(4'hb):(3'h7)])};
  always
    @(posedge clk) begin
      reg38 <= wire35;
    end
  assign wire39 = $signed(wire34[(3'h6):(1'h1)]);
  assign wire40 = (wire35 ?
                      (reg28 ~^ ($signed((wire37 ? reg38 : reg26)) ?
                          $signed({wire35,
                              (8'ha3)}) : wire30[(1'h0):(1'h0)])) : reg29);
  assign wire41 = (($signed(($signed(reg22) ?
                          wire36[(2'h3):(2'h2)] : $signed(wire31))) ?
                      {(wire31 == {wire35, wire36}),
                          {(~|wire30), (8'hbd)}} : (~&(wire19[(4'hb):(3'h7)] ?
                          wire37 : {reg28}))) ^~ $signed(wire39[(4'h8):(2'h3)]));
  assign wire42 = (~($signed((^{(8'hac)})) != ($unsigned(reg29) <<< {(-wire40)})));
  always
    @(posedge clk) begin
      reg43 <= wire37;
      reg44 <= (wire35 <= $unsigned((|(^$unsigned(wire18)))));
      if (($unsigned(wire37[(3'h7):(2'h3)]) ?
          reg29[(1'h1):(1'h0)] : $signed(wire36)))
        begin
          if (reg22[(1'h0):(1'h0)])
            begin
              reg45 <= $signed(reg26[(4'ha):(1'h0)]);
            end
          else
            begin
              reg45 <= ($signed((($signed(wire42) * (|reg43)) | $unsigned(reg28[(4'h9):(3'h6)]))) ?
                  (-$signed({wire42, (~|(8'hb2))})) : reg26[(3'h6):(3'h6)]);
            end
          reg46 <= $signed(($unsigned(reg28[(4'he):(1'h0)]) ?
              $unsigned(((~&reg23) ? {wire17, wire42} : reg45)) : (!reg28)));
          reg47 <= $signed((^wire17));
          reg48 <= $unsigned((((8'hb0) ?
              (+{reg23,
                  wire31}) : reg27[(3'h7):(3'h4)]) == reg22[(3'h4):(2'h2)]));
        end
      else
        begin
          reg45 <= ($signed(reg25) & wire41[(3'h4):(2'h2)]);
          reg46 <= {(~wire31[(2'h3):(2'h2)]), reg38[(3'h5):(3'h5)]};
        end
      reg49 <= {$unsigned($signed((|$signed(reg27))))};
    end
  assign wire50 = (~^wire34);
  assign wire51 = reg44[(5'h11):(4'hd)];
  assign wire52 = wire35[(3'h4):(2'h3)];
  assign wire53 = ((~|{((reg49 ? (8'hb1) : reg47) >= (~&reg27)), wire37}) ?
                      {$unsigned($unsigned({(8'ha7)})),
                          $unsigned($unsigned(wire51))} : $unsigned(($unsigned((~reg48)) * (reg29[(4'h9):(2'h2)] ?
                          reg23[(3'h7):(2'h3)] : $signed(wire31)))));
  always
    @(posedge clk) begin
      reg54 <= wire53[(4'h8):(3'h7)];
      if ((($signed(($signed(wire37) >= (wire50 ? wire52 : (8'ha5)))) ?
          reg22 : $unsigned((reg44[(5'h15):(5'h13)] + $unsigned(reg26)))) >> $signed($signed((~|reg38[(2'h3):(1'h0)])))))
        begin
          reg55 <= wire17[(2'h2):(1'h1)];
          reg56 <= $unsigned(wire39[(1'h0):(1'h0)]);
          reg57 <= (reg25 ?
              {wire53[(3'h4):(2'h3)], {wire33[(4'hb):(4'h8)]}} : (|(8'hbd)));
          reg58 <= wire39;
          reg59 <= $unsigned(reg58[(3'h4):(3'h4)]);
        end
      else
        begin
          reg55 <= (^~wire32);
        end
      reg60 <= $unsigned({(8'h9f)});
      if ((^~$signed((8'ha9))))
        begin
          reg61 <= wire40;
        end
      else
        begin
          if (wire19)
            begin
              reg61 <= (+wire37[(2'h2):(1'h1)]);
              reg62 <= (wire35 ?
                  $signed({wire51[(3'h4):(2'h3)],
                      reg22[(3'h7):(1'h0)]}) : $signed({((^wire51) ?
                          ((8'hb4) & wire42) : (^reg24))}));
              reg63 <= ((|((((7'h43) >> wire39) ?
                          wire37[(4'h8):(3'h6)] : {(8'h9e)}) ?
                      $signed(reg28[(4'he):(3'h6)]) : wire17[(3'h4):(1'h1)])) ?
                  {($signed({wire30,
                          wire39}) ^ $signed($unsigned(wire36)))} : (8'ha4));
            end
          else
            begin
              reg61 <= (|{$signed($unsigned((^~wire36))),
                  {(~^(~|(8'hac))), $unsigned($unsigned(wire32))}});
              reg62 <= ((reg23 > wire40[(1'h0):(1'h0)]) | (8'ha2));
              reg63 <= $signed((((((8'h9d) ? reg62 : wire20) & reg60) ?
                      wire19[(4'hc):(4'hc)] : $unsigned({reg58, wire34})) ?
                  (~|$unsigned(wire31[(4'hc):(1'h0)])) : $signed(reg27)));
            end
          reg64 <= $signed((!{{reg27[(3'h4):(1'h1)]},
              ({wire19, wire36} > ((8'hbd) || wire35))}));
          reg65 <= reg49;
          if (((&$unsigned($signed(wire41[(3'h4):(1'h1)]))) & wire31[(3'h4):(3'h4)]))
            begin
              reg66 <= (!($unsigned(reg61) - (wire40 >> (((8'hbe) >> wire19) ^ (|wire42)))));
              reg67 <= (^~(wire33[(4'h8):(2'h2)] ?
                  $signed((&(reg60 >> (8'ha8)))) : reg23));
              reg68 <= reg60[(4'h8):(4'h8)];
              reg69 <= (((^$signed(wire50)) ?
                  ({(-(8'hba)), (^~(8'hac))} ?
                      reg29[(2'h3):(1'h1)] : ($unsigned(wire32) - {reg58})) : (+wire53[(4'ha):(1'h1)])) <= reg28[(4'he):(4'h8)]);
            end
          else
            begin
              reg66 <= ($unsigned((^wire39)) - reg62[(4'h9):(1'h1)]);
              reg67 <= $unsigned(wire37);
              reg68 <= $signed(reg57);
            end
          reg70 <= (&(^(($unsigned(reg46) + $signed(reg23)) ?
              {reg27[(2'h2):(2'h2)]} : ((reg23 ?
                  reg25 : reg43) != $signed(wire41)))));
        end
    end
  assign wire71 = $unsigned(reg70);
endmodule

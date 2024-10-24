module top
#(parameter param118 = ((7'h40) ~^ ((~&({(7'h44)} & ((8'had) || (8'hb4)))) ? {(8'ha2), ((|(8'ha6)) * (^~(8'h9c)))} : (((8'hb9) ^~ ((8'hb2) && (8'h9d))) - (((8'hb5) ^ (8'ha7)) ? ((8'hb4) ~^ (8'ha0)) : ((8'haa) >> (8'hbf)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire113;
  assign y = {wire117, wire116, wire115, wire5, wire113, (1'h0)};
  assign wire5 = (+(~(wire1[(3'h6):(3'h4)] ? wire2 : ((~|wire1) && (&wire1)))));
  module6 #() modinst114 (.wire9(wire0), .wire7(wire4), .wire8(wire2), .wire11(wire3), .clk(clk), .y(wire113), .wire10(wire5));
  assign wire115 = (8'hb3);
  assign wire116 = wire5;
  assign wire117 = $unsigned(wire116[(3'h5):(3'h4)]);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire109,
                 wire107,
                 wire79,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire14,
                 wire13,
                 wire12,
                 reg112,
                 reg111,
                 reg110,
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
                 (1'h0)};
  assign wire12 = (+(~|$unsigned(wire11)));
  assign wire13 = (-{wire9[(4'ha):(2'h3)], $unsigned((|wire12))});
  assign wire14 = wire10[(4'he):(4'h8)];
  always
    @(posedge clk) begin
      if ($signed(wire10))
        begin
          reg15 <= (wire12[(3'h7):(1'h1)] ?
              $unsigned($signed(wire13[(4'h8):(2'h3)])) : wire13);
          reg16 <= $signed((!{{$unsigned(wire12), (-(8'h9c))},
              (~&(wire9 ? wire9 : (8'hbc)))}));
          if ($unsigned({{wire12, wire12[(3'h4):(2'h2)]},
              $signed($unsigned(reg15[(3'h4):(1'h0)]))}))
            begin
              reg17 <= $signed($unsigned(((wire14[(4'h9):(3'h4)] ?
                  (wire14 ? (8'h9e) : reg15) : (reg15 ?
                      wire8 : wire13)) && wire9)));
            end
          else
            begin
              reg17 <= $unsigned((wire7 ?
                  wire12 : (!$signed(((8'h9d) ? wire13 : wire12)))));
              reg18 <= reg17[(4'h8):(3'h5)];
              reg19 <= $signed(reg15[(2'h2):(1'h0)]);
              reg20 <= $signed(wire11[(3'h6):(2'h2)]);
              reg21 <= $unsigned(($signed(reg18[(1'h0):(1'h0)]) ?
                  {wire12[(4'h9):(3'h4)]} : reg20));
            end
        end
      else
        begin
          if (reg20)
            begin
              reg15 <= $signed(wire14);
              reg16 <= $unsigned(({$signed(wire14[(4'hf):(4'h8)])} ?
                  (reg21[(2'h2):(1'h0)] << (8'hb5)) : ($signed((reg17 ?
                      wire8 : wire10)) <= wire8[(3'h5):(2'h2)])));
              reg17 <= $signed($signed($unsigned(({wire7} || (reg20 >>> wire14)))));
              reg18 <= (($signed(reg18) ?
                      $signed((^$unsigned(reg20))) : wire11[(2'h3):(2'h2)]) ?
                  $unsigned($unsigned(((wire14 ? wire8 : wire8) ?
                      (+(8'ha6)) : (^reg19)))) : reg15);
              reg19 <= reg18[(1'h0):(1'h0)];
            end
          else
            begin
              reg15 <= (^~$signed($signed(wire7[(4'hc):(4'ha)])));
              reg16 <= ((|(^(-{(8'hb1)}))) ?
                  ({(~reg20)} ? wire7 : {$signed((~|wire11))}) : (reg18 ?
                      (8'hb7) : wire13[(3'h7):(3'h6)]));
              reg17 <= (8'hb5);
              reg18 <= (($unsigned((wire8 & $signed(reg15))) && {$signed($signed(reg16)),
                      reg20}) ?
                  ($signed((~$signed(wire7))) ?
                      (7'h41) : {$signed($unsigned(reg20))}) : ($signed(reg17) >= (8'haa)));
              reg19 <= $signed(reg16);
            end
          reg20 <= wire7;
          reg21 <= (((reg18[(2'h2):(1'h1)] | (&{(8'hb3), (8'had)})) ?
              (($signed(reg21) | (wire10 <<< wire11)) | {$unsigned(wire13),
                  wire7}) : reg15) ^ $signed($signed(reg19)));
          reg22 <= (-$signed(wire11[(4'h8):(3'h5)]));
        end
      reg23 <= (8'h9e);
      reg24 <= wire12;
    end
  assign wire25 = {$unsigned({$unsigned($signed(reg22))}),
                      (reg21 ?
                          ($unsigned(wire7) <= wire10[(3'h6):(1'h0)]) : {$unsigned($signed(reg23)),
                              {(reg22 ~^ (8'h9e)), $signed(wire12)}})};
  assign wire26 = ($unsigned(($signed(wire7[(4'hd):(3'h7)]) ?
                          (&(+reg22)) : (wire25[(3'h6):(3'h5)] ?
                              $signed(reg21) : (-reg22)))) ?
                      reg22 : ($unsigned($signed((!reg22))) ?
                          $unsigned($unsigned(reg15)) : (({wire11} ^~ (^reg22)) ?
                              reg21[(2'h2):(1'h1)] : {wire8, {reg18, reg24}})));
  assign wire27 = $signed($signed(($unsigned((~reg23)) ?
                      ((-reg17) - (+wire14)) : ({(8'h9c), wire14} ?
                          $unsigned(reg22) : (reg17 ? reg20 : wire10)))));
  assign wire28 = $signed((~$unsigned(reg23)));
  assign wire29 = $unsigned(({wire10[(5'h10):(4'hf)]} ?
                      ((8'hbc) <<< $unsigned((wire25 ?
                          reg18 : wire27))) : (wire27[(1'h1):(1'h1)] & reg22)));
  assign wire30 = $signed(wire28);
  module31 #() modinst80 (.wire35(wire14), .wire36(reg23), .y(wire79), .wire33(reg17), .wire32(reg16), .clk(clk), .wire34(wire10));
  module81 #() modinst108 (.wire82(reg15), .y(wire107), .wire84(reg17), .wire86(reg18), .clk(clk), .wire85(reg20), .wire83(reg24));
  assign wire109 = wire11;
  always
    @(posedge clk) begin
      reg110 <= reg17[(5'h11):(1'h0)];
      reg111 <= ((($signed((reg18 ? reg20 : (8'hb9))) ?
          (|reg24) : (~|wire26)) && (({wire26, wire9} && (8'hb5)) << {(reg18 ?
              wire12 : wire12),
          {wire12}})) > reg16);
      reg112 <= ((~&reg16[(4'ha):(3'h5)]) & $signed((($signed(wire107) ?
          reg21[(3'h4):(2'h3)] : {(8'hbe),
              (8'hb8)}) <<< wire9[(4'hc):(4'h9)])));
    end
endmodule

module module81  (y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  input wire signed [(5'h11):(1'h0)] wire84;
  input wire [(3'h7):(1'h0)] wire83;
  input wire [(5'h10):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire87;
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  assign y = {wire106,
                 wire101,
                 wire100,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire87,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg99,
                 reg98,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire87 = ((wire84[(4'ha):(4'h9)] ?
                          wire82[(2'h2):(2'h2)] : wire85[(1'h0):(1'h0)]) ?
                      (&wire85[(4'hf):(4'hf)]) : wire82[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire84[(3'h5):(1'h0)])
        begin
          reg88 <= (wire87 ? wire84 : {wire82[(4'hc):(1'h1)]});
          reg89 <= $unsigned(reg88[(2'h2):(1'h0)]);
        end
      else
        begin
          if ($signed(wire85))
            begin
              reg88 <= ($signed((+(~|wire85[(3'h7):(2'h3)]))) ?
                  wire87[(3'h5):(2'h3)] : (&($signed($unsigned(wire84)) ?
                      ((8'ha0) ?
                          ((8'hba) ?
                              reg89 : wire83) : (~^(7'h40))) : (wire86 << (wire84 ?
                          (8'ha3) : reg88)))));
              reg89 <= $unsigned((~(wire84[(3'h7):(2'h2)] ~^ wire83)));
              reg90 <= $unsigned(wire82);
              reg91 <= $signed(({{wire86[(2'h2):(1'h0)]}} > reg90));
            end
          else
            begin
              reg88 <= {(~^$signed($signed(reg90)))};
            end
        end
      reg92 <= {wire84[(3'h5):(3'h4)]};
      reg93 <= $unsigned($signed(reg92));
    end
  assign wire94 = reg89[(3'h6):(3'h4)];
  assign wire95 = (~^reg90);
  assign wire96 = {((wire95[(4'he):(1'h1)] ?
                          ((reg93 >> wire83) || reg93[(4'h8):(2'h2)]) : $signed((wire84 ?
                              reg93 : (8'hb1)))) << {(((8'ha5) >> reg93) ?
                              (wire87 ? reg92 : wire82) : reg93)}),
                      reg89[(4'he):(4'h9)]};
  assign wire97 = $unsigned($signed(wire86[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg98 <= (wire82 ?
          $unsigned(({$unsigned(reg93),
              wire94} <= wire87[(4'ha):(4'h8)])) : $signed(wire83));
      reg99 <= $signed(((+wire85) ?
          $signed((wire86[(1'h0):(1'h0)] ?
              $signed(wire95) : $signed(wire95))) : $signed($signed((reg93 ?
              wire94 : wire84)))));
    end
  assign wire100 = $signed((wire94[(4'h8):(3'h5)] << reg91[(3'h6):(1'h0)]));
  assign wire101 = {$unsigned(wire97[(4'ha):(1'h1)])};
  always
    @(posedge clk) begin
      reg102 <= (^{reg98});
      reg103 <= wire97;
      reg104 <= $signed((|($unsigned((reg89 ? reg102 : reg89)) ?
          ($signed((7'h40)) ?
              $signed(wire96) : (wire95 ~^ wire100)) : ($signed(wire95) - reg89))));
      reg105 <= reg104;
    end
  assign wire106 = (~^{$signed((^~$signed(wire86)))});
endmodule

module module31
#(parameter param78 = (|(((8'ha4) ? ((8'hab) ^ ((8'hab) != (7'h40))) : (8'hb3)) - (|(((8'hb1) ? (8'haa) : (8'ha8)) ? ((8'ha5) ? (8'haf) : (8'ha5)) : ((8'ha6) ? (7'h41) : (8'ha8)))))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(4'h9):(1'h0)] wire34;
  input wire signed [(4'hd):(1'h0)] wire33;
  input wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire38,
                 wire37,
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
                 reg53,
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
                 (1'h0)};
  assign wire37 = (wire32[(3'h5):(1'h1)] ?
                      ((8'h9d) ?
                          wire36[(2'h2):(1'h0)] : $signed(wire36)) : $signed($signed($unsigned(wire35[(4'he):(3'h7)]))));
  assign wire38 = ($signed((7'h41)) < (!$unsigned({(wire35 ? wire33 : wire37),
                      (!wire32)})));
  always
    @(posedge clk) begin
      if (((^~(&wire34[(1'h1):(1'h0)])) ?
          ((+(~$signed((7'h41)))) << $signed({(wire36 && (8'ha2)),
              {(7'h44), wire34}})) : $signed((((wire36 ? wire32 : wire33) ?
                  (|wire35) : (&wire32)) ?
              ($signed(wire38) ?
                  wire37[(1'h1):(1'h0)] : wire32[(3'h4):(2'h2)]) : (wire35 ?
                  (^wire35) : $unsigned(wire33))))))
        begin
          reg39 <= wire33[(4'h8):(3'h4)];
          reg40 <= ($signed(wire38[(3'h5):(1'h0)]) ?
              (($unsigned($unsigned(reg39)) < $signed({wire38, reg39})) ?
                  (({wire32, (8'hb8)} ?
                      $unsigned((8'ha4)) : (wire34 == wire38)) >= (&wire35[(2'h2):(2'h2)])) : (wire38[(1'h0):(1'h0)] ~^ $unsigned({wire35,
                      wire36}))) : ((wire33 ?
                  ($unsigned(wire32) ?
                      (reg39 >> wire34) : wire35[(3'h7):(2'h2)]) : $signed((wire37 ?
                      wire36 : wire38))) != wire38[(3'h6):(2'h2)]));
        end
      else
        begin
          if ((wire33 >>> wire34))
            begin
              reg39 <= ($signed({wire32[(4'hb):(3'h6)]}) ?
                  (~&{wire37[(2'h2):(1'h1)]}) : (~|$signed($unsigned((wire36 ?
                      wire38 : wire38)))));
              reg40 <= (~|(8'hb8));
              reg41 <= $unsigned(((wire38[(1'h1):(1'h1)] && $unsigned((!wire35))) >= (8'hbb)));
            end
          else
            begin
              reg39 <= wire32[(2'h2):(2'h2)];
              reg40 <= wire34;
              reg41 <= reg40;
              reg42 <= $signed(wire34);
            end
          reg43 <= {wire37[(2'h2):(1'h1)]};
          if ($signed((reg40 ?
              ($unsigned((8'hac)) ?
                  reg39 : reg40) : {$unsigned($unsigned((8'hbd)))})))
            begin
              reg44 <= ($unsigned({{wire34[(3'h5):(1'h1)]}}) ?
                  wire35 : $unsigned($signed((8'haa))));
              reg45 <= wire35[(3'h4):(2'h3)];
              reg46 <= ($unsigned(wire34[(3'h5):(3'h4)]) || wire37[(1'h1):(1'h1)]);
              reg47 <= {(+(wire38 ?
                      {(wire36 + reg43), (reg40 ? wire37 : wire34)} : {(reg40 ?
                              reg44 : wire33)})),
                  $unsigned(reg44)};
            end
          else
            begin
              reg44 <= reg39[(3'h6):(1'h0)];
            end
        end
      reg48 <= $unsigned($unsigned({($signed(reg45) | (^reg41)),
          $signed(reg41[(1'h1):(1'h1)])}));
      reg49 <= $unsigned($unsigned($signed((~^(&reg48)))));
      reg50 <= {wire35[(3'h6):(3'h4)]};
      reg51 <= reg39[(3'h4):(2'h2)];
    end
  assign wire52 = wire32;
  always
    @(posedge clk) begin
      reg53 <= reg49[(4'ha):(1'h1)];
    end
  assign wire54 = $signed((~^reg39));
  assign wire55 = $signed($signed(wire33));
  assign wire56 = $unsigned($unsigned(($signed((+reg50)) | (reg45[(4'h8):(3'h7)] < $signed(reg39)))));
  always
    @(posedge clk) begin
      if ((((~&{$signed(wire35), wire35}) ?
          ((-(wire38 <= reg47)) < {reg51[(5'h13):(2'h2)]}) : ({(-wire36),
                  (wire38 ? reg39 : reg39)} ?
              $signed(wire52[(5'h10):(4'h9)]) : {(wire33 || reg51)})) | (~|reg44[(4'hb):(4'hb)])))
        begin
          reg57 <= wire32[(4'h8):(3'h5)];
          reg58 <= {(-(wire32 ?
                  ((wire35 || reg43) ? (reg48 == reg45) : reg49) : reg44))};
          reg59 <= ($unsigned($signed(reg48[(4'hc):(4'h9)])) && $signed((~^{reg46})));
          reg60 <= ($signed((!(^$signed((8'hb4))))) ?
              $unsigned(reg45[(4'h9):(1'h0)]) : $signed($unsigned(wire35[(4'h9):(1'h1)])));
        end
      else
        begin
          reg57 <= $unsigned({wire36[(4'h9):(2'h2)],
              (-{wire54, reg53[(4'he):(3'h5)]})});
          reg58 <= ((-{wire37[(1'h1):(1'h0)]}) ?
              reg41[(2'h2):(1'h0)] : $unsigned(($unsigned(reg47) ?
                  $unsigned((!reg40)) : wire52)));
          reg59 <= reg48[(4'ha):(3'h7)];
          reg60 <= {(!(~|(~|reg50))), (~&reg57)};
          reg61 <= ($unsigned(((wire37[(1'h0):(1'h0)] ?
                      $unsigned(reg57) : reg60) ?
                  $signed(wire54[(4'ha):(1'h0)]) : $unsigned(reg42))) ?
              $unsigned({$unsigned({reg47})}) : (~(reg41[(1'h0):(1'h0)] ?
                  ($signed(reg51) ?
                      (^~(8'hae)) : $unsigned(wire56)) : $signed(((8'h9f) <<< (8'hbd))))));
        end
      reg62 <= wire54[(4'hd):(4'hb)];
      reg63 <= wire56;
      if (wire32)
        begin
          if ($signed($unsigned($unsigned($unsigned(reg39)))))
            begin
              reg64 <= ($signed($signed($unsigned($signed(reg51)))) ?
                  (~|(8'h9f)) : $unsigned(((7'h41) ?
                      $unsigned((&(7'h42))) : reg63[(4'hf):(2'h2)])));
              reg65 <= $signed(wire56);
              reg66 <= (~^(reg62 == (((8'ha0) <= $signed(wire34)) ^ ($signed(wire52) ?
                  wire34 : $unsigned(reg44)))));
              reg67 <= reg49;
            end
          else
            begin
              reg64 <= reg61;
              reg65 <= reg44;
              reg66 <= $unsigned($unsigned($unsigned((+(^wire32)))));
              reg67 <= reg60[(1'h0):(1'h0)];
              reg68 <= (~^$signed((~((~reg43) ?
                  reg66[(1'h0):(1'h0)] : reg50[(1'h0):(1'h0)]))));
            end
          reg69 <= ((($signed($signed(reg63)) ?
                      reg46[(2'h3):(2'h3)] : ((-wire56) ?
                          reg63[(3'h7):(3'h4)] : $unsigned(reg51))) ?
                  ((-(~^wire55)) ?
                      (~|reg63[(4'he):(3'h7)]) : reg43) : $signed((8'hb4))) ?
              {$signed((^$unsigned(reg44)))} : reg59);
        end
      else
        begin
          if (wire54[(4'hb):(4'hb)])
            begin
              reg64 <= $signed(wire56);
            end
          else
            begin
              reg64 <= (+({(reg41 >= reg42[(2'h2):(2'h2)])} && (|(!reg42[(3'h6):(2'h2)]))));
              reg65 <= (~&(reg62 ?
                  ($signed((&reg59)) + $unsigned({(8'hbc),
                      reg45})) : reg50[(1'h0):(1'h0)]));
            end
          reg66 <= {(-(!reg41))};
          reg67 <= wire36;
        end
      reg70 <= ((reg62[(1'h0):(1'h0)] ?
              $signed((~^$signed(reg44))) : $unsigned(reg44)) ?
          {$unsigned($signed((8'hab)))} : {(reg62[(1'h1):(1'h1)] ?
                  wire34 : (!{(8'hab)}))});
    end
  assign wire71 = reg64;
  assign wire72 = reg39;
  assign wire73 = (wire55 ?
                      ((^~(~|$unsigned(reg49))) - reg44[(2'h3):(2'h3)]) : ($unsigned($unsigned(((8'ha1) != (8'hab)))) | $unsigned(reg41[(2'h3):(1'h0)])));
  assign wire74 = wire38;
  assign wire75 = $signed($signed((reg41 ?
                      (!((8'hac) ? wire71 : (8'ha3))) : $signed((reg45 ?
                          wire72 : reg43)))));
  assign wire76 = $unsigned((|(~|(^~reg58[(2'h3):(2'h3)]))));
  assign wire77 = (&($unsigned({(|(7'h44))}) ? reg61 : wire54));
endmodule

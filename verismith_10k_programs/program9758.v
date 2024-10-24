module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  assign y = {wire95,
                 wire83,
                 wire81,
                 wire7,
                 wire6,
                 wire5,
                 reg94,
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
                 (1'h0)};
  assign wire5 = $signed($unsigned($unsigned(($unsigned(wire1) ~^ $signed(wire4)))));
  assign wire6 = ({((~$signed(wire5)) ? wire0[(3'h5):(2'h2)] : wire5)} ?
                     (^{{(wire5 == wire2)}, wire4[(1'h0):(1'h0)]}) : (!wire0));
  assign wire7 = ((8'ha8) >= $unsigned({(&wire1[(2'h2):(1'h0)]),
                     ($unsigned((8'hb6)) < wire4[(2'h3):(2'h3)])}));
  module8 #() modinst82 (wire81, clk, wire5, wire4, wire7, wire6);
  assign wire83 = ($unsigned((wire4 ?
                      wire6[(5'h11):(5'h10)] : $unsigned($signed((8'hac))))) + ((($unsigned(wire0) >>> wire3[(2'h2):(2'h2)]) - (wire6 ~^ (wire1 - wire81))) ?
                      (^~(~|wire5[(4'ha):(3'h4)])) : $unsigned(($signed(wire0) & $signed(wire7)))));
  always
    @(posedge clk) begin
      if ((~&(8'hb2)))
        begin
          reg84 <= {(^($signed($signed(wire3)) ?
                  wire4[(4'ha):(1'h1)] : ({(8'ha8)} == $unsigned(wire6)))),
              {((^wire1) - ((wire0 <<< wire4) ?
                      wire3 : wire7[(1'h0):(1'h0)]))}};
        end
      else
        begin
          reg84 <= (^$signed((wire5[(1'h1):(1'h1)] <<< ((wire1 ?
              wire3 : wire5) & (|wire2)))));
          reg85 <= wire3;
          if (((8'ha9) ?
              $signed($unsigned(($unsigned(wire6) << {wire3, wire1}))) : reg85))
            begin
              reg86 <= wire81;
              reg87 <= (8'hbe);
              reg88 <= $signed($signed((((reg86 ?
                      wire5 : wire83) >>> (~|wire5)) ?
                  $signed((wire1 ~^ wire7)) : (wire1 << (8'hb9)))));
              reg89 <= wire7[(4'h9):(2'h3)];
            end
          else
            begin
              reg86 <= (($signed((8'haa)) ?
                      $unsigned((~^(!wire7))) : $signed($signed(wire0[(1'h0):(1'h0)]))) ?
                  wire5 : (~((wire3 ?
                      wire4 : {wire1,
                          reg84}) != (wire7[(4'h8):(4'h8)] <<< (reg87 ?
                      wire0 : reg84)))));
              reg87 <= wire83;
              reg88 <= wire1;
              reg89 <= reg84;
            end
          reg90 <= ((wire83 ?
                  ((!$unsigned(wire4)) ?
                      ((-wire0) << $signed(wire1)) : wire83) : (((reg85 ?
                          wire1 : wire7) - (^~reg84)) ?
                      $signed(wire1) : ((reg86 != reg87) ?
                          (~|reg84) : $signed(wire83)))) ?
              {(&{(-reg86)})} : $unsigned((wire0[(3'h4):(3'h4)] ?
                  wire1[(3'h5):(3'h5)] : $unsigned(reg87[(3'h4):(3'h4)]))));
        end
      reg91 <= reg88[(4'hc):(3'h6)];
      reg92 <= (reg89 ? reg86[(5'h13):(3'h4)] : reg88);
      reg93 <= wire2[(1'h0):(1'h0)];
      reg94 <= reg90;
    end
  assign wire95 = wire2[(3'h4):(1'h1)];
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h1c4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire68;
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire72,
                 wire71,
                 wire70,
                 wire13,
                 wire26,
                 wire29,
                 wire33,
                 wire51,
                 wire53,
                 wire54,
                 wire68,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 reg25,
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
                 (1'h0)};
  assign wire13 = (8'ha9);
  always
    @(posedge clk) begin
      reg14 <= $unsigned(((-wire9[(1'h0):(1'h0)]) & (+{$unsigned(wire12)})));
      if ((&$unsigned(($unsigned(reg14[(4'h9):(4'h9)]) * ($unsigned(wire10) ?
          (wire12 * (8'hb3)) : (reg14 ? (8'hb0) : wire10))))))
        begin
          reg15 <= wire10[(3'h5):(3'h5)];
          reg16 <= (~|(wire9 ?
              (~$unsigned($signed(wire9))) : (~&$signed((-wire12)))));
          reg17 <= (8'h9d);
          reg18 <= wire10;
        end
      else
        begin
          if (wire12[(3'h7):(3'h5)])
            begin
              reg15 <= (reg16[(1'h1):(1'h1)] <= (^reg17[(1'h1):(1'h1)]));
            end
          else
            begin
              reg15 <= reg14[(4'he):(4'hd)];
              reg16 <= (~&reg17[(2'h2):(1'h0)]);
              reg17 <= (-$signed($unsigned({wire9[(2'h3):(2'h2)],
                  (wire9 ? reg18 : wire12)})));
              reg18 <= (((wire11[(3'h5):(1'h1)] ?
                      (~^$signed(reg14)) : $signed((|reg16))) ?
                  (wire12 ?
                      ($unsigned(reg17) ?
                          wire12 : $unsigned(wire13)) : wire13) : ((wire13[(4'hb):(4'h8)] ?
                      wire10[(1'h1):(1'h0)] : (reg14 << reg15)) > reg17)) & (($signed(wire11[(4'hd):(4'h8)]) <= $unsigned((!wire11))) ~^ (((8'ha9) == (reg18 >>> wire11)) & ($signed((8'hb0)) ?
                  (&reg18) : $unsigned(reg14)))));
              reg19 <= wire12;
            end
          reg20 <= {(wire11[(1'h0):(1'h0)] ~^ ($unsigned({wire12,
                  reg18}) & ((wire11 ? reg17 : wire13) >= $unsigned(wire9)))),
              wire13[(4'hc):(3'h5)]};
          if (reg17[(1'h1):(1'h0)])
            begin
              reg21 <= (+{$unsigned($signed($unsigned(reg15))), wire10});
              reg22 <= $unsigned(reg20);
              reg23 <= reg16;
              reg24 <= (wire12 + (reg15[(1'h1):(1'h1)] ?
                  wire10 : reg15[(3'h4):(1'h0)]));
            end
          else
            begin
              reg21 <= (wire10 ?
                  ($unsigned((wire13[(4'hd):(4'h8)] - reg21)) <= (reg21[(4'hb):(3'h6)] | ((reg20 >> reg14) ?
                      (8'ha9) : $signed(wire9)))) : (reg21 * ((~reg16) ?
                      ((reg19 < reg15) ?
                          (^(8'ha8)) : {wire9}) : $signed(reg18[(4'he):(3'h7)]))));
              reg22 <= (reg24 ?
                  ({{(wire11 <= reg17)}} == wire12) : reg20[(1'h0):(1'h0)]);
              reg23 <= $unsigned(($signed((reg16[(1'h0):(1'h0)] || ((8'hba) << reg19))) >= $unsigned(reg15[(2'h2):(2'h2)])));
              reg24 <= (~|(+$unsigned($unsigned((8'h9d)))));
            end
          reg25 <= reg19[(3'h6):(1'h1)];
        end
    end
  assign wire26 = $unsigned($unsigned(reg16));
  always
    @(posedge clk) begin
      reg27 <= (({($signed(reg20) ?
                  (reg16 && wire12) : (~reg16))} >>> $signed($unsigned($signed(reg19)))) ?
          (!wire13[(1'h1):(1'h1)]) : $signed(reg23));
    end
  always
    @(posedge clk) begin
      reg28 <= $unsigned($unsigned($unsigned(((^reg18) ?
          (+reg17) : (wire9 ? reg14 : (8'h9c))))));
    end
  assign wire29 = {reg15[(3'h4):(2'h2)],
                      $signed((($unsigned((8'hb6)) ?
                              $signed(reg20) : reg27[(1'h0):(1'h0)]) ?
                          $unsigned($signed((8'ha2))) : {(reg18 ?
                                  reg27 : reg16),
                              wire9[(1'h1):(1'h0)]}))};
  always
    @(posedge clk) begin
      reg30 <= $unsigned({reg15, (^~({wire26} >> (~^reg25)))});
      reg31 <= {$signed((8'hb1)), reg24};
      reg32 <= $signed((&(((wire9 + wire26) * $unsigned(reg22)) ?
          $unsigned((reg18 <<< wire29)) : wire29[(3'h5):(2'h3)])));
    end
  assign wire33 = (7'h42);
  module34 #() modinst52 (wire51, clk, reg25, reg22, reg16, reg32, reg30);
  assign wire53 = $unsigned($unsigned((+reg28[(4'ha):(4'h8)])));
  assign wire54 = {wire9[(2'h2):(2'h2)], reg23};
  module55 #() modinst69 (wire68, clk, wire51, reg31, wire9, wire29);
  assign wire70 = (wire10[(2'h2):(2'h2)] ^~ (-$unsigned(($unsigned(reg25) ?
                      (reg23 ? reg30 : reg14) : (reg31 ? reg23 : wire68)))));
  assign wire71 = {wire53[(4'h9):(2'h3)], $unsigned($unsigned(wire29))};
  assign wire72 = wire13;
  always
    @(posedge clk) begin
      reg73 <= {$signed($signed(($signed(reg23) ?
              wire70[(5'h14):(4'h9)] : (^~wire33)))),
          (wire12[(4'hc):(4'hc)] ?
              $signed(($signed((7'h42)) | reg22)) : {$signed(reg27)})};
      reg74 <= wire10[(2'h2):(1'h1)];
      reg75 <= (wire29[(4'h9):(2'h2)] <= $unsigned((+(reg16 ?
          wire29[(3'h6):(1'h0)] : reg21))));
      reg76 <= ($signed((~|$signed((~reg16)))) * ($signed($signed(reg30[(5'h12):(1'h1)])) >> $signed({(-reg16)})));
    end
  assign wire77 = reg75;
  assign wire78 = (((((wire26 > wire10) ?
                              (wire26 ? reg15 : reg21) : (wire9 == (8'hbd))) ?
                          wire9[(1'h1):(1'h0)] : (8'h9d)) ?
                      reg27[(1'h1):(1'h0)] : reg28) - reg25);
  assign wire79 = ((8'ha2) + $signed((wire70 ?
                      (((8'h9e) - (8'ha5)) ?
                          (8'hbb) : (reg20 ?
                              reg14 : wire26)) : ($unsigned(reg15) ^~ (wire33 ~^ reg73)))));
  assign wire80 = wire70;
endmodule

module module55
#(parameter param67 = ((~&(!{(&(8'ha8)), (-(8'ha8))})) > ((~|(-((8'ha4) ? (8'haf) : (8'hb5)))) ? (~&{((8'ha1) - (8'hb1)), ((8'ha3) >= (8'hb0))}) : (&(-((7'h43) ? (7'h41) : (8'hba)))))))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire59;
  input wire [(4'hc):(1'h0)] wire58;
  input wire [(3'h7):(1'h0)] wire57;
  input wire [(4'h8):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire60;
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  assign y = {wire66, wire65, wire64, wire60, reg63, reg62, reg61, (1'h0)};
  assign wire60 = wire56;
  always
    @(posedge clk) begin
      reg61 <= $unsigned((((!wire59[(1'h1):(1'h0)]) <<< ($unsigned(wire58) ?
          wire57[(2'h3):(2'h3)] : $signed((8'ha7)))) ~^ (($unsigned(wire56) < $signed(wire60)) * $signed((wire60 ?
          wire57 : wire56)))));
      reg62 <= (8'ha2);
      reg63 <= {wire56};
    end
  assign wire64 = wire59[(2'h3):(1'h1)];
  assign wire65 = reg62[(2'h2):(1'h1)];
  assign wire66 = (reg63[(1'h0):(1'h0)] ?
                      $signed((&reg61)) : $unsigned((~($signed(wire60) < {wire57,
                          (8'h9d)}))));
endmodule

module module34
#(parameter param50 = {(((+((8'hb7) ? (8'h9c) : (8'ha7))) ^~ {((8'ha1) ? (8'ha3) : (8'hab)), (~(8'ha1))}) ? (((!(8'haa)) ? (~|(8'hac)) : (8'ha3)) >= (((8'ha4) ^~ (8'haf)) + ((8'hbc) ^~ (8'hb3)))) : (8'hbe)), (((^((8'ha1) & (8'hb9))) ? (^~{(8'hb3)}) : (!((8'hae) & (7'h40)))) ? {{(!(8'hae))}} : ({(!(8'hb5)), ((8'hb2) - (8'ha2))} ? ((^~(8'hab)) >> (&(7'h42))) : (^~((8'hac) ? (8'hb6) : (8'ha2)))))})
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire signed [(2'h2):(1'h0)] wire36;
  input wire [(3'h7):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire41,
                 wire40,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = (wire37 + $signed($signed(wire35[(3'h4):(1'h0)])));
  assign wire41 = $signed($signed($unsigned((-wire35))));
  always
    @(posedge clk) begin
      reg42 <= ((&wire39) ?
          (~$unsigned(({wire35,
              wire41} | (~|wire37)))) : wire39[(3'h4):(2'h3)]);
      reg43 <= ((~{$unsigned(((8'ha7) ? wire36 : wire39)), wire35}) ?
          $unsigned(wire41[(2'h2):(1'h0)]) : $unsigned(wire35));
      reg44 <= {(~^wire36)};
      reg45 <= wire37[(1'h1):(1'h1)];
    end
  assign wire46 = wire39[(5'h10):(2'h2)];
  assign wire47 = $signed(reg43);
  assign wire48 = wire36;
  assign wire49 = (&((({reg43} ? (wire37 == (8'ha0)) : $unsigned(wire39)) ?
                          wire41 : ((reg45 ? reg45 : wire38) ?
                              (reg45 ^ wire36) : wire48)) ?
                      wire35[(2'h2):(1'h1)] : (((wire39 ? wire38 : (8'hbb)) ?
                          (reg42 ? reg45 : wire41) : ((7'h44) ?
                              wire47 : (8'ha2))) != ((wire35 ^ wire41) ?
                          (reg43 ? wire40 : reg45) : wire46[(1'h0):(1'h0)]))));
endmodule

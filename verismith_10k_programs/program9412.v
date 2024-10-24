module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire108;
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  assign y = {wire111, wire110, wire108, reg112, (1'h0)};
  module4 #() modinst109 (wire108, clk, wire1, wire0, wire3, wire2);
  assign wire110 = {wire3};
  assign wire111 = wire3;
  always
    @(posedge clk) begin
      reg112 <= $signed(wire0);
    end
endmodule

module module4
#(parameter param107 = (^{(!((8'hb7) >= ((8'hbb) ? (8'hbd) : (8'hae)))), (!(((8'h9f) - (8'hb2)) <= ((8'ha9) ? (8'hb4) : (8'hb8))))}))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire5;
  input wire signed [(5'h10):(1'h0)] wire6;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire104;
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire106,
                 wire87,
                 wire69,
                 wire68,
                 wire66,
                 wire9,
                 wire21,
                 wire22,
                 wire23,
                 wire43,
                 wire89,
                 wire90,
                 wire104,
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
                 (1'h0)};
  assign wire9 = (($unsigned($unsigned(wire6)) ?
                     (($unsigned((8'hbe)) < (wire8 ? wire6 : (8'ha0))) ?
                         $unsigned((~|wire7)) : {(8'hb7),
                             ((8'ha2) ?
                                 wire5 : wire8)}) : $signed(((wire6 && wire5) ?
                         $unsigned(wire8) : $unsigned(wire7)))) << wire5);
  always
    @(posedge clk) begin
      reg10 <= wire7[(1'h1):(1'h0)];
      reg11 <= wire8;
      if ({($unsigned(({wire5, reg10} > $signed(wire6))) ?
              (+reg10) : wire7[(2'h2):(1'h1)])})
        begin
          reg12 <= (((reg11 << wire8[(3'h7):(3'h5)]) ?
                  reg10 : ((~^(|wire9)) << ({wire9, wire5} ?
                      (-wire7) : $signed((8'had))))) ?
              {$signed($signed({wire8, (8'hb6)}))} : reg10[(5'h11):(4'hf)]);
          reg13 <= $unsigned({((-{(8'haf)}) ?
                  $unsigned(wire8[(1'h1):(1'h1)]) : ((-wire5) < {wire6,
                      (8'hb9)})),
              ((((8'hac) ? wire9 : reg12) == (wire7 ? wire8 : (8'haa))) ?
                  reg12 : (wire9[(4'h9):(2'h2)] ?
                      (reg11 ^ wire9) : ((8'hb0) ^~ wire5)))});
        end
      else
        begin
          if (wire7[(2'h2):(1'h0)])
            begin
              reg12 <= ($unsigned(wire5) > $unsigned((($signed((8'hb2)) ?
                  {reg12} : $signed((8'hb7))) ~^ (^$unsigned((8'haf))))));
              reg13 <= ((~&reg12) ?
                  ($signed($unsigned($signed(wire7))) ?
                      {(wire8[(3'h7):(3'h4)] - ((8'hb6) ? reg11 : reg10)),
                          (~|wire7[(2'h2):(1'h0)])} : ((-wire5) ?
                          wire9 : (wire8[(3'h7):(2'h2)] ?
                              (reg13 ? wire6 : wire6) : {wire6,
                                  wire7}))) : reg10);
            end
          else
            begin
              reg12 <= (wire5 | $unsigned((reg13 ?
                  $signed($signed(wire8)) : {$unsigned(reg10),
                      $signed(wire8)})));
              reg13 <= (8'hbc);
            end
          reg14 <= reg10[(2'h2):(2'h2)];
          reg15 <= (&(|(8'h9d)));
        end
      if (((8'hb8) ?
          wire7[(2'h2):(2'h2)] : (((~&(~^(8'ha8))) + {$signed((7'h42)),
                  (reg10 > reg12)}) ?
              ($unsigned((reg14 ? reg10 : wire6)) ?
                  ((reg14 < reg10) >= wire9) : wire7) : (((wire6 ^~ reg10) ?
                      {wire7} : (8'hbb)) ?
                  (((8'ha4) ?
                      reg11 : wire7) == (!reg15)) : {reg11[(2'h2):(1'h1)]}))))
        begin
          reg16 <= {wire8[(3'h7):(3'h5)], reg12[(4'h9):(4'h9)]};
        end
      else
        begin
          reg16 <= wire6;
          reg17 <= {((~&(wire9 ? $signed(reg13) : wire6[(3'h6):(2'h3)])) ?
                  (~reg16[(4'h8):(1'h0)]) : (wire5 + (~(reg16 ?
                      (7'h44) : reg14)))),
              ($unsigned(reg11[(2'h2):(2'h2)]) >> $signed(reg11))};
          reg18 <= $signed(({$unsigned((-reg16))} - {(~$unsigned(reg11)),
              (wire9[(3'h7):(3'h6)] ?
                  reg15[(2'h3):(1'h1)] : reg17[(4'h8):(3'h6)])}));
          reg19 <= reg18[(2'h2):(1'h1)];
          reg20 <= reg12;
        end
    end
  assign wire21 = ({wire8} && ($signed((^$unsigned(reg13))) ?
                      {(8'hab),
                          $unsigned((reg14 ?
                              wire8 : wire6))} : ($signed((8'hab)) ~^ ((!(8'hbb)) >>> (reg15 ?
                          reg18 : wire5)))));
  assign wire22 = $unsigned((~$unsigned($unsigned({reg18}))));
  assign wire23 = $unsigned(reg11[(4'h8):(1'h0)]);
  module24 #() modinst44 (wire43, clk, wire7, wire9, reg14, reg13, wire6);
  module45 #() modinst67 (wire66, clk, reg19, reg18, wire43, wire6);
  assign wire68 = (wire5 ?
                      $unsigned({$unsigned(reg16),
                          $signed($unsigned((8'ha9)))}) : $signed((((reg19 ?
                              reg14 : reg12) >> (+wire5)) ?
                          ((reg12 * wire7) ?
                              (&(8'ha2)) : $unsigned(reg10)) : $signed($signed(wire43)))));
  assign wire69 = $signed(({$signed(reg14),
                          {wire21[(3'h4):(1'h1)], (wire21 | (8'ha0))}} ?
                      $unsigned(((wire23 ? (8'hb2) : (8'haf)) ?
                          $signed(reg14) : $signed(reg16))) : (wire7[(4'h8):(3'h4)] >>> $unsigned(wire9[(2'h2):(1'h1)]))));
  module70 #() modinst88 (wire87, clk, reg20, wire7, reg15, reg11);
  assign wire89 = wire68;
  assign wire90 = (^~({$signed($unsigned(reg10)),
                          ($signed(reg20) << (wire9 < reg18))} ?
                      $signed($unsigned((-wire43))) : (8'haa)));
  module91 #() modinst105 (.y(wire104), .clk(clk), .wire92(reg20), .wire93(wire5), .wire94(wire7), .wire95(wire22));
  assign wire106 = wire7[(1'h0):(1'h0)];
endmodule

module module91  (y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire signed [(4'he):(1'h0)] wire94;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire signed [(4'he):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg96,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg96 <= wire93[(2'h2):(1'h1)];
    end
  assign wire97 = (wire93 ? $unsigned(wire95) : (+reg96));
  assign wire98 = ($unsigned($signed($unsigned((wire95 ?
                      wire93 : wire93)))) + $signed((~|wire92[(3'h4):(2'h3)])));
  assign wire99 = wire98;
  assign wire100 = $unsigned(wire97[(3'h6):(2'h3)]);
  assign wire101 = (&({(!(wire93 ? wire95 : wire98)), reg96[(4'hd):(2'h3)]} ?
                       wire99 : wire98[(1'h1):(1'h1)]));
  assign wire102 = (~|(^~$unsigned(wire92[(3'h4):(1'h1)])));
  assign wire103 = wire94[(1'h0):(1'h0)];
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire74;
  input wire signed [(2'h3):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 (1'h0)};
  assign wire75 = wire72[(3'h5):(1'h0)];
  assign wire76 = wire71;
  assign wire77 = (8'ha0);
  assign wire78 = $signed((~wire76));
  assign wire79 = wire77[(2'h2):(2'h2)];
  assign wire80 = $unsigned(wire75[(3'h6):(3'h6)]);
  assign wire81 = $unsigned($unsigned($signed(({wire76} ^ wire72[(3'h6):(3'h5)]))));
  assign wire82 = $signed(($unsigned((8'ha6)) ?
                      ($signed((wire81 ? wire75 : wire72)) ?
                          ($unsigned(wire74) != wire75) : wire81[(2'h3):(2'h2)]) : {$signed({(8'ha3),
                              wire76}),
                          ($signed(wire81) ?
                              (wire80 ?
                                  wire76 : wire72) : (wire75 || wire78))}));
  assign wire83 = wire82[(1'h1):(1'h1)];
  assign wire84 = (!(+wire77[(3'h5):(1'h0)]));
  assign wire85 = (8'ha2);
  assign wire86 = $unsigned(wire71[(4'he):(4'hc)]);
endmodule

module module45
#(parameter param64 = {{(((7'h40) ? ((8'hbb) ^~ (8'hb7)) : (~|(8'ha5))) * (((8'hab) ^~ (7'h42)) ? {(8'hb3), (8'hb6)} : {(8'hbf), (8'hb4)})), (&((~(8'ha2)) ? (8'hbb) : {(8'ha9), (7'h40)}))}}, 
parameter param65 = param64)
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  assign y = {wire63,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire50 = ($unsigned((wire46[(3'h5):(1'h0)] ^~ $unsigned({wire47}))) << $unsigned(($signed($unsigned(wire49)) ?
                      (((8'haa) < wire49) < {(8'hb1)}) : ((wire47 ^ (8'hbf)) >> {wire48}))));
  assign wire51 = (^~($unsigned($signed((wire50 | (8'hb1)))) || wire50[(5'h11):(4'hd)]));
  assign wire52 = $signed({$signed({(~|(8'hbb)), {wire49, wire51}})});
  assign wire53 = (wire49 ?
                      $signed(wire48) : (~|$unsigned($unsigned($signed((8'ha5))))));
  always
    @(posedge clk) begin
      reg54 <= $unsigned({(($signed(wire53) >>> (wire51 ? wire47 : wire52)) ?
              $signed({wire47}) : $signed((wire50 <= wire52)))});
      reg55 <= (($signed((^(!wire47))) >> (wire51[(3'h5):(2'h2)] ?
          ((&wire49) ?
              $signed(wire48) : reg54[(3'h5):(2'h3)]) : (8'haa))) * wire46);
      reg56 <= $signed(($signed(wire51[(1'h1):(1'h1)]) < wire53));
      if (wire46[(1'h0):(1'h0)])
        begin
          reg57 <= (wire50[(4'h9):(3'h5)] ?
              (|($signed((~wire53)) < (-(wire49 ? reg54 : wire52)))) : (8'hae));
          reg58 <= $unsigned($unsigned(wire47));
          reg59 <= reg55[(3'h7):(3'h7)];
          reg60 <= {$unsigned($unsigned($signed((!wire52)))),
              $signed((^(~&wire53[(1'h1):(1'h0)])))};
          reg61 <= wire48[(1'h1):(1'h0)];
        end
      else
        begin
          reg57 <= (reg59 ?
              {$unsigned(reg57),
                  (((reg54 >= reg61) > (!wire52)) ?
                      wire51 : $unsigned($signed(reg54)))} : ((+(8'h9f)) + (-$unsigned(wire52[(4'h8):(1'h1)]))));
          reg58 <= wire48;
        end
      reg62 <= ((wire46[(2'h3):(2'h2)] ?
          ((+(reg57 ~^ wire47)) - (8'ha7)) : (-wire53[(2'h2):(1'h1)])) ^ $signed($signed(($signed(wire48) ?
          (wire49 ? reg58 : wire46) : wire46))));
    end
  assign wire63 = reg55[(1'h1):(1'h1)];
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(3'h7):(1'h0)] wire28;
  input wire [(4'hd):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire28 | ({$unsigned(((8'ha2) ? wire27 : wire28))} ?
          wire29[(3'h5):(1'h1)] : wire28[(3'h4):(2'h3)])))
        begin
          if ($signed((($unsigned((^~wire26)) ?
              (^~$unsigned(wire26)) : $unsigned({wire29,
                  wire29})) * $signed(wire27[(3'h7):(3'h5)]))))
            begin
              reg30 <= $signed(wire25[(2'h3):(1'h0)]);
            end
          else
            begin
              reg30 <= $unsigned(wire29[(2'h3):(1'h1)]);
              reg31 <= (|($unsigned($unsigned({wire26})) ^ $signed(wire28)));
              reg32 <= ($unsigned(($signed($signed(reg31)) ?
                      $unsigned((reg31 ? (8'ha3) : reg30)) : $signed((wire26 ?
                          wire26 : wire29)))) ?
                  wire26 : {wire25,
                      ($signed(wire28) ?
                          $unsigned($unsigned(wire29)) : $unsigned((|(8'ha8))))});
            end
          reg33 <= {{(^~$signed($unsigned((8'h9c))))}};
          reg34 <= reg32[(4'hd):(3'h5)];
          reg35 <= reg32[(1'h1):(1'h0)];
          reg36 <= $unsigned(((wire27 >>> $signed($signed(reg34))) ?
              reg32 : $unsigned({(8'hab), $signed((8'hbd))})));
        end
      else
        begin
          reg30 <= $unsigned(reg35);
          if (reg36)
            begin
              reg31 <= reg35[(4'hc):(3'h5)];
            end
          else
            begin
              reg31 <= ($signed((-(reg36[(2'h3):(1'h0)] >>> $signed(reg31)))) < reg34);
            end
          reg32 <= ((|(((wire25 >> wire29) << $unsigned(reg34)) ?
                  $signed($signed((8'hbb))) : wire29)) ?
              $signed(reg35[(4'h9):(2'h3)]) : ((($signed((8'hb4)) != wire27[(3'h5):(3'h4)]) ^~ $unsigned((reg35 >> reg36))) ^ $signed((reg30 == wire29))));
          if ($unsigned($unsigned((reg31[(4'h9):(2'h2)] != ((reg35 >= reg34) ?
              wire27[(4'hb):(1'h0)] : $unsigned(wire26))))))
            begin
              reg33 <= $unsigned(($signed(reg36[(4'hd):(4'h9)]) ~^ (((reg36 || wire26) ?
                  reg33[(2'h3):(1'h0)] : $unsigned(reg35)) | (reg30[(4'ha):(3'h6)] ?
                  reg31 : {reg32}))));
              reg34 <= reg33;
              reg35 <= (($signed(wire25[(4'hb):(4'h9)]) ?
                      $unsigned(wire26) : {$unsigned(reg31),
                          wire26[(2'h3):(1'h1)]}) ?
                  (8'ha3) : wire28[(2'h2):(1'h0)]);
              reg36 <= ($signed(reg35) == reg30);
              reg37 <= {$signed(reg35)};
            end
          else
            begin
              reg33 <= reg30;
            end
        end
    end
  assign wire38 = reg31;
  assign wire39 = wire38[(2'h3):(1'h1)];
  assign wire40 = $signed((^wire26[(2'h3):(1'h1)]));
  assign wire41 = $signed({(~^(wire26 > (reg35 ? wire25 : reg35))),
                      (reg31 >> $signed(reg37[(1'h0):(1'h0)]))});
  assign wire42 = $signed($unsigned(wire25[(1'h0):(1'h0)]));
endmodule

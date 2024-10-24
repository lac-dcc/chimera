module top
#(parameter param88 = (!(~&(({(8'hae), (8'h9c)} > ((8'haf) ? (8'ha4) : (7'h42))) < ((8'hba) ? ((8'ha8) ~^ (8'h9e)) : ((8'hbb) << (8'h9c)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire76;
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 reg81,
                 (1'h0)};
  module5 #() modinst77 (wire76, clk, wire1, wire2, wire3, wire4);
  assign wire78 = {$signed($unsigned(wire2))};
  assign wire79 = wire3;
  assign wire80 = ($unsigned(wire0[(4'hf):(4'he)]) == (wire4 - (wire79 ?
                      (^{wire2, wire2}) : (~$signed(wire2)))));
  always
    @(posedge clk) begin
      reg81 <= (($signed(((wire78 - wire1) ? (~^wire4) : wire76)) ?
              $signed(wire1) : $signed((wire4 ?
                  wire4[(1'h0):(1'h0)] : (wire80 != wire0)))) ?
          $unsigned(({wire4, (-wire78)} - wire78[(3'h4):(1'h1)])) : wire1);
    end
  assign wire82 = (($signed(((wire0 ?
                          wire1 : wire78) + (wire76 + wire3))) <= wire3) ?
                      $signed($unsigned(wire3[(1'h0):(1'h0)])) : wire1[(3'h5):(2'h2)]);
  assign wire83 = ({(!{reg81})} ? wire3[(4'ha):(4'h9)] : wire0[(4'hb):(4'h8)]);
  assign wire84 = $unsigned((($unsigned($unsigned(wire76)) ?
                      ((~|(8'hbc)) <<< (!wire83)) : (wire82[(4'hc):(4'hb)] != $signed((8'hb2)))) + wire0[(4'ha):(2'h3)]));
  assign wire85 = $unsigned(wire1[(4'hb):(1'h1)]);
  assign wire86 = $signed(wire83);
  assign wire87 = (+{$unsigned(wire80)});
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire10;
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire65,
                 wire63,
                 wire59,
                 wire57,
                 wire16,
                 wire15,
                 wire10,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg62,
                 reg61,
                 reg60,
                 reg31,
                 reg30,
                 reg29,
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
                 reg18,
                 reg17,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = (^~(wire9 ?
                      (|(-wire7)) : $unsigned($signed($signed((8'hbc))))));
  always
    @(posedge clk) begin
      reg11 <= (^~$signed($signed($unsigned((wire7 >= wire9)))));
      reg12 <= wire8[(2'h2):(1'h1)];
      reg13 <= ($unsigned(wire8[(1'h0):(1'h0)]) ?
          ((~($signed(wire8) >>> ((8'hb9) ?
              reg12 : wire8))) < ($unsigned((wire9 || wire7)) ?
              (((8'hb8) >> wire10) ?
                  ((8'h9f) ?
                      wire10 : reg11) : (8'hb2)) : (wire7 ~^ wire7))) : ((~reg12) + $signed($signed($signed(wire6)))));
      reg14 <= {wire8[(1'h0):(1'h0)],
          {($unsigned(reg13[(4'h8):(3'h5)]) ?
                  ((&wire6) <= reg12[(1'h1):(1'h0)]) : wire7)}};
    end
  assign wire15 = wire6[(4'ha):(3'h5)];
  assign wire16 = (^$unsigned((reg14 ?
                      $unsigned($signed(wire7)) : reg14[(4'ha):(1'h0)])));
  always
    @(posedge clk) begin
      reg17 <= $signed($signed((reg13 >= (wire7 ?
          (wire7 & wire9) : ((8'ha4) ~^ (8'ha6))))));
      reg18 <= (wire10[(5'h13):(3'h4)] ?
          reg11 : (reg12[(1'h1):(1'h1)] ? reg14 : (+$unsigned((^~wire8)))));
      reg19 <= ({($signed((wire7 >> (8'hbe))) >> $unsigned(wire6[(2'h2):(1'h1)])),
          $signed($unsigned($unsigned(wire8)))} != $unsigned(($unsigned(wire9[(1'h1):(1'h0)]) - reg12[(1'h1):(1'h1)])));
      if ((+reg18))
        begin
          reg20 <= (({reg19[(1'h0):(1'h0)]} ?
                  $unsigned($unsigned(reg13[(4'h9):(1'h0)])) : reg17[(2'h3):(1'h0)]) ?
              ((reg17 >> ((reg11 ? wire15 : wire6) ?
                  ((8'hb7) >>> wire10) : (reg17 ?
                      reg19 : (8'ha3)))) ^~ (reg14[(3'h6):(3'h4)] ?
                  ((~|wire7) ?
                      $signed(wire8) : $unsigned(wire10)) : wire9)) : {(~|$unsigned((~&wire7)))});
          if (wire15)
            begin
              reg21 <= $unsigned(($unsigned(reg13[(3'h7):(3'h7)]) >>> ((&$unsigned(reg19)) ?
                  (-$signed(wire15)) : (~wire7[(4'h8):(1'h0)]))));
              reg22 <= $signed($unsigned($signed($signed($signed((8'hb6))))));
              reg23 <= (8'ha9);
              reg24 <= ((~{{reg19}}) <= (reg13[(2'h3):(1'h0)] * (($unsigned(reg19) ?
                  ((8'hb7) >>> reg23) : $unsigned(wire10)) & $unsigned($signed(reg23)))));
            end
          else
            begin
              reg21 <= $unsigned((((reg14[(2'h3):(2'h2)] ^~ (~|reg12)) > wire15) <<< $unsigned(((|reg13) * $signed(reg17)))));
              reg22 <= wire9[(2'h3):(2'h3)];
              reg23 <= (~&((+reg20) >>> reg12));
              reg24 <= $unsigned(((((reg12 << (8'h9c)) < (reg23 >= reg11)) < $unsigned($signed(wire16))) ?
                  ($unsigned((wire15 >>> (8'hab))) == $unsigned($signed((8'had)))) : reg11[(4'hc):(1'h0)]));
              reg25 <= (&($unsigned($unsigned({wire6, reg23})) ?
                  $unsigned(wire15) : (!$signed({reg19}))));
            end
          reg26 <= (~&$unsigned({wire15}));
          if (($unsigned($unsigned((~^(~(8'ha2))))) ^ reg24[(4'h8):(1'h1)]))
            begin
              reg27 <= ((reg26[(4'h8):(2'h3)] | (((reg17 ?
                  wire15 : reg24) != (!reg12)) <= reg25[(1'h1):(1'h1)])) ^~ wire8[(1'h0):(1'h0)]);
              reg28 <= ({reg23,
                      (((reg12 ~^ reg12) ^~ (wire16 || reg17)) < reg26[(2'h2):(1'h1)])} ?
                  $unsigned((~$unsigned((~reg19)))) : (~^(((-reg20) ?
                      $unsigned(wire6) : $unsigned(wire15)) * $unsigned((-reg24)))));
              reg29 <= reg25;
            end
          else
            begin
              reg27 <= ($signed((~^reg21[(4'hd):(4'hc)])) > $signed(($unsigned((reg14 ^~ reg19)) ?
                  (((8'ha8) ? reg14 : (8'haf)) ^ (reg18 ?
                      wire6 : reg19)) : reg14)));
              reg28 <= (($unsigned(wire9) || (wire7[(4'h9):(3'h5)] ?
                      $signed($signed((8'ha1))) : ($signed(reg24) ?
                          $unsigned(wire16) : $unsigned(reg14)))) ?
                  $signed(((!$unsigned(reg14)) ^~ ((|reg19) ?
                      $unsigned(wire8) : {wire6,
                          wire9}))) : (~&$unsigned((reg29 ?
                      (wire16 ? wire10 : reg12) : {wire6, wire6}))));
              reg29 <= ((reg13 ?
                  $unsigned(((reg22 - reg22) == (8'hb8))) : (|($signed(wire15) ^ $unsigned(reg19)))) >> $unsigned((~^((reg12 ?
                  (8'hac) : reg25) & reg20[(3'h4):(2'h3)]))));
            end
          if (reg21)
            begin
              reg30 <= (~^(($signed($unsigned(reg22)) ?
                  reg22 : $signed((wire9 <= (8'h9e)))) > (8'h9d)));
            end
          else
            begin
              reg30 <= (!reg26[(4'he):(4'h8)]);
              reg31 <= (^reg22[(3'h5):(1'h0)]);
            end
        end
      else
        begin
          reg20 <= reg14[(2'h2):(2'h2)];
          if (((&(reg22 ^ {$unsigned((8'hb3))})) ?
              ((wire8[(2'h3):(2'h2)] <= reg12) && reg23) : (((~^{reg25}) ?
                      (-(~^reg13)) : wire7[(1'h1):(1'h0)]) ?
                  reg17 : $signed(reg22))))
            begin
              reg21 <= (~&$unsigned((^~$unsigned((reg14 ^~ reg26)))));
              reg22 <= (((reg20[(1'h1):(1'h0)] ?
                      $signed($unsigned(reg25)) : (8'hbc)) ?
                  (~&((8'hbc) ? (^reg24) : $unsigned(reg20))) : {(+{reg17}),
                      wire16}) > (-({$signed(reg26)} ?
                  (+(reg21 ? (8'hb7) : reg24)) : wire10[(4'hd):(4'hc)])));
              reg23 <= reg14[(4'h9):(2'h2)];
            end
          else
            begin
              reg21 <= {reg11,
                  $unsigned($signed(((reg27 ? wire9 : reg14) ?
                      (~(8'h9f)) : wire15[(2'h2):(2'h2)])))};
              reg22 <= reg24[(4'h8):(4'h8)];
              reg23 <= (reg24 ? wire6[(3'h6):(3'h5)] : reg28[(4'hb):(1'h0)]);
              reg24 <= reg24[(3'h6):(2'h2)];
            end
          reg25 <= (!reg25[(1'h1):(1'h1)]);
          reg26 <= wire6;
          if (reg17)
            begin
              reg27 <= $unsigned((((reg22 ^ (reg13 >>> reg24)) ?
                  (~|(8'h9e)) : ((reg13 < reg18) ?
                      $signed(reg20) : (wire6 << reg30))) || $signed(({wire10,
                  reg26} ^ reg28))));
              reg28 <= $signed($signed(reg18[(5'h11):(3'h6)]));
              reg29 <= (~|reg23[(4'h8):(2'h2)]);
              reg30 <= $unsigned(reg31);
            end
          else
            begin
              reg27 <= (~(reg13[(3'h4):(1'h1)] ? $unsigned(wire7) : reg14));
              reg28 <= (!reg24[(1'h0):(1'h0)]);
              reg29 <= $signed((~$unsigned($signed($signed(wire8)))));
              reg30 <= {($signed($signed(reg18[(4'h9):(3'h6)])) * {({reg22,
                              reg22} ?
                          $unsigned(wire9) : {wire8})}),
                  ($signed($unsigned($signed((8'ha0)))) ?
                      $signed(($unsigned(reg20) << (reg12 >> reg30))) : wire6[(3'h5):(3'h4)])};
              reg31 <= reg25[(2'h2):(2'h2)];
            end
        end
    end
  module32 #() modinst58 (.y(wire57), .wire36(reg14), .clk(clk), .wire33(wire8), .wire35(reg19), .wire34(wire15));
  assign wire59 = {reg13[(3'h5):(1'h0)], wire6};
  always
    @(posedge clk) begin
      reg60 <= reg14;
      reg61 <= wire16;
      reg62 <= $unsigned($signed((~&$signed({reg19, reg17}))));
    end
  assign wire63 = {($signed(((~&reg62) < $signed(reg25))) ?
                          (reg28 ? wire16 : (+(|reg20))) : ((7'h42) ?
                              (8'hb4) : reg31[(2'h2):(1'h0)])),
                      $unsigned((~&(+$unsigned((8'hac)))))};
  always
    @(posedge clk) begin
      reg64 <= reg27[(2'h3):(2'h2)];
    end
  assign wire65 = (^$unsigned($unsigned($signed((~^wire9)))));
  always
    @(posedge clk) begin
      reg66 <= reg61[(3'h6):(1'h1)];
      reg67 <= (wire10[(4'h9):(2'h2)] ?
          {($unsigned((&wire63)) ?
                  ((wire59 && wire10) >> $unsigned(reg66)) : wire57)} : reg23[(3'h7):(3'h7)]);
      reg68 <= reg67;
      reg69 <= ((~wire59[(4'hd):(4'ha)]) ?
          reg62[(2'h2):(1'h1)] : wire65[(4'h8):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg70 <= reg21;
      reg71 <= $unsigned(wire10[(4'hb):(3'h7)]);
    end
  assign wire72 = ((reg62 ?
                          (($unsigned(reg22) ?
                              (7'h41) : $signed(reg61)) ^ ((reg11 ?
                                  (7'h41) : reg18) ?
                              (8'hb4) : (wire8 == reg18))) : $signed(((reg27 * reg29) ?
                              reg25 : $signed(reg67)))) ?
                      (-reg23[(2'h2):(1'h0)]) : (~^(reg11 & (&(reg66 * reg71)))));
  assign wire73 = ((8'hbb) + (((reg69[(2'h3):(1'h1)] >>> reg23) == reg22) + (((8'h9c) ?
                      $unsigned(wire6) : (wire63 && reg20)) >>> $unsigned(((8'hac) ?
                      wire63 : wire10)))));
  assign wire74 = (wire9 * $signed(reg68));
  assign wire75 = (((^~(8'hb0)) ?
                          wire74[(4'h8):(4'h8)] : {$unsigned((wire74 << wire57))}) ?
                      $unsigned(($unsigned(reg30[(4'hd):(1'h1)]) > ($unsigned(reg11) == (~&(8'h9f))))) : reg29[(2'h3):(1'h1)]);
endmodule

module module32
#(parameter param56 = (~((~^(8'ha1)) ? (~|(8'hae)) : ((8'hbf) < ({(8'ha1), (8'hbd)} ? (~|(8'hba)) : (~|(8'hbd)))))))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire36;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire [(5'h12):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire48,
                 wire44,
                 wire43,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= wire34;
      reg38 <= ((($unsigned($signed(wire36)) ?
                  ($unsigned((8'hba)) - wire33[(4'hf):(4'h8)]) : (+{wire35,
                      wire36})) ?
              $signed((wire33[(4'hf):(2'h2)] || wire36)) : wire34[(1'h0):(1'h0)]) ?
          wire35[(2'h3):(1'h1)] : (&$signed((&(~&wire33)))));
    end
  always
    @(posedge clk) begin
      reg39 <= ($signed(wire36[(2'h2):(1'h0)]) ~^ $signed($unsigned(wire35)));
      reg40 <= $unsigned($signed(wire35[(1'h0):(1'h0)]));
      reg41 <= ($signed((+(-{reg40, wire33}))) ?
          $signed($unsigned({(|wire34)})) : ({(^(wire33 ? wire36 : (8'hb0)))} ?
              (~^($unsigned((8'hbc)) ?
                  $unsigned(wire34) : (~^wire33))) : ($unsigned(reg37[(5'h11):(4'he)]) ?
                  reg38 : {(+(8'hac)), (8'h9f)})));
      reg42 <= (~&reg37[(3'h5):(2'h3)]);
    end
  assign wire43 = (($unsigned((wire36 ~^ reg37[(1'h1):(1'h1)])) ?
                          (reg37 ?
                              reg42 : $signed((wire35 ?
                                  reg42 : (8'h9f)))) : $unsigned($signed(reg39[(1'h1):(1'h1)]))) ?
                      ((($unsigned(reg39) ~^ $signed((8'hb9))) || reg41[(1'h0):(1'h0)]) | (($unsigned(wire36) * $unsigned(reg37)) + ((~&reg38) | wire34))) : wire34);
  assign wire44 = $signed($unsigned(((|$unsigned(reg38)) ?
                      reg37[(5'h13):(4'hb)] : (+{wire36, reg39}))));
  always
    @(posedge clk) begin
      reg45 <= wire33[(3'h6):(3'h4)];
      reg46 <= wire35[(1'h0):(1'h0)];
      reg47 <= $signed($signed(wire44[(2'h2):(2'h2)]));
    end
  assign wire48 = $signed({(|$signed(reg45[(4'hd):(4'hc)]))});
  always
    @(posedge clk) begin
      reg49 <= $signed(wire33);
      reg50 <= ((((wire48[(3'h6):(1'h0)] ^ {(8'hb2)}) ^ ((reg47 | reg38) ?
          wire48 : {reg41})) != $signed($unsigned(wire35[(1'h1):(1'h1)]))) >> $signed((8'ha6)));
      reg51 <= (8'hb6);
    end
  assign wire52 = reg47;
  assign wire53 = $unsigned($signed($unsigned(({reg38, reg45} ?
                      $signed(reg50) : wire52))));
  assign wire54 = ((({(reg40 == reg40)} - (8'hae)) ~^ $signed(reg50[(1'h1):(1'h0)])) ?
                      ($signed(wire43[(3'h5):(1'h1)]) * (~(reg49[(4'h9):(4'h8)] ?
                          reg47[(1'h1):(1'h0)] : $unsigned(reg45)))) : wire44);
  assign wire55 = wire33;
endmodule

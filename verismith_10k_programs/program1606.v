module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'ha):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire58;
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire5,
                 wire6,
                 wire7,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire58,
                 reg61,
                 reg60,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire5 = $unsigned(wire2);
  assign wire6 = (wire5 && $signed(wire3[(1'h1):(1'h0)]));
  assign wire7 = (|(wire0 ~^ {(wire6 >>> (wire1 ? wire3 : wire4))}));
  always
    @(posedge clk) begin
      reg8 <= $signed(wire6);
      if ((!(wire6[(1'h1):(1'h0)] ?
          wire2[(1'h0):(1'h0)] : (!($signed(wire7) ?
              wire3[(1'h1):(1'h1)] : wire4[(2'h2):(1'h1)])))))
        begin
          reg9 <= wire1;
          reg10 <= $signed($signed(wire2));
          if ($unsigned(($unsigned(wire1) ?
              (wire7 ?
                  wire3[(1'h1):(1'h1)] : (((8'ha5) * (8'h9e)) ?
                      (wire1 + wire1) : (~wire3))) : $unsigned((wire2 ?
                  wire2[(1'h0):(1'h0)] : ((8'h9f) ? wire3 : wire6))))))
            begin
              reg11 <= $signed(reg8[(4'h8):(3'h7)]);
            end
          else
            begin
              reg11 <= (wire3 ?
                  (-((wire1 ?
                      $signed((7'h44)) : (wire2 ?
                          reg11 : wire5)) << (8'h9e))) : ((^(~^(+reg9))) == ((8'hbf) >= wire1[(2'h2):(1'h1)])));
            end
          reg12 <= $unsigned(reg11[(5'h10):(3'h4)]);
        end
      else
        begin
          if (wire5)
            begin
              reg9 <= (wire6[(1'h1):(1'h0)] ?
                  $signed(reg8[(4'he):(4'hd)]) : wire2[(1'h1):(1'h1)]);
              reg10 <= wire4;
              reg11 <= (-wire5[(3'h7):(2'h2)]);
            end
          else
            begin
              reg9 <= (reg10[(1'h0):(1'h0)] >>> ($signed(($signed(wire5) ?
                      reg12 : (wire5 | (8'ha7)))) ?
                  $signed(reg9) : $unsigned(((reg9 != wire4) ^~ (-reg9)))));
            end
          reg12 <= ($unsigned({((~reg11) ?
                      (reg12 ? reg9 : wire5) : $signed(wire7)),
                  $unsigned((wire1 < wire7))}) ?
              reg8 : $signed(((~$unsigned(wire4)) * reg11)));
          if ((($unsigned({((8'hba) >= wire1), (|wire5)}) ~^ (((reg10 ?
              reg9 : (8'hab)) >= wire0) >= $signed((-reg8)))) == wire3[(2'h2):(1'h1)]))
            begin
              reg13 <= {({wire2, (~$unsigned(reg8))} ^ {(reg11 >> (reg11 ?
                          wire0 : reg9))}),
                  $unsigned($unsigned(wire7))};
              reg14 <= $signed(({(+$unsigned(wire4))} ?
                  (7'h42) : (~^{((8'hb0) ? (8'hb0) : reg13), {reg8}})));
              reg15 <= wire7;
            end
          else
            begin
              reg13 <= wire1;
              reg14 <= wire2;
              reg15 <= $signed(($unsigned((~|(+wire5))) || reg10[(3'h4):(2'h3)]));
              reg16 <= $unsigned((reg10[(1'h1):(1'h0)] - reg13));
              reg17 <= $signed(reg8[(4'ha):(3'h7)]);
            end
          if ($unsigned(($signed(reg12[(3'h7):(1'h1)]) <= (($signed(wire2) >>> {wire7}) ?
              $unsigned($signed(reg13)) : {{(8'haa)}}))))
            begin
              reg18 <= $unsigned(wire5);
              reg19 <= (~|reg10[(1'h1):(1'h0)]);
            end
          else
            begin
              reg18 <= $unsigned((~^((-(~reg11)) || (reg8[(4'hd):(4'hd)] >= {wire5,
                  reg12}))));
            end
          reg20 <= reg14[(3'h6):(1'h1)];
        end
      reg21 <= wire0[(2'h2):(1'h1)];
    end
  assign wire22 = ((^~reg16[(4'hd):(4'hb)]) ?
                      {(|wire0[(2'h3):(1'h1)]),
                          ({$unsigned(wire5)} & $unsigned($signed(wire3)))} : reg21[(2'h3):(2'h3)]);
  assign wire23 = {(((~|reg17) ?
                          reg20 : reg16[(3'h7):(3'h5)]) << ({wire1[(3'h6):(3'h6)],
                              $unsigned(reg20)} ?
                          ((^reg18) ?
                              (reg15 <= wire6) : reg11[(5'h10):(4'he)]) : $unsigned((reg12 ?
                              reg15 : reg12)))),
                      wire1};
  assign wire24 = $signed($signed((^~$unsigned($unsigned(wire6)))));
  assign wire25 = (wire6 >> {(((wire5 ? reg12 : reg13) ^~ $unsigned(wire0)) ?
                          reg10 : (!$unsigned((8'hab)))),
                      reg15});
  assign wire26 = wire23[(3'h5):(3'h4)];
  assign wire27 = $signed(($unsigned($unsigned((~reg18))) ?
                      reg18[(4'hb):(4'hb)] : ((((8'ha0) ?
                              wire24 : (8'hae)) && (|reg16)) ?
                          wire5 : {wire3, (~reg17)})));
  module28 #() modinst59 (wire58, clk, wire7, reg14, wire24, wire22);
  always
    @(posedge clk) begin
      reg60 <= (wire7[(3'h7):(3'h6)] ?
          $unsigned((+$unsigned($unsigned((8'had))))) : reg18);
      reg61 <= (wire25 > (({(&(8'ha3))} ~^ (reg12 ^ wire3)) == $unsigned((wire23 >>> (reg16 + wire3)))));
    end
  assign wire62 = (^~{$unsigned(wire3),
                      $signed((reg19 <= wire23[(5'h10):(4'he)]))});
  assign wire63 = (reg9 ?
                      $unsigned((!(reg10[(1'h0):(1'h0)] == {wire3}))) : ($signed(reg15) ?
                          reg19[(4'ha):(1'h0)] : (8'hb6)));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'ha):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire33 = wire32;
  assign wire34 = wire30[(1'h1):(1'h0)];
  assign wire35 = ((^wire34) ?
                      $unsigned($signed(((wire30 ? wire30 : wire31) ~^ (wire30 ?
                          wire33 : wire30)))) : ((^~wire33[(4'hf):(4'ha)]) ?
                          (+(|{(8'h9f), wire34})) : wire30));
  assign wire36 = {(((wire31 ? $signed(wire31) : wire35[(3'h7):(3'h5)]) ?
                              (!wire33) : {wire35[(4'hc):(1'h1)],
                                  wire30[(2'h2):(1'h0)]}) ?
                          (^wire33[(2'h2):(1'h0)]) : ($unsigned($unsigned(wire29)) >>> $signed((wire35 ?
                              wire33 : wire29))))};
  assign wire37 = (wire31[(3'h6):(3'h5)] ?
                      {wire34} : (wire33 ?
                          {(^~$unsigned(wire33))} : $unsigned($unsigned((wire31 ?
                              wire33 : (8'hb8))))));
  assign wire38 = $unsigned(($unsigned(({wire31, wire34} ?
                      {wire34} : $unsigned(wire35))) | (wire33 ?
                      wire36[(2'h2):(1'h1)] : wire33)));
  assign wire39 = ((($signed(wire33) > (|(wire37 ?
                          (8'hb9) : wire38))) | wire33) ?
                      ({$signed({(8'hb4),
                              wire31})} > $unsigned($signed({wire32}))) : ($unsigned(wire32[(4'h8):(3'h5)]) >>> (+(!(7'h40)))));
  assign wire40 = wire39;
  assign wire41 = ((~|{{wire29[(3'h4):(1'h0)], $signed(wire29)}}) ?
                      wire34 : (8'hac));
  assign wire42 = $signed(wire38);
  assign wire43 = {wire37[(3'h5):(2'h2)], ((|{wire35}) ? wire30 : wire30)};
  assign wire44 = $unsigned(wire38);
  always
    @(posedge clk) begin
      reg45 <= $unsigned(wire42);
      reg46 <= wire37[(5'h11):(4'hd)];
    end
  always
    @(posedge clk) begin
      reg47 <= ((wire42[(5'h10):(4'h8)] ?
              ((~^{wire34}) ?
                  ($signed((8'hb1)) ~^ $unsigned(wire42)) : {(wire29 ?
                          wire35 : wire37),
                      {wire33}}) : (~reg46)) ?
          {wire37[(5'h10):(2'h2)],
              ((wire44 + wire41) ?
                  $signed(wire30) : (+(wire35 ? wire35 : wire43)))} : wire44);
      reg48 <= $signed(($signed(wire32) ? wire36[(1'h0):(1'h0)] : wire43));
      reg49 <= (&{$signed($unsigned(wire29[(4'hb):(4'h9)])),
          $unsigned((~&(8'hb2)))});
      reg50 <= wire29;
      reg51 <= ((^~(((~&(8'hb0)) | reg47[(4'ha):(1'h1)]) ?
          ($signed(wire29) >= reg49) : wire34)) < reg45[(2'h2):(1'h1)]);
    end
  assign wire52 = wire35[(4'hd):(4'hd)];
  assign wire53 = wire39[(1'h1):(1'h1)];
  assign wire54 = wire35[(4'h8):(4'h8)];
  assign wire55 = (|(!reg50[(3'h5):(2'h3)]));
  assign wire56 = {($unsigned({reg51,
                          ((7'h42) ?
                              wire53 : wire31)}) >>> $unsigned($unsigned(((8'hb7) ?
                          reg49 : wire35))))};
  assign wire57 = (|{$unsigned($unsigned(wire55)),
                      ({(~|(8'hb1)), (&(8'ha8))} ?
                          wire30 : $unsigned((+wire32)))});
endmodule

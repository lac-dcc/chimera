module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire4,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire4 = {wire2[(2'h2):(1'h1)]};
  module5 #() modinst58 (wire57, clk, wire3, wire1, wire4, wire2);
  assign wire59 = $signed(({wire4, wire0} * $signed($signed((wire0 ?
                      wire0 : wire1)))));
  assign wire60 = ($signed((~(8'hbb))) ? wire59[(4'he):(4'h8)] : wire1);
  assign wire61 = wire60;
  assign wire62 = wire2;
  assign wire63 = {($signed((^wire59)) << wire60),
                      $unsigned($signed(wire60[(3'h6):(1'h0)]))};
  assign wire64 = wire0;
  assign wire65 = {$unsigned({(&(wire61 ? wire59 : (8'hac)))})};
  assign wire66 = (-{((~$signed(wire2)) ?
                          ((~|wire1) ?
                              wire2[(5'h12):(2'h2)] : {(8'hb3),
                                  wire60}) : $unsigned($signed(wire59))),
                      ($unsigned((wire62 ? (8'hbb) : wire61)) ?
                          $signed((wire0 ? wire63 : wire63)) : wire60)});
  assign wire67 = {({{{wire57}, (^~wire59)}, wire62} ?
                          (((|(8'h9c)) ? (8'hb9) : $unsigned(wire61)) ?
                              wire61 : $unsigned((&wire60))) : $unsigned(wire57))};
  always
    @(posedge clk) begin
      reg68 <= ((~^($unsigned((wire59 << wire59)) ?
              {wire67[(1'h0):(1'h0)]} : ($unsigned(wire3) << $unsigned(wire57)))) ?
          ((&(!(wire4 - wire57))) == (+{(wire60 && wire60),
              $signed((8'h9d))})) : wire1);
      reg69 <= $unsigned(wire3[(4'h8):(3'h7)]);
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire55;
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire27,
                 wire28,
                 wire55,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ($signed(((~&(|wire9)) ?
          wire8[(3'h6):(1'h1)] : $signed(wire7))) && $signed({$unsigned($signed(wire8)),
          {((8'hbe) ? (8'haf) : wire8)}}));
      reg11 <= {(~{$signed(wire9[(4'h9):(4'h9)]), $signed((8'hb6))})};
      if ($signed($unsigned(wire9)))
        begin
          if ($signed($signed({$signed(wire9), wire6})))
            begin
              reg12 <= $unsigned(wire7[(2'h2):(1'h0)]);
              reg13 <= ($unsigned((reg11[(1'h0):(1'h0)] >> ($signed((8'ha4)) ?
                  $signed((8'hb5)) : (!(8'h9c))))) & (8'hbd));
            end
          else
            begin
              reg12 <= (~^$signed((((wire9 ? wire8 : wire8) << (reg11 ?
                  wire6 : reg11)) ^ wire6[(3'h5):(1'h1)])));
              reg13 <= ((^~$unsigned($unsigned($unsigned(wire8)))) ?
                  $signed((~^$unsigned((~&wire7)))) : $unsigned(($signed((reg12 ^ wire9)) * {$unsigned(wire8),
                      wire8[(1'h0):(1'h0)]})));
              reg14 <= {{(!wire7)}};
              reg15 <= {wire9[(4'hf):(1'h0)],
                  (wire7[(2'h2):(2'h2)] != $signed($unsigned($unsigned((8'ha8)))))};
            end
          reg16 <= ($unsigned($unsigned(reg11[(4'ha):(3'h6)])) ?
              (~(~^{(wire9 ? reg10 : reg13)})) : {reg12[(4'he):(4'h9)],
                  ((wire7[(2'h2):(2'h2)] ? (&reg10) : $unsigned((8'hb8))) ?
                      (^(reg10 ? wire8 : reg10)) : wire8)});
          reg17 <= ($unsigned(((|reg12) ?
              reg11[(4'h9):(1'h1)] : (~(reg10 ?
                  reg10 : wire6)))) ^~ ({wire6[(5'h12):(5'h11)], wire6} ?
              $unsigned(wire8[(3'h5):(1'h1)]) : (~|reg12)));
          reg18 <= ((&reg15[(1'h0):(1'h0)]) ?
              reg15 : $unsigned({$signed((wire6 || reg15))}));
          reg19 <= $unsigned(({($unsigned(reg17) ?
                      {(8'h9d), reg10} : $signed(reg14)),
                  $unsigned(reg13[(2'h3):(2'h2)])} ?
              {$signed(reg10[(2'h2):(2'h2)]),
                  reg11} : $unsigned(($unsigned(reg13) ?
                  $unsigned(reg17) : (!(8'ha1))))));
        end
      else
        begin
          reg12 <= reg12[(3'h6):(3'h4)];
          reg13 <= (8'hb2);
        end
      if ((&reg17[(1'h1):(1'h0)]))
        begin
          if (reg14[(4'he):(4'hd)])
            begin
              reg20 <= $unsigned((8'hac));
              reg21 <= wire9;
              reg22 <= $signed($unsigned($unsigned($signed(reg16))));
              reg23 <= (($signed($unsigned($signed((7'h44)))) ?
                  $signed(((+reg19) >>> (~^reg14))) : (!$signed((wire7 ?
                      wire6 : reg14)))) >>> ((wire9 << reg22[(4'ha):(1'h1)]) ?
                  reg11[(3'h5):(1'h0)] : $signed(reg17[(2'h2):(1'h1)])));
            end
          else
            begin
              reg20 <= reg23[(1'h1):(1'h0)];
              reg21 <= reg15[(2'h3):(2'h3)];
              reg22 <= $unsigned(($unsigned({(reg15 - wire6),
                  $unsigned(reg13)}) + $signed(((reg12 ?
                  wire9 : reg13) >>> (reg22 ? reg12 : reg11)))));
              reg23 <= $unsigned($unsigned($signed(reg14)));
            end
          reg24 <= (reg12 << {(-wire6[(4'hb):(3'h5)])});
          reg25 <= $unsigned(reg13);
          reg26 <= (reg14[(5'h14):(3'h7)] != reg16);
        end
      else
        begin
          reg20 <= (reg25 ?
              (reg11 > reg11) : ($unsigned({reg18[(1'h0):(1'h0)],
                      $unsigned(reg12)}) ?
                  (&reg14) : reg17));
        end
    end
  assign wire27 = reg18[(1'h1):(1'h1)];
  assign wire28 = (wire27 >= ($signed($signed((8'h9f))) << (^~reg18[(1'h0):(1'h0)])));
  module29 #() modinst56 (wire55, clk, reg24, wire9, reg19, reg17, reg23);
endmodule

module module29
#(parameter param53 = {((^~(((8'hbf) >>> (8'ha3)) >>> ((8'hbd) ? (8'ha8) : (8'hb2)))) + (((&(8'ha8)) << (+(8'had))) > ({(8'hae)} ? (^(8'hb6)) : (|(8'hb1))))), (~(8'hba))}, 
parameter param54 = (+param53))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire34;
  input wire [(5'h14):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire35 = $unsigned(wire34);
  assign wire36 = wire35;
  assign wire37 = (wire31[(2'h2):(1'h0)] ?
                      $signed(((~|wire33[(4'hb):(4'h9)]) <= ($unsigned(wire34) ?
                          wire32[(3'h4):(2'h3)] : (wire32 ?
                              (7'h41) : wire36)))) : wire30);
  assign wire38 = $unsigned($unsigned((~^wire31)));
  assign wire39 = $unsigned({wire38[(4'h9):(4'h8)], $unsigned(wire37)});
  assign wire40 = $signed((~&wire34[(3'h4):(3'h4)]));
  assign wire41 = wire34;
  assign wire42 = ($signed($unsigned(((wire34 ~^ wire40) ?
                          wire35[(2'h3):(2'h3)] : (~|wire33)))) ?
                      ($signed({$unsigned(wire30)}) <<< $unsigned((8'hbb))) : $unsigned((~&wire35)));
  assign wire43 = (!($signed($signed($unsigned(wire40))) ?
                      (+(7'h40)) : wire30));
  assign wire44 = (-{(~|$signed((wire30 ^ wire42))), (-(~$signed(wire31)))});
  assign wire45 = ($unsigned((8'ha9)) ? (7'h41) : wire35);
  assign wire46 = ((^~wire34) ? $signed((&wire30[(4'h9):(2'h3)])) : wire36);
  assign wire47 = ((~|wire40[(4'hf):(4'h9)]) | $signed(wire33));
  always
    @(posedge clk) begin
      reg48 <= ((wire37[(4'hf):(1'h1)] - (~&($signed(wire36) ?
          wire44[(3'h4):(2'h2)] : wire34))) <= $signed(wire39));
      reg49 <= wire38[(1'h1):(1'h1)];
      reg50 <= ((wire33 ?
          (($signed((8'ha8)) << $unsigned(wire37)) ?
              wire37 : (~(wire42 | wire35))) : (&wire37[(1'h0):(1'h0)])) + ($signed(reg48) ?
          ((&(+wire30)) ?
              $signed((~^(8'hbc))) : wire42[(1'h1):(1'h1)]) : $unsigned($unsigned($signed(wire30)))));
      reg51 <= (wire36 << $unsigned(wire36));
      reg52 <= wire45[(2'h3):(1'h0)];
    end
endmodule

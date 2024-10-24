module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire26,
                 wire25,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
  assign wire5 = $unsigned($signed(wire2));
  assign wire6 = $unsigned(wire2[(4'h8):(3'h7)]);
  assign wire7 = {((^~wire6[(1'h1):(1'h0)]) ?
                         {wire3} : (wire3 - $signed((wire0 ? wire6 : wire3))))};
  assign wire8 = wire0[(1'h0):(1'h0)];
  assign wire9 = (8'had);
  assign wire10 = $signed((({(wire6 | wire6)} ~^ wire2) < (({wire3} | wire4) | {{wire5,
                          (7'h42)}})));
  assign wire11 = wire4[(2'h3):(2'h2)];
  assign wire12 = wire8;
  assign wire13 = wire4[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ((wire9 ^~ wire4))
        begin
          if (({((wire10 ? (^~wire1) : $unsigned(wire8)) ?
                      (wire8 ?
                          (&wire13) : wire4[(1'h1):(1'h1)]) : (-$signed(wire3)))} ?
              (wire9 ?
                  (wire6[(1'h1):(1'h1)] >>> wire3[(3'h4):(2'h3)]) : $unsigned(($signed((8'hb4)) & $unsigned((8'h9c))))) : $signed(wire6[(1'h1):(1'h0)])))
            begin
              reg14 <= {wire4[(2'h2):(1'h1)]};
              reg15 <= wire10[(2'h3):(1'h1)];
              reg16 <= wire11;
              reg17 <= wire8;
            end
          else
            begin
              reg14 <= ((+{(~$signed(wire6)),
                      (wire7[(4'hb):(3'h7)] > wire11[(1'h1):(1'h1)])}) ?
                  ($signed($unsigned((wire2 != (8'hbc)))) ?
                      $signed((wire9[(5'h10):(4'hd)] ?
                          (wire7 >>> wire8) : (~|wire0))) : wire4) : (wire10[(1'h1):(1'h0)] ?
                      wire4[(2'h2):(1'h0)] : (($signed(wire7) ?
                              (|wire12) : $unsigned((8'ha8))) ?
                          (wire2[(4'hb):(3'h6)] ?
                              {wire11,
                                  wire10} : wire9[(1'h0):(1'h0)]) : ((wire6 ?
                                  wire2 : wire8) ?
                              (~wire8) : wire6))));
              reg15 <= ((reg16 == $signed(($unsigned(wire7) ?
                      {reg14, wire0} : $unsigned(reg17)))) ?
                  (reg15 ?
                      (&$unsigned((^~reg15))) : (^(wire13[(3'h7):(2'h2)] >>> wire6))) : $unsigned($unsigned(((wire2 ?
                          (7'h44) : wire1) ?
                      wire3[(2'h2):(1'h0)] : (wire8 ? wire9 : wire4)))));
              reg16 <= $signed(((wire10[(2'h3):(1'h0)] ?
                  $unsigned(wire10) : ((!wire1) ?
                      (!wire1) : wire3[(3'h6):(2'h2)])) ^ {$unsigned(reg14)}));
            end
          reg18 <= reg16;
          reg19 <= $signed($unsigned(reg18));
        end
      else
        begin
          if ((((wire3[(3'h5):(3'h4)] >>> wire5) ?
              (($signed(wire6) ?
                  (wire6 ?
                      wire5 : wire11) : reg19[(3'h4):(1'h1)]) ^~ (wire4[(2'h2):(1'h0)] ?
                  wire6[(1'h0):(1'h0)] : ((8'hbb) >>> reg19))) : ({(~|wire10),
                      $signed(wire3)} ?
                  $signed((^wire4)) : (~^$signed((8'ha7))))) << ((|$signed({wire4})) <<< (reg17[(3'h5):(2'h3)] ~^ ({wire6} & (wire13 ?
              wire5 : reg18))))))
            begin
              reg14 <= reg15[(3'h5):(2'h2)];
            end
          else
            begin
              reg14 <= (wire13 && {(($signed(wire11) ^~ (~(8'hb7))) >= wire7[(2'h2):(1'h1)]),
                  reg19});
              reg15 <= ($signed(wire0) ?
                  $unsigned($signed($signed((wire6 || wire2)))) : wire11[(1'h0):(1'h0)]);
              reg16 <= ($signed(((!wire8[(3'h5):(3'h4)]) ?
                      (+{reg18}) : (wire7 ?
                          wire9[(4'hb):(3'h5)] : (+(8'hb6))))) ?
                  $signed($signed($signed((reg15 << (7'h40))))) : {(~(^(wire0 == reg19)))});
              reg17 <= reg18[(2'h3):(1'h0)];
            end
          reg18 <= (wire12[(1'h0):(1'h0)] ? (~^(wire3 * wire9)) : (!reg16));
          reg19 <= $signed(wire12);
          reg20 <= $unsigned($unsigned(wire2));
          reg21 <= ($signed($signed(wire2[(2'h2):(1'h1)])) >> (^(-$signed((reg18 >>> wire13)))));
        end
      reg22 <= wire6[(1'h0):(1'h0)];
      reg23 <= $unsigned(reg15[(1'h1):(1'h0)]);
      reg24 <= ((wire9 > $unsigned($signed((reg20 ? reg18 : reg23)))) ?
          reg19 : $signed(($signed($unsigned(reg21)) ?
              $unsigned(reg17[(1'h1):(1'h0)]) : ($signed(wire11) < (reg23 << wire7)))));
    end
  assign wire25 = reg22;
  assign wire26 = (reg16 * $signed(wire6));
  always
    @(posedge clk) begin
      reg27 <= (8'ha5);
      reg28 <= $signed($signed(wire7));
      if (reg17[(3'h4):(1'h1)])
        begin
          if (((($signed($signed(wire6)) != {$unsigned(wire2)}) & $signed(reg19)) >>> wire25))
            begin
              reg29 <= $unsigned($unsigned(reg23));
              reg30 <= (wire9[(5'h10):(3'h6)] ?
                  ($signed($signed($unsigned(reg19))) ?
                      reg15[(2'h3):(1'h1)] : (($signed(wire4) || (wire10 ?
                          (7'h44) : reg15)) > (^$unsigned(reg16)))) : (wire3 != (!reg14)));
              reg31 <= ((~|$signed(reg24[(1'h1):(1'h0)])) >>> reg15[(2'h3):(2'h2)]);
              reg32 <= $unsigned((({{wire10}} < (8'ha9)) >= (wire1[(4'h8):(3'h7)] - $signed((reg24 <= (8'ha2))))));
            end
          else
            begin
              reg29 <= (($unsigned($signed((reg31 ? wire7 : wire25))) ?
                  (~$unsigned(reg17[(2'h3):(2'h2)])) : ((reg16[(1'h1):(1'h0)] << $signed(wire1)) ?
                      wire6 : wire9)) >> (7'h41));
              reg30 <= ((~&(((^(8'ha2)) ? reg32 : (reg19 ? (8'hbb) : reg21)) ?
                      $unsigned((wire25 ?
                          wire7 : reg31)) : reg31[(1'h1):(1'h1)])) ?
                  $signed((~|($unsigned(wire0) & reg15))) : (8'hb1));
              reg31 <= wire25;
            end
          reg33 <= wire10;
        end
      else
        begin
          reg29 <= $signed(($unsigned(reg22) ?
              (~$unsigned(reg31)) : (wire7 ?
                  $unsigned($unsigned(wire26)) : wire2[(4'ha):(4'ha)])));
          reg30 <= reg33;
          reg31 <= wire8;
        end
      reg34 <= reg14[(4'hf):(3'h5)];
      reg35 <= $signed(reg33[(4'ha):(3'h5)]);
    end
  assign wire36 = (~^(reg31 ?
                      (~((reg33 ? reg16 : reg14) ?
                          (~reg15) : (~^reg20))) : (((~wire7) ?
                          $signed(reg23) : wire0[(3'h7):(1'h0)]) ~^ reg32[(5'h13):(5'h11)])));
  assign wire37 = wire8;
  assign wire38 = (reg22[(4'h9):(4'h9)] <= (-$signed($unsigned($unsigned(reg24)))));
  assign wire39 = $signed($signed($unsigned($signed(reg17[(2'h2):(2'h2)]))));
  assign wire40 = $unsigned(((8'ha8) ^~ $signed((reg18 >> reg15))));
  assign wire41 = (-wire3[(4'ha):(1'h0)]);
  assign wire42 = $unsigned(((8'ha6) ?
                      $unsigned($signed($unsigned(reg18))) : $unsigned((^~{reg31,
                          wire10}))));
  assign wire43 = $signed({wire7[(4'h9):(4'h8)]});
  assign wire44 = (((~&$signed((&reg35))) ~^ (^~(|reg19))) ?
                      (reg16[(2'h2):(1'h1)] ^ $unsigned(($signed(wire6) ?
                          $unsigned(wire10) : (|(8'hbf))))) : (~^wire43));
endmodule

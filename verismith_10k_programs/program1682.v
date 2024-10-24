module top
#(parameter param54 = ({((((8'ha5) >= (8'haa)) ? ((8'ha3) == (8'ha8)) : (!(8'hbf))) ? (((8'ha3) | (7'h43)) ? {(8'hb7)} : {(8'hbb)}) : ((|(8'hb6)) | {(7'h40)}))} ? ((8'ha0) ? (~(8'ha5)) : (!(((8'hab) >>> (8'hb1)) ? ((7'h40) ? (8'hb2) : (8'haa)) : (~(8'h9d))))) : (8'h9d)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire50;
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire4,
                 wire9,
                 wire10,
                 wire12,
                 wire50,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire1 >> (-(((wire3 ? wire3 : wire3) ?
                         wire1[(3'h5):(2'h2)] : wire0[(2'h2):(1'h1)]) ?
                     $signed($unsigned(wire1)) : wire1)));
  always
    @(posedge clk) begin
      reg5 <= wire4;
      reg6 <= wire0[(5'h11):(2'h3)];
      reg7 <= $signed(($signed(((!wire4) && reg5)) ?
          $unsigned((&{wire4, reg6})) : $unsigned((((8'hbe) || reg5) ^~ {wire0,
              wire3}))));
      reg8 <= {{$unsigned(reg6[(3'h5):(3'h4)])}};
    end
  assign wire9 = wire3[(2'h3):(1'h1)];
  assign wire10 = ((reg7[(2'h2):(1'h0)] < (wire3 * reg7)) & $unsigned({{((8'hbd) & reg7),
                          $unsigned(reg8)},
                      (reg8 || (reg7 | wire3))}));
  always
    @(posedge clk) begin
      reg11 <= {wire9[(4'hb):(3'h7)]};
    end
  assign wire12 = {(~^$unsigned(($signed(reg8) || $unsigned(reg8))))};
  always
    @(posedge clk) begin
      reg13 <= wire3[(3'h6):(1'h1)];
      reg14 <= (wire10[(3'h4):(3'h4)] ^ (~(-{wire3[(1'h1):(1'h0)]})));
      reg15 <= {wire2[(2'h2):(1'h0)]};
      reg16 <= reg13[(2'h2):(2'h2)];
      if (reg6[(4'h9):(4'h9)])
        begin
          reg17 <= $unsigned(reg15);
          if ($signed({(wire2 >> $signed(wire4[(2'h3):(2'h3)]))}))
            begin
              reg18 <= (~|(+((((8'h9f) ?
                  wire2 : reg5) - (~&wire2)) >= (+wire1))));
              reg19 <= {reg14};
              reg20 <= ((($unsigned((reg7 != reg17)) ?
                  (~^reg8[(2'h3):(1'h0)]) : {(reg18 ?
                          wire4 : (8'hbd))}) == ($unsigned((reg17 ?
                  wire1 : wire10)) & $signed((~|wire1)))) > {(reg7[(1'h1):(1'h0)] ?
                      wire12 : ((reg18 >> reg6) <<< (reg18 ? reg7 : reg18))),
                  reg7});
              reg21 <= $signed($unsigned(($unsigned($signed(reg11)) ?
                  (+$unsigned(wire2)) : (+wire1))));
            end
          else
            begin
              reg18 <= $signed({reg21, wire2[(1'h1):(1'h0)]});
            end
        end
      else
        begin
          reg17 <= ((reg17 > reg18[(5'h11):(4'hc)]) ?
              {$unsigned((!reg16)),
                  {(wire10 > wire1)}} : (|{$signed((~wire10))}));
        end
    end
  module22 #() modinst51 (.wire26(reg20), .wire25(wire0), .wire27(reg7), .wire24(reg11), .wire23(reg21), .y(wire50), .clk(clk));
  assign wire52 = $unsigned(reg6);
  assign wire53 = (((((reg18 ? wire1 : wire12) ?
                          reg5 : reg5[(3'h7):(3'h4)]) & wire52) & ({wire2,
                              {reg21, wire2}} ?
                          wire2[(2'h2):(1'h0)] : reg20)) ?
                      ((~($signed(wire9) >> (wire9 ? reg13 : (8'ha0)))) ?
                          (((!reg7) > $signed((8'hbb))) << (~|wire3[(3'h4):(2'h2)])) : wire1) : (reg7[(5'h10):(1'h0)] ?
                          (^~((!reg19) ?
                              reg7[(5'h10):(2'h2)] : (reg8 == wire2))) : wire3[(3'h7):(3'h6)]));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire27;
  input wire signed [(3'h6):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  assign y = {wire49,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg48,
                 reg47,
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
                 (1'h0)};
  assign wire28 = $signed(wire23[(4'hf):(3'h6)]);
  assign wire29 = (~((~{wire27, $signed(wire28)}) != wire27[(4'hf):(2'h3)]));
  assign wire30 = (8'hac);
  assign wire31 = $unsigned(((~&((wire25 ? wire28 : wire27) | wire23)) ?
                      (8'hb4) : $signed({wire24[(5'h13):(1'h1)],
                          (wire23 >>> wire25)})));
  always
    @(posedge clk) begin
      if ((|wire30))
        begin
          reg32 <= (-($unsigned(wire27) ?
              wire27 : $unsigned($unsigned(wire24))));
          if (((|wire28) || (|(8'hb7))))
            begin
              reg33 <= reg32[(4'h9):(3'h5)];
              reg34 <= ($unsigned((8'hbb)) ?
                  $unsigned(((wire29[(3'h6):(3'h6)] ^~ wire25) <<< $unsigned($signed(wire29)))) : wire23[(5'h12):(1'h1)]);
            end
          else
            begin
              reg33 <= wire24[(4'hb):(1'h0)];
              reg34 <= wire30;
              reg35 <= reg33[(2'h2):(1'h0)];
            end
          if (reg33[(1'h1):(1'h1)])
            begin
              reg36 <= (wire24[(5'h14):(5'h12)] - ((reg33 | ((wire29 == reg32) ?
                  wire28[(3'h4):(2'h3)] : (wire25 - reg32))) >> (-(reg32 ^ (wire23 | (8'ha8))))));
              reg37 <= reg36;
              reg38 <= wire26[(1'h1):(1'h0)];
              reg39 <= $signed(($signed((~&$unsigned(wire23))) && $unsigned(((reg34 - wire23) ?
                  (wire26 ? wire26 : (8'ha8)) : ((8'ha6) << reg32)))));
            end
          else
            begin
              reg36 <= $signed(wire27);
            end
          reg40 <= $unsigned(reg38[(2'h3):(2'h3)]);
        end
      else
        begin
          reg32 <= $unsigned((~^{(!(reg39 ? reg35 : wire27))}));
          reg33 <= {$signed(reg37[(4'h8):(3'h4)]),
              ($unsigned(wire24[(4'hb):(2'h3)]) ?
                  {wire26, wire26[(3'h4):(2'h3)]} : $signed((~reg39)))};
          reg34 <= reg38;
          reg35 <= (&($signed({(reg35 ? reg33 : wire26), reg32}) ?
              ({$unsigned(reg33), wire25[(4'h9):(1'h0)]} ?
                  (wire25 > {wire24}) : reg33) : $unsigned(($signed((8'hba)) || (wire24 << wire29)))));
        end
      reg41 <= $signed($unsigned($unsigned(({(8'hbc)} ?
          reg39[(5'h13):(5'h11)] : (|reg32)))));
    end
  assign wire42 = wire30;
  assign wire43 = reg38;
  assign wire44 = wire28[(1'h1):(1'h0)];
  assign wire45 = reg38[(1'h0):(1'h0)];
  assign wire46 = wire44;
  always
    @(posedge clk) begin
      reg47 <= $unsigned((!({(reg36 ? wire46 : wire29)} ^ {(+wire44),
          (wire26 ? wire44 : (8'h9c))})));
      reg48 <= (~^reg47[(2'h2):(2'h2)]);
    end
  assign wire49 = {($unsigned($signed((reg40 ^ wire30))) | reg39[(3'h7):(3'h5)])};
endmodule

module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire32,
                 wire31,
                 wire30,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg8,
                 (1'h0)};
  assign wire5 = $signed((wire2 + (wire1 ?
                     ($signed((8'hb3)) ?
                         (8'hbd) : $unsigned(wire1)) : $unsigned($signed(wire3)))));
  assign wire6 = {(|(($signed(wire3) < (~&wire5)) ?
                         $unsigned(wire1[(4'hc):(1'h0)]) : wire2[(4'h8):(3'h7)]))};
  assign wire7 = wire2;
  always
    @(posedge clk) begin
      reg8 <= $signed(wire4[(4'ha):(3'h6)]);
    end
  assign wire9 = $unsigned($unsigned(wire3[(3'h4):(3'h4)]));
  assign wire10 = reg8[(2'h3):(1'h0)];
  assign wire11 = (8'hae);
  assign wire12 = $signed(({(~|$signed((8'haa)))} ?
                      ((~((8'hbf) ~^ wire4)) >>> wire4[(3'h6):(2'h3)]) : {wire6,
                          wire10}));
  always
    @(posedge clk) begin
      reg13 <= ($unsigned(wire0[(3'h7):(2'h3)]) + (^~wire2));
      reg14 <= ($unsigned(wire0) == $unsigned(wire5));
      reg15 <= ((({(~^wire10), ((8'h9e) ? (8'ha5) : wire0)} ?
              ($signed(reg8) ?
                  $unsigned((8'h9f)) : (~reg8)) : $signed(((7'h44) * reg14))) || (~&(~&$signed(wire3)))) ?
          {$unsigned(((|wire6) ?
                  wire1[(5'h10):(1'h0)] : $unsigned(wire9)))} : (({(8'hb1),
                  $unsigned(reg8)} <= {wire5[(3'h6):(2'h2)]}) ?
              wire0[(2'h2):(1'h1)] : wire0));
      reg16 <= (~^($signed(((^wire1) != $signed(wire11))) ?
          wire5[(2'h2):(2'h2)] : wire2));
      if ($signed((wire6[(2'h3):(2'h2)] + reg16)))
        begin
          reg17 <= ($unsigned(({wire2[(2'h3):(1'h1)]} * (-wire2))) ^ $unsigned({{(wire6 <<< reg8),
                  $signed(reg15)}}));
          reg18 <= ((($unsigned($unsigned(reg14)) & ($unsigned(wire5) || {wire4,
              wire6})) == {(((8'hae) ?
                  wire12 : (8'ha5)) && wire7)}) ^~ $signed(reg14[(2'h3):(1'h1)]));
        end
      else
        begin
          reg17 <= $signed(wire10[(2'h2):(2'h2)]);
          reg18 <= wire5[(1'h0):(1'h0)];
          if ($unsigned((~{wire3[(1'h0):(1'h0)]})))
            begin
              reg19 <= reg13;
              reg20 <= (8'haf);
            end
          else
            begin
              reg19 <= (~^$signed($signed($signed((8'hba)))));
              reg20 <= wire10;
              reg21 <= wire3;
              reg22 <= (|(~reg16));
              reg23 <= wire11;
            end
          if ((8'hb3))
            begin
              reg24 <= $unsigned({$signed(wire1),
                  $unsigned($unsigned($unsigned(wire10)))});
            end
          else
            begin
              reg24 <= (reg14[(1'h1):(1'h0)] ? reg15 : $unsigned(wire9));
              reg25 <= reg22[(3'h5):(1'h1)];
              reg26 <= ((+(reg16 & $signed((&reg24)))) << reg19);
              reg27 <= wire12[(3'h5):(2'h3)];
              reg28 <= (~^$signed((~|$unsigned(reg13))));
            end
          reg29 <= $unsigned((8'h9e));
        end
    end
  assign wire30 = $signed($unsigned(reg13));
  assign wire31 = {$signed((reg21 && reg13[(4'h8):(3'h4)]))};
  assign wire32 = (~^($unsigned(reg22) + $signed(((wire7 == reg28) * $unsigned(wire9)))));
  always
    @(posedge clk) begin
      reg33 <= reg26[(2'h3):(1'h1)];
      if ((reg21[(3'h6):(3'h6)] ? {wire6[(5'h11):(2'h3)]} : reg18))
        begin
          reg34 <= reg23[(2'h2):(2'h2)];
          reg35 <= (wire0[(3'h4):(2'h2)] ? reg14 : (8'hb5));
        end
      else
        begin
          if (reg27)
            begin
              reg34 <= (~&((~|((~^reg25) ?
                  reg17[(1'h0):(1'h0)] : reg8[(3'h6):(2'h2)])) ^~ $unsigned((8'ha3))));
            end
          else
            begin
              reg34 <= $signed({$signed(((wire12 ? reg17 : reg24) < (wire1 ?
                      (8'haf) : (8'hb6)))),
                  $signed((^$signed(wire10)))});
              reg35 <= (((wire30[(3'h7):(3'h7)] << $unsigned((-reg17))) ?
                      $signed($unsigned((reg21 ?
                          (8'hb1) : wire3))) : ($signed((wire4 ?
                          reg16 : reg14)) + $signed($unsigned(wire1)))) ?
                  (~$unsigned($unsigned($unsigned(wire1)))) : ((~^(|$unsigned(wire32))) && {reg23,
                      (wire7[(2'h3):(2'h2)] ?
                          ((8'hbc) ? wire5 : wire30) : $signed(wire6))}));
              reg36 <= $unsigned($unsigned(wire9));
              reg37 <= $unsigned($signed((~$unsigned((wire12 <= reg18)))));
            end
          if (reg14[(1'h0):(1'h0)])
            begin
              reg38 <= (~^{((~&((8'hbf) ? reg33 : reg19)) | wire3)});
              reg39 <= $unsigned((($unsigned(reg36) ?
                      reg26[(3'h4):(1'h0)] : (-(8'h9c))) ?
                  (~reg8[(4'h9):(3'h4)]) : reg34));
              reg40 <= $signed(wire3[(1'h0):(1'h0)]);
            end
          else
            begin
              reg38 <= $signed($unsigned($signed($unsigned({reg24}))));
              reg39 <= (wire3[(2'h2):(1'h1)] ?
                  ((^(+reg36[(1'h0):(1'h0)])) ?
                      (~(-(~&reg8))) : ((^~$signed(wire9)) * {(8'ha1)})) : {$signed({(~wire12),
                          {reg21, (8'h9c)}}),
                      $signed($unsigned((~|wire0)))});
            end
          reg41 <= {(+($signed((^reg17)) == {(reg33 & wire0), (~^(8'hbb))}))};
          reg42 <= (^reg39[(4'h9):(4'h8)]);
          reg43 <= $signed($signed($signed({wire30, (7'h44)})));
        end
      reg44 <= (($signed(((&wire0) ?
          reg24 : (wire6 ? reg29 : reg23))) > (reg25[(4'he):(1'h1)] < ((wire31 ?
              (8'haf) : reg8) ?
          (reg27 > reg38) : $signed(reg17)))) ~^ reg18);
    end
  assign wire45 = reg22;
  assign wire46 = $signed({reg17});
endmodule

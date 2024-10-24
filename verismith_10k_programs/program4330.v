module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h277):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire58,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire4,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 reg38,
                 reg37,
                 reg36,
                 reg34,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (($signed(($signed(wire0) << {wire3, wire3})) ?
                     (wire0[(4'hf):(4'h9)] ?
                         ((!(8'h9f)) ?
                             $signed(wire2) : (wire0 >>> wire0)) : ((wire3 ~^ (8'hbd)) ?
                             wire2 : (wire2 ?
                                 wire2 : wire3))) : $unsigned((^~wire3[(2'h2):(2'h2)]))) ^ (+wire0));
  always
    @(posedge clk) begin
      reg5 <= (wire1[(4'h9):(4'h8)] ? wire3 : wire2[(2'h2):(1'h1)]);
      reg6 <= wire0;
      reg7 <= wire1;
      reg8 <= reg6[(4'h9):(2'h3)];
      if ($signed(({$unsigned({wire2, reg6}),
          {(^~wire4),
              wire3[(4'h9):(2'h2)]}} >>> $signed($unsigned($unsigned(wire1))))))
        begin
          reg9 <= (~^(|$signed($signed((7'h40)))));
          if ((reg7[(4'h9):(4'h9)] ?
              {$signed((((8'hb3) - wire0) ?
                      wire2[(2'h2):(1'h0)] : $unsigned(wire1))),
                  wire4} : $unsigned($unsigned(reg7[(2'h3):(1'h0)]))))
            begin
              reg10 <= ($signed((((reg5 | (8'hae)) ^ $unsigned(reg7)) == ($signed(wire1) - reg5))) ?
                  $signed((&(&reg5[(3'h4):(1'h1)]))) : reg6[(4'hc):(4'h9)]);
              reg11 <= $signed({{wire3[(4'hd):(3'h4)],
                      $signed($unsigned(reg6))}});
            end
          else
            begin
              reg10 <= $unsigned(reg11);
              reg11 <= $unsigned((wire0 ?
                  reg11[(3'h6):(3'h5)] : (^~((!(8'ha4)) ?
                      (8'ha6) : reg9[(5'h10):(1'h1)]))));
              reg12 <= ($signed({reg6}) ?
                  (~(8'hb6)) : (((((8'haa) ~^ wire1) ?
                          (reg5 & wire0) : (reg6 ?
                              reg11 : (7'h40))) > $unsigned($signed(reg9))) ?
                      wire1 : (reg9 ~^ (~&(reg5 ? wire0 : reg8)))));
            end
          if ((-(~$signed({(^~reg11)}))))
            begin
              reg13 <= reg9;
              reg14 <= (reg5[(2'h3):(2'h3)] ?
                  (wire4[(3'h6):(3'h4)] ?
                      ($signed($unsigned(reg13)) <<< wire0[(4'hb):(3'h7)]) : wire4[(4'he):(3'h4)]) : wire4);
              reg15 <= (~|(~((^(wire3 ? reg14 : wire0)) || (+{reg14, reg13}))));
              reg16 <= $signed(reg6[(4'hb):(3'h5)]);
            end
          else
            begin
              reg13 <= reg9;
              reg14 <= $signed(reg11);
              reg15 <= (wire0 ^ $signed((wire4[(4'hd):(4'hd)] ?
                  reg13[(1'h0):(1'h0)] : {reg14[(4'hc):(3'h5)]})));
              reg16 <= (^reg5);
            end
          reg17 <= {($signed((8'ha0)) ^ $signed((wire4[(4'hb):(3'h4)] ?
                  ((8'haf) ? reg6 : reg6) : reg15[(3'h4):(1'h0)])))};
          reg18 <= $signed((^$unsigned(reg8)));
        end
      else
        begin
          reg9 <= (~|wire2);
        end
    end
  always
    @(posedge clk) begin
      reg19 <= (reg8 ? reg5 : ({$unsigned(reg15[(1'h0):(1'h0)])} >>> reg11));
      if ($unsigned((&$unsigned((-reg18)))))
        begin
          reg20 <= $unsigned($unsigned($unsigned($unsigned((reg9 ?
              reg15 : wire4)))));
          reg21 <= $signed($signed($signed($signed((^~reg15)))));
          reg22 <= $signed(reg18);
          reg23 <= reg14;
          if ((({{reg20, {reg8, reg8}},
              $signed($unsigned(reg15))} < reg13[(4'h9):(3'h5)]) ^~ (7'h42)))
            begin
              reg24 <= wire2[(1'h1):(1'h0)];
              reg25 <= (reg17[(2'h2):(2'h2)] ?
                  $signed($unsigned($unsigned($signed((8'hbb))))) : reg9);
              reg26 <= reg13;
            end
          else
            begin
              reg24 <= reg6;
            end
        end
      else
        begin
          reg20 <= reg26;
          reg21 <= (wire0[(1'h1):(1'h0)] ?
              $signed(($unsigned($signed((8'ha8))) ?
                  (+{reg5}) : (~|$unsigned(reg21)))) : wire3[(3'h7):(3'h4)]);
          reg22 <= ((8'h9f) ^ (({(reg23 >= (8'ha0)),
                  {wire4, reg5}} <= ((reg7 ~^ reg10) << $unsigned(wire0))) ?
              $signed((reg16[(1'h0):(1'h0)] ?
                  reg17 : (!reg6))) : reg17[(2'h2):(1'h1)]));
          reg23 <= (reg14 != (~|$signed((reg6[(2'h3):(2'h3)] * reg10))));
        end
      reg27 <= wire0[(2'h3):(1'h0)];
    end
  assign wire28 = (8'hb3);
  assign wire29 = {(~&(-wire1))};
  assign wire30 = $signed((reg22[(3'h7):(2'h2)] ~^ ($unsigned($unsigned(wire3)) >>> reg6[(2'h2):(1'h0)])));
  assign wire31 = $unsigned($unsigned((!$signed((^reg26)))));
  assign wire32 = $signed($signed(wire2));
  assign wire33 = $unsigned(($signed((wire28[(1'h1):(1'h0)] ?
                      $unsigned(wire1) : $signed(reg7))) | $unsigned(reg25[(5'h11):(3'h6)])));
  always
    @(posedge clk) begin
      reg34 <= (&$signed((&reg6)));
    end
  assign wire35 = $signed((&$signed(reg25)));
  always
    @(posedge clk) begin
      if ($unsigned(wire29))
        begin
          reg36 <= $unsigned(reg14[(1'h0):(1'h0)]);
        end
      else
        begin
          reg36 <= $unsigned(($signed((wire4 ^~ ((8'hbb) && wire31))) ?
              $unsigned({reg9[(5'h10):(3'h7)], (7'h41)}) : (+({reg13,
                  reg14} <= (~&reg24)))));
          reg37 <= ((^(reg34[(4'hc):(2'h2)] >>> wire32[(1'h0):(1'h0)])) <= $unsigned($unsigned((!reg9))));
          reg38 <= $signed(($signed($unsigned(reg16[(4'ha):(4'h8)])) ?
              reg12 : reg14[(4'hb):(2'h2)]));
        end
      reg39 <= reg5;
      if (($unsigned((&$unsigned(reg22))) ^ ((((wire29 ^~ reg27) <= (reg27 ?
                  reg25 : reg13)) ?
              (reg6 || (~^(8'hb7))) : wire31[(2'h3):(2'h3)]) ?
          {{$signed(reg22)}} : reg18)))
        begin
          if ($signed($unsigned(((8'hb2) <<< (|(wire35 >> reg36))))))
            begin
              reg40 <= (&$signed(reg5[(3'h4):(2'h2)]));
            end
          else
            begin
              reg40 <= reg38[(1'h1):(1'h1)];
            end
          reg41 <= wire32;
        end
      else
        begin
          if ((({reg40[(3'h5):(3'h4)]} ?
                  $signed((reg20 && $unsigned(wire2))) : reg25) ?
              reg8[(1'h1):(1'h1)] : reg17[(3'h7):(1'h0)]))
            begin
              reg40 <= ((~^({$unsigned(reg11),
                  wire3[(3'h7):(3'h5)]} + reg19)) >>> (^({{wire0}} + $signed(wire1[(3'h6):(3'h6)]))));
              reg41 <= reg19[(3'h7):(3'h7)];
            end
          else
            begin
              reg40 <= $signed(wire2[(2'h2):(2'h2)]);
              reg41 <= $unsigned(wire0);
            end
        end
      if ((reg26[(1'h1):(1'h0)] ?
          ((|$signed((reg22 ? wire4 : wire2))) ?
              reg41 : reg39) : (^($signed(reg16) ?
              (~|$signed(reg15)) : reg11))))
        begin
          reg42 <= ((!reg41[(4'hc):(3'h7)]) >= reg23);
          reg43 <= reg20;
        end
      else
        begin
          if ($signed({($unsigned($unsigned(reg38)) ?
                  ($unsigned(reg21) << (reg37 ?
                      reg26 : reg10)) : (+((8'ha0) & reg19)))}))
            begin
              reg42 <= {reg7, $unsigned(reg18[(3'h4):(3'h4)])};
              reg43 <= reg43;
              reg44 <= reg9;
              reg45 <= $signed(reg26[(3'h6):(1'h1)]);
              reg46 <= $unsigned(((reg8 ?
                      reg42 : ((reg22 ?
                          (8'hb3) : reg43) * reg23[(3'h5):(1'h1)])) ?
                  wire28[(3'h5):(2'h2)] : reg16));
            end
          else
            begin
              reg42 <= reg39;
              reg43 <= wire33[(3'h6):(1'h1)];
              reg44 <= wire30;
              reg45 <= reg9;
              reg46 <= reg15;
            end
          reg47 <= ({$unsigned(wire33),
              (reg16 == wire35)} + $unsigned({((reg44 && reg34) ?
                  (reg42 == reg22) : $signed((8'ha9))),
              $unsigned((wire30 ? (8'ha1) : reg22))}));
        end
      reg48 <= $unsigned($signed(reg41));
    end
  assign wire49 = $unsigned({wire29});
  assign wire50 = ($signed((((8'ha4) ?
                          $unsigned(reg22) : reg8[(4'h9):(1'h0)]) <= ((^reg40) ?
                          wire28[(1'h1):(1'h1)] : (reg20 << (8'haf))))) ?
                      $unsigned($unsigned(((&reg13) ?
                          $signed(reg36) : (reg43 ?
                              (8'h9d) : reg9)))) : {(-$signed($unsigned(reg13))),
                          $signed({$signed(reg44)})});
  assign wire51 = (~|$signed(wire3[(3'h6):(1'h1)]));
  assign wire52 = reg5[(1'h1):(1'h0)];
  assign wire53 = $unsigned({$unsigned(((reg22 ^~ (8'hab)) >>> (~(8'ha0)))),
                      $unsigned($unsigned((^~(8'ha8))))});
  always
    @(posedge clk) begin
      reg54 <= (^~(|$signed((~reg27))));
      reg55 <= reg27;
      reg56 <= (($unsigned($signed(wire1)) <= $unsigned(wire1)) | $signed(($unsigned($signed(reg55)) ?
          ($signed(wire35) ?
              (reg14 ?
                  (8'ha1) : reg16) : reg6[(3'h6):(3'h4)]) : (-(~&reg24)))));
      reg57 <= $unsigned({(^~((reg11 ? reg26 : reg12) ~^ (-wire0)))});
    end
  assign wire58 = ((-($signed($signed(reg14)) ~^ (~|$signed(reg34)))) * $unsigned($unsigned((~&(~reg20)))));
endmodule

module top
#(parameter param49 = ((^{(+((8'hac) >>> (8'ha1)))}) > (~^{{(~|(8'ha8)), {(8'h9c), (8'hbc)}}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire32,
                 wire31,
                 wire22,
                 wire12,
                 wire6,
                 wire5,
                 wire4,
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
                 reg35,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (&wire0);
  assign wire5 = (wire1 ?
                     $unsigned($signed((+$unsigned(wire4)))) : (((wire3 ?
                         $unsigned(wire1) : {(8'hb6),
                             (8'h9f)}) != wire4[(3'h4):(2'h3)]) | {($unsigned(wire1) ?
                             (^~wire4) : (~(8'hae))),
                         $signed((wire1 ? wire0 : (8'ha4)))}));
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire1);
      if (wire1[(2'h3):(1'h1)])
        begin
          reg8 <= $signed((($unsigned((wire2 >> wire1)) ?
                  $unsigned($unsigned(wire3)) : $signed($unsigned(wire3))) ?
              ((-$unsigned(wire2)) | (&(8'hab))) : reg7[(4'hf):(4'ha)]));
          reg9 <= reg7[(4'hb):(1'h0)];
        end
      else
        begin
          reg8 <= ((wire6[(2'h2):(1'h0)] >> ({wire5,
                  {wire3, wire2}} >>> ((~|(7'h43)) > {wire1}))) ?
              ($signed(reg9[(4'hd):(1'h0)]) ?
                  $unsigned($unsigned($unsigned(wire6))) : wire6) : $signed($signed($unsigned($signed(wire3)))));
          reg9 <= $signed(reg7);
          reg10 <= (&wire2);
        end
      reg11 <= wire0[(1'h0):(1'h0)];
    end
  assign wire12 = (wire2[(2'h2):(1'h0)] ?
                      $signed($unsigned(($unsigned(wire1) << $unsigned(reg11)))) : $unsigned((($unsigned(reg10) ?
                              $unsigned(wire2) : reg9) ?
                          ({wire4, (8'hbe)} ?
                              {wire2} : (~|wire3)) : (~&(wire5 || wire5)))));
  always
    @(posedge clk) begin
      if (($unsigned(wire12[(4'h8):(3'h4)]) ?
          $signed(((&(wire4 ^ reg11)) ?
              $signed((reg10 ?
                  wire1 : (8'ha7))) : reg11[(3'h4):(3'h4)])) : (~(~wire12[(3'h4):(2'h3)]))))
        begin
          if ({(8'h9e)})
            begin
              reg13 <= (^~($signed((^~$signed(reg11))) ?
                  (~(8'hb2)) : $unsigned(((wire5 ? wire4 : wire3) ?
                      wire12[(3'h6):(3'h5)] : $unsigned(wire3)))));
              reg14 <= (8'hbf);
            end
          else
            begin
              reg13 <= $signed(reg13[(1'h1):(1'h1)]);
              reg14 <= wire4;
              reg15 <= ((~$signed(($signed(reg11) * $signed(wire2)))) * $signed((reg9[(1'h1):(1'h0)] & (-reg14[(3'h6):(3'h5)]))));
            end
          if ((~&(7'h40)))
            begin
              reg16 <= $unsigned({reg11[(4'h8):(3'h7)]});
              reg17 <= wire6;
            end
          else
            begin
              reg16 <= ((|$signed($unsigned($signed(wire5)))) || $signed($unsigned($signed((~&wire3)))));
              reg17 <= {{(wire12 >> ((-(8'h9d)) ?
                          (reg10 < reg15) : $signed(wire3))),
                      wire1[(3'h5):(2'h3)]},
                  {wire3}};
            end
          reg18 <= $signed($signed((reg8 ?
              (~^((8'haf) >= wire4)) : $signed($signed(reg8)))));
          if ($unsigned((((+wire5) ?
                  {$signed((8'hb3))} : $signed($signed(reg18))) ?
              $signed({$unsigned(wire0)}) : ($unsigned($signed(reg8)) && $unsigned((^(7'h41)))))))
            begin
              reg19 <= ($signed($signed(reg10)) ?
                  wire3[(3'h7):(2'h3)] : {reg18[(2'h2):(2'h2)], (+wire4)});
            end
          else
            begin
              reg19 <= wire0[(2'h2):(1'h0)];
              reg20 <= reg10[(4'h9):(1'h0)];
              reg21 <= {wire12, $signed((-(^(~|reg16))))};
            end
        end
      else
        begin
          reg13 <= reg7;
          reg14 <= $signed((^($signed({wire4, reg10}) <<< $signed((reg19 ?
              (7'h42) : (8'hb8))))));
          reg15 <= (8'ha0);
        end
    end
  assign wire22 = reg19;
  always
    @(posedge clk) begin
      if ((~|(+(8'ha8))))
        begin
          reg23 <= $signed(((reg10[(1'h1):(1'h1)] >>> ((wire2 ?
                      (8'h9f) : wire3) ?
                  (wire2 ? reg17 : reg8) : ((8'hbc) ? reg18 : reg7))) ?
              $signed(wire1) : ((8'h9f) ?
                  wire1 : {(reg10 ? wire2 : reg17), (reg14 ? reg19 : wire6)})));
          if (reg18)
            begin
              reg24 <= wire12[(5'h14):(4'h8)];
            end
          else
            begin
              reg24 <= reg19[(4'hb):(4'ha)];
              reg25 <= (($signed($unsigned((reg10 | wire12))) ^~ (!wire6)) + (wire0 ^~ reg20[(3'h5):(1'h1)]));
              reg26 <= (((^~wire12[(1'h1):(1'h0)]) ?
                      $signed(((~wire4) * (|reg24))) : (+$signed(reg24[(5'h13):(4'hc)]))) ?
                  $unsigned($signed($unsigned((reg16 && reg25)))) : (wire4 ?
                      reg15 : (reg17[(2'h2):(1'h0)] != ((wire0 <<< wire1) ?
                          reg16[(2'h2):(1'h1)] : reg18[(1'h0):(1'h0)]))));
            end
          reg27 <= reg24;
          reg28 <= (!{$unsigned(($signed(reg18) == reg18[(1'h0):(1'h0)])),
              ($unsigned((&reg27)) <= {reg15, (+reg27)})});
          reg29 <= reg20;
        end
      else
        begin
          if ({(-(wire1 ? {(~&reg11)} : {(+reg8)})),
              $signed({($signed(reg18) & wire5[(4'hc):(1'h1)])})})
            begin
              reg23 <= ($unsigned(($unsigned((reg24 ? reg10 : reg19)) ?
                  ((-reg29) ~^ reg10) : reg24)) * ((wire12 < reg7[(1'h1):(1'h0)]) ?
                  $unsigned(reg17) : {$signed(((8'hb4) ? reg27 : reg16))}));
              reg24 <= ((+$unsigned({(wire1 & wire3), (^reg11)})) ?
                  reg28[(2'h2):(1'h1)] : ({(8'ha3),
                      ($signed(wire2) ?
                          {(8'haf),
                              wire0} : (wire2 ^ reg26))} ^~ $unsigned($signed(reg29[(5'h10):(4'hb)]))));
            end
          else
            begin
              reg23 <= ($signed(reg19[(4'h9):(4'h9)]) ~^ wire22[(2'h3):(2'h2)]);
              reg24 <= $signed(reg17);
              reg25 <= ((^(((^reg25) > $signed(reg14)) << {{reg24}})) ?
                  reg19[(4'hb):(2'h2)] : ((+$signed($unsigned((8'hb9)))) & (reg21[(1'h1):(1'h1)] ?
                      ((reg29 ? reg15 : (8'hb5)) ?
                          $signed(reg24) : $signed(reg14)) : wire5)));
            end
          reg26 <= $signed(wire3[(4'h8):(3'h5)]);
        end
      reg30 <= ($unsigned((reg16 ?
          ({wire5, reg28} ?
              $unsigned((8'ha1)) : (wire5 ? reg26 : reg9)) : reg25)) & reg13);
    end
  assign wire31 = wire0;
  assign wire32 = (($signed($unsigned(reg8)) >= reg13) ?
                      ($unsigned(reg8[(4'he):(3'h4)]) ?
                          $unsigned((reg10[(4'h8):(4'h8)] ?
                              $signed((8'hb8)) : (!reg18))) : reg25[(1'h1):(1'h0)]) : $unsigned($unsigned((+wire5))));
  always
    @(posedge clk) begin
      if ((((~$unsigned(reg7[(2'h3):(2'h2)])) ? reg20 : wire3) ?
          $unsigned(reg20) : $signed((~&(wire2[(3'h6):(2'h2)] ?
              $unsigned(reg15) : (^reg9))))))
        begin
          reg33 <= $unsigned(($signed(({reg23,
              wire1} < wire22)) >>> (~|wire0[(1'h1):(1'h0)])));
          if (wire4[(4'h8):(3'h7)])
            begin
              reg34 <= (^(8'h9d));
            end
          else
            begin
              reg34 <= $signed({(8'ha0)});
              reg35 <= (($signed(((8'hba) ? $unsigned(reg14) : $signed(reg7))) ?
                  wire1[(3'h4):(1'h1)] : (-(wire5 > (wire5 ?
                      wire6 : wire1)))) ^ $signed(reg13[(3'h6):(3'h5)]));
              reg36 <= reg21[(3'h7):(3'h7)];
              reg37 <= $unsigned((($unsigned($signed((7'h44))) ?
                  reg7[(4'ha):(3'h5)] : wire2[(4'h8):(3'h5)]) >> (~$signed($unsigned(reg28)))));
            end
          reg38 <= (wire4[(3'h4):(3'h4)] <= (wire2 ?
              (reg13 ? (8'ha8) : reg27[(3'h4):(1'h1)]) : reg30));
          if (reg18[(1'h0):(1'h0)])
            begin
              reg39 <= $signed($signed((({reg38} == (+(8'ha7))) * $unsigned(wire4[(4'hd):(4'ha)]))));
              reg40 <= wire1;
              reg41 <= $unsigned(reg34[(4'h8):(2'h2)]);
              reg42 <= ((($signed((&wire1)) ^ (!reg28[(2'h3):(2'h3)])) ?
                      ((wire32 ? (~|wire1) : (wire3 >= reg10)) ?
                          reg27[(3'h5):(1'h1)] : reg36[(3'h4):(1'h0)]) : reg16[(3'h7):(3'h6)]) ?
                  (reg33 ? reg9 : wire3[(3'h6):(1'h0)]) : reg37);
            end
          else
            begin
              reg39 <= reg13;
              reg40 <= reg28;
            end
          reg43 <= (~|$unsigned($signed($signed(wire5[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg33 <= (reg27 ? $signed(wire12) : (reg21 || reg16[(3'h6):(3'h6)]));
          reg34 <= $unsigned({(((~(8'haf)) ? (reg20 ^~ reg16) : reg21) ?
                  (reg23 <= wire32[(4'h8):(4'h8)]) : reg42[(2'h3):(2'h3)]),
              (|{reg29})});
          reg35 <= ((8'hb8) ^~ $signed($unsigned(reg35)));
        end
      reg44 <= reg25;
      reg45 <= (($signed($signed(reg9[(3'h7):(1'h0)])) == ((~&(reg35 - reg21)) | (|reg13))) - {(+(((8'hb9) >= reg26) <= reg38[(3'h4):(2'h2)]))});
    end
  assign wire46 = ({(~&$unsigned(reg45))} == $unsigned(wire32));
  assign wire47 = $unsigned($unsigned(reg26));
  assign wire48 = (^$signed({((~|wire47) == (reg28 - wire47))}));
endmodule

module top
#(parameter param41 = {(~&(~|(-(~(8'ha9))))), (({((8'hbd) ? (8'ha3) : (8'hb3)), ((7'h40) ? (8'ha4) : (8'hb8))} & (+((8'hae) ~^ (8'ha1)))) ? ((((7'h41) ? (8'hb4) : (8'ha3)) > {(8'hb5)}) ? {((7'h42) ^~ (8'hb2)), ((8'ha9) ? (8'had) : (8'haf))} : {((8'hb2) ? (8'hbb) : (8'hae))}) : {(((8'h9f) ~^ (8'h9e)) + ((8'hac) != (7'h41)))})}, 
parameter param42 = param41)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = (8'hb4);
  assign wire5 = (7'h42);
  assign wire6 = wire3[(5'h10):(4'he)];
  assign wire7 = (7'h40);
  assign wire8 = (((((wire5 ? wire2 : (8'hae)) ?
                             ((8'hbc) ? wire3 : wire1) : (wire1 ?
                                 wire2 : wire6)) || wire4) ?
                         $unsigned(wire0[(3'h5):(1'h1)]) : wire5[(4'h8):(3'h6)]) ?
                     {wire1} : $unsigned((&wire1[(3'h4):(2'h2)])));
  assign wire9 = wire2;
  assign wire10 = {$unsigned(((~$unsigned(wire1)) ?
                          (~^{wire3, wire3}) : wire6[(1'h1):(1'h1)]))};
  assign wire11 = $unsigned((wire9[(1'h0):(1'h0)] <<< {wire1,
                      wire0[(2'h2):(2'h2)]}));
  always
    @(posedge clk) begin
      reg12 <= ($signed($signed((wire9 ?
              (wire8 ? wire1 : wire9) : $unsigned(wire3)))) ?
          wire9[(1'h1):(1'h1)] : {{(-$unsigned(wire7)), wire0[(2'h3):(1'h0)]},
              $signed({wire1, $signed((8'haf))})});
      if ($signed((wire0 <= (~^wire6))))
        begin
          if (wire0)
            begin
              reg13 <= (((~|{wire0}) + ($signed((reg12 < wire6)) ?
                  $signed(((7'h42) * wire6)) : ($unsigned(wire10) ?
                      wire10[(3'h5):(3'h5)] : ((8'hb6) && wire9)))) >> (wire4 ?
                  ($unsigned((wire5 << (8'hb5))) & ($signed(wire9) >>> wire9[(1'h1):(1'h1)])) : ((((8'hbe) && wire3) ?
                      (|wire10) : wire7[(2'h2):(1'h0)]) - ((wire6 != wire5) && $unsigned(wire9)))));
              reg14 <= ($signed({wire4[(3'h5):(3'h4)], reg12}) * (-(-reg13)));
              reg15 <= $signed($unsigned((^~wire8)));
            end
          else
            begin
              reg13 <= $signed($signed(wire9));
            end
          if (reg12)
            begin
              reg16 <= (~^{wire4[(3'h5):(1'h0)]});
              reg17 <= reg16;
              reg18 <= wire7[(3'h5):(1'h1)];
            end
          else
            begin
              reg16 <= $unsigned(reg17);
            end
        end
      else
        begin
          reg13 <= ((wire0[(4'ha):(3'h7)] ^~ (!(+(reg17 ?
              (8'had) : wire5)))) >>> ($unsigned((wire5 ?
                  $unsigned(reg14) : (~&reg17))) ?
              reg12 : wire7[(1'h0):(1'h0)]));
          if ((-wire8))
            begin
              reg14 <= (8'hbb);
              reg15 <= {wire2[(2'h2):(1'h0)],
                  $signed((wire8[(3'h4):(1'h0)] ?
                      ({(8'h9d), wire4} ?
                          (+wire8) : ((8'hbc) ?
                              reg17 : (8'hbc))) : reg18[(1'h1):(1'h1)]))};
              reg16 <= wire4[(3'h5):(2'h2)];
              reg17 <= wire7;
              reg18 <= {wire8[(1'h0):(1'h0)], reg16};
            end
          else
            begin
              reg14 <= $unsigned((~&$unsigned($signed((reg17 | (8'ha3))))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg19 <= wire3[(4'hf):(4'hc)];
      reg20 <= ($unsigned(($signed((~&wire4)) | (~&(wire3 >>> wire3)))) >>> ((reg16[(3'h4):(1'h1)] <<< {wire9,
              wire3}) ?
          $signed(wire8) : $signed($unsigned($signed(wire10)))));
    end
  always
    @(posedge clk) begin
      reg21 <= ({{($unsigned((8'haa)) ^ $unsigned(reg19))},
              $signed((wire3[(4'hc):(1'h0)] ?
                  $signed(reg15) : $signed((7'h40))))} ?
          $signed((~^(|(~&reg15)))) : wire2);
    end
  always
    @(posedge clk) begin
      if (reg20[(4'hf):(3'h6)])
        begin
          if (($unsigned((^~reg16)) ?
              (+((~|reg16[(1'h0):(1'h0)]) != {$unsigned((8'hae)),
                  reg16[(4'h8):(2'h2)]})) : (reg13[(3'h6):(1'h1)] && wire8)))
            begin
              reg22 <= $signed((reg12 >= (($unsigned(wire11) > (reg13 ?
                  wire2 : reg18)) | (reg13[(4'ha):(4'h8)] ?
                  reg18[(4'hc):(1'h1)] : $signed((8'hb6))))));
              reg23 <= ((^~(~&wire3)) ? (|wire2) : wire8);
              reg24 <= (wire8 ?
                  $signed((($unsigned(wire7) >> (reg16 ?
                      reg20 : reg20)) <<< (^~reg13[(3'h5):(2'h3)]))) : {((+(reg12 ?
                              wire0 : (8'hb6))) ?
                          $signed(((8'hac) == reg19)) : $unsigned((wire4 ?
                              (8'ha9) : reg17))),
                      $unsigned(($unsigned(wire7) ?
                          (reg13 ? reg18 : wire5) : $signed(reg14)))});
            end
          else
            begin
              reg22 <= ($unsigned((wire11[(3'h7):(3'h5)] >= {wire9,
                  {reg16, wire5}})) >= (~|(^$unsigned((~wire2)))));
              reg23 <= ($unsigned((wire1[(4'h9):(3'h7)] ?
                      $unsigned($unsigned(reg14)) : ($signed(reg17) != ((8'hae) ?
                          (8'hb5) : (8'ha8))))) ?
                  $unsigned((wire1[(1'h1):(1'h1)] + reg23)) : $unsigned(($unsigned($signed(reg23)) & {$signed(reg20),
                      (reg13 << reg12)})));
              reg24 <= {((^{reg24[(3'h4):(2'h3)]}) ?
                      reg24 : (($unsigned((8'ha8)) ?
                              (reg13 << wire6) : $signed(reg18)) ?
                          (&(&wire0)) : ((wire6 ?
                              reg15 : reg19) & $signed(reg24))))};
              reg25 <= wire8;
            end
          reg26 <= $unsigned($unsigned(wire6[(2'h2):(1'h1)]));
          if ((8'hbe))
            begin
              reg27 <= {$unsigned(((wire7[(3'h7):(3'h7)] ? reg13 : {wire9}) ?
                      ({wire6} - {(8'hb3)}) : wire2)),
                  reg19};
              reg28 <= (^~($signed($unsigned((wire5 * (8'hb7)))) ?
                  $unsigned((reg20[(3'h6):(1'h1)] && ((8'ha0) * wire6))) : $signed(wire9[(2'h2):(2'h2)])));
              reg29 <= $signed($signed((((~reg25) ~^ $unsigned((7'h41))) & (|(wire11 >> wire5)))));
              reg30 <= ($unsigned((~$unsigned(((8'ha2) ? wire5 : reg21)))) ?
                  (wire11 ? wire1 : (~^$signed((8'hb0)))) : (8'hb1));
              reg31 <= (8'haf);
            end
          else
            begin
              reg27 <= ((|reg16[(2'h3):(1'h1)]) != (reg16 == $signed($unsigned(wire3[(3'h5):(1'h0)]))));
              reg28 <= ((8'hb9) ?
                  ((($unsigned((8'h9f)) ?
                          reg23[(2'h2):(2'h2)] : reg25[(4'ha):(3'h7)]) ?
                      $signed($signed(reg18)) : (reg26[(1'h0):(1'h0)] ?
                          ((7'h44) & reg23) : reg27[(4'h8):(3'h5)])) && $signed(($signed(wire0) ?
                      $unsigned(reg30) : (~^(8'hba))))) : wire11[(3'h7):(1'h0)]);
              reg29 <= ((~^wire2) && $signed(reg13[(3'h6):(3'h5)]));
              reg30 <= reg18;
              reg31 <= $unsigned((wire9 && reg27[(4'hb):(2'h3)]));
            end
        end
      else
        begin
          reg22 <= ((($signed({wire1}) ?
                  ($signed(reg16) * ((8'hb2) ?
                      reg29 : reg15)) : $unsigned($unsigned(reg22))) ?
              (+(-(reg22 < wire1))) : (~&(+reg25[(2'h2):(2'h2)]))) != (({(8'hb9),
                  (~|wire1)} + (~&((8'hb1) ? wire4 : reg12))) ?
              reg24 : (((8'ha7) ? $unsigned(wire10) : $unsigned(reg29)) ?
                  ((reg26 >>> reg22) <<< $signed(reg21)) : $signed(wire10))));
          if ((+reg31))
            begin
              reg23 <= $signed((-($unsigned(reg29[(4'hd):(2'h3)]) ?
                  {wire5, (~^reg18)} : (!(reg16 + wire1)))));
              reg24 <= (~&((8'ha6) ?
                  ({(8'hb9)} && $signed(reg16)) : $signed($unsigned($signed(reg31)))));
              reg25 <= $signed($signed({(8'ha7)}));
              reg26 <= reg26;
              reg27 <= {(((^reg15[(1'h1):(1'h1)]) ^ $signed(reg12[(4'h9):(3'h4)])) * {reg24}),
                  wire5};
            end
          else
            begin
              reg23 <= wire5[(4'ha):(3'h7)];
              reg24 <= $unsigned(wire1);
            end
          if ($unsigned({(-{reg23[(3'h7):(2'h2)]})}))
            begin
              reg28 <= (~^wire3[(2'h2):(1'h1)]);
              reg29 <= reg15;
              reg30 <= $unsigned({(8'ha7), $signed((~|(~&(7'h44))))});
            end
          else
            begin
              reg28 <= $signed((reg24[(3'h4):(2'h3)] ?
                  $unsigned((8'hb2)) : reg27[(5'h10):(4'hb)]));
              reg29 <= {$signed(reg13),
                  {{($signed((8'ha3)) & $signed(wire1)),
                          (reg27[(4'he):(4'ha)] ?
                              {reg26, wire11} : $signed(reg28))},
                      wire7}};
            end
          if ($unsigned($unsigned(($unsigned((reg25 >= (7'h43))) != reg25))))
            begin
              reg31 <= $unsigned($unsigned($unsigned(reg19[(2'h3):(2'h3)])));
              reg32 <= $signed(wire10[(4'hc):(2'h3)]);
              reg33 <= $unsigned(((((~&reg12) >= $signed(wire3)) ?
                      $signed($unsigned(wire4)) : (reg19 || $unsigned(wire3))) ?
                  wire2 : $unsigned((~&{wire2, (8'hb5)}))));
              reg34 <= $signed(($signed($signed(reg22[(3'h5):(3'h4)])) * (($unsigned((8'hb4)) ?
                      (wire4 ? reg17 : wire10) : $signed(wire4)) ?
                  (reg13 << reg21[(4'hb):(3'h5)]) : ((-(8'hbf)) ?
                      wire1 : (reg18 ? reg22 : wire3)))));
              reg35 <= wire10;
            end
          else
            begin
              reg31 <= $unsigned(wire11);
            end
          reg36 <= (reg34 ?
              $signed(wire6[(1'h0):(1'h0)]) : (reg18[(4'he):(4'h9)] - ($signed((reg15 >> reg25)) ?
                  ((wire1 ? wire5 : reg14) ?
                      {reg27,
                          reg13} : reg29[(4'h9):(1'h1)]) : $signed(wire3))));
        end
      reg37 <= $unsigned((({$unsigned((8'hac))} | (|$signed(reg36))) ?
          reg13 : wire4));
      reg38 <= $signed((reg32 ?
          {(~|$signed(reg18)),
              $unsigned((+reg25))} : $unsigned(reg24[(3'h4):(1'h1)])));
      reg39 <= $signed(reg28);
    end
  always
    @(posedge clk) begin
      reg40 <= wire1[(3'h6):(3'h6)];
    end
endmodule

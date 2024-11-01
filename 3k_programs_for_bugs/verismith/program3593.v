module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire [(5'h13):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire11,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg10,
                 (1'h0)};
  assign wire5 = $unsigned($signed(wire3[(2'h2):(1'h0)]));
  assign wire6 = ($signed((~&$signed(wire5))) ?
                     (+(~wire4[(1'h0):(1'h0)])) : wire0[(2'h2):(1'h1)]);
  assign wire7 = (wire2 ?
                     $signed(wire0[(2'h3):(1'h1)]) : (wire3 ?
                         ({$unsigned(wire5)} ?
                             {(wire2 ? wire6 : wire0),
                                 wire5[(3'h5):(3'h5)]} : (wire4[(1'h0):(1'h0)] & (|wire2))) : (|wire4)));
  assign wire8 = $unsigned({$signed($unsigned((|(8'h9c))))});
  assign wire9 = $signed(wire5);
  always
    @(posedge clk) begin
      reg10 <= (wire9 ?
          (8'h9e) : $signed(($unsigned((^wire5)) >= (^~{wire0}))));
    end
  assign wire11 = (-wire1);
  module12 #() modinst89 (wire88, clk, wire8, wire2, wire0, wire9);
  assign wire90 = wire11[(2'h2):(2'h2)];
  assign wire91 = ({(^$signed($signed(reg10))), wire3[(4'hb):(4'h8)]} ?
                      (((~wire5[(3'h4):(2'h3)]) ?
                              (8'hbb) : $unsigned($unsigned(wire2))) ?
                          $unsigned((^~{reg10,
                              wire3})) : $signed(wire7)) : ($unsigned(wire5) <<< $signed(wire90[(4'ha):(3'h6)])));
  assign wire92 = wire8;
  assign wire93 = (^~$signed(($signed($signed(wire8)) ?
                      (reg10[(3'h6):(1'h0)] * $signed(wire8)) : (~(8'hb0)))));
  assign wire94 = ((wire92 ^~ $signed({$unsigned(wire0)})) ?
                      ($signed($signed($signed(wire3))) <= wire5) : wire9[(4'hd):(1'h0)]);
  assign wire95 = (wire90 ?
                      {((8'hac) & $signed(wire3[(3'h6):(2'h3)])),
                          ((8'h9f) ?
                              (wire92 ?
                                  $unsigned((8'haf)) : (wire94 <<< wire7)) : $unsigned($unsigned(wire4)))} : {wire11[(4'ha):(3'h6)],
                          wire6[(4'h9):(4'h9)]});
  always
    @(posedge clk) begin
      reg96 <= $signed(wire95[(2'h2):(1'h0)]);
      if ($unsigned(($signed(wire6[(1'h0):(1'h0)]) ?
          $signed(($unsigned(wire91) > (wire93 - wire9))) : wire95)))
        begin
          if (((^~(8'hb0)) < wire95[(1'h0):(1'h0)]))
            begin
              reg97 <= (~$signed((~&$signed((wire90 ? wire8 : (8'hbc))))));
              reg98 <= $signed((^~wire11));
            end
          else
            begin
              reg97 <= ((~&wire2) <= ({reg96} ?
                  (wire94[(1'h0):(1'h0)] - ((wire2 ? wire88 : wire6) ?
                      {wire93, wire91} : (wire11 >>> wire1))) : (((~|reg98) ?
                          {wire94, wire95} : {wire95}) ?
                      $signed(((8'ha4) ? reg98 : reg10)) : (!(8'hbe)))));
            end
          if (wire4[(1'h1):(1'h0)])
            begin
              reg99 <= $unsigned(({($signed(wire94) ?
                      (wire2 ?
                          wire4 : (8'haf)) : wire93[(1'h1):(1'h1)])} <= wire93[(3'h4):(3'h4)]));
              reg100 <= {(($unsigned((wire11 * wire94)) | wire92[(1'h0):(1'h0)]) ?
                      (+reg96) : $signed(wire4[(4'h8):(2'h2)]))};
              reg101 <= wire4;
            end
          else
            begin
              reg99 <= (wire95[(2'h3):(1'h1)] >= $unsigned((!(reg10 <= $unsigned(wire1)))));
              reg100 <= $signed({(8'hb7), (~wire91)});
              reg101 <= wire7;
              reg102 <= ((+reg10) >>> (reg101[(3'h6):(3'h4)] ?
                  $unsigned(wire95[(2'h3):(1'h0)]) : {(~wire8[(4'hd):(4'hb)]),
                      (wire90 ^~ $unsigned(wire11))}));
            end
          reg103 <= wire88;
          reg104 <= reg103[(3'h5):(1'h1)];
          reg105 <= ((($unsigned(reg98[(3'h6):(1'h1)]) ^~ (&(wire7 ?
                  reg104 : wire94))) ?
              $signed(((wire0 * reg10) ?
                  {wire9} : $unsigned(wire94))) : $unsigned(($signed((8'ha3)) ?
                  wire90 : $signed(wire91)))) >>> {wire95,
              reg103[(2'h3):(2'h2)]});
        end
      else
        begin
          reg97 <= $unsigned({$unsigned(({wire2} >> (wire6 ?
                  wire93 : reg104)))});
          if ($unsigned(wire6))
            begin
              reg98 <= ((8'hab) << wire0[(1'h1):(1'h1)]);
              reg99 <= wire0;
            end
          else
            begin
              reg98 <= $signed({$signed(wire3),
                  (wire88 <<< $unsigned({reg10}))});
              reg99 <= {reg100[(4'h8):(2'h2)], (&(^~reg99[(4'ha):(4'h9)]))};
              reg100 <= wire6[(4'hc):(1'h1)];
              reg101 <= wire91[(3'h6):(1'h0)];
              reg102 <= (&((((reg102 - wire92) >>> (wire5 ?
                      wire95 : reg100)) << {wire90, (~&wire8)}) ?
                  (~{reg105, reg104}) : (wire8[(3'h5):(2'h3)] ?
                      (reg101 || wire6[(1'h0):(1'h0)]) : $signed($signed(reg103)))));
            end
          reg103 <= ((-(wire88[(1'h0):(1'h0)] ^~ (|wire92))) | ((~|$unsigned(wire94)) != ($signed(wire92) - (wire91[(4'h9):(3'h5)] ?
              wire9[(5'h10):(4'h8)] : wire2))));
          reg104 <= $signed(wire94);
        end
      reg106 <= ((wire94 ?
          (8'hb7) : ($unsigned((|reg97)) ?
              $signed((~^reg10)) : reg101[(3'h5):(3'h5)])) < reg103);
    end
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire17 = $unsigned(wire14[(1'h1):(1'h0)]);
  assign wire18 = wire13[(3'h4):(1'h0)];
  assign wire19 = wire16;
  assign wire20 = wire17;
  assign wire21 = (-wire13[(4'h8):(1'h1)]);
  assign wire22 = ($unsigned($unsigned(((wire21 ?
                          wire19 : wire16) <= {wire16}))) ?
                      $signed($signed(wire19)) : $signed({(8'hbf)}));
  always
    @(posedge clk) begin
      if ($unsigned((!wire19[(1'h0):(1'h0)])))
        begin
          reg23 <= ((8'hb9) ?
              {(!$signed((wire13 ? wire20 : (8'hbf))))} : ((+wire13) ?
                  ((-(wire16 ?
                      wire16 : wire14)) < ((8'h9d) <= {wire18})) : wire14));
          if (wire15[(4'h8):(1'h1)])
            begin
              reg24 <= ((^($signed((+wire22)) ?
                      {(wire13 ? wire13 : wire21)} : wire18[(1'h0):(1'h0)])) ?
                  wire15 : (wire19[(1'h1):(1'h0)] == (wire20[(4'hb):(3'h4)] ?
                      (wire21[(2'h2):(1'h0)] != ((7'h43) ?
                          (8'ha1) : wire15)) : ((wire15 <= wire21) <<< {wire14}))));
              reg25 <= {$signed((+$unsigned({wire21})))};
              reg26 <= $signed((-(^wire16[(4'he):(4'ha)])));
            end
          else
            begin
              reg24 <= (({$unsigned($unsigned(wire17))} ?
                  (((wire15 && wire16) | (wire17 ^ wire17)) ?
                      wire22 : $unsigned((~|wire13))) : reg25) != {wire19,
                  ($unsigned($signed(wire16)) << (~&reg23))});
              reg25 <= (($signed(((-reg24) ? wire17 : (wire13 <= wire20))) ?
                      (((wire13 | wire15) ?
                          $unsigned(wire15) : $unsigned(wire19)) != (~^reg24[(4'h8):(1'h0)])) : ((~reg26[(3'h4):(3'h4)]) ?
                          ($unsigned(wire22) >>> (reg23 ^~ reg26)) : (wire22[(2'h3):(2'h3)] ?
                              wire18 : (wire22 ? wire21 : reg23)))) ?
                  $signed({(-reg24)}) : (8'hb5));
              reg26 <= (($signed(((wire15 ?
                  (8'had) : wire14) != wire18)) & ($unsigned((+wire21)) * wire19)) >> (($signed(wire20[(4'hb):(1'h1)]) ?
                  $unsigned((!wire19)) : wire18) & (-$signed(reg23))));
              reg27 <= wire19[(2'h3):(2'h3)];
              reg28 <= $signed(reg27);
            end
          reg29 <= {wire13, (+$unsigned($signed((wire16 > wire20))))};
          if (reg29[(3'h7):(3'h6)])
            begin
              reg30 <= ({$unsigned((~&(wire13 ?
                      wire21 : wire17)))} || ((wire16[(1'h0):(1'h0)] ?
                  reg23[(3'h4):(2'h3)] : (|{reg24,
                      wire19})) >>> $unsigned((~|reg25))));
              reg31 <= reg23;
            end
          else
            begin
              reg30 <= reg30[(4'h9):(2'h3)];
              reg31 <= (~^((&(~wire13[(4'he):(3'h7)])) < ({$unsigned(wire18)} ?
                  $unsigned($signed((8'hbb))) : {(reg25 < reg27)})));
              reg32 <= wire16[(3'h6):(2'h2)];
              reg33 <= $unsigned(wire17);
              reg34 <= ((reg26[(3'h5):(3'h4)] ?
                  (~&{(reg27 ?
                          wire22 : wire19)}) : $unsigned(reg24)) && (-(|((reg31 ?
                  reg28 : reg27) || $signed(reg33)))));
            end
        end
      else
        begin
          reg23 <= (+$signed(reg27[(4'h8):(2'h2)]));
          reg24 <= ({(({(8'hba), reg23} || (~|reg33)) ?
                      ((~(8'hbf)) - reg26) : $signed($signed(reg32))),
                  reg29[(2'h3):(2'h2)]} ?
              reg31 : reg28);
        end
      reg35 <= ($signed($signed($signed((~(8'h9e))))) > ({{$signed(wire16)}} || (^~{(reg23 * reg32),
          $signed(reg25)})));
      reg36 <= $unsigned((reg32 ? (8'hbf) : (8'hb6)));
      if ((wire16[(1'h1):(1'h1)] ?
          wire14 : (($signed(reg24[(3'h7):(3'h4)]) ? wire18 : $signed(reg35)) ?
              (~|$unsigned(reg30[(3'h5):(2'h3)])) : $unsigned($signed((wire17 <= reg34))))))
        begin
          if (reg30)
            begin
              reg37 <= ((reg33[(4'h8):(1'h0)] ~^ (($unsigned(reg23) ?
                          (~wire13) : (-reg28)) ?
                      reg29 : (~^(wire20 | reg25)))) ?
                  reg28[(5'h12):(3'h5)] : ($unsigned($signed((reg32 ?
                      reg31 : wire18))) != {($signed(reg36) << $signed(reg31))}));
              reg38 <= (reg35 ?
                  wire21[(3'h5):(1'h1)] : (wire20[(4'h9):(3'h4)] << reg34));
              reg39 <= wire15[(2'h3):(2'h3)];
              reg40 <= (($unsigned(reg26) ?
                      (~&$unsigned(((8'hbc) == reg24))) : (wire20[(1'h0):(1'h0)] << reg34)) ?
                  $unsigned(reg34[(1'h1):(1'h1)]) : $signed($signed($signed($signed(wire17)))));
            end
          else
            begin
              reg37 <= ((reg30[(4'hc):(4'h9)] ?
                  $unsigned(($unsigned(wire17) - (^~reg30))) : (^~((~|wire20) - (!(8'hae))))) || (~&(~&({wire17,
                      reg31} ?
                  reg34 : (~^wire17)))));
              reg38 <= (((reg39[(1'h1):(1'h1)] ^~ ($unsigned(reg37) ?
                          reg31[(4'hc):(4'hb)] : $signed(reg38))) ?
                      reg36 : (($unsigned(reg23) ^ (reg29 ~^ wire14)) & reg24)) ?
                  (~&{wire13[(3'h5):(3'h4)],
                      wire20[(4'hf):(4'hf)]}) : ($unsigned((7'h41)) >>> (!reg39)));
              reg39 <= {reg39};
            end
          reg41 <= reg33;
          reg42 <= $signed((~^(8'h9c)));
          reg43 <= $unsigned((+($unsigned($unsigned(reg30)) > $signed(reg36[(2'h3):(2'h2)]))));
        end
      else
        begin
          reg37 <= $signed($unsigned(reg26[(4'h8):(2'h3)]));
          reg38 <= (8'hab);
        end
    end
  module44 #() modinst86 (wire85, clk, reg30, reg42, reg25, reg33, reg24);
  assign wire87 = $unsigned($unsigned((reg29[(4'hb):(3'h6)] & $signed((~|reg26)))));
endmodule

module module44
#(parameter param84 = {((+(+((8'hb7) >>> (8'hbd)))) ? (((~&(8'hbd)) ? (!(8'hae)) : (+(8'ha3))) ~^ (((8'hab) ? (8'hbc) : (7'h42)) && ((8'hbe) * (8'hba)))) : ((((8'h9c) ? (8'hb4) : (8'hb7)) ? ((8'ha4) ? (7'h43) : (8'hbd)) : ((8'hab) < (8'h9f))) ? (&(~(7'h41))) : ((~(8'ha5)) != (|(7'h41))))), (~^((&(^~(8'hb5))) ? (((8'ha5) ? (8'hbd) : (8'ha6)) ? ((8'h9d) * (8'h9c)) : (^(7'h40))) : ((-(8'hb3)) <<< ((8'ha9) ? (8'ha0) : (8'hba)))))})
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire49;
  input wire [(3'h7):(1'h0)] wire48;
  input wire [(4'hc):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  input wire signed [(3'h4):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire57,
                 wire56,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg55,
                 (1'h0)};
  assign wire50 = wire48;
  assign wire51 = ($unsigned($unsigned(((~|wire47) ?
                      wire45 : $signed(wire47)))) ~^ (wire50[(4'h8):(1'h0)] | $unsigned(($unsigned(wire49) * $signed(wire45)))));
  assign wire52 = {wire49};
  assign wire53 = $unsigned((wire52[(5'h14):(4'hb)] ?
                      wire47[(2'h3):(2'h2)] : $signed($signed($signed(wire45)))));
  assign wire54 = wire50;
  always
    @(posedge clk) begin
      reg55 <= $unsigned($signed(wire45[(1'h0):(1'h0)]));
    end
  assign wire56 = wire54[(5'h10):(4'hd)];
  assign wire57 = wire54[(4'hd):(4'ha)];
  always
    @(posedge clk) begin
      if (($unsigned((($unsigned(wire48) ? wire50 : $unsigned(wire53)) ?
          (~wire52) : $signed({wire48, wire53}))) >= wire51))
        begin
          reg58 <= (|$signed({{{wire52}, wire46},
              ((8'had) ? (reg55 | wire45) : (~|wire54))}));
          reg59 <= wire49[(3'h6):(1'h0)];
          reg60 <= (((~|wire52) >> (+(8'hb7))) >= reg59[(1'h1):(1'h1)]);
          reg61 <= (((~^(|reg59[(3'h7):(1'h0)])) ?
                  wire45[(2'h2):(1'h0)] : $signed((~&wire50))) ?
              $signed($unsigned(((wire49 ?
                  wire54 : reg60) >> {wire57}))) : ({$signed($signed(reg60))} >= $unsigned(((reg55 ?
                      (8'hbf) : wire56) ?
                  (wire48 ? wire47 : (8'hae)) : (wire51 || wire53)))));
        end
      else
        begin
          reg58 <= wire47;
          if ({(wire47[(2'h3):(1'h1)] ?
                  ($signed((^(8'h9e))) ?
                      wire57 : wire54[(5'h13):(5'h12)]) : (+($signed((8'haa)) ?
                      (~|wire56) : wire45)))})
            begin
              reg59 <= ((wire45 ?
                  ({(~|reg61)} ?
                      {(wire53 < (8'hbd)),
                          $signed(wire48)} : ($unsigned(reg55) | reg60)) : (8'ha9)) & ((wire57[(1'h0):(1'h0)] ?
                      ($unsigned((8'ha5)) ?
                          $unsigned(wire46) : (wire57 ?
                              wire54 : reg58)) : ($signed(wire56) ?
                          reg59 : $unsigned(wire45))) ?
                  {wire47} : $unsigned((((8'haf) ?
                      reg55 : wire48) & $unsigned(reg60)))));
              reg60 <= (|(($unsigned((~(7'h43))) ?
                      (((8'ha0) >> wire46) - (wire52 && wire50)) : reg60[(1'h0):(1'h0)]) ?
                  wire48[(3'h7):(1'h1)] : wire54));
            end
          else
            begin
              reg59 <= reg59[(3'h5):(2'h2)];
            end
          reg61 <= $unsigned($unsigned((~$unsigned($signed((8'hac))))));
          if ($unsigned($unsigned((^wire49[(1'h1):(1'h0)]))))
            begin
              reg62 <= (8'hbf);
            end
          else
            begin
              reg62 <= ($unsigned((($signed(wire56) * wire52) >> ($signed((8'ha6)) >>> (wire54 <= wire46)))) < wire51);
              reg63 <= (^~(8'hbd));
              reg64 <= reg60[(3'h4):(1'h1)];
            end
          reg65 <= $signed(wire50);
        end
      reg66 <= (+(wire48 ? reg58 : $signed($unsigned($unsigned(reg58)))));
      if ($signed(reg64))
        begin
          reg67 <= wire56[(3'h6):(3'h6)];
          if ($signed({$signed(wire46[(4'h9):(2'h2)]), wire45}))
            begin
              reg68 <= ($signed(reg65[(3'h6):(2'h2)]) == ({(^~(wire45 < wire49)),
                  {$unsigned(reg67)}} != reg59));
              reg69 <= {wire56};
              reg70 <= $signed($unsigned(reg59[(1'h0):(1'h0)]));
              reg71 <= ($unsigned(reg58[(2'h3):(1'h0)]) ?
                  reg68 : $unsigned({(!$unsigned((8'h9c)))}));
              reg72 <= $signed((!$signed(((|wire53) >>> reg65))));
            end
          else
            begin
              reg68 <= wire49;
              reg69 <= $unsigned($signed((wire52 <= (-wire45))));
              reg70 <= $signed((-(8'h9d)));
            end
          reg73 <= reg58;
        end
      else
        begin
          if (((wire54 < $signed(reg60[(2'h3):(1'h0)])) << wire52[(3'h4):(2'h3)]))
            begin
              reg67 <= reg62[(3'h4):(1'h0)];
            end
          else
            begin
              reg67 <= ((($signed((reg65 ?
                      wire54 : wire51)) == (wire56[(1'h1):(1'h0)] ?
                      reg69 : $unsigned(wire47))) >= reg65) ?
                  ($unsigned($signed(((8'haa) - reg58))) ~^ wire57) : {wire53[(4'ha):(3'h5)],
                      wire46});
              reg68 <= (reg69[(4'h8):(3'h4)] ?
                  reg67 : $signed((~^$signed($signed(wire57)))));
              reg69 <= (wire45 <= reg69);
            end
          if ({($unsigned((^reg59)) ?
                  ((((8'hab) >> wire47) ? $signed(reg58) : (wire56 < (8'hba))) ?
                      (!reg66) : (reg71[(2'h2):(1'h1)] || $signed(reg58))) : ({((8'ha8) ?
                              wire53 : reg55),
                          $signed(reg69)} ?
                      reg69 : (+(|reg72)))),
              reg72})
            begin
              reg70 <= ($signed((((reg68 ~^ wire51) ?
                          $signed((8'hba)) : (^~wire53)) ?
                      ((reg59 ? (8'hbf) : reg64) ?
                          (8'hbf) : {reg67, reg69}) : ((reg60 ?
                          reg64 : wire56) == (~&reg64)))) ?
                  $unsigned(reg66[(3'h6):(1'h1)]) : (({$unsigned((7'h41))} ?
                      wire57[(2'h3):(1'h0)] : wire50[(3'h7):(3'h6)]) >= $unsigned(((wire50 ?
                      reg58 : wire54) + $signed(reg55)))));
            end
          else
            begin
              reg70 <= ({($unsigned({reg69}) ? reg72 : wire48),
                  $signed((8'hbc))} <= wire45[(2'h2):(1'h1)]);
              reg71 <= (~($signed($unsigned($unsigned(reg63))) ?
                  $unsigned(reg69[(4'h8):(2'h2)]) : (~^$unsigned(reg59))));
              reg72 <= ($signed($signed((reg67[(1'h0):(1'h0)] ~^ wire47))) ?
                  ((&wire45) && (-((wire47 ? reg73 : wire52) ?
                      (reg60 ?
                          wire51 : wire57) : ((8'ha8) ^~ reg71)))) : wire50[(3'h7):(3'h7)]);
              reg73 <= (wire46 || (wire46 ?
                  $unsigned(reg62[(4'hc):(4'h9)]) : (~&$unsigned($unsigned(wire49)))));
              reg74 <= reg63;
            end
          reg75 <= ($signed({({reg65} >> $unsigned((7'h40)))}) != ($signed(($signed(reg66) ?
                  (reg71 << reg63) : $unsigned(reg58))) ?
              (^($unsigned(reg60) ?
                  (wire45 ? (8'haf) : reg65) : (wire45 ?
                      (8'hae) : reg67))) : $unsigned($unsigned($signed(reg70)))));
          reg76 <= (~(~(wire53 ?
              ({reg69, wire48} ?
                  (reg64 ? wire47 : wire51) : {reg70,
                      wire54}) : ($unsigned(wire56) ?
                  $signed(reg66) : (^reg71)))));
          reg77 <= ((~$signed(($signed(wire56) ?
                  (reg67 ? (8'hbb) : reg65) : reg72))) ?
              ((&{wire57[(1'h1):(1'h1)],
                  reg72}) || {($unsigned(wire47) == (-reg58)),
                  wire45}) : reg74[(4'hf):(3'h7)]);
        end
      reg78 <= {$signed((wire45[(2'h2):(2'h2)] ?
              $signed((reg59 ?
                  wire50 : reg74)) : (reg60[(2'h3):(2'h2)] || (8'hb8))))};
    end
  assign wire79 = $signed((wire45 ?
                      reg65 : (reg59[(3'h7):(2'h2)] && (reg72 ?
                          reg73[(4'h9):(1'h0)] : $unsigned(reg72)))));
  assign wire80 = (8'h9c);
  assign wire81 = ($signed((($signed(reg74) ? {wire80, reg69} : wire46) ?
                      reg58[(2'h2):(1'h0)] : (|{(8'ha7)}))) + reg66);
  assign wire82 = (((^wire79) ^~ {$signed($unsigned(reg67)), wire52}) - reg72);
  assign wire83 = reg59;
endmodule

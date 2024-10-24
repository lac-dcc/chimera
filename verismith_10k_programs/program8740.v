module top
#(parameter param170 = (~(((((8'hb8) & (8'hb7)) ? (|(8'hab)) : ((8'hb2) && (8'hb0))) ? {(~^(8'ha7)), (^~(8'h9d))} : ({(8'haa)} == (|(8'hbf)))) << ((8'ha5) ? (8'hb2) : (((8'hbd) ? (8'hb8) : (8'ha4)) ? ((8'hbc) << (8'hac)) : (~^(8'hb5)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire169;
  wire [(4'he):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire16;
  reg [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(3'h5):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  assign y = {wire169,
                 wire160,
                 wire158,
                 wire19,
                 wire18,
                 wire5,
                 wire16,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire5 = $signed(wire2);
  module6 #() modinst17 (.wire8(wire1), .wire7(wire0), .clk(clk), .wire11(wire5), .wire9(wire2), .y(wire16), .wire10(wire3));
  assign wire18 = (wire4 ^ wire2);
  assign wire19 = $signed(wire3);
  always
    @(posedge clk) begin
      if ($signed((!(+((7'h41) ? $signed((8'ha4)) : wire18[(2'h2):(1'h1)])))))
        begin
          reg20 <= (({wire5[(5'h12):(5'h12)]} ?
                  (~wire4) : $signed($unsigned((8'hb0)))) ?
              $unsigned($signed(wire18[(2'h2):(1'h1)])) : wire18);
          reg21 <= wire2[(4'h8):(4'h8)];
          if (($unsigned(wire16) ? $unsigned(wire19[(4'h9):(3'h6)]) : wire18))
            begin
              reg22 <= $signed($unsigned((~|(~{wire2, (8'hb0)}))));
              reg23 <= wire16;
              reg24 <= $signed(wire18);
              reg25 <= $unsigned($signed((^(reg20 ?
                  (!wire5) : $unsigned(wire18)))));
            end
          else
            begin
              reg22 <= reg25[(3'h7):(2'h2)];
              reg23 <= reg25;
              reg24 <= (reg22 != reg22[(3'h7):(1'h0)]);
              reg25 <= ({reg21,
                  (~|({wire19} <<< (reg24 ?
                      reg22 : wire4)))} <<< (~|wire2[(4'hf):(3'h4)]));
            end
          reg26 <= reg23[(3'h5):(1'h0)];
          reg27 <= (((~(~|$signed(wire2))) < $unsigned($signed(reg24))) ?
              wire18[(2'h2):(1'h0)] : {reg23[(5'h13):(3'h7)],
                  $signed($signed(wire5))});
        end
      else
        begin
          reg20 <= ((wire1 + (&$signed({reg22,
              wire1}))) ^ (!(-reg25[(5'h12):(4'ha)])));
          if ((-((({wire19} <<< reg23) <= {(reg26 ? reg21 : reg20), wire16}) ?
              $signed((^~(wire4 ? (8'h9c) : reg26))) : (((reg23 ?
                      wire0 : wire18) >>> (!wire19)) ?
                  (wire18[(1'h1):(1'h0)] ?
                      {wire5, wire3} : wire2[(4'h8):(2'h2)]) : wire1))))
            begin
              reg21 <= $signed(reg24);
            end
          else
            begin
              reg21 <= $signed($unsigned($unsigned((reg22 ?
                  (~&wire0) : (~|wire18)))));
              reg22 <= reg23[(5'h13):(5'h12)];
              reg23 <= reg25[(3'h6):(3'h5)];
            end
          reg24 <= (~($signed($signed($unsigned(wire1))) ^~ (reg23 ?
              (wire0[(4'hb):(4'h9)] != (wire19 ?
                  wire16 : (8'hb2))) : (8'ha4))));
        end
      reg28 <= ($unsigned($unsigned((wire1 ? {wire2, (8'haa)} : wire18))) ?
          ($unsigned(((wire1 ^~ reg22) ?
              $signed(wire2) : $unsigned(reg27))) << ((8'hbe) ?
              reg20 : reg25)) : ((8'ha6) ?
              $unsigned((~^(reg23 & reg22))) : wire18[(2'h2):(1'h1)]));
    end
  module29 #() modinst159 (wire158, clk, wire5, reg20, wire16, reg22);
  assign wire160 = $signed((~(~&((wire3 ?
                       reg25 : wire18) != (wire3 > wire18)))));
  always
    @(posedge clk) begin
      if (wire4[(1'h0):(1'h0)])
        begin
          if ((!(($unsigned($signed(wire16)) ?
                  ((-(8'ha5)) > $signed(wire0)) : ((reg22 == wire4) <<< {reg22})) ?
              $unsigned($signed((reg28 ?
                  reg21 : (8'hbc)))) : $signed((~$signed(reg26))))))
            begin
              reg161 <= (!wire1);
              reg162 <= {$unsigned(reg161),
                  ($signed(reg20) ?
                      (reg28[(4'ha):(4'h9)] * (^~$unsigned(wire16))) : $unsigned(reg161))};
              reg163 <= reg25;
              reg164 <= wire2;
            end
          else
            begin
              reg161 <= $unsigned(wire19);
              reg162 <= (|(((reg161 ^~ (wire5 << reg162)) ?
                      (~^(+wire2)) : (+(|reg27))) ?
                  $unsigned(({(8'ha3), reg26} ?
                      $unsigned(reg162) : $unsigned((8'hb7)))) : wire0[(3'h6):(1'h1)]));
              reg163 <= reg26[(2'h3):(1'h0)];
              reg164 <= $unsigned(wire1[(1'h0):(1'h0)]);
              reg165 <= reg24;
            end
          reg166 <= (~^$signed((+((reg23 ? reg28 : reg26) << (~reg21)))));
          reg167 <= (($unsigned(($unsigned(reg166) <= reg162)) == wire158[(4'hc):(4'ha)]) ^ reg24);
          reg168 <= reg161;
        end
      else
        begin
          if (wire18[(1'h0):(1'h0)])
            begin
              reg161 <= wire2;
              reg162 <= $signed(($signed({(reg25 ? wire1 : reg163),
                  $unsigned(wire2)}) != reg163));
            end
          else
            begin
              reg161 <= {$unsigned({wire5[(4'hd):(3'h5)]})};
              reg162 <= reg163[(3'h5):(3'h4)];
              reg163 <= ({reg26, {reg25}} ?
                  $unsigned(reg21) : $signed({(8'hbb)}));
            end
          reg164 <= (reg21[(5'h14):(1'h0)] + $signed($unsigned((wire16[(1'h1):(1'h1)] ?
              $unsigned(reg161) : (7'h41)))));
        end
    end
  assign wire169 = reg20[(4'h8):(2'h2)];
endmodule

module module29  (y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(4'hb):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire155;
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  assign y = {wire157,
                 wire42,
                 wire43,
                 wire44,
                 wire46,
                 wire72,
                 wire74,
                 wire75,
                 wire76,
                 wire79,
                 wire85,
                 wire137,
                 wire155,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg78,
                 reg77,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(wire32[(1'h0):(1'h0)]) ?
          ({{{wire32}, wire33},
              {(~^(8'ha9))}} - $signed((^~wire30))) : ($unsigned(((+wire33) && (wire33 <= wire32))) ?
              wire33 : wire32)))
        begin
          reg34 <= ($signed($unsigned((wire33[(3'h4):(2'h2)] ?
              (~&wire31) : wire33))) * wire32[(2'h3):(1'h1)]);
          if ($signed(wire33))
            begin
              reg35 <= $signed(wire33[(3'h4):(2'h2)]);
              reg36 <= ($unsigned((|$unsigned(((8'ha3) ? wire32 : reg34)))) ?
                  $unsigned($signed(($unsigned(wire33) ?
                      $unsigned(wire32) : wire33[(3'h5):(1'h1)]))) : wire32);
            end
          else
            begin
              reg35 <= (8'ha0);
            end
          reg37 <= wire33[(3'h5):(3'h5)];
        end
      else
        begin
          reg34 <= (($signed(($unsigned(wire31) ?
                  (wire33 ? wire33 : wire31) : (wire31 <= wire31))) ?
              $unsigned(reg34) : ($signed($signed((8'hb8))) < (^~$unsigned(wire33)))) <= (reg36 + wire32));
          if (reg36[(3'h4):(1'h0)])
            begin
              reg35 <= {$unsigned($unsigned($signed((wire33 ?
                      reg35 : wire30)))),
                  $unsigned((($unsigned(wire33) ?
                          (reg35 ? reg34 : reg34) : $unsigned(wire30)) ?
                      (wire31[(3'h4):(1'h1)] * wire30[(4'hc):(4'hc)]) : reg37))};
              reg36 <= {$signed(((8'hbc) ?
                      ($signed(reg35) ?
                          {wire32} : {reg36, reg35}) : (wire32[(3'h4):(2'h2)] ?
                          (reg36 | wire30) : reg34[(3'h4):(2'h2)]))),
                  ($signed({reg34}) - {$unsigned($signed(wire33))})};
              reg37 <= $signed(wire32[(2'h3):(2'h2)]);
              reg38 <= $signed(reg34);
              reg39 <= reg37[(3'h5):(2'h3)];
            end
          else
            begin
              reg35 <= ($unsigned($unsigned((8'hab))) ?
                  ((reg34[(4'h8):(3'h7)] < $unsigned({reg36,
                      reg34})) <<< (^wire31[(4'h8):(3'h6)])) : (8'hac));
              reg36 <= reg38;
              reg37 <= ((((^~(|reg36)) >>> reg35[(3'h6):(3'h5)]) ?
                      $signed($signed((reg39 ?
                          reg36 : wire30))) : $unsigned((-$signed((7'h40))))) ?
                  {(reg34 | wire31[(4'h9):(1'h1)]),
                      $unsigned((~|(reg39 ?
                          wire32 : wire33)))} : $unsigned((~^reg38)));
              reg38 <= ({reg39} ?
                  (|$unsigned($signed($unsigned((8'ha4))))) : (^~$unsigned(reg35)));
            end
          reg40 <= ((&($unsigned($signed((8'hbc))) | ($signed(wire31) == $signed(reg38)))) * reg37[(1'h0):(1'h0)]);
        end
      reg41 <= $signed($unsigned(reg36[(2'h3):(1'h1)]));
    end
  assign wire42 = ((!$unsigned((~&$signed(reg34)))) ? reg39 : wire33);
  assign wire43 = $signed(wire30);
  assign wire44 = (8'had);
  always
    @(posedge clk) begin
      reg45 <= reg38[(2'h2):(1'h0)];
    end
  assign wire46 = $signed(($unsigned(reg35[(2'h2):(1'h1)]) ?
                      {($unsigned((8'hbc)) < (reg34 ?
                              reg37 : reg39))} : reg38));
  module47 #() modinst73 (wire72, clk, reg37, wire43, wire33, wire31, wire44);
  assign wire74 = ($unsigned(($unsigned(wire43[(2'h2):(1'h1)]) ?
                      $unsigned((reg40 || wire30)) : (~|wire32[(4'hb):(4'hb)]))) | {$signed($unsigned(reg38)),
                      wire30[(4'hb):(3'h5)]});
  assign wire75 = ($unsigned(reg37) ? reg36 : (reg38 & wire44));
  assign wire76 = $unsigned((!($unsigned(wire75[(4'he):(2'h2)]) <<< reg40[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg77 <= (+reg37[(1'h1):(1'h0)]);
      reg78 <= {((reg39 == $unsigned($unsigned(wire30))) ?
              $signed(((~reg35) ?
                  (~|wire33) : (8'hab))) : (($signed(reg40) - $signed(wire32)) ?
                  wire46 : (8'hb2)))};
    end
  assign wire79 = (wire43 * reg38);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed((8'ha4)))))
        begin
          reg80 <= $signed((($signed(((8'ha7) ^ reg78)) - reg77) ^~ reg34[(2'h3):(2'h3)]));
          reg81 <= wire30;
          reg82 <= $signed((^reg39));
          reg83 <= $unsigned({$unsigned(((^reg40) ?
                  {wire72, (8'hbd)} : (wire75 * wire32)))});
        end
      else
        begin
          reg80 <= reg36;
        end
      reg84 <= (^$unsigned((-((reg80 ? reg81 : reg35) ?
          (reg82 < (8'ha1)) : reg38[(1'h1):(1'h1)]))));
    end
  assign wire85 = reg77;
  module86 #() modinst138 (wire137, clk, reg38, reg36, wire43, wire31);
  module139 #() modinst156 (.wire143(reg83), .y(wire155), .wire141(reg37), .wire142(wire137), .clk(clk), .wire140(reg81), .wire144(reg41));
  assign wire157 = (&(((^~$unsigned(reg35)) ?
                       (!(!(8'hb8))) : wire75[(3'h5):(3'h5)]) > ((8'hb7) > $signed(reg40[(4'hf):(4'h8)]))));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  assign y = {wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = ($signed((~|(8'hb4))) ?
                      $unsigned(wire8[(2'h3):(2'h2)]) : ((((wire7 ?
                          wire7 : wire9) << (wire10 >>> wire10)) ~^ {wire8[(2'h2):(1'h0)],
                          wire11}) - $signed((wire7[(2'h2):(1'h0)] ?
                          {wire8, wire10} : (&wire11)))));
  assign wire13 = (wire10[(3'h6):(2'h2)] >> $unsigned(wire8[(1'h1):(1'h1)]));
  assign wire14 = $signed($unsigned($signed(wire12[(3'h4):(1'h1)])));
  assign wire15 = ({wire11} ? $signed(wire9) : wire8);
endmodule

module module139
#(parameter param154 = ((-((!((8'hb4) | (8'ha4))) > ((^(8'ha7)) <= (^(8'hae))))) ^~ (((^((8'hac) == (8'h9f))) ? ({(7'h40)} <= (~(7'h42))) : (((8'ha5) || (8'h9d)) + (~(8'h9e)))) ? (((~(7'h41)) ? (~&(8'hb8)) : ((8'had) ? (8'hbf) : (8'h9e))) <= {((7'h43) || (8'hae))}) : ((+(~|(7'h42))) ? (&((8'hb4) * (8'ha3))) : (((8'hae) * (8'ha4)) ? ((8'h9c) ? (8'hb4) : (8'had)) : ((8'hae) ? (8'h9f) : (8'hb2)))))))
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire144;
  input wire [(4'hf):(1'h0)] wire143;
  input wire signed [(4'hd):(1'h0)] wire142;
  input wire signed [(3'h4):(1'h0)] wire141;
  input wire signed [(4'he):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire153;
  wire signed [(2'h2):(1'h0)] wire152;
  wire signed [(4'hc):(1'h0)] wire151;
  wire [(4'h8):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire146;
  wire signed [(3'h6):(1'h0)] wire145;
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 (1'h0)};
  assign wire145 = ($signed((8'hb1)) <<< $unsigned((^(&wire140[(4'h8):(1'h1)]))));
  assign wire146 = (-$unsigned($unsigned(($unsigned(wire140) ~^ (wire144 | (7'h40))))));
  assign wire147 = wire146[(4'hf):(3'h6)];
  assign wire148 = (|wire144);
  assign wire149 = wire143;
  assign wire150 = ((^$unsigned((|(~wire146)))) <= wire147[(1'h0):(1'h0)]);
  assign wire151 = wire150[(3'h6):(2'h2)];
  assign wire152 = $signed(wire151);
  assign wire153 = $unsigned($signed((^~wire150)));
endmodule

module module86
#(parameter param136 = {(((((8'hba) <= (8'hb6)) * {(7'h42)}) <<< (((8'ha7) != (8'hab)) ? ((8'hb9) <= (8'hbb)) : {(8'h9c)})) == (-(((8'hbd) > (8'hbe)) ? (8'hb1) : ((8'hb8) ? (8'hbb) : (8'h9c))))), (~&{((|(8'h9f)) >> ((8'h9c) > (8'h9e))), (((8'h9c) >>> (8'hb2)) > (~^(8'hac)))})})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h20b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire signed [(5'h12):(1'h0)] wire88;
  input wire [(5'h15):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire91;
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire91,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire91 = (~&wire90);
  always
    @(posedge clk) begin
      reg92 <= (^~$unsigned($unsigned(((wire91 ? (8'hb9) : wire88) ?
          (~|wire89) : (^wire90)))));
      if ($signed($unsigned((+$signed((wire91 >>> wire91))))))
        begin
          reg93 <= (+$signed($unsigned((((8'hbe) ? wire88 : wire91) ?
              {wire87, wire88} : ((8'hbd) != wire90)))));
        end
      else
        begin
          reg93 <= (!(^~(!reg92)));
          reg94 <= ((wire87[(5'h10):(3'h5)] ?
              wire87[(2'h2):(2'h2)] : wire91[(4'hc):(4'h9)]) >= wire88[(4'hf):(4'hd)]);
          reg95 <= (({{(reg94 ? wire87 : (8'hb9)),
                  (~|wire90)}} == wire88[(3'h4):(3'h4)]) * wire91);
          reg96 <= (|reg94[(3'h4):(1'h0)]);
        end
    end
  assign wire97 = (reg94 ?
                      {(~|(wire88[(4'hb):(1'h1)] >> (!reg93))),
                          ($signed((~^(8'ha7))) >>> $unsigned((reg96 ?
                              reg95 : reg92)))} : wire90);
  assign wire98 = reg94;
  assign wire99 = $unsigned((-$signed(reg92[(2'h3):(1'h1)])));
  assign wire100 = wire87[(5'h14):(3'h5)];
  assign wire101 = $signed(wire89[(4'ha):(3'h4)]);
  assign wire102 = $unsigned(reg95);
  always
    @(posedge clk) begin
      if ($signed($signed(($signed((wire88 > wire102)) >> wire102[(3'h7):(3'h7)]))))
        begin
          reg103 <= (((8'hbb) ?
              ($unsigned((wire99 && wire97)) >> (~^(!reg95))) : (reg93[(2'h2):(1'h1)] << wire88)) ~^ (+(8'ha4)));
          reg104 <= (8'h9c);
          reg105 <= reg93[(2'h3):(1'h0)];
          reg106 <= reg105;
        end
      else
        begin
          reg103 <= ($signed((reg104 && $unsigned(reg104[(1'h0):(1'h0)]))) ?
              wire101[(4'ha):(4'ha)] : (((((8'hb1) - reg106) == {(8'hbf),
                  reg92}) << reg92[(4'hf):(4'hf)]) ~^ ($unsigned(reg105[(1'h1):(1'h0)]) ?
                  $unsigned($unsigned(reg92)) : reg105)));
          reg104 <= reg104;
          reg105 <= $unsigned($unsigned(reg105[(3'h5):(1'h1)]));
        end
      if (reg105[(3'h4):(2'h3)])
        begin
          reg107 <= reg93[(2'h3):(1'h0)];
          if ((wire87 ?
              $unsigned(({wire98[(3'h4):(2'h3)], $unsigned(reg92)} ?
                  {$signed(reg103),
                      ((8'hb1) ?
                          (8'ha7) : (8'h9d))} : ($signed(reg96) - (+wire97)))) : $signed((^(reg103 ?
                  (wire102 << reg94) : wire101)))))
            begin
              reg108 <= $signed(wire101[(4'hd):(2'h2)]);
              reg109 <= (~$unsigned(wire89[(5'h12):(2'h3)]));
              reg110 <= $unsigned((($unsigned(wire101) >>> $unsigned($unsigned(reg92))) ?
                  wire98 : (((reg104 | reg93) || (|reg103)) <<< $unsigned(wire90[(4'h9):(4'h9)]))));
              reg111 <= {$unsigned(($unsigned((~|(8'hb5))) ?
                      reg108[(2'h3):(2'h3)] : (reg104[(1'h1):(1'h0)] ?
                          (reg108 == reg109) : reg94))),
                  $signed($unsigned(wire100))};
              reg112 <= $signed(((-(^~$signed(wire99))) ? wire99 : reg103));
            end
          else
            begin
              reg108 <= (-(({$signed(wire98)} >> (reg106 * (|reg95))) ?
                  wire89[(4'ha):(3'h7)] : $signed(reg104)));
              reg109 <= reg105;
            end
        end
      else
        begin
          reg107 <= reg106;
          reg108 <= ($unsigned(($signed($unsigned(reg109)) > wire99[(4'ha):(3'h4)])) ?
              reg106[(4'he):(3'h5)] : wire101[(3'h5):(3'h4)]);
        end
    end
  assign wire113 = $unsigned({$unsigned($signed(reg106[(5'h10):(3'h4)]))});
  assign wire114 = (&(8'hba));
  always
    @(posedge clk) begin
      reg115 <= reg104[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(wire90[(3'h4):(2'h2)]) + $unsigned($unsigned(((7'h40) ?
          wire89 : wire97))))))
        begin
          reg116 <= $unsigned($signed(reg95));
          reg117 <= $signed($unsigned(reg103));
          reg118 <= wire102[(3'h5):(1'h0)];
          reg119 <= wire101;
        end
      else
        begin
          reg116 <= reg110[(1'h1):(1'h0)];
          if (wire99[(4'h8):(3'h7)])
            begin
              reg117 <= $unsigned({$signed($signed($unsigned((8'ha7))))});
              reg118 <= ((8'hb9) <<< (reg111[(1'h1):(1'h1)] << reg106));
              reg119 <= $unsigned($signed(reg107));
              reg120 <= {$unsigned(wire113), $signed((-wire101))};
              reg121 <= reg112;
            end
          else
            begin
              reg117 <= {$signed($signed((+(|(7'h44)))))};
              reg118 <= wire98[(4'hd):(4'h9)];
            end
          reg122 <= (wire91[(3'h5):(1'h0)] != $signed((~$unsigned(reg109))));
          if ((!{reg93, reg104}))
            begin
              reg123 <= ({(($signed(reg120) ^~ reg116[(3'h6):(1'h1)]) ~^ $unsigned($unsigned(wire89))),
                  (~|(7'h43))} * {$signed({wire88[(4'h9):(3'h6)],
                      wire114[(1'h1):(1'h1)]}),
                  $signed({{reg104, wire100}, (wire101 <<< reg121)})});
              reg124 <= $unsigned(($unsigned((^~{reg116,
                  wire89})) <<< $unsigned(reg105[(3'h7):(3'h5)])));
              reg125 <= (8'hb7);
            end
          else
            begin
              reg123 <= $signed($signed($signed((-{reg109}))));
            end
        end
      if ($unsigned(reg122))
        begin
          reg126 <= reg108[(3'h4):(1'h0)];
          reg127 <= {$unsigned(reg96[(3'h6):(3'h4)])};
        end
      else
        begin
          reg126 <= $unsigned((((~^(~&wire89)) >>> (wire97 || $unsigned((8'hb8)))) ?
              (((reg120 ? wire90 : reg103) ? wire87 : $unsigned(reg124)) ?
                  $signed(reg93) : $unsigned((reg104 ^~ wire102))) : $signed($signed((wire88 ?
                  reg105 : reg110)))));
          reg127 <= (-$unsigned(({((8'hba) ? reg125 : reg125)} << wire89)));
          reg128 <= ($signed($unsigned(($unsigned(reg104) ?
                  $signed(reg108) : {reg118, reg122}))) ?
              $unsigned(($signed($signed((8'ha2))) == wire114)) : reg122);
          reg129 <= $signed(reg123[(4'hb):(3'h5)]);
        end
      if ($unsigned(reg104))
        begin
          reg130 <= ((&{wire98}) ?
              (+$unsigned($signed($signed(reg115)))) : reg126);
          reg131 <= wire97;
          reg132 <= (|$signed(reg122));
          reg133 <= {$unsigned(reg117),
              (^~(($signed((8'ha4)) ?
                  (reg108 <= reg110) : wire102[(3'h4):(3'h4)]) + (+(|reg106))))};
        end
      else
        begin
          reg130 <= {$unsigned($unsigned($signed((-reg119))))};
          if (reg112)
            begin
              reg131 <= {$unsigned((~|(((8'ha0) && wire97) ~^ wire100))),
                  ((+reg108[(3'h5):(3'h5)]) ?
                      {((+reg124) ?
                              reg119[(2'h2):(1'h1)] : $signed((8'hb7)))} : {{{reg132}}})};
              reg132 <= ((|$unsigned(reg119[(2'h3):(2'h2)])) - {reg132});
            end
          else
            begin
              reg131 <= (((+reg116[(2'h2):(1'h0)]) ?
                      reg108 : (({reg103} ?
                          (&(8'hb1)) : (reg119 ?
                              (8'ha5) : reg125)) ~^ $signed($signed(wire99)))) ?
                  reg106 : (!((reg121 ?
                      $unsigned(wire91) : reg116[(4'ha):(2'h3)]) || wire98[(4'hf):(1'h0)])));
            end
          reg133 <= wire91;
          reg134 <= $signed(($unsigned((~|$unsigned(wire91))) ?
              (!$signed($unsigned(wire102))) : (~^((reg132 * (7'h40)) ?
                  (reg125 >= wire99) : (wire88 ? reg96 : reg131)))));
        end
      reg135 <= (^$signed((wire114[(1'h1):(1'h0)] * {(wire102 + reg121)})));
    end
endmodule

module module47  (y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire52;
  input wire [(5'h14):(1'h0)] wire51;
  input wire signed [(4'hc):(1'h0)] wire50;
  input wire signed [(3'h4):(1'h0)] wire49;
  input wire signed [(4'hd):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire53;
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg54,
                 (1'h0)};
  assign wire53 = $unsigned((wire52 ?
                      {(-(wire51 ?
                              wire50 : wire49))} : $signed($unsigned({wire51,
                          wire51}))));
  always
    @(posedge clk) begin
      reg54 <= wire51;
    end
  assign wire55 = wire51[(2'h3):(1'h0)];
  assign wire56 = (~$unsigned({wire48, (wire50 ^ $signed(wire50))}));
  assign wire57 = wire51[(3'h6):(1'h0)];
  assign wire58 = wire57;
  assign wire59 = (^~reg54);
  assign wire60 = wire52;
  always
    @(posedge clk) begin
      reg61 <= (|(($unsigned(wire58) ?
          wire52 : $unsigned($signed((8'hbf)))) == $unsigned({(^wire52),
          wire56[(2'h3):(1'h0)]})));
      reg62 <= ((wire48 ? wire48[(1'h0):(1'h0)] : $unsigned(wire60)) ?
          ((($unsigned(wire49) ? $signed(wire48) : $signed(wire60)) ?
              ((+(8'hbd)) ?
                  (~wire53) : (~^wire49)) : $unsigned((|reg54))) >> wire57) : wire59[(4'ha):(2'h3)]);
      reg63 <= reg54;
      reg64 <= $signed({($unsigned($signed(wire49)) >= (wire49[(1'h1):(1'h0)] ?
              {(8'hbb)} : {wire59, wire50})),
          reg63[(2'h2):(1'h0)]});
    end
  assign wire65 = $unsigned($unsigned($unsigned((+(wire53 < wire56)))));
  assign wire66 = (~^reg64);
  assign wire67 = (8'h9e);
  assign wire68 = $unsigned($signed((+reg63[(1'h1):(1'h0)])));
  assign wire69 = ($signed((reg62 ?
                      {$unsigned(wire66)} : (+(8'ha6)))) + wire66);
  assign wire70 = $signed(((-((&wire57) ? reg64[(1'h0):(1'h0)] : {wire59})) ?
                      (reg63[(4'hc):(2'h3)] ?
                          reg64 : wire48) : (~^((wire60 ^~ (8'hb7)) ?
                          reg63 : $signed(reg61)))));
  assign wire71 = $unsigned(wire60);
endmodule

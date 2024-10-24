module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire94,
                 wire18,
                 wire17,
                 wire16,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed((wire2 ?
                     ((~^(wire1 != wire0)) >>> (~^$signed(wire1))) : (|(~^$unsigned(wire3)))));
  assign wire5 = $unsigned(((($signed(wire0) ?
                         $unsigned(wire0) : (wire0 ? wire3 : wire2)) ?
                     (~|(wire4 == wire2)) : $signed(wire0)) * (~|((wire3 ?
                         wire0 : wire3) ?
                     $signed(wire0) : wire0))));
  always
    @(posedge clk) begin
      reg6 <= ((&(!$signed((wire3 ?
          (8'hac) : wire4)))) ~^ $signed((wire5[(3'h6):(2'h2)] + ((~wire5) ^~ wire0))));
      reg7 <= wire2;
    end
  assign wire8 = (reg6 ?
                     (^$unsigned(wire4[(1'h1):(1'h0)])) : $signed(reg6[(2'h2):(1'h0)]));
  assign wire9 = (&wire8[(5'h10):(4'hf)]);
  always
    @(posedge clk) begin
      if ($unsigned((+wire3[(1'h1):(1'h0)])))
        begin
          reg10 <= ((~reg7[(4'h9):(3'h6)]) | reg7[(4'h9):(1'h0)]);
          reg11 <= (~$signed((($signed(wire0) * wire8) && (|reg10[(3'h7):(1'h1)]))));
          reg12 <= (|(($signed($signed(wire1)) < ($signed((8'hba)) ?
                  (reg6 ? wire8 : wire0) : reg6)) ?
              {reg11, wire3} : wire4[(2'h3):(1'h0)]));
          reg13 <= $unsigned($signed({(^$unsigned(wire8)), $unsigned(wire9)}));
        end
      else
        begin
          reg10 <= $unsigned($signed(($unsigned($signed(reg10)) ?
              {(-reg13)} : (~^(wire3 ^~ (8'hbb))))));
        end
      reg14 <= ($signed({($unsigned((8'hb2)) ^~ reg11)}) || reg7);
      reg15 <= (((reg6 >> reg6) ?
              ($signed((+wire8)) ?
                  $unsigned(reg10[(3'h7):(1'h0)]) : $unsigned((wire5 ?
                      reg11 : (8'ha2)))) : ($signed(wire5[(3'h5):(1'h0)]) ?
                  (~&$signed(reg7)) : $unsigned((8'ha5)))) ?
          (($unsigned(wire5[(4'h9):(3'h6)]) ^ wire4[(2'h3):(2'h2)]) ?
              (8'hb3) : $unsigned($unsigned(wire1))) : $signed(({reg14[(4'ha):(4'ha)]} ^ $unsigned((reg11 + wire8)))));
    end
  assign wire16 = (8'hb5);
  assign wire17 = $signed(((!reg13[(4'hb):(4'h9)]) ?
                      {(8'hb7),
                          (+(~^reg7))} : (($unsigned(wire2) != (reg11 || wire4)) * (((8'ha0) ?
                          reg15 : wire16) >>> $signed(wire4)))));
  assign wire18 = $unsigned(reg13);
  always
    @(posedge clk) begin
      reg19 <= $signed((wire16[(4'h9):(4'h9)] <<< $signed((reg12 < (reg12 ?
          reg15 : wire18)))));
      if (reg11[(5'h14):(5'h12)])
        begin
          reg20 <= (~|$unsigned(wire3));
          reg21 <= reg19[(4'hb):(3'h6)];
        end
      else
        begin
          if ($unsigned($signed((reg21[(3'h4):(1'h1)] & $signed(((8'ha9) >= wire4))))))
            begin
              reg20 <= (8'hb6);
              reg21 <= $unsigned($signed(wire3[(4'h8):(2'h3)]));
              reg22 <= ((-reg21) ?
                  ((reg11 >>> $signed(reg11[(5'h12):(3'h6)])) ?
                      (&(wire8 > $signed(reg19))) : reg20) : wire17[(1'h1):(1'h0)]);
              reg23 <= (reg7 ?
                  $unsigned({$signed({wire4, reg14}),
                      $signed(wire0)}) : $unsigned((~^wire1)));
              reg24 <= reg22;
            end
          else
            begin
              reg20 <= (~|($signed($signed($unsigned(reg11))) ?
                  $unsigned(wire0) : $unsigned({(reg10 ? reg6 : reg14),
                      {reg20, (8'hb0)}})));
            end
        end
      if ((^~$unsigned($unsigned({$unsigned(wire16)}))))
        begin
          reg25 <= (8'hba);
          if ($signed(reg19))
            begin
              reg26 <= $unsigned({$unsigned(({reg24, wire3} ? reg21 : {reg24})),
                  reg6});
              reg27 <= wire4[(2'h3):(1'h0)];
              reg28 <= reg12;
              reg29 <= (~&$signed((reg27[(1'h1):(1'h1)] ?
                  (~^(wire2 | reg12)) : (reg19 ?
                      $unsigned((8'ha6)) : $unsigned(wire3)))));
              reg30 <= (^($signed(wire8) ?
                  $unsigned((~^(reg23 * reg15))) : $signed($unsigned((|(8'ha6))))));
            end
          else
            begin
              reg26 <= (((!reg29[(4'ha):(2'h3)]) - (($unsigned(reg30) ?
                      ((8'ha9) ? reg6 : reg22) : (reg30 ?
                          reg30 : wire16)) & (wire17[(1'h0):(1'h0)] ?
                      $unsigned(reg13) : reg11[(4'h9):(3'h5)]))) ?
                  (~&wire4[(2'h2):(2'h2)]) : (((7'h40) != (^~(wire9 >= (8'hb1)))) ?
                      reg21 : ({(reg6 <= reg14), reg26} ?
                          {$signed(wire5)} : {wire2})));
              reg27 <= (~{reg29});
            end
          reg31 <= (+(~&($unsigned((reg27 ? reg10 : reg12)) - (+(&wire4)))));
        end
      else
        begin
          reg25 <= $unsigned((8'ha2));
          reg26 <= (wire18[(2'h2):(2'h2)] ? reg10 : $unsigned(reg26));
        end
      reg32 <= reg19;
      reg33 <= $unsigned(reg20[(2'h2):(1'h0)]);
    end
  module34 #() modinst95 (wire94, clk, reg29, reg30, wire18, wire16);
endmodule

module module34
#(parameter param92 = ((({(~&(8'hb3))} ? (|((8'hbc) ? (8'hb7) : (8'hb5))) : (((8'hb3) >> (8'haa)) << (~&(8'hae)))) || (8'h9c)) ? {{{(|(8'hbc)), {(8'hac), (8'hbe)}}, ({(8'ha9), (8'ha1)} + ((8'ha3) >> (8'hab)))}} : (^((+((8'hbd) ? (8'hbf) : (8'ha3))) - (~|(~&(8'hb6)))))), 
parameter param93 = (^~(+{((|param92) ? {param92, (8'ha5)} : (|param92)), param92})))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  input wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire51,
                 wire40,
                 wire39,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire39 = $signed((8'hb3));
  assign wire40 = (~(wire38[(4'h8):(1'h1)] <<< wire38[(3'h4):(2'h3)]));
  module41 #() modinst52 (.wire44(wire40), .wire45(wire38), .wire43(wire37), .wire42(wire36), .clk(clk), .y(wire51));
  always
    @(posedge clk) begin
      reg53 <= ($signed((($signed(wire35) ?
              wire36[(4'h8):(2'h3)] : (^~wire40)) ?
          $unsigned(wire39) : {$unsigned(wire35)})) | (wire36[(4'he):(4'hd)] && ($signed((+wire36)) ?
          ((^(8'haa)) + {wire36, wire40}) : $unsigned($signed(wire36)))));
      reg54 <= (^~$unsigned(($unsigned($signed((8'ha8))) ?
          ({wire39, wire39} >= $signed(wire39)) : ((~^wire35) >> {wire40}))));
      reg55 <= ($signed($signed($unsigned($unsigned(reg54)))) ?
          $signed(((((8'ha2) >= wire37) <= wire51) ?
              (!wire51[(1'h0):(1'h0)]) : ((|(8'hae)) > (wire40 + wire39)))) : (wire36 >>> wire37[(1'h0):(1'h0)]));
    end
  assign wire56 = $signed(reg54[(4'h8):(2'h2)]);
  assign wire57 = $signed(wire37);
  always
    @(posedge clk) begin
      if ((^$unsigned((($unsigned(reg54) && $unsigned(reg53)) ?
          ($unsigned((7'h40)) - (wire51 ?
              (7'h43) : wire35)) : $signed(wire38[(4'h8):(3'h7)])))))
        begin
          reg58 <= (&($unsigned({$signed(wire57)}) && wire51));
          if ($signed($unsigned($unsigned(({reg58, reg58} ?
              reg54[(3'h4):(1'h0)] : (wire57 < wire57))))))
            begin
              reg59 <= $signed((^wire36[(1'h0):(1'h0)]));
              reg60 <= ((wire37 ?
                  $signed($unsigned({wire37})) : reg53[(2'h2):(2'h2)]) <= reg58[(3'h7):(3'h5)]);
            end
          else
            begin
              reg59 <= $unsigned((wire36[(5'h10):(4'he)] <= wire51[(2'h3):(1'h1)]));
              reg60 <= reg54[(1'h1):(1'h1)];
            end
          reg61 <= wire38[(1'h0):(1'h0)];
          reg62 <= $signed(wire37);
          reg63 <= ((reg62[(4'ha):(4'h8)] - $unsigned(wire56[(3'h5):(3'h4)])) ?
              (~&$signed(wire35)) : (8'ha5));
        end
      else
        begin
          reg58 <= $unsigned({$signed(($unsigned(wire56) == reg54)),
              wire51[(3'h6):(3'h5)]});
          reg59 <= $signed(($unsigned($signed((reg59 + (8'hb7)))) ?
              wire38[(4'ha):(3'h5)] : wire57[(1'h1):(1'h1)]));
          if ($unsigned($signed((-{(wire35 || reg53)}))))
            begin
              reg60 <= (-reg63[(5'h10):(4'he)]);
            end
          else
            begin
              reg60 <= (reg60[(4'hf):(3'h5)] ? reg60 : reg61);
              reg61 <= reg59;
            end
          reg62 <= {reg53[(3'h4):(1'h1)]};
        end
      reg64 <= (+(wire40[(4'hb):(2'h2)] + wire57));
      reg65 <= wire57;
      reg66 <= $unsigned({(wire56[(3'h5):(1'h1)] ?
              reg54 : $signed(((8'haf) ? (8'hbf) : wire39))),
          (8'h9e)});
      if (((^~wire57[(3'h5):(3'h5)]) ? wire40 : reg58[(3'h4):(3'h4)]))
        begin
          if (reg55[(1'h1):(1'h0)])
            begin
              reg67 <= reg61[(4'h8):(3'h6)];
              reg68 <= reg67[(1'h0):(1'h0)];
              reg69 <= ((+($signed({reg65}) > (~^(-wire35)))) | $signed({{wire40,
                      $unsigned(reg66)},
                  (reg58 ? (reg54 | reg55) : wire39)}));
            end
          else
            begin
              reg67 <= $signed((~$signed(reg63)));
              reg68 <= (~^(reg68 ?
                  ($unsigned((wire35 && wire38)) > ($signed(reg55) & (reg68 * wire40))) : ($signed((reg69 ?
                          wire37 : (8'ha1))) ?
                      $unsigned(reg62) : ((~|reg62) ?
                          (reg66 >= wire39) : (reg68 ? reg61 : reg68)))));
              reg69 <= (-(~^(8'h9d)));
              reg70 <= reg54;
              reg71 <= (-$unsigned($unsigned(reg60[(2'h3):(1'h0)])));
            end
          reg72 <= $unsigned($unsigned(((wire37 ?
                  $unsigned(reg59) : $unsigned(wire38)) ?
              reg69[(2'h3):(2'h3)] : reg54)));
          reg73 <= ($signed($signed(wire57[(4'ha):(4'h9)])) ?
              reg55 : $unsigned((($unsigned((8'ha0)) != wire36) - ($signed(reg71) > reg53[(5'h14):(2'h3)]))));
          if (reg54)
            begin
              reg74 <= $signed(reg64);
              reg75 <= ((+(reg66 ? reg65[(1'h1):(1'h0)] : reg58)) & (~&{reg73,
                  ((~^reg61) ? (wire51 ? reg58 : reg61) : $signed(wire37))}));
            end
          else
            begin
              reg74 <= $unsigned(($signed((-(reg75 < reg63))) ?
                  {$signed((~&reg59))} : (~|reg75[(5'h11):(4'ha)])));
              reg75 <= $signed((reg63 ?
                  reg74 : $signed({(~reg73), {reg75, reg60}})));
              reg76 <= (!$signed($unsigned(reg63)));
            end
          if (reg65)
            begin
              reg77 <= {$unsigned(($signed(reg73) | reg67))};
            end
          else
            begin
              reg77 <= {$unsigned((^~$signed((wire35 <<< reg67)))), reg75};
            end
        end
      else
        begin
          reg67 <= (reg77 ?
              {(!((reg72 ? reg53 : reg59) <= {reg68, reg62})),
                  $signed((7'h44))} : (~$signed($signed(((8'hab) ^~ wire56)))));
          reg68 <= $unsigned(wire37[(4'hd):(1'h1)]);
          reg69 <= (reg74[(3'h7):(2'h2)] < $unsigned((reg66 ?
              ((~(8'hb6)) ?
                  {reg66} : {wire38}) : ((^reg62) ^~ reg72[(3'h7):(3'h4)]))));
        end
    end
  always
    @(posedge clk) begin
      if (reg75)
        begin
          reg78 <= (-(($unsigned(reg58[(3'h4):(1'h0)]) ?
                  $unsigned((reg69 ? reg65 : reg70)) : reg61[(2'h2):(2'h2)]) ?
              (8'ha6) : reg75));
          if ((($signed((reg70[(1'h0):(1'h0)] || $signed(reg63))) ?
              $signed($unsigned(reg68)) : $signed($signed((-(8'hb8))))) && $unsigned((((reg67 || reg59) ?
                  ((8'hbd) >> wire35) : (reg71 + reg65)) ?
              (((7'h44) ?
                  reg53 : wire56) ^ $unsigned(reg68)) : reg75[(3'h7):(3'h4)]))))
            begin
              reg79 <= reg68[(3'h4):(2'h3)];
              reg80 <= reg58;
              reg81 <= (reg69 ? reg66 : {$signed(reg62)});
            end
          else
            begin
              reg79 <= $unsigned(($signed($signed((wire39 << reg64))) ~^ ($unsigned($unsigned(wire57)) | reg62)));
              reg80 <= (^~((wire39[(4'h8):(4'h8)] ?
                  (|$signed((8'hb6))) : reg60[(4'hf):(4'hb)]) < reg62));
              reg81 <= reg54;
            end
          if ($signed((reg65 ? $signed(reg72) : (-(~wire38[(4'hc):(4'h9)])))))
            begin
              reg82 <= ((~|$unsigned(((reg58 ?
                  reg59 : reg75) - (~reg79)))) & (!(reg61 <= {$unsigned(wire36),
                  reg76})));
              reg83 <= (reg63[(3'h4):(2'h3)] ?
                  $unsigned($signed(((|reg53) << $signed(wire36)))) : ($unsigned(reg75[(4'h9):(4'h9)]) ^ (^(wire51 > ((8'hb9) ?
                      wire38 : wire39)))));
              reg84 <= (~^({$unsigned(reg64[(4'hd):(3'h5)]),
                  $unsigned({reg72, wire51})} - $signed((^(wire57 ?
                  reg75 : wire56)))));
              reg85 <= wire38;
            end
          else
            begin
              reg82 <= (~^$unsigned(wire39[(2'h3):(1'h1)]));
              reg83 <= reg61;
            end
          reg86 <= $signed($signed(wire36));
          reg87 <= wire36;
        end
      else
        begin
          if ($signed({wire57}))
            begin
              reg78 <= $unsigned(wire37);
              reg79 <= $unsigned(reg55[(1'h1):(1'h0)]);
              reg80 <= ((reg86 ?
                  $signed($signed(((8'hb5) ?
                      wire37 : reg79))) : {$unsigned(reg70)}) ^~ (!($signed(wire57[(4'hc):(3'h6)]) >= ((reg68 & (8'ha6)) ?
                  reg70[(4'h8):(4'h8)] : reg83[(5'h10):(4'hf)]))));
              reg81 <= ({($signed((^reg63)) || reg61[(3'h7):(2'h2)])} ?
                  reg83[(5'h14):(4'hf)] : (~$signed((+reg63))));
              reg82 <= reg58[(4'h8):(4'h8)];
            end
          else
            begin
              reg78 <= (|$unsigned(($signed((|wire36)) < ((~^reg53) & $unsigned(reg58)))));
              reg79 <= $unsigned({$unsigned((~^$unsigned(reg77)))});
              reg80 <= reg53[(4'hf):(4'he)];
              reg81 <= $signed((reg67[(3'h5):(3'h4)] ?
                  reg75[(4'hf):(1'h1)] : ((!(~wire35)) ?
                      reg58 : ((~^reg74) ?
                          wire56[(3'h4):(1'h1)] : {reg68, reg68}))));
              reg82 <= (+reg61[(2'h2):(1'h1)]);
            end
        end
      reg88 <= reg76;
      reg89 <= $signed({(~{reg61[(4'h8):(3'h7)], ((8'h9c) ? reg71 : (7'h42))}),
          ({(&reg55)} == ((^~(7'h41)) > (wire51 + wire51)))});
      if (reg89)
        begin
          reg90 <= (-$unsigned((reg80[(3'h7):(2'h3)] ?
              wire51 : $unsigned((reg66 != wire35)))));
        end
      else
        begin
          reg90 <= reg64;
          reg91 <= (^~((~$unsigned((reg82 ? wire37 : wire56))) - (&reg73)));
        end
    end
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  input wire [(3'h6):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  assign y = {wire50, wire49, wire48, wire47, reg46, (1'h0)};
  always
    @(posedge clk) begin
      reg46 <= wire44;
    end
  assign wire47 = $signed($signed(wire44));
  assign wire48 = $signed({wire44[(3'h7):(2'h3)]});
  assign wire49 = $unsigned(($signed({wire48[(4'h9):(3'h6)],
                      reg46[(1'h0):(1'h0)]}) >>> (wire47 || (wire48 ?
                      $unsigned(reg46) : wire43[(3'h5):(3'h4)]))));
  assign wire50 = wire49[(4'h8):(3'h7)];
endmodule

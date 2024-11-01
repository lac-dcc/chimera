module top
#(parameter param88 = {({(^~{(8'haa), (8'h9e)})} || {(!((8'h9c) - (8'ha2)))}), ({({(8'hb5), (8'had)} ? ((8'hba) ? (8'hb6) : (8'ha0)) : ((8'haa) ? (7'h41) : (8'hb0))), (((8'hb2) ? (8'hbd) : (8'ha9)) == ((8'hb5) ^~ (7'h42)))} ? (~^({(8'had)} ? (^(8'ha3)) : ((8'hb8) ? (8'hbc) : (8'hbb)))) : ((((8'ha5) ? (8'hbc) : (8'hbc)) ? ((8'hb2) ? (7'h43) : (8'hbf)) : {(8'h9c)}) <<< (~|(~^(8'hbb)))))}, 
parameter param89 = param88)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire86,
                 wire37,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire10,
                 wire5,
                 wire4,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(($unsigned((&$signed(wire0))) < $signed($unsigned((wire3 ~^ wire2)))));
  assign wire5 = wire1[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned((7'h43));
      reg7 <= $signed(wire1[(4'hc):(4'ha)]);
      reg8 <= (reg6[(4'hb):(1'h1)] >> (wire3[(1'h0):(1'h0)] | wire1));
      reg9 <= (~|$unsigned((wire3[(3'h5):(1'h1)] >> ((-wire1) + (wire3 ~^ wire2)))));
    end
  assign wire10 = ((!((wire1 ? {reg7} : $signed(reg9)) ?
                      $unsigned({reg6}) : $signed((wire4 ?
                          reg7 : wire0)))) ~^ $unsigned(($signed((wire1 ?
                          (8'h9f) : reg7)) ?
                      reg8[(1'h1):(1'h1)] : wire0)));
  always
    @(posedge clk) begin
      reg11 <= $unsigned((~^((!wire1[(4'ha):(3'h6)]) ~^ $signed($unsigned(wire4)))));
      reg12 <= wire10;
    end
  assign wire13 = ((&$signed((&(wire1 ? reg7 : reg12)))) ?
                      reg9 : (~|(wire2[(3'h6):(2'h2)] ?
                          $signed($signed(wire3)) : (~(8'hbd)))));
  assign wire14 = $signed(($unsigned(((-reg8) ?
                          reg12[(3'h6):(2'h2)] : (&(8'h9c)))) ?
                      (((wire2 ? reg11 : wire3) ? (^wire0) : (8'hb3)) ?
                          (|{reg8,
                              wire4}) : $unsigned($signed(reg7))) : ((reg12[(1'h1):(1'h0)] ?
                              ((8'h9d) ^~ wire3) : $unsigned((8'hae))) ?
                          ((reg7 ? reg6 : wire0) ?
                              (-wire4) : wire4) : $unsigned($signed(wire10)))));
  assign wire15 = $unsigned((reg12 ?
                      ({$unsigned(wire5), $signed(wire10)} ?
                          $signed({wire14,
                              wire14}) : wire10[(1'h0):(1'h0)]) : $signed((~&(^~(8'hbc))))));
  assign wire16 = wire5;
  assign wire17 = reg6;
  always
    @(posedge clk) begin
      reg18 <= reg12;
      reg19 <= reg18;
      reg20 <= reg19;
      reg21 <= reg18;
    end
  assign wire22 = reg12;
  assign wire23 = wire2[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg24 <= wire1;
      reg25 <= (((~($unsigned(reg12) ? (wire14 ? reg7 : reg7) : reg9)) ?
              {reg12} : (8'ha9)) ?
          $signed($unsigned($signed(wire17))) : $unsigned((~&reg19[(4'hc):(4'hb)])));
      reg26 <= wire2;
      reg27 <= {reg9, wire13};
      reg28 <= wire4;
    end
  always
    @(posedge clk) begin
      reg29 <= wire5;
      reg30 <= wire5[(2'h2):(1'h1)];
      if (reg11[(2'h2):(2'h2)])
        begin
          reg31 <= (!(8'ha3));
          reg32 <= $signed(((^((wire10 == reg24) <<< (~reg7))) || (8'hb3)));
        end
      else
        begin
          reg31 <= $signed(reg30[(2'h2):(1'h1)]);
          if (({(((~|reg19) <= $signed(reg30)) ?
                  $unsigned((reg20 ^ reg7)) : $signed($unsigned(reg28)))} < (8'hb7)))
            begin
              reg32 <= ($signed($signed((reg7 >= reg27[(3'h7):(3'h6)]))) ?
                  (8'h9d) : ($unsigned({$signed(wire4), reg26[(1'h0):(1'h0)]}) ?
                      (reg28[(4'h9):(3'h6)] ?
                          (8'ha1) : ({reg28, reg11} ?
                              $unsigned(wire22) : wire1)) : wire1));
              reg33 <= $signed(wire3);
              reg34 <= $unsigned(wire4);
              reg35 <= ($signed((8'hb4)) ? reg6 : (8'hb7));
              reg36 <= {(reg27 <= (~&((&reg25) ? (!wire17) : $signed(reg7))))};
            end
          else
            begin
              reg32 <= reg27[(2'h2):(2'h2)];
            end
        end
    end
  assign wire37 = ((($unsigned((^~wire0)) >= (~wire23[(3'h5):(2'h3)])) || (reg29[(4'he):(3'h6)] ?
                          (-$unsigned(reg33)) : ((&reg21) ?
                              $signed(reg33) : reg33))) ?
                      (((((8'ha4) >> (8'hae)) ?
                          wire14 : (reg9 - (8'hac))) < (^~(reg31 ?
                          (8'hb3) : (7'h43)))) ^ $signed({(-reg11),
                          reg31[(3'h4):(2'h2)]})) : $signed((&({reg6, wire14} ?
                          (wire2 ? reg11 : reg33) : $signed(wire1)))));
  module38 #() modinst87 (.y(wire86), .wire40(reg8), .wire42(reg29), .clk(clk), .wire41(wire10), .wire39(wire3));
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire42;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire [(4'h9):(1'h0)] wire40;
  input wire [(4'hf):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire43 = wire42[(1'h1):(1'h1)];
  assign wire44 = (8'ha2);
  assign wire45 = (wire41[(2'h3):(2'h3)] ? wire39 : wire39);
  assign wire46 = (wire45[(1'h1):(1'h0)] >>> ($unsigned(wire45[(2'h2):(2'h2)]) ?
                      wire40[(4'h9):(1'h0)] : $unsigned($unsigned(wire43[(3'h6):(3'h5)]))));
  always
    @(posedge clk) begin
      if (wire39)
        begin
          reg47 <= wire41;
          reg48 <= (8'hba);
          reg49 <= ($unsigned(wire42) ?
              ((-wire40) * wire42[(4'h8):(2'h2)]) : ($unsigned($signed(((8'haa) ?
                      wire41 : wire44))) ?
                  reg47[(2'h2):(1'h0)] : {$unsigned($unsigned(wire39)),
                      $unsigned(reg47)}));
          if ($unsigned(wire46))
            begin
              reg50 <= {reg49[(3'h7):(3'h7)]};
              reg51 <= ({$signed(wire42[(4'ha):(4'h8)])} ?
                  wire40[(1'h0):(1'h0)] : wire42);
              reg52 <= (($unsigned($signed($unsigned(wire44))) ^~ $unsigned({reg49[(3'h7):(3'h4)],
                      (~&(8'hb9))})) ?
                  wire41[(2'h3):(2'h3)] : ($unsigned($signed((wire41 ?
                      wire39 : reg47))) & $unsigned({wire39})));
            end
          else
            begin
              reg50 <= wire42;
              reg51 <= $signed(($signed({$signed(wire43)}) ~^ wire46[(4'hc):(4'h8)]));
              reg52 <= ($unsigned(({wire42} >> wire40[(1'h1):(1'h0)])) ?
                  $unsigned($signed(wire46)) : $signed((^~$unsigned($signed(reg51)))));
              reg53 <= $signed(wire43);
              reg54 <= (((+reg50) | $signed(((wire44 ? reg47 : (8'hb3)) ?
                      (~^(8'ha7)) : $signed(reg53)))) ?
                  reg53[(4'ha):(4'h8)] : (~&$signed((&(reg50 ?
                      wire44 : reg49)))));
            end
          reg55 <= $signed((~&(|wire44[(2'h3):(1'h0)])));
        end
      else
        begin
          reg47 <= wire43[(1'h1):(1'h1)];
        end
      reg56 <= $signed(reg51);
      if ((^~$signed(wire42)))
        begin
          reg57 <= ((reg52[(2'h2):(1'h1)] < reg53) ?
              ((reg56 && (wire40[(4'h9):(2'h3)] >= ((8'hb7) | (7'h42)))) || (8'haf)) : (^(8'ha3)));
          reg58 <= (((reg53[(1'h0):(1'h0)] ?
                  $signed(wire42[(3'h6):(2'h2)]) : (|reg49)) ~^ ({(~reg57),
                  wire39[(2'h2):(2'h2)]} != (^(8'ha1)))) ?
              ($signed(((8'ha2) != {wire41})) >>> reg57[(4'h8):(2'h2)]) : ((($signed(reg47) ?
                  {reg51, wire46} : $signed(wire40)) >= ($unsigned((8'had)) ?
                  (wire39 ? (8'hb0) : reg49) : $unsigned(reg53))) != wire42));
          reg59 <= (&reg47);
          reg60 <= $signed($signed(reg50[(4'ha):(2'h3)]));
          if ($unsigned(($signed((|wire39[(4'he):(2'h2)])) >>> $unsigned(wire39))))
            begin
              reg61 <= reg48[(3'h6):(1'h1)];
              reg62 <= $signed($unsigned(reg52));
            end
          else
            begin
              reg61 <= $signed($signed(reg55[(1'h0):(1'h0)]));
              reg62 <= (^~reg54[(2'h3):(2'h3)]);
              reg63 <= wire45;
              reg64 <= $signed((wire39[(4'hc):(4'hb)] ? (~wire41) : reg61));
              reg65 <= ($unsigned($unsigned(((8'hbd) - $signed(reg62)))) ?
                  (!{(((8'ha7) ? reg51 : wire46) ?
                          $unsigned(reg53) : (|wire41))}) : (reg63 | (8'haf)));
            end
        end
      else
        begin
          if (wire44[(2'h2):(1'h0)])
            begin
              reg57 <= reg60;
            end
          else
            begin
              reg57 <= wire39;
              reg58 <= (~|(reg52[(4'hb):(1'h1)] ?
                  (^~(reg53 - (^reg59))) : (wire44[(3'h6):(1'h0)] < reg62)));
              reg59 <= (reg60 ? (|(8'hbf)) : reg52);
              reg60 <= $signed($signed((($signed(wire43) != wire45[(3'h4):(2'h3)]) * ($signed(reg51) && (wire39 ?
                  wire40 : reg59)))));
              reg61 <= ((reg58[(1'h0):(1'h0)] ?
                      (&((!wire45) ?
                          $unsigned(reg51) : $signed(reg56))) : $unsigned($unsigned((reg51 > reg63)))) ?
                  ({$signed($unsigned(reg59))} ?
                      $signed(reg61) : $signed(reg65)) : (7'h40));
            end
          reg62 <= ($unsigned($signed(wire42[(4'ha):(2'h3)])) > $unsigned($signed((^$signed(wire40)))));
          reg63 <= {reg54,
              (($unsigned((7'h42)) << $signed($unsigned((8'hb4)))) || ((^$unsigned(reg49)) & (((8'hae) ?
                      reg50 : reg55) ?
                  {reg59, reg60} : $signed(wire45))))};
          if (reg55)
            begin
              reg64 <= reg55[(2'h2):(1'h0)];
              reg65 <= reg47[(3'h5):(1'h0)];
              reg66 <= (reg58 >> ((reg55 ?
                  $unsigned((reg50 >> (8'hab))) : $unsigned({(8'h9f),
                      wire43})) >>> $unsigned(wire42[(2'h2):(1'h0)])));
              reg67 <= (~&(!(&((wire45 << reg64) ?
                  (~|(8'hb4)) : $unsigned(reg60)))));
              reg68 <= (8'ha1);
            end
          else
            begin
              reg64 <= reg54;
              reg65 <= (8'ha7);
              reg66 <= reg52[(4'h8):(3'h5)];
              reg67 <= reg59;
              reg68 <= $unsigned($unsigned(reg60[(1'h1):(1'h0)]));
            end
        end
      reg69 <= (|$signed($signed((~^{reg50, reg51}))));
      reg70 <= $signed(reg61);
    end
  assign wire71 = (~^$signed($unsigned($unsigned($signed(reg59)))));
  assign wire72 = $unsigned(((wire46 ^ wire42[(1'h0):(1'h0)]) ?
                      $unsigned(((reg70 ? reg57 : wire71) ?
                          reg62 : (~|wire45))) : $signed(((8'h9c) | (&reg57)))));
  assign wire73 = $signed(reg68[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg74 <= $signed(reg49);
      reg75 <= (8'hba);
      if ((wire44[(3'h7):(1'h0)] ? reg59 : wire71))
        begin
          if (($signed(wire43) < {reg48,
              {((+wire44) ? $unsigned(reg48) : wire40[(2'h2):(1'h0)]),
                  {$unsigned(reg58)}}}))
            begin
              reg76 <= (~|$unsigned(((wire43[(2'h2):(1'h1)] <<< $signed(wire71)) ?
                  (+(reg53 ? reg64 : reg63)) : $unsigned((reg62 ?
                      reg75 : reg53)))));
            end
          else
            begin
              reg76 <= $unsigned($signed((~$unsigned(reg55[(2'h2):(1'h0)]))));
              reg77 <= (((reg62 & (((8'ha0) ? reg74 : reg62) ^ {reg75,
                      (8'h9e)})) && (~wire40)) ?
                  wire41[(1'h0):(1'h0)] : {(((reg62 ?
                              reg63 : reg49) > $signed(reg56)) ?
                          {(reg64 ? reg57 : reg66), (~reg61)} : (~&(!reg47)))});
              reg78 <= ($unsigned((!{(reg53 > (7'h44))})) + reg60);
            end
          if ($signed($unsigned(reg77)))
            begin
              reg79 <= wire46;
              reg80 <= ((reg51 ?
                      ($unsigned(wire41) == $signed((reg66 * reg79))) : reg60) ?
                  ((reg48 <<< $unsigned($signed(reg56))) ^ reg53[(3'h7):(1'h0)]) : wire72[(4'hd):(4'hd)]);
            end
          else
            begin
              reg79 <= (reg64 ? reg58 : $signed($signed((~(~reg52)))));
              reg80 <= reg52[(3'h4):(3'h4)];
            end
        end
      else
        begin
          reg76 <= {wire41, reg77[(2'h2):(2'h2)]};
          reg77 <= $unsigned($unsigned((wire44 || ((reg59 == wire71) + $unsigned(wire43)))));
          reg78 <= $unsigned({((((8'hb8) ? reg57 : reg55) ?
                      reg77 : (wire44 ? reg76 : reg79)) ?
                  (+reg63[(3'h4):(2'h3)]) : reg50[(3'h6):(3'h5)]),
              {(wire45 >> $signed(reg57))}});
          if ($signed($signed(((^~$signed(wire42)) ?
              ((reg53 || wire73) ?
                  reg67[(1'h1):(1'h1)] : (&reg60)) : ({wire41} ?
                  reg56 : (+wire46))))))
            begin
              reg79 <= $unsigned($unsigned((+(wire71 ?
                  (wire43 < reg63) : reg70[(3'h5):(1'h1)]))));
              reg80 <= (|reg67[(3'h5):(2'h2)]);
              reg81 <= (~^reg69);
              reg82 <= (|(!(reg56[(4'hb):(4'h9)] * (reg61 >= (|reg64)))));
              reg83 <= {$unsigned(reg60[(1'h1):(1'h0)]),
                  (reg53[(4'hf):(4'ha)] ?
                      $signed(((-reg53) ?
                          (|reg62) : $signed(wire71))) : $unsigned({(wire44 ?
                              reg58 : wire43),
                          $unsigned(reg48)}))};
            end
          else
            begin
              reg79 <= (^(wire40[(2'h2):(2'h2)] ?
                  (wire71[(1'h1):(1'h1)] - ((reg60 ? reg63 : reg78) ?
                      reg48 : {wire73, reg56})) : (&reg74)));
              reg80 <= wire43;
              reg81 <= (|(reg80 ?
                  (reg57 >>> $signed(((8'hb1) || reg60))) : ($signed($signed(wire45)) << wire40)));
            end
          reg84 <= $unsigned($unsigned($signed((reg47 ? (^~(8'haa)) : reg60))));
        end
      reg85 <= (~^{$unsigned((((8'ha8) < wire71) >= reg64))});
    end
endmodule

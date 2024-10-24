module top
#(parameter param42 = (8'hbc), 
parameter param43 = (~^param42))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire25,
                 wire24,
                 wire15,
                 wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = wire2[(4'hb):(1'h0)];
  assign wire5 = {(~(8'hb2)), wire4[(2'h3):(1'h1)]};
  assign wire6 = wire0;
  assign wire7 = wire0[(2'h2):(2'h2)];
  assign wire8 = (((~((wire3 <= wire4) ?
                         (8'hb7) : {wire3})) ^~ ((wire7 <= wire4) ?
                         wire0 : (wire1[(3'h5):(2'h2)] ?
                             (^~(8'hb1)) : (~^wire3)))) ?
                     (wire4 >>> $unsigned($signed(wire1[(3'h6):(1'h0)]))) : $unsigned(($signed((wire1 > wire4)) << ((wire4 <= wire2) <= (wire7 && wire5)))));
  always
    @(posedge clk) begin
      reg9 <= {($signed($unsigned($signed(wire1))) ?
              $unsigned({$signed(wire7),
                  $unsigned(wire0)}) : $signed($signed((wire3 ?
                  wire8 : wire3)))),
          ($unsigned(wire0[(1'h0):(1'h0)]) << $signed($unsigned((!(8'haa)))))};
      reg10 <= ((&$signed((~|wire8[(3'h6):(3'h6)]))) ?
          $unsigned((((wire5 ? wire2 : wire4) ^ (^wire4)) ?
              reg9[(2'h2):(1'h1)] : (((7'h40) << wire4) <= $signed(reg9)))) : $signed(wire1[(4'hb):(1'h1)]));
      reg11 <= $unsigned((((8'had) ?
              ((~wire6) ?
                  (wire2 - wire5) : wire4[(3'h5):(1'h1)]) : $unsigned({wire2,
                  wire5})) ?
          wire2[(2'h2):(2'h2)] : (~^{$unsigned((8'hbc)), wire6})));
      reg12 <= $signed($signed((~|wire4)));
      reg13 <= ($signed($unsigned({(+wire0), reg12})) ?
          $signed((8'ha4)) : {(((^~reg11) >> (+wire6)) > (~|(8'hbe)))});
    end
  assign wire14 = {$signed(reg13), (8'ha0)};
  assign wire15 = $unsigned((~(-wire8)));
  always
    @(posedge clk) begin
      reg16 <= (~^$unsigned(((wire8[(1'h1):(1'h0)] ~^ $signed(wire2)) ^ ((-wire4) >>> (wire4 ?
          wire3 : reg10)))));
      if (wire8)
        begin
          reg17 <= (&$unsigned(reg12[(3'h5):(2'h2)]));
          reg18 <= reg12;
          if ($signed($unsigned($signed(((|wire6) ?
              wire4[(1'h0):(1'h0)] : $unsigned(wire2))))))
            begin
              reg19 <= (+($unsigned(wire5) ?
                  $unsigned(((~&(8'haf)) >>> (reg16 >>> reg18))) : reg17[(3'h5):(3'h4)]));
            end
          else
            begin
              reg19 <= reg9[(4'ha):(3'h4)];
              reg20 <= $unsigned(reg9);
              reg21 <= reg16;
              reg22 <= $unsigned(({(~|(wire4 ? wire14 : wire1))} ?
                  $signed({{reg18}}) : {((wire14 ^~ wire6) && (8'hb0))}));
            end
          reg23 <= reg16;
        end
      else
        begin
          if ($signed((^$signed(((wire2 ? reg18 : wire3) ?
              reg20 : (~^reg21))))))
            begin
              reg17 <= $signed((|($signed(reg17[(5'h12):(4'he)]) < (~|$signed(reg23)))));
              reg18 <= (reg21[(1'h0):(1'h0)] ?
                  $unsigned(reg12) : (wire7[(3'h4):(1'h0)] ?
                      ((wire8 > ((8'h9d) || (8'h9f))) ?
                          wire8 : wire4) : ((+reg10) < ((^reg17) ?
                          $signed(reg19) : ((8'ha3) & reg10)))));
              reg19 <= $unsigned(((reg9 ^~ reg10[(4'h9):(1'h0)]) ?
                  $signed(wire8[(2'h3):(2'h3)]) : $unsigned({wire1})));
            end
          else
            begin
              reg17 <= $signed($signed(reg17[(4'h9):(3'h6)]));
            end
          reg20 <= reg9;
          reg21 <= $unsigned($signed((~&$signed(reg11))));
        end
    end
  assign wire24 = wire3[(3'h4):(1'h0)];
  assign wire25 = $unsigned(((({wire15, wire2} ?
                          $unsigned((8'hbd)) : reg18[(5'h11):(4'he)]) ?
                      $unsigned({wire7}) : reg13[(2'h2):(2'h2)]) <<< wire4[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg26 <= {reg19[(2'h2):(1'h1)], $unsigned((7'h44))};
      if ($unsigned($signed(reg9)))
        begin
          if (reg9[(3'h4):(1'h1)])
            begin
              reg27 <= ((^~wire2[(4'hc):(4'ha)]) >= wire4);
              reg28 <= wire7[(2'h2):(2'h2)];
              reg29 <= $signed(reg18);
            end
          else
            begin
              reg27 <= (wire7 ? reg9[(4'ha):(3'h4)] : (7'h40));
              reg28 <= $signed((8'hbc));
            end
          reg30 <= reg12;
        end
      else
        begin
          reg27 <= {(reg30 >= {(~|(reg26 ? wire8 : reg20))})};
          reg28 <= (reg9[(1'h1):(1'h1)] ?
              $signed($unsigned(reg22)) : $unsigned((^(wire6 | (wire4 ?
                  reg11 : reg30)))));
        end
      if ($unsigned(wire1))
        begin
          reg31 <= ($unsigned(wire4[(2'h2):(1'h0)]) ?
              wire4 : ($unsigned({reg19, (reg21 ? reg29 : reg12)}) - (8'hba)));
          reg32 <= $unsigned(($unsigned($signed($unsigned((8'hb0)))) ?
              reg16 : {$signed($unsigned(wire5)),
                  $unsigned($unsigned((8'h9e)))}));
          reg33 <= (reg21[(2'h2):(2'h2)] + (8'hb4));
          reg34 <= (({(8'hb6), ((~|reg30) ~^ {wire8})} ?
              reg29[(5'h10):(1'h0)] : ((!$unsigned(reg16)) ?
                  ({wire6, reg11} ?
                      ((8'had) ?
                          wire3 : wire8) : $signed(reg22)) : wire0)) >> (reg9[(4'h9):(4'h8)] ?
              $signed($signed(wire24[(4'he):(2'h2)])) : reg18[(3'h7):(3'h7)]));
        end
      else
        begin
          reg31 <= {$signed($signed(wire24))};
          reg32 <= reg23[(1'h0):(1'h0)];
          if ($signed(($unsigned((((8'ha6) ? reg17 : wire8) ?
              $unsigned(wire2) : {wire14, (8'ha2)})) ^~ (~&reg33))))
            begin
              reg33 <= (reg29 > (reg20 ?
                  ($unsigned((wire8 ? (8'hae) : reg30)) ?
                      (8'hb4) : {{reg11, wire1}}) : (~&$unsigned(wire7))));
              reg34 <= (^((((^reg11) >>> (~&wire8)) >= (&wire1)) ?
                  ($unsigned(reg34) ?
                      reg18 : (~^$unsigned(wire14))) : (((reg23 ?
                      (7'h42) : reg30) || (|reg9)) << reg28[(3'h4):(3'h4)])));
              reg35 <= (~&reg19[(1'h0):(1'h0)]);
              reg36 <= ((((^~$signed(reg11)) ?
                      (7'h42) : ($unsigned((8'hab)) ?
                          {wire3} : (wire1 >= wire8))) < (($unsigned((7'h40)) ?
                      (wire8 ? wire25 : (8'hbf)) : (7'h43)) <<< {reg28,
                      (+reg32)})) ?
                  wire5 : (reg27 ~^ $unsigned(wire4)));
              reg37 <= $unsigned(($unsigned(($unsigned((7'h43)) | wire7)) ?
                  reg35[(1'h1):(1'h1)] : wire24));
            end
          else
            begin
              reg33 <= (wire1 ?
                  reg9 : $unsigned($unsigned({$signed(reg23), {reg26}})));
              reg34 <= $signed(($signed($unsigned($signed(reg12))) ^~ (((reg11 ?
                  reg34 : reg29) || (8'hbc)) & ((reg11 && reg12) >= wire6[(2'h2):(1'h1)]))));
              reg35 <= {($signed(((^reg28) ?
                          $unsigned((8'hbb)) : $signed(wire25))) ?
                      (8'ha6) : $unsigned(($signed(reg19) ?
                          $signed(reg11) : $signed((8'hbd))))),
                  $unsigned(reg9)};
              reg36 <= $unsigned((~^$unsigned(reg30[(1'h0):(1'h0)])));
              reg37 <= (-$unsigned(($unsigned((reg17 << wire15)) < (&reg30[(2'h2):(1'h0)]))));
            end
          reg38 <= ((($unsigned(reg26[(4'hc):(4'h9)]) ?
              (^~reg12) : $unsigned({wire3, wire1})) & (7'h43)) * wire8);
          reg39 <= (reg22[(3'h4):(2'h3)] >= (($signed((-(8'ha7))) <= ((~&reg34) ~^ $unsigned(reg17))) >= (wire15[(1'h1):(1'h0)] ?
              (~&reg26[(4'h8):(1'h0)]) : ((~^reg38) & $signed((8'ha9))))));
        end
    end
  assign wire40 = reg17[(2'h2):(2'h2)];
  assign wire41 = (!(^reg21));
endmodule

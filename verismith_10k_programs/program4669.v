module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire47;
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire50, wire49, wire47, reg7, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed($unsigned($signed($signed((&wire4)))));
      reg6 <= $unsigned($signed((($unsigned(wire4) ?
          {wire4, reg5} : {(8'h9e)}) ~^ (wire4[(3'h7):(3'h6)] < wire2))));
      reg7 <= ($signed(wire3) ?
          $signed($signed((|(|reg5)))) : {($unsigned(((8'hbf) <= wire1)) ?
                  ((wire2 ? (8'hb0) : reg5) - $unsigned(wire2)) : wire3)});
    end
  module8 #() modinst48 (wire47, clk, wire3, reg5, reg7, wire1);
  assign wire49 = reg5[(4'h9):(3'h4)];
  assign wire50 = (wire4 ? wire4 : ((~&reg5) <<< $unsigned((!(reg5 | wire0)))));
endmodule

module module8
#(parameter param45 = (~|(((((8'ha0) ? (7'h40) : (8'ha8)) ? ((8'hba) <= (8'hb8)) : ((8'hb4) & (8'had))) >> {((8'h9c) >> (8'hae)), ((8'h9e) || (8'hb3))}) ? (((~(7'h42)) ? ((8'hac) < (8'hbb)) : ((8'ha6) ? (8'hb8) : (7'h42))) ? (~((7'h43) ? (8'hb0) : (7'h44))) : ((~&(8'ha2)) && ((8'ha0) ? (8'hb6) : (8'ha1)))) : ((^((8'hbe) ? (8'hbd) : (8'hab))) != ((!(8'hbe)) <<< ((8'ha5) >> (8'hb8)))))), 
parameter param46 = (+(((8'hb8) >>> (~&(~&param45))) ? (8'hae) : (8'hac))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire13;
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire17,
                 wire16,
                 wire15,
                 wire13,
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
                 reg14,
                 (1'h0)};
  assign wire13 = ($unsigned($unsigned(wire12[(4'hc):(4'h9)])) ?
                      $unsigned(($unsigned($signed(wire9)) ?
                          wire11[(4'ha):(1'h1)] : $signed((wire9 & wire12)))) : $unsigned((8'hab)));
  always
    @(posedge clk) begin
      reg14 <= ((~|(7'h44)) ?
          (wire10[(1'h0):(1'h0)] || (|wire9[(3'h4):(3'h4)])) : wire12[(1'h1):(1'h1)]);
    end
  assign wire15 = (($unsigned(wire11[(4'h8):(3'h5)]) ?
                      $signed(wire13) : ($unsigned($signed(wire12)) ?
                          wire10 : $signed($unsigned(wire10)))) ^~ reg14[(2'h3):(2'h3)]);
  assign wire16 = (&wire13);
  assign wire17 = ((($signed((wire9 ~^ wire13)) <<< $signed({(8'ha3)})) > $unsigned({$signed(reg14),
                      reg14[(1'h1):(1'h0)]})) == (^~(reg14 ?
                      $unsigned((8'ha0)) : $unsigned($unsigned(wire13)))));
  always
    @(posedge clk) begin
      if ((!((|({(8'hbf)} ? (-wire15) : (wire9 + wire13))) ?
          wire9[(2'h2):(2'h2)] : ((~&(-(8'ha0))) < $signed(wire17)))))
        begin
          reg18 <= wire16[(4'ha):(3'h4)];
          if ($unsigned($unsigned($unsigned(reg18))))
            begin
              reg19 <= reg14[(2'h2):(1'h1)];
              reg20 <= wire11[(3'h7):(1'h0)];
              reg21 <= {(8'ha7),
                  {(reg19 ? wire13[(3'h6):(2'h2)] : wire15[(1'h0):(1'h0)]),
                      (+wire12[(4'he):(3'h5)])}};
            end
          else
            begin
              reg19 <= reg14;
              reg20 <= (~|($signed((((8'hae) ? reg19 : (7'h40)) ?
                      (reg19 * reg21) : $unsigned((8'hbc)))) ?
                  wire17[(5'h10):(2'h2)] : {($signed(wire9) <<< $signed(wire10)),
                      ($signed((8'hb1)) ? {wire11, wire13} : {reg21, reg20})}));
              reg21 <= $signed((+wire15[(2'h2):(1'h1)]));
              reg22 <= ({$signed(((|wire9) <<< (8'hb8))),
                      $signed({(wire16 ? (8'h9e) : reg18)})} ?
                  {$signed({(wire9 ? wire11 : wire15)}),
                      ($unsigned($unsigned((8'hac))) * reg14[(2'h3):(2'h3)])} : ($unsigned(((wire9 | reg14) <= wire16)) ^~ (|wire9)));
              reg23 <= wire10[(3'h7):(2'h3)];
            end
          reg24 <= (~{(8'hac),
              ((+(!(8'hbe))) ?
                  (reg21[(4'hf):(4'hc)] ^ (&reg21)) : reg19[(1'h0):(1'h0)])});
          reg25 <= ($unsigned($signed($signed($signed(reg19)))) ?
              (reg19 <<< $signed((-$signed(reg18)))) : reg18);
          reg26 <= ((reg14[(2'h3):(1'h0)] ?
              (+$signed((reg24 > reg14))) : (|((^reg20) ?
                  wire9[(3'h6):(1'h1)] : $signed((8'ha1))))) || $unsigned((!$unsigned(wire15))));
        end
      else
        begin
          reg18 <= (($unsigned((8'hae)) ?
              ({$signed(reg21)} ?
                  ({reg21} | (~^wire11)) : $signed(reg22)) : $unsigned($unsigned(wire15))) - ((((reg20 ?
                  wire16 : reg20) | (reg20 + (7'h40))) ?
              $unsigned($unsigned(reg23)) : reg18[(2'h3):(1'h1)]) + (($signed(reg23) != (8'h9c)) ?
              (~(reg19 ? (8'ha1) : reg14)) : (&wire12))));
          if ((~&$signed($signed((reg26 >> reg18[(3'h4):(1'h1)])))))
            begin
              reg19 <= $signed($signed(((!(~^wire13)) >> (!(^~wire11)))));
            end
          else
            begin
              reg19 <= (wire17 ? $signed(reg20) : reg22[(2'h3):(1'h0)]);
            end
          reg20 <= $signed((wire17[(5'h10):(3'h6)] ?
              ($signed(wire10) | {(!(8'hb4)),
                  $unsigned(wire10)}) : {$unsigned(wire11)}));
          reg21 <= $unsigned(((wire13 ?
                  {reg14[(1'h0):(1'h0)],
                      reg25[(4'hf):(4'hb)]} : ($signed(wire13) * (&wire15))) ?
              ((reg21 && $unsigned(wire15)) * wire17) : $signed(reg22[(1'h1):(1'h1)])));
        end
      if (((-(~&$unsigned(reg23[(2'h2):(1'h1)]))) ?
          {$signed($signed((reg14 != wire9)))} : (reg18 ?
              (($signed(reg18) >> reg14) >>> $unsigned((^~reg25))) : (((reg23 ?
                      reg23 : wire16) ?
                  (!wire9) : $unsigned(wire13)) && $unsigned((wire17 ?
                  (7'h42) : wire17))))))
        begin
          reg27 <= $unsigned($signed($signed((reg18 && $unsigned(reg24)))));
          reg28 <= wire13[(4'h8):(4'h8)];
          if (((-{(~|(reg18 <<< wire12)), $signed(wire12)}) ?
              ((~&$signed($unsigned((8'haa)))) ?
                  $unsigned((~|((8'ha6) ?
                      wire10 : reg22))) : {((reg20 | wire16) ?
                          (wire10 - reg21) : $signed(wire13))}) : (^(~($signed(wire13) >>> ((8'had) >>> (8'hae)))))))
            begin
              reg29 <= (reg19 ?
                  ($unsigned({(+reg22)}) <<< (reg26 ?
                      (reg20[(3'h5):(1'h1)] < (wire15 ?
                          (8'ha0) : (7'h42))) : (-wire11))) : (($signed(wire17[(1'h0):(1'h0)]) + $signed($signed(wire9))) ?
                      reg18[(3'h5):(1'h1)] : ($signed($signed(reg25)) ?
                          wire15 : $signed({(8'hb4)}))));
              reg30 <= (~^(($signed($unsigned(reg19)) ?
                  (reg23[(1'h1):(1'h0)] ?
                      (reg29 ? wire16 : (8'hb2)) : ((8'hb8) ?
                          reg23 : reg23)) : reg29) >> reg22));
              reg31 <= {reg27[(3'h5):(1'h1)],
                  $unsigned(({wire17} ?
                      reg26 : ($signed(reg29) ?
                          (reg19 ? reg29 : wire11) : ((8'hbb) ^ reg21))))};
              reg32 <= ({(((wire10 & wire16) > $unsigned((8'h9f))) ?
                          wire10[(2'h3):(2'h2)] : (reg27 ?
                              reg28 : $signed(wire11))),
                      reg24[(2'h3):(1'h1)]} ?
                  $unsigned($unsigned($unsigned((reg29 ?
                      (8'hb1) : reg28)))) : $unsigned($unsigned(wire9[(3'h4):(1'h1)])));
            end
          else
            begin
              reg29 <= {(wire12[(2'h3):(2'h2)] + wire9)};
            end
        end
      else
        begin
          if (reg21)
            begin
              reg27 <= ((!$signed({wire15})) ? wire13 : wire17[(3'h4):(2'h3)]);
            end
          else
            begin
              reg27 <= $unsigned(($unsigned($signed(reg32)) ?
                  $signed(wire12) : ({(reg29 >= reg23)} ?
                      wire12[(2'h3):(1'h1)] : ((reg14 ?
                          wire16 : reg30) >= (~^(7'h41))))));
              reg28 <= wire13[(3'h5):(2'h2)];
              reg29 <= ($unsigned(reg28[(3'h4):(2'h2)]) <= reg23[(4'he):(4'h9)]);
              reg30 <= {reg30[(1'h0):(1'h0)], reg29[(1'h0):(1'h0)]};
            end
          reg31 <= $signed($unsigned(reg23));
          reg32 <= $unsigned(({{(reg23 << (7'h43))}} + (($unsigned((7'h43)) ?
                  ((8'hba) ~^ reg18) : reg25[(3'h7):(1'h1)]) ?
              ((reg20 || reg19) ~^ $signed(wire10)) : ((-reg19) >= reg20[(4'h9):(2'h2)]))));
          reg33 <= reg32;
        end
      if ((-$unsigned((^~(!reg32[(4'hf):(3'h4)])))))
        begin
          reg34 <= reg24;
        end
      else
        begin
          reg34 <= ($signed(wire15[(4'h8):(3'h6)]) <= $signed((^(((7'h43) == reg20) ?
              reg33 : $signed(reg21)))));
          reg35 <= ((wire10 ?
                  wire11 : {$signed($signed((8'ha2))),
                      $unsigned((~&(8'hb0)))}) ?
              reg14[(1'h0):(1'h0)] : (!wire11[(4'h8):(3'h6)]));
          reg36 <= $signed(reg35);
          if ($unsigned($signed(((8'haa) ?
              {reg20, $unsigned((8'ha8))} : (~|$signed((8'hb7)))))))
            begin
              reg37 <= wire9[(3'h5):(1'h1)];
              reg38 <= wire15[(1'h1):(1'h0)];
              reg39 <= reg33;
              reg40 <= reg27[(1'h1):(1'h0)];
            end
          else
            begin
              reg37 <= $unsigned($signed(reg40));
              reg38 <= $signed(wire16[(4'h8):(3'h6)]);
              reg39 <= (~(($signed((reg29 + wire12)) ?
                      (!reg35) : (wire15 ?
                          $signed(reg37) : reg21[(4'h8):(3'h6)])) ?
                  $unsigned((~^(^~reg35))) : ((reg27 == (~^wire10)) ?
                      (-$signed((8'hab))) : {$signed(reg32),
                          (reg24 ? reg26 : reg38)})));
            end
        end
      reg41 <= $unsigned(reg26);
      reg42 <= (reg23[(1'h1):(1'h0)] ?
          $unsigned($unsigned(((-wire13) ?
              (reg20 ? reg41 : wire9) : reg22))) : {(((reg39 ?
                  reg40 : reg21) >>> (reg32 != reg35)) ^ $signed({reg23,
                  reg14}))});
    end
  assign wire43 = $signed((!(~($signed((8'hac)) >> (reg28 != (8'ha4))))));
  assign wire44 = ((reg34[(3'h6):(3'h6)] >> $unsigned(({reg18, wire9} ?
                          (reg36 < (8'haa)) : reg18[(1'h0):(1'h0)]))) ?
                      (~|$unsigned($signed(wire11))) : (8'ha7));
endmodule

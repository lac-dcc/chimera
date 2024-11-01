module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire79;
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire5,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire25,
                 wire26,
                 wire79,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
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
                 (1'h0)};
  assign wire5 = (!$unsigned((~&wire2)));
  always
    @(posedge clk) begin
      reg6 <= ((^(wire2[(2'h2):(1'h1)] + wire3)) ?
          (7'h40) : (!wire5[(3'h6):(2'h3)]));
      if (((reg6[(2'h2):(1'h0)] ?
          (wire2[(3'h7):(3'h5)] == (^~{wire3})) : ($signed(wire3) ?
              ({reg6} ?
                  (|(8'ha4)) : {wire2,
                      reg6}) : $unsigned(wire1))) << {$unsigned(wire0)}))
        begin
          reg7 <= $unsigned(wire5);
          reg8 <= $unsigned((~(wire1 ? wire0 : $signed($unsigned((8'hbe))))));
          reg9 <= wire3;
        end
      else
        begin
          reg7 <= $unsigned(((|($unsigned(reg9) ?
              wire1[(1'h1):(1'h1)] : wire3[(4'hf):(3'h4)])) >= reg9));
        end
    end
  assign wire10 = $signed($unsigned((($signed((7'h44)) <<< $unsigned(reg8)) ?
                      reg6 : wire3)));
  assign wire11 = {$signed((($signed(wire3) - (wire2 ?
                          wire2 : wire1)) - $unsigned($signed(wire0))))};
  assign wire12 = $signed(wire0[(3'h6):(3'h6)]);
  assign wire13 = (wire4 ^ $unsigned((($unsigned(wire3) ?
                          (reg9 * wire3) : {wire12}) ?
                      ((-(8'ha9)) ? wire3 : reg8) : reg8[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if (((~^(^~$signed(wire4[(4'hb):(2'h2)]))) ?
          wire4[(1'h0):(1'h0)] : $unsigned((((&(8'hb9)) <<< (+wire2)) == wire13[(3'h4):(1'h1)]))))
        begin
          reg14 <= $unsigned(($unsigned((8'ha7)) ?
              ($signed(((7'h42) ? reg8 : wire13)) ?
                  $signed((reg7 & wire5)) : $signed(wire1)) : (^$unsigned(wire3[(1'h1):(1'h1)]))));
          reg15 <= (reg8[(3'h4):(1'h1)] ?
              $unsigned(wire2) : (!($unsigned((reg9 ? reg9 : wire11)) ?
                  ((reg14 ? reg7 : wire11) ?
                      (reg8 ? wire12 : wire5) : (wire2 < wire1)) : {(^reg8),
                      (&(8'h9d))})));
          reg16 <= $signed(wire3);
          if ($signed($unsigned($unsigned((wire2[(4'h9):(3'h5)] >> (^wire5))))))
            begin
              reg17 <= reg6[(1'h0):(1'h0)];
              reg18 <= (($signed({$unsigned(reg17)}) ?
                      (wire0 ?
                          reg16[(3'h5):(3'h5)] : $unsigned((wire2 <= reg16))) : $signed({$unsigned(wire5),
                          $signed((8'hbe))})) ?
                  $signed(((+{reg14,
                      wire1}) << (((8'h9d) ^ wire0) << reg16))) : {(wire3 ?
                          ((&reg8) & {wire1}) : $signed($signed(wire11))),
                      {wire11}});
              reg19 <= $signed($signed((((wire13 ? reg15 : (8'h9f)) ?
                  $signed(reg8) : (^~wire1)) ^ (((7'h44) * reg14) || (reg6 >> (7'h41))))));
              reg20 <= (~&(-($unsigned((wire0 ? reg15 : reg9)) ?
                  (wire5[(1'h1):(1'h1)] <<< (~wire13)) : reg19)));
            end
          else
            begin
              reg17 <= {$unsigned(reg6[(3'h7):(3'h4)]), wire11[(3'h7):(3'h4)]};
              reg18 <= $signed((-(~&$unsigned((reg16 ? reg14 : reg20)))));
              reg19 <= wire1;
            end
        end
      else
        begin
          if ((((({wire11, reg14} ? (~|wire11) : (8'hb7)) ?
              $signed((reg20 != reg19)) : $signed(reg15)) * reg14) && ((reg8 >> reg7) == {(8'hb4),
              (|$unsigned(reg16))})))
            begin
              reg14 <= {wire0, wire13};
              reg15 <= wire13;
            end
          else
            begin
              reg14 <= $unsigned($signed((~(-reg20))));
            end
        end
      if ((reg6[(1'h0):(1'h0)] || (8'hb4)))
        begin
          if (reg7)
            begin
              reg21 <= wire13;
            end
          else
            begin
              reg21 <= $unsigned($signed(({(-reg8)} ?
                  (&$signed((8'ha7))) : wire13)));
              reg22 <= (($signed(((!reg15) ?
                  $unsigned((8'hbe)) : (!reg18))) & (reg8[(4'h8):(2'h2)] ?
                  ($signed(reg17) ? (!reg7) : reg14) : (wire1[(2'h3):(2'h3)] ?
                      (wire5 ~^ reg8) : (reg9 ?
                          (8'ha2) : reg18)))) + $signed((!wire11)));
            end
          reg23 <= ((((^{reg22}) ?
                      {wire0[(1'h0):(1'h0)]} : reg19[(4'hd):(3'h4)]) ?
                  $unsigned((~|reg6[(2'h2):(2'h2)])) : $signed($signed((wire1 ?
                      (8'hb7) : (8'haf))))) ?
              wire3[(4'hd):(4'h8)] : (8'hb6));
        end
      else
        begin
          reg21 <= {reg23, wire10[(4'h8):(1'h0)]};
        end
      reg24 <= ((reg17 ?
          reg6 : ($unsigned({reg18, reg15}) ?
              $signed((reg18 == reg22)) : (!(-reg17)))) <= ({(8'h9e),
              ($unsigned(wire11) ? (~&reg6) : wire1)} ?
          wire4 : reg17));
    end
  assign wire25 = $unsigned($signed(((8'haa) ?
                      reg21[(4'h8):(3'h4)] : $signed({wire5, reg21}))));
  assign wire26 = $unsigned(reg19[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg27 <= $unsigned($unsigned(((~$unsigned(reg7)) ?
          ((wire10 ? reg24 : wire3) | wire10) : reg18)));
      if ((((($signed(reg22) * {(8'ha9)}) ? {{reg16}} : wire5) ?
              (reg20[(3'h7):(2'h2)] ?
                  reg22 : $unsigned((reg23 ~^ reg27))) : {$unsigned({reg7,
                      reg15}),
                  {reg19, reg17[(4'hd):(4'ha)]}}) ?
          $signed((7'h44)) : (({(reg24 ?
                      (8'h9e) : reg22)} > $unsigned((8'ha1))) ?
              ({(reg17 && (7'h44)), {reg8, (8'hb3)}} << $signed((reg23 ?
                  wire0 : wire13))) : (!(8'hb2)))))
        begin
          if (reg7)
            begin
              reg28 <= $unsigned(wire1[(3'h7):(3'h7)]);
              reg29 <= ({$signed(wire2[(4'h8):(1'h1)])} ?
                  (+{(8'ha6)}) : wire11[(1'h1):(1'h0)]);
              reg30 <= $signed(reg9[(3'h7):(3'h4)]);
              reg31 <= wire2[(1'h1):(1'h0)];
            end
          else
            begin
              reg28 <= (~^reg31);
              reg29 <= $unsigned({(~^reg18)});
              reg30 <= reg18;
              reg31 <= $unsigned(wire25);
            end
          reg32 <= {{$unsigned(($signed(reg24) ?
                      ((8'hb2) + (8'hb7)) : (-(8'ha4)))),
                  reg9[(1'h1):(1'h1)]}};
          reg33 <= (reg31[(2'h3):(1'h1)] ?
              {wire10[(3'h7):(2'h3)],
                  $signed({$unsigned((8'haa))})} : (reg28[(3'h6):(3'h6)] ?
                  reg30[(4'hd):(3'h6)] : wire1[(4'ha):(4'h8)]));
          reg34 <= reg20;
          reg35 <= (8'hb5);
        end
      else
        begin
          reg28 <= $unsigned((!(7'h43)));
        end
      reg36 <= reg30;
    end
  module37 #() modinst80 (wire79, clk, wire26, wire5, wire10, reg15);
  assign wire81 = $unsigned(wire4);
  assign wire82 = reg15[(3'h4):(3'h4)];
  assign wire83 = (&(($signed((~&reg20)) & (((8'hbb) >>> reg17) ?
                          $signed(reg30) : (reg20 <= reg17))) ?
                      $signed(reg17) : {(reg28[(2'h2):(1'h1)] == $unsigned(wire0)),
                          $unsigned($unsigned(reg14))}));
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(5'h13):(1'h0)] wire40;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire44,
                 wire43,
                 reg78,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= $signed((wire41[(2'h2):(2'h2)] && wire41[(1'h0):(1'h0)]));
    end
  assign wire43 = wire40[(4'hf):(1'h1)];
  assign wire44 = {$signed(($unsigned((~&wire40)) >> (-(wire41 ?
                          wire38 : (8'hb0)))))};
  module45 #() modinst63 (.wire49(wire39), .wire48(wire41), .wire47(wire44), .clk(clk), .y(wire62), .wire46(wire38));
  assign wire64 = reg42[(1'h0):(1'h0)];
  assign wire65 = (~|$unsigned($signed({((8'ha2) ? wire38 : wire64)})));
  assign wire66 = ((wire65 <= ((wire39[(3'h7):(2'h3)] && wire65[(1'h1):(1'h1)]) <= (wire40 ?
                          wire41 : (wire40 == (8'hb7))))) ?
                      ((($signed(wire43) ?
                              $unsigned(wire64) : ((8'hb2) ^~ wire44)) >>> (^(|wire65))) ?
                          $signed({$unsigned((7'h40))}) : (-$unsigned($unsigned(wire65)))) : {wire62[(1'h0):(1'h0)]});
  assign wire67 = wire62[(2'h3):(2'h2)];
  assign wire68 = $unsigned((~^$unsigned(((wire40 & wire67) == $signed((8'hb6))))));
  assign wire69 = ((-wire65[(1'h1):(1'h1)]) <= ({{$signed((8'ha4))},
                      (-(wire67 ? wire39 : wire67))} ^ wire66[(4'h9):(4'h8)]));
  assign wire70 = ((wire67 << $unsigned((~$unsigned(wire67)))) ?
                      (8'hab) : $signed(($signed({wire39,
                          (8'ha1)}) * wire64[(4'h8):(3'h5)])));
  assign wire71 = (($signed((wire43[(4'h9):(3'h5)] >>> $signed(wire66))) <<< ($unsigned(wire38[(4'hd):(4'h9)]) ?
                          $unsigned((-wire68)) : ((wire67 ?
                              (8'hbb) : wire62) ^~ wire40[(5'h11):(2'h2)]))) ?
                      (|({(wire67 ? wire69 : (8'ha4)), wire69} ?
                          $unsigned($unsigned(wire64)) : $unsigned($signed(wire69)))) : (($signed(wire43[(2'h2):(1'h0)]) ?
                          wire38 : wire64) | (^$unsigned((wire66 | wire41)))));
  assign wire72 = (wire43 > $signed((!wire66)));
  assign wire73 = (8'h9f);
  assign wire74 = (($signed($unsigned((+wire71))) ~^ ((~^((8'hbf) << wire64)) <= wire43)) ^~ ($unsigned($unsigned({wire73})) ~^ $unsigned((|wire62))));
  assign wire75 = (wire74 | (+($unsigned(wire72) ?
                      {(&wire64), (+wire62)} : wire38)));
  assign wire76 = (~^$unsigned($signed(((reg42 == wire39) <= {wire69,
                      wire41}))));
  assign wire77 = wire67;
  always
    @(posedge clk) begin
      reg78 <= $signed($unsigned((8'hbe)));
    end
endmodule

module module45
#(parameter param61 = (~^(8'hb6)))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire [(4'h9):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 (1'h0)};
  assign wire50 = (~&$unsigned({$signed(wire47[(3'h5):(2'h3)]),
                      (~&(~|wire48))}));
  assign wire51 = $unsigned(wire46[(3'h6):(3'h5)]);
  assign wire52 = {$unsigned(wire51), wire51};
  assign wire53 = $unsigned(wire52[(2'h2):(2'h2)]);
  assign wire54 = wire51;
  assign wire55 = ({$signed(((wire48 & wire48) ?
                              {wire46, wire52} : (wire48 ? wire48 : wire46)))} ?
                      ((wire54[(3'h7):(3'h4)] ^ wire54[(4'hd):(4'hb)]) ?
                          wire53 : (wire52 ?
                              wire54 : ((wire53 > (7'h40)) == (~^wire49)))) : {((^{(8'ha6)}) ?
                              (8'hac) : $signed((wire54 ? wire53 : wire52))),
                          wire49});
  assign wire56 = {(^~wire51),
                      (~^($signed($signed(wire46)) ?
                          $signed(wire54) : $signed(wire47[(2'h2):(2'h2)])))};
  assign wire57 = wire55[(3'h6):(1'h1)];
  assign wire58 = (({wire56} && ((^~$signed(wire46)) ?
                      wire51 : ($signed(wire57) >= (wire51 != (8'hb2))))) >>> $unsigned(wire53[(5'h15):(4'h9)]));
  assign wire59 = wire46[(4'h9):(3'h5)];
  assign wire60 = ($signed($unsigned(wire51[(5'h10):(4'h9)])) || (($unsigned($unsigned(wire56)) != wire50) < {($signed(wire48) - (wire55 + wire58)),
                      ($unsigned(wire55) ?
                          (wire47 ? wire49 : wire49) : $unsigned((8'h9f)))}));
endmodule

module top
#(parameter param34 = ((((((8'hab) ? (8'ha4) : (8'ha1)) ^~ ((7'h44) ? (7'h42) : (8'hab))) > ((~^(8'hb0)) ? {(8'ha3), (8'h9e)} : ((8'hae) || (8'hb5)))) > ((((8'hb0) && (8'hbd)) || ((8'hbc) == (7'h43))) ? {{(7'h41), (8'hb0)}, ((8'ha5) ? (7'h42) : (7'h42))} : ((^(8'ha9)) ? (-(8'hbe)) : ((8'hb1) ? (8'hbb) : (8'ha6))))) ? (^~((~^(~&(8'ha1))) ? ({(8'ha4), (8'hbc)} >> ((7'h41) ^ (8'ha7))) : (~^((8'ha0) ? (8'haf) : (8'ha6))))) : {{(((8'h9c) ? (8'hb5) : (8'hb5)) ? (^(8'ha4)) : ((8'ha4) & (8'h9e)))}, ((~^((8'haf) ~^ (8'hb9))) >>> ({(8'hbb)} ^~ ((7'h43) ? (8'ha5) : (8'hac))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
  always
    @(posedge clk) begin
      reg5 <= $signed(wire2[(5'h12):(2'h2)]);
      if ($signed((~^wire3)))
        begin
          if ({((wire1 ?
                  ($unsigned(wire2) ?
                      (wire1 * wire2) : wire0[(1'h0):(1'h0)]) : {$unsigned((8'h9c))}) - ((~wire3) < (~&{wire2,
                  wire1}))),
              ((((reg5 || wire1) || (wire2 && wire0)) >>> $signed(((7'h41) <<< wire0))) ?
                  wire2[(5'h13):(2'h3)] : ({{(8'haf), reg5}} ?
                      wire1 : $unsigned(wire3)))})
            begin
              reg6 <= (({wire2[(2'h3):(2'h3)], $signed(wire2[(3'h6):(1'h1)])} ?
                      wire4 : wire4) ?
                  ((~$unsigned(wire3[(1'h0):(1'h0)])) ?
                      {(wire3 != (!reg5))} : ((^wire1) <<< $unsigned(wire3))) : {$signed($unsigned({wire2})),
                      (($unsigned(wire2) ? $signed((8'ha8)) : (&reg5)) ?
                          wire1[(1'h1):(1'h1)] : wire4[(3'h5):(3'h4)])});
              reg7 <= reg5[(2'h3):(2'h2)];
              reg8 <= wire0;
            end
          else
            begin
              reg6 <= ((|wire4[(5'h12):(5'h10)]) ^~ $unsigned((+(&wire1[(3'h6):(2'h3)]))));
              reg7 <= {$signed($unsigned(((wire4 ?
                      wire4 : wire1) + ((8'hbe) <<< wire0))))};
              reg8 <= $signed((8'hb5));
            end
          reg9 <= $unsigned((($signed(reg8[(4'hb):(4'ha)]) - ($unsigned(wire0) ?
              $signed(wire2) : wire1[(3'h7):(3'h4)])) >>> ($unsigned((reg6 << reg7)) ?
              wire1[(3'h7):(1'h1)] : wire4)));
        end
      else
        begin
          reg6 <= $unsigned(wire4);
          reg7 <= $signed(wire2);
          if ($unsigned(reg7))
            begin
              reg8 <= $signed((~|$signed(reg6)));
            end
          else
            begin
              reg8 <= $unsigned(((+(&$signed((8'hb0)))) ?
                  (~^$signed((reg6 >> wire1))) : {$unsigned((wire4 ~^ wire4))}));
              reg9 <= reg8[(3'h4):(2'h2)];
              reg10 <= (+(8'h9c));
              reg11 <= wire0[(2'h3):(1'h1)];
              reg12 <= reg8[(3'h7):(2'h3)];
            end
          reg13 <= (~|(((^~(~wire4)) ?
              ((wire1 ~^ (8'ha8)) > $unsigned(wire0)) : $unsigned((wire4 ?
                  reg10 : reg5))) * ($signed({(8'hb1), (8'hb3)}) ?
              reg6[(1'h1):(1'h1)] : $unsigned((~^wire4)))));
        end
    end
  assign wire14 = {$signed($unsigned(($signed(reg8) ?
                          (reg11 ? reg8 : reg13) : ((8'h9f) ?
                              reg10 : wire3))))};
  assign wire15 = reg5;
  assign wire16 = (~&($signed(wire0) > $unsigned(wire1)));
  assign wire17 = {$signed(wire16[(3'h5):(1'h0)])};
  assign wire18 = {$unsigned(((!$unsigned((8'ha7))) >= ($unsigned(wire3) ?
                          {reg5, reg12} : (|reg12))))};
  always
    @(posedge clk) begin
      reg19 <= $unsigned($unsigned((wire16[(1'h0):(1'h0)] ?
          ($unsigned(wire2) * (reg6 - reg6)) : reg6[(1'h0):(1'h0)])));
      reg20 <= $signed((reg5[(3'h7):(3'h6)] && wire0));
      if ($unsigned($unsigned(wire1[(4'h8):(3'h6)])))
        begin
          if ((+$unsigned(($unsigned($unsigned(wire14)) > $unsigned((wire0 || (8'hb0)))))))
            begin
              reg21 <= $unsigned(((((7'h43) >= (!reg20)) ?
                      ({reg13, wire1} << (!reg7)) : (|(|reg19))) ?
                  $unsigned(wire14[(3'h4):(3'h4)]) : {{reg13[(4'h9):(1'h1)],
                          (wire2 >>> reg7)}}));
              reg22 <= reg12;
              reg23 <= ({(8'hae)} ?
                  wire3[(1'h1):(1'h1)] : ((^wire1) ?
                      {$unsigned($unsigned(reg19)),
                          (~|$unsigned(reg19))} : {$unsigned($signed(reg21))}));
            end
          else
            begin
              reg21 <= (wire14[(3'h4):(2'h3)] <<< {wire16,
                  reg20[(2'h2):(2'h2)]});
              reg22 <= (reg21 ?
                  $signed($unsigned(({wire2, reg12} && (wire2 ?
                      wire18 : wire14)))) : (~&(~{reg8})));
            end
          if (($signed($unsigned(wire2)) ? (~reg7) : (~wire16[(1'h0):(1'h0)])))
            begin
              reg24 <= ({((|$signed(wire2)) ? wire17[(5'h12):(3'h6)] : wire2)} ?
                  reg8[(3'h4):(1'h0)] : $signed(({reg6} >>> (reg8 < reg23))));
              reg25 <= ($unsigned(reg24[(4'hf):(2'h3)]) ?
                  ((&(8'ha8)) ?
                      {$signed((^(8'hb3))),
                          {(reg6 ? wire2 : (8'ha4)),
                              $unsigned(reg12)}} : ($unsigned(((8'ha0) <= wire18)) ?
                          {$unsigned(wire16),
                              wire2} : ($signed((7'h40)) >>> (^reg10)))) : $unsigned((|(wire14 ?
                      (wire3 ? wire15 : reg10) : $signed(reg22)))));
            end
          else
            begin
              reg24 <= (~&reg21);
              reg25 <= (8'h9f);
              reg26 <= ($signed((wire4[(4'hd):(4'h8)] + reg25)) + $unsigned(wire14[(1'h0):(1'h0)]));
              reg27 <= wire17[(4'h8):(3'h5)];
            end
          reg28 <= {(($unsigned($unsigned(reg19)) * wire4[(3'h7):(3'h6)]) >> $unsigned(reg7[(3'h5):(1'h0)])),
              (8'haf)};
          reg29 <= reg28[(3'h4):(2'h3)];
        end
      else
        begin
          reg21 <= $unsigned(reg5);
        end
    end
  always
    @(posedge clk) begin
      reg30 <= reg29;
    end
  assign wire31 = $signed(($signed(((^reg26) ?
                          wire1[(3'h4):(3'h4)] : $signed(reg12))) ?
                      (^~((reg28 > reg29) ^~ $unsigned((7'h41)))) : $signed(((~&wire14) >> $signed(reg10)))));
  assign wire32 = wire18;
  assign wire33 = wire3[(1'h0):(1'h0)];
endmodule

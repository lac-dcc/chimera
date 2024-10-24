module top
#(parameter param44 = ({({{(8'ha1), (8'h9d)}} - (~{(8'ha7), (8'haf)}))} || ((((^~(8'hb8)) + {(8'ha9)}) * (^~(8'hbb))) <= (~&{(~|(8'hb9))}))), 
parameter param45 = (param44 + param44))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire6,
                 wire5,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = {wire4[(2'h3):(2'h2)],
                     (wire1[(3'h7):(3'h4)] ^ (^wire1[(2'h2):(1'h0)]))};
  assign wire6 = $unsigned(((8'ha0) ?
                     ((8'hba) ? (~&(wire4 ? wire3 : wire4)) : wire3) : wire5));
  always
    @(posedge clk) begin
      reg7 <= wire1;
      reg8 <= (8'ha7);
    end
  always
    @(posedge clk) begin
      if (($unsigned((~&($signed(wire2) == (wire2 ? wire2 : wire6)))) ?
          $unsigned($signed((((8'hb6) ? wire0 : reg8) ?
              (reg7 ? reg7 : wire4) : (wire5 ?
                  wire3 : wire4)))) : ((($unsigned(wire3) ?
                  $unsigned((8'h9e)) : wire3[(4'h8):(3'h6)]) >>> $unsigned($unsigned(reg8))) ?
              reg7 : wire6[(4'ha):(4'h9)])))
        begin
          reg9 <= {reg7};
          reg10 <= (wire4 ?
              ($unsigned(((reg7 && reg9) > (wire3 - wire3))) & ($unsigned(wire1[(3'h4):(2'h2)]) + $unsigned((wire6 ?
                  wire2 : wire6)))) : ((-reg9) + ({(8'h9f),
                  reg7[(3'h6):(3'h5)]} ^ (-(~wire6)))));
          reg11 <= $signed(wire2);
          reg12 <= (reg9 ?
              wire2 : ($signed($unsigned($unsigned(wire6))) && reg9));
          if (reg10[(1'h0):(1'h0)])
            begin
              reg13 <= reg11;
            end
          else
            begin
              reg13 <= (!(wire1 ?
                  ((+(8'hba)) ?
                      $unsigned(wire6) : (((8'hac) ?
                          (8'hab) : reg11) ^ {(8'hbe)})) : $unsigned(($signed(reg9) ?
                      (&reg8) : {wire2, (8'ha5)}))));
              reg14 <= ($unsigned(wire6[(4'h8):(1'h0)]) ?
                  (reg9[(1'h1):(1'h1)] ?
                      {(~(&(8'hb0)))} : $unsigned(((reg13 != wire4) ?
                          (wire5 <<< wire3) : (~wire4)))) : (~|wire0[(4'h9):(3'h4)]));
              reg15 <= (|(~^(wire0[(2'h3):(2'h2)] && ($unsigned((8'hbe)) ?
                  {reg14, wire6} : reg11[(2'h3):(1'h0)]))));
            end
        end
      else
        begin
          reg9 <= (wire4[(4'hb):(4'h8)] ? reg11[(1'h1):(1'h1)] : (8'ha1));
          reg10 <= $signed($signed(reg7));
          reg11 <= (wire3[(2'h2):(2'h2)] ?
              ((8'haa) ?
                  $unsigned((reg11[(1'h1):(1'h1)] ?
                      (^~reg8) : $unsigned((8'hb3)))) : ($signed((wire0 && wire4)) >= (&(reg15 ?
                      wire3 : reg10)))) : (8'hae));
          reg12 <= reg13[(5'h12):(4'hd)];
          reg13 <= reg8;
        end
      if ($unsigned((($signed(reg11) ?
              reg12[(2'h2):(1'h0)] : ($signed(wire0) ?
                  (reg10 ? reg8 : (8'hb7)) : (wire1 <= reg8))) ?
          reg15 : reg9)))
        begin
          reg16 <= reg12[(1'h1):(1'h1)];
          reg17 <= wire1[(1'h1):(1'h0)];
          reg18 <= wire3;
          reg19 <= (wire5 ?
              (~|(($unsigned((8'hbd)) && (reg12 ? reg12 : reg12)) ?
                  $unsigned($signed(wire5)) : wire2)) : (|$signed($signed(reg7[(4'hb):(4'ha)]))));
          reg20 <= ({$signed($unsigned(((8'haa) << reg9)))} ?
              $unsigned(($unsigned(reg11) >> (^reg18[(2'h2):(1'h1)]))) : $signed((^((wire6 ?
                  wire6 : reg9) ^ (-reg13)))));
        end
      else
        begin
          reg16 <= reg18[(1'h1):(1'h1)];
          reg17 <= (~&{reg14, (wire6 ? reg15 : (&$signed((8'hb7))))});
          reg18 <= (($unsigned({reg10[(4'hb):(2'h3)]}) << $unsigned((!((8'hb7) >= reg8)))) ?
              reg12[(1'h0):(1'h0)] : reg9[(2'h2):(1'h1)]);
          reg19 <= $unsigned((~&($signed($signed(reg14)) ?
              $unsigned($signed(wire1)) : $unsigned((|reg18)))));
          reg20 <= reg15;
        end
      reg21 <= $signed(({(~$unsigned(wire2))} == wire1[(1'h0):(1'h0)]));
      if ((((~reg12[(2'h2):(2'h2)]) ?
          $signed((~(wire1 < wire5))) : (!$unsigned((wire1 & reg13)))) > (+{reg16[(1'h1):(1'h0)]})))
        begin
          reg22 <= $signed((reg14 ?
              ((^~(8'haf)) ?
                  (~(^~reg8)) : (reg10[(4'hc):(4'h8)] ?
                      reg17 : reg16)) : wire5));
        end
      else
        begin
          reg22 <= (~|$signed((reg13[(4'hd):(4'hd)] ^~ wire1[(3'h6):(3'h5)])));
          if ((~^$unsigned((|((reg8 >= reg15) ?
              (reg10 == reg11) : $unsigned(reg19))))))
            begin
              reg23 <= ({($unsigned(reg18[(2'h2):(1'h1)]) && ({reg15} != reg14)),
                      ($unsigned((reg13 ? (8'hbe) : wire5)) ?
                          {reg11} : ((8'hae) ?
                              (reg13 < wire4) : $signed(reg22)))} ?
                  reg22[(2'h2):(1'h1)] : (reg20[(1'h0):(1'h0)] <= $signed($signed(reg19[(5'h13):(1'h1)]))));
            end
          else
            begin
              reg23 <= (~^($signed((wire1[(1'h1):(1'h0)] | reg9)) >>> wire2[(3'h4):(2'h2)]));
              reg24 <= wire5[(2'h2):(1'h0)];
              reg25 <= (-reg10);
              reg26 <= (+({($unsigned(reg23) - (!wire4)),
                  ($unsigned(wire5) ?
                      (wire5 ?
                          wire4 : reg11) : (wire0 > reg12))} <<< $signed(wire1)));
              reg27 <= (((8'ha0) ?
                  wire1 : ($unsigned((reg9 ? reg24 : reg17)) ?
                      ((reg26 ^~ reg14) - {wire6}) : $signed((+reg10)))) & ($unsigned($signed((reg12 & (8'ha2)))) ?
                  reg10 : reg9));
            end
          reg28 <= (((8'hb9) ?
                  ($signed($signed(wire6)) <<< ((~reg11) ?
                      reg20[(2'h2):(1'h1)] : $signed(reg24))) : $unsigned((^{reg15,
                      reg9}))) ?
              {(((|(8'h9d)) ? $signed(reg21) : $unsigned(reg23)) ?
                      $signed(wire3[(1'h1):(1'h0)]) : reg23),
                  reg13[(5'h11):(4'hd)]} : (~$unsigned(((wire3 ?
                      wire3 : (8'ha0)) ?
                  reg11[(1'h1):(1'h0)] : $signed(reg11)))));
          if ((|{(((~reg25) > $signed(reg26)) ?
                  reg27[(4'hd):(4'ha)] : (^((8'hab) ? reg23 : reg7)))}))
            begin
              reg29 <= wire4[(3'h7):(1'h1)];
              reg30 <= (^~$unsigned($signed($signed($unsigned(reg27)))));
            end
          else
            begin
              reg29 <= reg20[(1'h1):(1'h1)];
              reg30 <= $signed(($unsigned(((8'haa) >> {wire0, (8'ha1)})) ?
                  wire1 : wire3[(3'h7):(2'h2)]));
              reg31 <= wire4;
              reg32 <= (~^reg18[(3'h4):(2'h3)]);
            end
        end
      reg33 <= reg21[(4'hc):(1'h1)];
    end
  assign wire34 = {$unsigned(($signed((reg9 ? (8'haf) : wire5)) * ({reg11} ?
                          $signed(reg8) : $signed(reg8))))};
  assign wire35 = (wire1[(1'h0):(1'h0)] ? reg11 : reg22);
  assign wire36 = $signed(reg23[(5'h11):(4'hc)]);
  assign wire37 = ((7'h43) ?
                      (+($unsigned($signed((7'h44))) ^ wire6[(4'hb):(1'h0)])) : $unsigned((reg18 * $signed({(8'haf),
                          reg12}))));
  assign wire38 = (reg17[(1'h0):(1'h0)] ?
                      reg25 : $signed(((~&((8'hb5) ? reg18 : wire4)) ?
                          reg27[(4'he):(4'hb)] : reg13[(4'he):(4'h8)])));
  assign wire39 = wire38[(1'h0):(1'h0)];
  assign wire40 = reg7;
  assign wire41 = $unsigned((&(&(|(wire2 ? wire5 : wire36)))));
  assign wire42 = $unsigned($unsigned((|$unsigned(wire1[(4'h8):(3'h5)]))));
  assign wire43 = (~^reg21);
endmodule

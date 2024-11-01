module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
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
                 (1'h0)};
  assign wire5 = wire3[(1'h1):(1'h1)];
  assign wire6 = $unsigned($unsigned(wire3[(3'h4):(2'h2)]));
  assign wire7 = $signed(wire3[(3'h7):(1'h1)]);
  assign wire8 = wire2;
  assign wire9 = ((((8'hb9) ^ (^~(wire7 ? wire4 : (8'hb2)))) ?
                         wire5[(3'h7):(3'h6)] : $signed(wire4)) ?
                     (~(~({wire6} ?
                         $unsigned((8'hb4)) : $unsigned(wire4)))) : wire8);
  always
    @(posedge clk) begin
      reg10 <= ({wire6[(3'h5):(1'h0)]} != $unsigned(((|(wire8 | wire9)) == (8'hb2))));
      reg11 <= wire5;
      if (((-(($signed(wire5) ? $signed(wire1) : wire5[(4'he):(4'ha)]) ?
              (wire7[(2'h2):(1'h0)] & $unsigned(wire8)) : ($unsigned((7'h40)) == wire9[(3'h7):(3'h7)]))) ?
          reg10 : $signed((wire2 ?
              wire7[(2'h3):(1'h1)] : $unsigned((wire3 | wire7))))))
        begin
          reg12 <= {$unsigned(($unsigned((reg10 >>> reg11)) ~^ $signed((wire5 ?
                  wire7 : wire3))))};
          reg13 <= wire1;
          if (wire9)
            begin
              reg14 <= (&$signed((($signed(wire4) << (8'hb4)) ?
                  $signed((8'hb5)) : (reg11[(3'h4):(1'h0)] ?
                      wire7[(4'he):(3'h7)] : wire7[(1'h0):(1'h0)]))));
              reg15 <= ($unsigned($unsigned({reg12, wire4})) ?
                  $signed((|{(8'h9f)})) : (+(reg13[(2'h2):(1'h1)] ?
                      (~^reg13[(1'h1):(1'h0)]) : $unsigned((|wire5)))));
              reg16 <= $unsigned(reg10);
              reg17 <= wire6[(1'h1):(1'h0)];
              reg18 <= reg11[(2'h2):(2'h2)];
            end
          else
            begin
              reg14 <= (8'ha8);
            end
        end
      else
        begin
          reg12 <= $unsigned(((^~reg13[(5'h12):(1'h1)]) ?
              (-(wire0 | $unsigned(wire1))) : $signed($signed((~|wire3)))));
          reg13 <= (&$signed({($signed(reg12) != (wire2 ? wire3 : reg17)),
              ({(8'ha4)} ? (wire7 ? reg11 : reg12) : $unsigned(wire8))}));
          reg14 <= reg14[(5'h14):(5'h13)];
          reg15 <= (7'h42);
          reg16 <= ($unsigned({(8'hae)}) + ({$unsigned((wire1 ?
                  reg14 : wire5))} | $unsigned((^$unsigned((7'h41))))));
        end
      if ($unsigned($unsigned({((wire0 ? (8'hba) : reg10) ?
              $signed(wire2) : $signed(wire1))})))
        begin
          reg19 <= wire5[(4'hb):(3'h6)];
          reg20 <= $unsigned((($unsigned((reg10 ? wire8 : wire2)) ?
                  ($unsigned(reg10) <= $signed(wire6)) : (|(wire9 ?
                      wire2 : wire5))) ?
              wire3 : (-wire1)));
          reg21 <= wire2;
          reg22 <= reg16;
        end
      else
        begin
          reg19 <= wire4[(3'h4):(3'h4)];
          reg20 <= $unsigned(((+$signed((wire3 ? wire9 : (7'h40)))) ?
              (reg16 ?
                  (&$signed((8'hb3))) : {(wire5 >> reg10),
                      (wire1 ? wire8 : wire6)}) : ($unsigned($signed(reg14)) ?
                  ((&wire5) ?
                      reg20[(4'hf):(3'h4)] : $signed(reg16)) : $unsigned(wire3[(3'h7):(1'h1)]))));
          reg21 <= (~|(&(^($unsigned(reg11) ?
              {(8'ha9)} : (wire5 ? wire6 : wire0)))));
          if (($signed($signed({(wire3 <<< wire2), $signed(wire9)})) > ((wire7 ?
              (|wire2[(1'h1):(1'h0)]) : ((wire0 & wire6) ?
                  $signed((8'hb5)) : (+reg14))) + {(|$signed((8'hb5)))})))
            begin
              reg22 <= wire0[(5'h12):(3'h7)];
              reg23 <= (reg11[(3'h4):(2'h2)] > $unsigned($unsigned(reg21)));
              reg24 <= $signed((($unsigned($unsigned(wire1)) <= ($unsigned(wire3) < (reg14 ?
                  wire3 : reg15))) >= $signed(reg11)));
            end
          else
            begin
              reg22 <= $signed((-$signed({$signed(reg19)})));
              reg23 <= $unsigned((wire8[(4'hb):(3'h5)] - $unsigned(reg15)));
              reg24 <= wire7[(2'h3):(2'h2)];
            end
          reg25 <= ($signed((reg18 ?
              $unsigned(wire9[(3'h4):(1'h0)]) : $unsigned((wire3 | wire7)))) < wire9);
        end
    end
  assign wire26 = {(wire2 ?
                          (reg22 ?
                              (~&(reg18 ? wire5 : (8'hbd))) : (((8'haf) ?
                                      wire7 : wire1) ?
                                  (wire9 ?
                                      reg24 : (8'h9d)) : (8'ha2))) : $signed(reg23[(3'h4):(1'h0)])),
                      (reg13 ?
                          $unsigned((&reg15)) : {reg23,
                              $unsigned((reg25 ? reg12 : wire7))})};
  assign wire27 = {$signed((!((reg24 <= wire2) ? {reg21} : $signed(reg11))))};
  assign wire28 = {((^~(reg22[(3'h4):(1'h0)] * (reg23 == wire2))) ?
                          (((8'hbe) ?
                              wire27 : (!reg20)) << $unsigned($unsigned((8'had)))) : (wire3[(4'h9):(1'h1)] ?
                              ((!reg22) * $unsigned(reg18)) : wire9[(4'h9):(1'h0)]))};
  assign wire29 = (((|$signed(wire1)) < $unsigned((~|(8'haa)))) | ($unsigned((~(reg15 ?
                      wire1 : (8'hb9)))) ^~ (~|reg20[(4'hf):(3'h6)])));
  assign wire30 = (+(^wire2));
  always
    @(posedge clk) begin
      reg31 <= (&$unsigned(($signed(wire28) != ((~&reg11) > (wire3 <<< reg25)))));
    end
  always
    @(posedge clk) begin
      reg32 <= wire8[(1'h0):(1'h0)];
      reg33 <= $unsigned((~^(^reg25)));
    end
  assign wire34 = reg22;
  assign wire35 = ((^wire7[(2'h2):(1'h0)]) ?
                      ($signed($signed((&reg17))) & (~{(wire5 ?
                              wire4 : reg12)})) : ({{$signed(wire3),
                              {reg31, wire5}}} >= (8'hb6)));
  assign wire36 = reg15;
  assign wire37 = wire8[(3'h7):(3'h4)];
  assign wire38 = {$unsigned({(wire6 ? wire6[(4'hb):(4'ha)] : (8'hb1))})};
  assign wire39 = wire34[(4'ha):(4'h8)];
  assign wire40 = wire0[(4'ha):(2'h3)];
  assign wire41 = $signed($signed((($signed((8'hac)) ?
                          $signed(wire4) : $signed((8'ha1))) ?
                      wire36 : (^~(reg23 || wire30)))));
endmodule

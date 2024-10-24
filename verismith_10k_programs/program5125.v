module top
#(parameter param22 = ((~^({(+(8'hb9))} != ({(8'h9d), (8'had)} ~^ ((7'h40) == (8'hbe))))) || (!(~{((8'hac) * (8'hb8))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire21,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire0[(2'h2):(1'h0)];
  assign wire5 = (wire1[(2'h3):(1'h0)] || (!{wire0}));
  assign wire6 = wire4;
  assign wire7 = (wire1[(3'h4):(3'h4)] ?
                     (wire5[(3'h5):(2'h2)] <= $signed(wire4)) : (({$unsigned(wire1)} - $signed((-wire5))) ?
                         {((wire2 ? wire3 : wire2) != (^(8'hb1))),
                             (wire2 ?
                                 $signed((8'ha9)) : wire1)} : wire0[(1'h1):(1'h1)]));
  assign wire8 = wire0;
  assign wire9 = ((!((((8'hbb) ? wire0 : wire1) | $signed(wire7)) ?
                     $unsigned((-wire3)) : ((wire8 ~^ wire3) ?
                         (-(8'hab)) : (wire6 ?
                             wire8 : wire6)))) >> (^(!$unsigned(wire3[(2'h3):(1'h1)]))));
  assign wire10 = ($signed($signed(((wire5 ? wire0 : (8'h9c)) ?
                          (~^wire1) : (|wire1)))) ?
                      wire8[(3'h6):(3'h5)] : $unsigned({$unsigned((!wire1)),
                          wire4}));
  assign wire11 = ($unsigned($signed($signed($signed(wire4)))) != $unsigned({(wire10[(3'h4):(2'h3)] ?
                          (~&(8'hbd)) : $unsigned(wire8)),
                      ((wire9 << wire10) ? (^(8'had)) : $unsigned(wire5))}));
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire0[(3'h4):(1'h0)]);
      reg13 <= (($signed(((wire11 ? wire5 : wire6) ?
                  (8'hbd) : wire11[(2'h3):(2'h2)])) ?
              (!reg12[(3'h6):(3'h5)]) : $unsigned((((8'hb5) - wire2) ?
                  (&(8'h9f)) : (wire10 ? wire5 : wire11)))) ?
          ($unsigned(wire5[(3'h6):(1'h1)]) | wire8) : (|$signed($signed($unsigned(wire7)))));
      if (wire0)
        begin
          reg14 <= reg13;
          reg15 <= $unsigned((~wire0));
          reg16 <= (((^{(!wire6)}) >> reg13) ?
              (8'hb6) : $unsigned($unsigned(wire0)));
        end
      else
        begin
          reg14 <= $unsigned((^(-$unsigned({reg13, reg15}))));
          if ($unsigned($unsigned($unsigned((wire11 ? (-(8'had)) : reg13)))))
            begin
              reg15 <= ($unsigned((+{wire10})) ?
                  ((~^(wire9 != (wire3 >= reg16))) && ($unsigned((wire1 ?
                      wire2 : wire11)) >>> (((8'hbf) ?
                      (8'ha0) : wire8) ^ (reg14 ?
                      reg12 : wire7)))) : ({{$unsigned(wire8),
                          $unsigned(wire2)},
                      ((!wire5) << $unsigned((8'hae)))} >> (+wire1)));
              reg16 <= (8'ha7);
              reg17 <= (~|$signed(wire10[(3'h4):(2'h2)]));
              reg18 <= wire5[(3'h4):(1'h1)];
              reg19 <= ((($signed((wire0 ? wire5 : reg18)) ?
                      ($unsigned(wire1) ^~ wire11) : $unsigned(((8'h9f) * (8'hb3)))) <<< (!($unsigned((8'hac)) & $signed(reg14)))) ?
                  (-{wire11[(4'h9):(3'h7)],
                      $signed(wire11)}) : (^$signed(wire2[(1'h1):(1'h1)])));
            end
          else
            begin
              reg15 <= $signed((8'hb8));
              reg16 <= wire1[(3'h7):(2'h3)];
              reg17 <= $signed(((reg15[(1'h1):(1'h0)] ?
                      $unsigned(wire3) : $unsigned($unsigned(wire3))) ?
                  (($unsigned(wire8) - reg16) ?
                      $signed($signed(reg12)) : reg14[(3'h5):(3'h5)]) : wire7[(4'ha):(4'h8)]));
              reg18 <= {$signed($signed((8'ha2)))};
              reg19 <= $unsigned(((&((wire8 ?
                      wire7 : wire11) <<< $signed((7'h42)))) ?
                  wire2 : ($signed((+reg15)) << (wire2 ? wire11 : (~&reg14)))));
            end
          reg20 <= reg15[(3'h5):(3'h4)];
        end
    end
  assign wire21 = wire11[(3'h7):(3'h4)];
endmodule

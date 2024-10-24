module top
#(parameter param37 = ((~|({((8'h9d) <= (8'hb0)), ((8'ha8) < (8'hbc))} >>> (8'hb5))) ? (^~(8'hb5)) : (^~{(8'hbc)})), 
parameter param38 = (param37 ^ (~param37)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire25,
                 wire24,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = {$unsigned(wire1),
                     ($unsigned($unsigned($signed(wire4))) & wire0[(3'h4):(2'h2)])};
  assign wire6 = (&(~^wire1[(4'h8):(1'h0)]));
  assign wire7 = $unsigned((~&($signed(wire4[(4'hb):(4'h8)]) <<< (wire1[(4'hc):(4'hc)] <= wire4[(4'hc):(4'h9)]))));
  assign wire8 = $signed($unsigned($unsigned($unsigned((wire1 ?
                     wire0 : (7'h44))))));
  assign wire9 = wire8;
  assign wire10 = (((~^wire8[(3'h4):(2'h2)]) <= (~^wire5[(1'h0):(1'h0)])) << (wire8[(2'h2):(1'h1)] == $signed($unsigned(wire1))));
  always
    @(posedge clk) begin
      reg11 <= $signed(wire0[(1'h1):(1'h0)]);
      reg12 <= $signed({($unsigned((&wire0)) ?
              (~(~|wire9)) : $signed((wire6 ? wire7 : wire4)))});
      reg13 <= wire3[(4'hb):(4'h9)];
      if (wire10)
        begin
          reg14 <= $unsigned((({(wire3 && wire6)} ?
                  (7'h43) : wire4[(4'hd):(4'hb)]) ?
              (~$signed($unsigned(wire3))) : (reg12 && ((wire2 ?
                      reg12 : wire1) ?
                  (wire9 ? wire6 : wire7) : $signed((7'h43))))));
        end
      else
        begin
          if ((~|wire8))
            begin
              reg14 <= $unsigned((8'hbf));
              reg15 <= $unsigned(($unsigned(wire4) < wire4[(3'h6):(3'h4)]));
              reg16 <= wire1[(4'h8):(1'h0)];
            end
          else
            begin
              reg14 <= $unsigned($unsigned((-(+((8'hb8) ? wire10 : (7'h43))))));
              reg15 <= $signed(reg12[(3'h5):(3'h5)]);
              reg16 <= $signed((-$unsigned(reg15[(3'h5):(1'h1)])));
              reg17 <= $unsigned((~^wire6[(1'h0):(1'h0)]));
            end
          if ($signed(((((~^reg16) ? wire10[(2'h2):(1'h0)] : (~^reg17)) ?
              (reg16[(2'h3):(2'h3)] * ((8'ha5) ?
                  wire2 : reg16)) : ($unsigned(reg11) ?
                  $signed(reg13) : ((8'ha5) << wire1))) && (~^$unsigned($unsigned(wire5))))))
            begin
              reg18 <= wire3[(3'h7):(1'h0)];
              reg19 <= (~&reg14);
            end
          else
            begin
              reg18 <= (wire2[(3'h4):(2'h2)] >>> $unsigned($unsigned($signed((~^(8'hbc))))));
              reg19 <= wire6;
              reg20 <= $unsigned(wire6[(3'h7):(1'h1)]);
            end
          reg21 <= (((reg18 ? reg20 : $unsigned(reg18)) ?
              $unsigned((8'hba)) : (wire3 ?
                  wire3 : ((^~(8'h9c)) == (wire7 <<< reg17)))) < ($signed($unsigned($unsigned(wire8))) ?
              reg17[(4'hb):(3'h6)] : reg16[(1'h1):(1'h0)]));
          reg22 <= reg11;
          reg23 <= (^reg16);
        end
    end
  assign wire24 = $unsigned($unsigned((~&$signed(wire0))));
  assign wire25 = $signed(wire10);
  always
    @(posedge clk) begin
      reg26 <= ((~&(reg12[(1'h0):(1'h0)] ?
          {{reg16, (7'h40)},
              $signed(reg19)} : $unsigned($unsigned(wire2)))) | {wire3[(1'h0):(1'h0)],
          reg19});
      reg27 <= ({(~&($unsigned(reg15) ? ((8'h9e) >> reg15) : $signed(wire9)))} ?
          $unsigned(($unsigned((8'haf)) ?
              {$unsigned(reg20),
                  (wire8 ? reg21 : reg17)} : wire4[(1'h1):(1'h1)])) : reg11);
    end
  assign wire28 = (reg14[(3'h7):(3'h6)] >> reg19);
  assign wire29 = $signed((|wire24[(1'h0):(1'h0)]));
  assign wire30 = ({$unsigned((~|(wire7 >> reg17))), reg13[(3'h6):(2'h3)]} ?
                      $signed(((reg16 ?
                          reg14 : (reg13 && wire24)) ~^ $unsigned(wire6[(2'h2):(1'h1)]))) : $unsigned(reg16[(2'h3):(1'h0)]));
  assign wire31 = (wire25[(2'h2):(2'h2)] ? $unsigned(reg22) : $unsigned(reg27));
  always
    @(posedge clk) begin
      reg32 <= $signed((reg11 && wire29));
      reg33 <= reg17[(4'h8):(2'h2)];
      reg34 <= reg19[(1'h1):(1'h0)];
      reg35 <= $signed(reg17[(4'h8):(3'h5)]);
      reg36 <= $signed(reg16[(1'h0):(1'h0)]);
    end
endmodule

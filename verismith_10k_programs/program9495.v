module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire32;
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire5,
                 wire6,
                 wire32,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((|{wire0,
          ({wire1} ? $signed(wire1) : wire3)}) * (wire1 - $signed({(wire3 ?
              wire1 : wire2),
          (wire0 ? wire2 : wire1)})));
    end
  assign wire5 = $unsigned(({$unsigned(wire0[(5'h11):(4'h9)]),
                     $unsigned(wire0)} << reg4[(3'h6):(3'h5)]));
  assign wire6 = wire1;
  module7 #() modinst33 (.wire11(wire1), .clk(clk), .wire8(wire2), .y(wire32), .wire9(wire0), .wire10(reg4));
  assign wire34 = wire3[(4'h9):(4'h8)];
  assign wire35 = (8'hb1);
  assign wire36 = (reg4[(4'hf):(1'h1)] ?
                      {wire32[(3'h5):(3'h5)],
                          $unsigned($unsigned(wire6[(4'h8):(1'h0)]))} : (~$signed((&(&wire5)))));
  always
    @(posedge clk) begin
      reg37 <= wire35;
    end
  assign wire38 = $unsigned((~^{$signed((wire3 ? reg37 : wire2)),
                      wire34[(5'h10):(3'h4)]}));
  always
    @(posedge clk) begin
      reg39 <= ($unsigned((wire34 >> (wire36[(1'h1):(1'h0)] == wire32[(3'h4):(2'h3)]))) == ((((!wire6) - (wire1 ^~ reg4)) ?
              ((^(7'h43)) ?
                  wire32[(3'h5):(1'h1)] : (~&wire34)) : (^~$signed(wire1))) ?
          wire36[(3'h5):(3'h5)] : $unsigned(($signed(wire6) <<< (wire0 >= (8'ha0))))));
      reg40 <= (~wire5[(4'h9):(3'h5)]);
      reg41 <= $signed({((8'ha4) ^~ ((reg37 ?
              reg39 : (8'had)) < (wire3 >>> (8'had)))),
          {wire32[(1'h1):(1'h1)]}});
    end
  assign wire42 = $unsigned(wire32);
  assign wire43 = (-wire5);
endmodule

module module7
#(parameter param30 = (-({(8'h9e)} ? {(~|{(8'ha2)}), (((8'hbd) | (8'h9d)) || ((8'hac) ^~ (8'hab)))} : ((((8'ha0) ? (8'hb5) : (8'h9f)) ? ((8'hbe) ? (8'hb6) : (8'hb6)) : (~|(8'hbe))) | (8'ha3)))), 
parameter param31 = (((8'hbb) <<< ((|(param30 ? param30 : param30)) ? ((param30 ? param30 : param30) ? (&param30) : (param30 && param30)) : ((|param30) ? (param30 ? param30 : param30) : (&param30)))) ? (param30 ? (((param30 | param30) >>> (param30 != (8'had))) ? ({param30} << (8'hb0)) : {param30}) : (param30 || (~param30))) : param30))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire13,
                 wire12,
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
                 (1'h0)};
  assign wire12 = $unsigned({(($signed(wire10) ?
                              wire10[(4'hf):(4'h9)] : $unsigned((8'hba))) ?
                          ((wire10 ?
                              wire10 : wire10) && (+wire9)) : (wire9[(1'h1):(1'h1)] ?
                              $unsigned(wire8) : {(8'ha3)}))});
  assign wire13 = $signed((($signed(wire11[(2'h3):(1'h1)]) ?
                          (((8'hb1) ?
                              wire9 : wire9) >> $unsigned(wire9)) : $unsigned((!wire9))) ?
                      ($unsigned(wire10[(1'h1):(1'h0)]) ?
                          ((wire10 >>> wire12) >> (+wire10)) : (~|wire8[(4'hc):(4'h9)])) : $signed((^wire8[(3'h5):(1'h0)]))));
  always
    @(posedge clk) begin
      reg14 <= (~^wire11);
      reg15 <= ($signed(wire13[(1'h0):(1'h0)]) << ({(-(wire9 <= wire10)),
          $unsigned(((8'hbc) ^~ wire11))} < {(~$unsigned(wire13))}));
      if ($unsigned($signed(wire13)))
        begin
          reg16 <= wire9[(2'h2):(1'h1)];
          if ($unsigned(reg16))
            begin
              reg17 <= (&(-$unsigned(((reg16 ?
                  wire10 : wire11) != (reg15 >> wire13)))));
              reg18 <= wire12;
            end
          else
            begin
              reg17 <= (~&($signed(wire11[(2'h2):(1'h1)]) < ($unsigned(wire11) & wire12)));
              reg18 <= ((wire11 ?
                  (wire13 != {{(8'ha4)}}) : {(8'ha0)}) <<< $unsigned(($signed(reg18[(1'h1):(1'h1)]) * wire9)));
              reg19 <= $signed(({((7'h44) + wire10),
                      ((wire12 ? wire8 : reg17) ~^ $unsigned(wire12))} ?
                  reg17 : ({(wire10 ? wire8 : reg17),
                      (reg17 >>> wire13)} ^~ ((reg15 ? reg15 : (7'h40)) ?
                      reg15[(4'ha):(3'h6)] : reg14))));
              reg20 <= wire8;
            end
          if (wire11)
            begin
              reg21 <= wire10;
              reg22 <= (8'hb2);
            end
          else
            begin
              reg21 <= (!wire8);
              reg22 <= {(wire8[(2'h3):(1'h0)] << wire11)};
              reg23 <= reg16[(1'h1):(1'h0)];
              reg24 <= {reg14,
                  $unsigned(($signed((reg14 ? wire9 : (8'hac))) ^~ reg20))};
            end
        end
      else
        begin
          reg16 <= $signed((8'hbf));
          reg17 <= $unsigned((((reg24[(3'h6):(1'h0)] ?
                  $signed(reg23) : (wire9 ? reg23 : wire11)) ?
              reg22[(3'h4):(1'h1)] : (wire9 || reg24)) == ((reg23[(4'hf):(3'h7)] ?
                  ((8'hbb) * (7'h40)) : (reg21 ? reg19 : (8'hac))) ?
              $signed((8'ha9)) : $unsigned(reg19[(4'he):(4'h9)]))));
          reg18 <= {(8'hbf)};
        end
      reg25 <= ({($signed((wire13 ?
                  reg15 : wire9)) && (|wire11[(2'h3):(2'h3)])),
              (reg14 ? ($signed(reg23) | (-reg22)) : wire9[(1'h1):(1'h1)])} ?
          (reg20 ? reg22[(5'h11):(2'h2)] : wire10) : (-(((reg22 >= reg23) ?
                  {reg19, reg23} : (wire8 ? reg14 : reg22)) ?
              $unsigned($signed(reg17)) : $unsigned($signed((8'ha8))))));
    end
  assign wire26 = (reg17 ? $unsigned((reg17 & (+(reg15 | reg17)))) : wire8);
  assign wire27 = $signed($signed(wire13[(4'ha):(2'h3)]));
  assign wire28 = reg18[(1'h0):(1'h0)];
  assign wire29 = $signed((8'ha1));
endmodule

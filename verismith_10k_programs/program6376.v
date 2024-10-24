module top
#(parameter param43 = ((!{(((8'hac) ? (8'hb2) : (8'hb5)) ? ((8'h9c) | (8'ha3)) : ((8'hbe) ? (8'ha3) : (8'hbd)))}) ? (({((8'h9e) < (8'hab)), ((8'h9e) * (8'hb8))} != (((8'hb8) ^ (8'ha0)) ~^ ((8'hb0) ? (7'h42) : (8'hb0)))) ? ((((8'ha8) & (8'hbf)) | {(8'haa)}) ? (((8'hb5) ? (8'hb3) : (8'hb9)) ? ((8'hb0) ? (8'hb6) : (7'h41)) : (&(8'ha6))) : (8'hba)) : (~(((8'hb2) + (8'ha7)) >> ((8'ha4) ? (8'hbb) : (8'h9e))))) : (-(^((~&(8'h9c)) ? (+(8'hbd)) : (!(8'h9d)))))), 
parameter param44 = (&(~{(!(param43 ? param43 : (8'ha2)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire28;
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire13,
                 wire28,
                 reg35,
                 reg34,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((($signed(wire3) ?
          (wire1 >>> (|$unsigned(wire3))) : $unsigned(wire4[(3'h4):(1'h0)])) << $unsigned({wire2[(1'h0):(1'h0)]})))
        begin
          reg5 <= wire0;
        end
      else
        begin
          reg5 <= (wire1[(4'ha):(1'h0)] ?
              (&({{(8'h9d), reg5}, $unsigned(reg5)} ?
                  $unsigned(wire3) : {$unsigned((8'hbc)),
                      $unsigned(wire4)})) : wire4[(1'h0):(1'h0)]);
          if ((|{(wire1[(4'h9):(1'h0)] ?
                  (^~(wire1 ? wire1 : wire0)) : (wire1[(4'h9):(3'h7)] ?
                      (+wire2) : (wire3 == wire0)))}))
            begin
              reg6 <= (^~(~(~((wire4 ? (8'hb1) : wire2) && $signed(wire4)))));
            end
          else
            begin
              reg6 <= (~&($signed({wire2}) * {((wire4 == wire0) | wire2),
                  wire0}));
              reg7 <= {$unsigned(((wire0[(3'h4):(2'h3)] << {wire0, wire2}) ?
                      $signed($signed(wire0)) : (reg5 ?
                          $signed(wire2) : $unsigned(reg6))))};
              reg8 <= ({$unsigned($unsigned((wire0 * wire1))),
                  $signed($unsigned((wire0 | reg7)))} << (+(&wire1[(4'ha):(2'h2)])));
            end
          reg9 <= reg7;
          reg10 <= ($unsigned($unsigned((^wire2[(2'h3):(1'h0)]))) ?
              (($unsigned((reg8 ? reg9 : wire0)) < $unsigned({wire4,
                  wire2})) < (reg5[(3'h4):(2'h3)] ?
                  ((~&reg8) <<< (reg5 ?
                      reg5 : reg5)) : (~|$unsigned((7'h41))))) : (reg5 || {$signed($signed(reg7)),
                  $signed((reg7 ? (8'ha8) : reg7))}));
        end
      reg11 <= ($signed($unsigned($unsigned(wire1[(4'h8):(2'h3)]))) ?
          $signed($unsigned($signed(wire3))) : reg9[(4'hd):(2'h3)]);
      if ($unsigned(wire4[(1'h1):(1'h1)]))
        begin
          reg12 <= ((wire1[(3'h6):(3'h5)] <<< (8'h9f)) ?
              ($unsigned($signed((reg7 >>> reg10))) ?
                  ((^(wire3 < reg5)) ?
                      (~^wire0[(4'hb):(3'h4)]) : {wire3[(4'hb):(3'h7)],
                          reg10}) : wire2[(3'h4):(3'h4)]) : (&(8'hb3)));
        end
      else
        begin
          reg12 <= ($unsigned((+reg6[(2'h2):(1'h0)])) ?
              wire2[(1'h0):(1'h0)] : $signed((^((wire1 ?
                  wire0 : reg11) & (wire1 << reg8)))));
        end
    end
  assign wire13 = $signed($signed($unsigned({reg10[(4'hc):(2'h2)]})));
  module14 #() modinst29 (.wire17(reg8), .wire16(reg6), .y(wire28), .clk(clk), .wire18(wire2), .wire15(reg5));
  assign wire30 = (!((reg7[(1'h1):(1'h1)] ?
                          (&{(7'h41)}) : reg6[(4'h9):(3'h4)]) ?
                      $unsigned($signed((~^(8'ha0)))) : (+wire3)));
  assign wire31 = reg12;
  assign wire32 = $unsigned(wire2[(1'h0):(1'h0)]);
  assign wire33 = $unsigned($signed(reg6));
  always
    @(posedge clk) begin
      reg34 <= reg12[(3'h6):(3'h5)];
      reg35 <= wire30;
    end
  assign wire36 = reg5[(4'hd):(3'h5)];
  assign wire37 = ($signed($signed({reg11})) ?
                      ($unsigned(wire0) ?
                          ($signed($signed(wire33)) && ((~|wire0) & wire1)) : (~&(&wire28[(3'h4):(1'h0)]))) : wire2[(2'h3):(1'h0)]);
  assign wire38 = (wire0[(3'h5):(2'h2)] ?
                      (wire13[(1'h1):(1'h0)] ?
                          {(^((8'hbc) ? wire28 : wire36)),
                              ($unsigned(reg5) ?
                                  $unsigned(wire28) : $unsigned(wire28))} : reg35) : $signed((-$unsigned((~|wire32)))));
  assign wire39 = $unsigned($unsigned(((^~(+wire28)) ?
                      {(reg6 ? wire33 : reg7)} : ((wire36 | (8'haf)) || (reg5 ?
                          reg11 : (8'hb5))))));
  assign wire40 = $signed($unsigned($signed($unsigned($signed(wire32)))));
  assign wire41 = {(8'hae), wire4};
  assign wire42 = (8'h9c);
endmodule

module module14
#(parameter param27 = (({((8'hbb) ? (~&(8'hb7)) : (+(8'hb7)))} ~^ ({(+(8'ha2)), {(8'hb4)}} != (8'hab))) ? (!((((8'hb3) >= (8'hbb)) ? (~(8'hac)) : ((8'hae) ^ (8'hae))) | (((8'hb6) ? (8'haf) : (8'hab)) ? (^~(8'hb0)) : (&(8'ha1))))) : ((^((&(8'hbb)) <= ((7'h40) ? (8'ha4) : (8'ha8)))) >= ((&((8'ha9) ? (8'hb6) : (8'h9f))) ? {((8'hae) ? (8'hb9) : (8'ha1)), (^~(7'h41))} : (~&((8'hb6) ? (8'ha7) : (8'hb6)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = $signed(wire15);
  assign wire20 = $signed(wire18[(2'h2):(2'h2)]);
  assign wire21 = ($signed((!wire16[(4'he):(4'hd)])) ? wire17 : {wire20});
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg22 <= {($signed($signed($signed(wire21))) ?
                  wire21 : (wire21[(1'h1):(1'h0)] ~^ wire16[(4'hc):(4'ha)])),
              (wire16 - (7'h44))};
          reg23 <= {((reg22[(4'h9):(1'h1)] ?
                  wire15[(4'hd):(1'h0)] : wire21[(4'h9):(3'h6)]) || ((8'h9e) ?
                  wire21[(3'h4):(1'h0)] : wire18))};
          reg24 <= $unsigned($unsigned(((&wire15[(4'hb):(4'h8)]) ?
              ((~&(8'hbb)) ? (~|wire15) : (wire18 >= wire19)) : wire21)));
          reg25 <= reg22;
          reg26 <= reg25[(5'h10):(1'h1)];
        end
      else
        begin
          reg22 <= ((((8'ha6) ?
                  (~((8'hbe) <= reg22)) : (|$signed(wire16))) | (~&({wire15,
                      wire17} ?
                  {reg24} : (&wire18)))) ?
              $signed((7'h41)) : (&(wire20 ?
                  ((wire16 << (8'hba)) ?
                      $unsigned(wire16) : (~reg25)) : (reg25 ?
                      (8'hb1) : (wire15 ? wire21 : reg24)))));
          reg23 <= ((({reg23[(1'h1):(1'h0)]} || (8'hb7)) ?
                  (((wire15 ? reg22 : wire18) ?
                          {wire20, reg23} : $signed((8'hbd))) ?
                      (wire20[(3'h5):(3'h4)] ?
                          ((8'ha2) != reg26) : (reg22 >= (8'hb3))) : $unsigned(wire15[(3'h6):(1'h0)])) : ((~|((8'hba) ?
                      reg23 : wire15)) == (reg22 ^ reg25[(5'h13):(2'h3)]))) ?
              (~|wire16) : (~|$unsigned((|{(8'hb9), reg22}))));
          reg24 <= $unsigned($signed(((&{wire19}) ~^ reg26)));
          reg25 <= ((~&((reg22 | (wire18 < reg22)) ?
              (^~$unsigned(reg26)) : ({wire15,
                  wire20} <= wire17[(2'h2):(2'h2)]))) | reg25[(1'h1):(1'h1)]);
          reg26 <= $unsigned((reg24 == wire18));
        end
    end
endmodule

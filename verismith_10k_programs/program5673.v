module top
#(parameter param47 = (8'hb1))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire39;
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire43,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire39,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg13,
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
                 reg25,
                 (1'h0)};
  assign wire5 = (~&wire0[(4'ha):(3'h6)]);
  assign wire6 = ((~|((~|(8'hb7)) ^~ $signed($signed(wire2)))) ?
                     wire2[(1'h1):(1'h1)] : wire3);
  assign wire7 = (^~(+(&(~^$unsigned(wire6)))));
  assign wire8 = $signed((-wire2[(2'h3):(1'h0)]));
  assign wire9 = {$signed($signed((wire1 | $unsigned(wire0))))};
  assign wire10 = (!(^(~^$signed($unsigned(wire9)))));
  assign wire11 = $unsigned(($signed(($unsigned(wire3) & wire5)) ?
                      (wire9 || ($unsigned(wire9) ?
                          (wire7 ^ wire5) : wire5[(1'h1):(1'h1)])) : $unsigned((+(8'ha2)))));
  assign wire12 = ((~wire1[(2'h2):(2'h2)]) || {({wire3} ?
                          (wire3 ?
                              (~^wire8) : wire11[(3'h5):(2'h2)]) : wire2[(3'h4):(2'h2)])});
  always
    @(posedge clk) begin
      reg13 <= {wire12};
      reg14 <= $signed($signed($signed(reg13[(5'h14):(5'h12)])));
      if (wire8[(4'h9):(2'h3)])
        begin
          if (reg13[(4'hc):(2'h3)])
            begin
              reg15 <= ((wire8 ?
                  (wire2 ? wire6 : wire9) : (wire12 ?
                      ((wire3 > wire0) ?
                          $signed(wire7) : ((8'haf) ~^ (8'ha2))) : ($unsigned((8'haf)) ?
                          wire7 : $signed(wire6)))) * (wire7[(3'h4):(2'h3)] ?
                  $signed(((wire7 ? (8'hbe) : reg14) ?
                      (reg13 ?
                          wire3 : reg14) : wire6[(2'h2):(1'h0)])) : wire6));
            end
          else
            begin
              reg15 <= ($signed({(7'h43), (~|wire11[(4'h9):(2'h3)])}) ?
                  {wire3} : {($signed(((8'ha0) ? reg14 : wire1)) ?
                          $unsigned(wire1) : ($signed(wire12) ?
                              {wire10} : {(8'hae), reg14})),
                      (reg14 ? wire3 : ($signed(wire0) ~^ wire7))});
              reg16 <= wire10;
              reg17 <= $signed($unsigned($signed($signed($signed((8'ha4))))));
              reg18 <= {((|(+wire3)) ? (&(|$unsigned(wire7))) : (~|wire10))};
              reg19 <= ((8'ha0) << (+wire1[(3'h4):(1'h0)]));
            end
        end
      else
        begin
          reg15 <= ($unsigned((~^(+$signed(wire5)))) ? wire1 : wire9);
          reg16 <= wire4[(3'h6):(3'h5)];
          reg17 <= (|$unsigned((wire4 ?
              $signed((|reg17)) : ($unsigned(wire5) == wire1))));
        end
      reg20 <= (wire2 << reg17[(4'ha):(4'h9)]);
    end
  always
    @(posedge clk) begin
      reg21 <= reg19;
      reg22 <= ((8'ha2) > wire12[(1'h0):(1'h0)]);
      reg23 <= reg15[(3'h7):(2'h2)];
      reg24 <= (|reg19[(3'h4):(2'h2)]);
      reg25 <= $signed((((~(~|reg13)) ^~ wire8[(2'h3):(1'h0)]) || $signed(((~|reg23) ?
          (wire2 >>> reg16) : ((8'hbd) <<< reg23)))));
    end
  module26 #() modinst40 (.clk(clk), .wire27(wire8), .wire29(wire2), .wire28(reg17), .y(wire39), .wire30(wire0));
  always
    @(posedge clk) begin
      reg41 <= {($unsigned(reg21) ?
              (~|(~|wire1)) : ((^~$unsigned((8'hb8))) > ($unsigned(reg24) ?
                  $signed(reg23) : $unsigned((7'h42))))),
          $signed(({reg20} ?
              $unsigned({reg17, reg21}) : $unsigned((!wire12))))};
      reg42 <= (^~wire10[(2'h3):(2'h3)]);
    end
  assign wire43 = ((($unsigned((^wire11)) ?
                              ($unsigned((8'hb1)) ?
                                  (~reg25) : $signed(wire1)) : ($unsigned((8'ha7)) <<< reg42)) ?
                          {wire0[(4'h9):(4'h9)],
                              (reg20[(3'h5):(2'h3)] ?
                                  {(8'had),
                                      reg41} : wire39[(2'h2):(1'h0)])} : reg13[(4'hb):(3'h6)]) ?
                      {reg23} : ((^~((wire1 - reg13) ?
                          (!(8'ha8)) : reg17)) ~^ (($signed(reg41) + $unsigned((8'hbb))) ?
                          (wire39 ?
                              $signed(reg17) : (reg20 >= reg17)) : ($unsigned(reg24) ?
                              $signed(reg42) : wire3))));
  always
    @(posedge clk) begin
      reg44 <= $signed(({$signed((reg16 != reg22)), wire39[(4'he):(4'he)]} ?
          $unsigned(wire4[(3'h5):(1'h1)]) : ((wire43[(1'h1):(1'h1)] ?
                  $signed(wire39) : reg20) ?
              wire5[(3'h7):(3'h6)] : (7'h41))));
      reg45 <= (!$signed((($unsigned(reg21) >= $unsigned(wire8)) & (wire39 ?
          {wire9} : $signed(reg42)))));
      reg46 <= ($signed($unsigned((~$unsigned(wire39)))) == ((((!wire10) == wire11) * reg24[(1'h1):(1'h0)]) != wire5[(1'h1):(1'h1)]));
    end
endmodule

module module26
#(parameter param38 = ((^((^~((8'hae) ? (8'ha4) : (7'h43))) >>> ((~|(8'hbe)) - ((7'h44) - (8'haa))))) < ((8'hac) ? ((^((8'hbd) - (7'h43))) | ((~(8'hb0)) ? ((8'hb2) && (8'ha2)) : ((8'hb8) ? (7'h41) : (8'hbe)))) : ((~((8'hbf) ? (7'h40) : (8'ha4))) * {(~^(8'haf)), (~&(7'h44))}))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  assign y = {wire37, wire36, wire33, wire32, wire31, reg35, reg34, (1'h0)};
  assign wire31 = (((wire29[(2'h2):(2'h2)] ?
                          wire27 : (wire30[(3'h4):(2'h2)] & wire29)) > wire30) ?
                      ((((wire28 <<< wire27) ?
                              $unsigned(wire28) : wire28[(4'h9):(2'h2)]) > $signed($signed(wire30))) ?
                          (~&(~^(wire28 ?
                              (8'ha9) : (8'ha1)))) : (~^(!{(8'hac)}))) : (wire30 == {$signed((+wire27))}));
  assign wire32 = wire30;
  assign wire33 = {wire29[(3'h5):(3'h5)], wire27};
  always
    @(posedge clk) begin
      reg34 <= $unsigned((wire33 ?
          (+(wire32 != ((8'h9e) ? (8'hb6) : wire28))) : wire30));
      reg35 <= ($unsigned({wire31[(4'hd):(1'h1)]}) ?
          (~|wire33[(1'h0):(1'h0)]) : (($signed($signed(wire27)) || ((!wire32) < wire27)) ?
              {{(!(7'h44)), wire27}} : $signed({$signed(wire32), wire28})));
    end
  assign wire36 = $signed(wire29[(3'h7):(1'h0)]);
  assign wire37 = wire36;
endmodule

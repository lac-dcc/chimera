module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  assign y = {wire45,
                 wire41,
                 wire39,
                 wire6,
                 wire5,
                 wire4,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire4 = {$signed(((!((8'hb7) && (8'ha9))) ? (8'hbf) : wire2)),
                     wire3[(1'h0):(1'h0)]};
  assign wire5 = (~^{wire0[(1'h0):(1'h0)]});
  assign wire6 = (((wire3[(1'h0):(1'h0)] == $unsigned((!wire5))) > wire5[(1'h0):(1'h0)]) ?
                     wire4 : $signed($unsigned(((wire1 | (8'h9d)) > (&wire4)))));
  module7 #() modinst40 (wire39, clk, wire3, wire4, wire5, wire0);
  assign wire41 = (~|$unsigned((((wire6 ? (7'h43) : (8'haf)) ?
                      wire6[(1'h1):(1'h1)] : wire1) + ($signed(wire6) > (~wire0)))));
  always
    @(posedge clk) begin
      reg42 <= (~{$unsigned((^~(~^wire3))),
          (&$signed(((7'h41) ? wire5 : wire3)))});
      reg43 <= wire5[(2'h2):(1'h0)];
      reg44 <= wire3;
    end
  assign wire45 = reg43;
endmodule

module module7
#(parameter param37 = {((~^(((8'hb1) ? (8'hb5) : (8'hb1)) ? {(7'h44), (8'h9f)} : {(8'hbf), (7'h42)})) ? (8'hb2) : ({(-(8'hb6)), ((8'hb8) ? (8'hb2) : (8'ha9))} == {((8'hbf) ? (8'hb9) : (8'hb8))}))}, 
parameter param38 = param37)
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire33;
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire12,
                 wire33,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = wire10[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire9);
      reg14 <= wire9[(4'hd):(4'h9)];
      reg15 <= $signed($signed(reg14));
      reg16 <= (~(~|(&(~&$signed(wire9)))));
    end
  module17 #() modinst34 (.wire18(wire8), .y(wire33), .clk(clk), .wire19(reg13), .wire20(wire9), .wire22(wire11), .wire21(reg14));
  assign wire35 = (^~((wire11 && reg16[(2'h2):(1'h1)]) ^ $signed(wire33)));
  assign wire36 = ($signed($unsigned($unsigned({reg13, wire33}))) ?
                      (7'h43) : (reg15[(4'ha):(3'h6)] ^~ wire10[(5'h11):(3'h5)]));
endmodule

module module17
#(parameter param31 = ({(~|(~|{(8'ha0)})), ((-((7'h41) | (8'ha0))) ? (((7'h40) >> (8'hbc)) ^~ ((8'haf) <= (8'hb5))) : (8'haa))} ? (((8'hbd) ? (((7'h40) >= (8'ha1)) & (~|(8'hb8))) : (~|((8'hbc) != (8'ha3)))) ? ((((7'h40) ? (8'hbd) : (8'hb5)) ? ((8'hb6) ~^ (8'hb1)) : (^~(7'h41))) != (~^((8'ha6) & (8'hb3)))) : ((&(~(8'ha8))) ? (8'hb2) : {((8'ha3) ? (8'ha7) : (8'hbc))})) : {({{(8'hbd)}, (8'hb6)} ? {((8'hbf) - (8'hab)), ((8'hb3) ? (8'hb4) : (8'hbb))} : ((~|(7'h43)) == ((8'hb6) ~^ (8'hb4)))), (~^(^~(^(8'h9e))))}), 
parameter param32 = (-(param31 - ((((7'h42) ? param31 : param31) ? param31 : (param31 ? param31 : param31)) ? (param31 >> (param31 ? param31 : param31)) : {(param31 ? param31 : param31), (|param31)}))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire22;
  input wire [(3'h4):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire30,
                 wire24,
                 wire23,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = wire22;
  assign wire24 = wire20;
  always
    @(posedge clk) begin
      reg25 <= (((((~&wire19) & ((8'hb7) + wire22)) | $unsigned(((8'ha4) ?
              wire22 : wire20))) ?
          (8'hb3) : $signed(wire19)) == wire20);
      reg26 <= {$unsigned($signed($unsigned((wire20 ? wire19 : wire19)))),
          reg25[(4'hd):(3'h6)]};
    end
  always
    @(posedge clk) begin
      reg27 <= {(|$unsigned((((8'hb3) * wire23) >= reg25)))};
      reg28 <= {($signed(((wire19 ~^ (8'ha1)) + wire20[(3'h4):(3'h4)])) ?
              $unsigned(($signed(wire24) ?
                  (|wire21) : wire22[(4'h8):(1'h0)])) : (wire20[(2'h3):(1'h1)] >>> (reg26 ^ $unsigned(reg26))))};
      reg29 <= wire21;
    end
  assign wire30 = (($unsigned((((8'hb8) ? wire21 : reg25) ?
                              ((7'h40) ?
                                  reg27 : wire23) : (reg26 >>> wire23))) ?
                          ((!$unsigned(wire23)) ?
                              ((|wire21) > $signed(reg28)) : ((wire23 - reg28) ?
                                  $signed(reg29) : wire18[(3'h4):(1'h1)])) : ({wire23} | (^$unsigned((8'hb3))))) ?
                      (wire22 ?
                          $unsigned(reg29[(2'h3):(2'h2)]) : ($signed((|wire20)) || (!wire24[(3'h4):(2'h3)]))) : reg26[(1'h0):(1'h0)]);
endmodule

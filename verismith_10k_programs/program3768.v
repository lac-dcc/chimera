module top
#(parameter param59 = ((~|((!((8'ha7) >> (8'hb4))) != (((7'h41) ? (8'hbb) : (7'h44)) - ((8'hb9) ? (8'ha7) : (8'hb0))))) - (~&((((8'hb9) < (8'ha8)) && {(8'h9f), (8'hb6)}) || (((8'hb8) + (7'h44)) ? (8'ha6) : ((8'hbc) ? (8'h9f) : (8'hb4)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = {$unsigned($signed((8'hac))),
                     $signed({(~^(wire4 | wire3)), (^{wire4})})};
  assign wire6 = wire5;
  assign wire7 = $unsigned($unsigned(((~|{wire4}) ?
                     (wire0 >> wire2[(4'ha):(2'h2)]) : ((~|(8'h9c)) == ((8'hbf) <<< (8'hb0))))));
  module8 #() modinst49 (.wire11(wire0), .clk(clk), .wire12(wire3), .y(wire48), .wire10(wire2), .wire9(wire1));
  assign wire50 = (wire0 & (((8'ha4) ?
                      (!(|wire4)) : $unsigned(wire4)) || wire1[(4'h9):(3'h6)]));
  assign wire51 = (((|wire1[(5'h11):(2'h3)]) >> wire50[(3'h7):(2'h3)]) + ($signed(wire5[(1'h0):(1'h0)]) && wire7));
  assign wire52 = ((~^(wire3 != ({(8'hb5)} ? {wire4, wire3} : wire5))) ?
                      (((^$unsigned(wire5)) ?
                          wire51 : (|$unsigned(wire4))) & ({(8'hb8),
                          $unsigned(wire6)} >>> $signed((~wire0)))) : ((^$signed(wire6)) & (~^($signed(wire1) >>> (&(8'hb0))))));
  assign wire53 = {(~^$signed(wire2[(3'h7):(3'h7)])),
                      $signed(wire52[(3'h6):(3'h4)])};
  assign wire54 = wire51[(3'h4):(1'h1)];
  assign wire55 = ($signed((($signed(wire7) ?
                          wire3[(4'hf):(4'ha)] : (wire0 - wire51)) >>> ((wire53 ?
                          wire5 : wire52) * (wire52 ? wire0 : wire52)))) ?
                      $signed(((~(wire3 ^ wire5)) - $signed(wire1))) : wire7);
  assign wire56 = $unsigned((~(^(((8'h9f) ? wire5 : wire54) || wire53))));
  assign wire57 = {{$unsigned(($signed(wire56) ?
                              $unsigned(wire56) : wire55[(1'h1):(1'h1)])),
                          wire55}};
  assign wire58 = ((wire3 ?
                      {($unsigned(wire52) ~^ (wire0 ?
                              wire52 : wire5))} : (7'h41)) > $signed(((|((8'hbd) ^~ wire53)) != ($signed((8'hb2)) ?
                      (wire48 ? (8'hb1) : wire0) : {wire5}))));
endmodule

module module8
#(parameter param46 = ((({((8'ha0) ^~ (8'ha3))} ? (~|{(8'hb0)}) : (((8'hbe) != (8'h9e)) ? (&(8'hb9)) : (!(8'hb9)))) ? (-(8'hbd)) : (|{((7'h44) ? (8'ha8) : (7'h42))})) ? ((({(8'hae)} == (&(8'h9f))) ? (((8'ha4) ? (8'haf) : (8'ha0)) ^ {(7'h41), (8'ha5)}) : {{(8'hb7)}, ((8'hbe) ? (8'hbe) : (8'hb3))}) ^ ((((8'ha3) <= (8'hba)) < ((8'hb6) ~^ (8'ha7))) <= ((~(8'h9d)) >> {(8'ha4), (7'h40)}))) : (((((8'hb6) ^ (7'h40)) > (8'hb2)) ? (&((8'hb2) || (8'ha9))) : (&((7'h40) <= (8'hb1)))) ? {(|{(8'h9d), (8'hb0)})} : ((~^{(7'h41), (7'h40)}) ? ((-(8'hbb)) ? ((8'h9f) + (8'hb9)) : (~^(8'ha6))) : ({(8'hab), (8'h9d)} ? ((8'hb7) ? (8'ha3) : (8'hb2)) : (|(8'hb5)))))), 
parameter param47 = ((({(^~param46), param46} != (((8'ha9) ? (8'ha0) : param46) ? (~param46) : ((8'hb2) ? param46 : param46))) ? ((param46 ? (^~param46) : (param46 ? param46 : param46)) ? ({param46} || (param46 ? param46 : param46)) : param46) : (^(~&param46))) <<< ((((param46 ? (8'h9f) : param46) ? {(7'h40), param46} : (param46 ? param46 : param46)) != param46) ? ((param46 ^ (param46 - param46)) ? (|param46) : ((param46 ^ param46) ? (param46 ? param46 : param46) : (param46 ? param46 : param46))) : ((^(&param46)) ? ((param46 >> param46) ? {param46, param46} : (param46 ? param46 : param46)) : ((!param46) ? {param46, param46} : param46)))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire13;
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire45,
                 wire43,
                 wire42,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire13,
                 reg44,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire13 = {(($signed(wire10[(2'h2):(1'h0)]) != (!{wire11})) | (^~(!$unsigned(wire10))))};
  module14 #() modinst26 (wire25, clk, wire9, wire12, wire11, wire10);
  assign wire27 = $signed($signed((wire10[(3'h4):(3'h4)] || ($signed(wire10) | wire11))));
  assign wire28 = (8'ha4);
  assign wire29 = $unsigned($signed(((-{wire27}) > ($signed(wire9) ?
                      (~&wire12) : (8'ha4)))));
  assign wire30 = $signed((wire11[(3'h7):(3'h7)] ?
                      wire28 : wire28[(4'hb):(1'h0)]));
  assign wire31 = {wire12};
  always
    @(posedge clk) begin
      reg32 <= ((wire30 ? wire29[(3'h4):(1'h0)] : wire31) ?
          (~(((wire28 >>> wire9) * wire9) >>> wire13[(1'h0):(1'h0)])) : ({wire12} & wire13));
      reg33 <= (|wire30);
      if ($signed(reg33[(4'hc):(2'h3)]))
        begin
          reg34 <= (wire12[(4'hb):(4'h8)] ^~ $unsigned({$unsigned({(8'ha7)})}));
          reg35 <= ((wire11[(3'h6):(1'h1)] | ($unsigned(wire13[(1'h0):(1'h0)]) + $unsigned({wire12}))) ?
              $signed($unsigned(wire31[(4'h8):(3'h4)])) : ($signed((wire31 > wire25)) ~^ (-(wire11[(4'h8):(3'h4)] ?
                  wire11[(3'h5):(3'h5)] : (&wire11)))));
          reg36 <= $unsigned({$unsigned({(wire31 ? wire9 : wire25)})});
        end
      else
        begin
          if ({(wire9 >= reg35)})
            begin
              reg34 <= (^wire9);
              reg35 <= ({{(wire28 ^ $unsigned(wire9))}, wire28} ?
                  ((reg33[(3'h4):(1'h1)] ?
                      ((reg36 ? wire11 : reg32) << (wire29 ?
                          reg36 : (8'hbc))) : $unsigned(reg32)) == $signed(reg32)) : $signed(reg36));
              reg36 <= reg36;
              reg37 <= wire28[(5'h11):(1'h1)];
            end
          else
            begin
              reg34 <= ((+(8'ha3)) && (~|{(!wire9)}));
            end
          reg38 <= wire13[(4'h8):(3'h5)];
          reg39 <= (~|{((8'hba) ? wire25[(1'h1):(1'h0)] : (8'h9c)),
              {{reg35[(1'h1):(1'h0)]}, wire27}});
          reg40 <= reg36[(3'h4):(1'h1)];
          reg41 <= $signed(reg34[(1'h0):(1'h0)]);
        end
    end
  assign wire42 = (^$signed(reg33[(3'h4):(2'h3)]));
  assign wire43 = reg40;
  always
    @(posedge clk) begin
      reg44 <= reg32;
    end
  assign wire45 = (reg32[(1'h1):(1'h1)] ?
                      reg39[(4'h8):(3'h7)] : $signed((!wire31)));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  assign y = {wire24, wire20, wire19, reg23, reg22, reg21, (1'h0)};
  assign wire19 = $unsigned($unsigned(wire15));
  assign wire20 = (|wire18[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg21 <= ($unsigned(wire19) ?
          (!({$unsigned(wire18), (wire19 << wire15)} + $signed((wire20 ?
              wire20 : wire19)))) : ((~|((wire19 <<< wire20) ?
              $signed(wire17) : wire20)) ^ ((wire16 <<< $unsigned(wire17)) ?
              ($signed((8'hbf)) ?
                  (wire15 + wire20) : $unsigned(wire15)) : (~wire16[(3'h6):(1'h0)]))));
      reg22 <= $signed((+(|(reg21[(1'h1):(1'h0)] ?
          wire20 : wire16[(2'h2):(1'h1)]))));
      reg23 <= wire17[(1'h1):(1'h1)];
    end
  assign wire24 = $unsigned((!(wire16[(3'h4):(1'h0)] ?
                      (~(reg22 <<< wire20)) : $signed({reg23}))));
endmodule

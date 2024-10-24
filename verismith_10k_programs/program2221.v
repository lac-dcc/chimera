module top
#(parameter param60 = (({{(-(8'hbd))}, {((8'hab) ? (8'h9f) : (8'h9f))}} ? ({(+(7'h42))} < ((-(8'hbf)) && ((8'ha0) ? (7'h40) : (8'hb5)))) : {(+((8'hb5) > (8'ha7))), (((8'h9c) ? (8'had) : (8'hb4)) ? {(8'ha3)} : ((8'h9f) && (8'haa)))}) ? (^(({(7'h43)} & {(8'ha4), (8'ha2)}) >> (-((8'ha0) ? (8'hb1) : (8'hac))))) : ((((8'ha6) >>> (|(8'hb7))) >>> (!(~^(8'hbf)))) ? ({(~|(8'ha5)), {(8'ha2)}} ? ((&(8'ha6)) ? (+(8'hb7)) : (~(8'h9c))) : (-(&(8'hac)))) : (~&({(8'hb5)} ? {(8'h9f)} : ((7'h40) ^~ (8'ha0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  assign y = {wire59, wire57, wire6, wire5, (1'h0)};
  assign wire5 = wire3[(3'h4):(1'h1)];
  assign wire6 = (wire5[(3'h5):(3'h4)] ?
                     $unsigned((-$unsigned((wire4 ~^ wire4)))) : (wire1[(2'h2):(1'h0)] ^~ (|((~^wire4) ?
                         {wire4} : wire0[(2'h3):(1'h1)]))));
  module7 #() modinst58 (wire57, clk, wire2, wire6, wire0, wire5);
  assign wire59 = wire6;
endmodule

module module7
#(parameter param55 = (8'ha8), 
parameter param56 = ((8'ha0) ~^ (8'hac)))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire26;
  assign y = {wire53, wire12, wire13, wire26, (1'h0)};
  assign wire12 = (+(($unsigned($signed((8'hba))) != $unsigned($unsigned((8'h9f)))) ?
                      ((wire8[(4'h8):(3'h4)] <= (wire9 != wire11)) ?
                          (((8'ha3) <<< wire8) ^~ wire8[(4'h8):(1'h1)]) : ((wire9 ?
                                  wire11 : wire8) ?
                              (wire11 >>> wire11) : (|wire10))) : (((8'hb5) ?
                              $unsigned(wire10) : $unsigned(wire10)) ?
                          (|{wire11}) : wire9)));
  assign wire13 = ({wire8[(2'h2):(2'h2)],
                      $unsigned(((wire10 >= wire12) && (wire9 == wire11)))} >> $signed((wire11[(1'h0):(1'h0)] ?
                      $signed(((8'h9e) ?
                          (8'hac) : wire9)) : $signed($signed(wire10)))));
  module14 #() modinst27 (.clk(clk), .wire18(wire8), .wire19(wire13), .y(wire26), .wire16(wire12), .wire17(wire9), .wire15(wire11));
  module28 #() modinst54 (.wire32(wire9), .wire30(wire13), .wire29(wire11), .clk(clk), .wire31(wire10), .y(wire53));
endmodule

module module28
#(parameter param52 = {((-(~^(8'hbb))) ? ((((7'h44) != (8'h9c)) >>> ((8'hb2) != (8'hb2))) <= (~|((8'hbc) ^ (8'h9f)))) : ((^{(8'ha2), (8'haf)}) <<< (((8'hb0) > (8'hac)) != ((7'h40) ^~ (8'hb9)))))})
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg51,
                 reg50,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire33 = $unsigned(((((wire30 ? (7'h42) : wire32) ?
                      (wire32 <<< wire30) : $signed(wire31)) ^ $unsigned((-wire32))) + (($signed(wire30) == {wire32}) ?
                      (7'h40) : (wire32[(1'h1):(1'h1)] ?
                          {wire29, wire31} : wire32[(4'ha):(3'h6)]))));
  assign wire34 = $unsigned($signed({(wire32 ?
                          ((8'hb7) ? wire31 : (8'hac)) : (~wire33))}));
  assign wire35 = wire32;
  assign wire36 = ((({wire29[(2'h2):(1'h0)]} > $unsigned({wire30})) ?
                      $unsigned({(|wire31),
                          ((8'hbb) & wire30)}) : ($signed((wire33 >> (8'ha1))) - $unsigned((~^(8'hac))))) ^~ wire35);
  always
    @(posedge clk) begin
      if ($signed((wire36 ?
          wire30[(2'h2):(1'h1)] : (((&wire36) > $unsigned(wire29)) ?
              (+$signed(wire36)) : ((-(8'hbe)) ?
                  wire36[(4'hb):(3'h5)] : {wire32, wire35})))))
        begin
          reg37 <= (|(wire30[(1'h0):(1'h0)] ^ $unsigned((~^wire35[(3'h7):(3'h7)]))));
          reg38 <= ((!(~|wire29[(2'h2):(1'h1)])) ?
              ((-($unsigned(wire32) ?
                      (wire32 << wire29) : reg37[(3'h4):(1'h0)])) ?
                  (wire33[(3'h4):(2'h2)] ^ $signed((8'ha7))) : (wire31 > (!$signed(wire34)))) : $signed((~|(^{wire33}))));
          if ($unsigned(wire29[(1'h0):(1'h0)]))
            begin
              reg39 <= wire36;
              reg40 <= $signed(((wire36[(3'h6):(1'h1)] && wire32) - wire35));
              reg41 <= $signed({$signed(({(8'ha9)} ? (~|wire32) : wire36))});
            end
          else
            begin
              reg39 <= ($unsigned(wire36[(4'hb):(3'h6)]) ? wire33 : wire35);
              reg40 <= reg41[(3'h6):(3'h5)];
              reg41 <= (reg39 ?
                  (-(((~reg39) - reg39) ?
                      $signed($signed(reg40)) : reg37[(2'h2):(1'h0)])) : (|reg38));
            end
          reg42 <= (~|$unsigned(reg39[(1'h0):(1'h0)]));
        end
      else
        begin
          reg37 <= (wire29 ?
              wire35 : (((((8'hb2) ?
                      wire33 : wire32) <<< $signed((8'hb3))) - reg40) ?
                  (7'h40) : wire31[(1'h0):(1'h0)]));
          reg38 <= $unsigned(reg39[(3'h6):(3'h5)]);
          if ($signed(reg41))
            begin
              reg39 <= ($signed($signed($unsigned(reg40))) ?
                  reg42[(3'h5):(3'h4)] : ($signed((8'hb4)) ?
                      (&(8'hb2)) : wire30));
              reg40 <= (8'ha7);
            end
          else
            begin
              reg39 <= $unsigned(((wire34 - (wire32 - $signed(wire34))) != {reg39[(3'h4):(2'h2)]}));
              reg40 <= wire34[(2'h3):(2'h3)];
              reg41 <= (&(~&(((reg40 ? wire34 : reg39) ?
                  (wire32 <<< reg40) : reg40[(3'h4):(1'h0)]) | {(wire34 ?
                      reg42 : wire35)})));
            end
        end
      reg43 <= reg40;
      reg44 <= {$unsigned($unsigned({(8'ha5), $signed(wire31)}))};
      reg45 <= ((wire36[(3'h5):(2'h2)] - {((~|wire36) ?
                  reg37 : $unsigned(wire33))}) ?
          $unsigned(reg43) : wire34[(1'h1):(1'h1)]);
      reg46 <= $signed(wire35);
    end
  assign wire47 = $unsigned((~&(!$signed((8'ha2)))));
  assign wire48 = (~^$signed(reg38));
  assign wire49 = {($signed((wire29 ? wire36[(3'h6):(3'h6)] : wire33)) ?
                          wire34[(3'h4):(1'h0)] : reg38),
                      ($unsigned($signed((reg45 ? wire48 : wire32))) ?
                          (wire34[(3'h4):(3'h4)] > wire48) : wire35)};
  always
    @(posedge clk) begin
      reg50 <= reg41;
      reg51 <= wire35[(4'ha):(3'h4)];
    end
endmodule

module module14
#(parameter param24 = (8'h9f), 
parameter param25 = (param24 || (~|(+param24))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  assign y = {wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = wire16;
  assign wire21 = wire19;
  assign wire22 = wire17[(1'h1):(1'h1)];
  assign wire23 = wire15;
endmodule

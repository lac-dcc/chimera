module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire80;
  assign y = {wire5, wire6, wire7, wire22, wire24, wire80, (1'h0)};
  assign wire5 = (~^wire2[(1'h0):(1'h0)]);
  assign wire6 = ($unsigned($signed($unsigned(wire4))) ^ wire0);
  assign wire7 = $unsigned(wire1);
  module8 #() modinst23 (.wire12(wire2), .wire11(wire0), .wire9(wire4), .y(wire22), .wire10(wire5), .clk(clk));
  assign wire24 = wire2;
  module25 #() modinst81 (.wire28(wire3), .wire29(wire2), .clk(clk), .wire27(wire1), .wire30(wire4), .y(wire80), .wire26(wire6));
endmodule

module module25
#(parameter param79 = ((|((~^{(8'ha0), (8'ha2)}) ? ((^~(8'hac)) ? ((8'h9c) ? (8'hb4) : (8'h9e)) : ((7'h42) * (8'hb5))) : (&((8'h9e) ? (8'hb1) : (8'hb8))))) == (~^(|(&((8'hb0) >> (8'ha6)))))))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire52;
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire54,
                 wire52,
                 (1'h0)};
  module31 #() modinst53 (.wire33(wire28), .wire34(wire29), .clk(clk), .y(wire52), .wire35(wire30), .wire32(wire26));
  assign wire54 = $signed((~&wire29));
  module55 #() modinst71 (wire70, clk, wire52, wire28, wire27, wire54);
  assign wire72 = $unsigned((^($signed((wire26 << (8'haa))) ?
                      ((|wire52) ^ {wire52}) : $unsigned($unsigned(wire29)))));
  assign wire73 = ({(wire54 ^~ $unsigned((wire54 + (8'hbd)))),
                      $signed((wire27 != (wire30 < (8'hb7))))} - (wire52 ?
                      wire26[(4'he):(4'hc)] : ($signed((wire26 ^ (8'ha4))) <<< (((8'ha3) < wire30) ?
                          wire28 : (wire54 ? (8'hb5) : wire28)))));
  assign wire74 = ({wire29, wire54[(1'h0):(1'h0)]} << wire72);
  assign wire75 = wire52[(2'h2):(1'h1)];
  assign wire76 = $signed($unsigned(wire52));
  assign wire77 = wire29;
  assign wire78 = ({((+$unsigned(wire52)) ?
                          ((wire30 > wire54) + (wire72 ?
                              wire77 : wire70)) : (!wire54[(4'hd):(4'h8)]))} != ($signed(wire26) ?
                      {wire30[(3'h6):(3'h6)]} : {(wire28 | wire74[(3'h6):(3'h5)])}));
endmodule

module module8
#(parameter param21 = (!({(^((8'ha6) ? (8'had) : (8'hb1))), (((8'hb2) | (8'hbd)) ? {(8'hbb), (8'hb2)} : ((8'haa) ? (8'hbe) : (8'hac)))} ? ({((8'hbd) ? (8'ha1) : (8'h9c))} ? (((8'haf) ? (8'hbf) : (8'hb3)) <= {(8'hbf)}) : (!((8'had) ^ (8'hbf)))) : {{((8'hb9) ? (7'h40) : (8'had))}, (((8'ha7) | (8'hb2)) != ((8'hb8) ? (8'hb8) : (8'hb9)))})))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= wire12[(3'h4):(2'h3)];
      reg14 <= $unsigned((8'hb5));
      reg15 <= (((wire11 + $unsigned($unsigned(wire11))) ?
          $signed((~&(wire11 >= (8'ha8)))) : wire10[(1'h1):(1'h0)]) >= $unsigned(wire10[(4'hc):(3'h5)]));
      reg16 <= (^wire9);
    end
  assign wire17 = reg14;
  assign wire18 = ((($unsigned((reg15 <<< (8'hae))) == reg15) ^ wire9) ?
                      (^~(~^(~(wire9 ?
                          wire9 : reg14)))) : $unsigned($unsigned({{wire9}})));
  assign wire19 = $unsigned(((reg15[(2'h2):(1'h1)] ~^ (wire18[(2'h2):(1'h1)] ?
                      wire12 : $signed(reg15))) < reg16[(1'h0):(1'h0)]));
  assign wire20 = $signed(wire17[(4'h8):(1'h0)]);
endmodule

module module55
#(parameter param68 = (|{(~|(((8'ha3) | (8'ha7)) ? ((8'hbf) ? (8'ha5) : (8'ha0)) : ((8'hb0) ? (8'hae) : (8'hbf)))), (8'ha9)}), 
parameter param69 = ({param68} * param68))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire [(3'h7):(1'h0)] wire57;
  input wire signed [(4'h9):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 (1'h0)};
  assign wire60 = {wire57};
  assign wire61 = $unsigned(((8'hab) && $signed(wire58[(3'h7):(1'h1)])));
  assign wire62 = $unsigned((8'ha9));
  assign wire63 = $signed(wire56);
  assign wire64 = wire63;
  assign wire65 = ((8'hba) ? wire59[(2'h3):(2'h2)] : (-$signed((8'hb9))));
  assign wire66 = ((|(^~(-((7'h41) ?
                      (8'h9c) : wire63)))) ^ wire59[(3'h4):(2'h3)]);
  assign wire67 = (+$signed((8'hbf)));
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire [(4'h8):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire signed [(3'h4):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire36 = wire32;
  assign wire37 = wire35;
  assign wire38 = $signed($signed((8'ha4)));
  assign wire39 = ((wire38 != wire32) && (((~^(wire34 ?
                      wire35 : wire34)) >>> $signed(wire37)) >> wire36));
  assign wire40 = (&$unsigned((((^~wire38) ?
                          ((8'h9e) ? wire36 : wire33) : wire36) ?
                      (8'ha3) : wire39[(2'h2):(1'h0)])));
  assign wire41 = ((wire40[(1'h1):(1'h0)] + {$unsigned((wire39 >> wire38))}) ?
                      $signed(wire36[(5'h13):(4'h9)]) : (wire34[(3'h6):(2'h2)] == {$signed({wire36,
                              wire32})}));
  always
    @(posedge clk) begin
      reg42 <= (8'hb4);
      if ((wire37[(3'h5):(1'h0)] << (((wire33 ?
              {wire35, wire37} : $unsigned((8'h9e))) << $unsigned(wire33)) ?
          (|(wire41 << wire32[(1'h1):(1'h0)])) : $unsigned(wire37))))
        begin
          if ((^~wire36))
            begin
              reg43 <= ((((~$unsigned(wire41)) + wire36) >> $signed(({wire41} != $signed((8'h9d))))) <<< wire39[(1'h0):(1'h0)]);
              reg44 <= $signed(wire34);
              reg45 <= wire41;
              reg46 <= ((wire37 ?
                  wire38 : $unsigned((((7'h42) ? reg42 : (8'ha1)) ^ ((8'hb3) ?
                      reg45 : wire34)))) != $signed(wire35));
              reg47 <= ({(wire38[(2'h2):(1'h0)] >> $signed((reg42 | wire35))),
                      ($unsigned((~^wire41)) ?
                          $unsigned((wire40 ?
                              wire41 : reg43)) : (wire34[(3'h5):(1'h0)] ?
                              $signed(reg43) : ((7'h41) | wire40)))} ?
                  $signed((wire37[(4'ha):(3'h6)] ^~ $signed((wire33 ?
                      reg43 : (8'hba))))) : $signed(({reg46,
                          wire40[(2'h2):(1'h0)]} ?
                      $unsigned((wire32 ?
                          reg44 : reg44)) : ($signed(wire32) << wire38))));
            end
          else
            begin
              reg43 <= $signed($unsigned((reg42[(2'h2):(1'h0)] ?
                  wire38[(3'h4):(3'h4)] : wire33[(1'h0):(1'h0)])));
              reg44 <= (^~(+(&$unsigned((8'hac)))));
              reg45 <= $unsigned(reg47[(2'h2):(1'h0)]);
            end
          reg48 <= reg45;
        end
      else
        begin
          reg43 <= {({(^~((8'hbe) ? (8'ha8) : wire39)),
                      ((wire41 ? wire37 : wire40) ?
                          $unsigned(wire35) : $signed(wire41))} ?
                  wire39 : {wire38, $unsigned((reg44 ? wire35 : wire35))}),
              wire33[(3'h4):(1'h0)]};
          reg44 <= reg46[(2'h3):(2'h2)];
        end
      reg49 <= (!(($unsigned((reg43 >> wire39)) & {wire41,
          {wire37}}) ^ (($signed(wire34) <<< (~^reg42)) >> $signed((+wire37)))));
      reg50 <= reg43[(2'h2):(2'h2)];
      reg51 <= $signed($unsigned(wire37));
    end
endmodule

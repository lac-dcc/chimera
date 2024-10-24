module top
#(parameter param68 = ((((((8'ha3) << (8'hb7)) ? ((8'h9e) ? (7'h40) : (8'hba)) : ((8'hbb) ? (7'h44) : (8'ha7))) ? {(^(8'h9c)), {(8'hb9)}} : (~|((8'hb8) ? (8'hb0) : (8'hb0)))) ? (({(8'hb4)} >>> {(8'hbd), (8'h9f)}) ? (((8'h9c) ? (7'h42) : (8'hb5)) ? {(8'ha2), (8'ha4)} : {(8'hb4), (8'ha0)}) : (!((8'hb7) ? (7'h44) : (8'hab)))) : ((~|(^~(8'h9f))) ? (((8'hab) ? (8'haa) : (8'hb4)) >>> ((8'ha0) ? (8'hba) : (8'h9c))) : (^~(~|(8'ha3))))) ? (~^((~|((7'h42) ? (8'hb2) : (7'h41))) ? (~&((7'h41) ? (8'ha3) : (7'h43))) : ((^(7'h43)) ? (7'h41) : ((8'hb1) * (8'hbc))))) : {(((-(8'hba)) ~^ ((8'haa) == (8'ha7))) > ((&(8'h9c)) ~^ ((8'h9e) ? (8'hbe) : (8'hbd))))}), 
parameter param69 = ((param68 ? param68 : (+param68)) ? param68 : (8'h9f)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire62;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire42,
                 wire5,
                 wire4,
                 wire44,
                 wire45,
                 wire62,
                 (1'h0)};
  assign wire4 = $unsigned((wire3[(3'h6):(3'h4)] < {$signed($signed(wire1)),
                     {(|wire0), wire3[(2'h2):(1'h1)]}}));
  assign wire5 = (wire0 ?
                     wire3 : ($unsigned(wire1[(4'hb):(3'h5)]) << {$unsigned((|wire0))}));
  module6 #() modinst43 (wire42, clk, wire5, wire3, wire1, wire0, wire4);
  assign wire44 = (7'h41);
  assign wire45 = $signed($unsigned(($unsigned($unsigned(wire3)) - $unsigned(((8'hb1) ?
                      wire3 : wire5)))));
  module46 #() modinst63 (wire62, clk, wire0, wire2, wire42, wire4, wire1);
  assign wire64 = wire42[(3'h6):(2'h3)];
  assign wire65 = $signed($signed($signed((+wire3[(4'hf):(1'h1)]))));
  assign wire66 = (~^$signed(wire5));
  assign wire67 = wire44[(1'h0):(1'h0)];
endmodule

module module46
#(parameter param61 = ((+((~^(~^(8'hbf))) ? (8'hb7) : ({(8'hb5)} ? ((8'hb5) ? (8'ha2) : (7'h40)) : (+(7'h41))))) == (((((7'h43) <<< (8'hae)) * ((8'ha2) | (8'ha5))) ~^ (((8'hb3) ? (8'hb3) : (8'hb9)) - ((8'h9d) < (8'hb0)))) + {(((8'haf) - (8'hb9)) && {(8'ha2), (8'ha5)}), ((|(8'hbb)) - ((8'hb4) <= (8'hb3)))})))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire51;
  input wire signed [(3'h7):(1'h0)] wire50;
  input wire [(3'h6):(1'h0)] wire49;
  input wire [(4'hb):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire53,
                 wire52,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire52 = $unsigned((wire47[(4'h9):(3'h4)] ^ (wire49[(1'h0):(1'h0)] << wire47[(2'h2):(1'h0)])));
  assign wire53 = $signed(wire48);
  always
    @(posedge clk) begin
      reg54 <= wire50[(2'h3):(1'h0)];
      reg55 <= $signed($signed(wire48[(4'hb):(2'h2)]));
      reg56 <= (($signed({$signed(wire50)}) <<< ((~$unsigned(wire48)) * wire51[(1'h1):(1'h0)])) | reg55);
      reg57 <= $signed((+wire49[(3'h6):(2'h3)]));
    end
  assign wire58 = (^{$signed(wire53)});
  assign wire59 = $unsigned($unsigned((|$unsigned(((7'h40) || reg54)))));
  assign wire60 = (^$signed(wire58[(1'h0):(1'h0)]));
endmodule

module module6
#(parameter param40 = (|((~^{((8'hb3) ? (7'h44) : (8'h9d))}) ? ((8'h9c) ? (((7'h41) ? (8'had) : (8'h9c)) ? ((8'ha0) ? (8'hb9) : (8'ha2)) : (~^(8'ha1))) : (((8'hb6) >> (8'ha6)) >= (8'hac))) : (!(((8'hb6) ? (8'hbd) : (8'hb9)) > ((8'h9f) * (8'hae)))))), 
parameter param41 = ({(((param40 ? param40 : param40) ~^ param40) ? param40 : ({param40} ? (~^param40) : (^param40))), param40} ? (~&(!(!(-param40)))) : param40))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire35;
  assign y = {wire39, wire38, wire37, wire12, wire35, (1'h0)};
  assign wire12 = wire10[(3'h4):(2'h2)];
  module13 #() modinst36 (.wire18(wire7), .wire15(wire8), .clk(clk), .wire14(wire10), .wire17(wire9), .wire16(wire11), .y(wire35));
  assign wire37 = $unsigned((~|(~(^~{wire11, wire9}))));
  assign wire38 = (($signed($signed($unsigned(wire35))) & wire35) * (+(^~{$unsigned(wire10),
                      (wire8 ? wire10 : wire9)})));
  assign wire39 = wire10;
endmodule

module module13
#(parameter param33 = (!{((((7'h40) ? (8'h9e) : (8'hac)) ? ((8'haf) >= (8'hab)) : {(8'haa), (8'ha5)}) ? (((8'ha1) << (7'h40)) <= ((8'h9d) >>> (7'h43))) : ((!(8'hbe)) ? {(8'ha2), (8'hb1)} : ((8'h9c) || (8'h9f)))), (((~^(8'hb8)) ? {(8'hbf)} : ((8'ha9) ? (8'hbd) : (8'haa))) ? {((8'hb2) ? (8'ha5) : (8'hb4))} : (((8'h9e) ? (7'h43) : (8'hbb)) == (|(8'hb4))))}), 
parameter param34 = param33)
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire21,
                 wire20,
                 wire19,
                 reg32,
                 reg31,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = $unsigned($signed($unsigned({(~|wire17)})));
  assign wire20 = (~|$unsigned((~wire18)));
  assign wire21 = $unsigned($unsigned((((wire20 >= wire15) * wire16[(2'h2):(1'h1)]) ?
                      $signed(wire15) : (wire17[(2'h3):(1'h0)] ^ (~|wire17)))));
  always
    @(posedge clk) begin
      reg22 <= $unsigned((({wire21,
          (~|(8'ha3))} >> $unsigned($signed(wire18))) - (8'hbf)));
      reg23 <= wire18;
      reg24 <= $unsigned(((~|{$signed(wire17)}) ^~ $signed((^{wire20,
          wire19}))));
      reg25 <= $signed(((^~{reg22[(1'h0):(1'h0)]}) ?
          (8'hb2) : wire20[(3'h4):(1'h0)]));
    end
  assign wire26 = (8'ha2);
  assign wire27 = ((~|wire14[(2'h2):(1'h1)]) ?
                      $signed((~&$unsigned(reg25[(1'h1):(1'h1)]))) : ($unsigned((|(wire16 ?
                              wire14 : wire14))) ?
                          (((wire15 ?
                              (8'hb5) : reg22) << $unsigned(wire19)) < $signed($signed((7'h44)))) : $signed(((wire17 != reg23) ?
                              wire21[(2'h2):(2'h2)] : (8'ha5)))));
  assign wire28 = (~|wire20[(4'ha):(2'h2)]);
  assign wire29 = ($signed(reg24[(1'h1):(1'h0)]) ?
                      ((^~$signed($unsigned(wire14))) ?
                          (8'ha3) : (+$unsigned($signed(reg22)))) : (~^(((wire20 ?
                              wire16 : reg22) ?
                          wire28[(2'h3):(2'h2)] : wire27[(3'h5):(2'h3)]) != wire16[(1'h1):(1'h0)])));
  assign wire30 = reg23;
  always
    @(posedge clk) begin
      reg31 <= $unsigned((((wire28[(4'hc):(3'h5)] > (wire27 >>> reg22)) != ($signed(wire30) ?
          reg25 : (&wire21))) || (~&wire19[(2'h2):(1'h0)])));
      reg32 <= wire17;
    end
endmodule

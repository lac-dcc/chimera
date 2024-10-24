module top
#(parameter param57 = (((^(!((8'ha3) ^ (8'ha0)))) ? (((!(8'hb6)) ^~ (~^(8'hb6))) << ((+(8'hbd)) + (~|(8'hb2)))) : ((((8'ha7) || (8'hb0)) != (8'hb9)) ? (~&(8'hbe)) : ((+(8'ha5)) ? (~^(8'hbd)) : ((8'haa) ^~ (8'h9d))))) ? (({{(8'hb3), (8'hba)}, (-(8'hb0))} ~^ ((8'ha8) ? (^(8'h9e)) : (~^(8'ha5)))) ? (((7'h44) && ((8'ha6) << (8'hbd))) | ((~(7'h40)) ? ((8'hb5) ? (8'haa) : (8'ha6)) : ((8'hb7) != (8'ha0)))) : ((((7'h44) ? (8'haf) : (8'haa)) ? {(8'ha3), (8'hb8)} : (8'ha9)) | (((8'hab) << (8'hb8)) ? (&(8'hba)) : ((8'ha7) ^ (8'ha2))))) : ((^~{{(8'hb8)}, ((8'hb7) ~^ (8'ha9))}) ? ((8'h9e) ^ (~|((8'hb9) == (8'ha3)))) : (~&((-(8'haf)) ? ((8'h9f) ? (8'hbb) : (7'h42)) : {(8'haf), (8'ha6)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire52;
  assign y = {wire56, wire55, wire54, wire4, wire52, (1'h0)};
  assign wire4 = $unsigned(wire1);
  module5 #() modinst53 (wire52, clk, wire4, wire3, wire2, wire1, wire0);
  assign wire54 = wire52;
  assign wire55 = {(8'ha1), (^$signed($unsigned(wire0[(2'h2):(2'h2)])))};
  assign wire56 = wire4[(3'h4):(1'h1)];
endmodule

module module5
#(parameter param50 = (((((!(8'hac)) ? ((8'hb3) || (8'hbe)) : ((8'hbe) >>> (8'hb0))) + ({(8'ha0)} != ((8'ha7) ? (8'hbf) : (8'hb6)))) * (8'hba)) ? (^~((~^((8'hac) ? (8'h9d) : (8'h9e))) * (!((8'ha0) ? (8'hb7) : (8'hac))))) : ({{((8'hb5) ? (8'hb4) : (7'h44))}} >>> (^~((~(8'hb6)) <<< {(8'hab)})))), 
parameter param51 = (!{param50}))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire6;
  input wire [(2'h3):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire44;
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire44,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire11 = $signed(($signed($unsigned($unsigned(wire6))) ?
                      wire8[(1'h1):(1'h1)] : $signed(wire9[(1'h0):(1'h0)])));
  assign wire12 = (wire10[(1'h0):(1'h0)] | (wire8[(3'h4):(2'h3)] ?
                      wire7 : (8'h9d)));
  assign wire13 = wire10;
  assign wire14 = $signed(wire8);
  assign wire15 = wire8[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg16 <= (~|($signed((wire10[(2'h2):(1'h1)] ^~ (8'h9d))) ?
          (wire12[(1'h1):(1'h1)] ?
              wire6 : $unsigned((~^wire9))) : $unsigned((7'h40))));
      reg17 <= $signed($signed($signed(wire9)));
    end
  module18 #() modinst45 (wire44, clk, wire13, reg16, wire8, wire10);
  assign wire46 = reg16[(2'h3):(1'h0)];
  assign wire47 = wire6[(2'h2):(2'h2)];
  assign wire48 = reg16[(1'h0):(1'h0)];
  assign wire49 = (~^$unsigned((((wire8 ? (8'ha6) : wire9) | {wire6,
                      wire46}) == (!$signed(reg17)))));
endmodule

module module18
#(parameter param42 = (({(((8'hb1) >> (8'ha5)) ~^ {(8'ha3)})} ^~ (~|(8'hac))) ? (((((8'hb9) != (8'hb7)) ? ((8'hb1) >> (8'haf)) : ((8'hb1) || (8'ha1))) ? (^~((7'h42) < (8'hbc))) : ((^~(8'hae)) ? (^~(8'ha8)) : ((8'hb2) <<< (8'ha8)))) ^~ {(((8'h9e) >= (8'h9c)) ? ((7'h44) ~^ (8'hae)) : {(7'h40), (8'ha3)})}) : {{(-{(7'h41), (8'hb2)}), ({(8'hbd), (8'ha0)} & ((8'ha4) ? (8'ha5) : (7'h42)))}}), 
parameter param43 = (param42 == param42))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(2'h3):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg28,
                 (1'h0)};
  assign wire23 = wire21[(2'h3):(1'h1)];
  assign wire24 = $signed(wire21);
  assign wire25 = (+wire22);
  assign wire26 = ($signed(wire24[(3'h4):(1'h0)]) ?
                      {$signed($unsigned(((8'hae) - wire19)))} : $signed((~^(!$unsigned(wire19)))));
  assign wire27 = $unsigned($signed(($unsigned((wire23 ? wire25 : wire20)) ?
                      $unsigned(wire24) : wire24[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg28 <= {wire21[(2'h2):(1'h1)]};
    end
  assign wire29 = ($signed(((^wire24[(4'h8):(4'h8)]) ?
                          wire27 : wire25[(1'h1):(1'h0)])) ?
                      wire19 : $unsigned(wire22));
  assign wire30 = ({(wire20 * $signed((wire29 ? wire23 : reg28))),
                          ((^$signed(wire26)) ?
                              wire25[(2'h2):(1'h1)] : ((wire23 >= wire25) ?
                                  $signed((8'ha1)) : $signed((8'hbb))))} ?
                      wire21 : (^~$signed({$unsigned(wire27)})));
  assign wire31 = $signed($signed((^(~wire23[(1'h1):(1'h0)]))));
  assign wire32 = wire30;
  assign wire33 = ($unsigned(({reg28} != wire24)) ? reg28 : wire26);
  always
    @(posedge clk) begin
      if ($unsigned((wire32 >> ($unsigned((wire31 != reg28)) ?
          ((^~wire21) & wire25) : (!wire33[(4'h8):(1'h0)])))))
        begin
          reg34 <= $signed($unsigned((!wire20)));
          reg35 <= $unsigned(wire30);
          reg36 <= $unsigned((wire22[(3'h4):(1'h1)] || $unsigned(wire32[(1'h0):(1'h0)])));
        end
      else
        begin
          reg34 <= wire30;
        end
      reg37 <= wire25;
      reg38 <= $signed($signed(($signed((wire32 - wire30)) ?
          reg35[(4'h8):(2'h3)] : {$signed(wire21), {(8'hb2)}})));
    end
  assign wire39 = ($signed($unsigned($unsigned({reg38}))) <<< ((~&(!(|wire31))) << (-reg36)));
  assign wire40 = (&($unsigned($unsigned((wire21 && (8'hb1)))) ?
                      (!(+(wire39 < (8'ha3)))) : $unsigned($signed({reg36}))));
  assign wire41 = $unsigned(wire31[(1'h0):(1'h0)]);
endmodule

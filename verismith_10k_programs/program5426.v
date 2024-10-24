module top
#(parameter param17 = (~&{{(((8'hb9) ? (8'hbc) : (8'hb1)) <= ((8'hb7) ? (8'hb5) : (8'h9c)))}, {((^(8'hb7)) ? ((8'hb6) ? (8'hac) : (8'hb4)) : (8'ha5)), (8'hac)}}), 
parameter param18 = ((~|(((param17 ? (7'h44) : (8'hb2)) ? param17 : (param17 - (8'hb6))) ? {(param17 ? param17 : param17)} : param17)) ? param17 : {((^(param17 <<< param17)) ? (^~{param17, param17}) : (param17 ^ param17)), (({param17} << param17) ? {(param17 ? param17 : param17), (|param17)} : (~|(param17 ? param17 : param17)))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire16,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = (($signed((|$signed(wire0))) ?
                         (($signed(wire3) ?
                                 (wire3 ? wire4 : (8'ha5)) : (wire2 & wire0)) ?
                             $signed((8'haa)) : (!{wire3,
                                 wire0})) : wire2[(4'ha):(3'h4)]) ?
                     (~&(wire0 ?
                         wire4 : $unsigned(wire1[(1'h1):(1'h0)]))) : (7'h44));
  assign wire6 = (-$signed($unsigned(((-(8'hac)) ?
                     (~^wire2) : $signed(wire0)))));
  assign wire7 = {(~|(($unsigned((7'h41)) ?
                             (wire2 ? wire1 : wire2) : $unsigned((8'hb9))) ?
                         $unsigned($unsigned(wire6)) : (wire4 ?
                             $unsigned(wire5) : (^wire5))))};
  assign wire8 = $signed(wire0[(1'h1):(1'h0)]);
  assign wire9 = (wire3[(1'h0):(1'h0)] > wire5[(2'h2):(1'h0)]);
  assign wire10 = ($signed(wire8) ~^ $signed($signed($signed({(8'hb1)}))));
  assign wire11 = $signed(wire1);
  assign wire12 = (&$signed((^((wire3 ? wire7 : wire7) ? wire0 : (~^wire4)))));
  always
    @(posedge clk) begin
      reg13 <= wire9[(3'h7):(3'h5)];
      reg14 <= {($signed($signed((wire3 ?
              wire11 : wire0))) | ($unsigned((wire2 != wire8)) ?
              wire2 : $unsigned($signed((8'hb5))))),
          wire11[(4'hf):(3'h4)]};
      reg15 <= ((~reg13) >>> wire12[(2'h2):(1'h1)]);
    end
  assign wire16 = $signed(wire12);
endmodule

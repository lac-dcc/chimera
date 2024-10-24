module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire27, wire26, wire24, wire6, wire5, (1'h0)};
  assign wire5 = ($signed(wire2) & wire2);
  assign wire6 = ($unsigned($unsigned(($signed(wire1) ?
                         (wire5 << (8'ha8)) : $signed(wire2)))) ?
                     wire3[(1'h1):(1'h1)] : (|wire5[(5'h10):(4'h9)]));
  module7 #() modinst25 (.wire11(wire0), .wire10(wire3), .clk(clk), .wire8(wire5), .y(wire24), .wire9(wire1));
  assign wire26 = ($signed($signed({wire5})) - $unsigned(wire24));
  assign wire27 = wire0;
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(4'h8):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire8))
        begin
          reg12 <= wire10;
          reg13 <= $unsigned((((~$signed(wire8)) ?
              {(wire8 ? wire10 : wire9),
                  (^wire9)} : (~&$signed(wire11))) | ((!(-wire8)) ?
              (~(8'h9c)) : wire11)));
          reg14 <= ((((wire11 > (8'ha6)) - $signed((reg13 != reg13))) | ({{reg12,
                          wire10}} ?
                  {{reg12}, (wire11 ? wire8 : wire9)} : $unsigned((~&reg13)))) ?
              wire10[(3'h4):(2'h2)] : $unsigned((|$unsigned($signed((8'hbf))))));
          reg15 <= (~^{(~^(((8'haa) && (8'hb4)) ?
                  (8'hae) : (wire11 ? wire10 : wire11))),
              reg14[(3'h6):(2'h3)]});
          reg16 <= $signed(wire10);
        end
      else
        begin
          reg12 <= reg16;
          if ($unsigned((^$unsigned(reg14))))
            begin
              reg13 <= $unsigned((reg14 != (&($unsigned(reg14) ~^ (wire8 ^~ reg15)))));
              reg14 <= $unsigned(reg14);
            end
          else
            begin
              reg13 <= (reg12 || (^(((reg13 >= wire10) == $unsigned(reg14)) ^~ reg14[(3'h5):(3'h4)])));
              reg14 <= $unsigned(reg13);
            end
          reg15 <= reg15;
          if (reg13)
            begin
              reg16 <= $unsigned($signed($signed($signed(((8'ha9) ?
                  reg15 : wire9)))));
              reg17 <= $signed($unsigned($unsigned((~reg13))));
              reg18 <= (8'hb8);
            end
          else
            begin
              reg16 <= (~|($signed(reg14[(3'h4):(1'h0)]) ?
                  (|(&(reg16 ? wire8 : reg12))) : $unsigned(((wire10 ?
                      (8'ha1) : reg12) != (~^reg17)))));
              reg17 <= (8'hbd);
            end
          reg19 <= reg12[(1'h0):(1'h0)];
        end
      reg20 <= wire8[(4'h8):(2'h3)];
    end
  assign wire21 = reg16[(3'h5):(2'h3)];
  assign wire22 = (&reg14[(2'h3):(1'h1)]);
  assign wire23 = wire8[(4'h9):(3'h6)];
endmodule

module top
#(parameter param17 = ({(8'haf)} ? (((((7'h44) ? (7'h43) : (8'hb6)) - {(8'ha6)}) ? ({(7'h43)} ^~ ((8'ha4) ? (8'hb3) : (8'hb2))) : (((8'ha5) ? (8'hae) : (8'h9f)) ? {(8'ha7), (8'ha6)} : ((8'ha3) ? (8'hba) : (8'hb6)))) > ((7'h40) ? (~&((8'ha2) ? (8'h9c) : (8'hb2))) : (((8'hba) ? (8'hbb) : (7'h40)) ^ (~|(8'hbb))))) : (-(!((|(8'hac)) ? ((8'ha6) <= (8'h9f)) : ((8'ha0) ? (8'hbd) : (8'ha0)))))), 
parameter param18 = ((((~|(param17 | param17)) - ((param17 ~^ param17) ? param17 : (param17 ? param17 : param17))) ? ((7'h44) ^ ((param17 ? (8'h9c) : (8'hbe)) ? (param17 <= param17) : (param17 ? param17 : (8'hb6)))) : {{param17}}) ? param17 : (8'h9d)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = ((wire2 * wire0[(4'hc):(4'hc)]) ^~ ((8'haf) ?
                     $unsigned((8'hb4)) : wire1[(5'h15):(4'hf)]));
  assign wire5 = {(+$signed(wire1[(4'hc):(4'hb)]))};
  assign wire6 = (wire0 ?
                     $unsigned($signed(wire1[(5'h11):(4'hd)])) : ($unsigned(wire1) ^~ $unsigned($unsigned($signed((8'hb1))))));
  assign wire7 = $signed($signed((&($signed(wire1) ?
                     $signed(wire3) : (~&wire2)))));
  assign wire8 = wire3;
  assign wire9 = $signed(wire3[(2'h2):(2'h2)]);
  assign wire10 = $unsigned($signed($signed(wire4[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg11 <= ((($signed((wire3 == (8'hbe))) ?
              {(8'ha2), $signed(wire9)} : $unsigned($signed(wire8))) || wire9) ?
          {wire3[(4'hf):(3'h5)]} : $unsigned({(!(7'h42))}));
      reg12 <= wire7;
      reg13 <= (7'h43);
      reg14 <= (($signed(wire3) ?
              ((wire2 * wire7) > (wire2[(4'hb):(2'h3)] ?
                  wire7 : wire4)) : (((-reg11) & $unsigned(wire7)) ^~ wire4[(1'h0):(1'h0)])) ?
          (~|($unsigned((&wire9)) ?
              (8'h9c) : $signed($unsigned((8'ha3))))) : $unsigned(wire9[(3'h4):(2'h2)]));
      reg15 <= $unsigned(((^~{$signed(wire6),
          (|(8'hb9))}) || (wire9 <= reg12[(1'h0):(1'h0)])));
    end
  assign wire16 = wire9[(2'h3):(2'h2)];
endmodule

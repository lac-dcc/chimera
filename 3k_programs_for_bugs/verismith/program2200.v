module top
#(parameter param28 = (|{(8'ha0), (+{(~(8'hb8)), ((8'hb0) ? (8'h9d) : (8'haf))})}), 
parameter param29 = param28)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire27, wire26, wire24, wire4, (1'h0)};
  assign wire4 = (^wire2[(4'ha):(4'h9)]);
  module5 #() modinst25 (.wire9(wire0), .wire7(wire4), .wire8(wire1), .wire6(wire2), .clk(clk), .y(wire24));
  assign wire26 = {wire4,
                      ($signed($signed((~&wire0))) ?
                          $signed($unsigned((wire24 ?
                              (8'ha8) : wire3))) : (wire2 ?
                              wire2[(4'h9):(2'h2)] : ($unsigned(wire4) ?
                                  (!wire1) : wire4[(3'h4):(2'h2)])))};
  assign wire27 = $signed(((-wire2[(4'hb):(3'h4)]) & $unsigned(wire0[(1'h0):(1'h0)])));
endmodule

module module5
#(parameter param23 = ((((~{(8'hb2), (8'ha3)}) ? ((~|(8'ha1)) ~^ (8'hbb)) : (^~((8'h9d) && (8'h9d)))) ? (((~^(7'h40)) && {(7'h42), (8'h9e)}) & {((8'hb5) ? (8'hbb) : (8'hb4))}) : {(!(-(8'hb2)))}) || (~&(((~|(8'ha6)) >> ((7'h44) * (8'ha8))) ? {((8'ha7) ? (8'h9c) : (7'h40)), (~|(8'h9e))} : (((7'h41) ? (8'ha7) : (8'h9d)) ? ((8'hb1) & (8'h9e)) : ((8'ha1) ? (8'hbd) : (8'hbb)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire11,
                 wire10,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = wire8;
  assign wire11 = wire7;
  always
    @(posedge clk) begin
      reg12 <= wire8[(1'h0):(1'h0)];
      if ($signed($unsigned((~&(wire10 ? $signed(wire10) : (reg12 <= wire7))))))
        begin
          reg13 <= reg12[(3'h5):(1'h1)];
          reg14 <= wire7[(3'h4):(2'h2)];
          reg15 <= wire6[(1'h0):(1'h0)];
        end
      else
        begin
          reg13 <= reg12[(4'hf):(1'h0)];
          reg14 <= (-((!$signed(reg15)) ? wire8 : wire7[(1'h0):(1'h0)]));
        end
      reg16 <= {((($signed(wire10) || reg14) * $signed({wire11})) ?
              (8'h9f) : ((^~(~&reg13)) <= $signed($unsigned(wire7)))),
          ((($unsigned((8'hb1)) ? (8'haf) : wire7[(3'h4):(1'h0)]) ?
              (^~(wire9 ~^ wire9)) : $unsigned((^reg14))) >> wire8)};
      reg17 <= (((reg14[(3'h6):(3'h6)] + {wire7,
              reg15}) >>> (~|reg13[(3'h4):(2'h2)])) ?
          {(!$signed($signed((8'hb9)))),
              $unsigned(reg12)} : $unsigned(reg16[(2'h2):(1'h1)]));
      reg18 <= $unsigned({{({(8'h9d), (8'had)} ?
                  $unsigned(wire10) : $unsigned(reg14))},
          (~&wire8)});
    end
  assign wire19 = wire11;
  assign wire20 = ({((~|(wire11 ? reg15 : reg12)) + ($unsigned((8'haf)) ?
                          (8'haf) : {reg15})),
                      $unsigned(reg15[(4'he):(4'ha)])} == wire10[(1'h0):(1'h0)]);
  assign wire21 = (~|({$signed($signed((8'hba))),
                      wire11[(3'h5):(2'h3)]} ^~ $unsigned(wire9[(5'h12):(2'h3)])));
  assign wire22 = reg12[(4'h9):(3'h5)];
endmodule

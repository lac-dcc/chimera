module top
#(parameter param37 = {(+(((~(7'h43)) ? ((8'h9d) ? (8'h9f) : (8'hb3)) : (-(8'ha9))) + (((7'h40) >> (8'hb1)) - ((8'ha7) ^ (8'h9f)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire30,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire4 = ((8'hb6) ? $unsigned({wire1[(3'h7):(3'h7)]}) : (|wire3));
  assign wire5 = wire0[(4'hc):(4'hc)];
  assign wire6 = (|((^~wire2[(1'h1):(1'h0)]) * wire4[(4'h8):(3'h7)]));
  assign wire7 = wire4;
  assign wire8 = (($signed(wire2[(5'h13):(2'h3)]) <= wire2[(4'he):(4'ha)]) > ($unsigned((~^wire1[(4'h9):(3'h7)])) ?
                     $signed((8'ha3)) : (wire2 ? (-{(8'hb7)}) : wire3)));
  module9 #() modinst31 (.clk(clk), .wire13(wire6), .wire10(wire5), .wire11(wire7), .wire12(wire1), .y(wire30));
  assign wire32 = wire2[(3'h5):(1'h1)];
  assign wire33 = wire3[(4'hc):(3'h7)];
  always
    @(posedge clk) begin
      reg34 <= wire30[(3'h5):(3'h4)];
      reg35 <= ((~|(wire3 ?
          {wire2} : {$signed(wire1)})) >>> ($signed((((8'hb4) ?
          wire5 : wire0) <= {(8'hb3), reg34})) <<< $signed($unsigned(wire33))));
      reg36 <= {(~reg34[(4'h8):(1'h0)]),
          ({$signed((wire3 >>> wire4))} || $signed((~&(wire3 ?
              wire1 : wire1))))};
    end
endmodule

module module9
#(parameter param28 = ((({(!(7'h41))} != (((8'h9c) - (8'ha5)) >= ((8'hb2) * (8'h9e)))) | {(-((7'h44) ? (7'h42) : (8'ha6))), {(~&(8'ha8)), ((8'ha9) ? (8'hba) : (8'h9f))}}) ? (^((((8'hbe) - (8'hb2)) ? {(8'hb7), (8'ha0)} : ((8'hb1) == (7'h41))) ? (((8'hbc) || (8'hac)) ? ((8'haa) ? (8'h9d) : (8'hb0)) : ((8'hba) < (8'ha6))) : (8'ha1))) : (~|(({(8'hb1), (8'haf)} ? (!(8'hbb)) : ((8'hb1) ? (8'ha4) : (8'hba))) >= (~^{(8'hba)})))), 
parameter param29 = {param28, ((param28 ? param28 : ((param28 ? param28 : param28) ? (param28 <<< param28) : {param28, param28})) ? (((param28 ~^ param28) || {param28}) ? {(-param28)} : param28) : {param28})})
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire27,
                 wire16,
                 wire15,
                 wire14,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = ({(~$unsigned((~&wire12)))} ?
                      (^(+(8'hbf))) : (^~($signed(((8'hbb) ?
                          wire11 : wire11)) <= (~wire10))));
  assign wire15 = {(((+$unsigned(wire14)) ?
                              (wire14 ?
                                  wire11 : (|wire12)) : wire11[(3'h6):(3'h5)]) ?
                          {$unsigned($unsigned(wire11))} : $unsigned(((wire11 ~^ wire14) ?
                              (~wire11) : wire11)))};
  assign wire16 = $signed(((&$signed(wire15[(2'h3):(2'h3)])) >= wire15[(4'hc):(4'h8)]));
  always
    @(posedge clk) begin
      reg17 <= (^$unsigned({((wire14 ? wire11 : wire16) ?
              (wire16 & wire13) : (8'ha5))}));
      if ((+$unsigned(wire15[(4'hf):(4'hc)])))
        begin
          reg18 <= $signed(wire14[(3'h7):(1'h1)]);
          reg19 <= wire14;
          reg20 <= wire13;
          reg21 <= ($signed(($unsigned(reg18[(1'h1):(1'h0)]) < ({wire10,
              (8'hb5)} > (wire10 + wire15)))) != wire11[(2'h2):(2'h2)]);
          if ($signed(wire15))
            begin
              reg22 <= wire12[(2'h2):(1'h0)];
              reg23 <= $unsigned($signed(wire15[(3'h5):(3'h5)]));
            end
          else
            begin
              reg22 <= (8'hab);
              reg23 <= $signed(wire14[(2'h2):(2'h2)]);
              reg24 <= (~|(!{(^{reg21, (8'h9c)}), $signed({reg20, reg19})}));
              reg25 <= wire13[(1'h0):(1'h0)];
              reg26 <= reg18;
            end
        end
      else
        begin
          reg18 <= $signed((^~(!$signed($unsigned(wire16)))));
          reg19 <= $signed((($signed((reg21 || reg24)) != $signed($unsigned((8'hb3)))) ^ reg20));
        end
    end
  assign wire27 = wire15[(4'hc):(3'h4)];
endmodule

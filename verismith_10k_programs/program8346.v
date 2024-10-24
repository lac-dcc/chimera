module top
#(parameter param30 = (((((8'haf) << (~&(8'haf))) ? ({(8'hb5), (8'hb5)} ? ((7'h40) + (8'hbd)) : ((8'hb3) != (8'hab))) : (^(!(8'ha8)))) ~^ ((&(~&(8'hb5))) ? (((8'ha0) << (8'had)) > ((8'hb6) || (8'ha8))) : ((|(8'hae)) && ((8'hba) ? (8'h9f) : (8'ha1))))) ? ((^(-((8'hba) < (8'hb4)))) ? {(((8'h9f) ? (8'ha7) : (8'hae)) ? ((7'h43) != (8'hb1)) : ((8'hba) <= (8'hb4)))} : (((~|(8'h9c)) ? (8'hab) : (^~(8'haf))) && {{(8'hbc), (8'h9d)}})) : ((~^(~^((8'ha9) <= (8'hbc)))) > {({(8'hb3)} || ((8'ha8) ? (8'ha0) : (8'hb9))), (((8'hb2) < (7'h44)) >= ((8'ha9) & (7'h40)))})), 
parameter param31 = ({param30, {({param30} ? {param30} : param30), (~(param30 <<< param30))}} ? param30 : param30))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire24;
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  assign y = {wire29, wire28, wire27, wire4, wire5, wire24, reg26, (1'h0)};
  assign wire4 = $signed($unsigned({wire2[(1'h0):(1'h0)],
                     ((wire2 ? wire3 : wire1) << wire1[(5'h14):(4'ha)])}));
  assign wire5 = $unsigned(($signed({$signed(wire4),
                     (|wire1)}) || ((((8'h9e) > wire2) == (~|wire4)) ?
                     ((wire3 ? (7'h44) : wire3) ?
                         (~wire1) : (^wire0)) : $signed({(8'hb9)}))));
  module6 #() modinst25 (.wire8(wire3), .wire9(wire4), .wire11(wire5), .clk(clk), .wire10(wire1), .y(wire24), .wire7(wire2));
  always
    @(posedge clk) begin
      reg26 <= ((~^$signed(wire1)) ?
          {{((wire0 ^ wire3) ?
                      $signed(wire2) : (wire2 ?
                          wire1 : wire2))}} : ((~&{$unsigned(wire2)}) << (~&((wire3 ?
              wire4 : wire4) - (wire3 ? wire4 : wire5)))));
    end
  assign wire27 = $unsigned((~&reg26[(3'h5):(2'h2)]));
  assign wire28 = $unsigned(wire27);
  assign wire29 = (8'h9d);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire12;
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire12,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = $unsigned($unsigned($signed(wire11[(4'hb):(3'h4)])));
  always
    @(posedge clk) begin
      if (wire7[(4'he):(3'h4)])
        begin
          reg13 <= $signed(wire11);
          reg14 <= (wire8[(4'ha):(1'h1)] + wire9[(1'h0):(1'h0)]);
          reg15 <= reg14[(4'ha):(4'h8)];
          reg16 <= {(((!(wire10 <<< reg15)) ?
                      (((8'hb2) << wire12) ?
                          (8'ha4) : wire11) : reg13[(5'h15):(5'h13)]) ?
                  (~wire9) : reg13[(4'hc):(4'hb)])};
          reg17 <= wire10;
        end
      else
        begin
          reg13 <= $unsigned($signed((({wire9, reg16} - $unsigned(wire7)) ?
              wire10 : wire11[(1'h0):(1'h0)])));
        end
      reg18 <= $signed((wire11[(1'h1):(1'h1)] ?
          wire7[(2'h2):(2'h2)] : ($unsigned(((8'hb1) + (8'ha0))) >> wire11[(4'ha):(1'h0)])));
      reg19 <= $unsigned(reg13);
      reg20 <= $signed(wire12[(5'h11):(4'hb)]);
      reg21 <= wire12;
    end
  assign wire22 = $signed({wire10,
                      $unsigned((wire8 ? (^~reg21) : reg15[(4'ha):(3'h4)]))});
  assign wire23 = ((!$signed(((~^(8'hb7)) ^ reg15[(4'h8):(4'h8)]))) ?
                      ($unsigned(($signed(reg16) ?
                          (wire11 ? reg13 : reg14) : (wire10 ?
                              wire22 : wire9))) ^~ reg15) : $unsigned($unsigned($unsigned((8'hb4)))));
endmodule

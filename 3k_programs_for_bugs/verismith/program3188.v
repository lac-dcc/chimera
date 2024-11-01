module top
#(parameter param53 = (((((8'hb5) && (~^(8'hae))) ? (8'hab) : (~&((8'ha9) + (8'haf)))) != (~&((+(8'hb9)) ? (!(8'ha4)) : {(8'h9f)}))) <<< (((((8'hb6) | (7'h44)) ? (!(8'hab)) : (~^(8'hae))) ? ((~|(8'hba)) ~^ ((8'haf) ~^ (8'hb8))) : (+((8'hb1) ? (8'h9f) : (8'hbe)))) << (((8'hbd) ? ((8'ha7) ? (8'hac) : (8'h9c)) : ((8'ha8) ? (8'ha5) : (8'hb4))) ? {((8'hba) || (8'hae))} : (((8'hb8) >= (8'ha9)) <= (~(8'hb1)))))), 
parameter param54 = ((({(param53 ? param53 : param53), (param53 && param53)} ? (param53 << (+param53)) : (-{param53, param53})) ? param53 : (((~|param53) <<< {param53}) ? ({param53, param53} > (^param53)) : (~^(param53 >>> param53)))) ? param53 : {(((^~param53) ? param53 : (~|param53)) ? (param53 ? param53 : (+param53)) : (param53 < ((8'hb6) <<< param53)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire49,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = $unsigned(($unsigned(((wire3 ? wire3 : wire3) ?
                     (wire1 << wire0) : $signed(wire3))) ^~ $signed(wire0[(4'h8):(4'h8)])));
  assign wire5 = wire4[(3'h6):(3'h5)];
  assign wire6 = wire2;
  assign wire7 = ((($signed($signed(wire0)) ?
                         $signed((wire3 ? wire2 : wire5)) : $unsigned({wire1,
                             wire0})) ?
                     (8'hbe) : (&wire4[(1'h0):(1'h0)])) | ((wire6[(3'h5):(1'h1)] <= ($unsigned(wire1) ?
                     (~wire6) : $unsigned(wire0))) || $unsigned(wire0[(3'h4):(3'h4)])));
  assign wire8 = (($unsigned($unsigned(wire4[(2'h2):(2'h2)])) & ((wire0 ?
                     wire1 : $unsigned(wire3)) < ((wire5 + wire0) ?
                     (wire2 != wire4) : (wire2 ?
                         wire0 : wire0)))) > wire2[(1'h1):(1'h0)]);
  assign wire9 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg10 <= ((|({{(7'h44), (8'ha6)}} ?
          {$signed(wire0)} : (~&(wire6 ?
              wire9 : (8'h9f))))) ^~ wire1[(2'h2):(1'h1)]);
      if ($signed({wire8}))
        begin
          reg11 <= $signed($signed(((+(wire2 >> (8'h9e))) ^ wire6[(4'h9):(2'h2)])));
          reg12 <= ({$signed(({wire9} >>> wire8[(1'h0):(1'h0)])),
              $signed(wire9[(2'h3):(2'h3)])} | $signed((8'ha5)));
          reg13 <= $signed((($unsigned(wire6[(3'h5):(1'h1)]) && (~&$signed(wire7))) ?
              wire8 : ((wire7[(3'h5):(1'h0)] ?
                      (wire6 ? wire3 : wire7) : wire6) ?
                  $unsigned(wire4[(4'ha):(4'h9)]) : (+(&wire4)))));
          reg14 <= (^$unsigned(wire8));
          reg15 <= $unsigned(((($signed(wire7) ?
                  wire9[(4'h8):(2'h2)] : $signed(wire4)) >> wire2[(3'h4):(1'h1)]) ?
              (|({wire6,
                  reg14} * (+reg13))) : $unsigned(($unsigned(reg10) < $unsigned(wire3)))));
        end
      else
        begin
          reg11 <= reg12;
          reg12 <= (reg11[(3'h7):(2'h2)] >>> (|(reg10 ^ $signed(wire5))));
          reg13 <= $signed($signed((wire8 <<< ($signed(reg14) <<< (!(7'h44))))));
          reg14 <= wire9[(4'h9):(2'h3)];
          reg15 <= $unsigned($signed((((wire4 ?
              wire4 : wire2) < $unsigned((8'hba))) ^~ reg10)));
        end
      if (reg10)
        begin
          reg16 <= $signed($signed($unsigned($signed((wire0 ?
              wire2 : (8'ha0))))));
          if (($unsigned((^(reg14 ^ (reg11 + wire0)))) ?
              wire7[(3'h7):(3'h5)] : (reg10 ?
                  $unsigned(reg13[(2'h2):(1'h0)]) : (^reg13[(4'hb):(1'h1)]))))
            begin
              reg17 <= (~$unsigned($unsigned($unsigned($signed(reg12)))));
              reg18 <= reg13[(4'hb):(3'h4)];
              reg19 <= wire0;
            end
          else
            begin
              reg17 <= wire6[(3'h7):(1'h0)];
              reg18 <= $signed((8'haf));
              reg19 <= wire1[(1'h0):(1'h0)];
              reg20 <= {wire5[(2'h2):(1'h0)], $unsigned((8'hb7))};
              reg21 <= ((-$unsigned(reg16)) <= (|(~^(8'hae))));
            end
        end
      else
        begin
          reg16 <= reg21[(1'h1):(1'h1)];
          reg17 <= (!$signed($signed({(reg10 >= (8'h9d))})));
        end
    end
  module22 #() modinst50 (wire49, clk, reg21, wire0, wire5, reg14, reg20);
  assign wire51 = reg13[(2'h2):(1'h0)];
  assign wire52 = ($signed((|$unsigned((wire7 ? reg20 : reg19)))) ?
                      reg17[(3'h4):(2'h3)] : reg18[(1'h0):(1'h0)]);
endmodule

module module22
#(parameter param47 = {((~((~^(8'h9f)) == ((8'hb3) <= (8'hb4)))) >> {(~|((8'hbd) >= (7'h41))), {(~&(8'hbb)), (~(8'hb9))}})}, 
parameter param48 = ((((~^param47) ? ((param47 ? (7'h42) : param47) + (param47 || param47)) : ((^param47) ? (param47 ^ param47) : (param47 ? param47 : param47))) - ({(param47 ? param47 : param47), (param47 || param47)} <= ((param47 << param47) <<< (param47 * (8'hbc))))) ^~ param47))
(y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire signed [(3'h6):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire [(3'h6):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire42;
  assign y = {wire46, wire45, wire44, wire28, wire29, wire42, (1'h0)};
  assign wire28 = $unsigned(((~^((^~wire24) != $unsigned(wire24))) && $unsigned((8'ha2))));
  assign wire29 = (wire23 + (|{({(7'h44), wire26} ?
                          wire26[(3'h5):(1'h1)] : $signed(wire25))}));
  module30 #() modinst43 (.clk(clk), .wire33(wire29), .wire35(wire23), .wire34(wire28), .wire31(wire27), .y(wire42), .wire32(wire24));
  assign wire44 = $unsigned($signed((8'hac)));
  assign wire45 = wire25[(4'h8):(3'h6)];
  assign wire46 = $unsigned($unsigned((~&$signed($signed(wire45)))));
endmodule

module module30
#(parameter param40 = {(-(~&((-(8'hab)) ? ((8'haf) <<< (8'hbe)) : ((8'haa) + (8'hbd))))), ((~|((|(7'h44)) ? (7'h41) : ((8'hb9) ? (8'hae) : (8'hb3)))) ? ((((8'h9d) ^ (8'haa)) - (-(8'h9f))) == (+(~|(8'hb4)))) : ((~|((8'hb6) ? (8'ha0) : (8'ha1))) < (|{(8'hac)})))}, 
parameter param41 = (8'ha5))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire [(3'h4):(1'h0)] wire33;
  input wire [(3'h6):(1'h0)] wire32;
  input wire [(5'h15):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  assign y = {wire39, wire38, wire37, wire36, (1'h0)};
  assign wire36 = wire33;
  assign wire37 = (^~wire33[(2'h3):(1'h0)]);
  assign wire38 = $signed($unsigned(wire34));
  assign wire39 = $unsigned((wire34[(4'h9):(2'h3)] ?
                      {(^~wire37)} : (wire35[(1'h1):(1'h1)] ?
                          $signed(wire32[(3'h6):(1'h0)]) : $signed(wire32[(2'h2):(1'h1)]))));
endmodule

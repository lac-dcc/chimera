module top
#(parameter param21 = (~&((!{((8'hb5) << (8'hb8)), ((8'hb4) ? (8'hbf) : (8'hb8))}) <<< (((8'hb5) ? ((8'h9c) >= (8'hb0)) : (~(8'hbe))) ~^ {((7'h44) ? (8'hbc) : (8'hbe)), (|(8'hb5))}))), 
parameter param22 = {(((param21 ? {param21, param21} : (param21 ? param21 : param21)) ? ((param21 & param21) ? (param21 + param21) : (8'hae)) : ((+param21) ? (|param21) : ((8'ha9) ? param21 : param21))) <<< (~^{(param21 ? param21 : param21), (^~param21)})), {(((8'hb6) ^~ ((8'hbd) ? param21 : param21)) ? ((-(8'ha6)) != (param21 >> param21)) : (~&(param21 ? param21 : param21))), (((+param21) ? (param21 ? param21 : param21) : (8'haf)) < (+(|(8'hb9))))}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $signed(((^((wire4 >> wire4) ?
                         $signed(wire1) : $unsigned((7'h42)))) ?
                     {((wire3 && wire1) <= (~^wire4))} : $unsigned(($signed((8'hac)) ?
                         (wire0 >= wire2) : wire1))));
  assign wire6 = {(($unsigned($unsigned(wire4)) - (wire2[(2'h2):(1'h0)] ?
                         (wire2 ? (8'haa) : wire0) : wire1)) || (wire2 ?
                         wire3[(1'h0):(1'h0)] : (wire0 == wire1[(1'h0):(1'h0)]))),
                     (wire3 || wire5[(3'h7):(3'h4)])};
  assign wire7 = ((~&{wire4}) ?
                     {$unsigned(($unsigned(wire6) * $unsigned(wire4))),
                         wire1} : {((^$unsigned(wire2)) & wire4[(3'h5):(1'h0)]),
                         wire5[(4'h9):(3'h5)]});
  assign wire8 = wire2;
  assign wire9 = (wire3[(1'h1):(1'h1)] ?
                     $signed($signed((~^(wire6 ^~ wire2)))) : (wire4[(3'h6):(3'h5)] + $signed($unsigned((7'h40)))));
  always
    @(posedge clk) begin
      if (({{$signed($unsigned(wire9)),
              wire9[(4'ha):(4'h8)]}} != ((wire9[(4'hc):(1'h0)] ?
          wire4[(2'h3):(1'h0)] : ((wire3 - wire8) - $signed(wire0))) ^ (|$unsigned($unsigned(wire3))))))
        begin
          reg10 <= $unsigned(wire7[(5'h11):(4'ha)]);
        end
      else
        begin
          reg10 <= ({$signed($unsigned({wire6}))} || (wire4[(4'ha):(1'h0)] ?
              (-wire1[(3'h5):(3'h4)]) : $signed(((+wire8) > (8'ha3)))));
          if (($signed({wire7}) ? (^wire6) : wire7[(4'hb):(2'h2)]))
            begin
              reg11 <= (~&$signed($unsigned(((reg10 >= wire7) | reg10[(1'h1):(1'h0)]))));
              reg12 <= $unsigned($unsigned(((-$signed(wire6)) ?
                  reg10 : (!(wire0 ~^ wire9)))));
            end
          else
            begin
              reg11 <= (^$unsigned({(wire8[(4'h8):(4'h8)] ?
                      {reg10, wire4} : (wire0 ? wire0 : (8'hbc)))}));
              reg12 <= $unsigned(((~&wire4[(4'hd):(4'h8)]) ?
                  $signed((~&wire4)) : (|wire6[(3'h4):(1'h0)])));
              reg13 <= (($signed({{reg11}}) ?
                  wire7 : $unsigned($signed((^wire8)))) + wire4);
              reg14 <= $signed($unsigned($unsigned((~|{wire6, wire4}))));
              reg15 <= ((wire1[(1'h0):(1'h0)] ?
                      reg10[(3'h4):(2'h2)] : $unsigned(((wire7 ?
                              reg12 : wire3) ?
                          (wire0 ? reg12 : (8'hbe)) : (wire6 || wire7)))) ?
                  ({$unsigned($signed(reg13))} ^ $signed((reg13 >> $unsigned(reg13)))) : ((+$unsigned((~&(8'hb7)))) >>> (~^$unsigned(reg10))));
            end
          reg16 <= wire5[(1'h1):(1'h1)];
          reg17 <= $signed($unsigned((wire4[(2'h2):(1'h1)] <<< $unsigned((reg14 <= reg14)))));
        end
      reg18 <= (~^(~^(8'ha6)));
      reg19 <= (wire1 ?
          (wire8[(3'h4):(2'h3)] ?
              reg11[(4'hc):(4'hc)] : (!(8'haf))) : reg18[(2'h3):(2'h2)]);
      reg20 <= wire3[(1'h0):(1'h0)];
    end
endmodule

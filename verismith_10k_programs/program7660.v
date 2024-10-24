module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = wire5[(5'h12):(3'h7)];
  module7 #() modinst28 (wire27, clk, wire0, wire1, wire5, wire3);
  assign wire29 = $signed((+(^~wire1)));
  assign wire30 = wire27[(2'h2):(2'h2)];
  assign wire31 = wire3[(3'h5):(2'h3)];
  assign wire32 = ($signed(wire30) >>> (~&(8'ha8)));
  assign wire33 = ((|wire1) ~^ $signed($signed($signed(((8'hbf) == wire0)))));
  assign wire34 = $unsigned($unsigned(($signed((wire32 <<< wire3)) ?
                      wire3[(1'h1):(1'h0)] : $signed(wire5[(3'h5):(2'h2)]))));
  assign wire35 = $signed($signed((~|($unsigned(wire3) ?
                      (wire32 ? wire2 : wire3) : wire2))));
  assign wire36 = (((wire4 + ((wire5 == wire4) ?
                          $signed((7'h40)) : (!wire34))) ?
                      $unsigned({(~|wire2),
                          wire0}) : wire30) ^ ((~$signed(wire34)) ?
                      $unsigned(wire31[(3'h5):(2'h3)]) : {{wire0[(4'h9):(3'h5)],
                              $unsigned(wire27)}}));
  assign wire37 = {wire36};
  assign wire38 = ((^~wire3) ? (&$signed($signed(wire5))) : (~&(~&wire29)));
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire12;
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
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
  assign wire12 = $signed((!$signed({wire9[(1'h1):(1'h1)]})));
  always
    @(posedge clk) begin
      reg13 <= $unsigned(wire8[(1'h0):(1'h0)]);
      reg14 <= {wire11,
          (((8'hbc) ?
                  $signed((wire11 ? wire9 : wire9)) : (wire12 ?
                      ((8'h9e) < reg13) : wire10)) ?
              (8'haf) : $unsigned(((-wire10) ? wire10 : (wire8 >>> wire10))))};
      if ((wire11[(4'h8):(3'h7)] ?
          wire11 : ($signed({wire10[(2'h2):(1'h1)]}) ~^ (~^((|wire8) ^~ $unsigned((7'h40)))))))
        begin
          if (wire12)
            begin
              reg15 <= (~&wire8[(3'h4):(1'h1)]);
            end
          else
            begin
              reg15 <= $unsigned((reg15[(3'h4):(2'h2)] ?
                  $unsigned(({wire12} || ((7'h42) | reg15))) : (((reg13 ^ reg14) ~^ (^~reg15)) ?
                      reg15 : wire8[(1'h0):(1'h0)])));
              reg16 <= (-({{{wire11}},
                  $signed((wire12 ? wire9 : reg13))} >> (8'ha9)));
              reg17 <= wire8;
            end
          reg18 <= wire12;
          if (reg16)
            begin
              reg19 <= $unsigned(((({wire12} | reg15) ?
                  $signed($unsigned(reg17)) : (8'hb1)) * wire8));
            end
          else
            begin
              reg19 <= reg15[(3'h6):(3'h6)];
            end
          reg20 <= (|(~|{$signed($signed(wire12)), (+$unsigned(reg13))}));
        end
      else
        begin
          if ({(-$unsigned(((-reg18) || {wire11, reg14}))), reg16})
            begin
              reg15 <= wire10[(2'h2):(1'h1)];
              reg16 <= reg16;
              reg17 <= $signed((+$unsigned(wire12)));
              reg18 <= (&(wire10 && $unsigned(((~^(8'hb0)) ?
                  reg17 : (reg17 + wire8)))));
            end
          else
            begin
              reg15 <= wire11[(3'h7):(2'h3)];
              reg16 <= $unsigned(reg18);
            end
          reg19 <= reg16[(1'h1):(1'h0)];
        end
      reg21 <= $signed($signed({reg18[(1'h1):(1'h1)],
          $signed((reg13 >= wire12))}));
    end
  assign wire22 = $signed((~&{$signed($signed((7'h41))), (^(!reg17))}));
  assign wire23 = $unsigned(wire8[(3'h5):(1'h0)]);
  assign wire24 = (!$signed(reg13[(3'h5):(1'h1)]));
  assign wire25 = ({$signed((+(|(8'h9c)))),
                      $signed((&$unsigned(wire23)))} <= $unsigned($unsigned($unsigned(wire11[(4'h8):(1'h0)]))));
  assign wire26 = (~^$signed((((reg14 ?
                      reg17 : wire23) + $signed(wire12)) >> $signed(wire9))));
endmodule

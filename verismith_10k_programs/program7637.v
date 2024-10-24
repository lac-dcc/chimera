module top
#(parameter param22 = (((^~(^~((8'h9c) > (8'hb7)))) ? ((-{(8'hb8), (8'ha8)}) && (((8'had) ? (7'h44) : (8'hbf)) ? ((8'hb5) ? (8'hbb) : (8'hb6)) : {(8'hb4), (8'hab)})) : (((~|(8'hae)) ? (~(8'hb0)) : ((8'ha3) ~^ (8'hae))) <= (!((8'hbd) ? (8'ha2) : (8'hb5))))) ? ((7'h40) ? (^(((8'h9e) ? (8'ha7) : (7'h42)) > ((8'hb5) ? (8'hb8) : (7'h44)))) : ((~|(-(8'ha2))) << (((8'ha8) ? (8'ha3) : (8'ha8)) ? ((8'ha4) ? (8'hb9) : (8'hbe)) : (^~(7'h41))))) : (~|((~((7'h41) ~^ (8'ha7))) ? (((8'hbd) != (8'ha2)) ? ((8'ha1) << (8'had)) : ((8'hb4) >= (8'hac))) : (!(!(8'hb6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire4 = wire0[(3'h6):(3'h5)];
  assign wire5 = wire0;
  assign wire6 = $unsigned($unsigned((|(^~(-(7'h41))))));
  assign wire7 = (^$signed(($signed((wire2 ?
                     wire5 : wire3)) >= $unsigned($signed((8'hb2))))));
  assign wire8 = wire2;
  assign wire9 = {$unsigned($signed(((wire0 ?
                         wire4 : wire6) > (wire7 <<< wire0)))),
                     $signed($signed(($signed(wire3) ? (!wire2) : (+wire4))))};
  assign wire10 = wire9;
  assign wire11 = (+wire4[(5'h14):(5'h10)]);
  assign wire12 = wire0;
  assign wire13 = ($signed(wire10[(4'hc):(3'h4)]) ?
                      $unsigned(wire10) : {wire10, $signed(wire3)});
  always
    @(posedge clk) begin
      reg14 <= (~^((~&((wire13 ? wire6 : wire10) ?
          (wire8 ?
              wire0 : wire9) : $unsigned((8'hba)))) <= (wire2 >= $signed(wire13))));
      if ($signed(wire6[(2'h3):(2'h3)]))
        begin
          reg15 <= $signed(wire2);
          if (wire3)
            begin
              reg16 <= (wire12 << $unsigned(wire12));
              reg17 <= (($signed(((!wire3) ?
                      $signed((8'ha9)) : (wire13 * wire3))) >= (~$signed(wire10[(2'h3):(2'h2)]))) ?
                  ((!wire13[(3'h7):(1'h0)]) || (8'hbc)) : wire13[(1'h0):(1'h0)]);
            end
          else
            begin
              reg16 <= $unsigned(wire5);
              reg17 <= (reg15[(2'h3):(1'h1)] & {$signed(wire8), wire1});
              reg18 <= wire2;
            end
          reg19 <= ((-wire9) ?
              (((~&wire5[(3'h6):(3'h5)]) ?
                  $signed($signed(wire1)) : reg14[(3'h6):(3'h5)]) <= (reg18 != $unsigned($signed(wire1)))) : $unsigned((~^$unsigned((wire5 ~^ reg16)))));
        end
      else
        begin
          reg15 <= wire6[(1'h1):(1'h0)];
          reg16 <= (~(({{reg18, wire11}} <<< $unsigned({wire10, (8'ha2)})) ?
              $signed(reg16) : reg15[(1'h0):(1'h0)]));
          reg17 <= $unsigned($signed((reg16 ?
              (-$unsigned(wire4)) : $signed(wire13[(5'h12):(4'he)]))));
        end
      reg20 <= {wire11[(4'h9):(3'h4)],
          $signed((({reg16} << (wire7 ? reg19 : wire0)) ?
              wire0[(3'h5):(3'h4)] : {(8'hb3), $unsigned(wire8)}))};
      reg21 <= wire1[(2'h2):(1'h1)];
    end
endmodule

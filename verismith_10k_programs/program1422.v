module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire17;
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire17,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  module4 #() modinst18 (.wire5((8'hac)), .wire9(wire3), .wire6(wire2), .wire8(wire1), .y(wire17), .clk(clk), .wire7(wire0));
  always
    @(posedge clk) begin
      if ($unsigned(((8'hb8) ?
          $signed(((wire1 <<< (8'ha2)) ^~ {wire2,
              wire2})) : $signed({(wire17 && wire0)}))))
        begin
          reg19 <= wire2;
          reg20 <= {$signed(wire17[(4'h8):(3'h5)]),
              (($unsigned($signed(wire3)) ? wire0 : (~^wire0)) ?
                  ($signed({(8'ha2), (8'hb3)}) | $signed((8'ha1))) : reg19)};
        end
      else
        begin
          if (((((8'h9c) ~^ $signed((^~(8'hac)))) ?
                  wire1[(3'h4):(3'h4)] : reg20) ?
              $unsigned($unsigned($signed(wire17[(1'h1):(1'h0)]))) : (((wire2[(3'h6):(1'h1)] >>> {reg19,
                  wire0}) <= (-((8'hb2) ? (8'ha3) : (7'h44)))) & (~|{reg20,
                  (&reg19)}))))
            begin
              reg19 <= ((|wire17) + $unsigned(((wire3[(3'h4):(2'h3)] - $signed(reg19)) ?
                  $unsigned($signed(wire2)) : $unsigned(wire3))));
              reg20 <= (-(-(($signed((7'h43)) < (^~wire0)) ?
                  $unsigned($unsigned(wire3)) : wire2[(3'h7):(3'h7)])));
              reg21 <= $unsigned((wire0 + (-wire0)));
            end
          else
            begin
              reg19 <= (({$unsigned((reg20 <<< wire1))} ?
                      ($signed($unsigned((7'h40))) ?
                          (wire17[(3'h4):(1'h0)] ?
                              (wire2 ?
                                  reg21 : wire3) : $unsigned(reg20)) : ((~|reg21) >>> (^~(8'h9c)))) : (~|({wire17,
                          wire0} ~^ (&reg21)))) ?
                  ($unsigned(((reg20 ? wire1 : wire2) ?
                      $signed(reg20) : $unsigned(reg21))) - {$signed(wire2[(1'h1):(1'h1)])}) : ((((8'h9d) ?
                          (wire3 ?
                              reg19 : reg20) : $unsigned(reg20)) << ((wire17 <<< wire2) ?
                          (8'hb7) : $unsigned(reg21))) ?
                      ((8'ha1) ?
                          wire2 : $unsigned((wire17 ?
                              (7'h41) : reg20))) : reg21));
              reg20 <= wire17;
              reg21 <= $signed(reg21);
              reg22 <= $signed((+$unsigned(wire0[(2'h3):(2'h2)])));
            end
          reg23 <= $signed((-$unsigned($unsigned($unsigned(wire3)))));
          reg24 <= $unsigned(wire1[(3'h4):(3'h4)]);
        end
      reg25 <= ($unsigned($signed($unsigned((~|reg23)))) ?
          $signed((((reg22 ?
              wire3 : reg23) >>> $signed(reg23)) | {$signed(wire17)})) : {reg23[(2'h2):(2'h2)]});
    end
  assign wire26 = reg22;
  assign wire27 = ((($signed($signed(reg23)) >= (8'ha2)) ?
                          {wire1, (8'ha4)} : (~&{$unsigned(reg21)})) ?
                      ((~&reg23[(1'h1):(1'h0)]) ?
                          $unsigned(((|(8'hbc)) ^~ $unsigned(reg20))) : wire2) : ((((wire0 ?
                          (8'hbb) : reg23) << wire26[(1'h1):(1'h1)]) || $signed($signed((8'ha8)))) * (((wire2 >= reg23) <<< (wire3 ?
                          reg22 : reg19)) && (~wire3))));
  assign wire28 = wire0;
  assign wire29 = reg21;
  assign wire30 = ($unsigned((((reg19 ? wire2 : wire1) ?
                          {wire28} : (wire0 ~^ wire17)) >>> wire27[(5'h12):(5'h10)])) ?
                      ($signed(($signed(reg20) + {(8'hbe),
                          (7'h43)})) < $unsigned(({reg22, reg20} ?
                          wire0[(2'h2):(1'h1)] : (~|(8'ha1))))) : ($unsigned($unsigned($unsigned(wire27))) ?
                          (((reg22 ? wire29 : reg25) ?
                                  $unsigned(wire28) : ((8'ha9) ?
                                      wire26 : (8'hba))) ?
                              (!$signed((8'ha7))) : reg19) : $unsigned(wire29)));
  assign wire31 = $signed((reg21[(2'h3):(1'h1)] > reg19[(3'h7):(3'h6)]));
  assign wire32 = $unsigned($signed({(!$signed(wire27)),
                      $signed(wire3[(3'h4):(2'h2)])}));
  assign wire33 = reg23[(1'h1):(1'h1)];
  assign wire34 = ((~(^$unsigned((wire3 ? (8'hb8) : (8'ha1))))) ?
                      wire31[(1'h0):(1'h0)] : $unsigned(reg21[(4'h8):(2'h3)]));
  assign wire35 = $signed(($signed(((wire0 | reg25) ?
                      reg21[(4'hb):(1'h0)] : wire30[(5'h13):(3'h7)])) < (|$signed((reg25 & reg22)))));
  assign wire36 = wire26;
  assign wire37 = $unsigned(reg25[(4'hb):(3'h7)]);
endmodule

module module4
#(parameter param16 = ({(^~{(^~(8'hab))})} ? (~(^~(~|(|(8'hba))))) : ((+(((7'h41) ~^ (8'hb4)) | ((8'ha0) ? (7'h40) : (8'haf)))) ? ((((8'hb2) ? (8'hb0) : (8'haf)) + (!(7'h41))) ? ((~(8'ha2)) ? ((8'ha1) ? (8'h9e) : (8'hab)) : (~^(8'hab))) : (~|(~|(8'hba)))) : (!(8'ha1)))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  assign y = {wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = {$unsigned((((~(7'h44)) ?
                          {wire6} : (wire5 - wire7)) + (wire9[(1'h1):(1'h1)] ?
                          $signed(wire7) : (^wire6))))};
  assign wire11 = ($signed(($signed(wire6[(2'h3):(1'h1)]) ?
                      wire10 : (^~(wire9 ?
                          wire8 : wire6)))) == (wire5[(4'h9):(4'h8)] * {{wire8}}));
  assign wire12 = $unsigned((wire7[(2'h2):(1'h0)] ?
                      (wire7[(1'h1):(1'h0)] != wire10) : (8'hbe)));
  assign wire13 = wire9[(1'h1):(1'h1)];
  assign wire14 = {(($unsigned($unsigned(wire6)) << wire6[(4'hb):(4'h8)]) ?
                          wire7 : $unsigned(((wire8 ? wire5 : wire6) ?
                              $unsigned(wire5) : (wire11 * wire13))))};
  assign wire15 = {$signed(wire5[(5'h10):(4'hd)])};
endmodule

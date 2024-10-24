module top
#(parameter param33 = ((((((8'ha1) ? (8'hb2) : (7'h42)) ? ((8'ha8) || (8'hbc)) : (8'ha7)) ? (^((8'ha5) ? (8'h9c) : (8'ha9))) : ((^~(8'hb8)) ? ((8'h9e) ? (8'hb1) : (8'hae)) : (-(7'h41)))) ? ((&(-(8'hbd))) ? (((8'hb2) > (8'hb8)) - ((8'hbc) ? (8'ha9) : (8'ha2))) : (-((8'ha4) ? (8'h9d) : (8'hbc)))) : (^(+{(8'h9d)}))) ? {{(((8'hb0) > (8'hbf)) || {(8'hbe)}), (((8'haf) || (8'hb4)) ? (~(8'hbb)) : {(8'hae)})}} : (((((8'h9e) ? (8'hbc) : (8'h9c)) ? ((8'hae) <= (8'ha8)) : ((8'hb2) ~^ (8'hb1))) <<< (((8'hb7) ? (8'hbc) : (7'h40)) ? ((8'ha4) ? (8'hae) : (8'hbf)) : (&(8'hbc)))) ? {(8'h9d)} : ((((8'ha7) - (8'hac)) | (8'hab)) || {((7'h41) >>> (7'h40))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire9,
                 wire8,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($signed(wire1));
      reg6 <= $unsigned($signed((~(wire3 ? wire3[(1'h1):(1'h0)] : (-wire4)))));
      reg7 <= wire0[(1'h1):(1'h1)];
    end
  assign wire8 = (+($signed({(~&wire1),
                     $signed((7'h40))}) & (^($signed(wire4) ^ $signed(wire2)))));
  assign wire9 = $unsigned((8'hbb));
  always
    @(posedge clk) begin
      reg10 <= ({($unsigned(wire9) ?
                  (reg7 ? $unsigned((7'h44)) : $unsigned(reg5)) : (~&(reg7 ?
                      wire0 : (8'hbc))))} ?
          $unsigned(wire4) : wire0[(4'h8):(1'h1)]);
      reg11 <= $signed(($unsigned($unsigned($signed((8'ha6)))) ?
          (wire4 < ((~^wire0) ?
              (wire0 ^~ wire0) : (wire0 ?
                  wire3 : wire0))) : wire2[(1'h0):(1'h0)]));
      reg12 <= $unsigned(wire8);
      reg13 <= wire4[(4'h8):(2'h3)];
    end
  assign wire14 = (reg12[(3'h5):(1'h1)] + (8'ha9));
  assign wire15 = $unsigned(((wire1[(1'h1):(1'h1)] ? wire8 : (|reg5)) ?
                      (($unsigned((8'h9f)) ?
                              $unsigned(reg10) : (wire2 - reg13)) ?
                          $unsigned($signed((8'hb1))) : ($signed(reg10) < (+reg7))) : (reg5[(4'hb):(4'h8)] || (+{reg11,
                          (8'hbf)}))));
  assign wire16 = ($unsigned($signed((wire8[(2'h2):(1'h0)] == {reg7}))) != (($unsigned((-reg7)) ?
                      ((reg10 & wire2) ?
                          ((8'hb4) ?
                              reg5 : wire0) : (reg11 >> wire1)) : $signed((^~reg13))) <<< $unsigned(reg6)));
  assign wire17 = $unsigned((+wire2));
  always
    @(posedge clk) begin
      if ({((^~$unsigned(wire8[(4'hc):(1'h0)])) ?
              (|wire17[(3'h6):(3'h5)]) : $signed(reg12)),
          reg5})
        begin
          reg18 <= wire1[(2'h2):(2'h2)];
          reg19 <= ((^~wire2[(4'h8):(3'h6)]) ?
              $signed((((|reg5) ?
                  {wire14,
                      wire1} : (wire16 * wire0)) & wire14)) : ($signed(((wire8 < reg13) | reg5)) ?
                  ((8'ha5) ?
                      $signed((reg10 < reg12)) : reg5[(4'hc):(4'h8)]) : ($unsigned((8'hab)) ?
                      (|(reg6 ? reg18 : wire15)) : $signed($unsigned(reg7)))));
          reg20 <= reg12[(5'h10):(3'h6)];
        end
      else
        begin
          reg18 <= {($unsigned($unsigned(reg13[(2'h3):(2'h2)])) ?
                  (!{wire8[(1'h0):(1'h0)],
                      reg18[(1'h0):(1'h0)]}) : (((wire8 <= reg12) ?
                      {(8'h9e),
                          reg20} : $signed(reg18)) | (reg19[(2'h2):(1'h0)] ?
                      wire1 : {reg12})))};
          reg19 <= {$unsigned(wire14),
              ((~^$signed(((8'hbd) | reg18))) ?
                  (($signed(wire4) >= ((8'hbc) ? wire15 : wire9)) ?
                      $signed((~^reg10)) : reg6) : ({reg20[(2'h3):(2'h3)],
                      $unsigned(wire3)} <<< {$signed(reg10)}))};
          if (wire3[(1'h0):(1'h0)])
            begin
              reg20 <= wire2[(3'h7):(1'h0)];
              reg21 <= (-reg11[(4'ha):(4'h8)]);
            end
          else
            begin
              reg20 <= ($signed($unsigned((^~{wire8}))) ?
                  reg10 : $signed((8'hbf)));
              reg21 <= reg19[(4'h8):(3'h6)];
              reg22 <= ($signed((($unsigned(reg7) || $unsigned(reg5)) != wire3)) ?
                  ((-reg11[(3'h6):(3'h6)]) ^~ $unsigned(reg12)) : {$signed(($signed(reg7) ?
                          (7'h44) : $unsigned(wire4)))});
            end
        end
      reg23 <= $signed(wire15);
    end
  assign wire24 = reg23;
  assign wire25 = reg21;
  assign wire26 = (-reg12);
  assign wire27 = reg6[(3'h5):(1'h0)];
  assign wire28 = wire27[(3'h6):(3'h5)];
  assign wire29 = $signed($signed($signed($unsigned(reg12[(4'ha):(3'h7)]))));
  assign wire30 = $signed(({(+{(8'hbd), (8'ha6)}), (~&$unsigned(reg7))} ?
                      (&reg10[(4'ha):(2'h2)]) : ($signed((^~(8'hbf))) >= $unsigned($unsigned(reg23)))));
  assign wire31 = (&($signed((~$signed(wire2))) > ({((8'hbf) == wire30),
                          (~&wire27)} ?
                      $signed(wire14[(1'h1):(1'h1)]) : $signed(reg6))));
  assign wire32 = (-(^~{wire24}));
endmodule

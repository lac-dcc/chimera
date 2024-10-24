module top
#(parameter param35 = (^~({((^(8'hb3)) > (~^(8'h9d)))} ? (|(~&((7'h41) >> (8'hb1)))) : ((^~(8'ha5)) ? (((8'hb2) ^~ (8'hb6)) ? ((7'h44) << (8'ha0)) : ((8'hb2) ? (7'h40) : (8'ha4))) : ((~(8'hb5)) - (~(8'hb2)))))), 
parameter param36 = ((((~^(!param35)) >= ((^~param35) != (param35 ^~ param35))) || param35) & (param35 ? (param35 ? param35 : (-(!(8'hb6)))) : param35)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire23;
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire34,
                 wire26,
                 wire25,
                 wire5,
                 wire6,
                 wire7,
                 wire23,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (wire0 ?
                     (wire0[(4'hc):(4'hb)] ?
                         {wire2,
                             $unsigned(wire1[(1'h1):(1'h1)])} : wire4[(3'h5):(1'h0)]) : (^~((-(!(8'ha2))) || (|(~&wire3)))));
  assign wire6 = wire5;
  assign wire7 = wire0;
  always
    @(posedge clk) begin
      reg8 <= (wire4 ?
          wire6 : {$signed($signed(wire2[(1'h0):(1'h0)])),
              (($signed(wire1) ?
                  (|(8'hbb)) : ((8'h9f) ? wire2 : wire1)) != ($signed(wire7) ?
                  wire7 : $unsigned(wire4)))});
      reg9 <= $unsigned(wire7[(2'h2):(1'h1)]);
      reg10 <= reg9;
      reg11 <= $signed($signed($signed(($unsigned(wire1) ?
          {wire4} : {(7'h40)}))));
    end
  module12 #() modinst24 (.wire15(wire4), .clk(clk), .wire14(reg11), .wire17(reg8), .wire16(wire1), .wire13(wire7), .y(wire23));
  assign wire25 = (!$unsigned($signed(wire2[(3'h4):(2'h2)])));
  assign wire26 = wire5[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg27 <= (~|(|((+$unsigned(wire4)) & ((wire5 != wire2) ?
          {wire23} : reg11[(2'h3):(2'h2)]))));
      if (wire2[(4'h9):(1'h1)])
        begin
          reg28 <= $unsigned($signed((~|{{wire23, reg11}})));
          reg29 <= $signed((^~$unsigned({{(8'hbd)}, wire23})));
          if (({(((wire5 ? wire3 : (8'hbf)) ?
                      wire26 : $unsigned(wire2)) ^~ $signed($signed(reg11)))} ?
              $unsigned((^$signed((^reg8)))) : (-{$signed(wire1), reg29})))
            begin
              reg30 <= wire2[(1'h0):(1'h0)];
              reg31 <= {(-(~(~|(^reg28))))};
              reg32 <= ({(&$signed(reg30[(4'h9):(2'h3)])),
                      (~^($signed(wire1) && reg11))} ?
                  (wire4 - {(~^(!(8'hb3)))}) : $signed((~wire3)));
            end
          else
            begin
              reg30 <= reg28;
              reg31 <= {((~&$signed($unsigned(reg11))) >= $unsigned(wire25)),
                  $signed(reg8)};
              reg32 <= reg9;
              reg33 <= $signed({$signed(reg32[(1'h0):(1'h0)])});
            end
        end
      else
        begin
          if ($signed(($unsigned((8'ha0)) >> (~{(reg11 || reg9), (|wire25)}))))
            begin
              reg28 <= {(wire1[(4'hf):(4'h8)] >> reg27),
                  (!(~($unsigned(reg31) * $unsigned(wire23))))};
            end
          else
            begin
              reg28 <= (reg27[(3'h4):(1'h1)] ?
                  ($unsigned(((~^wire25) ?
                      $unsigned(reg31) : (wire6 ?
                          reg30 : (8'hbf)))) && ($unsigned(reg28[(3'h6):(3'h6)]) ?
                      (reg30 ^ (&(8'h9e))) : (~wire5))) : (wire26[(2'h2):(2'h2)] - {(wire6 >> (8'ha6))}));
            end
          reg29 <= wire2[(1'h0):(1'h0)];
          if (wire5)
            begin
              reg30 <= ((~|(+(8'h9c))) ?
                  wire4[(5'h11):(3'h7)] : wire1[(5'h11):(4'ha)]);
            end
          else
            begin
              reg30 <= $signed(wire3[(1'h1):(1'h1)]);
            end
          reg31 <= reg8;
        end
    end
  assign wire34 = ($signed(reg8[(4'ha):(1'h1)]) & wire4[(3'h6):(3'h5)]);
endmodule

module module12
#(parameter param22 = ((((^((7'h43) ? (8'hb9) : (8'ha4))) > (((8'ha4) ~^ (7'h44)) | ((7'h41) != (8'hba)))) | ((~&((8'hbc) <<< (8'hb7))) <= (^~((8'h9e) ? (8'hbf) : (8'hb4))))) ? (~&(!(~((8'hb3) || (8'hbb))))) : ((((^(8'ha5)) ? {(8'hb5), (8'hb2)} : ((8'hb5) * (8'haa))) ? (^{(8'hbe)}) : (((8'ha9) | (8'ha4)) ? (8'hb5) : ((8'ha8) & (8'hb1)))) && {{(+(8'ha3))}, (-(-(8'hb8)))})))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  assign y = {wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = $unsigned($signed((~|$signed((wire13 ? wire16 : wire14)))));
  assign wire19 = wire16[(4'hc):(4'h9)];
  assign wire20 = wire18;
  assign wire21 = $signed($unsigned(wire20));
endmodule

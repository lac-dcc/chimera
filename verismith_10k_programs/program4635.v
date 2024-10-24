module top
#(parameter param50 = ((~^{(!((8'hb0) ? (8'hbd) : (8'ha1))), ({(8'hae)} >= ((8'hb1) && (7'h40)))}) ? ({((8'ha1) ^ ((8'ha6) * (8'ha6))), {((8'hbd) ~^ (7'h44))}} > (({(8'hbb), (8'hba)} ? ((8'ha1) ? (8'hba) : (8'ha5)) : ((8'h9c) ? (8'hb2) : (8'ha5))) ^~ ({(8'hb8), (8'hb5)} ^~ ((8'hae) >> (7'h41))))) : (((((8'ha3) || (8'hbd)) ^ ((8'ha6) ? (8'hb5) : (8'hb0))) ? {(~^(8'had)), ((8'hb4) ? (8'hb5) : (8'hb4))} : (((8'hbb) ? (8'hbc) : (8'hac)) >= ((8'hb2) <= (7'h43)))) & (+(|{(8'hbc), (8'ha5)})))), 
parameter param51 = (8'hbf))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  assign y = {wire49,
                 wire40,
                 wire39,
                 wire37,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg18,
                 reg17,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = wire0[(4'hf):(1'h1)];
  assign wire6 = ((^$signed((|(wire0 ? wire0 : wire2)))) <= $signed(((wire5 ?
                         (wire3 ~^ wire5) : $signed(wire1)) ?
                     ($unsigned(wire2) ?
                         wire5[(3'h6):(2'h2)] : wire4) : (!{wire2}))));
  assign wire7 = (!(((wire6[(3'h4):(1'h0)] ?
                     (wire2 ?
                         (8'hb1) : wire5) : $signed(wire3)) == wire6[(4'he):(3'h7)]) + wire1));
  assign wire8 = ((+$unsigned(($unsigned(wire5) ?
                         (~&wire6) : ((8'hb0) << wire1)))) ?
                     $signed($unsigned($unsigned(wire5))) : (^~$unsigned((~|wire6[(4'hf):(3'h6)]))));
  assign wire9 = ($signed((8'hb3)) ?
                     wire3[(2'h2):(1'h1)] : $signed($unsigned((wire2[(1'h0):(1'h0)] <= wire3[(2'h2):(2'h2)]))));
  assign wire10 = $unsigned(($signed(((wire6 ? wire1 : wire2) ?
                          ((8'hb7) < wire3) : $unsigned(wire6))) ?
                      (~wire5[(3'h6):(3'h4)]) : (8'hb3)));
  always
    @(posedge clk) begin
      reg11 <= {$unsigned(wire0)};
      reg12 <= wire3[(1'h0):(1'h0)];
    end
  assign wire13 = $signed($unsigned((reg11 | reg12[(2'h3):(1'h0)])));
  assign wire14 = (wire8[(1'h0):(1'h0)] ?
                      wire8 : $unsigned((+(+((8'ha9) >= wire3)))));
  assign wire15 = $unsigned(wire5);
  assign wire16 = (wire13 && ((reg12 != wire6) | ((wire10 ?
                          $signed(wire0) : wire1) ?
                      ($unsigned(wire15) >> (8'hbe)) : wire3)));
  always
    @(posedge clk) begin
      reg17 <= ((^(wire7 >= ((8'hb1) ?
              reg11[(1'h1):(1'h0)] : (wire15 ? wire3 : wire1)))) ?
          {$unsigned($unsigned(wire9[(4'hc):(4'hc)])),
              wire9} : ($signed((+wire16)) ? wire14[(1'h1):(1'h1)] : wire4));
      reg18 <= $unsigned((+((8'hbb) > ($unsigned(wire8) > $unsigned(wire7)))));
    end
  module19 #() modinst38 (wire37, clk, wire2, wire6, wire15, wire13);
  assign wire39 = reg17;
  assign wire40 = (~(wire3 ?
                      (!((reg17 ? (7'h40) : wire3) && (^~reg18))) : {wire14,
                          {{wire15, wire4}, (wire4 << wire16)}}));
  always
    @(posedge clk) begin
      reg41 <= wire1[(2'h3):(1'h0)];
      if ($unsigned((wire10 > $unsigned(wire37[(4'hd):(4'hb)]))))
        begin
          reg42 <= reg41;
          reg43 <= $signed({(&($signed(reg12) ?
                  $signed(wire2) : {(8'h9c), wire2}))});
        end
      else
        begin
          reg42 <= ((8'hb4) ?
              wire2[(4'h8):(3'h5)] : ((-$unsigned((8'ha9))) >> (~|$unsigned(wire15[(4'h9):(3'h5)]))));
          reg43 <= $unsigned(((~&(8'hb6)) << (~|wire15)));
        end
      if (((~wire40[(5'h11):(3'h5)]) != ((^~(~|(wire13 ? (8'haa) : wire40))) ?
          {reg43[(3'h5):(2'h3)], {wire13, {wire10, wire16}}} : {wire6})))
        begin
          reg44 <= $signed({wire40, $signed($unsigned($unsigned(wire2)))});
          reg45 <= $signed(((&wire39) ?
              (reg17[(4'hb):(3'h6)] ?
                  ({wire4,
                      wire10} << $unsigned(wire1)) : reg41) : (&(wire39 << (wire0 ?
                  (8'had) : wire2)))));
        end
      else
        begin
          reg44 <= {(((wire13 ? (reg41 ^~ wire7) : $signed(reg41)) ?
                      (^(wire7 ? reg11 : (8'hb3))) : (reg43[(4'he):(4'hb)] ?
                          {wire14} : wire1[(3'h4):(2'h2)])) ?
                  (reg12[(2'h2):(1'h0)] ~^ {wire1,
                      wire4}) : ((reg42 == {wire6}) & $signed(((8'ha1) ?
                      reg18 : reg43)))),
              wire5};
          reg45 <= wire39[(4'h9):(3'h7)];
          reg46 <= wire6;
          if ($signed(wire16[(5'h12):(4'ha)]))
            begin
              reg47 <= $unsigned(reg44[(2'h3):(1'h1)]);
            end
          else
            begin
              reg47 <= (8'ha8);
            end
        end
      reg48 <= $unsigned((~&wire14[(1'h1):(1'h1)]));
    end
  assign wire49 = {$signed(wire7[(1'h0):(1'h0)])};
endmodule

module module19
#(parameter param35 = (({{{(8'ha9), (8'ha9)}, (^~(8'hb9))}, (((8'ha0) ? (8'hbf) : (8'ha6)) - (-(8'haf)))} ? ((8'hb4) ? ((-(8'hb0)) ? ((8'hb3) != (7'h44)) : ((8'had) ? (8'ha8) : (8'hab))) : {((8'haf) ? (8'hbd) : (8'hb5))}) : ((((8'hbf) ? (8'hbe) : (8'ha0)) ? (-(8'hbe)) : ((8'haa) ? (8'ha0) : (8'ha1))) ? ((^(8'hbf)) == ((7'h43) ? (8'ha6) : (8'had))) : (((8'hb7) ? (8'hb4) : (7'h40)) ? (!(8'h9e)) : ((8'hbf) != (8'ha3))))) ? ((~^(|(^(8'hb3)))) ^ (({(7'h41), (8'ha1)} > {(8'h9e), (8'hb8)}) & ((+(8'ha6)) ^ (^~(8'ha1))))) : (|((((8'hbb) ? (8'hb0) : (8'hbe)) ? {(7'h40)} : ((8'hbf) ? (8'ha2) : (8'hbc))) && (+((7'h40) ? (7'h44) : (8'hab)))))), 
parameter param36 = (param35 - ((((param35 - param35) ? param35 : (param35 ? (8'haf) : param35)) ? param35 : (8'hbc)) ? ((~^(param35 ? (8'ha1) : param35)) ? ((param35 < param35) - (param35 ? param35 : param35)) : {(+param35)}) : (|{(param35 << param35)}))))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire23;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  assign y = {wire34,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 (1'h0)};
  assign wire24 = (8'had);
  assign wire25 = wire23;
  assign wire26 = wire25;
  always
    @(posedge clk) begin
      reg27 <= (8'hb8);
    end
  assign wire28 = reg27[(5'h12):(5'h12)];
  assign wire29 = wire28;
  assign wire30 = (wire20[(2'h3):(1'h1)] ?
                      $unsigned({$unsigned((wire26 ?
                              wire22 : wire21))}) : ((wire21 <= (^{wire25,
                          wire20})) ^~ $unsigned($signed((wire25 ^~ wire22)))));
  always
    @(posedge clk) begin
      reg31 <= ({wire23,
              (((~&wire29) ? wire25 : $signed(wire23)) ?
                  $signed((~^wire20)) : ((8'hb6) + wire30))} ?
          reg27[(4'hc):(1'h1)] : (^wire22[(2'h3):(2'h2)]));
      reg32 <= ((-(($unsigned(wire28) ? ((8'ha5) >= wire20) : $signed(wire22)) ?
          {$unsigned(wire30), wire29} : ((&reg27) ?
              (wire29 ? wire24 : (8'hbb)) : $signed(wire30)))) | ((+((wire25 ?
                  reg27 : (8'hb8)) ?
              ((8'had) - wire22) : $unsigned(wire30))) ?
          $unsigned($unsigned((-wire30))) : wire28));
      reg33 <= ((8'h9f) ?
          $signed(wire26) : ((~|wire25) ?
              wire24[(3'h5):(3'h4)] : $signed(((reg27 ? wire30 : reg32) ?
                  (8'ha2) : wire25))));
    end
  assign wire34 = reg27;
endmodule

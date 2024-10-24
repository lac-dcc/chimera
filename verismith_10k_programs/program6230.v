module top
#(parameter param44 = (|(-(((~|(8'hb7)) * {(8'haa)}) ? {(^(8'hac))} : (~^(8'hb0))))), 
parameter param45 = ((^(^~({param44} != param44))) ? {param44} : param44))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire39;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire39,
                 (1'h0)};
  assign wire5 = ($unsigned((~|(wire1 ? {(8'hb7)} : {(8'ha7)}))) ?
                     $unsigned((wire0 ?
                         ($signed(wire1) ?
                             $signed(wire0) : (wire3 ?
                                 wire0 : wire4)) : $signed((wire4 ?
                             wire2 : wire3)))) : wire4[(1'h0):(1'h0)]);
  assign wire6 = wire1[(3'h6):(2'h3)];
  assign wire7 = wire4;
  assign wire8 = (^~$unsigned((wire2[(3'h6):(3'h4)] ?
                     $unsigned(wire6[(3'h5):(3'h5)]) : wire2)));
  assign wire9 = (((wire1 > wire4) ?
                         ({wire0, ((8'haf) + wire7)} + $signed((wire3 ?
                             (8'h9e) : wire8))) : wire7[(4'hf):(4'he)]) ?
                     wire8[(3'h5):(2'h3)] : ((wire0[(3'h5):(1'h1)] ?
                         wire5[(1'h0):(1'h0)] : $unsigned((7'h41))) >= $signed(((wire2 ?
                             wire5 : wire5) ?
                         (8'ha7) : {wire3, wire4}))));
  assign wire10 = wire4[(1'h1):(1'h1)];
  assign wire11 = (^~wire3);
  assign wire12 = (wire4[(1'h0):(1'h0)] - ((~^(8'hac)) << (~^{(8'ha9),
                      wire11})));
  assign wire13 = $signed({((^~wire11) ?
                          (^~$unsigned(wire6)) : $unsigned($unsigned(wire6)))});
  assign wire14 = wire0;
  module15 #() modinst40 (.wire17(wire11), .clk(clk), .wire20(wire7), .wire18(wire9), .wire19(wire14), .wire16(wire3), .y(wire39));
  assign wire41 = (wire5 & ($signed($unsigned(wire14)) ~^ $signed(wire12)));
  assign wire42 = wire41;
  assign wire43 = ((wire1[(5'h12):(1'h0)] || $signed({$signed(wire5)})) == $signed(wire7[(4'hb):(2'h3)]));
endmodule

module module15
#(parameter param37 = (({(8'ha4), (((7'h42) & (8'had)) * ((8'ha2) ? (8'ha7) : (8'h9e)))} ? (((^~(8'ha9)) != ((8'ha2) - (8'ha0))) ? ({(8'ha7), (8'hbe)} ? (8'had) : (~(8'hb0))) : (~&{(8'ha3), (7'h44)})) : ((((7'h41) ? (8'hbc) : (8'ha2)) ^~ {(8'h9c), (8'hb0)}) ? ((!(8'hb0)) || ((7'h41) * (8'hb0))) : (~^{(8'hbc), (8'ha5)}))) ? ({(~&{(8'hb9)}), {((8'ha8) ? (8'hbe) : (8'hba)), (|(8'ha9))}} - (&(|(~|(8'ha7))))) : ((8'ha2) > (^~(~|((8'hbd) >= (8'hbc)))))), 
parameter param38 = ((((|(param37 || param37)) || (~|((7'h44) ? param37 : param37))) ? param37 : param37) * {(&param37)}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire31;
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  assign y = {wire34, wire33, wire31, reg36, reg35, (1'h0)};
  module21 #() modinst32 (.wire24(wire16), .wire23(wire18), .wire25(wire19), .clk(clk), .y(wire31), .wire22(wire17));
  assign wire33 = $unsigned($unsigned(wire16[(3'h7):(1'h0)]));
  assign wire34 = wire16;
  always
    @(posedge clk) begin
      reg35 <= $signed(($signed($unsigned((|wire34))) ?
          (&{wire16[(4'hd):(4'hb)]}) : (wire16 ?
              (~^wire19) : $unsigned(wire31))));
      reg36 <= ((~^$unsigned(($signed((8'hb1)) ?
              (^wire20) : $unsigned(wire19)))) ?
          $unsigned($signed(((wire16 ? wire33 : wire16) ?
              $signed(reg35) : wire34[(1'h1):(1'h1)]))) : $unsigned((&$unsigned(wire16[(4'hb):(4'h9)]))));
    end
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire [(4'ha):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire30, wire29, wire28, reg27, reg26, (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= wire22[(3'h7):(3'h7)];
      reg27 <= reg26;
    end
  assign wire28 = $signed($signed(reg27));
  assign wire29 = $unsigned((^((&$unsigned(wire28)) ?
                      $signed({wire28}) : (!{reg26, wire23}))));
  assign wire30 = $unsigned({(~&($signed((8'hb7)) - $unsigned(wire24)))});
endmodule

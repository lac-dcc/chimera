module top
#(parameter param56 = (({(^{(8'hab)}), {((8'hb9) & (8'hb7))}} <= ((~|((8'ha7) ? (8'ha2) : (8'hbd))) <<< (+((8'hab) ? (8'h9e) : (8'h9c))))) || ({((~^(8'h9f)) ? ((8'hb9) <= (8'hbc)) : (&(8'hbe))), (((8'h9c) ? (8'hbb) : (8'h9c)) ~^ (^(8'ha0)))} ? ((&(8'haf)) ? ((-(8'haa)) + ((8'hbd) ? (8'ha1) : (8'hbe))) : (&(+(8'hac)))) : ((((8'hbe) ? (7'h41) : (8'ha1)) ? {(8'hb1), (8'hbf)} : ((8'ha9) >> (8'hb0))) ? {((8'ha8) ? (8'ha5) : (8'ha4)), ((8'hb1) ? (8'hb5) : (8'hb2))} : {((8'h9d) ? (7'h43) : (8'hbc))}))), 
parameter param57 = (param56 ? param56 : ((8'ha7) && ((~&(&param56)) != param56))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire42;
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire44,
                 wire5,
                 wire6,
                 wire42,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = (^$unsigned(((^$unsigned(wire0)) ?
                     $signed($signed(wire0)) : wire1)));
  module7 #() modinst43 (wire42, clk, wire4, wire5, wire6, wire2, wire3);
  assign wire44 = {$unsigned(wire1)};
  always
    @(posedge clk) begin
      reg45 <= $signed((|(~&$signed(wire5[(4'h8):(3'h6)]))));
      reg46 <= (($signed(((~&wire5) || reg45[(2'h2):(1'h0)])) >= (7'h43)) >>> ($unsigned($signed((wire44 ^ wire44))) || (({wire42} ?
          $unsigned(wire4) : wire3) + (wire5 | $signed(wire44)))));
      reg47 <= {$signed($signed(($unsigned(wire5) ?
              $signed(wire6) : (wire42 <<< (8'ha8)))))};
      reg48 <= (~wire3);
      if (($unsigned(reg47) ~^ ((|($unsigned(wire4) ?
              {wire1} : $signed(wire4))) ?
          $unsigned(wire44) : $unsigned((wire6 ? (reg45 == wire4) : wire5)))))
        begin
          reg49 <= {reg45[(3'h6):(2'h3)],
              (~((reg47[(1'h1):(1'h1)] ?
                  wire0[(3'h5):(2'h2)] : ((8'hb8) ? wire6 : reg45)) & ({reg46,
                  wire42} || wire42)))};
          reg50 <= $unsigned($unsigned((+wire2)));
          reg51 <= (!reg48[(1'h1):(1'h0)]);
          reg52 <= (!{reg51[(4'h8):(2'h2)],
              ((+(&(8'ha9))) << ((reg45 ? wire42 : wire3) <<< {reg47}))});
        end
      else
        begin
          reg49 <= reg46[(1'h1):(1'h1)];
          reg50 <= wire4;
        end
    end
  assign wire53 = (wire4[(5'h12):(3'h5)] ?
                      $signed(reg49) : $signed({$signed((~&(8'ha5))), wire3}));
  assign wire54 = (($unsigned((^(&wire6))) & ((^~wire0) & {$unsigned((8'hb1)),
                          {reg46}})) ?
                      (8'hb7) : ({reg52[(3'h6):(2'h2)],
                          {reg47[(5'h13):(1'h0)]}} & wire42[(1'h1):(1'h1)]));
  assign wire55 = $signed((reg45[(3'h4):(1'h1)] & ($signed(wire44[(1'h0):(1'h0)]) ^~ reg49[(1'h0):(1'h0)])));
endmodule

module module7
#(parameter param41 = (((~&(^((8'hbc) ? (8'hae) : (8'hbf)))) ? ((((8'ha9) + (8'h9c)) ? ((8'ha3) >>> (8'hae)) : ((8'hbe) * (8'h9e))) ? (~{(7'h43), (8'ha7)}) : (((8'hb1) <<< (8'hbe)) ? {(8'hbb)} : {(8'hbf), (8'hb6)})) : ((+(~&(8'ha3))) ? {((7'h44) ? (7'h43) : (8'hb3)), ((8'h9c) ? (8'hbb) : (8'hbf))} : ({(8'hb5), (7'h40)} < (!(7'h40))))) ? (7'h42) : (&((&((8'hb1) - (8'had))) * (((8'hb3) ? (8'h9e) : (7'h43)) ~^ (|(8'ha4)))))))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire30;
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  assign y = {wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire13,
                 wire14,
                 wire30,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire13 = $unsigned((8'ha4));
  assign wire14 = (((-wire13[(2'h2):(1'h1)]) ?
                          (-((wire8 & wire8) ?
                              $signed(wire9) : $unsigned((8'hac)))) : wire12[(3'h4):(1'h1)]) ?
                      $unsigned((wire8[(3'h7):(3'h7)] << ({wire13, (8'hb1)} ?
                          $signed(wire8) : ((8'h9e) ?
                              wire10 : wire8)))) : (|(-(^((8'h9f) ^~ wire9)))));
  module15 #() modinst31 (wire30, clk, wire12, wire13, wire8, wire10, wire14);
  assign wire32 = (wire8[(5'h13):(4'hd)] << wire14[(5'h12):(5'h11)]);
  assign wire33 = (wire12 <= $signed($signed(wire12)));
  assign wire34 = $unsigned($signed($signed($signed(wire30))));
  assign wire35 = $unsigned(wire30[(2'h3):(2'h2)]);
  assign wire36 = wire8;
  assign wire37 = wire32[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg38 <= (((~{wire33[(1'h0):(1'h0)],
          $signed(wire9)}) >= $unsigned({(wire12 ~^ wire14)})) == (((^wire36[(4'h8):(1'h1)]) ?
              wire32 : $unsigned(wire8)) ?
          $unsigned({$signed(wire36)}) : ($signed((wire8 ?
              wire11 : wire34)) & wire13)));
      reg39 <= $unsigned((+{(wire35[(5'h13):(4'he)] ?
              wire37[(3'h5):(2'h2)] : (!wire33)),
          ((wire34 + wire34) ?
              (wire32 >> wire32) : (wire37 ? wire12 : wire37))}));
    end
  assign wire40 = $signed(((~({(8'had), (8'ha0)} ?
                      {wire36} : reg39)) - (!wire13)));
endmodule

module module15
#(parameter param28 = {({(((7'h40) ? (8'hb7) : (8'h9c)) << {(8'ha4)})} ? {{((8'hb0) ? (8'h9c) : (8'ha6)), ((8'hbb) || (8'haf))}} : (~&((+(8'hbb)) ? {(8'h9d)} : {(8'hae)})))}, 
parameter param29 = (((~|((param28 <<< param28) ? (param28 ? param28 : (8'hbc)) : param28)) && ((^{param28, param28}) ? (|param28) : (param28 >>> (param28 + param28)))) ? {param28, (^~(&(param28 ? param28 : param28)))} : param28))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  input wire [(2'h2):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  assign y = {wire27, wire24, wire23, wire22, wire21, reg26, reg25, (1'h0)};
  assign wire21 = wire17;
  assign wire22 = wire21[(5'h12):(4'ha)];
  assign wire23 = (^~$unsigned(wire19));
  assign wire24 = {(wire22 - ($unsigned($signed(wire20)) ?
                          $unsigned(wire19) : {(wire16 | wire21),
                              (wire21 ? wire21 : wire20)}))};
  always
    @(posedge clk) begin
      reg25 <= (8'hb2);
      reg26 <= {{$signed(wire23[(1'h0):(1'h0)])}, wire21};
    end
  assign wire27 = wire16;
endmodule

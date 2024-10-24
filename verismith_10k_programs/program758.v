module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  assign y = {wire49,
                 wire47,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2[(3'h4):(2'h2)];
  assign wire6 = (wire3[(1'h1):(1'h1)] ? {(8'haa), wire4} : (8'ha1));
  assign wire7 = $signed($unsigned($unsigned($unsigned(((8'ha2) && wire5)))));
  assign wire8 = $signed((~^wire4[(3'h6):(1'h1)]));
  assign wire9 = ({((wire6[(2'h2):(2'h2)] ? {wire5, wire6} : $unsigned(wire5)) ?
                             ((wire5 ? wire7 : wire6) ?
                                 (wire5 ?
                                     wire2 : wire1) : $unsigned((7'h42))) : wire5),
                         wire8} ?
                     wire6[(1'h0):(1'h0)] : {(^~$unsigned($signed(wire3)))});
  assign wire10 = wire6;
  assign wire11 = $unsigned($unsigned(((8'hb7) * ((8'hb9) >>> wire9[(3'h4):(1'h1)]))));
  assign wire12 = $signed(wire1);
  assign wire13 = ((($unsigned((wire5 ? wire9 : wire8)) ?
                      ((wire8 ?
                          wire3 : wire8) - $signed((8'haf))) : $unsigned((wire6 ?
                          wire3 : wire12))) >> wire12) - $signed(wire1));
  assign wire14 = $signed(wire0[(4'h8):(2'h2)]);
  assign wire15 = wire11;
  module16 #() modinst48 (wire47, clk, wire9, wire0, wire11, wire2);
  assign wire49 = wire8;
endmodule

module module16
#(parameter param45 = (8'hb8), 
parameter param46 = (8'hbf))
(y, clk, wire17, wire18, wire19, wire20);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire41;
  assign y = {wire44, wire43, wire21, wire41, (1'h0)};
  assign wire21 = wire19;
  module22 #() modinst42 (wire41, clk, wire18, wire17, wire21, wire19, wire20);
  assign wire43 = wire18;
  assign wire44 = (~($unsigned((~^(wire19 ? (8'hbc) : (8'haa)))) ?
                      $unsigned(wire41) : $unsigned(({wire20, wire21} ?
                          (8'hbf) : wire43))));
endmodule

module module22
#(parameter param39 = ((((((8'hb2) != (8'hb5)) ? ((8'ha5) ? (8'ha8) : (8'h9e)) : ((8'hb2) ? (8'ha9) : (8'hbb))) ? (((8'hae) & (8'hb4)) ? (!(8'haf)) : ((8'hb2) ? (7'h40) : (7'h42))) : (~&(!(8'ha8)))) ? ((7'h42) >>> ((8'ha6) > ((8'ha7) ? (8'hb1) : (8'hb3)))) : ((+((8'hb9) ? (8'hb9) : (8'hb9))) ? ((~^(8'hb8)) ? ((8'hbc) ? (8'hb6) : (8'h9e)) : ((7'h44) <<< (8'haa))) : (~^((8'hbb) ? (8'hbb) : (8'haa))))) ? (~&(~{(-(8'haa))})) : ({(|((8'hbe) && (8'hb1)))} ? (!((~&(8'hb8)) ^ (|(8'ha4)))) : (8'ha8))), 
parameter param40 = ((param39 ? param39 : param39) >> param39))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire35;
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire35,
                 reg36,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((~^(~(7'h42)))))
        begin
          reg28 <= (8'haa);
          reg29 <= ((+$signed($signed((~&(7'h40))))) ?
              $unsigned({$unsigned($unsigned(wire27)),
                  (+(wire27 != wire24))}) : ($signed({(reg28 >> wire24),
                  wire26}) >>> $signed(((wire23 & wire23) ?
                  (~|wire25) : $signed((8'ha1))))));
          reg30 <= wire23[(1'h1):(1'h1)];
          reg31 <= reg30[(1'h0):(1'h0)];
        end
      else
        begin
          reg28 <= ($unsigned({($signed(wire24) ?
                  (^~wire23) : reg31[(3'h5):(1'h1)])}) >> wire24[(1'h1):(1'h0)]);
          reg29 <= $signed(reg28[(3'h6):(3'h6)]);
          reg30 <= {$unsigned({(reg28[(3'h7):(1'h1)] + $signed(wire25)),
                  $unsigned((reg31 <<< (8'ha6)))}),
              reg30[(4'hb):(2'h3)]};
        end
      reg32 <= $signed((^(~|reg30[(3'h5):(3'h4)])));
      reg33 <= $signed((^($unsigned((reg28 ? wire25 : wire24)) ?
          reg28[(3'h7):(1'h1)] : $signed((+reg30)))));
      reg34 <= ($signed((~({reg33} || (^~reg29)))) <= $signed(({{wire26}} >> wire27)));
    end
  assign wire35 = ({{$unsigned((reg29 ^~ reg28))},
                      {$signed(((8'h9c) ?
                              reg31 : reg30))}} | (((~(wire25 == (8'hb2))) ?
                          $unsigned({wire26, reg34}) : $unsigned((^~reg33))) ?
                      reg30[(2'h3):(1'h0)] : (-wire25)));
  always
    @(posedge clk) begin
      reg36 <= {reg33[(5'h12):(4'hd)],
          ((8'ha8) | (((reg31 ? reg29 : reg31) ~^ {reg32}) ?
              $unsigned({reg28,
                  wire35}) : ($signed(reg30) != (reg28 == reg29))))};
    end
  assign wire37 = (({wire25[(2'h3):(1'h0)], reg30[(3'h5):(3'h5)]} ?
                      (!($signed(wire24) ?
                          $signed((8'ha1)) : $signed(wire24))) : reg34[(4'ha):(4'h8)]) && wire24[(2'h2):(2'h2)]);
  assign wire38 = reg29;
endmodule

module top
#(parameter param45 = ((-({((8'ha9) ? (8'ha8) : (8'haf)), ((8'hb9) & (8'haa))} + ({(8'ha8), (7'h41)} && {(8'hb9)}))) >> ((|(((8'hbe) ? (8'hb8) : (8'hb6)) > (&(8'ha5)))) ? (((+(8'hb0)) >>> ((8'hb8) ? (8'hbb) : (8'ha3))) ? (|((8'hab) ? (8'hb1) : (8'hae))) : ((8'hb7) >>> ((8'h9f) * (8'hae)))) : ((((8'ha7) >>> (8'hb4)) ? (8'hbe) : ((8'hb0) ? (8'ha9) : (8'h9f))) ? (~^(&(8'hb2))) : (~(!(8'hba)))))), 
parameter param46 = (~&({{(&param45)}, (+param45)} ? ({(param45 ? param45 : param45), (param45 ? param45 : param45)} & {param45, param45}) : {param45})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire42;
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire44,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire42,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~&wire4[(4'hb):(3'h4)]))
        begin
          reg5 <= ((wire1[(3'h5):(2'h3)] != $signed({((8'hb4) ^ wire0)})) ?
              $unsigned((((wire0 ? wire2 : wire3) ?
                  wire3 : (wire3 ?
                      wire2 : wire1)) && $signed($signed(wire4)))) : {wire3[(3'h7):(1'h1)],
                  (~^($unsigned(wire1) > $unsigned(wire0)))});
          reg6 <= {wire4};
          reg7 <= (reg6 ?
              (&{(~|((8'hb8) ^~ wire3)), $signed({wire0, reg6})}) : (wire2 ?
                  reg5 : wire0[(4'he):(4'hb)]));
        end
      else
        begin
          reg5 <= wire0[(1'h0):(1'h0)];
        end
    end
  assign wire8 = $signed((|$unsigned(($unsigned(reg6) ?
                     $unsigned(wire1) : wire3[(3'h4):(1'h0)]))));
  assign wire9 = $signed({(~({(8'hb5)} == (8'hbf)))});
  assign wire10 = reg5;
  assign wire11 = $unsigned((wire10[(5'h12):(5'h10)] - (wire2[(2'h2):(1'h1)] || $signed({(8'hab),
                      (8'hba)}))));
  assign wire12 = ($signed(($unsigned(wire9[(5'h13):(4'h8)]) ?
                          $unsigned({reg5}) : $signed({reg5}))) ?
                      $signed($signed(reg5)) : (((~|$unsigned(wire4)) << wire2[(3'h4):(1'h1)]) >= wire10[(4'hf):(3'h7)]));
  assign wire13 = (~(8'had));
  assign wire14 = wire11[(4'hb):(4'h8)];
  assign wire15 = (8'ha2);
  assign wire16 = wire1[(3'h4):(2'h2)];
  assign wire17 = (($unsigned($unsigned(wire3[(4'h8):(4'h8)])) ?
                          (&(wire9[(2'h2):(2'h2)] ?
                              $signed(reg5) : $signed((8'ha7)))) : reg5[(3'h6):(3'h5)]) ?
                      ((~&$signed({wire15,
                          (8'hbe)})) >= {$signed($signed(wire0)),
                          (^~$unsigned(reg7))}) : reg6);
  assign wire18 = (!(~^reg5));
  assign wire19 = $unsigned((((wire9[(4'h8):(2'h3)] ?
                              (wire17 << wire3) : (wire18 ? wire16 : wire18)) ?
                          ($signed(wire4) ?
                              $signed(wire12) : (reg7 ?
                                  reg6 : wire3)) : $signed((wire15 ?
                              wire0 : wire11))) ?
                      (^wire15[(4'h9):(2'h3)]) : $unsigned((+(-(8'hbe))))));
  assign wire20 = (~&$signed($unsigned(wire17)));
  assign wire21 = $unsigned(wire2);
  module22 #() modinst43 (wire42, clk, reg5, reg7, wire10, wire19, wire13);
  assign wire44 = wire12[(3'h7):(1'h1)];
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire28;
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire28 = wire24[(2'h3):(1'h0)];
  assign wire29 = wire26[(4'hc):(3'h5)];
  assign wire30 = ($unsigned($unsigned(((wire24 ? wire26 : wire23) && (wire28 ?
                      (8'h9e) : (7'h44))))) == wire29);
  assign wire31 = $signed(wire30);
  always
    @(posedge clk) begin
      reg32 <= $signed((~{wire25[(3'h6):(3'h4)]}));
      if ((8'hbd))
        begin
          reg33 <= {$signed((wire30 <<< ((7'h44) ?
                  (wire27 ? reg32 : wire30) : {wire30, wire23}))),
              ((wire24 ?
                      (wire25 ?
                          wire29[(3'h4):(2'h3)] : (wire29 + wire25)) : $signed((^~wire28))) ?
                  $unsigned(($unsigned(wire24) || $signed((8'ha3)))) : wire23[(3'h6):(3'h4)])};
          reg34 <= (({{((7'h41) << reg33), (~wire31)},
                      {(reg33 ? reg32 : reg33), (wire26 ? wire24 : wire30)}} ?
                  (~$signed((8'hba))) : {$unsigned(wire25),
                      ((wire27 ? wire31 : wire26) >> wire24)}) ?
              {wire27} : {wire23});
          reg35 <= reg32;
        end
      else
        begin
          reg33 <= (&reg35);
          if ((wire30[(2'h3):(1'h0)] ?
              wire27 : (!{wire31, wire28[(2'h3):(2'h2)]})))
            begin
              reg34 <= ($signed($unsigned(wire29[(4'hd):(3'h7)])) || $unsigned($signed(($unsigned(wire30) ?
                  $unsigned(reg34) : wire23[(2'h3):(2'h3)]))));
              reg35 <= wire30[(5'h12):(5'h11)];
              reg36 <= $signed(($signed((-(wire24 ? wire30 : wire26))) ?
                  ((wire31[(1'h1):(1'h1)] ?
                          (-(7'h40)) : (wire28 ? wire25 : wire26)) ?
                      (8'hbc) : ((wire26 > wire24) + (reg32 <= reg34))) : wire31));
              reg37 <= ((($unsigned({wire24,
                      wire30}) ^~ wire23) != $unsigned(reg34)) ?
                  $unsigned(reg32[(4'he):(3'h5)]) : wire23[(2'h2):(1'h0)]);
              reg38 <= (!wire28);
            end
          else
            begin
              reg34 <= (((~wire27) || wire26) ?
                  $signed((($signed(reg35) ?
                      reg36[(3'h4):(2'h3)] : reg36[(3'h7):(3'h7)]) && ((!wire28) ?
                      (reg36 ?
                          reg37 : wire27) : (wire29 != wire24)))) : $unsigned($signed(($signed((8'hba)) ?
                      wire29[(4'ha):(4'h8)] : {wire28}))));
            end
          reg39 <= ((|{{(wire29 ? wire28 : wire27), wire26[(4'hf):(4'hb)]}}) ?
              wire30 : reg38);
        end
    end
  assign wire40 = (|(^($unsigned((reg36 && reg37)) ?
                      (8'hb7) : $unsigned(((8'hb6) >> wire27)))));
  assign wire41 = $signed(reg34);
endmodule

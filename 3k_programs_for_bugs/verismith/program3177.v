module top #(parameter param46 = (7'h43)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned($signed((~$signed($unsigned(wire3)))));
  always
    @(posedge clk) begin
      reg5 <= (+{wire4[(1'h0):(1'h0)]});
      reg6 <= (~|$signed({$signed((&wire2)), $signed(wire0[(2'h3):(2'h3)])}));
      reg7 <= ((wire3[(4'h9):(2'h3)] ?
          (~(wire1 | wire4[(3'h4):(1'h0)])) : {$unsigned($signed(reg5))}) <= {(~^$unsigned(((8'hb5) == wire4))),
          ((wire3[(1'h1):(1'h0)] ?
              {wire3, reg5} : (8'hbf)) != (-wire1[(4'hf):(4'hb)]))});
      reg8 <= ($unsigned(($signed(((8'hb7) ? wire1 : wire0)) ?
          reg5 : {wire2[(4'h9):(1'h0)],
              (wire2 + reg5)})) >> $unsigned(((~(reg5 ? reg6 : wire0)) ?
          $signed(wire0) : $signed($signed((8'hb6))))));
      reg9 <= {$signed((-(&(-reg6))))};
    end
  assign wire10 = (~^$unsigned((8'ha3)));
  assign wire11 = (($signed((^{reg9, wire2})) <= $signed($signed((wire3 ?
                      wire10 : (7'h44))))) - wire0);
  assign wire12 = $unsigned({((reg9 <<< {reg9, wire11}) ?
                          $signed((!(8'hb4))) : reg7[(2'h3):(2'h3)]),
                      ((wire4[(1'h1):(1'h0)] >= {(7'h40), wire10}) ?
                          ($signed(reg5) ?
                              wire3 : (&wire2)) : {(wire3 ^~ (8'hb2)),
                              {wire10}})});
  module13 #() modinst26 (wire25, clk, reg9, reg6, wire12, reg7, wire1);
  assign wire27 = wire25;
  assign wire28 = (~^(({(reg8 >>> wire27), reg9[(2'h2):(1'h1)]} ?
                          wire11[(3'h6):(3'h4)] : (~^(wire27 ?
                              (8'hb9) : reg9))) ?
                      (((~^wire0) < ((8'ha3) != (8'hb9))) ?
                          $unsigned(reg5[(1'h0):(1'h0)]) : wire1[(4'hd):(4'h8)]) : reg9));
  assign wire29 = $signed(($signed((&$unsigned(wire12))) ?
                      reg5 : (!((wire28 ? wire2 : wire0) ?
                          (wire11 ^ (8'h9d)) : (wire10 * (8'hb1))))));
  assign wire30 = reg5[(4'ha):(3'h4)];
  assign wire31 = ($unsigned(reg9) ?
                      {((~(reg5 >> wire12)) != $signed(reg6[(5'h11):(4'h9)])),
                          $unsigned($signed((~&reg7)))} : (8'hbb));
  always
    @(posedge clk) begin
      if ($unsigned($signed(($unsigned(((8'ha4) ?
          wire2 : reg7)) == $signed((!wire30))))))
        begin
          reg32 <= wire25[(5'h12):(4'hb)];
          reg33 <= {(+(8'had)), wire11};
          if ($unsigned(reg7[(4'hc):(1'h0)]))
            begin
              reg34 <= $signed(wire29[(3'h7):(3'h6)]);
              reg35 <= wire12[(4'he):(3'h7)];
              reg36 <= ((reg7[(5'h10):(4'h9)] ?
                      ((-wire10[(4'hc):(3'h6)]) ?
                          wire31[(1'h0):(1'h0)] : $unsigned(((8'hab) ?
                              (8'hbe) : wire0))) : ($unsigned(reg34[(3'h6):(2'h3)]) ?
                          ((wire28 ? reg6 : wire31) ?
                              $signed(wire29) : $signed((8'ha1))) : $unsigned(reg34[(4'h8):(1'h0)]))) ?
                  $unsigned(($signed((reg7 ?
                      reg5 : wire31)) * wire3[(1'h0):(1'h0)])) : {$signed($signed($signed(wire4))),
                      $signed((~&(wire28 < wire29)))});
              reg37 <= reg8;
              reg38 <= (reg33[(2'h2):(1'h1)] || {($signed(wire29) ?
                      ($signed(reg37) ?
                          (reg33 != reg37) : wire31[(2'h3):(2'h3)]) : ((~wire10) < $signed(wire0)))});
            end
          else
            begin
              reg34 <= wire29;
              reg35 <= {$signed(reg7[(4'h8):(1'h1)]),
                  (($signed($signed(reg9)) <= wire27) ?
                      (8'hbb) : (($unsigned(reg7) >> (+wire27)) ^~ $signed({reg7})))};
              reg36 <= $signed(reg7);
              reg37 <= (($signed(reg7) ?
                      $signed($signed({reg32, wire1})) : ((|((8'hbd) ?
                          reg35 : wire4)) ^ $unsigned($unsigned(reg34)))) ?
                  reg5 : (^(~&((reg5 >= reg9) ~^ reg5[(4'h8):(3'h6)]))));
            end
          reg39 <= reg32[(2'h2):(1'h1)];
        end
      else
        begin
          reg32 <= (reg38[(2'h3):(2'h3)] ?
              wire29 : ($unsigned(((7'h43) > (|reg36))) ?
                  wire31 : reg32[(2'h3):(1'h0)]));
          if (reg36)
            begin
              reg33 <= wire31;
              reg34 <= ((~&(8'hbf)) ^~ (~^{$unsigned($signed((8'hba)))}));
              reg35 <= (+wire31);
            end
          else
            begin
              reg33 <= ((reg6 >>> ($signed((~|wire2)) ?
                  (reg5 ?
                      $signed(reg35) : $unsigned(wire10)) : wire1[(1'h0):(1'h0)])) | reg6[(4'ha):(2'h2)]);
              reg34 <= (($signed((wire30[(4'hb):(1'h1)] ?
                          reg36[(1'h0):(1'h0)] : $signed(reg39))) ?
                      {wire4, reg32} : $unsigned(reg37[(3'h5):(3'h5)])) ?
                  wire27 : reg8[(4'h9):(1'h0)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg40 <= $signed((wire31[(2'h3):(2'h3)] ?
          $signed(($signed((8'hbc)) ?
              (~|(8'ha2)) : reg9)) : (&((^~reg5) + wire2))));
      reg41 <= $signed($signed($signed(wire1)));
    end
  always
    @(posedge clk) begin
      reg42 <= (^~(wire11 <<< (|$signed(reg41[(4'hd):(2'h2)]))));
      reg43 <= {((^(!wire1)) ^~ reg39[(2'h2):(1'h1)]),
          (~$unsigned($unsigned($signed(wire10))))};
      reg44 <= (~|reg41[(3'h6):(3'h4)]);
      reg45 <= $unsigned($signed($signed(wire12[(5'h15):(4'h8)])));
    end
endmodule

module module13
#(parameter param23 = ((((((8'ha9) ? (7'h41) : (8'hbc)) ? ((8'hb2) >>> (8'hab)) : ((8'hbb) << (8'hbb))) ? (&((8'hb0) << (8'hab))) : (((7'h40) ? (8'ha4) : (8'hbf)) ? ((8'hb4) ? (8'hbd) : (8'hb7)) : (-(7'h43)))) * (({(7'h43), (7'h40)} ? ((8'h9f) ? (8'hac) : (8'ha1)) : (8'hb1)) | (7'h41))) >>> ((8'hac) == ((((8'ha3) < (8'hb8)) && (!(8'hba))) <= ((-(8'hb3)) ? ((8'hab) ? (8'hb8) : (8'hba)) : (7'h43))))), 
parameter param24 = ((8'hb1) < param23))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(5'h10):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  assign y = {wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = wire18[(3'h4):(3'h4)];
  assign wire20 = wire15[(4'hf):(4'h9)];
  assign wire21 = wire18[(4'h9):(3'h7)];
  assign wire22 = (wire16[(2'h3):(2'h3)] ?
                      ((!(^~(!wire20))) ^~ (~|wire14)) : wire19);
endmodule

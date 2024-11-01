module top
#(parameter param61 = (+((((~|(7'h41)) ^ ((8'h9f) ? (8'hba) : (8'hbe))) ? (8'h9f) : (((8'hbc) ? (8'ha7) : (8'hbb)) ? (8'hae) : ((8'hb4) ? (7'h44) : (8'hb1)))) ? (~((8'h9e) >= ((8'ha7) ? (8'hba) : (8'ha0)))) : (~{((8'hb7) <<< (8'hae)), ((8'h9e) ? (8'hbc) : (8'hb0))}))), 
parameter param62 = param61)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire54;
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  assign y = {wire60,
                 wire56,
                 wire4,
                 wire5,
                 wire54,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (8'ha3);
  module6 #() modinst55 (wire54, clk, wire4, wire5, wire1, wire2, wire3);
  assign wire56 = {(wire4 && ((8'ha3) ?
                          $signed((wire1 ? (8'ha7) : wire54)) : {wire54})),
                      {wire2}};
  always
    @(posedge clk) begin
      reg57 <= wire4;
      reg58 <= $unsigned(wire4[(4'hd):(2'h3)]);
      reg59 <= (~^(wire1 ? wire2 : $signed((|$signed(wire0)))));
    end
  assign wire60 = wire4;
endmodule

module module6
#(parameter param52 = (8'hb8), 
parameter param53 = param52)
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire47;
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire12,
                 wire13,
                 wire14,
                 wire47,
                 reg49,
                 reg15,
                 (1'h0)};
  assign wire12 = {((((~|(8'haf)) ^~ {wire11, wire9}) ?
                              $signed($signed(wire7)) : {(wire11 ?
                                      wire11 : wire10),
                                  $signed(wire10)}) ?
                          $unsigned(($unsigned(wire11) ?
                              $unsigned(wire8) : wire11)) : {($signed(wire7) ^ (|wire8)),
                              $signed((^~wire8))}),
                      $unsigned((wire8 ? wire11 : $signed($unsigned(wire9))))};
  assign wire13 = (($signed(($unsigned(wire8) | wire11)) >> $unsigned($unsigned($signed(wire11)))) ?
                      $signed(wire11[(4'h9):(3'h4)]) : {wire9,
                          ($signed(wire9) ^ wire9)});
  assign wire14 = wire7;
  always
    @(posedge clk) begin
      reg15 <= ((wire10[(3'h7):(1'h0)] <<< (!{wire8})) <= $signed((~$unsigned($unsigned(wire13)))));
    end
  module16 #() modinst48 (wire47, clk, wire12, wire9, wire10, wire8, wire7);
  always
    @(posedge clk) begin
      reg49 <= $signed({$signed((wire7 << (wire8 ? wire7 : wire47)))});
    end
  assign wire50 = wire14;
  assign wire51 = $signed(wire8);
endmodule

module module16
#(parameter param46 = ((((((8'hb5) ? (8'hb4) : (8'hac)) ? (^(7'h44)) : ((8'hb6) & (7'h40))) ? ({(8'ha1), (8'hb9)} - ((8'hba) ? (8'h9c) : (8'ha0))) : {((8'ha8) >>> (7'h43))}) ? (((^~(8'hb9)) != {(8'h9d), (8'ha3)}) ^ ({(8'ha7), (8'ha4)} & ((7'h41) ? (8'hbc) : (8'ha9)))) : {(((8'hb1) < (8'ha9)) <= ((7'h44) ? (7'h42) : (8'hb8)))}) ? ((((7'h40) == {(8'ha9), (8'hb6)}) ? (~(&(8'ha6))) : (^((8'ha3) ? (8'h9c) : (7'h43)))) || (((~|(8'ha5)) ? (~^(8'hb0)) : {(7'h40), (8'hae)}) ^~ {((7'h40) ? (8'h9d) : (8'hab)), ((8'hb1) | (8'ha1))})) : {((((8'hb4) ? (8'hb3) : (8'ha2)) ? ((8'hba) ? (8'hb9) : (8'hab)) : ((8'hbd) ? (8'hbe) : (8'hbd))) ? {((8'ha8) ? (8'ha1) : (8'ha4)), ((8'hb2) ? (8'hb0) : (8'ha0))} : (-((8'hb8) < (7'h41)))), (-(((8'ha5) <= (8'ha5)) < ((8'ha4) >> (8'haf))))}))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire signed [(4'hf):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire22;
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire34,
                 wire22,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = (wire17 - $signed({(^~(wire20 ? wire21 : (8'hb6))),
                      ($unsigned(wire18) ?
                          $unsigned(wire17) : wire19[(3'h5):(1'h1)])}));
  always
    @(posedge clk) begin
      reg23 <= ((|wire19[(2'h2):(2'h2)]) - $unsigned((~|wire18)));
      reg24 <= $signed(wire21);
      if ((wire18 * $unsigned($unsigned((-(reg24 ? wire19 : (8'had)))))))
        begin
          reg25 <= $unsigned(reg23);
          reg26 <= $signed(({reg24} ?
              ({$signed((7'h44)),
                  wire17[(1'h1):(1'h0)]} == (^wire20)) : ($signed(reg23) ?
                  (^~$unsigned(reg25)) : reg23)));
        end
      else
        begin
          reg25 <= $signed((8'ha3));
          if (($signed(wire17) ?
              $unsigned($signed((|(wire22 ? reg26 : wire21)))) : reg26))
            begin
              reg26 <= (((wire17[(1'h0):(1'h0)] > ($unsigned(wire18) == {(8'hbe)})) ?
                      $signed({(+reg23),
                          $unsigned(reg23)}) : (reg24 || reg26)) ?
                  (~^$signed((((7'h41) > wire22) >> wire20))) : reg23[(4'hb):(4'h8)]);
            end
          else
            begin
              reg26 <= $signed($signed({(+wire21),
                  ((reg25 ? wire22 : wire22) ?
                      wire18[(3'h7):(3'h4)] : wire21[(2'h3):(1'h1)])}));
            end
          if ((reg26[(4'hb):(1'h1)] ?
              {$signed($signed({reg25})),
                  (wire20[(1'h0):(1'h0)] == ($signed(reg23) ?
                      wire19[(3'h4):(1'h1)] : (wire21 == wire18)))} : (^({wire22,
                  (!wire20)} ^ $signed(wire17[(1'h0):(1'h0)])))))
            begin
              reg27 <= reg25[(2'h2):(1'h1)];
            end
          else
            begin
              reg27 <= $unsigned(($signed(((~wire19) ?
                  (+(8'hbd)) : (~^reg25))) << reg23));
              reg28 <= $signed(({wire18} ? reg24[(3'h5):(3'h4)] : (~wire18)));
              reg29 <= reg23;
              reg30 <= $signed($unsigned($signed($signed(wire21))));
              reg31 <= ((~^$unsigned(($signed(reg27) ?
                  $unsigned((8'hac)) : reg27))) >> (wire18[(4'he):(4'h8)] ?
                  (8'hb1) : (8'hb4)));
            end
          reg32 <= (~&$signed(reg31));
        end
      reg33 <= wire17;
    end
  assign wire34 = $signed($unsigned($unsigned((reg24[(3'h4):(3'h4)] ?
                      reg32 : (reg25 ? wire21 : reg25)))));
  always
    @(posedge clk) begin
      reg35 <= wire34;
      if (({(^~$signed(reg31)),
          (&$signed(wire19))} * $unsigned(($unsigned((reg35 ^~ reg32)) ?
          ($signed(wire18) ?
              reg24[(4'hd):(4'h9)] : (-(8'ha4))) : $signed((reg27 - wire34))))))
        begin
          reg36 <= $signed(reg33);
          reg37 <= {$signed(wire20[(3'h5):(1'h0)])};
          if (reg35)
            begin
              reg38 <= $unsigned((wire20 >= $signed($unsigned({wire18,
                  reg30}))));
              reg39 <= ((reg26[(3'h5):(3'h4)] ?
                  (((reg28 + wire22) > (^~reg30)) ?
                      $signed($unsigned(reg29)) : {(-wire18),
                          $unsigned(wire18)}) : $signed(((wire18 ?
                      wire22 : reg27) >> {reg36,
                      reg24}))) == $unsigned($unsigned(((reg36 ?
                      wire20 : wire21) ?
                  (~&(8'ha6)) : $signed(reg38)))));
            end
          else
            begin
              reg38 <= (~(8'ha5));
              reg39 <= $unsigned(($signed((reg28 ?
                      (reg30 ? reg25 : wire19) : {wire18})) ?
                  (~|wire21[(2'h2):(2'h2)]) : $signed(($signed((8'hbf)) ?
                      (wire17 ? (8'ha6) : reg38) : reg27))));
            end
        end
      else
        begin
          reg36 <= $signed(reg26[(4'hc):(3'h4)]);
          reg37 <= $signed($unsigned($unsigned($unsigned((+wire17)))));
        end
      reg40 <= $unsigned(($signed((((8'h9c) << reg39) >>> $signed((8'hbf)))) >> $unsigned((reg24 ^~ (reg37 ?
          reg38 : wire17)))));
      reg41 <= wire22;
      if (((+(($unsigned((8'hb6)) ?
              (wire18 - reg29) : {(8'h9d)}) << $unsigned($unsigned(wire18)))) ?
          $unsigned(reg27[(2'h2):(1'h0)]) : (^(-$signed($unsigned(reg29))))))
        begin
          reg42 <= reg38;
          reg43 <= (-$unsigned($signed(((8'hbf) ?
              $unsigned((8'ha9)) : reg24[(5'h13):(1'h1)]))));
        end
      else
        begin
          reg42 <= ((wire18 & (|(^$signed(reg38)))) >> $signed((reg42 ?
              (~wire22) : (~&reg41[(3'h4):(1'h1)]))));
          reg43 <= $signed($signed($signed(((8'h9c) ?
              (reg25 ? reg43 : reg40) : (|wire17)))));
        end
    end
  assign wire44 = (reg27 >= wire21);
  assign wire45 = wire22;
endmodule

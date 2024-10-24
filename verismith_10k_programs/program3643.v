module top
#(parameter param48 = (((((~|(8'hae)) ? (8'ha1) : {(8'had)}) ? ((-(8'h9f)) ? ((8'hb5) + (8'ha9)) : (~(8'hbe))) : {((8'hb6) ? (8'had) : (8'hb8))}) ? (+(~&((8'hb3) << (8'hb9)))) : {(((8'haa) ? (8'ha8) : (8'ha2)) ? {(8'hb8)} : ((8'hbe) > (8'hb5)))}) ? ((~|(((8'ha2) ? (8'hb0) : (8'hb4)) ? (~(8'hbb)) : {(8'hb5)})) ? ((|(~^(8'hbc))) | (((8'hbb) ? (8'hae) : (8'hb8)) ? {(8'hbb)} : ((8'ha8) && (8'ha3)))) : {(((8'ha5) >> (8'hb9)) ? ((8'h9c) < (8'hbe)) : ((8'hb8) ? (8'hbd) : (8'hb1)))}) : ((~&(~|{(8'hbf)})) ? (&(-((8'ha5) ? (8'hb6) : (7'h42)))) : (({(8'h9e), (8'hba)} == ((8'hb0) ? (8'ha9) : (7'h43))) ? (|((8'hae) ? (8'hb9) : (8'had))) : ({(8'hbf), (8'ha5)} ? ((8'ha1) | (7'h42)) : ((8'hbc) - (8'ha0)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire27;
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire46,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire27,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg31,
                 reg30,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire2[(3'h6):(3'h6)];
      if (wire1[(2'h2):(1'h0)])
        begin
          reg6 <= (wire1 > wire4);
          reg7 <= ($unsigned(wire3) ?
              (~^{(~^{wire4, reg5}),
                  $signed((wire2 | wire0))}) : ($unsigned(($unsigned(wire3) || $unsigned((8'hbd)))) >> $signed(wire0[(1'h1):(1'h1)])));
          reg8 <= $signed(reg5);
          reg9 <= wire2;
          reg10 <= (~^reg9[(1'h0):(1'h0)]);
        end
      else
        begin
          reg6 <= (^~{{$unsigned(wire3[(1'h0):(1'h0)])}, wire4[(4'h9):(2'h3)]});
          if ((($signed($unsigned((wire3 << wire0))) ^ {reg9[(3'h4):(1'h1)],
              {(wire0 ^ (8'hbf))}}) << $signed($unsigned({(~|wire4),
              (reg7 <<< wire2)}))))
            begin
              reg7 <= reg8;
              reg8 <= ($signed($signed((((8'hb8) ? wire4 : wire3) ?
                  reg6[(3'h4):(3'h4)] : reg10[(2'h3):(1'h1)]))) ^ $signed(reg5[(3'h5):(2'h3)]));
              reg9 <= (((((+reg9) ?
                              (wire2 ? wire2 : wire4) : ((8'hb6) | (8'h9d))) ?
                          reg8[(4'h8):(2'h3)] : wire1) ?
                      (wire3[(2'h2):(1'h0)] >>> (-reg5)) : reg5) ?
                  ((~(wire1[(1'h0):(1'h0)] ^~ {reg5, reg9})) ?
                      reg7 : (&wire3[(1'h1):(1'h0)])) : wire4);
              reg10 <= $unsigned($unsigned(reg10[(4'he):(3'h6)]));
            end
          else
            begin
              reg7 <= $signed((8'hb1));
            end
        end
      reg11 <= {((($signed(reg9) ? (~|(8'hb6)) : {wire0, reg8}) ?
                  (reg10[(4'h9):(3'h6)] >> (reg6 - (8'hbd))) : (~^wire2[(1'h1):(1'h0)])) ?
              reg7 : $unsigned($signed($signed(wire0)))),
          (~^reg7)};
    end
  always
    @(posedge clk) begin
      reg12 <= wire1;
      reg13 <= reg5[(3'h7):(3'h4)];
      reg14 <= {$signed($signed(({reg5, reg12} ? wire3 : $unsigned(reg9)))),
          wire4};
      reg15 <= reg14;
    end
  module16 #() modinst28 (.y(wire27), .wire18(reg6), .clk(clk), .wire19(wire3), .wire17(reg8), .wire20(reg12));
  assign wire29 = reg7;
  always
    @(posedge clk) begin
      reg30 <= reg7;
      reg31 <= (wire0[(5'h11):(4'hc)] ?
          $signed($signed($signed($unsigned((8'ha1))))) : ((8'hbc) <<< ($unsigned(reg12[(1'h1):(1'h0)]) ?
              reg11[(2'h2):(2'h2)] : reg30)));
    end
  assign wire32 = {(&({wire27[(4'hd):(4'hc)], $unsigned(wire1)} || {(8'haa),
                          {reg7, wire2}})),
                      $signed($unsigned($signed(wire3)))};
  assign wire33 = {$unsigned(reg7)};
  assign wire34 = (-$signed(wire32));
  assign wire35 = (8'hbe);
  assign wire36 = $signed(reg14);
  always
    @(posedge clk) begin
      reg37 <= reg11[(1'h1):(1'h0)];
      if ($unsigned($signed(wire36)))
        begin
          reg38 <= {($signed(reg37[(1'h1):(1'h0)]) ^~ reg11)};
        end
      else
        begin
          reg38 <= (({($signed(reg7) ~^ (&wire3))} ?
              (~(^~reg30[(3'h4):(1'h0)])) : $signed(wire1[(2'h3):(2'h2)])) & $unsigned((&($signed(wire29) < {reg38}))));
          reg39 <= $signed($unsigned((-($signed(reg5) >= (wire27 <= (8'ha2))))));
          reg40 <= (~&($signed($signed((wire29 ?
              (8'hbe) : wire29))) >>> (wire36 ?
              (-wire32) : (wire35[(3'h6):(2'h3)] ?
                  (8'hbe) : (reg38 ? wire32 : wire0)))));
          if (reg5[(3'h4):(3'h4)])
            begin
              reg41 <= reg12[(4'hb):(4'hb)];
              reg42 <= $unsigned((8'hb6));
              reg43 <= reg31;
            end
          else
            begin
              reg41 <= wire36[(2'h3):(1'h1)];
              reg42 <= wire2;
            end
          reg44 <= reg15;
        end
      reg45 <= $signed(reg30);
    end
  assign wire46 = (~$unsigned(reg44[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg47 <= ((+$unsigned($unsigned(reg37[(2'h2):(2'h2)]))) ?
          reg30 : (~|$signed((~&$unsigned(wire2)))));
    end
endmodule

module module16
#(parameter param26 = (~(((-((8'hb5) ? (8'hab) : (8'hb9))) ? (&((8'hb6) ^ (8'hb2))) : {((8'had) ? (8'hb1) : (8'h9f)), {(8'ha3), (7'h40)}}) & (((^~(8'ha1)) ^ ((7'h40) <<< (7'h44))) < (((8'hbd) + (8'ha5)) ? ((8'hb0) >> (8'hac)) : (!(8'ha7)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = wire18[(2'h2):(1'h1)];
  assign wire22 = wire19;
  assign wire23 = wire18;
  assign wire24 = (~((wire23 ?
                      $signed(wire23[(1'h0):(1'h0)]) : (wire21[(3'h4):(2'h3)] ?
                          (wire19 ?
                              wire22 : (8'hba)) : (wire20 || wire18))) == wire20[(5'h11):(4'h8)]));
  assign wire25 = ((($unsigned(((8'haf) < wire17)) ?
                          wire17[(2'h3):(1'h0)] : $unsigned((wire22 ~^ wire22))) ?
                      (~^$unsigned($signed(wire23))) : wire22) && $signed($signed(wire22)));
endmodule

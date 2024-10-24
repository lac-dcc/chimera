module top
#(parameter param50 = (~^((((!(8'hb9)) | (8'ha5)) ? ((~|(8'hb0)) ? (&(8'hbb)) : ((8'hbd) ? (8'ha9) : (8'ha9))) : (|(8'hb5))) ^~ ((((8'hb5) ~^ (8'hb9)) ? ((8'ha4) && (8'h9e)) : {(8'hb6)}) == (((8'ha5) ? (8'hb5) : (8'hb0)) >>> ((8'hb7) ? (8'hb0) : (8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg12,
                 (1'h0)};
  assign wire4 = (^~$unsigned((+{$signed(wire1)})));
  assign wire5 = {wire0};
  assign wire6 = $unsigned((+$unsigned((^~(^~wire1)))));
  assign wire7 = ($unsigned({((wire3 ? wire4 : wire2) ?
                             (!wire6) : (wire5 <= wire3))}) ?
                     $signed(((8'hb7) ?
                         $unsigned(wire1[(1'h0):(1'h0)]) : wire6)) : wire5);
  assign wire8 = wire6;
  assign wire9 = wire2[(2'h2):(1'h1)];
  assign wire10 = $unsigned(((wire9[(1'h1):(1'h1)] ?
                          $unsigned((wire3 ?
                              wire7 : wire1)) : $signed($unsigned(wire7))) ?
                      $signed($unsigned((~^wire4))) : wire5));
  assign wire11 = wire6[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      reg12 <= ((8'ha0) && $signed((wire2[(2'h2):(1'h1)] ?
          $unsigned(wire9[(1'h0):(1'h0)]) : (wire10[(1'h1):(1'h0)] || $unsigned((8'had))))));
    end
  assign wire13 = wire2;
  assign wire14 = reg12[(3'h5):(2'h3)];
  module15 #() modinst31 (wire30, clk, reg12, wire14, wire3, wire8, wire0);
  assign wire32 = (|(+$unsigned(({wire9} || wire9))));
  assign wire33 = wire6[(4'ha):(2'h2)];
  assign wire34 = wire3[(3'h6):(2'h2)];
  assign wire35 = wire5[(3'h6):(3'h6)];
  assign wire36 = (wire3 <= $signed({$unsigned(wire10[(3'h4):(3'h4)]),
                      {(!wire0)}}));
  assign wire37 = $signed($unsigned($unsigned((((8'hbe) ? wire14 : wire3) ?
                      (wire0 ? (8'ha6) : wire6) : (+wire35)))));
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg38 <= ($unsigned(((^~{wire5}) ?
                  (~|{wire9}) : $unsigned((^wire3)))) ?
              $signed((wire11[(3'h6):(3'h6)] != (~^(^wire13)))) : wire4);
          reg39 <= {reg12[(4'h8):(3'h7)]};
          reg40 <= (wire11[(3'h5):(2'h2)] ?
              {(wire34 == $unsigned($signed(wire35)))} : (((^(wire36 ?
                          (8'hbd) : reg12)) ?
                      (wire6 ?
                          wire34[(5'h13):(3'h4)] : wire13) : wire7[(3'h7):(3'h5)]) ?
                  wire14 : (({wire0} ?
                          (wire34 ? wire14 : wire1) : $signed(wire11)) ?
                      $unsigned($unsigned(wire0)) : (^(^wire33)))));
        end
      else
        begin
          reg38 <= (^(wire10[(1'h0):(1'h0)] != ({(8'had)} ?
              ($unsigned(wire3) ?
                  $signed(wire35) : $signed(reg40)) : (^~reg40))));
        end
      reg41 <= wire33;
      reg42 <= $unsigned(((~|((~&(8'ha1)) <= (wire35 ?
          wire30 : reg12))) - wire3[(4'ha):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg43 <= {((!$signed(wire33)) ?
              (((wire6 != wire5) ? (wire0 >>> wire4) : (8'h9e)) ?
                  $signed((wire3 != wire34)) : $signed(wire35[(2'h3):(2'h2)])) : wire4[(1'h1):(1'h0)]),
          $signed($signed(($signed(wire0) ?
              (wire13 != wire1) : (reg12 ? reg41 : (8'haa)))))};
      reg44 <= (8'hbd);
      reg45 <= $unsigned($signed($signed((wire11[(3'h5):(3'h4)] ?
          (wire36 ? wire36 : wire34) : $unsigned(wire30)))));
      reg46 <= {$signed(wire9[(1'h1):(1'h1)])};
    end
  assign wire47 = (-reg44);
  assign wire48 = (((wire11 == ((reg45 ? wire6 : wire47) ?
                              $signed(reg39) : wire33[(2'h3):(1'h1)])) ?
                          wire2 : $signed($unsigned((wire8 ?
                              wire14 : wire0)))) ?
                      ($signed(reg44) ^ (reg12[(3'h6):(3'h6)] ^ wire2[(1'h1):(1'h0)])) : $unsigned($unsigned($signed({wire14,
                          wire34}))));
  assign wire49 = (-((~^((&wire48) >= ((8'hbf) ?
                      wire47 : (8'hbe)))) << $signed(wire8[(1'h0):(1'h0)])));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire25,
                 wire24,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed($unsigned($unsigned($signed(wire18)))) ^ (!(-((-(8'ha4)) ?
          ((8'hbc) < wire16) : $unsigned(wire20))))))
        begin
          reg21 <= wire16[(4'hc):(1'h1)];
        end
      else
        begin
          reg21 <= {(wire20[(3'h5):(1'h1)] | {reg21}), {wire16[(2'h2):(1'h1)]}};
        end
      reg22 <= $signed(wire18[(1'h1):(1'h1)]);
      reg23 <= (({$signed(wire18)} & wire18) ?
          (wire16[(4'hc):(2'h3)] ?
              (((+(8'hb4)) >= ((8'hb4) ? wire19 : wire18)) ?
                  wire20 : (reg21[(5'h11):(1'h1)] ?
                      wire17 : reg22)) : ($signed({wire16}) ?
                  (!wire17) : (wire17 ?
                      $unsigned((8'ha4)) : (&reg22)))) : $unsigned(reg21));
    end
  assign wire24 = (~|($signed(wire19) ?
                      {((wire18 ? wire16 : wire18) | wire18[(2'h2):(2'h2)]),
                          (wire19 ?
                              $unsigned(reg21) : (wire18 ?
                                  wire16 : wire18))} : (((reg21 & reg22) ?
                          {reg22} : (wire16 ?
                              reg21 : wire18)) >>> $unsigned($unsigned(reg22)))));
  assign wire25 = $unsigned($unsigned(reg21[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg26 <= (8'hb2);
      reg27 <= $unsigned(({$unsigned(wire19),
              ((reg26 ? wire20 : reg26) ~^ {(8'hbf)})} ?
          wire17 : {reg22, $unsigned((wire18 ? (8'ha0) : wire17))}));
      reg28 <= {(wire19[(4'h8):(1'h1)] || reg27), (^~(8'hbc))};
      reg29 <= (reg27 >= (~|(~&(^~(8'ha4)))));
    end
endmodule

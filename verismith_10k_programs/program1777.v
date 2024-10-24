module top
#(parameter param44 = (({(|((8'ha0) ? (8'hbf) : (8'hbb))), (((8'haf) ? (8'h9f) : (8'hbb)) ? ((8'hbf) >= (8'had)) : (~^(8'had)))} ? {{(8'hb1), {(8'hba)}}, (~|((8'ha0) ? (8'ha9) : (8'hb2)))} : {(-(-(8'ha7))), ({(8'ha1)} << (+(7'h40)))}) ^ (|(^(~^{(8'ha4)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
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
                 reg31,
                 reg28,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      reg5 <= $signed((reg4 || reg4[(3'h5):(1'h0)]));
      reg6 <= wire1[(2'h3):(1'h0)];
      reg7 <= wire1;
      reg8 <= (wire0 ?
          ($unsigned(reg6[(1'h0):(1'h0)]) & (^~((reg7 >> wire0) ~^ reg7))) : $signed(wire0));
    end
  assign wire9 = wire3[(4'h9):(3'h4)];
  assign wire10 = (reg7 == ((($signed(wire3) < $unsigned(reg6)) && wire2) ?
                      $signed($unsigned((wire0 ~^ wire3))) : wire9[(1'h1):(1'h0)]));
  assign wire11 = ((wire3[(3'h4):(1'h1)] ? $signed($signed(reg4)) : (7'h40)) ?
                      wire2 : reg4[(1'h0):(1'h0)]);
  assign wire12 = ((wire2[(2'h3):(2'h2)] ?
                      ($unsigned((wire11 ? wire10 : reg5)) ?
                          ($signed((8'hbb)) ?
                              reg7[(3'h6):(3'h6)] : $unsigned((8'ha3))) : {(wire0 + reg7),
                              $signed((8'h9e))}) : $unsigned(($signed(reg8) ?
                          $signed(reg8) : (wire1 ?
                              wire11 : wire11)))) <= $signed($unsigned($signed(wire0[(4'hb):(4'hb)]))));
  assign wire13 = wire1[(3'h4):(1'h1)];
  assign wire14 = $unsigned(wire12[(2'h3):(2'h3)]);
  assign wire15 = reg5[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg16 <= wire15[(3'h5):(1'h0)];
      reg17 <= (!wire1[(2'h2):(1'h0)]);
      if ($signed($signed({$signed((+reg17))})))
        begin
          reg18 <= (8'ha5);
          if (reg8)
            begin
              reg19 <= {$signed(reg8[(1'h0):(1'h0)])};
              reg20 <= $signed(reg17);
              reg21 <= ((~reg4) <<< (reg19[(1'h1):(1'h0)] ?
                  reg16 : $signed((8'hac))));
            end
          else
            begin
              reg19 <= wire1;
              reg20 <= $signed($unsigned((reg16 ?
                  $signed((wire11 ^~ wire2)) : ((wire0 ? (8'hb2) : (8'had)) ?
                      {reg7, reg20} : {wire12, (8'ha8)}))));
              reg21 <= (^~$unsigned(($unsigned((wire15 || wire11)) ?
                  (8'had) : {reg5[(1'h0):(1'h0)], reg4[(2'h3):(1'h1)]})));
              reg22 <= (-reg4);
              reg23 <= {wire2[(3'h5):(1'h1)]};
            end
          reg24 <= reg20;
          reg25 <= {$signed($signed(wire2[(1'h1):(1'h1)])), reg23};
        end
      else
        begin
          reg18 <= wire15[(2'h2):(1'h1)];
        end
    end
  assign wire26 = ((({(reg17 * reg21),
                          (wire13 >> wire9)} >= (reg16 || $unsigned(reg22))) >> reg21[(3'h7):(1'h1)]) ?
                      (~^(^~({(8'hb1), reg23} ?
                          (~|(7'h44)) : (wire15 != (8'hb2))))) : ({(reg25[(4'ha):(3'h5)] ?
                              ((8'hbc) ?
                                  wire13 : wire3) : reg6[(1'h1):(1'h0)])} ^~ ((~|$signed(reg8)) | $signed(wire3))));
  assign wire27 = $unsigned((((reg18[(3'h6):(1'h0)] << (reg7 ^~ wire11)) ~^ ((^wire0) ?
                      (~&reg8) : (wire12 & (8'hbc)))) == ($signed($unsigned(reg24)) ?
                      ((reg23 && reg25) ?
                          $unsigned(wire1) : ((8'h9f) ?
                              wire0 : reg19)) : {$signed(reg22)})));
  always
    @(posedge clk) begin
      reg28 <= (~^$unsigned(reg19[(1'h0):(1'h0)]));
    end
  assign wire29 = $unsigned($signed((wire9[(2'h2):(1'h1)] << wire3)));
  assign wire30 = reg25[(4'hb):(3'h6)];
  always
    @(posedge clk) begin
      reg31 <= $signed($signed((8'hb0)));
      reg32 <= (-$signed((&((8'hba) << $unsigned(wire14)))));
      reg33 <= (8'ha7);
      if (((~(!(~^{reg4, reg24}))) ?
          ((reg18 + (!reg19)) >> reg5[(1'h0):(1'h0)]) : wire2))
        begin
          reg34 <= (($unsigned($unsigned(reg32[(1'h1):(1'h0)])) - wire0) ?
              $signed($signed($unsigned((wire14 ?
                  (7'h41) : reg6)))) : $signed(({(wire11 ? reg4 : wire30),
                      {wire12, wire15}} ?
                  reg23 : reg6[(1'h1):(1'h1)])));
        end
      else
        begin
          reg34 <= {reg28};
          if ($signed($unsigned(reg20[(1'h1):(1'h1)])))
            begin
              reg35 <= (+($signed($signed((&wire11))) ?
                  $unsigned((wire14 ?
                      wire29 : reg21[(1'h0):(1'h0)])) : (reg23 ^ wire29)));
              reg36 <= reg16[(4'h8):(3'h5)];
              reg37 <= reg4[(3'h4):(1'h1)];
              reg38 <= $unsigned($signed($unsigned({$unsigned(wire13)})));
              reg39 <= {(((reg4 == $unsigned((8'ha2))) ?
                      (~&$signed(reg31)) : $signed($signed(reg17))) ~^ ({(reg19 ?
                          reg8 : wire12)} + $signed((~^reg25))))};
            end
          else
            begin
              reg35 <= ($signed((($signed(reg8) ?
                  (8'ha6) : reg34) <<< (reg28[(2'h2):(2'h2)] ?
                  reg23 : wire14))) << wire12);
            end
          reg40 <= $signed(((|$unsigned((wire0 ? wire12 : (8'had)))) ?
              {reg4[(3'h6):(1'h0)]} : {$signed(reg8),
                  $unsigned($signed(wire15))}));
          reg41 <= $signed(wire30);
        end
    end
  assign wire42 = (wire9[(2'h3):(1'h0)] ^~ {(($unsigned(reg34) ~^ reg37[(3'h6):(2'h2)]) ?
                          reg18[(4'ha):(3'h4)] : (wire14 - reg20[(1'h1):(1'h1)]))});
  assign wire43 = wire10[(2'h2):(1'h1)];
endmodule

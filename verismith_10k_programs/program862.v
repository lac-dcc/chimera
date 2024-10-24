module top
#(parameter param47 = (((+((8'h9c) ? ((8'ha5) ? (8'h9e) : (8'hb5)) : ((8'had) >= (8'hb3)))) ? (^(8'hb5)) : (~&((|(8'h9c)) ~^ (~(8'hb0))))) == ((+(^((8'hab) <= (8'hbb)))) == {{(8'ha8), {(8'ha2), (8'ha9)}}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(2'h3):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire26,
                 wire25,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg28,
                 reg27,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (&$signed((wire2[(4'h9):(3'h6)] >= $signed($signed(wire0)))));
  assign wire5 = wire4;
  assign wire6 = (((((wire5 ? wire3 : wire3) >= {wire5}) ?
                         wire1[(1'h0):(1'h0)] : ((wire1 >> wire5) != ((8'hb1) ?
                             wire2 : wire3))) <= $unsigned(wire5)) ?
                     (&$signed($unsigned({wire0,
                         wire2}))) : ($signed(((~^wire0) ^~ $unsigned(wire5))) ?
                         $signed((^~$unsigned(wire3))) : (wire1 ?
                             wire5[(3'h7):(1'h1)] : {(~&wire4)})));
  assign wire7 = $unsigned(((($unsigned(wire1) ?
                         $signed(wire4) : $unsigned(wire1)) ?
                     (~^$unsigned(wire2)) : ($signed(wire0) ?
                         wire4 : wire6)) <= wire0[(5'h14):(5'h13)]));
  assign wire8 = $unsigned((~$unsigned((wire6 ?
                     wire6[(1'h1):(1'h0)] : $signed(wire4)))));
  always
    @(posedge clk) begin
      reg9 <= $unsigned((~&({wire8[(4'h8):(1'h1)]} <= $signed($signed(wire0)))));
    end
  always
    @(posedge clk) begin
      reg10 <= $signed($signed($signed(wire7)));
    end
  always
    @(posedge clk) begin
      reg11 <= wire5[(3'h6):(2'h2)];
      if (wire7[(3'h5):(3'h4)])
        begin
          reg12 <= wire1[(3'h4):(2'h3)];
        end
      else
        begin
          reg12 <= (~&$unsigned(wire5));
          if ((8'hae))
            begin
              reg13 <= (8'hbe);
              reg14 <= wire5[(1'h1):(1'h1)];
              reg15 <= ((^~(8'hac)) << (^~({reg11} < $unsigned($unsigned(reg13)))));
            end
          else
            begin
              reg13 <= reg11[(1'h0):(1'h0)];
              reg14 <= $unsigned(wire3[(4'hc):(3'h4)]);
              reg15 <= (8'h9c);
              reg16 <= ((wire7 <= {$signed(wire0)}) ^~ {((reg12 == (reg9 > wire2)) ?
                      (reg9[(3'h5):(2'h2)] || (wire3 << wire5)) : (8'ha7))});
              reg17 <= (~($signed(((wire2 ? reg14 : reg15) * (wire1 ^ wire5))) ?
                  reg12[(5'h15):(2'h3)] : ((^$signed(wire8)) == wire4)));
            end
          reg18 <= {$unsigned(($unsigned((~&(8'hbf))) + (~^$unsigned(wire7))))};
          if (((reg16[(4'hc):(4'h8)] < {$signed((reg11 != wire5))}) - wire7[(1'h0):(1'h0)]))
            begin
              reg19 <= reg10;
              reg20 <= reg18[(1'h0):(1'h0)];
            end
          else
            begin
              reg19 <= (8'hb3);
              reg20 <= reg14[(2'h3):(2'h3)];
              reg21 <= {(~&(((^wire3) ? (wire0 < wire7) : wire1) ?
                      (|$signed(reg11)) : wire3)),
                  ((&(8'ha6)) ?
                      ($unsigned($unsigned(reg12)) ?
                          ($unsigned(wire5) ?
                              wire8 : $unsigned(wire4)) : $signed(reg18[(1'h0):(1'h0)])) : reg12[(5'h11):(4'hc)])};
              reg22 <= (~&reg21);
            end
          reg23 <= (-$signed(($unsigned($unsigned(reg18)) ?
              reg16[(4'hc):(4'ha)] : reg15)));
        end
      reg24 <= ($unsigned((~^((~|wire7) < reg12[(5'h10):(4'h9)]))) <<< ($signed(($unsigned(reg22) ?
              (reg19 ? reg16 : (8'ha7)) : (wire5 ~^ wire7))) ?
          (((|(8'had)) & $unsigned(wire2)) ?
              ({reg17, reg17} ?
                  $unsigned(reg22) : (reg21 ^~ reg13)) : ($unsigned(wire4) & {wire6,
                  wire3})) : reg16[(4'hc):(3'h5)]));
    end
  assign wire25 = reg15[(1'h1):(1'h1)];
  assign wire26 = wire2[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg27 <= (|$unsigned(reg19[(2'h2):(1'h1)]));
      reg28 <= wire2[(1'h0):(1'h0)];
    end
  assign wire29 = {(reg10 ?
                          (((reg28 ? wire8 : wire6) && reg14[(3'h6):(3'h6)]) ?
                              ((|(8'h9d)) >>> $unsigned((8'ha3))) : {reg17}) : ($unsigned(wire2) << reg13[(4'h8):(4'h8)])),
                      $unsigned($unsigned($signed($signed(wire8))))};
  assign wire30 = ($unsigned($unsigned($unsigned(reg23))) ?
                      $unsigned((^~reg11)) : wire8[(1'h1):(1'h0)]);
  assign wire31 = $unsigned($signed((wire8[(3'h4):(1'h1)] ?
                      ($unsigned(wire4) ?
                          (~reg15) : ((8'hbd) == wire30)) : $unsigned($signed(reg22)))));
  assign wire32 = wire31;
  assign wire33 = wire1;
  assign wire34 = wire33[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg35 <= (+(reg28 ^~ reg15));
      reg36 <= $signed(wire32);
      reg37 <= $unsigned((~$unsigned($unsigned($unsigned((8'ha4))))));
      reg38 <= wire32;
      reg39 <= wire2[(3'h5):(2'h3)];
    end
  always
    @(posedge clk) begin
      if ($signed(($signed($unsigned(reg27[(3'h7):(2'h2)])) ?
          (reg37[(1'h1):(1'h1)] == $unsigned(reg39)) : $unsigned(wire2[(4'hd):(4'hc)]))))
        begin
          reg40 <= ($unsigned(reg10) & wire8);
        end
      else
        begin
          reg40 <= $signed(((8'h9d) ^~ wire7));
          reg41 <= reg17[(4'h8):(3'h7)];
          reg42 <= $unsigned(($signed((^~(wire30 ? wire29 : reg35))) ?
              (^~(~&reg40)) : ($unsigned(reg41) ?
                  $signed($signed(wire31)) : wire34)));
        end
      reg43 <= $signed(reg11[(1'h1):(1'h0)]);
    end
  assign wire44 = {(({$unsigned(wire30), reg18} ?
                              reg17 : $unsigned((reg9 ? (8'ha8) : reg18))) ?
                          $unsigned(((reg40 || reg14) == ((8'hb7) ?
                              reg36 : wire0))) : $signed($signed(wire31)))};
  assign wire45 = wire32[(4'h9):(3'h4)];
  assign wire46 = wire1[(1'h1):(1'h0)];
endmodule

module top
#(parameter param78 = (|(((~^(7'h44)) ? (|((8'hb7) >>> (8'hb1))) : ({(8'haf), (8'ha4)} ? (^(8'hb8)) : ((8'ha3) - (8'h9d)))) >> (~^(~^((8'hb0) | (8'ha4)))))), 
parameter param79 = (((param78 ^ param78) ? (param78 * (param78 ^ ((8'h9f) ? (8'hb6) : param78))) : {(^param78)}) << (~&param78)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire65;
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire67,
                 wire4,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire24,
                 wire37,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire65,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg39,
                 reg38,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg23,
                 reg22,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned((($unsigned(wire3) ?
                         $signed(wire2) : $unsigned((8'hab))) ?
                     wire1 : wire1[(1'h1):(1'h1)])) <= (wire1[(2'h3):(2'h2)] <<< wire1[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg5 <= ($signed($unsigned(((-wire4) << $unsigned((8'h9e))))) ~^ (~wire1[(2'h2):(2'h2)]));
      reg6 <= $unsigned({$signed((~^$signed(wire1)))});
      reg7 <= $signed(reg5);
      reg8 <= wire2;
      reg9 <= reg8;
    end
  always
    @(posedge clk) begin
      reg10 <= {$unsigned(reg5)};
    end
  always
    @(posedge clk) begin
      reg11 <= $signed(($unsigned(wire2[(1'h0):(1'h0)]) ?
          (!wire2[(1'h1):(1'h0)]) : ($signed(reg6) ^~ wire0)));
      reg12 <= ($signed(($unsigned($signed((8'ha1))) ?
          $signed(((7'h44) >= wire2)) : $unsigned((7'h41)))) - {($unsigned($unsigned(reg11)) ?
              reg6 : reg5[(3'h6):(3'h5)])});
      if ((reg6 ^~ $signed(({(wire4 >> (8'hae))} ?
          wire4[(3'h7):(3'h7)] : (!$signed(reg10))))))
        begin
          reg13 <= (^~(8'hb8));
          reg14 <= $signed((({reg12, $signed(wire2)} | reg5[(3'h4):(2'h2)]) ?
              (^~((~^reg7) ? (~&reg9) : reg7)) : wire2[(2'h3):(2'h3)]));
          reg15 <= $unsigned($unsigned(($unsigned($signed((8'hba))) ?
              {(&(8'hbf))} : $signed($signed(reg14)))));
          reg16 <= wire0[(4'ha):(4'h8)];
        end
      else
        begin
          reg13 <= wire1;
          reg14 <= $unsigned(reg13[(1'h0):(1'h0)]);
        end
      reg17 <= (reg5[(3'h5):(3'h4)] ?
          ($signed((&(8'ha5))) ?
              (reg8[(5'h10):(5'h10)] ?
                  $signed(reg11[(3'h7):(1'h0)]) : (8'hae)) : (wire3 > $unsigned(reg10))) : $signed(($signed($signed(reg7)) ^~ (8'hbd))));
    end
  assign wire18 = reg17[(2'h3):(2'h2)];
  assign wire19 = {(8'ha1)};
  assign wire20 = reg16;
  assign wire21 = (8'hb6);
  always
    @(posedge clk) begin
      reg22 <= $unsigned((wire4 > {$unsigned((wire2 >> reg17)),
          reg7[(3'h5):(2'h2)]}));
      reg23 <= (~^$signed((^~($unsigned(wire20) ?
          ((8'had) ? reg14 : wire0) : $unsigned(reg14)))));
    end
  assign wire24 = reg22;
  always
    @(posedge clk) begin
      reg25 <= $signed((~reg16[(4'he):(3'h7)]));
      reg26 <= (8'ha8);
      reg27 <= reg25[(3'h4):(2'h3)];
      reg28 <= (({{$unsigned(wire3)},
          ((+(8'hb8)) ?
              wire1 : $unsigned((8'hba)))} == wire18[(3'h4):(1'h0)]) | ((+$unsigned((reg16 ?
          reg6 : reg22))) && reg7[(2'h3):(1'h1)]));
      if ({reg14})
        begin
          reg29 <= reg7;
          reg30 <= (~|($signed(reg28[(4'hc):(1'h1)]) & $signed(({wire1} >= (8'ha7)))));
          reg31 <= reg29;
        end
      else
        begin
          if (reg13)
            begin
              reg29 <= $unsigned((~^(^(+{(8'hb3), reg14}))));
            end
          else
            begin
              reg29 <= wire3;
              reg30 <= ((reg28[(5'h13):(5'h12)] >>> $signed($unsigned($signed(wire21)))) ?
                  (&$signed($signed((8'hbb)))) : $signed(reg15));
              reg31 <= reg28;
              reg32 <= reg27[(1'h0):(1'h0)];
              reg33 <= (8'hb8);
            end
          reg34 <= reg7;
          reg35 <= ((~$unsigned((&reg13[(2'h3):(2'h3)]))) & ($unsigned($unsigned((reg26 ^~ reg9))) < reg12));
          reg36 <= (8'hb3);
        end
    end
  assign wire37 = (^~$unsigned($signed(({(8'ha8), (8'hb6)} ?
                      wire2[(1'h1):(1'h1)] : reg30[(3'h7):(3'h7)]))));
  always
    @(posedge clk) begin
      reg38 <= (~&((~&(^(+wire4))) ?
          (reg9 ?
              ($unsigned(wire21) <= (wire2 - (8'haa))) : ((reg8 >> reg22) ?
                  (wire21 ? wire19 : (8'hab)) : $unsigned(reg30))) : wire19));
      reg39 <= (reg34 ?
          ($signed(((reg12 ? wire20 : reg30) ?
              wire0[(3'h7):(1'h0)] : (wire0 ?
                  reg8 : reg5))) == (~^wire24)) : $unsigned($unsigned(reg13)));
    end
  assign wire40 = $signed((reg34[(1'h0):(1'h0)] ?
                      ($signed((reg14 ? reg33 : wire4)) ?
                          wire4 : (!$signed(wire21))) : (~^wire1[(2'h3):(1'h0)])));
  assign wire41 = ($signed($unsigned(((~&reg6) != $unsigned((8'haa))))) * $signed($signed((^{reg14,
                      reg32}))));
  assign wire42 = reg22;
  assign wire43 = $unsigned((-(+(8'hb1))));
  assign wire44 = wire43;
  assign wire45 = (^$unsigned((({reg22} ?
                      wire18 : reg15) && $signed((reg16 >= reg22)))));
  assign wire46 = reg26[(3'h7):(1'h0)];
  module47 #() modinst66 (wire65, clk, reg8, reg35, wire0, reg29, reg30);
  assign wire67 = ($unsigned(reg14[(5'h13):(4'ha)]) > (-$unsigned(reg16[(4'h8):(2'h2)])));
  always
    @(posedge clk) begin
      reg68 <= reg35[(3'h7):(1'h0)];
      reg69 <= ((8'hb3) ? wire37[(4'hc):(3'h5)] : (7'h40));
      reg70 <= ($unsigned(reg11[(4'h9):(4'h9)]) != (reg33[(4'ha):(4'h9)] > $signed(reg7)));
      if ({$signed((reg35 ? $unsigned({(8'haf)}) : wire24[(2'h3):(2'h2)])),
          ($signed(reg38[(2'h2):(2'h2)]) ?
              (8'hb4) : ((~^wire19) >>> ((~wire18) ?
                  $unsigned(wire21) : wire65)))})
        begin
          reg71 <= reg36[(2'h3):(2'h2)];
          reg72 <= $signed(((wire2 >> $unsigned($signed(reg39))) ?
              wire43 : $signed(((~^wire46) <<< (reg16 ? wire67 : wire46)))));
          if (reg33)
            begin
              reg73 <= (reg28[(3'h6):(3'h5)] >> (($unsigned($unsigned(reg28)) >>> ($signed(wire19) || {reg9,
                  wire42})) >= $unsigned(reg69)));
            end
          else
            begin
              reg73 <= ($signed((((reg70 <= wire4) ?
                      reg68[(2'h3):(2'h2)] : $signed(reg36)) ?
                  (~(wire24 ^ reg26)) : $unsigned(wire41))) ^~ ($signed(reg11) >= $unsigned($signed((wire4 < wire21)))));
              reg74 <= reg27;
              reg75 <= (reg39 ~^ reg68[(2'h3):(1'h0)]);
              reg76 <= $signed(wire37[(3'h5):(1'h0)]);
              reg77 <= wire18;
            end
        end
      else
        begin
          reg71 <= (|(^~$signed($unsigned($signed(reg73)))));
          reg72 <= wire40[(4'he):(3'h5)];
        end
    end
endmodule

module module47  (y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire52;
  input wire signed [(5'h14):(1'h0)] wire51;
  input wire signed [(4'he):(1'h0)] wire50;
  input wire [(5'h13):(1'h0)] wire49;
  input wire signed [(5'h13):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 (1'h0)};
  assign wire53 = (((~|(^(wire50 ?
                          wire52 : wire49))) >= $unsigned({(~wire52)})) ?
                      $unsigned($signed($unsigned($unsigned(wire48)))) : ($signed(((wire49 ?
                              wire52 : wire48) ?
                          {wire52} : wire52[(2'h3):(2'h3)])) ^~ $unsigned($unsigned((+(8'hae))))));
  assign wire54 = wire48;
  assign wire55 = wire51;
  assign wire56 = $signed((~&(^wire50[(3'h7):(1'h1)])));
  assign wire57 = (~wire55);
  assign wire58 = wire52;
  assign wire59 = (!wire54[(1'h1):(1'h1)]);
  assign wire60 = $unsigned(wire58);
  assign wire61 = wire49;
  assign wire62 = $unsigned((^~wire59[(3'h4):(2'h3)]));
  assign wire63 = $signed({(wire58[(3'h5):(1'h1)] ?
                          wire51 : ((wire58 ^~ (8'h9d)) ?
                              $unsigned((8'ha5)) : $unsigned((8'hbf)))),
                      (-$signed(wire62[(1'h0):(1'h0)]))});
  assign wire64 = $signed(wire50[(4'he):(4'ha)]);
endmodule

module top
#(parameter param37 = ((|(^~(((8'ha3) ? (7'h43) : (8'ha8)) | ((8'hae) ? (8'hbc) : (8'hb5))))) ? ({(^((8'hbd) ? (8'hb5) : (8'hb9))), (|((8'hbf) & (8'h9d)))} >> ({((8'hbd) <<< (8'ha7))} ? {(^~(8'hbf))} : (((7'h42) - (8'ha4)) ? ((7'h41) ? (8'ha9) : (8'hbd)) : ((8'hbe) ? (7'h40) : (8'h9f))))) : (~&((!((8'h9f) ? (8'hab) : (8'hae))) ? ((8'ha7) > ((8'ha9) - (8'ha8))) : (~^(^~(8'ha8)))))), 
parameter param38 = param37)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 reg15,
                 (1'h0)};
  assign wire5 = $unsigned($signed((^~(^~$unsigned(wire1)))));
  assign wire6 = wire4[(3'h7):(2'h2)];
  assign wire7 = $unsigned((wire4 && wire6[(1'h0):(1'h0)]));
  assign wire8 = (((wire3[(3'h7):(3'h4)] ?
                         $unsigned(((8'hb5) <= (8'ha9))) : ($signed((8'ha3)) ?
                             {wire7} : wire2[(2'h2):(2'h2)])) <<< wire1[(1'h0):(1'h0)]) ?
                     wire3[(3'h4):(2'h3)] : wire5[(4'h8):(2'h2)]);
  assign wire9 = {wire4};
  assign wire10 = $signed((wire0[(3'h4):(3'h4)] ?
                      $unsigned(($signed((8'hba)) <= ((8'ha4) ?
                          wire1 : wire8))) : {(+$signed(wire6)),
                          $unsigned((wire8 ^~ wire2))}));
  assign wire11 = $signed((~^$unsigned(wire4)));
  assign wire12 = wire6[(3'h7):(3'h7)];
  assign wire13 = wire10;
  assign wire14 = {{wire4[(3'h4):(1'h1)], wire10},
                      ((&({wire8, (7'h44)} * $unsigned(wire8))) & wire5)};
  always
    @(posedge clk) begin
      reg15 <= $unsigned(wire6);
      reg16 <= wire8[(1'h0):(1'h0)];
      if ((wire1 | wire10))
        begin
          reg17 <= (&wire6[(3'h5):(2'h3)]);
        end
      else
        begin
          reg17 <= ($unsigned((&$unsigned(wire8[(3'h6):(2'h2)]))) ?
              reg17 : ((wire10 >>> wire12) || wire4[(3'h7):(2'h2)]));
          if ($unsigned((|wire7)))
            begin
              reg18 <= wire6[(4'h8):(1'h1)];
            end
          else
            begin
              reg18 <= wire13[(3'h6):(2'h2)];
              reg19 <= (($unsigned(($unsigned(wire1) ?
                      (wire4 ? (8'hbf) : wire0) : (~&reg15))) ?
                  $signed(wire4) : (|reg17[(3'h4):(1'h0)])) - {((^~(-reg16)) ^~ {wire7,
                      wire4})});
              reg20 <= {wire9[(3'h5):(1'h1)]};
              reg21 <= ((^wire11[(1'h0):(1'h0)]) ?
                  wire12[(4'h8):(1'h0)] : ({((~^(8'hb4)) & wire7),
                          $unsigned((7'h41))} ?
                      (-$unsigned((reg17 | wire2))) : wire4[(3'h6):(1'h1)]));
            end
          reg22 <= wire2[(2'h2):(1'h1)];
          if ((wire11 + reg19))
            begin
              reg23 <= $signed($unsigned($signed($signed($unsigned(wire0)))));
              reg24 <= $signed($signed((((+wire1) ^ wire4[(2'h2):(1'h1)]) >> ((reg16 - (8'h9e)) ?
                  (&reg19) : {wire6}))));
            end
          else
            begin
              reg23 <= (wire11 <= (reg18 && (~wire7)));
              reg24 <= (($unsigned($signed(((8'hb1) ^~ reg15))) ?
                      $unsigned(reg21[(1'h1):(1'h1)]) : {$unsigned((wire7 ?
                              reg16 : (8'h9c)))}) ?
                  wire1 : (((wire12 >> wire2[(1'h1):(1'h0)]) ?
                          (|$signed(wire11)) : (wire8 < (wire3 ?
                              wire12 : wire4))) ?
                      wire8 : reg24));
              reg25 <= (^~($signed(wire14[(2'h3):(1'h1)]) ?
                  (-($unsigned(wire2) && wire3)) : (wire2[(2'h2):(2'h2)] ?
                      wire14 : $unsigned(reg19))));
            end
        end
      reg26 <= ((~|$signed($signed((reg21 ?
          wire0 : reg15)))) == wire8[(4'h8):(2'h2)]);
      if ($signed((reg17 || wire14[(1'h0):(1'h0)])))
        begin
          reg27 <= wire13[(4'h9):(3'h5)];
        end
      else
        begin
          reg27 <= $unsigned((~&(&(!wire12[(3'h6):(1'h0)]))));
          reg28 <= {(-(wire10[(4'hd):(4'hb)] >= wire11)),
              wire13[(3'h7):(1'h0)]};
          reg29 <= wire5[(1'h0):(1'h0)];
          reg30 <= ($signed($unsigned((^(&reg26)))) ?
              (&reg23) : {($signed((~^wire12)) ?
                      (wire9[(3'h5):(2'h3)] >= reg23) : (reg20[(4'h9):(2'h3)] ?
                          (wire1 ? wire10 : (7'h41)) : {wire7})),
                  reg17});
          reg31 <= $unsigned((7'h44));
        end
    end
  assign wire32 = reg26[(4'h8):(3'h4)];
  assign wire33 = wire10;
  assign wire34 = reg27[(4'he):(1'h1)];
  assign wire35 = ((~&(((wire34 >= reg20) ? {wire9} : {wire9, reg25}) ?
                      reg21 : $signed((!wire2)))) ~^ (^(-(wire0 ?
                      (+wire11) : wire14))));
  always
    @(posedge clk) begin
      reg36 <= $signed($signed($signed(((8'h9f) ?
          wire32 : reg21[(2'h3):(1'h1)]))));
    end
endmodule

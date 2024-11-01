module top
#(parameter param46 = (~(^~((~|((7'h43) * (7'h41))) < (((8'ha1) || (7'h44)) ? ((7'h44) ? (8'hb0) : (8'hb0)) : ((8'hac) ? (8'hb3) : (7'h41)))))), 
parameter param47 = (~|((param46 != {(8'ha8), {param46}}) ? param46 : {((8'ha4) < (param46 ? param46 : param46)), ({param46, (8'ha0)} ? param46 : (~param46))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  assign y = {wire27,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire5 = (wire0[(3'h4):(3'h4)] ?
                     $signed({wire2[(2'h3):(1'h0)],
                         $unsigned(wire3[(1'h0):(1'h0)])}) : $unsigned((wire2 != wire1)));
  assign wire6 = (wire5[(4'ha):(3'h4)] ?
                     {$unsigned(wire0[(4'h9):(4'h8)]),
                         (|$unsigned($signed(wire1)))} : $unsigned(wire4[(1'h0):(1'h0)]));
  assign wire7 = wire1[(1'h0):(1'h0)];
  assign wire8 = (~&wire6[(2'h3):(1'h1)]);
  assign wire9 = {((wire5[(3'h4):(2'h3)] << ($unsigned(wire6) ?
                             wire2 : $unsigned((7'h42)))) ?
                         $signed(wire6) : $unsigned(wire1[(1'h0):(1'h0)])),
                     $unsigned({$unsigned(wire3),
                         (wire6[(1'h1):(1'h0)] ?
                             (wire3 && wire6) : (wire8 ? wire5 : wire4))})};
  assign wire10 = $unsigned(wire3[(1'h1):(1'h1)]);
  assign wire11 = wire4[(1'h1):(1'h0)];
  assign wire12 = $signed((~($unsigned(wire8) ?
                      $unsigned($unsigned((8'ha2))) : wire2)));
  module13 #() modinst28 (.wire15(wire5), .wire16(wire2), .clk(clk), .y(wire27), .wire17(wire0), .wire14(wire7));
  always
    @(posedge clk) begin
      reg29 <= wire11[(3'h5):(3'h5)];
      reg30 <= ((~{wire8}) ~^ (((~(wire4 ? wire10 : (8'hb2))) ?
              $unsigned(wire6[(3'h5):(2'h3)]) : wire7) ?
          ((8'hb9) ?
              $signed(((8'hba) * wire0)) : (~&$unsigned((8'hbd)))) : $signed(wire10)));
      reg31 <= $unsigned(((|(wire7[(4'h9):(3'h7)] ?
              (&wire27) : $unsigned(wire7))) ?
          wire8[(2'h2):(1'h1)] : $unsigned(wire3[(2'h2):(1'h0)])));
      if (wire3[(4'ha):(3'h7)])
        begin
          reg32 <= wire2;
          reg33 <= ($signed((&(wire4 << $signed(wire11)))) * $signed({$unsigned((wire1 >= wire4)),
              wire12}));
          if (wire12[(4'hb):(3'h4)])
            begin
              reg34 <= (({$unsigned((~|wire5)),
                  wire5} && (^(wire11[(3'h6):(2'h3)] << $signed(wire8)))) >>> ((wire4[(2'h2):(1'h1)] ?
                      (reg30 | $unsigned(wire9)) : ($unsigned(wire10) >> reg31[(3'h6):(1'h0)])) ?
                  ($unsigned(wire1) ?
                      $unsigned((+reg33)) : ((~|reg33) << (wire2 ~^ wire9))) : wire3[(1'h1):(1'h1)]));
              reg35 <= reg33;
              reg36 <= (wire5 ?
                  (((8'hbb) + (7'h43)) ?
                      (wire6 ?
                          $signed(reg31[(1'h0):(1'h0)]) : $signed((~(8'had)))) : ($unsigned(wire7[(3'h7):(3'h5)]) ?
                          (~|(+reg31)) : (reg31 * (^wire27)))) : ($signed($unsigned((~reg30))) ?
                      ((^$unsigned((8'had))) || (wire3[(3'h5):(1'h1)] << {(8'hac),
                          wire10})) : (~wire1)));
            end
          else
            begin
              reg34 <= wire9;
            end
          reg37 <= wire6;
        end
      else
        begin
          reg32 <= wire6;
        end
    end
  always
    @(posedge clk) begin
      reg38 <= $unsigned((wire5 ?
          ((reg34[(3'h4):(1'h1)] ?
              {reg31,
                  (8'haa)} : (wire12 && (7'h41))) | ($unsigned(reg37) == (|wire27))) : (-wire1)));
      if ({wire0, wire0[(4'h8):(3'h7)]})
        begin
          reg39 <= wire12[(4'h9):(1'h1)];
          reg40 <= reg32;
          reg41 <= $unsigned(($signed(((~|wire5) >= (&(8'hb9)))) < $unsigned(wire5[(2'h3):(1'h0)])));
          reg42 <= reg29[(2'h3):(1'h1)];
          reg43 <= reg40[(4'hd):(4'h8)];
        end
      else
        begin
          reg39 <= reg41[(3'h4):(1'h0)];
          reg40 <= ((~|reg38) != reg36);
        end
      reg44 <= {$signed(reg35[(2'h3):(1'h0)]),
          ($unsigned((((8'hb4) << reg32) >= wire5)) ?
              {(reg43[(1'h0):(1'h0)] ?
                      $unsigned((8'hae)) : (~(8'haf)))} : (~^$signed((wire1 ?
                  wire11 : wire5))))};
      reg45 <= {reg35[(2'h3):(2'h2)], $signed(reg31)};
    end
endmodule

module module13
#(parameter param25 = ((&(((~(8'hb4)) - ((8'haa) + (8'ha3))) ^~ (((8'h9e) <<< (8'hae)) ? (8'hb2) : ((8'ha3) | (8'hbf))))) & ((8'haf) ? (-(&{(8'hab)})) : ((!(~|(8'hb1))) ? ((&(8'hbb)) >> ((8'ha1) != (8'hb2))) : ((+(8'hae)) & ((8'haf) ? (8'ha7) : (8'ha4)))))), 
parameter param26 = param25)
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  assign y = {wire24, wire21, wire20, wire19, wire18, reg23, reg22, (1'h0)};
  assign wire18 = wire16;
  assign wire19 = wire18;
  assign wire20 = (!((((&(8'hb7)) ?
                      (wire15 >>> wire19) : (wire17 ?
                          wire19 : wire14)) | wire15) <<< (wire15[(2'h3):(2'h3)] ^ wire14)));
  assign wire21 = (-(wire16[(5'h13):(4'he)] >>> wire17));
  always
    @(posedge clk) begin
      reg22 <= $unsigned($unsigned({wire17}));
      reg23 <= wire20[(1'h0):(1'h0)];
    end
  assign wire24 = (!$unsigned(wire19));
endmodule

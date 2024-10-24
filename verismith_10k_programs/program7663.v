module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  assign y = {wire35,
                 wire23,
                 wire21,
                 wire6,
                 wire5,
                 wire4,
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
                 reg24,
                 (1'h0)};
  assign wire4 = (^wire2[(2'h2):(2'h2)]);
  assign wire5 = ($unsigned((8'hb6)) ?
                     ((($unsigned((8'hb6)) ?
                         (wire3 ?
                             wire0 : wire3) : $signed(wire3)) || wire4) == wire2[(1'h1):(1'h1)]) : ((wire4 ?
                             (|(&wire2)) : $signed((|wire1))) ?
                         wire3[(3'h4):(2'h2)] : (wire3 >>> wire4)));
  assign wire6 = wire4[(1'h0):(1'h0)];
  module7 #() modinst22 (.wire8(wire4), .wire11(wire2), .wire10(wire0), .y(wire21), .wire9(wire5), .clk(clk));
  assign wire23 = $unsigned((^({wire2[(4'hc):(1'h0)], wire0[(3'h6):(2'h2)]} ?
                      wire3[(1'h1):(1'h0)] : wire2)));
  always
    @(posedge clk) begin
      reg24 <= (~^$unsigned($unsigned((!wire6[(1'h1):(1'h0)]))));
      reg25 <= ((wire2[(4'hc):(3'h5)] ?
          $signed(((wire2 <<< wire2) ?
              wire1 : (wire1 ? wire4 : wire5))) : {$signed((wire6 ?
                  wire6 : wire23)),
              wire6[(1'h1):(1'h0)]}) != $unsigned($unsigned(wire4[(4'ha):(2'h3)])));
      if (($unsigned($signed((~(wire6 >= wire21)))) ?
          wire3 : $signed($signed((~(wire0 ? (8'hbe) : wire23))))))
        begin
          if (wire6[(1'h0):(1'h0)])
            begin
              reg26 <= (!$unsigned(((-wire6[(2'h2):(1'h1)]) ?
                  {(~|(8'hac))} : reg24)));
              reg27 <= (reg26 < (~^(|({wire5} ?
                  reg26[(1'h0):(1'h0)] : (8'hac)))));
              reg28 <= $signed($signed((wire0[(1'h1):(1'h0)] ?
                  $unsigned((reg27 <= (8'had))) : $signed((reg26 ?
                      wire5 : wire23)))));
              reg29 <= wire5[(5'h14):(4'he)];
            end
          else
            begin
              reg26 <= wire6;
              reg27 <= (|((&$signed($unsigned(reg26))) != $signed(reg27)));
              reg28 <= wire21;
              reg29 <= (wire1 - $unsigned((($unsigned(reg26) ^ $signed((7'h40))) ?
                  ((7'h44) >>> (reg26 ?
                      wire1 : wire23)) : (reg25[(1'h1):(1'h0)] && (~^wire1)))));
              reg30 <= ((~|wire6[(1'h0):(1'h0)]) >>> {($unsigned((+wire5)) ?
                      ((wire6 >> wire1) <= {wire5, reg28}) : ((reg27 ?
                              reg28 : wire4) ?
                          $signed((8'hb3)) : (^~reg26)))});
            end
          if ((8'h9c))
            begin
              reg31 <= wire4;
              reg32 <= wire21;
            end
          else
            begin
              reg31 <= ((8'ha0) ^ $unsigned(reg32[(3'h7):(1'h0)]));
              reg32 <= $signed((8'haf));
              reg33 <= (wire0 == wire23[(4'h9):(3'h6)]);
            end
        end
      else
        begin
          reg26 <= reg31;
          reg27 <= $unsigned((((8'ha1) | ((reg29 ?
              wire21 : (8'hb5)) | $signed((8'hab)))) && (reg25 ?
              $signed({reg27, wire5}) : $unsigned((reg30 ? reg33 : wire1)))));
          reg28 <= (reg30 ~^ {wire2});
          reg29 <= ($signed($signed(((reg24 ?
                  reg27 : wire21) & wire5[(4'h8):(3'h4)]))) ?
              $signed(reg27[(1'h1):(1'h0)]) : $signed(reg25));
        end
      reg34 <= (!wire23[(4'hd):(1'h1)]);
    end
  assign wire35 = ({reg29,
                      (((!reg25) ^~ (8'hb6)) ?
                          $signed($unsigned(wire6)) : $unsigned($signed(wire6)))} * $signed($signed((((8'hbd) > reg24) == reg30[(3'h4):(2'h3)]))));
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 (1'h0)};
  assign wire12 = (wire11 ?
                      wire8 : {(~^((wire10 ? (8'hbf) : wire10) >> (wire10 ?
                              wire10 : wire10))),
                          $unsigned(wire10[(4'hb):(3'h6)])});
  assign wire13 = ($signed(wire11) > wire11);
  assign wire14 = ((~&$signed($unsigned(wire11))) ?
                      (wire9[(5'h11):(5'h10)] ?
                          wire13[(3'h7):(1'h0)] : wire8) : wire11);
  assign wire15 = (($signed(((wire11 ^ wire12) > (-wire10))) != ({wire11[(4'he):(4'hd)],
                          $unsigned((8'ha6))} ?
                      wire13 : wire12[(3'h5):(1'h0)])) | (($signed($signed(wire12)) * $unsigned($signed(wire9))) >> (7'h41)));
  assign wire16 = $signed((($signed($unsigned(wire12)) ?
                      wire15 : ((^~wire10) ?
                          $unsigned(wire14) : ((7'h41) | wire11))) ~^ (wire9 ?
                      wire10[(3'h7):(3'h6)] : (!$signed(wire10)))));
  assign wire17 = (8'ha8);
  assign wire18 = wire16;
  assign wire19 = wire16;
  assign wire20 = $signed(wire10);
endmodule

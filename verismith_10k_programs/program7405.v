module top
#(parameter param44 = ((&(8'hab)) ? {(!({(8'hbd), (7'h44)} << ((8'ha7) || (8'ha7)))), ((^~{(8'hb8)}) ? (((8'h9c) ? (8'hba) : (8'hb9)) >= {(8'hbe)}) : (~|(&(8'hbf))))} : {(({(8'haa)} && {(8'h9e)}) ? (((8'hb0) < (8'ha0)) != ((7'h41) ? (8'ha3) : (8'hac))) : (8'ha1))}), 
parameter param45 = (^(param44 * (param44 >= (^(&param44))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire40;
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  assign y = {wire42, wire4, wire40, reg43, (1'h0)};
  assign wire4 = ($signed(wire3[(4'h8):(2'h2)]) - $unsigned(wire3[(4'hf):(1'h1)]));
  module5 #() modinst41 (wire40, clk, wire2, wire3, wire1, wire4, wire0);
  assign wire42 = $signed($unsigned((wire1 ?
                      ($unsigned(wire0) ^ wire4[(4'h8):(3'h5)]) : ((wire40 == wire3) ?
                          wire0 : wire0[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg43 <= (^{(^wire40[(4'h9):(1'h0)])});
    end
endmodule

module module5
#(parameter param39 = ((^~{({(8'hba)} ? ((8'hb8) ? (8'hbb) : (8'hb2)) : ((8'hbe) <<< (8'hbe))), (((8'ha1) ? (8'h9f) : (8'ha5)) ^~ (&(8'h9d)))}) ^ (8'h9e)))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire25,
                 wire19,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire11 = wire9;
  assign wire12 = wire7;
  assign wire13 = (&$unsigned({wire12[(4'hb):(4'ha)]}));
  assign wire14 = (&(($signed($unsigned(wire10)) | {wire6, (8'ha5)}) ?
                      wire13 : wire9));
  assign wire15 = $signed($unsigned((^~$signed((wire13 ? wire13 : (8'ha7))))));
  assign wire16 = (wire10[(1'h1):(1'h0)] - wire12[(4'h8):(3'h6)]);
  always
    @(posedge clk) begin
      reg17 <= $signed(($signed((+$unsigned(wire11))) ?
          (({wire14} ~^ (wire15 ? (8'hbc) : wire11)) ?
              wire15[(3'h6):(3'h4)] : $signed(wire9)) : ($signed((8'hb7)) + ((wire11 == wire13) - $signed(wire6)))));
    end
  always
    @(posedge clk) begin
      reg18 <= ({wire13[(2'h2):(1'h0)]} ?
          wire13[(1'h0):(1'h0)] : ((wire13 << $signed((reg17 ?
              (8'ha4) : wire10))) ^ $signed(wire11)));
    end
  assign wire19 = (^~($unsigned((wire14 || {wire11,
                      wire9})) * $unsigned(wire8[(4'ha):(1'h1)])));
  always
    @(posedge clk) begin
      reg20 <= (|($signed(($signed((8'hb1)) > ((8'ha2) - wire13))) ?
          ($signed($signed(wire14)) ^~ wire15[(4'hb):(4'ha)]) : (~^$unsigned($unsigned(wire10)))));
      reg21 <= reg20;
      reg22 <= reg21;
      reg23 <= $unsigned(wire14);
      reg24 <= $signed((^~$unsigned($signed($signed(reg22)))));
    end
  assign wire25 = wire11[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((wire12[(3'h7):(1'h0)] ?
          ($signed({wire14}) ?
              $signed($unsigned((wire13 ?
                  (8'hb9) : wire15))) : (^~{$signed(wire8)})) : {$unsigned(reg24)}))
        begin
          if (((({(wire8 ? wire7 : reg20)} && $unsigned((^~wire13))) ?
                  ((reg18 ? (reg22 - reg24) : $unsigned(wire12)) ?
                      wire14[(2'h2):(2'h2)] : ((~|wire6) ?
                          $signed(wire14) : (wire13 ?
                              (7'h43) : wire9))) : wire11[(4'h8):(3'h7)]) ?
              reg18[(4'h8):(3'h6)] : (~^wire14)))
            begin
              reg26 <= $signed((~(reg22[(4'ha):(3'h4)] ?
                  ((wire9 ?
                      wire9 : wire7) >>> wire9[(2'h2):(1'h0)]) : wire25[(2'h2):(1'h0)])));
              reg27 <= wire25[(4'h8):(3'h4)];
              reg28 <= wire16[(3'h5):(1'h0)];
            end
          else
            begin
              reg26 <= {({{(reg27 ^~ reg21)}, wire9[(4'ha):(1'h0)]} ?
                      $unsigned((~$unsigned(wire9))) : {wire14})};
              reg27 <= $signed((8'ha2));
              reg28 <= wire10[(1'h1):(1'h1)];
              reg29 <= $signed((wire10[(2'h2):(1'h0)] ?
                  (($unsigned(reg27) ^~ $signed(wire25)) ?
                      wire14[(2'h3):(2'h3)] : reg21[(1'h0):(1'h0)]) : (~reg26)));
            end
        end
      else
        begin
          reg26 <= $unsigned((~|{(^$unsigned(reg26))}));
          reg27 <= $unsigned({{(8'ha8)},
              $signed($unsigned((wire11 >>> (8'hb8))))});
          reg28 <= ((reg26 >>> (8'hae)) | ($signed($signed($unsigned((8'haf)))) ?
              $signed($unsigned((wire14 < wire11))) : (8'h9e)));
          reg29 <= reg23;
          reg30 <= (wire15 >> $signed($signed(reg21[(1'h0):(1'h0)])));
        end
      if ((wire11[(1'h1):(1'h1)] ^~ wire19))
        begin
          reg31 <= {wire19[(4'ha):(3'h5)], {$signed(wire11)}};
          reg32 <= {((8'hbe) ?
                  $signed($unsigned((-wire19))) : {(reg31[(3'h5):(1'h0)] ?
                          (+reg31) : (&reg21)),
                      reg28[(1'h1):(1'h0)]})};
          reg33 <= reg23[(2'h2):(1'h0)];
        end
      else
        begin
          reg31 <= $signed((^reg20));
        end
      reg34 <= (8'hbc);
      reg35 <= $unsigned($signed((!$signed((~^wire8)))));
    end
  assign wire36 = reg31[(1'h0):(1'h0)];
  assign wire37 = wire15[(4'hc):(2'h3)];
  assign wire38 = ($signed({reg33[(3'h4):(3'h4)],
                          $signed(wire37[(3'h5):(1'h0)])}) ?
                      (reg32 ~^ ($signed((wire25 >= wire37)) ?
                          $unsigned((reg31 >= (8'h9e))) : ((wire25 <<< wire8) >= $unsigned(reg21)))) : $unsigned((^~(~wire14[(1'h1):(1'h0)]))));
endmodule

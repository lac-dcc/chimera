module top
#(parameter param42 = ((&{(8'hb2), (((8'hac) <<< (7'h43)) ? {(8'hbc), (8'ha2)} : ((8'ha2) ? (8'haf) : (8'hb1)))}) ? ((~^(((8'ha3) ~^ (8'hb0)) ? ((8'haf) ? (7'h44) : (8'h9c)) : (!(8'hba)))) ? {(+(~|(8'hb2)))} : ({((8'hb7) != (8'hb0))} && (((8'hb0) ? (8'hb7) : (8'h9f)) != ((8'ha7) - (8'ha7))))) : (((~&(|(8'ha8))) ? (((8'h9e) ? (7'h42) : (8'ha6)) ? ((8'hb7) ? (7'h42) : (8'hb0)) : ((8'hbc) ? (8'ha3) : (8'hac))) : ({(8'ha9)} ^ ((8'hb9) & (8'hae)))) ? (^~(((8'ha3) & (8'ha7)) | ((8'hbf) ? (8'haf) : (8'hb9)))) : (({(8'ha5)} ? ((8'h9d) ? (8'hbe) : (8'haa)) : (|(7'h42))) ? ({(8'hb9)} ? {(8'ha6)} : ((8'ha9) >= (8'hb9))) : ((~(8'h9c)) ? ((8'hb7) ? (8'hba) : (8'hbf)) : {(8'ha2)})))), 
parameter param43 = param42)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire16;
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire28,
                 wire16,
                 reg41,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  module4 #() modinst17 (wire16, clk, wire3, wire1, wire2, wire0);
  always
    @(posedge clk) begin
      reg18 <= ($signed((wire0 ?
              ($signed(wire2) ?
                  $unsigned(wire3) : wire3) : (!$signed(wire0)))) ?
          wire2 : {$signed(($signed(wire2) ?
                  $unsigned(wire2) : {wire1, wire16}))});
      reg19 <= $signed(((wire3[(3'h5):(2'h3)] <= {(8'ha7),
          {wire3}}) && (($unsigned(wire0) ?
          ((8'hb3) ? wire2 : reg18) : (8'haa)) <<< wire16[(1'h1):(1'h1)])));
      reg20 <= (reg19 >= ($unsigned($signed($unsigned(wire1))) >>> ($unsigned($signed(wire1)) * reg18[(2'h3):(1'h1)])));
      reg21 <= $unsigned($signed($signed(((8'hb3) ?
          {reg19, wire2} : reg18[(3'h4):(3'h4)]))));
      if ((^~(~&({$unsigned((8'hb7))} ?
          $unsigned(reg19) : {(wire16 ? reg21 : wire2)}))))
        begin
          reg22 <= (^~$signed((wire0 >= (wire1 | (reg19 ? wire3 : wire16)))));
          reg23 <= reg21;
          reg24 <= reg18[(1'h0):(1'h0)];
        end
      else
        begin
          reg22 <= (wire2[(4'h9):(4'h9)] ?
              $unsigned(reg21) : $signed((wire2[(3'h4):(1'h1)] * ($unsigned(reg18) ?
                  $signed(reg22) : (8'hae)))));
          reg23 <= wire0[(2'h3):(1'h1)];
          if (wire16[(1'h0):(1'h0)])
            begin
              reg24 <= $unsigned((($signed((reg24 - (7'h43))) ?
                  $unsigned((^~wire0)) : reg18) >> wire16));
              reg25 <= wire1[(3'h5):(1'h0)];
              reg26 <= ($unsigned((wire2 ^ (reg22 || (reg23 ?
                      reg18 : reg24)))) ?
                  (reg20[(1'h0):(1'h0)] + (|$unsigned($unsigned((8'haf))))) : (wire3[(3'h5):(1'h1)] == ($unsigned($unsigned(wire2)) * ({reg22,
                          reg24} ?
                      (~&reg24) : (8'ha9)))));
            end
          else
            begin
              reg24 <= wire1;
              reg25 <= ($unsigned((8'ha5)) < {(wire16 ?
                      reg26[(1'h1):(1'h0)] : (reg18 ? (^~reg21) : (~reg19)))});
              reg26 <= reg24[(3'h5):(3'h4)];
              reg27 <= (+({$unsigned((reg22 & wire0)),
                  $signed(reg23[(4'he):(3'h4)])} | $unsigned($signed(reg18))));
            end
        end
    end
  assign wire28 = $unsigned($signed($signed((~{reg20, wire16}))));
  always
    @(posedge clk) begin
      reg29 <= (^~$signed(wire0[(2'h2):(2'h2)]));
      if ({reg18[(3'h4):(1'h0)]})
        begin
          reg30 <= {reg25[(1'h0):(1'h0)], wire0[(1'h0):(1'h0)]};
          reg31 <= reg27;
          reg32 <= $signed((^~$unsigned(wire0)));
          reg33 <= (^reg29[(4'hb):(2'h2)]);
        end
      else
        begin
          reg30 <= (-$unsigned($signed($signed((wire3 & (8'hb8))))));
          reg31 <= {(~|$signed($signed({wire0, reg22})))};
        end
      reg34 <= ({{(~$unsigned(reg25)), reg24[(2'h2):(1'h0)]},
          ((8'hba) ?
              $signed($unsigned(wire1)) : $signed(reg33[(2'h2):(1'h0)]))} || $signed(reg30));
    end
  assign wire35 = $unsigned((reg21 ?
                      reg18 : ((~|(reg18 >> reg27)) ?
                          $unsigned((reg26 ? (8'hb3) : reg19)) : reg22)));
  assign wire36 = (reg26[(1'h0):(1'h0)] ?
                      $signed(((-(reg34 ? wire28 : (8'hbf))) ?
                          wire35[(2'h3):(2'h2)] : $signed((~|wire3)))) : $unsigned($unsigned(wire0[(1'h1):(1'h1)])));
  assign wire37 = wire3[(4'h8):(1'h0)];
  assign wire38 = reg33;
  assign wire39 = $unsigned((reg21 | {((reg25 > wire37) ?
                          (~&reg20) : $unsigned(reg33))}));
  assign wire40 = (~|reg30);
  always
    @(posedge clk) begin
      reg41 <= $signed(reg25[(1'h1):(1'h0)]);
    end
endmodule

module module4
#(parameter param15 = ((8'hb8) ? ((~&{(8'hae), {(8'ha7), (8'hb7)}}) && {(+((8'hba) | (8'h9e))), (~((8'hb5) && (8'ha2)))}) : (~|(((^~(8'h9f)) ? ((8'hb6) >> (8'hac)) : ((8'had) ? (8'ha2) : (7'h43))) ? (((8'hb8) >> (8'haa)) ? (~&(8'hb7)) : (^~(8'hb6))) : (8'h9c)))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  input wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  assign y = {wire14, wire13, wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = (wire8 <= (wire6 != wire5));
  assign wire10 = $unsigned({$signed((wire9 ?
                          $unsigned(wire5) : (wire5 ^ wire6))),
                      (~(wire7 * (~|wire9)))});
  assign wire11 = (wire10 || wire6);
  assign wire12 = (|(^wire7));
  assign wire13 = $signed(wire7[(4'h9):(2'h2)]);
  assign wire14 = ((^~(&($signed(wire10) && $signed(wire12)))) ?
                      wire12 : (wire12[(3'h6):(3'h4)] || $signed(wire6[(2'h3):(1'h0)])));
endmodule

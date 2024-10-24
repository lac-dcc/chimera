module top
#(parameter param33 = (~|{(~&((~|(8'hb3)) * (+(8'h9f)))), (+{(-(7'h40))})}), 
parameter param34 = param33)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = {wire3};
  assign wire6 = (&$signed($unsigned((((8'hb4) ~^ wire0) ?
                     (|wire3) : (7'h44)))));
  assign wire7 = wire1[(1'h1):(1'h0)];
  assign wire8 = {wire6};
  assign wire9 = $unsigned(((({(8'ha0)} ~^ (wire4 ^ wire8)) <<< $signed({(8'hb4),
                     wire5})) >= ($signed((wire1 ?
                     wire3 : (8'ha0))) <<< wire5[(3'h5):(3'h4)])));
  assign wire10 = $unsigned(wire9);
  assign wire11 = (^~(^~(wire0 || (|(wire8 ? wire1 : wire4)))));
  assign wire12 = wire8[(4'he):(4'h8)];
  always
    @(posedge clk) begin
      if (wire8[(4'h8):(3'h6)])
        begin
          reg13 <= ((wire7[(3'h6):(2'h2)] <= (((~wire0) | (wire1 == wire0)) & wire6)) >>> (8'hb9));
          reg14 <= (|{$signed({wire9})});
          reg15 <= $unsigned($unsigned(reg13[(2'h3):(2'h2)]));
          reg16 <= ((^~{$unsigned((wire8 || wire0))}) | ({(|(reg15 >> reg15))} ?
              (~|$signed((!(8'hb4)))) : wire9));
        end
      else
        begin
          reg13 <= reg15;
          if ($signed(((|({(8'hb7), reg15} || wire5)) | (^~(wire10 ?
              (wire9 ? reg14 : wire11) : wire11[(3'h5):(2'h2)])))))
            begin
              reg14 <= $signed(wire1[(2'h3):(1'h1)]);
            end
          else
            begin
              reg14 <= wire8[(4'hc):(4'h8)];
              reg15 <= (($signed(((wire3 < (8'h9d)) >> (wire4 ?
                      (8'h9f) : wire11))) * ($signed(reg16) & wire6[(3'h4):(1'h0)])) ?
                  (~|(^(~(wire6 ~^ wire7)))) : $unsigned(((+(reg16 ~^ wire5)) ?
                      $signed($signed(reg15)) : $signed({(8'hab)}))));
              reg16 <= (!$unsigned({((&(8'ha5)) ? $unsigned((8'ha3)) : (8'hbe)),
                  (&(~|wire9))}));
            end
          reg17 <= (($unsigned($unsigned((wire10 ? (8'hb5) : wire11))) ?
              (+($unsigned((8'h9e)) ^~ wire0)) : reg14[(4'ha):(3'h4)]) || wire8);
        end
      reg18 <= $unsigned((8'hbf));
      if ((^($signed($signed((wire11 - wire7))) ^~ reg16[(2'h2):(2'h2)])))
        begin
          reg19 <= (8'ha6);
        end
      else
        begin
          reg19 <= (&$signed($signed(reg15[(1'h0):(1'h0)])));
          if (wire3)
            begin
              reg20 <= ($unsigned($unsigned(wire9)) ?
                  $unsigned(wire12) : (!(&$signed((wire7 ? wire10 : reg17)))));
              reg21 <= $unsigned(($unsigned($unsigned((wire7 << reg18))) == ((^~reg18) * $signed((reg14 ?
                  reg14 : wire6)))));
              reg22 <= (^~(+((reg21[(4'ha):(3'h6)] ^~ $unsigned(wire3)) > ({reg18} ?
                  $signed(reg14) : wire7))));
              reg23 <= reg13[(4'hd):(4'h8)];
            end
          else
            begin
              reg20 <= {(reg19[(3'h6):(2'h3)] ? (8'hbc) : wire8[(3'h7):(3'h5)]),
                  reg19[(2'h3):(1'h1)]};
            end
          if (wire9)
            begin
              reg24 <= (^~reg14);
              reg25 <= (-reg15);
              reg26 <= $signed(reg21);
              reg27 <= $signed($unsigned(reg26));
              reg28 <= (&((~wire9[(1'h0):(1'h0)]) ^~ (-((reg20 ?
                      reg23 : wire1) ?
                  (wire8 < reg24) : $unsigned(wire9)))));
            end
          else
            begin
              reg24 <= reg18[(1'h1):(1'h0)];
              reg25 <= ((^~wire5) << {(reg21[(4'h8):(4'h8)] ?
                      $signed((reg19 * wire3)) : (~&$signed(wire5)))});
            end
        end
      reg29 <= reg28;
      reg30 <= $unsigned((reg24[(4'ha):(4'h9)] ?
          $signed($unsigned(wire6)) : $signed($signed((8'hb7)))));
    end
  assign wire31 = $unsigned((~^wire12));
  assign wire32 = (((wire5 ~^ ((wire3 ? reg18 : wire0) + $signed((8'ha2)))) ?
                      reg26 : $unsigned(wire8[(4'h9):(4'h8)])) != ($signed($signed($unsigned((8'hbc)))) ?
                      $signed($unsigned($unsigned(wire3))) : $signed(reg14[(1'h0):(1'h0)])));
endmodule

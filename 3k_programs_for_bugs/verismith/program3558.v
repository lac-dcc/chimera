module top
#(parameter param23 = {(8'hbd)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (($unsigned((&{wire3})) >>> ($unsigned(wire3) != {(wire0 ?
                             wire3 : (8'h9f)),
                         $signed(wire3)})) ?
                     ({(((8'hb1) ?
                             wire0 : wire2) <= {wire1})} * ((~|wire1[(3'h7):(1'h1)]) ?
                         (~|(~&wire3)) : (-$signed(wire3)))) : ({wire3,
                             $signed((wire2 ? wire3 : wire1))} ?
                         (~(~&{wire0})) : wire2));
  assign wire5 = $unsigned($unsigned(((|wire4[(1'h1):(1'h1)]) ?
                     $signed((wire4 ? wire0 : wire3)) : $unsigned((^~wire3)))));
  assign wire6 = wire5;
  assign wire7 = (^~wire0);
  always
    @(posedge clk) begin
      reg8 <= (($unsigned((wire0[(1'h1):(1'h1)] ? (+wire1) : $signed(wire5))) ?
              {(wire5 ? wire7[(4'hb):(3'h7)] : $unsigned(wire6)),
                  {wire0[(3'h4):(2'h3)], (^~wire4)}} : (8'hbc)) ?
          $unsigned($signed(wire2[(1'h0):(1'h0)])) : (wire0[(3'h4):(3'h4)] ?
              {(~(wire2 ? wire5 : wire6))} : {$signed({wire4})}));
      reg9 <= $signed((wire3[(1'h1):(1'h0)] == (~^{(~&wire2),
          (reg8 ? wire5 : wire0)})));
      reg10 <= ($unsigned(wire4) ?
          (~($signed($unsigned(wire1)) ?
              $signed((8'hbb)) : (reg9 ? {wire2} : {wire2, reg8}))) : wire4);
    end
  assign wire11 = (&{wire4[(2'h3):(2'h2)]});
  assign wire12 = $signed((~$unsigned(wire3)));
  assign wire13 = (wire0[(1'h1):(1'h1)] ^ $signed(((~^(~^wire1)) ?
                      ({(8'hb5),
                          wire2} < {wire11}) : $unsigned($unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg14 <= {wire3[(2'h3):(1'h0)]};
      reg15 <= wire13[(1'h0):(1'h0)];
      if ($unsigned(reg8[(3'h5):(1'h0)]))
        begin
          reg16 <= wire11;
          reg17 <= (!$signed($unsigned((-{wire2}))));
          reg18 <= (8'hb8);
          reg19 <= reg16;
        end
      else
        begin
          reg16 <= $signed({({$unsigned(wire11)} && ((!wire5) >= wire5[(1'h1):(1'h1)])),
              (8'hb7)});
        end
      reg20 <= wire5;
      reg21 <= $signed($signed(($unsigned(wire7) ?
          (wire1 ? $unsigned(reg19) : wire1) : ($signed(wire3) ~^ wire0))));
    end
  assign wire22 = $unsigned(wire13);
endmodule

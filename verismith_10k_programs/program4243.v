module top
#(parameter param41 = (~|(((^~((8'hac) && (8'h9d))) ? (^~(~|(7'h41))) : ((8'hb5) || ((8'ha5) && (8'hb3)))) ? ((&(-(8'h9d))) ? (((8'had) ? (8'ha9) : (7'h43)) ? ((8'h9f) < (8'hab)) : (8'hbf)) : {((7'h44) ^ (8'h9e)), ((8'hb7) ? (7'h40) : (8'ha1))}) : (((!(8'hab)) | ((8'hb4) >>> (8'ha1))) << ({(8'hb3)} ? ((8'haf) ? (8'hb8) : (7'h41)) : (-(8'hbe)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire36;
  assign y = {wire40, wire39, wire38, wire5, wire6, wire36, (1'h0)};
  assign wire5 = wire0;
  assign wire6 = $signed(wire0[(4'ha):(1'h1)]);
  module7 #() modinst37 (wire36, clk, wire1, wire6, wire2, wire0, wire3);
  assign wire38 = $signed(wire5[(4'h9):(3'h6)]);
  assign wire39 = ($unsigned(wire6[(4'h8):(3'h4)]) ?
                      $signed((((&wire1) ?
                          (wire1 ?
                              wire6 : wire38) : $signed(wire38)) & (~&$unsigned(wire6)))) : ($signed(({(7'h42)} ?
                          $unsigned(wire0) : $unsigned(wire38))) != $unsigned((~{wire0,
                          wire0}))));
  assign wire40 = ((&(wire3[(2'h3):(1'h0)] ?
                      wire39 : wire5)) * $unsigned(wire36));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
  always
    @(posedge clk) begin
      reg13 <= wire11[(1'h1):(1'h0)];
      reg14 <= ((~&$signed(wire9[(3'h5):(3'h5)])) ?
          $signed((&$signed(wire12))) : wire8);
      if ($signed(wire9))
        begin
          reg15 <= wire9;
        end
      else
        begin
          reg15 <= wire11;
          if (wire10[(2'h2):(2'h2)])
            begin
              reg16 <= wire9[(3'h7):(1'h0)];
            end
          else
            begin
              reg16 <= ((^~{(8'hb6), reg16[(3'h6):(3'h6)]}) ?
                  wire10 : $signed(((reg13[(4'hd):(3'h4)] ?
                      (wire10 ? (8'hb8) : reg15) : ((8'hb3) ?
                          reg14 : reg16)) - $unsigned(wire12[(4'h8):(3'h4)]))));
              reg17 <= wire8;
            end
          if (reg16[(3'h7):(2'h3)])
            begin
              reg18 <= {(-(((-reg14) > reg13[(4'hd):(1'h1)]) ?
                      reg14 : ($signed(reg14) ^~ (reg17 - reg16))))};
              reg19 <= reg14[(3'h4):(3'h4)];
              reg20 <= $unsigned($signed({reg18[(4'ha):(1'h0)]}));
              reg21 <= $signed(wire8[(4'hd):(4'hb)]);
              reg22 <= reg13[(4'he):(4'ha)];
            end
          else
            begin
              reg18 <= ($unsigned($signed(reg15[(4'he):(3'h5)])) ?
                  {(~|($signed(reg17) > ((8'hbf) << reg13))),
                      ($signed(wire11[(1'h0):(1'h0)]) ?
                          {(wire8 ? wire11 : reg18),
                              (reg17 >> (8'ha2))} : $unsigned((reg22 ?
                              reg21 : reg17)))} : reg19);
              reg19 <= (&((~(&$signed((8'h9d)))) ^~ reg17[(4'he):(1'h1)]));
            end
          reg23 <= $unsigned((({$signed(reg21),
              $signed(reg16)} + ((wire10 >= wire11) ?
              wire8 : $signed(reg15))) ^~ ($unsigned({reg17}) < ($unsigned(wire12) - (reg21 | wire11)))));
        end
    end
  assign wire24 = reg15;
  assign wire25 = $signed(wire11);
  assign wire26 = $unsigned($unsigned({$unsigned(((8'hb4) ? (8'hb0) : wire12)),
                      wire25}));
  assign wire27 = (!{((((8'h9e) << reg23) ? (~|(8'ha1)) : reg14) ?
                          $signed((8'hab)) : (|$signed(wire10)))});
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire12[(4'h9):(3'h4)]);
      reg29 <= wire11;
      if (wire25[(3'h7):(1'h1)])
        begin
          reg30 <= reg29[(2'h3):(1'h1)];
          reg31 <= $unsigned($signed((reg21 ?
              {(+(7'h40))} : $signed((wire25 < wire9)))));
        end
      else
        begin
          reg30 <= (reg20[(4'h8):(3'h5)] ^ (((8'ha2) && $signed({reg17,
                  wire25})) ?
              $signed((~|(reg21 ? reg14 : (8'hac)))) : (~&(|$signed(reg15)))));
          if (wire11)
            begin
              reg31 <= (^~(+(~|wire12)));
              reg32 <= (^({{(~^reg23), $unsigned(wire26)}} ?
                  reg21 : $unsigned(reg15[(5'h10):(1'h0)])));
              reg33 <= $signed((reg30[(3'h7):(1'h1)] ?
                  ($signed((~wire26)) & (8'ha4)) : (&reg31)));
            end
          else
            begin
              reg31 <= $unsigned(wire11);
            end
        end
    end
  assign wire34 = reg22;
  assign wire35 = (^~((^($unsigned(reg23) >> wire25[(4'ha):(1'h1)])) >>> (wire8[(2'h3):(2'h3)] >= reg23[(1'h0):(1'h0)])));
endmodule

module top
#(parameter param30 = ({(!(((8'ha9) ? (7'h43) : (7'h42)) ? ((8'h9d) ? (8'ha5) : (7'h43)) : (8'hbb)))} << ((~(((8'hb8) || (7'h43)) ? (~|(8'hb6)) : (^~(7'h42)))) ? (^~((8'ha8) ? (~|(8'hb4)) : (~&(8'ha9)))) : (({(8'ha0), (7'h40)} ? ((8'hbd) ? (8'hb7) : (8'h9f)) : {(8'had)}) * (&((8'hae) == (8'ha5)))))), 
parameter param31 = (~|param30))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  assign y = {wire29,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg13,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(((&{(8'hb8)}) ?
                     wire0[(2'h2):(1'h1)] : $unsigned($unsigned(wire3)))));
  assign wire6 = $signed(wire1[(3'h7):(1'h0)]);
  assign wire7 = $signed($signed(wire4));
  assign wire8 = $signed({wire3});
  assign wire9 = (wire7 ?
                     {($signed({(8'had),
                             wire2}) >>> wire1[(4'ha):(1'h1)])} : $signed(wire5[(1'h1):(1'h0)]));
  assign wire10 = ((~&(((wire5 - wire8) && wire8) == wire4[(3'h6):(1'h1)])) & (wire1[(2'h3):(1'h0)] ?
                      (~^(^~{wire1})) : wire8[(3'h4):(2'h2)]));
  assign wire11 = (^~$unsigned(wire1[(4'h9):(4'h8)]));
  assign wire12 = {(^((!wire11) ? wire8 : $unsigned((wire4 ? wire4 : wire4)))),
                      $unsigned($unsigned(wire5))};
  always
    @(posedge clk) begin
      reg13 <= $unsigned((wire10 ? wire4 : (|(&$unsigned(wire7)))));
    end
  assign wire14 = wire12[(2'h3):(2'h2)];
  assign wire15 = $unsigned((8'hbe));
  assign wire16 = (|$unsigned(wire2));
  assign wire17 = $unsigned(wire16);
  assign wire18 = (wire6[(4'hd):(4'h8)] == $unsigned($unsigned(((wire10 ?
                          wire4 : wire9) ?
                      (wire9 ? (8'haf) : wire17) : $unsigned(wire5)))));
  always
    @(posedge clk) begin
      reg19 <= wire10;
      if ((^wire15))
        begin
          reg20 <= $unsigned({({wire10[(3'h6):(2'h3)],
                      (wire1 ? wire4 : wire5)} ?
                  {(wire14 ? wire10 : wire0)} : $unsigned(((8'ha9) < wire8))),
              wire14[(5'h13):(4'hd)]});
        end
      else
        begin
          reg20 <= {(|(!$signed((wire6 ? (8'hb4) : (8'ha2)))))};
          reg21 <= (wire4 + {$signed(((wire6 | reg20) ?
                  (wire5 || wire8) : (wire4 >> wire3))),
              reg19});
        end
      reg22 <= (-$signed((reg21 ? {(wire16 <<< wire8), (^wire5)} : wire10)));
      if (((!$unsigned({wire16})) ?
          wire2 : ($unsigned(((wire7 ? (8'haf) : wire6) ?
              wire5 : $signed(wire3))) & wire18)))
        begin
          reg23 <= $unsigned(reg19);
          reg24 <= wire15[(1'h1):(1'h0)];
        end
      else
        begin
          reg23 <= ((wire6 <<< ({$unsigned(wire7)} ?
              {reg22, (~^wire17)} : wire18)) - (+(^wire17)));
          reg24 <= (wire9[(2'h2):(1'h1)] + (wire10[(2'h3):(2'h3)] ^ (wire11 >= $unsigned(wire10[(3'h6):(3'h5)]))));
          reg25 <= wire6[(1'h0):(1'h0)];
          reg26 <= wire3[(4'hd):(2'h2)];
          reg27 <= ((($signed({(8'hab)}) != (reg25[(3'h4):(2'h2)] ?
                      $signed(wire0) : reg21)) ?
                  ({(8'ha9)} ?
                      ($signed(wire16) * (8'had)) : (reg19 ?
                          {(8'hb4)} : (reg21 && wire15))) : {((reg23 >>> wire15) ?
                          reg26 : wire9)}) ?
              {(|(~^$signed(wire8))),
                  ($unsigned((wire8 ?
                      (8'h9c) : (8'ha5))) != (&(^(8'hb7))))} : (~^wire8));
        end
      reg28 <= ($unsigned($unsigned(((reg21 ^~ wire10) | (wire9 ?
          wire14 : reg23)))) * ($signed((~&$signed(wire7))) >= (($unsigned(wire0) ?
              {reg19, wire15} : reg20[(3'h5):(3'h5)]) ?
          (8'h9e) : ((^reg20) ? $unsigned(wire5) : $signed(wire11)))));
    end
  assign wire29 = reg24[(2'h2):(2'h2)];
endmodule

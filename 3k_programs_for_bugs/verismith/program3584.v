module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire52,
                 wire43,
                 wire42,
                 wire40,
                 wire6,
                 wire5,
                 wire4,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire4 = (^~wire3);
  assign wire5 = (^$unsigned($unsigned(((7'h42) ? (8'hbf) : (wire4 > wire1)))));
  assign wire6 = (~($signed({wire4, wire3[(4'h8):(3'h6)]}) ?
                     $unsigned($unsigned((~&wire5))) : $signed(((+wire0) ?
                         (^wire1) : wire1[(2'h3):(2'h2)]))));
  module7 #() modinst41 (.clk(clk), .wire10(wire6), .wire9(wire0), .wire11(wire4), .wire8(wire1), .y(wire40));
  assign wire42 = wire0;
  assign wire43 = $signed((wire4 ^ $signed(wire2[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      if (wire43[(4'he):(4'hc)])
        begin
          if (wire5[(2'h2):(1'h1)])
            begin
              reg44 <= (-$signed(wire42[(2'h2):(1'h0)]));
              reg45 <= (~^(~wire3));
            end
          else
            begin
              reg44 <= wire40[(5'h10):(2'h2)];
              reg45 <= reg44;
            end
          if ($unsigned($signed({(reg45[(3'h7):(3'h7)] ^~ (wire40 <<< wire2))})))
            begin
              reg46 <= wire40[(4'he):(4'ha)];
              reg47 <= (wire40[(5'h10):(4'ha)] ^~ ((reg45[(3'h5):(1'h0)] ^ wire40) ?
                  (-{$unsigned(wire42),
                      $signed(wire43)}) : (wire0[(3'h7):(1'h0)] ?
                      ({reg46, (8'h9c)} ?
                          (~^wire3) : $unsigned(wire6)) : wire1)));
            end
          else
            begin
              reg46 <= wire43;
              reg47 <= {{wire40},
                  ({$unsigned(reg46[(4'ha):(1'h1)]),
                      wire1[(4'h8):(1'h0)]} >= (~(|(wire40 ? reg45 : wire5))))};
              reg48 <= ((+$unsigned($signed({wire4, wire3}))) ?
                  $signed(wire40) : $unsigned(wire42));
              reg49 <= reg44;
            end
          reg50 <= (((8'hb2) ?
              ((^~$unsigned(wire42)) >> ((reg45 < wire40) ?
                  $unsigned(wire2) : $unsigned((8'ha7)))) : $signed(wire40[(4'h8):(3'h7)])) <= (~^((&(reg49 <= reg49)) >> (wire6[(2'h3):(2'h3)] && $unsigned(reg49)))));
          reg51 <= (($unsigned(((~^(8'hb2)) ?
                  (wire43 << (8'hb4)) : reg49[(3'h6):(3'h6)])) ?
              {$signed(((8'hba) != reg44)),
                  {(&reg48)}} : $unsigned(wire3)) >= reg46[(2'h2):(2'h2)]);
        end
      else
        begin
          reg44 <= ((wire5 != ($unsigned($unsigned(wire1)) ?
                  ((&(8'hb8)) ? $unsigned(reg46) : {wire0}) : {(wire4 ?
                          wire3 : wire6),
                      $unsigned(wire42)})) ?
              $unsigned(((~^(reg44 ? (8'ha6) : wire43)) ?
                  (reg44[(3'h4):(3'h4)] ?
                      {reg50} : $unsigned(wire1)) : {$unsigned(reg51)})) : $unsigned({(wire3 ?
                      (wire5 ? reg51 : wire4) : wire40)}));
        end
    end
  assign wire52 = reg46[(3'h7):(3'h7)];
endmodule

module module7
#(parameter param39 = ((~&{(~&(~(7'h44)))}) ~^ {(~(((8'hb0) & (8'haa)) ? {(8'h9d)} : (~(8'hbd)))), {{((8'ha8) | (8'hb2)), ((8'h9c) ? (8'hb7) : (8'hb4))}}}))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire34;
  assign y = {wire38, wire37, wire36, wire34, (1'h0)};
  module12 #() modinst35 (.y(wire34), .clk(clk), .wire15(wire10), .wire14(wire9), .wire13((7'h41)), .wire16(wire8), .wire17(wire11));
  assign wire36 = ({wire11} ?
                      (!$unsigned((^$unsigned(wire34)))) : $signed((wire11[(4'h8):(2'h3)] ?
                          wire8[(2'h3):(1'h1)] : wire8)));
  assign wire37 = wire36[(1'h0):(1'h0)];
  assign wire38 = (wire9[(4'hd):(4'h8)] ^ $signed((wire34[(2'h2):(1'h1)] >> $signed((wire34 ?
                      wire36 : wire9)))));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(4'hd):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire24;
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= wire13;
      reg19 <= $signed(((wire17[(3'h6):(3'h5)] ?
          wire17 : wire16[(1'h1):(1'h0)]) || wire13[(3'h4):(3'h4)]));
      reg20 <= {wire13[(5'h10):(4'ha)], $signed((-wire17))};
      reg21 <= (~^((&$unsigned((~wire13))) * (&reg18)));
      reg22 <= (8'ha4);
    end
  always
    @(posedge clk) begin
      reg23 <= $signed((($unsigned($signed(wire17)) - reg21) == reg18));
    end
  assign wire24 = $unsigned(($unsigned(reg18[(1'h0):(1'h0)]) >>> reg19[(4'hc):(4'h9)]));
  assign wire25 = $unsigned(wire13);
  assign wire26 = (!(~^(~&{reg19, (^wire13)})));
  assign wire27 = $signed($unsigned((((wire24 ?
                          wire14 : (7'h43)) > reg22[(3'h5):(3'h4)]) ?
                      ({wire16, wire26} ?
                          $signed(reg22) : (wire17 <<< reg22)) : $unsigned(reg23[(1'h1):(1'h0)]))));
  assign wire28 = wire24;
  assign wire29 = (+wire13[(4'hf):(3'h5)]);
  assign wire30 = ($unsigned($signed($unsigned((wire25 >= reg22)))) == ((|$signed($signed(wire13))) < ((!$signed(reg20)) ?
                      $signed((-reg23)) : (+{wire26, (8'hb0)}))));
  assign wire31 = $unsigned(((8'hb6) && {reg23,
                      $unsigned(wire26[(4'h8):(1'h1)])}));
  assign wire32 = $unsigned(($signed((~|{wire24})) >= reg20[(1'h0):(1'h0)]));
  assign wire33 = ($unsigned(((|{wire13, wire13}) ?
                          ($signed(wire29) ?
                              (~&wire14) : $signed(wire14)) : (~&$signed(wire31)))) ?
                      $unsigned(wire13) : wire15[(4'hd):(4'ha)]);
endmodule

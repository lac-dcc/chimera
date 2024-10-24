module top
#(parameter param48 = (~^{{(((8'hbe) ? (8'hb9) : (8'haa)) ? (+(8'hb8)) : ((8'hbd) ? (8'ha2) : (8'hb2)))}, (8'h9e)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire47, wire45, wire5, wire4, (1'h0)};
  assign wire4 = ({$signed($signed((-wire1)))} ?
                     $unsigned((((wire2 >= wire0) == {wire0, wire1}) ?
                         {(wire3 ?
                                 wire3 : (8'hb6))} : ($unsigned(wire2) >> wire0[(2'h2):(1'h0)]))) : wire3);
  assign wire5 = (|$signed(($unsigned(((8'h9d) && wire3)) ~^ (^~(8'ha3)))));
  module6 #() modinst46 (wire45, clk, wire1, wire4, wire3, wire5);
  assign wire47 = wire0;
endmodule

module module6
#(parameter param44 = (((~|(~^((8'h9e) ~^ (8'hae)))) || (^((^(8'ha2)) ? ((8'hba) ? (8'hab) : (8'hb5)) : ((8'hb3) && (8'h9d))))) ? (((((8'hab) * (8'ha7)) ? ((8'hb0) ^~ (8'h9d)) : (^(8'ha8))) != {(~|(8'hba)), ((8'hb5) != (8'hbb))}) ? (~|(~((8'hb0) ? (8'hab) : (8'ha5)))) : (({(8'h9e)} >> (~(8'haf))) ? (^((8'haa) ~^ (8'ha7))) : ((^~(8'ha7)) ? (-(7'h43)) : {(8'hbc)}))) : (~|{(((8'hab) <<< (8'hb7)) ? ((8'hb0) == (8'hac)) : (8'haa)), ((~^(8'hb7)) >= ((8'hb7) ? (8'hae) : (8'hba)))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  assign y = {wire43,
                 wire41,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $unsigned(($unsigned(wire7) - $signed(wire10[(1'h1):(1'h0)])));
    end
  assign wire12 = $signed(wire8);
  assign wire13 = wire8[(1'h1):(1'h0)];
  assign wire14 = ($signed(((8'had) ?
                          wire7[(4'h9):(2'h3)] : wire9[(4'hf):(4'he)])) ?
                      (({wire13} ?
                          {wire10, (wire13 ? (7'h40) : reg11)} : ((!wire9) ?
                              (~^wire9) : wire13[(1'h1):(1'h1)])) > wire13[(2'h2):(1'h0)]) : $unsigned({wire7}));
  assign wire15 = {$unsigned({wire7[(4'ha):(2'h2)],
                          $unsigned((wire8 ? (8'hb1) : wire10))})};
  assign wire16 = reg11[(4'hc):(4'hc)];
  assign wire17 = $unsigned($signed(({wire9[(1'h0):(1'h0)]} << (wire7 ?
                      wire9[(1'h0):(1'h0)] : wire10[(2'h2):(1'h1)]))));
  assign wire18 = wire8;
  assign wire19 = $signed((|(wire18[(1'h0):(1'h0)] >>> $signed((~wire9)))));
  module20 #() modinst42 (.wire22(wire10), .y(wire41), .clk(clk), .wire21(wire19), .wire25(reg11), .wire24(wire16), .wire23(wire15));
  assign wire43 = wire9[(3'h7):(3'h5)];
endmodule

module module20
#(parameter param39 = ((~^(((+(8'hb9)) >>> {(8'hab)}) ~^ {((8'ha2) ? (8'ha9) : (8'hbd))})) ? (({((8'ha0) ? (8'hbb) : (8'hb2)), ((8'ha7) >>> (8'ha7))} ? ((&(8'h9d)) ? ((8'hb9) ? (8'hb2) : (8'h9e)) : (&(8'hb3))) : (((8'h9e) >> (8'ha9)) ? ((8'hb1) ? (8'hb6) : (7'h40)) : ((8'hb6) ? (8'ha9) : (7'h44)))) ? (((~(8'hbd)) ? ((7'h40) ? (8'ha0) : (8'hac)) : ((8'hb0) ? (7'h44) : (8'ha7))) * (((8'hbb) ? (8'hba) : (8'ha5)) < (8'hb3))) : (&(((8'hb3) ? (8'ha0) : (8'hb1)) > {(8'haa)}))) : (((-((8'h9f) == (8'hb1))) ? (((8'hb6) > (8'h9d)) ? (8'hbb) : ((8'hab) == (8'h9e))) : (((8'hb8) ? (8'h9c) : (8'hbc)) <<< (~(8'h9e)))) ? (((~^(8'h9d)) ? (^~(8'hb8)) : ((8'ha0) <<< (8'hb3))) ? {((8'haf) ? (8'ha9) : (8'hb4))} : (((8'hb0) ~^ (8'ha8)) ^ (~&(8'hbd)))) : (({(8'hb1)} | ((8'hb0) ? (7'h42) : (8'haf))) ? ((~&(8'ha7)) > {(8'h9c), (8'hb9)}) : (((8'ha5) > (8'ha3)) + (~(8'ha0)))))), 
parameter param40 = (((((-param39) ? {param39, (8'hac)} : ((8'hb2) ? (8'ha0) : param39)) ? param39 : ((param39 ^~ param39) - (param39 || param39))) ? ((~^(param39 ? param39 : (8'h9e))) * (8'ha9)) : param39) ? param39 : (~|{((-param39) ? (~|param39) : ((8'hba) - param39))})))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(5'h12):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire26;
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire26,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire26 = (~&$unsigned($unsigned((7'h43))));
  always
    @(posedge clk) begin
      if (wire21[(3'h5):(3'h4)])
        begin
          reg27 <= (^$unsigned(wire24[(4'h8):(3'h4)]));
          if (wire22)
            begin
              reg28 <= $unsigned($unsigned($unsigned($unsigned($unsigned(wire26)))));
              reg29 <= (wire22[(1'h1):(1'h1)] ?
                  (($signed($unsigned((8'h9d))) ?
                      reg28[(3'h5):(1'h1)] : $signed(wire21)) != (wire23[(4'ha):(3'h5)] < $signed((wire25 ?
                      wire21 : (8'hbd))))) : reg27);
            end
          else
            begin
              reg28 <= ({(-$unsigned(((8'ha3) ? (8'hbf) : (8'ha4))))} ?
                  ((wire23[(4'hf):(1'h1)] > $unsigned($unsigned(reg28))) - (!$signed((~|reg27)))) : $unsigned((($signed(wire24) + wire24[(4'h9):(3'h7)]) - $signed(wire26))));
              reg29 <= ($signed(({reg29[(1'h1):(1'h0)]} ?
                  wire26[(3'h7):(3'h5)] : (reg29 ?
                      wire22[(4'he):(3'h4)] : wire25[(4'h9):(1'h0)]))) > $unsigned((~&{$signed(wire23)})));
            end
          reg30 <= ({reg28[(2'h3):(2'h3)],
              ((~^(reg29 << wire24)) ?
                  wire25 : $unsigned((wire25 ?
                      wire24 : reg28)))} ^ $signed(wire23[(3'h4):(2'h2)]));
          reg31 <= (reg28[(3'h4):(1'h1)] != (wire25 ?
              {$signed((wire25 ? (8'hb5) : wire25)),
                  $unsigned($unsigned(wire23))} : {wire22[(2'h2):(1'h0)]}));
        end
      else
        begin
          reg27 <= {((reg28 ^ wire24) == wire22[(4'hd):(4'h8)]),
              reg31[(1'h0):(1'h0)]};
        end
      reg32 <= reg29;
      reg33 <= ($signed(wire21[(3'h5):(1'h1)]) << reg29[(2'h3):(2'h2)]);
      reg34 <= reg31;
      reg35 <= $signed(wire23);
    end
  assign wire36 = $signed(((~$signed(wire26)) | $signed(reg34)));
  assign wire37 = wire36[(1'h0):(1'h0)];
  assign wire38 = (wire25[(4'hd):(3'h7)] != {wire26[(1'h1):(1'h1)]});
endmodule

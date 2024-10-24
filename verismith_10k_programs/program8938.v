module top
#(parameter param46 = ((((((8'hb1) ? (8'hae) : (8'h9e)) ? ((8'hb3) ? (8'h9d) : (8'h9f)) : (+(8'hb5))) != (((8'haf) ? (8'hbe) : (8'hb0)) ? (|(8'hb8)) : ((8'had) ? (8'hb2) : (8'hb7)))) <= (8'hb5)) ? (&(~^(((8'ha9) | (8'ha9)) ? (8'hb6) : (~&(8'had))))) : (((((8'hbb) ? (7'h41) : (8'hae)) ? ((8'hbe) | (8'hb3)) : {(8'hbb), (8'hbd)}) ? ({(8'hb3), (8'hab)} ^~ ((8'hb4) ? (8'ha1) : (8'hb6))) : {(^(8'hb9))}) & ((~&((8'haa) >= (8'hb8))) ? ({(8'hb4)} ? {(8'hbe)} : ((8'hb8) ? (8'ha3) : (8'ha0))) : (((8'hac) <<< (8'hbb)) ~^ ((8'hba) ? (8'hb7) : (8'ha6)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire43;
  assign y = {wire45, wire4, wire5, wire6, wire7, wire43, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = {{$signed(wire3[(1'h1):(1'h0)])},
                     (wire3 ?
                         ($unsigned({wire3}) ~^ (~|(wire1 < wire1))) : $signed(wire2))};
  assign wire6 = $unsigned((~|(~|{(~|wire0), wire4[(2'h2):(1'h0)]})));
  assign wire7 = (wire3[(4'hb):(2'h2)] ?
                     wire2 : {(((8'hb6) >> (wire6 | wire0)) ?
                             ($signed(wire1) >= wire4) : $signed({wire5,
                                 wire2}))});
  module8 #() modinst44 (.wire10(wire1), .wire9(wire0), .wire13(wire2), .clk(clk), .wire12(wire4), .y(wire43), .wire11(wire5));
  assign wire45 = {$unsigned($signed(wire0[(2'h3):(1'h1)]))};
endmodule

module module8
#(parameter param41 = (+(!(^~({(7'h42)} & (~(8'hb6)))))), 
parameter param42 = param41)
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire15,
                 wire14,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 (1'h0)};
  assign wire14 = (wire10[(3'h5):(1'h1)] || ($signed({(^~wire10),
                      wire9}) ^ $signed($signed($unsigned((8'hbb))))));
  assign wire15 = (~|$unsigned($unsigned(wire13)));
  always
    @(posedge clk) begin
      reg16 <= {(~^wire12[(3'h5):(3'h4)])};
      if ((~{{{(reg16 ? wire13 : wire12)}},
          ((((8'ha4) ? wire11 : (8'h9d)) ^ (reg16 | wire14)) ?
              (wire10[(3'h6):(2'h2)] ?
                  wire15 : $signed(wire13)) : $unsigned($signed(wire13)))}))
        begin
          if ((~(-wire12)))
            begin
              reg17 <= wire14;
            end
          else
            begin
              reg17 <= $signed($unsigned($unsigned((wire12[(5'h13):(3'h4)] <= {wire13}))));
              reg18 <= ($signed(wire11[(4'h8):(2'h2)]) ?
                  (~|$unsigned(reg17)) : ($signed(($unsigned(wire11) ?
                          (wire15 >> wire12) : (wire9 | (7'h43)))) ?
                      wire10 : (~&wire9[(2'h3):(2'h3)])));
              reg19 <= $unsigned((({$signed(wire12)} > {(^(8'hba))}) >>> wire11));
            end
          if ($unsigned(wire14[(2'h2):(1'h1)]))
            begin
              reg20 <= $signed(wire11[(3'h4):(1'h1)]);
              reg21 <= $unsigned((($signed(reg20[(3'h5):(3'h5)]) ?
                      wire10 : ((|(8'h9e)) ~^ wire9)) ?
                  (8'h9e) : ((+(~&reg19)) ?
                      wire12[(2'h3):(2'h3)] : (!{wire12}))));
              reg22 <= $unsigned(reg20);
              reg23 <= $unsigned(wire14);
              reg24 <= wire14;
            end
          else
            begin
              reg20 <= $unsigned(reg19);
              reg21 <= (8'hb8);
              reg22 <= (reg24 ?
                  wire9[(1'h1):(1'h1)] : (($unsigned((^reg19)) * (-reg22)) ?
                      $signed(wire11) : (($signed(reg18) * $unsigned(wire15)) * ((reg23 ?
                              reg17 : (8'ha5)) ?
                          ((8'hbe) ? wire10 : reg19) : (^~(8'hb7))))));
              reg23 <= reg18[(5'h10):(1'h0)];
              reg24 <= $signed(wire12[(3'h6):(3'h4)]);
            end
          reg25 <= wire10[(3'h6):(1'h0)];
        end
      else
        begin
          reg17 <= $unsigned(reg25[(4'ha):(3'h4)]);
        end
    end
  assign wire26 = wire14[(2'h2):(1'h1)];
  assign wire27 = (~({((8'hac) ? $signed(wire12) : reg17[(1'h0):(1'h0)]),
                      (reg16 ?
                          reg17 : ((8'ha3) ?
                              wire14 : reg25))} ^~ wire26[(3'h4):(3'h4)]));
  assign wire28 = {$signed((&$unsigned((reg25 == reg25))))};
  assign wire29 = $signed(reg16);
  assign wire30 = wire26[(2'h3):(2'h3)];
  assign wire31 = wire12[(5'h10):(4'ha)];
  always
    @(posedge clk) begin
      reg32 <= $signed((|({(|(8'hba)), wire9} ?
          (+wire31) : (&(reg17 != wire27)))));
      reg33 <= (^~(wire9[(1'h0):(1'h0)] ?
          reg17 : (!((reg25 < reg21) ? $signed(wire12) : wire14))));
      reg34 <= ((~$signed(wire30)) ?
          ((reg33[(4'hc):(4'hc)] <<< (^~$unsigned(wire11))) ?
              reg21 : $unsigned($signed((^~(8'hb4))))) : (reg17 != wire28[(4'he):(1'h0)]));
      reg35 <= {(wire9 ?
              {((^~wire10) ? (|reg19) : $unsigned(wire30)),
                  ($unsigned(reg16) >> reg22[(1'h1):(1'h1)])} : (8'hb1)),
          (~|(((^wire10) ? (reg34 ? reg33 : reg24) : reg21[(4'hb):(4'h9)]) ?
              reg21[(4'hd):(4'hc)] : ($unsigned(reg19) && (+wire13))))};
      reg36 <= {($unsigned(wire31) ? reg34 : reg16[(1'h1):(1'h1)]),
          reg19[(3'h7):(3'h7)]};
    end
  assign wire37 = $unsigned(wire26[(1'h1):(1'h1)]);
  assign wire38 = (^~$signed(($signed((wire14 ?
                      wire29 : wire14)) & ((7'h41) <= $unsigned(reg23)))));
  assign wire39 = (+$signed(reg32[(1'h1):(1'h0)]));
  assign wire40 = (wire30 || reg33);
endmodule

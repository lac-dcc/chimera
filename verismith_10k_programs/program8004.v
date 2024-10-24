module top
#(parameter param38 = ((8'h9f) & {{(~^((8'hb9) ? (8'hae) : (8'hb1))), ({(8'ha7), (8'h9d)} ^~ ((7'h44) * (8'hbc)))}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire22,
                 wire6,
                 wire5,
                 wire4,
                 reg37,
                 reg36,
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
                 (1'h0)};
  assign wire4 = (^~{wire2[(3'h7):(3'h5)], wire3});
  assign wire5 = $signed((^wire4[(3'h6):(2'h3)]));
  assign wire6 = (((wire4[(2'h2):(2'h2)] ?
                             ((wire2 ^ wire1) ?
                                 {(8'h9c)} : (wire0 ?
                                     wire1 : wire1)) : $signed(wire4[(3'h7):(3'h4)])) ?
                         wire4 : $signed($unsigned($unsigned(wire2)))) ?
                     $signed({$signed((wire5 >>> wire2))}) : $signed(wire0));
  module7 #() modinst23 (wire22, clk, wire6, wire3, wire5, wire0);
  assign wire24 = ($unsigned(wire2) != (+($signed(wire5) ?
                      (~^(wire1 ? wire22 : wire0)) : ((wire4 ?
                          (8'hb0) : wire6) ~^ (~&wire5)))));
  assign wire25 = ($signed((^({wire3, wire5} ?
                      $signed(wire6) : {(8'ha2),
                          (8'hb7)}))) * $unsigned(wire2));
  always
    @(posedge clk) begin
      if ($signed(wire3))
        begin
          reg26 <= wire3[(2'h2):(2'h2)];
          reg27 <= ((wire0[(3'h4):(2'h2)] ?
                  {wire3[(2'h2):(2'h2)]} : {(-(wire24 ^ wire6)),
                      $unsigned(wire24)}) ?
              (((~(-wire22)) & (wire6[(3'h7):(1'h0)] ?
                      $signed(wire24) : $unsigned(wire6))) ?
                  (({wire6, wire25} ? (&wire25) : (wire22 >> (8'ha7))) ?
                      $signed($signed(wire24)) : wire25) : $unsigned($unsigned(wire6))) : wire2[(5'h10):(4'ha)]);
        end
      else
        begin
          if (wire25)
            begin
              reg26 <= $signed($unsigned((wire2[(4'h8):(1'h1)] - ((~&reg26) ?
                  wire1[(4'h8):(2'h2)] : $unsigned(reg26)))));
              reg27 <= $unsigned({wire24[(1'h0):(1'h0)], $signed((^(|wire5)))});
              reg28 <= reg26;
              reg29 <= $signed(($signed((8'ha5)) ?
                  (&$signed($signed(reg27))) : wire2));
            end
          else
            begin
              reg26 <= reg27[(3'h5):(3'h4)];
              reg27 <= (wire22[(4'ha):(2'h2)] << ($unsigned((wire4 ?
                  (reg28 <<< wire22) : (~|wire1))) >>> ($unsigned((~|wire1)) & $signed(wire22))));
              reg28 <= $signed($unsigned(wire1));
            end
          reg30 <= ((^(wire22 < wire4)) ?
              $signed({wire2[(5'h11):(2'h3)]}) : $unsigned($unsigned((|$unsigned((7'h40))))));
          if (($unsigned((wire25[(5'h11):(3'h4)] - wire22)) > ($unsigned(reg30) * wire25)))
            begin
              reg31 <= (~|(wire6 ?
                  ($signed((^reg29)) ?
                      reg30 : $unsigned($signed(wire1))) : $signed($unsigned($signed(wire5)))));
              reg32 <= ({$unsigned($signed($unsigned((8'haa)))),
                  ($signed($unsigned(reg27)) ?
                      wire2 : $unsigned(((8'ha5) | (7'h42))))} <= (wire0[(4'hd):(4'hd)] ?
                  reg31[(3'h7):(3'h4)] : wire6));
            end
          else
            begin
              reg31 <= $unsigned(((^~$unsigned($signed(wire1))) > $signed((~^$signed(reg28)))));
              reg32 <= ((^(((wire1 && wire24) <<< (wire2 ? reg28 : (8'ha4))) ?
                  ($unsigned(reg26) <= (reg30 ?
                      wire4 : reg27)) : ((wire25 ^~ reg26) ?
                      wire5 : {wire2,
                          wire5}))) != $signed($unsigned($unsigned(reg31))));
              reg33 <= reg31[(3'h7):(3'h4)];
              reg34 <= ($signed($unsigned($unsigned($signed(reg31)))) - (7'h40));
            end
          reg35 <= $signed(((wire0[(5'h13):(4'hc)] ?
              ((reg32 ? wire3 : reg31) ?
                  $signed(reg29) : reg28[(1'h0):(1'h0)]) : reg28) - $signed({reg32[(4'h9):(1'h0)]})));
          reg36 <= $signed((+$signed((|{wire5, reg30}))));
        end
      reg37 <= reg32[(4'hc):(1'h0)];
    end
endmodule

module module7
#(parameter param20 = ((((((8'h9e) ^~ (8'hbe)) * ((8'hb5) ? (8'hb4) : (8'hb4))) ^ {((8'hbc) ? (8'h9c) : (7'h41))}) ~^ (^(+(^~(8'ha7))))) ? (((((8'ha7) | (8'haa)) >= (^~(8'ha6))) >> (((8'h9f) ? (8'h9c) : (8'h9f)) ? ((8'ha6) ? (8'ha7) : (8'ha1)) : {(7'h42)})) >= ((~|((8'haa) ? (8'hb8) : (8'haa))) ? {(^(8'hb5))} : (((8'haa) + (8'hb9)) | (~(8'hb0))))) : (((((8'ha0) ? (8'hba) : (8'hb2)) & (8'hb7)) >> ((~&(7'h44)) ? ((8'hb5) < (7'h42)) : ((8'ha2) == (8'hbf)))) ? ((((8'h9d) ? (7'h42) : (8'hbd)) ? ((8'hb0) ? (8'ha8) : (8'hba)) : {(8'ha8)}) ? ((&(8'h9e)) && {(8'hbd)}) : (((7'h40) ? (7'h41) : (8'hb3)) ? (~|(8'ha6)) : ((7'h44) ? (8'h9e) : (8'hb8)))) : (((|(8'hbd)) ? ((8'hbb) ? (8'ha3) : (8'h9d)) : (^(8'ha5))) ? ((~&(8'hbf)) ? ((8'hba) ? (8'hbf) : (8'ha3)) : ((8'hb4) ? (8'hac) : (8'hb8))) : (((8'had) > (7'h40)) ? ((8'ha7) ? (8'ha8) : (8'ha6)) : (^~(8'haa)))))), 
parameter param21 = {((+param20) ? (((&param20) ? (param20 ? param20 : param20) : param20) ? param20 : ({param20, param20} <<< ((8'ha7) ? param20 : param20))) : ({(~|param20), (param20 ? param20 : param20)} + {(param20 ? param20 : param20), (param20 ? param20 : param20)}))})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  assign y = {wire19,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire12 = {(!wire10[(3'h6):(2'h3)])};
  assign wire13 = (~&$signed((($unsigned(wire9) ?
                          $signed((8'hab)) : $unsigned(wire9)) ?
                      (wire12 ~^ $signed(wire10)) : {$signed(wire10)})));
  assign wire14 = (+$unsigned((^~wire13)));
  assign wire15 = wire8;
  always
    @(posedge clk) begin
      reg16 <= wire10;
      reg17 <= (wire13[(3'h7):(3'h4)] == $unsigned(({wire9[(4'hb):(3'h5)],
              $signed((8'haf))} ?
          ((wire9 != wire13) ~^ $signed(wire10)) : (8'hba))));
      reg18 <= $signed((wire14[(2'h2):(2'h2)] <<< ($unsigned($signed((8'ha0))) - (wire15[(4'he):(3'h4)] ?
          $unsigned(wire9) : {wire9}))));
    end
  assign wire19 = (8'hac);
endmodule

module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire70;
  assign y = {wire4, wire5, wire6, wire7, wire8, wire9, wire70, (1'h0)};
  assign wire4 = $unsigned((((wire1[(3'h6):(3'h5)] ?
                             (^~wire0) : $unsigned(wire2)) ?
                         wire2[(4'hc):(4'hc)] : {(wire3 ? wire1 : wire1),
                             (wire0 > (8'had))}) ?
                     wire3[(4'h8):(2'h3)] : $signed(wire3)));
  assign wire5 = wire4[(2'h3):(1'h0)];
  assign wire6 = wire3;
  assign wire7 = wire2;
  assign wire8 = wire7[(1'h1):(1'h1)];
  assign wire9 = $signed((wire5 > {({wire0} < {wire7, wire5}),
                     ((wire4 >> wire4) >> wire4)}));
  module10 #() modinst71 (wire70, clk, wire6, wire5, wire1, wire2, wire8);
endmodule

module module10
#(parameter param68 = (((&(8'ha2)) ? (((-(7'h41)) ? (&(8'ha4)) : ((7'h43) + (8'hac))) == (((8'hbc) == (7'h43)) - ((8'ha6) << (8'hb3)))) : (~&((|(8'hb1)) ? ((8'hbd) || (8'h9c)) : (+(8'hbf))))) ? ((&{((8'ha9) ? (8'hbf) : (8'ha2)), ((8'ha9) <= (8'hae))}) ? (8'h9e) : (-(|(-(8'h9f))))) : ((~^(+((8'hbb) < (8'ha1)))) ? (!(^((8'hb4) ? (7'h44) : (8'h9e)))) : ({((8'hb3) ? (8'hb4) : (7'h42))} || {((8'hb6) ? (8'hb2) : (8'hb6))}))), 
parameter param69 = ({param68, (8'hb2)} ? ({(~((8'haa) - param68))} ? {param68, (+(param68 ? param68 : param68))} : ((param68 ? {param68} : {(8'hba)}) || (8'hab))) : (((param68 ? (param68 & param68) : (^~param68)) == ({param68, param68} <<< {(8'hb4), param68})) ~^ {{(param68 ? (8'ha6) : param68), (8'hb0)}, (7'h44)})))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire65;
  assign y = {wire67,
                 wire16,
                 wire17,
                 wire30,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire65,
                 (1'h0)};
  assign wire16 = (~wire13[(3'h4):(3'h4)]);
  assign wire17 = wire13[(4'hd):(1'h1)];
  module18 #() modinst31 (wire30, clk, wire15, wire11, wire14, wire16);
  assign wire32 = wire30;
  assign wire33 = (-(&(wire16 || (~&(wire16 ? (8'ha0) : (8'haa))))));
  assign wire34 = wire16;
  assign wire35 = $signed((wire30 ?
                      wire30[(4'h9):(3'h5)] : {wire17[(1'h1):(1'h1)],
                          $signed($unsigned(wire17))}));
  module36 #() modinst66 (.clk(clk), .wire40(wire13), .wire37(wire17), .wire38(wire33), .wire41(wire16), .y(wire65), .wire39(wire34));
  assign wire67 = $unsigned((!$unsigned({(~^wire16)})));
endmodule

module module36
#(parameter param64 = (^{(~(((7'h44) ? (8'haa) : (8'hb2)) >>> (~^(8'h9e)))), ((~{(8'ha6), (8'hbc)}) ? (((8'ha9) ^ (8'hb3)) ? {(8'hb6), (8'hbc)} : ((8'ha2) ? (8'hbf) : (8'ha9))) : (((8'hb5) ? (8'h9e) : (8'hbf)) ? (~|(8'hb6)) : {(8'ha1)}))}))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(4'hc):(1'h0)] wire39;
  input wire [(5'h13):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire42;
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire42,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire42 = ($signed(wire40) ~^ (8'hab));
  always
    @(posedge clk) begin
      if ($unsigned($signed({$signed($signed(wire40))})))
        begin
          reg43 <= (8'h9e);
          reg44 <= $signed((^wire38[(5'h12):(5'h11)]));
          if ($signed((8'hb7)))
            begin
              reg45 <= reg43;
              reg46 <= $unsigned((7'h41));
              reg47 <= ($signed((+((wire40 >>> wire42) < $unsigned((8'haf))))) ?
                  wire42[(4'h9):(1'h1)] : (^~{$signed((reg45 ?
                          wire41 : (8'ha7))),
                      $signed(reg44[(1'h0):(1'h0)])}));
              reg48 <= ({$signed(wire40), wire42[(4'hf):(2'h2)]} ?
                  (reg44[(1'h0):(1'h0)] << ((^wire40[(3'h4):(1'h0)]) ?
                      ((8'h9d) ?
                          (reg44 >>> wire42) : $signed((8'ha3))) : $unsigned(wire41[(4'h8):(3'h4)]))) : (wire42 ?
                      (+{reg43[(4'hc):(4'h9)]}) : wire42[(4'h9):(3'h5)]));
            end
          else
            begin
              reg45 <= $signed(($signed((reg48[(3'h5):(3'h4)] + (reg46 ?
                  reg47 : wire41))) ~^ $unsigned($signed($signed(reg46)))));
              reg46 <= wire42[(2'h2):(2'h2)];
              reg47 <= wire41[(3'h6):(1'h1)];
              reg48 <= reg43[(1'h0):(1'h0)];
              reg49 <= $signed({wire42,
                  $signed($signed(reg48[(4'hb):(2'h3)]))});
            end
          reg50 <= ((wire41[(3'h6):(2'h3)] + wire41[(3'h4):(2'h2)]) ?
              $unsigned((-{reg44, (|wire40)})) : (($unsigned((reg48 ?
                          reg45 : reg49)) ?
                      ((wire39 <= reg44) ^ wire42[(4'hd):(3'h4)]) : reg46) ?
                  ((reg48 ?
                      {(8'haa),
                          reg49} : $signed(wire37)) != reg47[(2'h2):(2'h2)]) : reg48));
        end
      else
        begin
          reg43 <= ((reg46[(2'h3):(2'h3)] && (((reg50 ?
              reg46 : reg47) > (reg45 ?
              reg44 : wire38)) | reg45)) | (wire38 == $unsigned(wire42[(4'hb):(1'h1)])));
          reg44 <= (!$signed(($unsigned($signed(wire39)) >> wire40[(1'h1):(1'h0)])));
          if (({$signed(($signed((8'ha6)) && $signed(reg47))),
              $unsigned((~|reg49))} ^~ {$unsigned((~^reg49))}))
            begin
              reg45 <= ($signed((($signed(reg44) ?
                  $signed(reg44) : (reg43 ^~ reg46)) || {reg48,
                  reg49})) + (reg44[(1'h1):(1'h0)] || wire39));
              reg46 <= $unsigned((^wire39));
              reg47 <= reg44;
              reg48 <= {$unsigned(wire40),
                  (((!((8'h9e) ? reg45 : wire41)) ?
                      ((reg45 && (8'ha9)) <= reg44[(2'h3):(2'h2)]) : reg47[(5'h14):(5'h13)]) != ($signed($unsigned(reg50)) - $signed((!wire40))))};
            end
          else
            begin
              reg45 <= reg46;
              reg46 <= ($unsigned((~$signed((wire40 + reg49)))) ?
                  $signed($unsigned(((reg48 ? wire40 : reg48) ?
                      (reg49 > wire38) : reg46[(1'h1):(1'h1)]))) : $signed((^~(8'hab))));
            end
        end
      reg51 <= reg44;
      reg52 <= ((7'h40) ~^ (wire38[(3'h4):(1'h1)] < ((|(reg50 ?
          reg51 : (7'h42))) <= $unsigned((reg50 + wire42)))));
      if ($signed($signed($unsigned((reg44 ? $signed(reg49) : (8'h9e))))))
        begin
          if (reg50)
            begin
              reg53 <= $signed({$unsigned((~$unsigned(reg49))),
                  ({(~&wire40)} >= $signed((reg50 + reg50)))});
              reg54 <= wire37;
            end
          else
            begin
              reg53 <= $unsigned(reg43[(4'hf):(4'he)]);
              reg54 <= $signed((~|$unsigned({{reg46}})));
              reg55 <= $signed($unsigned(wire41[(1'h1):(1'h0)]));
              reg56 <= $signed((7'h43));
              reg57 <= (($signed(reg43) >>> (((8'hb8) == reg56) ?
                  reg54 : $signed(reg50[(4'h9):(2'h3)]))) - (&($unsigned((-wire41)) ?
                  reg54[(3'h5):(1'h0)] : ({reg50} ?
                      $signed(reg53) : ((7'h42) || (8'ha6))))));
            end
        end
      else
        begin
          reg53 <= (8'hb9);
          reg54 <= $unsigned(reg47);
          reg55 <= (8'hb2);
          reg56 <= (~^(^~$unsigned((reg54 >= $signed(reg55)))));
          reg57 <= reg52[(4'he):(4'hd)];
        end
    end
  assign wire58 = ((^~(reg54 >= {(-reg56)})) >= $unsigned(wire37[(3'h4):(2'h2)]));
  assign wire59 = {$signed(((|reg45[(1'h1):(1'h0)]) ?
                          (wire40 | (wire42 ?
                              reg47 : wire37)) : ($unsigned(reg51) ?
                              reg56[(3'h7):(3'h5)] : $unsigned(wire40))))};
  assign wire60 = $unsigned($signed(reg56[(4'hf):(4'h9)]));
  assign wire61 = (reg44 || ({$signed($unsigned(reg50))} < (^~$unsigned($signed(reg45)))));
  assign wire62 = ((reg57 ? (~&{$unsigned((8'ha6))}) : reg57) ?
                      (reg53[(3'h5):(3'h5)] ?
                          wire42[(3'h7):(2'h2)] : $unsigned(wire58)) : reg56);
  assign wire63 = $unsigned(((~$unsigned($unsigned(reg55))) ?
                      $signed(((wire40 << (8'hba)) ^~ wire38[(4'ha):(4'h8)])) : {$signed((wire59 - reg50))}));
endmodule

module module18
#(parameter param28 = (^~(~({{(8'hbd)}} < (((8'h9d) ? (8'hae) : (8'hb6)) ^ (-(8'hb5)))))), 
parameter param29 = param28)
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h24):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  assign y = {wire27, wire26, wire25, wire24, wire23, (1'h0)};
  assign wire23 = {(({(!(8'hba))} + $unsigned($unsigned((8'hbf)))) << $unsigned(wire19[(2'h2):(1'h0)]))};
  assign wire24 = wire20[(3'h7):(2'h3)];
  assign wire25 = (~^($unsigned(($unsigned(wire21) ?
                      (~|wire19) : wire23)) ~^ ((^~(wire21 ?
                      (8'ha9) : wire20)) ^ (8'hb1))));
  assign wire26 = (wire21[(4'h8):(3'h5)] ? wire19 : wire21);
  assign wire27 = wire20;
endmodule

module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire45;
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire45,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire4 = (^~wire2[(4'ha):(3'h4)]);
  assign wire5 = $signed(wire0[(3'h7):(3'h6)]);
  assign wire6 = wire4;
  assign wire7 = (|(($unsigned($signed(wire3)) >> ($signed(wire0) ^ (wire5 ?
                     wire2 : wire4))) && $signed(wire5[(5'h10):(4'h8)])));
  module8 #() modinst46 (.wire9(wire2), .wire11(wire4), .wire12(wire5), .wire10(wire7), .y(wire45), .clk(clk), .wire13(wire3));
  always
    @(posedge clk) begin
      if ((+wire7))
        begin
          if ((~wire2))
            begin
              reg47 <= $signed($unsigned(wire5));
              reg48 <= (-(wire4[(4'hd):(3'h5)] || wire6[(3'h7):(3'h5)]));
            end
          else
            begin
              reg47 <= $unsigned((wire3[(3'h7):(2'h3)] < (^~$unsigned(wire0[(1'h0):(1'h0)]))));
              reg48 <= wire6;
              reg49 <= ({wire3[(3'h4):(1'h1)]} ?
                  {wire7} : wire1[(2'h3):(1'h1)]);
              reg50 <= reg47;
              reg51 <= ((7'h41) | $unsigned($unsigned(((reg47 ?
                  wire6 : reg50) && wire4))));
            end
        end
      else
        begin
          if ({reg51})
            begin
              reg47 <= $signed((~^wire4));
              reg48 <= ((+(((wire7 <<< wire5) ?
                      $unsigned((8'hb6)) : (wire6 + reg47)) ?
                  $signed(wire5[(2'h2):(1'h1)]) : reg47)) || ({(~^(wire45 ?
                      (8'ha3) : wire6)),
                  ((^~reg48) ?
                      ((8'haf) ? reg48 : wire1) : {(8'ha4),
                          reg47})} * $signed((~((8'hac) ? reg47 : reg51)))));
              reg49 <= (((({wire0} ^~ $signed(wire3)) + ((wire6 || wire3) | (!wire45))) >= (&reg48)) ?
                  reg47[(5'h10):(4'hd)] : (($unsigned(reg47) >>> {{wire5,
                          wire4},
                      wire0[(1'h1):(1'h1)]}) - reg49));
              reg50 <= wire5;
              reg51 <= (|wire2[(3'h5):(3'h4)]);
            end
          else
            begin
              reg47 <= ((&reg47[(4'hf):(3'h7)]) ?
                  (((^~(reg47 <= wire0)) * wire6[(3'h6):(3'h4)]) ?
                      ({reg51[(4'hf):(3'h4)]} && $signed(wire0)) : $signed((wire1 ?
                          (~wire7) : $signed((8'h9d))))) : {{(^~reg48),
                          $unsigned($signed(reg49))}});
              reg48 <= $signed($unsigned(wire2));
            end
          reg52 <= $signed(($unsigned(($signed(wire2) ?
                  wire6 : $unsigned(reg47))) ?
              ((wire45 ? (wire6 ? reg49 : (8'hb2)) : {reg49}) ?
                  {{wire7, wire0},
                      wire4[(4'hb):(1'h0)]} : (wire6 > wire4[(4'hc):(3'h5)])) : $signed((-{wire1,
                  reg47}))));
          reg53 <= reg48[(1'h0):(1'h0)];
          reg54 <= wire1;
        end
    end
endmodule

module module8
#(parameter param43 = ((^({{(8'hb8), (8'hac)}} ? (((8'ha4) < (8'ha3)) ? (-(8'hb6)) : {(8'ha8), (8'hac)}) : (|((8'hb4) ? (8'hbe) : (8'hb0))))) ? (((!(~^(8'hb9))) <= ((8'hb0) ? (-(8'ha2)) : ((8'hb1) == (8'hb0)))) == ((8'had) >> (8'hbf))) : ({(((8'ha2) ? (8'hbe) : (8'ha1)) ^ (|(8'had))), {((8'haa) ? (8'hb3) : (8'hb8)), ((8'hb5) - (8'hb5))}} ? {(((8'ha3) && (8'hb7)) ? {(8'hbb), (7'h44)} : ((8'h9c) ? (8'ha5) : (8'h9c))), ((&(8'hb9)) ? ((8'ha7) ? (8'ha2) : (8'hb8)) : {(8'hbc)})} : (~^(~&((8'h9e) > (8'haa)))))), 
parameter param44 = (-(+((^~(param43 && param43)) + {(param43 - (8'haf))}))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire14 = wire11;
  assign wire15 = {wire13[(3'h6):(3'h4)], $signed(wire11[(2'h3):(2'h2)])};
  assign wire16 = $signed(($signed({(~wire12)}) ?
                      $unsigned(wire10) : (wire14[(5'h10):(4'h9)] ^ ((!wire13) <= wire15[(3'h6):(3'h4)]))));
  assign wire17 = (|wire10);
  assign wire18 = {(($signed($unsigned(wire14)) ?
                          wire11[(3'h6):(2'h3)] : ($signed(wire16) > wire13)) == wire16[(4'hd):(3'h7)])};
  always
    @(posedge clk) begin
      reg19 <= $unsigned({$signed(((wire15 - wire16) + $signed(wire15)))});
      reg20 <= wire17[(2'h2):(1'h0)];
    end
  assign wire21 = wire10[(4'he):(4'h9)];
  assign wire22 = (-(($unsigned(wire13[(4'ha):(1'h1)]) > $signed(wire16)) ?
                      wire11 : (~&wire21)));
  assign wire23 = $signed(($unsigned({(~&wire14)}) ?
                      $unsigned($signed(wire22)) : (wire22 ^~ $unsigned((+wire12)))));
  assign wire24 = reg20[(3'h4):(2'h3)];
  assign wire25 = (-reg19);
  always
    @(posedge clk) begin
      reg26 <= reg20;
      reg27 <= $signed(((&((wire22 ? wire21 : wire11) ?
              $signed(wire25) : wire22)) ?
          wire16 : (wire12[(4'h8):(1'h1)] - $signed(wire15))));
      if ((-(((reg19[(5'h12):(4'hc)] ?
              wire25[(1'h0):(1'h0)] : {wire18}) ^ wire11[(3'h5):(3'h4)]) ?
          (~(~&wire14[(1'h0):(1'h0)])) : (~^(((8'hb7) && reg27) ?
              (wire18 >>> wire12) : (+wire13))))))
        begin
          reg28 <= $unsigned(((^~((-wire15) ?
                  {wire9, wire23} : $unsigned((8'ha6)))) ?
              {$unsigned($signed(reg26)),
                  ($unsigned((7'h43)) & $signed(wire17))} : $signed((wire18 ?
                  wire15[(3'h4):(3'h4)] : reg27))));
          reg29 <= ($signed(($signed(wire14[(3'h4):(2'h2)]) ?
              $signed((wire13 << wire10)) : $unsigned(wire16))) != (~^reg19[(4'h8):(1'h0)]));
        end
      else
        begin
          if (wire23[(2'h2):(1'h0)])
            begin
              reg28 <= (reg26 <= {{wire17,
                      ($unsigned(wire17) > ((8'hb4) != reg26))}});
            end
          else
            begin
              reg28 <= {wire23,
                  (wire22 <= $unsigned($signed($signed(wire16))))};
            end
          if (wire14)
            begin
              reg29 <= (($unsigned(reg19) & (&$unsigned((wire10 >>> reg28)))) ?
                  $signed(wire13[(4'h9):(4'h8)]) : ($unsigned((wire25 < (8'ha7))) & (^~((wire9 && (8'ha1)) ?
                      $signed(wire22) : (reg20 ? reg27 : (8'haf))))));
              reg30 <= ((8'hb4) ?
                  (($unsigned((wire24 ? wire16 : (8'hbf))) != (wire21 ?
                          (+reg27) : (&wire13))) ?
                      (reg29[(2'h2):(2'h2)] == {wire16,
                          (&wire10)}) : $unsigned((~|(~^wire24)))) : (($signed(wire10) >> (+wire9[(1'h0):(1'h0)])) ^ (({wire11} >> {wire14,
                      wire14}) <<< ($unsigned(wire10) >= ((8'ha3) & reg20)))));
            end
          else
            begin
              reg29 <= $signed((reg28 ~^ wire21));
              reg30 <= (wire17[(1'h0):(1'h0)] & ($unsigned(wire9) ?
                  wire21 : (^~((^~wire10) ?
                      reg26[(3'h5):(2'h3)] : (reg28 ? reg27 : reg30)))));
              reg31 <= (+wire14[(5'h12):(5'h10)]);
              reg32 <= $signed(wire12);
            end
          reg33 <= reg19[(5'h11):(4'ha)];
          reg34 <= ((^(((wire14 ? reg29 : reg32) <= $signed(wire15)) ?
                  $unsigned($unsigned(wire15)) : ((!reg32) <= wire10[(5'h12):(4'hf)]))) ?
              (wire22 ?
                  (({reg32, reg28} ^ (wire12 ?
                      wire11 : wire25)) > {(wire25 <= reg33),
                      $unsigned(reg28)}) : wire9[(2'h2):(1'h1)]) : (wire9[(2'h2):(1'h1)] * reg29));
          reg35 <= (~^((|($unsigned((8'hbe)) ^~ wire13)) - ($signed({wire11,
              (8'h9f)}) > (8'hac))));
        end
    end
  assign wire36 = (wire16[(4'hb):(4'h9)] ?
                      (((+wire17) + $unsigned($signed((8'ha1)))) ?
                          ($signed($signed(wire17)) ?
                              $signed($unsigned(wire22)) : ({wire15, wire18} ?
                                  $signed(reg27) : reg20[(1'h1):(1'h0)])) : (wire10[(5'h13):(4'hb)] ?
                              wire11[(2'h3):(1'h1)] : wire12[(3'h5):(1'h1)])) : $signed($unsigned((((8'hb3) ^~ reg32) == (wire12 >= wire11)))));
  assign wire37 = $signed(reg30);
  assign wire38 = ((~|wire21) < $unsigned($unsigned(((&reg26) ?
                      wire21[(4'hd):(4'hc)] : $signed((8'hbd))))));
  assign wire39 = $unsigned($unsigned(wire21));
  assign wire40 = ((wire37[(2'h3):(2'h2)] > reg35[(2'h3):(1'h1)]) ?
                      reg27[(2'h3):(2'h3)] : {($unsigned((8'hbd)) ?
                              (~&reg34) : wire18)});
  assign wire41 = ($signed($signed($unsigned((reg34 ^~ reg27)))) > wire36[(4'h9):(1'h1)]);
  assign wire42 = $unsigned(wire14);
endmodule

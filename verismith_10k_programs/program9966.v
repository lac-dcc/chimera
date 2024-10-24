module top
#(parameter param70 = (8'haf), 
parameter param71 = param70)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire67;
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire69,
                 wire4,
                 wire16,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire36,
                 wire37,
                 wire38,
                 wire67,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire4 = $signed((-$unsigned((+{(8'ha1)}))));
  module5 #() modinst17 (.y(wire16), .wire9(wire2), .clk(clk), .wire6(wire1), .wire7(wire3), .wire8(wire4));
  always
    @(posedge clk) begin
      reg18 <= {({wire1} ?
              {$unsigned(wire16)} : $unsigned(wire1[(2'h3):(1'h0)])),
          $unsigned(wire16)};
      reg19 <= wire1[(4'h9):(3'h5)];
      reg20 <= (8'ha0);
      reg21 <= (!$unsigned(reg20[(2'h3):(1'h1)]));
    end
  assign wire22 = (|(wire16 >> (~&wire1[(4'hd):(3'h4)])));
  assign wire23 = $signed($signed({$unsigned(reg18), (~|$unsigned(wire22))}));
  assign wire24 = $unsigned(reg21[(4'h8):(3'h5)]);
  assign wire25 = wire4;
  assign wire26 = $unsigned((((wire0 ~^ wire1) ?
                      wire0[(2'h2):(2'h2)] : wire16[(4'ha):(4'h8)]) * $unsigned((((8'ha9) ?
                      wire1 : wire1) << $unsigned(reg21)))));
  assign wire27 = reg18;
  assign wire28 = wire2;
  assign wire29 = ({wire1[(3'h6):(3'h5)]} << ((({wire3,
                      wire2} & (^wire23)) - wire23) ~^ wire2[(3'h5):(3'h5)]));
  assign wire30 = {reg21[(4'h8):(3'h7)],
                      ((|wire22[(3'h4):(1'h0)]) >>> $unsigned((^$signed((8'ha4)))))};
  always
    @(posedge clk) begin
      if ($signed(reg20[(4'hf):(4'h9)]))
        begin
          reg31 <= {(~^(-($signed(wire16) < (wire2 ? (7'h40) : wire2))))};
        end
      else
        begin
          reg31 <= reg20[(1'h1):(1'h0)];
          reg32 <= $signed($unsigned({wire26}));
          reg33 <= ($unsigned(reg31) ^ $signed({(~^$unsigned(wire27))}));
        end
      reg34 <= $unsigned(({$signed({wire4})} && (reg31[(2'h3):(2'h2)] < ({(8'ha1)} ?
          reg20[(1'h0):(1'h0)] : {wire0}))));
      reg35 <= (-$signed(wire25[(1'h1):(1'h0)]));
    end
  assign wire36 = wire22[(2'h2):(1'h1)];
  assign wire37 = {wire2[(4'hb):(4'h9)]};
  assign wire38 = (8'hb9);
  always
    @(posedge clk) begin
      reg39 <= $unsigned(wire28[(4'h8):(4'h8)]);
      reg40 <= $signed(($signed($unsigned(wire38)) >>> $signed(wire0)));
      if ((($unsigned(({(8'ha0), reg20} >> wire2)) ?
              (~&(~&reg35[(3'h5):(3'h4)])) : (|reg35[(4'h8):(3'h4)])) ?
          wire23[(2'h3):(2'h3)] : wire26))
        begin
          if (wire3[(3'h7):(3'h6)])
            begin
              reg41 <= ((wire38[(3'h6):(2'h2)] && wire28[(4'h8):(3'h6)]) || {wire25[(2'h2):(1'h0)],
                  $signed(wire25)});
            end
          else
            begin
              reg41 <= wire26;
            end
          reg42 <= (|reg31);
          if (wire37)
            begin
              reg43 <= wire36[(4'h8):(3'h6)];
              reg44 <= reg34[(5'h13):(4'h8)];
            end
          else
            begin
              reg43 <= (((!wire30[(1'h1):(1'h1)]) == ((reg33[(4'ha):(3'h5)] ^ $signed(reg20)) && $unsigned(wire24))) ?
                  {$signed((~(reg44 < reg40))),
                      $unsigned((((8'hb3) ? wire30 : wire37) ?
                          reg33[(3'h6):(3'h5)] : $signed(reg43)))} : $unsigned(reg42));
              reg44 <= wire29[(4'h9):(3'h6)];
              reg45 <= reg33;
              reg46 <= reg44[(4'ha):(4'h8)];
              reg47 <= $unsigned({$unsigned(($unsigned(wire0) ?
                      reg42 : (reg43 * reg46))),
                  (~^$unsigned((+(8'hab))))});
            end
        end
      else
        begin
          reg41 <= reg34;
          reg42 <= reg20[(4'hc):(3'h6)];
        end
    end
  always
    @(posedge clk) begin
      reg48 <= {{reg42[(1'h1):(1'h0)],
              (($unsigned((8'haa)) <<< (reg18 ~^ wire28)) * ($signed(wire30) >>> $unsigned(wire37)))},
          reg39};
      reg49 <= (-(~&$unsigned(((reg43 && wire38) ?
          (wire3 ? reg35 : reg18) : $signed((8'hae))))));
      reg50 <= reg48;
      reg51 <= reg18[(3'h5):(2'h3)];
      reg52 <= reg50[(3'h4):(2'h2)];
    end
  module53 #() modinst68 (.wire58(wire27), .wire56(wire30), .wire55(reg52), .wire57(reg35), .y(wire67), .wire54(wire4), .clk(clk));
  assign wire69 = ((+(($unsigned(reg48) + $signed(wire1)) ^ wire16)) ?
                      (~((wire67 ? (+reg34) : wire1) ?
                          reg33 : ((^wire26) << (wire22 | wire37)))) : $unsigned(wire30[(3'h5):(3'h4)]));
endmodule

module module53
#(parameter param66 = (!((~|({(8'hb0), (8'hbe)} | ((8'ha3) ? (8'hb8) : (7'h44)))) ? ({((8'ha2) ? (8'h9e) : (8'hbe))} ? (~&(8'haa)) : (((8'hba) ^ (7'h41)) ? ((8'h9d) && (8'hac)) : {(8'ha0), (8'hb6)})) : {{((8'haf) ? (8'hb9) : (8'hb7))}})))
(y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire58;
  input wire [(5'h15):(1'h0)] wire57;
  input wire [(4'hf):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  assign y = {wire65, wire64, wire63, wire62, wire61, wire60, wire59, (1'h0)};
  assign wire59 = (8'hbf);
  assign wire60 = (~$unsigned(wire58[(2'h2):(1'h1)]));
  assign wire61 = $unsigned((|((|$unsigned(wire56)) || {((8'had) | wire54),
                      $unsigned(wire60)})));
  assign wire62 = {wire61[(3'h6):(3'h6)],
                      ((wire55[(2'h3):(2'h2)] >> $signed((8'h9e))) - (|{$signed(wire56)}))};
  assign wire63 = (&$signed(wire58));
  assign wire64 = wire60;
  assign wire65 = ({(($unsigned((8'ha7)) ?
                              (wire54 <<< wire62) : wire61) ^~ wire57),
                          {{$unsigned(wire64)}, $signed(((8'hab) * wire57))}} ?
                      wire57 : wire60);
endmodule

module module5
#(parameter param15 = ((8'ha4) >>> ((((!(8'hae)) ? (~|(8'ha7)) : {(7'h41), (8'hbc)}) | ((~^(7'h41)) || {(8'had)})) ^~ {(((8'haf) ? (7'h40) : (8'haf)) ? (!(8'ha0)) : ((8'hbb) ? (8'haa) : (8'ha7))), ((^~(8'hbb)) ? ((8'hb6) ~^ (7'h44)) : (^(8'ha4)))})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire14, wire13, wire12, reg11, reg10, (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ((&(((wire6 - wire7) ? wire6 : wire6) ?
          ($unsigned(wire7) ?
              $unsigned(wire8) : wire9) : ({wire7} & $signed(wire7)))) | ($unsigned({(wire7 ?
                  wire8 : wire7)}) ?
          $signed((~|$unsigned(wire6))) : ({((8'hbe) ? wire7 : wire6),
              ((8'haa) ^~ wire9)} ~^ $signed((wire6 ? wire7 : wire9)))));
      reg11 <= $unsigned(wire6);
    end
  assign wire12 = reg10;
  assign wire13 = (wire7 << $unsigned($signed((reg11 - (wire8 > wire6)))));
  assign wire14 = (wire6 ?
                      $signed($unsigned(reg10[(1'h0):(1'h0)])) : ({{(~&wire6)},
                          ({wire12} <= (reg11 ?
                              wire12 : wire6))} + ($signed($unsigned((8'h9d))) > wire8)));
endmodule

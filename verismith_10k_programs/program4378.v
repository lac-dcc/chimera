module top
#(parameter param69 = ((^~(({(8'haf), (8'hb6)} <<< ((8'h9d) << (7'h41))) ? (+{(8'hab)}) : ({(8'hb7), (8'hac)} ? ((8'ha9) | (8'ha4)) : ((8'h9d) ? (8'hbc) : (8'hb0))))) ^ (((((8'ha0) <= (8'h9f)) || (~^(8'ha7))) | ({(8'hbd), (8'hb5)} || ((8'hb1) * (7'h43)))) & (({(8'ha4), (8'hba)} ? ((8'hb2) + (7'h40)) : ((8'hb9) ^ (8'h9e))) ? ((~|(8'ha4)) > ((8'ha1) ? (7'h40) : (7'h41))) : {(~&(8'ha5)), ((7'h41) << (8'hb4))}))), 
parameter param70 = (~{{(-(param69 <= param69)), {(&param69)}}, (~^{(~&param69)})}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire37;
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire56,
                 wire45,
                 wire40,
                 wire39,
                 wire37,
                 reg68,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(wire1[(4'he):(3'h4)]));
      if ($unsigned({{$unsigned({reg5}),
              ($signed(wire4) - (wire0 ? wire1 : reg5))}}))
        begin
          reg6 <= (reg5 > (reg5 - $signed($signed((wire3 != (8'hbc))))));
        end
      else
        begin
          reg6 <= reg6[(1'h1):(1'h0)];
          reg7 <= $unsigned((~&(+wire2)));
          reg8 <= {($signed({(wire0 ?
                      wire0 : wire4)}) ^ ((^(reg5 - wire1)) - $signed(((8'haa) ~^ reg6))))};
        end
      reg9 <= (!reg7[(4'hd):(3'h5)]);
      reg10 <= $unsigned(((~&$signed(((8'ha9) > reg9))) > $signed(($signed(reg6) ~^ ((8'hae) * wire3)))));
      reg11 <= (wire0[(2'h3):(1'h1)] ?
          (($unsigned($signed((8'hab))) < (|wire4)) & $signed($signed((wire4 && wire1)))) : reg10[(5'h10):(2'h3)]);
    end
  module12 #() modinst38 (.wire14(wire2), .clk(clk), .wire13(reg6), .wire15(reg11), .y(wire37), .wire16(reg8));
  assign wire39 = reg6[(5'h10):(4'h9)];
  assign wire40 = (wire2 ?
                      (((wire39[(2'h3):(1'h1)] ?
                              (wire1 ? (7'h40) : wire4) : (wire0 | wire37)) ?
                          ($signed(reg9) ?
                              $signed(reg10) : (^~wire4)) : {(wire39 > reg6)}) == (reg10[(4'hb):(1'h0)] * (+reg11))) : (8'hbe));
  always
    @(posedge clk) begin
      reg41 <= $signed(wire40[(4'h8):(3'h6)]);
      reg42 <= $signed($signed({$signed((wire4 == wire4)), $unsigned(wire4)}));
      reg43 <= (wire1[(5'h12):(4'h8)] >= (reg10[(1'h1):(1'h1)] <<< wire3));
      reg44 <= (~^($signed(reg10) ~^ ((~|(&(8'h9f))) >= (&$unsigned(wire3)))));
    end
  assign wire45 = reg41;
  always
    @(posedge clk) begin
      reg46 <= $unsigned(($signed((reg6[(4'ha):(1'h1)] ?
          (wire45 ?
              wire40 : wire39) : $unsigned(reg8))) < $unsigned($signed(reg5[(2'h2):(2'h2)]))));
      if ($unsigned(reg7[(2'h3):(2'h3)]))
        begin
          reg47 <= ((($signed(reg43[(4'h8):(2'h2)]) ?
              ($unsigned((8'hb9)) - $unsigned(reg8)) : ((!(8'hb2)) ?
                  (~&wire2) : reg6)) == {(wire1[(4'h9):(3'h7)] ? wire40 : reg7),
              (wire45 | $signed(reg46))}) + $unsigned((~$unsigned(reg7))));
        end
      else
        begin
          reg47 <= reg43;
        end
      reg48 <= (|$signed($signed((^reg43[(4'h9):(2'h2)]))));
    end
  always
    @(posedge clk) begin
      reg49 <= {reg46, reg43[(4'hc):(4'ha)]};
      reg50 <= ($signed({reg44}) ?
          $unsigned(($signed((~|reg7)) ?
              reg11 : ($unsigned(reg43) ?
                  $signed(reg42) : reg47))) : $unsigned((&(((8'hb5) ?
                  reg47 : wire40) ?
              $signed((8'hb2)) : $unsigned(reg42)))));
      reg51 <= $signed(reg49[(3'h5):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg52 <= (-$unsigned((^~$unsigned((!reg41)))));
      reg53 <= (((8'hbb) - (+reg42)) <<< (reg9 ?
          (+((reg43 * wire3) < $signed(wire1))) : (|$unsigned($unsigned(reg47)))));
      reg54 <= $unsigned(wire39[(2'h3):(1'h1)]);
      reg55 <= ($signed((+$signed($signed(reg44)))) <<< $signed((^reg44)));
    end
  assign wire56 = ((~reg46) >>> reg43[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ({$unsigned((8'hbc)),
          $unsigned($signed($unsigned((reg8 ? wire2 : reg10))))})
        begin
          reg57 <= $signed((~^(($unsigned(reg6) + $unsigned(reg10)) ?
              wire1[(5'h10):(4'hc)] : wire1[(5'h15):(5'h12)])));
          reg58 <= ($unsigned((-reg41[(1'h1):(1'h1)])) ? (8'ha3) : (7'h40));
          reg59 <= ((reg43 ? reg48 : (~^(^~(|reg6)))) - reg54[(1'h1):(1'h1)]);
          if (reg10)
            begin
              reg60 <= $signed($unsigned(reg10[(3'h6):(1'h1)]));
              reg61 <= ((|$signed(((8'h9d) ?
                      (reg52 ^~ reg5) : wire3[(1'h1):(1'h1)]))) ?
                  (8'hbb) : ($unsigned((((8'h9d) ?
                      wire4 : (8'hbf)) == reg43[(1'h1):(1'h1)])) < {($signed(reg55) ?
                          (reg51 ? reg58 : reg51) : (|(8'hb6))),
                      ($signed((8'hbb)) * reg8[(5'h10):(3'h7)])}));
              reg62 <= $signed(($unsigned(((~^reg10) ?
                      $signed(reg55) : (reg47 ? reg6 : (8'hbe)))) ?
                  reg43[(2'h3):(1'h1)] : wire4));
              reg63 <= (^~((reg6[(5'h14):(4'hd)] + (wire45 ?
                  (wire3 >> (8'hb3)) : $unsigned(reg59))) <<< {$unsigned($signed(reg48))}));
              reg64 <= reg41;
            end
          else
            begin
              reg60 <= reg55[(5'h14):(5'h14)];
              reg61 <= reg60[(5'h10):(4'h8)];
              reg62 <= (+$unsigned((reg10 ?
                  ({reg5} ?
                      {reg54,
                          reg52} : reg57[(1'h0):(1'h0)]) : $unsigned((^~reg41)))));
              reg63 <= ((reg51 ^~ (!{wire2})) || $signed(reg62));
              reg64 <= ($signed((+(wire3[(2'h2):(1'h1)] ?
                  {(7'h42)} : (~^reg62)))) + $unsigned(wire39));
            end
        end
      else
        begin
          reg57 <= reg64[(4'hb):(3'h4)];
        end
      reg65 <= $unsigned($signed(reg44[(4'h8):(1'h0)]));
    end
  assign wire66 = $signed((($signed((^reg7)) >> (reg9[(4'h8):(3'h4)] ^ reg58[(2'h3):(2'h2)])) > reg42));
  assign wire67 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg68 <= (reg54 || (~&wire4));
    end
endmodule

module module12
#(parameter param36 = (~^((({(8'hab), (8'h9d)} ? ((8'hae) ^~ (8'haa)) : ((8'hbe) && (8'ha1))) <= (-((7'h42) ? (8'ha9) : (8'ha0)))) != ((((8'ha6) >>> (8'hbc)) ? ((8'ha0) ? (8'hb3) : (8'h9e)) : ((7'h40) ? (8'hbd) : (8'hb3))) << ((+(8'hba)) + (8'ha1))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = wire13;
  assign wire18 = $unsigned(($unsigned($unsigned((wire16 ?
                      wire14 : wire16))) < ($unsigned($signed(wire16)) ?
                      wire14 : wire13)));
  assign wire19 = $unsigned(wire15[(2'h2):(2'h2)]);
  assign wire20 = {(^~wire13),
                      (~&$signed($unsigned((wire14 ? wire14 : wire16))))};
  always
    @(posedge clk) begin
      reg21 <= ((|wire14[(1'h1):(1'h1)]) >>> wire16);
      reg22 <= reg21[(2'h3):(2'h2)];
      if (wire19[(4'h8):(3'h5)])
        begin
          reg23 <= (8'hb8);
          reg24 <= (~|{$signed(wire16)});
        end
      else
        begin
          reg23 <= $unsigned(wire18);
          reg24 <= $unsigned({((~^(reg21 ? reg23 : wire13)) ?
                  $signed(wire14) : wire19[(3'h5):(3'h5)]),
              $signed((&wire14))});
          reg25 <= (((reg24 - {(wire16 ? reg21 : reg24),
              (8'hab)}) ^~ $unsigned($unsigned({reg24,
              wire19}))) ^ ($unsigned({(+reg23)}) < {($unsigned((8'haa)) & (wire15 ?
                  wire17 : (8'hb0))),
              $unsigned(wire13[(3'h5):(1'h0)])}));
          reg26 <= (7'h43);
        end
    end
  assign wire27 = ((^$unsigned($signed(wire16[(4'hf):(3'h6)]))) >> $signed(wire15[(1'h0):(1'h0)]));
  assign wire28 = (8'ha2);
  assign wire29 = $unsigned(wire19);
  assign wire30 = $signed((wire19[(4'h8):(1'h1)] * $signed(((wire18 < wire17) ?
                      reg26[(4'ha):(1'h0)] : wire18[(3'h6):(2'h2)]))));
  assign wire31 = {$signed((~|$unsigned({reg21})))};
  assign wire32 = (($unsigned($signed(reg25[(4'ha):(4'ha)])) ?
                          reg21 : ($signed(((8'ha2) << (8'hb3))) || $unsigned(wire20[(3'h5):(3'h4)]))) ?
                      wire28[(4'hd):(4'h8)] : wire27[(4'he):(2'h3)]);
  assign wire33 = $unsigned($signed($unsigned($signed(reg23[(4'h9):(3'h4)]))));
  assign wire34 = wire16[(3'h6):(2'h2)];
  assign wire35 = (&wire29[(1'h1):(1'h0)]);
endmodule

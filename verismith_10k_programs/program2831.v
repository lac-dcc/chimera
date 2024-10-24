module top
#(parameter param47 = (|((((~^(8'hb5)) < (-(8'ha8))) ? (~|(^(8'haa))) : {{(8'hb5), (8'hb5)}}) ? ({((8'ha6) >>> (8'h9d))} ? ((&(8'hb0)) == ((8'hb3) ~^ (8'hb7))) : (&((7'h41) ? (8'hbb) : (8'hac)))) : (&(((8'hb7) ? (8'hb9) : (8'ha0)) >= ((8'ha3) >= (8'ha5)))))), 
parameter param48 = param47)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire21,
                 wire4,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire4 = $unsigned(((((+wire0) && wire0) == ($unsigned(wire3) ?
                         (|wire0) : wire0)) ?
                     (($signed(wire2) ?
                         wire2[(1'h0):(1'h0)] : (~^(8'ha6))) > (!$unsigned(wire2))) : (^((wire3 ?
                             wire2 : wire1) ?
                         (wire1 ? wire0 : wire2) : ((8'hb5) ?
                             wire0 : wire2)))));
  module5 #() modinst22 (.y(wire21), .wire7(wire1), .wire8(wire0), .wire6(wire3), .wire9(wire2), .clk(clk));
  assign wire23 = $signed((wire21[(5'h12):(4'h8)] & (wire0[(1'h1):(1'h0)] && (~((8'ha2) != wire0)))));
  assign wire24 = $signed(wire23[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg25 <= ({((~|wire2) ? wire3[(4'hd):(4'ha)] : (8'hac)),
          ((!$signed((8'hb8))) == (|(wire2 || (8'hb0))))} && $signed($unsigned(($unsigned(wire4) ?
          {(8'had), wire24} : $unsigned(wire3)))));
    end
  always
    @(posedge clk) begin
      reg26 <= (7'h42);
      reg27 <= $unsigned((wire3 ?
          (+({reg25, wire24} >>> (^wire1))) : (-(wire23[(2'h3):(1'h1)] ?
              reg25 : wire4))));
    end
  assign wire28 = reg26[(4'h8):(3'h6)];
  assign wire29 = ($signed($signed((~^$signed(reg25)))) + $signed((^(~|(~|wire4)))));
  assign wire30 = (~^((^~(8'hb5)) || wire23));
  always
    @(posedge clk) begin
      reg31 <= wire0;
      reg32 <= $signed($unsigned(($unsigned((&wire23)) ?
          reg31 : $signed($signed(wire2)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned(($signed($unsigned(reg25)) ?
          $unsigned(wire2[(1'h0):(1'h0)]) : (+(wire4[(3'h5):(1'h0)] ?
              (|reg31) : ((8'hb3) <= reg27))))))
        begin
          if (wire0[(2'h2):(1'h1)])
            begin
              reg33 <= (8'h9c);
              reg34 <= reg26;
              reg35 <= {(+{(reg26 ? (reg27 ? (8'hb2) : reg26) : {wire28})})};
            end
          else
            begin
              reg33 <= reg35;
              reg34 <= ((^~(!{wire3[(4'h8):(4'h8)], (-wire23)})) ?
                  reg31 : ((^~$signed(wire29)) ? reg31 : wire23));
              reg35 <= (reg27 ?
                  reg26 : {(wire1 >= (reg26[(3'h5):(1'h1)] - (-wire1)))});
              reg36 <= wire2;
              reg37 <= (8'hb9);
            end
          if ($unsigned((wire3 ^ (~^reg34))))
            begin
              reg38 <= $unsigned(wire1[(1'h0):(1'h0)]);
              reg39 <= (!$signed($unsigned(((~(8'hae)) ?
                  $unsigned((8'ha9)) : wire28[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg38 <= $signed((wire2[(4'hd):(3'h5)] && $signed($unsigned((^wire3)))));
              reg39 <= (8'h9d);
              reg40 <= {{(~|wire4[(5'h10):(3'h7)]), reg33[(3'h4):(3'h4)]},
                  reg35};
            end
          reg41 <= reg26[(1'h0):(1'h0)];
          reg42 <= {wire1[(1'h0):(1'h0)]};
          reg43 <= (reg33 ?
              {(((|reg32) < (wire0 ^ wire1)) & ($signed(reg26) ?
                      (reg33 == reg27) : $signed(wire1)))} : $signed({$unsigned({reg42}),
                  reg25}));
        end
      else
        begin
          if ($unsigned((^~($unsigned((reg37 ? wire29 : wire0)) ?
              (~|(reg32 ? (8'ha1) : reg37)) : reg25))))
            begin
              reg33 <= reg41;
              reg34 <= (|$signed(wire30));
            end
          else
            begin
              reg33 <= ((((+$unsigned(reg43)) == ($signed(reg31) >>> (&wire2))) < (~|wire0[(3'h4):(1'h1)])) ?
                  $unsigned($signed(((reg41 <= wire30) ?
                      (&reg42) : ((7'h40) ?
                          wire2 : wire24)))) : (($unsigned(reg40) <<< (&(reg32 ?
                          (8'ha8) : wire1))) ?
                      reg38 : (-((~^wire30) ~^ $unsigned(reg34)))));
            end
          reg35 <= {(~|((^~reg31) ?
                  (wire28[(2'h2):(1'h0)] - $unsigned(wire23)) : ($signed(wire28) ?
                      (-reg42) : (-(7'h43)))))};
          if (wire21[(5'h10):(2'h3)])
            begin
              reg36 <= {($signed($unsigned({reg31, reg25})) ?
                      (+reg34[(2'h2):(1'h1)]) : (^~$signed($unsigned((8'ha0))))),
                  $signed((wire3[(2'h2):(2'h2)] ?
                      (wire28 ?
                          (^wire28) : (reg37 ?
                              wire23 : reg36)) : {$unsigned(wire30)}))};
              reg37 <= ($signed((reg37[(1'h0):(1'h0)] ?
                      $unsigned((wire30 - reg25)) : {$unsigned((8'hab))})) ?
                  (^~wire0) : (8'had));
              reg38 <= $signed(reg43[(5'h10):(3'h5)]);
              reg39 <= ($signed((&wire3[(3'h6):(2'h2)])) ?
                  $unsigned(($signed(wire4[(2'h3):(2'h2)]) ?
                      $unsigned(wire28) : {(reg34 <<< reg27)})) : (^~((-{reg25}) >> (~|wire28))));
            end
          else
            begin
              reg36 <= reg42;
              reg37 <= wire28;
            end
        end
      reg44 <= $unsigned($unsigned((!$unsigned(wire1))));
      reg45 <= (8'h9e);
      reg46 <= $unsigned($signed((reg37 & $signed(reg43))));
    end
endmodule

module module5
#(parameter param19 = (~^((+(-((7'h40) ? (8'haf) : (8'hb5)))) >>> {((|(8'hbf)) ? (8'hb4) : ((8'ha6) + (8'haa))), (|((8'ha6) ? (8'hbb) : (8'h9d)))})), 
parameter param20 = param19)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 (1'h0)};
  assign wire10 = wire6;
  assign wire11 = (|$unsigned($unsigned(wire6[(1'h1):(1'h0)])));
  assign wire12 = $unsigned(wire6);
  assign wire13 = {$unsigned(wire10[(2'h3):(2'h2)]),
                      $signed(wire6[(1'h1):(1'h0)])};
  assign wire14 = (wire11 ? wire6[(1'h1):(1'h0)] : (!$signed(wire9)));
  assign wire15 = $signed({((wire8 ? $signed(wire6) : (wire9 >= wire6)) ?
                          (wire8 + (wire11 ^ (8'ha1))) : wire14),
                      wire10[(2'h3):(1'h1)]});
  assign wire16 = $signed(wire11);
  assign wire17 = {$unsigned((^wire7)),
                      (wire11 ? wire13[(2'h2):(1'h0)] : wire6)};
  assign wire18 = $signed(wire17[(1'h0):(1'h0)]);
endmodule

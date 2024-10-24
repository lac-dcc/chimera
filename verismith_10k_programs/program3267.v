module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire32,
                 wire31,
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
                 wire4,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
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
                 reg18,
                 reg17,
                 reg16,
                 reg13,
                 (1'h0)};
  assign wire4 = (-wire2[(1'h1):(1'h0)]);
  assign wire5 = (&(wire2 ?
                     $signed($signed($unsigned(wire2))) : $signed(((8'hb0) ^~ wire0[(3'h6):(3'h6)]))));
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = (^wire4);
  assign wire8 = wire6;
  assign wire9 = wire8[(3'h7):(2'h3)];
  assign wire10 = (8'hb9);
  assign wire11 = $unsigned((^wire9[(2'h2):(1'h0)]));
  assign wire12 = (~($unsigned($unsigned((wire11 ?
                      wire9 : wire7))) <<< $signed(((wire1 <<< wire3) <<< wire9[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg13 <= ((|(+$unsigned(wire3))) < (~&wire11[(4'hc):(4'h8)]));
    end
  assign wire14 = wire3;
  assign wire15 = (($unsigned({{wire7},
                          (wire11 ?
                              wire5 : wire14)}) >>> ($unsigned(wire5[(4'hb):(4'h8)]) == $signed($signed((8'ha5))))) ?
                      {$signed(((wire14 ? wire4 : wire8) || (wire4 ?
                              reg13 : (8'hab)))),
                          $unsigned(wire7[(3'h5):(2'h2)])} : (wire4[(4'hb):(4'ha)] <= $unsigned((+$signed((7'h41))))));
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire5);
      if ($signed(wire6))
        begin
          reg17 <= $signed($signed($signed(((wire5 ? wire9 : wire9) ?
              wire12 : $unsigned(wire0)))));
          reg18 <= (({{reg13},
              (&((8'hb3) ? wire7 : wire7))} == $signed($signed({wire8,
              wire10}))) == (~|$signed($unsigned({wire9, (7'h43)}))));
          reg19 <= wire4;
          reg20 <= ($signed({(^(reg13 != (8'h9f))), reg18[(1'h0):(1'h0)]}) ?
              wire2[(2'h3):(2'h2)] : wire2[(2'h2):(2'h2)]);
          reg21 <= ($unsigned($signed(($unsigned(reg17) ?
                  (wire12 ? wire6 : reg17) : (~wire9)))) ?
              wire1 : (+{wire9}));
        end
      else
        begin
          reg17 <= reg21;
        end
      reg22 <= (wire14[(3'h7):(3'h5)] ?
          (wire3 ~^ (reg18 ?
              (-$signed(wire7)) : $unsigned(reg16[(1'h0):(1'h0)]))) : ((&reg17) != $signed({(8'ha3),
              wire4})));
      if ((({(-$signed(wire5)),
              ((wire11 ? reg13 : reg16) ~^ reg19[(2'h2):(1'h1)])} ?
          {$signed((wire10 ?
                  wire14 : wire14))} : $unsigned((+(8'hb1)))) + $unsigned((+(~$unsigned(wire14))))))
        begin
          if ((~^($unsigned(wire5) ?
              ((reg19 ?
                  (reg22 ? reg20 : (8'ha1)) : wire10) < ((wire7 <<< (8'ha8)) ?
                  (8'hb1) : (+reg17))) : reg20)))
            begin
              reg23 <= $unsigned($signed(((&$unsigned(wire7)) ?
                  (^{wire2, reg16}) : wire3)));
            end
          else
            begin
              reg23 <= $signed(($unsigned({(wire15 | reg13),
                  ((8'ha5) ?
                      wire15 : wire8)}) >= $unsigned(reg19[(1'h0):(1'h0)])));
              reg24 <= reg13;
              reg25 <= $unsigned((-{(~^{wire3}), $signed((~|(8'ha0)))}));
              reg26 <= $signed(reg16);
            end
          reg27 <= (^((($signed(wire15) ^ (reg23 + reg26)) < $unsigned($unsigned(wire0))) ?
              wire12 : ((~$unsigned(reg24)) ?
                  reg24 : (|((8'hae) ? wire11 : wire4)))));
          reg28 <= $signed($unsigned($unsigned(((reg23 ? wire8 : wire15) ?
              $signed(wire4) : (&reg25)))));
        end
      else
        begin
          reg23 <= reg21;
          if ($signed((|(&{(reg27 ? reg13 : reg28), (8'ha4)}))))
            begin
              reg24 <= (+(+$unsigned(wire6[(4'h8):(1'h0)])));
              reg25 <= (~&reg26[(2'h3):(1'h0)]);
            end
          else
            begin
              reg24 <= reg22;
            end
          if (reg18)
            begin
              reg26 <= $unsigned(reg13[(1'h1):(1'h1)]);
              reg27 <= $signed({((^$unsigned(wire0)) ?
                      ((~&reg26) < wire8[(4'hc):(4'ha)]) : wire0),
                  $signed($signed({wire15}))});
              reg28 <= $signed($signed(({wire2} ?
                  wire7[(3'h4):(1'h0)] : reg23[(3'h4):(3'h4)])));
              reg29 <= ($signed(($unsigned($unsigned(wire12)) ?
                      reg13 : $signed({(8'had)}))) ?
                  {reg21} : (^(($unsigned(reg22) == $unsigned(wire10)) < (reg17 ?
                      (|wire5) : (!wire10)))));
              reg30 <= {($signed((^~$unsigned(reg24))) ?
                      {$signed($signed(wire10)),
                          $unsigned((wire0 ? wire1 : reg20))} : (&(~(+reg26)))),
                  $unsigned($unsigned((~{reg27})))};
            end
          else
            begin
              reg26 <= $signed((!{$signed($signed(wire2))}));
            end
        end
    end
  assign wire31 = wire12;
  assign wire32 = $signed($unsigned((($unsigned(reg27) > (|reg20)) ?
                      $unsigned((+reg13)) : ($signed((8'hbc)) >> (reg24 ?
                          (7'h43) : reg22)))));
  always
    @(posedge clk) begin
      reg33 <= (reg22 ? reg30 : {wire2});
      reg34 <= (($signed(wire14) ?
              reg28[(2'h3):(1'h0)] : (reg20 ?
                  $signed(reg29[(4'ha):(2'h3)]) : (~&{reg27, wire10}))) ?
          wire2 : (+($unsigned($signed((8'ha9))) == ((reg28 ?
              wire32 : (8'hb1)) ~^ (wire8 ? wire5 : (7'h43))))));
      reg35 <= $signed((^~reg33[(4'ha):(2'h2)]));
      reg36 <= reg26[(2'h2):(1'h0)];
      reg37 <= $unsigned(((wire7 & {{reg35}}) ?
          wire2[(3'h4):(3'h4)] : {wire3}));
    end
  assign wire38 = wire15;
  assign wire39 = reg29;
  assign wire40 = (wire2[(2'h3):(1'h0)] ?
                      (reg25 ?
                          wire4 : (^~wire15[(3'h5):(1'h1)])) : $signed(reg28));
  assign wire41 = wire7;
  assign wire42 = $unsigned({(reg27 - $unsigned(((8'ha2) ? reg13 : reg37)))});
  assign wire43 = (wire1[(1'h0):(1'h0)] | reg27);
endmodule

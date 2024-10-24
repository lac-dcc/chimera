module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = ($signed({$signed(wire1)}) ?
                     $unsigned(wire2[(1'h1):(1'h0)]) : {$signed(wire4[(2'h2):(1'h0)]),
                         $unsigned(((wire0 ? wire3 : (8'hb7)) ?
                             {wire0} : wire4[(4'hd):(3'h4)]))});
  assign wire6 = {($unsigned({(wire2 ? wire3 : wire3), wire4[(5'h12):(4'hf)]}) ?
                         (-wire5[(1'h1):(1'h0)]) : $signed(wire4[(4'he):(3'h4)]))};
  assign wire7 = $unsigned(wire5);
  assign wire8 = $unsigned((~^$unsigned($signed(wire2))));
  assign wire9 = (~^(|(wire5[(3'h4):(2'h3)] <<< (~^$unsigned(wire8)))));
  always
    @(posedge clk) begin
      if ($signed($signed(($unsigned(wire0) ?
          wire0[(2'h3):(1'h1)] : (^~wire0)))))
        begin
          reg10 <= ((~|wire6) ?
              {({wire0[(1'h0):(1'h0)], wire8[(2'h2):(2'h2)]} ?
                      (~|(|wire2)) : $unsigned({wire3, wire6})),
                  (+wire3)} : wire8[(2'h2):(1'h0)]);
          reg11 <= {{($unsigned((wire2 - wire3)) ?
                      (-{wire5}) : $signed((&(8'hb0)))),
                  wire8}};
          reg12 <= (|wire8);
        end
      else
        begin
          if ($unsigned(({(&(wire6 ? wire4 : (8'hb1))),
              $signed((!wire2))} != reg12)))
            begin
              reg10 <= $signed($signed((-wire4[(5'h13):(5'h12)])));
              reg11 <= wire6[(3'h4):(1'h1)];
              reg12 <= wire8[(2'h2):(1'h1)];
              reg13 <= (^(~(wire2[(2'h2):(1'h0)] ?
                  (((7'h44) <= (8'hb3)) & $unsigned(wire7)) : $signed(wire9[(4'hb):(3'h7)]))));
            end
          else
            begin
              reg10 <= wire3[(3'h5):(1'h1)];
              reg11 <= (8'hb5);
              reg12 <= (($signed($signed(reg13)) ~^ $unsigned($signed((wire1 >= wire8)))) <<< ({{$signed((7'h44))},
                      $signed((~^wire1))} ?
                  {wire7[(4'h9):(1'h1)]} : $signed((((8'ha1) * (8'hbf)) >> $signed(wire5)))));
              reg13 <= $signed((-(wire9 ?
                  $signed(wire0) : ((&reg10) ?
                      $signed(wire4) : {wire6, wire1}))));
              reg14 <= $unsigned(wire6[(1'h1):(1'h0)]);
            end
          reg15 <= {(~|({$unsigned(wire9)} | (^wire6)))};
          reg16 <= (!(!$signed((~^(7'h40)))));
          reg17 <= $unsigned((~|wire3));
        end
      if (wire9[(2'h3):(1'h0)])
        begin
          reg18 <= ($signed((8'hae)) <<< $unsigned((wire0[(1'h1):(1'h1)] ?
              ((wire6 << wire3) >= reg12[(3'h4):(2'h2)]) : ((reg14 >>> wire3) ?
                  (~^reg17) : {wire6}))));
          reg19 <= wire4;
          if (((+$signed(wire4[(5'h12):(4'hd)])) ?
              (^~(+{(reg16 - wire3),
                  reg11})) : (wire6[(1'h0):(1'h0)] - ((reg10 <<< wire9) ?
                  (~&$signed((8'hac))) : {wire9[(3'h6):(3'h6)]}))))
            begin
              reg20 <= ((!reg12[(2'h2):(1'h1)]) > reg17[(5'h10):(4'hf)]);
            end
          else
            begin
              reg20 <= wire9[(4'hc):(3'h7)];
            end
        end
      else
        begin
          reg18 <= (wire0 ?
              $signed((8'haf)) : ($signed($signed((~^reg14))) ?
                  (-(|reg10)) : ((~|{wire1, wire9}) + (reg13[(4'h9):(2'h3)] ?
                      (reg13 ? reg16 : wire6) : reg19[(3'h7):(2'h3)]))));
        end
      if ($unsigned($signed(((wire7[(4'h9):(4'h8)] >= (wire8 ~^ reg12)) ?
          reg15[(2'h3):(1'h1)] : (^(7'h41))))))
        begin
          reg21 <= $unsigned((~|{wire5, $signed($unsigned(wire6))}));
          reg22 <= reg18[(4'ha):(3'h6)];
        end
      else
        begin
          reg21 <= {($signed($signed($signed(reg13))) ?
                  reg14[(1'h1):(1'h0)] : $signed($unsigned($signed(reg20)))),
              (wire2 ? ($unsigned($signed((8'ha3))) << wire7) : reg21)};
        end
    end
  assign wire23 = ($signed($unsigned($unsigned(reg15[(1'h1):(1'h1)]))) >= wire2[(1'h0):(1'h0)]);
  assign wire24 = reg11[(5'h13):(2'h3)];
  assign wire25 = (~^(((~|(~^(8'hbb))) << (~^(8'ha8))) < wire6[(1'h1):(1'h1)]));
  assign wire26 = ($unsigned((((wire6 * wire5) ? reg11 : reg22[(3'h6):(3'h6)]) ?
                      wire0[(1'h1):(1'h1)] : $unsigned((reg10 ?
                          (8'haa) : wire1)))) ~^ ($unsigned(reg11) ^~ (((wire6 ?
                          (8'ha1) : reg19) & $unsigned(reg11)) ?
                      $unsigned((reg18 ? (8'ha9) : (8'h9d))) : (8'h9f))));
  assign wire27 = {$unsigned(((8'had) ?
                          (-(wire0 ?
                              (8'h9c) : reg17)) : $signed(wire26[(2'h3):(2'h2)])))};
  assign wire28 = (&wire1);
  assign wire29 = wire23;
  assign wire30 = reg18[(3'h7):(1'h1)];
  assign wire31 = ($unsigned((reg11[(5'h14):(4'he)] ?
                      ($unsigned(reg12) ~^ $unsigned((8'hb9))) : $signed(((8'ha7) ?
                          (7'h42) : reg13)))) | wire27[(4'hb):(3'h4)]);
endmodule

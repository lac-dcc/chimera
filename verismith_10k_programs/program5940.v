module top
#(parameter param29 = {(((|((8'hab) & (8'ha5))) | ((8'hbc) ? {(8'haf)} : (-(7'h42)))) ? ((((8'hbb) && (8'ha3)) - ((7'h43) || (8'hba))) ? (&(~|(8'ha2))) : (((8'ha4) ? (8'haa) : (8'ha0)) <= {(7'h44), (8'hb1)})) : (~(~^(8'hba))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg11 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire3[(4'h8):(1'h0)];
  assign wire5 = $signed((8'ha3));
  assign wire6 = $signed((^~(^$signed((~|wire2)))));
  assign wire7 = $unsigned(wire3[(2'h3):(2'h2)]);
  assign wire8 = $unsigned(($unsigned((!wire3[(1'h1):(1'h0)])) ^ ({$signed((8'hab))} ^~ (wire0 ?
                     $signed(wire4) : wire3))));
  assign wire9 = ($signed($signed(wire0)) ^~ $signed((^wire2[(3'h7):(3'h6)])));
  assign wire10 = $unsigned({{(wire4 ?
                              (wire6 >> wire8) : wire9[(4'hd):(1'h1)])},
                      $signed((wire6 >>> $signed(wire0)))});
  always
    @(posedge clk) begin
      reg11 <= ($unsigned($unsigned(wire6)) ?
          $unsigned(wire5) : $signed({$unsigned($unsigned((8'hac)))}));
      reg12 <= {($signed(wire10) ?
              $unsigned((^~wire4[(2'h2):(1'h0)])) : (wire9[(3'h6):(1'h0)] ?
                  (wire7[(3'h5):(2'h2)] ?
                      {wire5,
                          wire3} : (^wire1)) : $unsigned(wire1[(3'h4):(3'h4)]))),
          wire2};
      if (((&((^~wire2[(2'h3):(1'h0)]) + ($signed(wire3) * {reg11}))) ?
          {wire10, (~$unsigned({(8'haf), (8'hbf)}))} : wire6[(1'h1):(1'h1)]))
        begin
          reg13 <= reg12[(5'h12):(3'h4)];
          reg14 <= wire4;
          if (({(-wire4[(1'h0):(1'h0)])} ^ wire2[(4'h9):(4'h8)]))
            begin
              reg15 <= $unsigned($unsigned($signed(wire5)));
            end
          else
            begin
              reg15 <= wire5[(3'h7):(3'h4)];
              reg16 <= $unsigned({$unsigned((wire8 ?
                      $unsigned(wire6) : (~wire10))),
                  reg14[(3'h7):(1'h0)]});
            end
          if ((wire3 ?
              (8'hab) : ($unsigned((~reg14[(4'he):(4'hd)])) <<< $signed({(wire0 ?
                      wire8 : wire0),
                  (wire8 ? wire0 : wire7)}))))
            begin
              reg17 <= $unsigned((reg12[(5'h13):(1'h0)] ?
                  {$signed({wire5})} : (^~($signed(reg15) ?
                      $signed(wire4) : (wire1 ? reg12 : (8'hbf))))));
            end
          else
            begin
              reg17 <= (^~reg17[(4'hb):(3'h6)]);
              reg18 <= $signed($signed((~|$unsigned($signed(wire5)))));
              reg19 <= (reg18[(3'h5):(3'h4)] >> $signed((&$signed((+wire1)))));
              reg20 <= ($signed($signed($signed((+wire4)))) ?
                  ((-reg14) ^ {(|(wire1 ? reg12 : wire9)),
                      (8'hb8)}) : (!((&{(8'hae), reg13}) ?
                      (reg19[(3'h4):(2'h3)] >= {wire10}) : (|wire6[(2'h2):(1'h0)]))));
            end
          reg21 <= $unsigned(((^(~&(wire5 ?
              wire4 : wire2))) <= $signed((!(~wire8)))));
        end
      else
        begin
          reg13 <= (wire10[(3'h6):(1'h1)] ?
              wire5[(1'h1):(1'h1)] : ($unsigned(((~^wire6) ?
                  ((8'hb0) ? reg19 : reg20) : (reg15 ?
                      reg19 : (8'ha3)))) >> {$signed(wire10)}));
        end
      reg22 <= (($signed($unsigned($signed(reg21))) && (8'hbb)) ?
          ((wire7 >>> reg16) | $unsigned(((wire0 ^~ wire10) ?
              $signed(wire0) : (8'ha5)))) : (^~wire4));
    end
  assign wire23 = $unsigned((wire5[(2'h2):(1'h0)] ?
                      reg11[(2'h3):(2'h2)] : ($unsigned({wire10, wire3}) ?
                          {reg17,
                              (reg15 ?
                                  (8'hb8) : reg17)} : $unsigned(wire2[(1'h0):(1'h0)]))));
  assign wire24 = reg18;
  assign wire25 = $unsigned({(reg18[(4'hd):(3'h4)] ?
                          ($unsigned(wire4) - (~|(7'h43))) : (^$unsigned((8'h9c)))),
                      wire8});
  assign wire26 = ((8'ha6) ? reg12 : $signed(wire23));
  assign wire27 = reg21;
  assign wire28 = (~^$unsigned((wire9[(4'hc):(2'h3)] ?
                      (+((8'haa) ?
                          (8'ha9) : wire4)) : $signed($unsigned(wire4)))));
endmodule

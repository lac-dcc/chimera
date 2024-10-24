module top
#(parameter param34 = ((((((8'haf) ? (8'hb0) : (8'h9c)) << ((8'hbf) - (7'h41))) ? (+(!(8'hb5))) : (((8'ha3) ? (8'ha9) : (8'hae)) == ((8'h9f) ? (8'hb8) : (8'hb9)))) ^~ ({{(8'ha7), (8'hb3)}, {(8'ha4), (8'had)}} ? ({(8'ha5)} ~^ (+(8'haf))) : (((8'hb0) || (8'hbe)) & (8'ha9)))) && (&((7'h43) || ((8'hb4) || ((7'h42) ? (8'hba) : (8'h9f)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
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
  assign wire5 = ((|wire2) ?
                     ($signed((&(+wire3))) ?
                         {wire0} : wire0[(3'h4):(2'h2)]) : {(^~$unsigned($unsigned(wire1)))});
  assign wire6 = ((|$signed(wire4[(1'h1):(1'h0)])) - $unsigned(((~&wire5) ?
                     $signed($unsigned(wire4)) : wire2[(5'h10):(3'h6)])));
  assign wire7 = ($unsigned(wire6) >> {(&wire0[(3'h4):(1'h0)])});
  assign wire8 = wire1[(3'h7):(1'h1)];
  assign wire9 = (8'had);
  always
    @(posedge clk) begin
      reg10 <= {$unsigned(($unsigned($unsigned(wire8)) && (wire0[(1'h1):(1'h0)] >= {wire7}))),
          (wire0[(2'h2):(1'h0)] == ((^(wire2 || wire5)) ?
              (wire7 ? (8'h9d) : $signed(wire3)) : (8'haf)))};
      reg11 <= $unsigned($unsigned(wire5[(3'h6):(3'h5)]));
      if ((^$unsigned($signed(((wire9 && wire4) || (^~reg11))))))
        begin
          reg12 <= wire1[(3'h6):(2'h3)];
          reg13 <= (&($unsigned({wire4[(2'h3):(2'h2)]}) + wire2[(3'h7):(2'h2)]));
          reg14 <= $signed(($unsigned(wire0[(3'h4):(1'h1)]) ?
              $signed($signed((+reg13))) : wire0[(1'h0):(1'h0)]));
        end
      else
        begin
          reg12 <= (((reg11 ?
                      wire4[(2'h2):(2'h2)] : ((wire7 >>> (8'hb3)) ?
                          $signed(reg13) : (~wire6))) ?
                  $signed((8'hab)) : ((^~(wire5 & wire9)) ?
                      (wire9 ?
                          (wire4 ?
                              reg12 : reg14) : wire0) : $unsigned(reg14[(2'h2):(2'h2)]))) ?
              ({$signed($signed(wire4))} ~^ reg11) : (~&wire1));
          if ($signed(wire4[(1'h1):(1'h1)]))
            begin
              reg13 <= (({(-(wire4 ?
                      wire4 : wire1))} & reg14) <= wire2[(4'h8):(3'h5)]);
              reg14 <= $unsigned((~&wire3));
              reg15 <= reg10;
              reg16 <= ((-wire5) - ($signed(((8'haf) ?
                      $unsigned(reg13) : wire7[(4'hc):(2'h3)])) ?
                  $unsigned($signed(wire0[(1'h0):(1'h0)])) : $unsigned((reg15 ^ reg11[(3'h5):(2'h3)]))));
              reg17 <= wire8[(3'h7):(3'h4)];
            end
          else
            begin
              reg13 <= $unsigned((8'had));
            end
          if ((~^wire1))
            begin
              reg18 <= ($unsigned((-((wire0 ? reg15 : reg17) ?
                      wire1[(4'hc):(2'h2)] : $signed((8'ha0))))) ?
                  {reg10, wire7} : (reg15[(1'h1):(1'h1)] ?
                      {reg16,
                          wire2[(1'h0):(1'h0)]} : $unsigned($unsigned({wire4}))));
              reg19 <= ((!(~(7'h44))) ? {{(&$signed((8'had)))}} : reg17);
              reg20 <= (8'hb8);
            end
          else
            begin
              reg18 <= ((&((reg18[(1'h1):(1'h0)] || wire1) - wire5)) ?
                  {$signed((~|(reg11 ? reg16 : (8'ha3)))),
                      reg19} : (~|$signed($unsigned((reg18 ?
                      (8'ha6) : (8'hb7))))));
              reg19 <= wire1[(1'h1):(1'h0)];
            end
        end
      reg21 <= (($signed((8'hbe)) << $signed(((+(8'ha1)) ?
          (reg17 ? wire9 : wire3) : (reg15 ?
              wire1 : reg20)))) >> $signed((8'ha7)));
      reg22 <= (-wire6);
    end
  assign wire23 = {wire0[(2'h2):(2'h2)], (8'h9c)};
  assign wire24 = $unsigned((reg13 ?
                      $signed($unsigned((wire0 ?
                          wire2 : wire8))) : ((&$unsigned(wire6)) ?
                          $unsigned($unsigned(reg22)) : $signed(((8'haa) ?
                              wire0 : wire9)))));
  assign wire25 = (({$unsigned($unsigned(reg22))} | $signed($signed($signed(wire8)))) >>> reg17[(2'h2):(1'h0)]);
  assign wire26 = (8'hbd);
  assign wire27 = ($unsigned($signed((~^$signed(wire5)))) - $signed(reg10[(3'h6):(1'h0)]));
  assign wire28 = $signed((reg14[(3'h5):(3'h5)] < ($signed(wire25[(2'h2):(1'h1)]) ?
                      (wire26 != {wire26}) : {((8'hbe) && reg21)})));
  assign wire29 = ((&reg22[(4'ha):(2'h3)]) ^~ ((8'ha4) ^~ $signed($signed((wire9 ?
                      wire26 : wire7)))));
  assign wire30 = (!wire28);
  assign wire31 = ($unsigned($unsigned((8'ha9))) & wire4);
  assign wire32 = (~^(+($signed(wire26[(4'h9):(3'h6)]) ?
                      (wire23[(4'h9):(1'h1)] ?
                          $signed(wire23) : $unsigned(wire0)) : wire27)));
  assign wire33 = (^$signed((~|(wire23 ^ wire5))));
endmodule

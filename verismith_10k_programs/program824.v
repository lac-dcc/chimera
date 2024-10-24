module top
#(parameter param28 = (((^~((+(8'hbb)) ~^ ((8'hb9) ? (8'h9d) : (8'ha9)))) <<< ((((8'ha9) ? (8'ha4) : (8'ha0)) * ((8'hbf) ? (8'hab) : (8'hb8))) <= ((-(8'ha2)) ? {(8'hb6), (8'hba)} : ((8'had) * (7'h40))))) ? (^((((8'ha5) ? (8'hb6) : (8'hb6)) <<< {(8'hb6)}) && (((8'hbf) ? (8'ha0) : (8'hac)) ? (~^(8'ha5)) : ((8'haa) ? (8'hbd) : (8'ha5))))) : (-((((8'ha1) ? (8'ha8) : (7'h40)) ^ ((8'h9e) ? (8'hb5) : (8'hae))) ? (((8'ha6) <<< (8'hb5)) >>> ((7'h41) ? (7'h40) : (7'h43))) : (~&((8'hae) ? (8'hb7) : (8'ha1)))))), 
parameter param29 = {(^(&(+param28))), {param28}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire27,
                 wire16,
                 wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = wire4[(4'hb):(3'h5)];
  assign wire6 = wire5;
  assign wire7 = wire3;
  assign wire8 = ((({(wire1 - wire6)} ?
                         {wire1, {wire5, wire0}} : (8'hb6)) - wire0) ?
                     $unsigned($unsigned(wire0)) : $unsigned((~|(wire6[(4'ha):(4'h8)] & (wire6 ?
                         wire6 : (8'ha5))))));
  assign wire9 = $signed($unsigned(((wire0 * {wire3, wire8}) ?
                     $unsigned(((8'hb6) ?
                         wire7 : wire2)) : ($unsigned(wire8) <<< wire5))));
  assign wire10 = wire5[(3'h6):(3'h5)];
  assign wire11 = $signed(({$unsigned(wire1[(3'h5):(2'h2)])} ?
                      $unsigned($unsigned(((8'hb2) ^~ (8'hb1)))) : $signed(wire4)));
  always
    @(posedge clk) begin
      reg12 <= $unsigned($unsigned((&$unsigned((wire2 ? wire3 : (8'had))))));
      reg13 <= $unsigned($signed($signed({$signed(wire7)})));
      reg14 <= (!$unsigned(((~^(~|wire5)) ?
          $signed(wire3[(3'h4):(1'h0)]) : ((wire2 ? (7'h43) : wire3) ?
              (8'hbc) : (wire8 & reg13)))));
    end
  assign wire15 = $unsigned((&{$signed({wire5, wire0}), $unsigned(wire1)}));
  assign wire16 = {((^$signed((wire4 - reg12))) * reg12[(3'h4):(1'h1)])};
  always
    @(posedge clk) begin
      reg17 <= (wire5 > ($signed(wire3) ?
          (~^$unsigned(reg14[(2'h2):(2'h2)])) : wire0[(2'h3):(1'h1)]));
      reg18 <= $unsigned($unsigned(((+{wire8}) ?
          {wire10} : wire10[(4'hd):(2'h2)])));
      reg19 <= wire11[(3'h5):(2'h3)];
      if (wire6)
        begin
          if (($signed({$unsigned(wire16[(1'h0):(1'h0)])}) && wire15[(1'h1):(1'h0)]))
            begin
              reg20 <= (&$unsigned($signed($signed($unsigned(reg14)))));
              reg21 <= wire7;
              reg22 <= $unsigned({reg20[(3'h5):(2'h3)],
                  ((wire8 ? wire8[(3'h4):(1'h1)] : {wire6, wire2}) ?
                      $unsigned($signed((8'ha1))) : $signed({reg18}))});
              reg23 <= reg18;
              reg24 <= (~reg18[(4'h9):(3'h5)]);
            end
          else
            begin
              reg20 <= $signed((~^({wire11[(2'h2):(1'h0)]} && wire15[(4'h8):(1'h0)])));
              reg21 <= $unsigned((~&(~^$unsigned((wire9 ? wire16 : wire15)))));
              reg22 <= $unsigned(wire0[(3'h5):(1'h0)]);
            end
          reg25 <= $unsigned((wire4[(4'hc):(2'h2)] >>> $unsigned(reg14[(1'h1):(1'h1)])));
        end
      else
        begin
          if (($signed($signed(wire6[(1'h0):(1'h0)])) ^~ $unsigned({$unsigned(wire15),
              (8'hbd)})))
            begin
              reg20 <= (wire16[(1'h1):(1'h1)] && (!$signed(({wire8, reg12} ?
                  $signed((8'ha2)) : (reg18 ? reg19 : (8'ha8))))));
              reg21 <= {((reg23 != $unsigned($unsigned(reg14))) ?
                      $unsigned((reg13[(2'h2):(1'h1)] << (-(7'h44)))) : ((-reg14[(3'h6):(3'h5)]) ?
                          reg14[(4'h8):(3'h6)] : reg19[(2'h2):(1'h0)])),
                  $unsigned((&(((7'h41) ? (8'hb0) : wire9) ?
                      {reg24} : reg22)))};
              reg22 <= reg25[(3'h6):(3'h5)];
              reg23 <= $signed((wire6[(4'h9):(1'h0)] ?
                  ($signed($signed(wire3)) ?
                      (reg19[(2'h2):(2'h2)] >= (reg17 ?
                          reg25 : wire1)) : $signed($signed((8'ha4)))) : $unsigned($unsigned(wire15))));
            end
          else
            begin
              reg20 <= {{($unsigned(reg22) ?
                          ($unsigned(reg20) << (reg21 ?
                              wire4 : wire6)) : wire9),
                      $signed($signed((wire2 & wire10)))}};
            end
          reg24 <= $unsigned(reg21[(1'h0):(1'h0)]);
          reg25 <= ((($signed((^reg17)) + (!wire7)) - reg20[(1'h1):(1'h0)]) ?
              wire5[(3'h5):(3'h5)] : $unsigned((({reg20,
                  wire5} >>> (8'hba)) < $signed((reg14 ? wire4 : (8'hb5))))));
          reg26 <= (+((reg25[(3'h6):(2'h2)] ?
                  {reg20} : $signed({wire10, (8'hb3)})) ?
              {($signed(wire2) ? reg25 : reg22[(4'hd):(4'ha)])} : ((8'ha0) ?
                  (reg13[(2'h2):(1'h1)] ?
                      (&reg21) : wire7) : ((reg12 > wire16) - wire4))));
        end
    end
  assign wire27 = {wire7[(3'h4):(2'h2)],
                      (wire10 ?
                          $signed(wire3[(3'h4):(1'h0)]) : ($unsigned(((8'ha7) + wire0)) ?
                              reg14[(1'h0):(1'h0)] : $signed(wire11[(3'h6):(3'h6)])))};
endmodule

module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire62;
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire5,
                 wire62,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire5 = wire2;
  module6 #() modinst63 (wire62, clk, wire4, wire3, wire2, wire0, wire5);
  assign wire64 = wire4;
  assign wire65 = wire5;
  assign wire66 = (~&(wire65[(4'hb):(4'h9)] ?
                      ((&((8'hac) <= wire62)) << wire1) : (8'hb6)));
  assign wire67 = (wire2[(3'h5):(2'h3)] ?
                      wire3[(3'h7):(1'h0)] : wire4[(2'h2):(1'h1)]);
  assign wire68 = (($signed((((8'h9f) < wire0) >>> wire64)) ?
                      wire4 : (~&((wire66 ? wire64 : wire67) ?
                          wire64[(5'h11):(4'he)] : (-(7'h42))))) == (8'ha0));
  assign wire69 = $signed($unsigned($unsigned((wire4[(4'h9):(2'h2)] ?
                      $unsigned(wire66) : ((8'hb0) >= wire5)))));
  assign wire70 = $signed(((wire66[(2'h2):(1'h1)] ?
                      wire5[(3'h5):(1'h1)] : wire2[(3'h7):(2'h3)]) >> (($signed(wire4) ?
                      wire62 : (wire64 >= wire68)) <= ($signed(wire2) ^~ wire5))));
  assign wire71 = $signed($unsigned($unsigned(((wire62 >>> wire66) == (wire62 ?
                      wire69 : wire70)))));
  assign wire72 = $signed(($unsigned({wire0[(3'h4):(1'h0)], $signed((7'h41))}) ?
                      ((-$signed(wire64)) ?
                          wire66[(4'h8):(2'h3)] : wire70[(1'h1):(1'h0)]) : wire62[(3'h7):(1'h0)]));
  assign wire73 = wire70[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg74 <= (|(((~^wire62[(3'h5):(2'h3)]) ? wire71 : $signed(wire62)) ?
          (^($unsigned(wire66) & {wire65})) : (&wire1)));
      reg75 <= (8'hbb);
      reg76 <= {wire64};
      if (wire3)
        begin
          reg77 <= (~&(({{(8'h9e), (8'ha1)}, {wire71}} ?
              (|(~^(8'hb6))) : $unsigned(wire64[(3'h4):(2'h3)])) < (~|(~&$unsigned(wire3)))));
          reg78 <= wire1;
        end
      else
        begin
          reg77 <= $signed(reg76[(4'hd):(1'h1)]);
        end
      reg79 <= $unsigned(((7'h42) & $unsigned((~^$signed(wire0)))));
    end
  assign wire80 = $signed({{$signed((|wire4))},
                      ((|((8'had) ^~ wire66)) ?
                          ((wire2 ^~ reg76) ^ $signed(wire65)) : (8'ha9))});
  assign wire81 = wire65[(1'h1):(1'h1)];
  assign wire82 = (8'hbc);
endmodule

module module6
#(parameter param60 = ({(8'h9c), (+(&(~|(8'h9f))))} | (|((~&((7'h40) ^~ (7'h42))) ? (((8'h9c) ? (8'hb8) : (8'ha8)) == (8'hb8)) : (~^(8'had))))), 
parameter param61 = (((((param60 ? (8'hb5) : param60) & (&param60)) >= (^(|param60))) ? param60 : ((~&(param60 < param60)) ? (+param60) : param60)) > ((((param60 ? param60 : param60) ? {param60, param60} : param60) & ((param60 ? param60 : param60) != (-param60))) ? ((~|(param60 ? param60 : param60)) ? (~|param60) : ((param60 == param60) ? (param60 ? (7'h43) : param60) : param60)) : {(((8'haa) | param60) ? {param60, param60} : {param60})})))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  assign y = {wire59,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire13,
                 wire12,
                 reg58,
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
                 (1'h0)};
  assign wire12 = wire7[(1'h0):(1'h0)];
  assign wire13 = (~^wire9);
  module14 #() modinst41 (.clk(clk), .y(wire40), .wire15(wire9), .wire16(wire12), .wire17(wire10), .wire18(wire7));
  assign wire42 = (!wire13);
  assign wire43 = (^(+(wire12 >= ($signed(wire13) && $signed(wire10)))));
  assign wire44 = $signed((^wire9[(4'hb):(3'h5)]));
  assign wire45 = $unsigned((wire9[(3'h5):(2'h2)] << $signed(wire13)));
  always
    @(posedge clk) begin
      reg46 <= $signed((wire44 != wire10[(4'h8):(3'h5)]));
      reg47 <= $unsigned(reg46);
      reg48 <= ((~(^wire45[(1'h1):(1'h1)])) >= $signed($signed(wire40[(4'h8):(4'h8)])));
      reg49 <= wire45;
      if (wire11)
        begin
          reg50 <= $unsigned($unsigned((($signed(wire8) ^ reg48) ?
              (wire9[(4'h8):(3'h6)] == wire45) : reg47)));
          reg51 <= (reg46[(4'hb):(4'hb)] + wire12[(2'h2):(2'h2)]);
          if ($unsigned(reg49))
            begin
              reg52 <= (~|(($unsigned($unsigned(wire9)) ?
                  reg49 : $unsigned(reg50[(3'h4):(1'h1)])) && $unsigned($signed({reg51}))));
              reg53 <= $unsigned($signed($signed($signed((wire45 ?
                  wire43 : wire42)))));
            end
          else
            begin
              reg52 <= reg48;
              reg53 <= (-wire43[(1'h0):(1'h0)]);
              reg54 <= reg50;
              reg55 <= $unsigned($signed(reg48));
              reg56 <= reg52[(3'h6):(3'h5)];
            end
          reg57 <= $unsigned($unsigned({({reg53} ^ (8'haf))}));
          reg58 <= (+reg57);
        end
      else
        begin
          reg50 <= $signed((reg49 | (~|(reg50[(4'hf):(4'hc)] >> $unsigned(reg56)))));
          if (((+$unsigned((!(reg54 | reg57)))) >>> (reg51 == (^{$signed(wire42)}))))
            begin
              reg51 <= (wire11[(3'h6):(3'h5)] ?
                  wire45 : {$unsigned(((~|(8'ha0)) > $unsigned(wire7))),
                      (($unsigned(reg51) ?
                          (wire43 ?
                              reg48 : wire9) : (reg48 ^ reg55)) <<< wire11)});
              reg52 <= wire8;
              reg53 <= reg55;
              reg54 <= wire10[(2'h3):(1'h0)];
            end
          else
            begin
              reg51 <= ((~^($signed(((7'h42) ?
                      wire7 : (7'h43))) ~^ ($unsigned(reg53) ?
                      (~^wire9) : (+reg57)))) ?
                  $signed($unsigned(wire45)) : wire40[(3'h5):(3'h4)]);
              reg52 <= $signed($signed($signed((7'h41))));
              reg53 <= $unsigned($unsigned(reg49));
            end
        end
    end
  assign wire59 = wire8;
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg32,
                 reg31,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= $unsigned(($unsigned(((wire15 ? (7'h44) : wire18) ?
          $unsigned((8'hac)) : wire18[(2'h2):(2'h2)])) ^ {((wire15 && wire16) ?
              $unsigned(wire18) : ((8'ha3) ? wire15 : wire18)),
          $unsigned(wire15[(3'h6):(3'h6)])}));
      reg20 <= (|(^~reg19));
      if ((((^~(((7'h40) >= (8'hb3)) ? reg20[(2'h2):(1'h0)] : {wire17})) ?
              (((reg19 ? (8'h9e) : (8'hb4)) ?
                      (+reg19) : ((8'hb0) ? wire18 : wire16)) ?
                  ((reg19 >= reg20) >> (-reg19)) : ($signed(reg20) == (reg19 ?
                      wire15 : wire17))) : (~|wire15)) ?
          {wire18,
              ((~&(wire16 ~^ (8'hba))) ?
                  wire15[(3'h6):(1'h1)] : (!(~&reg19)))} : reg20))
        begin
          if ((((&$signed((~&wire15))) ^~ $unsigned(((-wire17) ?
                  reg19 : wire15[(4'h9):(2'h2)]))) ?
              wire17 : $signed((~$unsigned(wire18[(1'h1):(1'h1)])))))
            begin
              reg21 <= {$unsigned(({(wire15 ? (7'h41) : wire17), (8'h9f)} ?
                      wire16[(2'h2):(2'h2)] : wire16)),
                  ({$signed((wire18 || reg20))} ?
                      ((wire18 == $unsigned(reg19)) == (~^$signed(reg20))) : {wire17[(3'h6):(2'h2)]})};
              reg22 <= $unsigned(($signed(wire15) <<< $unsigned(reg20[(2'h2):(1'h1)])));
              reg23 <= wire15;
            end
          else
            begin
              reg21 <= ({(|(reg23[(2'h2):(1'h1)] ?
                      (8'hb8) : (^(8'ha8))))} >> reg21);
              reg22 <= $signed(($signed(((reg23 >>> reg19) ?
                  ((8'hac) ?
                      wire17 : reg21) : (+reg20))) - ((((8'ha6) - wire17) ?
                  (reg23 ? reg22 : reg19) : {reg20}) <= {$signed((8'hbb))})));
              reg23 <= {$unsigned((8'ha4)), reg23};
              reg24 <= ((+$unsigned(((reg23 ? reg20 : reg19) ?
                  (reg19 <= reg19) : reg22[(3'h6):(3'h5)]))) >> reg19[(4'ha):(3'h6)]);
            end
          reg25 <= reg22;
          reg26 <= reg20;
        end
      else
        begin
          reg21 <= reg19[(4'h8):(1'h0)];
        end
      if (reg26)
        begin
          reg27 <= reg22;
          reg28 <= $unsigned(reg26[(1'h0):(1'h0)]);
          if ($signed(reg23))
            begin
              reg29 <= $signed(({reg23[(1'h0):(1'h0)]} < $signed(wire18[(3'h7):(2'h2)])));
              reg30 <= {($signed(((wire17 ? reg25 : reg24) ?
                          (&reg25) : (~&reg25))) ?
                      ($signed(reg22[(5'h11):(3'h7)]) ?
                          $signed((reg28 ? reg28 : reg19)) : $signed((reg26 ?
                              (8'hb3) : reg24))) : (^~(8'h9e)))};
              reg31 <= reg27[(2'h2):(1'h1)];
              reg32 <= (8'ha4);
            end
          else
            begin
              reg29 <= ((reg29[(3'h5):(1'h1)] < ($signed(reg27[(2'h2):(2'h2)]) <= $signed((8'hb6)))) ?
                  (reg27 << reg30) : ($unsigned(wire15[(3'h5):(2'h2)]) ?
                      reg30 : ((reg27 << (-reg31)) - {$signed((8'ha3))})));
              reg30 <= (reg22 ^ $unsigned(reg28));
              reg31 <= ($unsigned(reg24[(4'h8):(3'h7)]) ~^ ($unsigned((~|(wire16 || reg22))) ?
                  $unsigned(reg19) : reg27[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          reg27 <= reg23;
        end
    end
  assign wire33 = reg20;
  assign wire34 = $unsigned((^reg26[(3'h5):(3'h4)]));
  assign wire35 = reg30[(3'h4):(1'h1)];
  assign wire36 = $unsigned(reg26[(4'h8):(3'h5)]);
  assign wire37 = reg19[(4'h9):(1'h0)];
  assign wire38 = reg25;
  assign wire39 = $unsigned($signed({((wire34 ?
                          wire37 : reg19) != (wire33 ^~ wire34)),
                      ((~(8'ha5)) ? (|wire35) : $unsigned(reg26))}));
endmodule

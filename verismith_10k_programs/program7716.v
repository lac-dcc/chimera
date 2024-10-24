module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire37;
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire5,
                 wire6,
                 wire7,
                 wire37,
                 (1'h0)};
  assign wire5 = (8'ha3);
  assign wire6 = {$signed(($signed((~wire0)) ?
                         wire0 : {(wire0 == (8'ha9)), $signed(wire3)}))};
  assign wire7 = $unsigned(({($unsigned(wire1) ?
                             wire3 : ((7'h43) ? wire0 : wire2)),
                         ($unsigned(wire2) ?
                             $signed(wire4) : $unsigned(wire5))} ?
                     wire6[(2'h2):(1'h0)] : $unsigned(((wire1 && wire0) ?
                         wire1[(1'h1):(1'h0)] : $unsigned(wire1)))));
  module8 #() modinst38 (.wire10(wire0), .clk(clk), .wire11(wire7), .wire13(wire6), .y(wire37), .wire9(wire4), .wire12(wire3));
  assign wire39 = $signed(wire5);
  assign wire40 = ({(~(~wire39)), (-$signed($signed((8'hb2))))} ?
                      $signed($signed((7'h41))) : wire6[(1'h0):(1'h0)]);
  assign wire41 = {{wire39[(2'h3):(1'h0)]}, wire0};
  assign wire42 = {wire1, wire2};
  assign wire43 = wire6[(3'h7):(2'h3)];
  assign wire44 = ((~^$signed(wire4[(1'h1):(1'h0)])) ?
                      $unsigned(($unsigned($unsigned((8'ha2))) ?
                          $unsigned($unsigned(wire7)) : ($unsigned(wire6) || $unsigned(wire1)))) : (wire6 ?
                          {$unsigned(wire39),
                              wire1[(2'h2):(1'h1)]} : (((wire37 ?
                                  (8'ha6) : wire6) >>> (wire4 ?
                                  wire0 : wire39)) ?
                              {{(8'hb6)}} : wire42)));
endmodule

module module8
#(parameter param35 = ((({(^(8'hb3))} < (|((8'hb2) ? (8'h9d) : (7'h42)))) ^ ((~|{(7'h44)}) > ((~^(8'hbd)) ? ((8'ha5) << (7'h40)) : ((8'hb4) + (7'h40))))) << {(!(~(8'ha0))), (({(8'hbd)} - {(8'ha1), (8'hb8)}) == (((8'hbb) - (8'hb1)) >> (&(8'hb2))))}), 
parameter param36 = ({(8'hb9), {{param35}, ((param35 ? param35 : param35) >> (param35 ? param35 : param35))}} - ((~|(-(~^param35))) & (((~|(8'hb9)) < {param35, param35}) ? ((^~param35) ? param35 : ((8'haf) < param35)) : param35))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire14;
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire34,
                 wire33,
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
                 wire15,
                 wire14,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire14 = wire11[(2'h2):(2'h2)];
  assign wire15 = (wire13 && $unsigned((&$signed((|wire14)))));
  always
    @(posedge clk) begin
      reg16 <= (8'hba);
      reg17 <= ((^~($unsigned({(8'hb6), wire15}) ?
              wire11 : {(^~(8'hb7)), $unsigned(wire14)})) ?
          ($unsigned(wire12[(4'h8):(3'h4)]) << {$unsigned({reg16,
                  wire11})}) : wire12[(4'hf):(4'ha)]);
      if ({({wire14[(2'h2):(1'h1)],
                  (wire13[(3'h7):(2'h2)] <= (wire15 ? wire10 : wire10))} ?
              ((+$unsigned((8'hbd))) <= wire13[(3'h4):(1'h1)]) : $unsigned($unsigned(reg16)))})
        begin
          reg18 <= wire12[(1'h1):(1'h0)];
          reg19 <= {($signed(((~&reg17) ? (!wire10) : (wire10 >>> wire12))) ?
                  (((^wire13) ? {reg16} : (wire11 >>> wire15)) ?
                      wire12[(2'h3):(2'h3)] : (&{wire15})) : (reg16 ^ $signed({(8'ha0),
                      wire13})))};
          if (reg16[(1'h1):(1'h1)])
            begin
              reg20 <= $signed($unsigned({$signed($unsigned(reg18)), reg18}));
              reg21 <= (^~$signed(($unsigned(wire14[(3'h7):(1'h1)]) || $unsigned(wire15))));
            end
          else
            begin
              reg20 <= {(wire13[(3'h6):(3'h6)] ?
                      $signed({$signed((8'haa))}) : $unsigned((reg19 != (wire10 && wire11))))};
              reg21 <= (reg17 != $signed((+$unsigned($signed(reg19)))));
            end
        end
      else
        begin
          reg18 <= ((8'ha3) ?
              ({$unsigned($signed(reg20))} != ((+wire13) ?
                  wire15[(3'h6):(1'h0)] : wire12)) : wire14[(3'h6):(3'h6)]);
          reg19 <= $signed(wire9);
          if ($signed(((~&$signed((wire13 >>> reg17))) ?
              (($unsigned(wire14) ?
                  (-(8'ha3)) : $signed(wire15)) * $signed((reg21 ^~ wire10))) : $unsigned($signed((!wire14))))))
            begin
              reg20 <= $signed(wire10[(3'h4):(1'h1)]);
            end
          else
            begin
              reg20 <= (wire11[(3'h4):(2'h2)] << {(!reg19)});
              reg21 <= $unsigned(wire12);
            end
          reg22 <= $unsigned(wire9[(4'ha):(4'h8)]);
        end
    end
  assign wire23 = ($signed($unsigned(reg20[(4'hb):(2'h3)])) ?
                      ($unsigned(wire15[(3'h5):(2'h2)]) ?
                          (8'had) : $unsigned({reg22})) : {$signed($signed($signed(wire11)))});
  assign wire24 = $signed(({((+wire12) >>> reg18[(3'h7):(3'h4)]),
                      (wire9[(3'h7):(3'h6)] ^ (-wire10))} ^ $signed(reg22)));
  assign wire25 = $unsigned(reg20);
  assign wire26 = ((($signed((wire13 ?
                              wire13 : reg20)) & $unsigned((wire9 ^~ reg21))) ?
                          $unsigned((^~(wire23 > wire13))) : (|(~^(|reg16)))) ?
                      wire10[(5'h12):(3'h6)] : $unsigned((wire9 ?
                          $unsigned(wire13) : (&$signed(wire9)))));
  assign wire27 = (wire15 ?
                      {((8'hb7) ?
                              {reg18,
                                  reg17[(1'h0):(1'h0)]} : $unsigned((wire11 ?
                                  (8'hb4) : (8'h9f)))),
                          reg18} : reg19);
  assign wire28 = wire11[(1'h0):(1'h0)];
  assign wire29 = wire28;
  assign wire30 = (($unsigned((!(!wire9))) >> $signed(wire27)) ?
                      {(((reg21 ? wire23 : wire26) ^~ (+reg22)) ?
                              (reg16[(3'h4):(2'h3)] ?
                                  $unsigned(reg21) : (reg20 > wire9)) : wire23)} : $unsigned(reg17[(4'ha):(1'h0)]));
  assign wire31 = {$unsigned((~|$unsigned($unsigned((8'hb1)))))};
  assign wire32 = (~wire9);
  assign wire33 = $unsigned($signed($signed(wire9)));
  assign wire34 = reg20[(1'h0):(1'h0)];
endmodule

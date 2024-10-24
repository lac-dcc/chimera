module top
#(parameter param50 = (({(((8'hb6) ? (8'hbd) : (8'ha1)) * (7'h40)), ((~^(8'hbc)) >= {(8'hb1)})} ? (8'ha3) : ((8'haa) ? ({(8'ha8)} ? (~(8'ha0)) : ((8'hae) ? (8'ha3) : (7'h44))) : ({(8'hb5), (8'hb9)} ? ((8'ha0) <= (8'hbc)) : {(8'hb3)}))) ? (((8'hba) == ((~^(8'ha4)) && ((8'h9e) > (8'hbe)))) | (~|((!(7'h44)) ? {(8'ha1)} : (7'h44)))) : (((((8'ha9) ? (7'h44) : (7'h43)) - {(8'hbc), (8'ha0)}) ? (((7'h40) ? (8'ha3) : (7'h41)) >= (8'hab)) : {(~^(8'hbe))}) ? (7'h40) : ((((7'h41) * (8'hb5)) & ((8'ha4) != (8'h9d))) | (((8'ha1) ? (8'hac) : (8'hb4)) >> ((8'ha5) || (7'h42)))))), 
parameter param51 = (&param50))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  assign y = {wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 wire6,
                 wire5,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg38,
                 (1'h0)};
  assign wire5 = (+(~^(wire4 ?
                     $unsigned((^wire2)) : (wire2[(2'h3):(2'h2)] ?
                         $unsigned(wire1) : $unsigned(wire0)))));
  assign wire6 = wire2[(2'h2):(1'h0)];
  module7 #() modinst32 (wire31, clk, wire6, wire5, wire0, wire1);
  assign wire33 = $unsigned((~$unsigned(wire0[(4'hc):(2'h2)])));
  assign wire34 = {(~&wire3[(1'h1):(1'h1)])};
  assign wire35 = ((wire33[(3'h7):(3'h6)] ~^ ((~|(wire34 ?
                      wire0 : (8'hbd))) ^ (~&(8'h9e)))) <<< (+(wire0[(4'hf):(3'h5)] == $signed($signed(wire33)))));
  assign wire36 = ($signed((8'ha0)) ?
                      {(~&wire5)} : $signed((({wire34,
                          wire4} ~^ {wire2}) ^ wire3[(1'h0):(1'h0)])));
  assign wire37 = (-{wire5, wire36});
  always
    @(posedge clk) begin
      reg38 <= $signed($signed($signed($signed(wire6[(3'h6):(1'h1)]))));
    end
  assign wire39 = ((-{wire37}) ? wire34[(3'h5):(3'h4)] : {wire35});
  assign wire40 = $unsigned((~|wire34[(2'h2):(1'h0)]));
  assign wire41 = wire34;
  always
    @(posedge clk) begin
      reg42 <= $unsigned({wire35[(4'h9):(3'h7)],
          (^(wire35[(1'h0):(1'h0)] ?
              (wire34 == wire6) : wire1[(5'h15):(3'h6)]))});
    end
  assign wire43 = ($signed(wire39[(4'ha):(3'h7)]) ?
                      $signed((+{(+wire1)})) : (($unsigned((wire34 ?
                              wire1 : (8'h9e))) + {wire33}) ?
                          ($unsigned($signed(wire37)) ^~ wire41[(1'h1):(1'h1)]) : wire37));
  always
    @(posedge clk) begin
      reg44 <= ({wire31, wire31[(1'h0):(1'h0)]} ?
          wire0 : wire41[(4'h8):(3'h4)]);
      if (wire0[(2'h3):(2'h3)])
        begin
          if ($unsigned(reg44))
            begin
              reg45 <= $signed($signed(wire6[(1'h0):(1'h0)]));
              reg46 <= $signed($signed(((8'hb4) ?
                  $signed((~^reg45)) : $unsigned(((8'hbe) << wire2)))));
              reg47 <= (~^(wire3[(2'h3):(2'h3)] - (^~(~&$signed(wire41)))));
            end
          else
            begin
              reg45 <= ((8'ha9) != $unsigned($signed((^~$unsigned(wire40)))));
              reg46 <= wire39;
              reg47 <= wire6;
            end
          reg48 <= (~$unsigned((8'hb4)));
        end
      else
        begin
          reg45 <= ({{(reg45 ~^ wire34[(1'h1):(1'h1)])}, wire6} ?
              wire37[(4'hd):(4'ha)] : ((reg47 ?
                      (~^reg46) : $signed($unsigned(wire36))) ?
                  wire4[(1'h1):(1'h1)] : $signed(wire3)));
        end
    end
  always
    @(posedge clk) begin
      reg49 <= ($unsigned(wire4) & $signed($unsigned($unsigned($unsigned(wire3)))));
    end
endmodule

module module7
#(parameter param30 = {(~((&((8'hb2) >> (8'hb8))) ^~ ((~(8'ha9)) >>> {(8'hbc), (8'ha1)})))})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire12;
  assign y = {wire29, wire28, wire27, wire26, wire24, wire12, (1'h0)};
  assign wire12 = wire9[(4'h9):(3'h4)];
  module13 #() modinst25 (.y(wire24), .wire14(wire12), .wire17(wire8), .wire15(wire11), .clk(clk), .wire16(wire10));
  assign wire26 = wire9;
  assign wire27 = (wire8[(4'hc):(3'h6)] ?
                      (wire12[(1'h1):(1'h0)] ?
                          wire24 : $unsigned((8'haf))) : {$signed(((&wire8) ?
                              {wire9, wire26} : $unsigned(wire11)))});
  assign wire28 = (!$unsigned((wire9 | $signed((~(8'ha9))))));
  assign wire29 = (wire27 ?
                      $unsigned(((((8'hab) ? wire24 : wire10) || (+wire12)) ?
                          wire28[(4'h8):(4'h8)] : (wire24 == wire24[(3'h6):(2'h3)]))) : (~|((&(8'hb4)) & (^~$unsigned(wire26)))));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  assign y = {wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = ($unsigned(((!wire15) <<< {$signed(wire15)})) >>> {$unsigned(wire16[(4'h8):(3'h5)])});
  assign wire19 = {$unsigned(($signed((wire14 ? (8'hb0) : wire16)) ?
                          wire14 : (~&((8'hae) ? (8'ha7) : wire17))))};
  assign wire20 = (~|wire16[(1'h1):(1'h0)]);
  assign wire21 = wire17[(5'h11):(1'h1)];
  assign wire22 = (|$unsigned(wire14[(4'ha):(2'h3)]));
  assign wire23 = $unsigned((($unsigned($unsigned(wire21)) == $unsigned(((8'hbd) ?
                      wire21 : wire16))) >>> (!wire17)));
endmodule

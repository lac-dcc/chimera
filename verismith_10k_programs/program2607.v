module top
#(parameter param55 = (~&(((((8'hb3) ? (7'h42) : (8'haf)) * {(8'hae)}) & ({(8'haa), (8'hab)} ? {(8'ha8)} : ((8'hb2) ? (8'ha9) : (7'h43)))) ? ((((8'hb9) <<< (8'haf)) > ((8'hbc) ? (8'ha8) : (7'h40))) ? (+((8'ha6) || (8'hae))) : (((8'hbc) ? (8'hba) : (8'ha8)) + ((8'ha5) || (8'ha7)))) : (((~(7'h41)) - (|(8'hb2))) ? (((8'ha0) ? (8'hae) : (8'hb8)) ? ((8'ha0) < (8'haf)) : ((8'hb3) <= (7'h43))) : {(^(8'hbf)), ((8'ha3) ? (8'ha4) : (8'ha9))}))), 
parameter param56 = {(!(&({param55, (7'h42)} ? param55 : (param55 ^~ param55))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire41;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire41,
                 (1'h0)};
  assign wire5 = (((~$signed((wire4 ?
                         wire2 : wire0))) <= $signed(wire4[(3'h5):(2'h2)])) ?
                     wire4 : wire3[(3'h5):(2'h2)]);
  assign wire6 = (wire0[(2'h2):(2'h2)] >> (wire3 ^~ (^(wire2[(2'h2):(1'h1)] >= (wire0 == wire2)))));
  assign wire7 = (~&((wire6[(3'h4):(1'h1)] ?
                         $signed(wire2[(1'h1):(1'h0)]) : ((&wire1) >= {(8'hbf)})) ?
                     (-((!wire3) ? (-wire0) : {wire5, wire4})) : (^~wire1)));
  assign wire8 = (wire7 <<< ((wire3 ?
                         $signed($signed((8'hbd))) : {wire5[(4'h8):(3'h6)],
                             (wire6 ? wire4 : wire7)}) ?
                     (8'ha9) : {wire6[(1'h1):(1'h1)], wire7}));
  module9 #() modinst42 (wire41, clk, wire0, wire3, wire6, wire4, wire1);
  assign wire43 = wire4;
  assign wire44 = ((($signed((wire5 << wire8)) >> wire5[(4'hb):(1'h1)]) && ((~|wire6[(2'h2):(1'h0)]) ?
                          ((+wire4) && $signed(wire0)) : wire43)) ?
                      {$unsigned((^wire0[(3'h6):(2'h3)]))} : wire6[(2'h3):(2'h3)]);
  assign wire45 = (($unsigned(wire5[(4'h8):(3'h5)]) ?
                      $unsigned(((wire4 ?
                          (8'hac) : wire44) <= $unsigned(wire2))) : wire4) && wire0);
  assign wire46 = wire41[(4'h8):(3'h4)];
  assign wire47 = $signed(((~|((wire44 ^ (8'hae)) ?
                      (wire2 ? wire41 : wire43) : wire45)) - (&(((8'hb0) ?
                      wire2 : wire6) ~^ wire44))));
  assign wire48 = (wire1[(4'hb):(4'ha)] ?
                      $signed(((wire45[(3'h5):(2'h2)] ?
                              (wire1 ? (8'hbe) : wire1) : wire43) ?
                          $unsigned(((8'ha6) ?
                              wire41 : (8'hab))) : $signed((wire46 ?
                              wire4 : wire1)))) : $signed($unsigned((|(wire8 + wire44)))));
  assign wire49 = (8'hbd);
  assign wire50 = ((7'h42) ?
                      wire44[(3'h4):(1'h0)] : $signed($unsigned(wire43)));
  assign wire51 = wire48[(4'hf):(4'h8)];
  assign wire52 = (8'hba);
  assign wire53 = wire43;
  assign wire54 = wire49[(1'h0):(1'h0)];
endmodule

module module9
#(parameter param39 = {(({((8'hb2) ? (7'h41) : (8'hb1)), {(8'ha3), (8'hb7)}} & (~^((8'ha9) ? (7'h42) : (8'hb2)))) >> ((((8'ha2) ^~ (8'hbc)) >= ((8'hb3) ? (8'hab) : (8'hb4))) >= (-((8'haa) ? (8'hbb) : (8'h9f))))), ({(|((8'hb7) ^ (8'haf)))} ? ((~|(&(8'hb6))) ? {((8'hb3) >>> (8'h9c)), ((8'ha7) <= (7'h40))} : (!(|(8'ha1)))) : ((((8'ha5) & (8'ha2)) >> {(7'h43)}) != {{(7'h40)}}))}, 
parameter param40 = param39)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire15;
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire15,
                 reg36,
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = {(!wire13)};
  always
    @(posedge clk) begin
      reg16 <= ($unsigned({$unsigned($unsigned(wire12))}) == wire10[(4'hf):(4'hb)]);
      reg17 <= $signed(reg16);
      reg18 <= $unsigned($unsigned((^$signed((wire15 ? reg17 : wire11)))));
      if ($unsigned((~^reg17)))
        begin
          reg19 <= (8'h9c);
        end
      else
        begin
          reg19 <= (8'hba);
        end
    end
  assign wire20 = (8'hbf);
  assign wire21 = ($signed(($signed(wire10) < ((^wire10) ~^ (wire12 | (8'h9e))))) >> {(8'ha0),
                      wire13});
  assign wire22 = $unsigned((8'ha9));
  assign wire23 = $unsigned(wire15);
  assign wire24 = (-$unsigned($unsigned(($signed(wire10) ?
                      (reg19 ? wire13 : reg17) : $signed(reg18)))));
  assign wire25 = ({(~^$unsigned($signed(wire21))),
                      $unsigned((8'ha0))} >> ($unsigned({$signed(wire20)}) != (|reg16[(5'h10):(5'h10)])));
  always
    @(posedge clk) begin
      reg26 <= reg16[(3'h5):(3'h5)];
      reg27 <= wire10[(1'h0):(1'h0)];
      reg28 <= wire20[(1'h0):(1'h0)];
      reg29 <= (~&$signed($unsigned($unsigned($signed(wire20)))));
      reg30 <= (reg29[(4'hd):(4'ha)] <<< reg18);
    end
  assign wire31 = (^~$signed($unsigned(wire23)));
  assign wire32 = (($unsigned(reg30[(3'h6):(1'h0)]) ?
                          ($signed($signed(wire20)) ^ wire23) : reg19[(3'h5):(2'h2)]) ?
                      ($unsigned($signed($signed(reg17))) ?
                          wire23 : {{(reg16 ? wire25 : reg18),
                                  (+reg26)}}) : $signed(wire11[(4'h8):(3'h4)]));
  assign wire33 = reg28[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg34 <= (+$signed((((-wire32) ? $signed(reg29) : $unsigned(reg19)) ?
          ($unsigned(wire11) ?
              wire32[(3'h7):(3'h4)] : {reg19, wire12}) : ((reg17 ?
                  wire22 : reg27) ?
              reg17 : $signed(wire12)))));
      reg35 <= (|($signed(((^wire11) ? {wire32, wire14} : (reg16 * wire31))) ?
          (!$unsigned($unsigned(wire10))) : wire22));
      reg36 <= $signed($unsigned(($signed(((8'haf) ? (8'hb7) : reg17)) ?
          ($unsigned(wire15) & {(8'h9c),
              wire23}) : (wire12[(2'h2):(1'h0)] + (8'ha2)))));
    end
  assign wire37 = reg16[(4'ha):(4'ha)];
  assign wire38 = $signed($signed(($signed(wire20[(1'h0):(1'h0)]) ?
                      (wire31 <= (8'hb2)) : reg28)));
endmodule

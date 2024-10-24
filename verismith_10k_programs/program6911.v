module top
#(parameter param26 = (8'ha0), 
parameter param27 = ({(+(param26 ^~ ((7'h43) ~^ param26)))} || (((^~param26) * ((param26 < param26) ? (!param26) : (param26 ? param26 : param26))) ? (-(8'hba)) : (~|param26))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {{wire3[(1'h0):(1'h0)], $unsigned($signed((-wire0)))},
          wire1[(1'h0):(1'h0)]};
      reg6 <= wire0[(3'h7):(3'h6)];
    end
  assign wire7 = $unsigned($unsigned($unsigned(((reg5 ?
                     wire3 : wire1) - (~&reg5)))));
  assign wire8 = {(wire7 >= ((|(wire1 ?
                         reg6 : wire0)) << wire3[(3'h7):(3'h7)])),
                     wire0};
  assign wire9 = reg5;
  assign wire10 = $signed($unsigned((&wire4)));
  assign wire11 = $signed(((^wire3[(3'h5):(2'h3)]) ?
                      {($unsigned((7'h42)) ?
                              (reg6 == wire7) : (~&wire9))} : (-(!$signed(wire2)))));
  assign wire12 = ($signed((($unsigned(reg5) ? (8'hb6) : (8'h9f)) ?
                          ((-wire0) <= wire0) : {(~&wire10),
                              $unsigned(wire2)})) ?
                      wire2 : $signed($unsigned(wire7)));
  assign wire13 = (wire7[(3'h5):(3'h5)] ?
                      (7'h43) : ($unsigned(wire10) ?
                          (!(&(wire7 ~^ (7'h40)))) : (~$signed(wire12[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg14 <= ((($signed({wire2,
          wire3}) && wire7[(3'h6):(3'h6)]) ^ wire4) + $signed($signed(wire10[(2'h3):(1'h1)])));
      reg15 <= {reg5[(1'h0):(1'h0)],
          (^({wire10} == $unsigned((wire8 > reg6))))};
      reg16 <= (($signed(wire10[(2'h3):(2'h2)]) >> (((wire10 - wire10) ?
              (reg6 ? (7'h41) : wire2) : ((8'h9f) < wire1)) ?
          ((8'h9e) ?
              $signed(reg5) : ((8'hb9) ?
                  wire0 : (8'hbd))) : $signed(wire0[(5'h13):(5'h13)]))) * wire11[(4'h8):(2'h2)]);
      reg17 <= $signed({(wire11[(3'h5):(2'h3)] ?
              $unsigned((wire10 ? wire13 : reg5)) : wire3),
          (~&((-wire4) ^ (reg15 ? reg6 : wire13)))});
      reg18 <= {{reg16[(1'h0):(1'h0)]}};
    end
  assign wire19 = $unsigned(($unsigned(reg6[(4'hf):(3'h7)]) <<< ($signed(reg18) ?
                      $unsigned((wire11 + reg18)) : reg15)));
  assign wire20 = ($signed((-{(8'hb3)})) ?
                      (&$signed(wire12)) : $signed(reg14[(3'h5):(1'h1)]));
  assign wire21 = wire19[(4'ha):(2'h3)];
  assign wire22 = (reg5[(1'h1):(1'h0)] << reg15[(3'h5):(1'h1)]);
  assign wire23 = ((wire1 ?
                          $unsigned($unsigned((reg17 <<< reg16))) : $unsigned(reg6)) ?
                      ({$signed({wire11})} ?
                          $unsigned((reg6[(4'hd):(4'h8)] ^~ $unsigned(wire12))) : (8'ha5)) : {$signed(((reg5 ?
                                  wire20 : reg15) ?
                              (wire22 ? reg6 : wire19) : wire12))});
  assign wire24 = $unsigned($unsigned(wire3[(1'h0):(1'h0)]));
  assign wire25 = wire2;
endmodule

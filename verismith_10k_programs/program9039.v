module top
#(parameter param31 = (^~(~&(({(8'hb0), (8'hb0)} >> ((8'h9d) ? (8'ha8) : (8'hb1))) ? (((8'hab) ? (8'h9d) : (8'hb3)) ? ((8'hbf) == (8'h9c)) : ((8'hba) || (8'ha3))) : {((8'hb7) && (8'hbd))}))), 
parameter param32 = {(-(+(param31 > (-param31)))), (((8'hbf) ? ((param31 == param31) < param31) : (!(param31 * param31))) ~^ (({param31, param31} ? (8'hb9) : {(8'haa), param31}) ? (((8'ha5) ? (8'ha6) : (8'h9d)) >= (param31 ? (8'ha1) : (8'hae))) : ((!(8'ha3)) != ((8'hb9) | param31))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire30,
                 wire26,
                 wire13,
                 wire12,
                 wire5,
                 wire4,
                 reg29,
                 reg28,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire2[(2'h2):(1'h0)];
  assign wire5 = $unsigned((wire0 >= wire0));
  always
    @(posedge clk) begin
      reg6 <= (-(7'h42));
      if ((($signed(wire5[(4'h9):(2'h2)]) ?
              $signed(wire0) : (wire2 ^~ (~^wire2))) ?
          wire3 : wire3[(4'hc):(2'h2)]))
        begin
          reg7 <= reg6[(4'hb):(4'hb)];
          reg8 <= {((8'ha4) ?
                  wire4[(2'h3):(2'h2)] : (wire2[(2'h3):(2'h2)] >>> $signed($unsigned(reg6)))),
              wire3[(4'hc):(3'h5)]};
          reg9 <= wire5[(4'h8):(4'h8)];
          reg10 <= wire5;
          reg11 <= $unsigned((((~|$unsigned((8'hb5))) ?
                  $unsigned(wire5) : reg9) ?
              $unsigned($unsigned((reg10 + reg7))) : (((-(8'ha3)) ?
                  wire0[(3'h5):(1'h0)] : $unsigned(wire1)) - wire4[(1'h1):(1'h0)])));
        end
      else
        begin
          reg7 <= {wire3[(3'h4):(2'h3)]};
          reg8 <= $signed($unsigned($signed((reg11[(4'ha):(1'h0)] ?
              $signed(wire2) : reg8))));
        end
    end
  assign wire12 = wire2[(3'h5):(1'h0)];
  assign wire13 = ($unsigned(((wire4[(3'h7):(3'h7)] + (-reg9)) ^ (-reg11))) ?
                      ((reg11[(3'h5):(1'h1)] ?
                          $signed($signed(wire2)) : (((8'ha2) > wire4) ?
                              wire5[(4'ha):(3'h4)] : (wire0 ?
                                  wire0 : wire12))) == (reg9[(1'h1):(1'h0)] ^~ ((reg7 & reg10) ?
                          $unsigned((8'hbb)) : (~|reg11)))) : $unsigned(reg11));
  module14 #() modinst27 (.wire18(reg8), .y(wire26), .wire17(wire0), .wire15(reg7), .wire16(wire5), .clk(clk));
  always
    @(posedge clk) begin
      reg28 <= (+(|$signed(reg7[(4'h8):(2'h2)])));
      reg29 <= (^~(($unsigned($signed(wire13)) > wire4) ?
          ({$unsigned(reg10)} ?
              ((wire5 > reg10) ?
                  ((8'hb4) ~^ wire13) : $unsigned((8'had))) : ($unsigned(reg11) ?
                  (reg11 ?
                      wire26 : reg9) : (reg28 | wire5))) : $signed(($unsigned(wire2) ?
              reg28[(3'h4):(1'h0)] : $unsigned(reg28)))));
    end
  assign wire30 = (|(((~(-reg6)) < ($unsigned((8'hbd)) ?
                      $signed(reg11) : (!wire4))) && ((wire4 + $signed(reg29)) || (reg7 - ((8'ha8) ?
                      wire12 : reg9)))));
endmodule

module module14
#(parameter param24 = ({((((8'haa) << (8'h9d)) <<< ((8'ha4) >= (8'ha7))) ? {((8'ha9) ? (8'hab) : (8'hb1))} : {(^~(8'ha8))})} ? (((8'ha3) ? ({(8'haf), (8'ha0)} ~^ (7'h42)) : ((~|(7'h40)) ? (8'hb4) : (8'hbf))) ? {(((8'hbd) ~^ (8'hb9)) ? (^~(8'ha5)) : {(8'ha1)}), (((8'hb0) + (8'hb3)) ? (~^(8'hb5)) : (8'had))} : ((((8'haf) ? (8'had) : (8'hbe)) << ((8'hab) ? (8'hbe) : (8'hbb))) ? (((8'hb0) >= (8'h9c)) << ((8'hb9) || (8'hbf))) : {((8'hbb) ? (8'hac) : (8'hb0)), (!(8'ha3))})) : ((({(8'had), (8'ha8)} ? ((8'h9f) ^ (8'hb0)) : {(8'hbb)}) ~^ {((8'h9f) + (8'hb8))}) ? (~|(~(~&(8'hb2)))) : ((^((8'hb3) ? (8'hb4) : (8'hb3))) + {(~|(8'hae)), ((8'ha3) ^~ (8'haa))}))), 
parameter param25 = (~^param24))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  assign y = {wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = ((wire15[(3'h7):(3'h5)] ?
                          $unsigned(wire15) : $signed((!((8'h9d) ?
                              wire17 : wire16)))) ?
                      $signed($signed($signed((&(8'haf))))) : $unsigned((8'hac)));
  assign wire20 = ($unsigned((^~($signed(wire16) ?
                          wire16[(2'h2):(1'h1)] : (wire15 == wire15)))) ?
                      {wire19[(2'h3):(1'h1)],
                          ({$unsigned((8'hb4))} ^~ (~$unsigned(wire17)))} : ((((&wire18) ^ (wire16 ?
                              wire18 : wire18)) << {(~(8'ha6)),
                              wire16[(2'h2):(1'h0)]}) ?
                          wire18[(5'h12):(4'h9)] : (wire16 <<< $signed($signed((8'had))))));
  assign wire21 = wire18[(4'hf):(4'h8)];
  assign wire22 = $unsigned((^wire17[(3'h5):(3'h4)]));
  assign wire23 = $unsigned((($signed(wire17[(1'h1):(1'h0)]) * $signed((~&(8'ha8)))) ?
                      (wire15 ?
                          (wire16 ?
                              wire16[(1'h0):(1'h0)] : (~&wire21)) : wire20[(4'hb):(3'h7)]) : {wire15[(3'h5):(2'h2)],
                          (wire21 ? (8'hb1) : $signed(wire19))}));
endmodule

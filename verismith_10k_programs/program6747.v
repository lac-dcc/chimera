module top
#(parameter param18 = (7'h40), 
parameter param19 = (~&{{((~param18) ? (param18 ? param18 : param18) : (^param18)), (^param18)}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed((($unsigned(wire2) - $unsigned((wire4 <= wire1))) ^~ (!(-(wire2 ?
                     wire2 : wire0)))));
  always
    @(posedge clk) begin
      if ((8'haf))
        begin
          reg6 <= wire3[(1'h1):(1'h0)];
        end
      else
        begin
          reg6 <= ($unsigned(({{wire0, reg6}} ?
                  $unsigned($unsigned(wire0)) : (-$signed(wire4)))) ?
              ((|(wire2 - wire1[(4'hc):(3'h4)])) || $signed($unsigned(wire5[(3'h4):(2'h2)]))) : wire4[(4'h9):(1'h0)]);
          reg7 <= (!wire0[(3'h6):(3'h6)]);
          reg8 <= $unsigned((((((8'ha1) ? wire4 : reg6) ?
              ((7'h42) ? wire2 : wire5) : {wire0,
                  wire0}) | wire4) || wire4[(3'h4):(2'h3)]));
        end
      reg9 <= ((reg6 >= ($unsigned(wire5) ?
              ({wire1, wire1} <= $signed(wire0)) : ((7'h42) ~^ (~&wire1)))) ?
          $signed(($unsigned($unsigned(wire1)) ?
              reg7 : $unsigned((~^reg6)))) : $unsigned({($unsigned(wire5) <<< reg6[(3'h7):(3'h4)]),
              wire0}));
    end
  assign wire10 = $unsigned($unsigned(((reg8[(2'h2):(1'h1)] || (wire5 >>> wire0)) ?
                      $signed((^~(8'hbf))) : $unsigned($unsigned(wire0)))));
  assign wire11 = $unsigned($signed(($unsigned((~&reg7)) ?
                      $unsigned($signed(wire4)) : ((+reg8) ?
                          (~wire0) : $unsigned(wire2)))));
  assign wire12 = $unsigned({$signed($signed(wire10)), $signed((&{wire0}))});
  assign wire13 = $unsigned($unsigned(($unsigned((!(8'hbe))) ?
                      wire11[(4'h8):(4'h8)] : reg6)));
  always
    @(posedge clk) begin
      reg14 <= reg7;
      reg15 <= ($signed({(wire5 ? wire1 : {reg6}),
          $unsigned(((8'ha2) ?
              wire11 : reg14))}) || (($unsigned($signed(wire5)) ?
              ($signed(reg7) >= (~|wire4)) : $signed($unsigned(reg9))) ?
          $signed(wire1[(1'h0):(1'h0)]) : {($signed(wire10) ?
                  (wire5 >= wire4) : (wire13 + wire1)),
              $signed($signed(wire4))}));
      reg16 <= wire12;
    end
  assign wire17 = reg16[(4'ha):(3'h5)];
endmodule

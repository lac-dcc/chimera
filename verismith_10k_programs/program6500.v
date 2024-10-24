module top
#(parameter param21 = (((^(((8'hb0) ~^ (8'ha9)) | ((8'haa) || (8'hb3)))) ? {{{(8'had), (8'ha3)}}} : {(-((8'ha2) - (8'hb3))), (((8'had) ? (7'h40) : (8'h9c)) ~^ {(7'h41)})}) ? (((((8'haa) ^ (8'h9f)) <= ((8'ha4) ? (8'h9c) : (8'ha2))) & {((8'ha8) ^ (8'hae)), ((8'hba) >>> (8'hb9))}) << (((8'ha8) >> (~&(8'h9e))) ? (((7'h41) ? (8'hbe) : (8'hb0)) || ((8'had) >= (8'ha2))) : (((8'hbc) ? (8'hbe) : (8'ha6)) ? ((8'ha7) ? (8'h9f) : (8'had)) : (8'hbe)))) : (~&(&({(7'h41), (8'hae)} || ((7'h44) | (8'ha6)))))), 
parameter param22 = (+((param21 > ((param21 < param21) < param21)) ? ({param21} == param21) : param21)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(($signed({$unsigned((8'hbe))}) ?
          (~|(wire1 & wire2[(5'h12):(4'hb)])) : ($signed($signed((7'h40))) ?
              (~&{wire3}) : wire1))))
        begin
          reg4 <= $signed($unsigned((&(!$unsigned(wire3)))));
          reg5 <= $unsigned((reg4[(2'h2):(2'h2)] * wire3[(1'h1):(1'h1)]));
        end
      else
        begin
          reg4 <= wire2;
          reg5 <= $unsigned(wire1[(4'ha):(3'h4)]);
          reg6 <= wire3[(2'h2):(1'h0)];
          reg7 <= wire2;
        end
      reg8 <= $signed((^~reg5[(3'h7):(1'h0)]));
      reg9 <= (($signed((~&$unsigned(wire0))) ?
          (!$signed(wire2[(4'ha):(3'h6)])) : (~|((+(8'h9e)) || wire0))) * $signed($unsigned(wire3[(1'h0):(1'h0)])));
    end
  assign wire10 = (((~&{(8'had), (reg5 ? reg6 : (7'h43))}) ?
                      reg7[(1'h0):(1'h0)] : reg6) ^ (((~&wire1[(4'hb):(1'h1)]) ?
                          {(reg5 > reg4),
                              ((8'h9d) ?
                                  reg6 : wire3)} : (((8'hb8) << (8'hb7)) ?
                              $unsigned(reg6) : $unsigned((7'h41)))) ?
                      reg7 : ((|reg4) != reg6)));
  assign wire11 = (~^$signed($signed((~|(wire0 ? wire2 : (8'ha4))))));
  assign wire12 = {$signed({($signed(reg8) ?
                              (wire10 < wire2) : $unsigned(reg6)),
                          reg7[(2'h2):(1'h1)]})};
  assign wire13 = $unsigned((|($unsigned((reg9 ?
                      reg8 : wire12)) & wire3[(2'h2):(1'h0)])));
  assign wire14 = $signed((($unsigned($unsigned(reg8)) ?
                      $signed((wire3 ?
                          (8'hbe) : wire0)) : $unsigned(wire10)) * ($signed(wire11[(4'h8):(3'h4)]) << reg4[(3'h5):(3'h5)])));
  assign wire15 = wire12;
  assign wire16 = (((8'hb3) && $signed(((reg5 << reg8) ?
                          $signed(reg9) : ((8'hba) >>> reg7)))) ?
                      ((wire3 ?
                              ($signed((7'h41)) || (~reg5)) : $unsigned({wire13})) ?
                          (~^{wire1[(4'hd):(3'h6)]}) : ($signed({wire0}) ?
                              $unsigned(wire1[(2'h3):(2'h3)]) : reg8[(3'h4):(2'h2)])) : ({$signed($unsigned(wire10)),
                              ((!(8'hb3)) ?
                                  wire0[(4'hc):(3'h6)] : $unsigned(reg5))} ?
                          (wire15 * $unsigned($signed(reg7))) : $unsigned((!(8'ha8)))));
  assign wire17 = (+({reg9, $signed((wire16 || wire13))} ?
                      (&{reg4[(3'h6):(3'h4)],
                          wire13[(4'ha):(3'h6)]}) : {(wire3 ?
                              $signed(reg7) : $signed(reg9)),
                          $unsigned($unsigned(wire11))}));
  assign wire18 = ($signed($unsigned($unsigned(((8'hb1) ? reg9 : (8'ha2))))) ?
                      (($unsigned(wire11) ?
                              $unsigned($signed(wire12)) : wire11[(4'ha):(1'h1)]) ?
                          (reg4[(3'h5):(2'h2)] ?
                              ((wire3 <= wire0) < $unsigned(wire0)) : wire3) : reg8[(2'h3):(2'h3)]) : $signed(reg5));
  assign wire19 = (reg9[(1'h0):(1'h0)] ?
                      ((&$unsigned((~^wire10))) >> wire18) : wire3[(2'h2):(1'h0)]);
  assign wire20 = wire1;
endmodule

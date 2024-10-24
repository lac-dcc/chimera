module top
#(parameter param18 = ((({(|(8'hbe)), ((8'hae) ^~ (8'h9f))} ? {((7'h42) ? (8'hb9) : (8'hbd)), {(7'h41)}} : (!(!(8'hb1)))) ^~ ((((8'hbc) ? (8'ha1) : (8'ha0)) <= {(8'h9c), (7'h44)}) ? (~(~^(8'ha5))) : (((8'hba) << (8'hbd)) ? ((7'h44) ~^ (8'hb1)) : ((8'hb2) ^~ (7'h44))))) | (^({(+(8'hac)), ((8'hac) ? (8'ha5) : (7'h42))} << ((-(8'hba)) <<< {(8'hbd)})))), 
parameter param19 = (param18 && {{(-(param18 ? param18 : param18)), {param18}}}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned($unsigned(wire2)));
  assign wire5 = (|wire1[(3'h4):(1'h1)]);
  assign wire6 = $unsigned((wire3[(1'h0):(1'h0)] ? wire3 : $signed((8'hb6))));
  assign wire7 = {(!(wire0[(1'h1):(1'h0)] + (8'hb9))), wire6};
  assign wire8 = $unsigned((^~(~|$signed($signed(wire2)))));
  assign wire9 = (($unsigned({wire2[(4'hc):(4'h9)]}) >>> $signed($signed((wire0 & wire8)))) ~^ (+(|wire8[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg10 <= $unsigned((8'hac));
      if ({$unsigned(wire6[(4'hd):(3'h6)]),
          (($unsigned((+wire1)) + $signed(wire7[(3'h6):(3'h6)])) ?
              $signed($unsigned({(8'hbe)})) : ($signed((wire4 - wire3)) ?
                  reg10[(3'h6):(1'h1)] : wire3[(2'h2):(2'h2)]))})
        begin
          reg11 <= wire6[(2'h3):(1'h0)];
        end
      else
        begin
          reg11 <= wire0[(2'h2):(1'h0)];
        end
    end
  assign wire12 = (^~($unsigned(wire2[(4'ha):(4'h8)]) ?
                      {(wire8[(4'h8):(3'h7)] ?
                              {wire9, wire6} : (wire1 ? (8'haa) : wire7)),
                          $unsigned((|wire0))} : ((~^wire2[(4'hb):(4'ha)]) | wire1)));
  always
    @(posedge clk) begin
      reg13 <= ($unsigned($signed(wire8)) & ((-{(+wire7),
          $unsigned((8'ha1))}) != $signed($signed(wire3[(1'h0):(1'h0)]))));
      reg14 <= ($signed($signed((&$unsigned(wire12)))) ?
          ((reg10 - (~|wire5)) ?
              wire3[(3'h4):(2'h2)] : $unsigned($unsigned($unsigned((7'h44))))) : (^~$unsigned((!$signed(wire7)))));
    end
  assign wire15 = ({(({wire2} ? $signed(wire5) : (+wire2)) ?
                          (~{wire1, reg14}) : reg13),
                      $unsigned($unsigned($unsigned(reg14)))} | $signed($unsigned($signed($signed((8'hbc))))));
  assign wire16 = (($signed((reg14[(2'h2):(1'h0)] ?
                      $signed(wire7) : (wire4 <<< (8'ha5)))) >>> $signed(wire0[(1'h1):(1'h1)])) | (^(!({wire15,
                          wire7} ?
                      (wire1 ? (8'h9d) : reg11) : {(8'hb7)}))));
  assign wire17 = $unsigned(((($unsigned(wire1) ?
                              $unsigned(reg14) : $signed(reg14)) ?
                          ((wire5 ? wire7 : reg11) ?
                              wire5[(1'h1):(1'h1)] : reg11) : {(~^wire9),
                              (wire4 >= wire15)}) ?
                      {{(reg14 || reg14), (wire3 ? wire0 : reg11)},
                          ((wire0 ? reg13 : reg13) ?
                              (reg11 ?
                                  (8'hb8) : wire1) : wire0[(3'h4):(1'h0)])} : $unsigned(wire15)));
endmodule

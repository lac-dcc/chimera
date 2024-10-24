module top
#(parameter param32 = ((&({((8'hab) ? (8'hb4) : (8'ha7))} ? {((8'ha2) == (8'hb4))} : (((8'ha5) == (8'hbf)) >>> ((8'h9e) ? (7'h44) : (8'ha0))))) && ((~(((8'hb4) & (8'hb1)) && ((7'h41) ^~ (8'hae)))) ? (|{((8'ha2) ? (8'ha1) : (8'hb9))}) : ((((8'hb3) ? (8'hbb) : (8'hb7)) ? ((8'ha5) >= (8'h9e)) : ((8'hb3) ? (8'hbe) : (8'ha7))) ? ((~(7'h41)) | ((8'hb6) ? (8'ha6) : (8'ha2))) : (|(+(8'ha0)))))), 
parameter param33 = param32)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire31,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire4,
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
                 reg18,
                 reg17,
                 reg16,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned(($unsigned(wire2) ?
                         {(-wire1),
                             (wire2 ?
                                 wire2 : wire2)} : $unsigned($unsigned((8'ha6))))) ?
                     ((&((wire2 == wire0) ?
                         (wire0 ?
                             wire1 : (7'h41)) : ((8'ha8) >>> wire2))) - wire0[(2'h3):(1'h1)]) : $signed({(!$unsigned(wire1)),
                         ((wire0 >= wire0) ? wire1[(1'h0):(1'h0)] : wire0)}));
  always
    @(posedge clk) begin
      reg5 <= ((8'hba) ? wire1 : $unsigned(wire2[(3'h7):(2'h3)]));
      reg6 <= wire4[(2'h3):(2'h2)];
      reg7 <= (~&($signed($signed($signed(wire0))) > $unsigned(((&wire0) ^~ (wire3 ^~ wire2)))));
    end
  assign wire8 = wire1;
  assign wire9 = wire4[(4'ha):(3'h7)];
  assign wire10 = ((((~|(wire8 ?
                      wire0 : reg7)) == wire8[(1'h0):(1'h0)]) + reg5[(1'h0):(1'h0)]) * ((~&{reg5}) ?
                      ((+(wire8 ? (8'hb0) : wire9)) ?
                          (+$signed(wire9)) : wire3) : reg7));
  assign wire11 = ($unsigned($unsigned(((reg6 >>> (8'hbb)) <= reg5[(3'h5):(3'h4)]))) ^ reg5);
  assign wire12 = wire2[(5'h10):(4'h8)];
  assign wire13 = $unsigned({wire9,
                      ($unsigned(reg6[(1'h0):(1'h0)]) ?
                          $unsigned($unsigned(reg5)) : {(~^(8'hb9))})});
  assign wire14 = (wire11[(3'h4):(1'h1)] ?
                      {$unsigned(wire0[(1'h1):(1'h1)]),
                          $signed(((8'h9d) ?
                              wire10[(4'hd):(4'hd)] : reg6[(1'h0):(1'h0)]))} : $unsigned((wire11 << $signed((wire4 ?
                          wire0 : wire2)))));
  assign wire15 = $signed(((wire9 <<< (wire3[(1'h1):(1'h1)] == wire12[(3'h6):(3'h5)])) & ((8'ha5) ?
                      ($signed(wire13) ?
                          (wire0 ? wire11 : wire12) : (+wire3)) : {wire4})));
  always
    @(posedge clk) begin
      if ((8'ha6))
        begin
          reg16 <= $signed(((~$signed(((7'h40) ^ wire1))) ?
              wire8 : ((~^$unsigned(reg7)) ?
                  {{wire1, (7'h44)}, {(8'ha7), wire3}} : wire15)));
          reg17 <= $signed(((wire9[(4'h8):(3'h7)] ?
                  ((^~wire4) ?
                      (~&(8'ha8)) : $signed((8'ha2))) : $unsigned(reg16[(3'h6):(1'h1)])) ?
              $unsigned($signed(wire0[(2'h2):(2'h2)])) : $signed((-{reg7,
                  (8'hb1)}))));
          if ((reg16 <= ({(&reg16[(1'h1):(1'h0)])} ?
              wire15[(2'h2):(1'h0)] : $unsigned(wire12))))
            begin
              reg18 <= $signed($signed(wire0[(1'h0):(1'h0)]));
              reg19 <= {wire3};
              reg20 <= {($unsigned($signed((|wire15))) > ((reg18 ?
                          $signed((7'h43)) : $signed(reg16)) ?
                      (|reg6[(3'h4):(2'h2)]) : wire13[(1'h0):(1'h0)]))};
              reg21 <= (-(^($unsigned({wire0}) && ((wire12 ?
                  wire10 : wire13) * ((7'h43) <= reg17)))));
              reg22 <= $signed((~^(reg20[(4'h9):(3'h7)] >= ((wire0 ?
                      wire4 : reg7) ?
                  reg20 : wire12[(3'h6):(2'h3)]))));
            end
          else
            begin
              reg18 <= (7'h41);
            end
          reg23 <= $unsigned((^~reg16));
        end
      else
        begin
          reg16 <= wire9;
          reg17 <= $signed((7'h44));
        end
      reg24 <= $unsigned({(~^(+$unsigned(reg16)))});
      reg25 <= (((~|($unsigned(reg16) ?
          $unsigned(wire2) : (+reg5))) - $unsigned(({(8'hbc),
          reg7} << (reg5 > wire3)))) - $signed(wire14[(3'h4):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if ((wire0[(2'h3):(2'h2)] + $signed($signed((wire10 ?
          wire15 : (wire3 + wire1))))))
        begin
          reg26 <= $unsigned($signed((((~|reg25) && {(8'hae),
              (8'hb3)}) << reg24[(3'h6):(1'h0)])));
        end
      else
        begin
          reg26 <= $signed($unsigned(wire10[(4'hd):(4'hc)]));
          if (((reg23[(5'h12):(3'h6)] != (8'hbb)) ?
              $signed((~&{(wire13 + reg16),
                  (wire12 ? reg23 : wire11)})) : $signed({(|$unsigned(wire2)),
                  (8'haf)})))
            begin
              reg27 <= $signed((~&(-((reg5 & reg24) ? reg24 : (8'ha9)))));
              reg28 <= $signed((wire12[(3'h6):(3'h6)] && (+({reg5} ?
                  $unsigned(reg16) : (^~wire15)))));
              reg29 <= (&$unsigned((~|wire11[(3'h6):(3'h6)])));
              reg30 <= $signed((reg17[(2'h2):(1'h1)] ?
                  ((~&reg19[(3'h7):(1'h1)]) ?
                      (wire2 ?
                          (^wire0) : wire1) : reg22[(5'h12):(3'h6)]) : ((wire1[(1'h1):(1'h0)] ?
                      {(8'hb5)} : {reg19, reg23}) && (wire2 > (reg26 ?
                      reg23 : (8'h9c))))));
            end
          else
            begin
              reg27 <= (~|reg6[(1'h0):(1'h0)]);
              reg28 <= $unsigned(((8'h9f) ?
                  reg23[(3'h4):(1'h0)] : {($unsigned(reg18) <= $signed(reg16)),
                      reg26}));
            end
        end
    end
  assign wire31 = ($unsigned((($signed(reg29) ?
                      (reg18 != reg16) : (reg20 ?
                          (8'hb3) : reg19)) << (reg7 && (^reg27)))) > $signed((-(~&(&(8'ha4))))));
endmodule

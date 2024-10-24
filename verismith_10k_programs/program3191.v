module top
#(parameter param25 = ((((~((8'ha1) ~^ (8'ha0))) ? (((8'haa) ? (8'hb0) : (8'ha5)) > {(8'ha7)}) : ((-(8'hab)) ^ ((8'h9e) ? (8'hb8) : (8'hab)))) >>> (((8'h9c) ? ((8'haf) ? (8'ha2) : (8'ha3)) : ((8'ha1) - (8'h9c))) >> (~((8'ha9) ? (8'h9d) : (8'h9f))))) ? (8'hb7) : (((~&((8'hbd) & (8'ha6))) ? (((8'h9f) ? (8'hbd) : (8'hae)) - ((8'ha4) ^~ (8'h9f))) : (((8'hb8) ? (8'hbd) : (8'hb7)) ? ((8'hb6) ? (8'ha8) : (8'hb9)) : ((8'h9f) ? (8'hba) : (8'haf)))) ? ({{(8'ha9), (7'h41)}} ? {((7'h44) & (8'hae))} : (((7'h44) ? (8'hb5) : (7'h42)) >= ((8'hb8) ~^ (8'h9d)))) : (({(8'haa)} >>> ((8'h9e) <<< (8'ha4))) << (-((7'h41) ? (8'haf) : (8'ha6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = $unsigned((wire3 ?
                     ($unsigned({wire3,
                         wire0}) >= $signed((-wire2))) : (wire0[(3'h4):(2'h2)] ?
                         ($signed((8'h9c)) ?
                             wire3[(4'hc):(3'h7)] : (~^wire1)) : $signed($signed((7'h40))))));
  assign wire5 = $unsigned(($signed((&wire3)) < wire4[(4'hb):(4'h8)]));
  assign wire6 = (($signed(wire2[(4'hd):(2'h3)]) ~^ wire2) ?
                     wire2 : wire5[(1'h0):(1'h0)]);
  assign wire7 = {wire5[(1'h0):(1'h0)],
                     $unsigned($signed(({wire4} ?
                         wire1[(5'h10):(4'hf)] : $unsigned(wire1))))};
  assign wire8 = (wire2[(5'h10):(2'h3)] != $unsigned((wire4[(1'h1):(1'h0)] ?
                     $unsigned((-wire6)) : {wire0})));
  assign wire9 = ($unsigned(wire7) != (|$signed(((wire2 ? (8'hbd) : wire3) ?
                     $unsigned(wire2) : (^~wire4)))));
  assign wire10 = (^wire0[(3'h7):(2'h2)]);
  assign wire11 = wire7;
  assign wire12 = ((&(wire2[(4'he):(2'h3)] ?
                          $signed($unsigned(wire6)) : wire11[(3'h6):(3'h4)])) ?
                      $signed(wire3) : $signed($signed((wire10 ?
                          (+wire6) : (wire8 ? wire3 : wire9)))));
  always
    @(posedge clk) begin
      reg13 <= {wire7};
      reg14 <= $unsigned($unsigned($signed($signed($unsigned(wire8)))));
      reg15 <= ($signed($signed(wire12)) ?
          {((wire7[(4'hf):(4'hc)] ?
                  (-(8'hb9)) : (wire1 ?
                      wire1 : reg14)) * $signed({wire6}))} : (^wire11[(3'h7):(3'h7)]));
      reg16 <= (|wire8[(1'h0):(1'h0)]);
      if ({(wire12[(2'h2):(1'h1)] ? wire8[(1'h1):(1'h0)] : wire2),
          (({{(8'ha4), wire6}, {(8'hbb), wire6}} ?
                  $signed((~reg15)) : (-(!wire3))) ?
              wire12 : (((wire7 ? reg15 : (8'ha3)) ?
                  $signed((8'haa)) : $unsigned(reg16)) >= $signed((wire7 < wire4))))})
        begin
          reg17 <= (wire9 << ($signed($unsigned(reg14)) ?
              $signed($signed((wire8 >= (8'haf)))) : {wire5}));
          reg18 <= (&(reg17 <<< {($signed(reg16) ?
                  wire2 : (wire7 ? reg15 : wire4))}));
          if (({wire3} ? wire6[(3'h7):(2'h3)] : $unsigned(wire11)))
            begin
              reg19 <= $unsigned($signed(reg13[(3'h5):(1'h0)]));
            end
          else
            begin
              reg19 <= $unsigned((7'h41));
            end
          reg20 <= (wire3 < $signed(wire1));
          reg21 <= (|((($unsigned(wire5) ? (~^(8'h9d)) : wire8[(1'h0):(1'h0)]) ?
                  (8'hbf) : (((8'ha3) <= wire11) ?
                      (reg19 <<< reg16) : (&wire5))) ?
              $signed({wire10,
                  (wire3 ? reg20 : wire5)}) : ((~|(wire11 != reg18)) ?
                  ({wire3} ?
                      wire3 : reg19) : ((reg17 - wire2) - (reg20 || wire9)))));
        end
      else
        begin
          reg17 <= $unsigned(wire8[(1'h1):(1'h0)]);
          reg18 <= (((+wire0) && wire7) ?
              wire11[(3'h7):(3'h4)] : (wire7 ?
                  (~|(^~reg16[(2'h2):(1'h0)])) : wire12[(2'h2):(1'h1)]));
          reg19 <= ($signed(((8'haf) - (~|$signed(reg19)))) ^ (wire11[(4'h9):(3'h5)] <= $unsigned((~$signed((8'ha3))))));
          reg20 <= (|$signed({((wire1 ? wire6 : (7'h44)) ?
                  reg17[(4'h8):(1'h0)] : reg19)}));
          reg21 <= (wire12[(1'h1):(1'h0)] + ($signed(wire12) * (~(!$unsigned(wire9)))));
        end
    end
  assign wire22 = reg19;
  assign wire23 = wire8;
  assign wire24 = ($signed((wire11[(3'h6):(1'h1)] ^ (wire23[(1'h0):(1'h0)] ?
                          $unsigned(wire23) : ((8'hb1) <= reg17)))) ?
                      (~^$signed(wire12[(1'h0):(1'h0)])) : (8'hb8));
endmodule

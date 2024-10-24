module top
#(parameter param21 = ({(~|(((8'hb2) ? (8'ha6) : (8'had)) != ((8'hba) << (8'hae))))} ? (-((8'hb5) || (!((8'ha0) & (8'ha2))))) : (((~^(^(7'h44))) ? (!((8'ha5) ? (8'hab) : (8'ha3))) : (8'hb0)) ? {{((8'ha2) <= (8'hb6))}} : {((8'ha8) ? (^(8'ha8)) : ((8'hb4) ? (8'h9f) : (8'ha1)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire9,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = ((wire4 ?
                     {((~^wire2) ?
                             $unsigned(wire1) : (^~wire0))} : $unsigned(((&wire1) ?
                         wire4[(4'ha):(4'h8)] : (!wire0)))) ^~ wire2[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire2);
      reg7 <= ($signed((~&($signed((8'hb3)) && wire1))) ?
          (+(reg6[(3'h7):(1'h0)] ?
              {(~|wire0)} : (wire5[(4'ha):(3'h4)] ?
                  (wire2 ^ wire4) : (~&wire0)))) : wire1[(2'h3):(2'h2)]);
      reg8 <= (~&$signed($signed((|{reg7, reg7}))));
    end
  assign wire9 = (+((8'ha4) ?
                     (($unsigned(wire0) ? wire2 : (&wire2)) ?
                         ($unsigned(reg7) ?
                             (|reg8) : (wire3 != (8'hbc))) : (wire4 ?
                             reg6[(4'hb):(1'h1)] : wire3)) : $signed($signed($signed(reg8)))));
  always
    @(posedge clk) begin
      reg10 <= reg6[(4'hd):(3'h5)];
      reg11 <= (($unsigned(wire1[(3'h6):(1'h1)]) & reg10[(2'h3):(2'h2)]) ?
          $unsigned((+(reg6[(3'h7):(3'h5)] | $unsigned(wire2)))) : $unsigned($unsigned({reg8})));
      if (reg6[(4'h8):(1'h1)])
        begin
          reg12 <= $signed(((!(reg10[(1'h0):(1'h0)] ~^ (wire3 ?
              reg7 : wire3))) ~^ ({(-wire5)} ?
              {$signed(wire5),
                  (reg11 ? wire1 : wire2)} : reg11[(2'h3):(2'h3)])));
          reg13 <= reg11[(3'h4):(1'h1)];
          reg14 <= $signed(reg6);
          if (wire1[(3'h5):(2'h3)])
            begin
              reg15 <= (|(reg12[(1'h1):(1'h1)] ?
                  reg6 : ($signed($signed(reg14)) ?
                      (-wire0[(4'ha):(3'h4)]) : reg7[(1'h0):(1'h0)])));
              reg16 <= (reg6[(2'h2):(1'h1)] ?
                  (~$signed((~reg11))) : {(((wire0 ? wire4 : wire2) ?
                          $unsigned(reg15) : reg12) << reg11)});
              reg17 <= (|(wire0[(4'hc):(1'h1)] ~^ reg10[(2'h2):(1'h0)]));
              reg18 <= ($signed(wire9) >> (+$unsigned(wire5)));
              reg19 <= (~&($signed((+(wire5 ?
                  wire2 : reg11))) == reg13[(4'hb):(4'h9)]));
            end
          else
            begin
              reg15 <= (|$signed($unsigned($unsigned((+reg13)))));
              reg16 <= (^(!$signed(($unsigned((8'hbc)) >>> {reg16, reg18}))));
              reg17 <= $unsigned($signed($signed({(reg16 ? (8'h9c) : (8'h9e)),
                  (reg19 >>> wire9)})));
            end
          reg20 <= ({(reg17 ?
                      (~((8'ha5) ? wire4 : reg11)) : (|reg18[(3'h6):(1'h1)])),
                  $unsigned(reg14[(3'h4):(2'h2)])} ?
              reg19[(1'h0):(1'h0)] : $unsigned($unsigned((8'ha3))));
        end
      else
        begin
          reg12 <= {$unsigned((~^(((8'haf) ? wire2 : reg20) ^ (-wire5))))};
          reg13 <= wire3;
          reg14 <= $signed({wire5[(3'h7):(3'h7)]});
          if (wire1)
            begin
              reg15 <= (reg6 ?
                  {$signed(reg17[(2'h3):(2'h3)])} : ($unsigned(({wire4} << wire4)) + reg16[(3'h6):(3'h6)]));
            end
          else
            begin
              reg15 <= wire5;
            end
        end
    end
endmodule

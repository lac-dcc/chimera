module top
#(parameter param28 = (({{((8'hb0) >>> (8'hbf))}} ? (!(((8'ha3) ^ (7'h40)) ? (~&(8'hb1)) : {(8'hb9)})) : {{(~&(8'h9f)), (~|(8'hb5))}, (((8'hb1) << (8'hb2)) ? (|(8'ha4)) : {(8'hbd), (8'ha7)})}) ? (-((((8'ha2) ? (8'hb2) : (8'ha0)) >= ((8'hb8) ? (8'h9d) : (8'ha7))) ? ({(8'h9d), (8'had)} ? (~^(8'hb7)) : {(8'h9f), (8'hb9)}) : (((8'hb2) ? (8'hb3) : (8'ha0)) ? ((8'ha2) && (8'ha8)) : (8'hb0)))) : (~&({(~(8'had)), {(8'ha1)}} ? (((8'hae) != (8'hba)) <<< ((8'hb6) ? (8'hae) : (8'hbb))) : (((8'hbb) ? (7'h44) : (8'hbb)) ? {(8'hba), (8'ha4)} : ((8'hba) == (8'ha4)))))), 
parameter param29 = ((((param28 >> param28) ? (8'hae) : ((param28 << param28) ? (~&param28) : ((8'ha8) ? (8'h9d) : param28))) ? (^(-param28)) : {(8'hb3)}) >>> ((((param28 ? param28 : param28) ^~ {(8'hbc), param28}) >>> (&(param28 > param28))) ^ (8'hb3))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = {wire4[(4'hf):(4'hd)]};
  assign wire6 = $unsigned({wire3,
                     (((wire5 ? wire0 : (8'hb1)) << $signed(wire1)) ?
                         $signed((~^wire4)) : (|(wire4 ? wire2 : (8'ha0))))});
  assign wire7 = wire0;
  assign wire8 = ((-($unsigned($unsigned(wire1)) ?
                         $unsigned((wire6 ?
                             wire6 : wire4)) : ({(8'haf)} <= wire2[(4'ha):(3'h6)]))) ?
                     wire2 : ({wire5, {(~|wire6), (^wire2)}} - {(&(|wire6))}));
  assign wire9 = (!(wire6 ~^ (-$unsigned($signed(wire5)))));
  assign wire10 = wire3;
  assign wire11 = ($unsigned(wire3) <= wire8[(5'h11):(3'h5)]);
  assign wire12 = (|(($signed($signed(wire8)) != ($signed((8'hb5)) ?
                          (~|wire2) : (~^wire8))) ?
                      (~{$signed(wire2),
                          (wire10 == wire0)}) : $unsigned((^~(&wire4)))));
  assign wire13 = wire4;
  assign wire14 = (8'hbd);
  assign wire15 = (wire12[(2'h2):(1'h1)] == ((^~wire5[(2'h2):(2'h2)]) ?
                      wire3[(4'hb):(4'ha)] : wire12[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg16 <= ((wire1 >> wire2) || ((wire12[(2'h2):(2'h2)] >= $signed((wire1 ?
              wire12 : wire11))) ?
          $signed(wire9) : wire7));
      if (wire12)
        begin
          if ($signed((8'ha3)))
            begin
              reg17 <= wire3[(4'hd):(2'h3)];
              reg18 <= (~&$unsigned($signed((|reg16[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg17 <= wire5;
              reg18 <= wire6;
            end
          reg19 <= $unsigned($signed(wire13[(3'h6):(3'h5)]));
          reg20 <= $signed(($signed((^(wire10 && reg16))) ?
              wire13[(3'h4):(1'h1)] : $signed((-$signed(wire15)))));
          if ((wire10[(2'h2):(1'h1)] ?
              {wire5[(1'h1):(1'h0)],
                  ((!{wire6}) ?
                      $unsigned((&(8'ha4))) : wire5[(2'h2):(2'h2)])} : (~|((reg20 ?
                  $signed(wire7) : (^wire4)) != $unsigned({(8'had)})))))
            begin
              reg21 <= {(wire2 ?
                      ((^(!wire6)) ?
                          (8'hae) : wire7[(2'h3):(2'h2)]) : {reg18[(2'h3):(1'h1)],
                          ($unsigned((8'haf)) ? (~|wire13) : (~|wire3))}),
                  (~&(wire3[(4'h8):(4'h8)] ?
                      (^~wire8) : wire5[(1'h1):(1'h0)]))};
              reg22 <= (wire12[(5'h12):(3'h7)] ?
                  {($signed({wire9, wire10}) > reg21)} : wire1[(3'h6):(3'h6)]);
              reg23 <= $signed(wire6[(3'h4):(2'h3)]);
              reg24 <= wire6[(4'he):(4'ha)];
              reg25 <= (!({reg21, $signed({wire11, wire5})} ?
                  (~^$signed($unsigned(reg24))) : $signed({$signed(wire6)})));
            end
          else
            begin
              reg21 <= $unsigned((^wire1));
              reg22 <= {(wire12[(5'h12):(4'hc)] * $signed((+$unsigned(reg25))))};
              reg23 <= (((~^(8'hb2)) >>> $unsigned($signed(reg21[(1'h0):(1'h0)]))) & (8'had));
              reg24 <= ($signed(reg24) ?
                  wire15 : ($unsigned(($unsigned(reg17) ?
                      {reg21} : $unsigned(reg17))) ~^ $signed($signed((~&wire8)))));
              reg25 <= ($unsigned($signed(wire11[(2'h2):(1'h0)])) ?
                  wire14[(2'h3):(2'h3)] : (-(~&wire2)));
            end
          reg26 <= $signed(wire10[(2'h2):(1'h1)]);
        end
      else
        begin
          if ((((&{(|wire1),
                  $signed(wire3)}) ^ $signed((-reg23[(1'h1):(1'h1)]))) ?
              $unsigned((^~(~|reg25[(1'h1):(1'h0)]))) : wire9[(1'h1):(1'h1)]))
            begin
              reg17 <= $unsigned(reg21[(3'h5):(2'h3)]);
              reg18 <= $signed($unsigned((|$signed((&wire0)))));
              reg19 <= (+wire4);
              reg20 <= $signed(wire11);
            end
          else
            begin
              reg17 <= wire4[(3'h5):(1'h1)];
              reg18 <= $unsigned($unsigned(reg19));
              reg19 <= ($signed({$unsigned($unsigned(reg16)),
                      ((reg22 ? wire4 : reg26) - wire13[(3'h4):(3'h4)])}) ?
                  (8'haa) : (+(wire6 * $unsigned({wire11, reg26}))));
              reg20 <= $unsigned({$unsigned(($unsigned(wire14) & (+reg24)))});
              reg21 <= reg22[(1'h0):(1'h0)];
            end
        end
      reg27 <= (-{(~|(~|$signed((8'hbf)))), wire8});
    end
endmodule

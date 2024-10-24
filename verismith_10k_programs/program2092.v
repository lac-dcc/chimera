module top
#(parameter param23 = ((((&{(8'hbe)}) ~^ (((8'ha4) << (8'hb3)) ? (~&(8'hb0)) : ((8'hb4) || (8'ha0)))) * ((((8'hbf) & (7'h43)) ^~ ((8'hb9) ? (7'h42) : (8'ha3))) ? (^~(8'hbf)) : (((8'ha5) ? (8'ha4) : (8'hba)) < (&(8'ha5))))) ? ((^(+(&(8'h9e)))) ? (~&(((8'hbe) ? (8'ha6) : (8'h9e)) ? ((8'haa) ? (8'hbe) : (8'hbb)) : ((7'h42) | (8'ha3)))) : {{((8'h9c) ^ (8'had))}, (|(~&(8'ha8)))}) : (&(!((!(8'haf)) ^~ ((8'hbb) <= (8'hb7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire22,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire5 = $unsigned((^~(!$signed($signed(wire2)))));
  assign wire6 = wire2[(4'h9):(4'h9)];
  assign wire7 = ((wire6[(2'h2):(1'h1)] ? wire2 : wire4) == wire4);
  assign wire8 = wire5[(1'h1):(1'h0)];
  assign wire9 = ((wire1 ^~ $signed(wire0)) * $signed({((wire0 ?
                         wire7 : wire7) | (wire5 ? wire3 : wire7)),
                     $signed($unsigned(wire2))}));
  assign wire10 = wire8[(3'h5):(1'h0)];
  assign wire11 = wire7[(1'h1):(1'h0)];
  assign wire12 = ($unsigned((-wire6)) >>> ({wire7[(3'h7):(3'h5)]} ?
                      (~wire9) : (wire8[(4'hf):(1'h1)] >> $unsigned(wire3[(4'hf):(4'hc)]))));
  assign wire13 = ((^(8'hbc)) != {$signed(wire12)});
  assign wire14 = wire13[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg15 <= wire9[(1'h1):(1'h0)];
          if ((wire0 ?
              $signed((~&(^$unsigned(wire1)))) : (((~(|wire6)) ?
                  {wire7[(4'hc):(4'ha)]} : wire5) << $unsigned((wire11[(4'h8):(3'h6)] << wire10[(3'h6):(3'h5)])))))
            begin
              reg16 <= wire3;
              reg17 <= {$signed(({(~|wire12),
                      (~(8'ha9))} && $unsigned($signed((8'hb3))))),
                  $signed(wire12)};
            end
          else
            begin
              reg16 <= (~^({(wire8[(5'h10):(2'h3)] ^~ $unsigned(wire5))} ?
                  $unsigned($signed(((8'hab) ? (8'hb9) : reg17))) : (~|reg17)));
              reg17 <= wire8;
            end
          reg18 <= wire13;
          reg19 <= wire10[(3'h7):(1'h1)];
          reg20 <= ((|reg18[(2'h2):(2'h2)]) ~^ (($signed($unsigned(reg19)) ~^ {wire13[(2'h3):(1'h0)]}) ?
              (wire1 | {wire7[(4'hd):(4'hd)]}) : $unsigned({$unsigned(wire7)})));
        end
      else
        begin
          reg15 <= {wire5[(3'h4):(3'h4)]};
          reg16 <= $unsigned((!($unsigned(((8'hbe) <= reg16)) ?
              reg17 : ((8'ha7) || wire10[(3'h6):(1'h0)]))));
        end
      reg21 <= (8'ha6);
    end
  assign wire22 = (((wire5 ?
                              $signed(wire8[(4'hc):(4'hc)]) : $signed($unsigned(wire5))) ?
                          (^~wire8) : (8'hb0)) ?
                      $unsigned($signed(($unsigned(wire7) ?
                          (reg17 && wire7) : (wire11 >= wire0)))) : ($signed(wire6) == ((~((8'ha0) ?
                              (8'hb3) : reg21)) ?
                          {(wire2 + wire9),
                              reg19[(1'h0):(1'h0)]} : reg15[(4'ha):(3'h5)])));
endmodule

module top
#(parameter param16 = ({((8'haa) != (((8'ha9) ? (8'ha2) : (8'hb6)) > ((7'h42) ? (8'hab) : (8'hba))))} ? ((~|(((8'hb6) < (7'h41)) && ((8'hae) + (8'hb5)))) << ((((8'hb0) * (8'ha5)) ? {(7'h44), (7'h43)} : ((8'ha9) ? (8'hb5) : (8'ha1))) ? {((8'h9c) ? (8'hb9) : (8'hae)), (~|(8'ha0))} : ({(8'hba)} <= ((8'ha1) ? (8'ha5) : (8'ha4))))) : (((((8'hba) ? (8'hb9) : (8'hb4)) ? (~|(8'hbc)) : ((7'h41) ? (8'ha1) : (8'hb7))) + ({(8'ha8)} ? (8'ha4) : ((8'hbb) ? (8'hb4) : (8'hbf)))) ? ((|((8'hac) ? (8'hbb) : (8'ha8))) <<< (|(~^(8'hb9)))) : ((8'hb0) & ({(8'h9c), (8'hb1)} + ((8'hb2) ? (8'ha1) : (8'hbd)))))), 
parameter param17 = ((((~|(param16 ^~ param16)) ? param16 : ({param16, param16} || (param16 ? (8'haf) : param16))) != ((~(^~param16)) ? ((param16 ? param16 : (8'hbe)) <<< (|param16)) : param16)) ^ ((((param16 <= param16) || {param16, param16}) ? ((param16 ? param16 : param16) || param16) : {(+param16)}) <= param16)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (^((~^($signed((8'hb5)) ? ((7'h43) ? wire1 : wire1) : wire3)) ?
                     ({(~^wire1)} ?
                         (+(wire3 ? wire0 : wire0)) : (wire2[(3'h6):(3'h4)] ?
                             $signed(wire2) : {(8'ha9)})) : $signed((((8'hb1) - wire1) ?
                         wire3[(2'h2):(1'h0)] : $unsigned(wire0)))));
  always
    @(posedge clk) begin
      if ((($unsigned($unsigned(((8'hb5) << wire4))) ^ (^~$unsigned($unsigned(wire2)))) ?
          (wire3[(1'h0):(1'h0)] < (8'haf)) : (!(-wire0))))
        begin
          if ((wire2[(4'h8):(4'h8)] + $unsigned((wire3 ?
              wire1[(3'h4):(2'h2)] : $unsigned($unsigned(wire1))))))
            begin
              reg5 <= wire0;
              reg6 <= wire1;
              reg7 <= ((!($signed(wire2[(3'h7):(2'h2)]) ?
                      {(wire2 ? wire0 : wire4),
                          (reg5 ? reg6 : reg6)} : reg5[(3'h4):(3'h4)])) ?
                  ($signed($signed((!reg6))) > wire3[(1'h1):(1'h0)]) : reg5[(3'h5):(3'h4)]);
            end
          else
            begin
              reg5 <= reg6;
            end
          reg8 <= wire0[(1'h1):(1'h0)];
          reg9 <= reg6[(3'h4):(2'h3)];
        end
      else
        begin
          reg5 <= (^wire3);
          reg6 <= reg6[(3'h4):(3'h4)];
          reg7 <= $unsigned($unsigned($unsigned(reg7[(3'h5):(3'h5)])));
          reg8 <= (reg6[(4'h8):(1'h1)] ?
              wire2[(3'h7):(3'h5)] : ((^wire2[(3'h7):(1'h0)]) ^ $unsigned((reg5[(3'h4):(2'h3)] != wire1[(3'h6):(2'h2)]))));
          reg9 <= $signed(wire2[(3'h7):(3'h4)]);
        end
      reg10 <= reg5;
      reg11 <= $unsigned(($signed(wire0[(3'h5):(3'h4)]) ?
          ((|$unsigned(reg5)) - $signed($signed(wire0))) : $unsigned(reg6[(4'h8):(2'h2)])));
      reg12 <= $unsigned($unsigned($signed(reg7[(4'h9):(3'h5)])));
    end
  assign wire13 = {{{$signed(wire3)}}};
  assign wire14 = ((wire3 ? $unsigned(wire2[(3'h4):(2'h3)]) : wire2) ?
                      wire1[(2'h3):(1'h0)] : reg10);
  assign wire15 = reg5;
endmodule

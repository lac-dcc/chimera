// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

/*
    This module switch on 7-seg leds as a hex data
    so you need to wire-up data with needed hex halfbyte
    and leds to needed HEXN group
    
    ////////////////
    //            //
    //    0       //
    //    --      //
    //  5|  | 1   //
    //    --6     //
    //  4|  | 2   //
    //    --      //
    //    3       //
    //            //
    ////////////////

    Usage example:
    
    reg [7:0] data;
    led7 #(.COUNT(2)) x2 ( .data(data), leds({HEX1, HEX0}) )
    OR
    led7 led7_hi ( .data(data[4 +: 4]), .leds(HEX1) );    
    led7 led7_lo ( .data(data[0 +: 4]), .leds(HEX0) );
    
*/

module led7 #(
    parameter COUNT = 1        //Quantity of used 7-segs leds
)(
    input  [4*COUNT-1:0] data,
    output [8*COUNT-1:0] leds
);

wire [3:0] in  [0:COUNT-1];
reg  [7:0] out [0:COUNT-1];

genvar i;
generate 
    for (i=0; i<=COUNT-1; i=i+1)
    begin : groups
        assign in[i] = data[4*i +: 4];
        assign leds[8*i +: 8] = out[i];

        always@ (in[i])
        case (in[i])        //6543201
            4'h0: out[i] = 8'b11000000;
            4'h1: out[i] = 8'b11111001;
            4'h2: out[i] = 8'b10100100;
            4'h3: out[i] = 8'b10110000;
            4'h4: out[i] = 8'b10011001;
            4'h5: out[i] = 8'b10010010;
            4'h6: out[i] = 8'b10000010;
            4'h7: out[i] = 8'b11111000;
            4'h8: out[i] = 8'b10000000;
            4'h9: out[i] = 8'b10010000;
            4'ha: out[i] = 8'b10001000;
            4'hb: out[i] = 8'b10000011;
            4'hc: out[i] = 8'b11000110;
            4'hd: out[i] = 8'b10100001;
            4'he: out[i] = 8'b10000110;
            4'hf: out[i] = 8'b10001110;
            default: out[i] = 8'h7f;
        endcase       
    end
endgenerate

endmodule

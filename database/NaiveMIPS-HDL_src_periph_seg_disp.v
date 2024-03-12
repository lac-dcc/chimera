module seg_disp (
    input wire clk,    // Clock
    input wire [31:0] din,  
    output reg [7:0] seg,
    output reg [7:0] com
);

wire[6:0] seg_all[0:7];
reg[2:0] scan;
reg[12:0] divider;

genvar k;
generate
    for(k=0;k<8;k=k+1) begin : proc_decoder
        SEG7_LUT decoder(seg_all[k], din[(k+1)*4-1:k*4]);
    end
endgenerate

always @(posedge clk) begin : proc_divider
    begin
        divider <= divider + 1'b1;
    end
end

integer i;
always @(posedge clk) begin : proc_scan
    begin
        scan <= scan + (&divider);
        com <= ~(1<<scan);
        seg <= ~seg_all[scan];
        // for (i = 0; i < 8; i=i+1) begin
        //  if(scan == i)begin 
        //      seg <= seg_all[i];
        //  end
        // end
    end
end

endmodule
module SEG7_LUT (   oSEG,iDIG   );
input   [3:0]   iDIG;
output  [6:0]   oSEG;
reg     [6:0]   oSEG;
always @(*)
begin
        case(iDIG)
        4'h1: oSEG = 7'b1111001;    // ---t----
        4'h2: oSEG = 7'b0100100;    // |      |
        4'h3: oSEG = 7'b0110000;    // lt    rt
        4'h4: oSEG = 7'b0011001;    // |      |
        4'h5: oSEG = 7'b0010010;    // ---m----
        4'h6: oSEG = 7'b0000010;    // |      |
        4'h7: oSEG = 7'b1111000;    // lb    rb
        4'h8: oSEG = 7'b0000000;    // |      |
        4'h9: oSEG = 7'b0011000;    // ---b----
        4'ha: oSEG = 7'b0001000;
        4'hb: oSEG = 7'b0000011;
        4'hc: oSEG = 7'b1000110;
        4'hd: oSEG = 7'b0100001;
        4'he: oSEG = 7'b0000110;
        4'hf: oSEG = 7'b0001110;
        4'h0: oSEG = 7'b1000000;
        endcase
end
endmodule

`default_nettype wire

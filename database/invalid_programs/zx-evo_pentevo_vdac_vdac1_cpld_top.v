module ide_video
(
    input wire mode,
    
    input wire [4:0] o_r,   // input from FPGA
    input wire [4:0] o_g,
    input wire [4:0] o_b,

    output wire [7:0] v_r,  // output to VDAC
    output wire [7:0] v_g,
    output wire [7:0] v_b
);

    lut lut_r (.mode(mode), .in(o_r), .out(v_r));
    lut lut_g (.mode(mode), .in(o_g), .out(v_g));
    lut lut_b (.mode(mode), .in(o_b), .out(v_b));

endmodule

module lut
(
    input wire mode,
    input wire [4:0] in,
    output wire [7:0] out
);

    wire [7:0] lut;
    assign out = mode ? {in, 3'b0} : lut;

    always_comb
        case (in)
            5'd0:    lut = 8'd0;
            5'd1:    lut = 8'd10;
            5'd2:    lut = 8'd21;
            5'd3:    lut = 8'd31;
            5'd4:    lut = 8'd42;
            5'd5:    lut = 8'd53;
            5'd6:    lut = 8'd63;
            5'd7:    lut = 8'd74;
            5'd8:    lut = 8'd85;
            5'd9:    lut = 8'd95;
            5'd10:   lut = 8'd106;
            5'd11:   lut = 8'd117;
            5'd12:   lut = 8'd127;
            5'd13:   lut = 8'd138;
            5'd14:   lut = 8'd149;
            5'd15:   lut = 8'd159;
            5'd16:   lut = 8'd170;
            5'd17:   lut = 8'd181;
            5'd18:   lut = 8'd191;
            5'd19:   lut = 8'd202;
            5'd20:   lut = 8'd213;
            5'd21:   lut = 8'd223;
            5'd22:   lut = 8'd234;
            5'd23:   lut = 8'd245;
            5'd24:   lut = 8'd255;
            default: lut = 8'd255;
        endcase

endmodule

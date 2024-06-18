// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b1_demux_1_4_case
(
    input      din, 
    input      [1:0] sel,
    output reg dout0, 
    output reg dout1,
    output reg dout2,
    output reg dout3
);
    always @(*)
        case (sel)
            2'b00: 
            begin
                dout0 = din;
                dout1 = 0;
                dout2 = 0;
                dout3 = 0;
            end
            2'b01: 
            begin
                dout0 = 0;
                dout1 = din;
                dout2 = 0;
                dout3 = 0;
            end
            2'b10: 
            begin
                dout0 = 0;
                dout1 = 0;
                dout2 = din;
                dout3 = 0;
            end
            2'b11: 
            begin
                dout0 = 0;
                dout1 = 0;
                dout2 = 0;
                dout3 = din;
            end
        endcase
    
endmodule

module b1_demux_1_4_shift
(
    input      din, 
    input      [1:0] sel,
    output reg dout0, 
    output reg dout1,
    output reg dout2,
    output reg dout3
);

    always @(*)
        {dout3, dout2, dout1, dout0}= din<<sel;
        
endmodule

module bn_demux_1_4_case
#(parameter DATA_WIDTH=2)
(
    input      [DATA_WIDTH-1:0] din, 
    input      [1:0] sel,
    output reg [DATA_WIDTH-1:0] dout0, 
    output reg [DATA_WIDTH-1:0] dout1,
    output reg [DATA_WIDTH-1:0] dout2,
    output reg [DATA_WIDTH-1:0] dout3
);

    always @(*)
        case (sel)
            2'b00: 
            begin
                dout0 = din;
                dout1 = 0;
                dout2 = 0;
                dout3 = 0;
            end
            2'b01: 
            begin
                dout0 = 0;
                dout1 = din;
                dout2 = 0;
                dout3 = 0;
            end
            2'b10: 
            begin
                dout0 = 0;
                dout1 = 0;
                dout2 = din;
                dout3 = 0;
            end
            2'b11: 
            begin
                dout0 = 0;
                dout1 = 0;
                dout2 = 0;
                dout3 = din;
            end
        endcase
        
endmodule

module b2_demux_1_4_block
(
    input   [1:0] din, 
    input   [1:0] sel,
    output  [1:0] dout0, 
    output  [1:0] dout1,
    output  [1:0] dout2,
    output  [1:0] dout3
);
    
    b1_demux_1_4_case dmux0  (.din(din[0]),      .sel(sel),          .dout0(dout0[0]), 
                              .dout1(dout1[0]),  .dout2(dout2[0]),   .dout3(dout3[0]));
    b1_demux_1_4_shift dmux1 (.din(din[1]),      .sel(sel),          .dout0(dout0[1]), 
                              .dout1(dout1[1]),  .dout2(dout2[1]),   .dout3(dout3[1]));
        
endmodule


//`define CASE 

module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

`ifdef CASE 
    bn_demux_1_4_case #(2) bn_demux_1_4_case (.din(SW[1:0]),     .sel(KEY[1:0]),    .dout0(LEDR[1:0]), 
                                              .dout1(LEDR[3:2]), .dout2(LEDR[5:4]), .dout3(LEDR[7:6]));
`else
    b2_demux_1_4_block b2_demux_1_4_block    (.din(SW[1:0]),     .sel(KEY[1:0]),    .dout0(LEDR[1:0]), 
                                              .dout1(LEDR[3:2]), .dout2(LEDR[5:4]), .dout3(LEDR[7:6]));
`endif
    
endmodule
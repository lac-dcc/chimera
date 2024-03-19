
`timescale 1ns / 1ps
`default_nettype none


module tb_bit_encoder();
    localparam RATE = 1000.0/100.0;
    
    initial begin
        $dumpfile("tb_bit_encoder.vcd");
        $dumpvars(1, tb_bit_encoder);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    
    
    parameter   DATA_WIDTH = 24;
    parameter   SEL_WIDTH  = DATA_WIDTH <     2 ?  1 :
                             DATA_WIDTH <     4 ?  2 :
                             DATA_WIDTH <     8 ?  3 :
                             DATA_WIDTH <    16 ?  4 :
                             DATA_WIDTH <    32 ?  5 :
                             DATA_WIDTH <    64 ?  6 :
                             DATA_WIDTH <   128 ?  7 :
                             DATA_WIDTH <   256 ?  8 :
                             DATA_WIDTH <   512 ?  9 :
                             DATA_WIDTH <  1024 ? 10 :
                             DATA_WIDTH <  2048 ? 11 :
                             DATA_WIDTH <  4096 ? 12 :
                             DATA_WIDTH <  8192 ? 13 :
                             DATA_WIDTH < 16384 ? 14 :
                             DATA_WIDTH < 32768 ? 15 : 16;
    
    
    reg     [DATA_WIDTH-1:0]    in_data = 1;
    wire    [SEL_WIDTH-1:0]     out_sel_onehot;
    wire    [SEL_WIDTH-1:0]     out_sel_msb;
    wire    [SEL_WIDTH-1:0]     out_sel_lsb;
    
    always @(posedge clk) begin
        in_data <= {in_data[DATA_WIDTH-2:0], in_data[DATA_WIDTH-1]};
    end
    
    jelly_bit_encoder
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .PRIORITYT      (0),
                .LSB_FIRST      (0)
            )
        i_bit_encoder_onehot
            (
                .in_data        (in_data),
                .out_sel        (out_sel_onehot)
            );
    
    jelly_bit_encoder
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .PRIORITYT      (1),
                .LSB_FIRST      (0)
            )
        i_bit_encoder_msb
            (
                .in_data        (in_data),
                .out_sel        (out_sel_msb)
            );
    
    jelly_bit_encoder
            #(
                .DATA_WIDTH     (DATA_WIDTH),
                .PRIORITYT      (1),
                .LSB_FIRST      (1)
            )
        i_bit_encoder_lsb
            (
                .in_data        (in_data),
                .out_sel        (out_sel_lsb)
            );
    
    
    
endmodule


`default_nettype wire


// end of file

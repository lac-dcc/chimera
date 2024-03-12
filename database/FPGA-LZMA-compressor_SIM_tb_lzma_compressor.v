
module tb_lzma_compressor ();


reg clk = 1'b0;
reg rstn = 1'b0;
always #5 clk = ~clk;
initial begin repeat(5) @(posedge clk); rstn <= 1'b1; end


wire        i_ready;
wire        i_valid;
wire        i_last;
wire [ 7:0] i_data;


wire        o_valid;
wire [ 7:0] o_data;
wire        o_last;



tb_random_data_source u_tb_random_data_source (      // generate input data
    .clk             ( clk                 ),
    .tready          ( i_ready             ),
    .tvalid          ( i_valid             ),
    .tdata           ( i_data              ),
    .tlast           ( i_last              )
);



lzma_compressor_top u_lzma_compressor_top (          // design under test
    .rstn            ( rstn                ),
    .clk             ( clk                 ),
    .i_ready         ( i_ready             ),
    .i_valid         ( i_valid             ),
    .i_last          ( i_last              ),
    .i_data          ( i_data              ),
    .o_valid         ( o_valid             ),
    .o_data          ( o_data              ),
    .o_last          ( o_last              )
);



tb_save_result_to_file u_tb_save_result_to_file (    // save output data
    .clk             ( clk                 ),
    .tvalid          ( o_valid             ),
    .tdata           ( o_data              ),
    .tlast           ( o_last              )
);



reg [31:0] cyc = 0;
always @ (posedge clk)
    if (i_valid | o_valid)
        cyc <= 0;
    else if (cyc < 999999)
        cyc <= cyc + 1;
    else
        $finish;


//initial $dumpvars(0, u_lzma_compressor_top);


endmodule


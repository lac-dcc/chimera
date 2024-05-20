// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

module kda_input_data_channel (
     input clk_i
    ,input reset_i

    ,input [63:0]     data_i 
    ,input            v_i
    ,output           ready_o

    ,output [1:0]     chunks
    ,output [5:0]     salt_len
    ,output [31:0]    iters
    ,output [511:0]   pass
    ,output [511:0]   salt
    ,output           v_o
    ,input            ready_i
  );

    logic [16:0] valid_lo;
    logic [1087:0] data_sipo;
    logic [4:0] yumi_cnt;
    
    bsg_serial_in_parallel_out #(
       .width_p(64)
      ,.els_p (17)
    ) sipo (
       .clk_i      (clk_i)
      ,.reset_i    (reset_i)
      ,.valid_i    (v_i)
      ,.data_i     (data_i)
      ,.ready_o    (ready_o)

      ,.valid_o    (valid_lo)
      ,.data_o     (data_sipo)

      ,.yumi_cnt_i (yumi_cnt)
    );

    assign chunks   = data_sipo[1063:1062];
    assign salt_len = data_sipo[1061:1056];
    assign iters    = data_sipo[1055:1024];
    assign pass     = data_sipo[1023:512];
    assign salt     = data_sipo[511:0];

    // Wait until we get all the data
    logic sipo_yumi;
    assign v_o = &valid_lo;
    assign sipo_yumi = ready_i & v_o;
    assign yumi_cnt = sipo_yumi? 17 : '0;

endmodule

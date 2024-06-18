// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

module kda_output_data_channel(
     input clk_i
    ,input reset_i

    ,input [1023:0]    data_i 
    ,input                             v_i
    ,output                            yumi_o

    ,output [63:0]                     data_o
    ,output                            v_o
    ,input                             yumi_i
  );

    logic ready_lo;

    bsg_parallel_in_serial_out #(
       .width_p(64)
      ,.els_p (16)
    ) piso (
       .clk_i       (clk_i)
      ,.reset_i     (reset_i)

      ,.valid_i     (v_i)
      ,.data_i      (data_i)
      ,.ready_and_o (ready_lo)

      ,.valid_o     (v_o)
      ,.data_o      (data_o)
      ,.yumi_i      (yumi_i)
    );

    assign yumi_o = v_i & ready_lo;

endmodule


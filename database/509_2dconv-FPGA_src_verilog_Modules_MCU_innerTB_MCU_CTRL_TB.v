// This program was cloned from: https://github.com/ivanvig/2dconv-FPGA
// License: MIT License

module tb_MCU_CTRL();

    parameter N = 2;
    parameter STATES = 3;
    
    reg                          i_sop, i_eop, clk, rst, i_chblk;

    wire [N+1:0]                 o_we;
    wire [$clog2(STATES)-1:0]    o_state;
    wire [$clog2(N/2+1) - 1:0]     o_substate;
    wire [$clog2(N+2) - 1:0]     o_memSelect;
    
    initial begin

        i_sop   = 1'b0;
        i_eop   = 1'b0;
        rst     = 1'b0;
        i_chblk = 1'b0;
        clk     = 1'b0;

        #10 rst = 1'b1;
        #20 rst = 1'b0;

        #100 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #200 i_sop = 1'b1;

        #300 i_sop = 1'b0;
             i_eop = 1'b1;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #100 i_sop = 1'b0;
        i_eop = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;

        #200 i_sop = 1'b1;

        #300 i_sop = 1'b0;
        i_eop = 1'b1;

        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;
        
        #10 i_chblk = 1'b1;
        #10 i_chblk = 1'b0;


        #500 $finish;
    end

    always #2.5 clk = ~clk;


    MCU_CTRL
        #(
          .N(N),
          .STATES(STATES)
          )

    u_MCU_CTRL
        (
         .i_sop(i_sop),
         .i_eop(i_eop),
         .i_chblk(i_chblk),
         .clk(clk),
         .rst(rst),

         .o_we(o_we),
         .o_state(o_state),
         .o_substate(o_substate),
         .o_memSelect(o_memSelect)
         );
    
endmodule

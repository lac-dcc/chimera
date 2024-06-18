// This program was cloned from: https://github.com/DaveBerkeley/serv_soc
// License: MIT License


   /*
    *
    */

task tb_assert(input test);

    begin
        if (!test) begin
            $display("ASSERTION FAILED in %m");
            $finish;
        end
    end

endtask

   /*
    *
    */

module SB_PLL40_PAD
    #(
        parameter FEEDBACK_PATH = 0,
        parameter [3:0] DIVR = 0,
        parameter [2:0] DIVQ = 0,
        parameter [2:0] FILTER_RANGE = 0,
        parameter [6:0] DIVF = 0
    )
    (   
        /* verilator lint_off UNUSED */
        input RESETB,
        input PACKAGEPIN,
        input BYPASS,
        output PLLOUTCORE = 0,
        output LOCK = 1
        /* verilator lint_on UNUSED */
    );

    always @(posedge PACKAGEPIN) begin
        PLLOUTCORE <= !PLLOUTCORE;
    end

endmodule



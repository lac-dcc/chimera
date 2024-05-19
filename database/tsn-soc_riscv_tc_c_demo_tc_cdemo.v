// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10fs

module sim_riscv;

    tb_top tb();

    wire sim_finish = tb.u_dut.u_csr.u_csrfile.sim_finish;
    wire [31:0] t3 = tb.u_dut.u_issue.u_regfile.x28_t3_w[31:0];
    wire [31:0] t4 = tb.u_dut.u_issue.u_regfile.x29_t4_w[31:0];

    integer i;
    integer f;

    initial
    begin
        $display("\n\nStarting testbench--riscv C program demo test\n");
    
        if (`TRACE)
        begin
            $dumpfile("waveform.fst");
            $dumpvars(0, sim_riscv);
        end
    
        // Reset
        tb.clk   = 0;
        tb.rst_n = 0;
        repeat (5) @(posedge tb.clk);
        tb.rst_n = 1;
    
        // Load TCM memory
        for (i=0;i<131072;i=i+1)
            tb.mem[i] = 0;
    
        f = $fopen("./tcm.bin", "r");
        i = $fread(tb.mem, f);
        for (i=0;i<131072;i=i+1)
            tb.u_mem.write(i, tb.mem[i]);

        // Wait for finish
        wait(sim_finish == 1);

        $display("t4 = %d\n", t4);

        if(t3 == 32'b1) 
            $display("C demo test PASS!!!");
        else
            $display("C demo test FAIL!!!");

        $finish;
    end

endmodule

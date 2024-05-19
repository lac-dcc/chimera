// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/10fs

module sim_riscv;

    tb_top tb();

    wire sim_finish = tb.u_dut.u_csr.u_csrfile.sim_finish;
    wire [31:0] t3 = tb.u_dut.u_issue.u_regfile.x28_t3_w[31:0];
    wire [31:0] t4 = tb.u_dut.u_issue.u_regfile.x29_t4_w[31:0];
    wire [31:0] begin_signature = {15'b0, t3[16:0]};
    wire [31:0] end_signature   = {15'b0, t4[16:0]};

    integer i;
    integer f;
    integer fout;
    reg [300*8:1] signature_out;
    reg [31:0]    rd_data;

    initial
    begin
        $display("Starting testbench--riscv compliance test");
        signature_out = 2400'b0;
        rd_data = 32'b0;

        // Get testname from plusarg.
        if($value$plusargs("dumpfile=%s", signature_out)) begin
            $display("Signature output file: %0s.", signature_out);
        end
        else begin
            $display("Signature output file not provided, exit!");
            $finish;
        end
    
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

        // Dump signature to file
        fout = $fopen(signature_out);
        for (i = begin_signature; i < end_signature; i = i + 4) begin
            tb.u_mem.read(i, rd_data[7:0])    ;
            tb.u_mem.read(i+1, rd_data[15:8]) ;
            tb.u_mem.read(i+2, rd_data[23:16]);
            tb.u_mem.read(i+3, rd_data[31:24]);
            $fdisplay(fout, "%x", rd_data);
        end
        $fclose(fout);

        $finish;
    end

endmodule

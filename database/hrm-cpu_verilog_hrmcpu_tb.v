`default_nettype none

// Use of `define allows override from iverilog using -Dkey=value
`ifndef PROGRAM
`define PROGRAM "program.rom"
`endif

`ifndef ROMFILE
`define ROMFILE ""
`endif

module hrmcpu_tb;

    // input signals
    reg        cpu_debug = 0;
    reg        cpu_nxtInstr = 0;
    reg  [7:0] cpu_in_data = 0;
    reg        cpu_in_wr = 0; // write to CPU's INBOX
    reg        cpu_out_rd = 0;// read from CPU's OUTBOX
    // output signals
    wire       cpu_in_full;
    wire       cpu_out_empty;
    wire [7:0] cpu_out_data;
    // generic signals
    reg        clk     = 0;
    reg        i_rst   = 0;

    // Instanciate DUT
    hrmcpu CPU (
        // input ports
        .cpu_debug(cpu_debug),
        .cpu_nxtInstr(cpu_nxtInstr),
        .cpu_in_data(cpu_in_data),
        .cpu_in_wr(cpu_in_wr),
        .cpu_out_rd(cpu_out_rd),
        // output ports
        .cpu_in_full(cpu_in_full),
        .cpu_out_empty(cpu_out_empty),
        .cpu_out_data(cpu_out_data),
        // clk, rst
        .clk(clk),
        .i_rst(i_rst)
    );
    defparam CPU.PROGRAM = `PROGRAM;
    defparam CPU.ROMFILE = `ROMFILE;

    // Simulate clock
    always #1 clk = ~clk;

    // Start simulation
    initial begin

        $dumpfile(  "hrmcpu_tb.vcd");
        $dumpvars(0, hrmcpu_tb);

        #0 i_rst = 1;

        #2 i_rst = 0;

        //---load some data into INBOX----------------------------         
        #2 cpu_in_data = 8'h23;
           cpu_in_wr   = 1'b 1;
        #2 cpu_in_data = 8'h00;
           cpu_in_wr   = 1'b 0;

        // wait a bit
        #6

        //---load some data into INBOX (again)--------------------
        #2 cpu_in_data = 8'h15;
           cpu_in_wr   = 1'b 1;
        #2 cpu_in_data = 8'h00;
           cpu_in_wr   = 1'b 0;

        // wait a bit
        #6

        //---load some data into INBOX (again)--------------------
        #2 cpu_in_data = 8'h11;
           cpu_in_wr   = 1'b 1;
        #2 cpu_in_data = 8'h00;
           cpu_in_wr   = 1'b 0;

        //---load some data into INBOX (again)--------------------
        #2 cpu_in_data = 8'h22;
           cpu_in_wr   = 1'b 1;
        #2 cpu_in_data = 8'h00;
           cpu_in_wr   = 1'b 0;

        // wait a bit
        #100

        //---pop some data out of OUTBOX--------------------
        #2 cpu_out_rd = 1'b 1;
           $display("%t OUTBOX= %h", $time, cpu_out_data);
        #2 cpu_out_rd = 1'b 0;

        // wait a bit
        #100
        
        //---pop some data out of OUTBOX--------------------
        #2 cpu_out_rd = 1'b 1;
           $display("%t OUTBOX= %h", $time, cpu_out_data);
        #2 cpu_out_rd = 1'b 0;

        // wait a bit
        #2
        
        //---pop some data out of OUTBOX--------------------
        #2 cpu_out_rd = 1'b 1;
           $display("%t OUTBOX= %h", $time, cpu_out_data);
        #2 cpu_out_rd = 1'b 0;

        // wait a bit
        #2
        
        //---pop some data out of OUTBOX--------------------
        #2 cpu_out_rd = 1'b 1;
           $display("%t OUTBOX= %h", $time, cpu_out_data);
        #2 cpu_out_rd = 1'b 0;

        #1000 $finish;
    end

endmodule


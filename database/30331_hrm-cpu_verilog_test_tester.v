// This program was cloned from: https://github.com/adumont/hrm-cpu
// License: GNU General Public License v3.0

`define EOF 32'hFFFF_FFFF
`define NULL 0
`define MAX_LINE_LENGTH 1000

// Use of `define allows override from iverilog using -Dkey=value
`ifndef PROGRAM
`define PROGRAM "program.rom"
`endif

`ifndef ROMFILE
`define ROMFILE ""
`endif

`ifndef INBFILE
`define INBFILE "INBOX.txt"
`endif

`ifndef DUMPFILE
`define DUMPFILE "tester.vcd"
`endif

`ifndef TIME_LIMIT
`define TIME_LIMIT 5000
`endif

module tester;

    // input signals
    reg        cpu_debug = 0;
    reg        cpu_nxtInstr = 0;
    wire [7:0] cpu_in_data;
    wire       cpu_in_wr; // write to CPU's INBOX
    wire       cpu_out_rd;// read from CPU's OUTBOX
    // output signals
    wire       cpu_in_full;
    wire       cpu_out_empty;
    wire [7:0] cpu_out_data;
    // generic signals
    reg        clk     = 0;
    wire       i_rst;

    // Simulate clock
    always #1 clk = ~clk;

    // dump simulation data
    initial begin
        $dumpfile(`DUMPFILE);
        $dumpvars(0, tester);
    end

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

    readInputFile readInputFile0(
        .data_ready(cpu_in_wr),
        .data(cpu_in_data),
        .rst(i_rst)
    );

    forceEnd forceEnd0(); 

    readCPUOuput readCPUOuput(
        .clk(clk),
        .empty_n(~cpu_out_empty),
        .data(cpu_out_data),
        .pop_value(cpu_out_rd)
    );

endmodule

module forceEnd();
    reg row = 0;
    initial begin
        for(row=0; row<2; row=row+1 )
        begin
            if($time > `TIME_LIMIT) begin
                $display("TIME LIMIT REACHED");
                $finish;
            end
            else #1;
        end
    end
endmodule

module readInputFile (
    output reg [7:0] data,
    output reg data_ready,
    output reg rst
);
    integer file, count=0;
    reg row = 0;
    reg [7:0] num   = 0;
    reg [9:0] delay = 0; // 0-1023

    initial begin
        data=0;
        data_ready=0;
        rst = 1;

        file = $fopenr(`INBFILE);

        #2 rst=0;
        // endless loop (row is 1 bit)
        for(row=0; row<2; row=row+1 )
        begin
            // delay is in clk cycle (so we x2)
            count = $fscanf(file, "%d %h", delay, num);
            // if( count == 0 ) $finish;
            if( count == 2 ) begin
                #(2*delay-2);
                    $display("%t RX IN:%h", $time, num);
                    data = num;
                    data_ready = 1'b 1;

                #2  data_ready = 1'b 0;
            end
            else 
                #2 ;
        end

    end
endmodule

module readCPUOuput (
    input wire       clk,
    input wire       empty_n, // if there is something (aka. not empty)
    input wire [7:0] data,
    output reg pop_value
);
    reg [7:0] mdata = 0;
    reg just_read=0; // we've just read 1 value.

    always @(posedge clk)
    begin
        mdata <= mdata;
        pop_value <= 1'b 0;

        if(empty_n && ~just_read)
        begin
            pop_value <= 1'b 1;
            mdata <= data;
            just_read <= 1;
            $display("%t TX OUT: %h", $time, data);
        end

        // dirty hack to wait 1 clock cycle before reading again from OUTBOX FIFO
        if(just_read)
            just_read <= 0;

    end

endmodule

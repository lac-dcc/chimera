// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module test;

reg       rst, clk;
wire      wr_n, cen_fm, cen_fm2;
wire      a0;
wire [7:0] din, dout;

initial begin
    rst = 1'b0;
    #300 rst=1'b1;
    #3000 rst=1'b0;
end

initial begin
    clk = 1'b0;
    forever #10.417 clk=~clk; // 48MHz
end

jtframe_cen3p57 u_cen(
    .clk        ( clk       ),       // 48 MHz
    .cen_3p57   ( cen_fm    ),
    .cen_1p78   ( cen_fm2   )
);


wire signed  [15:0] left;
wire signed  [15:0] right;
wire                sample, ct1, ct2, irq_n;

 jt51 uut(
    .rst        (  rst      ),    // reset
    .clk        (  clk      ),    // main clock
    .cen        (  cen_fm   ),    // clock enable
    .cen_p1     (  cen_fm2  ), // clock enable at half the speed
    .cs_n       (  1'b0     ),   // chip select
    .wr_n       (  wr_n     ),   // write
    .a0         (  a0       ),
    .din        (  din      ), // data in
    .dout       (  dout     ), // data out
    // peripheral control
    .ct1        ( ct1       ),
    .ct2        ( ct2       ),
    .irq_n      ( irq_n     ),  // I do not synchronize this signal
    // Low resolution output (same as real chip)
    .sample     ( sample    ), // marks new output sample
    .left       ( left      ),
    .right      ( right     ),
    // Full resolution output
    .xleft      (           ),
    .xright     (           )
);

 time_commands u_cmd(
    .rst    ( rst   ),
    .clk    ( clk   ),
    .wr_n   ( wr_n  ),
    .a0     ( a0    ),
    .din    ( din   )
);

`ifdef DUMP
initial begin
    `ifdef NCVERILOG
    $shm_open("test.shm");
    //$shm_probe(test,"AS");
    $shm_probe(test.uut.u_mmr,"AS");
    $shm_probe(test.uut.u_timers,"AS");
    `else
    $dumpfile("test.lxt");
    //$dumpvars(0,test);
    $dumpvars(1,test);
    $dumpvars(1,test.uut);
    $dumpvars(0,test.u_cmd);
    $dumpvars(0,test.uut.u_mmr);
    $dumpvars(0,test.uut.u_timers);
    $dumpon;
    `endif
end
`endif

endmodule

//////////////////////////////////////////////////////////7
// Possible stimulus controllers

/////////////////////////////////////////////
// Read a file with the following format
// clock ticks,a0 value, din value
// 
// This file is dumped by JT51 during regular simulation
// The tick values are offset so there is no need for
// a long wait of the first tick count as the file is likely
// to start off with a very large value
module time_commands(
    input            rst,
    input            clk,
    output reg       wr_n,
    output reg       a0,
    output reg [7:0] din
);

integer next_tick, next_a0, next_din;
integer ticks;
integer file, check;

initial begin
    file=$fopen("test_cmd.txt","r");
    if( file==0 ) begin
        $display("Cannot open test_cmd.txt");
        $finish;
    end
    next_tick=-1;
    //check=$fscanf(file,"%d,%d,%x"\n, next_tick, next_a0, next_din );
    //ticks = next_tick-10;
end


always @(posedge clk, posedge rst) begin
    if( rst ) begin
        if( next_tick==-1) check <=$fscanf(file,"%d,%d,%x\n", next_tick, next_a0, next_din );
        ticks <= next_tick-10;
    end else begin
        ticks <= ticks+1;
        wr_n  <= 1'b1;
        if( ticks==next_tick ) begin
            din  <= next_din;
            a0   <= next_a0;
            wr_n <= 1'b0;
            check=$fscanf(file,"%d,%d,%x\n", next_tick, next_a0, next_din );
            if($feof(file)) begin
                #100 $finish;
            end
        end
    end
end

endmodule

/////////////////////////////////////////////
// Read hex file with commands

module hex_commands(
    input       rst,
    input       clk,
    output reg  wr_n,
    output      a0,
    output reg [7:0] din
);


// simulation control
reg [7:0] cmd[0:4096];
integer cnt, waitcnt;

assign a0 = ~cnt[0];
wire   busy = dout[7];

initial begin
    $readmemh( "cmd.hex", cmd);
end



always @(posedge clk, posedge rst) begin
    if( rst ) begin
        din  <= 8'd0;
        wr_n <= 1'b1;
        cnt  <= 0;
        waitcnt <= 0;
    end else begin
        wr_n <= 1'b1;
        if(!busy ) begin
            waitcnt <= waitcnt-1;
            if(waitcnt==0) begin
                $display("%d, %h, %d", a0, cmd[cnt], waitcnt);
                if( cnt[0]==1'b0 && (cmd[cnt]==0 || cmd[cnt]==1) ) begin
                    if( cmd[cnt]==0) begin
                        $finish;
                    end else begin
                        cnt<=cnt+4; // wait
                        waitcnt<={cmd[cnt+1],~11'h0};                    
                    end
                end
                else begin
                    din <= cmd[cnt];
                    cnt <= cnt+1;
                    wr_n <= 1'b0;
                    waitcnt <= 1;
                end                
            end
        end
    end
end

endmodule

module jtframe_cen3p57(
    input      clk,       // 48 MHz
    output reg cen_3p57,
    output reg cen_1p78
);

wire [10:0] step=11'd105;
wire [10:0] lim =11'd1408;
wire [10:0] absmax = lim+step;

reg  [10:0] cencnt=11'd0;
reg  [10:0] next;
reg  [10:0] next2;

always @(*) begin
    next  = cencnt+11'd105;
    next2 = next-lim;
end

reg alt=1'b0;

always @(posedge clk) begin
    cen_3p57 <= 1'b0;
    cen_1p78 <= 1'b0;
    if( cencnt >= absmax ) begin
        // something went wrong: restart
        cencnt <= 11'd0;
        alt    <= 1'b0;
    end else
    if( next >= lim ) begin
        cencnt <= next2;
        cen_3p57 <= 1'b1;
        alt    <= ~alt;
        if( alt ) cen_1p78 <= 1'b1;
    end else begin
        cencnt <= next;
    end
end
endmodule

//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`ifdef FROM_P3CTRL
`include "p3ctrl.v"
`endif

module p3_ctrl_tb;
    //After the test in p3ctrl_drivers_mem, we'll fuzz all the inputs
    event start_fuzz;
    
    
    reg clk;
    reg rst;
        
    reg A_done;
    wire rdy_for_A;
    reg rdy_for_A_ack;
    
    reg B_acc;
    reg B_rej;
    wire rdy_for_B;
    reg rdy_for_B_ack;
    
    reg C_done;
    wire rdy_for_C;
    reg rdy_for_C_ack;
    
    wire [1:0] sn_sel;
    wire [1:0] cpu_sel;
    wire [1:0] fwd_sel;
    
    wire [1:0] ping_sel;
    wire [1:0] pang_sel;
    wire [1:0] pong_sel;

    integer fd;
    integer dummy;

    initial begin
        $dumpfile("p3ctrl.vcd");
        $dumpvars;
        $dumplimit(1024000);
            
        clk <= 0;
        rst <= 0;
        
        A_done <= 0;
        rdy_for_A_ack <= 0;
        
        B_acc <= 0;
        B_rej <= 0;
        rdy_for_B_ack <= 0;
        
        C_done <= 0;
        rdy_for_C_ack <= 0;
        
        fd = $fopen("p3ctrl_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        while($fgetc(fd) != "\n") begin end //Skip first line of comments
        
        #2000 $finish;
    end

    always #5 clk <= ~clk;
    
    reg msg_printed = 0;
    
    always @(posedge clk) begin
        if ($feof(fd) && !msg_printed) begin
            msg_printed = 1;
            $display("Reached end of drivers file");
            #20
            ->start_fuzz;
        end
        #0.01
        dummy = $fscanf(fd, "%b%b%b%b%b%b%b", 
                A_done,
                rdy_for_A_ack,
                B_acc,
                B_rej,
                rdy_for_B_ack,
                C_done,
                rdy_for_C_ack
        );
    end
    
    initial begin
        @(start_fuzz)
        repeat (20) begin
            @(posedge clk);
            A_done <= $random;
            rdy_for_A_ack <= $random;
            B_acc <= $random;
            B_rej <= $random;
            rdy_for_B_ack <= $random;
            C_done <= $random;
            rdy_for_C_ack <= $random;
            //Note: as per assumptions made by the queues, there is always at 
            //least one cycle between starting and finishing
            @(posedge clk);
        end
        #20
        $finish;
    end


    p3ctrl DUT (
        .clk(clk),
        .rst(rst),
            
        .A_done(A_done),
        .rdy_for_A(rdy_for_A),
        .rdy_for_A_ack(rdy_for_A_ack),
            
        .B_acc(B_acc),
        .B_rej(B_rej),
        .rdy_for_B(rdy_for_B),
        .rdy_for_B_ack(rdy_for_B_ack),
            
        .C_done(C_done),
        .rdy_for_C(rdy_for_C),
        .rdy_for_C_ack(rdy_for_C_ack),
            
        .sn_sel(sn_sel),
        .cpu_sel(cpu_sel),
        .fwd_sel(fwd_sel),
            
        .ping_sel(ping_sel),
        .pang_sel(pang_sel),
        .pong_sel(pong_sel)
    );

endmodule

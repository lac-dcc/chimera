// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`timescale  1ns / 1ps

module tb_ALU;

// MAC Parameters
parameter PERIOD  = 20;


// MAC Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   ifmaps_row0_in                       = 0 ;
reg   ifmaps_row1_in                       = 0 ;
reg   ifmaps_row2_in                       = 0 ;
reg   ifmaps_row3_in                       = 0 ;
reg   ifmaps_row4_in                       = 0 ;
reg   [24:0]  weight_in                    = 0 ;
reg   load_ifmaps                          = 0 ;
reg   load_weight                          = 0 ;
reg   operation                            = 0 ;
reg   [4:0]  kernel_size                   = 0 ;

// MAC Outputs
wire  [4:0]  MAC_out                       ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    operation=1;
    kernel_size=5'b00001;
    rst_n=1;
    clk=0;
    #20;
    rst_n=0;
    #20;
    rst_n=1;
    #60;

    ld_weight(25'b1111111111111111111111111);
    #20;
    ld_ifmaps(1,1,0,0,0);
    #20;
    // ld_ifmaps(1,1,1,0,1);
    #20;
    // ld_ifmaps(0,0,0,0,0);
    #20;
    // ld_ifmaps(0,0,0,0,0);
    #20;
    // ld_ifmaps(0,0,0,0,0);
    #20;

    #1000;
    $finish;
end

ALU  u_ALU (
    .clk                     ( clk                    ),
    .rst_n                   ( rst_n                  ),
    .ifmaps_row0_in          ( ifmaps_row0_in         ),
    .ifmaps_row1_in          ( ifmaps_row1_in         ),
    .ifmaps_row2_in          ( ifmaps_row2_in         ),
    .ifmaps_row3_in          ( ifmaps_row3_in         ),
    .ifmaps_row4_in          ( ifmaps_row4_in         ),
    .weight_in               ( weight_in       [24:0] ),
    .load_ifmaps             ( load_ifmaps            ),
    .load_weight             ( load_weight            ),
    .operation               ( operation              ),
    .kernel_size             ( kernel_size     [4:0]  ),

    .MAC_out                 ( MAC_out         [4:0]  )
);

initial
begin
    $fsdbDumpfile("ALU_wave.fsdb");
	$fsdbDumpvars(0);   
    
end

task ld_ifmaps(input [0:0] data0,input [0:0] data1,input [0:0] data2,input [0:0] data3,input [0:0] data4);begin    

    load_ifmaps=1'd1; 
    ifmaps_row0_in = data0;
    ifmaps_row1_in = data1;
    ifmaps_row2_in = data2;
    ifmaps_row3_in = data3;
    ifmaps_row4_in = data4;
    #20
    load_ifmaps=1'd0; 
end
endtask 

task ld_weight(input [24:0]weight);begin
    load_weight=1;
    weight_in=weight;
    #20
    load_weight=0;
end
endtask

endmodule
// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`timescale  1ns / 1ps

module tb_MAC;

// MAC Parameters
parameter PERIOD      = 20;
parameter DATA_WIDTH  = 1;

// MAC Inputs
reg   clk                                   = 0 ;
reg   rst_n                                 = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row0_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row1_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row2_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row3_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row4_in = 0 ;
reg   ifmaps_input_valid                    = 0 ;
reg   [24:0]  weight_in                     = 0 ;
reg   load_ifmaps                           = 0 ;
reg   load_weight                           = 0 ;
reg   operation                             = 0 ;
reg   [4:0]  kernel_size                    = 0 ;

// MAC Outputs
wire  [4:0]  MAC_out                       ;


initial
begin
    forever #(PERIOD/2)  clk=~clk;
end

initial
begin
    operation=0;
    kernel_size=5'b00100;

    clk=0;
    rst_n = 1;
    #20;
    rst_n=0;
    #20;
    rst_n=1;
    #40;
    fifo_ifmaps_in(0,0,1,1,1);

    fifo_in_ld_ifmaps(1,0,0,1,1);
    fifo_in_ld_ifmaps(0,1,0,1,1);
    fifo_in_ld_ifmaps(1,1,1,1,1);
    
    ld_weight(25'b011010101);
    ld_weight(25'b101110101);
    ld_weight(25'b100101001);
    ld_weight(25'b110110101);

    fifo_in_ld_ifmaps(1,1,0,1,1);
    // ld_ifmaps();
    #40;
    

    ld_weight(25'b011010101);
    ld_weight(25'b101110101);
    ld_weight(25'b100101001);
    ld_weight(25'b110110101);

    #100000;
    $finish;
end

MAC 
#(
    .DATA_WIDTH (DATA_WIDTH )
)
u1_MAC(
    .clk                 (clk                 ),
    .rst_n               (rst_n               ),
    .ifmaps_fifo_row0_in (ifmaps_fifo_row0_in ),
    .ifmaps_fifo_row1_in (ifmaps_fifo_row1_in ),
    .ifmaps_fifo_row2_in (ifmaps_fifo_row2_in ),
    .ifmaps_fifo_row3_in (ifmaps_fifo_row3_in ),
    .ifmaps_fifo_row4_in (ifmaps_fifo_row4_in ),
    .ifmaps_input_valid  (ifmaps_input_valid  ),
    .weight_in           (weight_in           ),
    .MAC_out             (MAC_out             ),
    .load_ifmaps         (load_ifmaps         ),
    .load_weight         (load_weight         ),
    .operation           (operation           ),
    .kernel_size         (kernel_size         )
);


initial
begin
    $fsdbDumpfile("mac_wave1.fsdb");
	$fsdbDumpvars(0); 
end

task fifo_ifmaps_in(input [0:0] data0,input [0:0] data1,input [0:0] data2,input [0:0] data3,input [0:0] data4);begin    

    ifmaps_input_valid=1'd1; 
    ifmaps_fifo_row0_in = data0;
    ifmaps_fifo_row1_in = data1;
    ifmaps_fifo_row2_in = data2;
    ifmaps_fifo_row3_in = data3;
    ifmaps_fifo_row4_in = data4;
    #20;
    ifmaps_input_valid=1'd0; 
    #40;
end
endtask 

task ld_ifmaps();begin    

    load_ifmaps=1'd1; 
    #20;
    load_ifmaps=1'd0; 
    #40;
end
endtask 

task ld_weight(input [24:0]weight);begin
    load_weight=1;
    weight_in=weight;
    #20;
    load_weight=0;
    #40;
end
endtask

task fifo_in_ld_ifmaps(input [0:0] data0,input [0:0] data1,input [0:0] data2,input [0:0] data3,input [0:0] data4);begin    
    load_ifmaps=1'd1; 
    ifmaps_input_valid=1'd1; 
    ifmaps_fifo_row0_in = data0;
    ifmaps_fifo_row1_in = data1;
    ifmaps_fifo_row2_in = data2;
    ifmaps_fifo_row3_in = data3;
    ifmaps_fifo_row4_in = data4;
    #20;
    ifmaps_input_valid=1'd0; 
    load_ifmaps=1'd0; 
    #40;
end
endtask 

endmodule
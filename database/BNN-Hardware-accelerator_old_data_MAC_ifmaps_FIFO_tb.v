// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`timescale  1ns / 1ps

module tb_FIFO;

// MAC Parameters
parameter PERIOD      = 10;
parameter DATA_WIDTH  = 1;

// MAC_ifmaps_FIFO Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row0_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row1_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row2_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row3_in = 0 ;
reg   [DATA_WIDTH-1:0]  ifmaps_fifo_row4_in = 0 ;
reg   ifmaps_input_valid                   = 0 ;
reg   fifo_read                            = 0 ;

// MAC_ifmaps_FIFO Outputs
wire  [DATA_WIDTH-1:0]  ifmaps_fifo_row0_out ;
wire  [DATA_WIDTH-1:0]  ifmaps_fifo_row1_out ;
wire  [DATA_WIDTH-1:0]  ifmaps_fifo_row2_out ;
wire  [DATA_WIDTH-1:0]  ifmaps_fifo_row3_out ;
wire  [DATA_WIDTH-1:0]  ifmaps_fifo_row4_out ;
wire  fifo_full                            ;
wire  fifo_empty                           ;


initial
begin
    forever #(PERIOD)  clk=~clk;
end

initial
begin
    clk=0;
    rst_n  =  1;
    #20 rst_n=0;
    #20 rst_n=1;

    fifo_write(0,1,0,1,0);
    #40;
    fifo_write(1,1,1,1,1);
    #40;
    fifo_write(0,0,1,0,1);
    #40;
    fifo_write(1,0,1,1,0);
    #40;
    fifo_write(0,1,0,0,0);
    #40;
    fifo_read_func;
    #40;
    fifo_read_func;
    #40;
    fifo_read_func;

    #80;
    fifo_write(0,0,0,1,1);
    #40;
    fifo_write(1,0,0,0,0);
    #40;
    fifo_read_write(0,0,1,1,0);
    #40;
    fifo_read_write(0,1,1,1,0);
    #40;
    fifo_read_write(0,1,1,1,1);
    #40;

    #1000;
    $finish;
end

MAC_ifmaps_FIFO 
#(
    .DATA_WIDTH (DATA_WIDTH )
)
u_MAC_ifmaps_FIFO(
    .clk                  (clk                  ),
    .rst_n                (rst_n                ),
    .ifmaps_fifo_row0_in  (ifmaps_fifo_row0_in  ),
    .ifmaps_fifo_row1_in  (ifmaps_fifo_row1_in  ),
    .ifmaps_fifo_row2_in  (ifmaps_fifo_row2_in  ),
    .ifmaps_fifo_row3_in  (ifmaps_fifo_row3_in  ),
    .ifmaps_fifo_row4_in  (ifmaps_fifo_row4_in  ),
    .ifmaps_input_valid   (ifmaps_input_valid   ),
    .ifmaps_fifo_row0_out (ifmaps_fifo_row0_out ),
    .ifmaps_fifo_row1_out (ifmaps_fifo_row1_out ),
    .ifmaps_fifo_row2_out (ifmaps_fifo_row2_out ),
    .ifmaps_fifo_row3_out (ifmaps_fifo_row3_out ),
    .ifmaps_fifo_row4_out (ifmaps_fifo_row4_out ),
    .fifo_read            (fifo_read            ),
    .fifo_full            (fifo_full            ),
    .fifo_empty           (fifo_empty           )
);

initial begin
    $fsdbDumpfile("tb_wave_2.fsdb");
	$fsdbDumpvars();  
end

task fifo_write(input [0:0] data0,input [0:0] data1,input [0:0] data2,input [0:0] data3,input [0:0] data4);begin    

    ifmaps_input_valid=1'd1; 
    ifmaps_fifo_row0_in = data0;
    ifmaps_fifo_row1_in = data1;
    ifmaps_fifo_row2_in = data2;
    ifmaps_fifo_row3_in = data3;
    ifmaps_fifo_row4_in = data4;
    #20
    ifmaps_input_valid=1'd0; 
end
endtask 

task fifo_read_func;begin    

    fifo_read=1;
    #20
    fifo_read=0;

end
endtask 

task fifo_read_write(input [0:0] data0,input [0:0] data1,input [0:0] data2,input [0:0] data3,input [0:0] data4);begin    

    ifmaps_input_valid=1'd1; 
    ifmaps_fifo_row0_in = data0;
    ifmaps_fifo_row1_in = data1;
    ifmaps_fifo_row2_in = data2;
    ifmaps_fifo_row3_in = data3;
    ifmaps_fifo_row4_in = data4;
    fifo_read=1;
    #20
    ifmaps_input_valid=1'd0; 
    fifo_read=0;
end
endtask 

endmodule
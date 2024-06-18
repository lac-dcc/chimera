// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`timescale 1ns/1ps
`define INST_COMPUTE 32'd87 
`define INST_LOADIFMAPS 32'd88 
module test_tb;
    parameter PERIOD   = 20 ;
    parameter MAC_NUM  = 256;
    parameter C_S_AXIS_TDATA_WIDTH=32;
    parameter BRAM_ADDRESS_WIDTH=12;


    reg   clk                                  = 0 ;
    reg   rst_n                                = 0 ;
    reg read_en=0;
    reg read_length=0;
    reg [C_S_AXIS_TDATA_WIDTH-1:0]axi_control_0=0,axi_control_1=0,axi_control_2=0;
    wire operation,read_weight_preload,load_weight,bram_port_sel,bram_control_add1,bram_control_add2,address_reset;
    wire [4:0]kernel_size;
    wire [C_S_AXIS_TDATA_WIDTH-1:0] axi_control_3;
    wire data_valid;
    wire bram_A_en,bram_B_en;
    wire [11:0]bram_address_A,bram_address_B;
    wire [1279:0]weight_from_bram_A,weight_from_bram_B,weight_out;

    initial
    begin
        forever #(PERIOD/2)  clk=~clk;
    end

    initial
    begin
        set_CONV();
        set_kernel_size(5);
        
        clk=0;
        #200;
        rst_n=1;
        #40;
        compute_start();

        #20000;
        $stop;
    end
    
    initial begin
        $fsdbDumpfile("top_tb_wave.fsdb");
        $fsdbDumpvars(0);  
    end
    control_unit 
    #(
        .MAC_NUM              (MAC_NUM              ),
        .BRAM_ADDRESS_WIDTH   (BRAM_ADDRESS_WIDTH   ),
        .C_S_AXIS_TDATA_WIDTH (C_S_AXIS_TDATA_WIDTH )    
    )
    u_control_unit(
    	.clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        .operation              (operation              ),
        .kernel_size            (kernel_size            ),
        .read_weight_preload    (read_weight_preload    ),
        .load_weight            (load_weight            ),
        .bram_port_sel          (bram_port_sel          ),
        .bram_control_add1      (bram_control_add1      ),
        .bram_control_add2      (bram_control_add2      ),
        .address_reset          (address_reset          ),
        .weight_from_bram_valid (data_valid             ),//
        .axi_control_0          (axi_control_0          ),
        .axi_control_1          (axi_control_1          ),
        .axi_control_2          (axi_control_2          ),
        .axi_control_3          (axi_control_3          )
    );


    
    
    bram_control 
    #(
        .MAC_NUM            (MAC_NUM            ),
        .BRAM_ADDRESS_WIDTH (BRAM_ADDRESS_WIDTH )
    )
    u_bram_control(
    	.clk                (clk                ),
        .rst_n              (rst_n              ),
        .weight_from_bram_A (weight_from_bram_A ),
        .weight_from_bram_B (weight_from_bram_B ),
        .weight_out         (weight_out         ),
        .bram_address_A     (bram_address_A     ),
        .bram_address_B     (bram_address_B     ),
        .bram_A_en          (bram_A_en          ),
        .bram_B_en          (bram_B_en          ),
        .address_reset      (address_reset      ),
        .bram_control_add1  (bram_control_add1  ),
        .bram_control_add2  (bram_control_add2  ),
        .port_sel           (bram_port_sel      ),
        .data_valid         (data_valid         )
    );

    design_1_wrapper u_BRAM
    (.BRAM_PORTA_0_addr   (bram_address_A      ),
     .BRAM_PORTA_0_clk    (clk                 ),
     .BRAM_PORTA_0_din    (1280'd0             ),
     .BRAM_PORTA_0_dout   (weight_from_bram_A  ),
     .BRAM_PORTA_0_en     (1           ),
     .BRAM_PORTA_0_we     (0                   ),
     .BRAM_PORTB_0_addr   (bram_address_B      ),
     .BRAM_PORTB_0_clk    (clk                 ),
     .BRAM_PORTB_0_din    (1280'd0             ),
     .BRAM_PORTB_0_dout   (weight_from_bram_B  ),
     .BRAM_PORTB_0_en     (1           ),
     .BRAM_PORTB_0_we     (0                   ));
    

    task axi_control_set(input [31:0]data0,input [31:0]data1,input [31:0]data2);begin
        axi_control_0=data0;
        axi_control_1=data1;
        axi_control_2=data2;   
    end
    endtask

    task set_CONV();begin
        axi_control_1=0;
    end
    endtask

    task set_POOL();begin
        axi_control_1[0]=1;
    end
    endtask

    task set_kernel_size(input [2:0]kernel_size);begin
        case(kernel_size) 
            3'd1:axi_control_2[4:0]=5'b00001;
            3'd2:axi_control_2[4:0]=5'b00010;
            3'd3:axi_control_2[4:0]=5'b00100;
            3'd4:axi_control_2[4:0]=5'b01000;
            3'd5:axi_control_2[4:0]=5'b10000;
            default :axi_control_2[4:0]=5'b10000;                
        endcase
        
    end
    endtask

    task compute_start();begin
        axi_control_0=`INST_COMPUTE;
    end
    endtask

    task compute_finish(input [0:0]finish);begin
        axi_control_2[5]=finish;
    end
    endtask

endmodule
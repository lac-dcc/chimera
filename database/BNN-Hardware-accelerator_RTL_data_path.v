// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
	module ： data_path

	input  ： Control Signal、S_AXI、S_AXIS

	output ： M_AXIS
	
	將所有data path 模組連線並增加模組間的邏輯，如OR、MUX等資料選擇。

*/
`timescale  10ns / 10ns

`define INST_COMPUTE 32'd87 
`define INST_LOADIFMAPS 32'd88 

module data_path #(
    parameter MAC_NUM = 256,
    parameter WEITGHT_BRAM_ADDRESS_WIDTH = 12,
    parameter BIAS_BRAM_ADDRESS_WIDTH = 9,
    parameter C_S_AXIS_TDATA_WIDTH	= 32,
    parameter AXIS_PRELOAD_FIFO_DEPTH = 4,
    parameter AXIS_FIFO_SIZE  = 16,
    parameter C_M_AXIS_TDATA_WIDTH = 32,
    parameter BIAS_BRAM_DATA_WIDTH = 32,

    parameter AXIS_PRELOAD_BIT_NUM=2,
    parameter AXIS_BIT_NUM  = 4
)
(
    //golbal
    input wire clk,
    input wire rst_n,

    //data

    //AXI_S_in
    output wire S_AXIS_TREADY,
    input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA ,
    input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TSTRB ,
    input wire S_AXIS_TLAST ,
    input wire S_AXIS_TVALID,
    
    //AXIS_out
    output wire M_AXIS_o_valid,
    output wire [C_M_AXIS_TDATA_WIDTH-1:0] M_AXIS_o_data,
    output wire M_AXIS_o_last,

    //FSM output
    output wire [1:0]weight_bram_read_state_o,
    output wire [2:0]weight_bram_write_state_o,
    output wire [1:0]bias_bram_read_state_o,
    output wire [2:0]bias_bram_write_state_o,
    //control in 
    input wire [MAC_NUM-1:0] MAC_enable,
    input wire [1:0] operation,
    input wire [11:0] input_channel_size,
    input wire [11:0] output_channel_size,
    input wire [4:0] kernel_size,
    input wire [2:0] stride,
    input wire axis_en,
    input wire axis_preload_en,
    input wire axis_clear,

    input wire weight_bram_write_en,
    input wire weight_bram_transfer_start,
    input wire weight_bram_control_add1,
    input wire weight_bram_control_add2,
    input wire weight_bram_port_sel,

    input wire bias_bram_write_en,
    input wire bias_bram_control_add,
    input wire bias_bram_transfer_start,

    input wire load_weight_preload,
    input wire load_weight,
    input wire load_ifmaps,
    input wire pooling_compute,
    
    input wire layer_finish,
    //control out
    output wire ifmaps_fifo_empty,
    output wire weight_from_bram_valid,
    output wire bias_from_bram_valid,

    output wire pooling_finish,
    output wire write_weight_finish,
    output wire write_bias_finish

);

    function integer clogb2 (input integer bit_depth);
	  begin
	    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
	      bit_depth = bit_depth >> 1;
	  end
	endfunction

    wire [C_S_AXIS_TDATA_WIDTH-1 : 0] ifmaps_from_axis;
    wire axis_fifo_empty,axis_fifo_full;
    wire [4:0] axis_fifo_cnt;
    wire [5*MAC_NUM-1:0] ifmaps_from_axis_preload;
    wire [11:0] weight_bram_address_A,weight_bram_address_B;
    wire [5*MAC_NUM-1:0] weight_from_bram;
    wire [31:0] bias_from_bram;
    wire [AXIS_PRELOAD_BIT_NUM:0] axis_preload_fifo_cnt;
    wire read_axis_preload_fifo;
    wire axis_fifo_read;
    wire ifmaps_fifo_full;

    wire [6*MAC_NUM-1:0] MAC_out;
    wire MAC_o_valid;

    wire psum_out_data_package_o_valid;
    wire psum_out_data_package_o_last;
    wire [31:0] psum_out_data_package_o_data;

    reg [255:0] pool_data_package_data_in;
    wire pool_data_package_i_valid;
    wire pool_data_package_layer_finish;
    wire pool_data_package_o_valid;
    wire pool_data_package_o_last;
    wire [31:0] pool_data_package_o_data;

    wire wait_input_from_preload;

    assign M_AXIS_o_valid = (operation==2'd0) ? psum_out_data_package_o_valid : pool_data_package_o_valid;
    assign M_AXIS_o_data  = (operation==2'd0) ? psum_out_data_package_o_data : pool_data_package_o_data;
    assign M_AXIS_o_last  = (operation==2'd0) ? psum_out_data_package_o_last : pool_data_package_o_last;

    wire load_axis_preload;
    assign load_axis_preload=((~axis_fifo_empty) & (~ifmaps_fifo_full) & axis_preload_en);

    wire read_axis_fifo;
    assign read_axis_fifo=load_axis_preload|axis_fifo_read;
    axis_fifo_my 
    #(
        .C_S_AXIS_TDATA_WIDTH (C_S_AXIS_TDATA_WIDTH  ),
        .FIFO_SIZE            (AXIS_FIFO_SIZE        ),
        .bit_num              (AXIS_BIT_NUM          )
    )
    u_axis_fifo_my(
        //golbal
        .S_AXIS_ACLK    (clk                 ),
        .S_AXIS_ARESETN (rst_n               ),
        //data
        .S_AXIS_TDATA   (S_AXIS_TDATA        ),
        .data_out       (ifmaps_from_axis    ),
        //control in
        .S_AXIS_TREADY  (S_AXIS_TREADY       ),
        .S_AXIS_TSTRB   (S_AXIS_TSTRB        ),
        .S_AXIS_TLAST   (S_AXIS_TLAST        ),
        .S_AXIS_TVALID  (S_AXIS_TVALID       ),
        .read_want      (read_axis_fifo      ),
        .axis_en        (axis_en             ),
        .axis_clear     (axis_clear          ),
        //control out 
        .out_valid      (out_valid           ),
        .fifo_full      (axis_fifo_full      ),
        .fifo_empty     (axis_fifo_empty     ),
        .fifo_cnt       (axis_fifo_cnt       )
    );

    wire axis_preload_fifo_read;
    assign axis_preload_fifo_read=load_ifmaps | read_axis_preload_fifo ;

    axis_preload_fifo 
    #(
        .C_S_AXIS_TDATA_WIDTH       (C_S_AXIS_TDATA_WIDTH     ),
        .MAC_NUM                    (MAC_NUM                  ),
        .AXIS_PRELOAD_FIFO_DEPTH    (AXIS_PRELOAD_FIFO_DEPTH  )
    )  
    u_axis_preload_fifo(  
        //golbal  
    	.clk                        (clk                      ),
        .rst_n                      (rst_n                    ),
        //data          
        .ifmaps_from_axis           (ifmaps_from_axis         ),
        .ifmaps_out                 (ifmaps_from_axis_preload ),
        //control in          
        .fifo_read                  (axis_preload_fifo_read   ),
        .load_axis_preload          (load_axis_preload        ),
        .input_channel_size         (input_channel_size       ),
        .axis_clear                 (axis_clear               ),
        .kernel_size                (kernel_size              ),
        //control out      
        .fifo_cnt                   (axis_preload_fifo_cnt    ),
        .fifo_empty                 (ifmaps_fifo_empty        ),
        .fifo_full                  (ifmaps_fifo_full         ),

        .wait_input_from_preload    (wait_input_from_preload  )
    );
    
    
    MAC_array_control 
    #(
        .MAC_NUM                     (MAC_NUM                     ),
        .BRAM_ADDRESS_WIDTH          (WEITGHT_BRAM_ADDRESS_WIDTH  )
    )
    u_MAC_array_control(
        //golbal
    	.clk                         (clk                         ),
        .rst_n                       (rst_n                       ),
        //data
        .ifmaps_from_axis_preload    (ifmaps_from_axis_preload    ),
        .weight_from_bram            (weight_from_bram            ),
        .MAC_out                     (MAC_out                     ),
        //control in
        .enable                      (MAC_enable                  ),
        .operation                   (operation                   ),
        .kernel_size                 (kernel_size                 ),
        .load_weight_preload         (load_weight_preload         ),
        .load_MAC_weight             (load_weight                 ),
        .load_ifmaps                 (load_ifmaps                 ),
        .pooling_compute             (pooling_compute             ),
        .ifmaps_fifo_empty           (ifmaps_fifo_empty           ),
        //control out
        .MAC_o_valid                 (MAC_o_valid                 )
    );

    wire psum_adder_o_data;
    wire psum_adder_o_valid;
    wire [11:0] psum_adder_o_addr;
    wire psum_adder_o_last;
    wire psum_adder_i_valid;

    assign psum_adder_i_valid = (MAC_o_valid && (operation==2'd0));
    psum_adder
    #(
        .PSUM_IN_WIDTH          (MAC_NUM*6                ),
        .OFMAPS_BRAM_ADDR_WIDTH (12                       )
    )
    u_psum_adder(
        //golbal
    	.clk                    (clk                       ),
        .rst_n                  (rst_n                     ),
   
        //control
        .layer_finish           (layer_finish              ),
        
        //inputdata
        .psum_in                (MAC_out                   ),
        .i_valid                (psum_adder_i_valid        ),
        .bias_in                (bias_from_bram[15:0]      ),
        .bias_valid             (bias_from_bram_valid      ),
        //output data
        .o_data                 (psum_adder_o_data         ),
        .o_valid                (psum_adder_o_valid        ),
        .o_last                 (psum_adder_o_last         )
    ); 

    wire psum_out_data_package_i_valid;
    assign psum_out_data_package_i_valid = (psum_adder_o_valid && (operation == 2'd0));
    psum_out_data_package #(
        .C_M_AXIS_TDATA_WIDTH ( C_M_AXIS_TDATA_WIDTH ))
    u_psum_out_data_package (
        .clk                     (clk                                      ),
        .rst_n                   (rst_n                                    ),
        .layer_finish            (psum_adder_o_last                        ),
        .in_valid                (psum_out_data_package_i_valid            ),
        .in_data                 (psum_adder_o_data                        ),
        .output_channel_size     (output_channel_size                      ),
        .operation               (operation                                ),

        .out_valid               (psum_out_data_package_o_valid            ),
        .out_data                (psum_out_data_package_o_data             ),
        .out_last                (psum_out_data_package_o_last             )
    );

    
    assign pool_data_package_i_valid = (MAC_o_valid && (operation==2'd1));
    assign pool_data_package_layer_finish = (layer_finish && (operation==2'd1));
    integer i;
    always @(*) begin
        for(i=0;i<256;i=i+1) begin
            pool_data_package_data_in[i]=MAC_out[i*6];
        end
    end
    pool_out_data_package#(
        .C_M_AXIS_TDATA_WIDTH (C_M_AXIS_TDATA_WIDTH )
    )
    u_pool_out_data_package(
    	.clk                     (clk                            ),
        .rst_n                   (rst_n                          ),
        .layer_finish            (pool_data_package_layer_finish ),
        .MAC_o_valid             (pool_data_package_i_valid      ),
        .MAC_out                 (pool_data_package_data_in      ),
        .input_channel_size      (input_channel_size             ),
        .stride                  (stride                         ),
        .pooling_finish          (pooling_finish                 ),
        .out_valid               (pool_data_package_o_valid      ),
        .out_last                (pool_data_package_o_last       ),
        .out_data                (pool_data_package_o_data       )
    );
    


    /////////////////////////////////////////////////////////////////////////////////////
    //                                    WEIGHT_BRAM                                  //
    /////////////////////////////////////////////////////////////////////////////////////
    wire [1279:0] weight_from_bram_A,weight_from_bram_B,weight_to_bram_A,weight_to_bram_B;
    wire weight_bram_A_en,weight_bram_B_en;

    weight_bram_control
    #(
        .MAC_NUM                (MAC_NUM                   ),
        .BRAM_ADDRESS_WIDTH     (WEITGHT_BRAM_ADDRESS_WIDTH),
        .AXIS_PRELOAD_FIFO_DEPTH(AXIS_PRELOAD_FIFO_DEPTH   )
    )
    u_weight_bram_control(
        //golbal
    	.clk                    (clk                       ),
        .rst_n                  (rst_n                     ),
   
        //data   
        .weight_from_preload    (ifmaps_from_axis_preload  ),
        .weight_from_bram_A     (weight_from_bram_A        ),
        .weight_from_bram_B     (weight_from_bram_B        ),
        .weight_out             (weight_from_bram          ),
        .weight_to_bram_A       (weight_to_bram_A          ),
        .weight_to_bram_B       (weight_to_bram_B          ),
        .bram_address_A         (weight_bram_address_A     ),
        .bram_address_B         (weight_bram_address_B     ),
        .bram_A_en              (weight_bram_A_en          ),
        .bram_B_en              (weight_bram_B_en          ),
        .bram_A_wen             (weight_bram_A_wen         ),
        .bram_B_wen             (weight_bram_B_wen         ),

        //control
        .output_channel_size    (output_channel_size       ),
        .kernel_size            (kernel_size               ),
        .write_en               (weight_bram_write_en      ),
        .axis_fifo_cnt          (axis_preload_fifo_cnt     ),
        .transfer_start         (weight_bram_transfer_start),
        .bram_control_add1      (weight_bram_control_add1  ),
        .bram_control_add2      (weight_bram_control_add2  ),
        .port_sel               (weight_bram_port_sel      ),
        .weight_from_bram_valid (weight_from_bram_valid    ),
        .read_axis_preload_fifo (read_axis_preload_fifo    ),
        .write_weight_finish    (write_weight_finish       ),
        .wait_input_from_preload(wait_input_from_preload   ),
        .layer_finish           (layer_finish              ),

        //FSM output
        .read_state_o           (weight_bram_read_state_o  ),
        .write_state_o          (weight_bram_write_state_o )
    );
    
    //BRAM_instance
    weight_BRAM_wrapper u_weight_BRAM(
        //control
        .BRAM_PORTA_0_clk        (clk                   ),
        .BRAM_PORTB_0_clk        (clk                   ),
        //data
        .BRAM_PORTA_0_dout       (weight_from_bram_A    ),
        .BRAM_PORTB_0_dout       (weight_from_bram_B    ),
        .BRAM_PORTA_0_din        (weight_to_bram_A      ),
        .BRAM_PORTB_0_din        (weight_to_bram_B      ),
        //BRAM control
        .BRAM_PORTA_0_addr       (weight_bram_address_A ),
        .BRAM_PORTB_0_addr       (weight_bram_address_B ),
        .BRAM_PORTA_0_en         (weight_bram_A_en      ),
        .BRAM_PORTB_0_en         (weight_bram_B_en      ),
        .BRAM_PORTA_0_we         (weight_bram_A_wen     ),
        .BRAM_PORTB_0_we         (weight_bram_B_wen     )
    );

    /////////////////////////////////////////////////////////////////////////////////////
    //                                     BIAS_BRAM                                   //
    /////////////////////////////////////////////////////////////////////////////////////
    wire [BIAS_BRAM_DATA_WIDTH-1:0] bias_from_bram_A,bias_to_bram_A;
    wire bias_bram_A_en;
    wire bias_bram_A_wen;
    wire [BIAS_BRAM_ADDRESS_WIDTH-1:0] bias_bram_address_A;
    wire wait_input_from_axis;

    assign wait_input_from_axis = ~axis_fifo_empty;

    bias_bram_control 
    #(
        .BRAM_DATA_WIDTH         (BIAS_BRAM_DATA_WIDTH    ),
        .BRAM_ADDRESS_WIDTH      (BIAS_BRAM_ADDRESS_WIDTH ),
        .AXIS_FIFO_SIZE          (AXIS_FIFO_SIZE          )
    )
    u_bias_bram_control(
    	.clk                     (clk                     ),
        .rst_n                   (rst_n                   ),
        
        .bias_from_axis          (ifmaps_from_axis        ),
        .bias_from_bram_A        (bias_from_bram_A        ),
        .bias_to_bram_A          (bias_to_bram_A          ),
        .bram_address_A          (bias_bram_address_A     ),
        .bram_A_en               (bias_bram_A_en          ),
        .bram_A_wen              (bias_bram_A_wen         ),
        .bias_out                (bias_from_bram          ),
        .read_state_o            (bias_bram_read_state_o  ),
        .write_state_o           (bias_bram_write_state_o ),
        .output_channel_size     (output_channel_size     ),
        .write_en                (bias_bram_write_en      ),
        .axis_fifo_cnt           (axis_fifo_cnt           ),
        .transfer_start          (bias_bram_transfer_start),
        .bram_control_add        (bias_bram_control_add   ),
        .wait_input_from_axis    (wait_input_from_axis    ),
        .layer_finish            (layer_finish            ),
        .bias_from_bram_valid    (bias_from_bram_valid    ),
        .axis_fifo_read          (axis_fifo_read          ),
        .write_bias_finish       (write_bias_finish       )
    );
        
    //BRAM_instance
    bias_BRAM_wrapper u_bias_BRAM(
        //control
        .BRAM_PORTA_0_clk        (clk                   ),
        //data
        .BRAM_PORTA_0_dout       (bias_from_bram_A      ),
        .BRAM_PORTA_0_din        (bias_to_bram_A        ),
        //BRAM control
        .BRAM_PORTA_0_addr       (bias_bram_address_A   ),
        .BRAM_PORTA_0_en         (bias_bram_A_en        ),
        .BRAM_PORTA_0_we         (bias_bram_A_wen       )
    );
endmodule
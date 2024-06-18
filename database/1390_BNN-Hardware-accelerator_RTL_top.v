// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

`timescale  10ns / 10ns

module top #(
    parameter MAC_NUM = 256,
    parameter WEITGHT_BRAM_ADDRESS_WIDTH = 12,
    parameter BIAS_BRAM_ADDRESS_WIDTH = 9,
    parameter BIAS_BRAM_DATA_WIDTH = 32,
    parameter AXIS_PRELOAD_FIFO_DEPTH = 4,
    parameter AXIS_FIFO_SIZE  = 16,
    parameter integer C_S_AXIS_TDATA_WIDTH	= 32,
    parameter integer C_S_AXI_DATA_WIDTH	= 32,
    parameter integer C_S_AXI_ADDR_WIDTH	= 5,//FIXME:要注意我將此參數由4改為5
    parameter C_M_AXIS_TDATA_WIDTH = 32,
    parameter M_AXIS_FIFO_DEPTH = 4
) 
(
    //golbal
    input wire clk,
    input wire rst_n,
    //data path
    //S_AXIS
    output wire  S_AXIS_TREADY,
    input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
    input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TSTRB,
    input wire  S_AXIS_TLAST,
    input wire  S_AXIS_TVALID,

    //S_AXI
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    input wire [2 : 0] S_AXI_AWPROT,
    input wire  S_AXI_AWVALID,
    output wire  S_AXI_AWREADY,
    input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    input wire  S_AXI_WVALID,
    output wire  S_AXI_WREADY,
    output wire [1 : 0] S_AXI_BRESP,
    output wire  S_AXI_BVALID,
    input wire  S_AXI_BREADY,
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    input wire [2 : 0] S_AXI_ARPROT,
    input wire  S_AXI_ARVALID,
    output wire  S_AXI_ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
    output wire [1 : 0] S_AXI_RRESP,
    output wire  S_AXI_RVALID,
    input wire  S_AXI_RREADY,

    //M_AXIS
    input wire  								 M_AXIS_TREADY,

    output wire	[C_M_AXIS_TDATA_WIDTH-1:0]       M_AXIS_TDATA,
    output wire                                  M_AXIS_TVALID,
    output wire 						         M_AXIS_TLAST,
    output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB  
);
    //TODO:full-connect、if input channel bigger than 256(MAC_NUM)control unit要增加紀錄現在到哪個channel的reg、load weight

    wire [MAC_NUM-1:0] MAC_enable;
    wire weight_from_bram_valid;
    wire bias_from_bram_valid;
    wire [1:0] operation;
    wire [4:0] kernel_size;
    wire [2:0] stride;
    wire [11:0]input_channel_size;
    wire [11:0]output_channel_size;
    wire axis_en;
    wire axis_preload_en;
    wire axis_clear;
    wire load_weight_preload;
    wire load_weight;
    wire weight_bram_port_sel;
    wire weight_bram_control_add1;
    wire weight_bram_control_add2;
    wire weight_bram_transfer_start;
    wire bias_bram_write_en;      
    wire bias_bram_control_add;   
    wire bias_bram_transfer_start;
    wire address_reset;
    wire ifmaps_fifo_empty;
    wire load_ifmaps;
    wire layer_finish;
    wire weight_bram_write_en;
    wire write_weight_finish;
    wire write_bias_finish;
    wire pooling_compute;
    wire pooling_finish;

    wire [4:0] control_load_weight_state_o;
    wire [4:0] control_load_ifmaps_state_o;
    wire [2:0] control_write_weight_state_o;
    wire [2:0] control_write_bias_state_o;
    wire [2:0] control_load_bias_state_o;
    wire [1:0] weight_bram_read_state_o;
    wire [2:0] weight_bram_write_state_o;
    wire [1:0] bias_bram_read_state_o;
    wire [2:0] bias_bram_write_state_o;

    wire [31:0]reg0_read_data;
    wire [31:0]reg1_read_data;
    wire [31:0]reg2_read_data;
    wire [31:0]reg3_write_data;
    wire [31:0]reg4_write_data;

    wire M_AXIS_o_valid;
    wire [C_M_AXIS_TDATA_WIDTH-1:0] M_AXIS_o_data;
    wire M_AXIS_o_last;

    wire M_AXIS_output_finsih;
    assign M_AXIS_output_finsih = (M_AXIS_TVALID && M_AXIS_TLAST);
    assign reg4_write_data = {3'd0,
                              bias_bram_write_state_o,
                              bias_bram_read_state_o,
                              weight_bram_write_state_o,
                              weight_bram_read_state_o,
                              control_load_bias_state_o,
                              control_write_bias_state_o,
                              control_write_weight_state_o, 
                              control_load_ifmaps_state_o, 
                              control_load_weight_state_o};
    AXI_interface 
    #(
        .C_S_AXI_DATA_WIDTH   (C_S_AXI_DATA_WIDTH                ),
        .C_S_AXI_ADDR_WIDTH   (C_S_AXI_ADDR_WIDTH                )
    )
    u_AXI_interface(
        //golbal
        .S_AXI_ACLK           (clk                               ),
        .S_AXI_ARESETN        (rst_n                             ),
        //data     
    	.reg0_read_data       (reg0_read_data                    ),
        .reg1_read_data       (reg1_read_data                    ),
        .reg2_read_data       (reg2_read_data                    ),
        .reg3_write_data      (reg3_write_data                   ),
        .reg4_write_data      (reg4_write_data                   ),
        //control     
        .layer_finish         (M_AXIS_output_finsih              ),
        .write_weight_finish  (write_weight_finish               ),
        .write_bias_finish    (write_bias_finish                 ),

        .S_AXI_AWADDR         (S_AXI_AWADDR                      ),
        .S_AXI_AWPROT         (S_AXI_AWPROT                      ),
        .S_AXI_AWVALID        (S_AXI_AWVALID                     ),
        .S_AXI_AWREADY        (S_AXI_AWREADY                     ),
        .S_AXI_WDATA          (S_AXI_WDATA                       ),
        .S_AXI_WSTRB          (S_AXI_WSTRB                       ),
        .S_AXI_WVALID         (S_AXI_WVALID                      ),
        .S_AXI_WREADY         (S_AXI_WREADY                      ),
        .S_AXI_BRESP          (S_AXI_BRESP                       ),
        .S_AXI_BVALID         (S_AXI_BVALID                      ),
        .S_AXI_BREADY         (S_AXI_BREADY                      ),
        .S_AXI_ARADDR         (S_AXI_ARADDR                      ),
        .S_AXI_ARPROT         (S_AXI_ARPROT                      ),
        .S_AXI_ARVALID        (S_AXI_ARVALID                     ),
        .S_AXI_ARREADY        (S_AXI_ARREADY                     ),
        .S_AXI_RDATA          (S_AXI_RDATA                       ),
        .S_AXI_RRESP          (S_AXI_RRESP                       ),
        .S_AXI_RVALID         (S_AXI_RVALID                      ),
        .S_AXI_RREADY         (S_AXI_RREADY                      )
    );
    

    control_unit 
    #(
        .MAC_NUM                    (MAC_NUM                     ),
        .C_S_AXIS_TDATA_WIDTH       (C_S_AXIS_TDATA_WIDTH        )
    )
    u_control_unit(
        //golbal
    	.clk                        (clk                         ),
        .rst_n                      (rst_n                       ),
        //control in        
        .axi_control_0              (reg0_read_data              ),
        .axi_control_1              (reg1_read_data              ),
        .axi_control_2              (reg2_read_data              ),
        .weight_from_bram_valid     (weight_from_bram_valid      ),
        .bias_from_bram_valid       (bias_from_bram_valid        ),

        .ifmaps_fifo_empty          (ifmaps_fifo_empty           ),
        .pooling_finish             (pooling_finish              ),
        .M_AXIS_output_finsih       (M_AXIS_output_finsih        ),
        //control out          
        .layer_finish               (layer_finish                ),
        .write_weight_finish        (write_weight_finish         ),
        .write_bias_finish          (write_bias_finish           ),

        .MAC_enable                 (MAC_enable                  ),
        .operation                  (operation                   ),
        .input_channel_size         (input_channel_size          ),
        .output_channel_size        (output_channel_size         ),
        .axis_en                    (axis_en                     ),
        .axis_preload_en            (axis_preload_en             ),
        .axis_clear                 (axis_clear                  ),
        .kernel_size                (kernel_size                 ),
        .stride                     (stride                      ),
        .load_weight_preload        (load_weight_preload         ),
        .load_weight                (load_weight                 ),
        .pooling_compute            (pooling_compute             ),
        
        .weight_bram_write_en       (weight_bram_write_en        ),
        .weight_bram_port_sel       (weight_bram_port_sel        ),
        .weight_bram_control_add1   (weight_bram_control_add1    ),
        .weight_bram_control_add2   (weight_bram_control_add2    ),
        .weight_bram_transfer_start (weight_bram_transfer_start  ),
        
        .bias_bram_write_en         (bias_bram_write_en          ),
        .bias_bram_control_add      (bias_bram_control_add       ),
        .bias_bram_transfer_start   (bias_bram_transfer_start    ),

        .load_ifmaps                (load_ifmaps                 ),
        .axi_control_3              (reg3_write_data             ),
        //FSM output
        .load_weight_state_o        (control_load_weight_state_o ),
        .load_ifmaps_state_o        (control_load_ifmaps_state_o ),
        .write_weight_state_o       (control_write_weight_state_o),
        .write_bias_state_o         (control_write_bias_state_o  ),
        .load_bias_state_o          (control_load_bias_state_o   )
    );

    data_path 
    #(
        .MAC_NUM                       (MAC_NUM                        ),
        .WEITGHT_BRAM_ADDRESS_WIDTH    (WEITGHT_BRAM_ADDRESS_WIDTH     ),
        .BIAS_BRAM_ADDRESS_WIDTH       (BIAS_BRAM_ADDRESS_WIDTH        ),
        .C_S_AXIS_TDATA_WIDTH          (C_S_AXIS_TDATA_WIDTH           ),
        .AXIS_PRELOAD_FIFO_DEPTH       (AXIS_PRELOAD_FIFO_DEPTH        ),
        .AXIS_FIFO_SIZE                (AXIS_FIFO_SIZE                 ),
        .C_M_AXIS_TDATA_WIDTH          (C_M_AXIS_TDATA_WIDTH           ),
        .BIAS_BRAM_DATA_WIDTH          (BIAS_BRAM_DATA_WIDTH           )
    )
    u_data_path(
        //golbal
    	.clk                           (clk                            ),
        .rst_n                         (rst_n                          ),
        //data path in            
        .S_AXIS_TREADY                 (S_AXIS_TREADY                  ),
        .S_AXIS_TDATA                  (S_AXIS_TDATA                   ),
        .S_AXIS_TSTRB                  (S_AXIS_TSTRB                   ),
        .S_AXIS_TLAST                  (S_AXIS_TLAST                   ),
        .S_AXIS_TVALID                 (S_AXIS_TVALID                  ),
        //data path out
        .M_AXIS_o_data                 (M_AXIS_o_data                  ),
        .M_AXIS_o_valid                (M_AXIS_o_valid                 ),
        .M_AXIS_o_last                 (M_AXIS_o_last                  ),
        //contol in       
            //golbal control       
        .input_channel_size            (input_channel_size             ),
        .output_channel_size           (output_channel_size            ),
        .operation                     (operation                      ),
        .kernel_size                   (kernel_size                    ),
        .stride                        (stride                         ),
        .axis_en                       (axis_en                        ),
        .axis_preload_en               (axis_preload_en                ),
        .axis_clear                    (axis_clear                     ),
        .layer_finish                  (layer_finish                   ),
        .pooling_compute               (pooling_compute                ),
            //MAC_control
        .MAC_enable                    (MAC_enable                     ),
        .load_weight                   (load_weight                    ),
        .load_ifmaps                   (load_ifmaps                    ),
            //BRAM_control
        .weight_bram_write_en          (weight_bram_write_en           ),
        .weight_bram_transfer_start    (weight_bram_transfer_start     ),
        .weight_bram_control_add1      (weight_bram_control_add1       ),
        .weight_bram_control_add2      (weight_bram_control_add2       ),
        .weight_bram_port_sel          (weight_bram_port_sel           ),

        .bias_bram_write_en            (bias_bram_write_en             ),
        .bias_bram_control_add         (bias_bram_control_add          ),
        .bias_bram_transfer_start      (bias_bram_transfer_start       ),
            //weight_preload
        .load_weight_preload           (load_weight_preload            ),
        //control out
        .ifmaps_fifo_empty             (ifmaps_fifo_empty              ),
        .weight_from_bram_valid        (weight_from_bram_valid         ),
        .bias_from_bram_valid          (bias_from_bram_valid           ),

        .pooling_finish                (pooling_finish                 ),
        // .axi_control_3              (axi_control_3_from_datapath),
        .write_weight_finish           (write_weight_finish            ),
        .write_bias_finish             (write_bias_finish              ),
        //FSM output
        .weight_bram_read_state_o      (weight_bram_read_state_o       ),
        .weight_bram_write_state_o     (weight_bram_write_state_o      ),
        .bias_bram_read_state_o        (bias_bram_read_state_o         ),
        .bias_bram_write_state_o       (bias_bram_write_state_o        )
    );


    axis_master #(
        .FIFO_DEPTH              ( M_AXIS_FIFO_DEPTH                                ),
        .C_M_AXIS_TDATA_WIDTH    ( C_M_AXIS_TDATA_WIDTH                             )      
    )
    u_axis_master (
        .M_AXIS_ACLK             ( clk                                              ),
        .M_AXIS_ARESETN          ( rst_n                                            ),
        .TDATA_in                ( M_AXIS_o_data                                    ),
        .TVALID_in               ( M_AXIS_o_valid                                   ),
        .TLAST_in                ( M_AXIS_o_last                                    ),
        .M_AXIS_TREADY           ( M_AXIS_TREADY                                    ),

        .M_AXIS_TDATA            ( M_AXIS_TDATA    [C_M_AXIS_TDATA_WIDTH-1:0]       ),
        .M_AXIS_TVALID           ( M_AXIS_TVALID                                    ),
        .M_AXIS_TLAST            ( M_AXIS_TLAST                                     ),
        .M_AXIS_TSTRB            ( M_AXIS_TSTRB    [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] )
    );  

endmodule
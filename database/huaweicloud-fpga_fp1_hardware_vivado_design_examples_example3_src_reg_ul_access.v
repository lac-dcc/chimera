//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details.
//------------------------------------------------------------------------------
`resetall
`timescale 1ns / 1ns
module reg_ul_access
    #(	
     parameter   CPU_ADDR_WIDTH  =12                              ,
     parameter   CPU_DATA_WIDTH  =32                             
    )
    (
    //globle signal                      
    input    wire                            clks                 ,  
    input    wire                            reset                ,                            
	
    output   wire [15:0]                     ul2sh_vled           ,
    output   wire [15:0]                     reg_tmout_us_cfg     ,
    input    wire [1:0]                      reg_tmout_us_err     ,                                                       
    //mpi interface                                               
    input                                    cpu_wr               ,
    input        [CPU_ADDR_WIDTH-1:0]        cpu_wr_addr          ,
    input        [CPU_DATA_WIDTH-1:0]        cpu_data_in          ,
    input                                    cpu_rd               ,
    output  reg  [CPU_DATA_WIDTH-1:0]        cpu_data_out      
   );
/******************************************************************************\
    inter signal
\******************************************************************************/
wire  [CPU_DATA_WIDTH-1:0]                   reg_ver_time          ;
wire  [CPU_DATA_WIDTH-1:0]                   reg_ver_type          ;
wire  [CPU_DATA_WIDTH-1:0]                   reg_adder_cfg_rdata   ;

reg   [CPU_DATA_WIDTH-1:0]                   adder_sum             ;
reg   [CPU_DATA_WIDTH-1:0]                   adder_sum_1dly        ;
wire  [CPU_DATA_WIDTH-1:0]                   reg_adder_cfg_wdata0  ;
wire  [CPU_DATA_WIDTH-1:0]                   reg_adder_cfg_wdata1  ;
reg                                          cpu_rd_dly1           ;

wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h0       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h1       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h2       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h3       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h4       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h5       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h6       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h7       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h8       ; 
wire  [CPU_DATA_WIDTH-1:0]                   cpu_data_out_h9       ; 

/******************************************************************************\
    version info 
\******************************************************************************/
ro_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(CPU_DATA_WIDTH)                                         
     )
    inst_reg_ver_time                        
    (
    .cpu_data_out       ( cpu_data_out_h0           ),  
    .cpu_addr           ( cpu_wr_addr               ),  
    .its_addr           ( 12'h000                   ),  
    .din                ( reg_ver_time              )   
    );

assign reg_ver_time = 32'h2018_0702;

ro_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(CPU_DATA_WIDTH)                                         
     )
    inst_reg_ver_type                       
    (
    .cpu_data_out       ( cpu_data_out_h1           ),  
    .cpu_addr           ( cpu_wr_addr               ),  
    .its_addr           ( 12'h001                   ),  
    .din                ( reg_ver_type              )   
    );

assign reg_ver_type = 32'h00D3_0008;
/******************************************************************************\
    adder function
\******************************************************************************/
//reg_adder_cfg_wdata0          
rw_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(CPU_DATA_WIDTH),                                       
    .INIT_DATA(32'd0)                   
    )
    inst_reg_adder_cfg_wdata0                      
    (
    .clks               ( clks                      ), 
    .reset              ( reset                     ), 
                                                    
    .cpu_data_in        ( cpu_data_in               ), 
    .cpu_data_out       ( cpu_data_out_h2           ), 
    .cpu_addr           ( cpu_wr_addr               ), 
    .cpu_wr             ( cpu_wr                    ), 
    .its_addr           ( 12'h002                   ), 
    .dout               ( reg_adder_cfg_wdata0      )  
    );

//reg_adder_cfg_wdata0          
rw_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(CPU_DATA_WIDTH),                                        
    .INIT_DATA(32'd0)                   
    )
    inst_reg_adder_cfg_wdata1                      
    (
    .clks               ( clks                      ), 
    .reset              ( reset                     ), 
                                                    
    .cpu_data_in        ( cpu_data_in               ), 
    .cpu_data_out       ( cpu_data_out_h3           ), 
    .cpu_addr           ( cpu_wr_addr               ), 
    .cpu_wr             ( cpu_wr                    ), 
    .its_addr           ( 12'h003                   ), 
    .dout               ( reg_adder_cfg_wdata1      )  
    );

//reg_adder_cfg_rdata          
ro_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(CPU_DATA_WIDTH)                                         
     )
    inst_reg_adder_sum                        
    (
    .cpu_data_out       ( cpu_data_out_h4           ),  
    .cpu_addr           ( cpu_wr_addr               ),  
    .its_addr           ( 12'h004                   ),  
    .din                ( reg_adder_cfg_rdata       )   
    );



always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin 
        adder_sum <= {CPU_DATA_WIDTH{1'b0}};
	end 	
    else begin
        adder_sum <= reg_adder_cfg_wdata0 + reg_adder_cfg_wdata1;  
    end
end   


always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1)
        adder_sum_1dly <= {CPU_DATA_WIDTH{1'b0}};
    else begin
        adder_sum_1dly <= adder_sum;  
    end
end   

assign reg_adder_cfg_rdata = adder_sum_1dly;
	
/******************************************************************************\
    test function
\******************************************************************************/
ts_reg_inst
   #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH)                                      
    )
  inst_reg_oppos_data                      
    (
    .clks               ( clks                      ), 
    .reset              ( reset                     ),                                                     
    .cpu_data_in        ( cpu_data_in               ), 
    .cpu_data_out       ( cpu_data_out_h5           ), 
    .cpu_addr           ( cpu_wr_addr               ), 
    .cpu_wr             ( cpu_wr                    ), 
    .its_addr           ( 12'h005                   )
    );	

/******************************************************************************\
    vled function
\******************************************************************************/       
rw_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(16),                                       
    .INIT_DATA(32'd0)                   
    )
    inst_reg_ul2sh_vled                     
    (
    .clks               ( clks                      ), 
    .reset              ( reset                     ), 
                                                    
    .cpu_data_in        ( cpu_data_in               ), 
    .cpu_data_out       ( cpu_data_out_h6           ), 
    .cpu_addr           ( cpu_wr_addr               ), 
    .cpu_wr             ( cpu_wr                    ), 
    .its_addr           ( 12'h006                   ), 
    .dout               ( ul2sh_vled                )  
    );

/******************************************************************************\
    addr test function
\******************************************************************************/
ts_addr_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH)
     )
    inst_reg_addr_test
    (
    .clks               ( clks                      ),  
    .reset              ( reset                     ),  
    .cpu_data_out       ( cpu_data_out_h7           ),  
    .cpu_addr           ( cpu_wr_addr               ),  
    .cpu_rd             ( cpu_rd                    ),  
    .cpu_rd_dly1        ( cpu_rd_dly1               ),  
    .its_addr           ( 12'h007                   )  
    );
rw_reg_inst
    #(
    .ADDR_WIDTH (CPU_ADDR_WIDTH),
    .VLD_WIDTH(16),                                       
    .INIT_DATA(16'hffff)                   
    )
    inst_reg_tmout_us_cfg                     
    (
    .clks               ( clks                      ), 
    .reset              ( reset                     ), 
                                                    
    .cpu_data_in        ( cpu_data_in               ), 
    .cpu_data_out       ( cpu_data_out_h8           ), 
    .cpu_addr           ( cpu_wr_addr               ), 
    .cpu_wr             ( cpu_wr                    ), 
    .its_addr           ( 12'h008                   ), 
    .dout               ( reg_tmout_us_cfg          )  
    );

err_wc_reg_inst
   #(
   .ADDR_WIDTH(CPU_ADDR_WIDTH),
   .VLD_WIDTH(2)
    )
   inst_reg_bd_sta_err                                      
   (
   .clk                 ( clks                      ),      
   .reset               ( reset                     ),      

   .cpu_data_out        ( cpu_data_out_h9           ),      
   .cpu_data_in         ( cpu_data_in               ),      
   .cpu_addr            ( cpu_wr_addr               ),      
   .cpu_wr              ( cpu_wr                    ),      
   .its_addr            ( 12'h009                   ),      
   .err_flag_in         ( reg_tmout_us_err          )      
   );

always @( posedge clks or posedge reset )
begin
    if ( reset == 1'b1 ) begin
        cpu_rd_dly1 <= 1'b0;
    end
    else  begin
        cpu_rd_dly1 <= cpu_rd;
    end
end    

/******************************************************************************\
    cpu_data_out
\******************************************************************************/	
always @ (posedge clks or posedge reset)
begin
    if (reset == 1'b1) begin 
        cpu_data_out <= {CPU_DATA_WIDTH{1'b0}};
	end 	
    else begin
        case(cpu_wr_addr[11:0])       
            12'd0   :  cpu_data_out <= cpu_data_out_h0  ;
            12'd1   :  cpu_data_out <= cpu_data_out_h1  ;
            12'd2   :  cpu_data_out <= cpu_data_out_h2  ;	
            12'd3   :  cpu_data_out <= cpu_data_out_h3  ;		
            12'd4   :  cpu_data_out <= cpu_data_out_h4  ;           
            12'd5   :  cpu_data_out <= cpu_data_out_h5  ;          
            12'd6   :  cpu_data_out <= cpu_data_out_h6  ;       
            12'd7   :  cpu_data_out <= cpu_data_out_h7  ;			
            12'd8   :  cpu_data_out <= cpu_data_out_h8  ;			
            12'd9   :  cpu_data_out <= cpu_data_out_h9  ;			

            default :  cpu_data_out <= {CPU_DATA_WIDTH{1'b0}};
        endcase        
    end
end   

endmodule

// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"
	`include "config.vh"
`endif

module pu
#(
	parameter indexLen              = 8,
	
	parameter numPeValid			= 5,
    parameter puId                  = 0,
    parameter logNumPu              = 0,
    parameter logNumPe              = 3,
    parameter memDataLen            = 16, //width of the data coming from the memory
   	parameter dataLen               = 16,
  
    parameter logMemNamespaces      = 2,  //instruction, data, weight, meta
    parameter numPuMemLanes			= 2,
   	parameter logNumPeMemLanes		= 2,
   	
   	parameter numPe                = 1 << logNumPe,
   	parameter gbBusIndexLen        = logNumPu + 1,
       
    parameter memCtrlIn            = (logNumPeMemLanes+1)*numPe,
    parameter memDataLenIn         = memDataLen*numPe
)
(
    input  wire                             	clk,
    input  wire                             	reset,
    input  wire									start,
    input  wire									eoc,
    input restart,
    input  wire									mem_rd_wrt,
    
    input  wire [memCtrlIn - 1 : 0]  			ctrl_mem_in,
    input  wire [logMemNamespaces - 1 : 0]  	mem_data_type,
    input  wire [memDataLenIn - 1 : 0]  		mem_data_input,
    output wire [memDataLenIn - 1 : 0]  		mem_data_output,
    
    
    input wire [dataLen - 1           : 0]  	pu_neigh_data_in,
    input wire                              	pu_neigh_data_in_v,
        
    input wire [dataLen - 1           : 0]  	gb_bus_data_in,
    input wire 								  	gb_bus_data_in_v,
    input wire									gb_bus_contention,

    output wire [logNumPu - 1    : 0]  	gb_bus_src_addr,
    output wire                               gb_bus_src_rq,

    output reg                             	eoi_pu,
    output wire stall,
    output wire [dataLen - 1          : 0]  	pu_neigh_data_out,
    output wire                             	pu_neigh_data_out_v,
    
    output wire [dataLen - 1          : 0]  	gb_bus_data_out,
    output wire [gbBusIndexLen - 1    : 0]  	gb_bus_data_out_v,
    
    output pu_neigh_full_out,
    input pu_neigh_full_in
);
    //--------------------------------------------------------------------------------------
    
    localparam numPu                = 1 << logNumPu; 
    localparam peBusIndexLen        = logNumPe + 1;

    //--------------------------------------------------------------------------------------

    //--------------------------------------------------------------------------------------
    wire [numPe - 1 : 0]                	inst_eol_pe;
    reg  [numPe - 1 : 0]                	inst_eol_r;
	wire inst_eol;
	
    always @(posedge clk) begin
    	if(reset || eoc) inst_eol_r <= 0;
    	else inst_eol_r <= (inst_eol_pe | inst_eol_r) & ~{numPe{start}} & ~({numPe{inst_eol}}) ;
    end
    	
    assign inst_eol = &inst_eol_r;
    //--------------------------------------------------------------------------------------
    
    //--------------------------------------------------------------------------------------
    //global bus check for the data if valid for this PU ID  
    
    wire [dataLen*numPe - 1          : 0]  gb_bus_data_out_w;
   	wire [gbBusIndexLen*numPe - 1    : 0]  gb_bus_data_out_v_w;
   	
   	
   	assign gb_bus_data_out = gb_bus_data_out_w[dataLen - 1 : 0];
   	assign gb_bus_data_out_v = gb_bus_data_out_v_w[gbBusIndexLen - 1 : 0];
 	//--------------------------------------------------------------------------------------
    
    reg [numPe - 1:0] mem_rd_wrt_pe;
    reg [logMemNamespaces - 1:0] mem_data_type_pe[0:numPe - 1];
    
    genvar gv1;
    generate
    for(gv1 = 0; gv1<numPe;gv1=gv1+1) begin
        always @(posedge clk) begin
            mem_data_type_pe[gv1] <= mem_data_type;
            mem_rd_wrt_pe[gv1] <= mem_rd_wrt;
        end
    end
    endgenerate
    
    wire [numPe - 1 : 0 ]  eoi_pe;

    wire rstn;
    assign rstn = ~reset;
    always @(posedge clk or negedge rstn) begin
        if(~rstn)
            eoi_pu <= 1'b0;
        else
            eoi_pu <= &eoi_pe;
    end
    
    wire [numPe - 1 : 0 ]  pe_bus_data_in_v_pe;
	wire [logNumPu - 1    : 0]  	gb_bus_src_addr_w[0:numPe-1];
	wire                            gb_bus_src_rq_w[0:numPe-1];
	
	assign gb_bus_src_addr = gb_bus_src_addr_w[0];
	assign gb_bus_src_rq = gb_bus_src_rq_w[0];
	
	
  wire [logNumPe:0]  pe_bus_data_out_v[0:numPe-1];
  wire [logNumPe-1:0]  pe_bus_dest_addr[0:numPe-1];
  wire [logNumPe-1:0]  pe_bus_src_addr[0:numPe-1];
  wire [logNumPe-1:0]  pe_addr_bus;
  wire [logNumPe*numPe-1:0]  pe_addr_bus_p;
  wire [logNumPe*numPe-1:0]  pe_addr_to_master,pe_addr_to_master_p;
  wire [dataLen*numPe-1:0]  pe_data_to_master,pe_data_to_master_p;
  wire [dataLen-1:0]  pe_bus_dest_data[0:numPe-1];
  wire [dataLen-1:0]  pe_bus_src_data[0:numPe-1];
  wire [dataLen-1:0]  pe_data_bus;
  wire [dataLen*numPe-1:0]  pe_data_bus_p;
  wire [numPe-1:0]  pe_bus_dest_valid,pe_bus_src_rq,pe_rd_from_bus,pe_rd_from_bus_p,pe_wr_to_bus,pe_wr_to_bus_p;
  wire [numPe-1:0]  pe_bus_src_valid,pe_valid_to_bus,pe_valid_to_bus_p,pe_bus_fifo_full;
  wire [numPe*numPe-1:0]  pe_rd_buffer_full,pe_rd_buffer_full_p;

	wire [dataLen*numPe - 1 : 0 ] pe_neigh_data_out,pe_neigh_data_out_p;
	wire [numPe - 1 : 0] pe_neigh_data_out_v,pe_neigh_data_out_v_p;
	
	wire [dataLen*numPe - 1 : 0 ] pu_neigh_data_out_w,gb_bus_data_in_pe;
	wire [numPe - 1 : 0] pu_neigh_data_out_v_w,gb_bus_data_in_valid_pe;
	
	assign pu_neigh_data_out = pu_neigh_data_out_w[dataLen - 1 : 0 ];
	assign pu_neigh_data_out_v = pu_neigh_data_out_v_w[0];	
    wire [numPe - 1 : 0] stall_pe;
    wire [numPe - 1 : 0] pe_neigh_full,pe_neigh_full_p,pu_neigh_full;
    assign pu_neigh_full_out = pu_neigh_full[0];
    
    assign stall = stall_pe[0];
	generate
	for(genvar i = 0; i < numPe; i = i + 1) 
  begin: GEN_PE
        assign gb_bus_data_in_pe[(i+1)*dataLen-1:i*dataLen] = (i==0) ? gb_bus_data_in :{dataLen{1'b0}} ;
        assign gb_bus_data_in_valid_pe[i] = (i==0) ? gb_bus_data_in_v : 1'b0;
		if((i + puId*numPe) < numPeValid) begin
		    
	 		pe 
   			#(
        		//--------------------------------------------------------------------------------------
        		.peId(i + puId*numPe),
        		.puId(puId),
        		.numPe(numPe),
        		.logNumPu(logNumPu),
        		.logNumPe(logNumPe),
        		.memDataLen(memDataLen),
        		.indexLen(indexLen),
        		.dataLen(dataLen),
        		.logMemNamespaces(logMemNamespaces),
        		.logNumPeMemLanes(logNumPeMemLanes) 
        		//--------------------------------------------------------------------------------------
    		) pe_unit(
        		//--------------------------------------------------------------------------------------
        		.clk(clk),
        		.rstn(~reset),
        		.start(start),
        		.eoc(eoc),
                .restart(restart),
                .pe_stall(stall_pe[i]),
    			  .mem_weight_rd_valid    (ctrl_mem_in[(logNumPeMemLanes+1)*i] && mem_rd_wrt_pe[i]        ),
    			
        		.mem_wrt_valid          (ctrl_mem_in[(logNumPeMemLanes+1)*i] && ~mem_rd_wrt_pe[i]       ),
        		
        		.peId_mem_in            (ctrl_mem_in[((logNumPeMemLanes+1)*i+1)+:logNumPeMemLanes]),
        		
        		.mem_data_type          (mem_data_type_pe[i]                                           ),

				    .mem_data_input         (mem_data_input[memDataLen*i+:memDataLen]                 ),
        		.mem_data_output        (mem_data_output[memDataLen*i+:memDataLen]                ),
 		
        		.eoi               (eoi_pe[i]                                           ),
    
        		.pe_neigh_data_in       (pe_neigh_data_out_p[((i+7)%numPe)*dataLen+:dataLen]        ),
        		.pe_neigh_data_in_v     (pe_neigh_data_out_v_p[((i+7)%numPe)]                       ),
        
        		.pu_neigh_data_in       (pu_neigh_data_in                                         ),
        		.pu_neigh_data_in_v     ((i == 0) && pu_neigh_data_in_v                           ),
        
        		.pe_bus_data_in         (pe_bus_src_data[i]                                       ),
        		.pe_bus_data_in_v       (pe_bus_src_valid[i]                                   ),
 				    .pe_bus_contention      (pe_bus_fifo_full[i]                                 ),

        		.pu_bus_data_in         (gb_bus_data_in_pe[(i+1)*dataLen-1:i*dataLen]                                          ),
        		.pu_bus_data_in_v       (gb_bus_data_in_valid_pe[i]                             ),
        	
        		.pe_neigh_data_out      (pe_neigh_data_out[i*dataLen+:dataLen]                    ),
        		.pe_neigh_data_out_v    (pe_neigh_data_out_v[i]                                   ),
        	
        		.pu_neigh_data_out      (pu_neigh_data_out_w[i*dataLen+:dataLen]                  ),
        		.pu_neigh_data_out_v    (pu_neigh_data_out_v_w[i]                                 ),
        	
 				    .pe_bus_data_out        (pe_bus_dest_data[i]                                      ),
				 .pe_bus_data_out_addr      (pe_bus_dest_addr[i]                                     ),
				 .pe_bus_data_out_v      (pe_bus_dest_valid[i]                                     ),
				    
				.pe_bus_src_addr        (pe_bus_src_addr[i]                                       ),
				.pe_bus_src_rq          (pe_bus_src_rq[i]                                         ),
  				
				.pu_bus_src_addr        (gb_bus_src_addr_w[i]                                       ),
				.pu_bus_src_rq          (gb_bus_src_rq_w[i]                                         ),
     	
				    .pu_bus_data_out        (gb_bus_data_out_w[i*dataLen+:dataLen]                    ),
				    .pu_bus_data_out_v      (gb_bus_data_out_v_w[i*gbBusIndexLen]      ),
				    .pu_bus_data_out_addr      (gb_bus_data_out_v_w[(i*gbBusIndexLen+1)+:(gbBusIndexLen-1)]      ),
				    .pu_bus_contention      (gb_bus_contention                                        ),
				    
				    .pe_neigh_full_in          (pe_neigh_full_p[((i+1)%numPe)]),
				    .pu_neigh_full_in          (pu_neigh_full_in),
				    .pe_neigh_full          (pe_neigh_full[i]),
				    .pu_neigh_full          (pu_neigh_full[i])
          );
        		//---------------------------------------------------------------------------------------
            //
          
//          assign pe_bus_dest_addr[i] = pe_bus_data_out_v[i][logNumPe:1];
//          assign pe_bus_dest_valid[i] = pe_bus_data_out_v[i][0]; 
           
           slave_controller #( 
            .PE_ID(i),
            .BUS_ADDR_LEN(logNumPe),
            .NUM_ELEM(numPe),
            .DATA_LEN(dataLen),
            .NUM_STAGES(`BUS_PIPELINE_STAGES_PE),
            .FIFO_DEPTH(`FIFO_DEPTH_MACRO(i))   
           ) 
            pe_bus_slave_inst(
        		.clk		        (clk		                ),
        		.rstn		        (~reset	                ),
                .stall              (stall_pe[i]),
        		.dest_addr	    (pe_bus_dest_addr[i]    ),
        		.dest_valid	    (pe_bus_dest_valid[i]   ),
        		.dest_data	    (pe_bus_dest_data[i]  	),
        
        		.src_addr	      (pe_bus_src_addr[i]	  	),
        		.src_rq		      (pe_bus_src_rq[i]	      ),
        		
        		.bus_data	      (pe_data_bus_p[(i+1)*dataLen-1: i*dataLen]		        ),
        		.addr_bus	      (pe_addr_bus_p[(i+1)*logNumPe-1: i*logNumPe]		        ),
        		.rd_from_bus	  (pe_rd_from_bus_p[i]	  	),
        
        		.wr_to_bus	    (pe_wr_to_bus_p[i]		    ),
        		
            //
        		.src_data	      (pe_bus_src_data[i]	    ),
        		.src_valid	    (pe_bus_src_valid[i]  	),
        		
        		.data_to_bus	  (pe_data_to_master[(i+1)*dataLen-1: i*dataLen]	 	),	
        		.addr_to_bus	  (pe_addr_to_master[(i+1)*logNumPe-1: i*logNumPe]	 	),	
        		.valid_to_bus	  (pe_valid_to_bus[i]	    ),
        		.wr_fifo_full	  (pe_bus_fifo_full[i]  	),
        		.rd_buffer_full	(pe_rd_buffer_full[(i+1)*numPe-1: i*numPe])
        	);

    end
	else begin
			pe_empty 
   			#(
        		//--------------------------------------------------------------------------------------
        		.peId(i + puId*numPe),
        		.puId(puId),
        		.logNumPu(logNumPu),
        		.logNumPe(logNumPe),
        		.memDataLen(memDataLen),
        		.indexLen(indexLen),
        		.dataLen(dataLen),
        		.logMemNamespaces(logMemNamespaces),
        		.logNumPeMemLanes(logNumPeMemLanes) 
        		//--------------------------------------------------------------------------------------
    		) pe_unit(
        		//--------------------------------------------------------------------------------------
        		.clk(1'b0),
        		.reset(1'b1),
        		.start(start),
        		.eoc(eoc),
    
    			  .mem_weight_rd_valid    (ctrl_mem_in[(logNumPeMemLanes+1)*i] && mem_rd_wrt        ),
    			
        		.mem_wrt_valid          (ctrl_mem_in[(logNumPeMemLanes+1)*i] && ~mem_rd_wrt       ),
        		
        		.peId_mem_in            (ctrl_mem_in[((logNumPeMemLanes+1)*i+1)+:logNumPeMemLanes]),
        		
        		.mem_data_type          (mem_data_type                                            ),

				    .mem_data_input         (mem_data_input[memDataLen*i+:memDataLen]                 ),
        		.mem_data_output        (mem_data_output[memDataLen*i+:memDataLen]                ),
 		
        		.inst_eol               (eoi_pe[i]                                           ),
    
        		.pe_neigh_data_in       (pe_neigh_data_out[((i+1)%numPe)*dataLen+:dataLen]        ),
        		.pe_neigh_data_in_v     (pe_neigh_data_out_v[((i+1)%numPe)]                       ),
        
        		.pu_neigh_data_in       (pu_neigh_data_in                                         ),
        		.pu_neigh_data_in_v     ((i == 0) && pu_neigh_data_in_v                           ),
        
        		.pe_bus_data_in         (pe_bus_src_data[i]                                       ),
        		.pe_bus_data_in_v       (pe_bus_src_valid[i]                                   ),
 				    .pe_bus_contention      (pe_bus_fifo_full[i]                                 ),

        		.gb_bus_data_in         (gb_bus_data_in                                           ),
        		.gb_bus_data_in_v       ((i == 0) && gb_bus_data_in_v                             ),
        	
        		.pe_neigh_data_out      (pe_neigh_data_out[i*dataLen+:dataLen]                    ),
        		.pe_neigh_data_out_v    (pe_neigh_data_out_v[i]                                   ),
        	
        		.pu_neigh_data_out      (pu_neigh_data_out_w[i*dataLen+:dataLen]                  ),
        		.pu_neigh_data_out_v    (pu_neigh_data_out_v_w[i]                                 ),
        	
 				    .pe_bus_data_out        (pe_bus_dest_data[i]                                      ),
				 .pe_bus_data_out_v      (pe_bus_data_out_v[i]                                     ),
				    
				.pe_bus_src_addr        (pe_bus_src_addr[i]                                       ),
				.pe_bus_src_rq          (pe_bus_src_rq[i]                                         ),
  				
				.gb_bus_src_addr        (gb_bus_src_addr_w[i]                                       ),
				.gb_bus_src_rq          (gb_bus_src_rq_w[i]                                         ),
     	
				    .gb_bus_data_out        (gb_bus_data_out_w[i*dataLen+:dataLen]                    ),
				    .gb_bus_data_out_v      (gb_bus_data_out_v_w[i*gbBusIndexLen+:gbBusIndexLen]      ),
				    .gb_bus_contention      (gb_bus_contention                                        )
          );
      
          assign pe_data_to_master[(i+1)*dataLen-1: i*dataLen] = {dataLen{1'b0}};
          assign pe_addr_to_master[(i+1)*logNumPe-1: i*logNumPe] = {logNumPe{1'b0}};
          assign pe_valid_to_bus[i] = 1'b0;
          assign pe_rd_buffer_full[(i+1)*numPe-1: i*numPe] = 1'b1;
	end
   
	end
	endgenerate
    
    parameter PE_NEIGH_PIPELINE_WIDTH = (dataLen+2)*numPe;
    wire [PE_NEIGH_PIPELINE_WIDTH-1:0] pipeline_in,pipeline_out;
    
    assign pipeline_in = {pe_neigh_data_out,pe_neigh_data_out_v,pe_neigh_full};

    pipeline #(
        .NUM_BITS	( PE_NEIGH_PIPELINE_WIDTH	),
        .NUM_STAGES	( `NEIGH_PIPELINE_STAGES_PE	)
        
    ) mem_pipeline(
    
        .clk		(	clk		),
        .rstn		(	~reset		),
        
        .data_in	(	pipeline_in	),
        .data_out	(	pipeline_out)
        
        );
    
    assign {pe_neigh_data_out_p,pe_neigh_data_out_v_p,pe_neigh_full_p} = pipeline_out;


    bus_pipeline #(
      .NUM_PE(numPe),
      .DATA_LEN(dataLen),
      .BUS_ADDR_LEN(logNumPe),
      .NUM_STAGES(`BUS_PIPELINE_STAGES_PE)
    )
    bus_pipeline_pe_inst
    (
    	.clk		        (clk		            ),
    	.rstn		        (~reset	            ),
    	.i_addr_to_bus	  (pe_addr_to_master  ),
    	.i_data_to_bus	  (pe_data_to_master  ),
    	.valid_to_bus	  (pe_valid_to_bus	  ),
    	.i_rd_buffer_full	(pe_rd_buffer_full	),
        
        .o_addr_to_bus_p	  (pe_addr_to_master_p  ),
    	.o_data_to_bus_p	  (pe_data_to_master_p  ),
    	.valid_to_bus_p	  (pe_valid_to_bus_p	  ),
    	.o_rd_buffer_full_p	(pe_rd_buffer_full_p	),
 

        .data_bus       (pe_data_bus),
        .addr_bus       (pe_addr_bus),
     
    	.wr_to_bus	    (pe_wr_to_bus	      ),
    	.rd_from_bus	  (pe_rd_from_bus	    ),
    	
    	.o_data_bus_p       (pe_data_bus_p),
        .o_addr_bus_p       (pe_addr_bus_p),
     
    	.wr_to_bus_p	    (pe_wr_to_bus_p	      ),
    	.rd_from_bus_p	  (pe_rd_from_bus_p	    )
    );
    
    master_controller #(
      .NUM_PE(numPe),
      .DATA_LEN(dataLen),
      .BUS_ADDR_LEN(logNumPe),
      .NUM_STAGES(`BUS_PIPELINE_STAGES_PE)
    )
    master_controller_pe_inst
    (
    	.clk		        (clk		            ),
    	.rstn		        (~reset	            ),
    	.addr_to_bus_i	  (pe_addr_to_master_p  ),
    	.data_to_bus_i	  (pe_data_to_master_p  ),
    	.valid_to_bus	  (pe_valid_to_bus_p	  ),
    	.rd_buffer_full_i	(pe_rd_buffer_full_p	),
 
        .data_bus       (pe_data_bus),
        .addr_bus       (pe_addr_bus),
     
    	.wr_to_bus	    (pe_wr_to_bus	      ),
    	.rd_from_bus	  (pe_rd_from_bus	    )
    );

  
endmodule

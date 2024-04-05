`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"
	`include "config.vh"
	`include "log.vh"
`endif

module accelerator
#(
	//DESIGN BUILDER TOUCH
    parameter numPeValid			= `NUM_PE_VALID,
    parameter indexLen              = `INDEX_IN_INST,
    //DESIGN BUILDER UNTOUCH
    
    //FROM WRAPPER
   	parameter memDataLen            = 16, //width of the data coming from the memory
    parameter dataLen               = 16,
    parameter logMemNamespaces      = `LOG_MEM_NAME_SPACES,  //instruction, data, weight, meta
    parameter NUM_DATA              = 16,
    
    //FIXED
    parameter logNumMemLanes		= `C_LOG_2(NUM_DATA),
    parameter numPu              = `NUM_PU,
    parameter numPe              = `NUM_PE,
    parameter logNumPu                = `C_LOG_2(numPu), 
    parameter logNumPe   				= `C_LOG_2(numPe),
    
    parameter numMemLanes			= 1 << logNumMemLanes,
    parameter logNumPeMemLanes		= logNumPu + logNumPe > logNumMemLanes ? logNumPu + logNumPe - logNumMemLanes : 1,
    
    parameter memCtrlIn			    = logMemNamespaces + (logNumPeMemLanes+1)*numMemLanes
)
(
    input  wire                             		clk,
    input  wire                             		reset_in,
    input  wire										start,
    input  wire										eoc, //end of compute from the memory interface
    input  wire [memCtrlIn - 1 : 0] 				mem_ctrl_in,
    input  wire 									mem_rd_wrt, 
  
    input  wire [memDataLen*numMemLanes - 1 : 0] 	mem_data_input,
    
    output wire [memDataLen*numMemLanes - 1 : 0]  	mem_data_output,
    
    output wire                             		eol
);
    //--------------------------------------------------------------------------------------
    
    localparam peBusIndexLen        = logNumPe + 1;
    localparam gbBusIndexLen        = logNumPu + 1;
    
    localparam numPuMemLanes 		= numMemLanes< numPe ? 1 :numMemLanes/numPe; //number of PUs accross the lanes of the memory interface lanes
    localparam numPeMemLane		= numPu*numPe/numMemLanes; //number of PUs accross the lanes of the memory interface lanes
    
    
    localparam numPeMemLanes = logNumPu + logNumPe > logNumMemLanes ? 1 << logNumPeMemLanes : 1;
    
    //--------------------------------------------------------------------------------------
   
    
    //--------------------------------------------------------------------------------------
    wire    [numPu-1:0]					start_p;
    wire	[numPu-1:0]					eoc_p; //end of compute from the memory interface
    wire [memCtrlIn - 1 : 0] 				mem_ctrl_in_p[0:numPu-1];
    wire 	[numPu-1:0]					mem_rd_wrt_p; 
  
    wire [memDataLen*numMemLanes - 1 : 0] 	mem_data_input_p[0:numPu-1];


    wire [numPu - 1 : 0]			eol_pu,eol_pu_p;
    reg  [numPu - 1 : 0]            eol_pu_r;
    wire reset;
    assign reset = reset_in;// || (start && (&eol_pu_p));
    
	wire [dataLen*numPu - 1 : 0 ] 	pu_neigh_data_out,pu_neigh_data_out_p;
	wire [numPu - 1 : 0] 		  	pu_neigh_data_out_v,pu_neigh_data_out_v_p;

//	wire [numPu - 1 : 0]			eoc_pu;
//  assign eoc = |eoc_pu;

    
    always @(posedge clk) begin
    	if(reset || eoc) eol_pu_r <= 0;
    	else eol_pu_r <= eol_pu_p;//  & ~{numPu{start}};// & ~eol_pu_r; 
    end
    	
    assign eol = (&eol_pu_p)&(~(&eol_pu_r));
    
    reg restart;
//    always @(posedge clk or posedge reset)
//        if(reset)
//            restart <= 1'b0;
//        else
//            restart <= &eol_pu;
     
/*    
    wire [numPu - 1 : 0 ]			gb_bus_data_in_v_pu_decoder_out;
    wire [numPu - 1 : 0 ]   		gb_bus_data_in_v_pu;

    decoder
    #(
        .inputLen(logNumPu)
    )
    gb_bus_decoder(
        (gb_bus_data_in_v[logNumPu : 1]),
        gb_bus_data_in_v_pu_decoder_out 
    );
    
    assign gb_bus_data_in_v_pu = (gb_bus_ctrl == 0) ? 0 : gb_bus_data_in_v_pu_decoder_out & {numPu{gb_bus_data_in_v[0]}};
 */   
    wire [memDataLen*numPe*numPu - 1 : 0] mem_data_output_w,mem_data_output_w_p;


  wire [logNumPu:0]  gb_bus_data_out_v[0:numPu-1];
  wire [logNumPu-1:0]  gb_bus_dest_addr[0:numPu-1];
  wire [logNumPu-1:0]  gb_bus_src_addr[0:numPu-1];
  wire [logNumPu-1:0]  gb_addr_bus;
  wire [logNumPu*numPu-1:0]  gb_addr_bus_p;
  wire [logNumPu*numPu-1:0] gb_addr_to_master,gb_addr_to_master_p;
  wire [dataLen*numPu-1:0] gb_data_to_master,gb_data_to_master_p;
  wire [dataLen-1:0]  gb_bus_dest_data[0:numPu-1];
  wire [dataLen-1:0]  gb_bus_src_data[0:numPu-1];
  wire [dataLen-1:0]  gb_data_bus;
  wire [dataLen*numPu-1:0]  gb_data_bus_p;
  wire [numPu-1:0]  gb_bus_dest_valid,gb_bus_src_rq,gb_rd_from_bus,gb_rd_from_bus_p,gb_wr_to_bus,gb_wr_to_bus_p;
  wire [numPu-1:0]  gb_bus_src_valid,gb_valid_to_bus,gb_valid_to_bus_p,gb_bus_fifo_full;
  wire [numPu*numPu-1:0] gb_bus_rd_buffer_full,gb_bus_rd_buffer_full_p;
  
    wire [numPu-1:0] pu_neigh_full,pu_neigh_full_p;
    
    wire [numPu-1:0] stall;
    
    localparam integer MEM_PIPELINE_WIDTH1   = memCtrlIn+1+1+(memDataLen*numMemLanes)+1;
    localparam integer MEM_PIPELINE_WIDTH2   = (memDataLen*numPe*numPu)+8;
    
    wire [MEM_PIPELINE_WIDTH1-1:0] pipeline_in1,pipeline_out_common,pipeline_out1[0:numPu-1];
    wire [MEM_PIPELINE_WIDTH2-1:0] pipeline_in2,pipeline_out2;
    assign pipeline_in1 = {start,mem_ctrl_in,mem_rd_wrt,mem_data_input,eoc};
    assign pipeline_in2 = {mem_data_output_w,eol_pu};
    
    pipeline #(
        .NUM_BITS	( MEM_PIPELINE_WIDTH1	),
        .NUM_STAGES	( `MEM_PIPELINE_STAGES_COMMON	)
        
    ) mem_pipeline_common(
    
        .clk		(	clk		),
        .rstn		(	~reset		),
        
        .data_in	(	pipeline_in1	),
        .data_out	(	pipeline_out_common)
        
        );
        
    generate
    for(genvar gv=0;gv< numPu;gv=gv+1) begin
    pipeline #(
        .NUM_BITS	( MEM_PIPELINE_WIDTH1	),
        .NUM_STAGES	( `MEM_PIPELINE_STAGES	)
        
    ) mem_pipeline(
    
        .clk		(	clk		),
        .rstn		(	~reset		),
        
        .data_in	(	pipeline_out_common	),
        .data_out	(	pipeline_out1[gv])
        
        );
    
    assign {start_p[gv],mem_ctrl_in_p[gv],mem_rd_wrt_p[gv],mem_data_input_p[gv],eoc_p[gv]} = pipeline_out1[gv];
    end
    endgenerate
    
    pipeline #(
        .NUM_BITS	( MEM_PIPELINE_WIDTH2	),
        .NUM_STAGES	( `MEM_PIPELINE_STAGES_OUTPUTS	)
        
    ) mem_pipeline_outputs(
    
        .clk		(	clk		),
        .rstn		(	~reset		),
        
        .data_in	(	pipeline_in2 ),
        .data_out	(	pipeline_out2)
        
        );
    
    assign {mem_data_output_w_p,eol_pu_p} = pipeline_out2;
    

	generate
	for(genvar i = 0; i < numPu; i= i + 1) 
  begin: GEN_PU
	
		 pu 
   		 #(
        	//--------------------------------------------------------------------------------------
        	.puId(i),
        	.numPeValid(numPeValid),
        	.logNumPu(logNumPu),
        	.logNumPe(logNumPe),
        	.memDataLen(memDataLen),
        	.indexLen(indexLen),
        	.dataLen(dataLen),
        	.logMemNamespaces(logMemNamespaces), 
        	.numPuMemLanes(numPuMemLanes),
        	.logNumPeMemLanes(logNumPeMemLanes)
        	//--------------------------------------------------------------------------------------
    	) pu_unit(
    		.clk(clk),
    		.reset(reset),
    		.start(start_p[i]),
    		.eoc(eoc_p[i]),
    		.restart(1'b0),
    		.stall(stall[i]),
    		.mem_rd_wrt(mem_rd_wrt_p[i]),
    		.ctrl_mem_in(mem_ctrl_in_p[i][((logNumPeMemLanes+1)*numPe*(i%numPuMemLanes)+logMemNamespaces) +:(logNumPeMemLanes+1)*numPe]),
    		.mem_data_type(mem_ctrl_in_p[i][logMemNamespaces - 1 : 0]),
    		.mem_data_input(mem_data_input_p[i][numPe*memDataLen*(i%numPuMemLanes)+:numPe*memDataLen]),
    		.mem_data_output(mem_data_output_w[numPe*memDataLen*i+:numPe*memDataLen]),
    
    		.pu_neigh_data_in(pu_neigh_data_out_p[((i+7)%numPu)*dataLen+:dataLen]),
    		.pu_neigh_data_in_v(pu_neigh_data_out_v_p[((i+7)%numPu)]),
        
    		.gb_bus_data_out(gb_bus_dest_data[i]),
    		.gb_bus_data_out_v(gb_bus_data_out_v[i]),
    		.gb_bus_contention(gb_bus_fifo_full[i]),
        .gb_bus_src_addr        (gb_bus_src_addr[i]                                       ),
				.gb_bus_src_rq          (gb_bus_src_rq[i]                                         ),
      	
	      
    		.eoi_pu(eol_pu[i]),
    
    		.pu_neigh_data_out(pu_neigh_data_out[i*dataLen+:dataLen]),
    		.pu_neigh_data_out_v(pu_neigh_data_out_v[i]),
    
    		.gb_bus_data_in(gb_bus_src_data[i]),
    		.gb_bus_data_in_v(gb_bus_src_valid[i]),
    		
    		.pu_neigh_full_out(pu_neigh_full[i]),
    		.pu_neigh_full_in(pu_neigh_full_p[(i+1)%numPu])

        //---------------------------------------------------------------------------------------
    );
      assign gb_bus_dest_addr[i] = gb_bus_data_out_v[i][logNumPu:1];
      assign gb_bus_dest_valid[i] = gb_bus_data_out_v[i][0]; 
      slave_controller #( 
            .PE_ID(i),
            .BUS_ADDR_LEN(logNumPu),
            .NUM_ELEM(numPu),
            .DATA_LEN(dataLen),
            .NUM_STAGES(`BUS_PIPELINE_STAGES_PU),
            .FIFO_DEPTH(`FIFO_DEPTH_MACRO_PU(i))      
           ) 
            pu_bus_slave_inst(
        		.clk		        (clk		                ),
        		.rstn		        (~reset	                ),
                .stall          (stall[i]),
        		.dest_addr	    (gb_bus_dest_addr[i]    ),
        		.dest_valid	    (gb_bus_dest_valid[i]   ),
        		.dest_data	    (gb_bus_dest_data[i]  	),
        
        		.src_addr	      (gb_bus_src_addr[i]	  	),
        		.src_rq		      (gb_bus_src_rq[i]	      ),
        		
        		.bus_data	      (gb_data_bus_p[(i+1)*dataLen-1: i*dataLen]		        ),
        		.addr_bus	      (gb_addr_bus_p[(i+1)*logNumPu-1: i*logNumPu]		        ),
        		.rd_from_bus	  (gb_rd_from_bus_p[i]	  	),
        
        		.wr_to_bus	    (gb_wr_to_bus_p[i]		    ),
        		
            //
        		.src_data	      (gb_bus_src_data[i]	    ),
        		.src_valid	    (gb_bus_src_valid[i]  	),
        		
        		.data_to_bus	  (gb_data_to_master[(i+1)*dataLen-1: i*dataLen]	 	),	
        		.addr_to_bus	  (gb_addr_to_master[(i+1)*logNumPu-1: i*logNumPu]	 	),	
        		.valid_to_bus	  (gb_valid_to_bus[i]	    ),
        		.wr_fifo_full	  (gb_bus_fifo_full[i]  	),
        		.rd_buffer_full	(gb_bus_rd_buffer_full[(i+1)*numPu-1: i*numPu])
        	);


	end
	endgenerate
    
    parameter PU_NEIGH_PIPELINE_WIDTH = (dataLen+2)*numPu;
    wire [PU_NEIGH_PIPELINE_WIDTH-1:0] pipeline_in,pipeline_out;
    
    assign pipeline_in = {pu_neigh_data_out,pu_neigh_data_out_v,pu_neigh_full};

    pipeline #(
        .NUM_BITS	( PU_NEIGH_PIPELINE_WIDTH	),
        .NUM_STAGES	( `NEIGH_PIPELINE_STAGES_PU	)
        
    ) mem_pipeline(
    
        .clk		(	clk		),
        .rstn		(	~reset		),
        
        .data_in	(	pipeline_in	),
        .data_out	(	pipeline_out)
        
        );
    
    assign {pu_neigh_data_out_p,pu_neigh_data_out_v_p,pu_neigh_full_p} = pipeline_out;
    
    bus_pipeline #(
      .NUM_PE(numPu),
      .DATA_LEN(dataLen),
      .BUS_ADDR_LEN(logNumPu),
      .NUM_STAGES(`BUS_PIPELINE_STAGES_PU)
    )
    bus_pipeline_pu_inst
    (
    	.clk		        (clk		            ),
    	.rstn		        (~reset	            ),
    	
    	.i_addr_to_bus	  (gb_addr_to_master  ),
    	.i_data_to_bus	  (gb_data_to_master  ),
    	.valid_to_bus	  (gb_valid_to_bus	  ),
    	.i_rd_buffer_full	(gb_bus_rd_buffer_full	),
        
        .o_addr_to_bus_p	  (gb_addr_to_master_p  ),
    	.o_data_to_bus_p	  (gb_data_to_master_p  ),
    	.valid_to_bus_p	  (gb_valid_to_bus_p	  ),
    	.o_rd_buffer_full_p	(gb_bus_rd_buffer_full_p	),
    	
        .data_bus       (gb_data_bus),
        .addr_bus       (gb_addr_bus),
        
    	.wr_to_bus	    (gb_wr_to_bus	      ),
    	.rd_from_bus	  (gb_rd_from_bus	    ),
    	
    	.o_data_bus_p       (gb_data_bus_p),
        .o_addr_bus_p       (gb_addr_bus_p),
        
    	.wr_to_bus_p	    (gb_wr_to_bus_p	      ),
    	.rd_from_bus_p	  (gb_rd_from_bus_p	    )
    );
    
    master_controller #(
      .NUM_PE(numPu),
      .DATA_LEN(dataLen),
      .BUS_ADDR_LEN(logNumPu),
      .NUM_STAGES(`BUS_PIPELINE_STAGES_PU)
    )
    master_controller_pu_inst
    (
    	.clk		        (clk		            ),
    	.rstn		        (~reset	            ),
    	.addr_to_bus_i	  (gb_addr_to_master_p  ),
    	.data_to_bus_i	  (gb_data_to_master_p  ),
    	.valid_to_bus	  (gb_valid_to_bus_p	  ),
    	.rd_buffer_full_i	(gb_bus_rd_buffer_full_p	),
    
        .data_bus       (gb_data_bus),
        .addr_bus       (gb_addr_bus),
        
    	.wr_to_bus	    (gb_wr_to_bus	      ),
    	.rd_from_bus	  (gb_rd_from_bus	    )
    );


	wire [logNumPeMemLanes*numMemLanes - 1 : 0] peId_mem_in;
	wire  [logNumPeMemLanes*numMemLanes - 1 : 0] peId_mem_in_d;
	wire [memDataLen*numPu*numPe - 1 : 0] mem_data_output_mux_in;
    wire [memCtrlIn - logMemNamespaces - 1 : 0] mem_ctrl_in_lanes;
    
    assign mem_ctrl_in_lanes = mem_ctrl_in[memCtrlIn - 1 : logMemNamespaces];
    
	genvar j;
	generate
		for(genvar i = 0; i < numMemLanes; i = i + 1) 
		begin: MEM_LANES_GEN
			if(logNumPeMemLanes != 1)
			     assign peId_mem_in[i*logNumPeMemLanes+:logNumPeMemLanes] = mem_ctrl_in_lanes[((logNumPeMemLanes+1)*i+1)+:logNumPeMemLanes];
		     else
		          assign peId_mem_in[i*logNumPeMemLanes] = mem_ctrl_in_lanes[((logNumPeMemLanes+1)*i+1)];
			
		
			for( j = 0; j < numPeMemLanes; j = j + 1) 
			begin: MEM_DATA_OUTPUT_MUX_GEN
				assign mem_data_output_mux_in[(i*numPeMemLanes+j)*memDataLen+:memDataLen] = mem_data_output_w_p[memDataLen*(i+j*numPe*numPuMemLanes)+:memDataLen];
			end
		end
	endgenerate
	

//  always @(posedge clk)
//  begin
//    if (reset) peId_mem_in_d <= 0;
//    else       peId_mem_in_d <= peId_mem_in;
//  end
    pipeline #(
        .NUM_BITS	( logNumPeMemLanes*numMemLanes	),
        .NUM_STAGES	( `MEM_PIPELINE_STAGES+`MEM_PIPELINE_STAGES_COMMON+`MEM_PIPELINE_STAGES_OUTPUTS+1	)
        
    ) mem_pipeline_peId(
    
        .clk		(	clk		),
        .rstn		(	~reset		),
        
        .data_in	(	peId_mem_in ),
        .data_out	(	peId_mem_in_d)
        
        );
	generate
	for(genvar i = 0; i < numMemLanes; i = i + 1) 
 	begin: MUX_ACCELERATOR_OUTPUT
    	mux
    	#(
    		.DATA_WIDTH(memDataLen),
    		.NUM_DATA(numPeMemLanes)
    	)   
    	mux_weight_rd(
    		.DATA_IN(mem_data_output_mux_in[memDataLen*numPeMemLanes*i+:memDataLen*numPeMemLanes]),
    		.CTRL_IN(peId_mem_in_d[logNumPeMemLanes*i+:logNumPeMemLanes]),
    		.DATA_OUT(mem_data_output[memDataLen*i+:memDataLen])
    	);
    end
	endgenerate
	
`ifdef SIMULATION
	reg mem_rd_wrt_d;
	always @(posedge clk) begin 
	  mem_rd_wrt_d <= mem_rd_wrt;
  end
  
//  always @(posedge clk) begin
//    if(mem_rd_wrt_d == 1) $display("dataOut %h", mem_data_output);
//	  if(eol == 1) $display("End of Loop");
//	  if(eoc == 1) $display("End of Computation");
//	end
`endif

endmodule

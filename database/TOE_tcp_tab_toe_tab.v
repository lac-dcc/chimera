`timescale 1ns / 1ps
module toe_tab #(
        parameter    RAM_STYLE    = "block"        ,               // Specify RAM style: auto/block/distributed
        parameter    INIT_FILE    = ""             ,               // Specify name/location of RAM initialization file if using one (leave blank if not)
        parameter    UNUM         = 2              ,               //read user num
        parameter    ID_WID       = logb(UNUM)   ,
        parameter    TAB_AWID     = 8              ,               //table addr width
        parameter    TAB_DWID     = 8              ,               //table data width
        parameter    WLEN         = 2              ,               //table data width
        parameter    RLEN         = 2              ,               //table data width
        parameter    DWID_RATIO   = 4              ,
        parameter    CBUS_AWID    = 16             ,
        parameter    CBUS_DWID    = 32             ,
        parameter    DBG_WID      = 32                              //debug signal
) (
        input   wire                         clk                       ,
        input   wire                         rst                       ,
    //input read table
        input   wire [1*UNUM-1:0]            usr_tab_rreq_fifo_wen     ,           
        input   wire [TAB_AWID*UNUM-1:0]     usr_tab_rreq_fifo_wdata   ,           
        output  wire [1*UNUM-1:0]            usr_tab_rreq_fifo_nafull  ,           

        output  wire [1*UNUM-1:0]            usr_tab_rdat_fifo_wen     ,           
        output  wire [TAB_DWID*UNUM-1:0]     usr_tab_rdat_fifo_wdata   ,           
        input   wire [1*UNUM-1:0]            usr_tab_rdat_fifo_nafull  ,           
    //input write table
        input   wire [1-1:0]                 usr_tab_wreq_fifo_wen     ,           
        input   wire [TAB_AWID-1:0]          usr_tab_wreq_fifo_wdata   ,           
        output  wire [1-1:0]                 usr_tab_wreq_fifo_nafull  ,           

        input   wire [1-1:0]                 usr_tab_wdat_fifo_wen     ,           
        input   wire [TAB_DWID-1:0]          usr_tab_wdat_fifo_wdata   ,           
        output  wire [1-1:0]                 usr_tab_wdat_fifo_nafull  ,           

      //input cbus interface
        input   wire                         tab_cbus_req              ,
        input   wire                         tab_cbus_rw               ,
        output  wire                         tab_cbus_ack              ,
        input   wire [CBUS_AWID-1:0]         tab_cbus_addr             ,
        input   wire [CBUS_DWID-1:0]         tab_cbus_wdata            ,
        output  wire [CBUS_DWID-1:0]         tab_cbus_rdata            ,

    //output debug
        output  wire [DBG_WID-1:0]           dbg_sig                    //debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//  parameter define
//////////////////////////////////////////////////////////////////////////////////
//localparam TAB_INFO_WID = 3;
//localparam CP_INFO_WID  = 32;

//////////////////////////////////////////////////////////////////////////////////
//  variable define
//////////////////////////////////////////////////////////////////////////////////
genvar i;
wire [1*UNUM-1:0]           usr_tab_rreq_fifo_ren    ;           
wire [TAB_AWID*UNUM-1:0]         usr_tab_rreq_fifo_rdata    ;           
wire [1*UNUM-1:0]           usr_tab_rreq_fifo_nempty  ;           

//////////////////////////////////////////////////////////////////////////////////
//  instance of table read req fifo for arbitration
//////////////////////////////////////////////////////////////////////////////////
generate 
for( i=0; i<UNUM; i=i+1 ) begin
        bfifo #(
                .RAM_STYLE              ( "block"                   ),              // Specify RAM style: auto/block/distributed
                .DWID                   ( TAB_AWID                  ),
                .AWID                   ( 5                         ),
                .AFULL_TH               ( 8                         ),
                .AEMPTY_TH              ( 8                         ),
                .DBG_WID                ( 32                        )
        ) u_tab_rreq_fifo (
                .clk                    ( clk                                ),                      // write clock
                .rst                    ( rst                                ),                      // write reset
                .wen                    ( usr_tab_rreq_fifo_wen[i]              ),                      // Write enable
                .wdata                  ( usr_tab_rreq_fifo_wdata[i*TAB_AWID+:TAB_AWID]             ),              // RAM input data
                .nfull                  (                      ),              //
                .nafull                 ( usr_tab_rreq_fifo_nafull[i]           ),              //
                .woverflow              (                                   ),              //
                .cnt_free               (                                   ),              // the counter used in fifo for read clock domain
                .ren                    ( usr_tab_rreq_fifo_ren[i]              ),              // Read Enable
                .rdata                  ( usr_tab_rreq_fifo_rdata[i*TAB_AWID+:TAB_AWID]             ),              // RAM output data
                .nempty                 ( usr_tab_rreq_fifo_nempty[i]           ),              //
                .naempty                (                        ),              //
                .roverflow              (                                   ),              //
                .cnt_used               (                                   ),              // the counter used in fifo for write clock domain
                .dbg_sig                (                                   )               // debug signal
        );
end
endgenerate

//////////////////////////////////////////////////////////////////////////////////
//   mux read req from multi-user channel into one central channel
//////////////////////////////////////////////////////////////////////////////////
wire [1-1:0]           ctr_tab_rreq_wen    ;           //central read req
wire [TAB_AWID-1:0]         ctr_tab_rreq_wdata    ;           
wire [1-1:0]           ctr_tab_rreq_nafull    ;           
wire [1-1:0]           ctr_rreq_info_fifo_wen    ;           //central read req
wire [ID_WID-1:0]         ctr_rreq_info_fifo_wdata  ;           
wire [1-1:0]           ctr_rreq_info_fifo_nafull  ;           
wire [1-1:0]           ctr_rreq_info_fifo_ren    ;           //central read req
wire [ID_WID-1:0]         ctr_rreq_info_fifo_rdata  ;           
wire [1-1:0]           ctr_rreq_info_fifo_nempty  ;           

cell_mux #(
        .UNUM                  ( UNUM                   ),              // user number
        .CELLSZ                ( 1                   ),
        .GAP                        ( RLEN+1                   ),    // every abitration's gap
        .DWID      ( TAB_AWID        ),
        .DBG_WID      ( 32          )
) tab_rreq_arb (
        .clk                    ( clk                       ),              // 
        .rst                    ( rst                       ),              // 
        .in_cell_ren            ( usr_tab_rreq_fifo_ren     ),              // 
        .in_cell_rdata          ( usr_tab_rreq_fifo_rdata   ),              // 
        .in_cell_nempty         ( usr_tab_rreq_fifo_nempty  ),              //
        .out_info_wen           ( ctr_rreq_info_fifo_wen    ),            // rreq's info, indicates the arb result's channel id
        .out_info_wdata         ( ctr_rreq_info_fifo_wdata  ),              // 
        .out_info_nafull        ( ctr_rreq_info_fifo_nafull ),              //
        .out_cell_wen           ( ctr_tab_rreq_wen          ),            // 
        .out_cell_wdata         ( ctr_tab_rreq_wdata         ),              // 
        .out_cell_nafull        ( ctr_tab_rreq_nafull       )               //
);

assign ctr_tab_rreq_nafull = 1'b1;
//////////////////////////////////////////////////////////////////////////////////
//  instance of read req info fifo and it stores arbitration's result
//////////////////////////////////////////////////////////////////////////////////
bfifo #(
        .RAM_STYLE              ( "distributed"             ),              // Specify RAM style: auto/block/distributed
        .DWID                   ( ID_WID                    ),
        .AWID                   ( 5                         ),
        .AFULL_TH               ( 8                         ),
        .AEMPTY_TH              ( 8                         ),
        .DBG_WID                ( 32                        )
) u_tab_rreq_info_fifo (
        .clk                    ( clk                       ),                      // write clock
        .rst                    ( rst                       ),                      // write reset
        .wen                    ( ctr_rreq_info_fifo_wen    ),                      // Write enable
        .wdata                  ( ctr_rreq_info_fifo_wdata  ),              // RAM input data
        .nfull                  (              ),              //
        .nafull                 ( ctr_rreq_info_fifo_nafull ),              //
        .woverflow              (                           ),              //
        .cnt_free               (                           ),              // the counter used in fifo for read clock domain
        .ren                    ( ctr_rreq_info_fifo_ren    ),              // Read Enable
        .rdata                  ( ctr_rreq_info_fifo_rdata  ),              // RAM output data
        .nempty                 ( ctr_rreq_info_fifo_nempty ),              //
        .naempty                (                ),              //
        .roverflow              (                           ),              //
        .cnt_used               (                           ),              // the counter used in fifo for write clock domain
        .dbg_sig                (                           )               // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//   table ram with cbus
//////////////////////////////////////////////////////////////////////////////////
reg   [TAB_AWID-1:0]    tab_waddr  ;
reg   [TAB_AWID-1:0]    tab_raddr  ;
reg   [TAB_DWID  -1:0]    tab_wdata  ;
wire  [TAB_DWID  -1:0]    tab_rdata  ;
reg   [1-1:0]      tab_wen    ;
reg   [1-1:0]      tab_ren    ;
wire  [1-1:0]      tab_ren_2dly  ;
wire  [TAB_DWID  -1:0]    tab_rdata_1dly  ;

sdp_ram_with_cbus #(
        .RAM_STYLE  ( "block"    ),
        .DWID       ( TAB_DWID   ), 
        .AWID       ( TAB_AWID   ),
        //.DWID_RATIO ( DWID_RATIO ), 
        .CBUS_AWID  ( CBUS_AWID  ),
        .CBUS_DWID  ( CBUS_DWID  ),
        .INIT_FILE  ( INIT_FILE  ),
        .DBG_WID    ( DBG_WID    ) 
) inst_sdp_ram (
        .clk                (  clk            ),         // Write clock
        .rst                (  rst            ),         // Write reset
        .waddr              (  tab_waddr      ),         // Write address bus, width determined from RAM_DEPTH
        .wen                (  tab_wen        ),         // Write enable
        .wdata              (  tab_wdata      ),         // RAM input data
        .raddr              (  tab_raddr      ),         // Read address bus, width determined from RAM_DEPTH
        .ren                (  tab_ren        ),         // Read Enable, for additional power savings, disable when not in use
        .rdata              (  tab_rdata      ),         // RAM output data
        .cbus_req           (  tab_cbus_req      ),
        .cbus_rw            (  tab_cbus_rw       ),
        .cbus_ack           (  tab_cbus_ack      ),
        .cbus_addr          (  tab_cbus_addr     ),
        .cbus_wdata         (  tab_cbus_wdata    ),
        .cbus_rdata         (  tab_cbus_rdata    ),
        .dbg                (                  )          // debug signal
);

//////////////////////////////////////////////////////////////////////////////////
//  ram ren generation
//////////////////////////////////////////////////////////////////////////////////
wire [1-1:0]           ctr_tab_rreq_wen_ndly  ;           

//delay rreq for generate tab_ren for RLEN cycles
ctrl_pipe #( .DWID(1), .DLY_NUM(RLEN) ) u_ctrl_pipe_rreq_wen( .clk(clk), .rst(rst), .din( ctr_tab_rreq_wen ), .dout( ctr_tab_rreq_wen_ndly ) );

always@( posedge clk or posedge rst ) begin
        if( rst==1'b1 ) begin
                tab_ren   <= 1'b0;
        end
        else begin
                if( ctr_tab_rreq_wen==1'b1 ) begin
                        tab_ren <= 1'b1;
                end
                else if( ctr_tab_rreq_wen_ndly==1'b1 ) begin
                        tab_ren <= 1'b0;
                end
        end
end 

always@( posedge clk or posedge rst ) begin
        if( rst==1'b1 ) begin
                tab_raddr <= 0;
        end
        else begin
                if( ctr_tab_rreq_wen==1'b1 ) begin
                        tab_raddr <= ctr_tab_rreq_wdata;
                end
                else if( tab_ren==1'b1 )begin
                        tab_raddr <= tab_raddr + 1'b1;
                end
        end
end 

ctrl_pipe #( .DWID(1), .DLY_NUM(2) ) u_ctrl_pipe_tab_ren2( .clk(clk), .rst(rst), .din( tab_ren ), .dout( tab_ren_2dly ) );
data_pipe #( .DWID(TAB_DWID), .DLY_NUM(1) ) u_ctrl_pipe_tab_rdata( .clk(clk), .rst(rst), .din( tab_rdata ), .dout( tab_rdata_1dly ) );

//the return data from reading table
wire [1-1:0]           ctr_tab_rdat_wen      ;           //
wire [TAB_DWID-1:0]               ctr_tab_rdat_wdata      ;           //
wire [1-1:0]           ctr_tab_rdat_nafull      ;           //

assign      ctr_tab_rdat_wen  = tab_ren_2dly                ;           //
assign      ctr_tab_rdat_wdata  = tab_rdata_1dly                      ;           //

//////////////////////////////////////////////////////////////////////////////////
//   dmux rdata from table from one channel into multi-user channel
//////////////////////////////////////////////////////////////////////////////////
cell_dmux # (
        .UNUM              ( UNUM               ),              // user number
        .CELLSZ                ( RLEN               ),
        .DWID      ( TAB_DWID    ),
        .DBG_WID    ( 32      )
) tab_rdata_dmux (
        .clk                ( clk                         ),              // write clock
        .rst                ( rst                         ),              // write reset

        .in_cell_wen        ( ctr_tab_rdat_wen        ),              // Read Enable
        .in_cell_wdata      ( ctr_tab_rdat_wdata    ),              // RAM output data
        .in_cell_nafull     ( ctr_tab_rdat_nafull     ),              //

        .in_info_ren        ( ctr_rreq_info_fifo_ren      ),              // Read Enable
        .in_info_rdata      ( ctr_rreq_info_fifo_rdata  ),              // RAM output data
        .in_info_nempty     ( ctr_rreq_info_fifo_nempty   ),              //

        .out_cell_wen       ( usr_tab_rdat_fifo_wen       ),            // Write enable
        .out_cell_wdata     ( usr_tab_rdat_fifo_wdata     ),              // RAM input data
        .out_cell_nafull    ( usr_tab_rdat_fifo_nafull    )               //
);

//////////////////////////////////////////////////////////////////////////////////
//   table write generation
//////////////////////////////////////////////////////////////////////////////////
wire [1-1:0]           ctr_tab_wreq_wen     ;           //
wire [TAB_AWID-1:0]         ctr_tab_wreq_wdata     ;           //
wire [1-1:0]           ctr_tab_wreq_nafull           ;           //
wire [1-1:0]           ctr_tab_wdat_wen     ;           //
wire [TAB_DWID-1:0]         ctr_tab_wdat_wdata     ;           //
wire [1-1:0]           ctr_tab_wdat_nafull     ;           //
wire [1-1:0]           ctr_tab_wreq_wen_1dly    ;           //
wire [TAB_AWID-1:0]         ctr_tab_wreq_wdata_1dly    ;           //
wire [1-1:0]           tab_wen_tmp      ;           //
wire [TAB_AWID+1-1:0]         tab_waddr_tmp      ;           //

ctrl_pipe #( .DWID(1), .DLY_NUM(4) )        u_pipe_wreq_wen  ( .clk(clk), .rst(rst), .din( usr_tab_wreq_fifo_wen   ), .dout( ctr_tab_wreq_wen   ) );
ctrl_pipe #( .DWID(1), .DLY_NUM(4) )        u_pipe_wdat_wen  ( .clk(clk), .rst(rst), .din( usr_tab_wdat_fifo_wen   ), .dout( ctr_tab_wdat_wen   ) );
data_pipe #( .DWID(TAB_AWID), .DLY_NUM(4) ) u_pipe_wreq_wdata( .clk(clk), .rst(rst), .din( usr_tab_wreq_fifo_wdata ), .dout( ctr_tab_wreq_wdata ) );
data_pipe #( .DWID(TAB_DWID), .DLY_NUM(4) ) u_pipe_wdat_wdata( .clk(clk), .rst(rst), .din( usr_tab_wdat_fifo_wdata ), .dout( ctr_tab_wdat_wdata ) );

assign      usr_tab_wreq_fifo_nafull = 1'b1            ;           //
assign      usr_tab_wdat_fifo_nafull = 1'b1            ;           //

always@( posedge clk or posedge rst ) begin
        if( rst==1'b1 ) begin
                tab_wen     <= 1'b0  ;
                tab_wdata   <= 0     ;
        end
        else begin
                if( ctr_tab_wdat_wen==1'b1 ) begin
                        tab_wen     <= 1'b1               ;
                        tab_wdata   <= ctr_tab_wdat_wdata ;
                end
                else begin
                        tab_wen     <= 1'b0  ;
                end
        end
end 

always@( posedge clk or posedge rst ) begin
        if( rst==1'b1 ) begin
                tab_waddr <= 0   ;
        end
        else begin
                if( ctr_tab_wreq_wen==1'b1 ) begin
                        tab_waddr <= ctr_tab_wreq_wdata  ;
                end
                else if( tab_wen==1'b1 )begin
                        tab_waddr <= tab_waddr + 1'b1    ;
                end
        end
end 

//////////////////////////////////////////////////////////////////////////////////
//   debug process
//////////////////////////////////////////////////////////////////////////////////
assign dbg_sig = 32'h0;


//  The following function calculates the address width based on specified RAM depth
function integer logb;
        input integer depth;
        integer depth_reg;
        begin
                depth_reg = depth;
                for (logb=0; depth_reg>0; logb=logb+1)begin
                        depth_reg = depth_reg >> 1;
                end
                if( 2**logb >= depth*2 )begin
                        logb = logb - 1;
                end
        end 
endfunction

endmodule

module cell_mux #(
    parameter    CHN0_HPRIORY = 0 ,   
		parameter    UNUM         = 128 							,               
		parameter    ID_WID       = logb(UNUM)						,
		parameter    CELLSZ       = 1 								,               
		parameter    GAP          = 2 								,               
		parameter    DWID         = 12 								,               
		parameter    DBG_WID	  = 32    							 				
) (
		input	wire							clk		 			,
		input 	wire							rst					,
		output  reg  [1*UNUM-1:0] 				in_cell_ren			,           
		input   wire [DWID*UNUM-1:0] 			in_cell_rdata		,           
		input   wire [1*UNUM-1:0] 				in_cell_nempty		,           
	    output  reg  [1-1:0] 					out_info_wen        ,          	
	    output  reg  [ID_WID-1:0] 			    out_info_wdata      ,           
	    input  	wire [1-1:0] 					out_info_nafull     ,           
	    output  reg  [1-1:0] 					out_cell_wen        ,          	
	    output  reg  [DWID-1:0] 				out_cell_wdata      ,           
	    input  	wire [1-1:0] 					out_cell_nafull     ,           
		output	wire [DBG_WID-1:0]				dbg_sig							
);
reg  [7:0]						cnt_clk     ;
reg  [1-1:0] 					get_gnt		;
wire [1*UNUM-1:0] 				gnt			;
wire [ID_WID-1:0] 				gnt_id		;
reg  [ID_WID-1:0] 				gnt_id_reg	;
wire [1*UNUM-1:0] 				in_cell_nempty_tmp;	
generate 
        if (CHN0_HPRIORY == 0 ) begin   
           rr_arb #(.REQ_NUM(UNUM) ) u_rr_arb( .clk(clk), .rst(rst), .req(in_cell_nempty), .get_gnt( get_gnt ), .gnt(gnt), .gnt_id(gnt_id) );
        end
        else  begin
           assign in_cell_nempty_tmp = (in_cell_nempty[0]==1'b1) ? { {(UNUM-1){1'b0}}, 1'b1} : in_cell_nempty;
           rr_arb #(.REQ_NUM(UNUM) ) u_rr_arb( .clk(clk), .rst(rst), .req(in_cell_nempty_tmp), .get_gnt( get_gnt ), .gnt(gnt), .gnt_id(gnt_id) );
        end
endgenerate
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				cnt_clk <= 0;
				get_gnt <= 0;
		end
		else begin
				if( cnt_clk>(GAP-1) && gnt!=0 ) begin
						cnt_clk <= 0;
						get_gnt <= (out_cell_nafull==1'b1 && out_info_nafull==1'b1) ? 1'b1 : 1'b0;
				end
				else begin
						cnt_clk <= cnt_clk+1'b1;
						get_gnt <= 1'b0;
				end
		end
end
wire get_gnt_dly;
ctrl_pipe #( .DWID(1), .DLY_NUM(CELLSZ) ) u_ctrl_pipe_get_gnt( .clk(clk), .rst(rst), .din( get_gnt ), .dout( get_gnt_dly ) );
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				in_cell_ren     <= 0;
				gnt_id_reg  	<= 0;
		end
		else begin
				if( get_gnt==1'b1 ) begin
						in_cell_ren <= gnt;
						gnt_id_reg  <= gnt_id 	;
				end
				else if( get_gnt_dly==1'b1 ) begin
						in_cell_ren <= 0;
				end
		end
end
always @ ( posedge clk or posedge rst ) begin
        if( rst==1'b1 ) begin
                out_info_wen   <= 0;
                out_info_wdata <= 0;
                out_cell_wen   <= 0;
                out_cell_wdata <= 0;
        end
        else begin
                out_info_wen   <= get_gnt	;
                if( get_gnt==1'b1 ) begin
                        out_info_wdata <= gnt_id 	;
                end
                out_cell_wen   <= |in_cell_ren	;
                out_cell_wdata <= in_cell_rdata[gnt_id_reg*DWID+:DWID];
                end
        end
assign dbg_sig = 32'h0;
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction
endmodule


`timescale 1ns / 1ps
module cell_dmux #(
		parameter    UNUM         = 2 								,               
		parameter    CELLSZ       = 2 								,               
		parameter    DWID         = 128								,               
		parameter    INFO_WID	  = logb(UNUM)					, 				
		parameter    DBG_WID	  = 32    							 				
) (
		input	wire							clk		 			,
		input 	wire							rst					,
	    input   wire  [1-1:0] 					in_cell_wen         ,          	
	    input   wire  [DWID-1:0] 				in_cell_wdata       ,           
	    output 	wire  [1-1:0] 					in_cell_nafull      ,           
	    output  wire [1-1:0] 					in_info_ren        ,          	
	    input   wire [INFO_WID-1:0] 		    in_info_rdata      ,           
	    input  	wire [1-1:0] 					in_info_nempty     ,           
		output  reg  [1*UNUM-1:0] 				out_cell_wen		,           
		output  reg  [DWID*UNUM-1:0] 			out_cell_wdata		,           
		input   wire [1*UNUM-1:0] 				out_cell_nafull		,           
		output	wire [DBG_WID-1:0]				dbg_sig							
);
integer i;
reg [3:0] cnt_wen;
assign in_cell_nafull = & out_cell_nafull ;
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				cnt_wen <= 0;
		end
		else begin
				if( in_cell_wen==1'b1 && cnt_wen==(CELLSZ-1) ) begin
						cnt_wen <= 0;
				end
				else if( in_cell_wen==1'b1 ) begin
						cnt_wen <= cnt_wen + 1'b1;
				end
		end
end
assign  in_info_ren = ( in_cell_wen==1'b1 && cnt_wen==(CELLSZ-1) ) ? 1'b1 : 1'b0;
reg  [1*UNUM-1:0] 				out_cell_wen_tmp		;           
reg  [DWID*UNUM-1:0] 			out_cell_wdata_tmp		;           
always @ ( * ) begin
		out_cell_wen_tmp = 0;
		for( i=0; i<UNUM; i=i+1 ) begin
				if( i==in_info_rdata ) begin
						out_cell_wen_tmp[i] = in_cell_wen;
				end
		end
end
always @ ( * ) begin
		out_cell_wdata_tmp = 0;
		for( i=0; i<UNUM; i=i+1 ) begin
				out_cell_wdata_tmp[i*DWID+:DWID] = in_cell_wdata;
		end
end
always @ ( posedge clk or posedge rst ) begin
		if( rst==1'b1 ) begin
				out_cell_wen 	<= 0;
				out_cell_wdata 	<= 0;
		end
		else begin
				out_cell_wen 	<= out_cell_wen_tmp 	;
				out_cell_wdata 	<= out_cell_wdata_tmp 	;
		end
end
assign dbg_sig = 32'h0;
function integer logb;
  input integer depth;
  integer depth_reg;
	begin
        depth_reg = depth;
        for (logb=0; depth_reg>0; logb=logb+1)begin
          depth_reg = depth_reg >> 1;
        end
        if( 2**logb >= depth*2 )begin
          logb = logb - 1;
        end
	end 
endfunction
endmodule

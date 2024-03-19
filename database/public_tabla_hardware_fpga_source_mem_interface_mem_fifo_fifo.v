`timescale 1ns/1ps
module fifo 
#(  // Parameters
    parameter   DATA_WIDTH          = 64,
    parameter   INIT                = "init.mif",
    parameter   ADDR_WIDTH          = 4,
    parameter   RAM_DEPTH           = (1 << ADDR_WIDTH),
    parameter   INITIALIZE_FIFO     = "no",
    parameter   TYPE                = "MLAB",
    parameter   EARLY_FULL                = 0
)(  // Ports
    input  wire                         clk,
    input  wire                         reset,
    input  wire                         push,
    input  wire                         pop,
    input  wire [ DATA_WIDTH -1 : 0 ]   data_in,
    output reg  [ DATA_WIDTH -1 : 0 ]   data_out,
    output reg                          empty,
    output reg                          full
    //output reg  [ ADDR_WIDTH    : 0 ]   fifo_count
);    
 
// Port Declarations
// ******************************************************************
// Internal variables
// ******************************************************************
    reg     [ADDR_WIDTH-1:0]        wr_pointer;             //Write Pointer
    reg     [ADDR_WIDTH-1:0]        rd_pointer;             //Read Pointer
    reg  [ ADDR_WIDTH    : 0 ]   fifo_count;
	// ******************************************************************
// INSTANTIATIONS
// ******************************************************************
    `ifdef FPGA
      //(* ram_style = TYPE *)
      reg     [DATA_WIDTH-1:0]        mem[0:RAM_DEPTH-1]/*synthesis ramstyle = "MLAB" */;     //Memory

      initial begin
        if (INITIALIZE_FIFO == "yes") begin
          $readmemh(INIT, mem, 0, RAM_DEPTH-1);
        end
      end
    `else
      reg     [DATA_WIDTH-1:0]        mem[0:RAM_DEPTH-1];
    `endif

    always @ (fifo_count)
    begin : FIFO_STATUS
    	empty   = (fifo_count == 0);
    	full    = (fifo_count >= RAM_DEPTH-3-EARLY_FULL);
    end
    
    always @ (posedge clk)
    begin : FIFO_COUNTER
    	if (reset)
    		fifo_count <= 0;
    	
    	else if (push && !pop )
    		fifo_count <= fifo_count + 1;
    		
    	else if (pop && !push && !empty)
    		fifo_count <= fifo_count - 1;
    end
    
    always @ (posedge clk)
    begin : WRITE_PTR
    	if (reset) begin
       		wr_pointer <= 0;
    	end 
    	else if (push ) begin
    		wr_pointer <= wr_pointer + 1;
    	end
    end
    
    always @ (posedge clk)
    begin : READ_PTR
    	if (reset) begin
    		rd_pointer <= 0;
    	end
    	else if (pop && !empty) begin
    		rd_pointer <= rd_pointer + 1;
    	end
    end
    
    always @ (posedge clk)
    begin : WRITE
        if (push ) begin
    		mem[wr_pointer] <= data_in;
        end
    end
    
    always @ (posedge clk)
    begin : READ
        if (reset) begin
	    	data_out <= 0;
        end
        if (pop && !empty) begin
    		data_out <= mem[rd_pointer];
        end
        else begin
    		data_out <= data_out;
        end
    end

endmodule

/*
FIFO_DUALCLOCK_MACRO  #(
    .ALMOST_EMPTY_OFFSET        ( 9'h080        ), // Sets the almost empty threshold
    .ALMOST_FULL_OFFSET         ( 9'h080        ), // Sets almost full threshold
    .DATA_WIDTH                 ( DATA_WIDTH    ), // Valid values are 1-72 (37-72 only valid when FIFO_SIZE="36Kb")
    .DEVICE                     ( "7SERIES"     ), // Target device: "VIRTEX5", "VIRTEX6", "7SERIES"
    .FIFO_SIZE                  ( "36Kb"        ), // Target BRAM: "18Kb" or "36Kb"
    .FIRST_WORD_FALL_THROUGH    ( "FALSE"       )  // Sets the FIfor FWFT to "TRUE" or "FALSE"
) FIFO_DUALCLOCK_MACRO_inst (
    .ALMOSTEMPTY                ( ALMOSTEMPTY   ), // 1-bit output almost empty
    .ALMOSTFULL                 ( ALMOSTFULL    ), // 1-bit output almost full
    .DO                         ( data_out      ), // Output data, width defined by DATA_WIDTH parameter
    .EMPTY                      ( empty         ), // 1-bit output empty
    .FULL                       ( full          ), // 1-bit output full
    .RDCOUNT                    ( RDCOUNT       ), // Output read count, width determined by FIfor depth
    .RDERR                      ( RDERR         ), // 1-bit output read error
    .WRCOUNT                    ( WRCOUNT       ), // Output write count, width determined by FIfor depth
    .WRERR                      ( WRERR         ), // 1-bit output write error
    .DI                         ( data_in       ), // Input data, width defined by DATA_WIDTH parameter
    .RDCLK                      ( clk           ), // 1-bit input read clock
    .RDEN                       ( pop           ), // 1-bit input read enable
    .RST                        ( reset         ), // 1-bit input reset
    .WRCLK                      ( clk           ), // 1-bit input write clock
    .WREN                       ( push          )  // 1-bit input write enable
);

endmodule
*/

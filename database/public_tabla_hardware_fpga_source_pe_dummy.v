`timescale 1ns/1ps
module pe_dummy
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer DATA_WIDTH        = 16,
    parameter [1:0]   PE_ID             = 0,
    parameter [3:0]   PE_INDEX          = 0,
    parameter integer CTRL_PE_WIDTH     = 1,
    parameter integer NAMESPACE_WIDTH   = 2,
    parameter integer PE_ID_WIDTH       = 2
// ******************************************************************
) (
// ******************************************************************
// IO
// ******************************************************************
    input  wire                     ACLK,
    input  wire                     ARESETN,
    input  wire						START,
    input  wire [DATA_WIDTH-1:0]    data_input,
    output wire [DATA_WIDTH-1:0]    data_output,
    output wire                     DATA_INOUT_WB,
    input  wire [CTRL_PE_WIDTH-1:0] CTRL_PE,
    input  wire                     DATA_IO_DIR,
    output wire                     EOI,
    output wire                     EOC
// ******************************************************************
);

// ******************************************************************
// Localparams
// ******************************************************************
    localparam COUNTER_WIDTH = 3;
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
    wire                        eoi;
    wire                        valid;
    wire [NAMESPACE_WIDTH-1:0]  namespace_id;
    wire [PE_ID_WIDTH-1:0]      pe_id;
    reg  [DATA_WIDTH-1:0]       read_count;
    reg  [DATA_WIDTH-1:0]       accumulate;
    reg                         valid_d;
// ******************************************************************

// ******************************************************************
// Assigns
// ******************************************************************
//    assign EOI = 1'b1;
    assign eoi = read_count == 4;
    //assign EOC = read_count == 8;
    assign {pe_id, valid, namespace_id} = CTRL_PE;
// ******************************************************************

// ******************************************************************
// Sequential
// ******************************************************************
 
    always @(posedge ACLK)
    begin
        valid_d <= valid && pe_id == PE_ID;
    end

    always @(posedge ACLK)
    begin
        if (ARESETN == 0)
            read_count <= 0;
        else if (valid && pe_id == PE_ID) begin
            read_count <= read_count + 1;
        end
    end

    always @(posedge ACLK)
    begin
        if (ARESETN == 0)
            accumulate <= 0;
        else if (valid)
            accumulate <= accumulate + data_input;
    end

    //-- always @(posedge ACLK)
    //-- begin
    //--     if (ARESETN == 0)
    //--         EOI <= 0;
    //--     else
    //--         EOI <= eoi;
    //-- end

    assign data_output = DATA_IO_DIR ? accumulate : {DATA_WIDTH{1'bz}};
    assign DATA_INOUT_WB = DATA_IO_DIR && EOI;


// ******************************************************************


pe 
	#(
	//--------------------------------------------------------------------------------------	
	.peId(PE_ID),
	.logNumPe(0),
	.logNumPu(0),
	.memDataLen(DATA_WIDTH)
	//--------------------------------------------------------------------------------------
	) u_pe (
	//--------------------------------------------------------------------------------------
    .clk(ACLK),
    .reset(~ARESETN),
    .start(START),
  
	.mem_wrt_valid(valid_d),
    .peId_mem_in(pe_id),
    .mem_data_type(namespace_id),
  
    .mem_data_input(data_input),
    .mem_data_output(data_output),
  
    .inst_eoc(EOC), 
    .inst_eol(EOI),
  
    .pe_neigh_data_in(0),
    .pe_neigh_data_in_v(0),
  
    .pu_neigh_data_in(0),
    .pu_neigh_data_in_v(0),
  
    .pe_bus_data_in(0),
    .pe_bus_data_in_v(0),
  
    .gb_bus_data_in(0),
    .gb_bus_data_in_v(0),
  
    .pe_neigh_data_out(),
    .pe_neigh_data_out_v(),
  
    .pu_neigh_data_out(),
    .pu_neigh_data_out_v(),
  
    .pe_bus_data_out(),
    .pe_bus_data_out_v(),
  
    .gb_bus_data_out(),
    .gb_bus_data_out_v()
	//----------------------------------------------------------------------------------------
);

`ifdef SIMULATION
    always @(posedge ACLK)
    begin
        if (valid && PE_ID==0)// && PE_INDEX==15)
            $display("PE %h, %h received data %h", PE_INDEX, PE_ID, data_input);
    end
`endif

endmodule

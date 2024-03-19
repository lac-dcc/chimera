`timescale 1ns / 1ps

module tb_lookup_engine #(    
    parameter C_S_AXIS_DATA_WIDTH = 256,
    parameter C_S_AXIS_TUSER_WIDTH = 128,
    parameter STAGE_ID = 0,
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256,
    parameter KEY_LEN = 48*2+32*2+16*2+5,
    parameter ACT_LEN = 625,
    parameter LOOKUP_ID = 2
)();

reg clk;
reg rst_n;

//output from key extractor
//output from key extractor
reg [KEY_LEN-1:0]           extract_key;
reg [KEY_LEN-1:0]           extract_mask;
reg                         key_valid;
reg [PHV_LEN-1:0]           phv_in;
    //output to the action engine
wire [ACT_LEN*25-1:0]       action;
wire                        action_valid;
wire [PHV_LEN-1:0]          phv_out;

//control path
reg  [C_S_AXIS_DATA_WIDTH-1:0]			c_s_axis_tdata;
reg  [C_S_AXIS_TUSER_WIDTH-1:0]		    c_s_axis_tuser;
reg  [C_S_AXIS_DATA_WIDTH/8-1:0]		c_s_axis_tkeep;
reg 									c_s_axis_tvalid;
reg 									c_s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		    c_m_axis_tdata;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		    c_m_axis_tuser;
wire [C_S_AXIS_DATA_WIDTH/8-1:0]		c_m_axis_tkeep;
wire 								    c_m_axis_tvalid;
wire 							    	c_m_axis_tlast;

//clk signal
localparam CYCLE = 10;

always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    rst_n = 1;
    #(10);
    rst_n = 0; //reset all the values
    #(10);
    rst_n = 1;
end


initial begin
    /*
        first one is a miss
    */
    #(2*CYCLE); //after the rst_n, start the test
    #(5)
    extract_key <= 197'b0;
    key_valid <= 1'b1;
    phv_in <= {48'hffffffffffff, 1076'b0};
    #CYCLE 
    extract_key <= 197'b0;
    key_valid <= 1'b0;
    phv_in <= 1124'b0;
    #(3*CYCLE)

    /* 
        TODO hit
    */
    extract_key <= 197'b0;
    key_valid <= 1'b1;
    phv_in <= {48'hffffffffffff, 1076'b0};
    #CYCLE 
    extract_key <= 197'b0;
    key_valid <= 1'b0;
    phv_in <= 1124'b0;
    #(3*CYCLE)

    /* 
        TODO miss
    */
    extract_key <= 197'b0;
    key_valid <= 1'b1;
    phv_in <= {48'hffffffffffff, 1076'b0};
    #CYCLE 
    extract_key <= 197'b0;
    key_valid <= 1'b0;
    phv_in <= 1124'b0;
    #(3*CYCLE);


end

//NOTE: 512b testcase 

// integer i;
// initial begin
//     #(2*CYCLE);
//     #(CYCLE/2);
//     for (i = 0; i<20; i=i+1) begin
//         c_s_axis_tdata <= {128'b0, 4'b0000, 4'b0, 8'b10, 368'b0};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;
//         #(CYCLE)

//         c_s_axis_tdata <= {494'b0,18'hffff};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;

//         #(CYCLE)
//         c_s_axis_tdata <= {494'b0,18'hffff};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;

//         #(CYCLE)
//         c_s_axis_tdata <= {494'b0,18'hffff};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b1;

//         #(CYCLE)
//         c_s_axis_tdata <= {494'b0,18'hffff};
//         c_s_axis_tvalid <= 1'b0;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;

//         #(3*CYCLE)
//         //for action table
//         c_s_axis_tdata <= {128'b0, 4'b0001, 4'b10, 5'b00000, 3'b010, 368'b0};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;
//         #(CYCLE)
//         c_s_axis_tdata <= {494'hfffffffffffffffffffffff,18'hffff};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;
//         #(CYCLE)
//         c_s_axis_tdata <= {494'heeeeeeeeeeeeeeeeeeeeeee,18'hffff};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;

//         #(CYCLE)
//         c_s_axis_tdata <= {494'heeeeeeeeeeeeeeeeeeeeeee,18'hffff};
//         c_s_axis_tvalid <= 1'b1;
//         c_s_axis_tkeep <= 64'hffffffffffffffff;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b1;

//         #(CYCLE)
//         c_s_axis_tdata <= 512'b0;
//         c_s_axis_tvalid <= 1'b0;
//         c_s_axis_tkeep <= 64'h0;
//         c_s_axis_tuser <= 128'b0;
//         c_s_axis_tlast <= 1'b0;
//         #(8*CYCLE);
//     end
// end



//NOTE: 256b testcase
integer i;
initial begin
    #(2*CYCLE);
    #(CYCLE/2);
    for (i = 0; i<20; i=i+1) begin
        //c_s_axis_tdata <= {128'b0, 4'b0000, 4'b0, 8'b1, 368'b0};
        c_s_axis_tdata <= {238'b0,18'hffff};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)
        c_s_axis_tdata <= {238'b0,18'hffff};
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)

        c_s_axis_tdata <= {128'b0, 4'b0, 4'b0, 8'b10, 112'b0};
        //module id
        c_s_axis_tdata[112+:8] <= 8'b10;
        //control flag
        c_s_axis_tdata[64+:16] <= 16'hf1f2;
        //table type
        c_s_axis_tdata[124+:4] <= 4'b1;
        //index type
        c_s_axis_tdata[128+:8] <= 8'h0;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)

        c_s_axis_tdata <= 256'hffffffffffffffffffffffffffffffffffffffffffffff;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)
        c_s_axis_tdata <= {238'b0,18'hffff};
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)

        c_s_axis_tdata <= 256'hffffffffffffffffffffffffffffffffffffffffffffff;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)

        c_s_axis_tdata <= 256'heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b1;
//*************************************************************************************************//
        #(CYCLE)
        c_s_axis_tdata <= {238'b0,18'hffff};
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        //action table
        #(3*CYCLE)
        c_s_axis_tdata <= {238'hfffffffffffffffffffff,18'hffff};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= {128'b0, 4'b1, 4'b10, 8'b10, 112'b0};
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= 256'hfffffffffffffffffffffffffffffffffffffffffffffff;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= 256'heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= 256'hdddddddddddddddddddddddddddddddddddddddddddddddd;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= 256'hfffffffffffffffffffffffffffffffffffffffffffffff;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        #(CYCLE)
        c_s_axis_tdata <= 256'hfffffffffffffffffffffffffffffffffffffffffffffff;
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= 256'heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee;
        c_s_axis_tvalid <= 1'b1;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b1;

        #(CYCLE)
        c_s_axis_tdata <= 256'hdddddddddddddddddddddddddddddddddddddddddddddddd;
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE)
        c_s_axis_tdata <= {238'b0,18'hffff};
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;
        
        
        #(10*CYCLE);
    end

end

lookup_engine #(
    .C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
    .C_S_AXIS_TUSER_WIDTH(C_S_AXIS_TUSER_WIDTH),
    .STAGE_ID(STAGE_ID),
    .PHV_LEN(),
    .KEY_LEN(),
    .ACT_LEN(),
    .LOOKUP_ID(LOOKUP_ID)
) lookup_engine(
    .clk(clk),
    .rst_n(rst_n),

    //output from key extractor
    .extract_key(extract_key),
    .extract_mask(extract_mask),
    .key_valid(key_valid),
    .phv_in(phv_in),

    //output to the action engine
    .action(action),
    .action_valid(action_valid),
    .phv_out(phv_out),

    //control path
    .c_s_axis_tdata(c_s_axis_tdata),
	.c_s_axis_tuser(c_s_axis_tuser),
	.c_s_axis_tkeep(c_s_axis_tkeep),
	.c_s_axis_tvalid(c_s_axis_tvalid),
	.c_s_axis_tlast(c_s_axis_tlast),

    .c_m_axis_tdata(c_m_axis_tdata),
	.c_m_axis_tuser(c_m_axis_tuser),
	.c_m_axis_tkeep(c_m_axis_tkeep),
	.c_m_axis_tvalid(c_m_axis_tvalid),
	.c_m_axis_tlast(c_m_axis_tlast)
);

endmodule
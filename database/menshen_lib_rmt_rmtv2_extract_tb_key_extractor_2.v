`timescale 1ns / 1ps

module tb_key_extract #(
    parameter C_S_AXIS_DATA_WIDTH = 256,
    parameter C_S_AXIS_TUSER_WIDTH = 128,
    parameter STAGE_ID = 0,
    parameter PHV_LEN = 48*8+32*8+16*8+5*20+256,
    parameter KEY_LEN = 48*2+32*2+16*2+5,
    // format of KEY_OFF entry: |--3(6B)--|--3(6B)--|--3(4B)--|--3(4B)--|--3(2B)--|--3(2B)--|
    parameter KEY_OFF = (3+3)*3,
    parameter AXIL_WIDTH = 32,
    parameter KEY_OFF_ADDR_WIDTH = 4,
    parameter KEY_EX_ID = 1
)();

reg                      clk;
reg                      rst_n;
reg [PHV_LEN-1:0]        phv_in;
reg                      phv_valid_in;
    
//signals used to config key extract offset
wire [PHV_LEN-1:0]       phv_out;
wire                     phv_valid_out;
wire [KEY_LEN-1:0]       key_out;
wire                     key_valid_out;
wire [KEY_LEN-1:0]       key_mask_out;

    //control path
reg [C_S_AXIS_DATA_WIDTH-1:0]		c_s_axis_tdata;
reg [C_S_AXIS_TUSER_WIDTH-1:0]		c_s_axis_tuser;
reg [C_S_AXIS_DATA_WIDTH/8-1:0]		c_s_axis_tkeep;
reg									c_s_axis_tvalid;
reg									c_s_axis_tlast;

wire [C_S_AXIS_DATA_WIDTH-1:0]		c_m_axis_tdata;
wire [C_S_AXIS_TUSER_WIDTH-1:0]		c_m_axis_tuser;
wire [C_S_AXIS_DATA_WIDTH/8-1:0]	c_m_axis_tkeep;
wire								c_m_axis_tvalid;
wire								c_m_axis_tlast;


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
    #(2*CYCLE); //after the rst_n, start the test
    #(5) //posedge of clk    
    /*
        set up the key extract table
    */
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    #CYCLE
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    #(2*CYCLE)

    /*
        switch the value in container 7 and 6
    */
    phv_in <= {48'hffffffffffff, 48'heeeeeeeeeeee, 288'h0, 32'hcccccccc, 32'hbbbbbbbb, 192'b0, 16'hffff, 16'heeee, 96'h0, 356'b0};
    phv_valid_in <= 1'b1;
    // key_offset_in <= {3'd6, 3'd7, 3'd6, 3'd7, 3'd6, 3'd7};
    // key_offset_valid_in <= 1'b0;
    #CYCLE
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    #(2*CYCLE);

    /*
        check if comparator works right
    */
    
    phv_in <= {48'hffffffffffff, 48'heeeeeeeeeeee, 288'h0, 32'hcccccccc, 32'hbbbbbbbb, 192'b0, 16'hffff, 
        16'heeee, 96'h0, 2'b0, 4'b0, 2'b10, 3'd7,4'b0, 2'b10, 3'd6,80'b0,256'b0};
    phv_valid_in <= 1'b1;
   
    #CYCLE
    phv_in <= 1124'b0;
    phv_valid_in <= 1'b0;
    #(2*CYCLE);

end

//NOTE: 512 test cases
// initial begin
//     #(2*CYCLE); //after the rst_n, start the test
//     #(5) //posedge of clk    
//     /*
//         set up the key extract table
//     */
//     c_s_axis_tdata <= {128'b0, 4'b0000, 4'b0, 8'b1, 368'b0};
//     c_s_axis_tvalid <= 1'b1;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b0;
//     #(CYCLE)

//     c_s_axis_tdata <= {494'b0,18'hffff};
//     c_s_axis_tvalid <= 1'b1;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b0;

//     #(CYCLE)
//     c_s_axis_tdata <= {494'b0,18'hffff};
//     c_s_axis_tvalid <= 1'b1;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b0;

//     #(CYCLE)
//     c_s_axis_tdata <= {494'b0,18'hffff};
//     c_s_axis_tvalid <= 1'b1;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b1;

//     #(CYCLE)
//     c_s_axis_tdata <= {494'b0,18'hffff};
//     c_s_axis_tvalid <= 1'b0;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b0;

//     #(3*CYCLE)
//     c_s_axis_tdata <= {128'b0, 4'b0001, 4'b0, 5'b00000, 3'b001, 368'b0};
//     c_s_axis_tvalid <= 1'b1;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b0;
//     #(CYCLE)
//     c_s_axis_tdata <= {494'b0,18'hffff};
//     c_s_axis_tvalid <= 1'b1;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b1;

//     #(CYCLE)
//     c_s_axis_tdata <= 512'b0;
//     c_s_axis_tvalid <= 1'b0;
//     c_s_axis_tkeep <= 64'hffffffffffffffff;
//     c_s_axis_tuser <= 128'b0;
//     c_s_axis_tlast <= 1'b0;
    
//     #(20*CYCLE);

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
        c_s_axis_tdata <= {238'b0,18'hffff};
        c_s_axis_tvalid <= 1'b0;
        c_s_axis_tkeep <= 32'hffffffff;
        c_s_axis_tuser <= 128'b0;
        c_s_axis_tlast <= 1'b0;

        #(CYCLE);

        c_s_axis_tdata[79:64] <= 16'hf1f2;
        
        //module id
        c_s_axis_tdata[112+:8] <= 8'b1;
        //control flag
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


key_extract #(
    .C_S_AXIS_DATA_WIDTH(C_S_AXIS_DATA_WIDTH),
    .C_S_AXIS_TUSER_WIDTH(C_S_AXIS_TUSER_WIDTH),
    .STAGE_ID(STAGE_ID),
    .PHV_LEN(),
    .KEY_LEN(),
    // format of KEY_OFF entry: |--3(6B)--|--3(6B)--|--3(4B)--|--3(4B)--|--3(2B)--|--3(2B)--|
    .KEY_OFF(),
    .AXIL_WIDTH(),
    .KEY_OFF_ADDR_WIDTH(),
    .KEY_EX_ID()
)key_extract(
    .clk(clk),
    .rst_n(rst_n),
    .phv_in(phv_in),
    .phv_valid_in(phv_valid_in),

    .phv_out(phv_out),
    .phv_valid_out(phv_valid_out),
    .key_out(key_out),
    .key_valid_out(key_valid_out),
    .key_mask_out(key_mask_out),

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
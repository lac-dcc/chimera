`timescale 1ns/1ps
module weight_read_tb;
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer AXI_DATA_WIDTH    = 8;
    parameter integer RD_BUF_ADDR_WIDTH = 8;
    parameter integer NUM_AXI           = 1;
    parameter integer DATA_WIDTH        = 4;
    parameter integer NUM_DATA          = AXI_DATA_WIDTH*NUM_AXI/DATA_WIDTH;
    parameter integer NUM_PE            = 64;
    parameter integer VERBOSITY         = 3;
    parameter integer NAMESPACE_WIDTH   = 2;
    parameter integer TX_SIZE_WIDTH     = 5;
// ******************************************************************

// ******************************************************************
// Localparams
// ******************************************************************
    localparam integer WSTRB_WIDTH          = {(RD_BUF_DATA_WIDTH/8){1'b1}} * NUM_AXI;

    localparam integer RD_BUF_DATA_WIDTH    = DATA_WIDTH * NUM_DATA / NUM_AXI;
    localparam integer RD_IF_DATA_WIDTH     = DATA_WIDTH * NUM_DATA;
    localparam integer CTRL_PE_WIDTH        = (`C_LOG_2(NUM_PE/NUM_DATA) + 1) 
                                              * NUM_DATA + NAMESPACE_WIDTH;
    localparam integer SHIFTER_CTRL_WIDTH   = `C_LOG_2(NUM_DATA);
    localparam integer NUM_OPS              = 4;
    localparam integer OP_CODE_WIDTH        = `C_LOG_2 (NUM_OPS);
    localparam integer CTRL_BUF_DATA_WIDTH  = CTRL_PE_WIDTH + 
                                              SHIFTER_CTRL_WIDTH +
                                              OP_CODE_WIDTH;

    localparam integer OP_READ              = 0;
    localparam integer OP_SHIFT             = 1;
    localparam integer OP_WFI               = 2;
    localparam integer OP_WRITE             = 3;
// ******************************************************************

// ******************************************************************
// Wires and Regs
// ******************************************************************
    reg                             ACLK;
    reg                             ARESETN;
    reg  [NUM_AXI-1:0]              axim_rvalid;
    wire [NUM_AXI-1:0]              axim_rready;
    reg  [RD_IF_DATA_WIDTH   -1:0]  axim_rdata;
    wire [RD_IF_DATA_WIDTH   -1:0]  rdata;
    wire [RD_IF_DATA_WIDTH   -1:0]  wdata;
    reg                             DATA_INOUT_WB;
    wire [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_fifo_data_out;
    wire [CTRL_PE_WIDTH-1:0]        ctrl_pe;
    wire [OP_CODE_WIDTH-1:0]        ctrl_op_code;
    wire [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;

    wire  [RD_IF_DATA_WIDTH   -1:0]  shifter_input;
    assign shifter_input = weight_read_tb.u_mem_if.rd_buf_data_out;

    reg                             fail_flag;

    integer                         i;
    integer                         n;
    integer                         rd_addr;

    wire [32*NUM_AXI-1:0]           S_AXI_ARADDR;
    wire [2*NUM_AXI-1:0]            S_AXI_ARBURST;
    wire [4*NUM_AXI-1:0]            S_AXI_ARCACHE;
    wire [6*NUM_AXI-1:0]            S_AXI_ARID;
    wire [4*NUM_AXI-1:0]            S_AXI_ARLEN;
    wire [2*NUM_AXI-1:0]            S_AXI_ARLOCK;
    wire [3*NUM_AXI-1:0]            S_AXI_ARPROT;
    wire [4*NUM_AXI-1:0]            S_AXI_ARQOS;
    wire [1*NUM_AXI-1:0]            S_AXI_ARUSER;
    wire [NUM_AXI-1:0]              S_AXI_ARREADY;
    wire [3*NUM_AXI-1:0]            S_AXI_ARSIZE;
    wire [NUM_AXI-1:0]              S_AXI_ARVALID;
    wire [32*NUM_AXI-1:0]           S_AXI_AWADDR;
    wire [2*NUM_AXI-1:0]            S_AXI_AWBURST;
    wire [4*NUM_AXI-1:0]            S_AXI_AWCACHE;
    wire [6*NUM_AXI-1:0]            S_AXI_AWID;
    wire [4*NUM_AXI-1:0]            S_AXI_AWLEN;
    wire [2*NUM_AXI-1:0]            S_AXI_AWLOCK;
    wire [3*NUM_AXI-1:0]            S_AXI_AWPROT;
    wire [4*NUM_AXI-1:0]            S_AXI_AWQOS;
    wire [1*NUM_AXI-1:0]            S_AXI_AWUSER;
    wire [NUM_AXI-1:0]              S_AXI_AWREADY;
    wire [3*NUM_AXI-1:0]            S_AXI_AWSIZE;
    wire [NUM_AXI-1:0]              S_AXI_AWVALID;
    wire [6*NUM_AXI-1:0]            S_AXI_BID;
    wire [1*NUM_AXI-1:0]            S_AXI_BUSER;
    wire [NUM_AXI-1:0]              S_AXI_BREADY;
    wire [2*NUM_AXI-1:0]            S_AXI_BRESP;
    wire [NUM_AXI-1:0]              S_AXI_BVALID;
    wire [RD_IF_DATA_WIDTH-1:0]     S_AXI_RDATA;
    wire [6*NUM_AXI-1:0]            S_AXI_RID;
    wire [1*NUM_AXI-1:0]            S_AXI_RUSER;
    wire [NUM_AXI-1:0]              S_AXI_RLAST;
    wire [NUM_AXI-1:0]              S_AXI_RREADY;
    wire [2*NUM_AXI-1:0]            S_AXI_RRESP;
    wire [NUM_AXI-1:0]              S_AXI_RVALID;
    wire [RD_IF_DATA_WIDTH-1:0]     S_AXI_WDATA;
    wire [6*NUM_AXI-1:0]            S_AXI_WID;
    wire [1*NUM_AXI-1:0]            S_AXI_WUSER;
    wire [NUM_AXI-1:0]              S_AXI_WLAST;
    wire [NUM_AXI-1:0]              S_AXI_WREADY;
    wire [WSTRB_WIDTH-1:0]          S_AXI_WSTRB;
    wire [NUM_AXI-1:0]              S_AXI_WVALID;

    // WRITE from BRAM to DDR
    wire [NUM_AXI-1:0]              outBuf_empty;
    wire [NUM_AXI-1:0]              outBuf_pop;
    wire [RD_IF_DATA_WIDTH-1:0]     data_from_outBuf;

    // READ from DDR to BRAM
    wire [RD_IF_DATA_WIDTH-1:0]     data_to_inBuf;
    wire [NUM_AXI-1:0]              inBuf_push;
    wire [NUM_AXI-1:0]              inBuf_full;

    // TXN REQ
    wire [NUM_AXI-1:0]              rx_req;
    wire [NUM_AXI*TX_SIZE_WIDTH-1:0]rx_req_size;
    wire [NUM_AXI-1:0]              rx_done;
// ******************************************************************

// ******************************************************************
// AXI Master driver
// ******************************************************************
genvar gen;
for (gen=0; gen<NUM_AXI; gen=gen+1)
begin : AXI_DRIVERS
    localparam integer wstrb_width = RD_BUF_DATA_WIDTH/8;
    axi_master_tb_driver
    #(
        .C_M_AXI_DATA_WIDTH         ( RD_BUF_DATA_WIDTH         ),
        .DATA_WIDTH                 ( DATA_WIDTH                ),
        .TX_SIZE_WIDTH              ( TX_SIZE_WIDTH             )
    ) u_axim_driver (
        .ACLK                       ( ACLK                      ),
        .ARESETN                    ( ARESETN                   ),
        .M_AXI_AWID                 ( S_AXI_AWID[6*gen+:6]      ),
        .M_AXI_AWADDR               ( S_AXI_AWADDR[32*gen+:32]  ),
        .M_AXI_AWLEN                ( S_AXI_AWLEN[4*gen+:4]     ),
        .M_AXI_AWSIZE               ( S_AXI_AWSIZE[3*gen+:3]    ),
        .M_AXI_AWBURST              ( S_AXI_AWBURST[2*gen+:2]   ),
        .M_AXI_AWLOCK               ( S_AXI_AWLOCK[2*gen+:2]    ),
        .M_AXI_AWCACHE              ( S_AXI_AWCACHE[4*gen+:4]   ),
        .M_AXI_AWPROT               ( S_AXI_AWPROT[3*gen+:3]    ),
        .M_AXI_AWQOS                ( S_AXI_AWQOS[4*gen+:4]     ),
        .M_AXI_AWUSER               ( S_AXI_AWUSER[gen+:1]      ),
        .M_AXI_AWVALID              ( S_AXI_AWVALID[gen+:1]     ),
        .M_AXI_AWREADY              ( S_AXI_AWREADY[gen+:1]     ),
        .M_AXI_WID                  ( S_AXI_WID[6*gen+:6]       ),
        .M_AXI_WDATA                ( S_AXI_WDATA[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]               ),
        .M_AXI_WSTRB                ( S_AXI_WSTRB[wstrb_width*gen+:wstrb_width]               ),
        .M_AXI_WLAST                ( S_AXI_WLAST[gen+:1]       ),
        .M_AXI_WUSER                ( S_AXI_WUSER[gen+:1]       ),
        .M_AXI_WVALID               ( S_AXI_WVALID[gen+:1]      ),
        .M_AXI_WREADY               ( S_AXI_WREADY[gen+:1]      ),
        .M_AXI_BID                  ( S_AXI_BID[6*gen+:6]       ),
        .M_AXI_BRESP                ( S_AXI_BRESP[2*gen+:2]     ),
        .M_AXI_BUSER                ( S_AXI_BUSER[gen+:1]       ),
        .M_AXI_BVALID               ( S_AXI_BVALID[gen+:1]      ),
        .M_AXI_BREADY               ( S_AXI_BREADY[gen+:1]      ),
        .M_AXI_ARID                 ( S_AXI_ARID[6*gen+:6]      ),
        .M_AXI_ARADDR               ( S_AXI_ARADDR[32*gen+:32]  ),
        .M_AXI_ARLEN                ( S_AXI_ARLEN[4*gen+:4]     ),
        .M_AXI_ARSIZE               ( S_AXI_ARSIZE[3*gen+:3]    ),
        .M_AXI_ARBURST              ( S_AXI_ARBURST[2*gen+:2]   ),
        .M_AXI_ARLOCK               ( S_AXI_ARLOCK[2*gen+:2]    ),
        .M_AXI_ARCACHE              ( S_AXI_ARCACHE[4*gen+:4]   ),
        .M_AXI_ARPROT               ( S_AXI_ARPROT[3*gen+:3]    ),
        .M_AXI_ARQOS                ( S_AXI_ARQOS[4*gen+:4]     ),
        .M_AXI_ARUSER               ( S_AXI_ARUSER[gen+:1]      ),
        .M_AXI_ARVALID              ( S_AXI_ARVALID[gen+:1]     ),
        .M_AXI_ARREADY              ( S_AXI_ARREADY[gen+:1]     ),
        .M_AXI_RID                  ( S_AXI_RID[6*gen+:6]       ),
        .M_AXI_RDATA                ( S_AXI_RDATA[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]               ),
        .M_AXI_RRESP                ( S_AXI_RRESP[2*gen+:2]     ),
        .M_AXI_RLAST                ( S_AXI_RLAST[gen+:1]       ),
        .M_AXI_RUSER                ( S_AXI_RUSER[gen+:1]       ),
        .M_AXI_RVALID               ( S_AXI_RVALID[gen+:1]      ),
        .M_AXI_RREADY               ( S_AXI_RREADY[gen+:1]      ),
        .outBuf_empty               ( outBuf_empty[gen+:1]      ),
        .outBuf_pop                 ( outBuf_pop[gen+:1]        ),
        .data_from_outBuf           ( data_from_outBuf[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]          ),
        .data_to_inBuf              ( data_to_inBuf[RD_BUF_DATA_WIDTH*gen+:RD_BUF_DATA_WIDTH]             ),
        .inBuf_push                 ( inBuf_push[gen+:1]        ),
        .inBuf_full                 ( inBuf_full[gen+:1]        ),
        .rx_req                     ( rx_req[gen+:1]            ),
        .rx_req_size                ( rx_req_size[TX_SIZE_WIDTH*gen+:TX_SIZE_WIDTH]               ),
        .rx_done                    ( rx_done[gen+:1]           )
    );
end
// ******************************************************************

// ******************************************************************
// DUT - MEM Interface
// ******************************************************************
mem_interface #(
    .DATA_WIDTH             ( DATA_WIDTH            ),
    .RD_BUF_ADDR_WIDTH      ( RD_BUF_ADDR_WIDTH     ),
    .NUM_DATA               ( NUM_DATA              ),
    .NUM_PE                 ( NUM_PE                ),
    .NUM_AXI                ( NUM_AXI               ),
    .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH         )
) u_mem_if (
    .ACLK                   ( ACLK                  ), //input
    .ARESETN                ( ARESETN               ), //input
    .rdata                  ( rdata                 ), //input
    .wdata                  ( wdata                 ), //output
    .DATA_INOUT_WB          ( DATA_INOUT_WB         ), //input
    .EOI                    ( 1'b1                  ), //input
    .EOC                    ( 1'b1                  ), //input

    .S_AXI_ARADDR           ( S_AXI_ARADDR          ), //output
    .S_AXI_ARBURST          ( S_AXI_ARBURST         ), //output
    .S_AXI_ARCACHE          ( S_AXI_ARCACHE         ), //output
    .S_AXI_ARID             ( S_AXI_ARID            ), //output
    .S_AXI_ARLEN            ( S_AXI_ARLEN           ), //output
    .S_AXI_ARLOCK           ( S_AXI_ARLOCK          ), //output
    .S_AXI_ARPROT           ( S_AXI_ARPROT          ), //output
    .S_AXI_ARQOS            ( S_AXI_ARQOS           ), //output
    .S_AXI_ARUSER           ( S_AXI_ARUSER          ), //output
    .S_AXI_ARREADY          ( S_AXI_ARREADY         ), //input
    .S_AXI_ARSIZE           ( S_AXI_ARSIZE          ), //output
    .S_AXI_ARVALID          ( S_AXI_ARVALID         ), //output
    .S_AXI_AWADDR           ( S_AXI_AWADDR          ), //output
    .S_AXI_AWBURST          ( S_AXI_AWBURST         ), //output
    .S_AXI_AWCACHE          ( S_AXI_AWCACHE         ), //output
    .S_AXI_AWID             ( S_AXI_AWID            ), //output
    .S_AXI_AWLEN            ( S_AXI_AWLEN           ), //output
    .S_AXI_AWLOCK           ( S_AXI_AWLOCK          ), //output
    .S_AXI_AWPROT           ( S_AXI_AWPROT          ), //output
    .S_AXI_AWQOS            ( S_AXI_AWQOS           ), //output
    .S_AXI_AWUSER           ( S_AXI_AWUSER          ), //output
    .S_AXI_AWREADY          ( S_AXI_AWREADY         ), //input
    .S_AXI_AWSIZE           ( S_AXI_AWSIZE          ), //output
    .S_AXI_AWVALID          ( S_AXI_AWVALID         ), //output
    .S_AXI_BID              ( S_AXI_BID             ), //input
    .S_AXI_BUSER            ( S_AXI_BUSER           ), //input
    .S_AXI_BREADY           ( S_AXI_BREADY          ), //output
    .S_AXI_BRESP            ( S_AXI_BRESP           ), //input
    .S_AXI_BVALID           ( S_AXI_BVALID          ), //input
    .S_AXI_RDATA            ( S_AXI_RDATA           ), //input
    .S_AXI_RID              ( S_AXI_RID             ), //input
    .S_AXI_RUSER            ( S_AXI_RUSER           ), //input
    .S_AXI_RLAST            ( S_AXI_RLAST           ), //input
    .S_AXI_RREADY           ( S_AXI_RREADY          ), //output
    .S_AXI_RRESP            ( S_AXI_RRESP           ), //input
    .S_AXI_RVALID           ( S_AXI_RVALID          ), //input
    .S_AXI_WDATA            ( S_AXI_WDATA           ), //output
    .S_AXI_WID              ( S_AXI_WID             ), //output
    .S_AXI_WUSER            ( S_AXI_WUSER           ), //output
    .S_AXI_WLAST            ( S_AXI_WLAST           ), //output
    .S_AXI_WREADY           ( S_AXI_WREADY          ), //input
    .S_AXI_WSTRB            ( S_AXI_WSTRB           ), //output
    .S_AXI_WVALID           ( S_AXI_WVALID          ), //output

    .rx_req                 ( rx_req[0]             ), //input
    .rx_req_size            ( rx_req_size[TX_SIZE_WIDTH-1:0]           ), //input
    .rx_done                ( rx_done[0]            )  //output
);
// ******************************************************************


//--------------------------------------------------------------------------------------
task test_main;
    begin
        repeat (10000) begin
            //push_random_inputs;
        end
        repeat(10) begin
            AXI_DRIVERS[0].u_axim_driver.request_random_tx;
        end
        AXI_DRIVERS[0].u_axim_driver.check_fail;
        AXI_DRIVERS[0].u_axim_driver.test_pass;
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task push_random_inputs;
    begin
        // Generate Random Inputs
        rand_inputs;
        axim_rvalid = $random;
        @(negedge ACLK);
        axim_rvalid = 0;
    end
endtask
//--------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------
wire ctrl_buf_rd_en = weight_read_tb.u_mem_if.u_if_controller.ctrl_buf_read_en;
assign ctrl_fifo_data_out = weight_read_tb.u_mem_if.u_if_controller.ctrl_buf_data_out;

wire [NUM_AXI*RD_BUF_ADDR_WIDTH-1:0] rd_address_received;

generate
for(gen=0; gen<NUM_AXI; gen=gen+1)
begin
    assign rd_address_received[gen*RD_BUF_ADDR_WIDTH+:RD_BUF_ADDR_WIDTH] = weight_read_tb.u_mem_if.AXI_RD_BUF[gen].read_buffer.rd_pointer;
end
endgenerate

task test_random_inputs;

    reg  [RD_IF_DATA_WIDTH-1:0]     expected_data;
    reg  [RD_IF_DATA_WIDTH-1:0]     received_data;

    reg  [OP_CODE_WIDTH-1:0]        op_code;
    reg  [SHIFTER_CTRL_WIDTH-1:0]   shift;
    reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe;

    reg  [RD_BUF_DATA_WIDTH  -1:0]  tmp;

    reg  [RD_IF_DATA_WIDTH   -1:0]  shifter_input_expected;

    integer i;

    reg  [RD_BUF_ADDR_WIDTH-1:0]    rd_address_expected;

    begin
        wait (ctrl_buf_rd_en);
        // Get Expected Data
        {ctrl_pe, op_code, shift} = ctrl_fifo_data_out;
        expected_data = expected_data_function(shifter_input, ctrl_fifo_data_out);

        rd_address_expected = rd_address_received[0*RD_BUF_ADDR_WIDTH+:RD_BUF_ADDR_WIDTH];

        if (op_code == OP_SHIFT)
        begin
            rd_addr = rd_addr + 1;

            for (i=0; i<NUM_AXI; i=i+1)
            begin
                if (rd_address_received[i*RD_BUF_ADDR_WIDTH+:RD_BUF_ADDR_WIDTH] !== rd_address_expected && op_code == OP_SHIFT)
                begin
                    $display("actual addr : %h, expected addr : %h", rd_address_received[i*RD_BUF_ADDR_WIDTH+:RD_BUF_ADDR_WIDTH], rd_address_expected);
                    fail_flag = 1'b1;
                end
            end
    
            @(negedge ACLK);
            received_data = wdata;
    
            if (received_data !== expected_data && op_code == OP_SHIFT)
            begin
                $display ("\tError: Expected data:%h Recieved data:%h", expected_data, received_data);
                //print_inputs(2);
                print_instruction(2);
                fail_flag = 1'b1;
            end
            else if (op_code == OP_SHIFT)begin
                if (VERBOSITY > 1) $display ("\tInfo: Expected data:%h Recieved data:%h", expected_data, received_data);
            end
                else begin
                if (VERBOSITY > 1) $display ("\tInfo: Recieved data:%h", received_data);
            end
        end

    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task rand_instruction;
  input integer num_ins;
    reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe;
    reg  [OP_CODE_WIDTH-1:0]        ctrl_op_code;
    reg  [SHIFTER_CTRL_WIDTH-1:0]   ctrl_shifter;
    reg  [CTRL_BUF_DATA_WIDTH-1:0]  ctrl_buf_data_in;
    begin
        for (n=0; n<num_ins; n=n+1)
        begin
            if (n > 0)
            begin
                ctrl_pe       = {$random, $random};
                ctrl_op_code  = {$random, $random};
                ctrl_shifter  = {$random, $random};
            end
            else begin
                ctrl_pe       = {$random, $random};
                ctrl_op_code  = 0;
                ctrl_shifter  = {$random, $random};
            end
            ctrl_buf_data_in = {ctrl_pe, ctrl_op_code, ctrl_shifter};
            weight_read_tb.u_mem_if.u_if_controller.u_ctrl_buf.mem[n] = ctrl_buf_data_in;
        end
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task rand_inputs;
    begin
        for (i=0; i<NUM_DATA; i=i+1)
        begin
            axim_rdata[i*DATA_WIDTH+:DATA_WIDTH] = {$random, $random};
        end
        //print_inputs(1);
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task print_instruction;
    input [2:0] verbosity;

    reg  [OP_CODE_WIDTH-1:0]        op_code;
    reg  [SHIFTER_CTRL_WIDTH-1:0]   shift;
    reg  [CTRL_PE_WIDTH-1:0]        ctrl_pe;

    begin
        {ctrl_pe, op_code, shift} = ctrl_fifo_data_out;
        if (verbosity > 1) begin
            $display ("Instruction = %h", ctrl_fifo_data_out);
            $display ("Op Code = %h", op_code);
            $display ("Shift = %h", shift);
            $display ("PE Control = %h", ctrl_pe);
        end
    end
endtask
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
function [RD_IF_DATA_WIDTH-1 :0] expected_data_function;

    input [RD_IF_DATA_WIDTH-1 :0]       axim_rdata;
    input [CTRL_BUF_DATA_WIDTH-1:0]     ctrl_fifo_data_out;

    reg   [OP_CODE_WIDTH-1:0]           op_code;
    reg   [SHIFTER_CTRL_WIDTH-1:0]      shift;
    reg   [CTRL_PE_WIDTH-1:0]           ctrl_pe;
    reg   [RD_IF_DATA_WIDTH*2-1:0]      tmp;

    begin
        {ctrl_pe, op_code, shift} = ctrl_fifo_data_out;
        if (op_code == OP_SHIFT)
        begin
            tmp = {axim_rdata, axim_rdata} >> (shift * DATA_WIDTH);
            expected_data_function = tmp;
        end
        else
        begin
            expected_data_function = 1;
        end
    end
endfunction
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
task check_fail;
    if (fail_flag && ARESETN) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        @(posedge ACLK);
        @(posedge ACLK);
        $finish;
    end
endtask
//--------------------------------------------------------------------------------------

// ******************************************************************
// TestBench
// ******************************************************************
initial
begin
    $dumpfile("hw-imp/bin/waveform/weight_read_tb.vcd");
    $dumpvars(0,weight_read_tb);
end

initial 
begin
    $display("***************************************");
    $display ("Testing Read IF");
    $display("***************************************");
    n = 0;
    rd_addr = 0;
    DATA_INOUT_WB = 1;
    ACLK = 0;
    ARESETN = 1;
    @(negedge ACLK);
    ARESETN = 0;
    @(negedge ACLK);
    ARESETN = 1;

    test_main;

    $display("%c[1;32m",27);
    $display ("Test Passed");
    $display("%c[0m",27);
    $finish;
end

initial
begin
    rand_instruction(1000);
    $display ("Testing random instructions");
    repeat (1000)
    begin
        test_random_inputs;
    end
end

always #1 ACLK = ~ACLK;

always @ (posedge ACLK)
begin
    check_fail;
    DATA_INOUT_WB = $random;
end

// ******************************************************************

endmodule

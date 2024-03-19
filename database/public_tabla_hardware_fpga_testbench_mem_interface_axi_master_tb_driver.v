`timescale 1ns/1ps
module axi_master_tb_driver
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
  parameter integer AXI_ID                  = 0,
  parameter integer MAX_AR_DELAY            = 8,
  parameter         C_M_AXI_PROTOCOL        = "AXI3",
  parameter integer C_M_AXI_THREAD_ID_WIDTH = 6,
  parameter integer C_M_AXI_DATA_WIDTH      = 64,
  parameter integer C_M_AXI_SUPPORTS_WRITE  = 1,
  parameter integer C_M_AXI_SUPPORTS_READ   = 1,
  parameter integer C_M_AXI_READ_TARGET     = 32'hFFFF0000,
  parameter integer C_M_AXI_WRITE_TARGET    = 32'hFFFF8000,
  parameter integer C_OFFSET_WIDTH          = 11,
  parameter integer C_M_AXI_RD_BURST_LEN    = 16,
  parameter integer C_M_AXI_WR_BURST_LEN    = 4,
  parameter integer TX_SIZE_WIDTH           = 10,
  parameter integer VERBOSITY               = 3,
  parameter integer NUM_AXI                 = 1,
  parameter integer DATA_WIDTH              = 8,

  parameter integer IF_DATA_WIDTH = C_M_AXI_DATA_WIDTH * NUM_AXI,
  parameter integer WSTRB_WIDTH   = C_M_AXI_DATA_WIDTH/8 * NUM_AXI,
  parameter integer TX_FIFO_DATA_WIDTH      = 4+32
// ******************************************************************
) (
// ******************************************************************
// IO
// ******************************************************************

    // System Signals
    input  wire                                 ACLK,
    input  wire                                 ARESETN,
    
    // Master Interface Write Address
    input  wire [6*NUM_AXI-1:0]                 M_AXI_AWID,
    input  wire [32*NUM_AXI-1:0]                M_AXI_AWADDR,
    input  wire [4*NUM_AXI-1:0]                 M_AXI_AWLEN,
    input  wire [3*NUM_AXI-1:0]                 M_AXI_AWSIZE,
    input  wire [2*NUM_AXI-1:0]                 M_AXI_AWBURST,
    input  wire [2*NUM_AXI-1:0]                 M_AXI_AWLOCK,
    input  wire [4*NUM_AXI-1:0]                 M_AXI_AWCACHE,
    input  wire [3*NUM_AXI-1:0]                 M_AXI_AWPROT,
    input  wire [4*NUM_AXI-1:0]                 M_AXI_AWQOS,
    input  wire [NUM_AXI-1:0]                   M_AXI_AWUSER,
    input  wire [NUM_AXI-1:0]                   M_AXI_AWVALID,
    output reg  [NUM_AXI-1:0]                   M_AXI_AWREADY,
    
    // Master Interface Write Data
    input  wire [6*NUM_AXI-1:0]                 M_AXI_WID,
    input  wire [IF_DATA_WIDTH-1:0]             M_AXI_WDATA,
    input  wire [WSTRB_WIDTH-1:0]               M_AXI_WSTRB,
    input  wire [NUM_AXI-1:0]                   M_AXI_WLAST,
    input  wire [NUM_AXI-1:0]                   M_AXI_WUSER,
    input  wire [NUM_AXI-1:0]                   M_AXI_WVALID,
    output reg  [NUM_AXI-1:0]                   M_AXI_WREADY,
    
    // Master Interface Write Response  
    output reg  [6*NUM_AXI-1:0]                 M_AXI_BID,
    output reg  [2*NUM_AXI-1:0]                 M_AXI_BRESP,
    output reg  [NUM_AXI-1:0]                   M_AXI_BUSER,
    output reg  [NUM_AXI-1:0]                   M_AXI_BVALID,
    input  wire [NUM_AXI-1:0]                   M_AXI_BREADY,
    
    // Master Interface Read Address
    input  wire [6*NUM_AXI-1:0]                 M_AXI_ARID,
    input  wire [32*NUM_AXI-1:0]                M_AXI_ARADDR,
    input  wire [4*NUM_AXI-1:0]                 M_AXI_ARLEN,
    input  wire [3*NUM_AXI-1:0]                 M_AXI_ARSIZE,
    input  wire [2*NUM_AXI-1:0]                 M_AXI_ARBURST,
    input  wire [2*NUM_AXI-1:0]                 M_AXI_ARLOCK,
    input  wire [4*NUM_AXI-1:0]                 M_AXI_ARCACHE,
    input  wire [3*NUM_AXI-1:0]                 M_AXI_ARPROT,
    input  wire [4*NUM_AXI-1:0]                 M_AXI_ARQOS,
    input  wire [NUM_AXI-1:0]                   M_AXI_ARUSER,
    input  wire [NUM_AXI-1:0]                   M_AXI_ARVALID,
    output reg  [NUM_AXI-1:0]                   M_AXI_ARREADY,
    
    // Master Interface Read Data 
    output reg  [6*NUM_AXI-1:0]                 M_AXI_RID,
    output reg  [IF_DATA_WIDTH-1:0]             M_AXI_RDATA,
    output reg  [2*NUM_AXI-1:0]                 M_AXI_RRESP,
    output reg  [NUM_AXI-1:0]                   M_AXI_RLAST,
    output reg  [NUM_AXI-1:0]                   M_AXI_RUSER,
    output reg  [NUM_AXI-1:0]                   M_AXI_RVALID,
    input  wire [NUM_AXI-1:0]                   M_AXI_RREADY,

    // NPU Design
    // WRITE from BRAM to DDR
    output reg  [TX_SIZE_WIDTH-1:0]             outBuf_count,
    output wire                                 outBuf_empty,
    input  wire                                 outBuf_pop,
    output reg  [IF_DATA_WIDTH-1:0]             data_from_outBuf,

    // READ from DDR to BRAM
    input  wire [IF_DATA_WIDTH-1:0]             data_to_inBuf,
    input  wire                                 inBuf_push,
    output reg                                  inBuf_full,

    // TXN REQ
    output reg                                  rd_req,
    output reg  [32-1:0]                        rd_addr,
    output reg  [TX_SIZE_WIDTH-1:0]             rd_req_size
);

// ******************************************************************
// Localparam
// ******************************************************************
    

// ******************************************************************
// Regs and Wires
// ******************************************************************
    reg                                  r_fifo_push;
    reg                                  r_fifo_pop;
    reg  [TX_FIFO_DATA_WIDTH-1:0]        r_fifo_data_in;
    wire [TX_FIFO_DATA_WIDTH-1:0]        r_fifo_data_out;
    wire                                 r_fifo_empty;
    wire                                 r_fifo_full;

    reg                                  w_fifo_push;
    reg                                  w_fifo_pop;
    reg  [TX_FIFO_DATA_WIDTH-1:0]        w_fifo_data_in;
    wire [TX_FIFO_DATA_WIDTH-1:0]        w_fifo_data_out;
    wire                                 w_fifo_empty;
    wire                                 w_fifo_full;

    reg                                  fail_flag;

    integer                              counter;
    integer                              read_counter;
    integer                              write_counter;
    integer                              writes_expected;
// ******************************************************************
 integer               out_file    ; // file handler
// ******************************************************************
//initial begin
//    #100000
//    fail_flag = 1;
//    check_fail;
//    $finish;
//end
localparam NUM = 32000;
integer               data_file    ; // file handler

integer               weight_file    ; // file handler
integer               scan_file    ; // file handler
integer               w_scan_file    ; // file handler
reg [15:0] captured_data,captured_data_w;
reg [15:0] data_read [0:NUM];
reg [15:0] weight_read [0:NUM];
reg [31:0] count;
`define NULL 0    

localparam file_size = 100;

reg [file_size*8:0] dut_in [0:3];
reg [file_size*8:0] dut_out [0:3];
reg [file_size*8:0] expected_out [0:3];


always@(*) begin
    dut_in[0] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_0.txt";
    dut_in[1] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_1.txt";
    dut_in[2] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_2.txt";
    dut_in[3] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_3.txt";
    
    dut_out[0] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_0.txt";
    dut_out[1] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_1.txt";
    dut_out[2] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_2.txt";
    dut_out[3] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_2.txt";
    
    expected_out[0] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_0.txt";
    expected_out[1] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_1.txt";
    expected_out[2] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_2.txt";
    expected_out[3] = "C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_3.txt";
    
end
integer expected,actual;
integer e_f,a_f;
reg [15:0] expected_val,actual_val;
reg [15:0] num_errors,num_total;
initial wait(tabla_wrapper_tb.finished) begin
    #3000
//    if(AXI_ID == 0)
//        actual = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_0.txt", "r");
//    else if(AXI_ID == 1)
//        actual = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_1.txt", "r");
//    else if(AXI_ID == 2)
//        actual = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_2.txt", "r");
//    else
//        actual = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_3.txt", "r");
    actual = $fopen($sformatf(dut_out[AXI_ID]), "r");
//    if(AXI_ID == 0)
//        expected = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_0.txt", "r");
//    else if(AXI_ID == 1)
//        expected = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_1.txt", "r");
//    else if(AXI_ID == 2)
//        expected = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_2.txt", "r");
//    else
//        expected = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/output_weights/axi_3.txt", "r");
    expected = $fopen($sformatf(expected_out[AXI_ID]), "r");
    num_errors = 0;
    num_total=0;    
    while(!$feof(expected))begin
      e_f = $fscanf(expected," %d ", expected_val );
      a_f = $fscanf(actual," %d ", actual_val);
      
      if (expected_val != actual_val) begin
        num_errors = num_errors+1;
//        $display ("In AXI- %d ... The value expected  is:%d , The value received is:%d, current count: %d",AXI_ID,expected_val,actual_val,num_total);    
      end
      num_total = num_total+1;
         
   end//
    
    $display ("***************************TEST COMPLETED**********************************");

    $fclose(expected);
    $fclose(actual);
    $display ("In AXI- %d ... The number of errors is:%d , out of :%d",AXI_ID,num_errors,num_total);
    $display ("****************************************************************************");
//    $finish;
  end   

integer i;
initial begin
//    if(AXI_ID == 0)
//        data_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_0.txt", "r");
//    else if(AXI_ID == 1)
//        data_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_1.txt", "r");
//    else if(AXI_ID == 2)
//        data_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_2.txt", "r");
//    else
        data_file = $fopen($sformatf(dut_in[AXI_ID]), "r");
//             if(AXI_ID == 0)
//            out_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_0.txt", "w");
//        else if(AXI_ID == 1)
//            out_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_1.txt", "w");
//        else if(AXI_ID == 2)
//            out_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_2.txt", "w");
//        else
            out_file = $fopen($sformatf(dut_out[AXI_ID]), "w");
//        $fwrite(out_file,"ads");
        $fclose(out_file);
//    weight_file =  $fopen("C:/Users/brahm/RTML_tabla/input_weights.txt", "r");       
    if (data_file == `NULL) begin
        $display("data_file handle was NULL");
        $finish;
    end
    for ( i=0;i<NUM;i=i+1) begin 
    scan_file = $fscanf(data_file, "%d\n", captured_data); 
    data_read[i] = captured_data;
//    $fclose(data_file);
//    w_scan_file = $fscanf(weight_file, "%d\n", captured_data_w); 
//    weight_read[i] = captured_data_w;
 end
    count = 32'd0;
end
reg [TX_FIFO_DATA_WIDTH-1:0]        r_fifo_data_out_d;
always @(posedge ACLK) begin
r_fifo_data_out_d <= r_fifo_data_out;
end
        
always @(posedge ACLK)
begin
end

// Initialize regs
initial
begin
  counter = 0;//AXI_ID*4;
    read_counter = 0;
    write_counter = 0;
    writes_expected = 0;
    M_AXI_AWREADY = 0;
    M_AXI_WREADY = 0;
    M_AXI_BID = 0;
    M_AXI_BRESP = 0;
    M_AXI_BUSER = 0;
    M_AXI_BVALID = 0;
    M_AXI_ARREADY = 0;
    M_AXI_RID = 0;
    M_AXI_RDATA = 0;
    M_AXI_RRESP = 0;
    M_AXI_RLAST = 0;
    M_AXI_RUSER = 0;
    M_AXI_RVALID = 0;
    //outBuf_empty = 1;
    data_from_outBuf = 0;
    inBuf_full = 0;
    rd_req = 0;
    rd_addr = 0;
    rd_req_size = 0;
    fail_flag = 0;
    r_fifo_data_in = 0;
    r_fifo_push = 0;
    r_fifo_pop = 0;
    w_fifo_data_in = 0;
    w_fifo_push = 0;
    w_fifo_pop = 0;
end

always @(negedge ACLK)
begin
    ar_channel;
end

always @(negedge ACLK)
begin
    aw_channel;
end

always @(negedge ACLK)
begin
    r_channel;
end

always @(posedge ACLK)
begin
    w_channel;
end

always @(posedge ACLK)
begin
    b_channel;
end

// ******************************************************************
// TX-FIFO
// ******************************************************************
    fifo #(
        .DATA_WIDTH             ( TX_FIFO_DATA_WIDTH    ),
        .ADDR_WIDTH             ( 10                    )
    ) r_fifo (
        .clk                    ( ACLK                  ),
        .reset                  ( !ARESETN              ),
        .push                   ( r_fifo_push          ),
        .pop                    ( r_fifo_pop           ),
        .data_in                ( r_fifo_data_in       ),
        .data_out               ( r_fifo_data_out      ),
        .empty                  ( r_fifo_empty         ),
        .full                   ( r_fifo_full          )
    );

    fifo #(
        .DATA_WIDTH             ( TX_FIFO_DATA_WIDTH    ),
        .ADDR_WIDTH             ( 10                    )
    ) w_fifo (
        .clk                    ( ACLK                  ),
        .reset                  ( !ARESETN              ),
        .push                   ( w_fifo_push          ),
        .pop                    ( w_fifo_pop           ),
        .data_in                ( w_fifo_data_in       ),
        .data_out               ( w_fifo_data_out      ),
        .empty                  ( w_fifo_empty         ),
        .full                   ( w_fifo_full          )
    );
// ******************************************************************

// ******************************************************************
// Tasks
// ******************************************************************

//-------------------------------------------------------------------
task automatic random_delay;
    input integer MAX_DELAY;
    reg [3:0] delay;
    begin
        delay = $random;
        delay[0] = 1'b1;
        repeat (delay) begin
            @(negedge ACLK);
        end
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic ar_channel;
    begin
        wait(ARESETN);
        wait(M_AXI_ARVALID && ~r_fifo_full);
        //$display ("AXI%2d - Reading %2d beats from address : %h", AXI_ID, M_AXI_ARLEN+1, M_AXI_ARADDR);
        random_delay(16);
        M_AXI_ARREADY = 1'b1;
        r_fifo_data_in = {M_AXI_ARADDR, M_AXI_ARLEN};
        r_fifo_push = 1'b1;
        @(negedge ACLK);
        r_fifo_push = 1'b0;
        wait(~M_AXI_ARVALID);
        M_AXI_ARREADY = 1'b0;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------

task automatic r_channel;
    integer i, I;
    reg [3:0] burst_len;
    reg [31:0] addr,addr_o;
    begin
        
        
            I = C_M_AXI_DATA_WIDTH / DATA_WIDTH;
            wait(ARESETN);
        //wait(M_AXI_RREADY && ~r_fifo_empty && !ACLK);
        wait(~r_fifo_empty && !ACLK);
        wait (M_AXI_RREADY);
        //if (~M_AXI_RREADY)
        //begin
        //    fail_flag = 1'b1;
        //    $display ("Read channel not ready");
        //end
        M_AXI_RVALID = 1'b0;
        r_fifo_pop = 1'b1;
        @(negedge ACLK);
        r_fifo_pop = 1'b0;
        {addr_o, burst_len} = r_fifo_data_out_d;
        {addr, burst_len} = r_fifo_data_out;
//        if( addr[31:16] == 16'hCCDD && addr_o[31:16] == 16'hAABB)
//            counter = 0;
//        $display ("Reading %d beats from address %h", burst_len+1, addr);
        repeat(burst_len) begin
            wait(M_AXI_RREADY);
            for (i=0; i<I; i=i+1)
            begin
              if (addr[31:16] == 16'hAABB)
                M_AXI_RDATA[i*DATA_WIDTH+:DATA_WIDTH] = data_read[counter];
              else if (addr[31:16] == 16'hCCDD)
                M_AXI_RDATA[i*DATA_WIDTH+:DATA_WIDTH] = data_read[counter];
              else
                M_AXI_RDATA[i*DATA_WIDTH+:DATA_WIDTH] = 3;
              read_counter = read_counter + 1;
              counter = counter + 1;
            end
//            if(addr[31:16] == 16'hAABB)
//                counter = counter+12;
            M_AXI_RVALID = 1'b1;
            @(negedge ACLK);
            //read_counter = read_counter + 1;
        end
        
        M_AXI_RLAST = 1'b1;
        wait(M_AXI_RREADY);
        M_AXI_RVALID = 1'b1;
        for (i=0; i<I; i=i+1)
        begin
          if (addr[31:16] == 32'hAABB)
            M_AXI_RDATA[i*DATA_WIDTH+:DATA_WIDTH] = data_read[counter];
          else if (addr[31:16] == 32'hCCDD)
            M_AXI_RDATA[i*DATA_WIDTH+:DATA_WIDTH] = data_read[counter];
          else
            M_AXI_RDATA[i*DATA_WIDTH+:DATA_WIDTH] = 3;
          counter = counter + 1;
          read_counter = read_counter + 1;
        end
//        if(addr[31:16] == 16'hAABB)
//            counter = counter+12;
        @(negedge ACLK)  addr_o = addr;
        M_AXI_RLAST = 1'b0;
        M_AXI_RVALID = 1'b0;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic b_channel;
    begin
        wait(ARESETN);
        wait(M_AXI_WREADY && M_AXI_WVALID && M_AXI_WLAST);
        // Okay response
        M_AXI_BRESP = 1'b0;
        M_AXI_BVALID = 1'b1;
        wait(M_AXI_BREADY && M_AXI_BVALID);
        M_AXI_BVALID = 1'b0;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
  reg [4:0] w_count;
 
task w_channel;
    begin
        
//        if(AXI_ID == 0)
//            out_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_0.txt", "a");
//        else if(AXI_ID == 1)
//            out_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_1.txt", "a");
//        else if(AXI_ID == 2)
//            out_file = $fopen("C:/Users/brahm/RTML_tabla/mem-inst/axi/axi_out_2.txt", "a");
//        else
            out_file = $fopen($sformatf(dut_out[AXI_ID]), "a");
        wait(ARESETN);
        wait(M_AXI_WVALID && ~w_fifo_empty && !ACLK);
        M_AXI_WREADY = 1'b0;
        w_fifo_pop = 1'b1;
        @(negedge ACLK);
        w_count = 0;
        w_fifo_pop = 1'b0;
        M_AXI_WREADY = 1'b0;
        @(posedge ACLK);
        repeat(w_fifo_data_out) begin
            //wait(M_AXI_WVALID && M_AXI_WREADY);
            wait(M_AXI_WVALID)
            //M_AXI_WDATA = data_from_outBuf;
            M_AXI_WREADY = 1'b1;
            w_count = w_count + 1;
            @(posedge ACLK);
//            if(AXI_ID == 0)
//                $display ("Writing Beat %d; Data = %d,%d,%d,%d", w_count, $signed(M_AXI_WDATA[15:0]),$signed(M_AXI_WDATA[31:16]),$signed(M_AXI_WDATA[47:32]),$signed(M_AXI_WDATA[63:48]));
            $fwrite(out_file,"%d\n%d\n%d\n%d\n",$signed(M_AXI_WDATA[15:0]),$signed(M_AXI_WDATA[31:16]),$signed(M_AXI_WDATA[47:32]),$signed(M_AXI_WDATA[63:48]));
        end
        
        w_count = w_count + 1;
        @(negedge ACLK);
        //wait(M_AXI_WVALID && M_AXI_WREADY);
        wait(M_AXI_WVALID)
        M_AXI_WREADY = 1'b1;
        $fwrite(out_file,"%d\n%d\n%d\n%d\n",$signed(M_AXI_WDATA[15:0]),$signed(M_AXI_WDATA[31:16]),$signed(M_AXI_WDATA[47:32]),$signed(M_AXI_WDATA[63:48]));
        $fclose(out_file);
//        $display ("file closed");
        if (~M_AXI_WLAST)
        begin
//            $display ("Failed to assert WLAST");
//            $display ("Num of writes = %d", w_fifo_data_out);
            @(negedge ACLK);
            @(negedge ACLK);
            @(negedge ACLK);
            @(negedge ACLK);
            @(negedge ACLK);
            fail_flag = 1'b1;
        end
        @(negedge ACLK);
        M_AXI_WREADY = 1'b0;
        w_count = 14;
    
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic aw_channel;
    begin
        wait(ARESETN);
        wait(M_AXI_AWVALID && ~w_fifo_full);
        random_delay(16);
//        $display ("AXI%2d - Writing %2d Beats to   address : %8x", AXI_ID, M_AXI_AWLEN+1, M_AXI_AWADDR);
        M_AXI_AWREADY = 1'b1;
        w_fifo_data_in = M_AXI_AWLEN;
        w_fifo_push = 1'b1;
        @(negedge ACLK);
        w_fifo_push = 1'b0;
        wait(~M_AXI_AWVALID);
        M_AXI_AWREADY = 1'b0;
        //M_AXI_WREADY = 1'b1;
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task automatic request_random_tx;
    begin
        read_counter = 0;
        wait(ARESETN);
        @(negedge ACLK);
        rd_req = 1'b1;
        rd_req_size = $random+1;
        rd_addr = $random & 32'hFFFFFF00;
        if (rd_req_size == 0) rd_req_size = 63;
        //rd_req_size = 1;
//        if (VERBOSITY > 2) $display ("requesting %d reads from address %h", rd_req_size, rd_addr);
        writes_expected = writes_expected + rd_req_size;
        @(negedge ACLK);
        //@(posedge ACLK);
        rd_req = 1'b0;
//        if (VERBOSITY > 2) $display ("request sent");
        wait (read_counter == rd_req_size<<3);
        wait (M_AXI_RLAST);
//        if (VERBOSITY > 2) $display ("request complete");
    end
endtask
//-------------------------------------------------------------------

//-------------------------------------------------------------------
task check_fail;
    if (fail_flag && ARESETN) 
    begin
        $display("%c[1;31m",27);
        $display ("Test Failed");
        $display("%c[0m",27);
        $finish;
    end
endtask

always @(posedge ACLK)
begin
  check_fail;
end

//-------------------------------------------------------------------
task test_pass;
    begin
        $display("%c[1;32m",27);
        $display ("Test Passed");
        $display("%c[0m",27);
        $finish;
    end
endtask
//-------------------------------------------------------------------

//wire [TX_SIZE_WIDTH-1:0] outBuf_count_next;
assign outBuf_empty = outBuf_count < C_M_AXI_WR_BURST_LEN;
always @(posedge ACLK)
begin
  if (!ARESETN)
    outBuf_count <= 0;
  else if (inBuf_push)
  begin
    if (M_AXI_AWVALID && M_AXI_AWREADY)
      outBuf_count <= outBuf_count - 15;
    else
      outBuf_count <= outBuf_count + 1;
  end else begin
    if (M_AXI_AWVALID && M_AXI_AWREADY)
      outBuf_count <= outBuf_count - 16;
    else
      outBuf_count <= outBuf_count + 0;
  end
end

always@(negedge ACLK)
begin
  if (M_AXI_WVALID && M_AXI_WREADY)
    write_counter = write_counter + 1;
end

task wait_for_writes;
  begin
    wait (write_counter == (writes_expected - (writes_expected%C_M_AXI_WR_BURST_LEN)));
  end
endtask

endmodule


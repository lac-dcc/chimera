// Cache.v

`timescale 1 ps / 1 ps
module Cache #(
  parameter CACHE_LINE_WIDTH = 6, 
            TAG_WIDTH        = 20,
            ADDR_WIDTH       = 32
)(
		output reg [ADDR_WIDTH-1:0] avalon_master_address,       // burst_master.address
		output wire [CACHE_LINE_WIDTH:0]       avalon_master_burstcount,    //             .burstcount
		input  wire [31:0] avalon_master_readdata,      //             .readdata
		output wire [31:0] avalon_master_writedata,     //             .writedata
		input  wire        avalon_master_waitrequest,   //             .waitrequest
		output reg        avalon_master_read,          //             .read
		output reg        avalon_master_write,         //             .write
		input  wire        avalon_master_readdatavalid, //             .readdatavalid
		
		input  wire        rst_n,                       //        Reset.reset_n
		input  wire        clk,                         //        Clock.clk
		
		input  wire [ADDR_WIDTH-1:0] avalon_slave_address,        // avalon_slave.address
		input  wire        avalon_slave_read,           //             .read
		input  wire        avalon_slave_write,          //             .write
		output wire [31:0] avalon_slave_readdata,       //             .readdata
		input  wire [31:0] avalon_slave_writedata,      //             .writedata
		output wire        avalon_slave_waitrequest,    //             .waitrequest
		input  wire  [3:0] avalon_slave_byteenable,     //             .byteenable
		
    input  wire [ADDR_WIDTH-1:0] avalon_rdslave_address,        // avalon_rdslave.address
		input  wire        avalon_rdslave_read,           //             .read
		output wire [31:0] avalon_rdslave_readdata,       //             .readdata
		output wire        avalon_rdslave_waitrequest     //             .waitrequest
	);

`define INDEX_WIDTH (ADDR_WIDTH - CACHE_LINE_WIDTH - TAG_WIDTH)
`define NUM_CACHE_LINES (2**`INDEX_WIDTH)

// seperate slave addr into tag, index, offset

wire [TAG_WIDTH-1: 0] slave_addr_tag;
wire [`INDEX_WIDTH-1 : 0] slave_addr_idx;
wire [CACHE_LINE_WIDTH-1 : 0] slave_addr_off;
assign {slave_addr_tag, slave_addr_idx, slave_addr_off} = avalon_slave_address;

// separate rdslave addr into tag, index, offset

wire [TAG_WIDTH-1 : 0] rdslave_addr_tag;
wire [`INDEX_WIDTH-1 : 0] rdslave_addr_idx;
wire [CACHE_LINE_WIDTH-1 : 0] rdslave_addr_off;
assign {rdslave_addr_tag, rdslave_addr_idx, rdslave_addr_off} = avalon_rdslave_address;

// separate slave_waitrequest into slave_wr_waitrequest and slave_rd_waitrequest

wire slave_wr_waitrequest;
wire slave_rd_waitrequest;
assign avalon_slave_waitrequest =  avalon_slave_read ? slave_rd_waitrequest : 
                                  (avalon_slave_write ? slave_wr_waitrequest : 0); 

// define wires for cache lines

wire [ADDR_WIDTH-1 : 0]     rdAddr;
wire [31:0]                rdDatas[`NUM_CACHE_LINES-1 : 0];
wire                      rdVailds[`NUM_CACHE_LINES-1 : 0];
wire                     rdDirties[`NUM_CACHE_LINES-1 : 0];
wire                        rdHits[`NUM_CACHE_LINES-1 : 0];
wire [TAG_WIDTH-1 : 0]      rdTags[`NUM_CACHE_LINES-1 : 0];

wire [ADDR_WIDTH-1 : 0]    rd2Addr;
wire [31:0]               rd2Datas[`NUM_CACHE_LINES-1 : 0];
wire                     rd2Vailds[`NUM_CACHE_LINES-1 : 0];
wire                    rd2Dirties[`NUM_CACHE_LINES-1 : 0];
wire                       rd2Hits[`NUM_CACHE_LINES-1 : 0];
wire [TAG_WIDTH-1 : 0]     rd2Tags[`NUM_CACHE_LINES-1 : 0];

wire                        writes[`NUM_CACHE_LINES-1 : 0];
wire [CACHE_LINE_WIDTH-1 : 0] wrOff;
wire [TAG_WIDTH-1 : 0]        wrTag;
wire                        wrVaild;
wire                        wrDirty;
wire [31:0]                  wrData;
wire [3:0]             wrByteEnable;

wire [31:0]                  lkupDatas[`NUM_CACHE_LINES-1 : 0];

genvar cache_line_i;

generate 

  for (cache_line_i = 0; cache_line_i < `NUM_CACHE_LINES; cache_line_i = cache_line_i + 1) begin: cache_lines
    cacheline #(
      .CACHE_LINE_WIDTH (CACHE_LINE_WIDTH),
      .TAG_WIDTH        (TAG_WIDTH),
      .ADDR_WIDTH       (ADDR_WIDTH)
    ) lines (
      .clk(clk),
      .rst_n(rst_n),
      
      .rdAddr              (  rdAddr),
      .rdData              (  rdDatas[cache_line_i]),
      .rdVaild             ( rdVailds[cache_line_i]),
      .rdDirty             (rdDirties[cache_line_i]),
      .rdHit               (   rdHits[cache_line_i]),
      .rdTag               (   rdTags[cache_line_i]),
      
      .rd2Addr            (  rd2Addr),
      .rd2Data            (  rd2Datas[cache_line_i]),
      .rd2Vaild           ( rd2Vailds[cache_line_i]),
      .rd2Dirty           (rd2Dirties[cache_line_i]),
      .rd2Hit             (   rd2Hits[cache_line_i]),
      .rd2Tag             (   rd2Tags[cache_line_i]),
      
      .write              (    writes[cache_line_i]),
      .wrOff              (       wrOff),
      .wrTag              (       wrTag),
      .wrVaild            (     wrVaild),
      .wrDirty            (     wrDirty),
      .wrData             (      wrData),
      .wrByteEnable       (wrByteEnable),
      .lkupData           (lkupDatas[cache_line_i])
    );
  end

endgenerate

wire cacheRewrite;

wire         writesDirect[`NUM_CACHE_LINES-1 : 0];
wire         writesRewrit[`NUM_CACHE_LINES-1 : 0];
wire [CACHE_LINE_WIDTH-1 : 0] wrOffDirect;
wire [CACHE_LINE_WIDTH-1 : 0] wrOffRewrit;
wire [TAG_WIDTH-1 : 0]        wrTagDirect;
wire [TAG_WIDTH-1 : 0]        wrTagRewrit;
wire                        wrVaildDirect;
wire                        wrVaildRewrit;
wire                        wrDirtyDirect;
wire                        wrDirtyRewrit;
wire [31:0]                  wrDataDirect;
wire [31:0]                  wrDataRewrit;
wire [3:0]             wrByteEnableDirect;
wire [3:0]             wrByteEnableRewrit;


generate 
  for (cache_line_i = 0; cache_line_i < `NUM_CACHE_LINES; cache_line_i = cache_line_i + 1) begin : proc_writes
    assign writes[cache_line_i] = cacheRewrite ? writesRewrit[cache_line_i] : writesDirect[cache_line_i];
  end
endgenerate
assign wrOff = cacheRewrite ? wrOffRewrit : wrOffDirect;
assign wrTag = cacheRewrite ? wrTagRewrit : wrTagDirect;
assign wrVaild = cacheRewrite ? wrVaildRewrit : wrVaildDirect;
assign wrDirty = cacheRewrite ? wrDirtyRewrit : wrDirtyDirect;
assign wrData = cacheRewrite ? wrDataRewrit : wrDataDirect;
assign wrByteEnable = cacheRewrite ? wrByteEnableRewrit : wrByteEnableDirect;

assign rdAddr   = avalon_slave_address;
assign rd2Addr  = avalon_rdslave_address;

assign avalon_slave_readdata = rdDatas[slave_addr_idx];
assign avalon_rdslave_readdata = rd2Datas[rdslave_addr_idx];

wire slaveMiss;
wire slave2Miss;

assign  slaveMiss = ! rdHits[slave_addr_idx] && (avalon_slave_read || avalon_slave_write);
assign slave2Miss = ! rd2Hits[rdslave_addr_idx] && avalon_rdslave_read;

assign slave_rd_waitrequest = slaveMiss;
assign avalon_rdslave_waitrequest = slave2Miss;

assign wrOffDirect = slave_addr_off;
assign wrTagDirect = slave_addr_tag;
assign wrVaildDirect = 1'b1;
assign wrDirtyDirect = 1'b1;
assign wrDataDirect = avalon_slave_writedata;
assign slave_wr_waitrequest = slaveMiss;
assign wrByteEnableDirect = avalon_slave_byteenable;

reg [1:0] state;

`define IDLE  2'd0
`define WR    2'd1
`define RD    2'd2

reg [CACHE_LINE_WIDTH-1 : 0] cacheLineWrRdOff;

assign cacheRewrite = state == `WR || state ==`RD;

generate 
  for (cache_line_i = 0; cache_line_i < `NUM_CACHE_LINES; cache_line_i = cache_line_i + 1) begin : proc_writesDirect
    assign writesDirect[cache_line_i] = avalon_slave_write && rdHits[cache_line_i] && cache_line_i == slave_addr_idx;
  end
endgenerate

wire[ADDR_WIDTH-1:0] miss_address;
reg [ADDR_WIDTH-1:0] miss_address_save;
wire[ADDR_WIDTH-1:0] miss_address_sync;
wire [TAG_WIDTH-1 : 0] miss_addr_tag;
wire [`INDEX_WIDTH-1 : 0] miss_addr_idx;
wire [CACHE_LINE_WIDTH-1 : 0] miss_addr_off;
assign {miss_addr_tag, miss_addr_idx, miss_addr_off} = miss_address;
assign miss_address_sync = slaveMiss ? avalon_slave_address : avalon_rdslave_address;
assign miss_address = state == `IDLE ? miss_address_sync : miss_address_save;

always @(posedge clk, negedge rst_n) begin
  if(!rst_n) begin
    miss_address_save <= 0;
  end else begin
    if(state == `IDLE) begin
      miss_address_save <= miss_address_sync;
    end
  end
end

assign wrOffRewrit = cacheLineWrRdOff;
assign avalon_master_writedata = lkupDatas[miss_addr_idx];
assign avalon_master_burstcount = 2 ** CACHE_LINE_WIDTH;

generate 
  for (cache_line_i = 0; cache_line_i < `NUM_CACHE_LINES; cache_line_i = cache_line_i + 1) begin : proc_writesRewrit
    assign writesRewrit[cache_line_i] = state == `RD && avalon_master_readdatavalid && cache_line_i == miss_addr_idx;
  end
endgenerate
assign wrDataRewrit = avalon_master_readdata;
assign wrByteEnableRewrit = 4'b1111;
assign wrDirtyRewrit = 1'b0;
assign wrVaildRewrit = (cacheLineWrRdOff == (2 ** CACHE_LINE_WIDTH - 4)) ? 1'b1 : 1'b0;
assign wrTagRewrit = miss_addr_tag;

always @(posedge clk, negedge rst_n) begin

  if(! rst_n) begin
    state <= `IDLE;
    cacheLineWrRdOff <= 0;
    avalon_master_address <= 0;
    avalon_master_read <= 1'b0;
    avalon_master_write <= 1'b0;
    cacheLineWrRdOff <= 0;
  end else begin
    case (state)
      `IDLE: begin
        if(slaveMiss || slave2Miss) begin
          if(rdDirties[miss_addr_idx]) begin
            state <= `WR;
            avalon_master_address <= {rdTags[miss_addr_idx], miss_addr_idx, miss_addr_off - miss_addr_off};
            avalon_master_write <= 1'b1;
          end else begin
            state <= `RD;
            avalon_master_address <= {miss_addr_tag, miss_addr_idx, miss_addr_off - miss_addr_off};
            avalon_master_read <= 1'b1;
          end
          
        end
        cacheLineWrRdOff <= 0;
      end
      `WR: begin
        if(avalon_master_waitrequest) begin
        end else begin
          if(cacheLineWrRdOff == 2 ** CACHE_LINE_WIDTH - 4) begin
            cacheLineWrRdOff <= 0;
            avalon_master_write <= 1'b0;
            state <= `RD;
            
            avalon_master_address <= {miss_addr_tag, miss_addr_idx, miss_addr_off - miss_addr_off};
            avalon_master_read <= 1'b1;
          end else begin
            cacheLineWrRdOff <= cacheLineWrRdOff + 4;
          end
        end
      end
      `RD: begin
        if(avalon_master_read && !avalon_master_waitrequest) begin
          avalon_master_read <= 1'b0;
        end
        if(avalon_master_readdatavalid) begin
            if(cacheLineWrRdOff == 2 ** CACHE_LINE_WIDTH - 4) begin
              cacheLineWrRdOff <= 0;
              state <= `IDLE;
            end else begin
              cacheLineWrRdOff <= cacheLineWrRdOff + 4;
            end
        end
      end
      default: begin
        state <= `IDLE;
      end
    endcase
  end

end

endmodule

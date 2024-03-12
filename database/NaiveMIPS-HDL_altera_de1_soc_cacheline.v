module cacheline #(
  parameter CACHE_LINE_WIDTH = 6, 
            TAG_WIDTH        = 20,
            ADDR_WIDTH       = 32
) (
  input wire clk,
  input wire rst_n,
  
  input wire [ADDR_WIDTH-1 : 0]  rdAddr,
  output wire [31:0]             rdData,
  output wire                    rdVaild,
  output wire                    rdDirty,
  output wire                    rdHit,
  output wire [TAG_WIDTH-1 : 0]  rdTag,
  
  input wire [ADDR_WIDTH-1 : 0]  rd2Addr,
  output wire [31:0]             rd2Data,
  output wire                    rd2Vaild,
  output wire                    rd2Dirty,
  output wire                    rd2Hit,
  output wire [TAG_WIDTH-1 : 0]  rd2Tag,
  
  input wire                          write,
  input wire [CACHE_LINE_WIDTH-1 : 0] wrOff,
  input wire [TAG_WIDTH-1 : 0]        wrTag,
  input wire                          wrVaild,
  input wire                          wrDirty,
  input wire [31:0]                   wrData,
  input wire [3:0]                    wrByteEnable,
  output wire [31:0]                  lkupData

);

reg [31:0] words[ 2**(CACHE_LINE_WIDTH-2)-1 : 0];
reg vaild;
reg dirty;
reg [TAG_WIDTH - 1 : 0] tag;
wire preDirty;

assign preDirty = dirty || (write && wrDirty);

wire [TAG_WIDTH - 1 : 0] needTag;
wire [CACHE_LINE_WIDTH-1 : 0] rdOff;

wire [TAG_WIDTH - 1 : 0] need2Tag;
wire [CACHE_LINE_WIDTH-1 : 0] rd2Off;

assign needTag = rdAddr[ADDR_WIDTH-1 : ADDR_WIDTH-TAG_WIDTH];
assign rdOff = rdAddr[CACHE_LINE_WIDTH-1 : 0];

assign need2Tag = rd2Addr[ADDR_WIDTH-1 : ADDR_WIDTH-TAG_WIDTH];
assign rd2Off = rd2Addr[CACHE_LINE_WIDTH-1 : 0];

assign rdVaild = vaild;
assign rdData = rdVaild ? words[ rdOff[CACHE_LINE_WIDTH-1 : 2] ] : 0;
assign rdDirty = rdVaild ? preDirty : 1'b0;
assign rdTag = tag;
assign rdHit = vaild && (tag == needTag);

assign rd2Vaild = vaild;
assign rd2Data = rd2Vaild ? words[ rd2Off[CACHE_LINE_WIDTH-1 : 2] ] : 0;
assign rd2Dirty = rd2Vaild ? preDirty : 1'b0;
assign rd2Tag = tag;
assign rd2Hit = vaild && (tag == need2Tag);

assign lkupData = words[ wrOff[CACHE_LINE_WIDTH-1 : 2] ];



always @(posedge clk, negedge rst_n) begin

  if(!rst_n) begin : rst_words
    integer i;
    vaild <= 1'b0;
    dirty <= 1'b0;
    for (i=0; i<=2**(CACHE_LINE_WIDTH-2)-1; i = i+1 ) begin
      words[i] <= 0;
    end
  end else begin
    if(write) begin : proc_words
      dirty <= wrDirty;
      vaild <= wrVaild;
      tag <= wrTag;
	   if(wrByteEnable[0]) begin
		  words[wrOff[CACHE_LINE_WIDTH-1 : 2]][ 0*8 + 7 : 0*8] <= wrData[ 0*8 + 7 : 0*8];
	   end
	   if(wrByteEnable[1]) begin
		  words[wrOff[CACHE_LINE_WIDTH-1 : 2]][ 1*8 + 7 : 1*8] <= wrData[ 1*8 + 7 : 1*8];
      end
	   if(wrByteEnable[2]) begin
		  words[wrOff[CACHE_LINE_WIDTH-1 : 2]][ 2*8 + 7 : 2*8] <= wrData[ 2*8 + 7 : 2*8];
	   end
	   if(wrByteEnable[3]) begin
		  words[wrOff[CACHE_LINE_WIDTH-1 : 2]][ 3*8 + 7 : 3*8] <= wrData[ 3*8 + 7 : 3*8];
	   end
    end
  end
end



endmodule
module master(
input              aclk,
input              areset,

//AW CHANNEL
input              awready,
output reg [31:0]  awaddr,
output reg  [3:0]  awid,
output reg         awvalid,
output reg  [3:0]  awlen,
output reg  [2:0]  awsize,
output reg  [1:0]  awburst,
output reg  [1:0]  awlock,
output reg  [3:0]  awcache,
output reg  [2:0]  awprot,

//WDATA CHANNEL
input              wready,
output reg  [3:0]  wid,
output reg [31:0]  wdata,
output reg         wvalid,
output reg  [3:0]  wstrb,
output reg         wlast,

//WRESP CHANNEL
input       [3:0]  bid,
input       [1:0]  bresp,
input              bvalid,
output reg         bready,

//AR CHANNEL
input              arready,
output reg [31:0]  araddr,
output reg  [3:0]  arid,
output reg         arvalid,
output reg  [3:0]  arlen,
output reg  [2:0]  arsize,
output reg  [1:0]  arburst,
output reg  [1:0]  arlock,
output reg  [3:0]  arcache,
output reg  [2:0]  arprot,

//RDATA CHANNEL
input       [3:0]  rid,
input      [31:0]  rdata,
input       [1:0]  rresp,
input              rvalid,
input              rlast,
output reg         rready,

// From topmodule
input              valid,
input              rw,
input      [31:0]  addr,
input     [127:0]  data,
input       [1:0]  burst,
input       [3:0]  len,
output             last,

input       [3:0]  id_in
);

// Register
reg        [31:0]  data_s [0:3];
integer            i;

assign last = rlast|bvalid;

// Reset
always @ (negedge areset) begin 
   //aw
   awaddr  = 32'bz;
   awid    = 4'bz;
   awvalid = 1'b0;
   awlen   = 4'bz;
   awsize  = 4'bz;
   awburst = 2'bz;
   awlock  = 2'bz;
   awcache = 4'bz;
   awprot  = 3'bz;

   //wdata
   wdata   = 32'bz;
   wid     = 4'bz;
   wvalid  = 1'b0;
   wstrb   = 4'b0;
   wlast   = 1'b0;

   //wresp
   bready  = 1'b1;
   
   //ar
   araddr  = 32'bz;
   arid    = 4'bz;
   arvalid = 1'b0;
   arlen   = 4'bz;
   arsize  = 4'bz;
   arburst = 2'bz;
   arlock  = 2'bz;
   arcache = 4'bz;
   arprot  = 3'bz;
   //rdata
   rready  = 1'b0;

end

// Transaction valid
always @ (posedge valid) begin
   if(rw) begin // WRITE
      // Parse data
      data_s[0] = data[31:0];
      data_s[1] = data[63:32];
      data_s[2] = data[95:64];
      data_s[3] = data[127:96];

      awaddr  = addr;
      awid    = id_in;
      awvalid = 1'b1;
      awlen   = len;
      awsize  = 4'b010;
      awburst = burst;
      awlock  = 2'b0;
      awcache = 4'b0;
      awprot  = 3'b0;
      #10
      while (!awready) #10;

	  // burst transaction
      for(i=0; i<=len; i=i+1) begin 
         wvalid = 1'b1;
         wid    = id_in;
         wdata  = data_s[i];
         wlast  = i==len;
         if(i==0) begin
            #1
            awaddr  = 32'bz;
            awid    = 4'bz;
            awvalid = 1'b0;
            awlen   = 4'bz;
            awsize  = 4'bz;
            awburst = 2'bz;
            awlock  = 2'bz;
            awcache = 4'bz;
            awprot  = 3'bz;
            #9;
         end
         else #10;
         while (!wready) #10;
      end
	  
      wdata  = 32'bz;
      wid    = 4'bz;
      wvalid = 1'b0;
      wstrb  = 4'b0;
      wlast  = 1'b0;
      #10
      while (!bvalid) #10;
   end 
   // READ
   else begin
      arid    = id_in;
      araddr  = addr;
      arlen   = len;
      arsize  = 4'b010;
      arburst = burst;
      arcache = 4'b0;
      arprot  = 3'b0;
      arvalid = 1'b1;
      rready  = 1'b1;
      #10
      while(!arready) #10;
      #1
      arid    = 4'bz;
      araddr  = 32'bz;
      arlen   = 4'bz;
      arsize  = 4'bz;
      arburst = 2'bz;
      arcache = 4'bz;
      arprot  = 3'bz;
      arvalid = 1'b0;
      #9
      while(!rlast) #10;
   end // rw
end // always
endmodule

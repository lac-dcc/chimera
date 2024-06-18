// This program was cloned from: https://github.com/TeamVoss/VossII
// License: Apache License 2.0

//-----------------------------------------------------
// Design Name : ram_sp_sr_sw
// File Name   : ram_sp_sr_sw.v
// Function    : Synchronous read write RAM 
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module ram_sp_sr_sw (
clk         , // Clock Input
address     , // Address Input
data_in        , // 
data_out        , // 
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe            // Output Enable
); 

parameter DATA_WIDTH = 8 ;
parameter ADDR_WIDTH = 8 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input                  clk         ;
input [ADDR_WIDTH-1:0] address     ;
input                  cs          ;
input                  we          ;
input                  oe          ; 
input [DATA_WIDTH-1:0] data_in     ;

//--------------Inout Ports----------------------- 
output [DATA_WIDTH-1:0]  data_out   ;

//--------------Internal variables---------------- 
reg [DATA_WIDTH-1:0] data_i_out ;
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];
reg                  oe_r;

//--------------Code Starts Here------------------ 

assign data_out = data_i_out;

// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (posedge clk)
begin : MEM_WRITE
   if ( cs && we ) begin
       mem[address] = data_in;
   end
end

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @ (posedge clk)
begin : MEM_READ
  if (cs && !we && oe) begin
    data_i_out = mem[address];
    oe_r = 1;
  end else begin
    oe_r = 0;
  end
end

endmodule // End of Module ram_sp_sr_sw


//-----------------------------------------------------
// Design Name : ram_sp_ar_sw
// File Name   : ram_sp_ar_sw.v
// Function    : Asynchronous read write RAM 
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module ram_sp_ar_sw (
clk         , // Clock Input
address     , // Address Input
data_in        , // Data bi-directional
data_out        , // Data bi-directional
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe            // Output Enable
); 

parameter DATA_WIDTH = 8 ;
parameter ADDR_WIDTH = 8 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input                                     clk          ;
input [ADDR_WIDTH-1:0] address ;
input                                     cs           ;
input                                     we          ;
input                                     oe           ; 
input [DATA_WIDTH-1:0]  data_in       ;

//--------------Inout Ports----------------------- 
output reg [DATA_WIDTH-1:0]   data_out ;

//--------------Internal variables---------------- 
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

//--------------Code Starts Here------------------ 

// Tri-State Buffer control 
// output : When we = 0, oe = 1, cs = 1

// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (posedge clk)
begin : MEM_WRITE
   if ( cs && we ) begin
       mem[address] = data_in;
   end
end

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @ (address or cs or we or oe)
begin : MEM_READ
    if (cs && !we && oe) begin
         data_out = mem[address];
    end
end

endmodule // End of Module ram_sp_ar_sw


//-----------------------------------------------------
// Design Name : ram_sp_ar_aw
// File Name   : ram_sp_ar_aw.v
// Function    : Asynchronous read write RAM 
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module ram_sp_ar_aw (
address     , // Address Input
data_in	    ,
data_out    , // 
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe            // Output Enable
);          
parameter DATA_WIDTH = 8 ;
parameter ADDR_WIDTH = 8 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input [ADDR_WIDTH-1:0] address ;
input                                     cs           ;
input                                     we          ;
input                                     oe           ; 
input [DATA_WIDTH-1:0]  data_in       ;

//--------------Output Ports----------------------- 
output reg [DATA_WIDTH-1:0]   data_out ;

//--------------Internal variables---------------- 
reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

//--------------Code Starts Here------------------ 

// Memory Write Block 
// Write Operation : When we = 1, cs = 1
always @ (address or data_in or cs or we)
begin : MEM_WRITE
   if ( cs && we ) begin
       mem[address] = data_in;
   end
end

// Memory Read Block 
// Read Operation : When we = 0, oe = 1, cs = 1
always @ (address or cs or we or oe)
begin : MEM_READ
    if (cs && !we && oe)  begin
         data_out = mem[address];
    end
end

endmodule // End of Module ram_sp_ar_aw


module top_memory (
clk         , // Clock Input
address     , // Address Input
data_in     , // 
data_out1    , // 
data_out2    , // 
data_out3    , // 
cs          , // Chip Select
we          , // Write Enable/Read Enable
oe            // Output Enable
);

parameter DATA_WIDTH = 8 ;
parameter ADDR_WIDTH = 8 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input                  clk         ;
input [ADDR_WIDTH-1:0] address     ;
input                  cs          ;
input                  we          ;
input                  oe          ; 
input [DATA_WIDTH-1:0] data_in     ;

//--------------Inout Ports----------------------- 
output [DATA_WIDTH-1:0]  data_out1   ;
output [DATA_WIDTH-1:0]  data_out2   ;
output [DATA_WIDTH-1:0]  data_out3   ;

    ram_sp_sr_sw mem1 (.clk(clk), .address(address), .data_in(data_in),
		       .data_out(data_out1), .cs(cs), .we(we), .oe(oe) );

    ram_sp_ar_sw mem2 (.clk(clk), .address(address), .data_in(data_in),
		       .data_out(data_out1), .cs(cs), .we(we), .oe(oe) );

    ram_sp_ar_aw mem3 (.address(address), .data_in(data_in),
		       .data_out(data_out1), .cs(cs), .we(we), .oe(oe) );

endmodule

//ultraRAMx72_TDP.v
 `timescale 1ns/100ps
 
//this module is derived from the "block" True Dual Port RAM template provided under Vivado "Tools"-->Language Templates
//modifications by: Jerry D. Harthcock, May 29, 2018
 
 
module ultraRAMx72_TDP #(parameter ADDRS_WIDTH = 12)(  //"true" dual port RAM built from ultraRAM
    CLK,
    wrenA,
    wrenB,
    wraddrsA,
    wraddrsB,
    wrdataA,
    wrdataB,
    rdenA,
    rdenB,
    rdaddrsA,
    rdaddrsB,
    rddataA,
    rddataB
    );    

input  CLK;
input  wrenA;
input  wrenB;
input  [ADDRS_WIDTH-1:0] wraddrsA;                  
input  [ADDRS_WIDTH-1:0] wraddrsB;                  
input  [63:0] wrdataA;
input  [63:0] wrdataB;
input  rdenA;
input  rdenB;
input  [ADDRS_WIDTH-1:0] rdaddrsA;
input  [ADDRS_WIDTH-1:0] rdaddrsB;
output [63:0] rddataA;
output [63:0] rddataB;


parameter DWIDTH = 64;  // Data Width
parameter NBPIPE = 0;   // Number of pipeline Registers

// Port A
wire RESET;                       // Reset
assign RESET = 1'b0;
wire regcea;                      // Output Register Enable
assign regcea = 1'b0;             // Output Register Enable
wire mem_ena;                     // Memory Enable 
assign mem_ena = wrenA || rdenA;
wire [ADDRS_WIDTH-1:0] addrsA;
assign addrsA = wrenA  ? wraddrsA : rdaddrsA;
reg [DWIDTH-1:0] rddataA;         // Data Output 
reg [DWIDTH-1:0] douta; 

// Port B
wire regceb;                      // Output Register Enable
assign regceb = 1'b0;             // Output Register Enable
wire mem_enb;                     // Memory Enable
assign mem_enb = wrenB || rdenB;
wire [ADDRS_WIDTH-1:0] addrsB;
assign addrsB = wrenB  ? wraddrsB : rdaddrsB;
reg [DWIDTH-1:0] rddataB;         // Data Output
reg [DWIDTH-1:0] doutb; 


(* ram_style = "ultra" *) reg [DWIDTH-1:0] mem[(1<<ADDRS_WIDTH)-1:0];    // Memory Declaration

reg [DWIDTH-1:0] memrega;              
reg [DWIDTH-1:0] mem_pipe_rega[NBPIPE-1:0];    // Pipelines for memory
reg mem_en_pipe_rega[NBPIPE:0];                // Pipelines for memory enable  

reg [DWIDTH-1:0] memregb;              
reg [DWIDTH-1:0] mem_pipe_regb[NBPIPE-1:0];    // Pipelines for memory
reg mem_en_pipe_regb[NBPIPE:0];                // Pipelines for memory enable  
integer          i;

// RAM : Both READ and WRITE have a latency of one
always @ (posedge CLK)
begin
 if(mem_ena) 
  begin
   if(wrenA)
    mem[addrsA] <= wrdataA;
   else
    rddataA <= mem[addrsA];
  end
end

// The enable of the RAM goes through a pipeline to produce a
// series of pipelined enable signals required to control the data
// pipeline.
always @ (posedge CLK)
begin
 mem_en_pipe_rega[0] <= mem_ena;
 for (i=0; i<NBPIPE; i=i+1)
   mem_en_pipe_rega[i+1] <= mem_en_pipe_rega[i];
end

// RAM output data goes through a pipeline.
always @ (posedge CLK)
begin
 if (mem_en_pipe_rega[0])
  mem_pipe_rega[0] <= memrega;
end    

always @ (posedge CLK)
begin
 for (i = 0; i < NBPIPE-1; i = i+1)
  if (mem_en_pipe_rega[i+1])
   mem_pipe_rega[i+1] <= mem_pipe_rega[i];
end      

// Final output register gives user the option to add a reset and
// an additional enable signal just for the data ouptut
always @ (posedge CLK)
begin
 if (RESET)
   douta <= 0;
 else if (mem_en_pipe_rega[NBPIPE] && regcea)
   douta <= mem_pipe_rega[NBPIPE-1];
end


always @ (posedge CLK)
begin
 if(mem_enb) 
  begin
   if(wrenB)
    mem[addrsB] <= wrdataB;
   else
    rddataB <= mem[addrsB];
  end
end

// The enable of the RAM goes through a pipeline to produce a
// series of pipelined enable signals required to control the data
// pipeline.
always @ (posedge CLK)
begin
 mem_en_pipe_regb[0] <= mem_enb;
 for (i=0; i<NBPIPE; i=i+1)
   mem_en_pipe_regb[i+1] <= mem_en_pipe_regb[i];
end

// RAM output data goes through a pipeline.
always @ (posedge CLK)
begin
 if (mem_en_pipe_regb[0])
  mem_pipe_regb[0] <= memregb;
end    

always @ (posedge CLK)
begin
 for (i = 0; i < NBPIPE-1; i = i+1)
  if (mem_en_pipe_regb[i+1])
   mem_pipe_regb[i+1] <= mem_pipe_regb[i];
end      

// Final output register gives user the option to add a reset and
// an additional enable signal just for the data ouptut
always @ (posedge CLK)
begin
 if (RESET)
   doutb <= 0;
 else if (mem_en_pipe_regb[NBPIPE] && regceb)
   doutb <= mem_pipe_regb[NBPIPE-1];
end

endmodule						
					
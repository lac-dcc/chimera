//*****************************************************************************
// Synthesizable Memories
//--------------------------------------------------------------------------
// $Id: vcMemories.v,v 1.1.1.1 2006/02/17 23:57:17 cbatten Exp $

//--------------------------------------------------------------------------
// Magic Single Port Mem
//--------------------------------------------------------------------------
// Magic memories have a zero-cycle latency between the request and 
// response for load data. In other words, memreq_val is combinationally
// connected to memresp_val. The client must be ready to accept a response
// since there is no memresp_rdy signal.

module vcMem_magic1port
#(
  parameter MEM_SZ       = 8,  // Size of physical memory address in bits 
  parameter ADDR_SZ      = 8,  // Size of request address in bits
  parameter DATA_SZ      = 32, // Size of data in bits
  parameter ADDR_SHIFT   = 2   // Ammount to right shift address before indexing
)
(

  input clk, reset,

  // Memory Request Input Interface
  input                memreq_bits_rw,    // Request type (0=read,1=write)
  input  [ADDR_SZ-1:0] memreq_bits_addr,  // Request address
  input  [DATA_SZ-1:0] memreq_bits_data,  // Request data
  input                memreq_val,        // Request address is valid
  output               memreq_rdy,        // Memory is ready to accept a request

  // Memory Response Output Interface
  output [DATA_SZ-1:0] memresp_bits_data, // Response data
  output               memresp_val        // Response is valid
 
);

  // The actual memory
  
  reg [DATA_SZ-1:0] m[(1 << (MEM_SZ-ADDR_SHIFT))-1:0];

  // The physical address
  
  wire [MEM_SZ-ADDR_SHIFT-1:0] phys_addr = memreq_bits_addr[MEM_SZ-1:ADDR_SHIFT];

  // Always ready

  assign memreq_rdy = 1'b1;
  
  // Response is valid if there is a request _and_ that request is a read

  assign memresp_val = memreq_val && ~memreq_bits_rw;

  // Combinational read port

  assign memresp_bits_data = m[phys_addr];

  // Data write port samples on the positive clock edge
  
  always @( posedge clk )
  begin
    if ( memreq_val && memreq_bits_rw )
      m[phys_addr] <= memreq_bits_data;
  end

endmodule

//--------------------------------------------------------------------------
// Magic Dual Port Mem
//--------------------------------------------------------------------------
// Magic memories have a zero-cycle latency between the request and 
// response for load data. In other words, memreq_val is combinationally
// connected to memresp_val. The client must be ready to accept a response
// since there is no memresp_rdy signal.

module vcMem_magic2port
#(
  parameter MEM_SZ       = 8,  // Size of physical memory address in bits 
  parameter ADDR_SZ      = 8,  // Size of request address in bits
  parameter DATA_SZ      = 32, // Size of data in bits
  parameter ADDR_SHIFT   = 2   // Ammount to right shift address before indexing
)
(

  input clk, reset,

  // Memory Request Input Interface (Port 0)
  input                memreq0_bits_rw,    // Request type (0=read,1=write)
  input  [ADDR_SZ-1:0] memreq0_bits_addr,  // Request address
  input  [DATA_SZ-1:0] memreq0_bits_data,  // Request data
  input                memreq0_val,        // Request address is valid
  output               memreq0_rdy,        // Memory is ready to accept a request

  // Memory Response Output Interface (Port 0)
  output [DATA_SZ-1:0] memresp0_bits_data, // Response data
  output               memresp0_val,       // Response is valid

  // Memory Request Input Interface (Port 1)
  input                memreq1_bits_rw,    // Request type (0=read,1=write)
  input  [ADDR_SZ-1:0] memreq1_bits_addr,  // Request address
  input  [DATA_SZ-1:0] memreq1_bits_data,  // Request data
  input                memreq1_val,        // Request address is valid
  output               memreq1_rdy,        // Memory is ready to accept a request

  // Memory Response Output Interface (Port 1)
  output [DATA_SZ-1:0] memresp1_bits_data, // Response data
  output               memresp1_val        // Response is valid
 
);

  // The actual memory
  
  reg [DATA_SZ-1:0] m[(1 << (MEM_SZ-ADDR_SHIFT))-1:0];

  // The physical address
  
  wire [MEM_SZ-ADDR_SHIFT-1:0] phys_addr0 = memreq0_bits_addr[MEM_SZ-1:ADDR_SHIFT];
  wire [MEM_SZ-ADDR_SHIFT-1:0] phys_addr1 = memreq1_bits_addr[MEM_SZ-1:ADDR_SHIFT];

  // Always ready

  assign memreq0_rdy = 1'b1;
  assign memreq1_rdy = 1'b1;
  
  // Response is valid if there is a request _and_ that request is a read

  assign memresp0_val = memreq0_val && ~memreq0_bits_rw;
  assign memresp1_val = memreq1_val && ~memreq1_bits_rw;

  // Combinational read port

  assign memresp0_bits_data = m[phys_addr0];
  assign memresp1_bits_data = m[phys_addr1];

  // Data write port samples on the positive clock edge
  
  always @( posedge clk )
  begin
    if ( memreq0_val && memreq0_bits_rw )
      m[phys_addr0] <= memreq0_bits_data;
    if ( memreq1_val && memreq1_bits_rw )
      m[phys_addr1] <= memreq1_bits_data;
  end

endmodule
  
//--------------------------------------------------------------------------
// Test Single Port Mem
//--------------------------------------------------------------------------
// This memory includes support for random delays to facilitate testing.
// Use the RANDOM_DELAY parameter to specify the maximum number of cycles
// to randomly delay requests. If RANDOM_DELAY is zero then all requests
// take one cycle. The client must be ready to accept the response since
// there is no memresp_rdy signal.

module vcMem_test1port
#(
  parameter MEM_SZ       = 8,  // Size of physical memory address in bits 
  parameter ADDR_SZ      = 8,  // Size of request address in bits
  parameter DATA_SZ      = 32, // Size of data in bits
  parameter ADDR_SHIFT   = 2,  // Ammount to right shift address before indexing
  parameter RANDOM_DELAY = 0   // Max number of cycles to randomly delay response
)
(

  input clk, reset,

  // Memory Request Input Interface
  input                    memreq_bits_rw,    // Request type (0=read,1=write)
  input      [ADDR_SZ-1:0] memreq_bits_addr,  // Request address
  input      [DATA_SZ-1:0] memreq_bits_data,  // Request data
  input                    memreq_val,        // Request address is valid
  output                   memreq_rdy,        // Memory is ready to accept a request

  // Memory Response Output Interface
  output reg [DATA_SZ-1:0] memresp_bits_data, // Response data
  output reg               memresp_val        // Response is valid

);

  //========================================================================
  // State
  //========================================================================

  reg [DATA_SZ-1:0] m[(1 << MEM_SZ)-1:0];

  // Random delay register
  
  wire [31:0] rand_delay;
  reg  [31:0] rand_delay_next;
  reg         rand_delay_en;
  
  vcERDFF_pf#(32) rand_delay_pf
  ( 
    .clk     (clk),
    .reset_p (reset),
    .en_p    (rand_delay_en),
    .d_p     (rand_delay_next), 
    .q_np    (rand_delay) 
  );

  // Input queue

  wire [(ADDR_SZ+DATA_SZ+1)-1:0] inputQ_deq_bits;
  wire	                         inputQ_deq_val;
  reg                            inputQ_deq_rdy;

  wire               inputQ_deq_bits_rw   = inputQ_deq_bits[ADDR_SZ+DATA_SZ];
  wire [ADDR_SZ-1:0] inputQ_deq_bits_addr = inputQ_deq_bits[ADDR_SZ+DATA_SZ-1:DATA_SZ];
  wire [DATA_SZ-1:0] inputQ_deq_bits_data = inputQ_deq_bits[DATA_SZ-1:0];
  
  vcQueue_pipe1_pf#(ADDR_SZ+DATA_SZ+1) inputQ
  (
    .clk       (clk),
    .reset     (reset),
    .enq_bits  ( { memreq_bits_rw, memreq_bits_addr, memreq_bits_data } ),
    .enq_val   (memreq_val),
    .enq_rdy   (memreq_rdy),
    .deq_bits  (inputQ_deq_bits),
    .deq_val   (inputQ_deq_val),
    .deq_rdy   (inputQ_deq_rdy)
  );

  //========================================================================
  // Combinational
  //========================================================================

  wire [ADDR_SZ-ADDR_SHIFT-1:0] phys_addr = inputQ_deq_bits_addr[MEM_SZ-1:ADDR_SHIFT];
  
  //========================================================================
  // Actions
  //========================================================================

  reg decrand_fire;
  reg read_fire;
  reg write_fire;
  
  always @(*) if ( ~reset )
  begin

    // Default control signals
    rand_delay_en  = 1'b0;
    inputQ_deq_rdy = 1'b0;
    memresp_val    = 1'b0;
    
    // Fire signals
    decrand_fire  = 1'b0;
    read_fire     = 1'b0;
    write_fire    = 1'b0;
    
    //----------------------------------------------------------------
    // decrand action

    if ( rand_delay > 0 )
     begin
      decrand_fire    = 1'b1;
      rand_delay_en   = 1'b1;
      rand_delay_next = rand_delay - 1;
     end

    //----------------------------------------------------------------
    // read action

    if ( inputQ_deq_val && ~inputQ_deq_bits_rw && (rand_delay == 0) )
    begin
      read_fire         = 1'b1;
      inputQ_deq_rdy    = 1'b1;
      memresp_val       = 1'b1;
      memresp_bits_data = m[phys_addr];

      // Set random delay if needed
      if ( RANDOM_DELAY > 0 )
       begin
        rand_delay_en   = 1'b1;
        rand_delay_next = {$random} % RANDOM_DELAY;
       end
      
    end    
    
    //----------------------------------------------------------------
    // write action

    if ( inputQ_deq_val && inputQ_deq_bits_rw && (rand_delay == 0) )
    begin
      write_fire     = 1'b1;
      inputQ_deq_rdy = 1'b1;
      m[phys_addr]   = inputQ_deq_bits_data;      

      // Set random delay if needed
      if ( RANDOM_DELAY > 0 )
       begin
        rand_delay_en   = 1'b1;
        rand_delay_next = {$random} % RANDOM_DELAY;
       end

    end    
    
  end
  
endmodule

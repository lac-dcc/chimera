// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module wb_mem_2_ppfifo(

  input               clk,
  input               rst,
  output      [31:0]  debug,

  //Control

  input               i_enable,

  input       [31:0]  i_memory_0_base,
  input       [31:0]  i_memory_0_size,
  output      [31:0]  o_memory_0_count,
  input               i_memory_0_new_data,
  output              o_memory_0_empty,

  input       [31:0]  o_default_mem_0_base,

  input       [31:0]  i_memory_1_base,
  input       [31:0]  i_memory_1_size,
  output      [31:0]  o_memory_1_count,
  input               i_memory_1_new_data,
  output              o_memory_1_empty,

  input       [31:0]  o_default_mem_1_base,

  output  reg         o_read_finished,

  //master control signal for memory arbitration
  output  reg         o_mem_we,
  output  reg         o_mem_stb,
  output  reg         o_mem_cyc,
  output  reg [3:0]   o_mem_sel,
  output      [31:0]  o_mem_adr,
  output  reg [31:0]  o_mem_dat,
  input       [31:0]  i_mem_dat,
  input               i_mem_ack,
  input               i_mem_int,

  //Ping Pong FIFO Interface
  input       [1:0]   i_ppfifo_rdy,
  output  reg [1:0]   o_ppfifo_act,
  input       [23:0]  i_ppfifo_size,
  output  reg         o_ppfifo_stb,
  output      [31:0]  o_ppfifo_data
);

//Local Parameters
//States
localparam          IDLE                = 4'h0;
localparam          GET_MEMORY_BLOCK    = 4'h1;
localparam          READ_DATA           = 4'h2;
localparam          FINISHED            = 4'h3;

//Registers/Wires
reg           [23:0]  r_ppfifo_count;   //Ping Pong FIFO Count
reg           [31:0]  r_mem_read_size;  //Current Memory Size to read

wire          [31:0]  w_mem_base  [1:0];
reg           [31:0]  r_mem_ptr   [1:0];
wire          [31:0]  r_mem_count [1:0];

wire          [31:0]  w_mem_0_ptr;
wire          [31:0]  w_mem_1_ptr;

wire          [31:0]  w_mem_0_count;
wire          [31:0]  w_mem_1_count;

wire          [31:0]  w_mem_0_base;

reg                   r_active_bank;
reg                   r_memory_ready;

reg           [3:0]   state;



//Submodules
//Asynchronous Logic

//Debug Assignments
//assign  debug[19:0]             = r_mem_ptr[r_active_bank];
//assign  debug[20]               = ((r_mem_ptr[r_active_bank] == 0) && (o_mem_cyc == 1));
//assign  debug[21]               = o_memory_0_empty;
//assign  debug[22]               = o_ppfifo_stb;
//assign  debug[26:23]            = state;
//assign  debug[27]               = r_active_bank;
//assign  debug[28]               = r_memory_ready;
//

//assign  debug[3]              = r_memory_ready;
//assign  debug[7:4]            = state;
//assign  debug[8]              = o_read_finished;
//assign  debug[10]             = o_memory_1_empty;
//assign  debug[13:12]          = i_ppfifo_rdy;
//assign  debug[15:14]          = o_ppfifo_act;
//assign  debug[1]              = i_mem_dat[31];

assign  debug[1]                = o_mem_cyc;
assign  debug[2]                = o_mem_stb;
assign  debug[3]                = i_mem_ack;
assign  debug[4]                = i_mem_dat[31];
assign  debug[11]               = ((r_mem_ptr[r_active_bank] == 0) && (o_mem_cyc == 1));
assign  debug[12]               = r_active_bank;
assign  debug[13]               = r_memory_ready;
assign  debug[14]               = o_memory_0_empty;
assign  debug[15]               = o_ppfifo_stb;
assign  debug[31:16]            = i_mem_dat[23:8];




//assign  o_default_mem_0_base  = 32'h00000000;
//assign  o_default_mem_1_base  = 32'h00080000;

assign  o_ppfifo_data         = i_mem_dat;
assign  o_mem_adr             = w_mem_base[r_active_bank] + r_mem_ptr[r_active_bank];

assign  r_mem_count[0]        = i_memory_0_size - r_mem_ptr[0];
assign  r_mem_count[1]        = i_memory_1_size - r_mem_ptr[1];

assign  o_memory_0_empty      = (r_mem_count[0] == 0);
assign  o_memory_1_empty      = (r_mem_count[1] == 0);
//assign  w_mem_0_empty         = (r_mem_count[0] == 0);
//assign  w_mem_1_empty         = (r_mem_count[1] == 0);

assign  o_memory_0_count      = r_mem_count[0];
assign  o_memory_1_count      = r_mem_count[1];

assign  w_mem_0_ptr           = r_mem_ptr[0];
assign  w_mem_1_ptr           = r_mem_ptr[1];

assign  w_mem_base[0]         = i_memory_0_base;
assign  w_mem_base[1]         = i_memory_1_base;


//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_read_finished       <=  0;

    //Wishbone Bus Signals
    o_mem_we              <=  0;
    o_mem_stb             <=  0;
    o_mem_cyc             <=  0;
    o_mem_sel             <=  4'b1111;
    o_mem_dat             <=  32'h00000000;

    //Ping Pong FIFO Signals
    o_ppfifo_act          <=  0;
    o_ppfifo_stb          <=  0;
    r_ppfifo_count        <=  0;

    //Memory Interface
    r_mem_read_size       <=  0;

    r_mem_ptr[0]          <=  0;
    r_mem_ptr[1]          <=  0;

    state                 <=  IDLE;
  end
  else begin
    //De-assert Strobes
    o_ppfifo_stb          <=  0;
    o_read_finished       <=  0;

    //Grab an Available FIFO if the core is activated
    if (i_enable) begin
      if ((i_ppfifo_rdy > 0) && (o_ppfifo_act == 0)) begin
        r_ppfifo_count    <=  0;
        if (i_ppfifo_rdy[0]) begin
          o_ppfifo_act[0] <=  1;
        end
        else begin
          o_ppfifo_act[1] <=  1;
        end
      end
    end

    case (state)
      IDLE: begin
        o_mem_cyc         <=  0;
        o_mem_stb         <=  0;
        if (i_enable) begin
          state           <=  GET_MEMORY_BLOCK;
        end
      end
      GET_MEMORY_BLOCK: begin
        o_mem_cyc         <=  0;
        o_mem_stb         <=  0;
        if (r_memory_ready) begin
          r_mem_read_size <=  r_mem_count[r_active_bank];
          state           <=  READ_DATA;
        end
        else begin

          if (!i_enable) begin
            state         <=  IDLE;
          end
        end
      end
      READ_DATA: begin
        if (r_mem_ptr[r_active_bank] < r_mem_read_size) begin
          //If the FIFO has room
          if (o_ppfifo_act > 0) begin
            if (r_ppfifo_count < i_ppfifo_size) begin
              o_mem_cyc   <=  1;
              o_mem_stb   <=  1;

              //Ping Pong FIFO has room
              //if we received data from the memory bus, read them in
              if (i_mem_ack && o_mem_stb) begin
                r_ppfifo_count            <=  r_ppfifo_count + 1;
                r_mem_ptr[r_active_bank]  <=  r_mem_ptr[r_active_bank] + 1;
                o_ppfifo_stb              <=  1;
                o_mem_stb                 <=  0;
              end
            end
            else begin
              //Release the Activate
              //Release the Wishbone cycle so the host has a chance to write
              //data
              o_mem_cyc                 <=  0;
              o_mem_stb                 <=  0;
              o_ppfifo_act              <=  0;
            end
          end
          else begin
            o_mem_cyc     <=  0;
            o_mem_stb     <=  0;
          end
        end
        else begin
          o_mem_cyc       <=  0;
          o_mem_stb       <=  0;
          state           <=  FINISHED;
        end
      end
      FINISHED: begin
        o_mem_cyc         <=  0;
        o_mem_stb         <=  0;
        //If a memory block is not active but there is data in a PPFIFO
        //Then we need to flush it, this usually happens at the end of
        //a write
        o_read_finished   <=  1;  //Launch a signal to indicate that we
                                  //consumed a block of memory

        if (r_ppfifo_count > 0) begin
          //Flush the FIFO
          r_ppfifo_count  <=  0;
          o_ppfifo_act    <=  0;
        end
        state             <=  GET_MEMORY_BLOCK;
      end
    endcase
  end

  //Reset the pointers
  if (i_memory_0_new_data) begin
    r_mem_ptr[0]          <=  0;
  end
  if (i_memory_1_new_data) begin
    r_mem_ptr[1]          <=  0;
  end
end

//Bank Select and Memory Ready
always @ (posedge clk) begin
  if (rst) begin
    r_active_bank       <=  0;
    r_memory_ready      <=  0;
  end
  else begin
    //Activate Memory Logic
    if (!r_memory_ready) begin
      //If there is any data at all in the memory blocks
      if (r_mem_count[0] > 0) begin
        r_memory_ready  <=  1;
        r_active_bank   <=  0;
      end
      else if (r_mem_count[1] > 0) begin
        r_memory_ready  <=  1;
        r_active_bank   <=  1;
      end
    end
    else begin
      //If we're currently active and the active block is empty
      //disable the block
      if ((r_active_bank == 0) && (r_mem_count[0] == 0) && (!o_ppfifo_stb)) begin
        r_memory_ready     <=  0;
      end
      else if ((r_active_bank == 1) && (r_mem_count[1] == 0) && (!o_ppfifo_stb)) begin
        r_memory_ready     <=  0;
      end
    end
  end
end


//Simulation information
always @ (posedge clk) begin
  if (o_ppfifo_stb) begin
    `ifdef VERBOSE: $display ("\twb_mem_2_ppfifo: Wrote: %h: Write Count: %h", o_ppfifo_data, r_ppfifo_count); `endif
  end
end



endmodule

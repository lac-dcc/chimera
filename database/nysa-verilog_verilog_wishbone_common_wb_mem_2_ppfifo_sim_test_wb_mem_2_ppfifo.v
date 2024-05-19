// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module test_wb_mem_2_ppfifo (

  input               clk,
  input               rst,

  //wishbone slave signals
  input               i_wbs_we,
  input               i_wbs_stb,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_adr,
  input       [31:0]  i_wbs_dat,
  output reg  [31:0]  o_wbs_dat,
  output reg          o_wbs_ack,
  output reg          o_wbs_int,

  //master control signal for memory arbitration
  output              o_mem_we,
  output              o_mem_stb,
  output              o_mem_cyc,
  output      [3:0]   o_mem_sel,
  output      [31:0]  o_mem_adr,
  output      [31:0]  o_mem_dat,
  input       [31:0]  i_mem_dat,
  input               i_mem_ack,
  input               i_mem_int
);

//Local Parameters
localparam           REG_CONTROL        = 32'h00000000;
localparam           REG_STATUS         = 32'h00000001;
localparam           REG_MEM_0_BASE     = 32'h00000002;
localparam           REG_MEM_0_SIZE     = 32'h00000003;
localparam           REG_MEM_1_BASE     = 32'h00000004;
localparam           REG_MEM_1_SIZE     = 32'h00000005;
localparam           CLOCK_DIVISOR      = 32'h00000006;

//Wires/Registers
reg                   r_enable;


reg         [31:0]  r_memory_0_base;
reg         [31:0]  r_memory_0_size;
wire        [31:0]  w_memory_0_count;
reg                 r_memory_0_new_data;
wire                w_memory_0_empty;

wire        [31:0]  w_default_mem_0_base;

reg         [31:0]  r_memory_1_base;
reg         [31:0]  r_memory_1_size;
wire        [31:0]  w_memory_1_count;
reg                 r_memory_1_new_data;
wire                w_memory_1_empty;

wire        [31:0]  w_default_mem_1_base;

wire                w_read_finished;

//Ping Pong FIFO Write Side
wire        [23:0]  w_wfifo_size;
wire        [1:0]   w_wfifo_ready;
wire        [1:0]   w_wfifo_activate;
wire                w_wfifo_strobe;
wire        [31:0]  w_wfifo_data;

wire        [23:0]  w_rfifo_size;
wire                w_rfifo_ready;
reg                 r_rfifo_activate;
reg                 r_rfifo_strobe;
wire        [31:0]  w_rfifo_data;
reg         [31:0]  r_clock_divisor = 0;
reg         [31:0]  r_clock_count;
reg                 dclock;
reg                 r_dclock;

reg         [23:0]  r_rfifo_count;

//Submodules
wb_mem_2_ppfifo m2p(

  .clk                  (clk                      ),
  .rst                  (rst                      ),

  //Control
  .i_enable             (r_enable                 ),

  .i_memory_0_base      (r_memory_0_base          ),
  .i_memory_0_size      (r_memory_0_size          ),
  .o_memory_0_count     (w_memory_0_count         ),
  .i_memory_0_new_data  (r_memory_0_new_data      ),
  .o_memory_0_empty     (w_memory_0_empty         ),

  .o_default_mem_0_base (w_default_mem_0_base     ),

  .i_memory_1_base      (r_memory_1_base          ),
  .i_memory_1_size      (r_memory_1_size          ),
  .o_memory_1_count     (w_memory_1_count         ),
  .i_memory_1_new_data  (r_memory_1_new_data      ),
  .o_memory_1_empty     (w_memory_1_empty         ),

  .o_default_mem_1_base (w_default_mem_1_base     ),

  .o_read_finished      (w_read_finished          ),

  //master control signal for memory arbitration
  .o_mem_we             (o_mem_we                 ),
  .o_mem_stb            (o_mem_stb                ),
  .o_mem_cyc            (o_mem_cyc                ),
  .o_mem_sel            (o_mem_sel                ),
  .o_mem_adr            (o_mem_adr                ),
  .o_mem_dat            (o_mem_dat                ),
  .i_mem_dat            (i_mem_dat                ),
  .i_mem_ack            (i_mem_ack                ),
  .i_mem_int            (i_mem_int                ),

  //Ping Pong FIFO Interface
  .i_ppfifo_rdy         (w_wfifo_ready            ),
  .o_ppfifo_act         (w_wfifo_activate         ),
  .i_ppfifo_size        (w_wfifo_size             ),
  .o_ppfifo_stb         (w_wfifo_strobe           ),
  .o_ppfifo_data        (w_wfifo_data             )
);


ppfifo #(
  .DATA_WIDTH           (32                       ), //Size will always be 32 bits for mem
  .ADDRESS_WIDTH        (2                        )  //Really small ping pong FIFO (only 4 items)
) ping_pong (
  .reset                (rst                      ),

  //write
  .write_clock          (clk                      ),
  .write_ready          (w_wfifo_ready            ),
  .write_activate       (w_wfifo_activate         ),
  .write_fifo_size      (w_wfifo_size             ),
  .write_strobe         (w_wfifo_strobe           ),
  .write_data           (w_wfifo_data             ),

  //read
  .read_clock           (dclock                   ),
  .read_strobe          (r_rfifo_strobe           ),
  .read_ready           (w_rfifo_ready            ),
  .read_activate        (r_rfifo_activate         ),
  .read_count           (w_rfifo_size             ),
  .read_data            (w_rfifo_data             )
);



//Asynchronous Logic
//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat       <=  32'h0;
    o_wbs_ack       <=  0;
    r_enable        <=  0;
    r_clock_divisor <=  0;

    //Default base, user can change this from the API
    r_memory_0_base <=  w_default_mem_0_base;
    r_memory_1_base <=  w_default_mem_1_base;

    //Nothing in the memory initially
    r_memory_0_size <=  0;
    r_memory_1_size <=  0;

    r_memory_0_new_data <=  0;
    r_memory_1_new_data <=  0;
  end
  else begin
    r_memory_0_new_data <=  0;
    r_memory_1_new_data <=  0;
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack & ~ i_wbs_stb)begin
      o_wbs_ack <= 0;
    end
    if (i_wbs_stb & i_wbs_cyc) begin
      //master is requesting somethign
      if (i_wbs_we) begin
        //write request
        case (i_wbs_adr)
          REG_CONTROL: begin
            r_enable              <=  i_wbs_dat[0];
          end
          REG_STATUS: begin
          end
          REG_MEM_0_BASE: begin
            r_memory_0_base       <=  i_wbs_dat;
          end
          REG_MEM_0_SIZE: begin
            r_memory_0_size       <=  i_wbs_dat;
            if (i_wbs_dat > 0) begin
              r_memory_0_new_data <=  1;
            end
          end
          REG_MEM_1_BASE: begin
            r_memory_1_base       <=  i_wbs_dat;
          end
          REG_MEM_1_SIZE: begin
            r_memory_1_size       <=  i_wbs_dat;
            if (i_wbs_dat > 0) begin
              r_memory_1_new_data <=  1;
            end
          end
          CLOCK_DIVISOR: begin
            r_clock_divisor       <=  i_wbs_dat;
          end
          default: begin
          end
        endcase
      end
      else begin
        //Reading
        case (i_wbs_adr)
          REG_CONTROL: begin
            o_wbs_dat           <= {31'b0, r_enable};
          end
          REG_STATUS: begin
            //Indicates which memory bank is empty
            o_wbs_dat           <=  {30'h00000000, w_memory_1_empty, w_memory_0_empty};
          end
          REG_MEM_0_BASE: begin
            o_wbs_dat <=  r_memory_0_base;
          end
          REG_MEM_0_SIZE: begin
            o_wbs_dat <=  w_memory_0_count;
          end
          REG_MEM_1_BASE: begin
            o_wbs_dat <=  r_memory_1_base;
          end
          REG_MEM_1_SIZE: begin
            o_wbs_dat <=  w_memory_1_count;
          end
          CLOCK_DIVISOR: begin
            o_wbs_dat <=  r_clock_divisor;
          end
          default: begin
            o_wbs_dat <=  32'h00;
          end
        endcase
      end
      o_wbs_ack <= 1;
    end
  end
end

always @ (clk) begin
  if (r_clock_divisor == 0) begin
    dclock      = clk;
  end
  else begin
    if (r_clock_count == 0) begin
      dclock    = r_dclock;
    end
  end
end

always @ (posedge clk) begin
  if (rst) begin
    r_clock_count     <=  0;
    r_dclock          <=  0;
  end
  else begin
    if (r_clock_count < r_clock_divisor) begin
      r_clock_count   <=  r_clock_count + 1;
    end
    else begin
      r_clock_count   <=  0;
      r_dclock        <=  ~r_dclock;
    end
  end
end
//Drain the Ping Pong FIFO (The read clock can be different from the write
//clock, put this in any module you need to facilitate transfering data from
//Memory to your device with zero latency
always @ (posedge dclock) begin
  if (rst) begin
    r_rfifo_activate  <=  0;
    r_rfifo_strobe    <=  0;
    r_rfifo_count     <=  0;
  end
  else begin
    //Deassert strobes
    r_rfifo_strobe    <=  0;

    if (w_rfifo_ready && !r_rfifo_activate) begin
      r_rfifo_count   <=  0;
      r_rfifo_activate<=  1;
    end
    else if (r_rfifo_activate) begin
      //A fifo is activated
      if (r_rfifo_count < w_rfifo_size) begin
        r_rfifo_count     <=  r_rfifo_count + 1;
        r_rfifo_strobe    <=  1;
        //$display ("Read: %h from Read FIFO", w_rfifo_data);
      end
      else begin
        //we ate all the data in the FIFO, release it
        r_rfifo_activate  <=  0;
      end
    end
  end
end

endmodule

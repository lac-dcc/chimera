//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: bu_write_addr_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module weight_buffer
# (
  parameter BU_PARALLELISM = 4,
  parameter WEIGHT_AXI_CHNL = 1,
  parameter DATA_WIDTH_BRAM  = 16,
  parameter DELAY_STAGE = 1,
  parameter DATA_WIDTH_AXI   = 256
)
(
  //////////////////clock & control signals/////////////////
  input wire                   clk,
  input wire                   rst_n, 
  input  wire  [16-1:0]        length,
  input wire                   butterfly_start,
  //////////////////Up data and signals/////////////
  input wire  [DATA_WIDTH_AXI*WEIGHT_AXI_CHNL-1:0]  up_dat, // assume ddr bandwidht for wights is 256*1, input buffer bandwidth is 128*32
  input wire                                   up_vld,
  output wire                                  up_rdy,

  //////////////////Up data and signals/////////////
  output wire  [(4*DATA_WIDTH_BRAM)*BU_PARALLELISM-1:0]  dn_dat, 
  output wire                                   dn_vld,
  input wire                                  dn_rdy
);
localparam num_rams = DATA_WIDTH_AXI/DATA_WIDTH_BRAM;
genvar i;

assign up_rdy = 1;
/////////////////////Timing//////////////////////////
reg  [16-1:0]                          length_r;
always @(posedge clk)
begin
    length_r <= length;
end
/////////////////////Timing//////////////////////////
reg                                    write_vld_A;
wire  [32-1:0]                         write_addr_As[num_rams-1 : 0];
reg  [32-1:0]                          write_addr_A;
reg  [DATA_WIDTH_BRAM*num_rams-1:0]    ram_up_dat_A;

reg                                    read_vld_A;
wire  [32-1:0]                         read_addr_As[num_rams-1 : 0];
reg  [32-1:0]                          read_addr_A;
wire                                   ram_dn_vld_A;
wire [DATA_WIDTH_BRAM*num_rams-1:0]    ram_dn_dat_A;                   


reg                                    write_vld_B;
wire  [32-1:0]                         write_addr_Bs[num_rams-1 : 0];
reg  [32-1:0]                          write_addr_B;
reg  [DATA_WIDTH_BRAM*num_rams-1:0]    ram_up_dat_B;

reg                                    read_vld_B;
wire  [32-1:0]                         read_addr_Bs[num_rams-1 : 0];
reg  [32-1:0]                          read_addr_B;
wire                                   ram_dn_vld_B;
wire [DATA_WIDTH_BRAM*num_rams-1:0]    ram_dn_dat_B;


reg [32-1:0]                           pingpong_write_counter;
reg                                    pingpong_write_flag; // Default to use bank A first

reg                                    butterfly_starts[DELAY_STAGE-1:0];


// LUT to get the total number of weight according to length
reg  [16-1:0]                          num_weights;
reg  [16-1:0]                          num_stage;

function integer clogb2;
    input [16-1:0] value;
    integer n;
    begin
        clogb2 = 0;
        for(n = 0; 2**n < value; n = n + 1)
        clogb2 = n + 1;
    end
endfunction


always@(length_r)
begin
    num_stage = clogb2(length_r);
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
  num_weights <= 0;
end
else begin
  num_weights <= num_stage*2*length_r;
end

////////////////////////////////
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
  butterfly_starts[0] <= 0;
end
else begin
  butterfly_starts[0] <= butterfly_start;
end

generate
for(i=1 ; i<DELAY_STAGE ; i=i+1)
begin : ASSIGN_START_DELAY
  always @(posedge clk or negedge rst_n)
  if(!rst_n) begin
    butterfly_starts[i] <= 0;
  end
  else begin
    butterfly_starts[i] <= butterfly_starts[i-1];
  end
end
endgenerate

// =========================================================================== //
// Generate Bank flag
// =========================================================================== //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
  pingpong_write_counter <= 0;
  pingpong_write_flag <=1'b0;
end
else begin
  if (up_vld) begin
    if (pingpong_write_counter == num_weights-num_rams) pingpong_write_flag <= !pingpong_write_flag;
    else pingpong_write_counter <= pingpong_write_counter + num_rams;
  end
  else begin
    pingpong_write_counter <= pingpong_write_counter;
    pingpong_write_flag <=pingpong_write_flag;
  end
end

// =========================================================================== //
// Generate write address and data
// =========================================================================== //

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
  write_vld_A <= 1'b0;
  ram_up_dat_A <= 0;
  write_addr_A <= 0;
  write_vld_B <= 1'b0;
  ram_up_dat_B <= 0;
  write_addr_B <= 0;
end
else begin
  if (up_vld) begin
    if (pingpong_write_flag) begin
      write_vld_A <= 1'b0;
      ram_up_dat_A <= 0;
      write_addr_A <= 0;

      write_vld_B <= 1'b1;
      ram_up_dat_B <= up_dat;
      write_addr_B <= write_addr_B + 1;
    end
    else begin
      write_vld_A <= 1'b1;
      ram_up_dat_A <= up_dat;
      write_addr_A <= write_addr_A + 1;

      write_vld_B <= 1'b0;
      ram_up_dat_B <= 0;
      write_addr_B <= 0;
    end
  end
  else begin
    write_vld_A <= 1'b0;
    write_vld_B <= 1'b0;
  end
end

// =========================================================================== //
// Instantiate Pingpong rams
// =========================================================================== //

pingpong_ram_2d # (
 .num_rams(num_rams),
 .w(DATA_WIDTH_BRAM),
 .d(1024)
)u_pingpong_ram_2d
(
  .clk(clk),  // common clock for read/write access
  .rst_n(rst_n),
  .we_A(write_vld_A),   // active high write enable
  .write_addr_A({num_rams{write_addr_A}}),   // write address
  .din_A(ram_up_dat_A),    // data in

  .re_A(read_vld_A),   // active high read enable
  .read_addr_A({num_rams{read_addr_A}}),   // read address
  .read_addr_r_A(),
  .dout_vld_A(ram_dn_vld_A),
  .dout_A(ram_dn_dat_A),     // data out

  .we_B(write_vld_B),   // active high write enable
  .write_addr_B({num_rams{write_addr_B}}),   // write address
  .din_B(ram_up_dat_B),    // data in

  .re_B(read_vld_B),   // active high read enable
  .read_addr_B({num_rams{read_addr_B}}),   // read address
  .read_addr_r_B(),
  .dout_vld_B(ram_dn_vld_B),
  .dout_B(ram_dn_dat_B)     // data out
); // ram_simple_dual


// =========================================================================== //
// Generate read address and data
// =========================================================================== //

reg [32-1:0]                           pingpong_read_counter;
reg                                    pingpong_read_flag; // Default to use bank A first
reg [32-1:0]                           stage;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
  pingpong_read_counter <= 0;
  pingpong_read_flag <=1'b0;
  stage <= 0;
end
else begin
  if (butterfly_starts[DELAY_STAGE-1]) stage <= length_r>>1; 
  else if ((stage != 0) && (ram_dn_vld_B || ram_dn_vld_A)) begin
    if (pingpong_read_counter == (2*length_r)-4*BU_PARALLELISM) begin
      stage <= stage >> 1;
      pingpong_read_counter <= 0;
      if (stage == 1) begin 
        pingpong_read_flag <= !pingpong_read_flag;
      end
    end
    else pingpong_read_counter <= pingpong_read_counter + 4*BU_PARALLELISM;
  end
  else begin
    pingpong_read_counter <= pingpong_read_counter;
    pingpong_read_flag <=pingpong_read_flag;
  end
end


always @(posedge clk or negedge rst_n)
if(!rst_n) begin
  read_vld_A <= 1'b0;
  read_addr_A <= 0;
  read_vld_B <= 1'b0;
  read_addr_B <= 0;
end
else begin
  if (stage != 0) begin
    if (pingpong_read_flag) begin
      read_vld_A <= 1'b0;
      read_addr_A <= 0;

      read_vld_B <= 1'b1;
      read_addr_B <= read_addr_B + 1;
      //if (pingpong_read_counter == num_weights-num_rams) read_addr_B <= 0;
      //else read_addr_B <= read_addr_B + 1;
    end
    else begin
      read_vld_A <= 1'b1;
      read_addr_A <= read_addr_A + 1;
      //if (pingpong_read_counter == num_weights-num_rams) read_addr_A <= 0;
      //else read_addr_A <= read_addr_A + 1;

      read_vld_B <= 1'b0;
      read_addr_B <= 0;
    end
  end
  else begin
    read_vld_A <= 1'b0;
    read_vld_B <= 1'b0;
  end
end

reg  [(4*DATA_WIDTH_BRAM)*BU_PARALLELISM-1:0]  dn_dat_r; 
reg                                   dn_vld_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_vld_r <= 0;
end
else begin
    dn_vld_r <= pingpong_read_flag? ram_dn_vld_B : ram_dn_vld_A;
end

always @(posedge clk)
begin
    dn_dat_r <= pingpong_read_flag? ram_dn_dat_B : ram_dn_dat_A;
end

assign dn_vld = dn_vld_r;
assign dn_dat = dn_dat_r;

endmodule
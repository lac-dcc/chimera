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


module hbm_control
# (
  parameter ADDR_WIDTH   = 33
)
(
  //////////////////ddr clock/////////////////
  input wire                   clk,
  input  wire                   rst_n, 
  //////////////////paramters /////////////
  input  wire  [ADDR_WIDTH-1:0] params,
  input wire  [4-1:0]           input_param_id,
  input wire  [4-1:0]           weight_param_id,
  input wire  [3-1:0]           output_param_id,

  //////////////////control and data for input/////////////
  //read
  output  wire  [32-1:0]         input_read_ops,
  output  wire  [32-1:0]         input_read_stride,
  output  wire  [ADDR_WIDTH-1:0] input_read_init_addr,
  output  wire  [16-1:0]         input_read_mem_burst_size,
  //write
  output wire   [32-1:0]         input_write_ops,
  output wire   [32-1:0]         input_write_stride,
  output wire   [ADDR_WIDTH-1:0] input_write_init_addr,
  output wire   [16-1:0]         input_write_mem_burst_size,

  output wire                     is_fft,
  output wire    [32-1:0]         length,
  output wire                     is_bypass_p2s,

  //////////////////control and data for weightput/////////////
  //read
  output  wire  [32-1:0]         weight_read_ops,
  output  wire  [32-1:0]         weight_read_stride,
  output  wire  [ADDR_WIDTH-1:0] weight_read_init_addr,
  output  wire  [16-1:0]         weight_read_mem_burst_size,
  //write
  output wire   [32-1:0]         weight_write_ops,
  output wire   [32-1:0]         weight_write_stride,
  output wire   [ADDR_WIDTH-1:0] weight_write_init_addr,
  output wire   [16-1:0]         weight_write_mem_burst_size,


  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  output wire   [32-1:0]         output_write_ops,
  output wire   [32-1:0]         output_write_stride,
  output wire   [ADDR_WIDTH-1:0] output_write_init_addr,
  output wire   [16-1:0]         output_write_mem_burst_size
);

//////////////////control and data for input/////////////
//read
reg  [32-1:0]         input_read_ops_r;
reg  [32-1:0]         input_read_stride_r;
reg  [ADDR_WIDTH-1:0] input_read_init_addr_r;
reg  [16-1:0]         input_read_mem_burst_size_r;
//write
reg   [32-1:0]         input_write_ops_r;
reg   [32-1:0]         input_write_stride_r;
reg   [ADDR_WIDTH-1:0] input_write_init_addr_r;
reg   [16-1:0]         input_write_mem_burst_size_r;

//////////////////control and data for weightput/////////////
//read
reg  [32-1:0]         weight_read_ops_r;
reg  [32-1:0]         weight_read_stride_r;
reg  [ADDR_WIDTH-1:0] weight_read_init_addr_r;
reg  [16-1:0]         weight_read_mem_burst_size_r;
//write
reg   [32-1:0]         weight_write_ops_r;
reg   [32-1:0]         weight_write_stride_r;
reg   [ADDR_WIDTH-1:0] weight_write_init_addr_r;
reg   [16-1:0]         weight_write_mem_burst_size_r;


//////////////////control and data for output/////////////
//raed is not used for output buffer
//write
reg   [32-1:0]         output_write_ops_r;
reg   [32-1:0]         output_write_stride_r;
reg   [ADDR_WIDTH-1:0] output_write_init_addr_r;
reg   [16-1:0]         output_write_mem_burst_size_r;
reg                    is_fft_r;
reg   [32-1:0]         length_r;
reg                    is_bypass_p2s_r;

//////////////////FSM for input read/write signals/////////////
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    input_read_ops_r <= 0;
    input_read_stride_r <= 0;
    input_read_init_addr_r <= 0;
    input_read_mem_burst_size_r <= 0;
    input_write_ops_r <= 0;
    input_write_stride_r <= 0;
    input_write_init_addr_r <= 0;
    input_write_mem_burst_size_r <= 0;
    is_fft_r <= 0;
    length_r <= 0;
    is_bypass_p2s_r <= 0;
end
else begin
    case (input_param_id)
        4'b0001: begin
            input_read_ops_r <= params[32-1:0];
        end
        4'b0010: begin
            input_read_stride_r <= params[32-1:0];
        end
        4'b0011: begin
            input_read_init_addr_r <= params[ADDR_WIDTH-1:0];
        end
        4'b0100: begin
            input_read_mem_burst_size_r <= params[16-1:0];
        end
        4'b0101: begin
            input_write_ops_r <= params[32-1:0];
        end
        4'b0110: begin
            input_write_stride_r <= params[32-1:0];
        end
        4'b0111: begin
            input_write_init_addr_r <= params[ADDR_WIDTH-1:0];
        end
        4'b1000: begin
            input_write_mem_burst_size_r <= params[16-1:0];
        end
        4'b1001: begin
            is_fft_r <= params[0];
        end
        4'b1010: begin
            length_r <= params[32-1:0];
        end
        4'b1011: begin
            is_bypass_p2s_r <= params[0];
        end
        default begin
            input_read_ops_r <= input_read_ops_r;
            input_read_stride_r <= input_read_stride_r;
            input_read_init_addr_r <= input_read_init_addr_r ;
            input_read_mem_burst_size_r <= input_read_mem_burst_size_r;
            input_write_ops_r <= input_write_ops_r;
            input_write_stride_r <= input_write_stride_r;
            input_write_init_addr_r <= input_write_init_addr_r;
            input_write_mem_burst_size_r <= input_write_mem_burst_size_r;
            is_fft_r <= 0;
            length_r <= 0;
            is_bypass_p2s_r <= 0;
        end
    endcase
end

assign input_read_ops = input_read_ops_r;
assign input_read_stride = input_read_stride_r;
assign input_read_init_addr = input_read_init_addr_r;
assign input_read_mem_burst_size = input_read_mem_burst_size_r;
assign input_write_ops = input_write_ops_r;
assign input_write_stride = input_write_stride_r;
assign input_write_init_addr = input_write_init_addr_r;
assign input_write_mem_burst_size = input_write_mem_burst_size_r;
assign is_fft = is_fft_r;
assign length = length_r;
assign is_bypass_p2s = is_bypass_p2s_r;

//////////////////FSM for weight read/write signals/////////////
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    weight_read_ops_r <= 0;
    weight_read_stride_r <= 0;
    weight_read_init_addr_r <= 0;
    weight_read_mem_burst_size_r <= 0;
    weight_write_ops_r <= 0;
    weight_write_stride_r <= 0;
    weight_write_init_addr_r <= 0;
    weight_write_mem_burst_size_r <= 0;
end
else begin
    case (weight_param_id)
        4'b0001: begin
            weight_read_ops_r <= params[32-1:0];
        end
        4'b0010: begin
            weight_read_stride_r <= params[32-1:0];
        end
        4'b0011: begin
            weight_read_init_addr_r <= params[ADDR_WIDTH-1:0];
        end
        4'b0100: begin
            weight_read_mem_burst_size_r <= params[16-1:0];
        end
        4'b0101: begin
            weight_write_ops_r <= params[32-1:0];
        end
        4'b0110: begin
            weight_write_stride_r <= params[32-1:0];
        end
        4'b0111: begin
            weight_write_init_addr_r <= params[ADDR_WIDTH-1:0];
        end
        4'b1000: begin
            weight_write_mem_burst_size_r <= params[16-1:0];
        end
        default begin
            weight_read_ops_r <= weight_read_ops_r;
            weight_read_stride_r <= weight_read_stride_r;
            weight_read_init_addr_r <= weight_read_init_addr_r ;
            weight_read_mem_burst_size_r <= weight_read_mem_burst_size_r;
            weight_write_ops_r <= weight_write_ops_r;
            weight_write_stride_r <= weight_write_stride_r;
            weight_write_init_addr_r <= weight_write_init_addr_r;
            weight_write_mem_burst_size_r <= weight_write_mem_burst_size_r;
        end
    endcase
end

assign weight_read_ops = weight_read_ops_r;
assign weight_read_stride = weight_read_stride_r;
assign weight_read_init_addr = weight_read_init_addr_r;
assign weight_read_mem_burst_size = weight_read_mem_burst_size_r;
assign weight_write_ops = weight_write_ops_r;
assign weight_write_stride = weight_write_stride_r;
assign weight_write_init_addr = weight_write_init_addr_r;
assign weight_write_mem_burst_size = weight_write_mem_burst_size_r;


//////////////////FSM for output read/write signals/////////////
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    output_write_ops_r <= 0;
    output_write_stride_r <= 0;
    output_write_init_addr_r <= 0;
    output_write_mem_burst_size_r <= 0;
end
else begin
    case (output_param_id)
        3'b001: begin
            output_write_ops_r <= params[32-1:0];
        end
        3'b010: begin
            output_write_stride_r <= params[32-1:0];
        end
        3'b011: begin
            output_write_init_addr_r <= params[ADDR_WIDTH-1:0];
        end
        3'b100: begin
            output_write_mem_burst_size_r <= params[16-1:0];
        end
        default begin
            output_write_ops_r <= output_write_ops_r;
            output_write_stride_r <= output_write_stride_r;
            output_write_init_addr_r <= output_write_init_addr_r;
            output_write_mem_burst_size_r <= output_write_mem_burst_size_r;
        end
    endcase
end

assign output_write_ops = output_write_ops_r;
assign output_write_stride = output_write_stride_r;
assign output_write_init_addr = output_write_init_addr_r;
assign output_write_mem_burst_size = output_write_mem_burst_size_r;


endmodule
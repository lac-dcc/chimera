
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: ram_2d
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


module pingpong_ram_2d
# (
  parameter num_rams = 8,
  parameter w = 128,
  parameter d = 128
)
(
  input                   clk,  // common clock for read/write access
  input                   rst_n,

  // control and data for port A
  input                   we_A,   // active high write enable
  input   [num_rams*32-1:0] write_addr_A,   // write address
  input   [num_rams*w-1:0]         din_A,    // data in
  input                   re_A,   // active high read enable
  input   [num_rams*32-1:0] read_addr_A,   // read address
  output   [num_rams*32-1:0] read_addr_r_A,   // read address
  output                   dout_vld_A,
  output  [num_rams*w-1:0]         dout_A,    // data out

  // control and data for port B
  input                   we_B,   // active high write enable
  input   [num_rams*32-1:0] write_addr_B,   // write address
  input   [num_rams*w-1:0]         din_B,    // data in

  input                   re_B,   // active high read enable
  input   [num_rams*32-1:0] read_addr_B,   // read address
  output   [num_rams*32-1:0] read_addr_r_B,   // read address
  output                   dout_vld_B,
  output  [num_rams*w-1:0]         dout_B     // data out


); // ram_simple_dual


// wire [w-1:0]         din_As[num_rams-1:0];
// wire [w-1:0]         din_Bs[num_rams-1:0];
// wire [num_rams*w-1:0]         din_A;
// wire [num_rams*w-1:0]         din_B;

// genvar i;

// generate
// for(i=0 ; i<num_rams ; i=i+1)
// begin : ASSIGN_SPLIT_DAT
//     assign din_As[i] = din[(2*w*i + w-1) : (2*w*i)];
//     assign din_Bs[i] = din[(2*w*i + 2*w-1) : (2*w*i + w)];
//     assign din_A[(w*i + w-1) : (w*i)] = din_As[i];
//     assign din_B[(w*i + w-1) : (w*i)] = din_Bs[i];
// end
// endgenerate

ram_2d # (
 .num_rams(num_rams),
 .w(w),
 .d(d)
)u_ram_2d_A
(
  .clk(clk),  // common clock for read/write access
  .rst_n(rst_n),
  .we(we_A),   // active high write enable
  .write_addr(write_addr_A),   // write address
  .din(din_A),    // data in

  .re(re_A),   // active high read enable
  .read_addr(read_addr_A),   // read address
  .read_addr_r(read_addr_r_A),
  .dout_vld(dout_vld_A),
  .dout(dout_A)     // data out
); // ram_simple_dual


ram_2d # (
 .num_rams(num_rams),
 .w(w),
 .d(d)
)u_ram_2d_B
(
  .clk(clk),  // common clock for read/write access
  .rst_n(rst_n),
  .we(we_B),   // active high write enable
  .write_addr(write_addr_B),   // write address
  .din(din_B),    // data in

  .re(re_B),   // active high read enable
  .read_addr(read_addr_B),   // read address
  .read_addr_r(read_addr_r_B),
  .dout_vld(dout_vld_B),
  .dout(dout_B)     // data out
); // ram_simple_dual

endmodule

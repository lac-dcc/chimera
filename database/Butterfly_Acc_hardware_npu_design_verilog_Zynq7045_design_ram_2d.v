
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


module ram_2d
# (
  parameter num_rams = 8,
  parameter w = 128,
  parameter d = 128
)
(
  input                   clk,  // common clock for read/write access
  input                   rst_n,
  input                   we,   // active high write enable
  input   [num_rams*32-1:0] write_addr,   // write address
  input   [num_rams*w-1:0]         din,    // data in

  input                   re,   // active high read enable
  input   [num_rams*32-1:0] read_addr,   // read address
  output   [num_rams*32-1:0] read_addr_r,   // read address
  output                   dout_vld,
  output  [num_rams*w-1:0]         dout     // data out
); // ram_simple_dual


genvar i;

wire [32-1:0]           write_addrs[num_rams-1:0];
wire [w-1:0]           dins[num_rams-1:0];

wire [32-1:0]           read_addrs[num_rams-1:0];
reg [32-1:0]           read_addrs_r[num_rams-1:0];
wire [w-1:0]           douts[num_rams-1:0];
wire                   douts_vld[num_rams-1:0];

assign dout_vld = douts_vld[0];

generate
for(i=0 ; i<num_rams ; i=i+1)
begin : GENERATE_WIRING
    assign write_addrs[i] = write_addr[( 32*i + 32-1) : (32*i)];
    assign dins[i] = din[( w*i + w-1) : (w*i)];
    assign read_addrs[i] = read_addr[( 32*i + 32-1) : (32*i)];
    assign read_addr_r[( 32*i + 32-1) : (32*i)] = read_addrs_r[i];
    assign dout[( w*i + w-1) : (w*i)] = douts[i]; 
end

for(i=0 ; i<num_rams ; i=i+1)
begin : GENERATE_DELAY_ADDR
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        read_addrs_r[i] <= 1'b0;
    end
    else begin
        read_addrs_r[i] <= read_addrs[i];
    end
end


for(i=0 ; i<num_rams ; i=i+1)
begin : GENERATE_RAMS
    ram_simple_dual# (
      .w(w),
      .d(d)
    ) u_ram_simple_dual
    (
      .clk(clk),  // common clock for read/write access
      .rst_n(rst_n),
      .we(we),   // active high write enable
      .write_addr(write_addrs[i]),   // write address
      .din(dins[i]),    // data in
    
      .re(re),   // active high read enable
      .read_addr(read_addrs[i]),   // read address
      .dout_vld(douts_vld[i]),
      .dout(douts[i])     // data out
    ); // ram_simple_dual
end
endgenerate

endmodule

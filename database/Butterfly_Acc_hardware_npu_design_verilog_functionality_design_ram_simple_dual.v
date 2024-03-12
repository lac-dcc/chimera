//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: react_top
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


module ram_simple_dual
# (
  parameter w = 128,
  parameter d = 128
)
(
  input                   clk,  // common clock for read/write access
  input                   rst_n,
  input                   we,   // active high write enable
  // input   [$clog2(d)-1:0] write_addr, 
  input   [32-1:0] write_addr, 
  input   [w-1:0]         din,    // data in

  input                   re,   // active high read enable
  input   [32-1:0] read_addr,   // read address
  output                   dout_vld,
  output  [w-1:0]         dout     // data out
); // ram_simple_dual

reg                 dout_vld_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dout_vld_r <= 1'b0;
end
else begin
    dout_vld_r <= re;
end

assign dout_vld = dout_vld_r;

  // get output
  generate
    /*
    if(w == 128 && d == 128)  
    begin
        ram_naive_128_128_1r1w u_ram_naive_128_128_1r1w (
        .clka(clk),    // input wire clka
        .ena(we),      // input wire ena // use as write port
        .wea(we),      // input wire [0 : 0] wea
        .addra(write_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addra
        .dina(din),    // input wire [127 : 0] dina
        .clkb(clk),    // input wire clkb
        .enb(re),      // input wire enb
        .addrb(read_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addrb
        .doutb(dout)  // output wire [127 : 0] doutb
        );
    end
    else if(w == 16 && d == 4096)  
    begin
        ram_naive_16_4096_1r1w u_ram_naive_16_4096_1r1w (
        .clka(clk),    // input wire clka
        .ena(we),      // input wire ena // use as write port
        .wea(we),      // input wire [0 : 0] wea
        .addra(write_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addra
        .dina(din),    // input wire [127 : 0] dina
        .clkb(clk),    // input wire clkb
        .enb(re),      // input wire enb
        .addrb(read_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addrb
        .doutb(dout)  // output wire [127 : 0] doutb
        );
    end
    */
    if(w == 16 && d == 512)  
    begin
        ram_naive_16_512_1r1w u_ram_naive_16_512_1r1w (
        .clka(clk),    // input wire clka
        .ena(we),      // input wire ena // use as write port
        .wea(we),      // input wire [0 : 0] wea
        .addra(write_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addra
        .dina(din),    // input wire [127 : 0] dina
        .clkb(clk),    // input wire clkb
        .enb(re),      // input wire enb
        .addrb(read_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addrb
        .doutb(dout)  // output wire [127 : 0] doutb
        );
    end
    else if(w == 16 && d == 1024)  
    begin
        ram_naive_16_1024_1r1w u_ram_naive_16_1024_1r1w (
        .clka(clk),    // input wire clka
        .ena(we),      // input wire ena // use as write port
        .wea(we),      // input wire [0 : 0] wea
        .addra(write_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addra
        .dina(din),    // input wire [127 : 0] dina
        .clkb(clk),    // input wire clkb
        .enb(re),      // input wire enb
        .addrb(read_addr[$clog2(d)-1:0]),  // input wire [6 : 0] addrb
        .doutb(dout)  // output wire [127 : 0] doutb
        );
    end
    // else if (WIDTH_A == 17) begin
    //    addsub_17b u_adder (
    //     .A(A_dat),      // input wire [15 : 0] A
    //     .B(B_dat),      // input wire [15 : 0] B
    //     .CLK(clk),  // input wire CLK
    //     .S(S_dat)      // output wire [16 : 0] S
    //   );
    // end
  endgenerate 


endmodule // ram_simple_dual
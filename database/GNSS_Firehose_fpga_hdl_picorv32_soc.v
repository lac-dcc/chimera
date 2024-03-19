module picorv32_soc(
  input clk,
  input reset,
  output [7:0] port_id,
  output write_strobe,
  output [7:0] out_port,
  output read_strobe,
  input [7:0] in_port
);

  wire trap;
  wire mem_valid;
  wire mem_instr;
  reg mem_ready;
  wire [31:0] mem_addr;
  wire [31:0] mem_wdata;
  wire [3:0] mem_wstrb;
  wire [31:0] mem_rdata;
  
  picorv32 #(.ENABLE_REGS_DUALPORT(0)) _picorv32(
    .clk(clk),
    .resetn(~reset),
    .trap(trap),
    .mem_valid(mem_valid),
    .mem_instr(mem_instr),
    .mem_ready(mem_ready),
    .mem_addr(mem_addr),
    .mem_wdata(mem_wdata),
    .mem_wstrb(mem_wstrb),
    .mem_rdata(mem_rdata)
  );

  assign port_id = mem_addr[9:2];
  assign write_strobe = mem_valid && mem_addr[31] && mem_wstrb[0];
  assign out_port = mem_wdata[7:0];
  assign read_strobe = mem_valid && mem_addr[31] && !mem_wstrb[0];

  wire [31:0] ram_rdata;
  wire [31:0] io_rdata;
  reg [31:0] mem_addr1;
  reg [7:0] in_port1;

  always @(posedge clk) begin
    mem_ready <= mem_valid;
    mem_addr1 <= mem_addr;
    in_port1 <= in_port;
  end

  ram_2k_32 _ram_2k_32(clk, mem_addr[12:2], mem_wdata, ram_rdata, mem_wstrb, mem_valid && !mem_addr[31]);

  assign mem_rdata = mem_addr1[31] ? {24'd0,in_port1} : ram_rdata;

endmodule

module ram_2k_32(
  input clk,
  input [10:0] addr,
  input [31:0] din,
  output [31:0] dout,
  input [3:0] we,
  input en
);

  bram_2k_8 _bram0(clk, addr, din[7:0], dout[7:0], we[0], en);
  bram_2k_8 _bram1(clk, addr, din[15:8], dout[15:8], we[1], en);
  bram_2k_8 _bram2(clk, addr, din[23:16], dout[23:16], we[2], en);
  bram_2k_8 _bram3(clk, addr, din[31:24], dout[31:24], we[3], en);

endmodule

module bram_2k_8(
  input clk,
  input [10:0] addr,
  input [7:0] din,
  output [7:0] dout,
  input we,
  input en
);

  reg [7:0] mem[0:2047];
  reg [10:0] addr1;

  always @(posedge clk)
    if (en) begin
      addr1 <= addr;
      if (we)
        mem[addr] <= din;
    end      

  assign dout = mem[addr1];

endmodule

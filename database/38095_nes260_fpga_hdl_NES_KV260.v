// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 100ps
//
// NES top level for KV260
//

// Memory layout, 0 - 40_0000, total 4MB
// $00_0000  - PRG ROM
// $20_0000  - CHR ROM

// Define this to enable static embedded game data (Battle City)
//`define EMBED_GAME

// Module reads bytes and writes to proper address in ram.
// Done is asserted when the whole game is loaded.
// This parses iNES headers too.
module GameLoader(input clk, input reset,
                  input [7:0] indata, input indata_clk,
                  output reg [21:0] mem_addr, output [7:0] mem_data, output mem_write,
                  output [31:0] mapper_flags,
                  output reg done,
                  output error);

  reg [2:0] state = 0;
  reg [7:0] prgsize;
  reg [3:0] ctr;
  reg [7:0] ines[0:15]; // 16 bytes of iNES header
  reg [21:0] bytes_left;
  
  assign error = (state == 5);
  wire [7:0] prgrom = ines[4];
  wire [7:0] chrrom = ines[5];
  assign mem_data = (state == 3 || state == 4) ? 8'b0000_0000 : indata;
  // state 3 and 4 is Internal RAM & VRAM initialization
  assign mem_write = !done && (bytes_left != 0) && 
                    ((state == 1 || state == 2) && indata_clk || state == 3 || state == 4);
  
  wire [2:0] prg_size = prgrom <= 1  ? 0 :
                        prgrom <= 2  ? 1 : 
                        prgrom <= 4  ? 2 : 
                        prgrom <= 8  ? 3 : 
                        prgrom <= 16 ? 4 : 
                        prgrom <= 32 ? 5 : 
                        prgrom <= 64 ? 6 : 7;
                        
  wire [2:0] chr_size = chrrom <= 1  ? 0 : 
                        chrrom <= 2  ? 1 : 
                        chrrom <= 4  ? 2 : 
                        chrrom <= 8  ? 3 : 
                        chrrom <= 16 ? 4 : 
                        chrrom <= 32 ? 5 : 
                        chrrom <= 64 ? 6 : 7;
  
  wire [7:0] mapper = {ines[7][7:4], ines[6][7:4]};
  wire has_chr_ram = (chrrom == 0);
  assign mapper_flags = {16'b0, has_chr_ram, ines[6][0], chr_size, prg_size, mapper};
  always @(posedge clk) begin
    if (reset) begin
      state <= 0;
      done <= 0;
      ctr <= 0;
      mem_addr <= 0;  // Address for PRG
    end else begin
      case(state)
      // Read 16 bytes of ines header
      0: if (indata_clk) begin
           ctr <= ctr + 1;
           ines[ctr] <= indata;
           bytes_left <= {prgrom, 14'b0};
           if (ctr == 4'b1111)
             state <= (ines[0] == 8'h4E) && (ines[1] == 8'h45) && (ines[2] == 8'h53) && (ines[3] == 8'h1A) && !ines[6][2] && !ines[6][3] ? 1 : 5;
         end
      1, 2, 3, 4: begin // Read the next |bytes_left| bytes into |mem_addr|
          if (bytes_left != 1) begin
            if (indata_clk || state == 3 || state == 4) begin
              bytes_left <= bytes_left - 1;
              mem_addr <= mem_addr + 1;
            end
          // below are last byte for each segment 
          end else if (indata_clk && state == 1) begin
            state <= 2;
            mem_addr <= 22'b10_0000_0000_0000_0000_0000;
            bytes_left <= {1'b0, chrrom, 13'b0};      // Each chrrom is 8KB
          end else if (indata_clk && state == 2) begin
            state <= 3;
            mem_addr <= 22'b11_1000_0000_0000_0000_0000;    // Clear internal RAM: 2KB
            bytes_left <= 2048;
          end else if (state == 3) begin        // We do not need indata_clk. We are just initializing VRAM.
            state <= 4;
            mem_addr <= 22'b11_0000_0000_0000_0000_0000;     // Clear VRAM: 2KB
            bytes_left <= 2048;
          end else if (state == 4) begin
            done <= 1;                          // Starting the NES machine.
          end
        end
      endcase
    end
  end
endmodule

`ifdef EMBED_GAME
// zf: Feed INES data to Game_Loader
module GameData (input clk, input reset,
    output reg [7:0] odata, output reg odata_clk
    );

    // 32KB buffer for ROM
    reg [7:0] INES[32*1024-1:0];
    reg [21:0] INES_SIZE = 24719; 
    initial $readmemh("BattleCity.nes.hex", INES);

    reg [1:0] state = 0;
    reg [21:0] addr = 0;
    reg out_clk = 0;

    always @(posedge clk) begin
        if (reset) begin
            state <= 1;
            addr <= 0;  // odata gets INES[0]
            odata_clk <= 0;
        end else if (state==1) begin
            if (addr == INES_SIZE) begin
                // we've just sent the last byte
                state <= 2;     // end of data
                odata_clk <= 0;
            end else begin
                // pump data to Game_Loader
                odata <= INES[addr];
                odata_clk <= 1;
                addr <= addr + 1;
            end
        end
    end
endmodule
`endif

// 2M+256K memory backed by UltraRAM
// $00_0000 - $0f_ffff: PRG ROM 1MB
// $10_0000 - $1f_ffff: Hole, write has no effect, reads garbage
// $20_0000 - $2f_ffff: CHR ROM 1MB
// $30_0000 - $37_ffff: Hole, write has no effect, reads garbage
// $38_0000 - $38_07ff: Internal RAM (2KB), and 126KB unused
// $3a_0000 - $3b_ffff: Hole
// $3c_0000 - $3d_ffff: PRG RAM 128KB
// $3e_0000 - $3f_ffff: Hole
module MemoryController(
    input clk,
    input read_a,             // Set to 1 to read from RAM
    input read_b,             // Set to 1 to read from RAM
    input write,              // Set to 1 to write to RAM
    input [21:0] addr,        // Address to read / write
    input [7:0] din,          // Data to write
    output reg [7:0] dout_a,  // Last read data a, available 2 cycles after read_a is set
    output reg [7:0] dout_b,  // Last read data b, available 2 cycles after read_b is set
    output reg busy           // 1 while an operation is in progress
);

// UltraRAM layout:
// 256K words, every word is 9 bytes (72 bits)
//         71:64             63:0
//    0 +------------+------------------+
//      |  PRG RAM   |      PRG ROM     |
// 128K +------------+------------------+
//      |Internal RAM|      CHR ROM     |
//      |    VRAM    |                  |
// 256K +------------+------------------+
// 2M+256K RAM buffer to hold everything
wire is_internal_ram = addr[21:16] == 'b11_1000; // 'h38_0000 - 'h38_ffff (64K), actually only uses lower 2KB
wire is_vram = addr[21:16] == 'b11_0000;         // 'h30_0000 - 'h30_ffff (64K), actually only uses lower 2KB
wire is_prg_ram = addr[21:17] == 'b11_110;       // 'h3c_0000 - 'h3d_ffff, 128KB of address space is PRG RAM
wire is_hole = addr[21:20] == 'b01 || (addr[21:20] == 'b11 && !is_prg_ram && !is_internal_ram && !is_vram);   // memory hole
wire [17:0] ram_addr = is_prg_ram ? {'b0, addr[16:0]}:
                       is_internal_ram ? {'b10, addr[15:0]} :
                       is_vram ? {'b11, addr[15:0]} :
                       {addr[21], addr[19:3]};
wire [3:0] ram_offset = (is_vram || is_internal_ram || is_prg_ram) ? 'b1000 : {'b0, addr[2:0]};
wire [8:0] ram_we = is_hole ? 0 : framwe(ram_offset, write);
wire [71:0] edin= ram_offset == 0 ? din :
                  ram_offset == 1 ? din << 8 :
                  ram_offset == 2 ? din << 16 :
                  ram_offset == 3 ? din << 24 :
                  ram_offset == 4 ? {'h00_00_00_00, din, 'h00_00_00_00} :
                  ram_offset == 5 ? {'h00_00_00, din, 'h00_00_00_00_00} :
                  ram_offset == 6 ? {'h00_00, din, 'h00_00_00_00_00_00} :
                  ram_offset == 7 ? {'h00, din, 'h00_00_00_00_00_00_00} :
                  {din, 'h00_00_00_00_00_00_00_00};
wire [71:0] edout;

function [8:0] framwe(input [3:0] offset, input write);
    case(offset)
    0:  framwe = write ? 'b0_0000_0001 : 0;
    1:  framwe = write ? 'b0_0000_0010 : 0;
    2:  framwe = write ? 'b0_0000_0100 : 0;
    3:  framwe = write ? 'b0_0000_1000 : 0;
    4:  framwe = write ? 'b0_0001_0000 : 0;
    5:  framwe = write ? 'b0_0010_0000 : 0;
    6:  framwe = write ? 'b0_0100_0000 : 0;
    7:  framwe = write ? 'b0_1000_0000 : 0;
    default: framwe = write ? 'b1_0000_0000 : 0;
    endcase
endfunction

function [7:0] fdout(input [3:0] offset, input [71:0] edout);
    case(offset)
    0: fdout = edout[7:0];
    1: fdout = edout[15:8];
    2: fdout = edout[23:16];
    3: fdout = edout[31:24];
    4: fdout = edout[39:32];
    5: fdout = edout[47:40];
    6: fdout = edout[55:48];
    7: fdout = edout[63:56];
    default: fdout = edout[71:64];
    endcase
endfunction

bytewrite_ram_1b ram(clk, ram_we, ram_addr, edin, edout);     // UG901 byte write enabled block ram

reg r_read_a, r_read_b; // read_a/read_b delayed by 1
reg [3:0] r_ram_offset;

always @(posedge clk) begin
    busy <= 0;
    r_read_a <= read_a;
    r_read_b <= read_b;
    r_ram_offset <= ram_offset;
    if (r_read_a) begin
        dout_a <= fdout(r_ram_offset, edout);   // shift right by ram_offset*8
    end else if (r_read_b) begin
        dout_b <= fdout(r_ram_offset, edout);
    end
end

endmodule


module NES_KV260(
    // main clock 21.477272 MHz
    input clk,
    input reset,

    output clk_ppu,             // 1/4 of clk
    output [5:0] color,         // pixel color from PPU
    output [8:0] scanline,      // current scanline from PPU
    output [8:0] cycle,         // current cycle from PPU
    
    output [15:0] sample,        // audio sample

    // Ports of Axi Slave Bus Interface S00_AXI
    input wire  s00_axi_aclk,
    input wire  s00_axi_aresetn,
    input wire [3:0] s00_axi_awaddr,
    input wire [2:0] s00_axi_awprot,
    input wire  s00_axi_awvalid,
    output wire  s00_axi_awready,
    input wire [31:0] s00_axi_wdata,
    input wire [(32/8)-1 : 0] s00_axi_wstrb,
    input wire  s00_axi_wvalid,
    output wire  s00_axi_wready,
    output wire [1 : 0] s00_axi_bresp,
    output wire  s00_axi_bvalid,
    input wire  s00_axi_bready,
    input wire [3:0] s00_axi_araddr,
    input wire [2:0] s00_axi_arprot,
    input wire  s00_axi_arvalid,
    output wire  s00_axi_arready,
    output wire [31:0] s00_axi_rdata,
    output wire [1:0] s00_axi_rresp,
    output wire  s00_axi_rvalid,
    input wire  s00_axi_rready
);

  // internal wiring and state
  wire joypad_strobe;
  wire [1:0] joypad_clock;
  wire [21:0] memory_addr;      // 4MB address space
  wire memory_read_cpu, memory_read_ppu;
  wire memory_write;
  wire [7:0] memory_din_cpu, memory_din_ppu;
  wire [7:0] memory_dout;
  reg [7:0] joypad_bits, joypad_bits2;
  reg [1:0] last_joypad_clock;
  wire [31:0] dbgadr;
  wire [1:0] dbgctr;
  reg [1:0] nes_ce = 0;
  wire [15:0] SW = 16'b1111_1111_1111_1111;   // every switch is on

    // Instantiation of Axi Bus Interface S00_AXI
  nes_axi # ( 
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(4)
  ) axi (
    .value(axi_cmd),
    .result(axi_status),
    .S_AXI_ACLK(s00_axi_aclk),.S_AXI_ARESETN(s00_axi_aresetn),
    .S_AXI_AWADDR(s00_axi_awaddr),.S_AXI_AWPROT(s00_axi_awprot),.S_AXI_AWVALID(s00_axi_awvalid),.S_AXI_AWREADY(s00_axi_awready),
    .S_AXI_WDATA(s00_axi_wdata),.S_AXI_WSTRB(s00_axi_wstrb),.S_AXI_WVALID(s00_axi_wvalid),.S_AXI_WREADY(s00_axi_wready),
    .S_AXI_BRESP(s00_axi_bresp),.S_AXI_BVALID(s00_axi_bvalid),.S_AXI_BREADY(s00_axi_bready),
    .S_AXI_ARADDR(s00_axi_araddr),.S_AXI_ARPROT(s00_axi_arprot),.S_AXI_ARVALID(s00_axi_arvalid),.S_AXI_ARREADY(s00_axi_arready),
    .S_AXI_RDATA(s00_axi_rdata),.S_AXI_RRESP(s00_axi_rresp),.S_AXI_RVALID(s00_axi_rvalid),.S_AXI_RREADY(s00_axi_rready)
  );

  wire [31:0] axi_cmd;
  wire [31:0] axi_status;
  assign axi_status[0] = loader_done;
  assign axi_status[1] = loader_fail;
  assign axi_status[3:2] = axi_state;

  // Drive loader from AXI
  reg [1:0] axi_state = 0;     // 0: idle, 1: loader_expect_len, 2: loader_loading
  wire [7:0] wbyte = s00_axi_wdata[7:0];
  wire [31:0] wdata = s00_axi_wdata;

  reg  [7:0] loader_conf;     // bit 0 is reset
  reg [7:0] loader_btn, loader_btn_2;

`ifdef EMBED_GAME
  // Static compiled-in game data 
  wire [7:0] loader_input;
  wire loader_clk;
  wire loader_reset = reset;
  GameData ines(clk, reset, loader_input, loader_clk);
`else
  // Game data comes from AXI
  wire [7:0] loader_input = wbyte;
  wire       loader_clk   = (axi_state == 2) && s00_axi_aresetn == 1'b1 && axi.slv_reg_wren && s00_axi_awaddr == 4'b0;
  wire loader_reset = loader_conf[0];
`endif

  always @(posedge clk) begin
    if (joypad_strobe) begin
      joypad_bits <= loader_btn;
      joypad_bits2 <= loader_btn_2;
    end
    if (!joypad_clock[0] && last_joypad_clock[0])
      joypad_bits <= {1'b0, joypad_bits[7:1]};
    if (!joypad_clock[1] && last_joypad_clock[1])
      joypad_bits2 <= {1'b0, joypad_bits2[7:1]};
    last_joypad_clock <= joypad_clock;
  end

  // ROM loader
  wire [21:0] loader_addr;
  wire [7:0] loader_write_data;
  wire loader_write;
  wire [31:0] mapper_flags;
  wire loader_done, loader_fail;
  
  // Parses ROM data and store them for MemoryController to access
  GameLoader loader(clk, loader_reset, loader_input, loader_clk,
                    loader_addr, loader_write_data, loader_write,
                    mapper_flags, loader_done, loader_fail);

  // The NES machine
  wire reset_nes = !loader_done;
  wire run_mem = (nes_ce == 0) && !reset_nes;       // memory runs at clock cycle #0
  wire run_nes = (nes_ce == 3) && !reset_nes;       // nes runs at clock cycle #3
  assign clk_ppu = (nes_ce == 3 || nes_ce == 0);      // posedge @ nes_ce == 3

  // NES is clocked at every 4th cycle.
  always @(posedge clk)
    nes_ce <= nes_ce + 1;

  // Main NES machine
  NES nes(clk, reset_nes, run_nes,
          mapper_flags,
          sample, color,
          joypad_strobe, joypad_clock, {joypad_bits2[0], joypad_bits[0]},
          SW[4:0],
          memory_addr,
          memory_read_cpu, memory_din_cpu,
          memory_read_ppu, memory_din_ppu,
          memory_write, memory_dout,
          cycle, scanline,
          dbgadr,
          dbgctr);

  // Combine RAM and ROM data to a single address space for NES to access
  wire ram_busy;
  MemoryController memory(clk,
        memory_read_cpu && run_mem, 
        memory_read_ppu && run_mem,
        memory_write && run_mem || loader_write,
        loader_write ? loader_addr : memory_addr,
        loader_write ? loader_write_data : memory_dout,
        memory_din_cpu,
        memory_din_ppu,
        ram_busy);

  reg [31:0] loader_len = 0;
  reg [31:0] loader_count = 0;
  always @(posedge s00_axi_aclk) begin
    if (s00_axi_aresetn == 1'b1 && axi.slv_reg_wren && s00_axi_awaddr == 4'b0) begin
        case (axi_state)
            2'd0: if (wdata == 1) begin
                    // load ines
                    axi_state <= 1;
                    loader_conf <= 0;   // clear loader_reset
                end else if (wdata == 2) begin
                    // loader reset
                    loader_conf <= 1;   // start loader_reset
                end else if (wbyte == 3) begin
                    // controller update
                    // The bits are: 0 - A, 1 - B, 2 - Select, 3 - Start, 
                    //               4 - Up, 5 - Down, 6 - Left,7 - Right
                    loader_btn <= wdata[15:8];
                    loader_btn_2 <= wdata[23:16];
                end
            2'd1: begin
                loader_len <= wdata;
                loader_count <= 0;
                axi_state <= 2;
            end
            2'd2: begin
                // transfer one byte at a time
                if (loader_count == loader_len - 1) begin    // transfer done
                    axi_state <= 0;
                end
                loader_count <= loader_count + 1;
            end
            default: begin end
                // ignore data            
        endcase
    end
  end

endmodule
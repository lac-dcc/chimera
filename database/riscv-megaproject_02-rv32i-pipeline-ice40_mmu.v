// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 MMU with a bank of main memory and an IO port. The MMU is byte-addressable.
 Access latency is one clock.

 Memory Mapping:

 - 0x00000000 - 0x00000FFF ROM instruction memory
 - 0x10000000 - 0x7FFFFFFF Main memory
 - 0x80000000 - 0x800000FF I/O ports

 Exceptions are not generated from MMU

 Memory Bank Configuration: 4 interleaving banks of 8-bit wide SSP-BRAM

 Limitations: 
 - Data memory port cannot access instruction memory
 - Instruction memory port can only access instruction memory
 - Instruction memory is ROM

 */

module mmu(
           clk, resetb, dm_we,
           im_addr, im_do, dm_addr, dm_di, dm_do,
           dm_be, is_signed,
           // To Instruction Memory
           // im_addr_out, im_data,
           // im_addr_out_2, im_data_2,
           // TO IO
           io_addr, io_en, io_we, io_data_read, io_data_write
           );
   
   parameter 
     WORD_DEPTH = 65536,
     WORD_DEPTH_LOG = 16;

   localparam
     DEV_IM = 1,
     DEV_DM = 2,
     DEV_IO = 3,
     DEV_UNKN = 4;

   // Clock, reset, data memory write enable
   input wire clk, resetb, dm_we;
   // IM address, DM address, DM data in
   /* verilator lint_off UNUSED */
   input wire [31:0] im_addr, dm_addr, dm_di;
   /* verilator lint_on UNUSED */
   // DM data byte enable, non-encoded
   input wire [3:0]  dm_be;
   // DM sign extend or unsigned extend
   input wire 	     is_signed;
   // IM addr out to ROM
   // wire [13:2] im_addr_out, im_addr_out_2;
   // IM data from ROM, IO data from IO bank
   //input wire [31:0]  im_data, im_data_2;
   input wire [31:0] io_data_read;
   // IO data to IO bank, DM data output
   output reg [31:0]  io_data_write, dm_do;
   // A temporary register for dm_do
   reg [31:0] 	      dm_do_tmp;
   // IM data output
   output wire [31:0]  im_do;
   // IO address to IO bank
   output reg [7:0]   io_addr;
   // IO enable, IO write enable
   output reg 	      io_en, io_we;
   // Shift bytes and half words to correct bank
   reg [31:0] 	      dm_di_shift;
   // Address mapped to BRAM address
   reg [WORD_DEPTH_LOG-1:2] ram_addr;
   // BRAM write enable
   reg 			    ram_we;
   // BRAM data output
   wire [31:0] 		    ram_do;
   // BRAM data input
   reg [31:0] 		    ram_di;
   // Selected device
   /* verilator lint_off UNUSED */
   integer 		    chosen_device_tmp;
   /* verilator lint_on UNUSED */
   // Selected device, pipelined
   reg [2:0] 		    chosen_device_p;
   // DM byte enable, pipelined
   reg [3:0] 		    dm_be_p;
   // MMU signed/unsigned extend, pipelined
   reg 			    is_signed_p;
   // IM port 2 pipelined
   reg [31:0] 		    im_data_2_p;
   // IO Read input, IO read input pipelined, IO write output
   reg [31:0] 		    io_data_write_tmp;
   // IO address
   reg [7:0] 		    io_addr_tmp;
   // IO enable, IO write enable
   reg 			    io_en_tmp, io_we_tmp;

   // In this implementaion, the IM ROM address is simply the 13:2 bits of IM address input
   //assign im_addr_out[13:2] = im_addr[13:2];
   // Second port uses DM addr
   //assign im_addr_out_2[13:2] = dm_addr[13:2];

   // BRAM bank in interleaved configuration
   SPRAM_16Kx16 ram0 (
                       .clk(clk), .wren(ram_we), 
		       .maskwren({{2{dm_be[1]}},{2{dm_be[0]}}}), 
                       .addr(ram_addr[WORD_DEPTH_LOG-1:2]),
                       .din(ram_di[0+:16]), .dout(ram_do[0+:16])
                       );
   SPRAM_16Kx16 ram1 (
                       .clk(clk), .wren(ram_we), 
		       .maskwren({{2{dm_be[3]}},{2{dm_be[2]}}}), 
                       .addr(ram_addr[WORD_DEPTH_LOG-1:2]),
                       .din(ram_di[16+:16]), .dout(ram_do[16+:16])
                       );

   EBRAM_ROM rom0(
     .clk(clk), .addra(im_addr[10:2]), .douta(im_do),
     .addrb(dm_addr[10:2]), .doutb(im_data_2_p)
   );

   // The MMU pipeline
   always @ (posedge clk) begin : MMU_PIPELINE
      if (!resetb) begin
	 chosen_device_p <= 3'bX;
	 is_signed_p <= 1'bX;
	 dm_be_p <= 4'b0;
	 // First instruction is initialized as NOP
	 //im_do <= 32'b0000_0000_0000_00000_000_00000_0010011;
	 io_data_write <= 32'bX;
	 //im_data_2_p <= 32'bX;
	 io_en <= 1'b0;
	 io_we <= 1'b0;
	 io_addr <= 8'bX;
      end
      else if (clk) begin
	 // Notice the pipeline. The naming is a bit inconsistent
	 dm_be_p <= dm_be;
	 chosen_device_p <= chosen_device_tmp[2:0];
	 is_signed_p <= is_signed;
	 //im_do <= im_data;
	 //im_data_2_p <= im_data_2;
	 io_data_write <= io_data_write_tmp;
	 io_en <= io_en_tmp;
	 io_we <= io_we_tmp;
	 io_addr <= io_addr_tmp;
      end
   end

   /* verilator lint_off UNUSED */
   reg [31:0] 		    ram_addr_temp, io_addr_temp;
   /* verilator lint_on UNUSED */
   // Device mapping from address
   // Note: X-Optimism might be a problem. Convert to Tertiary to fix
   always @ (*) begin : DM_ADDR_MAP
      ram_addr_temp = dm_addr - 32'h10000000;
      io_addr_temp = dm_addr - 32'h80000000;
      io_addr_tmp = io_addr_temp[7:0];;
      io_en_tmp = 1'b0;
      io_we_tmp = 1'b0;
      io_data_write_tmp = 32'bX;
      ram_we = 1'b0;
      ram_addr = {(WORD_DEPTH_LOG-2){1'bX}};
      ram_di = 32'bX;
      chosen_device_tmp = DEV_UNKN;
      if (dm_addr[31:12] == 20'b0) begin
	 // 0x00000000 - 0x00000FFF
	 chosen_device_tmp = DEV_IM;
      end
      else if (dm_addr[31] == 1'b0 && dm_addr[30:28] != 3'b0) begin
	 // 0x10000000 - 0x7FFFFFFF
	 ram_addr = ram_addr_temp[2+:WORD_DEPTH_LOG-2];
	 ram_di = dm_di_shift;
	 ram_we = dm_we;
	 chosen_device_tmp = DEV_DM;
      end
      else if (dm_addr[31:8] == 24'h800000) begin
	 // 0x80000000 - 0x800000FF
	 // io_addr_tmp = io_addr_temp[7:0];
	 io_en_tmp = 1'b1;
	 io_we_tmp = dm_we;
	 io_data_write_tmp = dm_di_shift;
	 chosen_device_tmp = DEV_IO;
      end
   end // block: DM_ADDR_MAP
   
   // Shifting input byte/halfword to correct position
   // Note: X-Optimism might be a problem. Convert to Tertiary to fix   
   always @ (*) begin : DM_IN_SHIFT
      dm_di_shift = 32'bX;
      // Byte enable
      if (dm_be == 4'b1111) begin
   	 dm_di_shift = dm_di;
      end
      else if (dm_be == 4'b1100) begin
   	 dm_di_shift[16+:16] = dm_di[0+:16];
      end
      else if (dm_be == 4'b0011) begin
   	 dm_di_shift[0+:16] = dm_di[0+:16];
      end
      else if (dm_be == 4'b0001) begin
   	 dm_di_shift[0+:8] = dm_di[0+:8];
      end
      else if (dm_be == 4'b0010) begin
   	 dm_di_shift[8+:8] = dm_di[0+:8];
      end
      else if (dm_be == 4'b0100) begin
   	 dm_di_shift[16+:8] = dm_di[0+:8];
      end
      else if (dm_be == 4'b1000) begin
   	 dm_di_shift[24+:8] = dm_di[0+:8];
      end
   end // block: DM_IN_SHIFT
   
   // Shifting byte/halfword to correct output position
   // Note: X-Optimism might be a problem. Convert to Tertiary to fix
   always @ (*) begin : DM_OUT_SHIFT
      case (chosen_device_p)
        DEV_IM:
          dm_do_tmp = im_data_2_p;
   	DEV_DM:
   	  dm_do_tmp = ram_do;
   	DEV_IO:
   	  dm_do_tmp = io_data_read;
   	default:
   	  dm_do_tmp = 32'bX;
      endcase // case (chosen_device_reg)
      // Byte enable
      dm_do = 32'bX;
      if (dm_be_p == 4'b1111) begin
   	 dm_do = dm_do_tmp;
      end
      else if (dm_be_p == 4'b1100) begin
   	 if (is_signed_p)
   	   dm_do = {{16{dm_do_tmp[31]}}, dm_do_tmp[16+:16]};
   	 else
   	   dm_do = {16'b0, dm_do_tmp[16+:16]};
      end
      else if (dm_be_p == 4'b0011) begin
   	 if (is_signed_p)
   	   dm_do = {{16{dm_do_tmp[15]}}, dm_do_tmp[0+:16]};
   	 else
   	   dm_do = {16'b0, dm_do_tmp[0+:16]};
      end
      else if (dm_be_p == 4'b0001) begin
   	 if (is_signed_p)
   	   dm_do = {{24{dm_do_tmp[7]}}, dm_do_tmp[0+:8]};
   	 else
   	   dm_do = {24'b0, dm_do_tmp[0+:8]};
      end
      else if (dm_be_p == 4'b0010) begin
   	 if (is_signed_p)
   	   dm_do = {{24{dm_do_tmp[15]}}, dm_do_tmp[8+:8]};
   	 else
   	   dm_do = {24'b0, dm_do_tmp[8+:8]};
      end
      else if (dm_be_p == 4'b0100) begin
   	 if (is_signed_p)
   	   dm_do = {{24{dm_do_tmp[23]}}, dm_do_tmp[16+:8]};
   	 else
   	   dm_do = {24'b0, dm_do_tmp[16+:8]};
      end
      else if (dm_be_p == 4'b1000) begin
   	 if (is_signed_p)
   	   dm_do = {{24{dm_do_tmp[31]}}, dm_do_tmp[24+:8]};
   	 else
   	   dm_do = {24'b0, dm_do_tmp[24+:8]};
      end
   end
   
endmodule // mmu

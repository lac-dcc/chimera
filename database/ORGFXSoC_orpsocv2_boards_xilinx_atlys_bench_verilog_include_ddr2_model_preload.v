// File intended to be included in the generate statement for each DDR2 part.
// The following loads a vmem file, "sram.vmem" by default, into the SDRAM.

// Wait until the DDR memory is initialised, and then magically
// load it
@(posedge dut.xilinx_ddr2_0.xilinx_ddr2_if0.ddr2_calib_done);
//$display("%t: Loading DDR2",$time);

$readmemh("sram.vmem", program_array);
/* Now dish it out to the DDR2 model's memory */
for(ram_ptr = 0 ; ram_ptr < 4096 ; ram_ptr = ram_ptr + 1)
  begin

     // Construct the burst line
     program_word_ptr = ram_ptr*4;
     tmp_program_word = program_array[program_word_ptr];
     ddr2_ram_mem_line[31:0] = tmp_program_word;

     program_word_ptr = program_word_ptr + 1;
     tmp_program_word = program_array[program_word_ptr];
     ddr2_ram_mem_line[63:32] = tmp_program_word;
     
     
     program_word_ptr = program_word_ptr + 1;
     tmp_program_word = program_array[program_word_ptr];
     ddr2_ram_mem_line[95:64] = tmp_program_word;
     
     
     program_word_ptr = program_word_ptr + 1;
     tmp_program_word = program_array[program_word_ptr];
     ddr2_ram_mem_line[127:96] = tmp_program_word;
     
     // Put this assembled line into the RAM using its memory writing TASK
     if (C3_MEM_ADDR_ORDER == "BANK_ROW_COLUMN") begin
	u_mem0.memory_write(2'b00,ram_ptr[19:7],
			   {ram_ptr[6:0],3'b000},ddr2_ram_mem_line);
     end else if (C3_MEM_ADDR_ORDER == "ROW_BANK_COLUMN") begin
	u_mem0.memory_write(ram_ptr[8:7],{2'b00,ram_ptr[19:9]},
			   {ram_ptr[6:0],3'b000},ddr2_ram_mem_line);
	
     end
     //$display("Writing 0x%h, ramline=%d",ddr2_ram_mem_line, ram_ptr);
     
  end // for (ram_ptr = 0 ; ram_ptr < ...
$display("(%t) * DDR2 RAM preloaded",$time);


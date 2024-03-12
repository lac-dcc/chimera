// File intended to be included in the generate statement for each DDR2 part.
// The following loads a vmem file, "sram.vmem" by default, into the SDRAM.

// Wait until the DDR memory is initialised, and then magically
// load it
@(posedge dut.xilinx_s3adsp_ddr2.xilinx_s3adsp_ddr2_if.phy_init_done);
//$display("%t: Loading DDR2",$time);

$readmemh("sram.vmem", program_array);
/* Now dish it out to the DDR2 model's memory */
for(ram_ptr = 0 ; ram_ptr < 4096 ; ram_ptr = ram_ptr + 1)
  begin

     // Construct the burst line, with every second word from where we
     // started, and picking the correct half of the word with i%2
     program_word_ptr = ram_ptr *8;
     
     tmp_program_word = program_array[program_word_ptr+1];
     ddr2_ram_mem_line[15:0] = tmp_program_word[15 + (i*16):(i*16)];

     tmp_program_word = program_array[program_word_ptr]; 
     ddr2_ram_mem_line[31:16] = tmp_program_word[15 + (i*16):(i*16)];
     
     tmp_program_word = program_array[program_word_ptr+3];
     ddr2_ram_mem_line[47:32] = tmp_program_word[15 + (i*16):(i*16)];
     
     tmp_program_word = program_array[program_word_ptr+2];
     ddr2_ram_mem_line[63:48] = tmp_program_word[15 + (i*16):(i*16)];
     
     tmp_program_word = program_array[program_word_ptr+5];
     ddr2_ram_mem_line[79:64] = tmp_program_word[15 + (i*16):(i*16)];
     
     tmp_program_word = program_array[program_word_ptr+4];
     ddr2_ram_mem_line[95:80] = tmp_program_word[15 + (i*16):(i*16)];
     
     tmp_program_word = program_array[program_word_ptr+7];
     ddr2_ram_mem_line[111:96] = tmp_program_word[15 + (i*16):(i*16)];
     
     tmp_program_word = program_array[program_word_ptr+6];
     ddr2_ram_mem_line[127:112] = tmp_program_word[15 + (i*16):(i*16)];
     
     // Put this assembled line into the RAM using its memory writing TASK
     u_mem0.memory_write(2'b00,ram_ptr[19:7],
			 {ram_ptr[6:0],3'b000},ddr2_ram_mem_line);
     
     //$display("Writing 0x%h, ramline=%d",ddr2_ram_mem_line, ram_ptr);
     
  end // for (ram_ptr = 0 ; ram_ptr < ...
$display("(%t) * DDR2 RAM %1d preloaded",$time, i);


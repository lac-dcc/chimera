//ice40 has 1024 kbit of spram ==> 128KB

// wire [31:0] ip_mem_addr;
// wire ip_mem_wr_en;
// wire ip_mem_rd_en;
// wire [15:0] ip_mem_data_write;
// wire [15:0] ip_mem_data_read;
// wire ip_mem_data_read_valid;

module ram_interface(input clk, input [31:0] addr, input wr_en, input rd_en, input [15:0] data_write, output reg [15:0] data_read, output reg data_read_valid);

   wire ram_wren [3:0];

   wire [15:0] ram_data_out [3:0];

   reg [1:0] output_mux [1:0];
   reg rd_en_buffer[2:0];


   SB_SPRAM256KA spram0
   (
      .ADDRESS(addr[14:1]), //14bits (16K*2B)
      .DATAIN(data_write),
      .MASKWREN(4'b1111),
      .WREN(ram_wren[0]),
      .CHIPSELECT(1'b1),
      .CLOCK(clk),
      .STANDBY(1'b0),
      .SLEEP(1'b0),
      .POWEROFF(1'b1),
      .DATAOUT(ram_data_out[0])
   );

   SB_SPRAM256KA spram1
   (
      .ADDRESS(addr[14:1]),
      .DATAIN(data_write),
      .MASKWREN(4'b1111),
      .WREN(ram_wren[1]),
      .CHIPSELECT(1'b1),
      .CLOCK(clk),
      .STANDBY(1'b0),
      .SLEEP(1'b0),
      .POWEROFF(1'b1),
      .DATAOUT(ram_data_out[1])
   );

   SB_SPRAM256KA spram2
   (
      .ADDRESS(addr[14:1]),
      .DATAIN(data_write),
      .MASKWREN(4'b1111),
      .WREN(ram_wren[2]),
      .CHIPSELECT(1'b1),
      .CLOCK(clk),
      .STANDBY(1'b0),
      .SLEEP(1'b0),
      .POWEROFF(1'b1),
      .DATAOUT(ram_data_out[2])
   );

   SB_SPRAM256KA spram3
   (
      .ADDRESS(addr[14:1]),
      .DATAIN(data_write),
      .MASKWREN(4'b1111),
      .WREN(ram_wren[3]),
      .CHIPSELECT(1'b1),
      .CLOCK(clk),
      .STANDBY(1'b0),
      .SLEEP(1'b0),
      .POWEROFF(1'b1),
      .DATAOUT(ram_data_out[3])
   );

   assign ram_wren[addr[16:15]] = wr_en;

   always @(posedge clk)
   begin
      output_mux[0] <= addr[16:15];
      output_mux[1] <= output_mux[0];
      rd_en_buffer[0] <= rd_en;
      rd_en_buffer[1] <= rd_en_buffer[0];
      rd_en_buffer[2] <= rd_en_buffer[1];
      data_read_valid <= (rd_en_buffer[2] == 0 && rd_en_buffer[1] == 1);
      data_read <= ram_data_out[output_mux[1]];
   end

endmodule

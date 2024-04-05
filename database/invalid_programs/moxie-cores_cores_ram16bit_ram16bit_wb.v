`include "config.v"

module ram16bit_wb (input         rst_i,
		    input 	  clk_i,
		    input [31:0]  wb_adr_i,
		    output [15:0] wb_dat_o,
		    input [15:0]  wb_dat_i,
		    input [1:0]   wb_sel_i,
		    input 	  wb_we_i,
		    input 	  wb_cyc_i,
		    input 	  wb_stb_i,
		    output 	  wb_ack_o);

`ifdef XILINX

  reg 				  ack;
  
  assign wb_ack_o = ack;
   
  always @(posedge clk_i)
    begin
       ack <= wb_stb_i & wb_cyc_i;
    end

  ram4k16bit ram(.clka (clk_i),
		 .wea ({wb_stb_i & wb_cyc_i & wb_we_i, wb_stb_i & wb_cyc_i & wb_we_i}),
		 .addra (wb_adr_i[12:1]),
		 .dina (wb_dat_i),
		 .douta (wb_dat_o));
`else

  reg [15:0] 				  dat;
  reg 				  ack;
  
  assign wb_ack_o = ack;
  assign wb_dat_o = dat;
   
  always @(posedge clk_i)
    begin
       ack <= wb_stb_i & wb_cyc_i;
    end

  // 4k boot RAM
  reg  [7:0] ram[0:4095];
  wire [11:0] index;

  // We're just looking at the least significant 4k address bits
  assign index = wb_adr_i[11:0];

  always @(posedge clk_i)
    begin
      dat <= {ram[index], ram[index+1]};
      ack <= wb_stb_i & wb_cyc_i;
      if (wb_we_i)
	begin
	  ram[index] = wb_dat_i[15:8];
	  ram[index+1] = wb_dat_i[7:0];
	end
    end


 `ifdef ASDFASD
 
   lpm_ram_dq ram (.data(wb_dat_i), 
		   .address(wb_adr_i[12:1]), 
		   .we(!(wb_stb_i & wb_cyc_i & wb_we_i)),
		   .inclock(clk_i), 
                   .q(wb_dat_o));

// passing the parameter values
   defparam ram.lpm_width = 16;
   defparam ram.lpm_widthad = 8;
   defparam ram.lpm_indata = "REGISTERED";
   defparam ram.lpm_outdata = "REGISTERED";

 `endif
`endif

endmodule // ram16bit_wb

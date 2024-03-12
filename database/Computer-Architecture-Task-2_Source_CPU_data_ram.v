`ifdef data_ram.v
`else
 `define data_ram.v
// ----------------------------------------------------------------------------------------------------
 `include "defines.v"

module data_ram
  (
   input wire 		     clk,
   input wire 		     ce,
   input wire 		     we,
   input wire [`DataAddrBus] addr,
   input wire [3:0] 	     sel,
   input wire [`DataBus]     data_i,
   output reg [`DataBus]     data_o
   );

   reg [`ByteWidth] 	     data_mem0[0:`DataMemNum-1];
   reg [`ByteWidth] 	     data_mem1[0:`DataMemNum-1];
   reg [`ByteWidth] 	     data_mem2[0:`DataMemNum-1];
   reg [`ByteWidth] 	     data_mem3[0:`DataMemNum-1];

   // Store
   always @ (posedge clk) 
     begin

	if (ce == `ChipDisable) 
	  data_o <= `ZeroWord;
	
	else if(we == `WriteEnable)
	  begin     
	     if (sel[3] == 1'b1) 
	       begin 
		  data_mem3[addr>>2] <= data_i[31:24];
		  $display("Store %h in %h.",data_i[31:24],((addr>>2)<<2)+3);
	       end
	     if (sel[2] == 1'b1) 
	       begin
		  data_mem2[addr>>2] <= data_i[23:16];
	     	  $display("Store %h in %h.",data_i[23:16],((addr>>2)<<2)+2);
	       end
	     if (sel[1] == 1'b1) 
	       begin
		  $display("Store %h in %h.",data_i[15:8],((addr>>2)<<2)+1);
		  data_mem1[addr>>2] <= data_i[15:8];
	       end
	     if (sel[0] == 1'b1) 
	       begin
		  $display("Store %h in %h.",data_i[7:0],((addr>>2)<<2));
		  data_mem0[addr>>2] <= data_i[7:0];
		  if ((addr>>2) == (32'h00000104>>2))
		    $display("Print (%c)",data_i[7:0]);
	       end
	  end
	
     end

   // Load
   always @ (*) 
     begin
	if (ce == `ChipDisable) data_o <= `ZeroWord;
	else if(we == `WriteDisable)
	  begin
	     data_o <= {data_mem3[addr>>2],data_mem2[addr>>2],
		     data_mem1[addr>>2],data_mem0[addr>>2]};
	     $display("Load %h at %h.",{data_mem3[addr>>2],data_mem2[addr>>2],data_mem1[addr>>2],data_mem0[addr>>2]},{addr[31:2],2'b00});
	  end
	else data_o <= `ZeroWord;
     end		

endmodule // data_ram

// ----------------------------------------------------------------------------------------------------
`endif

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
// 
// -------------------------------------------------------------------
module upsample #(
  parameter gp_data_width = 8,                   // Input & output bit-width
  parameter gp_nr_stages  = 4,                   // Number of shift registers
  parameter gp_phase      = 0
) (
  input  wire                     i_rst_an,      // Asynchronous active low reset
  input  wire                     i_ena,         // Synchronous active high enable
  input  wire                     i_clk,         // Rising-edge clock
  input  wire [gp_data_width-1:0] i_data,        // Input data with p_data_width bits MSB:LSB, signed
  output wire [gp_data_width-1:0] o_data,        // Output data with p_data_width bits MSB:LSB, signed
  output wire                     o_shift_done   // Flag indicates inital shift operation is done 
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_cnt_width = $clog2(gp_nr_stages)+1;
  localparam c_phase_offset = (gp_phase == 0) ? 1 : gp_phase;
  // REGISTER DECLARATION
  reg [c_cnt_width-1                    :0] r_cnt;
  reg                                       r_shift_done; 
  // WIRE DECLARATION
  wire                                      w_shift_done;
  wire                                      w_load;
  wire [gp_data_width-1                 :0] w_upsample_data;
  wire [c_phase_offset*gp_data_width-1  :0] w_phase_offset;
  wire [(gp_nr_stages-1)*gp_data_width-1:0] w_zero_insertion;
// -------------------------------------------------------------------  
  // INPUT DATA MUX
  assign w_upsample_data = (w_load) ? i_data : w_zero_insertion[gp_data_width-1:0];
  
  genvar i, j;  
  generate
    for (i=0; i<c_phase_offset; i=i+1)
      begin: g_offset_zero_insertion	
	if (gp_phase == 0)
	  begin
	    assign w_phase_offset = w_upsample_data;
	  end
	else
	  begin
    	    if (i==0)
    	      begin: g_shiftreg_dff
      	        dff #(
                  .gp_data_width (gp_data_width)
                ) upsample_shiftreg_dff  (
                  .i_rst_an (i_rst_an),
                  .i_ena    (i_ena),
                  .i_clk    (i_clk),
                  .i_data   (w_upsample_data),
                  .o_data   (w_phase_offset[(i+1)*gp_data_width-1 -: gp_data_width])
                );
    	      end
    	    else
    	      begin
      	        dff #(
                  .gp_data_width (gp_data_width)
                ) upsample_shiftreg_dff  (
                  .i_rst_an (i_rst_an),
                  .i_ena    (i_ena),
                  .i_clk    (i_clk),
                  .i_data   (w_phase_offset[(i)*gp_data_width-1   -: gp_data_width]),
                  .o_data   (w_phase_offset[(i+1)*gp_data_width-1 -: gp_data_width])
                );	  
    	      end	  
	  end
      end//FOR
  endgenerate
  
  generate
    for (j=0; j<gp_nr_stages-1; j=j+1)
      begin: g_upsample_zero_insertion
        if (j!=gp_nr_stages-2)
	  begin
	    dff #(
              .gp_data_width (gp_data_width)
            ) upsample_shiftreg_dff  (
              .i_rst_an (i_rst_an),
              .i_ena	(i_ena),
              .i_clk	(i_clk),
              .i_data	(w_zero_insertion[(j+2)*gp_data_width-1 -: gp_data_width]),
              .o_data	(w_zero_insertion[(j+1)*gp_data_width-1 -: gp_data_width])
            );
	  end
	else
	  begin
	    assign w_zero_insertion[(j+1)*gp_data_width-1 -: gp_data_width] = 'd0;
	  end
      end
  endgenerate
  
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_count_stages
      if (!i_rst_an)
        begin
	  r_cnt        <= gp_nr_stages;
	  r_shift_done <= 1'b0;
	end
      else if (i_ena)
        begin
	  if (r_cnt<gp_nr_stages-1)
	    r_cnt <= r_cnt + 1'b1;
	  else
	     r_cnt        <= 'd0;
	      
	  if (w_shift_done)
	    r_shift_done <= 1'b1;	    
	end
    end
    
assign w_load       = (r_cnt == 0) ? 1'b1 : 1'b0;
assign w_shift_done = (r_cnt == gp_nr_stages) ? 1'b1 : r_shift_done;
assign o_shift_done = w_shift_done;
assign o_data       = w_phase_offset[c_phase_offset*gp_data_width-1 -: gp_data_width];  

endmodule

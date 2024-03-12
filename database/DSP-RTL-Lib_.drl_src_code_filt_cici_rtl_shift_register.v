// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
// 
// -------------------------------------------------------------------
module shift_register #(
  parameter gp_data_width = 8,                   // Input & output bit-width
  parameter gp_nr_stages  = 4                    // Number of shift registers
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
  localparam c_cnt_width = $clog2(gp_nr_stages);
  // REGISTER DECLARATION
  reg [c_cnt_width-1:0]                 r_cnt;
  reg                                   r_shift_done; 
  // WIRE DECLARATION
  wire                                  w_shift_done;
  wire [gp_nr_stages*gp_data_width-1:0] w_data;
// -------------------------------------------------------------------  
  genvar i;  
  generate
    for (i=0; i<gp_nr_stages; i=i+1)
      begin: g_shift_register
        if (i==0)
          begin: g_shift_register_0
            dff #(
	    .gp_data_width (gp_data_width)
	    ) REG_COMMUTATOR_INP_DATA  (
	    .i_rst_an (i_rst_an),
	    .i_ena    (i_ena),
	    .i_clk    (i_clk),
	    .i_data   (i_data),
	    .o_data   (w_data[(i+1)*gp_data_width-1 -: gp_data_width])
	    );
          end
        else
          begin: g_shift_register_1_n
            dff #(
	    .gp_data_width (gp_data_width)
	    ) REG_COMMUTATOR_INP_DATA  (
	    .i_rst_an (i_rst_an),
	    .i_ena    (i_ena),
	    .i_clk    (i_clk),
	    .i_data   (w_data[(i)*gp_data_width-1 -: gp_data_width]),
	    .o_data   (w_data[(i+1)*gp_data_width-1 -: gp_data_width])
	    );  	  
          end
        end
  endgenerate
  
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_count_done
      if (!i_rst_an)
        begin
	  r_cnt        <= 'd0;
	  r_shift_done <= 1'b0;
	end
      else if (i_ena)
        begin
	  if (r_cnt<gp_nr_stages)
	    r_cnt <= r_cnt + 1'b1;
	    
	  if (w_shift_done)
	    r_shift_done <= 1'b1;	    
	end
    end
    
assign w_shift_done = (r_cnt == gp_nr_stages) ? 1'b1 : r_shift_done;
assign o_shift_done = w_shift_done;
assign o_data       = w_data[gp_nr_stages*gp_data_width-1 -: gp_data_width];  

endmodule

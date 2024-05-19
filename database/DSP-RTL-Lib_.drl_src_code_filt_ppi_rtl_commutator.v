// This program was cloned from: https://github.com/ahmedshahein/DSP-RTL-Lib
// License: BSD 2-Clause "Simplified" License

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
// 
// -------------------------------------------------------------------
module commutator #(
  parameter gp_ccw                  = 1,                                     // Select: Counter Clock Wise | Clock Wise
  parameter gp_idata_width          = 26,                                    // Set input data width
  parameter gp_interpolation_factor = 32                                    // Set number of output channels
  )                              
(
  input  wire                                                     i_rst_an,  // Asynchronous active low reset
  input  wire                                                     i_ena,     // Synchronous active high enable
  input  wire                                                     i_clk,     // Rising-edge clock
  input  wire signed [gp_interpolation_factor*gp_idata_width-1:0] i_data,    // Input data with gp_idata_width bits MSB:LSB, signed
  output wire signed [gp_idata_width-1:0]                         o_data,    // Unsigned data with gp_interpolation_factor x gp_idata_width width MSB:LSB
  output wire                                                     o_clk      // Slow clock pulsed output
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_cnt_width = gp_interpolation_factor;
  localparam c_idx_width = $clog2(gp_interpolation_factor)+1;
  // REGISTER DECLARATION
  reg         [c_cnt_width-1:0]                            r_ring_cnt;
  reg         [c_idx_width-1:0]                            r_idx;
  reg                                                      r_done;    
  // WIRE DECLARATION
  wire signed [gp_interpolation_factor*gp_idata_width-1:0] w_data;
  wire                                                     w_done;
  genvar x;
// -------------------------------------------------------------------  
  generate
    /**************/
    /* Clock Wise */
    /**************/
    if (!gp_ccw)
      begin: g_commutator_cw
        // Ring counter clock-wise direction
        always @(posedge i_clk or negedge i_rst_an)
          begin: p_ring_counter_cw
            if (!i_rst_an)
              begin
                r_ring_cnt <= 'd0;
		r_idx      <= {c_idx_width{1'b1}};
		r_done     <= 1'b0;
              end
            else if (i_ena)
              begin
		if (r_ring_cnt == 'd0)
                  begin
                    r_ring_cnt[c_cnt_width-1] <= 1'b1;
                  end
                else
                  begin
                    r_ring_cnt[c_cnt_width-1]   <= r_ring_cnt[0];
                    r_ring_cnt[c_cnt_width-2:0] <= r_ring_cnt[c_cnt_width-1:1];  
                  end
		
		if (r_idx < gp_interpolation_factor-1)
		  r_idx <= r_idx+1'b1;
		else
		  r_idx <= 'd0;		  
		
		r_done <= w_done;
              end
          end//ALWAYS
	  	  	            
	// Capture input data in clock-wise order MSB->LSB
        for (x=gp_interpolation_factor; x>0; x=x-1)
          begin: g_reg_comm_inp
            dff #(
              .gp_data_width (gp_idata_width)
              ) REG_COMMUTATOR_INP_DATA  (
              .i_rst_an (i_rst_an),
              .i_ena    (i_ena),
              .i_clk    (r_ring_cnt[x-1]),
              .i_data   (i_data[x*gp_idata_width-1 -: gp_idata_width]),
              .o_data   (w_data[x*gp_idata_width-1 -: gp_idata_width])
            );	    
          end
	  
	assign o_data = w_data[(gp_interpolation_factor-r_idx)*gp_idata_width-1 -: gp_idata_width];
          
        assign w_done = (r_ring_cnt[0]) ? 1'b1 : 1'b0;
      end//IF_GEN
    /**********************/
    /* Counter Clock Wise */
    /**********************/
    else
      begin: g_commutator_ccw
        always @(negedge i_clk or negedge i_rst_an)
          begin: p_ring_counter_ccw
            if (!i_rst_an)
              begin
                r_ring_cnt <= 'd0;
		r_idx      <= {c_idx_width{1'b1}};
		r_done     <= 1'b0;
              end
            else if (i_ena)
              begin
                if (r_ring_cnt == 'd0)
                  begin
                    r_ring_cnt[0] <= 1'b1;
                  end
                else
                  begin
                    r_ring_cnt[0]               <= r_ring_cnt[c_cnt_width-1];
                    r_ring_cnt[c_cnt_width-1:1] <= r_ring_cnt[c_cnt_width-2:0];
                  end
		  
		if (r_idx < gp_interpolation_factor-1)
		  r_idx <= r_idx+1'b1;
		else
		  r_idx <= 'd0;
		
		r_done     <= w_done;
              end
          end//ALWAYS 
	    
        for (x=0; x<gp_interpolation_factor; x=x+1)
          begin: g_reg_comm_inp
            dff #(
              .gp_data_width (gp_idata_width)
              ) REG_COMMUTATOR_INP_DATA  (
              .i_rst_an (i_rst_an),
              .i_ena    (i_ena),
              .i_clk    (r_ring_cnt[x]),
              .i_data   (i_data[(x+1)*gp_idata_width-1:x*gp_idata_width]),
              .o_data   (w_data[(x+1)*gp_idata_width-1:x*gp_idata_width])
            );
          end

        assign o_data = (r_idx<gp_interpolation_factor) ? w_data[(r_idx+1)*gp_idata_width-1 -: gp_idata_width] : 'd0; 
	//assign o_data = w_data[(r_idx+1)*gp_idata_width-1 -: gp_idata_width]; 
	         
        assign w_done = (r_ring_cnt[c_cnt_width-1]) ? 1'b1 : 1'b0;
      end//ELSE_GEN
  endgenerate

assign o_clk  = r_done;
    
endmodule


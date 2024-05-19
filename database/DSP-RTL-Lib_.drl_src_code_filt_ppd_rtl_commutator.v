// This program was cloned from: https://github.com/ahmedshahein/DSP-RTL-Lib
// License: BSD 2-Clause "Simplified" License

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
// 
// -------------------------------------------------------------------
module commutator #(
  parameter gp_ccw               = 1,                                     // Select: Counter Clock Wise | Clock Wise
  parameter gp_idata_width       = 8,                                     // Set input data width
  parameter gp_decimation_factor = 4,                                     // Set number of output channels
  parameter gp_reg_oup           = 1,                                     // Select: registered output | none-registered
  parameter gp_phase             = 0                                      // Select downsample phase: 0:gp_decimation_factor-1
  )                              
(
  input  wire                                                  i_rst_an,  // Asynchronous active low reset
  input  wire                                                  i_ena,     // Synchronous active high enable
  input  wire                                                  i_clk,     // Rising-edge clock
  input  wire signed [gp_idata_width-1:0]                      i_data,    // Input data with gp_idata_width bits MSB:LSB, signed
  output wire signed [gp_decimation_factor*gp_idata_width-1:0] o_data,    // Unsigned data with gp_decimation_factor x gp_idata_width width MSB:LSB
  output wire                                                  o_clk      // Slow clock pulsed output
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_cnt_width = gp_decimation_factor;
  // REGISTER DECLARATION
  reg  [c_cnt_width-1:0]                         r_ring_cnt;
  reg                                            r_done;    
  // WIRE DECLARATION    
  wire [c_cnt_width-1:0]                         w_phase_to_idx;  
  wire [gp_decimation_factor*gp_idata_width-1:0] w_data; 
  wire                                           w_ena; 
  wire                                           w_done;
  wire signed [gp_idata_width-1:0]               d_data;
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
		  
		r_done <= w_done;
              end
          end//ALWAYS
	  
	if (gp_phase==0)
	  begin: SR_PHASE_EQ_0
	    assign d_data = i_data;
	  end
	else	  
	  begin: g_phase_alignment
            shift_register #(
	      .gp_data_width (gp_idata_width),
	      .gp_nr_stages  (gp_phase)
	    ) SR_PHASE_LT_0 (
	      .i_rst_an (i_rst_an),
	      .i_ena    (i_ena),  
	      .i_clk    (i_clk),  
	      .i_data   (i_data), 
	      .o_data   (d_data),
	      .o_shift_done (w_ena)  
	    );
	  end
	  	  	            
	// Capture input data in clock-wise order MSB->LSB
        for (x=gp_decimation_factor; x>0; x=x-1)
          begin: g_reg_comm_inp
            dff #(
              .gp_data_width (gp_idata_width)
              ) REG_COMMUTATOR_INP_DATA  (
              .i_rst_an (i_rst_an),
              .i_ena    (i_ena),
              .i_clk    (r_ring_cnt[x-1]),
              .i_data   (d_data),
              .o_data   (w_data[x*gp_idata_width-1 -: gp_idata_width])
            );
          end
        // Registered output
	if (gp_reg_oup)
	  begin: g_reg_comm_oup
            for (x=gp_decimation_factor; x>0; x=x-1)
              begin: g_dff
                dff #(
                  .gp_data_width (gp_idata_width)
                  ) REG_COMMUTATOR_OUP_DATA  (
                  .i_rst_an (i_rst_an),
                  .i_ena    (i_ena),
                  .i_clk    (r_done),
                  .i_data   (w_data[x*gp_idata_width-1 -: gp_idata_width]),
                  .o_data   (o_data[x*gp_idata_width-1 -: gp_idata_width])
                );
              end	  
	  end
	// Non-registered output
	else
	  begin
	    assign o_data = w_data;
	  end
	  
        assign w_done = (r_ring_cnt[0]) ? 1'b1 : 1'b0;
      end//IF_GEN
    /**********************/
    /* Counter Clock Wise */
    /**********************/
    else
      begin: g_commutator_ccw
        always @(posedge i_clk or negedge i_rst_an)
          begin: p_ring_counter_ccw
            if (!i_rst_an)
              begin
                r_ring_cnt <= 'd0;
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
		  
		r_done     <= w_done;
              end
          end//ALWAYS 

	if (gp_phase==0)
	  begin: SR_PHASE_EQ_0
	    assign d_data = i_data;
	  end
	else	  
	  begin: g_phase_alignment
            shift_register #(
	      .gp_data_width (gp_idata_width),
	      .gp_nr_stages  (gp_phase)
	    ) SR_PHASE_LT_0 (
	      .i_rst_an (i_rst_an),
	      .i_ena    (i_ena),  
	      .i_clk    (i_clk),  
	      .i_data   (i_data), 
	      .o_data   (d_data),
	      .o_shift_done (w_ena)  
	    );
	  end
	    
        for (x=0; x<gp_decimation_factor; x=x+1)
          begin: g_reg_comm_inp
            dff #(
              .gp_data_width (gp_idata_width)
              ) REG_COMMUTATOR_INP_DATA  (
              .i_rst_an (i_rst_an),
              .i_ena    (i_ena),
              .i_clk    (r_ring_cnt[x]),
              .i_data   (d_data),
              .o_data   (w_data[(x+1)*gp_idata_width-1:x*gp_idata_width])
            );
          end

	if (gp_reg_oup)
	  begin: g_reg_comm_oup
            for (x=0; x<gp_decimation_factor; x=x+1)
              begin: g_dff
                dff #(
                  .gp_data_width (gp_idata_width)
                  ) REG_COMMUTATOR_OUP_DATA  (
                  .i_rst_an (i_rst_an),
                  .i_ena    (i_ena),
                  .i_clk    (r_done),
                  .i_data   (w_data[(x+1)*gp_idata_width-1:x*gp_idata_width]),
                  .o_data   (o_data[(x+1)*gp_idata_width-1:x*gp_idata_width])
                );
              end	  
	  end
	else
	  begin
	    assign o_data = w_data;
	  end
	         
        assign w_done = (r_ring_cnt[c_cnt_width-1]) ? 1'b1 : 1'b0;
      end//ELSE_GEN
  endgenerate

assign o_clk  = r_done;
    
endmodule


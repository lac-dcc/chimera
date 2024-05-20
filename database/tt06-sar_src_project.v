// This program was cloned from: https://github.com/wulffern/tt06-sar
// License: Apache License 2.0

`default_nettype none
`timescale 1 ns / 1 ps


module tt_um_TT06_SAR_wulffern (
                                input wire        VGND,
                                input wire        VPWR,
                                input wire [7:0]  ui_in,
                                output wire [7:0] uo_out,
                                input wire [7:0]  uio_in,
                                output wire [7:0] uio_out,
                                output wire [7:0] uio_oe,
`ifdef ANA_TYPE_REAL
                                input real        ua_0,
                                input real        ua_1,
`else
                                inout wire [7:0]  ua, // analog pins
`endif
                                input wire        ena,
                                input wire        clk,
                                input wire        rst_n
                                );

   parameter                                      OFF = 0,
                                                  SAMPLE = 1,
                                                  CONVERT = 2,
                                                  DONE=3;
   logic [1:0]                                    state;
   logic [1:0]                                    next_state;
   logic [7:0]                                    dout;
   logic [7:0]                                    sampled_dout;
   logic                                          done;
   logic                                          tie_l  =0;
   logic                                          tie_h = 1;

   always_comb begin
      case (state)
        OFF: begin
           next_state = SAMPLE;
        end
        SAMPLE: begin
           next_state = CONVERT;
        end
        CONVERT: begin
           next_state = DONE;
        end
        DONE: begin
           next_state = SAMPLE;
        end

        default: next_state = OFF;
      endcase // case (state)
   end

`ifdef ANA_TYPE_REAL
   real tmp = 0;
   real smpl = 0;
   real lsb = 1.0/64.0;
`else
   logic tmp;

`endif

   assign uo_out = sampled_dout;
   assign uio_out[0] = done;

   assign uio_out[1] = tie_l;
   assign uio_out[2] = tie_l;
   assign uio_out[3] = tie_l;
   assign uio_out[4] = tie_l;
   assign uio_out[5] = tie_l;
   assign uio_out[6] = tie_l;
   assign uio_out[7] = tie_l;
   assign uio_oe[0] = tie_h;
   assign uio_oe[1] = tie_l;
   assign uio_oe[2] = tie_l;
   assign uio_oe[3] = tie_l;
   assign uio_oe[4] = tie_l;
   assign uio_oe[5] = tie_l;
   assign uio_oe[6] = tie_l;
   assign uio_oe[7] = tie_l;


   //always #5 iclk = !iclk;
//& ~done & ui_in[0];


   always_ff @(posedge clk or negedge clk) begin

      if(~ui_in[0]) begin
         state <= OFF;
         tmp = 0;
         dout = 0;
      end
      else begin
         if(OFF) begin

         end
         else if(clk == 1) begin
            state = SAMPLE;
         end// !`ifdef ANA_TYPE_REAL
         else if(clk == 0) begin
            state = CONVERT;
 `ifdef ANA_TYPE_REAL
            smpl = ua_0 - ua_1;
            tmp = smpl;

            for(int i=7;i>=0;i--) begin
               if(tmp >= 0) begin
                  tmp = tmp - lsb*2**(i-1);
                  if(i==7)
                    dout[i] <= 0;
                  else
                    dout[i] <= 1;
               end
               else begin
                  tmp = tmp + lsb*2**(i-1);
                  if(i==7)
                    dout[i] = 1;
                  else
                    dout[i] = 0;
               end
            end
 `else
            if(tmp == 0) begin
              dout[7] <= 1;
               tmp <= 1;

            end
            else begin
              dout[7] <= 0;
               tmp  = 0;
            end
 `endif

         end

         state = next_state;
      end // else: !if(~ui_in[0])





   end // always_ff @ (posedge clk)

   always @(posedge done) begin
      state = DONE;
      sampled_dout = dout;


   end

   always @(state) begin
      if(state == OFF)
        #2 done = 0;
      else if(state == SAMPLE)
        #1.6 done = 0;
      else if(state == CONVERT)
        #115 done = 1;
   end

endmodule

// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

module mand_core (input clk,
                  input               reset,
                  input [31:0]        cx0,
                  input [31:0]        cxstep, // will execute 11 threads
                  input [31:0]        cy,
                  input               rq,
                  output              ack,
                  output [(7*11)-1:0] counters);

   reg                                ack;
   reg [(7*11)-1:0]                   counters;

   /*
    
    Since pipeline is 11-stage deep, we can issue 11 threads
      one thread per cycle.
    
    Once thread is retired, we check the output r, if it's > 16384, 
    thread is finalised, otherwise it is reschedulled back into 
    pipeline, increasing the counter.
    
    When there are no active threads left, raise ACK and pass all the counters
    as a 7*11-bit register.
    
    */

   // control fsm 
   parameter S_IDLE = 0;
   parameter S_ISSUE = 1;
   parameter S_REISSUE = 2;
   reg [2:0] state;


   // pipeline input registers
   reg [31:0]                             cx;
   reg [31:0]                             i_vx;
   reg [31:0]                             i_vy;
   reg [31:0]                             i_dvx;
   reg [31:0]                             i_dvy;
   reg [6:0]                              i_counter;
   reg [3:0]                              i_thrid;

   wire [31:0]                            vx;
   wire [31:0]                            vy;
   wire [31:0]                            dvx;
   wire [31:0]                            dvy;
   wire [31:0]                            counter;
   wire [31:0]                            thrid;
   

   // pipeline stages registers:
   reg [31:0]                   s00vx1;
   reg [31:0]                   s00tmp1;
   reg [31:0]                   s01tmp1A;
   reg [31:0]                   s01tmp2;
   reg [31:0]                   s01vx;
   reg [31:0]                   s02vx;
   reg [31:0]                   s02tmp1B;
   reg [31:0]                   s02tmp2A;
   reg [31:0]                   s03tmp1C;
   reg [31:0]                   s03tmp2B;
   reg [31:0]                   s03vx;
   reg [31:0]                   s04tmp1D;
   reg [31:0]                   s04tmp2C;
   reg [31:0]                   s04vx;
   reg [31:0]                   s05tmp2D;
   reg [31:0]                   s05vy1;
   reg [31:0]                   s05tmp3;
   reg [31:0]                   s05vx;
   reg [31:0]                   s06tmp3A;
   reg [31:0]                   s06vx;
   reg [31:0]                   s06vy;
   reg [31:0]                   s06tmp2;
   reg [31:0]                   s07tmp3B;
   reg [31:0]                   s07vx;
   reg [31:0]                   s07vy;
   reg [31:0]                   s07tmp2;
   reg [31:0]                   s08tmp3C;
   reg [31:0]                   s08vx;
   reg [31:0]                   s08vy;
   reg [31:0]                   s08tmp2;
   reg [31:0]                   s09tmp3D;
   reg [31:0]                   s09vx;
   reg [31:0]                   s09vy;
   reg [31:0]                   s09tmp2;
   reg [31:0]                   s10dvx;
   reg [31:0]                   s10dvy;
   reg [31:0]                   s10r;
   reg [31:0]                   s10vx;
   reg [31:0]                   s10vy;

   // thrid and counter pipeline registers - just passing through
   reg [3:0]                    s00thrid;
   reg [3:0]                    s01thrid;
   reg [3:0]                    s02thrid;
   reg [3:0]                    s03thrid;
   reg [3:0]                    s04thrid;
   reg [3:0]                    s05thrid;
   reg [3:0]                    s06thrid;
   reg [3:0]                    s07thrid;
   reg [3:0]                    s08thrid;
   reg [3:0]                    s09thrid;
   reg [3:0]                    s10thrid;

   reg [6:0]                    s00counter;
   reg [6:0]                    s01counter;
   reg [6:0]                    s02counter;
   reg [6:0]                    s03counter;
   reg [6:0]                    s04counter;
   reg [6:0]                    s05counter;
   reg [6:0]                    s06counter;
   reg [6:0]                    s07counter;
   reg [6:0]                    s08counter;
   reg [6:0]                    s09counter;
   reg [6:0]                    s10counter;
   
   // hoisted logic
   wire [31:0]                  s05vy1_comb;

   // xilinx ise does not infer a proper arithmetic shift for >>>
   wire               s1;
   
   assign               s1 = s04tmp1D[31];
   
   assign s05vy1_comb = {s1,s1,s1,s1,s1,s1,s1,s1,s1,s1,s1,s04tmp1D[31:11]} + cy;

   wire [31:0]        s10dvx_comb;
   wire [31:0]        s10dvy_comb;
   wire [31:0]        s10r_comb;
   
   wire                                s2;
   assign s2 = s09tmp2[31];
   
   assign s10dvx_comb = {s2,s2,s2,s2,s2,s2,s2,s2,s2,s2,s2,s2,s09tmp2[31:12]};

   wire                                s3;
   assign s3 = s09tmp3D[31];
   assign s10dvy_comb = {s3,s3,s3,s3,s3,s3,s3,s3,s3,s3,s3,s3,s09tmp3D[31:12]};
   assign s10r_comb = s10dvx_comb + s10dvy_comb;

   /* reissue logic */
   wire                         reissue;
   assign reissue = (state == S_REISSUE) && (s10r < 16384) && (s10thrid !=0);

   assign vx = reissue?s10vx:i_vx;
   assign vy = reissue?s10vy:i_vy;
   assign dvx = reissue?s10dvx:i_dvx;
   assign dvy = reissue?s10dvy:i_dvy;
   assign counter = reissue?s10counter+1:i_counter;
   assign thrid = reissue?s10thrid:i_thrid;
   
   
   always @(posedge clk)
     if (!reset) begin
        s00vx1 <= 0;
        s00tmp1 <= 0;
        s01tmp1A <= 0;
        s01tmp2 <= 0;
        s01vx <= 0;
        s02vx <= 0;
        s02tmp1B <= 0;
        s02tmp2A <= 0;
        s03tmp1C <= 0;
        s03tmp2B <= 0;
        s03vx <= 0;
        s04tmp1D <= 0;
        s04tmp2C <= 0;
        s04vx <= 0;
        s05tmp2D <= 0;
        s05vy1 <= 0;
        s05tmp3 <= 0;
        s05vx <= 0;
        s06tmp3A <= 0;
        s06vx <= 0;
        s06vy <= 0;
        s06tmp2 <= 0;
        s07tmp3B <= 0;
        s07vx <= 0;
        s07vy <= 0;
        s07tmp2 <= 0;
        s08tmp3C <= 0;
        s08vx <= 0;
        s08vy <= 0;
        s08tmp2 <= 0;
        s09tmp3D <= 0;
        s09vx <= 0;
        s09vy <= 0;
        s09tmp2 <= 0;
        s10dvx <= 0;
        s10dvy <= 0;
        s10r <= 0;
        s10vx <= 0;
        s10vy <= 0;

        s00thrid <= 0;
        s01thrid <= 0;
        s02thrid <= 0;
        s03thrid <= 0;
        s04thrid <= 0;
        s05thrid <= 0;
        s06thrid <= 0;
        s07thrid <= 0;
        s08thrid <= 0;
        s09thrid <= 0;
        s10thrid <= 0;

        s00counter <= 0;
        s01counter <= 0;
        s02counter <= 0;
        s03counter <= 0;
        s04counter <= 0;
        s05counter <= 0;
        s06counter <= 0;
        s07counter <= 0;
        s08counter <= 0;
        s09counter <= 0;
        s10counter <= 0;
     end else begin // if (!reset)

        // Flush thrid through the pipeline
        s00thrid <= thrid;
        s01thrid <= s00thrid;
        s02thrid <= s01thrid;
        s03thrid <= s02thrid;
        s04thrid <= s03thrid;
        s05thrid <= s04thrid;
        s06thrid <= s05thrid;
        s07thrid <= s06thrid;
        s08thrid <= s07thrid;
        s09thrid <= s08thrid;
        s10thrid <= s09thrid;

        s00counter <= counter;
        s01counter <= s00counter;
        s02counter <= s01counter;
        s03counter <= s02counter;
        s04counter <= s03counter;
        s05counter <= s04counter;
        s06counter <= s05counter;
        s07counter <= s06counter;
        s08counter <= s07counter;
        s09counter <= s08counter;
        s10counter <= s09counter;
        
        // Stage0
        // Inputs: dvx, dvy, cx, dy, vx, vy
        s00vx1 <= dvx - dvy + cx;
        s00tmp1 <= vx * vy;

        // Stage1
        s01tmp1A <= s00tmp1;
        s01tmp2 <= s00vx1 * s00vx1;
        s01vx <= s00vx1;

        // Stage2
        s02tmp1B <= s01tmp1A;
        s02tmp2A <= s01tmp2;

        s02vx <= s01vx;

        // Stage3
        s03tmp1C <= s02tmp1B;
        s03tmp2B <= s02tmp2A;

        s03vx <= s02vx;

        // Stage4
        s04tmp1D <= s03tmp1C;
        s04tmp2C <= s03tmp2B;

        s04vx <= s03vx;

        // Stage5
        s05tmp2D <= s04tmp2C;
        s05vy1 <= s05vy1_comb; //  (signed s04tmp1D >>> 11) + cy
        s05tmp3 <= s05vy1_comb * s05vy1_comb;

        s05vx <= s04vx;
        // Stage6
        s06tmp3A <= s05tmp3;

        s06vx <= s05vx;
        s06vy <= s05vy1;
        s06tmp2 <= s05tmp2D;

        // Stage7
        s07tmp3B <= s06tmp3A;

        s07vx <= s06vx;
        s07vy <= s06vy;
        s07tmp2 <= s06tmp2;

        // Stage8
        s08tmp3C <= s07tmp3B;

        s08vx <= s07vx;
        s08vy <= s07vy;
        s08tmp2 <= s07tmp2;

        // Stage9
        s09tmp3D <= s08tmp3C;

        s09vx <= s08vx;
        s09vy <= s08vy;
        s09tmp2 <= s08tmp2;

        // Stage10
        s10dvx <= s10dvx_comb;
        s10dvy <= s10dvy_comb;
        s10r <= s10r_comb;
        s10vx <= s09vx;
        s10vy <= s09vy;
     end

   // Main loop, thread management
   reg [3:0] thrid1;
   reg [6:0] iterations;

   wire [(11*7)-1:0] counters_comb;

   assign counters_comb = 
     {
      (s10thrid==11)?s10counter:counters[(11*7)-1:10*7],
      (s10thrid==10)?s10counter:counters[(10*7)-1:9*7],
      (s10thrid==9)?s10counter:counters[( 9*7)-1:8*7],
      (s10thrid==8)?s10counter:counters[( 8*7)-1:7*7],
      (s10thrid==7)?s10counter:counters[( 7*7)-1:6*7],
      (s10thrid==6)?s10counter:counters[( 6*7)-1:5*7],
      (s10thrid==5)?s10counter:counters[( 5*7)-1:4*7],
      (s10thrid==4)?s10counter:counters[( 4*7)-1:3*7],
      (s10thrid==3)?s10counter:counters[( 3*7)-1:2*7],
      (s10thrid==2)?s10counter:counters[(2*7)-1:1*7],
      (s10thrid==1)?s10counter:counters[(1*7)-1:0]};

   reg [4:0]         reissues;
   
   
   always @(posedge clk)
     if (!reset) begin
        state <= S_IDLE;
        i_thrid <= 0;
        i_dvx <= 0;
        i_dvy <= 0;
        i_vx <= 0;
        i_vy <= 0;
        counters <= 0;
        iterations <= 0;
        thrid1 <= 0;
        ack <= 0;
        cx <= 0;
        reissues <= 0;
     end else begin
        counters <= counters_comb;
        case(state)
          S_IDLE: if (rq) begin
             state <= S_ISSUE;
             i_thrid <= 1;
             cx <= cx0;
             i_dvx <= 0;
             i_dvy <= 0;
             i_vx <= 0;
             i_vy <= 0;
             counters <= 0;
             iterations <= 0;
             ack <= 0;
             reissues <= 0;
          end else ack <= 0; // if (rq)
          
          S_ISSUE: begin
             i_thrid <= i_thrid + 1; 
             cx <= cx + cxstep;
             if (i_thrid == 11) begin
                cx <= cx0;
                state <= S_REISSUE;
                i_thrid <= 0;
                i_counter <= 0;
                thrid1 <= 1;
             end
          end
          S_REISSUE: begin
             if (thrid1 == 11) begin
                cx <= cx0;
                thrid1 <= 1;
                reissues <= 0;
                if (iterations == 100 || reissues == 0) begin
                   state <= S_IDLE;
                   ack <= 1;
                end else begin
                   iterations <= iterations + 1;
                end
             end else begin
                cx <= cx + cxstep;
                thrid1 <= thrid1 + 1;
                reissues <= reissues + reissue?1:0;
             end
          end
        endcase
     end
   
endmodule

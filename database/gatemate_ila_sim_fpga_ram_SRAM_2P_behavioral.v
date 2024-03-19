// Company           :   racyics
// Author            :   pilz
// E-Mail            :   <email>
//
// Filename          :   SRAM_2P_behavioral.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   <short description>
//
// Create Date       :   Fri Jul  3 07:04:36 2015
// Last Change       :   $Date: 2016-09-08 14:13:21 +0200 (Thu, 08 Sep 2016) $
// by                :   $Author: glueck $
//------------------------------------------------------------
`timescale 1 ns / 100 ps
module SRAM_2P_behavioral
  #(
    parameter P_DATA_WIDTH =  20,
    parameter P_ADDR_WIDTH =  9,

    parameter                     P_FORCE_ERROR = 0,
    parameter [P_ADDR_WIDTH:0]    P_ERROR_ADDR  = 50,
    parameter [P_DATA_WIDTH-1:0]  P_ERROR_PATTERN = {P_DATA_WIDTH{1'b0}},
    parameter COLLISION_TIME_DIFFERENCE = 1.0 // in ns
    // printtimescale
    )(
      //inputs port a
      input                     A_CLK,
      input                     A_MEN,
      input [P_ADDR_WIDTH-1:0]  A_ADDR,
      input [P_DATA_WIDTH-1:0]  A_DIN,
      input [P_DATA_WIDTH-1:0]  A_BM,
      input                     A_WEN,
      input                     A_REN,

      //output port a
      output [P_DATA_WIDTH-1:0] A_DOUT,

      //inputs port b
      input                     B_CLK,
      input                     B_MEN,
      input [P_ADDR_WIDTH-1:0]  B_ADDR,
      input [P_DATA_WIDTH-1:0]  B_DIN,
      input [P_DATA_WIDTH-1:0]  B_BM,
      input                     B_WEN,
      input                     B_REN,

      //output port b
      output [P_DATA_WIDTH-1:0] B_DOUT,

      input wire                A_DLY,
      input wire                B_DLY
);

    localparam P_ADDR_COUNT = 2**P_ADDR_WIDTH; //2^P_ADDR_WIDTH

    //memory array
    reg [P_DATA_WIDTH-1:0]      mem_arr [0:P_ADDR_COUNT-1];

    real                        time_a = 1'b0;
    real                        time_b = 1'b0;

    reg [P_DATA_WIDTH-1:0]      dr_a_r;// = {P_ADDR_WIDTH{1'b0}};
    reg [P_DATA_WIDTH-1:0]      dr_b_r;// = {P_ADDR_WIDTH{1'b0}};

    reg [P_ADDR_WIDTH-1:0]      last_B_ADDR = {P_ADDR_WIDTH{1'b0}};
    reg                         last_B_REN = 1'b0;
    reg                         last_B_WEN = 1'b0;
    reg                         last_B_MEN = 1'b0;
    reg [P_DATA_WIDTH-1:0]      last_B_BM;
    reg [P_ADDR_WIDTH-1:0]      last_A_ADDR = {P_ADDR_WIDTH{1'b0}};
    reg                         last_A_REN = 1'b0;
    reg                         last_A_WEN = 1'b0;
    reg                         last_A_MEN = 1'b0;
    reg [P_DATA_WIDTH-1:0]      last_A_BM;


    //timing error
    reg                         timing_write_error_a = 1'b0;
    reg                         timing_write_error_b = 1'b0;
    reg                         timing_read_error_a = 1'b0;
    reg                         timing_read_error_b = 1'b0;

    initial begin
        if (P_FORCE_ERROR == 1'b1) begin
//            force mem_arr[P_ERROR_ADDR] = P_ERROR_PATTERN;
//            $display("Forcing address: %h to XX",P_ERROR_ADDR);
        end
    end

    task outputA_error;
        begin : t_outputA_error

            integer l;

            for(l = 0; l < P_DATA_WIDTH; l = l+1) begin
                if(B_BM[l] == 1'b1) begin
                    dr_a_r[l] = 1'bx;
                end
                else begin
                    dr_a_r[l] = mem_arr[last_A_ADDR][l];
                end

            end
        end
    endtask

    task outputB_error;
        begin : t_outputB_error
            integer m;

            for(m = 0; m < P_DATA_WIDTH; m = m+1) begin
                if(A_BM[m] == 1'b1) begin
                    dr_b_r[m] = 1'bx;
                end
                else begin
                    dr_b_r[m] = mem_arr[last_B_ADDR][m];
                end
            end
        end
    endtask

    task outputA;
        begin
            dr_a_r = mem_arr[A_ADDR];
        end
    endtask

    task outputB;
        begin
            dr_b_r = mem_arr[B_ADDR];
        end
    endtask

    task outputA_wt;
        begin
            dr_a_r = (mem_arr[A_ADDR] & ~A_BM) | (A_DIN & A_BM);
        end
    endtask

    task outputB_wt;
        begin
            dr_b_r = (mem_arr[B_ADDR] & ~B_BM) | (B_DIN & B_BM);
        end
    endtask // outputB_wt

    always @(posedge A_CLK) begin
        //$display("time_a %f",$realtime- time_a);
        if ( time_a != 0 &&
             ($realtime- time_a < COLLISION_TIME_DIFFERENCE) ) begin
            $display("adjust access time or memory access clock speed");
            $display("Accesstime Difference %f",COLLISION_TIME_DIFFERENCE);
            $display("time_a %f",time_a);
            $display("Realtime %f",$realtime);
            // $finish;
        end

        //timing analysis for access conflict handling
        time_a       = $realtime;

        begin //wait one delta cycle for BIST MUX to act
            // register last access
            last_A_MEN   = A_MEN;
            last_A_ADDR  = A_ADDR;
            last_A_WEN   = A_WEN;
            last_A_REN   = A_REN;
            last_A_BM    = A_BM;
        end

        begin //wait one delta cycle for BIST MUX to act
            //write access conflict
            if((time_a-time_b <= COLLISION_TIME_DIFFERENCE) &&
               (last_B_MEN == 1'b1 &&  A_MEN == 1'b1 ) &&
               (last_B_WEN == 1'b1 && A_WEN == 1'b1 ) &&
               ((last_B_BM & A_BM)   != 0 ) &&
               (A_ADDR === last_B_ADDR)) begin
                timing_write_error_a  = 1'b1;
            end
            else begin
                timing_write_error_a = 1'b0;
            end

            //read access conflict
            if(( last_B_REN == 1'b1 && last_B_WEN == 1'b0) && // check for last read access
               (A_WEN == 1'b1 && A_MEN == 1'b1) &&  // check current write access
               (A_ADDR === last_B_ADDR)) begin
                if (time_a == time_b) begin
                    timing_read_error_a=1'b0;
                end else if (time_a-time_b <= COLLISION_TIME_DIFFERENCE) begin
                    timing_read_error_a=1'b1;
                end
            end
            else begin
                timing_read_error_a=1'b0;
            end

            //ram acess
            if(A_MEN==1'b1 && A_WEN==1'b1) begin
                mem_arr[A_ADDR] = (mem_arr[A_ADDR] & ~A_BM) | (A_DIN & A_BM);

                if(timing_write_error_a) begin : reset_A_BM

                    integer i;

                    for(i = 0; i < P_DATA_WIDTH; i = i+1) begin
                        if(A_BM[i] == 1'b1 && last_B_BM[i] == 1'b1) begin
                            mem_arr[A_ADDR][i] = 1'bx;
                        end
                    end
                end

                // write through logic
                if (A_REN == 1'b1) begin
                    outputA_wt;
                end
                if(timing_read_error_a) begin
                    outputB_error;
                end
            end // if (A_MEN==1'b1 && A_WEN==1'b1)

            else if(timing_write_error_a) begin
                outputA_error;
            end
            else if (A_REN == 1'b1 && A_MEN == 1'b1) begin
                outputA;
            end
        end

    end // always @ (posedge A_CLK)


    always @(posedge B_CLK) begin
        //$display("time_b %f",$realtime- time_b);
        if ( time_b != 0 &&
             ($realtime - time_b < COLLISION_TIME_DIFFERENCE) ) begin
            $display("adjust access time or memory access clock speed");
            $display("Accesstime Difference %f",COLLISION_TIME_DIFFERENCE);
            $display("time_b %f",time_b);
            $display("Realtime %f",$realtime);
            // $finish;
        end // if(time_b + COLLISION_TIME_DIFFERENCE > $real)
        time_b =$realtime;

        begin //wait one delta cycle for BIST MUX to act
            // register last access
            last_B_MEN   = B_MEN;
            last_B_ADDR  = B_ADDR;
            last_B_WEN   = B_WEN;
            last_B_REN   = B_REN;
            last_B_BM    = B_BM;
        end

        begin //wait one delta cycle for BIST MUX to act
            //write access conflict
            if((time_b-time_a <= COLLISION_TIME_DIFFERENCE) &&
               (last_A_MEN == 1'b1 && B_MEN == 1'b1) &&
               (last_A_WEN == 1'b1 && B_WEN == 1'b1) &&
               ((last_A_BM & B_BM) != 0 ) &&
               (last_A_ADDR === B_ADDR)) begin
                timing_write_error_b  = 1'b1;
            end else begin
                timing_write_error_b = 1'b0;
            end

            //read access conflict
            if((last_A_REN == 1'b1 && last_A_WEN == 1'b0) && // check for last read access
               (B_WEN == 1'b1 && B_MEN == 1'b1) &&           // check current write access
               ((last_A_BM & B_BM) != 0 ) &&
               (last_A_ADDR === B_ADDR)) begin

                if (time_a == time_b) begin
                    timing_read_error_b = 1'b0;
                end else if (time_b-time_a <= COLLISION_TIME_DIFFERENCE) begin
                    timing_read_error_b = 1'b1;
                end
            end
            else begin
                timing_read_error_b = 1'b0;
            end

            //ram acess
            if(B_MEN == 1'b1 && B_WEN == 1'b1) begin
                mem_arr[B_ADDR] = (mem_arr[B_ADDR] & ~B_BM) | (B_DIN & B_BM);

                if(timing_write_error_b) begin : reset_B_BM
                    integer k;

                    for(k = 0; k < P_DATA_WIDTH; k = k+1) begin
                        if(last_A_BM[k] == 1'b1 && B_BM[k] == 1'b1) begin
                            mem_arr[B_ADDR][k] <= 1'bx;
                        end
                    end
                end

                if (B_REN==1'b1) begin
                    outputB_wt;
                end
                if(timing_read_error_b) begin
                    outputA_error;
                end
            end // if (B_MEN == 1'b1 && B_WEN == 1'b1)
            else if(timing_write_error_b) begin
                outputB_error;
            end
            else if (B_REN == 1'b1 && B_MEN == 1'b1) begin
                outputB;
            end
        end

    end // always @ (posedge B_CLK)

    assign A_DOUT = dr_a_r;
    assign B_DOUT = dr_b_r;


endmodule

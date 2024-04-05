/*
Copyright 2020, Ahmet Can Mert <ahmetcanmert@sabanciuniv.edu>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

`include "defines.v"

// start: HIGH for 1 cc (after 1 cc, data starts going in)
// done : HIGH for 1 cc (after 1 cc, data starts going out)

// Input: standard order
// output: scrambled order

// --- Baseline Version
// * address bit-lengts are set according to worst-case
// * supports up-to 2^15-pt NTT/INTT
// * integer multiplier is not optimized
// * modular reduction is not optimized
// * wait state is not optimized

module NTTN   (input                           clk,reset,
               input                           load_w,
               input                           load_data,
               input                           start,
               input                           start_intt,
               input [`DATA_SIZE_ARB-1:0]      din,
               output reg                      done,
               output reg [`DATA_SIZE_ARB-1:0] dout
               );
// ---------------------------------------------------------------- connections

// parameters & control
reg [2:0] state;
// 0: IDLE
// 1: load twiddle factors + q + n_inv
// 2: load data
// 3: performs ntt
// 4: output data
// 5: last stage of intt

reg [`RING_DEPTH+3:0] sys_cntr;

reg [`DATA_SIZE_ARB-1:0]q;
reg [`DATA_SIZE_ARB-1:0]n_inv;

// data tw brams (datain,dataout,waddr,raddr,wen)
reg [`DATA_SIZE_ARB-1:0]        pi [(2*`PE_NUMBER)-1:0];
wire[`DATA_SIZE_ARB-1:0]        po [(2*`PE_NUMBER)-1:0];
reg [`RING_DEPTH-`PE_DEPTH+1:0] pw [(2*`PE_NUMBER)-1:0];
reg [`RING_DEPTH-`PE_DEPTH+1:0] pr [(2*`PE_NUMBER)-1:0];
reg [0:0]                       pe [(2*`PE_NUMBER)-1:0];

reg [`DATA_SIZE_ARB-1:0]        ti [`PE_NUMBER-1:0];
wire[`DATA_SIZE_ARB-1:0]        to [`PE_NUMBER-1:0];
reg [`RING_DEPTH-`PE_DEPTH+3:0] tw [`PE_NUMBER-1:0];
reg [`RING_DEPTH-`PE_DEPTH+3:0] tr [`PE_NUMBER-1:0];
reg [0:0]                       te [`PE_NUMBER-1:0];

// control signals
wire [`RING_DEPTH-`PE_DEPTH+1:0]      raddr;
wire [`RING_DEPTH-`PE_DEPTH+1:0]      waddr0,waddr1;
wire                                  wen0  ,wen1  ;
wire                                  brsel0,brsel1;
wire                                  brselen0,brselen1;
wire [2*`PE_NUMBER*(`PE_DEPTH+1)-1:0] brscramble;
wire [`RING_DEPTH-`PE_DEPTH+2:0]      raddr_tw;

wire [4:0]                       stage_count;
wire                             ntt_finished;

reg                              ntt_intt; // ntt:0 -- intt:1

// pu
reg [`DATA_SIZE_ARB-1:0] NTTin [(2*`PE_NUMBER)-1:0];
reg [`DATA_SIZE_ARB-1:0] MULin [`PE_NUMBER-1:0];
wire[`DATA_SIZE_ARB-1:0] ASout [(2*`PE_NUMBER)-1:0]; // ADD-SUB out  (no extra delay after odd)
wire[`DATA_SIZE_ARB-1:0] EOout [(2*`PE_NUMBER)-1:0]; // EVEN-ODD out

// ---------------------------------------------------------------- BRAMs
// 2*PE BRAMs for input-output polynomial
// PE BRAMs for storing twiddle factors

generate
	genvar k;

    for(k=0; k<`PE_NUMBER ;k=k+1) begin: BRAM_GEN_BLOCK
        BRAM #(.DLEN(`DATA_SIZE_ARB),.HLEN(`RING_DEPTH-`PE_DEPTH+2)) bd00(clk,pe[2*k+0],pw[2*k+0],pi[2*k+0],pr[2*k+0],po[2*k+0]);
        BRAM #(.DLEN(`DATA_SIZE_ARB),.HLEN(`RING_DEPTH-`PE_DEPTH+2)) bd01(clk,pe[2*k+1],pw[2*k+1],pi[2*k+1],pr[2*k+1],po[2*k+1]);
        BRAM #(.DLEN(`DATA_SIZE_ARB),.HLEN(`RING_DEPTH-`PE_DEPTH+4)) bt00(clk,te[k],tw[k],ti[k],tr[k],to[k]);
    end
endgenerate

// ---------------------------------------------------------------- NTT2 units

generate
	genvar m;

    for(m=0; m<`PE_NUMBER ;m=m+1) begin: NTT2_GEN_BLOCK
        NTT2 nttu(clk,reset,
                  q,
			      NTTin[2*m+0],NTTin[2*m+1],
				  MULin[m],
				  ASout[2*m+0],ASout[2*m+1],
				  EOout[2*m+0],EOout[2*m+1]);
    end
endgenerate

// ---------------------------------------------------------------- control unit

AddressGenerator ag(clk,reset,
                    (start | start_intt),
                    raddr,
                    waddr0,waddr1,
                    wen0  ,wen1  ,
                    brsel0,brsel1,
                    brselen0,brselen1,
                    brscramble,
                    raddr_tw,
                    stage_count,
                    ntt_finished
                    );

// ---------------------------------------------------------------- ntt/intt

always @(posedge clk or posedge reset) begin
    if(reset) begin
        ntt_intt <= 0;
    end
    else begin
        if(start)
            ntt_intt <= 0;
        else if(start_intt)
            ntt_intt <= 1;
        else
            ntt_intt <= ntt_intt;
    end
end

// ---------------------------------------------------------------- state machine & sys_cntr

always @(posedge clk or posedge reset) begin
    if(reset) begin
        state <= 3'd0;
        sys_cntr <= 0;
    end
    else begin
        case(state)
        3'd0: begin
            if(load_w)
                state <= 3'd1;
            else if(load_data)
                state <= 3'd2;
            else if(start | start_intt)
                state <= 3'd3;
            else
                state <= 3'd0;
            sys_cntr <= 0;
        end
        3'd1: begin
            if(sys_cntr == ((((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH)<<1)+2-1)) begin
                state <= 3'd0;
                sys_cntr <= 0;
            end
            else begin
                state <= 3'd1;
                sys_cntr <= sys_cntr + 1;
            end
        end
        3'd2: begin
            if(sys_cntr == (`RING_SIZE-1)) begin
                state <= 3'd0;
                sys_cntr <= 0;
            end
            else begin
                state <= 3'd2;
                sys_cntr <= sys_cntr + 1;
            end
        end
        3'd3: begin
            if(ntt_finished && (ntt_intt == 0))
                state <= 3'd4;
            else if(ntt_finished && (ntt_intt == 1))
                state <= 3'd5;
            else
                state <= 3'd3;
            sys_cntr <= 0;
        end
        3'd4: begin
            if(sys_cntr == (`RING_SIZE+1)) begin
                state <= 3'd0;
                sys_cntr <= 0;
            end
            else begin
                state <= 3'd4;
                sys_cntr <= sys_cntr + 1;
            end
        end
        3'd5: begin
            if(sys_cntr == (((`RING_SIZE >> (`PE_DEPTH+1))<<1) + `INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY)) begin
                state <= 3'd4;
                sys_cntr <= 0;
            end
            else begin
                state <= 3'd5;
                sys_cntr <= sys_cntr + 1;
            end
        end
        default: begin
            state <= 3'd0;
            sys_cntr <= 0;
        end
        endcase
    end
end

// ---------------------------------------------------------------- load twiddle factor + q + n_inv & other operations

always @(posedge clk or posedge reset) begin: TW_BLOCK
    integer n;
    for(n=0; n < (`PE_NUMBER); n=n+1) begin: LOOP_1
        if(reset) begin
            te[n] <= 0;
            tw[n] <= 0;
            ti[n] <= 0;
            tr[n] <= 0;
        end
        else begin
            if((state == 3'd1) && (sys_cntr < ((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH))) begin
                te[n] <= (n == (sys_cntr & ((1 << `PE_DEPTH)-1)));
                tw[n][`RING_DEPTH-`PE_DEPTH+3]   <= 0;
                tw[n][`RING_DEPTH-`PE_DEPTH+2:0] <= (sys_cntr >> `PE_DEPTH);
                ti[n] <= din;
                tr[n] <= 0;
            end
            else if((state == 3'd1) && (sys_cntr < (((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH)<<1))) begin
                te[n] <= (n == ((sys_cntr-((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH)) & ((1 << `PE_DEPTH)-1)));
                tw[n][`RING_DEPTH-`PE_DEPTH+3]   <= 1;
                tw[n][`RING_DEPTH-`PE_DEPTH+2:0] <= ((sys_cntr-((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH)) >> `PE_DEPTH);
                ti[n] <= din;
                tr[n] <= 0;
            end
            else if(state == 3'd3) begin // NTT operations
                te[n] <= 0;
                tw[n] <= 0;
                ti[n] <= 0;
                tr[n] <= {ntt_intt,raddr_tw};
            end
            else begin
                te[n] <= 0;
                tw[n] <= 0;
                ti[n] <= 0;
                tr[n] <= 0;
            end
        end
    end
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        q     <= 0;
        n_inv <= 0;
    end
    else begin
        q     <= ((state == 3'd1) && (sys_cntr == ((((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH)<<1)+2-2))) ? din : q;
        n_inv <= ((state == 3'd1) && (sys_cntr == ((((((1<<(`RING_DEPTH-`PE_DEPTH))-1)+`PE_DEPTH)<<`PE_DEPTH)<<1)+2-1))) ? din : n_inv;
    end
end

// ---------------------------------------------------------------- load data & other data operations

wire [`RING_DEPTH-`PE_DEPTH-1:0] addrout;
assign addrout = (sys_cntr >> (`PE_DEPTH+1));

wire [`RING_DEPTH-`PE_DEPTH-1:0] inttlast;
assign inttlast = (sys_cntr & ((`RING_SIZE >> (`PE_DEPTH+1))-1));

wire [`RING_DEPTH+3:0]           sys_cntr_d;
wire [`RING_DEPTH-`PE_DEPTH-1:0] inttlast_d;

always @(posedge clk or posedge reset) begin: DT_BLOCK
    integer n;
    for(n=0; n < (2*`PE_NUMBER); n=n+1) begin: LOOP_1
        if(reset) begin
            pe[n] <= 0;
            pw[n] <= 0;
            pi[n] <= 0;
            pr[n] <= 0;
        end
        else begin
            if((state == 3'd2)) begin // input data
                if(sys_cntr < (`RING_SIZE >> 1)) begin
                    pe[n] <= (n == ((sys_cntr & ((1 << `PE_DEPTH)-1)) << 1));
                    pw[n] <= (sys_cntr >> `PE_DEPTH);
                    pi[n] <= din;
                    pr[n] <= 0;
                end
                else begin
                    pe[n] <= (n == (((sys_cntr & ((1 << `PE_DEPTH)-1)) << 1)+1));
                    pw[n] <= ((sys_cntr-(`RING_SIZE >> 1)) >> `PE_DEPTH);
                    pi[n] <= din;
                    pr[n] <= 0;
                end
            end
            else if(state == 3'd3) begin // NTT operations
                if(stage_count < (`RING_DEPTH - `PE_DEPTH - 1)) begin
                    if(brselen0) begin
                        if(brsel0 == 0) begin
                            if(n[0] == 0) begin
                                pe[n] <= wen0;
                                pw[n] <= waddr0;
                                pi[n] <= EOout[n];
                            end
                        end
                        else begin // brsel0 == 1
                            if(n[0] == 0) begin
                                pe[n] <= wen1;
                                pw[n] <= waddr1;
                                pi[n] <= EOout[n+1];
                            end
                        end
                    end
                    else begin
                        if(n[0] == 0) begin
                            pe[n] <= 0;
                            pw[n] <= pw[n];
                            pi[n] <= pi[n];
                        end
                    end

                    if(brselen1) begin
                        if(brsel1 == 0) begin
                            if(n[0] == 1) begin
                                pe[n] <= wen0;
                                pw[n] <= waddr0;
                                pi[n] <= EOout[n-1];
                            end
                        end
                        else begin // brsel1 == 1
                            if(n[0] == 1) begin
                                pe[n] <= wen1;
                                pw[n] <= waddr1;
                                pi[n] <= EOout[n];
                            end
                        end
                    end
                    else begin
                        if(n[0] == 1) begin
                            pe[n] <= 0;
                            pw[n] <= pw[n];
                            pi[n] <= pi[n];
                        end
                    end
                end
                else if(stage_count < (`RING_DEPTH - 1)) begin
                    pe[n] <= wen0;
                    pw[n] <= waddr0;
                    pi[n] <= ASout[brscramble[(`PE_DEPTH+1)*n+:(`PE_DEPTH+1)]];
                end
                else begin
                    pe[n] <= wen0;
                    pw[n] <= waddr0;
                    pi[n] <= ASout[n];
                end
                pr[n] <= raddr;
            end
            else if(state == 3'd4) begin // output data
                pe[n] <= 0;
                pw[n] <= 0;
                pi[n] <= 0;
                pr[n] <= {2'b10,addrout};
            end
            else if(state == 3'd5) begin // last stage of intt
                if(sys_cntr_d < (`RING_SIZE >> (`PE_DEPTH+1))) begin
                    if(n[0] == 0) begin
                        pe[n] <= 1;
                        pw[n] <= {2'b10,inttlast_d};
                        pi[n] <= ASout[n+1];
                    end
                    else begin
                        pe[n] <= 0;
                        pw[n] <= 0;
                        pi[n] <= 0;
                    end
                end
                else if(sys_cntr_d < (`RING_SIZE >> (`PE_DEPTH))) begin
                    if(n[0] == 1) begin
                        pe[n] <= 1;
                        pw[n] <= {2'b10,inttlast_d};
                        pi[n] <= ASout[n];
                    end
                    else begin
                        pe[n] <= 0;
                        pw[n] <= 0;
                        pi[n] <= 0;
                    end
                end
                else begin
                    pe[n] <= 0;
                    pw[n] <= 0;
                    pi[n] <= 0;
                end
                pr[n] <= {2'b10,inttlast};
            end
            else begin
                pe[n] <= 0;
                pw[n] <= 0;
                pi[n] <= 0;
                pr[n] <= 0;
            end
        end
    end
end

// done signal & output data
wire [`PE_DEPTH:0] coefout;
assign coefout = (sys_cntr-2);

always @(posedge clk or posedge reset) begin
    if(reset) begin
        done <= 0;
        dout <= 0;
    end
    else begin
        if(state == 3'd4) begin
            done <= (sys_cntr == 1) ? 1 : 0;
            dout <= po[coefout];
        end
        else begin
            done <= 0;
            dout <= 0;
        end
    end
end

// ---------------------------------------------------------------- PU control

always @(posedge clk or posedge reset) begin: NT_BLOCK
    integer n;
    for(n=0; n < (`PE_NUMBER); n=n+1) begin: LOOP_1
        if(reset) begin
            NTTin[2*n+0] <= 0;
            NTTin[2*n+1] <= 0;
            MULin[n] <= 0;
        end
        else begin
            if(state == 3'd5) begin
                if(sys_cntr < (2+(`RING_SIZE >> (`PE_DEPTH+1)))) begin
                    NTTin[2*n+0] <= po[2*n+0];
                    NTTin[2*n+1] <= 0;
                end
                else if(sys_cntr < (2+(`RING_SIZE >> (`PE_DEPTH)))) begin
                    NTTin[2*n+0] <= po[2*n+1];
                    NTTin[2*n+1] <= 0;
                end
                else begin
                    NTTin[2*n+0] <= po[2*n+0];
                    NTTin[2*n+1] <= po[2*n+1];
                end
                MULin[n] <= n_inv;
            end
            else begin
                NTTin[2*n+0] <= po[2*n+0];
                NTTin[2*n+1] <= po[2*n+1];
                MULin[n] <= to[n];
            end
        end
    end
end

// --------------------------------------------------------------------------- delays

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY-1),.DATA(`RING_DEPTH+4        )) sr00(clk,reset,sys_cntr,sys_cntr_d);
ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY-1),.DATA(`RING_DEPTH-`PE_DEPTH)) sr01(clk,reset,inttlast,inttlast_d);

// ---------------------------------------------------------------------------

endmodule

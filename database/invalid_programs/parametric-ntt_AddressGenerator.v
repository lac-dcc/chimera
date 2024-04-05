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

module AddressGenerator (input                                       clk,reset,
                         input                                       start,
                         output reg [`RING_DEPTH-`PE_DEPTH+1:0]      raddr0,
                         output reg [`RING_DEPTH-`PE_DEPTH+1:0]      waddr0,waddr1,
                         output reg                                  wen0  ,wen1  ,
                         output reg                                  brsel0,brsel1,
                         output reg                                  brselen0,brselen1,
                         output reg [2*`PE_NUMBER*(`PE_DEPTH+1)-1:0] brscramble0,
                         output reg [`RING_DEPTH-`PE_DEPTH+2:0]      raddr_tw,
                         output reg [4:0]                            stage_count,
                         output reg                                  ntt_finished);
// ---------------------------------------------------------------------------
// Control signals
reg [4:0] c_stage_limit;
reg [`RING_DEPTH-`PE_DEPTH:0]   c_loop_limit;
reg [`RING_DEPTH-`PE_DEPTH+2:0] c_tw_limit;

reg [4:0] c_stage;
reg [`RING_DEPTH-`PE_DEPTH:0]   c_loop;
reg [`RING_DEPTH-`PE_DEPTH+2:0] c_tw;

reg [8:0] c_wait_limit;
reg [8:0] c_wait;

reg [`RING_DEPTH-`PE_DEPTH-1:0]     raddr;
reg [1:0]                           raddr_m;

reg [`RING_DEPTH-`PE_DEPTH-1:0]      waddre,waddro;
reg [1:0]                            waddr_m;

reg                                  wen;
reg                                  brsel;
reg                                  brselen;
reg                                  finished;
reg [2*`PE_NUMBER*(`PE_DEPTH+1)-1:0] brscramble;

// ---------------------------------------------------------------------------
// FSM
reg [1:0] state;
// 0 --> IDLE
// 1 --> NTT
// 2 --> NTT (WAIT between stages)

always @(posedge clk or posedge reset) begin
    if(reset)
        state <= 0;
    else begin
        case(state)
        2'd0: begin
            state <= (start) ? 1 : 0;
        end
        2'd1: begin
            state <= (c_loop == c_loop_limit) ? 2 : 1;
        end
        2'd2: begin
            if((c_stage == c_stage_limit) && (c_wait == c_wait_limit)) // operation is finished
                state <= 0;
            else if(c_wait == c_wait_limit)                            // to next NTT stage
                state <= 1;
            else                                                       // wait
                state <= 2;
        end
        default: state <= 0;
        endcase
    end
end

// --------------------------------------------------------------------------- WAIT OPERATION

always @(posedge clk or posedge reset) begin
    if(reset) begin
        c_wait_limit <= 0;
        c_wait       <= 0;
    end
    else begin
        c_wait_limit <= (start) ? 8'd15 : c_wait_limit;

        if(state == 2'd2)
            c_wait <= (c_wait < c_wait_limit) ? (c_wait + 1) : 0;
        else
            c_wait <= 0;
    end
end

// --------------------------------------------------------------------------- c_stage & c_loop

always @(posedge clk or posedge reset) begin
    if(reset) begin
        c_stage_limit <= 0;
        c_loop_limit  <= 0;
    end
    else begin
        if(start) begin
            c_stage_limit <= (`RING_DEPTH-1);
            c_loop_limit  <= ((`RING_SIZE >> (`PE_DEPTH+1))-1);
        end
        else begin
            c_stage_limit <= c_stage_limit;
            c_loop_limit  <= c_loop_limit;
        end
    end
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        c_stage       <= 0;
        c_loop        <= 0;
    end
    else begin
        if(start) begin
            c_stage <= 0;
            c_loop  <= 0;
        end
        else begin
            // ---------------------------- c_stage
            if((state == 2'd2) && (c_wait == c_wait_limit) && (c_stage == c_stage_limit))
                c_stage <= 0;
            else if((state == 2'd2) && (c_wait == c_wait_limit))
                c_stage <= c_stage + 1;
            else
                c_stage <= c_stage;

            // ---------------------------- c_loop
            if((state == 2'd2) && (c_wait == c_wait_limit))
                c_loop <= 0;
            else if((state == 2'd1) && (c_loop < c_loop_limit))
                c_loop <= c_loop + 1;
            else
                c_loop <= c_loop;
        end
    end
end

// --------------------------------------------------------------------------- twiddle factors
wire [`RING_DEPTH-`PE_DEPTH+2:0] c_tw_temp;
assign c_tw_temp = (c_loop_limit>>c_stage);

always @(posedge clk or posedge reset) begin
    if(reset) begin
        c_tw <= 0;
    end
    else begin
        if(start) begin
            c_tw <= 0;
        end
        else begin
            if((state == 2'd1) && (c_loop != c_loop_limit)) begin
                if(c_stage == 0) begin
                    if(c_loop[0] == 0)
                        c_tw <= (((c_tw + ((1 << (`RING_DEPTH-`PE_DEPTH-2))>>c_stage))) & c_loop_limit);
                    else
                        c_tw <= (((c_tw + 1 - ((1 << (`RING_DEPTH-`PE_DEPTH-2))>>c_stage))) & c_loop_limit);
                end
                else if(c_stage >= (`RING_DEPTH-`PE_DEPTH-1)) begin
                    c_tw <= c_tw;
                end
                else begin
                    if(c_loop[0] == 0) begin
                        c_tw <= c_tw + ((1 << (`RING_DEPTH-`PE_DEPTH-2))>>c_stage)
                              - (((c_loop & c_tw_temp) == c_tw_temp) ? (((c_loop & c_tw_temp)>>1)+1) : 0);
                    end
                    else begin
                        c_tw <= (c_tw + 1) - ((1 << (`RING_DEPTH-`PE_DEPTH-2))>>c_stage)
                              - (((c_loop & c_tw_temp) == c_tw_temp) ? (((c_loop & c_tw_temp)>>1)+1) : 0);
                    end
                end
            end
            else if((state == 2'd2) && (c_wait == c_wait_limit) && (c_stage == c_stage_limit))
                c_tw <= 0;
            else if((state == 2'd2) && (c_wait == c_wait_limit)) begin
                c_tw <= c_tw+1;
            end
            else begin
                c_tw <= c_tw;
            end
        end
    end
end

// --------------------------------------------------------------------------- raddr (1 cc delayed)

wire [`RING_DEPTH-`PE_DEPTH-1:0] raddr_temp;
assign raddr_temp = ((`RING_DEPTH-`PE_DEPTH-1) - (c_stage+1));

always @ (posedge clk or posedge reset) begin
    if(reset) begin
        raddr   <= 0;
        raddr_m <= 0;
    end
    else begin
        if(start) begin
            raddr   <= 0;
            raddr_m <= 0;
        end
        else begin
            // ---------------------------- raddr
            if((state == 2'd2) && (c_wait == c_wait_limit))
                raddr <= 0;
            else if((state == 2'd1) && (c_loop <= c_loop_limit)) begin
                if(c_stage < (`RING_DEPTH-`PE_DEPTH-1)) begin
                    if(~c_loop[0])
                        raddr <= (c_loop >> 1) + ((c_loop >> (raddr_temp+1)) << raddr_temp);
                    else
                        raddr <= (1 << raddr_temp) + (c_loop >> 1) + ((c_loop >> (raddr_temp+1)) << raddr_temp);
                end
                else
                    raddr <= c_loop;
            end
            else
                raddr <= raddr;

            // ---------------------------- raddr_m
            if((state == 2'd2) && (c_wait == c_wait_limit))
                raddr_m <= {raddr_m[1],~raddr_m[0]};
            else
                raddr_m <= raddr_m;
        end
    end
end

// --------------------------------------------------------------------------- waddr (1 cc delayed)

wire [`RING_DEPTH-`PE_DEPTH-1:0] waddr_temp;
assign waddr_temp = ((`RING_DEPTH-`PE_DEPTH-1) - (c_stage+1));

always @ (posedge clk or posedge reset) begin
    if(reset) begin
        waddre  <= 0;
        waddro  <= 0;
        waddr_m <= 0;
    end
    else begin
        if(start) begin
            waddre  <= 0;
            waddro  <= (1 << (`RING_DEPTH-`PE_DEPTH-1));
            waddr_m <= 1;
        end
        else begin
            // ---------------------------- raddr
            if((state == 2'd2) && (c_wait == c_wait_limit)) begin
                waddre <= 0;
                waddro <= 0;
            end
            else if((state == 2'd1) && (c_loop <= c_loop_limit)) begin
                if(c_stage < (`RING_DEPTH-`PE_DEPTH-1)) begin
                    waddre <= (c_loop >> 1) + ((c_loop >> (waddr_temp+1)) << waddr_temp);
                    waddro <= (c_loop >> 1) + ((c_loop >> (waddr_temp+1)) << waddr_temp) + (1 << waddr_temp);
                end
                else begin
                    waddre <= c_loop;
                    waddro <= c_loop;
                end
            end
            else begin
                waddre <= waddre;
                waddro <= waddro;
            end

            // ---------------------------- raddr_m
            if((state == 2'd2) && (c_wait == c_wait_limit) && (c_stage == (c_stage_limit-1)))
                waddr_m <= 2'b10;
            else if((state == 2'd2) && (c_wait == c_wait_limit))
                waddr_m <= {waddr_m[1],~waddr_m[0]};
            else
                waddr_m <= waddr_m;
        end
    end
end

// --------------------------------------------------------------------------- wen,brsel,brselen (1 cc delayed)

always @(posedge clk or posedge reset) begin
    if(reset) begin
        wen     <= 0;
        brsel   <= 0;
        brselen <= 0;
    end
    else begin
        if(state == 2'd1) begin
            wen     <= 1;
            brsel   <= c_loop[0];
            brselen <= 1;
        end
        else begin
            wen     <= 0;
            brsel   <= 0;
            brselen <= 0;
        end
    end
end

// --------------------------------------------------------------------------- brscrambled

wire [`PE_DEPTH:0] brscrambled_temp;
wire [`PE_DEPTH:0] brscrambled_temp2;
wire [`PE_DEPTH:0] brscrambled_temp3;
assign brscrambled_temp  = (`PE_NUMBER >> (c_stage-(`RING_DEPTH-`PE_DEPTH-1)));
assign brscrambled_temp2 = (`PE_DEPTH - (c_stage-(`RING_DEPTH-`PE_DEPTH-1)));
assign brscrambled_temp3 = ((`PE_DEPTH+1) - (c_stage-(`RING_DEPTH-`PE_DEPTH-1)));

always @(posedge clk or posedge reset) begin: B_BLOCK
    integer n;
    for(n=0; n < (2*`PE_NUMBER); n=n+1) begin: LOOP_1
        if(reset) begin
            brscramble[(`PE_DEPTH+1)*n+:(`PE_DEPTH+1)] <= 0;
        end
        else begin
            if(c_stage >= (`RING_DEPTH-`PE_DEPTH-1)) begin
                brscramble[(`PE_DEPTH+1)*n+:(`PE_DEPTH+1)] <= (brscrambled_temp*n[0]) +
                                                              (((n>>1)<<1) & (brscrambled_temp-1)) +
                                                              ((n>>(brscrambled_temp2+1))<<(brscrambled_temp3)) +
                                                              ((n>>brscrambled_temp2) & 1);
            end
            else begin
                brscramble[(`PE_DEPTH+1)*n+:(`PE_DEPTH+1)] <= 0;
            end
        end
    end
end

// --------------------------------------------------------------------------- ntt_finished

always @(posedge clk or posedge reset) begin
    if(reset) begin
        finished <= 0;
    end
    else begin
        if((state == 2'd2) && (c_wait == c_wait_limit) && (c_stage == c_stage_limit))
            finished <= 1;
        else
            finished <= 0;
    end
end

// --------------------------------------------------------------------------- delays

// -------------------- read signals
wire [`RING_DEPTH-`PE_DEPTH+2:0] c_tw_w;

ShiftReg #(.SHIFT(1),.DATA(`RING_DEPTH-`PE_DEPTH+3)) sr00(clk,reset,c_tw,c_tw_w);

always @(posedge clk or posedge reset) begin
    if(reset) begin
        raddr0   <= 0;
        raddr_tw <= 0;
    end
    else begin
        raddr0   <= {raddr_m,raddr};
        raddr_tw <= c_tw_w;
    end
end

// -------------------- write signals (waddr0/1, wen0/1, brsel0/1, brselen0/1)
// waddr0/1
wire [`RING_DEPTH-`PE_DEPTH+1:0] waddre_w,waddro_w;

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY  ),.DATA(`RING_DEPTH-`PE_DEPTH+2)) sr01(clk,reset,{waddr_m,waddre},waddre_w);
ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY+1),.DATA(`RING_DEPTH-`PE_DEPTH+2)) sr02(clk,reset,{waddr_m,waddro},waddro_w);

always @(*) begin
    waddr0 = waddre_w;
    waddr1 = waddro_w;
end

// wen0/1
wire [0:0] wen0_w,wen1_w;

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY  ),.DATA(1)) sr03(clk,reset,wen,wen0_w);
ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY+1),.DATA(1)) sr04(clk,reset,wen,wen1_w);

always @(*) begin
    wen0 = wen0_w;
    wen1 = wen1_w;
end

// brsel
wire [0:0] brsel0_w,brsel1_w;

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY  ),.DATA(1)) sr05(clk,reset,brsel,brsel0_w);
ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY+1),.DATA(1)) sr06(clk,reset,brsel,brsel1_w);

always @(*) begin
    brsel0 = brsel0_w;
    brsel1 = brsel1_w;
end

// brselen
wire [0:0] brselen0_w,brselen1_w;

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY  ),.DATA(1)) sr07(clk,reset,brselen,brselen0_w);
ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY+1),.DATA(1)) sr08(clk,reset,brselen,brselen1_w);

always @(*) begin
    brselen0 = brselen0_w;
    brselen1 = brselen1_w;
end

// stage count
wire [4:0] c_stage_w;

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY+1),.DATA(5)) sr09(clk,reset,c_stage,c_stage_w);

always @(*) begin
    stage_count = c_stage_w;
end

// brascambled
wire [2*`PE_NUMBER*(`PE_DEPTH+1)-1:0] brscramble_w;

ShiftReg #(.SHIFT(`INTMUL_DELAY+`MODRED_DELAY+`STAGE_DELAY),.DATA(2*`PE_NUMBER*(`PE_DEPTH+1))) sr10(clk,reset,brscramble,brscramble_w);

always @(*) begin
    brscramble0 = brscramble_w;
end

// ntt finished
wire finished_w;

ShiftReg #(.SHIFT(4),.DATA(1)) sr11(clk,reset,finished,finished_w);

always @(*) begin
    ntt_finished = finished_w;
end

endmodule

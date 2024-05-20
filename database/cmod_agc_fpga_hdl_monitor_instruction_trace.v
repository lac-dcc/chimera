// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module instruction_trace(
    input wire clk,
    input wire rst_n,

    input wire read_en,
    input wire [15:0] addr,
    output reg [15:0] data_out,

    input wire mnisq,
    input wire minkl,
    input wire minhl,
    input wire miip,
    input wire mreqin,
    input wire [12:1] mt,
    input wire [3:1] mst,

    input wire msqext,
    input wire [16:1] g,
    input wire [16:1] b,
    input wire [16:1] z,
    input wire [12:1] s,
    input wire [16:1] y,
    input wire [16:1] u,
    input wire [7:5] fext,
    input wire [15:11] fb,
    input wire [3:1] eb,

    input wire [16:1] w
);

wire count;
assign count = minkl & ~mreqin;

reg [6:1] count_addr;
reg count_up;
reg count_down;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        count_addr <= 6'b0;
        count_up <= 1'b0;
        count_down <= 1'b0;
    end else begin
        if (count) begin
            if (mt[2]) begin
                count_addr <= s[6:1];
                count_up <= 1'b0;
                count_down <= 1'b0;
            end

            if (mt[8]) begin
                if (y[16] & ~u[16]) begin
                    count_down <= 1'b1;
                end else if (~y[16] & u[16]) begin
                    count_up <= 1'b1;
                end else if (~u[16]) begin
                    if (u[15:1] > y[15:1]) begin
                        count_up <= 1'b1;
                    end else if (u[15:1] < y[15:1]) begin
                        count_down <= 1'b1;
                    end
                end else begin
                    if (u[15:1] < y[15:1]) begin
                        count_up <= 1'b1;
                    end else if (u[15:1] > y[15:1]) begin
                        count_down <= 1'b1;
                    end
                end
            end
        end else begin
            count_addr <= 6'b0;
            count_up <= 1'b0;
            count_down <= 1'b0;
        end
    end
end

reg nisql;
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        nisql <= 1'b0;
    end else begin
        if (mnisq) begin
            nisql <= 1'b1;
        end else if (mt[12]) begin
            nisql <= 1'b0;
        end
    end
end

reg [16:1] pending_z;
reg [16:1] pending_b;
reg pending_inst;

reg [16:1] trace_z;
reg [16:1] trace_b;
reg trace_write;

reg mt11_q;
reg miip_q;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        pending_inst <= 1'b0;
        pending_z <= 16'b0;
        pending_b <= 16'b0;
        trace_z <= 16'b0;
        trace_b <= 16'b0;
        mt11_q <= 1'b0;
        miip_q <= 1'b0;
        trace_write <= 1'b0;
    end else begin
        mt11_q <= mt[11];
        trace_write <= 1'b0;

        if (~mt11_q & mt[11]) begin
            if (nisql) begin
                trace_write <= 1'b1;
                trace_z <= pending_z;
                trace_b <= {msqext, pending_b[16], pending_b[14:1]};

                pending_b <= b;
                pending_z <= z - 1;

                pending_inst <= 1'b1;
            end

            miip_q <= miip;
            if (~miip_q & miip) begin
                pending_b <= 16'o7000;
            end

            if (pending_inst) begin
                if (count) begin
                    trace_write <= 1'b1;
                    trace_z <= pending_z;
                    trace_b <= {count_up, count_down, 8'b0, count_addr};
                end else if (mst == 3'd2) begin
                    trace_write <= 1'b1;
                    trace_z <= pending_z;
                    if (msqext) begin
                        trace_b <= 16'o6;
                    end else if (minhl) begin
                        trace_b <= 16'o4;
                    end else begin
                        trace_b <= 16'o3;
                    end
                end else if (~nisql) begin
                    pending_inst <= 1'b0;
                end
            end
        end
    end
end

wire [16:1] trace_m;
assign trace_m = {fext, fb, eb, count, 4'b0};

reg [14:1] trace_idx;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        trace_idx <= 14'b0;
    end else begin
        if (trace_write) begin
            trace_idx <= trace_idx + 1;
        end
    end
end

wire [13:0] read_addr;
assign read_addr = (trace_idx - addr[13:0]) - 1;
wire [63:0] trace_data;

trace_memory mem(
    .clka(clk),
    .ena(trace_write),
    .wea(trace_write),
    .addra(trace_idx),
    .dina({trace_m, trace_z, trace_b, w}),

    .clkb(clk),
    .enb(read_en),
    .addrb(read_addr),
    .doutb(trace_data)
);

reg read_done;
always @(*) begin
    if (read_done) begin
        case (addr[15:14])
        2'b00: data_out = trace_data[63:48];
        2'b01: data_out = trace_data[47:32];
        2'b10: data_out = trace_data[31:16];
        2'b11: data_out = trace_data[15:0];
        endcase
    end else begin
        data_out = 16'b0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        read_done <= 1'b0;
    end else begin
        read_done <= read_en;
    end
end

endmodule
`default_nettype wire
